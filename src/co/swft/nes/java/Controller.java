package co.swft.nes.java;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.imageio.ImageIO;

import com.stackoverflow.jewelsea.*;

import co.swft.nes.enums.EmulationMode;
import co.swft.nes.enums.InstructionSet;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.property.*;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.*;
import javafx.scene.image.PixelWriter;
import javafx.scene.image.WritableImage;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.BorderPane;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javafx.util.Callback;

/*
 * NES EMulator
 * 
 * CPU: MOS Technology 6502 8bit with 16bit address bus little-endian
 * 
 * Memory: 2KiB work RAM 2KiB video RAM 256B Object Attribute Memory
 * (Hold sprites) 28B palette RAM
 * 
 * 32KiB program ROM (Expanded by bank switching) may up to 16KiB
 * expansion area may expanded video memory
 * 
 * Video: Two layers, background > sprite sprites have 2 bits for color.
 * 3 colors + transparency ntsc values not rgb values up to 64 sprites
 * at a time. either 8x8 or 8x16 8 sprites per scan line
 * 
 * Audio: eh can come later
 * 
 * Memory mappers: complex
 * 
 * @author Matthew Consterdine
 */
public class Controller extends Application {
	private static Stage stage;
	@FXML private Node root;
	private Logger logger = new AlertLogger(co.swft.nes.java.Launcher.logger.log, "App");
	
	private NESCartridge game;

	private RicohAPU apu;
	private RicohPPU ppu;
	private RicohCPU cpu;

	@FXML private MenuBar menuBar;
	
	@FXML private BorderPane emulationContainer;
	@FXML private Canvas emulationCanvas;

	@FXML private TableView<Field> infoTable;
	@FXML private TableColumn<Field, String> infoProperty;
	@FXML private TableColumn<Field, String> infoDescription;

	@FXML private ListView<String> debuggerList;
	@FXML private ToggleButton debuggerEnable;
	@FXML private Label debuggerStatus;
	@FXML private Button debuggerControlRun;
	@FXML private Button debuggerControlInto;
	@FXML private Button debuggerControlOut;
	@FXML private Button debuggerControlOver;
	@FXML private TextField debuggerCPURegisterPC;
	@FXML private TextField debuggerCPURegisterA;
	@FXML private TextField debuggerCPURegisterX;
	@FXML private TextField debuggerCPURegisterY;
	@FXML private CheckBox debuggerCPUStatusN;
	@FXML private CheckBox debuggerCPUStatusV;
	@FXML private CheckBox debuggerCPUStatusU;
	@FXML private CheckBox debuggerCPUStatusB;
	@FXML private CheckBox debuggerCPUStatusD;
	@FXML private CheckBox debuggerCPUStatusI;
	@FXML private CheckBox debuggerCPUStatusZ;
	@FXML private CheckBox debuggerCPUStatusC;
	@FXML private TextField debuggerCPUStack;
	@FXML private CheckBox debuggerPPUControlV;
	@FXML private CheckBox debuggerPPUControlP;
	@FXML private CheckBox debuggerPPUControlH;
	@FXML private CheckBox debuggerPPUControlB;
	@FXML private CheckBox debuggerPPUControlS;
	@FXML private CheckBox debuggerPPUControlI;
	@FXML private TextField debuggerPPUControlN;
	@FXML private CheckBox debuggerPPUMaskB;
	@FXML private CheckBox debuggerPPUMaskG;
	@FXML private CheckBox debuggerPPUMaskR;
	@FXML private CheckBox debuggerPPUMasks;
	@FXML private CheckBox debuggerPPUMaskb;
	@FXML private CheckBox debuggerPPUMaskM;
	@FXML private CheckBox debuggerPPUMaskm;
	@FXML private CheckBox debuggerPPUMaskg;
	@FXML private CheckBox debuggerPPUStatusV;
	@FXML private CheckBox debuggerPPUStatusS;
	@FXML private CheckBox debuggerPPUStatusO;
	@FXML private TextField debuggerPPUPPUScroll;
	@FXML private TextField debuggerPPUPPUAddress;
	@FXML private TextField debuggerPPUPPUData;
	@FXML private TextField debuggerPPUOAMDMA;
	@FXML private TextField debuggerPPUOAMAddress;
	@FXML private TextField debuggerPPUOAMData;
	
	@FXML private ComboBox<Integer> spritesPallet;
	@FXML private BorderPane spritesContainer;
	@FXML private Canvas spritesCanvas;

	@FXML private ChoiceBox<Level> choiceLevels;
	@FXML private ToggleButton toggleTimestamps;
	@FXML private ToggleButton togglePause;
	@FXML private BorderPane consolePane;
	
	private Map<Integer, Integer> instructionMap = new ConcurrentHashMap<>();
	
	@Override public void start(Stage stage) throws Exception {
		Controller.stage = stage;
		
		Parent root = FXMLLoader.load(getClass().getResource("/co/swft/nes/ui/emulation.fxml"));

		Scene scene = new Scene(root, 800, 600);

		Thread.setDefaultUncaughtExceptionHandler((t, e) -> {
			try {
				Throwable c = e;
				String    m = "";
				while(c != null) {
					m += "\n> " + c.getClass().getName() + (c.getMessage() != null ? ": " + c.getMessage() : "");
					c = c.getCause();
				}
				logger.error(m.replaceFirst("^\n>", ""));
				e.printStackTrace();
			} catch(Throwable o) {o.printStackTrace();}
		});
		
		stage.setTitle("Emulation");
		stage.setScene(scene);
		stage.setOnCloseRequest(e -> fileClose(new ActionEvent()));
		stage.show();
	}
	
	private void generateSprites() {
		if(ppu == null) return;
		WritableImage image  = new WritableImage(280, 144);
		PixelWriter   writer = image.getPixelWriter();
		byte[] defaultPallet = new byte[] {0x3f, 0x06, 0x02, 0x30};
		int pallet = spritesPallet.getSelectionModel().getSelectedItem();
		
		for(int sprite = 0; sprite < 512; sprite++) {
			for(int line = 0; line < 8; line++) {
				byte plane1 = ppu.readMemoryMap(sprite*16 + line);
				byte plane2 = ppu.readMemoryMap(sprite*16 + line + 8);
				
				for(int bit = 0; bit < 8; bit++) {
					int value = ((plane1 >>> (7 - bit)) & 1) | ((plane2 >>> (7 - bit)) & 1) * 2;
					byte color;
					if(pallet == -1) {
						color = defaultPallet[value];
					} else {
						color = ppu.readMemoryMap(value == 0 ? 0x3f00 : 0x3f10 + pallet*4 + value);
					}
					writer.setArgb(((sprite % 16) * 8) + bit + (sprite / 256) * 136 + 8, (((sprite % 256) / 16) * 8) + line + 8, RicohPPU.palletToRGB(color));
				}
			}
		}

		spritesCanvas.getGraphicsContext2D().clearRect(0, 0, spritesCanvas.getWidth(), spritesCanvas.getHeight());
		spritesCanvas.getGraphicsContext2D().drawImage(image, 0, 0, spritesCanvas.getWidth(), spritesCanvas.getHeight());
		
		logger.info("Sprites generated using pallet " + pallet);
	}
	
	private void disassemble() {
		instructionMap.clear();
		debuggerList.getItems().clear();
		
		logger.info("Disassembly Starting");
		
		
		int countBRK    = 0;
		int bufferBRK[] = new int[3];
		
		int i = 0;
		int pc = cpu.state.rstVector() & 0xffff;
		
		System.out.println(pc);
		
		while(pc >= 0x0000 && pc <= 0xffff) {
			InstructionSet instruction = InstructionSet.lookup(cpu.state.readMemoryMap(pc));
			
			// Code to cut out repeated BRKs
			if(instruction == InstructionSet.BRK_00_Implied) {
				if(++countBRK > bufferBRK.length) {
					bufferBRK[countBRK % bufferBRK.length] = pc;
					pc += instruction.length;
					continue;
				}
			// } else if(instruction == InstructionSet.ISC_FF_AbsoluteX) {
			//
			} else {
				if(countBRK > bufferBRK.length) {
					
					// We don't want to add the ... unless we have at least 6 BRKs
					if(countBRK > 2*bufferBRK.length) {
						logger.debug("Skipped %x lines while disassembling", countBRK - 2*bufferBRK.length);
						debuggerList.getItems().addAll(new String[] {"", String.format("                	; %x skipped BRKs", countBRK - 2*bufferBRK.length), ""});
						i += 3;
					}
					
					// Math.min to ensure we don't repeat rows.
					for(int j = 0; j < Math.min(countBRK - bufferBRK.length, bufferBRK.length); j++) {
						int k = (countBRK + j + 1) % bufferBRK.length;
						debuggerList.getItems().add(String.format("$%04x\t%s", bufferBRK[k], InstructionSet.lookup(cpu.state.readMemoryMap(bufferBRK[k]))));
						instructionMap.put(bufferBRK[k], i++);
					}
				}
				countBRK = 0;
			}
			
			debuggerList.getItems().add(String.format("$%04x\t%s", pc, instruction.toString(cpu.state.readMemoryMap(pc+1), cpu.state.readMemoryMap(pc+2))));
			instructionMap.put(pc, i++);
			pc += instruction.length;
		}
		
		logger.info("Disassembly Complete");
	}

	@FXML protected void initialize() {
		root.setOnKeyPressed(e -> {
			if(e.getCode() == KeyCode.F11) fileFullScreen(new ActionEvent()); 
		});
		menuBar.managedProperty().bind(menuBar.visibleProperty());
		
		LogView logView = new LogView(logger);
		
		infoProperty.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<Field, String>, ObservableValue<String>>() {
			@Override public ObservableValue<String> call(TableColumn.CellDataFeatures<Field, String> p) {
				return new SimpleStringProperty(p.getValue().getName().replaceAll("_", " "));
		}});
		infoProperty.setResizable(false);

		infoDescription.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<Field, String>, ObservableValue<String>>() {
			@Override public ObservableValue<String> call(TableColumn.CellDataFeatures<Field, String> p) {
				try {
					if(p.getValue().get(game).getClass().isArray()) {
						return new SimpleStringProperty(p.getValue().get(game).getClass().getTypeName());
					} else 
						return new SimpleStringProperty(p.getValue().get(game).toString());
				} catch (IllegalArgumentException | IllegalAccessException e) {
					e.printStackTrace();
				}
				return new SimpleStringProperty("Unknown");
		}});
		
		debuggerList.setItems(FXCollections.observableArrayList());
		debuggerControlRun.setOnAction(e -> emulationToggle(e));
		debuggerControlInto.setOnAction(e -> {
			cpu.mode = EmulationMode.INTO;
			cpu.resumeMonitor();
		});
		debuggerControlOut.setOnAction(e -> {
			cpu.mode = EmulationMode.OUT;
			cpu.resumeMonitor();
		});
		debuggerControlOver.setOnAction(e -> {
			cpu.mode = EmulationMode.OVER;
			cpu.resumeMonitor();
		});

		spritesPallet.setItems(FXCollections.observableArrayList(-1, 0, 1, 2, 3));
		spritesPallet.getSelectionModel().select(0);
		spritesPallet.setOnAction(e -> generateSprites());
		
		spritesContainer.setOnScroll(e -> {
			spritesCanvas.setScaleX(Math.max(0.25, Math.min(64, spritesCanvas.getScaleX() + e.getDeltaY() / 100)));
			spritesCanvas.setScaleY(Math.max(0.25, Math.min(64, spritesCanvas.getScaleY() + e.getDeltaY() / 100)));
		});

		DoubleProperty startX = new SimpleDoubleProperty(), startY = new SimpleDoubleProperty();
		DoubleProperty mouseX = new SimpleDoubleProperty(), mouseY = new SimpleDoubleProperty();
		spritesContainer.setOnMousePressed(e -> {
			startX.set(spritesCanvas.getTranslateX());
			startY.set(spritesCanvas.getTranslateY());
			mouseX.set(e.getX());
			mouseY.set(e.getY());
		});
		spritesContainer.setOnMouseDragged(e -> {
			spritesCanvas.setTranslateX(startX.get() + (e.getX() - mouseX.get()));
			spritesCanvas.setTranslateY(startY.get() + (e.getY() - mouseY.get()));
		});
		
		choiceLevels.setItems(FXCollections.observableArrayList(Level.values()));
		choiceLevels.getSelectionModel().select(Level.INFO);
		logView.filterLevelProperty().bind(choiceLevels.getSelectionModel().selectedItemProperty());
		toggleTimestamps.selectedProperty().setValue(true);
		logView.showTimeStampProperty().bind(toggleTimestamps.selectedProperty());
		logView.pausedProperty().bind(togglePause.selectedProperty());
		consolePane.setCenter(logView);

		logger.info("Startup Complete");
	}

	@FXML protected void fileOpenROM(ActionEvent event) {
		logger.info("Opening ROM");

		if(apu != null) apu.stopMonitor();
		if(ppu != null) ppu.stopMonitor();
		if(cpu != null) cpu.stopMonitor();
		
		FileChooser fileChooser = new FileChooser();
		fileChooser.setInitialDirectory(new
		File(System.getProperty("user.dir")));
		fileChooser.getExtensionFilters().add(new
		FileChooser.ExtensionFilter("Nintendo Entertainment System Files (*.nes)", "*.nes"));
		fileChooser.setTitle("Open a NES File to emulate");
		File selected = fileChooser.showOpenDialog(stage);

//		File selected = new File("tools/hello/hello.nes");

		if (selected != null) openROM(selected);
	}
	
	@FXML protected void fileDecompile(ActionEvent event) {
		if(game == null) {
			logger.error("You need to load a game first!");
			return;
		}

		FileChooser chooser = new FileChooser();
		chooser.setInitialDirectory(new File(System.getProperty("user.dir")));
		chooser.setInitialFileName("Assembly-" + game.File.getName().replaceFirst("[.][^.]+$", ""));
		chooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("ASM Files (*.asm)", "*.asm"));
		chooser.setTitle("Save Assembly As");
		File file = chooser.showSaveDialog(stage);

		if (file != null) {
			try {
				if(!file.getName().endsWith(".asm")) file = new File(file + ".asm");
				BufferedWriter out = new BufferedWriter(new FileWriter(file));
				for(String line : debuggerList.getItems()) {
					out.write(line);
					out.write("\n");
				}
				out.close();
			} catch (IOException e) {
				logger.error("Failed writing to " + file);
			}
		}
	}
	
	@FXML protected void fileScreenshot(ActionEvent event) {
		if(game == null) {
			logger.error("You need to load a game first!");
			return;
		}
		
		FileChooser chooser = new FileChooser();
		chooser.setInitialDirectory(new File(System.getProperty("user.dir")));
		chooser.setInitialFileName("Screenshot-" + game.File.getName().replaceFirst("[.][^.]+$", ""));
		chooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PNG Files (*.png)", "*.png"));
		chooser.setTitle("Save Screenshot As");
		File file = chooser.showSaveDialog(stage);

		if (file != null) {
			try {
				if(!file.getName().endsWith(".png")) file = new File(file + ".png");
				ImageIO.write(SwingFXUtils.fromFXImage(emulationCanvas.snapshot(null, null), null), "png", file);
			} catch (IOException e) {
				logger.error("Failed writing to " + file);
			}
		}
	}
	
	@FXML protected void filePatterns(ActionEvent event) {
		if(game == null) {
			logger.error("You need to load a game first!");
			return;
		}
		FileChooser chooser = new FileChooser();
		chooser.setInitialDirectory(new File(System.getProperty("user.dir")));
		chooser.setInitialFileName("Patterns-" + game.File.getName().replaceFirst("[.][^.]+$", ""));
		chooser.getExtensionFilters().add(new FileChooser.ExtensionFilter("PNG Files (*.png)", "*.png"));
		chooser.setTitle("Save Patterns As");
		File file = chooser.showSaveDialog(stage);

		if (file != null) {
			try {
				if(!file.getName().endsWith(".png")) file = new File(file + ".png");
				ImageIO.write(SwingFXUtils.fromFXImage(spritesCanvas.snapshot(null, null), null), "png", file);
			} catch (IOException e) {
				logger.error("Failed writing to " + file);
			}
		}
	}
	
	private void openROM(File file) {
		logger.info("%s selected", file);

		try {
			game = new NESCartridge(file);

			infoTable.itemsProperty().get().clear();
			infoTable.itemsProperty().get().addAll(FXCollections.observableArrayList(game.getClass().getDeclaredFields()));
			
			logger.info("Cartridge Loaded");

			apu = new RicohAPU(logger.log);
			ppu = new RicohPPU(logger.log, emulationCanvas, game);
			cpu = new RicohCPU(logger.log, game, ppu, apu);

			cpu.mode = EmulationMode.DEFAULT;
			
			debuggerEnable.setOnAction(e -> cpu.debugMode = debuggerEnable.isSelected());
			
			
			disassemble();
			cpu.addCycleListener(event -> Platform.runLater(() -> {
				debuggerStatus.setText(event.instruction.toString());
				
				try {
					int position = instructionMap.get(cpu.state.pc & 0xffff);
					debuggerList.getSelectionModel().select(position);
					debuggerList.scrollTo(position);
				} catch(NullPointerException exception) {
					logger.warn("CPU out of alignment: " + Integer.toHexString(cpu.state.pc & 0xffff));
				}
				
				debuggerCPURegisterPC.setText(Integer.toHexString(Short.toUnsignedInt(cpu.state.pc)));
				debuggerCPURegisterA.setText(Integer.toHexString(Byte.toUnsignedInt(cpu.state.a)));
				debuggerCPURegisterX.setText(Integer.toHexString(Byte.toUnsignedInt(cpu.state.x)));
				debuggerCPURegisterY.setText(Integer.toHexString(Byte.toUnsignedInt(cpu.state.y)));
				debuggerCPUStatusN.setSelected(cpu.state.getNegativeFlag());
				debuggerCPUStatusV.setSelected(cpu.state.getOverflowFlag());
				debuggerCPUStatusU.setIndeterminate(true);
				debuggerCPUStatusB.setSelected(cpu.state.getBreakFlag());
				debuggerCPUStatusD.setSelected(cpu.state.getDecimalFlag());
				debuggerCPUStatusI.setSelected(cpu.state.getInterruptFlag());
				debuggerCPUStatusZ.setSelected(cpu.state.getZeroFlag());
				debuggerCPUStatusC.setSelected(cpu.state.getCarryFlag());
				debuggerCPUStack.setText(Integer.toHexString(Byte.toUnsignedInt(cpu.state.sp)));
				
				debuggerPPUControlV.setSelected((ppu.controller & 0x80) != 0);
				debuggerPPUControlP.setSelected((ppu.controller & 0x40) != 0);
				debuggerPPUControlH.setSelected((ppu.controller & 0x20) != 0);
				debuggerPPUControlB.setSelected((ppu.controller & 0x10) != 0);
				debuggerPPUControlS.setSelected((ppu.controller & 0x08) != 0);
				debuggerPPUControlI.setSelected((ppu.controller & 0x04) != 0);
				debuggerPPUControlN.setText(Integer.toHexString(ppu.status & 0x03));
				debuggerPPUMaskB.setSelected((ppu.mask & 0x80) != 0);
				debuggerPPUMaskG.setSelected((ppu.mask & 0x40) != 0);
				debuggerPPUMaskR.setSelected((ppu.mask & 0x20) != 0);
				debuggerPPUMasks.setSelected((ppu.mask & 0x10) != 0);
				debuggerPPUMaskb.setSelected((ppu.mask & 0x08) != 0);
				debuggerPPUMaskM.setSelected((ppu.mask & 0x04) != 0);
				debuggerPPUMaskm.setSelected((ppu.mask & 0x02) != 0);
				debuggerPPUMaskg.setSelected((ppu.mask & 0x01) != 0);
				debuggerPPUStatusV.setSelected((ppu.status & 0x80) != 0);
				debuggerPPUStatusS.setSelected((ppu.status & 0x40) != 0);
				debuggerPPUStatusO.setSelected((ppu.status & 0x10) != 0);
				debuggerPPUPPUScroll.setText(Integer.toHexString(ppu.scroll & 0xff));
				debuggerPPUPPUAddress.setText(Integer.toHexString(ppu.address & 0xff));
				debuggerPPUOAMAddress.setText(Integer.toHexString(ppu.oamAddress & 0xff));
				debuggerPPUOAMData.setText(Integer.toHexString(ppu.oamData & 0xff));
				
			}));
			generateSprites();
			
			cpu.pauseMonitor();
			
			apu.start();
			ppu.start();
			cpu.start();
			
			logger.info("System Created");
		} catch (Exception e) {
			logger.warn("Failed to load Cartridge");
			e.printStackTrace();
		}
	}
	
	@FXML protected void fileFullScreen(ActionEvent event) {
		logger.info("Toggling FullScreen");
		
		menuBar.setVisible(!menuBar.isVisible());
		stage.setFullScreen(!stage.isFullScreen());
	}

	@FXML protected void fileClose(ActionEvent event) {
		logger.info("Closing");
		
		if(apu != null) apu.stopMonitor();
		if(ppu != null) ppu.stopMonitor();
		if(cpu != null) cpu.stopMonitor();
		
		Platform.exit();
		System.exit(0); // Todo, nicer shutdown of threads
	}

	@FXML protected void emulationToggle(ActionEvent event) {
		logger.info("Toggling Emulation");
		
		cpu.mode = EmulationMode.DEFAULT;
		if(cpu != null) cpu.toggleMonitor();
	}

	@FXML protected void emulationRestart(ActionEvent event) {
		logger.info("Restarting Emulation");

		if(apu != null) apu.stopMonitor();
		if(ppu != null) ppu.stopMonitor();
		if(cpu != null) cpu.stopMonitor();
		
		apu = new RicohAPU(logger.log);
		ppu = new RicohPPU(logger.log, emulationCanvas, game);
		cpu = new RicohCPU(logger.log, game, ppu, apu);

		cpu.pauseMonitor();

		apu.start();
		ppu.start();
		cpu.start();
	}

	@FXML protected void emulationSave(ActionEvent event) {
		logger.info("Saving State");
	}

	@FXML protected void emulationLoad(ActionEvent event) {
		logger.info("Loading State");
	}

	@FXML protected void helpAbout(ActionEvent event) throws Exception {
		logger.info("Opening About Dialogue");

		Alert alert = new Alert(Alert.AlertType.INFORMATION);
		alert.setTitle("About");
		alert.setHeaderText(null);
		alert.setContentText("Created by https://github.com/mattconsto/nes");
		alert.showAndWait();
	}
}
