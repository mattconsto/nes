package co.swft.nes.java;

/**
 * http://letstakeitapart.blogspot.co.uk/2011/01/lets-take-apart-nintendo-controller-nes.html
 * http://www.ti.com/lit/ds/symlink/cd4021b-q1.pdf
 * https://www.active-robots.com/fileuploader/download/download/?d=0&file=custom%2Fupload%2FFile-1312239732.pdf
 * 
 * Gamepad features a 4021 Shift register:
 * > http://www.ti.com/lit/ds/symlink/cd4021b-q1.pdf
 * 
 * @author Matthew Consterdine
 */
public class Gamepad {
	protected byte status;
	
	public void clock() {
		
	}
	
	public byte getStatus() {
		return status;
	}
}
