import java.io.File;

import co.swft.nes.java.*;

/**
 * NES Emulator
 * 
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
	        NESCartridge game = new NESCartridge(new File("tools/hello/hello.nes"));
	        
	        RicohAPU apu = new RicohAPU();
	        RicohPPU ppu = new RicohPPU(game);
	        RicohCPU cpu = new RicohCPU(game, ppu, apu);
	        
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
