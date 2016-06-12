$8000	78      	SEI
$8001	d8      	CLD
$8002	a2 00   	LDX #$00
$8004	86 70   	STX $70
$8006	86 72   	STX $72
$8008	86 71   	STX $71
$800a	86 73   	STX $73
$800c	9a      	TXS
$800d	a9 20   	LDA #$20
$800f	9d 00 02	STA $0200,X
$8012	9d 00 03	STA $0300,X
$8015	9d 00 04	STA $0400,X
$8018	e8      	INX
$8019	d0 f4   	BNE $f4 ; -12
$801b	20 69 80	JSR $8069
$801e	20 28 81	JSR $8128
$8021	a9 00   	LDA #$00
$8023	85 02   	STA $02
$8025	a9 08   	LDA #$08
$8027	85 03   	STA $03
$8029	20 5d 80	JSR $805d
$802c	20 05 81	JSR $8105
$802f	20 1c 81	JSR $811c
$8032	4c 00 80	JMP $8000
$8035	48      	PHA
$8036	98      	TYA
$8037	48      	PHA
$8038	8a      	TXA
$8039	48      	PHA
$803a	a9 01   	LDA #$01
$803c	85 70   	STA $70
$803e	e6 6b   	INC $6b
$8040	d0 02   	BNE $02 ; 2
$8042	e6 6c   	INC $6c
$8044	20 a9 81	JSR $81a9
$8047	a9 20   	LDA #$20
$8049	8d 06 20	STA $2006
$804c	a9 00   	LDA #$00
$804e	8d 06 20	STA $2006
$8051	8d 05 20	STA $2005
$8054	8d 05 20	STA $2005
$8057	68      	PLA
$8058	aa      	TAX
$8059	68      	PLA
$805a	a8      	TAY
$805b	68      	PLA
$805c	40      	RTI
$805d	a0 00   	LDY #$00
$805f	f0 07   	BEQ $07 ; 7
$8061	a9 8c   	LDA #$8c
$8063	a2 80   	LDX #$80
$8065	4c 00 60	JMP $6000
$8068	60      	RTS ; --------------------
$8069	a9 25   	LDA #$25
$806b	85 0a   	STA $0a
$806d	a9 60   	LDA #$60
$806f	85 0b   	STA $0b
$8071	a9 00   	LDA #$00
$8073	a8      	TAY
$8074	a2 00   	LDX #$00
$8076	f0 0a   	BEQ $0a ; 10
$8078	91 0a   	STA ($0a),Y
$807a	c8      	INY
$807b	d0 fb   	BNE $fb ; -5
$807d	e6 0b   	INC $0b
$807f	ca      	DEX
$8080	d0 f6   	BNE $f6 ; -10
$8082	c0 05   	CPY #$05
$8084	f0 05   	BEQ $05 ; 5
$8086	91 0a   	STA ($0a),Y
$8088	c8      	INY
$8089	d0 f7   	BNE $f7 ; -9
$808b	60      	RTS ; --------------------
$808c	20 31 82	JSR $8231
$808f	a2 00   	LDX #$00
$8091	a9 20   	LDA #$20
$8093	8d 06 20	STA $2006
$8096	a2 00   	LDX #$00
$8098	a9 41   	LDA #$41
$809a	8d 06 20	STA $2006
$809d	a0 01   	LDY #$01
$809f	20 76 81	JSR $8176
$80a2	a0 00   	LDY #$00
$80a4	20 6b 81	JSR $816b
$80a7	8d 07 20	STA $2007
$80aa	20 5d 81	JSR $815d
$80ad	60      	RTS ; --------------------
$80ae	20 47 82	JSR $8247
$80b1	a2 00   	LDX #$00
$80b3	a9 3f   	LDA #$3f
$80b5	8d 06 20	STA $2006
$80b8	a2 00   	LDX #$00
$80ba	a9 00   	LDA #$00
$80bc	8d 06 20	STA $2006
$80bf	a2 00   	LDX #$00
$80c1	a9 01   	LDA #$01
$80c3	8d 07 20	STA $2007
$80c6	a2 00   	LDX #$00
$80c8	a9 3f   	LDA #$3f
$80ca	8d 06 20	STA $2006
$80cd	a2 00   	LDX #$00
$80cf	a9 03   	LDA #$03
$80d1	8d 06 20	STA $2006
$80d4	a2 00   	LDX #$00
$80d6	a9 30   	LDA #$30
$80d8	8d 07 20	STA $2007
$80db	a9 4d   	LDA #$4d
$80dd	a2 82   	LDX #$82
$80df	20 8c 80	JSR $808c
$80e2	a2 00   	LDX #$00
$80e4	a9 00   	LDA #$00
$80e6	8d 05 20	STA $2005
$80e9	a2 00   	LDX #$00
$80eb	a9 00   	LDA #$00
$80ed	8d 05 20	STA $2005
$80f0	a2 00   	LDX #$00
$80f2	a9 08   	LDA #$08
$80f4	8d 01 20	STA $2001
$80f7	4c fa 80	JMP $80fa
$80fa	4c fa 80	JMP $80fa
$80fd	a2 00   	LDX #$00
$80ff	a9 00   	LDA #$00
$8101	4c 04 81	JMP $8104
$8104	60      	RTS ; --------------------
$8105	ad 25 60	LDA $6025
$8108	ae 26 60	LDX $6026
$810b	20 31 82	JSR $8231
$810e	ad 27 60	LDA $6027
$8111	ae 28 60	LDX $6028
$8114	20 31 82	JSR $8231
$8117	a0 04   	LDY #$04
$8119	4c ae 80	JMP $80ae
$811c	a0 00   	LDY #$00
$811e	f0 07   	BEQ $07 ; 7
$8120	a9 59   	LDA #$59
$8122	a2 82   	LDX #$82
$8124	4c 00 60	JMP $6000
$8127	60      	RTS ; --------------------
$8128	a9 59   	LDA #$59
$812a	85 0a   	STA $0a
$812c	a9 82   	LDA #$82
$812e	85 0b   	STA $0b
$8130	a9 00   	LDA #$00
$8132	85 0c   	STA $0c
$8134	a9 60   	LDA #$60
$8136	85 0d   	STA $0d
$8138	a2 da   	LDX #$da
$813a	a9 ff   	LDA #$ff
$813c	85 12   	STA $12
$813e	a0 00   	LDY #$00
$8140	e8      	INX
$8141	f0 0d   	BEQ $0d ; 13
$8143	b1 0a   	LDA ($0a),Y
$8145	91 0c   	STA ($0c),Y
$8147	c8      	INY
$8148	d0 f6   	BNE $f6 ; -10
$814a	e6 0b   	INC $0b
$814c	e6 0d   	INC $0d
$814e	d0 f0   	BNE $f0 ; -16
$8150	e6 12   	INC $12
$8152	d0 ef   	BNE $ef ; -17
$8154	60      	RTS ; --------------------
$8155	a0 01   	LDY #$01
$8157	b1 02   	LDA ($02),Y
$8159	aa      	TAX
$815a	88      	DEY
$815b	b1 02   	LDA ($02),Y
$815d	e6 02   	INC $02
$815f	f0 05   	BEQ $05 ; 5
$8161	e6 02   	INC $02
$8163	f0 03   	BEQ $03 ; 3
$8165	60      	RTS ; --------------------
$8166	e6 02   	INC $02
$8168	e6 03   	INC $03
$816a	60      	RTS ; --------------------
$816b	85 0a   	STA $0a
$816d	86 0b   	STX $0b
$816f	a2 00   	LDX #$00
$8171	b1 0a   	LDA ($0a),Y
$8173	60      	RTS ; --------------------
$8174	a0 01   	LDY #$01
$8176	b1 02   	LDA ($02),Y
$8178	aa      	TAX
$8179	88      	DEY
$817a	b1 02   	LDA ($02),Y
$817c	60      	RTS ; --------------------
$817d	a5 73   	LDA $73
$817f	d0 fc   	BNE $fc ; -4
$8181	60      	RTS ; --------------------
$8182	a9 ff   	LDA #$ff
$8184	c5 73   	CMP $73
$8186	f0 fc   	BEQ $fc ; -4
$8188	60      	RTS ; --------------------
$8189	85 76   	STA $76
$818b	84 74   	STY $74
$818d	86 75   	STX $75
$818f	20 82 81	JSR $8182
$8192	a4 71   	LDY $71
$8194	a5 74   	LDA $74
$8196	99 00 02	STA $0200,Y
$8199	a5 75   	LDA $75
$819b	99 00 03	STA $0300,Y
$819e	a5 76   	LDA $76
$81a0	99 00 04	STA $0400,Y
$81a3	c8      	INY
$81a4	84 71   	STY $71
$81a6	e6 73   	INC $73
$81a8	60      	RTS ; --------------------
$81a9	a4 73   	LDY $73
$81ab	d0 01   	BNE $01 ; 1
$81ad	60      	RTS ; --------------------
$81ae	a6 72   	LDX $72
$81b0	a9 0e   	LDA #$0e
$81b2	8d 29 60	STA $6029
$81b5	bd 00 02	LDA $0200,X
$81b8	8d 06 20	STA $2006
$81bb	bd 00 03	LDA $0300,X
$81be	8d 06 20	STA $2006
$81c1	bd 00 04	LDA $0400,X
$81c4	8d 07 20	STA $2007
$81c7	e8      	INX
$81c8	88      	DEY
$81c9	f0 5d   	BEQ $5d ; 93
$81cb	bd 00 02	LDA $0200,X
$81ce	8d 06 20	STA $2006
$81d1	bd 00 03	LDA $0300,X
$81d4	8d 06 20	STA $2006
$81d7	bd 00 04	LDA $0400,X
$81da	8d 07 20	STA $2007
$81dd	e8      	INX
$81de	88      	DEY
$81df	f0 47   	BEQ $47 ; 71
$81e1	bd 00 02	LDA $0200,X
$81e4	8d 06 20	STA $2006
$81e7	bd 00 03	LDA $0300,X
$81ea	8d 06 20	STA $2006
$81ed	bd 00 04	LDA $0400,X
$81f0	8d 07 20	STA $2007
$81f3	e8      	INX
$81f4	88      	DEY
$81f5	f0 31   	BEQ $31 ; 49
$81f7	bd 00 02	LDA $0200,X
$81fa	8d 06 20	STA $2006
$81fd	bd 00 03	LDA $0300,X
$8200	8d 06 20	STA $2006
$8203	bd 00 04	LDA $0400,X
$8206	8d 07 20	STA $2007
$8209	e8      	INX
$820a	88      	DEY
$820b	f0 1b   	BEQ $1b ; 27
$820d	bd 00 02	LDA $0200,X
$8210	8d 06 20	STA $2006
$8213	bd 00 03	LDA $0300,X
$8216	8d 06 20	STA $2006
$8219	bd 00 04	LDA $0400,X
$821c	8d 07 20	STA $2007
$821f	e8      	INX
$8220	88      	DEY
$8221	f0 05   	BEQ $05 ; 5
$8223	ce 29 60	DEC $6029
$8226	d0 8d   	BNE $8d ; -115
$8228	86 72   	STX $72
$822a	84 73   	STY $73
$822c	60      	RTS ; --------------------
$822d	a9 00   	LDA #$00
$822f	a2 00   	LDX #$00
$8231	48      	PHA
$8232	a5 02   	LDA $02
$8234	38      	SEC
$8235	e9 02   	SBC #$02
$8237	85 02   	STA $02
$8239	b0 02   	BCS $02 ; 2
$823b	c6 03   	DEC $03
$823d	a0 01   	LDY #$01
$823f	8a      	TXA
$8240	91 02   	STA ($02),Y
$8242	68      	PLA
$8243	88      	DEY
$8244	91 02   	STA ($02),Y
$8246	60      	RTS ; --------------------
$8247	ad 02 20	LDA $2002
$824a	10 fb   	BPL $fb ; -5
$824c	60      	RTS ; --------------------
$824d	48      	PHA
$824e	65 6c   	ADC $6c
$8250	6c 6f 2c	JMP ($2c6f)
$8253	20 4e 45	JSR $454e
$8256	53 21   	SRE ($21),Y
$8258	00      	BRK
$8259	8d 0e 60	STA $600e
$825c	8e 0f 60	STX $600f
$825f	8d 15 60	STA $6015
$8262	8e 16 60	STX $6016
$8265	88      	DEY
$8266	b9 ff ff	LDA $ffff,Y
$8269	8d 1f 60	STA $601f
$826c	88      	DEY
$826d	b9 ff ff	LDA $ffff,Y
$8270	8d 1e 60	STA $601e
$8273	8c 21 60	STY $6021
$8276	20 ff ff	JSR $ffff
$8279	a0 ff   	LDY #$ff
$827b	d0 e8   	BNE $e8 ; -24
$827d	60      	RTS ; --------------------
$827e	00      	BRK
$827f	00      	BRK
$8280	00      	BRK

                	; 7d70 skipped BRKs

$fff1	00      	BRK
$fff2	00      	BRK
$fff3	00      	BRK
$fff4	5c 80 5c	TOP $5c80,X
$fff7	80 5c   	DOP #$5c
$fff9	80 35   	DOP #$35
$fffb	80 00   	DOP #$00
$fffd	80 5c   	DOP #$5c
$ffff	80 78   	DOP #$78
