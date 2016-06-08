import co.swft.nes.java.Controller;
import javafx.application.Application;
import net.infotrek.util.prefs.FilePreferencesFactory;

public class Launcher {

	public static void main(String[] args) {
		System.setProperty("java.util.prefs.PreferencesFactory", FilePreferencesFactory.class.getName());
		System.setProperty(FilePreferencesFactory.SYSTEM_PROPERTY_FILE, "emulator.preferences");
		Application.launch(Controller.class);
	}
}
