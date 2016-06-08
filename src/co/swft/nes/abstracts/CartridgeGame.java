package co.swft.nes.abstracts;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import co.swft.util.TableBuilder;

public abstract class CartridgeGame {
	public byte[] code;
	public byte[] save;
	public HashMap<String, Object> properties = new HashMap<String, Object>();
	
	public class InvalidFileException extends Exception {
        private static final long serialVersionUID = 3340080282731893878L;
		public InvalidFileException(String message) {
			super(message);
		}
		public InvalidFileException(String format, Object... args) {
			super(String.format(format, args));
		}
	}
	
	public CartridgeGame(File file) throws IOException {
		code = Files.readAllBytes(file.toPath());
	}
	
	public void saveGame(File file) throws IOException {
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
		stream.write(save);
		stream.close();
	}
	
	public void loadGame(File file) throws IOException {
		BufferedInputStream stream = new BufferedInputStream(new FileInputStream(file));
		save = new byte[(int) file.length()];
		stream.read(save);
		stream.close();
	}
	
	public String toString() {
		TableBuilder tableBuilder = new TableBuilder();
		
//		for(Map.Entry<String, Object> entry : properties.entrySet())
//            tableBuilder.addRow(entry.getKey(), entry.getValue().toString());
		
		// TODO: Crappy reflective way. Remove
		for(Field field : this.getClass().getDeclaredFields()) {
			try {
	            tableBuilder.addRow(field.getName(), field.get(this));
            } catch (Exception e) {
            	System.err.println("[FIL] Unable to produce a string representation");
            	break;
            }
		}
		return tableBuilder.toString();
	}
}
