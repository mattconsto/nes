import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.UnrecognizedOptionException;

import co.swft.nes.java.Launcher;

public class Main {
	public static void main(String[] args) throws ParseException {
		try {
			Options options = new Options();
			options.addOption("debug", false, "Enable debug by default");
			new DefaultParser().parse(options, args, false);
			new Launcher();
		} catch(UnrecognizedOptionException exception) {
			System.err.println(exception.getMessage());
		}
	}
}
