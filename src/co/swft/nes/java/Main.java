package co.swft.nes.java;

import java.io.File;

/**
 * NES Emulator
 * @author Matthew Consterdine
 */
public class Main {
	public static void main(String[] args) {
		/*
		 * CPU:
		 *  MOS Technology 6502
		 *  8bit with 16bit address bus
		 *  little-endian
		 * 
		 * Memory:
		 *  2KiB work RAM
		 *  2KiB video RAM
		 *  256B Object Attribute Memory (Hold sprites)
		 *  28B palette RAM
		 *  
		 *  32KiB program ROM (Expanded by bank switching)
		 *  may up to 16KiB expansion area
		 *  may expanded video memory
		 *  
		 * Video:
		 *  Two layers, background > sprite
		 *  sprites have 2 bits for color. 3 colors + transparency
		 *  ntsc values not rgb values
		 *  up to 64 sprites at a time. either 8x8 or 8x16
		 *  8 sprites per scan line
		 *  
		 * Audio:
		 *  eh can come later
		 *  
		 * Memory mappers:
		 *  complex
		 */
		try {
	        NESCartridge file = new NESCartridge(new File("roms/Bomberman.nes"));
	        System.out.println(file);
	        RicohCPU emulator = new RicohCPU(file, new RicohPPU(file), new RicohAPU());
	        System.out.println(emulator);
	        emulator.run();
        } catch (Exception e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
        }
	}
}
