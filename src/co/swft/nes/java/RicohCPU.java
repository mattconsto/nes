package co.swft.nes.java;

import java.util.ArrayList;
import java.util.List;

import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.Logger;

import co.swft.nes.abstracts.Controlable;
import co.swft.util.BitTools;

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
public class RicohCPU extends Controlable {
	private Logger logger;
	
	public co.swft.nes.java.State state;


	private String[] instructionSet = {
		"BRK",				"ORA ($%3$02x%2$02x,X)", 	"???", 			"???", 	"???", 			"ORA $%02x", 		"ASL $%02x", 		"???", 	"PHP", 	"ORA #%02x", 		"ASL Accumulator", 		"???", 	"???", 		"ORA $%3$02x%2$02x", 		"ASL $%3$02x%2$02x", 		"???", 
		"BPL $%02x",			"ORA ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"ORA $%02x,X", 	"ASL $%02x,X", 	"???", 	"CLC", 	"ORA $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"ORA $%3$02x%2$02x,X", 	"ASL $%3$02x%2$02x,X", 	"???", 
		"JSR $%3$02x%2$02x",	"AND ($%3$02x%2$02x,X)", 	"???", 			"???", 	"BIT $%02x", 		"AND $%02x", 		"ROL $%02x", 		"???", 	"PLP", 	"AND #%02x", 		"ROL Accumulator", 		"???", 	"BIT $%3$02x%2$02x", 		"AND $%3$02x%2$02x", 		"ROL $%3$02x%2$02x", 		"???", 
		"BMI $%02x", 			"AND ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"AND $%02x,X", 	"ROL $%02x,X", 	"???", 	"SEC", 	"AND $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"AND $%3$02x%2$02x,X", 	"ROL $%3$02x%2$02x,X", 	"???", 
		"RTI",				"EOR ($%3$02x%2$02x,X)", 	"???", 			"???", 	"???", 			"EOR $%02x", 		"LSR $%02x", 		"???", 	"PHA", 	"EOR #%02x", 		"LSR Accumulator", 		"???", 	"JMP $%3$02x%2$02x", 		"EOR $%3$02x%2$02x", 		"LSR $%3$02x%2$02x", 		"???", 
		"BVC $%02x",			"EOR ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"EOR $%02x,X", 	"LSR $%02x,X", 	"???", 	"CLI", 	"EOR $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"EOR $%3$02x%2$02x,X", 	"LSR $%3$02x%2$02x,X", 	"???", 
		"RTS", 				"ADC ($%3$02x%2$02x,X)", 	"???", 			"???", 	"???", 			"ADC $%02x", 		"ROR $%02x", 		"???", 	"PLA", 	"ADC #%02x", 		"ROR Accumulator", 		"???", 	"JMP ($%3$02x%2$02x)", 		"ADC $%3$02x%2$02x", 		"ROR $%3$02x%2$02x", 		"???", 
		"BVS $%02x", 			"ADC ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"ADC $%02x,X", 	"ROR $%02x,X", 	"???", 	"SEI", 	"ADC $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"ADC $%3$02x%2$02x,X", 	"ROR $%3$02x%2$02x,X", 	"???", 
		"???", 				"STA ($%3$02x%2$02x,X)", 	"???", 			"???", 	"STY $%02x", 		"STA $%02x", 		"STX $%02x", 		"???", 	"DEY", 	"???", 		"TXA", 	"???", 	"STY $%3$02x%2$02x", 		"STA $%3$02x%2$02x", 		"STX $%3$02x%2$02x", 		"???", 
		"BCC $%02x", 			"STA ($%3$02x%2$02x),Y", 	"???", 			"???", 	"STY $%02x,X", 	"STA $%02x,X", 	"STX $%02x,Y", 	"???", 	"TYA", 	"STA $%3$02x%2$02x,Y", 	"TXS", 	"???", 	"???", 		"STA $%3$02x%2$02x,X", 	"???", 		"???", 
		"LDY #%02x", 		"LDA ($%3$02x%2$02x,X)", 	"LDX #%02x", 	"???", 	"LDY $%02x", 		"LDA $%02x", 		"LDX $%02x", 		"???", 	"TAY", 	"LDA #%02x", 		"TAX", 	"???", 	"LDY $%3$02x%2$02x", 		"LDA $%3$02x%2$02x", 		"LDX $%3$02x%2$02x", 		"???", 
		"BCS $%02x",			"LDA ($%3$02x%2$02x),Y", 	"???", 			"???", 	"LDY $%02x,X", 	"LDA $%02x,X", 	"LDX $%02x,Y", 	"???", 	"CLV", 	"LDA $%3$02x%2$02x,Y", 	"TSX", 	"???", 	"LDY $%3$02x%2$02x,X", 	"LDA $%3$02x%2$02x,X", 	"LDX $%3$02x%2$02x,Y", 	"???", 
		"CPY #%02x", 		"CMP ($%3$02x%2$02x,X)", 	"???", 			"???", 	"CPY $%02x", 		"CMP $%02x", 		"DEC $%02x", 		"???", 	"INY", 	"CMP #%02x", 		"DEX", 	"???", 	"CPY $%3$02x%2$02x", 		"CMP $%3$02x%2$02x", 		"DEC $%3$02x%2$02x", 		"???", 
		"BNE $%02x", 			"CMP ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"CMP $%02x,X", 	"DEC $%02x,X", 	"???", 	"CLD", 	"CMP $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"CMP $%3$02x%2$02x,X", 	"DEC $%3$02x%2$02x,X", 	"???", 
		"CPX #%02x", 		"SBC ($%3$02x%2$02x,X)", 	"???", 			"???", 	"CPX $%02x", 		"SBC $%02x", 		"INC $%02x", 		"???", 	"INX", 	"SBC #%02x", 		"NOP", 	"???", 	"CPX $%3$02x%2$02x", 		"SBC $%3$02x%2$02x", 		"INC $%3$02x%2$02x", 		"???", 
		"BEQ $%02x", 			"SBC ($%3$02x%2$02x),Y", 	"???", 			"???", 	"???", 			"SBC $%02x,X", 	"INC $%02x,X", 	"???", 	"SED", 	"SBC $%3$02x%2$02x,Y", 	"???", 		"???", 	"???", 		"SBC $%3$02x%2$02x,X", 	"INC $%3$02x%2$02x,X", 	"???"
	};
	
	/**
	 * Constructs a new RicohCPU.
	 * @param game NESFile
	 * @param ppu PPU
	 * @param apu APU
	 */
	public RicohCPU(Log log, NESCartridge game, RicohPPU ppu, RicohAPU apu) {
		this.logger = new Logger(log, "CPU", true);
		this.state = new co.swft.nes.java.State();
		this.state.game  = game;
		this.state.ppu   = ppu;
		this.state.apu   = apu;
		logger.info("Created");
	}
	
	/**
	 * Pushes the input byte to the stack, decreasing the stack pointer. In this CPU, the stack is a
	 * descending and empty stack, meaning it starts from the top and always points to the next
	 * empty spot in the stack.
	 * @param input The byte we want to push to the stack.
	 */
	public void pushStack(byte input) {
		state.ram[0x0100 + (state.sp & 0xFF)] = input;
		state.sp = (byte) ((state.sp & 0xFF) - 1);
	}
	
	/**
	 * Pulls the next byte from the stack, increasing the stack pointer. In this CPU, the stack is a
	 * descending and empty stack, meaning it starts from the top and always points to the next
	 * empty spot in the stack.
	 * @return The byte pulled from the stack.
	 */
	public byte pullStack() {
		state.sp = (byte) ((state.sp & 0xFF) + 1);
		return state.ram[0x0100 + (state.sp & 0xFF)];
	}
	
	/*
	 * Methods to retrieve bits from the status register. Calling them will return a boolean value
	 * representing the selected bit from the status register.
	 */
	public boolean getCarryFlag()           {return BitTools.getBit(state.s, 0);}
	public boolean getZeroFlag()            {return BitTools.getBit(state.s, 1);}
	public boolean getInterruptFlag()       {return BitTools.getBit(state.s, 2);}
	public boolean getDecimalFlag()         {return BitTools.getBit(state.s, 3);}
	public boolean getBreakFlag()           {return BitTools.getBit(state.s, 4);}
	public boolean getOverflowFlag()        {return BitTools.getBit(state.s, 5);}
	public boolean getNegativeFlag()        {return BitTools.getBit(state.s, 6);}
	
	/*
	 * Methods to set bits in the status register. Calling them will set the selected bit in the 
	 * status register to the value v.
	 */
	public void setCarryFlag(boolean v)     {state.s = BitTools.setBit(state.s, 0, v);}
	public void setZeroFlag(boolean v)      {state.s = BitTools.setBit(state.s, 1, v);}
	public void setInterruptFlag(boolean v) {state.s = BitTools.setBit(state.s, 2, v);}
	public void setDecimalFlag(boolean v)   {state.s = BitTools.setBit(state.s, 3, v);}
	public void setBreakFlag(boolean v)     {state.s = BitTools.setBit(state.s, 4, v);}
	public void setOverflowFlag(boolean v)  {state.s = BitTools.setBit(state.s, 5, v);}
	public void setNegativeFlag(boolean v)  {state.s = BitTools.setBit(state.s, 6, v);}
	
	/*
	 * Two methods that allow you too simply give them the byte, and they will calculate the flag
	 * themselves. Saves a little typing.
	 */
	public void setZeroFlag(byte d)         {state.s = BitTools.setBit(state.s, 1, d == 0);}
	public void setNegativeFlag(byte d)     {state.s = BitTools.setBit(state.s, 6, BitTools.getBit(d, 7));}
	
	/**
	 * Get a byte from the memory map.
	 * @param location Absolute location of the byte we want to find.
	 * @return A byte from the location specified.
	 */
	public byte readMemoryMap(short location) {
		int l = location & 0xFFFF;
		
		if       (l < 0x2000) {
		    // Direct work ram. Mirrored 3 times
			return state.ram[l % 0x800];
		} else if(l < 0x4000) {
			// PPU Control Registers. Mirrored 1023 times
			l = (short) (l % 8);
			switch(l) {
				case 0: // PPU Control Register 1
					logger.warn("Write only c[0]!"); break;
				case 1: // PPU Control Register 2
					logger.warn("Write only c[1]!"); break;
				case 2: // PPU Status Register
					byte temp  = state.ppu.status;
					// Clear VBLANK
					state.ppu.status = BitTools.setBit(temp, 7, false);
					return temp;
				case 3: // Sprite Memory Access
					logger.warn("Write only c[3]!"); break;
				case 4: // Sprite Memory Data
					return state.ppu.OAMRAM[state.ppu.oamAddress & 0xFF];
				case 5: // Background Scroll
					logger.warn("Write only c[5]!"); break;
				case 6: // PPU Memory Address
					logger.warn("Write only c[6]!"); break;
				case 7: // PPU Memory Data
					state.ppu.address += BitTools.getBit(state.ppu.status, 2) ? 32 : 1;
					return state.ppu.videoRAM[state.ppu.address & 0xFF];
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
			return state.game.save[l - 0x6000];
		} else if(l <= 0xFFFF) {
			// PRG-ROM
			//System.out.format("read from %x = %x%n", (l - 0x8000) % game.prg.length, game.prg[(l - 0x8000) % game.prg.length]);
			return state.game.PRG_ROM[(l - 0x8000) % state.game.PRG_ROM.length];
		} else {
			logger.warn("Invalid Address");
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
		
		if(l >= 0x0100 && l < 0x0200) logger.error("Writing too stack!");
		
		if       (l < 0x2000) {
		    // Direct work ram. Mirrored 3 times
			state.ram[l % 0x800] = v;
		} else if(l < 0x4000) {
			// PPU Control Registers. Mirrored 1023 times
			l = (short) ((l - 0x2000) % 8);
			switch(l) {
				case 0: // PPU Control Register 1
					state.ppu.controller = v; break;
				case 1: // PPU Control Register 2
					state.ppu.mask = v; break;
				case 2: // PPU Status Register
					logger.warn("Read only c[2]!"); break;
				case 3: // Sprite Memory Access
					state.ppu.oamAddress = v; break;
				case 4: // Sprite Memory Data
					state.ppu.OAMRAM[state.ppu.oamAddress & 0xFF] = v;
					state.ppu.oamAddress++;
					break;
				case 5: // Background Scroll
					state.ppu.scroll = v; break;
				case 6: // PPU Memory Address
					//System.out.println("Addr  " + Integer.toHexString(v));
					if(state.ppu.addressState) {
						state.ppu.address = (state.ppu.address & 0x00ff) + (v << 8);
					} else {
						state.ppu.address = (state.ppu.address & 0xff00) + v;
					}
					state.ppu.addressState = !state.ppu.addressState;
					break;
				case 7: // PPU Memory Data
					//System.out.println("Write " + Integer.toHexString(v));
					state.ppu.writeMemoryMap(state.ppu.address & 0xffff, v);
					state.ppu.address += BitTools.getBit(state.ppu.status, 2) ? 32 : 1;
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
			logger.warn("Cannot write to Cartridge ROM.");
		} else if(l < 0x8000) {
			// SRAM
			state.game.save[l - 0x6000] = v;
		} else if(l <= 0xFFFF) {
			// PRG-ROM
			logger.warn("Cannot write to PRG-ROM.");
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
	
	public short addressImmediate() {
		return ++state.pc;
	}
	public short addressZeroPage() {
		return readImmediate();
	}
	public short addressZeroPageX() {
		return (short) ((readImmediate() + state.x) & 0xff); // wraps around
	}
	public short addressZeroPageY() {
		return (short) (readImmediate() + state.y);
	}
	public short addressAbsolute() {
		return (short) (readImmediate() | (readImmediate() << 8));
	}
	public short addressAbsoluteX() {
		return (short) ((readImmediate() | (readImmediate() << 8)) + state.x);
	}
	public short addressAbsoluteY() {
		return (short) ((readImmediate() | (readImmediate() << 8)) + state.y);
	}
	public short addressIndexedIndirect() {
		byte address = readZeroPageX();
		return (short) (readMemoryMap(address) | (readMemoryMap(address + 1) << 8));
	}
	public short addressIndirectIndexed() {
		byte address = readZeroPage();
		return (short) (((readMemoryMap(address & 0xff) & 0xff) | ((readMemoryMap((address & 0xff) + 1) & 0xff) << 8)) + state.y);
	}
	
	public byte readImmediate() {
		return readMemoryMap(++state.pc);
	}
	public byte readZeroPage() {
		return readMemoryMap(readImmediate());
	}
	public byte readZeroPageX() {
		return readMemoryMap((readImmediate() + state.x) & 0xff); // wraps around
	}
	public byte readZeroPageY() {
		return readMemoryMap(readImmediate() + state.y);
	}
	public byte readAbsolute() {
		return readMemoryMap(readImmediate() | (readImmediate() << 8));
	}
	public byte readAbsoluteX() {
		return readMemoryMap((readImmediate() | (readImmediate() << 8)) + state.x);
	}
	public byte readAbsoluteY() {
		return readMemoryMap((readImmediate() | (readImmediate() << 8)) + state.y);
	}
	public byte readIndexedIndirect() {
		byte address = readZeroPageX();
		return readMemoryMap(readMemoryMap(address) | (readMemoryMap(address + 1) << 8));
	}
	public byte readIndirectIndexed() {
		byte address = readZeroPage();
//		int a = (readMemoryMap(address) | (readMemoryMap(address + 1) << 8)) + y; // Here is my problem.
//		int b = ((readMemoryMap(address & 0xff) & 0xff) | ((readMemoryMap((address & 0xff) + 1) & 0xff) << 8)) + y;
//		if(a != b) {
//			System.err.println(a);
//			System.err.println(b);
//			System.exit(1);
//		}
//		System.out.println(((readMemoryMap(address & 0xff) & 0xff) | ((readMemoryMap((address & 0xff) + 1) & 0xff) << 8)) + state.y);
		return readMemoryMap(((readMemoryMap(address & 0xff) & 0xff) | ((readMemoryMap((address & 0xff) + 1) & 0xff) << 8)) + state.y);
	}

	public void writeZeroPage(byte v) {
		writeMemoryMap(readImmediate(), v);
	}
	public void writeZeroPageX(byte v) {
		writeMemoryMap((readImmediate() + state.x) & 0xff, v);
	}
	public void writeZeroPageY(byte v) {
		writeMemoryMap(readImmediate() + state.y, v);
	}
	public void writeAbsolute(byte v) {
		writeMemoryMap(readImmediate() | (readImmediate() << 8), v);
	}
	public void writeAbsoluteX(byte v) {
		writeMemoryMap((readImmediate() | (readImmediate() << 8)) + state.x, v);
	}
	public void writeAbsoluteY(byte v) {
		writeMemoryMap((readImmediate() | (readImmediate() << 8)) + state.y, v);
	}
	public void writeIndexedIndirect(byte v) {
		byte address = readZeroPageX();
		writeMemoryMap(readMemoryMap(address) | (readMemoryMap(address + 1) << 8), v);
	}
	public void writeIndirectIndexed(byte v) {
		byte address = readZeroPage();
		writeMemoryMap((readMemoryMap(address) | (readMemoryMap(address + 1) << 8)) + state.y, v);
	}
	
	/**
	 * run() starts the emulation.
	 */
	public void run() {
		logger.info("Starting Emulation");
		
		// Run until we reach the end
		for(; !stopFlag && !getBreakFlag(); state.pc++) {
//			State old = state.clone();

			// Print out log
			logger.debug("$%04x\t" + instructionSet[readMemoryMap(state.pc)&0xFF], state.pc, readMemoryMap(state.pc+1)&0xFF, readMemoryMap(state.pc+2)&0xFF);
			
			byte instruction = readMemoryMap(state.pc);
			fireCycleListeners(new CycleEvent(instruction));
			executeInstruction(instruction);
			checkMonitor();
			
			// Automatically end emulation if we start to loop without any changes.
//			if(old.equals(state)) {
//				System.out.println("    [CPU] Ended Emulation");
//				break;
//			}
		}
	}
	
	private List<CycleListener> listeners = new ArrayList<>();
	
	public synchronized boolean addCycleListener(CycleListener l) {
		return listeners.add(l);
	}
	
	public synchronized boolean removeCycleListener(CycleListener l) {
		return listeners.remove(l);
	}
	
	public synchronized void fireCycleListeners(CycleEvent e) {
		listeners.forEach(l -> {l.cycleStarted(e); try{Thread.sleep(2);}catch(Exception ignore){}});
	}
	
	public void executeInstruction(byte instruction) {
		switch(instruction & 0xFF) {
			// ADC - Add with Carry
			case 0x69: {
				byte b      = readImmediate();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.a = result;
			} break;
			
			case 0x65: {
				byte b      = readZeroPage();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--;
				writeZeroPage(result);
			} break;
			
			case 0x75: {
				byte b      = readZeroPageX();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--;
				writeZeroPageX(result);
			} break;
			
			case 0x6D: {
				byte b      = readAbsolute();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeAbsolute(result);
			} break;
			
			case 0x7D: {
				byte b      = readAbsoluteX();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeAbsoluteX(result);
			} break;
			
			case 0x79: {
				byte b      = readAbsoluteY();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeAbsoluteY(result);
			} break;
			
			case 0x61: {
				byte b      = readIndexedIndirect();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeIndexedIndirect(result);
			} break;
			
			case 0x71: {
				byte b      = readIndexedIndirect();
				byte result = (byte) (state.a + b + (getCarryFlag() ? 1 : 0));
				int  count  = state.a + b + (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeIndirectIndexed(result);
			} break;
			
			// AND - Logical AND
			case 0x29: {
				state.a = (byte) (state.a & readImmediate());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x25: {
				state.a = (byte) (state.a & readImmediate());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x35: {
				state.a = (byte) (state.a & readZeroPage());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x2D: {
				state.a = (byte) (state.a & readZeroPageX());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x3D: {
				state.a = (byte) (state.a & readAbsoluteX());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x39: {
				state.a = (byte) (state.a & readAbsoluteY());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x21: {
				state.a = (byte) (state.a & readIndexedIndirect());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x31: {
				state.a = (byte) (state.a & readIndirectIndexed());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;

			// ASL - Arithmetic Shift Left
			case 0x0A: {
				byte temp = state.a;
				setCarryFlag(BitTools.getBit(temp, 7));
				temp = (byte) (temp << 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.a = temp;
			} break;
			
			case 0x06: {
				byte temp = readZeroPage();
				setCarryFlag(BitTools.getBit(temp, 7));
				temp = (byte) (temp << 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--;
				writeZeroPage(temp);
			} break;
			
			case 0x16: {
				byte temp = readZeroPageX();
				setCarryFlag(BitTools.getBit(temp, 7));
				temp = (byte) (temp << 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--;
				writeZeroPageX(temp);
			} break;
			
			case 0x0E: {
				byte temp = readAbsolute();
				setCarryFlag(BitTools.getBit(temp, 7));
				temp = (byte) (temp << 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--; state.pc--;
				writeAbsolute(temp);
			} break;
			
			case 0x1E: {
				byte temp = readAbsoluteX();
				setCarryFlag(BitTools.getBit(temp, 7));
				temp = (byte) (temp << 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--; state.pc--;
				writeAbsoluteX(temp);
			} break;
			
			// BCC - Branch if Carry Clear
			case 0x90: {
				if(!getCarryFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
				}
			} break;
			
			// BCS - Branch if Carry Set
			case 0xB0: {
				if(getCarryFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
				}
			} break;
			
			// BEQ - Branch if Equal
			case 0xF0: {
				if(getZeroFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
				}
			} break;
			
			// BIT - Bit Test
			case 0x24: {
				byte temp = (byte) (state.a & readZeroPage());
				setZeroFlag(temp);
				setOverflowFlag(BitTools.getBit(temp, 6));
				setNegativeFlag(temp);
			} break;
			
			case 0x2C: {
				byte temp = (byte) (state.a & readAbsolute());
				setZeroFlag(temp);
				setOverflowFlag(BitTools.getBit(temp, 6));
				setNegativeFlag(temp);
			} break;
			
			// BMI - Branch if Minus
			case 0x30: {
				if(getNegativeFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
				}
			} break;
			
			// BNE - Branch if Not Equal
			case 0xD0: {
				if(!getZeroFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
				}
			} break;
			
			// BPL - Branch if Positive
			case 0x10: {
				if(!getNegativeFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
				}
			} break;
			
			// BRK - Force Interrupt
			case 0x00: {
				pushStack((byte) (state.pc & 0x00FF));
				pushStack((byte) ((state.pc & 0xFF00) >> 8));
				pushStack(state.s);
				state.pc = (short) (readMemoryMap((short) 0xFFFE) | (readMemoryMap((short) 0xFFFF) << 8));
				logger.warn("Force Interupt");
				setBreakFlag(true);
			} break;
			
			// BVC - Branch if Overflow Clear
			case 0x50: {
				if(!getOverflowFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
				}
			} break;
			
			// BVS - Branch if Overflow Set
			case 0x70: {
				if(getOverflowFlag()) {
					// logger.debug("Branched");
					state.pc += readImmediate() + 1;
				} else {
					state.pc++;
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
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
			
			case 0xC5: {
				byte value = readZeroPage();
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
			
			case 0xD5: {
				byte value = readZeroPageX();
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
			
			case 0xCD: {
				byte value = readAbsolute();
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
			
			case 0xDD: {
				byte value = readAbsoluteX();
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
			
			case 0xD9: {
				byte value = readAbsoluteY();
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
			
			case 0xC1: {
				byte value = readIndexedIndirect();
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
			
			case 0xD1: {
				byte value = readIndirectIndexed();
				setCarryFlag(state.a >= value);
				setZeroFlag(state.a == value);
				setNegativeFlag((byte) (state.a - value));
			} break;
				
			// CPX - Compare X Register
			case 0xE0: {
				byte value = readImmediate();
				setCarryFlag(state.x >= value);
				setZeroFlag(state.x == value);
				setNegativeFlag((byte) (state.x - value));
			} break;
			
			case 0xE4: {
				byte value = readZeroPage();
				setCarryFlag(state.x >= value);
				setZeroFlag(state.x == value);
				setNegativeFlag((byte) (state.x - value));
			} break;
			
			case 0xEC: {
				byte value = readAbsolute();
				setCarryFlag(state.x >= value);
				setZeroFlag(state.x == value);
				setNegativeFlag((byte) (state.x - value));
			} break;
				
			// CPY - Compare Y Register
			case 0xC0: {
				byte value = readImmediate();
				setCarryFlag(state.y >= value);
				setZeroFlag(state.y == value);
				setNegativeFlag((byte) (state.y - value));
			} break;
			
			case 0xC4: {
				byte value = readZeroPage();
				setCarryFlag(state.y >= value);
				setZeroFlag(state.y == value);
				setNegativeFlag((byte) (state.y - value));
			} break;
			
			case 0xCC: {
				byte value = readAbsolute();
				setCarryFlag(state.y >= value);
				setZeroFlag(state.y == value);
				setNegativeFlag((byte) (state.y - value));
			} break;
				
			// DEC - Decrement Memory
			case 0xc6: {
				byte result = (byte) (readZeroPage() - 1);
				state.pc--;
				writeZeroPage(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
			
			case 0xD6: {
				byte result = (byte) (readZeroPageX() - 1);
				state.pc--;
				writeZeroPageX(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
			
			case 0xCE: {
				byte result = (byte) (readAbsolute() - 1);
				state.pc--; state.pc--;
				writeAbsolute(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
			
			case 0xDE: {
				byte result = (byte) (readAbsoluteX() - 1);
				state.pc--; state.pc--;
				writeAbsoluteX(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
				
			// DEX - Decrement X Register
			case 0xCA: {
				state.x = (byte) ((state.x & 0xFF) - 1);
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
				
			// DEY - Decrement Y Register
			case 0x88: {
				state.y = (byte) ((state.y & 0xFF) - 1);
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
				
			// EOR - Exclusive OR
			case 0x49: {
				state.a = (byte) (state.a ^ readImmediate());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x45: {
				state.a = (byte) (state.a ^ readZeroPage());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x55: {
				state.a = (byte) (state.a ^ readZeroPageX());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x4D: {
				state.a = (byte) (state.a ^ readAbsolute());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x5D: {
				state.a = (byte) (state.a ^ readAbsoluteX());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x59: {
				state.a = (byte) (state.a ^ readAbsoluteY());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x41: {
				state.a = (byte) (state.a ^ readIndexedIndirect());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x51: {
				state.a = (byte) (state.a ^ readIndirectIndexed());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			// INC - Increment Memory
			case 0xE6: {
				byte result = (byte) (readZeroPage() + 1);
				state.pc--;
				writeZeroPage(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
			
			case 0xF6: {
				byte result = (byte) (readZeroPageX() + 1);
				state.pc--;
				writeZeroPageX(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
			
			case 0xEE: {
				byte result = (byte) (readAbsolute() + 1);
				state.pc--; state.pc--;
				writeAbsolute(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
			
			case 0xFE: {
				byte result = (byte) (readAbsoluteX() + 1);
				state.pc--; state.pc--;
				writeAbsoluteX(result);
				setZeroFlag(result);
				setNegativeFlag(result);
			} break;
				
			// INX - Increment X Register
			case 0xE8: {
				state.x++;
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
				
			// INY - Increment Y Register
			case 0xC8: {
				state.y++;
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
				
			// JMP - Jump
			case 0x4C: {
				//String from = String.format("%X (%X)", state.pc&0xFFFF, ((state.pc & 0xFFFF) - 0x8000) % (state.game.prg.length - 16));
				state.pc = (short) (((readImmediate() & 0xFF) | ((readImmediate() & 0xFF) << 8) & 0xFFFF) - 1);
				//System.out.format("    [CPU] JMP 4C %X (%X) from %s%n", pc&0xFFFF, ((pc & 0xFFFF) - 0x8000) % (game.prg.length - 16), from);
			} break;
			
			case 0x6C: {
				//String from = String.format("%X (%X)", state.pc&0xFFFF, ((state.pc & 0xFFFF) - 0x8000) % (state.game.prg.length - 16));
				state.pc = (short) (((readImmediate() & 0xFF) | ((readImmediate() & 0xFF) << 8) & 0xFFFF) - 1);
				state.pc = (short) (((readImmediate() & 0xFF) | ((readImmediate() & 0xFF) << 8) & 0xFFFF) - 1);
				//System.out.format("    [CPU] JMP 6C %X (%X) from %s%n", pc&0xFFFF, ((pc & 0xFFFF) - 0x8000) % (game.prg.length - 16), from);
			} break;
			
			// JSR - Jump to Subroutine
			case 0x20: {
				//String from = String.format("%X (%X)", state.pc&0xFFFF, ((state.pc & 0xFFFF) - 0x8000) % (state.game.prg.length - 16));
				short destination = (short) (((readImmediate() & 0xFF) | ((readImmediate() & 0xFF) << 8) & 0xFFFF) - 1);
				pushStack((byte) ((state.pc & 0x00FF)));
				pushStack((byte) ((state.pc & 0xFF00) >> 8));
				state.pc = destination;
				//System.out.format("    [CPU] JSR to %X (%X) from %s%n", pc&0xFFFF, ((pc & 0xFFFF) - 0x8000) % (game.prg.length - 16), from);
			} break;
				
			// LDA - Load Accumulator
			case 0xA9: {
				state.a = readImmediate();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0xA5: {
				state.a = readZeroPage();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0xB5: {
				state.a = readZeroPageX();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0xAD: {
				state.a = readAbsolute();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0xBD: {
				state.a = readAbsoluteX();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0xB9: {
				state.a = readAbsoluteY();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0xA1: {
				state.a = readIndexedIndirect();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0xB1: {
				state.a = readIndirectIndexed();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			// LDX - Load X Register
			case 0xA2: {
				state.x = readImmediate();
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
			
			case 0xA6: {
				state.x = readZeroPage();
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
			
			case 0xB6: {
				state.x = readZeroPageY();
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
			
			case 0xAE: {
				state.x = readAbsolute();
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
			
			case 0xBE: {
				state.x = readAbsoluteY();
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
				
			// LDY - Load Y Register
			case 0xA0: {
				state.y = readImmediate();
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
			
			case 0xA4: {
				state.y = readZeroPage();
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
			
			case 0xB4: {
				state.y = readZeroPageX();
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
			
			case 0xAC: {
				state.y = readAbsolute();
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
			
			case 0xBC: {
				state.y = readAbsoluteX();
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
				
			// LSR - Logical Shift Right
			case 0x4A: {
				byte temp = state.a;
				setCarryFlag(BitTools.getBit(temp, 0));
				temp = (byte) (temp >> 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.a = temp;
			} break;
			
			case 0x46: {
				byte temp = readZeroPage();
				setCarryFlag(BitTools.getBit(temp, 0));
				temp = (byte) (temp >> 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--;
				writeZeroPage(temp);
			} break;
			
			case 0x56: {
				byte temp = readZeroPageX();
				setCarryFlag(BitTools.getBit(temp, 0));
				temp = (byte) (temp >> 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--;
				writeZeroPageX(temp);
			} break;
			
			case 0x4E: {
				byte temp = readAbsolute();
				setCarryFlag(BitTools.getBit(temp, 0));
				temp = (byte) (temp >> 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--; state.pc--;
				writeAbsolute(temp);
			} break;
			
			case 0x5E: {
				byte temp = readAbsoluteX();
				setCarryFlag(BitTools.getBit(temp, 0));
				temp = (byte) (temp >> 1);
				setZeroFlag(temp);
				setNegativeFlag(temp);
				state.pc--; state.pc--;
				writeAbsoluteX(temp);
			} break;
				
			// NOP - No Operation
			case 0xEA: {
			} break;
				
			// ORA - Logical Inclusive OR
			case 0x09: {
				state.a = (byte) (state.a | readImmediate());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;

			case 0x05: {
				state.a = (byte) (state.a | readZeroPage());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;

			case 0x15: {
				state.a = (byte) (state.a | readZeroPageX());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;

			case 0x0D: {
				state.a = (byte) (state.a | readAbsolute());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;

			case 0x1D: {
				state.a = (byte) (state.a | readAbsoluteX());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;

			case 0x19: {
				state.a = (byte) (state.a | readAbsoluteY());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x01: {
				state.a = (byte) (state.a | readIndexedIndirect());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x11: {
				state.a = (byte) (state.a | readIndirectIndexed());
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			// PHA - Push Accumulator
			case 0x48: {
				pushStack(state.a);
			} break;
				
			// PHP - Push Processor Status
			case 0x08: {
				pushStack(state.s);
			} break;
				
			// PLA - Pull Accumulator
			case 0x68: {
				state.a = pullStack();
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			// PLP - Pull Processor Status
			case 0x28: {
				state.s = pullStack();
			} break;
				
			// ROL - Rotate Left
			case 0x2A: {
				byte old = state.a;
				state.a = (byte) ((getCarryFlag() ? 1 : 0) | (old << 1));
				setCarryFlag(BitTools.getBit(old, 7));
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			case 0x26: {
				byte old = readZeroPage();
				state.pc--;
				writeZeroPage((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
				setCarryFlag(BitTools.getBit(old, 7));
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x36: {
				byte old = readZeroPageX();
				state.pc--;
				writeZeroPageX((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
				setCarryFlag(BitTools.getBit(old, 7));
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
    		case 0x2E: {
    			byte old = readAbsolute();
    			state.pc--; state.pc--;
    			writeAbsolute((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
    			setCarryFlag(BitTools.getBit(old, 7));
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
    		} break;
    		
        	case 0x3E: {
        		byte old = readAbsoluteX();
        		state.pc--; state.pc--;
        		writeAbsoluteX((byte) ((getCarryFlag() ? 1 : 0) | (old << 1)));
        		setCarryFlag(BitTools.getBit(old, 7));
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
        	} break;
				
			// ROR - Rotate Right
			case 0x6A: {
				byte old = state.a;
				state.a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
				setCarryFlag(BitTools.getBit(old, 0));
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			case 0x66: {
				byte old = readZeroPage();
				state.a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
				state.pc--;
				setCarryFlag(BitTools.getBit(old, 0));
				writeZeroPage(state.a);
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
			case 0x76: {
				byte old = readZeroPageX();
				state.pc--;
				state.a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
				setCarryFlag(BitTools.getBit(old, 0));
				writeZeroPageX(state.a);
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
			
    		case 0x6E: {
    			byte old = readAbsolute();
    			state.pc--; state.pc--;
    			state.a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
    			setCarryFlag(BitTools.getBit(old, 0));
    			writeAbsolute(state.a);
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
    		} break;
    		
        	case 0x7E: {
        		byte old = readAbsoluteX();
        		state.pc--; state.pc--;
        		state.a = (byte) (((getCarryFlag() ? 1 : 0) << 7) | (old >> 1));
        		setCarryFlag(BitTools.getBit(old, 0));
        		writeAbsoluteX(state.a);
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
        	} break;
				
			// RTI - Return from Interrupt
			case 0x40: {
				state.s = pullStack();
				state.pc = (short) (((pullStack() & 0xFF) << 8) | ((pullStack() & 0xFF)) & 0xFFFF);
				//System.out.format("    [CPU] RTI to %X%n", pc&0xFFFF);
			} break;
				
			// RTS - Return from Subroutine
			case 0x60: {
				state.pc = (short) (((pullStack() & 0xFF) << 8) | ((pullStack() & 0xFF)) & 0xFFFF);
				//System.out.format("    [CPU] RTS to %X%n", pc&0xFFFF);
			} break;
				
			// SBC - Subtract with Carry
			case 0xE9: {
				byte b      = readImmediate();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.a = result;
			} break;
			
			case 0xE5: {
				byte b      = readZeroPage();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--;
				writeZeroPage(result);
			} break;
			
			case 0xF5: {
				byte b      = readZeroPageX();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--;
				writeZeroPageX(result);
			} break;
			
			case 0xED: {
				byte b      = readAbsolute();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeAbsolute(result);
			} break;
			
			case 0xFD: {
				byte b      = readAbsoluteX();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeAbsoluteX(result);
			} break;
			
			case 0xF9: {
				byte b      = readAbsoluteY();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeAbsoluteY(result);
			} break;
			
			case 0xE1: {
				byte b      = readIndexedIndirect();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
				writeIndexedIndirect(result);
			} break;
			
			case 0xF1: {
				byte b      = readIndirectIndexed();
				byte result = (byte) (state.a - b - (!getCarryFlag() ? 1 : 0));
				int  count  = state.a - b - (getCarryFlag() ? 1 : 0);
				
				setCarryFlag(count < -128 || count > 127);
				setZeroFlag(result);
				setOverflowFlag(count < -128 || count > 127); //almost certainly wrong
				setNegativeFlag(result);
				state.pc--; state.pc--;
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
				writeZeroPage(state.a);
			} break;
				
			case 0x95: {
				writeZeroPageX(state.a);
			} break;
				
			case 0x8D: {
				writeAbsolute(state.a);
			} break;
				
			case 0x9D: {
				writeAbsoluteX(state.a);
			} break;
				
			case 0x99: {
				writeAbsoluteY(state.a);
			} break;
			
			case 0x81: {
				writeIndexedIndirect(state.a);
			} break;
			
			case 0x91: {
				writeIndirectIndexed(state.a);
			} break;
				
			// STX - write X Register
			case 0x86: {
				writeZeroPage(state.x);
			} break;
				
			case 0x96: {
				writeZeroPageX(state.x);
			} break;
				
			case 0x8E: {
				writeAbsolute(state.x);
			} break;
				
			// STY - write Y Register
			case 0x84: {
				writeZeroPage(state.y);
			} break;
				
			case 0x94: {
				writeZeroPageX(state.y);
			} break;
				
			case 0x8C: {
				writeAbsolute(state.y);
			} break;
				
			// TAX - Transfer Accumulator to X
			case 0xAA: {
				state.x = state.a;
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
				
			// TAY - Transfer Accumulator to Y
			case 0xA8: {
				state.y = state.a;
				setZeroFlag(state.y);
				setNegativeFlag(state.y);
			} break;
				
			// TSX - Transfer Stack Pointer to X
			case 0xBA: {
				state.x = state.sp;
				setZeroFlag(state.x);
				setNegativeFlag(state.x);
			} break;
				
			// TXA - Transfer X to Accumulator
			case 0x8A: {
				state.a = state.x;
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			// TXS - Transfer X to Stack Pointer
			case 0x9A: {
				state.sp = state.x;
			} break;
				
			// TYA - Transfer Y to Accumulator
			case 0x98: {
				state.a = state.y;
				setZeroFlag(state.a);
				setNegativeFlag(state.a);
			} break;
				
			//     - Default action (Invalid Opcode)
			default: {
				logger.error("Invalid: %X @ %X", readMemoryMap(state.pc)&0xFF, state.pc&0xFFFF);
			}
		}
	}
	
	/**
	 * Creates and returns a String representation of this instance of a RicohCPU.
	 * @return Pretty String representation.
	 */
	public String toString() {
		return state.toString();
	}
}