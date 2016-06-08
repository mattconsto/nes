package co.swft.nes.java;

import java.util.Arrays;

import co.swft.util.TableBuilder;

public class State implements Cloneable {
	// Hardware
	public NESCartridge game;
	public RicohPPU     ppu;
	public RicohAPU     apu;
	
	public byte[]  ram   = new byte[2 * 1024];	// Work RAM
	public short   pc    = (short) 0x8000;		// Program Counter
	public byte    sp    = (byte) 0xFD;			// Stack pointer
	public byte    a     = 0;					// Accumulator
	public byte    x     = 0;					// X index register
	public byte    y     = 0;					// Y index register
	public byte    s     = (byte) 0x02;			// Status register

	public State(NESCartridge game, RicohPPU ppu, RicohAPU apu, byte[] ram, short pc, byte sp, byte a, byte x, byte y, byte s) {
        this.game = game;
        this.ppu = ppu;
        this.apu = apu;
        
        this.ram = ram;
        this.pc = pc;
        this.sp = sp;
        this.a = a;
        this.x = x;
        this.y = y;
        this.s = s;
    }
	
	public State() {}

	@Override
	public String toString() {
		TableBuilder tableBuilder = new TableBuilder();
		
		tableBuilder.addRow("programCounter", Integer.toHexString(pc&0xFFFF));
		tableBuilder.addRow("stackPointer",   Integer.toHexString(0x0100 + sp&0xFF));
		tableBuilder.addRow("accumulator",    Integer.toHexString(a));
		tableBuilder.addRow("indexX",         Integer.toHexString(x));
		tableBuilder.addRow("indexY",         Integer.toHexString(y));
		tableBuilder.addRow("status",         Integer.toBinaryString(s));
		
		return tableBuilder.toString();
	}
	
	@Override
	public boolean equals(Object obj) {
		// Check that both are States
		if(obj.getClass() == State.class) {
			// Convert once to save repetition
			State other = (State) obj;
			
			return other.game.equals(this.game) &&
				   other.ppu.equals(this.ppu) &&
				   other.apu.equals(this.apu) &&
				   Arrays.equals(other.ram, this.ram) &&
				   other.pc == this.pc &&
				   other.sp == this.sp &&
				   other.a  == this.a  &&
				   other.x  == this.x  &&
				   other.y  == this.y  &&
				   other.s  == this.s;
		} else {
			return false;
		}
	}
	
	@Override
	protected State clone() {
	    return new State(game, ppu, apu, ram, pc, sp, a, x, y, s);
	}
}