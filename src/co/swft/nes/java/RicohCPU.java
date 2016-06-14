package co.swft.nes.java;

import java.util.ArrayList;
import java.util.List;

import com.stackoverflow.jewelsea.Log;
import com.stackoverflow.jewelsea.Logger;

import co.swft.nes.abstracts.Controlable;
import co.swft.nes.enums.EmulationMode;
import co.swft.nes.enums.Instruction;
import co.swft.nes.enums.InstructionSet;
import co.swft.nes.interfaces.CycleListener;
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
	private List<CycleListener> listeners = new ArrayList<>();
	
	public co.swft.nes.java.State state;

	public EmulationMode mode = EmulationMode.DEFAULT;
	
	public boolean debugMode = true;
	
	/**
	 * Constructs a new RicohCPU.
	 * @param game NESFile
	 * @param ppu PPU
	 * @param apu APU
	 */
	public RicohCPU(Log log, NESCartridge game, RicohPPU ppu, RicohAPU apu) {
		this.logger = new AlertLogger(log, "CPU");
		this.state = new co.swft.nes.java.State(log, game, ppu, apu);
		logger.info("Created");
	}
	
	/**
	 * run() starts the emulation.
	 */
	public void run() {
		while(!stopFlag) {
			logger.info("Starting Emulation in %s mode", mode.toString());
			
			// Skip forward at the start, horrible hack
//			while(InstructionSet.lookup(state.readMemoryMap(state.pc)) == InstructionSet.BRK_00_Implied) state.pc++;
			
			switch(mode) {
			case DEFAULT:
				if(debugMode) {
					while(!checkMonitor()) {
						InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc));
						logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
//						fireCycleListeners(new CycleEvent(instruction));
						executeInstruction(instruction);
					}
				} else {
					while(!checkMonitor()) {
						executeInstruction(InstructionSet.lookup(state.readMemoryMap(state.pc)));
					}
				}
				break;
			case INTO:
				if (!checkMonitor()) {
					InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc));
					logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
//					fireCycleListeners(new CycleEvent(instruction));
					executeInstruction(instruction);
				}
				break;
			case OUT:
				while(!checkMonitor()) {
					InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc));
					logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
//					fireCycleListeners(new CycleEvent(instruction));
					executeInstruction(instruction);
					
					if(instruction.instruction == Instruction.RTS) break;
				}
				break;
			case OVER:
				int depth = 0;
				while(!checkMonitor()) {
					InstructionSet instruction = InstructionSet.lookup(state.readMemoryMap(state.pc));
					logger.debug("$%04x\t%s", state.pc, instruction.toString(state.readMemoryMap(state.pc+1), state.readMemoryMap(state.pc+2)));
//					fireCycleListeners(new CycleEvent(instruction));
					executeInstruction(instruction);
					
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
	
	public synchronized boolean addCycleListener(CycleListener l) {
		return listeners.add(l);
	}
	
	public synchronized boolean removeCycleListener(CycleListener l) {
		return listeners.remove(l);
	}
	
	public synchronized void fireCycleListeners(CycleEvent e) {
		listeners.forEach(l -> {l.cycleStarted(e); try{Thread.sleep(2);}catch(Exception ignore){}});
	}
	
	public void executeInstruction(InstructionSet instr) {
		// NMI Interrupts
		if(BitTools.getBit(state.ppu.status, 7) && BitTools.getBit(state.ppu.controller, 7)) {
			System.out.println(Integer.toHexString(state.pc & 0xffff));
			state.pushStack((byte) ((state.pc & 0xFF00) >>> 8));
			state.pushStack((byte) (state.pc & 0x00FF));
			state.pushStack(state.s);
			state.pc = state.nmiVector();
			state.ppu.status = BitTools.setBit(state.ppu.status, 7, false);
			
			logger.debug("NMI Interupt");
			
			return;
		}
		
		// RQI Interrupts
		// TODO
		
		switch (instr.instruction) {
			/* Documented */
			case ADC: {
				int i = Unsigned.add(state.a, state.read(instr.addr), (byte) (state.getCarryFlag() ? 1 : 0));
				state.setOverflowFlag((state.a & 0x80) != (i & 0x80));
				state.setNegativeFlag((byte) i);
				state.setZeroFlag((byte) i);
				state.setCarryFlag(i > 255);
				state.a = (byte) i;
			} break;
			case AND: {
				state.a = Unsigned.and(state.a, state.read(instr.addr));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case ASL: {
				byte b = state.read(instr.addr);
				state.setCarryFlag((b & 0x80) != 0);
				b = Unsigned.shiftl(b, (byte) 1);
				state.write(instr.addr, b);
				state.setNegativeFlag(b);
				state.setNegativeFlag(b);
			} break;
			case BCC: if(!state.getCarryFlag())    {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BCC to %x", state.pc);} break;
			case BCS: if( state.getCarryFlag())    {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BCS to %x", state.pc);} break;
			case BEQ: if( state.getZeroFlag())     {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BEQ to %x", state.pc);} break;
			case BIT: {
				byte b = (byte) (state.a & state.read(instr.addr));
				state.setNegativeFlag(b);
				state.setOverflowFlag((b & 0x40) != 0);
				state.setZeroFlag(b);
			} break;
			case BMI: if( state.getNegativeFlag()) {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BMI to %x", state.pc);} break;
			case BNE: if(!state.getZeroFlag())     {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BNE to %x", state.pc);} break;
			case BPL: if(!state.getNegativeFlag()) {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BPL to %x", state.pc);} break;
			case BRK: {
				state.pc = Unsigned.inc(state.pc);
				state.pushStack((byte) ((state.pc & 0xFF00) >>> 8));
				state.pushStack((byte) (state.pc & 0x00FF));
				state.pushStack(state.s);
				state.pc = Unsigned.sub(state.irqVector(), (short) instr.length);
				state.setBreakFlag(true);
				
				logger.debug("Force Interupt");
			} break;
			case BVC: if(!state.getOverflowFlag()) {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BVC to %x", state.pc);} break;
			case BVS: if( state.getOverflowFlag()) {state.pc = state.address(instr.addr); if(debugMode) logger.debug("BVS to %x", state.pc);} break;
			case CLC: state.setCarryFlag    (false); break;
			case CLD: state.setDecimalFlag  (false); break;
			case CLI: state.setInterruptFlag(false); break;
			case CLV: state.setOverflowFlag (false); break;
			case CMP: {
				byte b = (byte) ((state.a & 0xff) - (state.read(instr.addr) & 0xff));
				state.setNegativeFlag(b);
				state.setCarryFlag(state.a >= state.read(instr.addr));
				state.setZeroFlag(b);
			} break;
			case CPX: {
				byte b = (byte) ((state.x & 0xff) - (state.read(instr.addr) & 0xff));
				state.setNegativeFlag(b);
				state.setCarryFlag(state.x >= state.read(instr.addr));
				state.setZeroFlag(b);
			} break;
			case CPY: {
				byte b = (byte) ((state.y & 0xff) - (state.read(instr.addr) & 0xff));
				state.setNegativeFlag(b);
				state.setCarryFlag(state.y >= state.read(instr.addr));
				state.setZeroFlag(b);
			} break;
			case DEC: {
				byte b = (byte) ((state.read(instr.addr) & 0xff) - 1);
				state.write(instr.addr, b);
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
				state.a = (byte) (state.a ^ state.read(instr.addr));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case INC: {
				byte b = (byte) ((state.read(instr.addr) & 0xff) + 1);
				state.write(instr.addr, b);
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
			case JMP: {state.pc = state.address(instr.addr, -instr.length); if(debugMode) logger.debug("JMP to %x", state.pc);} break;
			case JSR: {
				short d = state.address(instr.addr, -instr.length);
				short s = (short) ((state.pc & 0xffff) - 1);
				state.pushStack((byte) ((s & 0xFF00) >>> 8));
				state.pushStack((byte) ((s & 0x00FF)));
				state.pc = d;
				if(debugMode) logger.debug("JSR to %x", state.pc);
			} break;
			case LDA: {
				state.a = state.read(instr.addr);
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case LDX: {
				state.x = state.read(instr.addr);
				state.setNegativeFlag(state.x);
				state.setZeroFlag(state.x);
			} break;
			case LDY: {
				state.y = state.read(instr.addr);
				state.setNegativeFlag(state.y);
				state.setZeroFlag(state.y);
			} break;
			case LSR: {
				byte b = state.read(instr.addr);
				state.setNegativeFlag(false);
				state.setCarryFlag((b & 0x01) != 0);
				b = (byte) ((b >>> 1) & 0x7f);
				state.setZeroFlag(b);
				state.write(instr.addr, b);
			} break;
			case NOP: /* L I T E R A L L Y   N O T H I N G */ break;
			case ORA: {
				state.a = (byte) (state.a | state.read(instr.addr));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case PHA: state.pushStack(state.a); break;
			case PHP: state.pushStack(state.s); break;
			case PLA: state.a = state.pullStack(); break;
			case PLP: state.s = state.pullStack(); break;
			case ROL: {
				byte b = state.read(instr.addr);
				boolean t = (b & 0x80) != 0;
				b = (byte) ((b << 1) & 0xfe | (state.getCarryFlag() ? 1 : 0));
				state.write(instr.addr, b);
				state.setCarryFlag(t);
				state.setZeroFlag(b);
				state.setNegativeFlag(b);
			} break;
			case ROR: {
				byte b = state.read(instr.addr);
				boolean t = (b & 0x80) != 0;
				b = (byte) ((b << 1) & 0xfe | (state.getCarryFlag() ? 1 : 0));
				state.write(instr.addr, b);
				state.setCarryFlag(t);
				state.setZeroFlag(b);
				state.setNegativeFlag(b);
			} break;
			case RTI: {
				state.s  = state.pullStack();
				state.pc = Unsigned.sub(Unsigned.or(state.pullStack(), Unsigned.shiftl(state.pullStack(), (short) 8)), (short) 1); 
				logger.debug("RTI to %x", state.pc);
			} break;
			case RTS: {
				state.pc = Unsigned.add(Unsigned.or(state.pullStack(), Unsigned.shiftl(state.pullStack(), (short) 8)), (short) 3);
				if(debugMode) logger.debug("RTS to %x", state.pc);
			} break;
			case SBC: {
				int t = state.a - state.read(instr.addr) - (state.getCarryFlag() ? 0 : 1);
				state.setOverflowFlag(t > 127 || t < -128);
				state.setCarryFlag(t >= 0);
				state.a = (byte) t;
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case SEC: state.setCarryFlag    (true); break;
			case SED: state.setDecimalFlag  (true); break;
			case SEI: state.setInterruptFlag(true); break;
			case STA: state.write(instr.addr, state.a); break;
			case STX: state.write(instr.addr, state.x); break;
			case STY: state.write(instr.addr, state.y); break;
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
			
			/* Undocumented */
			case AAC: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.a = Unsigned.and(state.a, state.read(instr.addr));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
				state.setCarryFlag(state.getNegativeFlag());
			} break;
			case AAX: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				byte b = Unsigned.and(state.x, state.a);
				state.write(instr.addr, b);
				state.setNegativeFlag(b);
				state.setZeroFlag(b);
			} break;
			case ARR: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				logger.error("Unimplemented Instruction: " + instr.instruction);
			} break;
			case ASR: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				logger.error("Unimplemented Instruction: " + instr.instruction);
			} break;
			case ATX: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.x = state.a = Unsigned.and(state.read(instr.addr), state.a);
				state.setNegativeFlag(state.x);
				state.setZeroFlag(state.x);
			} break;
			case AXA: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.write(instr.addr, Unsigned.and(Unsigned.and(state.x, state.a), (byte) 7));
			} break;
			case AXS: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				logger.error("Unimplemented Instruction: " + instr.instruction);
			} break;
			case DCP: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				logger.error("Unimplemented Instruction: " + instr.instruction);
			} break;
			case DOP: logger.warn("Undocumented Instruction: " + instr.instruction); /* L I T E R A L L Y   N O T H I N G */ break;
			case ISC: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				logger.error("Unimplemented Instruction: " + instr.instruction);
			} break;
			case KIL: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.pc = Unsigned.sub(state.pc, (short) instr.length);
				pauseMonitor();
			} break;
			case LAR: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.a = state.x = state.sp = Unsigned.and(state.sp, state.read(instr.addr));
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case LAX: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.a = state.x = state.read(instr.addr);
				state.setNegativeFlag(state.a);
				state.setZeroFlag(state.a);
			} break;
			case RLA: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				byte b = Unsigned.rotl(state.read(instr.addr));
				byte i = Unsigned.and(state.a, b);
				state.write(instr.addr, b);
				state.a = i;
				state.setNegativeFlag(i);
				state.setZeroFlag(i);
			} break;
			case RRA: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				byte b = Unsigned.rotr(state.read(instr.addr));
				int  i = Unsigned.add(state.a, b, state.getCarryFlag() ? 1 : 0);
				state.write(instr.addr, b);
				state.a = (byte) i;
				state.setCarryFlag(false);
				state.setNegativeFlag((byte) i);
				state.setOverflowFlag(i > 255);
				state.setZeroFlag((byte) i);
			} break;
			case SLO: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				byte b = state.read(instr.addr);
				state.setCarryFlag(Unsigned.bit(b, 7));
				b = Unsigned.or(Unsigned.shiftl(b));
				state.write(instr.addr, b);
				state.setNegativeFlag(b);
				state.setZeroFlag(b);
			} break;
			case SRE: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				byte b = state.read(instr.addr);
				state.setCarryFlag(Unsigned.bit(b, 0));
				b = Unsigned.xor(Unsigned.shiftr(b));
				state.write(instr.addr, b);
				state.setNegativeFlag(b);
				state.setZeroFlag(b);
			} break;
			case SXA: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.write(instr.addr, Unsigned.and(state.x, Unsigned.inc(Unsigned.high(state.address(instr.addr)))));
			} break;
			case SYA: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.write(instr.addr, Unsigned.and(state.y, Unsigned.inc(Unsigned.high(state.address(instr.addr)))));
			} break;
			case TOP: logger.warn("Undocumented Instruction: " + instr.instruction); /* L I T E R A L L Y   N O T H I N G */ break;
			case XAA: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				logger.error("Unimplemented Instruction: " + instr.instruction);
				// TODO poorly defined
			} break;
			case XAS: {
				logger.warn("Undocumented Instruction: " + instr.instruction);
				state.sp = Unsigned.add(state.x, state.a);
				state.write(instr.addr, Unsigned.and(state.sp, Unsigned.inc(Unsigned.high(state.address(instr.addr)))));
			} break;
			
			/* Unknown */
			default: logger.error("Invalid Instruction: " + instr); break;
		}

		state.pc += instr.length;
	}
	
	/**
	 * Creates and returns a String representation of this instance of a RicohCPU.
	 * @return Pretty String representation.
	 */
	public String toString() {
		return state.toString();
	}
}