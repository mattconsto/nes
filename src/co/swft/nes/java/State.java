package co.swft.nes.java;

import java.util.Arrays;

import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.Logger;

import co.swft.nes.enums.AddressingMode;
import co.swft.util.BitTools;
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
	public byte    s     = (byte) 0x34;			// Status register
	
	private Logger logger;

	public State(Log log, NESCartridge game, RicohPPU ppu, RicohAPU apu) {
		this.logger = new AlertLogger(log, "Sta");
		
		this.game = game;
		this.ppu = ppu;
		this.apu = apu;
		
		// Read the Reset Vector
		this.pc = rstVector();
		logger.info("Reset vector loaded as %x", this.pc);
	}
	
	public State(NESCartridge game, RicohPPU ppu, RicohAPU apu, byte[] ram, short pc, byte sp, byte a, byte x, byte y, byte s, Log log) {
		this(log, game, ppu, apu);

		this.ram = ram;
		this.pc = pc;
		this.sp = sp;
		this.a = a;
		this.x = x;
		this.y = y;
		this.s = s;
	}
	
	public short nmiVector() {return Unsigned.make(readMemoryMap(0xfffa), readMemoryMap(0xfffb));}
	
	public short rstVector() {return Unsigned.make(readMemoryMap(0xfffc), readMemoryMap(0xfffd));}
	
	public short irqVector() {return Unsigned.make(readMemoryMap(0xfffe), readMemoryMap(0xffff));}

	/*
	 * Methods to retrieve bits from the status register. Calling them will return a boolean value
	 * representing the selected bit from the status register.
	 */
	public boolean getCarryFlag()           {return BitTools.getBit(this.s, 0);}
	public boolean getZeroFlag()            {return BitTools.getBit(this.s, 1);}
	public boolean getInterruptFlag()       {return BitTools.getBit(this.s, 2);}
	public boolean getDecimalFlag()         {return BitTools.getBit(this.s, 3);}
	public boolean getBreakFlag()           {return BitTools.getBit(this.s, 4);}
	public boolean getOverflowFlag()        {return BitTools.getBit(this.s, 5);}
	public boolean getNegativeFlag()        {return BitTools.getBit(this.s, 6);}
	
	/*
	 * Methods to set bits in the status register. Calling them will set the selected bit in the 
	 * status register to the value v.
	 */
	public void setCarryFlag(boolean v)     {this.s = BitTools.setBit(this.s, 0, v);}
	public void setZeroFlag(boolean v)      {this.s = BitTools.setBit(this.s, 1, v);}
	public void setInterruptFlag(boolean v) {this.s = BitTools.setBit(this.s, 2, v);}
	public void setDecimalFlag(boolean v)   {this.s = BitTools.setBit(this.s, 3, v);}
	public void setBreakFlag(boolean v)     {this.s = BitTools.setBit(this.s, 4, v);}
	public void setOverflowFlag(boolean v)  {this.s = BitTools.setBit(this.s, 5, v);}
	public void setNegativeFlag(boolean v)  {this.s = BitTools.setBit(this.s, 6, v);}
	
	/*
	 * Two methods that allow you too simply give them the byte, and they will calculate the flag
	 * themselves. Saves a little typing.
	 */
	public void setZeroFlag(byte d)         {setZeroFlag((d & 0xff) == 0);}
	public void setNegativeFlag(byte d)     {setNegativeFlag((d & 0x80) != 0);}
	

	/**
	 * Pushes the input byte to the stack, decreasing the stack pointer. In this CPU, the stack is a
	 * descending and empty stack, meaning it starts from the top and always points to the next
	 * empty spot in the stack.
	 * @param input The byte we want to push to the stack.
	 */
	public void pushStack(byte input) {
		this.ram[0x0100 + (this.sp & 0xFF)] = input;
//		logger.debug("Push %02x %02x", this.sp, this.ram[0x0100 + (this.sp & 0xFF)]);
		this.sp = (byte) ((this.sp & 0xFF) - 1);
	}
	
	/**
	 * Pulls the next byte from the stack, increasing the stack pointer. In this CPU, the stack is a
	 * descending and empty stack, meaning it starts from the top and always points to the next
	 * empty spot in the stack.
	 * @return The byte pulled from the stack.
	 */
	public byte pullStack() {
		this.sp = (byte) ((this.sp & 0xFF) + 1);
//		logger.debug("Pull %02x %02x", this.sp, this.ram[0x0100 + (this.sp & 0xFF)]);
		return this.ram[0x0100 + (this.sp & 0xFF)];
	}
	
	/**
	 * Get a byte from the memory map.
	 * @param location Absolute location of the byte we want to find.
	 * @return A byte from the location specified.
	 */
	public byte readMemoryMap(short location) {
		int l = location & 0xFFFF;
		
		if       (l < 0x2000) {
		    // Direct work ram. Mirrored 3 times
			return this.ram[l % 0x800];
		} else if(l < 0x4000) {
			// PPU Control Registers. Mirrored 1023 times
			l = (short) (l % 8);
			switch(l) {
				case 0: // PPU Control Register 1
					logger.warn("Write only c[0]!"); break;
				case 1: // PPU Control Register 2
					logger.warn("Write only c[1]!"); break;
				case 2: // PPU Status Register
					byte temp  = this.ppu.status;
					// Clear VBLANK
					this.ppu.status = BitTools.setBit(temp, 7, false);
					return temp;
				case 3: // Sprite Memory Access
					logger.warn("Write only c[3]!"); break;
				case 4: // Sprite Memory Data
					return this.ppu.OAMRAM[this.ppu.oamAddress & 0xFF];
				case 5: // Background Scroll
					logger.warn("Write only c[5]!"); break;
				case 6: // PPU Memory Address
					logger.warn("Write only c[6]!"); break;
				case 7: // PPU Memory Data
					this.ppu.address += BitTools.getBit(this.ppu.status, 2) ? 32 : 1;
					return this.ppu.videoRAM[this.ppu.address & 0xFF];
			}
		} else if(l < 0x4020) {
			// Registers (Mostly APU)
			l = (short) (l - 0x4000);
			switch(l) {
				// Sound (0x4000-0x400F)
				// DMC (0x4010-0x4013)
				case 0x4014: // Sprite DMA Memory Access
					logger.warn("Write only io[14]!"); break;
				// Sound (0x4015) - Toggle channels
				// Gamepad (0x4016-0x4017)
				default:
					logger.warn("Sound not implemented");
					return 0;
			}
		} else if(l < 0x6000) {
			// Cartridge Expansion ROM
			logger.warn("Cartridge Expansion ROM not implemented");
			return 0;
		} else if(l < 0x8000) {
			// SRAM
			return this.game.save[l - 0x6000];
		} else {
			// PRG-ROM
			//System.out.format("read from %x = %x%n", (l - 0x8000) % game.prg.length, game.prg[(l - 0x8000) % game.prg.length]);
			return this.game.PRG_ROM[(l - 0x8000) % this.game.PRG_ROM.length];
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
		//System.out.format("Writing %X into %X%n", v, l);
		
		if       (l < 0x2000) {
		    // Direct work ram. Mirrored 3 times
			this.ram[l % 0x800] = v;
		} else if(l < 0x4000) {
			// PPU Control Registers. Mirrored 1023 times
			l = (short) ((l - 0x2000) % 8);
			switch(l) {
				case 0: // PPU Control Register 1
					this.ppu.controller = v; break;
				case 1: // PPU Control Register 2
					this.ppu.mask = v; break;
				case 2: // PPU Status Register
					logger.warn("Read only c[2]!"); break;
				case 3: // Sprite Memory Access
					this.ppu.oamAddress = v; break;
				case 4: // Sprite Memory Data
					this.ppu.OAMRAM[this.ppu.oamAddress & 0xFF] = v;
					this.ppu.oamAddress++;
					break;
				case 5: // Background Scroll
					this.ppu.scroll = v; break;
				case 6: // PPU Memory Address
					//System.out.println("Addr  " + Integer.toHexString(v));
					if(this.ppu.addressState) {
						this.ppu.address = (this.ppu.address & 0x00ff) + (v << 8);
					} else {
						this.ppu.address = (this.ppu.address & 0xff00) + v;
					}
					this.ppu.addressState = !this.ppu.addressState;
					break;
				case 7: // PPU Memory Data
					//System.out.println("Write " + Integer.toHexString(v));
					this.ppu.writeMemoryMap(this.ppu.address & 0xffff, v);
					this.ppu.address += BitTools.getBit(this.ppu.status, 2) ? 32 : 1;
					break;
			}
		} else if(l < 0x4020) {
			// Registers (Mostly APU)
			l = (short) (l - 0x4000);
			switch(l) {
				// Sound (0x4000-0x400F)
				// DMC (0x4010-0x4013)
				// Sprite (0x4014)
				case 0x14:
					logger.warn("not implemented\n");
					break;
				// Sound (0x4015) - Toggle channels
				// Gamepad (0x4016-0x4017)
				default:
					logger.warn("Sound not implemented");
			}
		} else if(l < 0x6000) {
			// Cartridge Expansion ROM
			logger.warn("Cannot write to Cartridge ROM: " + l);
		} else if(l < 0x8000) {
			// SRAM
			this.game.save[l - 0x6000] = v;
		} else {
			// PRG-ROM
			logger.warn("Cannot write to PRG-ROM: " + l);
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

	private AddressingMode defaultAddressing = AddressingMode.Immediate;
	private int            defaultOffset     = 0;
	
	public short address()                                         {return address(defaultAddressing, defaultOffset);}
	public short address(AddressingMode mode)                      {return address(mode, defaultOffset);}
	public short address(int offset)                               {return address(defaultAddressing, offset);}
	public short address(AddressingMode mode, int offset)          {
		switch (mode) {
			case Implied:     logger.error("Cannot get the address of an Implied Instruction!"); return (short) 0;
			case Accumulator: logger.error("Cannot get the address of the Accumulator"); return (short) 0;
			case Relative:    return (short) (offset + (this.pc & 0xffff) + read(0));
			case Immediate:   return (short) (offset + (this.pc & 0xffff) + 1);
			case ZeroPage:    return (short) (offset + (read(0) & 0xff));
			case ZeroPageX:   return (short) (offset + (((address(AddressingMode.ZeroPage) & 0xff) + (this.x & 0xff)) & 0xff));
			case ZeroPageY:   return (short) (offset + (((address(AddressingMode.ZeroPage) & 0xff) + (this.y & 0xff)) & 0xff)); 
			case Absolute:    return (short) (offset + ((read(0) & 0xff) | ((read(1) & 0xff) << 8)));
			case AbsoluteX:   return (short) (offset + (address(AddressingMode.Absolute) & 0xffff) + (this.x & 0xff));
			case AbsoluteY:   return (short) (offset + (address(AddressingMode.Absolute) & 0xffff) + (this.y & 0xff));
			case Indirect:    return (short) (offset + ((read(AddressingMode.Absolute,  0) & 0xff) | ((read(AddressingMode.Absolute,  1) & 0xff) << 8)));
			case IndirectX:   return (short) (offset + ((read(AddressingMode.ZeroPageX, 0) & 0xff) | ((read(AddressingMode.ZeroPageX, 1) & 0xff) << 8)));
			case IndirectY:   return (short) (offset + ((read(AddressingMode.ZeroPage,  0) & 0xff) | ((read(AddressingMode.ZeroPage,  1) & 0xff) << 8)) + (this.y & 0xff));
			default:          logger.error("Invalid addressing mode!"); return (short) 0;
		}
	}	
	
	public byte read()                                             {return read(defaultAddressing, defaultOffset);}
	public byte read(AddressingMode mode)                          {return read(mode, defaultOffset);}
	public byte read(int offset)                                   {return read(defaultAddressing,offset);}
	public byte read(AddressingMode mode, int offset)              {
		switch (mode) {
			case Implied:     logger.error("cannot read the value of an Implied Instruction!"); return (byte) 0;
			case Accumulator: return this.a;
			default:          return readMemoryMap(address(mode, offset));
		}
	}
	
	public void write(byte value)                                  {write(defaultAddressing, defaultOffset, value);}
	public void write(AddressingMode mode, byte value)             {write(mode, defaultOffset, value);}
	public void write(int offset, byte value)                      {write(defaultAddressing, offset, value);}
	public void write(AddressingMode mode, int offset, byte value) {
		switch (mode) {
			case Implied:     logger.error("Cannot write to an Implied Instruction!"); break;
			case Accumulator: this.a = value; break;
			default:          writeMemoryMap(address(mode, offset), value); break;
		}
	}

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
	    return new State(game, ppu, apu, ram, pc, sp, a, x, y, s, logger.log);
	}
}