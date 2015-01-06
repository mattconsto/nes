package co.swft.nes.java;
import java.awt.Color;
import java.awt.GridBagLayout;
import java.awt.image.BufferedImage;

import javax.swing.*;

import co.swft.common.BitTools;

import java.awt.GridBagConstraints;

// https://en.wikipedia.org/wiki/Picture_Processing_Unit
// https://en.wikipedia.org/wiki/Tile-based_video_game
// http://wiki.nesdev.com/w/index.php/PPU_power_up_state
// http://wiki.nesdev.com/w/index.php/PPU_registers
// https://en.wikibooks.org/wiki/NES_Programming/Memory_Map
	
public class RicohPPU {
	public NESCartridge game;
	
	public byte[] videoRAM  = new byte[2 * 1024];
	public byte[] OAMRAM    = new byte[256];
	public byte[] palletRAM = new byte[32];
	
	byte control;
	byte mask;
	byte status;
	byte oamAddress;
	byte oamData;
	byte scroll;
	byte address;
	byte data;
	
	boolean spriteZeroHits = false;
	
	
	JFrame frame        = new JFrame();
    BufferedImage image = new BufferedImage(256, 240, BufferedImage.TYPE_INT_RGB);
	
	public void update(byte[] in) {
		System.out.println("[PPU] Updated.");
	}
	
	public byte[] getUpdate() {
		return null;
	}

	public void run() {
	    //	int fps = GraphicsEnvironment.getLocalGraphicsEnvironment().getScreenDevices()[0].getDisplayMode().getRefreshRate();
	    //	fps = (fps == 0) ? 60 : fps;
		
		while(true) {
    		// Draw black background
    		for(int x = 0; x < image.getWidth(); x++) {
    			for(int y = 0; y < image.getHeight(); y++) {
    				image.setRGB(x, y, 0x000000);
    			}
    		}
    		
    		// Weird stuff involving the left
    		
    		// Draw background
    		if(BitTools.getBit(mask, 3)) {
    			int bgAddress = BitTools.getBit(control, 4) ? 0x1000 : 0x0000; // Ignored in 8x16 mode.
    			
    		}
    		
    		// Draw sprites
    		if(BitTools.getBit(mask, 4)) {
    			boolean spriteSize    = BitTools.getBit(control, 5);
    			int     spriteAddress = BitTools.getBit(control, 3) ? 0x1000 : 0x0000; // Ignored in 8x16 mode.
    
    			for(int i = 0; i < 256; i+= 4) {
    				byte xpos  = OAMRAM[i + 3];
    				byte ypos  = OAMRAM[i];
    				byte index = OAMRAM[i + 1];
    //				boolean flipX = BitTools.getBit(input, position);
    //				boolean flipY = BitTools.getBit(input, position);
    //				boolean priority = BitTools.getBit(input, position);
    //				int pallete 
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
		}
	}
	
	public RicohPPU(NESCartridge game) {
		this.game = game;
		
		frame.getContentPane().setBackground(Color.BLACK);
		frame.setSize(256, 240);
		GridBagLayout gridBagLayout = new GridBagLayout();
		gridBagLayout.columnWeights = new double[]{1.0};
		gridBagLayout.rowWeights = new double[]{1.0};
		frame.getContentPane().setLayout(gridBagLayout);
		frame.setLocationRelativeTo(null);
		frame.setTitle("Emulator");
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    //frame.setIconImage();

        JLabel label = new JLabel(new ImageIcon(image));
        label.setBounds(0, 0, frame.getWidth(), frame.getHeight());
        GridBagConstraints gbc_label = new GridBagConstraints();
        gbc_label.fill = GridBagConstraints.BOTH;
        frame.getContentPane().add(label, gbc_label);
	    
		//frame.setVisible(true);
	}
}
