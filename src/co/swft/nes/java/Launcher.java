package co.swft.nes.java;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.LogRecord;
import com.stackoverflow.jewelsea.Logger;

import javafx.application.Application;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonType;
import net.infotrek.util.prefs.FilePreferencesFactory;

public class Launcher {
	public static Logger logger = new AlertLogger(new Log(), "Lau");

	public Launcher() {
		System.setProperty("java.util.prefs.PreferencesFactory", FilePreferencesFactory.class.getName());
		System.setProperty(FilePreferencesFactory.SYSTEM_PROPERTY_FILE, "Emulator.preferences");
		
		try {
			logger.info("Launching");
			Application.launch(Controller.class);
		} catch(Exception e) {
			try {
				logger.error(e.getMessage());
				new Alert(AlertType.ERROR, "An irrecoverable error has occured, check Error.log for details", ButtonType.CLOSE);
			} catch(Exception ignored) {}
			
			List<LogRecord> records = new ArrayList<>();
			logger.log.drainTo(records);
			
			try {
				BufferedWriter out = new BufferedWriter(new FileWriter("Error.log"));
				for(LogRecord line : records) {
					out.write(line.toString());
					out.write("\n");
				}
				out.close();
			} catch (IOException exception) {
				logger.error("Failed writing to Error.log");
			}
		}
	}
}
