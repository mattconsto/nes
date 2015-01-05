package co.swft.nes;
import co.swft.common.TableBuilder;

// http://wiki.nesdev.com/w/index.php/NES_2.0
// https://en.wikipedia.org/wiki/Nintendo_Entertainment_System_technical_specifications
// https://en.wikipedia.org/wiki/Ricoh_2A03
// http://www.obelisk.demon.co.uk/6502/reference.html
// http://www.obelisk.demon.co.uk/6502/addressing.html
// http://www.obelisk.demon.co.uk/6502/registers.html
// https://en.wikibooks.org/wiki/NES_Programming
// http://tuxnes.sourceforge.net/nesmapper.txt
// https://en.wikipedia.org/wiki/Memory_management_controller

public class Ricoh2A03CPU {
	public NESFile      file;
	public Ricoh2C02PPU ppu = new Ricoh2C02PPU();
	public Ricoh2A03APU apu = new Ricoh2A03APU();
	
	// RAM and Registers
	public byte[]  ram   = new byte[2 * 1024];	// Work RAM
	public short   pc    = 0;						// Program Counter
	public byte    sp    = (byte) 0xFF;			// Stack pointer
	public byte    a     = 0;						// Accumulator
	public byte    x     = 0;						// X index register
	public byte    y     = 0;						// Y index register
	public byte    s     = 0;						// Status register
	public byte[]  ppuio = new byte[8];			// PPU Control registers
	public byte[]  apuio = new byte[32];			// IO registers 
	
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
	
	// The NES is supposably Little Endian
	// TODO: Check endiness. Is it correct?
	// TODO: Am I skipping too many bytes per turn?
	// TODO: is it efficient?
	// TODO: is stack pointer right?
	// TODO: what is c?
	// TODO: what is io?
	// TODO: are instructions always the right size?

	// Constructor
	public Ricoh2A03CPU(NESFile file) {
		this.file = file;
		//System.out.format("Loaded %s bytes%n", file.byteCode.length);
	}
	
	// Alter stack
	public void addToStack(byte data) {
		ram[0x0100 + sp&0xFFFF] = (byte) (data&0xFF);
		sp--;
	}
	
	public byte getFromStack() {
		byte data = (byte) (ram[0x0100 + sp&0xFFFF]&0xFF);
		sp++;
		return data;
	}
	
	// Alter bits
	public byte setBit(byte data, int position, boolean value) {
		data = (byte) (data & (0xFF - (byte) Math.pow(2, position)));
		
		if(value) data = (byte) (data | (byte) Math.pow(2, position));
		
		return data;
	}
	
	public boolean getBit(byte data, int position) {
		return (data & (byte) Math.pow(2, position)) == 1;
	}
	
	// Various functions to alter the status register.
	public boolean getCarryFlag    (             ) {return getBit(s, 0);}
	public boolean getZeroFlag     (             ) {return getBit(s, 1);}
	public boolean getInterruptFlag(             ) {return getBit(s, 2);}
	public boolean getDecimalFlag  (             ) {return getBit(s, 3);}
	public boolean getBreakFlag    (             ) {return getBit(s, 4);}
	public boolean getOverflowFlag (             ) {return getBit(s, 5);}
	public boolean getNegativeFlag (             ) {return getBit(s, 6);}
	
	public void setZeroFlag        (byte value)    {setZeroFlag(value == 0);}
	public void setNegativeFlag    (byte value)    {setNegativeFlag(getBit(value, 7));}

	public void setCarryFlag       (boolean value) {s = setBit(s, 0, value);}
	public void setZeroFlag        (boolean value) {s = setBit(s, 1, value);}
	public void setInterruptFlag   (boolean value) {s = setBit(s, 2, value);}
	public void setDecimalFlag     (boolean value) {s = setBit(s, 3, value);}
	public void setBreakFlag       (boolean value) {s = setBit(s, 4, value);}
	public void setOverflowFlag    (boolean value) {s = setBit(s, 5, value);}
	public void setNegativeFlag    (boolean value) {s = setBit(s, 6, value);}
	
	public byte getFromMemoryMap(short l) {
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
				// Joysticks (0x4016-0x4017)
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
			return file.sram[l - 0x6000];
		} else if(l <= 0xFFFF) {
			// PRG-ROM
			return file.code[l - 0x8000];
		} else {
			System.err.println("[CPU] Somehow we go outside the limits of a short.");
		}
		return 0;
	}
	public void setFromMemoryMap(short l, byte v) {
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
				// Joysticks (0x4016-0x4017)
				default:
					System.err.format("[CPU] Default implementation (%d)", l);
					apuio[(l - 0x4000)] = v;
			}
		} else if(l < 0x6000) {
			// Cartridge Expansion ROM
			System.err.println("[CPU] Cartridge Expansion ROM not implemented");
		} else if(l < 0x8000) {
			// SRAM
			file.sram[l - 0x6000] = v;
		} else if(l <= 0xFFFF) {
			// PRG-ROM
			file.code[l - 0x8000] = v;
		} else {
			System.err.println("[CPU] Somehow we go outside the limits of a short.");
		}
	}
	
	public byte getImmediate() {
		return file.code[++pc];
	}
	public byte getZeroPage() {
		return getFromMemoryMap(file.code[++pc]);
	}
	public byte getZeroPageX() {
		return getFromMemoryMap((short) ((file.code[++pc] + x) % 256));
	}
	public byte getZeroPageY() {
		return getFromMemoryMap((short) ((file.code[++pc] + y) % 256));
	}
	public byte getAbsolute() {
		return getFromMemoryMap((short) (file.code[++pc] | (file.code[++pc] << 8)));
	}
	public byte getAbsoluteX() {
		return getFromMemoryMap((short) ((file.code[++pc] | (file.code[++pc] << 8)) + x));
	}
	public byte getAbsoluteY() {
		return getFromMemoryMap((short) ((file.code[++pc] | (file.code[++pc] << 8)) + x));
	}
	public byte getIndexedIndirect() {
		System.err.println("[CPU] getIndexedIndirect() not implemented");
		return 0;
	}
	public byte getIndirectIndexed() {
		System.err.println("[CPU] getIndirectIndexed() not implemented");
		return 0;
	}

	public void storeZeroPage(byte v) {
		setFromMemoryMap(file.code[++pc], v);
	}
	public void storeZeroPageX(byte v) {
		setFromMemoryMap((short) ((file.code[++pc] + x) % 256), v);
	}
	public void storeZeroPageY(byte v) {
		setFromMemoryMap((short) ((file.code[++pc] + y) % 256), v);
	}
	public void storeAbsolute(byte v) {
		setFromMemoryMap((short) (file.code[++pc] | (file.code[++pc] << 8)), v);
	}
	public void storeAbsoluteX(byte v) {
		setFromMemoryMap((short) ((file.code[++pc] | (file.code[++pc] << 8)) + x), v);
	}
	public void storeAbsoluteY(byte v) {
		setFromMemoryMap((short) ((file.code[++pc] | (file.code[++pc] << 8)) + y), v);
	}
	public void storeIndexedIndirect(byte v) {
		System.err.println("[CPU] storeIndexedIndirect() not implemented");
	}
	public void storeIndirectIndexed(byte v) {
		System.err.println("[CPU] storeIndirectIndexed() not implemented");
	}
	
	public void run() {
		System.out.println("[CPU] Starting Emulation");
		
		// Run until we reach the end
		for(pc = 0; pc < file.code.length && !getBreakFlag(); pc++) {
			try {Thread.sleep(100);} catch (InterruptedException e) {}
			System.out.println("[CPU] " + instructionSet[file.code[pc&0xFFFF]&0xFF]);
			
			switch(file.code[pc&0xFFFF]&0xFF) {
				// ADC - Add with Carry
				case 0x69: {
					byte b      = getImmediate();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					a = result;
				} break;
				
				case 0x65: {
					byte b      = getZeroPage();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					storeZeroPage(result);
				} break;
				
				case 0x75: {
					byte b      = getZeroPageX();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					storeZeroPageX(result);
				} break;
				
				case 0x6D: {
					byte b      = getAbsolute();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeAbsolute(result);
				} break;
				
				case 0x7D: {
					byte b      = getAbsoluteX();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeAbsoluteX(result);
				} break;
				
				case 0x79: {
					byte b      = getAbsoluteY();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeAbsoluteY(result);
				} break;
				
				case 0x61: {
					byte b      = getIndexedIndirect();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeIndexedIndirect(result);
				} break;
				
				case 0x71: {
					byte b      = getIndexedIndirect();
					byte result = (byte) (a + b + (getCarryFlag() ? 1 : 0));
					int  count  = a + b + (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeIndirectIndexed(result);
				} break;
				
				// AND - Logical AND
				case 0x29: {
					a = (byte) (a & getImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x25: {
					a = (byte) (a & getImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x35: {
					a = (byte) (a & getZeroPage());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x2D: {
					a = (byte) (a & getZeroPageX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x3D: {
					a = (byte) (a & getAbsoluteX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x39: {
					a = (byte) (a & getAbsoluteY());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x21: {
					a = (byte) (a & getIndexedIndirect());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x31: {
					a = (byte) (a & getIndirectIndexed());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				// ASL - Arithmetic Shift Left
				case 0x0A: {
					byte temp = a;
					setCarryFlag(getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					a = temp;
				} break;
				
				case 0x06: {
					byte temp = getZeroPage();
					setCarryFlag(getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					storeZeroPage(temp);
				} break;
				
				case 0x16: {
					byte temp = getZeroPageX();
					setCarryFlag(getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					storeZeroPageX(temp);
				} break;
				
				case 0x0E: {
					byte temp = getAbsolute();
					setCarryFlag(getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					storeAbsolute(temp);
				} break;
				
				case 0x1E: {
					byte temp = getAbsoluteX();
					setCarryFlag(getBit(temp, 7));
					temp = (byte) (temp << 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					storeAbsoluteX(temp);
				} break;
				
				// BCC - Branch if Carry Clear
				case 0x90: {
					if(!getCarryFlag()) {
						pc += getImmediate();
					} else {
						pc++;
					}
				} break;
				
				// BCS - Branch if Carry Set
				case 0xB0: {
					if(getCarryFlag()) {
						pc += getImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BEQ - Branch if Equal
				case 0xF0: {
					if(getZeroFlag()) {
						pc += getImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BIT - Bit Test
				case 0x24: {
					byte temp = (byte) (a & getZeroPage());
					setZeroFlag(temp);
					setOverflowFlag(getBit(temp, 6));
					setNegativeFlag(temp);
				} break;
				
				case 0x2C: {
					byte temp = (byte) (a & getAbsolute());
					setZeroFlag(temp);
					setOverflowFlag(getBit(temp, 6));
					setNegativeFlag(temp);
				} break;
				
				// BMI - Branch if Minus
				case 0x30: {
					if(getNegativeFlag()) {
						pc += getImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BNE - Branch if Not Equal
				case 0xD0: {
					if(!getZeroFlag()) {
						pc += getImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BPL - Branch if Positive
				case 0x10: {
					if(!getNegativeFlag()) {
						pc += getImmediate();
    				} else {
    					pc++;
    				}
				} break;
				
				// BRK - Force Interrupt
				case 0x00: {
					addToStack((byte) (pc & 0x00FF));
					addToStack((byte) ((pc & 0xFF00) >> 8));
					addToStack(s);
					setBreakFlag(true);
					pc = (short) ((file.code[0xFFFF] << 8) | file.code[0xFFFE]);
					System.err.println("[CPU] Force Interupt");
				} break;
				
				// BVC - Branch if Overflow Clear
				case 0x50: {
					if(!getOverflowFlag()) {
						pc += getImmediate();
					} else {
						pc++;
					}
				} break;
				
				// BVS - Branch if Overflow Set
				case 0x70: {
					if(getOverflowFlag()) {
						pc += getImmediate();
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
					byte value = getImmediate();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xC5: {
					byte value = getZeroPage();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xD5: {
					byte value = getZeroPageX();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xCD: {
					byte value = getAbsolute();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xDD: {
					byte value = getAbsoluteX();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xD9: {
					byte value = getAbsoluteY();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xC1: {
					byte value = getIndexedIndirect();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
				
				case 0xD1: {
					byte value = getIndirectIndexed();
					setCarryFlag(a >= value);
					setZeroFlag(a == value);
					setNegativeFlag((byte) (a - value));
				} break;
					
				// CPX - Compare X Register
				case 0xE0: {
					byte value = getImmediate();
					setCarryFlag(x >= value);
					setZeroFlag(x == value);
					setNegativeFlag((byte) (x - value));
				} break;
				
				case 0xE4: {
					byte value = getZeroPage();
					setCarryFlag(x >= value);
					setZeroFlag(x == value);
					setNegativeFlag((byte) (x - value));
				} break;
				
				case 0xEC: {
					byte value = getAbsolute();
					setCarryFlag(x >= value);
					setZeroFlag(x == value);
					setNegativeFlag((byte) (x - value));
				} break;
					
				// CPY - Compare Y Register
				case 0xC0: {
					byte value = getImmediate();
					setCarryFlag(y >= value);
					setZeroFlag(y == value);
					setNegativeFlag((byte) (y - value));
				} break;
				
				case 0xC4: {
					byte value = getZeroPage();
					setCarryFlag(y >= value);
					setZeroFlag(y == value);
					setNegativeFlag((byte) (y - value));
				} break;
				
				case 0xCC: {
					byte value = getAbsolute();
					setCarryFlag(y >= value);
					setZeroFlag(y == value);
					setNegativeFlag((byte) (y - value));
				} break;
					
				// DEC - Decrement Memory
				case 0xc6: {
					byte result = (byte) (getZeroPage() - 1);
					pc--;
					storeZeroPage(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xD6: {
					byte result = (byte) (getZeroPageX() - 1);
					pc--;
					storeZeroPageX(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xCE: {
					byte result = (byte) (getAbsolute() - 1);
					pc--; pc--;
					storeAbsolute(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xDE: {
					byte result = (byte) (getAbsoluteX() - 1);
					pc--; pc--;
					storeAbsoluteX(result);
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
					a = (byte) (a ^ getImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x45: {
					a = (byte) (a ^ getZeroPage());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x55: {
					a = (byte) (a ^ getZeroPageX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x4D: {
					a = (byte) (a ^ getAbsolute());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x5D: {
					a = (byte) (a ^ getAbsoluteX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x59: {
					a = (byte) (a ^ getAbsoluteY());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x41: {
					a = (byte) (a ^ getIndexedIndirect());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x51: {
					a = (byte) (a ^ getIndirectIndexed());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// INC - Increment Memory
				case 0xE6: {
					byte result = (byte) (getZeroPage() + 1);
					pc--;
					storeZeroPage(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xF6: {
					byte result = (byte) (getZeroPageX() + 1);
					pc--;
					storeZeroPageX(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xEE: {
					byte result = (byte) (getAbsolute() + 1);
					pc--; pc--;
					storeAbsolute(result);
					setZeroFlag(result);
					setNegativeFlag(result);
				} break;
				
				case 0xFE: {
					byte result = (byte) (getAbsoluteX() + 1);
					pc--; pc--;
					storeAbsoluteX(result);
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
					pc = (short) (getImmediate() | (getImmediate() << 8));
				} break;
				
				case 0x6C: {
					pc = (byte) (file.code[++pc&0xFFFF]&0xFF | file.code[++pc&0xFFFF]&0xFF << 8);
					pc = (byte) (file.code[++pc&0xFFFF]&0xFF | file.code[++pc&0xFFFF]&0xFF << 8);
				} break;
				
				// JSR - Jump to Subroutine
				case 0x20: {
					addToStack((byte) (pc&0x00FF - 1));
					addToStack((byte) ((pc&0xFF00) >> 8));
					pc = (short) (((getImmediate() | (getImmediate()) << 8)) - 1);
				} break;
					
				// LDA - Load Accumulator
				case 0xA9: {
					a = getImmediate();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xA5: {
					a = getZeroPage();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xB5: {
					a = getZeroPageX();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xAD: {
					a = getAbsolute();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xBD: {
					a = getAbsoluteX();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xB9: {
					a = getAbsoluteY();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xA1: {
					a = getIndexedIndirect();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0xB1: {
					a = getIndirectIndexed();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// LDX - Load X Register
				case 0xA2: {
					x = getImmediate();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xA6: {
					x = getZeroPage();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xB6: {
					x = getZeroPageY();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xAE: {
					x = getAbsolute();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
				
				case 0xBE: {
					x = getAbsoluteY();
					setZeroFlag(x);
					setNegativeFlag(x);
				} break;
					
				// LDY - Load Y Register
				case 0xA0: {
					y = getImmediate();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xA4: {
					y = getZeroPage();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xB4: {
					y = getZeroPageX();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xAC: {
					y = getAbsolute();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
				
				case 0xBC: {
					y = getAbsoluteX();
					setZeroFlag(y);
					setNegativeFlag(y);
				} break;
					
				// LSR - Logical Shift Right
				case 0x4A: {
					byte temp = a;
					setCarryFlag(getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					a = temp;
				} break;
				
				case 0x46: {
					byte temp = getZeroPage();
					setCarryFlag(getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					storeZeroPage(temp);
				} break;
				
				case 0x56: {
					byte temp = getZeroPageX();
					setCarryFlag(getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--;
					storeZeroPageX(temp);
				} break;
				
				case 0x4E: {
					byte temp = getAbsolute();
					setCarryFlag(getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					storeAbsolute(temp);
				} break;
				
				case 0x5E: {
					byte temp = getAbsoluteX();
					setCarryFlag(getBit(temp, 0));
					temp = (byte) (temp >> 1);
					setZeroFlag(temp);
					setNegativeFlag(temp);
					pc--; pc--;
					storeAbsoluteX(temp);
				} break;
					
				// NOP - No Operation
				case 0xEA: {
				} break;
					
				// ORA - Logical Inclusive OR
				case 0x09: {
					a = (byte) (a | getImmediate());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x05: {
					a = (byte) (a | getZeroPage());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x15: {
					a = (byte) (a | getZeroPageX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x0D: {
					a = (byte) (a | getAbsolute());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x1D: {
					a = (byte) (a | getAbsoluteX());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;

				case 0x19: {
					a = (byte) (a | getAbsoluteY());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x01: {
					a = (byte) (a | getIndexedIndirect());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
				case 0x11: {
					a = (byte) (a | getIndirectIndexed());
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// PHA - Push Accumulator
				case 0x48: {
					addToStack(a);
				} break;
					
				// PHP - Push Processor Status
				case 0x08: {
					addToStack(s);
				} break;
					
				// PLA - Pull Accumulator
				case 0x68: {
					a = getFromStack();
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				// PLP - Pull Processor Status
				case 0x28: {
					s = getFromStack();
				} break;
					
				// ROL - Rotate Left
				case 0x2A: {
					byte old = a;
					a = (byte) ((getCarryFlag() ? 1 : 0) | (old << 1));
					setCarryFlag(getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				case 0x26: {
					byte old = getZeroPage();
					pc--;
					storeZeroPage((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
					setCarryFlag(getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
    			case 0x36: {
    				byte old = getZeroPageX();
					pc--;
    				storeZeroPageX((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
    				setCarryFlag(getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
    			} break;
    			
        		case 0x2E: {
        			byte old = getAbsolute();
        			pc--; pc--;
        			storeAbsolute((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
        			setCarryFlag(getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
        		} break;
        		
            	case 0x3E: {
            		byte old = getAbsoluteX();
					pc--; pc--;
            		storeAbsoluteX((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
            		setCarryFlag(getBit(old, 7));
					setZeroFlag(a);
					setNegativeFlag(a);
            	} break;
					
				// ROR - Rotate Right
				case 0x6A: {
					byte old = a;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
					setCarryFlag(getBit(old, 0));
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
					
				case 0x66: {
					byte old = getZeroPage();
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
					pc--;
					setCarryFlag(getBit(old, 0));
					storeZeroPage(a);
					setZeroFlag(a);
					setNegativeFlag(a);
				} break;
				
    			case 0x76: {
    				byte old = getZeroPageX();
    				pc--;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
    				setCarryFlag(getBit(old, 0));
					storeZeroPageX(a);
					setZeroFlag(a);
					setNegativeFlag(a);
    			} break;
    			
        		case 0x6E: {
        			byte old = getAbsolute();
        			pc--; pc--;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
        			setCarryFlag(getBit(old, 0));
        			storeAbsolute(a);
					setZeroFlag(a);
					setNegativeFlag(a);
        		} break;
        		
            	case 0x7E: {
            		byte old = getAbsoluteX();
					pc--; pc--;
					a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
            		setCarryFlag(getBit(old, 0));
            		storeAbsoluteX(a);
					setZeroFlag(a);
					setNegativeFlag(a);
            	} break;
					
				// RTI - Return from Interrupt
				case 0x40: {
					s = getFromStack();
					pc = (short) ((getFromStack() | (getFromStack() << 8)) - 1);
				} break;
					
				// RTS - Return from Subroutine
				case 0x60: {
					pc = (short) ((getFromStack() | (getFromStack() << 8)) - 1);
				} break;
					
				// SBC - Subtract with Carry
				case 0xE9: {
					byte b      = getImmediate();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					a = result;
				} break;
				
				case 0xE5: {
					byte b      = getZeroPage();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					storeZeroPage(result);
				} break;
				
				case 0xF5: {
					byte b      = getZeroPageX();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--;
					storeZeroPageX(result);
				} break;
				
				case 0xED: {
					byte b      = getAbsolute();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeAbsolute(result);
				} break;
				
				case 0xFD: {
					byte b      = getAbsoluteX();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeAbsoluteX(result);
				} break;
				
				case 0xF9: {
					byte b      = getAbsoluteY();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeAbsoluteY(result);
				} break;
				
				case 0xE1: {
					byte b      = getIndexedIndirect();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeIndexedIndirect(result);
				} break;
				
				case 0xF1: {
					byte b      = getIndirectIndexed();
					byte result = (byte) (a - b - (!getCarryFlag() ? 1 : 0));
					int  count  = a - b - (getCarryFlag() ? 1 : 0);
					
					setCarryFlag(count < -128 || count > 127);
					setZeroFlag(result);
					setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
					setNegativeFlag(result);
					pc--; pc--;
					storeIndirectIndexed(result);
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
				
				// STA - Store Accumulator
				case 0x85: {
					storeZeroPage(a);
				} break;
					
				case 0x95: {
					storeZeroPageX(a);
				} break;
					
				case 0x8D: {
					storeAbsolute(a);
				} break;
					
				case 0x9D: {
					storeAbsoluteX(a);
				} break;
					
				case 0x99: {
					storeAbsoluteY(a);
				} break;
				
				case 0x81: {
					storeIndexedIndirect(a);
				} break;
				
				case 0x91: {
					storeIndirectIndexed(a);
				} break;
					
				// STX - Store X Register
				case 0x86: {
					storeZeroPage(x);
				} break;
					
				case 0x96: {
					storeZeroPageX(x);
				} break;
					
				case 0x8E: {
					storeAbsolute(x);
				} break;
					
				// STY - Store Y Register
				case 0x84: {
					storeZeroPage(y);
				} break;
					
				case 0x94: {
					storeZeroPageX(y);
				} break;
					
				case 0x8C: {
					storeAbsolute(y);
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
					System.err.format(
						"[CPU] Invalid: 0x%s @ 0x%s%n",
						String.format("%2s", Integer.toHexString(file.code[pc&0xFFFF]&0xFF)).replace(' ', '0'),
						String.format("%4s", Integer.toHexString(pc&0xFFFF)).replace(' ', '0')
					);
				}
			}
		}
	}
	
	public String toString() {
		TableBuilder tableBuilder = new TableBuilder();
		
		tableBuilder.addRow("programCounter", pc);
		tableBuilder.addRow("stackPointer",   sp);
		tableBuilder.addRow("accumulator",    a);
		tableBuilder.addRow("indexX",         x);
		tableBuilder.addRow("indexY",         y);
		tableBuilder.addRow("status",         s);
		
		return tableBuilder.toString();
	}
}