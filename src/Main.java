import java.io.File;

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
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.Alert;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ToggleButton;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

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

	@FXML private Canvas emulationCanvas;
	@FXML private ChoiceBox<Level> choiceLevels;
	@FXML private ToggleButton toggleTimestamps;
	@FXML private ToggleButton togglePause;
	@FXML private BorderPane consolePane;

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

	@FXML protected void initialize() {
		LogView logView = new LogView(logger);
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
		// FileChooser fileChooser = new FileChooser();
		// fileChooser.setInitialDirectory(new
		// File(System.getProperty("user.dir")));
		// fileChooser.getExtensionFilters().add(new
		// FileChooser.ExtensionFilter("Nintendo Entertainment System Files
		// (*.nes)", "*.nes"));
		// fileChooser.setTitle("Open a NES File to emulate");
		// File selected = fileChooser.showOpenDialog(stage);

		File selected = new File("tools/hello/hello.nes");

		if (selected != null) {
			logger.info("%s selected", selected);
			
			try {
				NESCartridge game = new NESCartridge(selected);

				RicohAPU apu = new RicohAPU(log);
				RicohPPU ppu = new RicohPPU(log, emulationCanvas, game);
				RicohCPU cpu = new RicohCPU(log, game, ppu, apu);

				Thread apuT = new Thread(apu);
				Thread ppuT = new Thread(ppu);
				Thread cpuT = new Thread(cpu);

				System.out.println(game);

				apuT.start();
				ppuT.start();
				cpuT.start();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@FXML protected void fileClose(ActionEvent event) {
		logger.info("Closing");
		Platform.exit();
		System.exit(0); // Todo, nicer shutdown of threads
	}
	
	@FXML protected void emulationToggle(ActionEvent event) {
		logger.info("Toggling Emulation");
	}
	
	@FXML protected void emulationRestart(ActionEvent event) {
		logger.info("Restarting Emulation");
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
