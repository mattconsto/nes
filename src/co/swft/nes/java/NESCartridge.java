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
	public final File       File;
	public final int        Program_ROM_Pages;   // 1 page = 16,384 bytes
	public final int        Character_ROM_Pages; // 1 page = 8,192 bytes
	public final boolean    Four_Screen_Mode;    // When set mirroring has no effect
	public final boolean    Trainer;           // True = 512 byte trainer at 7000-71FFh
	public final boolean    SRAM_Battery;       // Is SRAM battery backed?
	public final boolean    Mirroring;         // 0 = Horizontal, 1 = Vertical
	public final boolean    Playchoice_10;      // True = PC-10 game
	public final boolean    Vs_Unisystem;       // True =  Vs. game
	public final int        Mapper_Number;      //
	public final int        Sub_Mapper_Number;   //
	public final int        Quantity_BBPRGRAM;  // Quantity of Battery Backed RAM
	public final int        Quantity_NBPRGRAM;  // Quantity of No Battery RAM
	public final int        Quantity_BBCHRRAM;  // ''
	public final int        Quantity_NBCHRRAM;  // ''
	public final RegionCode Region;            // 
	public final byte       Vs_Hardware;        // Ewwwww
	
	public byte[] PRG_ROM;
	public byte[] CHR_ROM;

	public enum RegionCode {PAL, NTSC, BOTH}
	
	public NESCartridge(File file) throws IOException, InvalidFileException {
		super(file);
		
		this.File = file;
		
		// Initialise the save
		save = new byte[0x2000];
		
		//System.out.format("Reading file: %s (%skB)%n%n", file, file.length() / 1024);
		byte[] code = Files.readAllBytes(file.toPath());
	    
		// Check for the correct header
	    if(!new String(Arrays.copyOfRange(code, 0, 3)).equals("NES"))
	    	throw new InvalidFileException("Invalid NES byteCode.");
	    
	    // Original iNES Stuff
		int programROMPages    = Math.max(code[4], 1);
		
		int characterROMpages  = Math.max(code[5], 1);
		
		Four_Screen_Mode         = (code[6] & 0x08) == 1;
		Trainer                = (code[6] & 0x04) == 1;
		SRAM_Battery            = (code[6] & 0x02) == 1;
		Mirroring              = (code[6] & 0x01) == 1;
		
		Playchoice_10           = (code[7] & 0x02) == 1;
		Vs_Unisystem            = (code[7] & 0x01) == 1;
		
		int mapperNumber       = ((code[7] & 0xF0) >> 0) | ((code[6] & 0xF0) >> 4);
		
		// Extended NES 2.0 Stuff
		Sub_Mapper_Number        = (code[8] & 0xF0) >> 4;
		this.Mapper_Number      = ((code[8] & 0x0F) << 8) | mapperNumber;
		
		this.Program_ROM_Pages   = ((code[9] & 0x0F) << 8) | programROMPages;
		this.Character_ROM_Pages = ((code[9] & 0xF0) << 4) | characterROMpages;
		
		Quantity_BBPRGRAM       = (code[10] & 0xF0) >> 4;
		Quantity_NBPRGRAM       = code[10] & 0x0F;

		Quantity_BBCHRRAM       = (code[11] & 0xF0) >> 4;
		Quantity_NBCHRRAM       = code[11] & 0x0F;
		
		Region                 = ((code[12] & 0x02) == 1) ? RegionCode.BOTH : RegionCode.values()[code[12] & 0x01];
		
		Vs_Hardware             = code[13];
		
		// Crop of the header.
		PRG_ROM = Arrays.copyOfRange(code, 16, 16 + programROMPages * 0x4000);
		CHR_ROM = Arrays.copyOfRange(code, 16 + programROMPages * 0x4000, 16 + programROMPages * 0x4000 + characterROMpages * 0x2000);
	}
	
	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}
}
