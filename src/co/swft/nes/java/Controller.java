package co.swft.nes.java;

import java.io.File;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.stackoverflow.jewelsea.*;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.property.*;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.*;
import javafx.scene.image.PixelWriter;
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
	private Stage stage;
	private Log log = new Log();
	private Logger logger = new Logger(log, "App", true);
	
	private NESCartridge game;

	private RicohAPU apu;
	private RicohPPU ppu;
	private RicohCPU cpu;

	@FXML private BorderPane emulationContainer;
	@FXML private Canvas emulationCanvas;

	@FXML private TableView<Field> infoTable;
	@FXML private TableColumn<Field, String> infoProperty;
	@FXML private TableColumn<Field, String> infoDescription;

	@FXML private ListView<String> debuggerList;
	@FXML private Label debuggerStatus;
	@FXML private ToggleButton debuggerControlRun;
	@FXML private Button debuggerControlInto;
	@FXML private Button debuggerControlOut;
	@FXML private Button debuggerControlOver;
	@FXML private Button debuggerControlLine;
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
	

	private String[] instructionSet = {
		"BRK",				"ORA ($%3$02x%2$02x,X)", 	"???", 			"???", 	"???", 			"ORA $%02x", 		"ASL $%02x", 		"???", 	"PHP", 	"ORA #%02x", 		"ASL Accumulator", 		"???", 	"???", 		"ORA $%3$02x%2$02x", 		"ASL $%3$02x%2$02x", 		"???", 
		"BPL $%02x",			"ORA ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"ORA $%02x,X", 	"ASL $%02x,X", 	"???", 	"CLC", 	"ORA $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"ORA $%3$02x%2$02x,X", 	"ASL $%3$02x%2$02x,X", 	"???", 
		"JSR $%3$02x%2$02x",	"AND ($%3$02x%2$02x,X)", 	"???", 			"???", 	"BIT $%02x", 		"AND $%02x", 		"ROL $%02x", 		"???", 	"PLP", 	"AND #%02x", 		"ROL Accumulator", 		"???", 	"BIT $%3$02x%2$02x", 		"AND $%3$02x%2$02x", 		"ROL $%3$02x%2$02x", 		"???", 
		"BMI $%02x", 			"AND ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"AND $%02x,X", 	"ROL $%02x,X", 	"???", 	"SEC", 	"AND $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"AND $%3$02x%2$02x,X", 	"ROL $%3$02x%2$02x,X", 	"???", 
		"RTI",				"EOR ($%3$02x%2$02x,X)", 	"???", 			"???", 	"???", 			"EOR $%02x", 		"LSR $%02x", 		"???", 	"PHA", 	"EOR #%02x", 		"LSR Accumulator", 		"???", 	"JMP $%3$02x%2$02x", 		"EOR $%3$02x%2$02x", 		"LSR $%3$02x%2$02x", 		"???", 
		"BVC $%02x",			"EOR ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"EOR $%02x,X", 	"LSR $%02x,X", 	"???", 	"CLI", 	"EOR $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"EOR $%3$02x%2$02x,X", 	"LSR $%3$02x%2$02x,X", 	"???", 
		"RTS", 				"ADC ($%3$02x%2$02x,X)", 	"???", 			"???", 	"???", 			"ADC $%02x", 		"ROR $%02x", 		"???", 	"PLA", 	"ADC #%02x", 		"ROR Accumulator", 		"???", 	"JMP ($%3$02x%2$02x)", 		"ADC $%3$02x%2$02x", 		"ROR $%3$02x%2$02x", 		"???", 
		"BVS $%02x", 			"ADC ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"ADC $%02x,X", 	"ROR $%02x,X", 	"???", 	"SEI", 	"ADC $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"ADC $%3$02x%2$02x,X", 	"ROR $%3$02x%2$02x,X", 	"???", 
		"???", 				"STA ($%3$02x%2$02x,X)", 	"???", 			"???", 	"STY $%02x", 		"STA $%02x", 		"STX $%02x", 		"???", 	"DEY", 	"???", 		"TXA", 	"???", 	"STY $%3$02x%2$02x", 		"STA $%3$02x%2$02x", 		"STX $%3$02x%2$02x", 		"???", 
		"BCC $%02x", 			"STA ($%3$02x%2$02x),Y", 	"???", 			"???", 	"STY $%02x,X", 	"STA $%02x,X", 	"STX $%02x,Y", 	"???", 	"TYA", 	"STA $%3$02x%2$02x,Y", 	"TXS", 	"???", 	"???", 		"STA $%3$02x%2$02x,X", 	"???", 		"???", 
		"LDY #%02x", 		"LDA ($%3$02x%2$02x,X)", 	"LDX #%02x", 	"???", 	"LDY $%02x", 		"LDA $%02x", 		"LDX $%02x", 		"???", 	"TAY", 	"LDA #%02x", 		"TAX", 	"???", 	"LDY $%3$02x%2$02x", 		"LDA $%3$02x%2$02x", 		"LDX $%3$02x%2$02x", 		"???", 
		"BCS $%02x",			"LDA ($%3$02x%2$02x),Y", 	"???", 			"???", 	"LDY $%02x,X", 	"LDA $%02x,X", 	"LDX $%02x,Y", 	"???", 	"CLV", 	"LDA $%3$02x%2$02x,Y", 	"TSX", 	"???", 	"LDY $%3$02x%2$02x,X", 	"LDA $%3$02x%2$02x,X", 	"LDX $%3$02x%2$02x,Y", 	"???", 
		"CPY #%02x", 		"CMP ($%3$02x%2$02x,X)", 	"???", 			"???", 	"CPY $%02x", 		"CMP $%02x", 		"DEC $%02x", 		"???", 	"INY", 	"CMP #%02x", 		"DEX", 	"???", 	"CPY $%3$02x%2$02x", 		"CMP $%3$02x%2$02x", 		"DEC $%3$02x%2$02x", 		"???", 
		"BNE $%02x", 			"CMP ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"CMP $%02x,X", 	"DEC $%02x,X", 	"???", 	"CLD", 	"CMP $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"CMP $%3$02x%2$02x,X", 	"DEC $%3$02x%2$02x,X", 	"???", 
		"CPX #%02x", 		"SBC ($%3$02x%2$02x,X)", 	"???", 			"???", 	"CPX $%02x", 		"SBC $%02x", 		"INC $%02x", 		"???", 	"INX", 	"SBC #%02x", 		"NOP", 	"???", 	"CPX $%3$02x%2$02x", 		"SBC $%3$02x%2$02x", 		"INC $%3$02x%2$02x", 		"???", 
		"BEQ $%02x", 			"SBC ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"SBC $%02x,X", 	"INC $%02x,X", 	"???", 	"SED", 	"SBC $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"SBC $%3$02x%2$02x,X", 	"INC $%3$02x%2$02x,X", 	"???"
	};
	
	private Map<Integer, Integer> instructionMap = new ConcurrentHashMap<>();
	
	private int[] instructionLength = {1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 3, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1, 2, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 3, 1, 1, 1, 3, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 3, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1};

	@Override public void start(Stage stage) throws Exception {
		this.stage = stage;

		Parent root = FXMLLoader.load(getClass().getResource("/co/swft/nes/ui/emulation.fxml"));

		Scene scene = new Scene(root, 800, 600);
		
		stage.setTitle("Emulation");
		stage.setScene(scene);
		stage.setOnCloseRequest(e -> fileClose(new ActionEvent()));
		stage.show();
	}
	
	private void generateSprites() {
		if(ppu == null) return;
		
		PixelWriter writer = spritesCanvas.getGraphicsContext2D().getPixelWriter();
		byte[] defaultPallet = new byte[] {0x3f, 0x06, 0x02, 0x30};
		int pallet = spritesPallet.getSelectionModel().getSelectedItem();
		
		for(int sprite = 0; sprite < 512; sprite++) {
			for(int line = 0; line < 8; line++) {
				byte plane1 = ppu.readMemoryMap(sprite*16 + line);
				byte plane2 = ppu.readMemoryMap(sprite*16 + line + 8);
				
				for(int bit = 0; bit < 8; bit++) {
					int value = ((plane1 >> (7 - bit)) & 1) | ((plane2 >> (7 - bit)) & 1) * 2;
					byte color;
					if(pallet == -1) {
						color = defaultPallet[value];
					} else {
						color = ppu.readMemoryMap(value == 0 ? 0x3f00 : 0x3f10 + pallet*4 + value);
					}
					writer.setArgb(((sprite % 16) * 8) + bit + (sprite / 256) * 136, (((sprite % 256) / 16) * 8) + line, RicohPPU.palletToRGB(color));
				}
			}
		}
		
		logger.info("Sprites generated using pallet " + pallet);
	}
	
	private void disassemble() {
		instructionMap.clear();
		
		for(int i = 0, pc = 0; pc < game.PRG_ROM.length; i++) {
			debuggerList.getItems().add(String.format("%4$04x\t" + instructionSet[game.PRG_ROM[pc] & 0xff], game.PRG_ROM[(pc+1)%game.PRG_ROM.length], game.PRG_ROM[(pc+2)%game.PRG_ROM.length], game.PRG_ROM[(pc+3)%game.PRG_ROM.length], pc + 0x8000));
			instructionMap.put(pc + 0x8000, i);
			pc += instructionLength[game.PRG_ROM[pc] & 0xff];
		}
		
		logger.info("Disassembly Complete");
	}

	@FXML protected void initialize() {
		LogView logView = new LogView(logger);
		
		emulationContainer.setOnScroll(e -> {
			emulationCanvas.setScaleX(Math.max(0.25, Math.min(64, emulationCanvas.getScaleX() + e.getDeltaY() / 100)));
			emulationCanvas.setScaleY(Math.max(0.25, Math.min(64, emulationCanvas.getScaleY() + e.getDeltaY() / 100)));
		});
		
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
	
	private void openROM(File file) {
		logger.info("%s selected", file);

		try {
			game = new NESCartridge(file);

			infoTable.itemsProperty().get().clear();
			infoTable.itemsProperty().get().addAll(FXCollections.observableArrayList(game.getClass().getDeclaredFields()));
			
			logger.info("Cartridge Loaded");

			apu = new RicohAPU(log);
			ppu = new RicohPPU(log, emulationCanvas, game);
			cpu = new RicohCPU(log, game, ppu, apu);
			
			disassemble();
			cpu.addCycleListener(e -> Platform.runLater(() -> {
				debuggerStatus.setText("Currently executing: " + instructionSet[e.instruction & 0xff]);
				
				try {
					int position = instructionMap.get(cpu.state.pc & 0xffff);
					debuggerList.getSelectionModel().select(position);
					debuggerList.scrollTo(position);
				} catch(NullPointerException exception) {
					logger.error("CPU out of alignment: " + Integer.toHexString(cpu.state.pc & 0xffff));
				}
				
				debuggerCPURegisterPC.setText(Integer.toHexString(Short.toUnsignedInt(cpu.state.pc)));
				debuggerCPURegisterA.setText(Integer.toHexString(Byte.toUnsignedInt(cpu.state.a)));
				debuggerCPURegisterX.setText(Integer.toHexString(Byte.toUnsignedInt(cpu.state.x)));
				debuggerCPURegisterY.setText(Integer.toHexString(Byte.toUnsignedInt(cpu.state.y)));
				debuggerCPUStatusN.setSelected(cpu.getNegativeFlag());
				debuggerCPUStatusV.setSelected(cpu.getOverflowFlag());
				debuggerCPUStatusU.setIndeterminate(true);
				debuggerCPUStatusB.setSelected(cpu.getBreakFlag());
				debuggerCPUStatusD.setSelected(cpu.getDecimalFlag());
				debuggerCPUStatusI.setSelected(cpu.getInterruptFlag());
				debuggerCPUStatusZ.setSelected(cpu.getZeroFlag());
				debuggerCPUStatusC.setSelected(cpu.getCarryFlag());
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
			
			apu.pauseMonitor();
			ppu.pauseMonitor();
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
		
		if(apu != null) apu.toggleMonitor();
		if(ppu != null) ppu.toggleMonitor();
		if(cpu != null) cpu.toggleMonitor();
	}

	@FXML protected void emulationRestart(ActionEvent event) {
		logger.info("Restarting Emulation");

		if(apu != null) apu.stopMonitor();
		if(ppu != null) ppu.stopMonitor();
		if(cpu != null) cpu.stopMonitor();
		
		apu = new RicohAPU(log);
		ppu = new RicohPPU(log, emulationCanvas, game);
		cpu = new RicohCPU(log, game, ppu, apu);

		apu.pauseMonitor();
		ppu.pauseMonitor();
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

	@FXML protected void helpAbout(ActionEvent event) {
		logger.info("Opening About Dialogue");

		Alert alert = new Alert(Alert.AlertType.INFORMATION);
		alert.setTitle("About");
		alert.setHeaderText(null);
		alert.setContentText("Created by https://github.com/mattconsto/nes");
		alert.showAndWait();
	}
}
