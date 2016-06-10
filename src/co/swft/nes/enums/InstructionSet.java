package co.swft.nes.enums;

public enum InstructionSet {
	ADC_Immediate	(Instruction.ADC,	AddressingMode.Immediate,	0x69,	2,	2,	false),
	ADC_ZeroPage	(Instruction.ADC,	AddressingMode.ZeroPage,	0x65,	2,	3,	false),
	ADC_ZeroPageX	(Instruction.ADC,	AddressingMode.ZeroPageX,	0x75,	2,	4,	false),
	ADC_Absolute	(Instruction.ADC,	AddressingMode.Absolute,	0x6D,	3,	4,	false),
	ADC_AbsoluteX	(Instruction.ADC,	AddressingMode.AbsoluteX,	0x7D,	3,	4,	true ),
	ADC_AbsoluteY	(Instruction.ADC,	AddressingMode.AbsoluteY,	0x79,	3,	4,	true ),
	ADC_IndirectX	(Instruction.ADC,	AddressingMode.IndirectX,	0x61,	2,	6,	false),
	ADC_IndirectY	(Instruction.ADC,	AddressingMode.IndirectY,	0x71,	2,	5,	true ),
	AND_Immediate	(Instruction.AND,	AddressingMode.Immediate,	0x29,	2,	2,	false),
	AND_ZeroPage	(Instruction.AND,	AddressingMode.ZeroPage,	0x25,	2,	3,	false),
	AND_ZeroPageX	(Instruction.AND,	AddressingMode.ZeroPageX,	0x35,	2,	4,	false),
	AND_Absolute	(Instruction.AND,	AddressingMode.Absolute,	0x2D,	3,	4,	false),
	AND_AbsoluteX	(Instruction.AND,	AddressingMode.AbsoluteX,	0x3D,	3,	4,	true ),
	AND_AbsoluteY	(Instruction.AND,	AddressingMode.AbsoluteY,	0x39,	3,	4,	true ),
	AND_IndirectX	(Instruction.AND,	AddressingMode.IndirectX,	0x21,	2,	6,	false),
	AND_IndirectY	(Instruction.AND,	AddressingMode.IndirectY,	0x31,	2,	5,	true ),
	ASL_Accumulator	(Instruction.ASL,	AddressingMode.Accumulator,	0x0A,	1,	2,	false),
	ASL_ZeroPage	(Instruction.ASL,	AddressingMode.ZeroPage,	0x06,	2,	5,	false),
	ASL_ZeroPageX	(Instruction.ASL,	AddressingMode.ZeroPageX,	0x16,	2,	6,	false),
	ASL_Absolute	(Instruction.ASL,	AddressingMode.Absolute,	0x0E,	3,	6,	false),
	ASL_AbsoluteX	(Instruction.ASL,	AddressingMode.AbsoluteX,	0x1E,	3,	7,	false),
	BIT_ZeroPage	(Instruction.BIT,	AddressingMode.ZeroPage,	0x24,	2,	3,	false),
	BIT_Absolute	(Instruction.BIT,	AddressingMode.Absolute,	0x2C,	3,	4,	false),
	BPL_Immediate	(Instruction.BPL,	AddressingMode.Relative,	0x10,	2,	2,	true ),
	BMI_Immediate	(Instruction.BMI,	AddressingMode.Relative,	0x30,	2,	2,	true ),
	BVC_Immediate	(Instruction.BVC,	AddressingMode.Relative,	0x50,	2,	2,	true ),
	BVS_Immediate	(Instruction.BVS,	AddressingMode.Relative,	0x70,	2,	2,	true ),
	BCC_Immediate	(Instruction.BCC,	AddressingMode.Relative,	0x90,	2,	2,	true ),
	BCS_Immediate	(Instruction.BCS,	AddressingMode.Relative,	0xB0,	2,	2,	true ),
	BNE_Immediate	(Instruction.BNE,	AddressingMode.Relative,	0xD0,	2,	2,	true ),
	BEQ_Immediate	(Instruction.BEQ,	AddressingMode.Relative,	0xF0,	2,	2,	true ),
	BRK_Implied		(Instruction.BRK,	AddressingMode.Implied,		0x00,	1,	7,	false),
	CMP_Immediate	(Instruction.CMP,	AddressingMode.Immediate,	0xC9,	2,	2,	false),
	CMP_ZeroPage	(Instruction.CMP,	AddressingMode.ZeroPage,	0xC5,	2,	3,	false),
	CMP_ZeroPageX	(Instruction.CMP,	AddressingMode.ZeroPageX,	0xD5,	2,	4,	false),
	CMP_Absolute	(Instruction.CMP,	AddressingMode.Absolute,	0xCD,	3,	4,	false),
	CMP_AbsoluteX	(Instruction.CMP,	AddressingMode.AbsoluteX,	0xDD,	3,	4,	true ),
	CMP_AbsoluteY	(Instruction.CMP,	AddressingMode.AbsoluteY,	0xD9,	3,	4,	true ),
	CMP_IndirectX	(Instruction.CMP,	AddressingMode.IndirectX,	0xC1,	2,	6,	false),
	CMP_IndirectY	(Instruction.CMP,	AddressingMode.IndirectY,	0xD1,	2,	5,	true ),
	CPX_Immediate	(Instruction.CPX,	AddressingMode.Immediate,	0xE0,	2,	2,	false),
	CPX_ZeroPage	(Instruction.CPX,	AddressingMode.ZeroPage,	0xE4,	2,	3,	false),
	CPX_Absolute	(Instruction.CPX,	AddressingMode.Absolute,	0xEC,	3,	4,	false),
	CPY_Immediate	(Instruction.CPY,	AddressingMode.Immediate,	0xC0,	2,	2,	false),
	CPY_ZeroPage	(Instruction.CPY,	AddressingMode.ZeroPage,	0xC4,	2,	3,	false),
	CPY_Absolute	(Instruction.CPY,	AddressingMode.Absolute,	0xCC,	3,	4,	false),
	DEC_ZeroPage	(Instruction.DEC,	AddressingMode.ZeroPage,	0xC6,	2,	5,	false),
	DEC_ZeroPageX	(Instruction.DEC,	AddressingMode.ZeroPageX,	0xD6,	2,	6,	false),
	DEC_Absolute	(Instruction.DEC,	AddressingMode.Absolute,	0xCE,	3,	6,	false),
	DEC_AbsoluteX	(Instruction.DEC,	AddressingMode.AbsoluteX,	0xDE,	3,	7,	false),
	EOR_Immediate	(Instruction.EOR,	AddressingMode.Immediate,	0x49,	2,	2,	false),
	EOR_ZeroPage	(Instruction.EOR,	AddressingMode.ZeroPage,	0x45,	2,	3,	false),
	EOR_ZeroPageX	(Instruction.EOR,	AddressingMode.ZeroPageX,	0x55,	2,	4,	false),
	EOR_Absolute	(Instruction.EOR,	AddressingMode.Absolute,	0x4D,	3,	4,	false),
	EOR_AbsoluteX	(Instruction.EOR,	AddressingMode.AbsoluteX,	0x5D,	3,	4,	true ),
	EOR_AbsoluteY	(Instruction.EOR,	AddressingMode.AbsoluteY,	0x59,	3,	4,	true ),
	EOR_IndirectX	(Instruction.EOR,	AddressingMode.IndirectX,	0x41,	2,	6,	false),
	EOR_IndirectY	(Instruction.EOR,	AddressingMode.IndirectY,	0x51,	2,	5,	true ),
	CLC_Implied		(Instruction.BPL,	AddressingMode.Immediate,	0x18,	1,	2,	false),
	SEC_Implied		(Instruction.SEC,	AddressingMode.Implied,		0x38,	1,	2,	false),
	CLI_Implied		(Instruction.CLI,	AddressingMode.Implied,		0x58,	1,	2,	false),
	SEI_Implied		(Instruction.SEI,	AddressingMode.Implied,		0x78,	1,	2,	false),
	CLV_Implied		(Instruction.CLV,	AddressingMode.Implied,		0xB8,	1,	2,	false),
	CLD_Implied		(Instruction.CLD,	AddressingMode.Implied,		0xD8,	1,	2,	false),
	SED_Implied		(Instruction.SED,	AddressingMode.Implied,		0xF8,	1,	2,	false),
	INC_ZeroPage	(Instruction.INC,	AddressingMode.ZeroPage,	0xE6,	2,	5,	false),
	INC_ZeroPageX	(Instruction.INC,	AddressingMode.ZeroPageX,	0xF6,	2,	6,	false),
	INC_Absolute	(Instruction.INC,	AddressingMode.Absolute,	0xEE,	3,	6,	false),
	INC_AbsoluteX	(Instruction.INC,	AddressingMode.AbsoluteX,	0xFE,	3,	7,	false),
	JMP_Absolute	(Instruction.JMP,	AddressingMode.Absolute,	0x4C,	3,	3,	false),
	JMP_Indirect	(Instruction.JMP,	AddressingMode.Indirect,	0x6C,	3,	5,	false),
	JSR_Absolute	(Instruction.JSR,	AddressingMode.Absolute,	0x20,	3,	6,	false),
	LDA_Immediate	(Instruction.LDA,	AddressingMode.Immediate,	0xA9,	2,	2,	false),
	LDA_ZeroPage	(Instruction.LDA,	AddressingMode.ZeroPage,	0xA5,	2,	3,	false),
	LDA_ZeroPageX	(Instruction.LDA,	AddressingMode.ZeroPageX,	0xB5,	2,	4,	false),
	LDA_Absolute	(Instruction.LDA,	AddressingMode.Absolute,	0xAD,	3,	4,	false),
	LDA_AbsoluteX	(Instruction.LDA,	AddressingMode.AbsoluteX,	0xBD,	3,	4,	true ),
	LDA_AbsoluteY	(Instruction.LDA,	AddressingMode.AbsoluteY,	0xB9,	3,	4,	true ),
	LDA_IndirectX	(Instruction.LDA,	AddressingMode.IndirectX,	0xA1,	2,	6,	false),
	LDA_IndirectY	(Instruction.LDA,	AddressingMode.IndirectY,	0xB1,	2,	5,	true ),
	LDX_Immediate	(Instruction.LDX,	AddressingMode.Immediate,	0xA2,	2,	2,	false),
	LDX_ZeroPage	(Instruction.LDX,	AddressingMode.ZeroPage,	0xA6,	2,	3,	false),
	LDX_ZeroPageY	(Instruction.LDX,	AddressingMode.ZeroPageY,	0xB6,	2,	4,	false),
	LDX_Absolute	(Instruction.LDX,	AddressingMode.Absolute,	0xAE,	3,	4,	false),
	LDX_AbsoluteY	(Instruction.LDX,	AddressingMode.AbsoluteY,	0xBE,	3,	4,	true ),
	LDY_Immediate	(Instruction.LDY,	AddressingMode.Immediate,	0xA0,	2,	2,	false),
	LDY_ZeroPage	(Instruction.LDY,	AddressingMode.ZeroPage,	0xA4,	2,	3,	false),
	LDY_ZeroPageX	(Instruction.LDY,	AddressingMode.ZeroPageX,	0xB4,	2,	4,	false),
	LDY_Absolute	(Instruction.LDY,	AddressingMode.Absolute,	0xAC,	3,	4,	false),
	LDY_AbsoluteX	(Instruction.LDY,	AddressingMode.AbsoluteX,	0xBC,	3,	4,	true ),
	LSR_Accumulator	(Instruction.LSR,	AddressingMode.Accumulator,	0x4A,	1,	2,	false),
	LSR_ZeroPage	(Instruction.LSR,	AddressingMode.ZeroPage,	0x46,	2,	5,	false),
	LSR_ZeroPageX	(Instruction.LSR,	AddressingMode.ZeroPageX,	0x56,	2,	6,	false),
	LSR_Absolute	(Instruction.LSR,	AddressingMode.Absolute,	0x4E,	3,	6,	false),
	LSR_AbsoluteX	(Instruction.LSR,	AddressingMode.AbsoluteX,	0x5E,	3,	7,	false),
	NOP_Implied		(Instruction.NOP,	AddressingMode.Implied,		0xEA,	1,	2,	false),
	ORA_Immediate	(Instruction.ORA,	AddressingMode.Immediate,	0x09,	2,	2,	false),
	ORA_ZeroPage	(Instruction.ORA,	AddressingMode.ZeroPage,	0x05,	2,	3,	false),
	ORA_ZeroPageX	(Instruction.ORA,	AddressingMode.ZeroPageX,	0x15,	2,	4,	false),
	ORA_Absolute	(Instruction.ORA,	AddressingMode.Absolute,	0x0D,	3,	4,	false),
	ORA_AbsoluteX	(Instruction.ORA,	AddressingMode.AbsoluteX,	0x1D,	3,	4,	true ),
	ORA_AbsoluteY	(Instruction.ORA,	AddressingMode.AbsoluteY,	0x19,	3,	4,	true ),
	ORA_IndirectX	(Instruction.ORA,	AddressingMode.IndirectX,	0x01,	2,	6,	false),
	ORA_IndirectY	(Instruction.ORA,	AddressingMode.IndirectY,	0x11,	2,	5,	true ),
	TAX_Implied		(Instruction.TAX,	AddressingMode.Implied,		0xAA,	1,	2,	false),
	TXA_Implied		(Instruction.TXA,	AddressingMode.Implied,		0x8A,	1,	2,	false),
	DEX_Implied		(Instruction.DEX,	AddressingMode.Implied,		0xCA,	1,	2,	false),
	INX_Implied		(Instruction.INX,	AddressingMode.Implied,		0xE8,	1,	2,	false),
	TAY_Implied		(Instruction.TAY,	AddressingMode.Implied,		0xA8,	1,	2,	false),
	TYA_Implied		(Instruction.TYA,	AddressingMode.Implied,		0x98,	1,	2,	false),
	DEY_Implied		(Instruction.DEY,	AddressingMode.Implied,		0x88,	1,	2,	false),
	INY_Implied		(Instruction.INY,	AddressingMode.Implied,		0xC8,	1,	2,	false),
	ROL_Accumulator	(Instruction.ROL,	AddressingMode.Accumulator,	0x2A,	1,	2,	false),
	ROL_ZeroPage	(Instruction.ROL,	AddressingMode.ZeroPage,	0x26,	2,	5,	false),
	ROL_ZeroPageX	(Instruction.ROL,	AddressingMode.ZeroPageX,	0x36,	2,	6,	false),
	ROL_Absolute	(Instruction.ROL,	AddressingMode.Absolute,	0x2E,	3,	6,	false),
	ROL_AbsoluteX	(Instruction.ROL,	AddressingMode.AbsoluteX,	0x3E,	3,	7,	false),
	ROR_Accumulator	(Instruction.ROR,	AddressingMode.Accumulator,	0x6A,	1,	2,	false),
	ROR_ZeroPage	(Instruction.ROR,	AddressingMode.ZeroPage,	0x66,	2,	5,	false),
	ROR_ZeroPageX	(Instruction.ROR,	AddressingMode.ZeroPageX,	0x76,	2,	6,	false),
	ROR_Absolute	(Instruction.ROR,	AddressingMode.Absolute,	0x6E,	3,	6,	false),
	ROR_AbsoluteX	(Instruction.ROR,	AddressingMode.AbsoluteX,	0x7E,	3,	7,	false),
	RTI_Implied		(Instruction.RTI,	AddressingMode.Implied,		0x40,	1,	6,	false),
	RTS_Implied		(Instruction.RTS,	AddressingMode.Implied,		0x60,	1,	6,	false),
	SBC_Immediate	(Instruction.SBC,	AddressingMode.Immediate,	0xE9,	2,	2,	false),
	SBC_ZeroPage	(Instruction.SBC,	AddressingMode.ZeroPage,	0xE5,	2,	3,	false),
	SBC_ZeroPageX	(Instruction.SBC,	AddressingMode.ZeroPageX,	0xF5,	2,	4,	false),
	SBC_Absolute	(Instruction.SBC,	AddressingMode.Absolute,	0xED,	3,	4,	false),
	SBC_AbsoluteX	(Instruction.SBC,	AddressingMode.AbsoluteX,	0xFD,	3,	4,	true ),
	SBC_AbsoluteY	(Instruction.SBC,	AddressingMode.AbsoluteY,	0xF9,	3,	4,	true ),
	SBC_IndirectX	(Instruction.SBC,	AddressingMode.IndirectX,	0xE1,	2,	6,	false),
	SBC_IndirectY	(Instruction.SBC,	AddressingMode.IndirectY,	0xF1,	2,	5,	true ),
	STA_ZeroPage	(Instruction.STA,	AddressingMode.ZeroPage,	0x85,	2,	3,	false),
	STA_ZeroPageX	(Instruction.STA,	AddressingMode.ZeroPageX,	0x95,	2,	4,	false),
	STA_Absolute	(Instruction.STA,	AddressingMode.Absolute,	0x8D,	3,	4,	false),
	STA_AbsoluteX	(Instruction.STA,	AddressingMode.AbsoluteX,	0x9D,	3,	5,	false),
	STA_AbsoluteY	(Instruction.STA,	AddressingMode.AbsoluteY,	0x99,	3,	5,	false),
	STA_IndirectX	(Instruction.STA,	AddressingMode.IndirectX,	0x81,	2,	6,	false),
	STA_IndirectY	(Instruction.STA,	AddressingMode.IndirectY,	0x91,	2,	6,	false),
	TXS_Implied		(Instruction.TXS,	AddressingMode.Implied,		0x9A,	1,	2,	false),
	TSX_Implied		(Instruction.TSX,	AddressingMode.Implied,		0xBA,	1,	2,	false),
	PHA_Implied		(Instruction.PHA,	AddressingMode.Implied,		0x48,	1,	3,	false),
	PLA_Implied		(Instruction.PLA,	AddressingMode.Implied,		0x68,	1,	4,	false),
	PHP_Implied		(Instruction.PHP,	AddressingMode.Implied,		0x08,	1,	3,	false),
	PLP_Implied		(Instruction.PLP,	AddressingMode.Implied,		0x28,	1,	4,	false),
	STX_ZeroPage	(Instruction.STX,	AddressingMode.ZeroPage,	0x86,	2,	3,	false),
	STX_ZeroPageY	(Instruction.STX,	AddressingMode.ZeroPageY,	0x96,	2,	4,	false),
	STX_Absolute	(Instruction.STX,	AddressingMode.Absolute,	0x8E,	3,	4,	false),
	STY_ZeroPage	(Instruction.STY,	AddressingMode.ZeroPage,	0x84,	2,	3,	false),
	STY_ZeroPageX	(Instruction.STY,	AddressingMode.ZeroPageX,	0x94,	2,	4,	false),
	STY_Absolute	(Instruction.STY,	AddressingMode.Absolute,	0x8C,	3,	4,	false),
	
	ZZZ_Unknown		(Instruction.ZZZ,	AddressingMode.Implied,		0xFF,	1,	1,	false);
	
	public final Instruction instruction;
	public final AddressingMode addressing;
	public final int     code;
	public final int     length;
	public final int     time;
	public final boolean boundary;
	
	private InstructionSet(Instruction instruction, AddressingMode addressing, int code, int length, int time, boolean boundary) {
		this.instruction = instruction;
		this.addressing  = addressing;
		this.code	     = code;
		this.length	     = length;
		this.time	     = time;
		this.boundary    = boundary;
	}

	public String toString(byte... arguments) {
		switch(addressing) {
			case Implied:     return String.format("%s",         instruction);
			case Accumulator: return String.format("%s A",       instruction);
			case Immediate:   return String.format("%s #$%x",    instruction, arguments[0]);
			case ZeroPage:    return String.format("%s $%x",     instruction, arguments[0]);
			case ZeroPageX:   return String.format("%s $%x,X",   instruction, arguments[0]);
			case ZeroPageY:   return String.format("%s $%x,Y",   instruction, arguments[0]);
			case Relative:    return String.format("%s $%x",     instruction, arguments[0]);
			case Absolute:    return String.format("%s $%x%x",   instruction, arguments[0], arguments[1]);
			case AbsoluteX:   return String.format("%s $%x%x,X", instruction, arguments[0], arguments[1]);
			case AbsoluteY:   return String.format("%s $%x%x,Y", instruction, arguments[0], arguments[1]);
			case Indirect:    return String.format("%s ($%x%x)", instruction, arguments[0], arguments[1]);
			case IndirectX:   return String.format("%s ($%x,X)", instruction, arguments[0]);
			case IndirectY:   return String.format("%s ($%x),Y", instruction, arguments[0]);
			default:          return String.format("%s",         instruction);
		}
	}
	
	@Override
	public String toString() {
		return toString((byte) 0x00, (byte) 0x00);
	}
	
	/**
	 * Populate a lookup table of byte codes to enum.
	 */
	private static final InstructionSet[] map = new InstructionSet [0x100];
	
	static {
		for (InstructionSet v : InstructionSet.values()) map[v.code]   = v;
		for (int i = 0; i < map.length; i++) if(map[i] == null) map[i] = ZZZ_Unknown;
	}

	public static InstructionSet lookup(int code) {
		return map[code];
	}
}
