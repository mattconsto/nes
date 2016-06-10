package co.swft.nes.java;

import java.util.ArrayList;
import java.util.List;

import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.Logger;

import co.swft.nes.abstracts.Controlable;
import co.swft.nes.abstracts.Instruction;

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
	
	public enum EmulationMode {DEFAULT, INTO, OUT, OVER};

	private EmulationMode mode = EmulationMode.DEFAULT;
	
	public void setMode(EmulationMode mode) {
		if(this.mode != mode) {
			pauseMonitor();
			this.mode = mode;
		}
	}
	
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
	 * run() starts the emulation.
	 */
	public void run() {
		while(!stopFlag && !state.getBreakFlag()) {
			logger.info("Starting Emulation in %s mode", mode.toString());
			
			switch(mode) {
			case DEFAULT:
				while(!checkMonitor() && !state.getBreakFlag()) {
					InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc) & 0xff);
					logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
					fireCycleListeners(new CycleEvent(instruction));
					executeInstruction(instruction);
					state.pc += instruction.length;
				}
				break;
			case INTO:
				if(!checkMonitor() && !state.getBreakFlag()) {
					InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc) & 0xff);
					logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
					fireCycleListeners(new CycleEvent(instruction));
					executeInstruction(instruction);
					state.pc += instruction.length;
				}
				break;
			case OUT:
				while(!checkMonitor() && !state.getBreakFlag()) {
					InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc) & 0xff);
					logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
					fireCycleListeners(new CycleEvent(instruction));
					executeInstruction(instruction);
					state.pc += instruction.length;
					
					if(instruction.instruction == Instruction.RTS) break;
				}
				break;
			case OVER:
				int depth = 0;
				while(!checkMonitor() && !state.getBreakFlag()) {
					InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc) & 0xff);
					logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
					fireCycleListeners(new CycleEvent(instruction));
					executeInstruction(instruction);
					state.pc += instruction.length;
					
					if(instruction.instruction == Instruction.JSR) depth++;
					if(instruction.instruction == Instruction.RTS) depth--;
					if(depth <= 0) break;
				}
				break;
			}

			pauseMonitor();
			checkBlocking();
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
	
	public void executeInstruction(InstructionSet instruction) {
		switch (instruction.instruction) {
			case ADC: {
				int i = (state.a & 0xff) + (state.read(instruction.addressing) & 0xff) + (state.getCarryFlag() ? 1 : 0);
				state.setOverflowFlag((state.a & 0x80) != (i & 0x80));
				state.setNegativeFlag((byte) i);
				state.setZeroFlag((byte) i);
				state.setCarryFlag(i > 255);
				state.a = (byte) i;
			} break;
			case AND: {
				state.a = (byte) (state.a & state.read(instruction.addressing));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case ASL: {
				byte b = state.read(instruction.addressing);
				state.setCarryFlag((b & 0x80) != 0);
				b = (byte) ((b << 1) & 0xfe);
				state.write(instruction.addressing, b);
				state.setNegativeFlag(b);
				state.setNegativeFlag(b);
			} break;
			case BCC: if(!state.getCarryFlag())    state.pc += state.read(instruction.addressing); break;
			case BCS: if( state.getCarryFlag())    state.pc += state.read(instruction.addressing); break;
			case BEQ: if( state.getZeroFlag())     state.pc += state.read(instruction.addressing);break;
			case BIT: {
				byte b = (byte) (state.a & state.read(instruction.addressing));
				state.setNegativeFlag(b);
				state.setOverflowFlag((b & 0x40) != 0);
				state.setZeroFlag(b);
			} break;
			case BMI: if( state.getNegativeFlag()) state.pc += state.read(instruction.addressing); break;
			case BNE: if(!state.getZeroFlag())     state.pc += state.read(instruction.addressing); break;
			case BPL: if(!state.getNegativeFlag()) state.pc += state.read(instruction.addressing); break;
			case BRK: {
				state.pc += 1;
				state.pushStack((byte) ((state.pc & 0xFF00) >> 8));
				state.pushStack((byte) (state.pc & 0x00FF));
				state.pushStack(state.s);
				state.pc = (short) (state.readMemoryMap((short) 0xFFFE) | (state.readMemoryMap((short) 0xFFFF) << 8));
				state.setBreakFlag(true);
				
				logger.debug("Force Interupt");
			} break;
			case BVC: if(!state.getOverflowFlag()) state.pc += state.read(instruction.addressing); break;
			case BVS: if( state.getOverflowFlag()) state.pc += state.read(instruction.addressing); break;
			case CLC: state.setCarryFlag    (false); break;
			case CLD: state.setDecimalFlag  (false); break;
			case CLI: state.setInterruptFlag(false); break;
			case CLV: state.setOverflowFlag(false); break;
			case CMP: {
				byte b = (byte) ((state.a & 0xff) - (state.read(instruction.addressing) & 0xff));
				state.setNegativeFlag(b);
				state.setCarryFlag(state.a >= state.read(instruction.addressing));
				state.setZeroFlag(b);
			} break;
			case CPX: {
				byte b = (byte) ((state.x & 0xff) - (state.read(instruction.addressing) & 0xff));
				state.setNegativeFlag(b);
				state.setCarryFlag(state.x >= state.read(instruction.addressing));
				state.setZeroFlag(b);
			} break;
			case CPY: {
				byte b = (byte) ((state.y & 0xff) - (state.read(instruction.addressing) & 0xff));
				state.setNegativeFlag(b);
				state.setCarryFlag(state.y >= state.read(instruction.addressing));
				state.setZeroFlag(b);
			} break;
			case DEC: {
				byte b = (byte) ((state.read(instruction.addressing) & 0xff) - 1);
				state.write(instruction.addressing, b);
				state.setNegativeFlag(b);
				state.setZeroFlag(b);
			} break;
			case DEX: {
				state.x = (byte) ((state.x & 0xFF) - 1);
				state.setZeroFlag(state.x);
				state.setNegativeFlag(state.x);
			} break;
			case DEY: {
				state.y = (byte) ((state.y & 0xFF) - 1);
				state.setZeroFlag(state.y);
				state.setNegativeFlag(state.y);
			} break;
			case EOR: {
				state.a = (byte) (state.a ^ state.read(instruction.addressing));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case INC: {
				byte b = (byte) ((state.read(instruction.addressing) & 0xff) + 1);
				state.write(instruction.addressing, b);
				state.setNegativeFlag(b);
				state.setZeroFlag(b);
			} break;
			case INX: {
				state.x = (byte) ((state.x & 0xFF) + 1);
				state.setZeroFlag(state.x);
				state.setNegativeFlag(state.x);
			} break;
			case INY: {
				state.y = (byte) ((state.y & 0xFF) + 1);
				state.setZeroFlag(state.y);
				state.setNegativeFlag(state.y);
			} break;
			case JMP: state.pc = state.read(instruction.addressing); break;
			case JSR: {
				short d = state.read(instruction.addressing);
				short s = (short) ((state.pc & 0xffff) - 1);
				state.pushStack((byte) ((s & 0xFF00) >> 8));
				state.pushStack((byte) ((s & 0x00FF)));
				state.pc = d;
			} break;
			case LDA: {
				state.a = state.read(instruction.addressing);
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case LDX: {
				state.x = state.read(instruction.addressing);
				state.setNegativeFlag(state.x);
				state.setZeroFlag(state.x);
			} break;
			case LDY: {
				state.y = state.read(instruction.addressing);
				state.setNegativeFlag(state.y);
				state.setZeroFlag(state.y);
			} break;
			case LSR: {
				byte b = state.read(instruction.addressing);
				state.setNegativeFlag(false);
				state.setCarryFlag((b & 0x01) != 0);
				b = (byte) ((b >> 1) & 0x7f);
				state.setZeroFlag(b);
				state.write(instruction.addressing, b);
			} break;
			case NOP: /* L I T E R A L L Y   N O T H I N G */ break;
			case ORA: {
				state.a = (byte) (state.a | state.read(instruction.addressing));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case PHA: state.pushStack(state.a); break;
			case PHP: state.pushStack(state.s); break;
			case PLA: state.a = state.pullStack(); break;
			case PLP: state.s = state.pullStack(); break;
			case ROL: {
				byte b = state.read(instruction.addressing);
				boolean t = (b & 0x80) != 0;
				b = (byte) ((b << 1) & 0xfe | (state.getCarryFlag() ? 1 : 0));
				state.write(instruction.addressing, b);
				state.setCarryFlag(t);
				state.setZeroFlag(b);
				state.setNegativeFlag(b);
			} break;
			case ROR: {
				byte b = state.read(instruction.addressing);
				boolean t = (b & 0x80) != 0;
				b = (byte) ((b << 1) & 0xfe | (state.getCarryFlag() ? 1 : 0));
				state.write(instruction.addressing, b);
				state.setCarryFlag(t);
				state.setZeroFlag(b);
				state.setNegativeFlag(b);
			} break;
			case RTI: {
				state.s  = state.pullStack();
				state.pc = (short) (state.pullStack() | (state.pullStack() << 8)); 
			} break;
			case RTS: state.pc = (short) (((state.pullStack() | (state.pullStack() << 8)) & 0xffff) + 1); break;
			case SBC: {
				int t = state.a - state.read(instruction.addressing) - (state.getCarryFlag() ? 0 : 1);
				state.setOverflowFlag(t > 127 || t < -128);
				state.setCarryFlag(t >= 0);
				state.a = (byte) t;
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case SEC: state.setCarryFlag    (true); break;
			case SED: state.setDecimalFlag  (true); break;
			case SEI: state.setInterruptFlag(true); break;
			case STA: state.write(instruction.addressing, state.a); break;
			case STX: state.write(instruction.addressing, state.x); break;
			case STY: state.write(instruction.addressing, state.y); break;
			case TAX: {
				state.x = state.a;
				state.setNegativeFlag(state.x);
				state.setZeroFlag(state.x);
			} break;
			case TAY: {
				state.y = state.a;
				state.setNegativeFlag(state.y);
				state.setZeroFlag(state.y);
			} break;
			case TSX: {
				state.x = state.sp;
				state.setNegativeFlag(state.x);
				state.setZeroFlag(state.x);
			} break;
			case TXA: {
				state.a = state.x;
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case TXS: state.sp = state.x; break;
			case TYA: {
				state.a = state.y;
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			default: logger.error("Invalid Instruction: " + instruction); break;
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