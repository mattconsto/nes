package co.swft.nes.java;

import java.util.Arrays;

/**
 * Ricoh APU
 * 
 * @author Matthew Consterdine
 */
public class RicohAPU implements Runnable {
	private boolean running = false;
	
	byte[] pulse1   = new byte[4];
	byte[] pulse2   = new byte[4];
	byte[] triangle = new byte[3];
	byte[] noise    = new byte[3];
	byte[] dmc      = new byte[4];
	
	byte status     = 0;
	byte counter    = 0;
	
	public void update(byte[] in) {
		if(in.length == 0x20) {
			pulse1   = Arrays.copyOfRange(in, 0x00, 0x03);
			pulse2   = Arrays.copyOfRange(in, 0x04, 0x07);
			dmc      = Arrays.copyOfRange(in, 0x10, 0x13);
			
			triangle[0] = in[0x8]; triangle[1] = in[0xA]; triangle[2] = in[0xB];
			noise[0]    = in[0xC]; noise[1]    = in[0xE]; noise[2]    = in[0xF];
			
			status   = (byte) (in[0x15] & 0xDF);
			counter  = (byte) (in[0x17] & 0xC0);
			
			System.out.println("[APU] Updated.");
		} else {
			System.err.format("[APU] Invalid length update. Got %d, expected %d.", in.length, 0x20);
		}
	}
	
	public byte[] getUpdate() {
		return null;
	}
	
	public void run() {
		running = true;
		
		while(running) {
			
		}
	}
	
	public void stop() {
		running = false;
	}
	
	@Override
	public boolean equals(Object obj) {
	    if(obj.getClass() == RicohAPU.class) {
	    	//RicohAPU other = (RicohAPU) obj;
	    	// TODO this
	    	return true;
	    } else {
	    	return false;
	    }
	}
}
