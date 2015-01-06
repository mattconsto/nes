package co.swft.nes.java;

import co.swft.common.BitTools;
import co.swft.common.TableBuilder;

/**
 * Ricoh CPU (2A03) Emulator for the Nintendo Entertainment System..
 * 
 * Helpful Sources:
 * 
 * * http://wiki.nesdev.com/w/index.php/NES_2.0
 * * https://en.wikipedia.org/wiki/Nintendo_Entertainment_System_technical_specifications
 * * https://en.wikipedia.org/wiki/Ricoh_2A03
 * * http://www.obelisk.demon.co.uk/6502/reference.html
 * * http://www.obelisk.demon.co.uk/6502/addressing.html
 * * http://www.obelisk.demon.co.uk/6502/registers.html
 * * https://en.wikibooks.org/wiki/NES_Programming
 * * http://tuxnes.sourceforge.net/nesmapper.txt
 * * https://en.wikipedia.org/wiki/Memory_management_controller
 * 
 * @author Matthew Consterdine
 */
public class RicohCPU {
	public NESCartridge game;
	public RicohPPU      ppu;
	public RicohAPU      apu;
	
	// RAM and Registers
	public byte[]  ram   = new byte[2 * 1024];	// Work RAM
	public short   pc    = 0;					// Program Counter
	public byte    sp    = (byte) 0xFF;			// Stack pointer
	public byte    a     = 0;					// Accumulator
	public byte    x     = 0;					// X index register
	public byte    y     = 0;					// Y index register
	public byte    s     = 2;					// Status register. Set to 2 as a starts on 0.
	public byte[]  ppuio = new byte[8];			// PPU Control registers
	public byte[]  apuio = new byte[32];		// IO registers 
	
	// List of instructions so we can display helpful info as we run through the game.
	public String[] instructionSet = {
		"BRK impl", 	"ORA X,ind", 	"??? ---", 	"??? ---", 	"??? ---", 		"ORA zpg", 		"ASL zpg", 		"??? ---", 	"PHP impl", 	"ORA #", 		"ASL A", 		"??? ---", 	"??? ---", 		"ORA abs", 		"ASL abs", 		"??? ---", 
		"BPL rel", 		"ORA ind,Y", 	"??? ---", 	"??? ---", 	"??? ---", 		"ORA zpg,X", 	"ASL zpg,X", 	"??? ---", 	"CLC impl", 	"ORA abs,Y", 	"??? ---", 		"??? ---", 	"??? ---", 		"ORA abs,X", 	"ASL abs,X", 	"??? ---", 
		"JSR abs", 		"AND X,ind", 	"??? ---", 	"??? ---", 	"BIT zpg", 		"AND zpg", 		"ROL zpg", 		"??? ---", 	"PLP impl", 	"AND #", 		"ROL A", 		"??? ---", 	"BIT abs", 		"AND abs", 		"ROL abs", 		"??? ---", 
		"BMI rel", 		"AND ind,Y", 	"??? ---", 	"??? ---", 	"??? ---", 		"AND zpg,X", 	"ROL zpg,X", 	"??? ---", 	"SEC impl", 	"AND abs,Y", 	"??? ---", 		"??? ---", 	"??? ---", 		"AND abs,X", 	"ROL abs,X", 	"??? ---", 
		"RTI impl", 	"EOR X,ind", 	"??? ---", 	"??? ---", 	"??? ---", 		"EOR zpg", 		"LSR zpg", 		"??? ---", 	"PHA impl", 	"EOR #", 		"LSR A", 		"??? ---", 	"JMP abs", 		"EOR abs", 		"LSR abs", 		"??? ---", 
		"BVC rel",	 	"EOR ind,Y", 	"??? ---", 	"??? ---", 	"??? ---", 		"EOR zpg,X", 	"LSR zpg,X", 	"??? ---", 	"CLI impl", 	"EOR abs,Y", 	"??? ---", 		"??? ---", 	"??? ---", 		"EOR abs,X", 	"LSR abs,X", 	"??? ---", 
		"RTS impl", 	"ADC X,ind", 	"??? ---", 	"??? ---", 	"??? ---", 		"ADC zpg", 		"ROR zpg", 		"??? ---", 	"PLA impl", 	"ADC #", 		"ROR A", 		"??? ---", 	"JMP ind", 		"ADC abs", 		"ROR abs", 		"??? ---", 
		"BVS rel", 		"ADC ind,Y", 	"??? ---", 	"??? ---", 	"??? ---", 		"ADC zpg,X", 	"ROR zpg,X", 	"??? ---", 	"SEI impl", 	"ADC abs,Y", 	"??? ---", 		"??? ---", 	"??? ---", 		"ADC abs,X", 	"ROR abs,X", 	"??? ---", 
		"??? ---", 		"STA X,ind", 	"??? ---", 	"??? ---", 	"STY zpg", 		"STA zpg", 		"STX zpg", 		"??? ---", 	"DEY impl", 	"??? ---", 		"TXA impl", 	"??? ---", 	"STY abs", 		"STA abs", 		"STX abs", 		"??? ---", 
		"BCC rel", 		"STA ind,Y", 	"??? ---", 	"??? ---", 	"STY zpg,X", 	"STA zpg,X", 	"STX zpg,Y", 	"??? ---", 	"TYA impl", 	"STA abs,Y", 	"TXS impl", 	"??? ---", 	"??? ---", 		"STA abs,X", 	"??? ---", 		"??? ---", 
		"LDY #", 		"LDA X,ind", 	"LDX #", 	"??? ---", 	"LDY zpg", 		"LDA zpg", 		"LDX zpg", 		"??? ---", 	"TAY impl", 	"LDA #", 		"TAX impl", 	"??? ---", 	"LDY abs", 		"LDA abs", 		"LDX abs", 		"??? ---", 
		"BCS rel",	 	"LDA ind,Y", 	"??? ---", 	"??? ---", 	"LDY zpg,X", 	"LDA zpg,X", 	"LDX zpg,Y", 	"??? ---", 	"CLV impl", 	"LDA abs,Y", 	"TSX impl", 	"??? ---", 	"LDY abs,X", 	"LDA abs,X", 	"LDX abs,Y", 	"??? ---", 
		"CPY #", 		"CMP X,ind", 	"??? ---", 	"??? ---", 	"CPY zpg", 		"CMP zpg", 		"DEC zpg", 		"??? ---", 	"INY impl", 	"CMP #", 		"DEX impl", 	"??? ---", 	"CPY abs", 		"CMP abs", 		"DEC abs", 		"??? ---", 
		"BNE rel", 		"CMP ind,Y", 	"??? ---", 	"??? ---", 	"??? ---", 		"CMP zpg,X", 	"DEC zpg,X", 	"??? ---", 	"CLD impl", 	"CMP abs,Y", 	"??? ---", 		"??? ---", 	"??? ---", 		"CMP abs,X", 	"DEC abs,X", 	"??? ---", 
		"CPX #", 		"SBC X,ind", 	"??? ---", 	"??? ---", 	"CPX zpg", 		"SBC zpg", 		"INC zpg", 		"??? ---", 	"INX impl", 	"SBC #", 		"NOP impl", 	"??? ---", 	"CPX abs", 		"SBC abs", 		"INC abs", 		"??? ---", 
		"BEQ rel", 		"SBC ind,Y", 	"??? ---", 	"??? ---", 	"??? ---", 		"SBC zpg,X", 	"INC zpg,X", 	"??? ---", 	"SED impl", 	"SBC abs,Y", 	"??? ---", 		"??? ---", 	"??? ---", 		"SBC abs,X", 	"INC abs,X", 	"??? ---"
	};

	/**
	 * Constructs a new RicohCPU.
	 * @param game NESFile
	 * @param ppu PPU
	 * @param apu APU
	 */
	public RicohCPU(NESCartridge game, RicohPPU ppu, RicohAPU apu) {
		this.game = game;
		this.ppu  = ppu;
		this.apu  = apu;
	}
	
	/**
	 * Pushes the input byte to the stack, decreasing the stack pointer. In this CPU, the stack is a
	 * descending and empty stack, meaning it starts from the top and always points to the next
	 * empty spot in the stack.
	 * @param input The byte we want to push to the stack.
	 */
	public void pushStack(byte input) {
		ram[0x0100 + sp--] = input;
	}
	
	/**
	 * Pulls the next byte from the stack, increasing the stack pointer. In this CPU, the stack is a
	 * descending and empty stack, meaning it starts from the top and always points to the next
	 * empty spot in the stack.
	 * @return The byte pulled from the stack.
	 */
	public byte pullStack() {
		return ram[0x0100 + ++sp];
	}
	
	/*
	 * Methods to retrieve bits from the status register. Calling them will return a boolean value
	 * representing the selected bit from the status register.
	 */
	public boolean getCarryFlag()           {return BitTools.getBit(s, 0);}
	public boolean getZeroFlag()            {return BitTools.getBit(s, 1);}
	public boolean getInterruptFlag()       {return BitTools.getBit(s, 2);}
	public boolean getDecimalFlag()         {return BitTools.getBit(s, 3);}
	public boolean getBreakFlag()           {return BitTools.getBit(s, 4);}
	public boolean getOverflowFlag()        {return BitTools.getBit(s, 5);}
	public boolean getNegativeFlag()        {return BitTools.getBit(s, 6);}
	
	/*
	 * Methods to set bits in the status register. Calling them will set the selected bit in the 
	 * status register to the value v.
	 */
	public void setCarryFlag(boolean v)     {s = BitTools.setBit(s, 0, v);}
	public void setZeroFlag(boolean v)      {s = BitTools.setBit(s, 1, v);}
	public void setInterruptFlag(boolean v) {s = BitTools.setBit(s, 2, v);}
	public void setDecimalFlag(boolean v)   {s = BitTools.setBit(s, 3, v);}
	public void setBreakFlag(boolean v)     {s = BitTools.setBit(s, 4, v);}
	public void setOverflowFlag(boolean v)  {s = BitTools.setBit(s, 5, v);}
	public void setNegativeFlag(boolean v)  {s = BitTools.setBit(s, 6, v);}
	
	/*
	 * Two methods that allow you too simply give them the byte, and they will calculate the flag
	 * themselves. Saves a little typing.
	 */
	public void setZeroFlag(byte d)         {s = BitTools.setBit(s, 1, d == 0);}
	public void setNegativeFlag(byte d)     {s = BitTools.setBit(s, 6, BitTools.getBit(d, 7));}
	
	/**
	 * Get a byte from the memory map.
	 * @param l Absolute location of the byte we want to find.
	 * @return A byte from the location specified.
	 */
	public byte readMemoryMap(short l) {
		if       (l < 0x2000) {
		    // Direct work ram. Mirrored 3 times
			return ram[l % 0x800];
		} else if(l < 0x4000) {
			// PPU Control Registers. Mirrored 1023 times
			ppu.update(ppuio);
			l = (short) (l % 8);
			switch(l) {
				case 0: // PPU Control Register 1
					System.err.println("[CPU] Write only c[0]!"); break;
				case 1: // PPU Control Register 2
					System.err.println("[CPU] Write only c[1]!"); break;
				case 2: // PPU Status Register
					return ppuio[2];
				case 3: // Sprite Memory Access
					System.err.println("[CPU] Write only c[3]!"); break;
				case 4: // Sprite Memory Data
					return ppuio[4];
				case 5: // Background Scroll
					System.err.println("[CPU] Write only c[5]!"); break;
				case 6: // PPU Memory Address
					System.err.println("[CPU] Write only c[6]!"); break;
				case 7: // PPU Memory Data
					return ppuio[7];
				default:
					System.err.println("[CPU] Something really bad has happened to modulo");
					return 0;
			}
		} else if(l < 0x4020) {
			// Registers (Mostly APU)
			l = (short) (l - 0x4000);
			switch(l) {
				// Sound (0x4000-0x400F)
				// DMC (0x4010-0x4013)
				case 0x4014: // Sprite DMA Memory Access
					System.err.println("[CPU] Write only io[14]!"); break;
				// Sound (0x4015) - Toggle channels
				// Gamepad (0x4016-0x4017)
				default:
					System.err.format("[CPU] Default implementation (%d)", l);
					return apuio[(l - 0x4000)];
			}
		} else if(l < 0x6000) {
			// Cartridge Expansion ROM
			System.err.println("[CPU] Cartridge Expansion ROM not implemented");
			return 0;
		} else if(l < 0x8000) {
			// SRAM
			return game.save[l - 0x6000];
		} else if(l <= 0xFFFF) {
			// PRG-ROM
			return game.prg[l - 0x8000];
		} else {
			System.err.println("[CPU] Somehow we go outside the limits of a short.");
		}
		return 0;
	}
	
	/**
	 * Sets a byte at a specified location to a specified value.
	 * @param l Absolute location of the byte we want to set.
	 * @param v Value we want to set the byte to.
	 */
	public void writeMemoryMap(short l, byte v) {
		if       (l < 0x2000) {
		    // Direct work ram. Mirrored 3 times
			ram[l % 0x800] = v;
		} else if(l < 0x4000) {
			// PPU Control Registers. Mirrored 1023 times
			ppu.update(ppuio);
			l = (short) ((l - 0x2000) % 8);
			switch(l) {
				case 0: // PPU Control Register 1
					ppuio[0] = v; break;
				case 1: // PPU Control Register 2
					ppuio[1] = v; break;
				case 2: // PPU Status Register
					System.err.println("Read only c[2]!"); break;
				case 3: // Sprite Memory Access
					ppuio[3] = v; break;
				case 4: // Sprite Memory Data
					ppuio[4] = v; break;
				case 5: // Background Scroll
					ppuio[5] = v; break;
				case 6: // PPU Memory Address
					ppuio[6] = v; break;
				case 7: // PPU Memory Data
					ppuio[7] = v; break;
			}
		} else if(l < 0x4020) {
			// Registers (Mostly APU)
			l = (short) (l - 0x4000);
			switch(l) {
				// Sound (0x4000-0x400F)
				// DMC (0x4010-0x4013)
				// Sprite (0x4014)
				case 0x14:
					ppu.update(ppuio);
					apuio[(l - 0x4000)] = v;
					break;
				// Sound (0x4015) - Toggle channels
				// Gamepad (0x4016-0x4017)
				default:
					System.err.format("[CPU] Default implementation (%d)", l);
					apuio[(l - 0x4000)] = v;
			}
		} else if(l < 0x6000) {
			// Cartridge Expansion ROM
			System.err.println("[CPU] Cartridge Expansion ROM not implemented");
		} else if(l < 0x8000) {
			// SRAM
			game.save[l - 0x6000] = v;
		} else if(l <= 0xFFFF) {
			// PRG-ROM
			game.prg[l - 0x8000] = v;
		} else {
			System.err.println("[CPU] Somehow we go outside the limits of a short.");
		}
	}
	
	public byte readImmediate() {
		return game.prg[++pc];
	}
	public byte readZeroPage() {
		return readMemoryMap(game.prg[++pc]);
	}
	public byte readZeroPageX() {
		return readMemoryMap((short) ((game.prg[++pc] + x) % 256));
	}
	public byte readZeroPageY() {
		return readMemoryMap((short) ((game.prg[++pc] + y) % 256));
	}
	public byte readAbsolute() {
		return readMemoryMap((short) (game.prg[++pc] | (game.prg[++pc] << 8)));
	}
	public byte readAbsoluteX() {
		return readMemoryMap((short) ((game.prg[++pc] | (game.prg[++pc] << 8)) + x));
	}
	public byte readAbsoluteY() {
		return readMemoryMap((short) ((game.prg[++pc] | (game.prg[++pc] << 8)) + x));
	}
	public byte readIndexedIndirect() {
		System.err.println("[CPU] readIndexedIndirect() not implemented");
		return 0;
	}
	public byte readIndirectIndexed() {
		System.err.println("[CPU] readIndirectIndexed() not implemented");
		return 0;
	}

	public void writeZeroPage(byte v) {
		writeMemoryMap(game.prg[++pc], v);
	}
	public void writeZeroPageX(byte v) {
		writeMemoryMap((short) ((game.prg[++pc] + x) % 256), v);
	}
	public void writeZeroPageY(byte v) {
		writeMemoryMap((short) ((game.prg[++pc] + y) % 256), v);
	}
	public void writeAbsolute(byte v) {
		writeMemoryMap((short) (game.prg[++pc] | (game.prg[++pc] << 8)), v);
	}
	public void writeAbsoluteX(byte v) {
		writeMemoryMap((short) ((game.prg[++pc] | (game.prg[++pc] << 8)) + x), v);
	}
	public void writeAbsoluteY(byte v) {
		writeMemoryMap((short) ((game.prg[++pc] | (game.prg[++pc] << 8)) + y), v);
	}
	public void writeIndexedIndirect(byte v) {
		System.err.println("[CPU] writeIndexedIndirect() not implemented");
	}
	public void writeIndirectIndexed(byte v) {
		System.err.println("[CPU] writeIndirectIndexed() not implemented");
	}
	
	/**
	 * Here is where it all happens. run() starts the emulation.
	 */
	public void run() {
		System.out.println("[CPU] Starting Emulation");
		
		// Run until we reach the end
		for(pc = 0; pc < game.code.length && !getBreakFlag(); pc++) {
			try{Thread.sleep(100);}catch(Exception e){}
			System.out.println("[CPU] " + instructionSet[game.prg[pc]&0xFF]);
			
			switch(game.prg[pc]&0xFF) {
				// ADC - Add with Carry
				case 0x69: {
					byte b      = readImmediate();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					a = result;
				} break;
				
				case 0x65: {
					byte b      = readZeroPage();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					writeZeroPage(result);
				} break;
				
				case 0x75: {
					byte b      = readZeroPageX();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					writeZeroPageX(result);
				} break;
				
				case 0x6D: {
					byte b      = readAbsolute();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeAbsolute(result);
				} break;
				
				case 0x7D: {
					byte b      = readAbsoluteX();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeAbsoluteX(result);
				} break;
				
				case 0x79: {
					byte b      = readAbsoluteY();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeAbsoluteY(result);
				} break;
				
				case 0x61: {
					byte b      = readIndexedIndirect();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeIndexedIndirect(result);
				} break;
				
				case 0x71: {
					byte b      = readIndexedIndirect();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeIndirectIndexed(result);
				} break;
				
				// AND - Logical AND
				case 0x29: {
					a = (byte) (a & readImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x25: {
					a = (byte) (a & readImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x35: {
					a = (byte) (a & readZeroPage());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x2D: {
					a = (byte) (a & readZeroPageX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x3D: {
					a = (byte) (a & readAbsoluteX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x39: {
					a = (byte) (a & readAbsoluteY());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x21: {
					a = (byte) (a & readIndexedIndirect());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x31: {
					a = (byte) (a & readIndirectIndexed());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				// ASL - Arithmetic Shift Left
				case 0x0A: {
					byte temp = a;
					setCarryFlag(BitTools.getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					a = temp;
				} break;
				
				case 0x06: {
					byte temp = readZeroPage();
					setCarryFlag(BitTools.getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					writeZeroPage(temp);
				} break;
				
				case 0x16: {
					byte temp = readZeroPageX();
					setCarryFlag(BitTools.getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					writeZeroPageX(temp);
				} break;
				
				case 0x0E: {
					byte temp = readAbsolute();
					setCarryFlag(BitTools.getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					writeAbsolute(temp);
				} break;
				
				case 0x1E: {
					byte temp = readAbsoluteX();
					setCarryFlag(BitTools.getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					writeAbsoluteX(temp);
				} break;
				
				// BCC - Branch if Carry Clear
				case 0x90: {
					if(!getCarryFlag()) {
						pc += readImmediate();
					} else {
						pc++;
					}
				} break;
				
				// BCS - Branch if Carry Set
				case 0xB0: {
					if(getCarryFlag()) {
						pc += readImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BEQ - Branch if Equal
				case 0xF0: {
					if(getZeroFlag()) {
						pc += readImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BIT - Bit Test
				case 0x24: {
					byte temp = (byte) (a & readZeroPage());
					setZeroFlag(temp);
					setOverflowFlag(BitTools.getBit(temp, 6));
					setNegativeFlag(temp);
				} break;
				
				case 0x2C: {
					byte temp = (byte) (a & readAbsolute());
					setZeroFlag(temp);
					setOverflowFlag(BitTools.getBit(temp, 6));
					setNegativeFlag(temp);
				} break;
				
				// BMI - Branch if Minus
				case 0x30: {
					if(getNegativeFlag()) {
						pc += readImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BNE - Branch if Not Equal
				case 0xD0: {
					if(!getZeroFlag()) {
						pc += readImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BPL - Branch if Positive
				case 0x10: {
					if(!getNegativeFlag()) {
						pc += readImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BRK - Force Interrupt
				case 0x00: {
					pushStack((byte) (pc & 0x00FF));
					pushStack((byte) ((pc & 0xFF00) >> 8));
					pushStack(s);
					setBreakFlag(true);
					pc = (short) ((game.prg[0xFFFF] << 8) | game.prg[0xFFFE]);
					System.err.println("[CPU] Force Interupt");
				} break;
				
				// BVC - Branch if Overflow Clear
				case 0x50: {
					if(!getOverflowFlag()) {
						pc += readImmediate();
					} else {
						pc++;
					}
				} break;
				
				// BVS - Branch if Overflow Set
				case 0x70: {
					if(getOverflowFlag()) {
						pc += readImmediate();
					} else {
						pc++;
					}
				} break;
				
				// CLC - Clear Carry Flag
				case 0x18: {
					setCarryFlag(false);
				} break;
				
				// CLD - Clear Decimal Mode
				case 0xD8: {
					setDecimalFlag(false);
				} break;
					
				// CLI - Clear Interrupt Disable
				case 0x58: {
					setInterruptFlag(false);
				} break;
					
				// CLV - Clear Overflow Flag
				case 0xB8: {
					setOverflowFlag(false);
				} break;
				
				// CMP - Compare
				case 0xC9: {
					byte value = readImmediate();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xC5: {
					byte value = readZeroPage();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xD5: {
					byte value = readZeroPageX();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xCD: {
					byte value = readAbsolute();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xDD: {
					byte value = readAbsoluteX();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xD9: {
					byte value = readAbsoluteY();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xC1: {
					byte value = readIndexedIndirect();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xD1: {
					byte value = readIndirectIndexed();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
					
				// CPX - Compare X Register
				case 0xE0: {
					byte value = readImmediate();
					setCarryFlag(x >= value);
					setZeroFlag(x == value);
					setNegativeFlag((byte) (x - value));
				} break;
				
				case 0xE4: {
					byte value = readZeroPage();
					setCarryFlag(x >= value);
					setZeroFlag(x == value);
					setNegativeFlag((byte) (x - value));
				} break;
				
				case 0xEC: {
					byte value = readAbsolute();
					setCarryFlag(x >= value);
					setZeroFlag(x == value);
					setNegativeFlag((byte) (x - value));
				} break;
					
				// CPY - Compare Y Register
				case 0xC0: {
					byte value = readImmediate();
					setCarryFlag(y >= value);
					setZeroFlag(y == value);
					setNegativeFlag((byte) (y - value));
				} break;
				
				case 0xC4: {
					byte value = readZeroPage();
					setCarryFlag(y >= value);
					setZeroFlag(y == value);
					setNegativeFlag((byte) (y - value));
				} break;
				
				case 0xCC: {
					byte value = readAbsolute();
					setCarryFlag(y >= value);
					setZeroFlag(y == value);
					setNegativeFlag((byte) (y - value));
				} break;
					
				// DEC - Decrement Memory
				case 0xc6: {
					byte result = (byte) (readZeroPage() - 1);
					pc--;
					writeZeroPage(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xD6: {
					byte result = (byte) (readZeroPageX() - 1);
					pc--;
					writeZeroPageX(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xCE: {
					byte result = (byte) (readAbsolute() - 1);
					pc--; pc--;
					writeAbsolute(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xDE: {
					byte result = (byte) (readAbsoluteX() - 1);
					pc--; pc--;
					writeAbsoluteX(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
					
				// DEX - Decrement X Register
				case 0xCA: {
					x--;
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
					
				// DEY - Decrement Y Register
				case 0x88: {
					y--;
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
					
				// EOR - Exclusive OR
				case 0x49: {
					a = (byte) (a ^ readImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x45: {
					a = (byte) (a ^ readZeroPage());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x55: {
					a = (byte) (a ^ readZeroPageX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x4D: {
					a = (byte) (a ^ readAbsolute());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x5D: {
					a = (byte) (a ^ readAbsoluteX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x59: {
					a = (byte) (a ^ readAbsoluteY());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x41: {
					a = (byte) (a ^ readIndexedIndirect());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x51: {
					a = (byte) (a ^ readIndirectIndexed());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// INC - Increment Memory
				case 0xE6: {
					byte result = (byte) (readZeroPage() + 1);
					pc--;
					writeZeroPage(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xF6: {
					byte result = (byte) (readZeroPageX() + 1);
					pc--;
					writeZeroPageX(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xEE: {
					byte result = (byte) (readAbsolute() + 1);
					pc--; pc--;
					writeAbsolute(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xFE: {
					byte result = (byte) (readAbsoluteX() + 1);
					pc--; pc--;
					writeAbsoluteX(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
					
				// INX - Increment X Register
				case 0xE8: {
					x++;
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
					
				// INY - Increment Y Register
				case 0xC8: {
					y++;
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
					
				// JMP - Jump
				case 0x4C: {
					pc = (short) (readImmediate() | (readImmediate() << 8));
				} break;
				
				case 0x6C: {
					pc = (byte) (game.prg[++pc]&0xFF | game.prg[++pc]&0xFF << 8);
					pc = (byte) (game.prg[++pc]&0xFF | game.prg[++pc]&0xFF << 8);
				} break;
				
				// JSR - Jump to Subroutine
				case 0x20: {
					pushStack((byte) (pc&0x00FF - 1));
					pushStack((byte) ((pc&0xFF00) >> 8));
					pc = (short) (((readImmediate() | (readImmediate()) << 8)) - 1);
				} break;
					
				// LDA - Load Accumulator
				case 0xA9: {
					a = readImmediate();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xA5: {
					a = readZeroPage();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xB5: {
					a = readZeroPageX();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xAD: {
					a = readAbsolute();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xBD: {
					a = readAbsoluteX();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xB9: {
					a = readAbsoluteY();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xA1: {
					a = readIndexedIndirect();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xB1: {
					a = readIndirectIndexed();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// LDX - Load X Register
				case 0xA2: {
					x = readImmediate();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xA6: {
					x = readZeroPage();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xB6: {
					x = readZeroPageY();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xAE: {
					x = readAbsolute();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xBE: {
					x = readAbsoluteY();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
					
				// LDY - Load Y Register
				case 0xA0: {
					y = readImmediate();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xA4: {
					y = readZeroPage();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xB4: {
					y = readZeroPageX();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xAC: {
					y = readAbsolute();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xBC: {
					y = readAbsoluteX();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
					
				// LSR - Logical Shift Right
				case 0x4A: {
					byte temp = a;
					setCarryFlag(BitTools.getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					a = temp;
				} break;
				
				case 0x46: {
					byte temp = readZeroPage();
					setCarryFlag(BitTools.getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					writeZeroPage(temp);
				} break;
				
				case 0x56: {
					byte temp = readZeroPageX();
					setCarryFlag(BitTools.getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					writeZeroPageX(temp);
				} break;
				
				case 0x4E: {
					byte temp = readAbsolute();
					setCarryFlag(BitTools.getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					writeAbsolute(temp);
				} break;
				
				case 0x5E: {
					byte temp = readAbsoluteX();
					setCarryFlag(BitTools.getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					writeAbsoluteX(temp);
				} break;
					
				// NOP - No Operation
				case 0xEA: {
				} break;
					
				// ORA - Logical Inclusive OR
				case 0x09: {
					a = (byte) (a | readImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x05: {
					a = (byte) (a | readZeroPage());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x15: {
					a = (byte) (a | readZeroPageX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x0D: {
					a = (byte) (a | readAbsolute());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x1D: {
					a = (byte) (a | readAbsoluteX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x19: {
					a = (byte) (a | readAbsoluteY());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x01: {
					a = (byte) (a | readIndexedIndirect());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x11: {
					a = (byte) (a | readIndirectIndexed());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// PHA - Push Accumulator
				case 0x48: {
					pushStack(a);
				} break;
					
				// PHP - Push Processor Status
				case 0x08: {
					pushStack(s);
				} break;
					
				// PLA - Pull Accumulator
				case 0x68: {
					a = pullStack();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// PLP - Pull Processor Status
				case 0x28: {
					s = pullStack();
				} break;
					
				// ROL - Rotate Left
				case 0x2A: {
					byte old = a;
					a = (byte) ((getCarryFlag() ? 1 : 0) | (old << 1));
					setCarryFlag(BitTools.getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				case 0x26: {
					byte old = readZeroPage();
					pc--;
					writeZeroPage((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
					setCarryFlag(BitTools.getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
    			case 0x36: {
    				byte old = readZeroPageX();
					pc--;
    				writeZeroPageX((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
    				setCarryFlag(BitTools.getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
    			} break;
    			
        		case 0x2E: {
        			byte old = readAbsolute();
        			pc--; pc--;
        			writeAbsolute((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
        			setCarryFlag(BitTools.getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
        		} break;
        		
            	case 0x3E: {
            		byte old = readAbsoluteX();
					pc--; pc--;
            		writeAbsoluteX((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
            		setCarryFlag(BitTools.getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
            	} break;
					
				// ROR - Rotate Right
				case 0x6A: {
					byte old = a;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
					setCarryFlag(BitTools.getBit(old, 0));
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				case 0x66: {
					byte old = readZeroPage();
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
					pc--;
					setCarryFlag(BitTools.getBit(old, 0));
					writeZeroPage(a);
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
    			case 0x76: {
    				byte old = readZeroPageX();
    				pc--;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
    				setCarryFlag(BitTools.getBit(old, 0));
					writeZeroPageX(a);
					setZeroFlag(a);
					setNegativeFlag(a);
    			} break;
    			
        		case 0x6E: {
        			byte old = readAbsolute();
        			pc--; pc--;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
        			setCarryFlag(BitTools.getBit(old, 0));
        			writeAbsolute(a);
					setZeroFlag(a);
					setNegativeFlag(a);
        		} break;
        		
            	case 0x7E: {
            		byte old = readAbsoluteX();
					pc--; pc--;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
            		setCarryFlag(BitTools.getBit(old, 0));
            		writeAbsoluteX(a);
					setZeroFlag(a);
					setNegativeFlag(a);
            	} break;
					
				// RTI - Return from Interrupt
				case 0x40: {
					s = pullStack();
					pc = (short) ((pullStack() | (pullStack() << 8)) - 1);
				} break;
					
				// RTS - Return from Subroutine
				case 0x60: {
					pc = (short) ((pullStack() | (pullStack() << 8)) - 1);
				} break;
					
				// SBC - Subtract with Carry
				case 0xE9: {
					byte b      = readImmediate();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					a = result;
				} break;
				
				case 0xE5: {
					byte b      = readZeroPage();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					writeZeroPage(result);
				} break;
				
				case 0xF5: {
					byte b      = readZeroPageX();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					writeZeroPageX(result);
				} break;
				
				case 0xED: {
					byte b      = readAbsolute();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeAbsolute(result);
				} break;
				
				case 0xFD: {
					byte b      = readAbsoluteX();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeAbsoluteX(result);
				} break;
				
				case 0xF9: {
					byte b      = readAbsoluteY();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeAbsoluteY(result);
				} break;
				
				case 0xE1: {
					byte b      = readIndexedIndirect();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeIndexedIndirect(result);
				} break;
				
				case 0xF1: {
					byte b      = readIndirectIndexed();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					writeIndirectIndexed(result);
				} break;
					
				// SEC - Set Carry Flag
				case 0x38: {
					setCarryFlag(true);
				} break;
					
				// SED - Set Decimal Flag
				case 0xF8: {
					setDecimalFlag(true);
				} break;
					
				// SEI - Set Interrupt Disable
				case 0x78: {
					setInterruptFlag(true);
				} break;
				
				// STA - write Accumulator
				case 0x85: {
					writeZeroPage(a);
				} break;
					
				case 0x95: {
					writeZeroPageX(a);
				} break;
					
				case 0x8D: {
					writeAbsolute(a);
				} break;
					
				case 0x9D: {
					writeAbsoluteX(a);
				} break;
					
				case 0x99: {
					writeAbsoluteY(a);
				} break;
				
				case 0x81: {
					writeIndexedIndirect(a);
				} break;
				
				case 0x91: {
					writeIndirectIndexed(a);
				} break;
					
				// STX - write X Register
				case 0x86: {
					writeZeroPage(x);
				} break;
					
				case 0x96: {
					writeZeroPageX(x);
				} break;
					
				case 0x8E: {
					writeAbsolute(x);
				} break;
					
				// STY - write Y Register
				case 0x84: {
					writeZeroPage(y);
				} break;
					
				case 0x94: {
					writeZeroPageX(y);
				} break;
					
				case 0x8C: {
					writeAbsolute(y);
				} break;
					
				// TAX - Transfer Accumulator to X
				case 0xAA: {
					x = a;
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
					
				// TAY - Transfer Accumulator to Y
				case 0xA8: {
					y = a;
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
					
				// TSX - Transfer Stack Pointer to X
				case 0xBA: {
					x = sp;
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
					
				// TXA - Transfer X to Accumulator
				case 0x8A: {
					a = x;
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// TXS - Transfer X to Stack Pointer
				case 0x9A: {
					sp = x;
				} break;
					
				// TYA - Transfer Y to Accumulator
				case 0x98: {
					a = y;
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				//     - Default action (Invalid Opcode)
				default: {
					System.err.format("[CPU] Invalid: %X @ %X%n", game.prg[pc]&0xFF, pc&0xFFFF);
				}
			}
		}
	}
	
	/**
	 * Creates and returns a String representation of this instance of a RicohCPU.
	 * @return Pretty String representation.
	 */
	public String toString() {
		TableBuilder tableBuilder = new TableBuilder();
		
		tableBuilder.addRow("programCounter", Integer.toHexString(pc));
		tableBuilder.addRow("stackPointer",   Integer.toHexString(0x0100 + sp&0xFF));
		tableBuilder.addRow("accumulator",    Integer.toHexString(a));
		tableBuilder.addRow("indexX",         Integer.toHexString(x));
		tableBuilder.addRow("indexY",         Integer.toHexString(y));
		tableBuilder.addRow("status",         Integer.toBinaryString(s));
		
		return tableBuilder.toString();
	}
}