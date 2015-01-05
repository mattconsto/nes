package co.swft.nes;
import java.awt.Color;
import java.awt.GridBagLayout;
import java.awt.image.BufferedImage;

import javax.swing.*;

import java.awt.GridBagConstraints;

// https://en.wikipedia.org/wiki/Picture_Processing_Unit
// https://en.wikipedia.org/wiki/Tile-based_video_game
// http://wiki.nesdev.com/w/index.php/PPU_power_up_state
// http://wiki.nesdev.com/w/index.php/PPU_registers
// https://en.wikibooks.org/wiki/NES_Programming/Memory_Map
	
public class Ricoh2C02PPU {
	public byte[]   videoRAM  = new byte[2 * 1024];
	public byte[]   OAMRAM    = new byte[256];
	public byte[]   palletRAM = new byte[32];
	
	public byte[][] tileRAM   = new byte[2][4 * 1024];
	
	public boolean scanlineOverflow = false;
	
	public SpriteSize spriteSize  = SpriteSize.SQUARE;
	
	protected enum SpriteSize {SQUARE, RECTANGE;}
	
	byte control1            = 0;
	byte control2            = 0;
	byte status              = 0;
	byte spriteMemoryAddress = 0;
	byte spriteMemoryData    = 0;
	byte backgroundScroll    = 0;
	byte PPUMemoryAddress    = 0;
	byte PPUMemoryData       = 0;
	byte DMAAccess           = 0;
	
	
	public void update(byte[] in) {
		System.out.println("[PPU] Updated.");
	}
	
	public byte[] getUpdate() {
		return null;
	}

	public void run() {
		
	}
	
	JFrame frame = new JFrame();
    BufferedImage image = new BufferedImage(256, 240, BufferedImage.TYPE_INT_RGB);
	
	public Ricoh2C02PPU() {
		
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
