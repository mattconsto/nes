package co.swft.nes.enums;

public enum InstructionSet {
	/* Documented */
	ADC_69_Immediate	(Instruction.ADC,	AddressingMode.Immediate,	0x69,	2,	2,	false),
	ADC_65_ZeroPage		(Instruction.ADC,	AddressingMode.ZeroPage,	0x65,	2,	3,	false),
	ADC_75_ZeroPageX	(Instruction.ADC,	AddressingMode.ZeroPageX,	0x75,	2,	4,	false),
	ADC_6D_Absolute		(Instruction.ADC,	AddressingMode.Absolute,	0x6D,	3,	4,	false),
	ADC_7D_AbsoluteX	(Instruction.ADC,	AddressingMode.AbsoluteX,	0x7D,	3,	4,	true ),
	ADC_79_AbsoluteY	(Instruction.ADC,	AddressingMode.AbsoluteY,	0x79,	3,	4,	true ),
	ADC_61_IndirectX	(Instruction.ADC,	AddressingMode.IndirectX,	0x61,	2,	6,	false),
	ADC_71_IndirectY	(Instruction.ADC,	AddressingMode.IndirectY,	0x71,	2,	5,	true ),
	AND_29_Immediate	(Instruction.AND,	AddressingMode.Immediate,	0x29,	2,	2,	false),
	AND_25_ZeroPage		(Instruction.AND,	AddressingMode.ZeroPage,	0x25,	2,	3,	false),
	AND_35_ZeroPageX	(Instruction.AND,	AddressingMode.ZeroPageX,	0x35,	2,	4,	false),
	AND_2D_Absolute		(Instruction.AND,	AddressingMode.Absolute,	0x2D,	3,	4,	false),
	AND_3D_AbsoluteX	(Instruction.AND,	AddressingMode.AbsoluteX,	0x3D,	3,	4,	true ),
	AND_39_AbsoluteY	(Instruction.AND,	AddressingMode.AbsoluteY,	0x39,	3,	4,	true ),
	AND_21_IndirectX	(Instruction.AND,	AddressingMode.IndirectX,	0x21,	2,	6,	false),
	AND_31_IndirectY	(Instruction.AND,	AddressingMode.IndirectY,	0x31,	2,	5,	true ),
	ASL_0A_Accumulator	(Instruction.ASL,	AddressingMode.Accumulator,	0x0A,	1,	2,	false),
	ASL_06_ZeroPage		(Instruction.ASL,	AddressingMode.ZeroPage,	0x06,	2,	5,	false),
	ASL_16_ZeroPageX	(Instruction.ASL,	AddressingMode.ZeroPageX,	0x16,	2,	6,	false),
	ASL_0E_Absolute		(Instruction.ASL,	AddressingMode.Absolute,	0x0E,	3,	6,	false),
	ASL_1E_AbsoluteX	(Instruction.ASL,	AddressingMode.AbsoluteX,	0x1E,	3,	7,	false),
	BIT_24_ZeroPage		(Instruction.BIT,	AddressingMode.ZeroPage,	0x24,	2,	3,	false),
	BIT_2C_Absolute		(Instruction.BIT,	AddressingMode.Absolute,	0x2C,	3,	4,	false),
	BPL_10_Relative		(Instruction.BPL,	AddressingMode.Relative,	0x10,	2,	2,	true ),
	BMI_30_Relative		(Instruction.BMI,	AddressingMode.Relative,	0x30,	2,	2,	true ),
	BVC_50_Relative		(Instruction.BVC,	AddressingMode.Relative,	0x50,	2,	2,	true ),
	BVS_70_Relative		(Instruction.BVS,	AddressingMode.Relative,	0x70,	2,	2,	true ),
	BCC_90_Relative		(Instruction.BCC,	AddressingMode.Relative,	0x90,	2,	2,	true ),
	BCS_B0_Relative		(Instruction.BCS,	AddressingMode.Relative,	0xB0,	2,	2,	true ),
	BNE_D0_Relative		(Instruction.BNE,	AddressingMode.Relative,	0xD0,	2,	2,	true ),
	BEQ_F0_Relative		(Instruction.BEQ,	AddressingMode.Relative,	0xF0,	2,	2,	true ),
	BRK_00_Implied		(Instruction.BRK,	AddressingMode.Implied,		0x00,	1,	7,	false),
	CMP_C9_Immediate	(Instruction.CMP,	AddressingMode.Immediate,	0xC9,	2,	2,	false),
	CMP_C5_ZeroPage		(Instruction.CMP,	AddressingMode.ZeroPage,	0xC5,	2,	3,	false),
	CMP_D5_ZeroPageX	(Instruction.CMP,	AddressingMode.ZeroPageX,	0xD5,	2,	4,	false),
	CMP_CD_Absolute		(Instruction.CMP,	AddressingMode.Absolute,	0xCD,	3,	4,	false),
	CMP_DD_AbsoluteX	(Instruction.CMP,	AddressingMode.AbsoluteX,	0xDD,	3,	4,	true ),
	CMP_D9_AbsoluteY	(Instruction.CMP,	AddressingMode.AbsoluteY,	0xD9,	3,	4,	true ),
	CMP_C1_IndirectX	(Instruction.CMP,	AddressingMode.IndirectX,	0xC1,	2,	6,	false),
	CMP_D1_IndirectY	(Instruction.CMP,	AddressingMode.IndirectY,	0xD1,	2,	5,	true ),
	CPX_E0_Immediate	(Instruction.CPX,	AddressingMode.Immediate,	0xE0,	2,	2,	false),
	CPX_E4_ZeroPage		(Instruction.CPX,	AddressingMode.ZeroPage,	0xE4,	2,	3,	false),
	CPX_EC_Absolute		(Instruction.CPX,	AddressingMode.Absolute,	0xEC,	3,	4,	false),
	CPY_C0_Immediate	(Instruction.CPY,	AddressingMode.Immediate,	0xC0,	2,	2,	false),
	CPY_C4_ZeroPage		(Instruction.CPY,	AddressingMode.ZeroPage,	0xC4,	2,	3,	false),
	CPY_CC_Absolute		(Instruction.CPY,	AddressingMode.Absolute,	0xCC,	3,	4,	false),
	DEC_C6_ZeroPage		(Instruction.DEC,	AddressingMode.ZeroPage,	0xC6,	2,	5,	false),
	DEC_D6_ZeroPageX	(Instruction.DEC,	AddressingMode.ZeroPageX,	0xD6,	2,	6,	false),
	DEC_CE_Absolute		(Instruction.DEC,	AddressingMode.Absolute,	0xCE,	3,	6,	false),
	DEC_DE_AbsoluteX	(Instruction.DEC,	AddressingMode.AbsoluteX,	0xDE,	3,	7,	false),
	EOR_49_Immediate	(Instruction.EOR,	AddressingMode.Immediate,	0x49,	2,	2,	false),
	EOR_45_ZeroPage		(Instruction.EOR,	AddressingMode.ZeroPage,	0x45,	2,	3,	false),
	EOR_55_ZeroPageX	(Instruction.EOR,	AddressingMode.ZeroPageX,	0x55,	2,	4,	false),
	EOR_4D_Absolute		(Instruction.EOR,	AddressingMode.Absolute,	0x4D,	3,	4,	false),
	EOR_5D_AbsoluteX	(Instruction.EOR,	AddressingMode.AbsoluteX,	0x5D,	3,	4,	true ),
	EOR_59_AbsoluteY	(Instruction.EOR,	AddressingMode.AbsoluteY,	0x59,	3,	4,	true ),
	EOR_41_IndirectX	(Instruction.EOR,	AddressingMode.IndirectX,	0x41,	2,	6,	false),
	EOR_51_IndirectY	(Instruction.EOR,	AddressingMode.IndirectY,	0x51,	2,	5,	true ),
	CLC_18_Implied		(Instruction.BPL,	AddressingMode.Immediate,	0x18,	1,	2,	false),
	SEC_38_Implied		(Instruction.SEC,	AddressingMode.Implied,		0x38,	1,	2,	false),
	CLI_58_Implied		(Instruction.CLI,	AddressingMode.Implied,		0x58,	1,	2,	false),
	SEI_78_Implied		(Instruction.SEI,	AddressingMode.Implied,		0x78,	1,	2,	false),
	CLV_B8_Implied		(Instruction.CLV,	AddressingMode.Implied,		0xB8,	1,	2,	false),
	CLD_D8_Implied		(Instruction.CLD,	AddressingMode.Implied,		0xD8,	1,	2,	false),
	SED_F8_Implied		(Instruction.SED,	AddressingMode.Implied,		0xF8,	1,	2,	false),
	INC_E6_ZeroPage		(Instruction.INC,	AddressingMode.ZeroPage,	0xE6,	2,	5,	false),
	INC_F6_ZeroPageX	(Instruction.INC,	AddressingMode.ZeroPageX,	0xF6,	2,	6,	false),
	INC_EE_Absolute		(Instruction.INC,	AddressingMode.Absolute,	0xEE,	3,	6,	false),
	INC_FE_AbsoluteX	(Instruction.INC,	AddressingMode.AbsoluteX,	0xFE,	3,	7,	false),
	JMP_4C_Absolute		(Instruction.JMP,	AddressingMode.Absolute,	0x4C,	3,	3,	false),
	JMP_6C_Indirect		(Instruction.JMP,	AddressingMode.Indirect,	0x6C,	3,	5,	false),
	JSR_20_Absolute		(Instruction.JSR,	AddressingMode.Absolute,	0x20,	3,	6,	false),
	LDA_A9_Immediate	(Instruction.LDA,	AddressingMode.Immediate,	0xA9,	2,	2,	false),
	LDA_A5_ZeroPage		(Instruction.LDA,	AddressingMode.ZeroPage,	0xA5,	2,	3,	false),
	LDA_B5_ZeroPageX	(Instruction.LDA,	AddressingMode.ZeroPageX,	0xB5,	2,	4,	false),
	LDA_AD_Absolute		(Instruction.LDA,	AddressingMode.Absolute,	0xAD,	3,	4,	false),
	LDA_BD_AbsoluteX	(Instruction.LDA,	AddressingMode.AbsoluteX,	0xBD,	3,	4,	true ),
	LDA_B9_AbsoluteY	(Instruction.LDA,	AddressingMode.AbsoluteY,	0xB9,	3,	4,	true ),
	LDA_A1_IndirectX	(Instruction.LDA,	AddressingMode.IndirectX,	0xA1,	2,	6,	false),
	LDA_B1_IndirectY	(Instruction.LDA,	AddressingMode.IndirectY,	0xB1,	2,	5,	true ),
	LDX_A2_Immediate	(Instruction.LDX,	AddressingMode.Immediate,	0xA2,	2,	2,	false),
	LDX_A6_ZeroPage		(Instruction.LDX,	AddressingMode.ZeroPage,	0xA6,	2,	3,	false),
	LDX_B6_ZeroPageY	(Instruction.LDX,	AddressingMode.ZeroPageY,	0xB6,	2,	4,	false),
	LDX_AE_Absolute		(Instruction.LDX,	AddressingMode.Absolute,	0xAE,	3,	4,	false),
	LDX_BE_AbsoluteY	(Instruction.LDX,	AddressingMode.AbsoluteY,	0xBE,	3,	4,	true ),
	LDY_A0_Immediate	(Instruction.LDY,	AddressingMode.Immediate,	0xA0,	2,	2,	false),
	LDY_A4_ZeroPage		(Instruction.LDY,	AddressingMode.ZeroPage,	0xA4,	2,	3,	false),
	LDY_B4_ZeroPageX	(Instruction.LDY,	AddressingMode.ZeroPageX,	0xB4,	2,	4,	false),
	LDY_AC_Absolute		(Instruction.LDY,	AddressingMode.Absolute,	0xAC,	3,	4,	false),
	LDY_BC_AbsoluteX	(Instruction.LDY,	AddressingMode.AbsoluteX,	0xBC,	3,	4,	true ),
	LSR_4A_Accumulator	(Instruction.LSR,	AddressingMode.Accumulator,	0x4A,	1,	2,	false),
	LSR_46_ZeroPage		(Instruction.LSR,	AddressingMode.ZeroPage,	0x46,	2,	5,	false),
	LSR_56_ZeroPageX	(Instruction.LSR,	AddressingMode.ZeroPageX,	0x56,	2,	6,	false),
	LSR_4E_Absolute		(Instruction.LSR,	AddressingMode.Absolute,	0x4E,	3,	6,	false),
	LSR_5E_AbsoluteX	(Instruction.LSR,	AddressingMode.AbsoluteX,	0x5E,	3,	7,	false),
	NOP_EA_Implied		(Instruction.NOP,	AddressingMode.Implied,		0xEA,	1,	2,	false),
	ORA_09_Immediate	(Instruction.ORA,	AddressingMode.Immediate,	0x09,	2,	2,	false),
	ORA_05_ZeroPage		(Instruction.ORA,	AddressingMode.ZeroPage,	0x05,	2,	3,	false),
	ORA_15_ZeroPageX	(Instruction.ORA,	AddressingMode.ZeroPageX,	0x15,	2,	4,	false),
	ORA_0D_Absolute		(Instruction.ORA,	AddressingMode.Absolute,	0x0D,	3,	4,	false),
	ORA_1D_AbsoluteX	(Instruction.ORA,	AddressingMode.AbsoluteX,	0x1D,	3,	4,	true ),
	ORA_19_AbsoluteY	(Instruction.ORA,	AddressingMode.AbsoluteY,	0x19,	3,	4,	true ),
	ORA_01_IndirectX	(Instruction.ORA,	AddressingMode.IndirectX,	0x01,	2,	6,	false),
	ORA_11_IndirectY	(Instruction.ORA,	AddressingMode.IndirectY,	0x11,	2,	5,	true ),
	TAX_AA_Implied		(Instruction.TAX,	AddressingMode.Implied,		0xAA,	1,	2,	false),
	TXA_8A_Implied		(Instruction.TXA,	AddressingMode.Implied,		0x8A,	1,	2,	false),
	DEX_CA_Implied		(Instruction.DEX,	AddressingMode.Implied,		0xCA,	1,	2,	false),
	INX_E8_Implied		(Instruction.INX,	AddressingMode.Implied,		0xE8,	1,	2,	false),
	TAY_A8_Implied		(Instruction.TAY,	AddressingMode.Implied,		0xA8,	1,	2,	false),
	TYA_98_Implied		(Instruction.TYA,	AddressingMode.Implied,		0x98,	1,	2,	false),
	DEY_88_Implied		(Instruction.DEY,	AddressingMode.Implied,		0x88,	1,	2,	false),
	INY_C8_Implied		(Instruction.INY,	AddressingMode.Implied,		0xC8,	1,	2,	false),
	ROL_2A_Accumulator	(Instruction.ROL,	AddressingMode.Accumulator,	0x2A,	1,	2,	false),
	ROL_26_ZeroPage		(Instruction.ROL,	AddressingMode.ZeroPage,	0x26,	2,	5,	false),
	ROL_36_ZeroPageX	(Instruction.ROL,	AddressingMode.ZeroPageX,	0x36,	2,	6,	false),
	ROL_2E_Absolute		(Instruction.ROL,	AddressingMode.Absolute,	0x2E,	3,	6,	false),
	ROL_3E_AbsoluteX	(Instruction.ROL,	AddressingMode.AbsoluteX,	0x3E,	3,	7,	false),
	ROR_6A_Accumulator	(Instruction.ROR,	AddressingMode.Accumulator,	0x6A,	1,	2,	false),
	ROR_66_ZeroPage		(Instruction.ROR,	AddressingMode.ZeroPage,	0x66,	2,	5,	false),
	ROR_76_ZeroPageX	(Instruction.ROR,	AddressingMode.ZeroPageX,	0x76,	2,	6,	false),
	ROR_6E_Absolute		(Instruction.ROR,	AddressingMode.Absolute,	0x6E,	3,	6,	false),
	ROR_7E_AbsoluteX	(Instruction.ROR,	AddressingMode.AbsoluteX,	0x7E,	3,	7,	false),
	RTI_40_Implied		(Instruction.RTI,	AddressingMode.Implied,		0x40,	1,	6,	false),
	RTS_60_Implied		(Instruction.RTS,	AddressingMode.Implied,		0x60,	1,	6,	false),
	SBC_E9_Immediate	(Instruction.SBC,	AddressingMode.Immediate,	0xE9,	2,	2,	false),
	SBC_E5_ZeroPage		(Instruction.SBC,	AddressingMode.ZeroPage,	0xE5,	2,	3,	false),
	SBC_F5_ZeroPageX	(Instruction.SBC,	AddressingMode.ZeroPageX,	0xF5,	2,	4,	false),
	SBC_ED_Absolute		(Instruction.SBC,	AddressingMode.Absolute,	0xED,	3,	4,	false),
	SBC_FD_AbsoluteX	(Instruction.SBC,	AddressingMode.AbsoluteX,	0xFD,	3,	4,	true ),
	SBC_F9_AbsoluteY	(Instruction.SBC,	AddressingMode.AbsoluteY,	0xF9,	3,	4,	true ),
	SBC_E1_IndirectX	(Instruction.SBC,	AddressingMode.IndirectX,	0xE1,	2,	6,	false),
	SBC_F1_IndirectY	(Instruction.SBC,	AddressingMode.IndirectY,	0xF1,	2,	5,	true ),
	STA_85_ZeroPage		(Instruction.STA,	AddressingMode.ZeroPage,	0x85,	2,	3,	false),
	STA_95_ZeroPageX	(Instruction.STA,	AddressingMode.ZeroPageX,	0x95,	2,	4,	false),
	STA_8D_Absolute		(Instruction.STA,	AddressingMode.Absolute,	0x8D,	3,	4,	false),
	STA_9D_AbsoluteX	(Instruction.STA,	AddressingMode.AbsoluteX,	0x9D,	3,	5,	false),
	STA_99_AbsoluteY	(Instruction.STA,	AddressingMode.AbsoluteY,	0x99,	3,	5,	false),
	STA_81_IndirectX	(Instruction.STA,	AddressingMode.IndirectX,	0x81,	2,	6,	false),
	STA_91_IndirectY	(Instruction.STA,	AddressingMode.IndirectY,	0x91,	2,	6,	false),
	TXS_9A_Implied		(Instruction.TXS,	AddressingMode.Implied,		0x9A,	1,	2,	false),
	TSX_BA_Implied		(Instruction.TSX,	AddressingMode.Implied,		0xBA,	1,	2,	false),
	PHA_48_Implied		(Instruction.PHA,	AddressingMode.Implied,		0x48,	1,	3,	false),
	PLA_68_Implied		(Instruction.PLA,	AddressingMode.Implied,		0x68,	1,	4,	false),
	PHP_08_Implied		(Instruction.PHP,	AddressingMode.Implied,		0x08,	1,	3,	false),
	PLP_28_Implied		(Instruction.PLP,	AddressingMode.Implied,		0x28,	1,	4,	false),
	STX_86_ZeroPage		(Instruction.STX,	AddressingMode.ZeroPage,	0x86,	2,	3,	false),
	STX_96_ZeroPageY	(Instruction.STX,	AddressingMode.ZeroPageY,	0x96,	2,	4,	false),
	STX_8E_Absolute		(Instruction.STX,	AddressingMode.Absolute,	0x8E,	3,	4,	false),
	STY_84_ZeroPage		(Instruction.STY,	AddressingMode.ZeroPage,	0x84,	2,	3,	false),
	STY_94_ZeroPageX	(Instruction.STY,	AddressingMode.ZeroPageX,	0x94,	2,	4,	false),
	STY_8C_Absolute		(Instruction.STY,	AddressingMode.Absolute,	0x8C,	3,	4,	false),
	
	/* Undocumented */
	AAC_0B_Immediate	(Instruction.AAC,	AddressingMode.Immediate,	0x0B,	2,	2,	false),
	AAC_2B_Immediate	(Instruction.AAC,	AddressingMode.Immediate,	0x2B,	2,	2,	false),
	AAX_87_ZeroPage		(Instruction.AAX,	AddressingMode.ZeroPage,	0x87,	2,	3,	false),
	AAX_97_ZeroPageY	(Instruction.AAX,	AddressingMode.ZeroPageY,	0x97,	2,	4,	false),
	AAX_83_IndirectX	(Instruction.AAX,	AddressingMode.IndirectX,	0x83,	2,	6,	false),
	AAX_8F_Absolute		(Instruction.AAX,	AddressingMode.Absolute,	0x8F,	3,	4,	false),
	ARR_6B_Immediate	(Instruction.ARR,	AddressingMode.Immediate,	0x6B,	2,	2,	false),
	ASR_4B_Immediate	(Instruction.ASR,	AddressingMode.Immediate,	0x4B,	2,	2,	false),
	ATX_AB_Immediate	(Instruction.ATX,	AddressingMode.Immediate,	0xAB,	2,	2,	false),
	AXA_9F_AbsoluteY	(Instruction.AXA,	AddressingMode.AbsoluteY,	0x9F,	3,	5,	false),
	AXA_93_IndirectY	(Instruction.AXA,	AddressingMode.IndirectY,	0x93,	2,	6,	false),
	AXS_CB_Immediate	(Instruction.AXS,	AddressingMode.Immediate,	0xCB,	2,	2,	false),
	DCP_C7_ZeroPage		(Instruction.DCP,	AddressingMode.ZeroPage,	0xC7,	2,	5,	false),
	DCP_D7_ZeroPageX	(Instruction.DCP,	AddressingMode.ZeroPageX,	0xD7,	2,	6,	false),
	DCP_CF_Absolute		(Instruction.DCP,	AddressingMode.Absolute,	0xCF,	3,	6,	false),
	DCP_DF_AbsoluteX	(Instruction.DCP,	AddressingMode.AbsoluteX,	0xDF,	3,	7,	false),
	DCP_DB_AbsoluteY	(Instruction.DCP,	AddressingMode.AbsoluteY,	0xDB,	3,	7,	false),
	DCP_C3_IndirectX	(Instruction.DCP,	AddressingMode.IndirectX,	0xC3,	2,	8,	false),
	DCP_D3_IndirectY	(Instruction.DCP,	AddressingMode.IndirectY,	0xD3,	2,	8,	false),
	DOP_04_ZeroPage		(Instruction.DOP,	AddressingMode.ZeroPage,	0x04,	2,	3,	false),
	DOP_14_ZeroPageX	(Instruction.DOP,	AddressingMode.ZeroPageX,	0x14,	2,	4,	false),
	DOP_34_ZeroPageX	(Instruction.DOP,	AddressingMode.ZeroPageX,	0x34,	2,	4,	false),
	DOP_44_ZeroPage		(Instruction.DOP,	AddressingMode.ZeroPage,	0x44,	2,	3,	false),
	DOP_54_ZeroPageX	(Instruction.DOP,	AddressingMode.ZeroPageX,	0x54,	2,	4,	false),
	DOP_64_ZeroPage		(Instruction.DOP,	AddressingMode.ZeroPage,	0x64,	2,	3,	false),
	DOP_74_ZeroPageX	(Instruction.DOP,	AddressingMode.ZeroPageX,	0x74,	2,	4,	false),
	DOP_80_Immediate	(Instruction.DOP,	AddressingMode.Immediate,	0x80,	2,	2,	false),
	DOP_82_Immediate	(Instruction.DOP,	AddressingMode.Immediate,	0x82,	2,	2,	false),
	DOP_89_Immediate	(Instruction.DOP,	AddressingMode.Immediate,	0x89,	2,	2,	false),
	DOP_C2_Immediate	(Instruction.DOP,	AddressingMode.Immediate,	0xC2,	2,	2,	false),
	DOP_D4_ZeroPageX	(Instruction.DOP,	AddressingMode.ZeroPageX,	0xD4,	2,	4,	false),
	DOP_E2_Immediate	(Instruction.DOP,	AddressingMode.Immediate,	0xE2,	2,	2,	false),
	DOP_F4_ZeroPageX	(Instruction.DOP,	AddressingMode.ZeroPageX,	0xF4,	2,	4,	false),
	ISC_E7_ZeroPage		(Instruction.ISC,	AddressingMode.ZeroPage,	0xE7,	2,	5,	false),
	ISC_F7_ZeroPageX	(Instruction.ISC,	AddressingMode.ZeroPageX,	0xF7,	2,	6,	false),
	ISC_EF_Absolute		(Instruction.ISC,	AddressingMode.Absolute,	0xEF,	3,	6,	false),
	ISC_FF_AbsoluteX	(Instruction.ISC,	AddressingMode.AbsoluteX,	0xFF,	3,	7,	false),
	ISC_FB_AbsoluteY	(Instruction.ISC,	AddressingMode.AbsoluteY,	0xFB,	3,	7,	false),
	ISC_E3_IndirectX	(Instruction.ISC,	AddressingMode.IndirectX,	0xE3,	2,	8,	false),
	ISC_F3_IndirectY	(Instruction.ISC,	AddressingMode.IndirectY,	0xF3,	2,	8,	false),
	KIL_02_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x02,	1,	0,	false),
	KIL_12_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x12,	1,	0,	false),
	KIL_22_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x22,	1,	0,	false),
	KIL_32_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x32,	1,	0,	false),
	KIL_42_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x42,	1,	0,	false),
	KIL_52_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x52,	1,	0,	false),
	KIL_62_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x62,	1,	0,	false),
	KIL_72_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x72,	1,	0,	false),
	KIL_92_Implied		(Instruction.KIL,	AddressingMode.Implied,		0x92,	1,	0,	false),
	KIL_B2_Implied		(Instruction.KIL,	AddressingMode.Implied,		0xB2,	1,	0,	false),
	KIL_D2_Implied		(Instruction.KIL,	AddressingMode.Implied,		0xD2,	1,	0,	false),
	KIL_F2_Implied		(Instruction.KIL,	AddressingMode.Implied,		0xF2,	1,	0,	false),
	LAR_BB_AbsoluteY	(Instruction.LAR,	AddressingMode.AbsoluteY,	0xBB,	3,	4,	true),
	LAX_A7_ZeroPage		(Instruction.LAX,	AddressingMode.ZeroPage,	0xA7,	2,	3,	false),
	LAX_B7_ZeroPageY	(Instruction.LAX,	AddressingMode.ZeroPageY,	0xB7,	2,	4,	false),
	LAX_AF_Absolute		(Instruction.LAX,	AddressingMode.Absolute,	0xAF,	3,	4,	false),
	LAX_BF_AbsoluteY	(Instruction.LAX,	AddressingMode.AbsoluteY,	0xBF,	3,	4,	true),
	LAX_A3_IndirectX	(Instruction.LAX,	AddressingMode.IndirectX,	0xA3,	2,	6,	false),
	LAX_B3_IndirectY	(Instruction.LAX,	AddressingMode.IndirectY,	0xB3,	2,	5,	true),
	NOP_1A_Implied		(Instruction.NOP,	AddressingMode.Implied,		0x1A,	1,	2,	false),
	NOP_3A_Implied		(Instruction.NOP,	AddressingMode.Implied,		0x3A,	1,	2,	false),
	NOP_5A_Implied		(Instruction.NOP,	AddressingMode.Implied,		0x5A,	1,	2,	false),
	NOP_7A_Implied		(Instruction.NOP,	AddressingMode.Implied,		0x7A,	1,	2,	false),
	NOP_DA_Implied		(Instruction.NOP,	AddressingMode.Implied,		0xDA,	1,	2,	false),
	NOP_FA_Implied		(Instruction.NOP,	AddressingMode.Implied,		0xFA,	1,	2,	false),
	RLA_27_ZeroPage		(Instruction.RLA,	AddressingMode.ZeroPage,	0x27,	2,	5,	false),
	RLA_37_ZeroPageX	(Instruction.RLA,	AddressingMode.ZeroPageX,	0x37,	2,	6,	false),
	RLA_2F_Absolute		(Instruction.RLA,	AddressingMode.Absolute,	0x2F,	3,	6,	false),
	RLA_3F_AbsoluteX	(Instruction.RLA,	AddressingMode.AbsoluteX,	0x3F,	3,	7,	false),
	RLA_3B_AbsoluteY	(Instruction.RLA,	AddressingMode.AbsoluteY,	0x3B,	3,	7,	false),
	RLA_23_IndirectX	(Instruction.RLA,	AddressingMode.IndirectX,	0x23,	2,	8,	false),
	RLA_33_IndirectY	(Instruction.RLA,	AddressingMode.IndirectY,	0x33,	2,	8,	false),
	RRA_67_ZeroPage		(Instruction.RRA,	AddressingMode.ZeroPage,	0x67,	2,	5,	false),
	RRA_77_ZeroPageX	(Instruction.RRA,	AddressingMode.ZeroPageX,	0x77,	2,	6,	false),
	RRA_6F_Absolute		(Instruction.RRA,	AddressingMode.Absolute,	0x6F,	3,	6,	false),
	RRA_7F_AbsoluteX	(Instruction.RRA,	AddressingMode.AbsoluteX,	0x7F,	3,	7,	false),
	RRA_7B_AbsoluteY	(Instruction.RRA,	AddressingMode.AbsoluteY,	0x7B,	3,	7,	false),
	RRA_63_IndirectX	(Instruction.RRA,	AddressingMode.IndirectX,	0x63,	2,	8,	false),
	RRA_73_IndirectY	(Instruction.RRA,	AddressingMode.IndirectY,	0x73,	2,	8,	false),
	SBC_EB_Immediate	(Instruction.SBC,	AddressingMode.Immediate,	0xEB,	2,	2,	false),
	SLO_07_ZeroPage		(Instruction.SLO,	AddressingMode.ZeroPage,	0x07,	2,	5,	false),
	SLO_17_ZeroPageX	(Instruction.SLO,	AddressingMode.ZeroPageX,	0x17,	2,	6,	false),
	SLO_0F_Absolute		(Instruction.SLO,	AddressingMode.Absolute,	0x0F,	3,	6,	false),
	SLO_1F_AbsoluteX	(Instruction.SLO,	AddressingMode.AbsoluteX,	0x1F,	3,	7,	false),
	SLO_1B_AbsoluteY	(Instruction.SLO,	AddressingMode.AbsoluteY,	0x1B,	3,	7,	false),
	SLO_03_IndirectX	(Instruction.SLO,	AddressingMode.IndirectX,	0x03,	2,	8,	false),
	SLO_13_IndirectY	(Instruction.SLO,	AddressingMode.IndirectY,	0x13,	2,	8,	false),
	SRE_47_ZeroPage		(Instruction.SRE,	AddressingMode.ZeroPage,	0x47,	2,	5,	false),
	SRE_57_ZeroPageX	(Instruction.SRE,	AddressingMode.ZeroPageX,	0x57,	2,	6,	false),
	SRE_4F_Absolute		(Instruction.SRE,	AddressingMode.Absolute,	0x4F,	3,	6,	false),
	SRE_5F_AbsoluteX	(Instruction.SRE,	AddressingMode.AbsoluteX,	0x5F,	3,	7,	false),
	SRE_5B_AbsoluteY	(Instruction.SRE,	AddressingMode.AbsoluteY,	0x5B,	3,	7,	false),
	SRE_43_IndirectX	(Instruction.SRE,	AddressingMode.IndirectX,	0x43,	2,	8,	false),
	SRE_53_IndirectY	(Instruction.SRE,	AddressingMode.IndirectY,	0x53,	2,	8,	false),
	SXA_9E_AbsoluteY	(Instruction.SXA,	AddressingMode.AbsoluteY,	0x9E,	3,	5,	false),
	SYA_9C_AbsoluteX	(Instruction.SYA,	AddressingMode.AbsoluteX,	0x9C,	3,	5,	false),
	TOP_0C_Absolute		(Instruction.TOP,	AddressingMode.Absolute,	0x0C,	3,	4,	false),
	TOP_1C_AbsoluteX	(Instruction.TOP,	AddressingMode.AbsoluteX,	0x1C,	3,	4,	true),
	TOP_3C_AbsoluteX	(Instruction.TOP,	AddressingMode.AbsoluteX,	0x3C,	3,	4,	true),
	TOP_5C_AbsoluteX	(Instruction.TOP,	AddressingMode.AbsoluteX,	0x5C,	3,	4,	true),
	TOP_7C_AbsoluteX	(Instruction.TOP,	AddressingMode.AbsoluteX,	0x7C,	3,	4,	true),
	TOP_DC_AbsoluteX	(Instruction.TOP,	AddressingMode.AbsoluteX,	0xDC,	3,	4,	true),
	TOP_FC_AbsoluteX	(Instruction.TOP,	AddressingMode.AbsoluteX,	0xFC,	3,	4,	true),
	XAA_8B_Immediate	(Instruction.XAA,	AddressingMode.Immediate,	0x8B,	2,	2,	false),
	XAS_9B_AbsoluteY	(Instruction.XAS,	AddressingMode.AbsoluteY,	0x9B,	3,	5,	false);
	
	public final Instruction instruction;
	public final AddressingMode addr;
	public final int     code;
	public final int     length;
	public final int     time;
	public final boolean boundary;
	
	private InstructionSet(Instruction instruction, AddressingMode addressing, int code, int length, int time, boolean boundary) {
		this.instruction = instruction;
		this.addr  = addressing;
		this.code	     = code;
		this.length	     = length;
		this.time	     = time;
		this.boundary    = boundary;
	}

	public String toString(byte... arguments) {
		// Instruction overides
		switch(instruction) {
			case RTS: return String.format("%2$02x      \t%1$s ; -----------------------------------------", instruction, (byte) code);
			default:  break;
		}
		
		switch(addr) {
			case Implied:     return String.format("%2$02x      \t%1$s",                               instruction, (byte) code);
			case Accumulator: return String.format("%2$02x      \t%1$s A",                             instruction, (byte) code);
			case Immediate:   return String.format("%2$02x %3$02x   \t%1$s #$%3$02x",               instruction, (byte) code, arguments[0]);
			case ZeroPage:    return String.format("%2$02x %3$02x   \t%1$s $%3$02x",                instruction, (byte) code, arguments[0]);
			case ZeroPageX:   return String.format("%2$02x %3$02x   \t%1$s $%3$02x,X",              instruction, (byte) code, arguments[0]);
			case ZeroPageY:   return String.format("%2$02x %3$02x   \t%1$s $%3$02x,Y",              instruction, (byte) code, arguments[0]);
			case Relative:    return String.format("%2$02x %3$02x   \t%1$s $%3$02x ; %<d",          instruction, (byte) code, arguments[0]);
			case Absolute:    return String.format("%2$02x %3$02x %4$02x\t%1$s $%3$02x%4$02x",   instruction, (byte) code, arguments[1], arguments[0]);
			case AbsoluteX:   return String.format("%2$02x %3$02x %4$02x\t%1$s $%3$02x%4$02x,X", instruction, (byte) code, arguments[1], arguments[0]);
			case AbsoluteY:   return String.format("%2$02x %3$02x %4$02x\t%1$s $%3$02x%4$02x,Y", instruction, (byte) code, arguments[1], arguments[0]);
			case Indirect:    return String.format("%2$02x %3$02x %4$02x\t%1$s ($%3$02x%4$02x)", instruction, (byte) code, arguments[1], arguments[0]);
			case IndirectX:   return String.format("%2$02x %3$02x   \t%1$s ($%3$02x,X)",            instruction, (byte) code, arguments[0]);
			case IndirectY:   return String.format("%2$02x %3$02x   \t%1$s ($%3$02x),Y",            instruction, (byte) code, arguments[0]);
			default:          return String.format("%2$02x      \t%1$s",                               instruction, (byte) code);
		}
	}
	
	@Override
	public String toString() {
		return toString((byte) 0x00, (byte) 0x00).replace("00", "??");
	}
	
	/**
	 * Populate a lookup table of byte codes to enum.
	 */
	private static final InstructionSet[] map = new InstructionSet [0x100];
	
	static {
		for (InstructionSet v : InstructionSet.values()) map[v.code]   = v;
		for (int i = 0; i < map.length; i++) if(map[i] == null) map[i] = NOP_EA_Implied;
	}

	public static InstructionSet lookup(int code) {
		return map[code];
	}
	public static InstructionSet lookup(byte code) {
		return lookup(Byte.toUnsignedInt(code));
	}
}
