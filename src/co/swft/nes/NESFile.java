package co.swft.nes;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Arrays;

import co.swft.common.TableBuilder;

public class NESFile {
	public final File    file;
	
	public final byte[]  code;
	public byte[]        sram = new byte[0x2000];
	
	public final int     programROMPages;   // 1 page = 16,384 bytes
	public final int     characterROMpages; // 1 page = 8,192 bytes
	public final boolean fourScreenMode;    // When set mirroring has no effect
	public final boolean Trainer;           // True = 512 byte trainer at 7000-71FFh
	public final boolean SRAMBattery;       // Is SRAM battery backed?
	public final boolean Mirroring;         // 0 = Horizontal, 1 = Vertical
	public final boolean Playchoice10;      // True = PC-10 game
	public final boolean VsUnisystem;       // True =  Vs. game
	public final int     mapperNumber;      //
	public final int     subMapperNumber;   //
	public final int     quantityBBPRGRAM;  // Quantity of Battery Backed RAM
	public final int     quantityNBPRGRAM;  // Quantity of No Battery RAM
	public final int     quantityBBCHRRAM;  // ''
	public final int     quantityNBCHRRAM;  // ''
	public final Region  region;            // 
	public final byte    VsHardware;        // Ewwwww

	public enum Region {PAL, NTSC, BOTH}
	
	public class InvalidFileException extends Exception {
        private static final long serialVersionUID = 3340080282731893878L;
		public InvalidFileException(String message) {
			super(message);
		}
		public InvalidFileException(String format, Object... args) {
			super(String.format(format, args));
		}
	}
	
	public NESFile(File file) throws IOException, InvalidFileException {
		this.file = file;
		
		//System.out.format("Reading file: %s (%skB)%n%n", file, file.length() / 1024);
		byte[] byteCode = Files.readAllBytes(file.toPath());
	    
		// Check for the correct header
	    if(!new String(Arrays.copyOfRange(byteCode, 0, 3)).equals("NES"))
	    	throw new InvalidFileException("Invalid NES byteCode.");
	    
	    // Original iNES Stuff
		int programROMPages    = byteCode[4];
		
		int characterROMpages  = byteCode[5];
		
		fourScreenMode         = (byteCode[6] & 0x08) == 1;
		Trainer                = (byteCode[6] & 0x04) == 1;
		SRAMBattery            = (byteCode[6] & 0x02) == 1;
		Mirroring              = (byteCode[6] & 0x01) == 1;
		
		Playchoice10           = (byteCode[7] & 0x02) == 1;
		VsUnisystem            = (byteCode[7] & 0x01) == 1;
		
		int mapperNumber       = ((byteCode[7] & 0xF0) >> 0) | ((byteCode[6] & 0xF0) >> 4);
		
		// Extended NES 2.0 Stuff
		subMapperNumber        = (byteCode[8] & 0xF0) >> 4;
		this.mapperNumber      = ((byteCode[8] & 0x0F) << 8) | mapperNumber;
		
		this.programROMPages   = ((byteCode[9] & 0x0F) << 8) | programROMPages;
		this.characterROMpages = ((byteCode[9] & 0xF0) << 4) | characterROMpages;
		
		quantityBBPRGRAM       = (byteCode[10] & 0xF0) >> 4;
		quantityNBPRGRAM       = byteCode[10] & 0x0F;

		quantityBBCHRRAM       = (byteCode[11] & 0xF0) >> 4;
		quantityNBCHRRAM       = byteCode[11] & 0x0F;
		
		region                 = ((byteCode[12] & 0x02) == 1) ? Region.BOTH : Region.values()[byteCode[12] & 0x01];
		
		VsHardware             = byteCode[13];
		
		// Crop of the header.
		this.code = Arrays.copyOfRange(byteCode, 16, byteCode.length);
	}
	
	public String toString() {
		TableBuilder tableBuilder = new TableBuilder();
		
		tableBuilder.addRow("Name",              file.getName());
		tableBuilder.addRow("Path",              file.getPath());
		tableBuilder.addRow("File Size",         (file.length() / 1024) + "kB");
		tableBuilder.addRow("programROMPages",   programROMPages);
		tableBuilder.addRow("characterROMpages", characterROMpages);
		tableBuilder.addRow("fourScreenMode",    fourScreenMode);
		tableBuilder.addRow("Trainer",           Trainer);
		tableBuilder.addRow("SRAMBattery",       SRAMBattery);
		tableBuilder.addRow("Mirroring",         Mirroring);
		tableBuilder.addRow("Playchoice10",      Playchoice10);
		tableBuilder.addRow("VsUnisystem",       VsUnisystem);
		tableBuilder.addRow("mapperNumber",      mapperNumber);
		tableBuilder.addRow("subMapperNumber",   subMapperNumber);
		tableBuilder.addRow("quantityBBPRGRAM",  quantityBBPRGRAM);
		tableBuilder.addRow("quantityNBPRGRAM",  quantityNBPRGRAM);
		tableBuilder.addRow("quantityBBCHRRAM",  quantityBBCHRRAM);
		tableBuilder.addRow("quantityNBCHRRAM",  quantityNBCHRRAM);
		tableBuilder.addRow("Region",            region);
		tableBuilder.addRow("VsHardware",        VsHardware);
		
		return tableBuilder.toString();
	}
}
