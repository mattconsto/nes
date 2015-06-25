package co.swft.nes.java;

import java.awt.Color;
import java.awt.GraphicsEnvironment;
import java.awt.GridBagLayout;
import java.awt.image.BufferedImage;

import javax.swing.*;

import co.swft.common.BitTools;

import java.awt.GridBagConstraints;


/**
 * Ricoh PPU
 * 
 * https://en.wikipedia.org/wiki/Picture_Processing_Unit
 * https://en.wikipedia.org/wiki/Tile-based_video_game
 * http://wiki.nesdev.com/w/index.php/PPU_power_up_state
 * http://wiki.nesdev.com/w/index.php/PPU_registers
 * https://en.wikibooks.org/wiki/NES_Programming/Memory_Map
 * 
 * @author Matthew Consterdine
 */
public class RicohPPU implements Runnable {
	// Hardware
	public NESCartridge game;
	
	// RAM
	public byte[] videoRAM  = new byte[2 * 1024];
	public byte[] OAMRAM    = new byte[256];
	public byte[] palletRAM = new byte[32];
	
	// Registers
	public byte controller = 0;
	public byte mask       = 0;
	public byte status     = (byte) 0x80;
	public byte oamAddress = 0;
	public byte oamData    = 0;
	public byte scroll     = 0;
	public int  address    = 0;
	public boolean addressState = true;
	
	// Misc stuff
	private boolean running      = false;
	private JFrame frame         = new JFrame();
    private BufferedImage image  = new BufferedImage(256, 240, BufferedImage.TYPE_INT_RGB);
    private int frameRate        = 60;

	/**
	 * Get a byte from the memory map.
	 * @param location Absolute location of the byte we want to find.
	 * @return A byte from the location specified.
	 */
	public byte readMemoryMap(short location) {
		int l = location & 0xFFFF;
		
		if       (l < 0x2000) {
			// 2CHR Banks. Pattern tables for sprites and background.
			return game.chr[l];
		} else if(l < 0x3000) {
			// 4 Name tables
			if(game.Mirroring) {
				// Horizonal Mirroring
				if(l < 0x2400) {
					return videoRAM[l % 0x400];
				} else if(l < 0x2800) {
					return videoRAM[l % 0x400];
				} else if(l < 0x2C00) {
					return videoRAM[l % 0x400 + 0x400];
				} else {
					return videoRAM[l % 0x400 + 0x400];
				}
			} else {
				// Verical Mirroring
				if(l < 0x2400) {
					return videoRAM[l % 0x400];
				} else if(l < 0x2800) {
					return videoRAM[l % 0x400 + 0x400];
				} else if(l < 0x2C00) {
					return videoRAM[l % 0x400];
				} else {
					return videoRAM[l % 0x400 + 0x400];
				}
			}
		} else if(l < 0x4000) {
	        // Pallete RAM indexes
			return palletRAM[l % 0x20];
		} else {
			System.out.println("!!! [PPU] Invalid Address.");
		}
		return 0;
	}

	/**
	 * Get a byte from the memory map.
	 * @param location Absolute location of the byte we want to find.
	 * @return A byte from the location specified.
	 */
	public byte readMemoryMap(int location) {
		return readMemoryMap((short) location);
	}
	
	/**
	 * Sets a byte at a specified location to a specified value.
	 * @param location Absolute location of the byte we want to set.
	 * @param v Value we want to set the byte to.
	 */
	public void writeMemoryMap(short location, byte v) {
		int l = location & 0xFFFF;
		
		if       (l < 0x2000) {
			// 2CHR Banks. Pattern tables for sprites and background.
			game.chr[l] = v;
		} else if(l < 0x3000) {
			// 4 Name tables
			if(game.Mirroring) {
				// Horizonal Mirroring
				if(l < 0x2400) {
					videoRAM[l % 0x400] = v;
				} else if(l < 0x2800) {
					videoRAM[l % 0x400] = v;
				} else if(l < 0x2C00) {
					videoRAM[l % 0x400 + 0x400] = v;
				} else {
					videoRAM[l % 0x400 + 0x400] = v;
				}
			} else {
				// Verical Mirroring
				if(l < 0x2400) {
					videoRAM[l % 0x400] = v;
				} else if(l < 0x2800) {
					videoRAM[l % 0x400 + 0x400] = v;
				} else if(l < 0x2C00) {
					videoRAM[l % 0x400] = v;
				} else {
					videoRAM[l % 0x400 + 0x400] = v;
				}
			}
		} else if(l < 0x4000) {
	        // Pallete RAM indexes
			palletRAM[l % 0x20] = v;
		} else {
			System.out.println("!!! [PPU] Invalid Address.");
		}
	}

	/**
	 * Sets a byte at a specified location to a specified value.
	 * @param location Absolute location of the byte we want to set.
	 * @param v Value we want to set the byte to.
	 */
	public void writeMemoryMap(int location, byte v) {
		writeMemoryMap((short) location, v);
	}

	@SuppressWarnings("unused")
    public void run() {
		// Get the monitors refresh rate
	    int fps = GraphicsEnvironment.getLocalGraphicsEnvironment().getScreenDevices()[0].getDisplayMode().getRefreshRate();
	    if(fps != 0) frameRate = fps;
	    System.out.format("    [GPU] Running at %sHz%n", frameRate);

		running = true;
		
		while(running) {
			long startTime = System.currentTimeMillis();
			
			status = BitTools.toggleBit(status, 7);
			
    		// Draw solid background
    		for(int x = 0; x < image.getWidth(); x++) {
    			for(int y = 0; y < image.getHeight(); y++) {
    				image.setRGB(x, y, palletToRGB(readMemoryMap(0x3F00)));
    			}
    		}
    		
    		// Weird stuff involving the left
    		
    		// Draw background
    		if(BitTools.getBit(mask, 3)) {
    			int bgAddress = BitTools.getBit(controller, 4) ? 0x1000 : 0x0000; // Ignored in 8x16 mode.
    			
    			// Iterate over each nametable
    			//for(int i = 0; i < 4; i++) {
    				// Each cell
    				for(int x = 0; x < 30; x++) {
    					for(int y = 0; y < 32; y++) {
    						byte patternid = readMemoryMap(0x2000 + x + y * 30);
    						if(patternid != 0) {
    		    				// For each pixel
    		    				for(int j = 0; j < 8; j++) { // row
    		    					byte planea = readMemoryMap((patternid << 4) + j);
    		    					byte planeb = readMemoryMap((patternid << 4) + j + 8);
    		    					for(int k = 0; k < 8; k++) { // column
    		    						// Calculate color
    		    						int color = 0;
    		    						if(BitTools.getBit(planea, k)) color += 1;
    		    						if(BitTools.getBit(planeb, k)) color += 2;
    		    						
    		    						if(color > 0) {
    		    		    				image.setRGB(x*8+(8-k), y*8+j, 0xffffff);
    		    						}
    		    					}
    		    				}
    						}
    					}
    				}
    			//}
    				
    		}
    		
    		// Draw sprites
    		if(BitTools.getBit(mask, 4) || true) {
    			boolean spriteSize    = BitTools.getBit(controller, 5);
    			int     spriteAddress = BitTools.getBit(controller, 3) ? 0x1000 : 0x0000; // Ignored in 8x16 mode.
    			
    			for(int i = 0; i < 256; i+= 4) {
    				byte xpos  = OAMRAM[i + 3];
    				byte ypos  = OAMRAM[i];
    				boolean bank = BitTools.getBit(OAMRAM[i + 1], 1);
    				byte index = (byte) (OAMRAM[i + 1] & 0xfc >> 2);
    				
    				boolean flipH    = BitTools.getBit(OAMRAM[i + 2], 6);
    				boolean flipV    = BitTools.getBit(OAMRAM[i + 2], 7);
    				boolean priority = BitTools.getBit(OAMRAM[i + 2], 5);
    				int     pallet   = OAMRAM[i + 2] & 0x03;
    				
					for(int j = 0; j < 8; j++) {
						byte data = readMemoryMap(spriteAddress + j);
						for(int k = 0; k < 8; k++) {
							if(BitTools.getBit(data, k))
								image.setRGB(xpos + j, ypos + k, 0xFFFFFF);
						}
					}
    			}
    		}
    		
    		// Convert image to greyscale
    		if(BitTools.getBit(mask, 0)) {
    			for(int x = 0; x < image.getWidth(); x++) {
    				for(int y = 0; y < image.getHeight(); y++) {
    					int rgb   = image.getRGB(x, y);
    					byte grey = (byte) (0.2989 * (rgb & 0xFF0000 >> 16) + 0.5870 * (rgb & 0x00FF00 >> 8) + 0.1140 * (rgb & 0x00FF >> 0));
    					rgb       = grey + (grey >> 8) + (grey >> 16);
    					image.setRGB(x, y, rgb);
    				}
    			}
    		}
    		
    		// Intensify reds (and darken other colours)
    		if(BitTools.getBit(mask, 5)) {
    			for(int x = 0; x < image.getWidth(); x++) {
    				for(int y = 0; y < image.getHeight(); y++) {
    					int  rgb = image.getRGB(x, y);
    					byte a[] = {(byte) (rgb & 0xFF0000 >> 16), (byte) (rgb & 0x00FF00 >> 8), (byte) (rgb & 0x00FF >> 0)};
    					a[0]    *= 1.2;
    					a[1]    *= 0.8;
    					a[2]    *= 0.8;
    					rgb      = a[0] << 16 + a[1] << 8 + a[0];
    					image.setRGB(x, y, rgb);
    				}
    			}
    		}
    		
    		// Intensify greens (and darken other colours)
    		if(BitTools.getBit(mask, 6)) {
    			for(int x = 0; x < image.getWidth(); x++) {
    				for(int y = 0; y < image.getHeight(); y++) {
    					int  rgb = image.getRGB(x, y);
    					byte a[] = {(byte) (rgb & 0xFF0000 >> 16), (byte) (rgb & 0x00FF00 >> 8), (byte) (rgb & 0x00FF >> 0)};
    					a[0]    *= 0.8;
    					a[1]    *= 1.2;
    					a[2]    *= 0.8;
    					rgb      = a[0] << 16 + a[1] << 8 + a[0];
    					image.setRGB(x, y, rgb);
    				}
    			}
    		}
    		
    		// Intensify blues (and darken other colours)
    		if(BitTools.getBit(mask, 7)) {
    			for(int x = 0; x < image.getWidth(); x++) {
    				for(int y = 0; y < image.getHeight(); y++) {
    					int  rgb = image.getRGB(x, y);
    					byte a[] = {(byte) (rgb & 0xFF0000 >> 16), (byte) (rgb & 0x00FF00 >> 8), (byte) (rgb & 0x00FF >> 0)};
    					a[0]    *= 0.8;
    					a[1]    *= 0.8;
    					a[2]    *= 1.2;
    					rgb      = a[0] << 16 + a[1] << 8 + a[0];
    					image.setRGB(x, y, rgb);
    				}
    			}
    		}
    		
    		frame.repaint();
    		
    		long delta = (1000 / frameRate) - (System.currentTimeMillis() - startTime);
    		if(delta > 0) try {
	            Thread.sleep(delta);
            } catch (InterruptedException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
            }
		}
	}
	
	public static int palletToRGB(byte input) {
		return new int[] {	755,637,700,447,044,120,222,704,777,333,750,503,403,660,320,777,
                			357,653,310,360,467,657,764,027,760,276,000,200,666,444,707,014,
                			003,567,757,070,077,022,053,507,000,420,747,510,407,006,740,000,
                			000,140,555,031,572,326,770,630,020,036,040,111,773,737,430,473}[input];
	}
	
	public void stop() {
		running = false;
	}
	
	public RicohPPU(NESCartridge game) {
		this.game = game;

		frame.getContentPane().setBackground(Color.BLACK);
        frame.getContentPane().add(new JLabel(new ImageIcon(image)));
        frame.pack();
		frame.setLocationRelativeTo(null);
		frame.setTitle("Emulator");
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
}
