package co.swft.nes.java;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Arrays;

import co.swft.nes.abstracts.CartridgeGame;

/**
 * NES Cartridge
 * 
 * @author Matthew Consterdine
 */
public class NESCartridge extends CartridgeGame {
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
	
	public byte[] prg;
	public byte[] chr;

	public enum Region {PAL, NTSC, BOTH}
	
	public NESCartridge(File file) throws IOException, InvalidFileException {
		super(file);
		
		// Initialise the save
		save = new byte[0x2000];
		
		//System.out.format("Reading file: %s (%skB)%n%n", file, file.length() / 1024);
		byte[] code = Files.readAllBytes(file.toPath());
	    
		// Check for the correct header
	    if(!new String(Arrays.copyOfRange(code, 0, 3)).equals("NES"))
	    	throw new InvalidFileException("Invalid NES byteCode.");
	    
	    // Original iNES Stuff
		int programROMPages    = code[4];
		
		int characterROMpages  = code[5];
		
		fourScreenMode         = (code[6] & 0x08) == 1;
		Trainer                = (code[6] & 0x04) == 1;
		SRAMBattery            = (code[6] & 0x02) == 1;
		Mirroring              = (code[6] & 0x01) == 1;
		
		Playchoice10           = (code[7] & 0x02) == 1;
		VsUnisystem            = (code[7] & 0x01) == 1;
		
		int mapperNumber       = ((code[7] & 0xF0) >> 0) | ((code[6] & 0xF0) >> 4);
		
		// Extended NES 2.0 Stuff
		subMapperNumber        = (code[8] & 0xF0) >> 4;
		this.mapperNumber      = ((code[8] & 0x0F) << 8) | mapperNumber;
		
		this.programROMPages   = ((code[9] & 0x0F) << 8) | programROMPages;
		this.characterROMpages = ((code[9] & 0xF0) << 4) | characterROMpages;
		
		quantityBBPRGRAM       = (code[10] & 0xF0) >> 4;
		quantityNBPRGRAM       = code[10] & 0x0F;

		quantityBBCHRRAM       = (code[11] & 0xF0) >> 4;
		quantityNBCHRRAM       = code[11] & 0x0F;
		
		region                 = ((code[12] & 0x02) == 1) ? Region.BOTH : Region.values()[code[12] & 0x01];
		
		VsHardware             = code[13];
		
		// Crop of the header.
		prg = Arrays.copyOfRange(code, 16, 16 + programROMPages * 0x4000);
		chr = Arrays.copyOfRange(code, 16 + programROMPages * 0x4000, 16 + programROMPages * 0x4000 + characterROMpages * 0x2000);
	}
}
