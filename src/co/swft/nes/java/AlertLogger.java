package co.swft.nes.java;

import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.LogRecord;
import com.stackoverflow.jewelsea.Logger;

import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Alert.AlertType;

public class AlertLogger extends Logger {
	private Alert       alert;

	public AlertLogger(Log log, String context) {
		super(log, context);
	}
	
	@Override public void log(LogRecord record) {
		super.log(record);
		/* Deliberate Overflowing */
		switch (record.getLevel()) {
		case ERROR:
			try {
				/* If there is an issue creating the Alert, I still want it logged */
				if(alert == null) alert = new Alert(AlertType.ERROR, "Undefined Error", ButtonType.OK);
				alert.setContentText(record.getMessage());
				alert.setTitle(context);
				alert.show();
			} catch (Exception ignored) {}
			case WARN:
			case INFO:
			case DEBUG:
			default:
				System.out.println(record);
		}
	}
}
