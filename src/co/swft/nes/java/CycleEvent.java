package co.swft.nes.java;

import co.swft.nes.enums.InstructionSet;

public class CycleEvent {
	public final InstructionSet instruction;
	
	public CycleEvent(InstructionSet instruction) {
		this.instruction = instruction;
	}
}
