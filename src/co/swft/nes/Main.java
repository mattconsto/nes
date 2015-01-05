package co.swft.nes;
import java.io.File;
import java.io.IOException;

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
	        NESFile file = new NESFile(new File("roms/Bomberman.nes"));
	        System.out.println(file);
	        Ricoh2A03CPU emulator = new Ricoh2A03CPU(file);
	        System.out.println(emulator);
	        emulator.run();
        } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
        } catch (NESFile.InvalidFileException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
        }
	}
}
