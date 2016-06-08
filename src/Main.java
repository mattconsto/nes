import java.io.File;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stackoverflow.jewelsea.Level;
import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.LogView;
import com.stackoverflow.jewelsea.Logger;
import com.sun.corba.se.spi.orbutil.fsm.Action;

import co.swft.nes.java.NESCartridge;
import co.swft.nes.java.RicohAPU;
import co.swft.nes.java.RicohCPU;
import co.swft.nes.java.RicohPPU;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.CacheHint;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.ToggleButton;
import javafx.scene.image.PixelWriter;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.BorderPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Shape;
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
public class Main extends Application {
	private Stage stage;
	private Log log = new Log();
	private Logger logger = new Logger(log, "App");
	
	private NESCartridge game;

	private RicohAPU apu;
	private RicohPPU ppu;
	private RicohCPU cpu;

	@FXML private Canvas emulationCanvas;

	@FXML private TableView<Field> infoTable;
	@FXML private TableColumn<Field, String> infoProperty;
	@FXML private TableColumn<Field, String> infoDescription;

	@FXML private ListView<String> debuggerList;

	@FXML private TableView<ObservableList<String>> registerTable;
	@FXML private TableColumn<ObservableList<String>, String> registerRegister;
	@FXML private TableColumn<ObservableList<String>, String> registerValue;
	
	@FXML private ComboBox<Integer> spritesPallet;
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
	
	private Map<Integer, Integer> instructionMap = new HashMap<>();
	
	private int[] instructionLength = {1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 3, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1, 2, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 3, 1, 1, 1, 3, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 3, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 2, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 3, 3, 3, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 1, 3, 3, 1, 1};
	
	public static void main(String[] args) {
		Application.launch(args);
	}

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
		PixelWriter writer = spritesCanvas.getGraphicsContext2D().getPixelWriter();
		byte[] defaultPallet = new byte[] {0x3f, 0x06, 0x02, 0x30};
		
		for(int sprite = 0; sprite < 512; sprite++) {
			for(int line = 0; line < 8; line++) {
				byte plane1 = ppu.readMemoryMap(sprite*16 + line);
				byte plane2 = ppu.readMemoryMap(sprite*16 + line + 8);
				
				for(int bit = 0; bit < 8; bit++) {
					int value = ((plane1 >> (7 - bit)) & 1) | ((plane2 >> (7 - bit)) & 1) * 2;
					byte color;
					if(spritesPallet.getSelectionModel().getSelectedItem() == -1) {
						color = defaultPallet[value];
					} else {
						color = ppu.readMemoryMap(value == 0 ? 0x3f00 : 0x3f10 + spritesPallet.getSelectionModel().getSelectedItem()*4 + value);
					}
					writer.setArgb(((sprite % 16) * 8) + bit, ((sprite / 16) * 8) + line, RicohPPU.palletToRGB(color));
				}
			}
		}
		
		logger.info("Sprites generated");
	}
	
	private void disassemble() {
		instructionMap.clear();
		
		for(int i = 0, pc = 0; pc < game.PRG_ROM.length; i++) {
			debuggerList.getItems().add(String.format("%4$04x\t" + instructionSet[game.PRG_ROM[pc] & 0xff], game.PRG_ROM[(pc+1)%game.PRG_ROM.length], game.PRG_ROM[(pc+2)%game.PRG_ROM.length], game.PRG_ROM[(pc+3)%game.PRG_ROM.length], pc));
			instructionMap.put(pc, i);
			pc += instructionLength[game.PRG_ROM[pc] & 0xff];
		}
		
		logger.info("Disassembly Complete");
	}

	@FXML protected void initialize() {
		LogView logView = new LogView(logger);
		
		infoProperty.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<Field, String>, ObservableValue<String>>() {
			@Override public ObservableValue<String> call(TableColumn.CellDataFeatures<Field, String> p) {
				return new SimpleStringProperty(p.getValue().getName().replaceAll("_", " "));
		}});

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

		if (selected != null) {
			logger.info("%s selected", selected);

			try {
				game = new NESCartridge(selected);

				infoTable.itemsProperty().get().clear();
				infoTable.itemsProperty().get().addAll(FXCollections.observableArrayList(game.getClass().getDeclaredFields()));
				
				logger.info("Cartridge Loaded");

				apu = new RicohAPU(log);
				ppu = new RicohPPU(log, emulationCanvas, game);
				cpu = new RicohCPU(log, game, ppu, apu);
				
				disassemble();
				generateSprites();
				
//				apu.start();
//				ppu.start();
//				cpu.start();
				
				logger.info("System Created");

				System.out.println(game);
			} catch (Exception e) {
				logger.warn("Failed to load Cartridge");
				e.printStackTrace();
			}
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
