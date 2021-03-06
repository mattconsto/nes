package co.swft.nes.java;

import java.awt.GraphicsEnvironment;

import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.Logger;

import co.swft.nes.abstracts.Controlable;
import co.swft.util.BitTools;
import javafx.animation.AnimationTimer;
import javafx.scene.canvas.Canvas;
import javafx.scene.image.PixelReader;
import javafx.scene.image.PixelWriter;
import javafx.scene.image.WritableImage;


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
public class RicohPPU extends Controlable {
	private Logger logger;
	
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
    private WritableImage image  = new WritableImage(256, 240);
    private PixelReader   imageReader = image.getPixelReader();
    private PixelWriter   imageWriter = image.getPixelWriter();
    private Canvas canvas;
    private int frameRate        = 60;

    public byte[] readMemoryMapRange(int location, int length) {
    	return readMemoryMapRange((short) location, (short) length);
    }
    
    public byte[] readMemoryMapRange(short location, short length) {
    	byte[] bytes = new byte[length];
    	for(short i = 0; i < length; i++) bytes[i] = readMemoryMap(location + i);
    	return bytes;
    }
    
	/**
	 * Get a byte from the memory map.
	 * @param location Absolute location of the byte we want to find.
	 * @return A byte from the location specified.
	 */
	public byte readMemoryMap(short location) {
		int l = location & 0xFFFF;
		
		if       (l < 0x2000) {
			// 2CHR Banks. Pattern tables for sprites and background.
			return game.CHR_ROM[l];
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
			logger.warn("Invalid Address.");
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
			game.CHR_ROM[l] = v;
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
			logger.warn("Invalid Address.");
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
	    logger.info("Running at %sHz", frameRate);
		
	    AnimationTimer timer = new AnimationTimer() {
			@Override public void handle(long now) {
				status = BitTools.setBit(status, 7, true);
				
				int bg = palletToRGB(readMemoryMap(0x3F00));
				
	    		// Draw solid background
	    		for(int x = 0; x < image.getWidth(); x++) {
	    			for(int y = 0; y < image.getHeight(); y++) {
	    				imageWriter.setArgb(x, y, bg);
	    			}
	    		}
	    		
	    		// Weird stuff involving the left
	    		
	    		// Draw background
	    		if(BitTools.getBit(mask, 3)) {
	    			int bgAddress = BitTools.getBit(controller, 4) ? 0x1000 : 0x0000; // Ignored in 8x16 mode.
	    			
	    			// Iterate over each nametable
	    			//for(int i = 0; i < 4; i++) {
	    				// Each cell
	    				for(int x = 0; x < 32; x++) {
	    					for(int y = 0; y < 30; y++) {
	    						byte sprite = readMemoryMap(0x2000 + x + y * 32);
	    						if(sprite != 0) {
	    				    		for(int line = 0; line < 8; line++) {
	    								byte plane1 = readMemoryMap(sprite*16 + line);
	    								byte plane2 = readMemoryMap(sprite*16 + line + 8);
	    								
	    								for(int bit = 0; bit < 8; bit++) {
	    									int  value = ((plane1 >>> (7 - bit)) & 1) | ((plane2 >>> (7 - bit)) & 1) * 2;
	    									byte color = readMemoryMap(value == 0 ? 0x3f00 : 0x3f10 + value);
	    									imageWriter.setArgb(x*8 + bit, y*8 + line, RicohPPU.palletToRGB(color));
	    								}
	    							}
	    						}
	    					}
	    				}
	    			//}		
	    		}
	    		
//	    		// Draw sprites
//	    		if(BitTools.getBit(mask, 4) || true) {
//	    			boolean spriteSize    = BitTools.getBit(controller, 5);
//	    			int     spriteAddress = BitTools.getBit(controller, 3) ? 0x1000 : 0x0000; // Ignored in 8x16 mode.
//	    			
//	    			for(int i = 0; i < 256; i+= 4) {
//	    				byte xpos  = OAMRAM[i + 3];
//	    				byte ypos  = OAMRAM[i];
//	    				boolean bank = BitTools.getBit(OAMRAM[i + 1], 1);
//	    				byte index = (byte) (OAMRAM[i + 1] & 0xfc >>> 2);
//	    				
//	    				boolean flipH    = BitTools.getBit(OAMRAM[i + 2], 6);
//	    				boolean flipV    = BitTools.getBit(OAMRAM[i + 2], 7);
//	    				boolean priority = BitTools.getBit(OAMRAM[i + 2], 5);
//	    				int     pallet   = OAMRAM[i + 2] & 0x03;
//	    				
//						for(int j = 0; j < 8; j++) {
//							byte data = readMemoryMap(spriteAddress + j);
//							for(int k = 0; k < 8; k++) {
//								if(BitTools.getBit(data, k))
//									imageWriter.setArgb(xpos + j, ypos + k, 0xFFFFFF);
//							}
//						}
//	    			}
//	    		}
	    		
	    		// Convert image to greyscale
	    		if(BitTools.getBit(mask, 0)) {
	    			for(int x = 0; x < image.getWidth(); x++) {
	    				for(int y = 0; y < image.getHeight(); y++) {
	    					int rgb   = imageReader.getArgb(x, y);
	    					byte grey = (byte) (0.2989 * (rgb & 0xFF0000 >>> 16) + 0.5870 * (rgb & 0x00FF00 >>> 8) + 0.1140 * (rgb & 0x00FF >>> 0));
	    					rgb       = grey + (grey >>> 8) + (grey >>> 16);
	    					imageWriter.setArgb(x, y, rgb);
	    				}
	    			}
	    		}
	    		
	    		// Intensify reds (and darken other colours)
	    		if(BitTools.getBit(mask, 5)) {
	    			for(int x = 0; x < image.getWidth(); x++) {
	    				for(int y = 0; y < image.getHeight(); y++) {
	    					int  rgb = imageReader.getArgb(x, y);
	    					byte a[] = {(byte) (rgb & 0xFF0000 >>> 16), (byte) (rgb & 0x00FF00 >>> 8), (byte) (rgb & 0x00FF >>> 0)};
	    					a[0]    *= 1.2;
	    					a[1]    *= 0.8;
	    					a[2]    *= 0.8;
	    					rgb      = a[0] << 16 + a[1] << 8 + a[0];
	    					imageWriter.setArgb(x, y, rgb);
	    				}
	    			}
	    		}
	    		
	    		// Intensify greens (and darken other colours)
	    		if(BitTools.getBit(mask, 6)) {
	    			for(int x = 0; x < image.getWidth(); x++) {
	    				for(int y = 0; y < image.getHeight(); y++) {
	    					int  rgb = imageReader.getArgb(x, y);
	    					byte a[] = {(byte) (rgb & 0xFF0000 >>> 16), (byte) (rgb & 0x00FF00 >>> 8), (byte) (rgb & 0x00FF >>> 0)};
	    					a[0]    *= 0.8;
	    					a[1]    *= 1.2;
	    					a[2]    *= 0.8;
	    					rgb      = a[0] << 16 + a[1] << 8 + a[0];
	    					imageWriter.setArgb(x, y, rgb);
	    				}
	    			}
	    		}
	    		
	    		// Intensify blues (and darken other colours)
	    		if(BitTools.getBit(mask, 7)) {
	    			for(int x = 0; x < image.getWidth(); x++) {
	    				for(int y = 0; y < image.getHeight(); y++) {
	    					int  rgb = imageReader.getArgb(x, y);
	    					byte a[] = {(byte) (rgb & 0xFF0000 >>> 16), (byte) (rgb & 0x00FF00 >>> 8), (byte) (rgb & 0x00FF >>> 0)};
	    					a[0]    *= 0.8;
	    					a[1]    *= 0.8;
	    					a[2]    *= 1.2;
	    					rgb      = a[0] << 16 + a[1] << 8 + a[0];
	    					imageWriter.setArgb(x, y, rgb);
	    				}
	    			}
	    		}
	    		
	    		if(canvas != null && image != null) {
	    			canvas.getGraphicsContext2D().drawImage(image, 0, 0, canvas.getWidth(), canvas.getHeight());
	    		} else {
	    			logger.warn("Unable to update picture");
	    		}

				status = BitTools.setBit(status, 7, false);
				
				if(stopFlag) stop();
			}
		};
		
		timer.start();
	}
	
	private static int[] pallet = new int[] {0xFF7C7C7C, 0xFF0000FC, 0xFF0000BC, 0xFF4428BC, 0xFF940084, 0xFFA80020, 0xFFA81000, 0xFF881400, 0xFF503000, 0xFF007800, 0xFF006800, 0xFF005800, 0xFF004058, 0xFF000000, 0xFF000000, 0xFF000000,
			  0xFFBCBCBC, 0xFF0078F8, 0xFF0058F8, 0xFF6844FC, 0xFFD800CC, 0xFFE40058, 0xFFF83800, 0xFFE45C10, 0xFFAC7C00, 0xFF00B800, 0xFF00A800, 0xFF00A844, 0xFF008888, 0xFF000000, 0xFF000000, 0xFF000000,
			  0xFFF8F8F8, 0xFF3CBCFC, 0xFF6888FC, 0xFF9878F8, 0xFFF878F8, 0xFFF85898, 0xFFF87858, 0xFFFCA044, 0xFFF8B800, 0xFFB8F818, 0xFF58D854, 0xFF58F898, 0xFF00E8D8, 0xFF787878, 0xFF000000, 0xFF000000,
			  0xFFFCFCFC, 0xFFA4E4FC, 0xFFB8B8F8, 0xFFD8B8F8, 0xFFF8B8F8, 0xFFF8A4C0, 0xFFF0D0B0, 0xFFFCE0A8, 0xFFF8D878, 0xFFD8F878, 0xFFB8F8B8, 0xFFB8F8D8, 0xFF00FCFC, 0xFFF8D8F8, 0xFF000000, 0xFF000000};
	
	public static int palletToRGB(byte input) {
		return pallet[(input & 0xff) % pallet.length];
	}
	
	public RicohPPU(Log log, Canvas canvas, NESCartridge game) {
		this.logger = new AlertLogger(log, "PPU");
		this.game  = game;
		this.canvas = canvas;
		
		logger.info("Created");
	}
}
