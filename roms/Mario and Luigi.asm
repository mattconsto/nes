;-------------------------------------------------------------------------------
; Mario and Luigi.nes disasembled by DISASM6 v1.4
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 1              ; 1 x 16k PRG banks
            .db 1              ; 1 x 8k CHR banks
            .db %00000000      ; Mirroring: Horizontal
                               ; SRAM: Not used
                               ; 512k Trainer: Not used
                               ; 4 Screen VRAM: Not used
                               ; Mapper: 0
            .db %00000000      ; RomType: NES
            .hex 00 00 00 00   ; iNES Tail 
            .hex 00 00 00 00    

;-------------------------------------------------------------------------------
; Program Origin
;-------------------------------------------------------------------------------
            .org $c000         ; Set program counter

;-------------------------------------------------------------------------------
; ROM Start
;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      JMP __c094         ; $c000: 4c 94 c0  

;-------------------------------------------------------------------------------
__c003:     JSR $5620          ; $c003: 20 20 56  
            EOR $52            ; $c006: 45 52     
            .hex 53 49         ; $c008: 53 49     Invalid Opcode - SRE ($49),y
            .hex 4f 4e 20      ; $c00a: 4f 4e 20  Invalid Opcode - SRE $204e
            AND ($20),y        ; $c00d: 31 20     
            AND ($39),y        ; $c00f: 31 39     
            SEC                ; $c011: 38        
            .hex 34 20         ; $c012: 34 20     Invalid Opcode - NOP $20,x
            BMI __c04b         ; $c014: 30 35     
            JSR $3932          ; $c016: 20 32 39  
            JSR $5942          ; $c019: 20 42 59  
            JSR $494b          ; $c01c: 20 4b 49  
            .hex 4b 55         ; $c01f: 4b 55     Invalid Opcode - ALR #$55
            JSR $0020          ; $c021: 20 20 00  
            BRK                ; $c024: 00        
            BRK                ; $c025: 00        
__c026:     STA $2007          ; $c026: 8d 07 20  
            RTS                ; $c029: 60        

;-------------------------------------------------------------------------------
            BRK                ; $c02a: 00        
            BRK                ; $c02b: 00        
            BRK                ; $c02c: 00        
            BRK                ; $c02d: 00        
            BRK                ; $c02e: 00        
            BRK                ; $c02f: 00        
__c030:     .hex 12            ; $c030: 12        Invalid Opcode - KIL 
            BMI __c058         ; $c031: 30 25     
            AND ($12,x)        ; $c033: 21 12     
            BMI __c06d         ; $c035: 30 36     
            ROL $12            ; $c037: 26 12     
            BMI __c054         ; $c039: 30 19     
            AND #$12           ; $c03b: 29 12     
            BMI __c06b         ; $c03d: 30 2c     
            .hex 27 12         ; $c03f: 27 12     Invalid Opcode - RLA $12
            ORA $3027,y        ; $c041: 19 27 30  
            .hex 12            ; $c044: 12        Invalid Opcode - KIL 
            CLC                ; $c045: 18        
            .hex 27 16         ; $c046: 27 16     Invalid Opcode - RLA $16
            .hex 12            ; $c048: 12        Invalid Opcode - KIL 
            AND $30            ; $c049: 25 30     
__c04b:     .hex 1a            ; $c04b: 1a        Invalid Opcode - NOP 
            .hex 12            ; $c04c: 12        Invalid Opcode - KIL 
            ASL $30,x          ; $c04d: 16 30     
            .hex 27            ; $c04f: 27        Suspected data
__c050:     .hex 12            ; $c050: 12        Invalid Opcode - KIL 
            BMI __c06c         ; $c051: 30 19     
            .hex 29            ; $c053: 29        Suspected data
__c054:     .hex 12            ; $c054: 12        Invalid Opcode - KIL 
            BMI __c083         ; $c055: 30 2c     
            .hex 27            ; $c057: 27        Suspected data
__c058:     .hex 12            ; $c058: 12        Invalid Opcode - KIL 
            BMI __c073         ; $c059: 30 18     
            PLP                ; $c05b: 28        
            .hex 12            ; $c05c: 12        Invalid Opcode - KIL 
            BMI __c08b         ; $c05d: 30 2c     
            AND ($12,x)        ; $c05f: 21 12     
            BMI __c07c         ; $c061: 30 19     
            AND #$12           ; $c063: 29 12     
            BMI __c093         ; $c065: 30 2c     
            .hex 27 12         ; $c067: 27 12     Invalid Opcode - RLA $12
            BMI __c07c         ; $c069: 30 11     
__c06b:     .hex 21            ; $c06b: 21        Suspected data
__c06c:     .hex 12            ; $c06c: 12        Invalid Opcode - KIL 
__c06d:     BMI __c09b         ; $c06d: 30 2c     
            .hex 29            ; $c06f: 29        Suspected data
__c070:     BRK                ; $c070: 00        
__c071:     BRK                ; $c071: 00        
            .hex 02            ; $c072: 02        Invalid Opcode - KIL 
__c073:     ASL $0282          ; $c073: 0e 82 02  
            ORA ($2a,x)        ; $c076: 01 2a     
            STA ($02,x)        ; $c078: 81 02     
            ORA ($02,x)        ; $c07a: 01 02     
__c07c:     BRK                ; $c07c: 00        
            CLC                ; $c07d: 18        
            .hex 02            ; $c07e: 02        Invalid Opcode - KIL 
            .hex 44 04         ; $c07f: 44 04     Invalid Opcode - NOP $04
            .hex 2d 00         ; $c081: 2d 00     Suspected data
__c083:     .hex 02            ; $c083: 02        Invalid Opcode - KIL 
            ORA ($1b,x)        ; $c084: 01 1b     
            BRK                ; $c086: 00        
            ROL $02            ; $c087: 26 02     
            CLC                ; $c089: 18        
            .hex 82            ; $c08a: 82        Suspected data
__c08b:     .hex 02            ; $c08b: 02        Invalid Opcode - KIL 
            .hex 02            ; $c08c: 02        Invalid Opcode - KIL 
            .hex 02            ; $c08d: 02        Invalid Opcode - KIL 
            BRK                ; $c08e: 00        
            ASL $2201,x        ; $c08f: 1e 01 22  
            .hex 02            ; $c092: 02        Invalid Opcode - KIL 
__c093:     .hex 64            ; $c093: 64        Suspected data
__c094:     LDX #$ff           ; $c094: a2 ff     
            TXS                ; $c096: 9a        
            LDA #$00           ; $c097: a9 00     
            TAX                ; $c099: aa        
__c09a:     .hex 95            ; $c09a: 95        Suspected data
__c09b:     BRK                ; $c09b: 00        
            INX                ; $c09c: e8        
            CPX #$e8           ; $c09d: e0 e8     
            BNE __c09a         ; $c09f: d0 f9     
            LDA #$00           ; $c0a1: a9 00     
            TAX                ; $c0a3: aa        
__c0a4:     JSR __c0b0         ; $c0a4: 20 b0 c0  
            STA $0500,x        ; $c0a7: 9d 00 05  
            INX                ; $c0aa: e8        
            BNE __c0a4         ; $c0ab: d0 f7     
            JMP __c1ab         ; $c0ad: 4c ab c1  

;-------------------------------------------------------------------------------
__c0b0:     STA $0200,x        ; $c0b0: 9d 00 02  
            STA $0300,x        ; $c0b3: 9d 00 03  
            STA $0400,x        ; $c0b6: 9d 00 04  
            STA $0600,x        ; $c0b9: 9d 00 06  
            STA $0700,x        ; $c0bc: 9d 00 07  
            RTS                ; $c0bf: 60        

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        STA $1c            ; $c0c0: 85 1c     
            STX $1d            ; $c0c2: 86 1d     
            STY $1e            ; $c0c4: 84 1e     
            LDA #$00           ; $c0c6: a9 00     
            STA $2003          ; $c0c8: 8d 03 20  
            LDA #$07           ; $c0cb: a9 07     
            STA $4014          ; $c0cd: 8d 14 40  
            LDA #$00           ; $c0d0: a9 00     
            STA $26            ; $c0d2: 85 26     
            LDA #$00           ; $c0d4: a9 00     
            STA $14            ; $c0d6: 85 14     
            LDA #$02           ; $c0d8: a9 02     
            STA $15            ; $c0da: 85 15     
            LDY #$00           ; $c0dc: a0 00     
            LDA ($14),y        ; $c0de: b1 14     
            BEQ __c109         ; $c0e0: f0 27     
            LDA #$00           ; $c0e2: a9 00     
            STA ($14),y        ; $c0e4: 91 14     
            INY                ; $c0e6: c8        
__c0e7:     LDA ($14),y        ; $c0e7: b1 14     
            TAX                ; $c0e9: aa        
            AND #$c0           ; $c0ea: 29 c0     
            BEQ __c105         ; $c0ec: f0 17     
            CMP #$80           ; $c0ee: c9 80     
            BEQ __c0f5         ; $c0f0: f0 03     
            JMP __c105         ; $c0f2: 4c 05 c1  

;-------------------------------------------------------------------------------
__c0f5:     JSR __c190         ; $c0f5: 20 90 c1  
            TAX                ; $c0f8: aa        
__c0f9:     LDA ($14),y        ; $c0f9: b1 14     
            JSR __c026         ; $c0fb: 20 26 c0  
            INY                ; $c0fe: c8        
            DEX                ; $c0ff: ca        
            BNE __c0f9         ; $c100: d0 f7     
            JMP __c0e7         ; $c102: 4c e7 c0  

;-------------------------------------------------------------------------------
__c105:     LDA #$01           ; $c105: a9 01     
            STA $27            ; $c107: 85 27     
__c109:     .hex a9            ; $c109: a9        Suspected data
__c10a:     ORA ($8d,x)        ; $c10a: 01 8d     
            ASL $40,x          ; $c10c: 16 40     
            LDA #$00           ; $c10e: a9 00     
            STA $4016          ; $c110: 8d 16 40  
            LDX #$00           ; $c113: a2 00     
            LDY #$08           ; $c115: a0 08     
__c117:     TXA                ; $c117: 8a        
            ASL                ; $c118: 0a        
            TAX                ; $c119: aa        
            LDA $4016          ; $c11a: ad 16 40  
            AND #$01           ; $c11d: 29 01     
            BEQ __c122         ; $c11f: f0 01     
            INX                ; $c121: e8        
__c122:     DEY                ; $c122: 88        
            BNE __c117         ; $c123: d0 f2     
            STX $1a            ; $c125: 86 1a     
            LDX #$00           ; $c127: a2 00     
            LDY #$08           ; $c129: a0 08     
__c12b:     TXA                ; $c12b: 8a        
            ASL                ; $c12c: 0a        
            TAX                ; $c12d: aa        
            LDA $4017          ; $c12e: ad 17 40  
            AND #$01           ; $c131: 29 01     
            BEQ __c136         ; $c133: f0 01     
__c135:     INX                ; $c135: e8        
__c136:     DEY                ; $c136: 88        
            BNE __c12b         ; $c137: d0 f2     
            STX $1b            ; $c139: 86 1b     
            LDA $cc            ; $c13b: a5 cc     
            BEQ __c17d         ; $c13d: f0 3e     
            CMP #$02           ; $c13f: c9 02     
            BEQ __c15d         ; $c141: f0 1a     
            LDX $0723          ; $c143: ae 23 07  
            LDY $0720          ; $c146: ac 20 07  
            INY                ; $c149: c8        
            INY                ; $c14a: c8        
            JSR __dffc         ; $c14b: 20 fc df  
            DEC $cd            ; $c14e: c6 cd     
            DEC $cd            ; $c150: c6 cd     
            LDA $cd            ; $c152: a5 cd     
            CMP #$f9           ; $c154: c9 f9     
            BNE __c173         ; $c156: d0 1b     
            INC $cc            ; $c158: e6 cc     
            JMP __c173         ; $c15a: 4c 73 c1  

;-------------------------------------------------------------------------------
__c15d:     LDX $0723          ; $c15d: ae 23 07  
            LDY $0720          ; $c160: ac 20 07  
            DEY                ; $c163: 88        
            JSR __dffc         ; $c164: 20 fc df  
            INC $cd            ; $c167: e6 cd     
            LDA $cd            ; $c169: a5 cd     
            CMP #$ff           ; $c16b: c9 ff     
            BNE __c173         ; $c16d: d0 04     
            LDA #$00           ; $c16f: a9 00     
            STA $cc            ; $c171: 85 cc     
__c173:     LDA #$00           ; $c173: a9 00     
            STA $2005          ; $c175: 8d 05 20  
            LDA $cd            ; $c178: a5 cd     
            STA $2005          ; $c17a: 8d 05 20  
__c17d:     JSR __f1a7         ; $c17d: 20 a7 f1  
            JSR __f1f2         ; $c180: 20 f2 f1  
            JSR __f23d         ; $c183: 20 3d f2  
            JSR __f2a4         ; $c186: 20 a4 f2  
            LDA $1c            ; $c189: a5 1c     
            .hex a6            ; $c18b: a6        Suspected data
__c18c:     ORA $1ea4,x        ; $c18c: 1d a4 1e  
            RTI                ; $c18f: 40        

;-------------------------------------------------------------------------------
__c190:     TXA                ; $c190: 8a        
            AND #$3f           ; $c191: 29 3f     
            STA $1f            ; $c193: 85 1f     
            INY                ; $c195: c8        
            LDA ($14),y        ; $c196: b1 14     
            PHA                ; $c198: 48        
            INY                ; $c199: c8        
            LDA ($14),y        ; $c19a: b1 14     
            TAX                ; $c19c: aa        
            PLA                ; $c19d: 68        
            INY                ; $c19e: c8        
            STA $2006          ; $c19f: 8d 06 20  
            STX $2006          ; $c1a2: 8e 06 20  
            JSR __ef83         ; $c1a5: 20 83 ef  
            LDA $1f            ; $c1a8: a5 1f     
            RTS                ; $c1aa: 60        

;-------------------------------------------------------------------------------
__c1ab:     LDX #$ff           ; $c1ab: a2 ff     
            TXS                ; $c1ad: 9a        
            LDA #$10           ; $c1ae: a9 10     
            STA $2000          ; $c1b0: 8d 00 20  
            LDA #$01           ; $c1b3: a9 01     
            STA $27            ; $c1b5: 85 27     
            LDA #$00           ; $c1b7: a9 00     
            STA $0200          ; $c1b9: 8d 00 02  
            JSR __efaa         ; $c1bc: 20 aa ef  
            JSR __f31b         ; $c1bf: 20 1b f3  
            LDA #$01           ; $c1c2: a9 01     
            STA $20            ; $c1c4: 85 20     
            JSR __e984         ; $c1c6: 20 84 e9  
            LDX #$00           ; $c1c9: a2 00     
__c1cb:     LDA $0600,x        ; $c1cb: bd 00 06  
            STA $0500,x        ; $c1ce: 9d 00 05  
            INX                ; $c1d1: e8        
            BNE __c1cb         ; $c1d2: d0 f7     
            LDA #$00           ; $c1d4: a9 00     
            STA $ba            ; $c1d6: 85 ba     
            STA $bb            ; $c1d8: 85 bb     
            LDA #$00           ; $c1da: a9 00     
__c1dc:     STA $b8            ; $c1dc: 85 b8     
            STA $b9            ; $c1de: 85 b9     
            STA $bc            ; $c1e0: 85 bc     
            STA $bd            ; $c1e2: 85 bd     
            LDA #$03           ; $c1e4: a9 03     
            STA $eb            ; $c1e6: 85 eb     
            LDA #$80           ; $c1e8: a9 80     
            STA $2f            ; $c1ea: 85 2f     
            JMP __c1ef         ; $c1ec: 4c ef c1  

;-------------------------------------------------------------------------------
__c1ef:     LDX #$ff           ; $c1ef: a2 ff     
            TXS                ; $c1f1: 9a        
            LDA #$10           ; $c1f2: a9 10     
            STA $2000          ; $c1f4: 8d 00 20  
            LDA #$00           ; $c1f7: a9 00     
            TAX                ; $c1f9: aa        
__c1fa:     STA $00,x          ; $c1fa: 95 00     
            INX                ; $c1fc: e8        
            CPX #$2f           ; $c1fd: e0 2f     
            BNE __c1fa         ; $c1ff: d0 f9     
            INX                ; $c201: e8        
__c202:     .hex 95            ; $c202: 95        Suspected data
__c203:     BRK                ; $c203: 00        
            INX                ; $c204: e8        
            CPX #$b8           ; $c205: e0 b8     
__c207:     BNE __c202         ; $c207: d0 f9     
            INX                ; $c209: e8        
            INX                ; $c20a: e8        
            INX                ; $c20b: e8        
__c20c:     INX                ; $c20c: e8        
            INX                ; $c20d: e8        
            INX                ; $c20e: e8        
__c20f:     STA $00,x          ; $c20f: 95 00     
            INX                ; $c211: e8        
            CPX #$e8           ; $c212: e0 e8     
            BNE __c20f         ; $c214: d0 f9     
            LDA #$00           ; $c216: a9 00     
            TAX                ; $c218: aa        
__c219:     JSR __c0b0         ; $c219: 20 b0 c0  
            INX                ; $c21c: e8        
            BNE __c219         ; $c21d: d0 fa     
            LDA #$01           ; $c21f: a9 01     
            STA $27            ; $c221: 85 27     
            LDA #$00           ; $c223: a9 00     
            STA $0200          ; $c225: 8d 00 02  
            JSR __efaa         ; $c228: 20 aa ef  
            LDA $eb            ; $c22b: a5 eb     
            CLC                ; $c22d: 18        
            ADC #$01           ; $c22e: 69 01     
            AND #$03           ; $c230: 29 03     
            STA $eb            ; $c232: 85 eb     
            LDA #$00           ; $c234: a9 00     
            STA $e8            ; $c236: 85 e8     
            STA $e9            ; $c238: 85 e9     
            JSR __ec73         ; $c23a: 20 73 ec  
            LDA #$01           ; $c23d: a9 01     
            LDX $a7            ; $c23f: a6 a7     
            BEQ __c245         ; $c241: f0 02     
            LDA #$0a           ; $c243: a9 0a     
__c245:     STA $c4            ; $c245: 85 c4     
            STA $c5            ; $c247: 85 c5     
            STA $20            ; $c249: 85 20     
            LDA #$02           ; $c24b: a9 02     
            STA $be            ; $c24d: 85 be     
            STA $bf            ; $c24f: 85 bf     
            STA $22            ; $c251: 85 22     
            LDA #$01           ; $c253: a9 01     
            STA $e5            ; $c255: 85 e5     
            LDA #$00           ; $c257: a9 00     
            STA $e2            ; $c259: 85 e2     
            STA $ce            ; $c25b: 85 ce     
            STA $cf            ; $c25d: 85 cf     
            JMP __c30c         ; $c25f: 4c 0c c3  

;-------------------------------------------------------------------------------
__c262:     LDX $20            ; $c262: a6 20     
            DEX                ; $c264: ca        
            LDA __c492,x       ; $c265: bd 92 c4  
            RTS                ; $c268: 60        

;-------------------------------------------------------------------------------
__c269:     JSR __e544         ; $c269: 20 44 e5  
            JSR __e579         ; $c26c: 20 79 e5  
            RTS                ; $c26f: 60        

;-------------------------------------------------------------------------------
__c270:     JSR __c269         ; $c270: 20 69 c2  
            JSR __ec08         ; $c273: 20 08 ec  
            RTS                ; $c276: 60        

;-------------------------------------------------------------------------------
__c277:     LDX #$ff           ; $c277: a2 ff     
            TXS                ; $c279: 9a        
            JSR __ec08         ; $c27a: 20 08 ec  
            LDA #$01           ; $c27d: a9 01     
            STA $26            ; $c27f: 85 26     
            STA $e5            ; $c281: 85 e5     
__c283:     LDA $26            ; $c283: a5 26     
            BNE __c283         ; $c285: d0 fc     
            JSR __c6b5         ; $c287: 20 b5 c6  
            LDA #$00           ; $c28a: a9 00     
            STA $8f            ; $c28c: 85 8f     
            JSR __c269         ; $c28e: 20 69 c2  
            JSR __cd21         ; $c291: 20 21 cd  
            JSR __c262         ; $c294: 20 62 c2  
            BNE __c2c2         ; $c297: d0 29     
            JSR __ccaf         ; $c299: 20 af cc  
            JSR __ec08         ; $c29c: 20 08 ec  
            LDA #$20           ; $c29f: a9 20     
            JSR __cd3d         ; $c2a1: 20 3d cd  
            LDA #$80           ; $c2a4: a9 80     
            JSR __cd3d         ; $c2a6: 20 3d cd  
            JSR __ce79         ; $c2a9: 20 79 ce  
            LDY #$40           ; $c2ac: a0 40     
            LDA #$20           ; $c2ae: a9 20     
            JSR __d191         ; $c2b0: 20 91 d1  
            LDA #$08           ; $c2b3: a9 08     
            JSR __d1a1         ; $c2b5: 20 a1 d1  
            LDA #$01           ; $c2b8: a9 01     
            JSR __d1b7         ; $c2ba: 20 b7 d1  
            LDA #$44           ; $c2bd: a9 44     
            JSR __d1c4         ; $c2bf: 20 c4 d1  
__c2c2:     LDA #$0c           ; $c2c2: a9 0c     
            .hex 20 0c         ; $c2c4: 20 0c     Suspected data
__c2c6:     .hex c6            ; $c2c6: c6        Suspected data
__c2c7:     LDA $34            ; $c2c7: a5 34     
            BNE __c2c7         ; $c2c9: d0 fc     
__c2cb:     JSR __efaa         ; $c2cb: 20 aa ef  
            LDA $e1            ; $c2ce: a5 e1     
            BEQ __c2ed         ; $c2d0: f0 1b     
            LDX $c5            ; $c2d2: a6 c5     
            CPX #$32           ; $c2d4: e0 32     
            BNE __c2e1         ; $c2d6: d0 09     
            JSR __c7c8         ; $c2d8: 20 c8 c7  
            LDX #$00           ; $c2db: a2 00     
            LDA #$01           ; $c2dd: a9 01     
            STA $e9            ; $c2df: 85 e9     
__c2e1:     INX                ; $c2e1: e8        
            STX $c5            ; $c2e2: 86 c5     
            STX $20            ; $c2e4: 86 20     
            LDA $bf            ; $c2e6: a5 bf     
            STA $22            ; $c2e8: 85 22     
            JMP __c349         ; $c2ea: 4c 49 c3  

;-------------------------------------------------------------------------------
__c2ed:     LDX $c4            ; $c2ed: a6 c4     
            CPX #$32           ; $c2ef: e0 32     
            BNE __c2fc         ; $c2f1: d0 09     
            JSR __c7c8         ; $c2f3: 20 c8 c7  
            LDX #$00           ; $c2f6: a2 00     
            LDA #$01           ; $c2f8: a9 01     
            STA $e8            ; $c2fa: 85 e8     
__c2fc:     INX                ; $c2fc: e8        
            STX $c4            ; $c2fd: 86 c4     
            STX $20            ; $c2ff: 86 20     
            LDA $be            ; $c301: a5 be     
            STA $22            ; $c303: 85 22     
            JMP __c349         ; $c305: 4c 49 c3  

;-------------------------------------------------------------------------------
__c308:     LDA #$00           ; $c308: a9 00     
            STA $e5            ; $c30a: 85 e5     
__c30c:     LDX #$ff           ; $c30c: a2 ff     
            TXS                ; $c30e: 9a        
            JSR __efaa         ; $c30f: 20 aa ef  
            LDA $e0            ; $c312: a5 e0     
            BEQ __c341         ; $c314: f0 2b     
            LDA $e1            ; $c316: a5 e1     
            BEQ __c32b         ; $c318: f0 11     
            LDA $bf            ; $c31a: a5 bf     
            BMI __c32f         ; $c31c: 30 11     
__c31e:     LDA $bf            ; $c31e: a5 bf     
            STA $22            ; $c320: 85 22     
            LDA $c5            ; $c322: a5 c5     
__c324:     STA $20            ; $c324: 85 20     
            LDA #$01           ; $c326: a9 01     
            JMP __c339         ; $c328: 4c 39 c3  

;-------------------------------------------------------------------------------
__c32b:     LDA $be            ; $c32b: a5 be     
            BMI __c31e         ; $c32d: 30 ef     
__c32f:     LDA $be            ; $c32f: a5 be     
            STA $22            ; $c331: 85 22     
            LDA $c4            ; $c333: a5 c4     
            STA $20            ; $c335: 85 20     
            LDA #$00           ; $c337: a9 00     
__c339:     STA $e1            ; $c339: 85 e1     
            JSR __c438         ; $c33b: 20 38 c4  
            JMP __c349         ; $c33e: 4c 49 c3  

;-------------------------------------------------------------------------------
__c341:     LDA $be            ; $c341: a5 be     
__c343:     STA $22            ; $c343: 85 22     
            LDA $c4            ; $c345: a5 c4     
            STA $20            ; $c347: 85 20     
__c349:     LDX #$05           ; $c349: a2 05     
            .hex a5            ; $c34b: a5        Suspected data
__c34c:     JSR $07c9          ; $c34c: 20 c9 07  
            BCS __c353         ; $c34f: b0 02     
            TAX                ; $c351: aa        
            DEX                ; $c352: ca        
__c353:     LDA __c48c,x       ; $c353: bd 8c c4  
            STA $21            ; $c356: 85 21     
            LDA #$00           ; $c358: a9 00     
            STA $e3            ; $c35a: 85 e3     
            STA $cc            ; $c35c: 85 cc     
            JSR __c410         ; $c35e: 20 10 c4  
            JSR __ef4d         ; $c361: 20 4d ef  
            .hex a9            ; $c364: a9        Suspected data
__c365:     ORA ($20,x)        ; $c365: 01 20     
            .hex 0c c6 20      ; $c367: 0c c6 20  Invalid Opcode - NOP $20c6
            .hex 62            ; $c36a: 62        Invalid Opcode - KIL 
            .hex c2 85         ; $c36b: c2 85     Invalid Opcode - NOP #$85
            .hex 8f 20 75      ; $c36d: 8f 20 75  Invalid Opcode - SAX $7520
            SBC #$20           ; $c370: e9 20     
            CMP $a5e3          ; $c372: cd e3 a5  
            .hex 0f f0 1f      ; $c375: 0f f0 1f  Invalid Opcode - SLO $1ff0
            JSR __ef4d         ; $c378: 20 4d ef  
            JSR __efaa         ; $c37b: 20 aa ef  
            JSR __ef6c         ; $c37e: 20 6c ef  
__c381:     LDA #$00           ; $c381: a9 00     
            STA $00            ; $c383: 85 00     
__c385:     LDA #$c4           ; $c385: a9 c4     
            STA $01            ; $c387: 85 01     
            JSR __ec28         ; $c389: 20 28 ec  
__c38c:     JSR __ef76         ; $c38c: 20 76 ef  
            LDA #$14           ; $c38f: a9 14     
            JSR __c60c         ; $c391: 20 0c c6  
            JMP __c1ef         ; $c394: 4c ef c1  

;-------------------------------------------------------------------------------
__c397:     JSR __da7a         ; $c397: 20 7a da  
            JSR __d539         ; $c39a: 20 39 d5  
            JSR __d1d4         ; $c39d: 20 d4 d1  
            JSR __d05c         ; $c3a0: 20 5c d0  
            JSR __cebf         ; $c3a3: 20 bf ce  
            JSR __cba7         ; $c3a6: 20 a7 cb  
            JSR __caf0         ; $c3a9: 20 f0 ca  
            JSR __c9a1         ; $c3ac: 20 a1 c9  
            JSR __d03e         ; $c3af: 20 3e d0  
            LDA $a7            ; $c3b2: a5 a7     
            BNE __c3cc         ; $c3b4: d0 16     
            LDA $e5            ; $c3b6: a5 e5     
            BEQ __c3c0         ; $c3b8: f0 06     
            LDA $8f            ; $c3ba: a5 8f     
            BNE __c3d1         ; $c3bc: d0 13     
            BEQ __c3c4         ; $c3be: f0 04     
__c3c0:     LDA $ce            ; $c3c0: a5 ce     
            BEQ __c3cc         ; $c3c2: f0 08     
__c3c4:     JSR __f163         ; $c3c4: 20 63 f1  
            LDA #$08           ; $c3c7: a9 08     
            JSR __c60c         ; $c3c9: 20 0c c6  
__c3cc:     LDA #$02           ; $c3cc: a9 02     
            JSR __c60c         ; $c3ce: 20 0c c6  
__c3d1:     LDA #$86           ; $c3d1: a9 86     
            JSR __dfe8         ; $c3d3: 20 e8 df  
            LDA #$02           ; $c3d6: a9 02     
            JSR __c60c         ; $c3d8: 20 0c c6  
            LDA $8f            ; $c3db: a5 8f     
            STA $ce            ; $c3dd: 85 ce     
            LDA #$01           ; $c3df: a9 01     
            STA $24            ; $c3e1: 85 24     
            LDA #$00           ; $c3e3: a9 00     
            STA $e5            ; $c3e5: 85 e5     
            STA $3f            ; $c3e7: 85 3f     
            LDA $a7            ; $c3e9: a5 a7     
            BNE __c3fd         ; $c3eb: d0 10     
            JSR __f2dc         ; $c3ed: 20 dc f2  
            LDA $8f            ; $c3f0: a5 8f     
            BNE __c3fa         ; $c3f2: d0 06     
            JSR __f01b         ; $c3f4: 20 1b f0  
            JMP __c4c4         ; $c3f7: 4c c4 c4  

;-------------------------------------------------------------------------------
__c3fa:     JSR __f039         ; $c3fa: 20 39 f0  
__c3fd:     JMP __c4c4         ; $c3fd: 4c c4 c4  

;-------------------------------------------------------------------------------
            TAX                ; $c400: aa        
            AND ($52,x)        ; $c401: 21 52     
            .hex 4f 55 4e      ; $c403: 4f 55 4e  Invalid Opcode - SRE $4e55
            .hex 44 20         ; $c406: 44 20     Invalid Opcode - NOP $20
            EOR $52            ; $c408: 45 52     
            .hex 52            ; $c40a: 52        Invalid Opcode - KIL 
            .hex 4f 52 00      ; $c40b: 4f 52 00  Bad Addr Mode - SRE $0052
            .hex ff ff         ; $c40e: ff ff     Suspected data
__c410:     JSR __c262         ; $c410: 20 62 c2  
            BEQ __c437         ; $c413: f0 22     
            JSR __ef4d         ; $c415: 20 4d ef  
            JSR __efaa         ; $c418: 20 aa ef  
            JSR __ef6c         ; $c41b: 20 6c ef  
            LDA #$7b           ; $c41e: a9 7b     
            STA $00            ; $c420: 85 00     
            LDA #$c4           ; $c422: a9 c4     
__c424:     STA $01            ; $c424: 85 01     
            JSR __ec28         ; $c426: 20 28 ec  
            JSR __ef76         ; $c429: 20 76 ef  
            JSR __f2d4         ; $c42c: 20 d4 f2  
            JSR __f004         ; $c42f: 20 04 f0  
            LDA #$07           ; $c432: a9 07     
            JSR __c60c         ; $c434: 20 0c c6  
__c437:     RTS                ; $c437: 60        

;-------------------------------------------------------------------------------
__c438:     JSR __ef4d         ; $c438: 20 4d ef  
            JSR __efaa         ; $c43b: 20 aa ef  
            JSR __ef6c         ; $c43e: 20 6c ef  
            LDA #$61           ; $c441: a9 61     
            STA $00            ; $c443: 85 00     
            LDA #$c4           ; $c445: a9 c4     
            STA $01            ; $c447: 85 01     
            LDA $e1            ; $c449: a5 e1     
            BEQ __c455         ; $c44b: f0 08     
            LDA #$6e           ; $c44d: a9 6e     
            STA $00            ; $c44f: 85 00     
            LDA #$c4           ; $c451: a9 c4     
            STA $01            ; $c453: 85 01     
__c455:     JSR __ec28         ; $c455: 20 28 ec  
            JSR __ef76         ; $c458: 20 76 ef  
            LDA #$08           ; $c45b: a9 08     
            JSR __c60c         ; $c45d: 20 0c c6  
            RTS                ; $c460: 60        

;-------------------------------------------------------------------------------
            LDY $5021          ; $c461: ac 21 50  
            JMP $5941          ; $c464: 4c 41 59  

;-------------------------------------------------------------------------------
            EOR $52            ; $c467: 45 52     
            JSR $003a          ; $c469: 20 3a 00  
            .hex ff ff ac      ; $c46c: ff ff ac  Invalid Opcode - ISC $acff,x
            AND ($50,x)        ; $c46f: 21 50     
            JMP $5941          ; $c471: 4c 41 59  

;-------------------------------------------------------------------------------
            EOR $52            ; $c474: 45 52     
            JSR $003b          ; $c476: 20 3b 00  
            .hex ff ff aa      ; $c479: ff ff aa  Invalid Opcode - ISC $aaff,x
            AND ($42,x)        ; $c47c: 21 42     
            .hex 4f 4e 55      ; $c47e: 4f 4e 55  Invalid Opcode - SRE $554e
            .hex 53 20         ; $c481: 53 20     Invalid Opcode - SRE ($20),y
            .hex 52            ; $c483: 52        Invalid Opcode - KIL 
            .hex 4f 55 4e      ; $c484: 4f 55 4e  Invalid Opcode - SRE $4e55
            .hex 44 21         ; $c487: 44 21     Invalid Opcode - NOP $21
            BRK                ; $c489: 00        
            .hex ff ff         ; $c48a: ff ff     Suspected data
__c48c:     PLP                ; $c48c: 28        
            .hex 32            ; $c48d: 32        Invalid Opcode - KIL 
            .hex 3c 46 50      ; $c48e: 3c 46 50  Invalid Opcode - NOP $5046,x
            .hex 5a            ; $c491: 5a        Invalid Opcode - NOP 
__c492:     BRK                ; $c492: 00        
            BRK                ; $c493: 00        
            ORA ($00,x)        ; $c494: 01 00     
            BRK                ; $c496: 00        
            BRK                ; $c497: 00        
            BRK                ; $c498: 00        
            .hex 02            ; $c499: 02        Invalid Opcode - KIL 
            BRK                ; $c49a: 00        
            BRK                ; $c49b: 00        
            BRK                ; $c49c: 00        
            BRK                ; $c49d: 00        
            .hex 03 00         ; $c49e: 03 00     Invalid Opcode - SLO ($00,x)
            BRK                ; $c4a0: 00        
            BRK                ; $c4a1: 00        
            BRK                ; $c4a2: 00        
            .hex 04 00         ; $c4a3: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c4a5: 00        
            BRK                ; $c4a6: 00        
            BRK                ; $c4a7: 00        
            .hex 04 00         ; $c4a8: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c4aa: 00        
            BRK                ; $c4ab: 00        
            BRK                ; $c4ac: 00        
            .hex 04 00         ; $c4ad: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c4af: 00        
            BRK                ; $c4b0: 00        
            BRK                ; $c4b1: 00        
            .hex 04 00         ; $c4b2: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c4b4: 00        
            BRK                ; $c4b5: 00        
            BRK                ; $c4b6: 00        
            .hex 04 00         ; $c4b7: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c4b9: 00        
            BRK                ; $c4ba: 00        
            BRK                ; $c4bb: 00        
            .hex 04 00         ; $c4bc: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c4be: 00        
            BRK                ; $c4bf: 00        
            BRK                ; $c4c0: 00        
            .hex 04 00         ; $c4c1: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c4c3: 00        
__c4c4:     LDX #$ff           ; $c4c4: a2 ff     
            TXS                ; $c4c6: 9a        
            LDA #$01           ; $c4c7: a9 01     
            STA $26            ; $c4c9: 85 26     
            .hex a5            ; $c4cb: a5        Suspected data
__c4cc:     .hex a7 d0         ; $c4cc: a7 d0     Invalid Opcode - LAX $d0
            ROL $a5            ; $c4ce: 26 a5     
            .hex 1a            ; $c4d0: 1a        Invalid Opcode - NOP 
            AND #$10           ; $c4d1: 29 10     
            BNE __c4fb         ; $c4d3: d0 26     
            LDA $e1            ; $c4d5: a5 e1     
            BNE __c4e8         ; $c4d7: d0 0f     
            LDA $1a            ; $c4d9: a5 1a     
            ORA $1b            ; $c4db: 05 1b     
            AND #$c0           ; $c4dd: 29 c0     
            BNE __c4fb         ; $c4df: d0 1a     
            LDA #$00           ; $c4e1: a9 00     
            STA $24            ; $c4e3: 85 24     
            JMP __c4fb         ; $c4e5: 4c fb c4  

;-------------------------------------------------------------------------------
__c4e8:     LDA $1b            ; $c4e8: a5 1b     
            AND #$c0           ; $c4ea: 29 c0     
            BNE __c4fb         ; $c4ec: d0 0d     
            LDA #$00           ; $c4ee: a9 00     
            STA $24            ; $c4f0: 85 24     
            JMP __c4fb         ; $c4f2: 4c fb c4  

;-------------------------------------------------------------------------------
            LDA #$00           ; $c4f5: a9 00     
            STA $24            ; $c4f7: 85 24     
            STA $25            ; $c4f9: 85 25     
__c4fb:     JSR __dac9         ; $c4fb: 20 c9 da  
            .hex 20 5f         ; $c4fe: 20 5f     Suspected data
__c500:     CMP $20,x          ; $c500: d5 20     
            .hex f3 d1         ; $c502: f3 d1     Invalid Opcode - ISC ($d1),y
            JSR __d082         ; $c504: 20 82 d0  
            JSR __ceec         ; $c507: 20 ec ce  
            JSR __c9ae         ; $c50a: 20 ae c9  
            JSR __cbb9         ; $c50d: 20 b9 cb  
            JSR __cd94         ; $c510: 20 94 cd  
            JSR __cb6a         ; $c513: 20 6a cb  
            JSR __d008         ; $c516: 20 08 d0  
            JSR __cb5e         ; $c519: 20 5e cb  
            JSR __c270         ; $c51c: 20 70 c2  
__c51f:     LDA $26            ; $c51f: a5 26     
            BNE __c51f         ; $c521: d0 fc     
            LDX $e5            ; $c523: a6 e5     
            DEX                ; $c525: ca        
            CPX $2b            ; $c526: e4 2b     
            BNE __c52d         ; $c528: d0 03     
            JMP __c277         ; $c52a: 4c 77 c2  

;-------------------------------------------------------------------------------
__c52d:     JSR __c68c         ; $c52d: 20 8c c6  
            JSR __c549         ; $c530: 20 49 c5  
            LDA $a7            ; $c533: a5 a7     
            BEQ __c546         ; $c535: f0 0f     
            LDA $1a            ; $c537: a5 1a     
            AND #$10           ; $c539: 29 10     
            BNE __c543         ; $c53b: d0 06     
            LDA $1a            ; $c53d: a5 1a     
            AND #$20           ; $c53f: 29 20     
            BEQ __c546         ; $c541: f0 03     
__c543:     JMP __c1ef         ; $c543: 4c ef c1  

;-------------------------------------------------------------------------------
__c546:     JMP __c4c4         ; $c546: 4c c4 c4  

;-------------------------------------------------------------------------------
__c549:     LDA $a7            ; $c549: a5 a7     
            BNE __c55f         ; $c54b: d0 12     
            LDA $34            ; $c54d: a5 34     
            ORA $38            ; $c54f: 05 38     
            BNE __c55f         ; $c551: d0 0c     
            LDA $1a            ; $c553: a5 1a     
            AND #$10           ; $c555: 29 10     
            BNE __c579         ; $c557: d0 20     
            LDA $1a            ; $c559: a5 1a     
            AND #$20           ; $c55b: 29 20     
            BNE __c560         ; $c55d: d0 01     
__c55f:     RTS                ; $c55f: 60        

;-------------------------------------------------------------------------------
__c560:     JSR __f31b         ; $c560: 20 1b f3  
__c563:     LDA $1a            ; $c563: a5 1a     
            AND #$10           ; $c565: 29 10     
            BNE __c576         ; $c567: d0 0d     
            LDA $1a            ; $c569: a5 1a     
            AND #$20           ; $c56b: 29 20     
            BNE __c563         ; $c56d: d0 f4     
            LDA #$01           ; $c56f: a9 01     
            STA $cf            ; $c571: 85 cf     
            JMP __c2cb         ; $c573: 4c cb c2  

;-------------------------------------------------------------------------------
__c576:     JMP __db52         ; $c576: 4c 52 db  

;-------------------------------------------------------------------------------
__c579:     LDA $24            ; $c579: a5 24     
            BNE __c55f         ; $c57b: d0 e2     
            JSR __f2d4         ; $c57d: 20 d4 f2  
            LDA #$07           ; $c580: a9 07     
            STA $4015          ; $c582: 8d 15 40  
            JSR __f08d         ; $c585: 20 8d f0  
            LDX #$00           ; $c588: a2 00     
__c58a:     LDA $0700,x        ; $c58a: bd 00 07  
            STA $0400,x        ; $c58d: 9d 00 04  
            INX                ; $c590: e8        
            BNE __c58a         ; $c591: d0 f7     
            LDX #$00           ; $c593: a2 00     
__c595:     LDA #$f8           ; $c595: a9 f8     
            STA $0700,x        ; $c597: 9d 00 07  
            INX                ; $c59a: e8        
            BNE __c595         ; $c59b: d0 f8     
__c59d:     LDA $1a            ; $c59d: a5 1a     
            AND #$10           ; $c59f: 29 10     
            BNE __c59d         ; $c5a1: d0 fa     
__c5a3:     LDA $1a            ; $c5a3: a5 1a     
            AND #$10           ; $c5a5: 29 10     
            BEQ __c5a3         ; $c5a7: f0 fa     
            LDX #$00           ; $c5a9: a2 00     
__c5ab:     LDA $0400,x        ; $c5ab: bd 00 04  
            STA $0700,x        ; $c5ae: 9d 00 07  
            INX                ; $c5b1: e8        
            BNE __c5ab         ; $c5b2: d0 f7     
__c5b4:     LDA $1a            ; $c5b4: a5 1a     
            AND #$10           ; $c5b6: 29 10     
            BNE __c5b4         ; $c5b8: d0 fa     
            LDA $1a            ; $c5ba: a5 1a     
            CMP #$e2           ; $c5bc: c9 e2     
            BNE __c5c6         ; $c5be: d0 06     
            LDA $1b            ; $c5c0: a5 1b     
            CMP #$41           ; $c5c2: c9 41     
            BEQ __c5de         ; $c5c4: f0 18     
__c5c6:     JSR __f08d         ; $c5c6: 20 8d f0  
            LDA #$05           ; $c5c9: a9 05     
            JSR __c60c         ; $c5cb: 20 0c c6  
            JSR __f2dc         ; $c5ce: 20 dc f2  
            LDA $e5            ; $c5d1: a5 e5     
            BNE __c5dd         ; $c5d3: d0 08     
            LDA $57            ; $c5d5: a5 57     
            BNE __c5dd         ; $c5d7: d0 04     
            LDA #$01           ; $c5d9: a9 01     
            STA $3c            ; $c5db: 85 3c     
__c5dd:     RTS                ; $c5dd: 60        

;-------------------------------------------------------------------------------
__c5de:     JSR __f31b         ; $c5de: 20 1b f3  
            JSR __efaa         ; $c5e1: 20 aa ef  
            JSR __ef4d         ; $c5e4: 20 4d ef  
            JSR __ef6c         ; $c5e7: 20 6c ef  
            LDA #$21           ; $c5ea: a9 21     
            STA $2006          ; $c5ec: 8d 06 20  
            LDX #$e0           ; $c5ef: a2 e0     
            STX $2006          ; $c5f1: 8e 06 20  
            LDX #$00           ; $c5f4: a2 00     
__c5f6:     LDA __c003,x       ; $c5f6: bd 03 c0  
            JSR __c026         ; $c5f9: 20 26 c0  
            INX                ; $c5fc: e8        
            CPX #$20           ; $c5fd: e0 20     
            BNE __c5f6         ; $c5ff: d0 f5     
            JSR __ef76         ; $c601: 20 76 ef  
            LDA #$14           ; $c604: a9 14     
            JSR __c60c         ; $c606: 20 0c c6  
            JMP __c2cb         ; $c609: 4c cb c2  

;-------------------------------------------------------------------------------
__c60c:     LDY #$00           ; $c60c: a0 00     
__c60e:     JSR __c617         ; $c60e: 20 17 c6  
            SEC                ; $c611: 38        
            SBC #$01           ; $c612: e9 01     
            BNE __c60e         ; $c614: d0 f8     
            RTS                ; $c616: 60        

;-------------------------------------------------------------------------------
__c617:     LDX #$00           ; $c617: a2 00     
__c619:     DEX                ; $c619: ca        
            BNE __c619         ; $c61a: d0 fd     
            DEY                ; $c61c: 88        
            BNE __c619         ; $c61d: d0 fa     
            RTS                ; $c61f: 60        

;-------------------------------------------------------------------------------
__c620:     LDA $a7            ; $c620: a5 a7     
            BEQ __c641         ; $c622: f0 1d     
            TYA                ; $c624: 98        
            PHA                ; $c625: 48        
            LDA $a2            ; $c626: a5 a2     
            BNE __c63a         ; $c628: d0 10     
            LDY $a0            ; $c62a: a4 a0     
            LDA __c070,y       ; $c62c: b9 70 c0  
            STA $a1            ; $c62f: 85 a1     
            LDA __c071,y       ; $c631: b9 71 c0  
            STA $a2            ; $c634: 85 a2     
            INY                ; $c636: c8        
            INY                ; $c637: c8        
            STY $a0            ; $c638: 84 a0     
__c63a:     DEC $a2            ; $c63a: c6 a2     
            PLA                ; $c63c: 68        
            TAY                ; $c63d: a8        
            LDA $a1            ; $c63e: a5 a1     
            RTS                ; $c640: 60        

;-------------------------------------------------------------------------------
__c641:     LDA $a8            ; $c641: a5 a8     
            CMP #$02           ; $c643: c9 02     
            BEQ __c689         ; $c645: f0 42     
            LDA $e0            ; $c647: a5 e0     
            BNE __c652         ; $c649: d0 07     
            LDA $1a            ; $c64b: a5 1a     
            BNE __c65b         ; $c64d: d0 0c     
            JMP __c656         ; $c64f: 4c 56 c6  

;-------------------------------------------------------------------------------
__c652:     LDA $e1            ; $c652: a5 e1     
            BEQ __c65b         ; $c654: f0 05     
__c656:     LDA $1b            ; $c656: a5 1b     
            JMP __c65d         ; $c658: 4c 5d c6  

;-------------------------------------------------------------------------------
__c65b:     LDA $1a            ; $c65b: a5 1a     
__c65d:     STA $ea            ; $c65d: 85 ea     
            AND #$40           ; $c65f: 29 40     
            ASL                ; $c661: 0a        
            ORA $ea            ; $c662: 05 ea     
            PHA                ; $c664: 48        
            TXA                ; $c665: 8a        
            PHA                ; $c666: 48        
            TYA                ; $c667: 98        
            PHA                ; $c668: 48        
            LDA $0720          ; $c669: ad 20 07  
            AND #$0f           ; $c66c: 29 0f     
            BNE __c67b         ; $c66e: d0 0b     
            LDX $0723          ; $c670: ae 23 07  
            LDY $0720          ; $c673: ac 20 07  
            JSR __e056         ; $c676: 20 56 e0  
            BEQ __c681         ; $c679: f0 06     
__c67b:     PLA                ; $c67b: 68        
            TAY                ; $c67c: a8        
            PLA                ; $c67d: 68        
            TAX                ; $c67e: aa        
            PLA                ; $c67f: 68        
            RTS                ; $c680: 60        

;-------------------------------------------------------------------------------
__c681:     PLA                ; $c681: 68        
            TAY                ; $c682: a8        
            PLA                ; $c683: 68        
            TAX                ; $c684: aa        
            PLA                ; $c685: 68        
            AND #$f7           ; $c686: 29 f7     
            RTS                ; $c688: 60        

;-------------------------------------------------------------------------------
__c689:     LDA #$00           ; $c689: a9 00     
            RTS                ; $c68b: 60        

;-------------------------------------------------------------------------------
__c68c:     LDA $1a            ; $c68c: a5 1a     
            ORA $1b            ; $c68e: 05 1b     
            BEQ __c699         ; $c690: f0 07     
            LDA $23            ; $c692: a5 23     
            CLC                ; $c694: 18        
            ADC #$03           ; $c695: 69 03     
            STA $23            ; $c697: 85 23     
__c699:     INC $23            ; $c699: e6 23     
            RTS                ; $c69b: 60        

;-------------------------------------------------------------------------------
__c69c:     LDA #$01           ; $c69c: a9 01     
            JMP __c6ba         ; $c69e: 4c ba c6  

;-------------------------------------------------------------------------------
            LDA #$02           ; $c6a1: a9 02     
            JMP __c6ba         ; $c6a3: 4c ba c6  

;-------------------------------------------------------------------------------
__c6a6:     LDA #$05           ; $c6a6: a9 05     
            JMP __c6ba         ; $c6a8: 4c ba c6  

;-------------------------------------------------------------------------------
__c6ab:     LDA #$08           ; $c6ab: a9 08     
            JMP __c6ba         ; $c6ad: 4c ba c6  

;-------------------------------------------------------------------------------
            LDA #$10           ; $c6b0: a9 10     
            JMP __c6ba         ; $c6b2: 4c ba c6  

;-------------------------------------------------------------------------------
__c6b5:     LDA $21            ; $c6b5: a5 21     
            JMP __c6ba         ; $c6b7: 4c ba c6  

;-------------------------------------------------------------------------------
__c6ba:     STA $a6            ; $c6ba: 85 a6     
            LDA $a7            ; $c6bc: a5 a7     
            BNE __c6e4         ; $c6be: d0 24     
            LDA $e1            ; $c6c0: a5 e1     
            BEQ __c6d4         ; $c6c2: f0 10     
            LDA $bc            ; $c6c4: a5 bc     
            CLC                ; $c6c6: 18        
            ADC $a6            ; $c6c7: 65 a6     
            STA $bc            ; $c6c9: 85 bc     
            LDA $bd            ; $c6cb: a5 bd     
            ADC #$00           ; $c6cd: 69 00     
            STA $bd            ; $c6cf: 85 bd     
            JMP __c6f9         ; $c6d1: 4c f9 c6  

;-------------------------------------------------------------------------------
__c6d4:     LDA $b8            ; $c6d4: a5 b8     
            CLC                ; $c6d6: 18        
            ADC $a6            ; $c6d7: 65 a6     
            STA $b8            ; $c6d9: 85 b8     
            LDA $b9            ; $c6db: a5 b9     
            ADC #$00           ; $c6dd: 69 00     
            STA $b9            ; $c6df: 85 b9     
            JMP __c6e5         ; $c6e1: 4c e5 c6  

;-------------------------------------------------------------------------------
__c6e4:     RTS                ; $c6e4: 60        

;-------------------------------------------------------------------------------
__c6e5:     LDA $b8            ; $c6e5: a5 b8     
            SEC                ; $c6e7: 38        
__c6e8:     SBC $ba            ; $c6e8: e5 ba     
            LDA $b9            ; $c6ea: a5 b9     
            SBC $bb            ; $c6ec: e5 bb     
            BCC __c6f8         ; $c6ee: 90 08     
            LDA $b8            ; $c6f0: a5 b8     
            STA $ba            ; $c6f2: 85 ba     
            LDA $b9            ; $c6f4: a5 b9     
            STA $bb            ; $c6f6: 85 bb     
__c6f8:     RTS                ; $c6f8: 60        

;-------------------------------------------------------------------------------
__c6f9:     LDA $bc            ; $c6f9: a5 bc     
            SEC                ; $c6fb: 38        
            SBC $ba            ; $c6fc: e5 ba     
            LDA $bd            ; $c6fe: a5 bd     
            SBC $bb            ; $c700: e5 bb     
            BCC __c70c         ; $c702: 90 08     
            LDA $bc            ; $c704: a5 bc     
            STA $ba            ; $c706: 85 ba     
            LDA $bd            ; $c708: a5 bd     
            STA $bb            ; $c70a: 85 bb     
__c70c:     RTS                ; $c70c: 60        

;-------------------------------------------------------------------------------
__c70d:     JSR __c73e         ; $c70d: 20 3e c7  
            LDA #$b1           ; $c710: a9 b1     
            STA $00            ; $c712: 85 00     
            LDA #$00           ; $c714: a9 00     
            STA $01            ; $c716: 85 01     
            JMP __c734         ; $c718: 4c 34 c7  

;-------------------------------------------------------------------------------
__c71b:     JSR __c73e         ; $c71b: 20 3e c7  
            LDA #$b3           ; $c71e: a9 b3     
            STA $00            ; $c720: 85 00     
            LDA #$00           ; $c722: a9 00     
            STA $01            ; $c724: 85 01     
            JMP __c734         ; $c726: 4c 34 c7  

;-------------------------------------------------------------------------------
__c729:     JSR __c73e         ; $c729: 20 3e c7  
            LDA #$b4           ; $c72c: a9 b4     
            STA $00            ; $c72e: 85 00     
            LDA #$00           ; $c730: a9 00     
            STA $01            ; $c732: 85 01     
__c734:     LDA $e6            ; $c734: a5 e6     
            BEQ __c73b         ; $c736: f0 03     
            JMP __ec5b         ; $c738: 4c 5b ec  

;-------------------------------------------------------------------------------
__c73b:     JMP __ebd7         ; $c73b: 4c d7 eb  

;-------------------------------------------------------------------------------
__c73e:     TXA                ; $c73e: 8a        
            PHA                ; $c73f: 48        
            TYA                ; $c740: 98        
            PHA                ; $c741: 48        
            LDA $b6            ; $c742: a5 b6     
            STA $00            ; $c744: 85 00     
            LDA $b7            ; $c746: a5 b7     
            STA $01            ; $c748: 85 01     
            LDA #$be           ; $c74a: a9 be     
            STA $02            ; $c74c: 85 02     
            LDA #$c7           ; $c74e: a9 c7     
            STA $03            ; $c750: 85 03     
            LDA #$b0           ; $c752: a9 b0     
            STA $06            ; $c754: 85 06     
            LDA #$00           ; $c756: a9 00     
            STA $07            ; $c758: 85 07     
            LDX #$05           ; $c75a: a2 05     
__c75c:     LDA #$00           ; $c75c: a9 00     
            STA $08            ; $c75e: 85 08     
            LDY #$00           ; $c760: a0 00     
            LDA ($02),y        ; $c762: b1 02     
            STA $04            ; $c764: 85 04     
            INY                ; $c766: c8        
            LDA ($02),y        ; $c767: b1 02     
            STA $05            ; $c769: 85 05     
__c76b:     LDA $00            ; $c76b: a5 00     
            SEC                ; $c76d: 38        
            SBC $04            ; $c76e: e5 04     
            STA $00            ; $c770: 85 00     
            LDA $01            ; $c772: a5 01     
            SBC $05            ; $c774: e5 05     
            STA $01            ; $c776: 85 01     
            BCC __c77f         ; $c778: 90 05     
            INC $08            ; $c77a: e6 08     
            JMP __c76b         ; $c77c: 4c 6b c7  

;-------------------------------------------------------------------------------
__c77f:     LDA $00            ; $c77f: a5 00     
            CLC                ; $c781: 18        
            ADC $04            ; $c782: 65 04     
            STA $00            ; $c784: 85 00     
            LDA $01            ; $c786: a5 01     
            ADC $05            ; $c788: 65 05     
            STA $01            ; $c78a: 85 01     
            LDY #$00           ; $c78c: a0 00     
            LDA $08            ; $c78e: a5 08     
            ORA #$30           ; $c790: 09 30     
            STA ($06),y        ; $c792: 91 06     
            LDA $02            ; $c794: a5 02     
            CLC                ; $c796: 18        
            ADC #$02           ; $c797: 69 02     
            STA $02            ; $c799: 85 02     
            LDA $03            ; $c79b: a5 03     
            ADC #$00           ; $c79d: 69 00     
            STA $03            ; $c79f: 85 03     
            INC $06            ; $c7a1: e6 06     
            BNE __c7a7         ; $c7a3: d0 02     
            INC $07            ; $c7a5: e6 07     
__c7a7:     DEX                ; $c7a7: ca        
            BNE __c75c         ; $c7a8: d0 b2     
            LDA #$00           ; $c7aa: a9 00     
            STA $b5            ; $c7ac: 85 b5     
            PLA                ; $c7ae: 68        
            TAY                ; $c7af: a8        
            PLA                ; $c7b0: 68        
            TAX                ; $c7b1: aa        
            JSR __e953         ; $c7b2: 20 53 e9  
            LDA $00            ; $c7b5: a5 00     
            STA $02            ; $c7b7: 85 02     
            LDA $01            ; $c7b9: a5 01     
            STA $03            ; $c7bb: 85 03     
            RTS                ; $c7bd: 60        

;-------------------------------------------------------------------------------
            BPL __c7e7         ; $c7be: 10 27     
            INX                ; $c7c0: e8        
__c7c1:     .hex 03 64         ; $c7c1: 03 64     Invalid Opcode - SLO ($64,x)
            BRK                ; $c7c3: 00        
            ASL                ; $c7c4: 0a        
            BRK                ; $c7c5: 00        
            ORA ($00,x)        ; $c7c6: 01 00     
__c7c8:     LDA $cf            ; $c7c8: a5 cf     
            BNE __c822         ; $c7ca: d0 56     
            JSR __ef4d         ; $c7cc: 20 4d ef  
            JSR __efaa         ; $c7cf: 20 aa ef  
            JSR __ef6c         ; $c7d2: 20 6c ef  
            LDA #$23           ; $c7d5: a9 23     
            STA $00            ; $c7d7: 85 00     
            LDA #$c8           ; $c7d9: a9 c8     
            STA $01            ; $c7db: 85 01     
            JSR __ec28         ; $c7dd: 20 28 ec  
            LDX #$84           ; $c7e0: a2 84     
            LDY #$70           ; $c7e2: a0 70     
            JSR __dffc         ; $c7e4: 20 fc df  
__c7e7:     LDA #$86           ; $c7e7: a9 86     
            JSR __dfe8         ; $c7e9: 20 e8 df  
            LDA #$01           ; $c7ec: a9 01     
            STA $0722          ; $c7ee: 8d 22 07  
            STA $0726          ; $c7f1: 8d 26 07  
            STA $072a          ; $c7f4: 8d 2a 07  
            STA $072e          ; $c7f7: 8d 2e 07  
            LDX #$7c           ; $c7fa: a2 7c     
            LDY #$74           ; $c7fc: a0 74     
            JSR __cd83         ; $c7fe: 20 83 cd  
            LDX #$6c           ; $c801: a2 6c     
            LDY #$70           ; $c803: a0 70     
            JSR __cd4d         ; $c805: 20 4d cd  
            LDA #$01           ; $c808: a9 01     
            JSR __c60c         ; $c80a: 20 0c c6  
            JSR __ef76         ; $c80d: 20 76 ef  
            JSR __f2d4         ; $c810: 20 d4 f2  
            JSR __f046         ; $c813: 20 46 f0  
__c816:     LDA $34            ; $c816: a5 34     
            BNE __c816         ; $c818: d0 fc     
            LDA #$04           ; $c81a: a9 04     
            JSR __c60c         ; $c81c: 20 0c c6  
            JSR __efaa         ; $c81f: 20 aa ef  
__c822:     RTS                ; $c822: 60        

;-------------------------------------------------------------------------------
            STY $5021          ; $c823: 8c 21 50  
            EOR $52            ; $c826: 45 52     
            LSR $45            ; $c828: 46 45     
            .hex 43 54         ; $c82a: 43 54     Invalid Opcode - SRE ($54,x)
            AND ($00,x)        ; $c82c: 21 00     
            PLP                ; $c82e: 28        
            .hex 22            ; $c82f: 22        Invalid Opcode - KIL 
            .hex 43 4f         ; $c830: 43 4f     Invalid Opcode - SRE ($4f,x)
            LSR $5247          ; $c832: 4e 47 52  
            EOR ($54,x)        ; $c835: 41 54     
            EOR $4c,x          ; $c837: 55 4c     
            EOR ($54,x)        ; $c839: 41 54     
            EOR #$4f           ; $c83b: 49 4f     
            LSR $2153          ; $c83d: 4e 53 21  
            BRK                ; $c840: 00        
            .hex ff ff         ; $c841: ff ff     Suspected data
__c843:     LDA #$00           ; $c843: a9 00     
            STA $8f            ; $c845: 85 8f     
            JSR __c269         ; $c847: 20 69 c2  
            JSR __cd21         ; $c84a: 20 21 cd  
            JSR __ef6c         ; $c84d: 20 6c ef  
            LDA #$3f           ; $c850: a9 3f     
            STA $2006          ; $c852: 8d 06 20  
            LDX #$00           ; $c855: a2 00     
            STX $2006          ; $c857: 8e 06 20  
            LDA #$04           ; $c85a: a9 04     
            STA $44            ; $c85c: 85 44     
__c85e:     LDA $20            ; $c85e: a5 20     
            AND #$03           ; $c860: 29 03     
            ASL                ; $c862: 0a        
            ASL                ; $c863: 0a        
            TAX                ; $c864: aa        
            LDY #$04           ; $c865: a0 04     
__c867:     LDA __c951,x       ; $c867: bd 51 c9  
            JSR __c026         ; $c86a: 20 26 c0  
            INX                ; $c86d: e8        
            DEY                ; $c86e: 88        
            BNE __c867         ; $c86f: d0 f6     
            DEC $44            ; $c871: c6 44     
            BNE __c85e         ; $c873: d0 e9     
            LDA #$20           ; $c875: a9 20     
            STA $2006          ; $c877: 8d 06 20  
            LDX #$c0           ; $c87a: a2 c0     
            STX $2006          ; $c87c: 8e 06 20  
            LDY #$18           ; $c87f: a0 18     
__c881:     LDX #$20           ; $c881: a2 20     
__c883:     LDA #$20           ; $c883: a9 20     
            JSR __c026         ; $c885: 20 26 c0  
            DEX                ; $c888: ca        
            BNE __c883         ; $c889: d0 f8     
            DEY                ; $c88b: 88        
            BNE __c881         ; $c88c: d0 f3     
            LDA #$00           ; $c88e: a9 00     
            STA $44            ; $c890: 85 44     
            LDA $20            ; $c892: a5 20     
            AND #$03           ; $c894: 29 03     
            ASL                ; $c896: 0a        
            ASL                ; $c897: 0a        
            ASL                ; $c898: 0a        
            STA $45            ; $c899: 85 45     
__c89b:     LDY $44            ; $c89b: a4 44     
            LDA __c961,y       ; $c89d: b9 61 c9  
            STA $40            ; $c8a0: 85 40     
            BEQ __c90e         ; $c8a2: f0 6a     
            LDA __c962,y       ; $c8a4: b9 62 c9  
            STA $42            ; $c8a7: 85 42     
            LDA __c963,y       ; $c8a9: b9 63 c9  
            STA $46            ; $c8ac: 85 46     
__c8ae:     LDX $40            ; $c8ae: a6 40     
            LDY $42            ; $c8b0: a4 42     
            JSR __e953         ; $c8b2: 20 53 e9  
            LDA $00            ; $c8b5: a5 00     
            STA $02            ; $c8b7: 85 02     
            LDA $01            ; $c8b9: a5 01     
            STA $03            ; $c8bb: 85 03     
            LDA #$31           ; $c8bd: a9 31     
            STA $00            ; $c8bf: 85 00     
            LDA #$c9           ; $c8c1: a9 c9     
            STA $01            ; $c8c3: 85 01     
            LDA $00            ; $c8c5: a5 00     
            CLC                ; $c8c7: 18        
            ADC $45            ; $c8c8: 65 45     
            STA $00            ; $c8ca: 85 00     
            LDA $01            ; $c8cc: a5 01     
            ADC #$00           ; $c8ce: 69 00     
            STA $01            ; $c8d0: 85 01     
            JSR __c989         ; $c8d2: 20 89 c9  
            LDX $40            ; $c8d5: a6 40     
            LDY $42            ; $c8d7: a4 42     
            INY                ; $c8d9: c8        
            JSR __e953         ; $c8da: 20 53 e9  
            LDA $00            ; $c8dd: a5 00     
            STA $02            ; $c8df: 85 02     
            LDA $01            ; $c8e1: a5 01     
            STA $03            ; $c8e3: 85 03     
            LDA #$35           ; $c8e5: a9 35     
            STA $00            ; $c8e7: 85 00     
            LDA #$c9           ; $c8e9: a9 c9     
            STA $01            ; $c8eb: 85 01     
            LDA $00            ; $c8ed: a5 00     
            CLC                ; $c8ef: 18        
            ADC $45            ; $c8f0: 65 45     
            STA $00            ; $c8f2: 85 00     
            LDA $01            ; $c8f4: a5 01     
            ADC #$00           ; $c8f6: 69 00     
            STA $01            ; $c8f8: 85 01     
            JSR __c989         ; $c8fa: 20 89 c9  
            INC $40            ; $c8fd: e6 40     
            INC $40            ; $c8ff: e6 40     
            DEC $46            ; $c901: c6 46     
            BNE __c8ae         ; $c903: d0 a9     
            INC $44            ; $c905: e6 44     
            INC $44            ; $c907: e6 44     
            INC $44            ; $c909: e6 44     
            JMP __c89b         ; $c90b: 4c 9b c8  

;-------------------------------------------------------------------------------
__c90e:     LDA #$01           ; $c90e: a9 01     
            JSR __c60c         ; $c910: 20 0c c6  
            JSR __ef76         ; $c913: 20 76 ef  
            JSR __f064         ; $c916: 20 64 f0  
            LDA #$14           ; $c919: a9 14     
            JSR __c60c         ; $c91b: 20 0c c6  
            LDX $22            ; $c91e: a6 22     
            CPX #$09           ; $c920: e0 09     
            BEQ __c925         ; $c922: f0 01     
            INX                ; $c924: e8        
__c925:     STX $22            ; $c925: 86 22     
            LDA $e1            ; $c927: a5 e1     
            BNE __c92e         ; $c929: d0 03     
            STX $be            ; $c92b: 86 be     
            RTS                ; $c92d: 60        

;-------------------------------------------------------------------------------
__c92e:     STX $bf            ; $c92e: 86 bf     
            RTS                ; $c930: 60        

;-------------------------------------------------------------------------------
            .hex 02            ; $c931: 02        Invalid Opcode - KIL 
            .hex 03 00         ; $c932: 03 00     Invalid Opcode - SLO ($00,x)
            BRK                ; $c934: 00        
            .hex 12            ; $c935: 12        Invalid Opcode - KIL 
            .hex 13 00         ; $c936: 13 00     Invalid Opcode - SLO ($00),y
            BRK                ; $c938: 00        
            .hex 8e 8f 00      ; $c939: 8e 8f 00  Bad Addr Mode - STX $008f
            BRK                ; $c93c: 00        
            .hex 9e 9f 00      ; $c93d: 9e 9f 00  Invalid Opcode - SHX $009f,y
            BRK                ; $c940: 00        
            .hex fa            ; $c941: fa        Invalid Opcode - NOP 
            .hex fb 00 00      ; $c942: fb 00 00  Invalid Opcode - ISC $0000,y
            .hex fc fd 00      ; $c945: fc fd 00  Bad Addr Mode - NOP $00fd,x
            BRK                ; $c948: 00        
            .hex 8e 8f 00      ; $c949: 8e 8f 00  Bad Addr Mode - STX $008f
__c94c:     BRK                ; $c94c: 00        
            .hex 9e 9f 00      ; $c94d: 9e 9f 00  Invalid Opcode - SHX $009f,y
            BRK                ; $c950: 00        
__c951:     .hex 0f 30 1a      ; $c951: 0f 30 1a  Invalid Opcode - SLO $1a30
            .hex 27 0f         ; $c954: 27 0f     Invalid Opcode - RLA $0f
            BMI __c981         ; $c956: 30 29     
            BIT $0f            ; $c958: 24 0f     
            BMI __c986         ; $c95a: 30 2a     
            ROL $0f            ; $c95c: 26 0f     
            BMI __c999         ; $c95e: 30 39     
            .hex 21            ; $c960: 21        Suspected data
__c961:     .hex 06            ; $c961: 06        Suspected data
__c962:     PHP                ; $c962: 08        
__c963:     .hex 02            ; $c963: 02        Invalid Opcode - KIL 
            ASL $08,x          ; $c964: 16 08     
            .hex 02            ; $c966: 02        Invalid Opcode - KIL 
            .hex 04 0a         ; $c967: 04 0a     Invalid Opcode - NOP $0a
            .hex 04 14         ; $c969: 04 14     Invalid Opcode - NOP $14
            ASL                ; $c96b: 0a        
            .hex 04 04         ; $c96c: 04 04     Invalid Opcode - NOP $04
            .hex 0c 05 12      ; $c96e: 0c 05 12  Invalid Opcode - NOP $1205
            .hex 0c 05 04      ; $c971: 0c 05 04  Invalid Opcode - NOP $0405
            ASL $040c          ; $c974: 0e 0c 04  
            BPL __c985         ; $c977: 10 0c     
            ASL $12            ; $c979: 06 12     
            ASL                ; $c97b: 0a        
            PHP                ; $c97c: 08        
            .hex 14 08         ; $c97d: 14 08     Invalid Opcode - NOP $08,x
            ASL                ; $c97f: 0a        
            .hex 16            ; $c980: 16        Suspected data
__c981:     ASL $0c            ; $c981: 06 0c     
            CLC                ; $c983: 18        
            .hex 04            ; $c984: 04        Suspected data
__c985:     .hex 0e            ; $c985: 0e        Suspected data
__c986:     .hex 1a            ; $c986: 1a        Invalid Opcode - NOP 
            .hex 02            ; $c987: 02        Invalid Opcode - KIL 
            BRK                ; $c988: 00        
__c989:     LDA $03            ; $c989: a5 03     
            .hex 8d            ; $c98b: 8d        Suspected data
__c98c:     ASL $20            ; $c98c: 06 20     
            LDA $02            ; $c98e: a5 02     
            STA $2006          ; $c990: 8d 06 20  
            LDY #$00           ; $c993: a0 00     
__c995:     LDA ($00),y        ; $c995: b1 00     
            BEQ __c9a0         ; $c997: f0 07     
__c999:     JSR __c026         ; $c999: 20 26 c0  
            INY                ; $c99c: c8        
            JMP __c995         ; $c99d: 4c 95 c9  

;-------------------------------------------------------------------------------
__c9a0:     RTS                ; $c9a0: 60        

;-------------------------------------------------------------------------------
__c9a1:     LDX #$ac           ; $c9a1: a2 ac     
            LDY #$04           ; $c9a3: a0 04     
            JSR __cd34         ; $c9a5: 20 34 cd  
            LDA #$00           ; $c9a8: a9 00     
            JSR __cd3d         ; $c9aa: 20 3d cd  
            RTS                ; $c9ad: 60        

;-------------------------------------------------------------------------------
__c9ae:     LDA $57            ; $c9ae: a5 57     
            BNE __c9c8         ; $c9b0: d0 16     
            LDA $e5            ; $c9b2: a5 e5     
            BNE __c9a1         ; $c9b4: d0 eb     
            LDA $9b            ; $c9b6: a5 9b     
            BNE __c9c8         ; $c9b8: d0 0e     
            LDA $e1            ; $c9ba: a5 e1     
            BEQ __c9c4         ; $c9bc: f0 06     
            LDA $e9            ; $c9be: a5 e9     
            BEQ __c9c8         ; $c9c0: f0 06     
            BNE __c9c9         ; $c9c2: d0 05     
__c9c4:     LDA $e8            ; $c9c4: a5 e8     
            BNE __c9c9         ; $c9c6: d0 01     
__c9c8:     RTS                ; $c9c8: 60        

;-------------------------------------------------------------------------------
__c9c9:     LDA $ac            ; $c9c9: a5 ac     
            BNE __ca13         ; $c9cb: d0 46     
            INC $af            ; $c9cd: e6 af     
            LDA $af            ; $c9cf: a5 af     
            CMP #$64           ; $c9d1: c9 64     
            BNE __ca12         ; $c9d3: d0 3d     
            LDX #$00           ; $c9d5: a2 00     
            LDA $0723          ; $c9d7: ad 23 07  
            CMP #$78           ; $c9da: c9 78     
            BCC __c9e0         ; $c9dc: 90 02     
            LDX #$05           ; $c9de: a2 05     
__c9e0:     LDA __cab6,x       ; $c9e0: bd b6 ca  
            STA $ad            ; $c9e3: 85 ad     
            LDA __cab9,x       ; $c9e5: bd b9 ca  
            STA $ae            ; $c9e8: 85 ae     
            LDA #$01           ; $c9ea: a9 01     
            STA $ac            ; $c9ec: 85 ac     
            LDA #$02           ; $c9ee: a9 02     
            STA $af            ; $c9f0: 85 af     
            LDY #$00           ; $c9f2: a0 00     
            LDA __cab7,x       ; $c9f4: bd b7 ca  
            JSR __d1c4         ; $c9f7: 20 c4 d1  
            LDA __cab8,x       ; $c9fa: bd b8 ca  
            JSR __d1a1         ; $c9fd: 20 a1 d1  
            LDA $0720          ; $ca00: ad 20 07  
            CMP #$30           ; $ca03: c9 30     
            BCS __ca09         ; $ca05: b0 02     
            LDA #$30           ; $ca07: a9 30     
__ca09:     JSR __d191         ; $ca09: 20 91 d1  
            LDA __caba,x       ; $ca0c: bd ba ca  
            JSR __d1b7         ; $ca0f: 20 b7 d1  
__ca12:     RTS                ; $ca12: 60        

;-------------------------------------------------------------------------------
__ca13:     CMP #$02           ; $ca13: c9 02     
            BEQ __ca69         ; $ca15: f0 52     
            JSR __ca79         ; $ca17: 20 79 ca  
            LDA $ac            ; $ca1a: a5 ac     
            CMP #$02           ; $ca1c: c9 02     
            BEQ __ca69         ; $ca1e: f0 49     
            LDY #$00           ; $ca20: a0 00     
            LDX $0703          ; $ca22: ae 03 07  
            LDA $ad            ; $ca25: a5 ad     
            BEQ __ca30         ; $ca27: f0 07     
            INX                ; $ca29: e8        
            CPX #$f0           ; $ca2a: e0 f0     
            BNE __ca35         ; $ca2c: d0 07     
            BEQ __ca65         ; $ca2e: f0 35     
__ca30:     DEX                ; $ca30: ca        
            CPX #$00           ; $ca31: e0 00     
            BEQ __ca65         ; $ca33: f0 30     
__ca35:     TXA                ; $ca35: 8a        
            JSR __d1c4         ; $ca36: 20 c4 d1  
            LDX $ae            ; $ca39: a6 ae     
            CPX #$2f           ; $ca3b: e0 2f     
            BNE __ca41         ; $ca3d: d0 02     
            LDX #$ff           ; $ca3f: a2 ff     
__ca41:     INX                ; $ca41: e8        
            STX $ae            ; $ca42: 86 ae     
            LDA $0700          ; $ca44: ad 00 07  
            CLC                ; $ca47: 18        
            ADC __cac0,x       ; $ca48: 7d c0 ca  
            JSR __d191         ; $ca4b: 20 91 d1  
            LDX $af            ; $ca4e: a6 af     
            CPX #$06           ; $ca50: e0 06     
            BNE __ca56         ; $ca52: d0 02     
            LDX #$00           ; $ca54: a2 00     
__ca56:     INX                ; $ca56: e8        
            INX                ; $ca57: e8        
            STX $af            ; $ca58: 86 af     
            LDA $0701          ; $ca5a: ad 01 07  
            AND #$f8           ; $ca5d: 29 f8     
            ORA $af            ; $ca5f: 05 af     
            JSR __d1a1         ; $ca61: 20 a1 d1  
            RTS                ; $ca64: 60        

;-------------------------------------------------------------------------------
__ca65:     JSR __c9a1         ; $ca65: 20 a1 c9  
            RTS                ; $ca68: 60        

;-------------------------------------------------------------------------------
__ca69:     DEC $af            ; $ca69: c6 af     
            BNE __ca71         ; $ca6b: d0 04     
            JSR __c9a1         ; $ca6d: 20 a1 c9  
            RTS                ; $ca70: 60        

;-------------------------------------------------------------------------------
__ca71:     LDY #$00           ; $ca71: a0 00     
            LDA #$ec           ; $ca73: a9 ec     
            JSR __d1a1         ; $ca75: 20 a1 d1  
            RTS                ; $ca78: 60        

;-------------------------------------------------------------------------------
__ca79:     LDA $ac            ; $ca79: a5 ac     
            BEQ __cab5         ; $ca7b: f0 38     
            LDA $57            ; $ca7d: a5 57     
            BNE __cab5         ; $ca7f: d0 34     
            LDA $0703          ; $ca81: ad 03 07  
            SEC                ; $ca84: 38        
            SBC $0723          ; $ca85: ed 23 07  
            JSR __d2a1         ; $ca88: 20 a1 d2  
            TAX                ; $ca8b: aa        
            LDA $0700          ; $ca8c: ad 00 07  
            SEC                ; $ca8f: 38        
            SBC $0720          ; $ca90: ed 20 07  
            JSR __d2a1         ; $ca93: 20 a1 d2  
            TAY                ; $ca96: a8        
            CPX #$0a           ; $ca97: e0 0a     
            BCS __cab5         ; $ca99: b0 1a     
            CPY #$0a           ; $ca9b: c0 0a     
            BCS __cab5         ; $ca9d: b0 16     
            LDA $0702          ; $ca9f: ad 02 07  
            BEQ __caa7         ; $caa2: f0 03     
            JMP __d669         ; $caa4: 4c 69 d6  

;-------------------------------------------------------------------------------
__caa7:     LDA #$14           ; $caa7: a9 14     
            STA $af            ; $caa9: 85 af     
            LDA #$02           ; $caab: a9 02     
            STA $ac            ; $caad: 85 ac     
            JSR __f0b1         ; $caaf: 20 b1 f0  
            JSR __c6a6         ; $cab2: 20 a6 c6  
__cab5:     RTS                ; $cab5: 60        

;-------------------------------------------------------------------------------
__cab6:     BRK                ; $cab6: 00        
__cab7:     .hex f0            ; $cab7: f0        Suspected data
__cab8:     .hex 22            ; $cab8: 22        Invalid Opcode - KIL 
__cab9:     BRK                ; $cab9: 00        
__caba:     BRK                ; $caba: 00        
            ORA ($00,x)        ; $cabb: 01 00     
            ROL                ; $cabd: 2a        
            CLC                ; $cabe: 18        
            .hex 03            ; $cabf: 03        Suspected data
__cac0:     .hex fc fc fe      ; $cac0: fc fc fe  Invalid Opcode - NOP __fefc,x
            INC $fffe,x        ; $cac3: fe fe ff  
            .hex ff ff ff      ; $cac6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $cac9: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $cacc: 00        
            BRK                ; $cacd: 00        
            ORA ($01,x)        ; $cace: 01 01     
            ORA ($01,x)        ; $cad0: 01 01     
            ORA ($02,x)        ; $cad2: 01 02     
            .hex 02            ; $cad4: 02        Invalid Opcode - KIL 
            .hex 02            ; $cad5: 02        Invalid Opcode - KIL 
            .hex 04 04         ; $cad6: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $cad8: 04 04     Invalid Opcode - NOP $04
            .hex 02            ; $cada: 02        Invalid Opcode - KIL 
            .hex 02            ; $cadb: 02        Invalid Opcode - KIL 
            .hex 02            ; $cadc: 02        Invalid Opcode - KIL 
            ORA ($01,x)        ; $cadd: 01 01     
            ORA ($01,x)        ; $cadf: 01 01     
            ORA ($00,x)        ; $cae1: 01 00     
            BRK                ; $cae3: 00        
            BRK                ; $cae4: 00        
            BRK                ; $cae5: 00        
            .hex ff ff ff      ; $cae6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff fe      ; $cae9: ff ff fe  Invalid Opcode - ISC __feff,x
            INC __fcfe,x       ; $caec: fe fe fc  
            .hex fc            ; $caef: fc        Suspected data
__caf0:     LDA #$f8           ; $caf0: a9 f8     
            STA $071c          ; $caf2: 8d 1c 07  
            STA $071d          ; $caf5: 8d 1d 07  
            STA $071e          ; $caf8: 8d 1e 07  
            STA $071f          ; $cafb: 8d 1f 07  
            LDA #$00           ; $cafe: a9 00     
            STA $9c            ; $cb00: 85 9c     
            STA $9d            ; $cb02: 85 9d     
            RTS                ; $cb04: 60        

;-------------------------------------------------------------------------------
__cb05:     LDA $53            ; $cb05: a5 53     
            BEQ __cb5d         ; $cb07: f0 54     
            LDA $0720          ; $cb09: ad 20 07  
            AND #$0f           ; $cb0c: 29 0f     
            BNE __cb5d         ; $cb0e: d0 4d     
            LDX $0723          ; $cb10: ae 23 07  
            LDY $0720          ; $cb13: ac 20 07  
            JSR __e01d         ; $cb16: 20 1d e0  
            CMP #$01           ; $cb19: c9 01     
            BEQ __cb21         ; $cb1b: f0 04     
            CMP #$02           ; $cb1d: c9 02     
            BNE __cb5d         ; $cb1f: d0 3c     
__cb21:     LDA $0721          ; $cb21: ad 21 07  
            CMP #$80           ; $cb24: c9 80     
            BCC __cb5d         ; $cb26: 90 35     
            AND #$08           ; $cb28: 29 08     
            BEQ __cb37         ; $cb2a: f0 0b     
            LDA $0723          ; $cb2c: ad 23 07  
            CLC                ; $cb2f: 18        
            ADC #$0e           ; $cb30: 69 0e     
            LDX #$7e           ; $cb32: a2 7e     
            JMP __cb3f         ; $cb34: 4c 3f cb  

;-------------------------------------------------------------------------------
__cb37:     LDA $0723          ; $cb37: ad 23 07  
            SEC                ; $cb3a: 38        
            SBC #$06           ; $cb3b: e9 06     
            LDX #$6e           ; $cb3d: a2 6e     
__cb3f:     STA $071f          ; $cb3f: 8d 1f 07  
            LDA $0720          ; $cb42: ad 20 07  
            AND #$f0           ; $cb45: 29 f0     
            CLC                ; $cb47: 18        
            ADC #$08           ; $cb48: 69 08     
            .hex 8d 1c         ; $cb4a: 8d 1c     Suspected data
__cb4c:     .hex 07 8e         ; $cb4c: 07 8e     Invalid Opcode - SLO $8e
            ORA $a907,x        ; $cb4e: 1d 07 a9  
            BRK                ; $cb51: 00        
            STA $071e          ; $cb52: 8d 1e 07  
            LDA #$01           ; $cb55: a9 01     
            STA $9c            ; $cb57: 85 9c     
            LDA #$05           ; $cb59: a9 05     
            STA $9d            ; $cb5b: 85 9d     
__cb5d:     RTS                ; $cb5d: 60        

;-------------------------------------------------------------------------------
__cb5e:     LDA $9c            ; $cb5e: a5 9c     
            BEQ __cb69         ; $cb60: f0 07     
            DEC $9d            ; $cb62: c6 9d     
            BNE __cb69         ; $cb64: d0 03     
            JSR __caf0         ; $cb66: 20 f0 ca  
__cb69:     RTS                ; $cb69: 60        

;-------------------------------------------------------------------------------
__cb6a:     LDA $9a            ; $cb6a: a5 9a     
            BEQ __cb6f         ; $cb6c: f0 01     
            RTS                ; $cb6e: 60        

;-------------------------------------------------------------------------------
__cb6f:     LDA $e5            ; $cb6f: a5 e5     
            BNE __cba0         ; $cb71: d0 2d     
            LDA $57            ; $cb73: a5 57     
            BNE __cba0         ; $cb75: d0 29     
            LDA $8f            ; $cb77: a5 8f     
            BEQ __cb84         ; $cb79: f0 09     
            LDX $e3            ; $cb7b: a6 e3     
            CPX #$0a           ; $cb7d: e0 0a     
            BNE __cb8c         ; $cb7f: d0 0b     
            JMP __cb8a         ; $cb81: 4c 8a cb  

;-------------------------------------------------------------------------------
__cb84:     LDX $e3            ; $cb84: a6 e3     
            CPX #$64           ; $cb86: e0 64     
            BNE __cb8c         ; $cb88: d0 02     
__cb8a:     LDX #$ff           ; $cb8a: a2 ff     
__cb8c:     INX                ; $cb8c: e8        
            STX $e3            ; $cb8d: 86 e3     
            CPX #$00           ; $cb8f: e0 00     
            BNE __cba0         ; $cb91: d0 0d     
            DEC $21            ; $cb93: c6 21     
            LDA $21            ; $cb95: a5 21     
            BEQ __cba1         ; $cb97: f0 08     
            CMP #$0a           ; $cb99: c9 0a     
            BCS __cba0         ; $cb9b: b0 03     
            JSR __f080         ; $cb9d: 20 80 f0  
__cba0:     RTS                ; $cba0: 60        

;-------------------------------------------------------------------------------
__cba1:     JSR __c270         ; $cba1: 20 70 c2  
            JMP __d669         ; $cba4: 4c 69 d6  

;-------------------------------------------------------------------------------
__cba7:     LDA #$70           ; $cba7: a9 70     
            JSR __cd3d         ; $cba9: 20 3d cd  
            LDA #$80           ; $cbac: a9 80     
            JSR __cd3d         ; $cbae: 20 3d cd  
            LDX #$a8           ; $cbb1: a2 a8     
            LDY #$04           ; $cbb3: a0 04     
            JSR __cd34         ; $cbb5: 20 34 cd  
            RTS                ; $cbb8: 60        

;-------------------------------------------------------------------------------
__cbb9:     LDA $9a            ; $cbb9: a5 9a     
            BEQ __cbbe         ; $cbbb: f0 01     
            RTS                ; $cbbd: 60        

;-------------------------------------------------------------------------------
__cbbe:     LDA $8f            ; $cbbe: a5 8f     
            BEQ __cbc3         ; $cbc0: f0 01     
__cbc2:     RTS                ; $cbc2: 60        

;-------------------------------------------------------------------------------
__cbc3:     LDA $e5            ; $cbc3: a5 e5     
            BNE __cbc2         ; $cbc5: d0 fb     
            LDA $57            ; $cbc7: a5 57     
            .hex d0            ; $cbc9: d0        Suspected data
__cbca:     .hex f7 a5         ; $cbca: f7 a5     Invalid Opcode - ISC $a5,x
            CPX $c5            ; $cbcc: e4 c5     
            BIT __e7d0         ; $cbce: 2c d0 e7  
            JSR __cc79         ; $cbd1: 20 79 cc  
            LDX #$30           ; $cbd4: a2 30     
            LDY #$30           ; $cbd6: a0 30     
            JSR __cd4d         ; $cbd8: 20 4d cd  
            INC $aa            ; $cbdb: e6 aa     
            LDA $aa            ; $cbdd: a5 aa     
            AND #$3f           ; $cbdf: 29 3f     
            CMP #$20           ; $cbe1: c9 20     
            BCC __cbef         ; $cbe3: 90 0a     
            LDX #$48           ; $cbe5: a2 48     
            LDY #$20           ; $cbe7: a0 20     
            JSR __cd68         ; $cbe9: 20 68 cd  
            JMP __cbf4         ; $cbec: 4c f4 cb  

;-------------------------------------------------------------------------------
__cbef:     LDA #$70           ; $cbef: a9 70     
            JSR __cd3d         ; $cbf1: 20 3d cd  
__cbf4:     LDA $0723          ; $cbf4: ad 23 07  
            SEC                ; $cbf7: 38        
            SBC $0783          ; $cbf8: ed 83 07  
            JSR __d2a1         ; $cbfb: 20 a1 d2  
            TAX                ; $cbfe: aa        
            .hex ad            ; $cbff: ad        Suspected data
__cc00:     JSR $3807          ; $cc00: 20 07 38  
            SBC $0780          ; $cc03: ed 80 07  
            JSR __d2a1         ; $cc06: 20 a1 d2  
            TAY                ; $cc09: a8        
            CPX #$0e           ; $cc0a: e0 0e     
            BCS __cc41         ; $cc0c: b0 33     
            CPY #$0e           ; $cc0e: c0 0e     
            BCS __cc41         ; $cc10: b0 2f     
            LDA #$70           ; $cc12: a9 70     
            JSR __cd3d         ; $cc14: 20 3d cd  
            LDX #$3c           ; $cc17: a2 3c     
            LDY #$30           ; $cc19: a0 30     
            JSR __dffc         ; $cc1b: 20 fc df  
            LDA #$86           ; $cc1e: a9 86     
            JSR __dfe8         ; $cc20: 20 e8 df  
            LDX #$34           ; $cc23: a2 34     
            LDY #$34           ; $cc25: a0 34     
            JSR __cd83         ; $cc27: 20 83 cd  
            LDX #$24           ; $cc2a: a2 24     
            LDY #$30           ; $cc2c: a0 30     
            .hex 20 4d         ; $cc2e: 20 4d     Suspected data
__cc30:     CMP __f820         ; $cc30: cd 20 f8  
            .hex cc            ; $cc33: cc        Suspected data
__cc34:     JSR __caf0         ; $cc34: 20 f0 ca  
            .hex 20            ; $cc37: 20        Suspected data
__cc38:     .hex 42            ; $cc38: 42        Invalid Opcode - KIL 
__cc39:     CPY $01a9          ; $cc39: cc a9 01  
            STA $e5            ; $cc3c: 85 e5     
            JSR __f144         ; $cc3e: 20 44 f1  
__cc41:     RTS                ; $cc41: 60        

;-------------------------------------------------------------------------------
            LDA $60            ; $cc42: a5 60     
            CMP #$02           ; $cc44: c9 02     
            BEQ __cc54         ; $cc46: f0 0c     
            LDA #$02           ; $cc48: a9 02     
            STA $67            ; $cc4a: 85 67     
            LDA #$0b           ; $cc4c: a9 0b     
            STA $61            ; $cc4e: 85 61     
            LDA #$14           ; $cc50: a9 14     
            STA $65            ; $cc52: 85 65     
__cc54:     LDA $68            ; $cc54: a5 68     
            CMP #$02           ; $cc56: c9 02     
            BEQ __cc66         ; $cc58: f0 0c     
            LDA #$02           ; $cc5a: a9 02     
            .hex 85            ; $cc5c: 85        Suspected data
__cc5d:     .hex 6f a9 0b      ; $cc5d: 6f a9 0b  Invalid Opcode - RRA $0ba9
__cc60:     STA $69            ; $cc60: 85 69     
            LDA #$14           ; $cc62: a9 14     
            STA $6d            ; $cc64: 85 6d     
__cc66:     LDA $70            ; $cc66: a5 70     
            CMP #$02           ; $cc68: c9 02     
            BEQ __cc78         ; $cc6a: f0 0c     
            LDA #$02           ; $cc6c: a9 02     
            STA $77            ; $cc6e: 85 77     
            .hex a9            ; $cc70: a9        Suspected data
__cc71:     .hex 0b 85         ; $cc71: 0b 85     Invalid Opcode - ANC #$85
            ADC ($a9),y        ; $cc73: 71 a9     
            .hex 14 85         ; $cc75: 14 85     Invalid Opcode - NOP $85,x
            .hex 75            ; $cc77: 75        Suspected data
__cc78:     RTS                ; $cc78: 60        

;-------------------------------------------------------------------------------
__cc79:     LDA $a8            ; $cc79: a5 a8     
            BEQ __cc7e         ; $cc7b: f0 01     
            RTS                ; $cc7d: 60        

;-------------------------------------------------------------------------------
__cc7e:     LDA #$01           ; $cc7e: a9 01     
            STA $a8            ; $cc80: 85 a8     
            JSR __cd21         ; $cc82: 20 21 cd  
            LDA #$c4           ; $cc85: a9 c4     
            STA $02            ; $cc87: 85 02     
            LDA #$20           ; $cc89: a9 20     
            STA $03            ; $cc8b: 85 03     
            LDA #$dc           ; $cc8d: a9 dc     
            .hex 85            ; $cc8f: 85        Suspected data
__cc90:     BRK                ; $cc90: 00        
            LDA #$cc           ; $cc91: a9 cc     
__cc93:     STA $01            ; $cc93: 85 01     
            JSR __ebd7         ; $cc95: 20 d7 eb  
            LDA #$e4           ; $cc98: a9 e4     
            STA $02            ; $cc9a: 85 02     
            LDA #$20           ; $cc9c: a9 20     
            STA $03            ; $cc9e: 85 03     
            LDA #$e3           ; $cca0: a9 e3     
            STA $00            ; $cca2: 85 00     
            LDA #$cc           ; $cca4: a9 cc     
            STA $01            ; $cca6: 85 01     
            JSR __ebd7         ; $cca8: 20 d7 eb  
            JSR __cd21         ; $ccab: 20 21 cd  
            RTS                ; $ccae: 60        

;-------------------------------------------------------------------------------
__ccaf:     JSR __cd21         ; $ccaf: 20 21 cd  
            LDA #$c4           ; $ccb2: a9 c4     
            STA $02            ; $ccb4: 85 02     
            LDA #$20           ; $ccb6: a9 20     
            STA $03            ; $ccb8: 85 03     
            LDA #$ea           ; $ccba: a9 ea     
            STA $00            ; $ccbc: 85 00     
            LDA #$cc           ; $ccbe: a9 cc     
            .hex 85            ; $ccc0: 85        Suspected data
__ccc1:     ORA ($20,x)        ; $ccc1: 01 20     
__ccc3:     .hex d7 eb         ; $ccc3: d7 eb     Invalid Opcode - DCP $eb,x
            .hex a9            ; $ccc5: a9        Suspected data
__ccc6:     CPX $85            ; $ccc6: e4 85     
            .hex 02            ; $ccc8: 02        Invalid Opcode - KIL 
__ccc9:     .hex a9            ; $ccc9: a9        Suspected data
__ccca:     .hex 20 85         ; $ccca: 20 85     Suspected data
__cccc:     .hex 03            ; $cccc: 03        Suspected data
__cccd:     LDA #$f1           ; $cccd: a9 f1     
            STA $00            ; $cccf: 85 00     
            LDA #$cc           ; $ccd1: a9 cc     
            STA $01            ; $ccd3: 85 01     
            JSR __ebd7         ; $ccd5: 20 d7 eb  
            JSR __cd21         ; $ccd8: 20 21 cd  
            RTS                ; $ccdb: 60        

;-------------------------------------------------------------------------------
__ccdc:     .hex da            ; $ccdc: da        Invalid Opcode - NOP 
            .hex db 20 20      ; $ccdd: db 20 20  Invalid Opcode - DCP $2020,y
__cce0:     .hex de df 00      ; $cce0: de df 00  Bad Addr Mode - DEC $00df,x
__cce3:     NOP                ; $cce3: ea        
            .hex eb 20         ; $cce4: eb 20     Invalid Opcode - SBC #$20
            JSR __efee         ; $cce6: 20 ee ef  
            BRK                ; $cce9: 00        
            .hex da            ; $ccea: da        Invalid Opcode - NOP 
            .hex db dc dd      ; $cceb: db dc dd  Invalid Opcode - DCP __dddc,y
__ccee:     .hex de df 00      ; $ccee: de df 00  Bad Addr Mode - DEC $00df,x
            NOP                ; $ccf1: ea        
            .hex eb ec         ; $ccf2: eb ec     Invalid Opcode - SBC #$ec
            SBC __efee         ; $ccf4: ed ee ef  
            BRK                ; $ccf7: 00        
            JSR __cd21         ; $ccf8: 20 21 cd  
            LDA #$c4           ; $ccfb: a9 c4     
            STA $02            ; $ccfd: 85 02     
            LDA #$20           ; $ccff: a9 20     
            STA $03            ; $cd01: 85 03     
            JSR __cd15         ; $cd03: 20 15 cd  
            LDA #$e4           ; $cd06: a9 e4     
            STA $02            ; $cd08: 85 02     
            LDA #$20           ; $cd0a: a9 20     
            STA $03            ; $cd0c: 85 03     
            JSR __cd15         ; $cd0e: 20 15 cd  
            JSR __cd21         ; $cd11: 20 21 cd  
            RTS                ; $cd14: 60        

;-------------------------------------------------------------------------------
__cd15:     LDA #$2d           ; $cd15: a9 2d     
            STA $00            ; $cd17: 85 00     
            LDA #$cd           ; $cd19: a9 cd     
            STA $01            ; $cd1b: 85 01     
            JSR __ebd7         ; $cd1d: 20 d7 eb  
            RTS                ; $cd20: 60        

;-------------------------------------------------------------------------------
__cd21:     JSR __ec08         ; $cd21: 20 08 ec  
            LDA #$01           ; $cd24: a9 01     
            STA $26            ; $cd26: 85 26     
__cd28:     LDA $26            ; $cd28: a5 26     
            BNE __cd28         ; $cd2a: d0 fc     
            RTS                ; $cd2c: 60        

;-------------------------------------------------------------------------------
            JSR $2020          ; $cd2d: 20 20 20  
            JSR $2020          ; $cd30: 20 20 20  
            BRK                ; $cd33: 00        
__cd34:     LDA #$00           ; $cd34: a9 00     
            STA $00,x          ; $cd36: 95 00     
            INX                ; $cd38: e8        
            DEY                ; $cd39: 88        
            BNE __cd34         ; $cd3a: d0 f8     
            RTS                ; $cd3c: 60        

;-------------------------------------------------------------------------------
__cd3d:     TAY                ; $cd3d: a8        
            LDA #$f8           ; $cd3e: a9 f8     
            JSR __d191         ; $cd40: 20 91 d1  
            JSR __d1a1         ; $cd43: 20 a1 d1  
            JSR __d1b7         ; $cd46: 20 b7 d1  
            JSR __d1c4         ; $cd49: 20 c4 d1  
            RTS                ; $cd4c: 60        

;-------------------------------------------------------------------------------
__cd4d:     STX $40            ; $cd4d: 86 40     
            STY $42            ; $cd4f: 84 42     
            LDY #$80           ; $cd51: a0 80     
            LDA $42            ; $cd53: a5 42     
            JSR __d191         ; $cd55: 20 91 d1  
            LDA #$e0           ; $cd58: a9 e0     
            JSR __d1a1         ; $cd5a: 20 a1 d1  
            LDA #$21           ; $cd5d: a9 21     
            JSR __d1b7         ; $cd5f: 20 b7 d1  
            LDA $40            ; $cd62: a5 40     
            JSR __d1c4         ; $cd64: 20 c4 d1  
            RTS                ; $cd67: 60        

;-------------------------------------------------------------------------------
__cd68:     STX $40            ; $cd68: 86 40     
            STY $42            ; $cd6a: 84 42     
            LDY #$70           ; $cd6c: a0 70     
            LDA $42            ; $cd6e: a5 42     
            JSR __d191         ; $cd70: 20 91 d1  
            LDA #$e2           ; $cd73: a9 e2     
            JSR __d1a1         ; $cd75: 20 a1 d1  
            LDA #$00           ; $cd78: a9 00     
            JSR __d1b7         ; $cd7a: 20 b7 d1  
            LDA $40            ; $cd7d: a5 40     
            JSR __d1c4         ; $cd7f: 20 c4 d1  
            RTS                ; $cd82: 60        

;-------------------------------------------------------------------------------
__cd83:     STX $071b          ; $cd83: 8e 1b 07  
            STY $0718          ; $cd86: 8c 18 07  
            LDA #$ef           ; $cd89: a9 ef     
            STA $0719          ; $cd8b: 8d 19 07  
            LDA #$01           ; $cd8e: a9 01     
            STA $071a          ; $cd90: 8d 1a 07  
            RTS                ; $cd93: 60        

;-------------------------------------------------------------------------------
__cd94:     LDA $9a            ; $cd94: a5 9a     
            BEQ __cd99         ; $cd96: f0 01     
            RTS                ; $cd98: 60        

;-------------------------------------------------------------------------------
__cd99:     LDA $8f            ; $cd99: a5 8f     
            BNE __cd9e         ; $cd9b: d0 01     
__cd9d:     RTS                ; $cd9d: 60        

;-------------------------------------------------------------------------------
__cd9e:     LDA $57            ; $cd9e: a5 57     
            BNE __cd9d         ; $cda0: d0 fb     
            LDA $a8            ; $cda2: a5 a8     
            BNE __cdaf         ; $cda4: d0 09     
            LDA #$01           ; $cda6: a9 01     
            STA $a8            ; $cda8: 85 a8     
            LDA #$50           ; $cdaa: a9 50     
            STA $0780          ; $cdac: 8d 80 07  
__cdaf:     INC $a9            ; $cdaf: e6 a9     
            LDA $a9            ; $cdb1: a5 a9     
            AND #$0f           ; $cdb3: 29 0f     
            TAX                ; $cdb5: aa        
            LDA __ce4f,x       ; $cdb6: bd 4f ce  
            CLC                ; $cdb9: 18        
            ADC $0780          ; $cdba: 6d 80 07  
            TAY                ; $cdbd: a8        
            LDX #$70           ; $cdbe: a2 70     
            JSR __cd4d         ; $cdc0: 20 4d cd  
            INC $aa            ; $cdc3: e6 aa     
            LDA $aa            ; $cdc5: a5 aa     
            AND #$3f           ; $cdc7: 29 3f     
            CMP #$20           ; $cdc9: c9 20     
            BCC __cdd7         ; $cdcb: 90 0a     
            LDX #$80           ; $cdcd: a2 80     
            LDY #$44           ; $cdcf: a0 44     
            JSR __cd68         ; $cdd1: 20 68 cd  
            JMP __cddc         ; $cdd4: 4c dc cd  

;-------------------------------------------------------------------------------
__cdd7:     LDA #$70           ; $cdd7: a9 70     
            JSR __cd3d         ; $cdd9: 20 3d cd  
__cddc:     LDA $0723          ; $cddc: ad 23 07  
            SEC                ; $cddf: 38        
            SBC $0783          ; $cde0: ed 83 07  
            JSR __d2a1         ; $cde3: 20 a1 d2  
            TAX                ; $cde6: aa        
            LDA $0720          ; $cde7: ad 20 07  
__cdea:     SEC                ; $cdea: 38        
            SBC $0780          ; $cdeb: ed 80 07  
            JSR __d2a1         ; $cdee: 20 a1 d2  
            TAY                ; $cdf1: a8        
            CPX #$0e           ; $cdf2: e0 0e     
            BCS __ce4e         ; $cdf4: b0 58     
            CPY #$0e           ; $cdf6: c0 0e     
            BCS __ce4e         ; $cdf8: b0 54     
            JSR __f2dc         ; $cdfa: 20 dc f2  
            LDA #$30           ; $cdfd: a9 30     
            JSR __cd3d         ; $cdff: 20 3d cd  
            LDA #$70           ; $ce02: a9 70     
            JSR __cd3d         ; $ce04: 20 3d cd  
            LDX #$84           ; $ce07: a2 84     
            LDY #$50           ; $ce09: a0 50     
            JSR __dffc         ; $ce0b: 20 fc df  
            LDA #$86           ; $ce0e: a9 86     
            JSR __dfe8         ; $ce10: 20 e8 df  
            LDX #$7c           ; $ce13: a2 7c     
            LDY #$54           ; $ce15: a0 54     
            JSR __cd83         ; $ce17: 20 83 cd  
            LDX #$6c           ; $ce1a: a2 6c     
            LDY #$50           ; $ce1c: a0 50     
            JSR __cd4d         ; $ce1e: 20 4d cd  
            JSR __caf0         ; $ce21: 20 f0 ca  
            JSR __d068         ; $ce24: 20 68 d0  
            JSR __c9a1         ; $ce27: 20 a1 c9  
            LDA #$02           ; $ce2a: a9 02     
            JSR __c60c         ; $ce2c: 20 0c c6  
            JSR __ce5f         ; $ce2f: 20 5f ce  
            JSR __f09a         ; $ce32: 20 9a f0  
            LDA #$03           ; $ce35: a9 03     
            JSR __c60c         ; $ce37: 20 0c c6  
            JSR __ce88         ; $ce3a: 20 88 ce  
__ce3d:     .hex 20 b1         ; $ce3d: 20 b1     Suspected data
__ce3f:     BEQ __cdea         ; $ce3f: f0 a9     
            .hex 04 20         ; $ce41: 04 20     Invalid Opcode - NOP $20
            .hex 0c c6 20      ; $ce43: 0c c6 20  Invalid Opcode - NOP $20c6
            .hex d4 f2         ; $ce46: d4 f2     Invalid Opcode - NOP $f2,x
            JSR __c843         ; $ce48: 20 43 c8  
            JMP __c277         ; $ce4b: 4c 77 c2  

;-------------------------------------------------------------------------------
__ce4e:     RTS                ; $ce4e: 60        

;-------------------------------------------------------------------------------
__ce4f:     BRK                ; $ce4f: 00        
            BRK                ; $ce50: 00        
            BRK                ; $ce51: 00        
            BRK                ; $ce52: 00        
            BRK                ; $ce53: 00        
            BRK                ; $ce54: 00        
            BRK                ; $ce55: 00        
            BRK                ; $ce56: 00        
            .hex fc fe ff      ; $ce57: fc fe ff  Invalid Opcode - NOP $fffe,x
            BRK                ; $ce5a: 00        
            BRK                ; $ce5b: 00        
            ORA ($02,x)        ; $ce5c: 01 02     
            .hex 04            ; $ce5e: 04        Suspected data
__ce5f:     JSR __ce79         ; $ce5f: 20 79 ce  
            LDY #$40           ; $ce62: a0 40     
            LDA #$48           ; $ce64: a9 48     
            JSR __d191         ; $ce66: 20 91 d1  
            LDA #$08           ; $ce69: a9 08     
            JSR __d1a1         ; $ce6b: 20 a1 d1  
            LDA #$01           ; $ce6e: a9 01     
            JSR __d1b7         ; $ce70: 20 b7 d1  
            LDA #$78           ; $ce73: a9 78     
            JSR __d1c4         ; $ce75: 20 c4 d1  
            RTS                ; $ce78: 60        

;-------------------------------------------------------------------------------
__ce79:     LDA #$f8           ; $ce79: a9 f8     
            STA $0718          ; $ce7b: 8d 18 07  
            STA $0719          ; $ce7e: 8d 19 07  
            STA $071a          ; $ce81: 8d 1a 07  
            STA $071b          ; $ce84: 8d 1b 07  
            RTS                ; $ce87: 60        

;-------------------------------------------------------------------------------
__ce88:     LDY #$40           ; $ce88: a0 40     
            LDX #$00           ; $ce8a: a2 00     
__ce8c:     LDA __ceaf,x       ; $ce8c: bd af ce  
            JSR __d191         ; $ce8f: 20 91 d1  
            LDA __ceb3,x       ; $ce92: bd b3 ce  
            JSR __d1a1         ; $ce95: 20 a1 d1  
            LDA __ceb7,x       ; $ce98: bd b7 ce  
            JSR __d1b7         ; $ce9b: 20 b7 d1  
            LDA __cebb,x       ; $ce9e: bd bb ce  
            JSR __d1c4         ; $cea1: 20 c4 d1  
            TYA                ; $cea4: 98        
            CLC                ; $cea5: 18        
            ADC #$10           ; $cea6: 69 10     
            TAY                ; $cea8: a8        
            INX                ; $cea9: e8        
            CPX #$04           ; $ceaa: e0 04     
            BNE __ce8c         ; $ceac: d0 de     
            RTS                ; $ceae: 60        

;-------------------------------------------------------------------------------
__ceaf:     .hex 34 34         ; $ceaf: 34 34     Invalid Opcode - NOP $34,x
            .hex 44 44         ; $ceb1: 44 44     Invalid Opcode - NOP $44
__ceb3:     PHA                ; $ceb3: 48        
            LSR                ; $ceb4: 4a        
            PLA                ; $ceb5: 68        
            ROR                ; $ceb6: 6a        
__ceb7:     ORA ($01,x)        ; $ceb7: 01 01     
            ORA ($01,x)        ; $ceb9: 01 01     
__cebb:     BVS __ce3d         ; $cebb: 70 80     
            BVS __ce3f         ; $cebd: 70 80     
__cebf:     LDX #$00           ; $cebf: a2 00     
__cec1:     LDA __cecc,x       ; $cec1: bd cc ce  
            STA $78,x          ; $cec4: 95 78     
            INX                ; $cec6: e8        
            CPX #$10           ; $cec7: e0 10     
            BNE __cec1         ; $cec9: d0 f6     
            RTS                ; $cecb: 60        

;-------------------------------------------------------------------------------
__cecc:     BRK                ; $cecc: 00        
__cecd:     ORA ($64,x)        ; $cecd: 01 64     
            ORA ($00,x)        ; $cecf: 01 00     
            BRK                ; $ced1: 00        
            STX $00,y          ; $ced2: 96 00     
            BRK                ; $ced4: 00        
            ORA ($32,x)        ; $ced5: 01 32     
            ORA ($00,x)        ; $ced7: 01 00     
            BRK                ; $ced9: 00        
            INY                ; $ceda: c8        
            BRK                ; $cedb: 00        
__cedc:     SEC                ; $cedc: 38        
            RTS                ; $cedd: 60        

;-------------------------------------------------------------------------------
            DEY                ; $cede: 88        
            .hex b0            ; $cedf: b0        Suspected data
__cee0:     RTI                ; $cee0: 40        

;-------------------------------------------------------------------------------
            BVC __cf23         ; $cee1: 50 40     
            .hex 50            ; $cee3: 50        Suspected data
__cee4:     .hex 03 03         ; $cee4: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $cee6: 03 03     Invalid Opcode - SLO ($03,x)
__cee8:     BRK                ; $cee8: 00        
            SED                ; $cee9: f8        
            BRK                ; $ceea: 00        
            SED                ; $ceeb: f8        
__ceec:     LDA $9a            ; $ceec: a5 9a     
            BEQ __cef1         ; $ceee: f0 01     
            RTS                ; $cef0: 60        

;-------------------------------------------------------------------------------
__cef1:     LDA $8f            ; $cef1: a5 8f     
            BNE __cef6         ; $cef3: d0 01     
            RTS                ; $cef5: 60        

;-------------------------------------------------------------------------------
__cef6:     LDA $57            ; $cef6: a5 57     
            BNE __cf36         ; $cef8: d0 3c     
            LDA #$00           ; $cefa: a9 00     
            STA $44            ; $cefc: 85 44     
            LDA #$00           ; $cefe: a9 00     
            STA $45            ; $cf00: 85 45     
            LDA $8f            ; $cf02: a5 8f     
            STA $47            ; $cf04: 85 47     
__cf06:     LDX $44            ; $cf06: a6 44     
            LDY #$00           ; $cf08: a0 00     
__cf0a:     LDA $78,x          ; $cf0a: b5 78     
            STA $0058,y        ; $cf0c: 99 58 00  
            INX                ; $cf0f: e8        
            INY                ; $cf10: c8        
            CPY #$04           ; $cf11: c0 04     
            BNE __cf0a         ; $cf13: d0 f5     
            JSR __cf37         ; $cf15: 20 37 cf  
            LDX $44            ; $cf18: a6 44     
            LDY #$00           ; $cf1a: a0 00     
__cf1c:     LDA $0058,y        ; $cf1c: b9 58 00  
            STA $78,x          ; $cf1f: 95 78     
            INX                ; $cf21: e8        
            INY                ; $cf22: c8        
__cf23:     CPY #$04           ; $cf23: c0 04     
            BNE __cf1c         ; $cf25: d0 f5     
            LDA $44            ; $cf27: a5 44     
            CLC                ; $cf29: 18        
            ADC #$04           ; $cf2a: 69 04     
            STA $44            ; $cf2c: 85 44     
            INC $45            ; $cf2e: e6 45     
            LDA $45            ; $cf30: a5 45     
            CMP $47            ; $cf32: c5 47     
            BNE __cf06         ; $cf34: d0 d0     
__cf36:     RTS                ; $cf36: 60        

;-------------------------------------------------------------------------------
__cf37:     LDA $58            ; $cf37: a5 58     
            BNE __cf78         ; $cf39: d0 3d     
            INC $5a            ; $cf3b: e6 5a     
            LDA $5a            ; $cf3d: a5 5a     
            CMP #$64           ; $cf3f: c9 64     
            BNE __cf67         ; $cf41: d0 24     
            LDY $45            ; $cf43: a4 45     
            LDX $44            ; $cf45: a6 44     
            LDA __cedc,y       ; $cf47: b9 dc ce  
            STA $0730,x        ; $cf4a: 9d 30 07  
            LDA __cee0,y       ; $cf4d: b9 e0 ce  
            STA $0731,x        ; $cf50: 9d 31 07  
            LDA __cee4,y       ; $cf53: b9 e4 ce  
            STA $0732,x        ; $cf56: 9d 32 07  
            LDA __cee8,y       ; $cf59: b9 e8 ce  
            STA $0733,x        ; $cf5c: 9d 33 07  
            LDA #$01           ; $cf5f: a9 01     
            STA $58            ; $cf61: 85 58     
            LDA #$00           ; $cf63: a9 00     
            STA $5a            ; $cf65: 85 5a     
__cf67:     RTS                ; $cf67: 60        

;-------------------------------------------------------------------------------
__cf68:     LDX $44            ; $cf68: a6 44     
            LDA #$60           ; $cf6a: a9 60     
            STA $0731,x        ; $cf6c: 9d 31 07  
            LDA #$00           ; $cf6f: a9 00     
            STA $58            ; $cf71: 85 58     
            LDA #$00           ; $cf73: a9 00     
            STA $5a            ; $cf75: 85 5a     
            RTS                ; $cf77: 60        

;-------------------------------------------------------------------------------
__cf78:     JSR __cfd2         ; $cf78: 20 d2 cf  
            LDX $44            ; $cf7b: a6 44     
            LDA $0731,x        ; $cf7d: bd 31 07  
            CLC                ; $cf80: 18        
            ADC #$01           ; $cf81: 69 01     
            AND #$f3           ; $cf83: 29 f3     
            STA $0731,x        ; $cf85: 9d 31 07  
            LDA $59            ; $cf88: a5 59     
            BEQ __cf99         ; $cf8a: f0 0d     
            INC $0733,x        ; $cf8c: fe 33 07  
            LDA $0733,x        ; $cf8f: bd 33 07  
            CMP #$f8           ; $cf92: c9 f8     
            BNE __cfa4         ; $cf94: d0 0e     
            JMP __cf68         ; $cf96: 4c 68 cf  

;-------------------------------------------------------------------------------
__cf99:     DEC $0733,x        ; $cf99: de 33 07  
            LDA $0733,x        ; $cf9c: bd 33 07  
            BNE __cfa4         ; $cf9f: d0 03     
            JMP __cf68         ; $cfa1: 4c 68 cf  

;-------------------------------------------------------------------------------
__cfa4:     LDA $5b            ; $cfa4: a5 5b     
            BEQ __cfbe         ; $cfa6: f0 16     
            INC $0730,x        ; $cfa8: fe 30 07  
            INC $5a            ; $cfab: e6 5a     
            LDA $5a            ; $cfad: a5 5a     
            CMP #$28           ; $cfaf: c9 28     
            BNE __cfd1         ; $cfb1: d0 1e     
            LDA #$00           ; $cfb3: a9 00     
            STA $5a            ; $cfb5: 85 5a     
            LDA #$00           ; $cfb7: a9 00     
            STA $5b            ; $cfb9: 85 5b     
            JMP __cfd1         ; $cfbb: 4c d1 cf  

;-------------------------------------------------------------------------------
__cfbe:     DEC $0730,x        ; $cfbe: de 30 07  
            INC $5a            ; $cfc1: e6 5a     
            LDA $5a            ; $cfc3: a5 5a     
            CMP #$28           ; $cfc5: c9 28     
            BNE __cfd1         ; $cfc7: d0 08     
            LDA #$00           ; $cfc9: a9 00     
            STA $5a            ; $cfcb: 85 5a     
            LDA #$01           ; $cfcd: a9 01     
            STA $5b            ; $cfcf: 85 5b     
__cfd1:     RTS                ; $cfd1: 60        

;-------------------------------------------------------------------------------
__cfd2:     LDX $44            ; $cfd2: a6 44     
            LDA $0723          ; $cfd4: ad 23 07  
            CLC                ; $cfd7: 18        
            ADC #$08           ; $cfd8: 69 08     
            STA $46            ; $cfda: 85 46     
            LDA $0733,x        ; $cfdc: bd 33 07  
            CLC                ; $cfdf: 18        
            ADC #$04           ; $cfe0: 69 04     
            SEC                ; $cfe2: 38        
            SBC $46            ; $cfe3: e5 46     
            JSR __d2a1         ; $cfe5: 20 a1 d2  
            CMP #$08           ; $cfe8: c9 08     
            BCS __d007         ; $cfea: b0 1b     
            LDA $0720          ; $cfec: ad 20 07  
            CLC                ; $cfef: 18        
            ADC #$08           ; $cff0: 69 08     
            STA $46            ; $cff2: 85 46     
            LDA $0730,x        ; $cff4: bd 30 07  
            CLC                ; $cff7: 18        
            ADC #$04           ; $cff8: 69 04     
            SEC                ; $cffa: 38        
            SBC $46            ; $cffb: e5 46     
            JSR __d2a1         ; $cffd: 20 a1 d2  
            CMP #$08           ; $d000: c9 08     
            BCS __d007         ; $d002: b0 03     
            JMP __d669         ; $d004: 4c 69 d6  

;-------------------------------------------------------------------------------
__d007:     RTS                ; $d007: 60        

;-------------------------------------------------------------------------------
__d008:     LDA $9a            ; $d008: a5 9a     
            BEQ __d00d         ; $d00a: f0 01     
            RTS                ; $d00c: 60        

;-------------------------------------------------------------------------------
__d00d:     LDA $8c            ; $d00d: a5 8c     
            BEQ __d022         ; $d00f: f0 11     
            INC $8d            ; $d011: e6 8d     
            LDA $8d            ; $d013: a5 8d     
            CMP #$0a           ; $d015: c9 0a     
            BNE __d022         ; $d017: d0 09     
            LDA #$60           ; $d019: a9 60     
            JSR __d034         ; $d01b: 20 34 d0  
            LDA #$00           ; $d01e: a9 00     
            STA $8c            ; $d020: 85 8c     
__d022:     RTS                ; $d022: 60        

;-------------------------------------------------------------------------------
__d023:     STX $0713          ; $d023: 8e 13 07  
            TXA                ; $d026: 8a        
            CLC                ; $d027: 18        
            ADC #$08           ; $d028: 69 08     
            STA $0717          ; $d02a: 8d 17 07  
            STY $0710          ; $d02d: 8c 10 07  
            STY $0714          ; $d030: 8c 14 07  
            RTS                ; $d033: 60        

;-------------------------------------------------------------------------------
__d034:     STA $0711          ; $d034: 8d 11 07  
            CLC                ; $d037: 18        
            ADC #$01           ; $d038: 69 01     
            STA $0715          ; $d03a: 8d 15 07  
            RTS                ; $d03d: 60        

;-------------------------------------------------------------------------------
__d03e:     LDX #$00           ; $d03e: a2 00     
__d040:     LDA $0600,x        ; $d040: bd 00 06  
            CMP #$05           ; $d043: c9 05     
            BEQ __d053         ; $d045: f0 0c     
            CMP #$06           ; $d047: c9 06     
            BEQ __d053         ; $d049: f0 08     
            CMP #$08           ; $d04b: c9 08     
            BEQ __d053         ; $d04d: f0 04     
            CMP #$09           ; $d04f: c9 09     
            BNE __d058         ; $d051: d0 05     
__d053:     LDA #$00           ; $d053: a9 00     
            STA $0600,x        ; $d055: 9d 00 06  
__d058:     INX                ; $d058: e8        
            BNE __d040         ; $d059: d0 e5     
            RTS                ; $d05b: 60        

;-------------------------------------------------------------------------------
__d05c:     LDX #$90           ; $d05c: a2 90     
            LDY #$0a           ; $d05e: a0 0a     
            JSR __cd34         ; $d060: 20 34 cd  
            LDA #$00           ; $d063: a9 00     
            STA $e4            ; $d065: 85 e4     
            RTS                ; $d067: 60        

;-------------------------------------------------------------------------------
__d068:     LDA #$90           ; $d068: a9 90     
            JSR __cd3d         ; $d06a: 20 3d cd  
            LDA #$a0           ; $d06d: a9 a0     
            JSR __cd3d         ; $d06f: 20 3d cd  
            LDA #$b0           ; $d072: a9 b0     
            JSR __cd3d         ; $d074: 20 3d cd  
            LDA #$c0           ; $d077: a9 c0     
            JSR __cd3d         ; $d079: 20 3d cd  
            LDA #$d0           ; $d07c: a9 d0     
            JSR __cd3d         ; $d07e: 20 3d cd  
            RTS                ; $d081: 60        

;-------------------------------------------------------------------------------
__d082:     LDA $9a            ; $d082: a5 9a     
            BEQ __d087         ; $d084: f0 01     
            RTS                ; $d086: 60        

;-------------------------------------------------------------------------------
__d087:     LDA #$90           ; $d087: a9 90     
            STA $06            ; $d089: 85 06     
            LDA #$00           ; $d08b: a9 00     
            STA $07            ; $d08d: 85 07     
            LDA #$90           ; $d08f: a9 90     
            STA $08            ; $d091: 85 08     
            LDA #$07           ; $d093: a9 07     
            STA $09            ; $d095: 85 09     
            LDA $2c            ; $d097: a5 2c     
            STA $49            ; $d099: 85 49     
__d09b:     LDY #$00           ; $d09b: a0 00     
            LDA ($06),y        ; $d09d: b1 06     
            STA $58            ; $d09f: 85 58     
            INY                ; $d0a1: c8        
            LDA ($06),y        ; $d0a2: b1 06     
            STA $59            ; $d0a4: 85 59     
            LDY #$03           ; $d0a6: a0 03     
__d0a8:     LDA ($08),y        ; $d0a8: b1 08     
            STA $005a,y        ; $d0aa: 99 5a 00  
            DEY                ; $d0ad: 88        
            BPL __d0a8         ; $d0ae: 10 f8     
            JSR __d0db         ; $d0b0: 20 db d0  
            LDY #$00           ; $d0b3: a0 00     
            LDA $58            ; $d0b5: a5 58     
            STA ($06),y        ; $d0b7: 91 06     
            INY                ; $d0b9: c8        
            LDA $59            ; $d0ba: a5 59     
            STA ($06),y        ; $d0bc: 91 06     
            LDY #$03           ; $d0be: a0 03     
__d0c0:     LDA $005a,y        ; $d0c0: b9 5a 00  
            STA ($08),y        ; $d0c3: 91 08     
            DEY                ; $d0c5: 88        
            BPL __d0c0         ; $d0c6: 10 f8     
            LDA $06            ; $d0c8: a5 06     
            CLC                ; $d0ca: 18        
            .hex 69            ; $d0cb: 69        Suspected data
__d0cc:     .hex 02            ; $d0cc: 02        Invalid Opcode - KIL 
            STA $06            ; $d0cd: 85 06     
            LDA $08            ; $d0cf: a5 08     
            CLC                ; $d0d1: 18        
            ADC #$10           ; $d0d2: 69 10     
            STA $08            ; $d0d4: 85 08     
            DEC $49            ; $d0d6: c6 49     
            BNE __d09b         ; $d0d8: d0 c1     
            RTS                ; $d0da: 60        

;-------------------------------------------------------------------------------
__d0db:     LDA $58            ; $d0db: a5 58     
            BNE __d117         ; $d0dd: d0 38     
            LDA $57            ; $d0df: a5 57     
            BNE __d116         ; $d0e1: d0 33     
            LDA $e5            ; $d0e3: a5 e5     
            BNE __d116         ; $d0e5: d0 2f     
            JSR __d15d         ; $d0e7: 20 5d d1  
            LDA $5d            ; $d0ea: a5 5d     
            SEC                ; $d0ec: 38        
            SBC $0723          ; $d0ed: ed 23 07  
            JSR __d2a1         ; $d0f0: 20 a1 d2  
            TAX                ; $d0f3: aa        
            LDA $5a            ; $d0f4: a5 5a     
            SEC                ; $d0f6: 38        
            SBC $0720          ; $d0f7: ed 20 07  
            JSR __d2a1         ; $d0fa: 20 a1 d2  
            TAY                ; $d0fd: a8        
            CPX #$0c           ; $d0fe: e0 0c     
            BCS __d116         ; $d100: b0 14     
            CPY #$0c           ; $d102: c0 0c     
            BCS __d116         ; $d104: b0 10     
            LDA #$01           ; $d106: a9 01     
            STA $58            ; $d108: 85 58     
            LDA #$1e           ; $d10a: a9 1e     
            STA $59            ; $d10c: 85 59     
            JSR __f09a         ; $d10e: 20 9a f0  
            JSR __c6ab         ; $d111: 20 ab c6  
            INC $e4            ; $d114: e6 e4     
__d116:     RTS                ; $d116: 60        

;-------------------------------------------------------------------------------
__d117:     LDA $59            ; $d117: a5 59     
            BEQ __d157         ; $d119: f0 3c     
            DEC $59            ; $d11b: c6 59     
            LDX #$60           ; $d11d: a2 60     
            CMP #$01           ; $d11f: c9 01     
            BEQ __d13d         ; $d121: f0 1a     
            LDX #$cc           ; $d123: a2 cc     
            CMP #$0f           ; $d125: c9 0f     
            BCC __d13d         ; $d127: 90 14     
            LDX #$ca           ; $d129: a2 ca     
            CMP #$15           ; $d12b: c9 15     
            BCC __d13d         ; $d12d: 90 0e     
            LDX #$c8           ; $d12f: a2 c8     
            CMP #$18           ; $d131: c9 18     
            BCC __d13d         ; $d133: 90 08     
            LDX #$c6           ; $d135: a2 c6     
            CMP #$1b           ; $d137: c9 1b     
            BCC __d13d         ; $d139: 90 02     
            LDX #$c4           ; $d13b: a2 c4     
__d13d:     TXA                ; $d13d: 8a        
            LDY $08            ; $d13e: a4 08     
            STA $5b            ; $d140: 85 5b     
            JSR __d1a1         ; $d142: 20 a1 d1  
            LDA #$02           ; $d145: a9 02     
            STA $5c            ; $d147: 85 5c     
            JSR __d1b7         ; $d149: 20 b7 d1  
            LDA $5a            ; $d14c: a5 5a     
            SEC                ; $d14e: 38        
            SBC #$01           ; $d14f: e9 01     
            STA $5a            ; $d151: 85 5a     
            JSR __d191         ; $d153: 20 91 d1  
            RTS                ; $d156: 60        

;-------------------------------------------------------------------------------
__d157:     LDA $08            ; $d157: a5 08     
            JSR __cd3d         ; $d159: 20 3d cd  
            RTS                ; $d15c: 60        

;-------------------------------------------------------------------------------
__d15d:     LDA $8f            ; $d15d: a5 8f     
            BEQ __d190         ; $d15f: f0 2f     
            LDA $59            ; $d161: a5 59     
            BEQ __d17c         ; $d163: f0 17     
            LDA $5a            ; $d165: a5 5a     
            CLC                ; $d167: 18        
            ADC $8f            ; $d168: 65 8f     
            STA $5a            ; $d16a: 85 5a     
            LDY $08            ; $d16c: a4 08     
            JSR __d191         ; $d16e: 20 91 d1  
            CMP #$a0           ; $d171: c9 a0     
            BCC __d190         ; $d173: 90 1b     
            LDA #$00           ; $d175: a9 00     
            STA $59            ; $d177: 85 59     
            JMP __d190         ; $d179: 4c 90 d1  

;-------------------------------------------------------------------------------
__d17c:     LDA $5a            ; $d17c: a5 5a     
            SEC                ; $d17e: 38        
            SBC $8f            ; $d17f: e5 8f     
            STA $5a            ; $d181: 85 5a     
            LDY $08            ; $d183: a4 08     
            JSR __d191         ; $d185: 20 91 d1  
            CMP #$60           ; $d188: c9 60     
            BCS __d190         ; $d18a: b0 04     
            LDA #$01           ; $d18c: a9 01     
            STA $59            ; $d18e: 85 59     
__d190:     RTS                ; $d190: 60        

;-------------------------------------------------------------------------------
__d191:     STA $0700,y        ; $d191: 99 00 07  
            STA $0704,y        ; $d194: 99 04 07  
            CLC                ; $d197: 18        
            ADC #$08           ; $d198: 69 08     
            STA $0708,y        ; $d19a: 99 08 07  
            STA $070c,y        ; $d19d: 99 0c 07  
            RTS                ; $d1a0: 60        

;-------------------------------------------------------------------------------
__d1a1:     STA $0701,y        ; $d1a1: 99 01 07  
            CLC                ; $d1a4: 18        
            ADC #$01           ; $d1a5: 69 01     
            STA $0705,y        ; $d1a7: 99 05 07  
            CLC                ; $d1aa: 18        
            ADC #$0f           ; $d1ab: 69 0f     
            STA $070d,y        ; $d1ad: 99 0d 07  
            CLC                ; $d1b0: 18        
            ADC #$01           ; $d1b1: 69 01     
            STA $0709,y        ; $d1b3: 99 09 07  
            RTS                ; $d1b6: 60        

;-------------------------------------------------------------------------------
__d1b7:     STA $0702,y        ; $d1b7: 99 02 07  
            STA $0706,y        ; $d1ba: 99 06 07  
            STA $070a,y        ; $d1bd: 99 0a 07  
            STA $070e,y        ; $d1c0: 99 0e 07  
            RTS                ; $d1c3: 60        

;-------------------------------------------------------------------------------
__d1c4:     STA $0703,y        ; $d1c4: 99 03 07  
            STA $070f,y        ; $d1c7: 99 0f 07  
            CLC                ; $d1ca: 18        
            ADC #$08           ; $d1cb: 69 08     
            STA $0707,y        ; $d1cd: 99 07 07  
            STA $070b,y        ; $d1d0: 99 0b 07  
            RTS                ; $d1d3: 60        

;-------------------------------------------------------------------------------
__d1d4:     LDX #$00           ; $d1d4: a2 00     
            TXA                ; $d1d6: 8a        
            LDY #$04           ; $d1d7: a0 04     
__d1d9:     STA $88,x          ; $d1d9: 95 88     
            INX                ; $d1db: e8        
            DEY                ; $d1dc: 88        
            BNE __d1d9         ; $d1dd: d0 fa     
            RTS                ; $d1df: 60        

;-------------------------------------------------------------------------------
__d1e0:     LDA $8f            ; $d1e0: a5 8f     
            BEQ __d1f2         ; $d1e2: f0 0e     
            LDA #$60           ; $d1e4: a9 60     
            LDY #$e0           ; $d1e6: a0 e0     
            JSR __d1a1         ; $d1e8: 20 a1 d1  
            LDA #$60           ; $d1eb: a9 60     
            LDY #$f0           ; $d1ed: a0 f0     
            JSR __d1a1         ; $d1ef: 20 a1 d1  
__d1f2:     RTS                ; $d1f2: 60        

;-------------------------------------------------------------------------------
__d1f3:     LDA $9a            ; $d1f3: a5 9a     
            BEQ __d1f8         ; $d1f5: f0 01     
            RTS                ; $d1f7: 60        

;-------------------------------------------------------------------------------
__d1f8:     LDA #$88           ; $d1f8: a9 88     
            STA $02            ; $d1fa: 85 02     
            LDA #$00           ; $d1fc: a9 00     
            STA $03            ; $d1fe: 85 03     
            LDA #$e0           ; $d200: a9 e0     
            STA $45            ; $d202: 85 45     
            LDA #$02           ; $d204: a9 02     
            STA $46            ; $d206: 85 46     
__d208:     JSR __d21e         ; $d208: 20 1e d2  
            LDA $02            ; $d20b: a5 02     
            CLC                ; $d20d: 18        
            ADC #$02           ; $d20e: 69 02     
            STA $02            ; $d210: 85 02     
            LDA $45            ; $d212: a5 45     
            CLC                ; $d214: 18        
            ADC #$10           ; $d215: 69 10     
            STA $45            ; $d217: 85 45     
            DEC $46            ; $d219: c6 46     
            BNE __d208         ; $d21b: d0 eb     
            RTS                ; $d21d: 60        

;-------------------------------------------------------------------------------
__d21e:     LDY #$00           ; $d21e: a0 00     
            LDA ($02),y        ; $d220: b1 02     
            BEQ __d23a         ; $d222: f0 16     
            INY                ; $d224: c8        
            LDA ($02),y        ; $d225: b1 02     
            SEC                ; $d227: 38        
            SBC #$01           ; $d228: e9 01     
            STA ($02),y        ; $d22a: 91 02     
            BNE __d23a         ; $d22c: d0 0c     
            DEY                ; $d22e: 88        
            LDA #$00           ; $d22f: a9 00     
            STA ($02),y        ; $d231: 91 02     
            LDA #$c0           ; $d233: a9 c0     
            LDY $45            ; $d235: a4 45     
            JSR __d1a1         ; $d237: 20 a1 d1  
__d23a:     RTS                ; $d23a: 60        

;-------------------------------------------------------------------------------
__d23b:     LDA #$88           ; $d23b: a9 88     
            STA $02            ; $d23d: 85 02     
            LDA #$00           ; $d23f: a9 00     
            STA $03            ; $d241: 85 03     
            LDA #$e0           ; $d243: a9 e0     
            STA $45            ; $d245: 85 45     
            LDA #$02           ; $d247: a9 02     
            STA $46            ; $d249: 85 46     
            LDA #$01           ; $d24b: a9 01     
            STA $44            ; $d24d: 85 44     
__d24f:     JSR __d267         ; $d24f: 20 67 d2  
            LDA $02            ; $d252: a5 02     
            CLC                ; $d254: 18        
            ADC #$02           ; $d255: 69 02     
            STA $02            ; $d257: 85 02     
            LDA $45            ; $d259: a5 45     
            CLC                ; $d25b: 18        
            ADC #$10           ; $d25c: 69 10     
            STA $45            ; $d25e: 85 45     
            DEC $46            ; $d260: c6 46     
            BNE __d24f         ; $d262: d0 eb     
            LDA $44            ; $d264: a5 44     
            RTS                ; $d266: 60        

;-------------------------------------------------------------------------------
__d267:     LDY #$00           ; $d267: a0 00     
            LDA ($02),y        ; $d269: b1 02     
            BNE __d2a0         ; $d26b: d0 33     
            LDY $45            ; $d26d: a4 45     
            LDA $28            ; $d26f: a5 28     
            CLC                ; $d271: 18        
            ADC #$08           ; $d272: 69 08     
            AND #$f0           ; $d274: 29 f0     
            CMP $0703,y        ; $d276: d9 03 07  
            BNE __d2a0         ; $d279: d0 25     
            LDA $29            ; $d27b: a5 29     
            CLC                ; $d27d: 18        
            ADC #$10           ; $d27e: 69 10     
            AND #$f0           ; $d280: 29 f0     
            CMP $0700,y        ; $d282: d9 00 07  
            BNE __d2a0         ; $d285: d0 19     
            LDY #$00           ; $d287: a0 00     
            LDA #$01           ; $d289: a9 01     
            STA ($02),y        ; $d28b: 91 02     
            INY                ; $d28d: c8        
            LDA #$03           ; $d28e: a9 03     
            STA ($02),y        ; $d290: 91 02     
            LDA #$c2           ; $d292: a9 c2     
            LDY $45            ; $d294: a4 45     
            JSR __d1a1         ; $d296: 20 a1 d1  
            LDA #$00           ; $d299: a9 00     
            STA $44            ; $d29b: 85 44     
            JSR __f0c8         ; $d29d: 20 c8 f0  
__d2a0:     RTS                ; $d2a0: 60        

;-------------------------------------------------------------------------------
__d2a1:     CMP #$80           ; $d2a1: c9 80     
            BCC __d2aa         ; $d2a3: 90 05     
            EOR #$ff           ; $d2a5: 49 ff     
            CLC                ; $d2a7: 18        
            ADC #$01           ; $d2a8: 69 01     
__d2aa:     RTS                ; $d2aa: 60        

;-------------------------------------------------------------------------------
__d2ab:     CLC                ; $d2ab: 18        
            ADC __dfd5,x       ; $d2ac: 7d d5 df  
            TAY                ; $d2af: a8        
            CPX #$0b           ; $d2b0: e0 0b     
            BCS __d2bb         ; $d2b2: b0 07     
            CMP #$c8           ; $d2b4: c9 c8     
            BCC __d2bb         ; $d2b6: 90 03     
            LDA #$00           ; $d2b8: a9 00     
            TAY                ; $d2ba: a8        
__d2bb:     RTS                ; $d2bb: 60        

;-------------------------------------------------------------------------------
__d2bc:     STX $c0            ; $d2bc: 86 c0     
            STY $c1            ; $d2be: 84 c1     
            LDA #$00           ; $d2c0: a9 00     
            STA $0f            ; $d2c2: 85 0f     
            LDA $5f            ; $d2c4: a5 5f     
            BNE __d2da         ; $d2c6: d0 12     
            LDX $d3            ; $d2c8: a6 d3     
            LDY $d0            ; $d2ca: a4 d0     
            JSR __e07b         ; $d2cc: 20 7b e0  
            BNE __d2dd         ; $d2cf: d0 0c     
            LDX $d3            ; $d2d1: a6 d3     
            LDY $d0            ; $d2d3: a4 d0     
            JSR __e042         ; $d2d5: 20 42 e0  
            BNE __d2dd         ; $d2d8: d0 03     
__d2da:     JMP __d532         ; $d2da: 4c 32 d5  

;-------------------------------------------------------------------------------
__d2dd:     LDA $5c            ; $d2dd: a5 5c     
            BEQ __d31c         ; $d2df: f0 3b     
            LDA $d0            ; $d2e1: a5 d0     
            CMP #$d0           ; $d2e3: c9 d0     
            BEQ __d306         ; $d2e5: f0 1f     
            LDA $d0            ; $d2e7: a5 d0     
            AND #$0f           ; $d2e9: 29 0f     
            BNE __d2f8         ; $d2eb: d0 0b     
            LDX $d3            ; $d2ed: a6 d3     
            LDY $d0            ; $d2ef: a4 d0     
            JSR __e042         ; $d2f1: 20 42 e0  
            CMP #$03           ; $d2f4: c9 03     
            BNE __d2ff         ; $d2f6: d0 07     
__d2f8:     LDA #$04           ; $d2f8: a9 04     
            STA $0f            ; $d2fa: 85 0f     
            JMP __d532         ; $d2fc: 4c 32 d5  

;-------------------------------------------------------------------------------
__d2ff:     LDA #$00           ; $d2ff: a9 00     
            STA $5c            ; $d301: 85 5c     
            JMP __d31c         ; $d303: 4c 1c d3  

;-------------------------------------------------------------------------------
__d306:     JSR __d846         ; $d306: 20 46 d8  
            LDA #$00           ; $d309: a9 00     
            STA $0f            ; $d30b: 85 0f     
            JMP __d532         ; $d30d: 4c 32 d5  

;-------------------------------------------------------------------------------
__d310:     LDA $d0            ; $d310: a5 d0     
            SEC                ; $d312: 38        
            SBC $0720          ; $d313: ed 20 07  
            JSR __d2a1         ; $d316: 20 a1 d2  
            CMP #$02           ; $d319: c9 02     
            RTS                ; $d31b: 60        

;-------------------------------------------------------------------------------
__d31c:     JSR __d310         ; $d31c: 20 10 d3  
            BCC __d324         ; $d31f: 90 03     
            JMP __d3c2         ; $d321: 4c c2 d3  

;-------------------------------------------------------------------------------
__d324:     LDA $d3            ; $d324: a5 d3     
            CMP $0723          ; $d326: cd 23 07  
            BCC __d371         ; $d329: 90 46     
            LDX $d3            ; $d32b: a6 d3     
            LDY $d0            ; $d32d: a4 d0     
            JSR __e07b         ; $d32f: 20 7b e0  
            BEQ __d338         ; $d332: f0 04     
            CMP #$03           ; $d334: c9 03     
            .hex d0 7f         ; $d336: d0 7f     Illegal Branch - BNE #$7f
__d338:     LDA #$02           ; $d338: a9 02     
            STA $0f            ; $d33a: 85 0f     
            LDA $d3            ; $d33c: a5 d3     
            CMP #$10           ; $d33e: c9 10     
            BCC __d36a         ; $d340: 90 28     
            LDX $d3            ; $d342: a6 d3     
            LDY $d0            ; $d344: a4 d0     
            JSR __e042         ; $d346: 20 42 e0  
            LDY #$0f           ; $d349: a0 0f     
            LDA ($00),y        ; $d34b: b1 00     
            BNE __d36a         ; $d34d: d0 1b     
            LDX $d3            ; $d34f: a6 d3     
            LDY $d0            ; $d351: a4 d0     
            JSR __e0ab         ; $d353: 20 ab e0  
            BNE __d36a         ; $d356: d0 12     
            LDA $d3            ; $d358: a5 d3     
            AND #$0f           ; $d35a: 29 0f     
            BNE __d36a         ; $d35c: d0 0c     
            LDA #$82           ; $d35e: a9 82     
__d360:     STA $0f            ; $d360: 85 0f     
            LDA #$02           ; $d362: a9 02     
            STA $5b            ; $d364: 85 5b     
            LDA #$02           ; $d366: a9 02     
            STA $5a            ; $d368: 85 5a     
__d36a:     LDA #$00           ; $d36a: a9 00     
            STA $5e            ; $d36c: 85 5e     
            JMP __d532         ; $d36e: 4c 32 d5  

;-------------------------------------------------------------------------------
__d371:     LDX $d3            ; $d371: a6 d3     
            LDY $d0            ; $d373: a4 d0     
            JSR __e07b         ; $d375: 20 7b e0  
            BEQ __d37e         ; $d378: f0 04     
            CMP #$03           ; $d37a: c9 03     
            BNE __d3b7         ; $d37c: d0 39     
__d37e:     LDA #$01           ; $d37e: a9 01     
            STA $0f            ; $d380: 85 0f     
            LDA #$e0           ; $d382: a9 e0     
            CMP $d3            ; $d384: c5 d3     
            BCC __d3b0         ; $d386: 90 28     
            LDX $d3            ; $d388: a6 d3     
            LDY $d0            ; $d38a: a4 d0     
            JSR __e042         ; $d38c: 20 42 e0  
            LDY #$11           ; $d38f: a0 11     
            LDA ($00),y        ; $d391: b1 00     
            BNE __d3b0         ; $d393: d0 1b     
            LDX $d3            ; $d395: a6 d3     
            LDY $d0            ; $d397: a4 d0     
            JSR __e0ab         ; $d399: 20 ab e0  
            BNE __d3b0         ; $d39c: d0 12     
            LDA $d3            ; $d39e: a5 d3     
            AND #$0f           ; $d3a0: 29 0f     
            BNE __d3b0         ; $d3a2: d0 0c     
            LDA #$81           ; $d3a4: a9 81     
            STA $0f            ; $d3a6: 85 0f     
            LDA #$02           ; $d3a8: a9 02     
            STA $5b            ; $d3aa: 85 5b     
            LDA #$01           ; $d3ac: a9 01     
            STA $5a            ; $d3ae: 85 5a     
__d3b0:     LDA #$01           ; $d3b0: a9 01     
            STA $5e            ; $d3b2: 85 5e     
            JMP __d532         ; $d3b4: 4c 32 d5  

;-------------------------------------------------------------------------------
__d3b7:     LDA #$01           ; $d3b7: a9 01     
            STA $5c            ; $d3b9: 85 5c     
            LDA #$04           ; $d3bb: a9 04     
            STA $0f            ; $d3bd: 85 0f     
            JMP __d532         ; $d3bf: 4c 32 d5  

;-------------------------------------------------------------------------------
__d3c2:     LDA $d0            ; $d3c2: a5 d0     
            CMP $0720          ; $d3c4: cd 20 07  
            BCC __d444         ; $d3c7: 90 7b     
            LDX $d3            ; $d3c9: a6 d3     
            LDY $d0            ; $d3cb: a4 d0     
            JSR __e07b         ; $d3cd: 20 7b e0  
            CMP #$03           ; $d3d0: c9 03     
            BNE __d40d         ; $d3d2: d0 39     
            LDA $d3            ; $d3d4: a5 d3     
            SEC                ; $d3d6: 38        
            SBC $0723          ; $d3d7: ed 23 07  
            JSR __d2a1         ; $d3da: 20 a1 d2  
            CMP #$10           ; $d3dd: c9 10     
            BCC __d3f9         ; $d3df: 90 18     
            LDX $d3            ; $d3e1: a6 d3     
            LDY $d0            ; $d3e3: a4 d0     
            JSR __e0ab         ; $d3e5: 20 ab e0  
            BEQ __d406         ; $d3e8: f0 1c     
            CMP #$03           ; $d3ea: c9 03     
            BEQ __d3f9         ; $d3ec: f0 0b     
            LDA #$01           ; $d3ee: a9 01     
            STA $5c            ; $d3f0: 85 5c     
            LDA #$04           ; $d3f2: a9 04     
            STA $0f            ; $d3f4: 85 0f     
            JMP __d532         ; $d3f6: 4c 32 d5  

;-------------------------------------------------------------------------------
__d3f9:     LDA $d3            ; $d3f9: a5 d3     
            CLC                ; $d3fb: 18        
            ADC #$08           ; $d3fc: 69 08     
            AND #$f0           ; $d3fe: 29 f0     
            TAX                ; $d400: aa        
            LDY $d0            ; $d401: a4 d0     
            JSR __da61         ; $d403: 20 61 da  
__d406:     LDA #$08           ; $d406: a9 08     
            STA $0f            ; $d408: 85 0f     
            JMP __d532         ; $d40a: 4c 32 d5  

;-------------------------------------------------------------------------------
__d40d:     LDX $d3            ; $d40d: a6 d3     
            LDY $d0            ; $d40f: a4 d0     
            JSR __e0ab         ; $d411: 20 ab e0  
            CMP #$03           ; $d414: c9 03     
            BNE __d47b         ; $d416: d0 63     
            LDX $d3            ; $d418: a6 d3     
            LDY $d0            ; $d41a: a4 d0     
            JSR __e042         ; $d41c: 20 42 e0  
            CMP #$03           ; $d41f: c9 03     
            BEQ __d47b         ; $d421: f0 58     
            LDA $50            ; $d423: a5 50     
            BEQ __d42a         ; $d425: f0 03     
            JMP __d324         ; $d427: 4c 24 d3  

;-------------------------------------------------------------------------------
__d42a:     LDA $d3            ; $d42a: a5 d3     
            AND #$0f           ; $d42c: 29 0f     
            BNE __d47b         ; $d42e: d0 4b     
            LDA #$00           ; $d430: a9 00     
            STA $5b            ; $d432: 85 5b     
            LDA #$08           ; $d434: a9 08     
            STA $5a            ; $d436: 85 5a     
            LDA #$8e           ; $d438: a9 8e     
            JSR __da45         ; $d43a: 20 45 da  
            LDA #$80           ; $d43d: a9 80     
            STA $0f            ; $d43f: 85 0f     
            JMP __d532         ; $d441: 4c 32 d5  

;-------------------------------------------------------------------------------
__d444:     LDX $d3            ; $d444: a6 d3     
            LDY $d0            ; $d446: a4 d0     
            JSR __e07b         ; $d448: 20 7b e0  
            CMP #$03           ; $d44b: c9 03     
            BNE __d463         ; $d44d: d0 14     
            LDX $d3            ; $d44f: a6 d3     
            LDY $d0            ; $d451: a4 d0     
            JSR __e042         ; $d453: 20 42 e0  
            BEQ __d45c         ; $d456: f0 04     
            CMP #$03           ; $d458: c9 03     
            BNE __d47b         ; $d45a: d0 1f     
__d45c:     LDA #$04           ; $d45c: a9 04     
            STA $0f            ; $d45e: 85 0f     
            JMP __d532         ; $d460: 4c 32 d5  

;-------------------------------------------------------------------------------
__d463:     LDA $d3            ; $d463: a5 d3     
            AND #$0f           ; $d465: 29 0f     
            BNE __d47b         ; $d467: d0 12     
            LDX $d3            ; $d469: a6 d3     
            LDY $d0            ; $d46b: a4 d0     
            JSR __e042         ; $d46d: 20 42 e0  
            CMP #$03           ; $d470: c9 03     
            BNE __d47b         ; $d472: d0 07     
            LDA #$04           ; $d474: a9 04     
            STA $0f            ; $d476: 85 0f     
            JMP __d532         ; $d478: 4c 32 d5  

;-------------------------------------------------------------------------------
__d47b:     LDA $5e            ; $d47b: a5 5e     
            BNE __d4dd         ; $d47d: d0 5e     
            LDA #$02           ; $d47f: a9 02     
            STA $0f            ; $d481: 85 0f     
            LDA $d3            ; $d483: a5 d3     
            CMP #$08           ; $d485: c9 08     
            BCS __d48c         ; $d487: b0 03     
            JMP __d4d4         ; $d489: 4c d4 d4  

;-------------------------------------------------------------------------------
__d48c:     LDX $d3            ; $d48c: a6 d3     
            LDY $d0            ; $d48e: a4 d0     
            JSR __e042         ; $d490: 20 42 e0  
            LDY #$0f           ; $d493: a0 0f     
            LDA ($00),y        ; $d495: b1 00     
            BNE __d4b4         ; $d497: d0 1b     
            LDX $d3            ; $d499: a6 d3     
            LDY $d0            ; $d49b: a4 d0     
            JSR __e0ab         ; $d49d: 20 ab e0  
            BNE __d4b4         ; $d4a0: d0 12     
            LDA $d3            ; $d4a2: a5 d3     
            AND #$0f           ; $d4a4: 29 0f     
            BNE __d4c7         ; $d4a6: d0 1f     
            LDA #$82           ; $d4a8: a9 82     
            STA $0f            ; $d4aa: 85 0f     
            LDA #$02           ; $d4ac: a9 02     
            STA $5b            ; $d4ae: 85 5b     
            LDA #$02           ; $d4b0: a9 02     
            STA $5a            ; $d4b2: 85 5a     
__d4b4:     LDA $d3            ; $d4b4: a5 d3     
            AND #$0f           ; $d4b6: 29 0f     
            BNE __d4c7         ; $d4b8: d0 0d     
            LDX $d3            ; $d4ba: a6 d3     
            LDY $d0            ; $d4bc: a4 d0     
            JSR __e0bf         ; $d4be: 20 bf e0  
            BEQ __d4c7         ; $d4c1: f0 04     
            CMP #$03           ; $d4c3: c9 03     
            BNE __d4d4         ; $d4c5: d0 0d     
__d4c7:     LDX $d3            ; $d4c7: a6 d3     
            LDA $d0            ; $d4c9: a5 d0     
            AND #$f0           ; $d4cb: 29 f0     
            TAY                ; $d4cd: a8        
            JSR __da61         ; $d4ce: 20 61 da  
            JMP __d532         ; $d4d1: 4c 32 d5  

;-------------------------------------------------------------------------------
__d4d4:     LDA $5e            ; $d4d4: a5 5e     
            EOR #$01           ; $d4d6: 49 01     
            STA $5e            ; $d4d8: 85 5e     
            JMP __d532         ; $d4da: 4c 32 d5  

;-------------------------------------------------------------------------------
__d4dd:     LDA #$01           ; $d4dd: a9 01     
            STA $0f            ; $d4df: 85 0f     
            LDA $d3            ; $d4e1: a5 d3     
            CMP #$e8           ; $d4e3: c9 e8     
            BCC __d4ea         ; $d4e5: 90 03     
            JMP __d4d4         ; $d4e7: 4c d4 d4  

;-------------------------------------------------------------------------------
__d4ea:     LDX $d3            ; $d4ea: a6 d3     
            LDY $d0            ; $d4ec: a4 d0     
            JSR __e042         ; $d4ee: 20 42 e0  
            LDY #$11           ; $d4f1: a0 11     
            LDA ($00),y        ; $d4f3: b1 00     
            BNE __d512         ; $d4f5: d0 1b     
            LDX $d3            ; $d4f7: a6 d3     
            LDY $d0            ; $d4f9: a4 d0     
            JSR __e0ab         ; $d4fb: 20 ab e0  
            BNE __d512         ; $d4fe: d0 12     
            LDA $d3            ; $d500: a5 d3     
            AND #$0f           ; $d502: 29 0f     
            BNE __d525         ; $d504: d0 1f     
            LDA #$81           ; $d506: a9 81     
            STA $0f            ; $d508: 85 0f     
            LDA #$02           ; $d50a: a9 02     
            STA $5b            ; $d50c: 85 5b     
            LDA #$01           ; $d50e: a9 01     
            STA $5a            ; $d510: 85 5a     
__d512:     LDA $d3            ; $d512: a5 d3     
            AND #$0f           ; $d514: 29 0f     
            BNE __d525         ; $d516: d0 0d     
            LDX $d3            ; $d518: a6 d3     
            LDY $d0            ; $d51a: a4 d0     
            JSR __e0c7         ; $d51c: 20 c7 e0  
            BEQ __d525         ; $d51f: f0 04     
            CMP #$03           ; $d521: c9 03     
            BNE __d4d4         ; $d523: d0 af     
__d525:     LDX $d3            ; $d525: a6 d3     
            LDA $d0            ; $d527: a5 d0     
            AND #$f0           ; $d529: 29 f0     
            TAY                ; $d52b: a8        
            JSR __da61         ; $d52c: 20 61 da  
            JMP __d532         ; $d52f: 4c 32 d5  

;-------------------------------------------------------------------------------
__d532:     LDX $c0            ; $d532: a6 c0     
            LDY $c1            ; $d534: a4 c1     
            LDA $0f            ; $d536: a5 0f     
            RTS                ; $d538: 60        

;-------------------------------------------------------------------------------
__d539:     LDX #$58           ; $d539: a2 58     
            LDY #$20           ; $d53b: a0 20     
            JSR __cd34         ; $d53d: 20 34 cd  
            LDA #$00           ; $d540: a9 00     
            STA $9b            ; $d542: 85 9b     
            RTS                ; $d544: 60        

;-------------------------------------------------------------------------------
__d545:     LDA $8f            ; $d545: a5 8f     
            BEQ __d55e         ; $d547: f0 15     
            LDA #$60           ; $d549: a9 60     
            LDY #$40           ; $d54b: a0 40     
            JSR __d1a1         ; $d54d: 20 a1 d1  
            LDA #$60           ; $d550: a9 60     
            LDY #$50           ; $d552: a0 50     
            JSR __d1a1         ; $d554: 20 a1 d1  
            LDA #$60           ; $d557: a9 60     
            LDY #$60           ; $d559: a0 60     
            JSR __d1a1         ; $d55b: 20 a1 d1  
__d55e:     RTS                ; $d55e: 60        

;-------------------------------------------------------------------------------
__d55f:     LDA $e5            ; $d55f: a5 e5     
            BEQ __d568         ; $d561: f0 05     
            LDA $9a            ; $d563: a5 9a     
            BEQ __d578         ; $d565: f0 11     
            RTS                ; $d567: 60        

;-------------------------------------------------------------------------------
__d568:     LDA $9b            ; $d568: a5 9b     
            CLC                ; $d56a: 18        
            ADC #$01           ; $d56b: 69 01     
            STA $9b            ; $d56d: 85 9b     
            CMP #$03           ; $d56f: c9 03     
            BEQ __d574         ; $d571: f0 01     
            RTS                ; $d573: 60        

;-------------------------------------------------------------------------------
__d574:     LDA #$00           ; $d574: a9 00     
            STA $9b            ; $d576: 85 9b     
__d578:     LDA #$60           ; $d578: a9 60     
            STA $06            ; $d57a: 85 06     
            LDA #$00           ; $d57c: a9 00     
            STA $07            ; $d57e: 85 07     
            LDA #$40           ; $d580: a9 40     
            STA $08            ; $d582: 85 08     
            LDA #$07           ; $d584: a9 07     
            STA $09            ; $d586: 85 09     
            LDA #$00           ; $d588: a9 00     
            STA $0d            ; $d58a: 85 0d     
            LDA $2b            ; $d58c: a5 2b     
            STA $49            ; $d58e: 85 49     
            LDA #$00           ; $d590: a9 00     
            STA $e7            ; $d592: 85 e7     
__d594:     LDX #$00           ; $d594: a2 00     
            LDY #$00           ; $d596: a0 00     
__d598:     LDA ($06),y        ; $d598: b1 06     
            STA $58,x          ; $d59a: 95 58     
            INY                ; $d59c: c8        
            INX                ; $d59d: e8        
            CPY #$08           ; $d59e: c0 08     
            BNE __d598         ; $d5a0: d0 f6     
            LDY #$00           ; $d5a2: a0 00     
__d5a4:     LDA ($08),y        ; $d5a4: b1 08     
            STA $00d0,y        ; $d5a6: 99 d0 00  
            INY                ; $d5a9: c8        
            CPY #$10           ; $d5aa: c0 10     
            BNE __d5a4         ; $d5ac: d0 f6     
            LDA $d3            ; $d5ae: a5 d3     
            STA $c2            ; $d5b0: 85 c2     
            LDA $d0            ; $d5b2: a5 d0     
            STA $c3            ; $d5b4: 85 c3     
            JSR __d6f4         ; $d5b6: 20 f4 d6  
            JSR __d679         ; $d5b9: 20 79 d6  
            JSR __d647         ; $d5bc: 20 47 d6  
            JSR __d5f3         ; $d5bf: 20 f3 d5  
            LDX #$00           ; $d5c2: a2 00     
            LDY #$00           ; $d5c4: a0 00     
__d5c6:     LDA $58,x          ; $d5c6: b5 58     
            STA ($06),y        ; $d5c8: 91 06     
            INY                ; $d5ca: c8        
            INX                ; $d5cb: e8        
            CPY #$08           ; $d5cc: c0 08     
            BNE __d5c6         ; $d5ce: d0 f6     
            LDY #$00           ; $d5d0: a0 00     
__d5d2:     LDA $00d0,y        ; $d5d2: b9 d0 00  
            STA ($08),y        ; $d5d5: 91 08     
            INY                ; $d5d7: c8        
            CPY #$10           ; $d5d8: c0 10     
            BNE __d5d2         ; $d5da: d0 f6     
            LDA $06            ; $d5dc: a5 06     
            CLC                ; $d5de: 18        
            ADC #$08           ; $d5df: 69 08     
            STA $06            ; $d5e1: 85 06     
            LDA $08            ; $d5e3: a5 08     
            CLC                ; $d5e5: 18        
            ADC #$10           ; $d5e6: 69 10     
            STA $08            ; $d5e8: 85 08     
            INC $0d            ; $d5ea: e6 0d     
            INC $0d            ; $d5ec: e6 0d     
            DEC $49            ; $d5ee: c6 49     
            BNE __d594         ; $d5f0: d0 a2     
            RTS                ; $d5f2: 60        

;-------------------------------------------------------------------------------
__d5f3:     LDA $5f            ; $d5f3: a5 5f     
            ORA $57            ; $d5f5: 05 57     
            BNE __d646         ; $d5f7: d0 4d     
            LDA $50            ; $d5f9: a5 50     
            BEQ __d646         ; $d5fb: f0 49     
            LDA $8c            ; $d5fd: a5 8c     
            BNE __d646         ; $d5ff: d0 45     
            LDA $d3            ; $d601: a5 d3     
            SEC                ; $d603: 38        
            SBC $0723          ; $d604: ed 23 07  
            JSR __d2a1         ; $d607: 20 a1 d2  
            TAX                ; $d60a: aa        
            LDA $d0            ; $d60b: a5 d0     
            SEC                ; $d60d: 38        
            SBC $0720          ; $d60e: ed 20 07  
            SEC                ; $d611: 38        
            SBC #$10           ; $d612: e9 10     
            JSR __d2a1         ; $d614: 20 a1 d2  
            TAY                ; $d617: a8        
            CPX #$0c           ; $d618: e0 0c     
            BCS __d646         ; $d61a: b0 2a     
            CPY #$08           ; $d61c: c0 08     
            BCS __d646         ; $d61e: b0 26     
            LDX $d3            ; $d620: a6 d3     
            LDA $d0            ; $d622: a5 d0     
            SEC                ; $d624: 38        
            SBC #$08           ; $d625: e9 08     
            TAY                ; $d627: a8        
            JSR __d023         ; $d628: 20 23 d0  
            LDA #$00           ; $d62b: a9 00     
            STA $0712          ; $d62d: 8d 12 07  
            STA $0716          ; $d630: 8d 16 07  
            LDA #$ea           ; $d633: a9 ea     
            JSR __d034         ; $d635: 20 34 d0  
            LDA #$01           ; $d638: a9 01     
            STA $8c            ; $d63a: 85 8c     
            LDA #$00           ; $d63c: a9 00     
            STA $8d            ; $d63e: 85 8d     
            JSR __f0b1         ; $d640: 20 b1 f0  
            JSR __c69c         ; $d643: 20 9c c6  
__d646:     RTS                ; $d646: 60        

;-------------------------------------------------------------------------------
__d647:     LDA $5f            ; $d647: a5 5f     
            ORA $57            ; $d649: 05 57     
            BNE __d678         ; $d64b: d0 2b     
            LDA $d3            ; $d64d: a5 d3     
            SEC                ; $d64f: 38        
            SBC $0723          ; $d650: ed 23 07  
            JSR __d2a1         ; $d653: 20 a1 d2  
            TAX                ; $d656: aa        
            LDA $d0            ; $d657: a5 d0     
            SEC                ; $d659: 38        
            SBC $0720          ; $d65a: ed 20 07  
            JSR __d2a1         ; $d65d: 20 a1 d2  
            TAY                ; $d660: a8        
            CPX #$0a           ; $d661: e0 0a     
            BCS __d678         ; $d663: b0 13     
            CPY #$0a           ; $d665: c0 0a     
            BCS __d678         ; $d667: b0 0f     
__d669:     LDA #$02           ; $d669: a9 02     
            STA $57            ; $d66b: 85 57     
            LDA #$03           ; $d66d: a9 03     
            STA $51            ; $d66f: 85 51     
            LDA #$14           ; $d671: a9 14     
            STA $55            ; $d673: 85 55     
            JSR __f0e8         ; $d675: 20 e8 f0  
__d678:     RTS                ; $d678: 60        

;-------------------------------------------------------------------------------
__d679:     LDA $e7            ; $d679: a5 e7     
            ORA $5f            ; $d67b: 05 5f     
            ORA $58            ; $d67d: 05 58     
            BNE __d6ea         ; $d67f: d0 69     
            LDA #$40           ; $d681: a9 40     
            STA $0a            ; $d683: 85 0a     
            LDA #$07           ; $d685: a9 07     
            STA $0b            ; $d687: 85 0b     
            LDA #$60           ; $d689: a9 60     
            STA $10            ; $d68b: 85 10     
            LDA #$00           ; $d68d: a9 00     
            STA $11            ; $d68f: 85 11     
            LDA $2b            ; $d691: a5 2b     
            STA $0c            ; $d693: 85 0c     
__d695:     LDA $0c            ; $d695: a5 0c     
            CMP $49            ; $d697: c5 49     
            BEQ __d6d8         ; $d699: f0 3d     
            LDY #$07           ; $d69b: a0 07     
            LDA ($10),y        ; $d69d: b1 10     
            BNE __d6d8         ; $d69f: d0 37     
            LDY #$00           ; $d6a1: a0 00     
            LDA ($10),y        ; $d6a3: b1 10     
            BNE __d6d8         ; $d6a5: d0 31     
            LDY #$03           ; $d6a7: a0 03     
            LDA ($0a),y        ; $d6a9: b1 0a     
            SEC                ; $d6ab: 38        
            SBC $d3            ; $d6ac: e5 d3     
            JSR __d2a1         ; $d6ae: 20 a1 d2  
            TAX                ; $d6b1: aa        
            LDY #$00           ; $d6b2: a0 00     
            LDA ($0a),y        ; $d6b4: b1 0a     
            SEC                ; $d6b6: 38        
            SBC $d0            ; $d6b7: e5 d0     
            JSR __d2a1         ; $d6b9: 20 a1 d2  
            TAY                ; $d6bc: a8        
            CPX #$0e           ; $d6bd: e0 0e     
            BCS __d6d8         ; $d6bf: b0 17     
            CPY #$0e           ; $d6c1: c0 0e     
            BCS __d6d8         ; $d6c3: b0 13     
            LDX $c2            ; $d6c5: a6 c2     
            LDY $c3            ; $d6c7: a4 c3     
            JSR __da61         ; $d6c9: 20 61 da  
            LDX $5a            ; $d6cc: a6 5a     
            LDA __d6eb,x       ; $d6ce: bd eb d6  
            STA $5a            ; $d6d1: 85 5a     
            LDA #$01           ; $d6d3: a9 01     
            STA $e7            ; $d6d5: 85 e7     
            RTS                ; $d6d7: 60        

;-------------------------------------------------------------------------------
__d6d8:     LDA $0a            ; $d6d8: a5 0a     
            CLC                ; $d6da: 18        
            ADC #$10           ; $d6db: 69 10     
            STA $0a            ; $d6dd: 85 0a     
            LDA $10            ; $d6df: a5 10     
            CLC                ; $d6e1: 18        
            ADC #$08           ; $d6e2: 69 08     
            STA $10            ; $d6e4: 85 10     
            DEC $0c            ; $d6e6: c6 0c     
            BNE __d695         ; $d6e8: d0 ab     
__d6ea:     RTS                ; $d6ea: 60        

;-------------------------------------------------------------------------------
__d6eb:     BRK                ; $d6eb: 00        
            .hex 02            ; $d6ec: 02        Invalid Opcode - KIL 
            ORA ($00,x)        ; $d6ed: 01 00     
            PHP                ; $d6ef: 08        
            BRK                ; $d6f0: 00        
            BRK                ; $d6f1: 00        
            BRK                ; $d6f2: 00        
            .hex 04            ; $d6f3: 04        Suspected data
__d6f4:     LDA $5f            ; $d6f4: a5 5f     
            BNE __d6fb         ; $d6f6: d0 03     
            JMP __d7a9         ; $d6f8: 4c a9 d7  

;-------------------------------------------------------------------------------
__d6fb:     CMP #$02           ; $d6fb: c9 02     
            BEQ __d779         ; $d6fd: f0 7a     
            DEC $5d            ; $d6ff: c6 5d     
            BEQ __d751         ; $d701: f0 4e     
            LDA $5d            ; $d703: a5 5d     
            LDX #$66           ; $d705: a2 66     
            CMP #$0a           ; $d707: c9 0a     
            BCC __d730         ; $d709: 90 25     
            LDX #$64           ; $d70b: a2 64     
            CMP #$14           ; $d70d: c9 14     
            BCC __d730         ; $d70f: 90 1f     
            LDX #$60           ; $d711: a2 60     
            CMP #$23           ; $d713: c9 23     
            BCC __d730         ; $d715: 90 19     
            LDX #$00           ; $d717: a2 00     
            CMP #$28           ; $d719: c9 28     
            BCC __d72b         ; $d71b: 90 0e     
            LDX #$02           ; $d71d: a2 02     
            CMP #$2d           ; $d71f: c9 2d     
            BCC __d72b         ; $d721: 90 08     
            LDX #$06           ; $d723: a2 06     
            CMP #$63           ; $d725: c9 63     
            BCC __d72b         ; $d727: 90 02     
            LDX #$60           ; $d729: a2 60     
__d72b:     TXA                ; $d72b: 8a        
            JSR __da45         ; $d72c: 20 45 da  
            RTS                ; $d72f: 60        

;-------------------------------------------------------------------------------
__d730:     LDA $e5            ; $d730: a5 e5     
            BEQ __d741         ; $d732: f0 0d     
            LDA #$60           ; $d734: a9 60     
            JSR __da45         ; $d736: 20 45 da  
            LDX #$f8           ; $d739: a2 f8     
            LDY #$f8           ; $d73b: a0 f8     
            JSR __da61         ; $d73d: 20 61 da  
            RTS                ; $d740: 60        

;-------------------------------------------------------------------------------
__d741:     TXA                ; $d741: 8a        
            JSR __da45         ; $d742: 20 45 da  
            LDX $0d            ; $d745: a6 0d     
            LDA $c6,x          ; $d747: b5 c6     
            TAY                ; $d749: a8        
            LDA $c7,x          ; $d74a: b5 c7     
            TAX                ; $d74c: aa        
            JSR __da61         ; $d74d: 20 61 da  
            RTS                ; $d750: 60        

;-------------------------------------------------------------------------------
__d751:     LDA $e5            ; $d751: a5 e5     
            BEQ __d75a         ; $d753: f0 05     
            INC $e5            ; $d755: e6 e5     
            JMP __d778         ; $d757: 4c 78 d7  

;-------------------------------------------------------------------------------
__d75a:     LDA __e935         ; $d75a: ad 35 e9  
            JSR __da45         ; $d75d: 20 45 da  
            LDA #$00           ; $d760: a9 00     
            STA $58            ; $d762: 85 58     
            LDA #$00           ; $d764: a9 00     
            STA $59            ; $d766: 85 59     
            LDA #$04           ; $d768: a9 04     
            STA $5a            ; $d76a: 85 5a     
            LDA #$00           ; $d76c: a9 00     
            STA $5b            ; $d76e: 85 5b     
            LDA #$00           ; $d770: a9 00     
            STA $5c            ; $d772: 85 5c     
            LDA #$00           ; $d774: a9 00     
            STA $5f            ; $d776: 85 5f     
__d778:     RTS                ; $d778: 60        

;-------------------------------------------------------------------------------
__d779:     LDA $5d            ; $d779: a5 5d     
            BEQ __d782         ; $d77b: f0 05     
            DEC $5d            ; $d77d: c6 5d     
            JMP __d794         ; $d77f: 4c 94 d7  

;-------------------------------------------------------------------------------
__d782:     LDX $59            ; $d782: a6 59     
            CPX #$12           ; $d784: e0 12     
            BEQ __d78a         ; $d786: f0 02     
            INC $59            ; $d788: e6 59     
__d78a:     LDA $d0            ; $d78a: a5 d0     
            JSR __d2ab         ; $d78c: 20 ab d2  
            LDX $d3            ; $d78f: a6 d3     
            JSR __da61         ; $d791: 20 61 da  
__d794:     LDA #$6c           ; $d794: a9 6c     
            JSR __da45         ; $d796: 20 45 da  
            LDA $d0            ; $d799: a5 d0     
            CMP #$d8           ; $d79b: c9 d8     
            BCC __d7a8         ; $d79d: 90 09     
            LDA $59            ; $d79f: a5 59     
            CMP #$0b           ; $d7a1: c9 0b     
            BCC __d7a8         ; $d7a3: 90 03     
            JMP __d840         ; $d7a5: 4c 40 d8  

;-------------------------------------------------------------------------------
__d7a8:     RTS                ; $d7a8: 60        

;-------------------------------------------------------------------------------
__d7a9:     LDA $57            ; $d7a9: a5 57     
            BNE __d778         ; $d7ab: d0 cb     
            LDA #$00           ; $d7ad: a9 00     
            STA $48            ; $d7af: 85 48     
            LDX $d3            ; $d7b1: a6 d3     
            LDY $d0            ; $d7b3: a4 d0     
            STX $4a            ; $d7b5: 86 4a     
            STY $4b            ; $d7b7: 84 4b     
            LDA $58            ; $d7b9: a5 58     
            BNE __d829         ; $d7bb: d0 6c     
            CPY #$d0           ; $d7bd: c0 d0     
            BCC __d7c8         ; $d7bf: 90 07     
            CPY #$e0           ; $d7c1: c0 e0     
            BCS __d7c8         ; $d7c3: b0 03     
            JMP __d846         ; $d7c5: 4c 46 d8  

;-------------------------------------------------------------------------------
__d7c8:     JSR __d2bc         ; $d7c8: 20 bc d2  
            AND #$0f           ; $d7cb: 29 0f     
            BEQ __d81b         ; $d7cd: f0 4c     
            PHA                ; $d7cf: 48        
            STA $5a            ; $d7d0: 85 5a     
            CMP #$03           ; $d7d2: c9 03     
            BCC __d80f         ; $d7d4: 90 39     
            LDA #$00           ; $d7d6: a9 00     
            STA $5b            ; $d7d8: 85 5b     
            LDX $d3            ; $d7da: a6 d3     
            LDY $d0            ; $d7dc: a4 d0     
            JSR __e07b         ; $d7de: 20 7b e0  
            CMP #$03           ; $d7e1: c9 03     
            BNE __d808         ; $d7e3: d0 23     
            LDX $d3            ; $d7e5: a6 d3     
            LDY $d0            ; $d7e7: a4 d0     
            JSR __e0bf         ; $d7e9: 20 bf e0  
            CMP #$03           ; $d7ec: c9 03     
            BNE __d7fb         ; $d7ee: d0 0b     
            LDX $d3            ; $d7f0: a6 d3     
            LDY $d0            ; $d7f2: a4 d0     
            JSR __e0c7         ; $d7f4: 20 c7 e0  
            CMP #$03           ; $d7f7: c9 03     
            BEQ __d808         ; $d7f9: f0 0d     
__d7fb:     LDA $d3            ; $d7fb: a5 d3     
            CLC                ; $d7fd: 18        
            ADC #$08           ; $d7fe: 69 08     
            AND #$f0           ; $d800: 29 f0     
            TAX                ; $d802: aa        
            LDY $d0            ; $d803: a4 d0     
            JSR __da61         ; $d805: 20 61 da  
__d808:     LDX $d3            ; $d808: a6 d3     
            LDY $d0            ; $d80a: a4 d0     
            JMP __d817         ; $d80c: 4c 17 d8  

;-------------------------------------------------------------------------------
__d80f:     LDA $5b            ; $d80f: a5 5b     
            CMP #$02           ; $d811: c9 02     
            BEQ __d817         ; $d813: f0 02     
            INC $5b            ; $d815: e6 5b     
__d817:     PLA                ; $d817: 68        
            JMP __d85c         ; $d818: 4c 5c d8  

;-------------------------------------------------------------------------------
__d81b:     LDA #$00           ; $d81b: a9 00     
            STA $5b            ; $d81d: 85 5b     
            LDA $d1            ; $d81f: a5 d1     
            AND #$f8           ; $d821: 29 f8     
            CLC                ; $d823: 18        
            ADC #$06           ; $d824: 69 06     
            JMP __d89c         ; $d826: 4c 9c d8  

;-------------------------------------------------------------------------------
__d829:     LDX $59            ; $d829: a6 59     
            CPX #$12           ; $d82b: e0 12     
            BEQ __d831         ; $d82d: f0 02     
            INC $59            ; $d82f: e6 59     
__d831:     LDA $d0            ; $d831: a5 d0     
            JSR __d2ab         ; $d833: 20 ab d2  
            LDX $d3            ; $d836: a6 d3     
            CPY #$d0           ; $d838: c0 d0     
            BCC __d856         ; $d83a: 90 1a     
            CPY #$e0           ; $d83c: c0 e0     
            BCS __d856         ; $d83e: b0 16     
__d840:     LDA $59            ; $d840: a5 59     
            CMP #$0f           ; $d842: c9 0f     
            BCC __d855         ; $d844: 90 0f     
__d846:     LDA #$01           ; $d846: a9 01     
            STA $5f            ; $d848: 85 5f     
            LDA #$32           ; $d84a: a9 32     
            STA $5d            ; $d84c: 85 5d     
            LDX $d3            ; $d84e: a6 d3     
            LDY #$d8           ; $d850: a0 d8     
            .hex 20 61         ; $d852: 20 61     Suspected data
__d854:     .hex da            ; $d854: da        Invalid Opcode - NOP 
__d855:     RTS                ; $d855: 60        

;-------------------------------------------------------------------------------
__d856:     LDA #$01           ; $d856: a9 01     
            STA $48            ; $d858: 85 48     
            LDA $5a            ; $d85a: a5 5a     
__d85c:     STA $44            ; $d85c: 85 44     
            LDA $d1            ; $d85e: a5 d1     
            STA $45            ; $d860: 85 45     
            LDA $5a            ; $d862: a5 5a     
            STA $46            ; $d864: 85 46     
            LDA #$02           ; $d866: a9 02     
            STA $47            ; $d868: 85 47     
            LDA $58            ; $d86a: a5 58     
            BEQ __d872         ; $d86c: f0 04     
            LDA $5b            ; $d86e: a5 5b     
            STA $47            ; $d870: 85 47     
__d872:     JSR __e0d6         ; $d872: 20 d6 e0  
            LDA $45            ; $d875: a5 45     
            STA $d1            ; $d877: 85 d1     
            LDA $46            ; $d879: a5 46     
            STA $5a            ; $d87b: 85 5a     
            JSR __da61         ; $d87d: 20 61 da  
            LDA $58            ; $d880: a5 58     
            BEQ __d88d         ; $d882: f0 09     
            LDA $d1            ; $d884: a5 d1     
            AND #$fb           ; $d886: 29 fb     
            ORA #$02           ; $d888: 09 02     
            JMP __d89c         ; $d88a: 4c 9c d8  

;-------------------------------------------------------------------------------
__d88d:     LDA $d1            ; $d88d: a5 d1     
            CLC                ; $d88f: 18        
            ADC #$02           ; $d890: 69 02     
            AND #$06           ; $d892: 29 06     
            STA $44            ; $d894: 85 44     
            LDA $d1            ; $d896: a5 d1     
            AND #$f8           ; $d898: 29 f8     
            ORA $44            ; $d89a: 05 44     
__d89c:     JSR __da45         ; $d89c: 20 45 da  
            JSR __d8ac         ; $d89f: 20 ac d8  
            JSR __d922         ; $d8a2: 20 22 d9  
            JSR __d9dd         ; $d8a5: 20 dd d9  
            JSR __da1a         ; $d8a8: 20 1a da  
            RTS                ; $d8ab: 60        

;-------------------------------------------------------------------------------
__d8ac:     LDA $58            ; $d8ac: a5 58     
            BNE __d8e3         ; $d8ae: d0 33     
            LDX $d3            ; $d8b0: a6 d3     
            LDY $d0            ; $d8b2: a4 d0     
            JSR __e042         ; $d8b4: 20 42 e0  
            BEQ __d8e4         ; $d8b7: f0 2b     
            CMP #$03           ; $d8b9: c9 03     
            BEQ __d8e3         ; $d8bb: f0 26     
            LDX $d3            ; $d8bd: a6 d3     
            LDY $d0            ; $d8bf: a4 d0     
            JSR __e08f         ; $d8c1: 20 8f e0  
            CMP #$03           ; $d8c4: c9 03     
            BEQ __d8d9         ; $d8c6: f0 11     
            LDA $5a            ; $d8c8: a5 5a     
            CMP #$04           ; $d8ca: c9 04     
            BNE __d8d9         ; $d8cc: d0 0b     
            LDX $4a            ; $d8ce: a6 4a     
            LDA $d0            ; $d8d0: a5 d0     
            AND #$f8           ; $d8d2: 29 f8     
            TAY                ; $d8d4: a8        
            JSR __da61         ; $d8d5: 20 61 da  
            RTS                ; $d8d8: 60        

;-------------------------------------------------------------------------------
__d8d9:     LDX $d3            ; $d8d9: a6 d3     
            LDA $d0            ; $d8db: a5 d0     
            AND #$f8           ; $d8dd: 29 f8     
            TAY                ; $d8df: a8        
            JSR __da61         ; $d8e0: 20 61 da  
__d8e3:     RTS                ; $d8e3: 60        

;-------------------------------------------------------------------------------
__d8e4:     LDX $d3            ; $d8e4: a6 d3     
            LDY $d0            ; $d8e6: a4 d0     
            JSR __e08f         ; $d8e8: 20 8f e0  
            CMP #$03           ; $d8eb: c9 03     
            BEQ __d8e3         ; $d8ed: f0 f4     
            LDA $5a            ; $d8ef: a5 5a     
            CMP #$03           ; $d8f1: c9 03     
            BCS __d909         ; $d8f3: b0 14     
            LDX $d3            ; $d8f5: a6 d3     
            LDY $d0            ; $d8f7: a4 d0     
            JSR __e08f         ; $d8f9: 20 8f e0  
            BEQ __d909         ; $d8fc: f0 0b     
            CMP #$03           ; $d8fe: c9 03     
            BEQ __d909         ; $d900: f0 07     
            LDX $4a            ; $d902: a6 4a     
            LDY $4b            ; $d904: a4 4b     
            JMP __da61         ; $d906: 4c 61 da  

;-------------------------------------------------------------------------------
__d909:     LDA $5b            ; $d909: a5 5b     
            CMP #$02           ; $d90b: c9 02     
            BCS __d919         ; $d90d: b0 0a     
            LDA $5a            ; $d90f: a5 5a     
            CMP #$08           ; $d911: c9 08     
            BEQ __d919         ; $d913: f0 04     
            LDA #$04           ; $d915: a9 04     
            STA $5a            ; $d917: 85 5a     
__d919:     LDA #$01           ; $d919: a9 01     
            STA $58            ; $d91b: 85 58     
            LDA #$0b           ; $d91d: a9 0b     
            STA $59            ; $d91f: 85 59     
            RTS                ; $d921: 60        

;-------------------------------------------------------------------------------
__d922:     LDA $58            ; $d922: a5 58     
            BEQ __d984         ; $d924: f0 5e     
            LDX $d3            ; $d926: a6 d3     
            LDY $d0            ; $d928: a4 d0     
            JSR __e08f         ; $d92a: 20 8f e0  
            BEQ __d957         ; $d92d: f0 28     
            CMP #$03           ; $d92f: c9 03     
            BEQ __d957         ; $d931: f0 24     
            LDX $4a            ; $d933: a6 4a     
            LDY $4b            ; $d935: a4 4b     
            JSR __da61         ; $d937: 20 61 da  
            LDX $d3            ; $d93a: a6 d3     
            LDY $d0            ; $d93c: a4 d0     
            JSR __e042         ; $d93e: 20 42 e0  
            BNE __d96a         ; $d941: d0 27     
            LDA $d1            ; $d943: a5 d1     
            AND #$fb           ; $d945: 29 fb     
            ORA #$02           ; $d947: 09 02     
            JSR __da45         ; $d949: 20 45 da  
            LDA #$01           ; $d94c: a9 01     
            STA $58            ; $d94e: 85 58     
            LDA #$0b           ; $d950: a9 0b     
            STA $59            ; $d952: 85 59     
            JMP __d980         ; $d954: 4c 80 d9  

;-------------------------------------------------------------------------------
__d957:     LDX $d3            ; $d957: a6 d3     
            LDY $d0            ; $d959: a4 d0     
            JSR __e042         ; $d95b: 20 42 e0  
            BEQ __d984         ; $d95e: f0 24     
            CMP #$07           ; $d960: c9 07     
            BEQ __d985         ; $d962: f0 21     
            LDA $59            ; $d964: a5 59     
            CMP #$0b           ; $d966: c9 0b     
            BCC __d974         ; $d968: 90 0a     
__d96a:     LDX $d3            ; $d96a: a6 d3     
            LDA $d0            ; $d96c: a5 d0     
            AND #$f8           ; $d96e: 29 f8     
            TAY                ; $d970: a8        
            JSR __da61         ; $d971: 20 61 da  
__d974:     LDA #$00           ; $d974: a9 00     
            STA $58            ; $d976: 85 58     
            JSR __d2bc         ; $d978: 20 bc d2  
            AND #$80           ; $d97b: 29 80     
            BEQ __d980         ; $d97d: f0 01     
            RTS                ; $d97f: 60        

;-------------------------------------------------------------------------------
__d980:     LDA #$00           ; $d980: a9 00     
            STA $5b            ; $d982: 85 5b     
__d984:     RTS                ; $d984: 60        

;-------------------------------------------------------------------------------
__d985:     LDX $d3            ; $d985: a6 d3     
            LDA $d0            ; $d987: a5 d0     
            AND #$f0           ; $d989: 29 f0     
            TAY                ; $d98b: a8        
            JSR __da61         ; $d98c: 20 61 da  
            LDA $d3            ; $d98f: a5 d3     
            STA $28            ; $d991: 85 28     
            LDA $d0            ; $d993: a5 d0     
            STA $29            ; $d995: 85 29     
            JSR __d23b         ; $d997: 20 3b d2  
            BNE __d9d3         ; $d99a: d0 37     
            LDX #$00           ; $d99c: a2 00     
            JSR __d2bc         ; $d99e: 20 bc d2  
            AND #$02           ; $d9a1: 29 02     
            BEQ __d9ad         ; $d9a3: f0 08     
            JSR __d9d4         ; $d9a5: 20 d4 d9  
            LDX #$02           ; $d9a8: a2 02     
            JMP __d9b9         ; $d9aa: 4c b9 d9  

;-------------------------------------------------------------------------------
__d9ad:     JSR __d2bc         ; $d9ad: 20 bc d2  
            AND #$01           ; $d9b0: 29 01     
            BEQ __d9b9         ; $d9b2: f0 05     
            JSR __d9d4         ; $d9b4: 20 d4 d9  
            LDX #$01           ; $d9b7: a2 01     
__d9b9:     STX $5a            ; $d9b9: 86 5a     
            LDX #$03           ; $d9bb: a2 03     
            JSR __d2bc         ; $d9bd: 20 bc d2  
            AND #$80           ; $d9c0: 29 80     
            BEQ __d9c6         ; $d9c2: f0 02     
            LDX #$00           ; $d9c4: a2 00     
__d9c6:     STX $59            ; $d9c6: 86 59     
            LDX $d3            ; $d9c8: a6 d3     
            LDA $d0            ; $d9ca: a5 d0     
            CLC                ; $d9cc: 18        
            ADC #$04           ; $d9cd: 69 04     
            TAY                ; $d9cf: a8        
            JSR __da61         ; $d9d0: 20 61 da  
__d9d3:     RTS                ; $d9d3: 60        

;-------------------------------------------------------------------------------
__d9d4:     LDA $5b            ; $d9d4: a5 5b     
            BNE __d9dc         ; $d9d6: d0 04     
            LDA #$01           ; $d9d8: a9 01     
            STA $5b            ; $d9da: 85 5b     
__d9dc:     RTS                ; $d9dc: 60        

;-------------------------------------------------------------------------------
__d9dd:     LDA $58            ; $d9dd: a5 58     
            BNE __da19         ; $d9df: d0 38     
            LDX $d3            ; $d9e1: a6 d3     
            LDY $d0            ; $d9e3: a4 d0     
            JSR __e08f         ; $d9e5: 20 8f e0  
            BEQ __da19         ; $d9e8: f0 2f     
            CMP #$03           ; $d9ea: c9 03     
            BEQ __da19         ; $d9ec: f0 2b     
            LDX $4a            ; $d9ee: a6 4a     
            LDY $4b            ; $d9f0: a4 4b     
            JSR __da61         ; $d9f2: 20 61 da  
            LDA $5e            ; $d9f5: a5 5e     
            EOR #$01           ; $d9f7: 49 01     
            STA $5e            ; $d9f9: 85 5e     
            LDX $d3            ; $d9fb: a6 d3     
            LDY $d0            ; $d9fd: a4 d0     
            JSR __e042         ; $d9ff: 20 42 e0  
            BNE __da19         ; $da02: d0 15     
            LDA $d1            ; $da04: a5 d1     
            AND #$fb           ; $da06: 29 fb     
            ORA #$02           ; $da08: 09 02     
            JSR __da45         ; $da0a: 20 45 da  
            LDA #$01           ; $da0d: a9 01     
            STA $58            ; $da0f: 85 58     
            LDA #$0b           ; $da11: a9 0b     
            STA $59            ; $da13: 85 59     
            LDA #$00           ; $da15: a9 00     
            STA $5b            ; $da17: 85 5b     
__da19:     RTS                ; $da19: 60        

;-------------------------------------------------------------------------------
__da1a:     LDA $58            ; $da1a: a5 58     
            BNE __da44         ; $da1c: d0 26     
            JSR __d2bc         ; $da1e: 20 bc d2  
            AND #$80           ; $da21: 29 80     
            BEQ __da44         ; $da23: f0 1f     
            LDX $d3            ; $da25: a6 d3     
            LDY $d0            ; $da27: a4 d0     
            JSR __e042         ; $da29: 20 42 e0  
            CMP #$01           ; $da2c: c9 01     
            BEQ __da38         ; $da2e: f0 08     
            CMP #$02           ; $da30: c9 02     
            BEQ __da38         ; $da32: f0 04     
            CMP #$07           ; $da34: c9 07     
            BNE __da44         ; $da36: d0 0c     
__da38:     LDA #$01           ; $da38: a9 01     
            STA $58            ; $da3a: 85 58     
            LDA #$03           ; $da3c: a9 03     
            STA $59            ; $da3e: 85 59     
            LDA #$01           ; $da40: a9 01     
            STA $48            ; $da42: 85 48     
__da44:     RTS                ; $da44: 60        

;-------------------------------------------------------------------------------
__da45:     PHA                ; $da45: 48        
            LDA $8f            ; $da46: a5 8f     
            BEQ __da50         ; $da48: f0 06     
            PLA                ; $da4a: 68        
            LDA #$60           ; $da4b: a9 60     
            JMP __da51         ; $da4d: 4c 51 da  

;-------------------------------------------------------------------------------
__da50:     PLA                ; $da50: 68        
__da51:     TAX                ; $da51: aa        
            STX $d1            ; $da52: 86 d1     
            INX                ; $da54: e8        
            STX $d5            ; $da55: 86 d5     
            CLC                ; $da57: 18        
            ADC #$10           ; $da58: 69 10     
            STA $dd            ; $da5a: 85 dd     
            TAX                ; $da5c: aa        
            INX                ; $da5d: e8        
            STX $d9            ; $da5e: 86 d9     
            RTS                ; $da60: 60        

;-------------------------------------------------------------------------------
__da61:     STX $d3            ; $da61: 86 d3     
            STX $df            ; $da63: 86 df     
            TXA                ; $da65: 8a        
            CLC                ; $da66: 18        
            ADC #$08           ; $da67: 69 08     
            STA $d7            ; $da69: 85 d7     
            STA $db            ; $da6b: 85 db     
            STY $d0            ; $da6d: 84 d0     
            STY $d4            ; $da6f: 84 d4     
            TYA                ; $da71: 98        
            CLC                ; $da72: 18        
            ADC #$08           ; $da73: 69 08     
            STA $d8            ; $da75: 85 d8     
            STA $dc            ; $da77: 85 dc     
            RTS                ; $da79: 60        

;-------------------------------------------------------------------------------
__da7a:     LDX #$50           ; $da7a: a2 50     
            LDY #$08           ; $da7c: a0 08     
            JSR __cd34         ; $da7e: 20 34 cd  
            LDA #$00           ; $da81: a9 00     
            STA $9a            ; $da83: 85 9a     
            STA $ec            ; $da85: 85 ec     
            RTS                ; $da87: 60        

;-------------------------------------------------------------------------------
            JSR $4147          ; $da88: 20 47 41  
            EOR $2045          ; $da8b: 4d 45 20  
            JSR $564f          ; $da8e: 20 4f 56  
            EOR $52            ; $da91: 45 52     
            JSR $2000          ; $da93: 20 00 20  
            JSR $4c50          ; $da96: 20 50 4c  
            EOR ($59,x)        ; $da99: 41 59     
            EOR $52            ; $da9b: 45 52     
            JSR $203a          ; $da9d: 20 3a 20  
            JSR $2000          ; $daa0: 20 00 20  
            JSR $4c50          ; $daa3: 20 50 4c  
            EOR ($59,x)        ; $daa6: 41 59     
            EOR $52            ; $daa8: 45 52     
            JSR $203b          ; $daaa: 20 3b 20  
            JSR $2000          ; $daad: 20 00 20  
            JSR $2020          ; $dab0: 20 20 20  
            JSR $2020          ; $dab3: 20 20 20  
            JSR $2020          ; $dab6: 20 20 20  
            JSR $0020          ; $dab9: 20 20 00  
            JSR $4e20          ; $dabc: 20 20 4e  
            .hex 4f 20 42      ; $dabf: 4f 20 42  Invalid Opcode - SRE $4220
            .hex 4f 4e 55      ; $dac2: 4f 4e 55  Invalid Opcode - SRE $554e
            .hex 53 20         ; $dac5: 53 20     Invalid Opcode - SRE ($20),y
            .hex 20 00         ; $dac7: 20 00     Suspected data
__dac9:     LDA $9a            ; $dac9: a5 9a     
            CLC                ; $dacb: 18        
            ADC #$01           ; $dacc: 69 01     
            AND #$01           ; $dace: 29 01     
            STA $9a            ; $dad0: 85 9a     
            BEQ __dad5         ; $dad2: f0 01     
            RTS                ; $dad4: 60        

;-------------------------------------------------------------------------------
__dad5:     LDA #$00           ; $dad5: a9 00     
            STA $9a            ; $dad7: 85 9a     
            LDA $e5            ; $dad9: a5 e5     
            BEQ __dade         ; $dadb: f0 01     
            RTS                ; $dadd: 60        

;-------------------------------------------------------------------------------
__dade:     LDA $57            ; $dade: a5 57     
            BNE __dae5         ; $dae0: d0 03     
            JMP __dc52         ; $dae2: 4c 52 dc  

;-------------------------------------------------------------------------------
__dae5:     CMP #$02           ; $dae5: c9 02     
            BEQ __db1f         ; $dae7: f0 36     
            DEC $55            ; $dae9: c6 55     
            BEQ __db52         ; $daeb: f0 65     
            LDA $55            ; $daed: a5 55     
            CMP #$19           ; $daef: c9 19     
            BNE __daf8         ; $daf1: d0 05     
            PHA                ; $daf3: 48        
            JSR __f182         ; $daf4: 20 82 f1  
            PLA                ; $daf7: 68        
__daf8:     LDX #$60           ; $daf8: a2 60     
            CMP #$23           ; $dafa: c9 23     
            BCC __db0c         ; $dafc: 90 0e     
            LDX #$00           ; $dafe: a2 00     
            CMP #$28           ; $db00: c9 28     
            BCC __db0c         ; $db02: 90 08     
            LDX #$02           ; $db04: a2 02     
            CMP #$2d           ; $db06: c9 2d     
            BCC __db0c         ; $db08: 90 02     
            LDX #$06           ; $db0a: a2 06     
__db0c:     TXA                ; $db0c: 8a        
            JSR __dfe8         ; $db0d: 20 e8 df  
            LDA #$00           ; $db10: a9 00     
            STA $0722          ; $db12: 8d 22 07  
            STA $0726          ; $db15: 8d 26 07  
            STA $072a          ; $db18: 8d 2a 07  
            STA $072e          ; $db1b: 8d 2e 07  
            RTS                ; $db1e: 60        

;-------------------------------------------------------------------------------
__db1f:     LDA $55            ; $db1f: a5 55     
            BEQ __db28         ; $db21: f0 05     
            DEC $55            ; $db23: c6 55     
            JMP __db3c         ; $db25: 4c 3c db  

;-------------------------------------------------------------------------------
__db28:     LDX $51            ; $db28: a6 51     
            CPX #$12           ; $db2a: e0 12     
            BEQ __db30         ; $db2c: f0 02     
            INC $51            ; $db2e: e6 51     
__db30:     LDA $0720          ; $db30: ad 20 07  
            JSR __d2ab         ; $db33: 20 ab d2  
            LDX $0723          ; $db36: ae 23 07  
            JSR __dffc         ; $db39: 20 fc df  
__db3c:     LDA #$6c           ; $db3c: a9 6c     
            JSR __dfe8         ; $db3e: 20 e8 df  
            LDA $0720          ; $db41: ad 20 07  
            CMP #$d8           ; $db44: c9 d8     
            BCC __db51         ; $db46: 90 09     
            LDA $51            ; $db48: a5 51     
            CMP #$0b           ; $db4a: c9 0b     
            BCC __db51         ; $db4c: 90 03     
            JMP __dd2c         ; $db4e: 4c 2c dd  

;-------------------------------------------------------------------------------
__db51:     RTS                ; $db51: 60        

;-------------------------------------------------------------------------------
__db52:     LDA $a7            ; $db52: a5 a7     
            BEQ __db59         ; $db54: f0 03     
            JMP __c1ef         ; $db56: 4c ef c1  

;-------------------------------------------------------------------------------
__db59:     LDA $8f            ; $db59: a5 8f     
            BEQ __db76         ; $db5b: f0 19     
            JSR __efaa         ; $db5d: 20 aa ef  
            LDA #$bc           ; $db60: a9 bc     
            STA $00            ; $db62: 85 00     
            LDA #$da           ; $db64: a9 da     
            STA $01            ; $db66: 85 01     
            LDA #$2a           ; $db68: a9 2a     
            STA $02            ; $db6a: 85 02     
            LDA #$21           ; $db6c: a9 21     
            STA $03            ; $db6e: 85 03     
            JSR __ebd7         ; $db70: 20 d7 eb  
            JMP __dc26         ; $db73: 4c 26 dc  

;-------------------------------------------------------------------------------
__db76:     LDA $e0            ; $db76: a5 e0     
            BNE __dbc1         ; $db78: d0 47     
            DEC $be            ; $db7a: c6 be     
            BPL __dbbe         ; $db7c: 10 40     
            LDA #$ff           ; $db7e: a9 ff     
            STA $e2            ; $db80: 85 e2     
__db82:     JSR __efaa         ; $db82: 20 aa ef  
            LDA #$af           ; $db85: a9 af     
            STA $00            ; $db87: 85 00     
            LDA #$da           ; $db89: a9 da     
            STA $01            ; $db8b: 85 01     
            LDA #$ca           ; $db8d: a9 ca     
            STA $02            ; $db8f: 85 02     
            LDA #$21           ; $db91: a9 21     
            STA $03            ; $db93: 85 03     
            JSR __ebd7         ; $db95: 20 d7 eb  
            LDA #$88           ; $db98: a9 88     
            STA $00            ; $db9a: 85 00     
            LDA #$da           ; $db9c: a9 da     
            STA $01            ; $db9e: 85 01     
            LDA #$ea           ; $dba0: a9 ea     
            STA $02            ; $dba2: 85 02     
            LDA #$21           ; $dba4: a9 21     
            STA $03            ; $dba6: 85 03     
            JSR __ebd7         ; $dba8: 20 d7 eb  
            LDA #$af           ; $dbab: a9 af     
            STA $00            ; $dbad: 85 00     
            LDA #$da           ; $dbaf: a9 da     
            STA $01            ; $dbb1: 85 01     
            LDA #$0a           ; $dbb3: a9 0a     
            STA $02            ; $dbb5: 85 02     
            LDA #$22           ; $dbb7: a9 22     
            STA $03            ; $dbb9: 85 03     
            JSR __ebd7         ; $dbbb: 20 d7 eb  
__dbbe:     JMP __dc26         ; $dbbe: 4c 26 dc  

;-------------------------------------------------------------------------------
__dbc1:     LDA $e1            ; $dbc1: a5 e1     
            BNE __dbe4         ; $dbc3: d0 1f     
            LDA #$01           ; $dbc5: a9 01     
            STA $e1            ; $dbc7: 85 e1     
            DEC $be            ; $dbc9: c6 be     
            BPL __dbbe         ; $dbcb: 10 f1     
            LDA $e2            ; $dbcd: a5 e2     
            ORA #$f0           ; $dbcf: 09 f0     
            STA $e2            ; $dbd1: 85 e2     
            JSR __dc03         ; $dbd3: 20 03 dc  
            LDA #$95           ; $dbd6: a9 95     
            STA $00            ; $dbd8: 85 00     
            LDA #$da           ; $dbda: a9 da     
            STA $01            ; $dbdc: 85 01     
            JSR __dc17         ; $dbde: 20 17 dc  
            JMP __db82         ; $dbe1: 4c 82 db  

;-------------------------------------------------------------------------------
__dbe4:     LDA #$00           ; $dbe4: a9 00     
            STA $e1            ; $dbe6: 85 e1     
            DEC $bf            ; $dbe8: c6 bf     
            BPL __dbbe         ; $dbea: 10 d2     
            LDA $e2            ; $dbec: a5 e2     
            ORA #$0f           ; $dbee: 09 0f     
            STA $e2            ; $dbf0: 85 e2     
            JSR __dc03         ; $dbf2: 20 03 dc  
            LDA #$a2           ; $dbf5: a9 a2     
            STA $00            ; $dbf7: 85 00     
            LDA #$da           ; $dbf9: a9 da     
            STA $01            ; $dbfb: 85 01     
            JSR __dc17         ; $dbfd: 20 17 dc  
            JMP __db82         ; $dc00: 4c 82 db  

;-------------------------------------------------------------------------------
__dc03:     LDA #$af           ; $dc03: a9 af     
            STA $00            ; $dc05: 85 00     
            LDA #$da           ; $dc07: a9 da     
            STA $01            ; $dc09: 85 01     
            LDA #$8a           ; $dc0b: a9 8a     
            STA $02            ; $dc0d: 85 02     
            LDA #$21           ; $dc0f: a9 21     
            STA $03            ; $dc11: 85 03     
            JSR __ebd7         ; $dc13: 20 d7 eb  
            RTS                ; $dc16: 60        

;-------------------------------------------------------------------------------
__dc17:     LDA #$aa           ; $dc17: a9 aa     
            STA $02            ; $dc19: 85 02     
            LDA #$21           ; $dc1b: a9 21     
            STA $03            ; $dc1d: 85 03     
            JSR __ebd7         ; $dc1f: 20 d7 eb  
            JSR __cd21         ; $dc22: 20 21 cd  
            RTS                ; $dc25: 60        

;-------------------------------------------------------------------------------
__dc26:     JSR __cd21         ; $dc26: 20 21 cd  
            LDA #$00           ; $dc29: a9 00     
            STA $8f            ; $dc2b: 85 8f     
            JSR __c270         ; $dc2d: 20 70 c2  
            LDA #$07           ; $dc30: a9 07     
            JSR __c60c         ; $dc32: 20 0c c6  
            LDA $e2            ; $dc35: a5 e2     
            BEQ __dc47         ; $dc37: f0 0e     
            LDA #$14           ; $dc39: a9 14     
            JSR __c60c         ; $dc3b: 20 0c c6  
            LDA $e2            ; $dc3e: a5 e2     
            CMP #$ff           ; $dc40: c9 ff     
            BNE __dc47         ; $dc42: d0 03     
            JMP __c1ef         ; $dc44: 4c ef c1  

;-------------------------------------------------------------------------------
__dc47:     JSR __c262         ; $dc47: 20 62 c2  
            BEQ __dc4f         ; $dc4a: f0 03     
            JMP __c2c2         ; $dc4c: 4c c2 c2  

;-------------------------------------------------------------------------------
__dc4f:     JMP __c308         ; $dc4f: 4c 08 c3  

;-------------------------------------------------------------------------------
__dc52:     LDA #$00           ; $dc52: a9 00     
            STA $48            ; $dc54: 85 48     
            LDX $0723          ; $dc56: ae 23 07  
            LDY $0720          ; $dc59: ac 20 07  
            .hex 86            ; $dc5c: 86        Suspected data
__dc5d:     LSR                ; $dc5d: 4a        
            STY $4b            ; $dc5e: 84 4b     
            LDA $50            ; $dc60: a5 50     
            BEQ __dc67         ; $dc62: f0 03     
            JMP __dd05         ; $dc64: 4c 05 dd  

;-------------------------------------------------------------------------------
__dc67:     CPY #$d0           ; $dc67: c0 d0     
            BCC __dc72         ; $dc69: 90 07     
            CPY #$e0           ; $dc6b: c0 e0     
            BCS __dc72         ; $dc6d: b0 03     
            JMP __dd2c         ; $dc6f: 4c 2c dd  

;-------------------------------------------------------------------------------
__dc72:     LDA $0721          ; $dc72: ad 21 07  
            CMP #$80           ; $dc75: c9 80     
            BCS __dc95         ; $dc77: b0 1c     
            LDA #$4e           ; $dc79: a9 4e     
            JSR __dfe8         ; $dc7b: 20 e8 df  
            INC $a3            ; $dc7e: e6 a3     
            LDA $a3            ; $dc80: a5 a3     
            CMP #$14           ; $dc82: c9 14     
            BCC __dcf2         ; $dc84: 90 6c     
            JSR __c620         ; $dc86: 20 20 c6  
            AND #$c0           ; $dc89: 29 c0     
            BEQ __dcf2         ; $dc8b: f0 65     
            LDA #$86           ; $dc8d: a9 86     
            JSR __dfe8         ; $dc8f: 20 e8 df  
            JMP __dcf2         ; $dc92: 4c f2 dc  

;-------------------------------------------------------------------------------
__dc95:     JSR __c620         ; $dc95: 20 20 c6  
            AND #$0f           ; $dc98: 29 0f     
            BEQ __dcf2         ; $dc9a: f0 56     
            PHA                ; $dc9c: 48        
            STA $52            ; $dc9d: 85 52     
            CMP #$03           ; $dc9f: c9 03     
            BCC __dce6         ; $dca1: 90 43     
            LDA #$00           ; $dca3: a9 00     
            STA $53            ; $dca5: 85 53     
            LDX $0723          ; $dca7: ae 23 07  
            LDY $0720          ; $dcaa: ac 20 07  
            JSR __e056         ; $dcad: 20 56 e0  
            CMP #$03           ; $dcb0: c9 03     
            BNE __dcdd         ; $dcb2: d0 29     
            LDX $0723          ; $dcb4: ae 23 07  
            LDY $0720          ; $dcb7: ac 20 07  
            JSR __e0bf         ; $dcba: 20 bf e0  
            CMP #$03           ; $dcbd: c9 03     
            BNE __dcce         ; $dcbf: d0 0d     
            LDX $0723          ; $dcc1: ae 23 07  
            LDY $0720          ; $dcc4: ac 20 07  
            JSR __e0c7         ; $dcc7: 20 c7 e0  
            CMP #$03           ; $dcca: c9 03     
            BEQ __dcdd         ; $dccc: f0 0f     
__dcce:     LDA $0723          ; $dcce: ad 23 07  
            CLC                ; $dcd1: 18        
            ADC #$08           ; $dcd2: 69 08     
            AND #$f0           ; $dcd4: 29 f0     
            TAX                ; $dcd6: aa        
            LDY $0720          ; $dcd7: ac 20 07  
            JSR __dffc         ; $dcda: 20 fc df  
__dcdd:     LDX $0723          ; $dcdd: ae 23 07  
            LDY $0720          ; $dce0: ac 20 07  
            JMP __dcee         ; $dce3: 4c ee dc  

;-------------------------------------------------------------------------------
__dce6:     LDA $53            ; $dce6: a5 53     
            CMP #$02           ; $dce8: c9 02     
            BEQ __dcee         ; $dcea: f0 02     
            INC $53            ; $dcec: e6 53     
__dcee:     PLA                ; $dcee: 68        
            JMP __dd49         ; $dcef: 4c 49 dd  

;-------------------------------------------------------------------------------
__dcf2:     LDA #$00           ; $dcf2: a9 00     
            STA $53            ; $dcf4: 85 53     
            LDA $0721          ; $dcf6: ad 21 07  
            CMP #$80           ; $dcf9: c9 80     
            BCC __dd02         ; $dcfb: 90 05     
            AND #$f8           ; $dcfd: 29 f8     
            CLC                ; $dcff: 18        
            ADC #$06           ; $dd00: 69 06     
__dd02:     JMP __dd96         ; $dd02: 4c 96 dd  

;-------------------------------------------------------------------------------
__dd05:     LDX $51            ; $dd05: a6 51     
            CPX #$12           ; $dd07: e0 12     
            BNE __dd19         ; $dd09: d0 0e     
            INC $ec            ; $dd0b: e6 ec     
            LDA $ec            ; $dd0d: a5 ec     
            CMP #$05           ; $dd0f: c9 05     
            BNE __dd16         ; $dd11: d0 03     
            JSR __efed         ; $dd13: 20 ed ef  
__dd16:     JMP __dd1b         ; $dd16: 4c 1b dd  

;-------------------------------------------------------------------------------
__dd19:     INC $51            ; $dd19: e6 51     
__dd1b:     LDA $0720          ; $dd1b: ad 20 07  
            JSR __d2ab         ; $dd1e: 20 ab d2  
            LDX $0723          ; $dd21: ae 23 07  
            CPY #$d0           ; $dd24: c0 d0     
            BCC __dd43         ; $dd26: 90 1b     
            CPY #$e0           ; $dd28: c0 e0     
            BCS __dd43         ; $dd2a: b0 17     
__dd2c:     LDA #$01           ; $dd2c: a9 01     
            STA $57            ; $dd2e: 85 57     
            LDA #$32           ; $dd30: a9 32     
            STA $55            ; $dd32: 85 55     
            LDX $0723          ; $dd34: ae 23 07  
            LDY #$d8           ; $dd37: a0 d8     
            JSR __dffc         ; $dd39: 20 fc df  
            LDA #$00           ; $dd3c: a9 00     
            STA $34            ; $dd3e: 85 34     
            STA $3c            ; $dd40: 85 3c     
            RTS                ; $dd42: 60        

;-------------------------------------------------------------------------------
__dd43:     LDA #$01           ; $dd43: a9 01     
            STA $48            ; $dd45: 85 48     
            LDA $52            ; $dd47: a5 52     
__dd49:     STA $44            ; $dd49: 85 44     
            LDA $0721          ; $dd4b: ad 21 07  
            STA $45            ; $dd4e: 85 45     
            LDA $52            ; $dd50: a5 52     
            STA $46            ; $dd52: 85 46     
            LDA #$02           ; $dd54: a9 02     
            STA $47            ; $dd56: 85 47     
            LDA $50            ; $dd58: a5 50     
            BEQ __dd60         ; $dd5a: f0 04     
            LDA $53            ; $dd5c: a5 53     
            STA $47            ; $dd5e: 85 47     
__dd60:     JSR __e0d6         ; $dd60: 20 d6 e0  
            LDA $45            ; $dd63: a5 45     
            STA $0721          ; $dd65: 8d 21 07  
            LDA $46            ; $dd68: a5 46     
            STA $52            ; $dd6a: 85 52     
            JSR __dffc         ; $dd6c: 20 fc df  
            LDA $50            ; $dd6f: a5 50     
            BEQ __dd81         ; $dd71: f0 0e     
            LDA $0721          ; $dd73: ad 21 07  
            CMP #$80           ; $dd76: c9 80     
            BCC __dd96         ; $dd78: 90 1c     
            AND #$fb           ; $dd7a: 29 fb     
            ORA #$02           ; $dd7c: 09 02     
            JMP __dd96         ; $dd7e: 4c 96 dd  

;-------------------------------------------------------------------------------
__dd81:     LDA $0721          ; $dd81: ad 21 07  
            CMP #$80           ; $dd84: c9 80     
            BCC __dd96         ; $dd86: 90 0e     
            CLC                ; $dd88: 18        
            ADC #$02           ; $dd89: 69 02     
            AND #$06           ; $dd8b: 29 06     
            STA $44            ; $dd8d: 85 44     
            LDA $0721          ; $dd8f: ad 21 07  
            AND #$f8           ; $dd92: 29 f8     
            ORA $44            ; $dd94: 05 44     
__dd96:     TAX                ; $dd96: aa        
            LDA $ec            ; $dd97: a5 ec     
            CMP #$07           ; $dd99: c9 07     
            BCC __dda4         ; $dd9b: 90 07     
            AND #$03           ; $dd9d: 29 03     
__dd9f:     TAX                ; $dd9f: aa        
            LDA __ddb5,x       ; $dda0: bd b5 dd  
            TAX                ; $dda3: aa        
__dda4:     TXA                ; $dda4: 8a        
            JSR __dfe8         ; $dda5: 20 e8 df  
            JSR __ddc2         ; $dda8: 20 c2 dd  
            JSR __de47         ; $ddab: 20 47 de  
            JSR __df56         ; $ddae: 20 56 df  
            JSR __df96         ; $ddb1: 20 96 df  
            RTS                ; $ddb4: 60        

;-------------------------------------------------------------------------------
__ddb5:     .hex 44 4e         ; $ddb5: 44 4e     Invalid Opcode - NOP $4e
            LSR $4c            ; $ddb7: 46 4c     
__ddb9:     STX $a6            ; $ddb9: 86 a6     
            LDX $8686          ; $ddbb: ae 86 86  
            STX $86            ; $ddbe: 86 86     
            STX $8e            ; $ddc0: 86 8e     
__ddc2:     LDA $cc            ; $ddc2: a5 cc     
            BNE __de04         ; $ddc4: d0 3e     
            LDA $50            ; $ddc6: a5 50     
            BNE __de04         ; $ddc8: d0 3a     
            LDX $0723          ; $ddca: ae 23 07  
            LDY $0720          ; $ddcd: ac 20 07  
            JSR __e01d         ; $ddd0: 20 1d e0  
            BEQ __de05         ; $ddd3: f0 30     
            CMP #$03           ; $ddd5: c9 03     
            BEQ __de04         ; $ddd7: f0 2b     
            LDX $0723          ; $ddd9: ae 23 07  
            .hex ac            ; $dddc: ac        Suspected data
__dddd:     JSR $2007          ; $dddd: 20 07 20  
            LSR $e0,x          ; $dde0: 56 e0     
            CMP #$03           ; $dde2: c9 03     
            BEQ __ddf8         ; $dde4: f0 12     
            LDA $52            ; $dde6: a5 52     
            CMP #$04           ; $dde8: c9 04     
            BNE __ddf8         ; $ddea: d0 0c     
            LDX $4a            ; $ddec: a6 4a     
            LDA $0720          ; $ddee: ad 20 07  
            AND #$f8           ; $ddf1: 29 f8     
            TAY                ; $ddf3: a8        
            JSR __dffc         ; $ddf4: 20 fc df  
            RTS                ; $ddf7: 60        

;-------------------------------------------------------------------------------
__ddf8:     LDX $0723          ; $ddf8: ae 23 07  
            LDA $0720          ; $ddfb: ad 20 07  
            AND #$f8           ; $ddfe: 29 f8     
            TAY                ; $de00: a8        
            JSR __dffc         ; $de01: 20 fc df  
__de04:     RTS                ; $de04: 60        

;-------------------------------------------------------------------------------
__de05:     LDX $0723          ; $de05: ae 23 07  
            LDY $0720          ; $de08: ac 20 07  
            JSR __e056         ; $de0b: 20 56 e0  
            CMP #$03           ; $de0e: c9 03     
            BEQ __de04         ; $de10: f0 f2     
            LDA $52            ; $de12: a5 52     
            CMP #$03           ; $de14: c9 03     
            BCS __de2e         ; $de16: b0 16     
            LDX $0723          ; $de18: ae 23 07  
            LDY $0720          ; $de1b: ac 20 07  
            JSR __e056         ; $de1e: 20 56 e0  
            BEQ __de2e         ; $de21: f0 0b     
            CMP #$03           ; $de23: c9 03     
            BEQ __de2e         ; $de25: f0 07     
            LDX $4a            ; $de27: a6 4a     
            LDY $4b            ; $de29: a4 4b     
            JMP __dffc         ; $de2b: 4c fc df  

;-------------------------------------------------------------------------------
__de2e:     LDA $53            ; $de2e: a5 53     
            CMP #$02           ; $de30: c9 02     
            BCS __de3e         ; $de32: b0 0a     
            LDA $52            ; $de34: a5 52     
            CMP #$08           ; $de36: c9 08     
            BEQ __de3e         ; $de38: f0 04     
            LDA #$04           ; $de3a: a9 04     
            STA $52            ; $de3c: 85 52     
__de3e:     LDA #$01           ; $de3e: a9 01     
            STA $50            ; $de40: 85 50     
            LDA #$0b           ; $de42: a9 0b     
            STA $51            ; $de44: 85 51     
__de46:     RTS                ; $de46: 60        

;-------------------------------------------------------------------------------
__de47:     LDA $50            ; $de47: a5 50     
            BEQ __de46         ; $de49: f0 fb     
            LDX $0723          ; $de4b: ae 23 07  
            LDY $0720          ; $de4e: ac 20 07  
            JSR __e056         ; $de51: 20 56 e0  
            BEQ __de90         ; $de54: f0 3a     
            CMP #$03           ; $de56: c9 03     
            BEQ __de85         ; $de58: f0 2b     
            LDX $4a            ; $de5a: a6 4a     
            LDY $4b            ; $de5c: a4 4b     
            JSR __dffc         ; $de5e: 20 fc df  
            LDX $0723          ; $de61: ae 23 07  
            LDY $0720          ; $de64: ac 20 07  
            JSR __e01d         ; $de67: 20 1d e0  
            BNE __deac         ; $de6a: d0 40     
            LDA $0721          ; $de6c: ad 21 07  
            CMP #$80           ; $de6f: c9 80     
            BCC __de7a         ; $de71: 90 07     
            AND #$fb           ; $de73: 29 fb     
            ORA #$02           ; $de75: 09 02     
            JSR __dfe8         ; $de77: 20 e8 df  
__de7a:     LDA #$01           ; $de7a: a9 01     
            STA $50            ; $de7c: 85 50     
            LDA #$0b           ; $de7e: a9 0b     
            STA $51            ; $de80: 85 51     
            JMP __ded5         ; $de82: 4c d5 de  

;-------------------------------------------------------------------------------
__de85:     LDX $52            ; $de85: a6 52     
            LDA __ddb9,x       ; $de87: bd b9 dd  
            JSR __dfe8         ; $de8a: 20 e8 df  
            JSR __efe8         ; $de8d: 20 e8 ef  
__de90:     LDX $0723          ; $de90: ae 23 07  
            LDY $0720          ; $de93: ac 20 07  
            JSR __e01d         ; $de96: 20 1d e0  
            BEQ __ded9         ; $de99: f0 3e     
            CMP #$07           ; $de9b: c9 07     
            BEQ __dee9         ; $de9d: f0 4a     
            CMP #$03           ; $de9f: c9 03     
            BEQ __dea6         ; $dea1: f0 03     
            JSR __f128         ; $dea3: 20 28 f1  
__dea6:     LDA $51            ; $dea6: a5 51     
            CMP #$0b           ; $dea8: c9 0b     
            BCC __debb         ; $deaa: 90 0f     
__deac:     LDX $0723          ; $deac: ae 23 07  
            LDA $0720          ; $deaf: ad 20 07  
            AND #$f8           ; $deb2: 29 f8     
            TAY                ; $deb4: a8        
            JSR __dffc         ; $deb5: 20 fc df  
            JSR __cb05         ; $deb8: 20 05 cb  
__debb:     LDA #$00           ; $debb: a9 00     
            STA $50            ; $debd: 85 50     
            STA $ec            ; $debf: 85 ec     
            STA $a3            ; $dec1: 85 a3     
            LDA $0721          ; $dec3: ad 21 07  
            CMP #$80           ; $dec6: c9 80     
            BCC __dede         ; $dec8: 90 14     
            JSR __c620         ; $deca: 20 20 c6  
            AND #$80           ; $decd: 29 80     
            BEQ __ded5         ; $decf: f0 04     
            LDA $24            ; $ded1: a5 24     
            BEQ __deda         ; $ded3: f0 05     
__ded5:     LDA #$00           ; $ded5: a9 00     
            STA $53            ; $ded7: 85 53     
__ded9:     RTS                ; $ded9: 60        

;-------------------------------------------------------------------------------
__deda:     JSR __f10c         ; $deda: 20 0c f1  
            RTS                ; $dedd: 60        

;-------------------------------------------------------------------------------
__dede:     LDA #$ff           ; $dede: a9 ff     
            STA $cd            ; $dee0: 85 cd     
            LDA #$01           ; $dee2: a9 01     
            STA $cc            ; $dee4: 85 cc     
            JMP __ded5         ; $dee6: 4c d5 de  

;-------------------------------------------------------------------------------
__dee9:     LDX $0723          ; $dee9: ae 23 07  
            LDA $0720          ; $deec: ad 20 07  
            AND #$f0           ; $deef: 29 f0     
            TAY                ; $def1: a8        
            JSR __dffc         ; $def2: 20 fc df  
            LDA $0723          ; $def5: ad 23 07  
            STA $28            ; $def8: 85 28     
            LDA $0720          ; $defa: ad 20 07  
            STA $29            ; $defd: 85 29     
            JSR __d23b         ; $deff: 20 3b d2  
            BNE __df4c         ; $df02: d0 48     
            LDX $52            ; $df04: a6 52     
            JSR __c620         ; $df06: 20 20 c6  
            AND #$02           ; $df09: 29 02     
            BEQ __df15         ; $df0b: f0 08     
            JSR __df4d         ; $df0d: 20 4d df  
            LDX #$02           ; $df10: a2 02     
            JMP __df21         ; $df12: 4c 21 df  

;-------------------------------------------------------------------------------
__df15:     JSR __c620         ; $df15: 20 20 c6  
            AND #$01           ; $df18: 29 01     
            BEQ __df21         ; $df1a: f0 05     
            JSR __df4d         ; $df1c: 20 4d df  
            LDX #$01           ; $df1f: a2 01     
__df21:     STX $52            ; $df21: 86 52     
            LDX #$03           ; $df23: a2 03     
            LDA $0721          ; $df25: ad 21 07  
            CMP #$80           ; $df28: c9 80     
            BCC __df3d         ; $df2a: 90 11     
            JSR __c620         ; $df2c: 20 20 c6  
            AND #$80           ; $df2f: 29 80     
            BEQ __df3d         ; $df31: f0 0a     
            LDA $24            ; $df33: a5 24     
            BNE __df3d         ; $df35: d0 06     
            LDA #$01           ; $df37: a9 01     
            STA $24            ; $df39: 85 24     
            LDX #$00           ; $df3b: a2 00     
__df3d:     STX $51            ; $df3d: 86 51     
            LDX $0723          ; $df3f: ae 23 07  
            LDA $0720          ; $df42: ad 20 07  
            CLC                ; $df45: 18        
            ADC #$04           ; $df46: 69 04     
            TAY                ; $df48: a8        
            JSR __dffc         ; $df49: 20 fc df  
__df4c:     RTS                ; $df4c: 60        

;-------------------------------------------------------------------------------
__df4d:     LDA $53            ; $df4d: a5 53     
            BNE __df55         ; $df4f: d0 04     
            LDA #$01           ; $df51: a9 01     
            STA $53            ; $df53: 85 53     
__df55:     RTS                ; $df55: 60        

;-------------------------------------------------------------------------------
__df56:     LDA $50            ; $df56: a5 50     
            BNE __df95         ; $df58: d0 3b     
            LDX $0723          ; $df5a: ae 23 07  
            LDY $0720          ; $df5d: ac 20 07  
            JSR __e056         ; $df60: 20 56 e0  
            BEQ __df95         ; $df63: f0 30     
            CMP #$03           ; $df65: c9 03     
            BEQ __df95         ; $df67: f0 2c     
            LDX $4a            ; $df69: a6 4a     
            LDY $4b            ; $df6b: a4 4b     
            JSR __dffc         ; $df6d: 20 fc df  
            LDX $0723          ; $df70: ae 23 07  
            LDY $0720          ; $df73: ac 20 07  
            JSR __e01d         ; $df76: 20 1d e0  
            BNE __df95         ; $df79: d0 1a     
            LDA $0721          ; $df7b: ad 21 07  
            CMP #$80           ; $df7e: c9 80     
            BCC __df89         ; $df80: 90 07     
            AND #$fb           ; $df82: 29 fb     
            ORA #$02           ; $df84: 09 02     
            JSR __dfe8         ; $df86: 20 e8 df  
__df89:     LDA #$01           ; $df89: a9 01     
            STA $50            ; $df8b: 85 50     
            LDA #$0b           ; $df8d: a9 0b     
            STA $51            ; $df8f: 85 51     
            LDA #$00           ; $df91: a9 00     
            STA $53            ; $df93: 85 53     
__df95:     RTS                ; $df95: 60        

;-------------------------------------------------------------------------------
__df96:     LDA $50            ; $df96: a5 50     
            BNE __dfd4         ; $df98: d0 3a     
            LDA $0721          ; $df9a: ad 21 07  
            CMP #$80           ; $df9d: c9 80     
            BCC __dfd4         ; $df9f: 90 33     
            JSR __c620         ; $dfa1: 20 20 c6  
            AND #$80           ; $dfa4: 29 80     
            BEQ __dfd4         ; $dfa6: f0 2c     
            LDA $24            ; $dfa8: a5 24     
            BNE __dfd4         ; $dfaa: d0 28     
            LDA #$01           ; $dfac: a9 01     
            STA $24            ; $dfae: 85 24     
            LDX $0723          ; $dfb0: ae 23 07  
            LDY $0720          ; $dfb3: ac 20 07  
            JSR __e01d         ; $dfb6: 20 1d e0  
            CMP #$01           ; $dfb9: c9 01     
            BEQ __dfc5         ; $dfbb: f0 08     
            CMP #$02           ; $dfbd: c9 02     
            BEQ __dfc5         ; $dfbf: f0 04     
            CMP #$07           ; $dfc1: c9 07     
            BNE __dfd4         ; $dfc3: d0 0f     
__dfc5:     LDA #$01           ; $dfc5: a9 01     
            STA $50            ; $dfc7: 85 50     
            LDA #$03           ; $dfc9: a9 03     
            STA $51            ; $dfcb: 85 51     
            LDA #$01           ; $dfcd: a9 01     
__dfcf:     STA $48            ; $dfcf: 85 48     
            JSR __f10c         ; $dfd1: 20 0c f1  
__dfd4:     RTS                ; $dfd4: 60        

;-------------------------------------------------------------------------------
__dfd5:     BEQ __dfcf         ; $dfd5: f0 f8     
            SED                ; $dfd7: f8        
            SED                ; $dfd8: f8        
            .hex fb fd fe      ; $dfd9: fb fd fe  Invalid Opcode - ISC __fefd,y
            INC $fffe,x        ; $dfdc: fe fe ff  
            BRK                ; $dfdf: 00        
            BRK                ; $dfe0: 00        
            ORA ($02,x)        ; $dfe1: 01 02     
            .hex 02            ; $dfe3: 02        Invalid Opcode - KIL 
            .hex 02            ; $dfe4: 02        Invalid Opcode - KIL 
            .hex 03 05         ; $dfe5: 03 05     Invalid Opcode - SLO ($05,x)
            PHP                ; $dfe7: 08        
__dfe8:     TAX                ; $dfe8: aa        
            STX $0721          ; $dfe9: 8e 21 07  
            INX                ; $dfec: e8        
            STX $0725          ; $dfed: 8e 25 07  
            CLC                ; $dff0: 18        
            ADC #$10           ; $dff1: 69 10     
            STA $072d          ; $dff3: 8d 2d 07  
            TAX                ; $dff6: aa        
            INX                ; $dff7: e8        
            STX $0729          ; $dff8: 8e 29 07  
            RTS                ; $dffb: 60        

;-------------------------------------------------------------------------------
__dffc:     STX $0723          ; $dffc: 8e 23 07  
            STX $072f          ; $dfff: 8e 2f 07  
            TXA                ; $e002: 8a        
            CLC                ; $e003: 18        
            ADC #$08           ; $e004: 69 08     
            STA $0727          ; $e006: 8d 27 07  
            STA $072b          ; $e009: 8d 2b 07  
            STY $0720          ; $e00c: 8c 20 07  
            STY $0724          ; $e00f: 8c 24 07  
            TYA                ; $e012: 98        
            CLC                ; $e013: 18        
            ADC #$08           ; $e014: 69 08     
            STA $0728          ; $e016: 8d 28 07  
            STA $072c          ; $e019: 8d 2c 07  
            RTS                ; $e01c: 60        

;-------------------------------------------------------------------------------
__e01d:     LDA $53            ; $e01d: a5 53     
            BEQ __e042         ; $e01f: f0 21     
            LDA $0721          ; $e021: ad 21 07  
            CMP #$80           ; $e024: c9 80     
            BCC __e042         ; $e026: 90 1a     
            LDA $52            ; $e028: a5 52     
            CMP #$03           ; $e02a: c9 03     
            BCS __e042         ; $e02c: b0 14     
            CMP #$02           ; $e02e: c9 02     
            BNE __e039         ; $e030: d0 07     
            TXA                ; $e032: 8a        
            CLC                ; $e033: 18        
            ADC #$0b           ; $e034: 69 0b     
            JMP __e03d         ; $e036: 4c 3d e0  

;-------------------------------------------------------------------------------
__e039:     TXA                ; $e039: 8a        
            CLC                ; $e03a: 18        
            ADC #$04           ; $e03b: 69 04     
__e03d:     STA $28            ; $e03d: 85 28     
            JMP __e048         ; $e03f: 4c 48 e0  

;-------------------------------------------------------------------------------
__e042:     TXA                ; $e042: 8a        
            CLC                ; $e043: 18        
            ADC #$08           ; $e044: 69 08     
            STA $28            ; $e046: 85 28     
__e048:     TYA                ; $e048: 98        
            SEC                ; $e049: 38        
            SBC #$20           ; $e04a: e9 20     
            STA $29            ; $e04c: 85 29     
            JSR __e0cf         ; $e04e: 20 cf e0  
            LDY #$10           ; $e051: a0 10     
            LDA ($00),y        ; $e053: b1 00     
            RTS                ; $e055: 60        

;-------------------------------------------------------------------------------
__e056:     LDA $53            ; $e056: a5 53     
            BEQ __e07b         ; $e058: f0 21     
            LDA $0721          ; $e05a: ad 21 07  
            CMP #$80           ; $e05d: c9 80     
            BCC __e07b         ; $e05f: 90 1a     
            LDA $52            ; $e061: a5 52     
            CMP #$03           ; $e063: c9 03     
            BCS __e07b         ; $e065: b0 14     
            CMP #$02           ; $e067: c9 02     
            BNE __e072         ; $e069: d0 07     
            TXA                ; $e06b: 8a        
            CLC                ; $e06c: 18        
            ADC #$06           ; $e06d: 69 06     
            JMP __e076         ; $e06f: 4c 76 e0  

;-------------------------------------------------------------------------------
__e072:     TXA                ; $e072: 8a        
            CLC                ; $e073: 18        
            ADC #$09           ; $e074: 69 09     
__e076:     STA $28            ; $e076: 85 28     
            JMP __e081         ; $e078: 4c 81 e0  

;-------------------------------------------------------------------------------
__e07b:     TXA                ; $e07b: 8a        
            CLC                ; $e07c: 18        
            ADC #$08           ; $e07d: 69 08     
            STA $28            ; $e07f: 85 28     
__e081:     TYA                ; $e081: 98        
            SEC                ; $e082: 38        
            SBC #$18           ; $e083: e9 18     
            STA $29            ; $e085: 85 29     
            JSR __e0cf         ; $e087: 20 cf e0  
            LDY #$00           ; $e08a: a0 00     
            LDA ($00),y        ; $e08c: b1 00     
            RTS                ; $e08e: 60        

;-------------------------------------------------------------------------------
__e08f:     LDA $5b            ; $e08f: a5 5b     
            BEQ __e07b         ; $e091: f0 e8     
            LDA $5a            ; $e093: a5 5a     
            CMP #$03           ; $e095: c9 03     
            BCS __e07b         ; $e097: b0 e2     
            CMP #$02           ; $e099: c9 02     
            BNE __e0a4         ; $e09b: d0 07     
            TXA                ; $e09d: 8a        
            CLC                ; $e09e: 18        
            ADC #$06           ; $e09f: 69 06     
            JMP __e076         ; $e0a1: 4c 76 e0  

;-------------------------------------------------------------------------------
__e0a4:     TXA                ; $e0a4: 8a        
            CLC                ; $e0a5: 18        
            ADC #$0a           ; $e0a6: 69 0a     
            JMP __e076         ; $e0a8: 4c 76 e0  

;-------------------------------------------------------------------------------
__e0ab:     TXA                ; $e0ab: 8a        
            CLC                ; $e0ac: 18        
            .hex 69            ; $e0ad: 69        Suspected data
__e0ae:     PHP                ; $e0ae: 08        
            STA $28            ; $e0af: 85 28     
            TYA                ; $e0b1: 98        
            SEC                ; $e0b2: 38        
            SBC #$28           ; $e0b3: e9 28     
            STA $29            ; $e0b5: 85 29     
            JSR __e0cf         ; $e0b7: 20 cf e0  
            LDY #$00           ; $e0ba: a0 00     
            LDA ($00),y        ; $e0bc: b1 00     
            RTS                ; $e0be: 60        

;-------------------------------------------------------------------------------
__e0bf:     JSR __e07b         ; $e0bf: 20 7b e0  
            DEC $00            ; $e0c2: c6 00     
            LDA ($00),y        ; $e0c4: b1 00     
            RTS                ; $e0c6: 60        

;-------------------------------------------------------------------------------
__e0c7:     JSR __e07b         ; $e0c7: 20 7b e0  
            INC $00            ; $e0ca: e6 00     
            LDA ($00),y        ; $e0cc: b1 00     
            RTS                ; $e0ce: 60        

;-------------------------------------------------------------------------------
__e0cf:     JSR __e8dc         ; $e0cf: 20 dc e8  
            JSR __e36d         ; $e0d2: 20 6d e3  
            RTS                ; $e0d5: 60        

;-------------------------------------------------------------------------------
__e0d6:     LDA $44            ; $e0d6: a5 44     
            AND #$02           ; $e0d8: 29 02     
            BNE __e111         ; $e0da: d0 35     
            LDA $44            ; $e0dc: a5 44     
            AND #$01           ; $e0de: 29 01     
            BNE __e123         ; $e0e0: d0 41     
            LDA $48            ; $e0e2: a5 48     
            BNE __e0f2         ; $e0e4: d0 0c     
            LDA $44            ; $e0e6: a5 44     
            AND #$04           ; $e0e8: 29 04     
            BNE __e102         ; $e0ea: d0 16     
            LDA $44            ; $e0ec: a5 44     
            AND #$08           ; $e0ee: 29 08     
            BNE __e0f3         ; $e0f0: d0 01     
__e0f2:     RTS                ; $e0f2: 60        

;-------------------------------------------------------------------------------
__e0f3:     DEY                ; $e0f3: 88        
            DEY                ; $e0f4: 88        
            LDA $45            ; $e0f5: a5 45     
            AND #$c7           ; $e0f7: 29 c7     
            ORA #$08           ; $e0f9: 09 08     
            STA $45            ; $e0fb: 85 45     
            LDA #$08           ; $e0fd: a9 08     
            STA $46            ; $e0ff: 85 46     
            RTS                ; $e101: 60        

;-------------------------------------------------------------------------------
__e102:     INY                ; $e102: c8        
            INY                ; $e103: c8        
            LDA $45            ; $e104: a5 45     
            AND #$c7           ; $e106: 29 c7     
            ORA #$00           ; $e108: 09 00     
            STA $45            ; $e10a: 85 45     
            LDA #$04           ; $e10c: a9 04     
            STA $46            ; $e10e: 85 46     
            RTS                ; $e110: 60        

;-------------------------------------------------------------------------------
__e111:     TXA                ; $e111: 8a        
            SEC                ; $e112: 38        
            SBC $47            ; $e113: e5 47     
            TAX                ; $e115: aa        
            LDA $45            ; $e116: a5 45     
            AND #$c7           ; $e118: 29 c7     
            ORA #$28           ; $e11a: 09 28     
            STA $45            ; $e11c: 85 45     
            LDA #$02           ; $e11e: a9 02     
            STA $46            ; $e120: 85 46     
            RTS                ; $e122: 60        

;-------------------------------------------------------------------------------
__e123:     TXA                ; $e123: 8a        
            CLC                ; $e124: 18        
            ADC $47            ; $e125: 65 47     
            TAX                ; $e127: aa        
            LDA $45            ; $e128: a5 45     
            AND #$c7           ; $e12a: 29 c7     
            ORA #$20           ; $e12c: 09 20     
            STA $45            ; $e12e: 85 45     
            LDA #$01           ; $e130: a9 01     
            STA $46            ; $e132: 85 46     
            RTS                ; $e134: 60        

;-------------------------------------------------------------------------------
__e135:     LDX #$00           ; $e135: a2 00     
__e137:     LDA __e3ad,x       ; $e137: bd ad e3  
            STA $0280,x        ; $e13a: 9d 80 02  
            INX                ; $e13d: e8        
            CPX #$20           ; $e13e: e0 20     
            BNE __e137         ; $e140: d0 f5     
            LDA #$01           ; $e142: a9 01     
            STA $8e            ; $e144: 85 8e     
            LDA #$01           ; $e146: a9 01     
            STA $e0            ; $e148: 85 e0     
            LDA #$01           ; $e14a: a9 01     
            STA $20            ; $e14c: 85 20     
            LDA #$07           ; $e14e: a9 07     
            STA $28            ; $e150: 85 28     
            LDA #$05           ; $e152: a9 05     
            STA $29            ; $e154: 85 29     
            LDA #$00           ; $e156: a9 00     
            STA $2a            ; $e158: 85 2a     
            JSR __ef4d         ; $e15a: 20 4d ef  
            JSR __e975         ; $e15d: 20 75 e9  
            JSR __e3cd         ; $e160: 20 cd e3  
            JSR __e30f         ; $e163: 20 0f e3  
            JSR __e241         ; $e166: 20 41 e2  
__e169:     JSR __e975         ; $e169: 20 75 e9  
            JSR __e382         ; $e16c: 20 82 e3  
            LDA $9e            ; $e16f: a5 9e     
            BNE __e1ae         ; $e171: d0 3b     
            LDA $9f            ; $e173: a5 9f     
            BNE __e1ae         ; $e175: d0 37     
            LDA #$80           ; $e177: a9 80     
            STA $00            ; $e179: 85 00     
            LDY #$00           ; $e17b: a0 00     
__e17d:     LDA $1a            ; $e17d: a5 1a     
            AND $00            ; $e17f: 25 00     
            BNE __e18c         ; $e181: d0 09     
            INY                ; $e183: c8        
            INY                ; $e184: c8        
            LSR $00            ; $e185: 46 00     
            BCC __e17d         ; $e187: 90 f4     
            JMP __e19f         ; $e189: 4c 9f e1  

;-------------------------------------------------------------------------------
__e18c:     LDA __e1c1,y       ; $e18c: b9 c1 e1  
            STA $00            ; $e18f: 85 00     
            LDA __e1c2,y       ; $e191: b9 c2 e1  
            STA $01            ; $e194: 85 01     
            JSR __e19c         ; $e196: 20 9c e1  
            JMP __e19f         ; $e199: 4c 9f e1  

;-------------------------------------------------------------------------------
__e19c:     JMP ($0000)        ; $e19c: 6c 00 00  

;-------------------------------------------------------------------------------
__e19f:     LDA $1b            ; $e19f: a5 1b     
            AND #$80           ; $e1a1: 29 80     
            BEQ __e1ae         ; $e1a3: f0 09     
            LDA $1b            ; $e1a5: a5 1b     
            AND #$40           ; $e1a7: 29 40     
            BEQ __e1ae         ; $e1a9: f0 03     
            JSR __e202         ; $e1ab: 20 02 e2  
__e1ae:     LDA $1a            ; $e1ae: a5 1a     
            BNE __e169         ; $e1b0: d0 b7     
            LDA $1b            ; $e1b2: a5 1b     
            BNE __e169         ; $e1b4: d0 b3     
            LDA #$00           ; $e1b6: a9 00     
            STA $9e            ; $e1b8: 85 9e     
            LDA #$00           ; $e1ba: a9 00     
            STA $9f            ; $e1bc: 85 9f     
            JMP __e169         ; $e1be: 4c 69 e1  

;-------------------------------------------------------------------------------
__e1c1:     .hex 9d            ; $e1c1: 9d        Suspected data
__e1c2:     .hex e2 15         ; $e1c2: e2 15     Invalid Opcode - NOP #$15
            .hex e2 2e         ; $e1c4: e2 2e     Invalid Opcode - NOP #$2e
            .hex e2 d1         ; $e1c6: e2 d1     Invalid Opcode - NOP #$d1
            SBC ($d7,x)        ; $e1c8: e1 d7     
            .hex e2 e5         ; $e1ca: e2 e5     Invalid Opcode - NOP #$e5
            .hex e2 f3         ; $e1cc: e2 f3     Invalid Opcode - NOP #$f3
            .hex e2 01         ; $e1ce: e2 01     Invalid Opcode - NOP #$01
            .hex e3 a9         ; $e1d0: e3 a9     Invalid Opcode - ISC ($a9,x)
            BRK                ; $e1d2: 00        
            STA $8e            ; $e1d3: 85 8e     
            PLA                ; $e1d5: 68        
            PLA                ; $e1d6: 68        
            RTS                ; $e1d7: 60        

;-------------------------------------------------------------------------------
            LDX $20            ; $e1d8: a6 20     
            CPX #$01           ; $e1da: e0 01     
            BNE __e1e0         ; $e1dc: d0 02     
            LDX #$00           ; $e1de: a2 00     
__e1e0:     INX                ; $e1e0: e8        
            STX $20            ; $e1e1: 86 20     
            LDA #$01           ; $e1e3: a9 01     
            STA $9f            ; $e1e5: 85 9f     
            JSR __e975         ; $e1e7: 20 75 e9  
            JMP __e2b1         ; $e1ea: 4c b1 e2  

;-------------------------------------------------------------------------------
            LDX $20            ; $e1ed: a6 20     
            CPX #$01           ; $e1ef: e0 01     
            BNE __e1f5         ; $e1f1: d0 02     
            LDX #$02           ; $e1f3: a2 02     
__e1f5:     DEX                ; $e1f5: ca        
            STX $20            ; $e1f6: 86 20     
            LDA #$01           ; $e1f8: a9 01     
            STA $9f            ; $e1fa: 85 9f     
            JSR __e975         ; $e1fc: 20 75 e9  
            JMP __e2b1         ; $e1ff: 4c b1 e2  

;-------------------------------------------------------------------------------
__e202:     JSR __e975         ; $e202: 20 75 e9  
            LDX #$00           ; $e205: a2 00     
            TXA                ; $e207: 8a        
__e208:     STA $0600,x        ; $e208: 9d 00 06  
            INX                ; $e20b: e8        
            BNE __e208         ; $e20c: d0 fa     
            LDA #$01           ; $e20e: a9 01     
            STA $9f            ; $e210: 85 9f     
            JMP __e2b1         ; $e212: 4c b1 e2  

;-------------------------------------------------------------------------------
            LDA $1a            ; $e215: a5 1a     
            AND #$0f           ; $e217: 29 0f     
            BNE __e22e         ; $e219: d0 13     
            LDX $2a            ; $e21b: a6 2a     
            CPX #$09           ; $e21d: e0 09     
            BNE __e223         ; $e21f: d0 02     
            LDX #$ff           ; $e221: a2 ff     
__e223:     INX                ; $e223: e8        
            CPX #$04           ; $e224: e0 04     
            BNE __e229         ; $e226: d0 01     
            INX                ; $e228: e8        
__e229:     STX $2a            ; $e229: 86 2a     
            JMP __e241         ; $e22b: 4c 41 e2  

;-------------------------------------------------------------------------------
__e22e:     LDX $2a            ; $e22e: a6 2a     
            CPX #$00           ; $e230: e0 00     
            BNE __e236         ; $e232: d0 02     
            LDX #$0a           ; $e234: a2 0a     
__e236:     DEX                ; $e236: ca        
            CPX #$04           ; $e237: e0 04     
            BNE __e23c         ; $e239: d0 01     
            DEX                ; $e23b: ca        
__e23c:     STX $2a            ; $e23c: 86 2a     
            JMP __e241         ; $e23e: 4c 41 e2  

;-------------------------------------------------------------------------------
__e241:     LDA $2a            ; $e241: a5 2a     
            BNE __e250         ; $e243: d0 0b     
            LDA #$ed           ; $e245: a9 ed     
            STA $00            ; $e247: 85 00     
            LDA #$e8           ; $e249: a9 e8     
            STA $01            ; $e24b: 85 01     
            JMP __e260         ; $e24d: 4c 60 e2  

;-------------------------------------------------------------------------------
__e250:     LDA $2a            ; $e250: a5 2a     
            ASL                ; $e252: 0a        
            ASL                ; $e253: 0a        
            ASL                ; $e254: 0a        
            CLC                ; $e255: 18        
            ADC #$f5           ; $e256: 69 f5     
            STA $00            ; $e258: 85 00     
            LDA #$e8           ; $e25a: a9 e8     
            ADC #$00           ; $e25c: 69 00     
            STA $01            ; $e25e: 85 01     
__e260:     LDY #$00           ; $e260: a0 00     
            LDA ($00),y        ; $e262: b1 00     
            STA $0291          ; $e264: 8d 91 02  
            INY                ; $e267: c8        
            LDA ($00),y        ; $e268: b1 00     
            STA $0295          ; $e26a: 8d 95 02  
            INY                ; $e26d: c8        
            LDA ($00),y        ; $e26e: b1 00     
            STA $0299          ; $e270: 8d 99 02  
            INY                ; $e273: c8        
            LDA ($00),y        ; $e274: b1 00     
            STA $029d          ; $e276: 8d 9d 02  
            LDX #$02           ; $e279: a2 02     
            LDA $2a            ; $e27b: a5 2a     
            CMP #$08           ; $e27d: c9 08     
            BCC __e284         ; $e27f: 90 03     
            AND #$01           ; $e281: 29 01     
            TAX                ; $e283: aa        
__e284:     TXA                ; $e284: 8a        
            STA $0292          ; $e285: 8d 92 02  
            STA $0296          ; $e288: 8d 96 02  
            STA $029a          ; $e28b: 8d 9a 02  
            STA $029e          ; $e28e: 8d 9e 02  
            JSR __e29c         ; $e291: 20 9c e2  
            JSR __c270         ; $e294: 20 70 c2  
            LDA #$01           ; $e297: a9 01     
            STA $9e            ; $e299: 85 9e     
            RTS                ; $e29b: 60        

;-------------------------------------------------------------------------------
__e29c:     RTS                ; $e29c: 60        

;-------------------------------------------------------------------------------
            JSR __e975         ; $e29d: 20 75 e9  
            JSR __e36d         ; $e2a0: 20 6d e3  
            LDY #$00           ; $e2a3: a0 00     
            LDA ($00),y        ; $e2a5: b1 00     
            STA $9d            ; $e2a7: 85 9d     
            LDA $2a            ; $e2a9: a5 2a     
            STA ($00),y        ; $e2ab: 91 00     
            LDA #$01           ; $e2ad: a9 01     
            STA $9e            ; $e2af: 85 9e     
__e2b1:     JSR __c262         ; $e2b1: 20 62 c2  
            BNE __e2ca         ; $e2b4: d0 14     
            LDA #$00           ; $e2b6: a9 00     
            STA $0642          ; $e2b8: 8d 42 06  
            STA $0643          ; $e2bb: 8d 43 06  
            STA $0644          ; $e2be: 8d 44 06  
            STA $0652          ; $e2c1: 8d 52 06  
            STA $0653          ; $e2c4: 8d 53 06  
            STA $0654          ; $e2c7: 8d 54 06  
__e2ca:     JSR __e3cd         ; $e2ca: 20 cd e3  
            JSR __ea13         ; $e2cd: 20 13 ea  
            JSR __e29c         ; $e2d0: 20 9c e2  
            JSR __c270         ; $e2d3: 20 70 c2  
            RTS                ; $e2d6: 60        

;-------------------------------------------------------------------------------
            LDX $29            ; $e2d7: a6 29     
            CPX #$02           ; $e2d9: e0 02     
            BNE __e2df         ; $e2db: d0 02     
            LDX #$0c           ; $e2dd: a2 0c     
__e2df:     DEX                ; $e2df: ca        
            STX $29            ; $e2e0: 86 29     
            JMP __e30f         ; $e2e2: 4c 0f e3  

;-------------------------------------------------------------------------------
            LDX $29            ; $e2e5: a6 29     
            CPX #$0b           ; $e2e7: e0 0b     
            BNE __e2ed         ; $e2e9: d0 02     
            LDX #$01           ; $e2eb: a2 01     
__e2ed:     INX                ; $e2ed: e8        
            STX $29            ; $e2ee: 86 29     
            JMP __e30f         ; $e2f0: 4c 0f e3  

;-------------------------------------------------------------------------------
            LDX $28            ; $e2f3: a6 28     
            CPX #$00           ; $e2f5: e0 00     
            BNE __e2fb         ; $e2f7: d0 02     
            LDX #$10           ; $e2f9: a2 10     
__e2fb:     DEX                ; $e2fb: ca        
            STX $28            ; $e2fc: 86 28     
            JMP __e30f         ; $e2fe: 4c 0f e3  

;-------------------------------------------------------------------------------
            LDX $28            ; $e301: a6 28     
            CPX #$0f           ; $e303: e0 0f     
            BNE __e309         ; $e305: d0 02     
            LDX #$ff           ; $e307: a2 ff     
__e309:     INX                ; $e309: e8        
            STX $28            ; $e30a: 86 28     
            JMP __e30f         ; $e30c: 4c 0f e3  

;-------------------------------------------------------------------------------
__e30f:     LDA $28            ; $e30f: a5 28     
            STA $40            ; $e311: 85 40     
            LDA $29            ; $e313: a5 29     
            STA $42            ; $e315: 85 42     
            ASL $40            ; $e317: 06 40     
            ASL $42            ; $e319: 06 42     
            JSR __e364         ; $e31b: 20 64 e3  
            STY $0280          ; $e31e: 8c 80 02  
            STX $0283          ; $e321: 8e 83 02  
            STY $0290          ; $e324: 8c 90 02  
            STX $0293          ; $e327: 8e 93 02  
            INC $40            ; $e32a: e6 40     
            JSR __e364         ; $e32c: 20 64 e3  
            STY $0284          ; $e32f: 8c 84 02  
            STX $0287          ; $e332: 8e 87 02  
            STY $0294          ; $e335: 8c 94 02  
            STX $0297          ; $e338: 8e 97 02  
            INC $42            ; $e33b: e6 42     
            JSR __e364         ; $e33d: 20 64 e3  
            STY $028c          ; $e340: 8c 8c 02  
            STX $028f          ; $e343: 8e 8f 02  
            STY $029c          ; $e346: 8c 9c 02  
            STX $029f          ; $e349: 8e 9f 02  
            DEC $40            ; $e34c: c6 40     
            JSR __e364         ; $e34e: 20 64 e3  
            STY $0288          ; $e351: 8c 88 02  
            STX $028b          ; $e354: 8e 8b 02  
            STY $0298          ; $e357: 8c 98 02  
            STX $029b          ; $e35a: 8e 9b 02  
            DEC $42            ; $e35d: c6 42     
            LDA #$01           ; $e35f: a9 01     
            STA $9e            ; $e361: 85 9e     
            RTS                ; $e363: 60        

;-------------------------------------------------------------------------------
__e364:     JSR __e8cf         ; $e364: 20 cf e8  
            TYA                ; $e367: 98        
            CLC                ; $e368: 18        
            ADC #$20           ; $e369: 69 20     
            TAY                ; $e36b: a8        
            RTS                ; $e36c: 60        

;-------------------------------------------------------------------------------
__e36d:     LDA $29            ; $e36d: a5 29     
            ASL                ; $e36f: 0a        
            ASL                ; $e370: 0a        
            ASL                ; $e371: 0a        
            ASL                ; $e372: 0a        
            CLC                ; $e373: 18        
            ADC #$40           ; $e374: 69 40     
            CLC                ; $e376: 18        
            ADC $28            ; $e377: 65 28     
            STA $00            ; $e379: 85 00     
            LDA #$06           ; $e37b: a9 06     
            ADC #$00           ; $e37d: 69 00     
            STA $01            ; $e37f: 85 01     
            RTS                ; $e381: 60        

;-------------------------------------------------------------------------------
__e382:     LDX #$00           ; $e382: a2 00     
            LDY #$00           ; $e384: a0 00     
__e386:     LDA $0280,y        ; $e386: b9 80 02  
            STA $0700,x        ; $e389: 9d 00 07  
__e38c:     INX                ; $e38c: e8        
            INY                ; $e38d: c8        
            CPY #$20           ; $e38e: c0 20     
            BNE __e386         ; $e390: d0 f4     
            LDX #$ff           ; $e392: a2 ff     
            INC $4d            ; $e394: e6 4d     
            LDA $4d            ; $e396: a5 4d     
            AND #$7f           ; $e398: 29 7f     
            CMP #$40           ; $e39a: c9 40     
            BCC __e3a0         ; $e39c: 90 02     
            LDX #$20           ; $e39e: a2 20     
__e3a0:     STX $0281          ; $e3a0: 8e 81 02  
            STX $0285          ; $e3a3: 8e 85 02  
            STX $0289          ; $e3a6: 8e 89 02  
            STX $028d          ; $e3a9: 8e 8d 02  
            RTS                ; $e3ac: 60        

;-------------------------------------------------------------------------------
__e3ad:     JSR $01ff          ; $e3ad: 20 ff 01  
            BRK                ; $e3b0: 00        
            JSR $41ff          ; $e3b1: 20 ff 41  
            PHP                ; $e3b4: 08        
            PLP                ; $e3b5: 28        
            .hex ff 81 08      ; $e3b6: ff 81 08  Invalid Opcode - ISC $0881,x
            PLP                ; $e3b9: 28        
            .hex ff c1 00      ; $e3ba: ff c1 00  Bad Addr Mode - ISC $00c1,x
            JSR $0220          ; $e3bd: 20 20 02  
            BRK                ; $e3c0: 00        
            JSR $0220          ; $e3c1: 20 20 02  
            PHP                ; $e3c4: 08        
            PLP                ; $e3c5: 28        
            JSR $0802          ; $e3c6: 20 02 08  
            PLP                ; $e3c9: 28        
            JSR $0002          ; $e3ca: 20 02 00  
__e3cd:     JSR __efaa         ; $e3cd: 20 aa ef  
            JSR __ef6c         ; $e3d0: 20 6c ef  
            LDA #$3f           ; $e3d3: a9 3f     
            STA $2006          ; $e3d5: 8d 06 20  
            LDX #$00           ; $e3d8: a2 00     
            STX $2006          ; $e3da: 8e 06 20  
            LDX #$00           ; $e3dd: a2 00     
__e3df:     LDA __c030,x       ; $e3df: bd 30 c0  
            JSR __c026         ; $e3e2: 20 26 c0  
            INX                ; $e3e5: e8        
            CPX #$20           ; $e3e6: e0 20     
            BNE __e3df         ; $e3e8: d0 f5     
            LDA #$3f           ; $e3ea: a9 3f     
            STA $2006          ; $e3ec: 8d 06 20  
            LDX #$08           ; $e3ef: a2 08     
            STX $2006          ; $e3f1: 8e 06 20  
            LDX $20            ; $e3f4: a6 20     
            DEX                ; $e3f6: ca        
            TXA                ; $e3f7: 8a        
            AND #$03           ; $e3f8: 29 03     
            ASL                ; $e3fa: 0a        
            ASL                ; $e3fb: 0a        
            ASL                ; $e3fc: 0a        
            TAX                ; $e3fd: aa        
            LDY #$08           ; $e3fe: a0 08     
__e400:     LDA __c050,x       ; $e400: bd 50 c0  
            JSR __c026         ; $e403: 20 26 c0  
            INX                ; $e406: e8        
            DEY                ; $e407: 88        
            BNE __e400         ; $e408: d0 f6     
            LDA #$23           ; $e40a: a9 23     
            STA $2006          ; $e40c: 8d 06 20  
            LDX #$c0           ; $e40f: a2 c0     
            STX $2006          ; $e411: 8e 06 20  
            LDY #$40           ; $e414: a0 40     
__e416:     LDA #$00           ; $e416: a9 00     
            JSR __c026         ; $e418: 20 26 c0  
            DEY                ; $e41b: 88        
            BNE __e416         ; $e41c: d0 f8     
            JSR __e5c7         ; $e41e: 20 c7 e5  
            JSR __e5b3         ; $e421: 20 b3 e5  
            LDA #$23           ; $e424: a9 23     
            STA $2006          ; $e426: 8d 06 20  
            LDX #$80           ; $e429: a2 80     
            STX $2006          ; $e42b: 8e 06 20  
            LDX #$20           ; $e42e: a2 20     
__e430:     LDA #$68           ; $e430: a9 68     
            JSR __c026         ; $e432: 20 26 c0  
            DEX                ; $e435: ca        
            BNE __e430         ; $e436: d0 f8     
            LDX #$20           ; $e438: a2 20     
__e43a:     LDA #$78           ; $e43a: a9 78     
            JSR __c026         ; $e43c: 20 26 c0  
            DEX                ; $e43f: ca        
            BNE __e43a         ; $e440: d0 f8     
            LDA #$86           ; $e442: a9 86     
            STA $00            ; $e444: 85 00     
            LDA #$e4           ; $e446: a9 e4     
            STA $01            ; $e448: 85 01     
            JSR __ec28         ; $e44a: 20 28 ec  
            LDA $e0            ; $e44d: a5 e0     
            BEQ __e45c         ; $e44f: f0 0b     
            LDA #$cd           ; $e451: a9 cd     
            STA $00            ; $e453: 85 00     
            LDA #$e4           ; $e455: a9 e4     
            STA $01            ; $e457: 85 01     
            JSR __ec28         ; $e459: 20 28 ec  
__e45c:     JSR __c262         ; $e45c: 20 62 c2  
            BEQ __e46f         ; $e45f: f0 0e     
            LDA #$da           ; $e461: a9 da     
            STA $00            ; $e463: 85 00     
            LDA #$e4           ; $e465: a9 e4     
            STA $01            ; $e467: 85 01     
            JSR __ec28         ; $e469: 20 28 ec  
            JMP __e47a         ; $e46c: 4c 7a e4  

;-------------------------------------------------------------------------------
__e46f:     LDA #$1e           ; $e46f: a9 1e     
            STA $00            ; $e471: 85 00     
            LDA #$e5           ; $e473: a9 e5     
            STA $01            ; $e475: 85 01     
            JSR __ec28         ; $e477: 20 28 ec  
__e47a:     JSR __c269         ; $e47a: 20 69 c2  
            JSR __d545         ; $e47d: 20 45 d5  
            JSR __d1e0         ; $e480: 20 e0 d1  
            JMP __ef76         ; $e483: 4c 76 ef  

;-------------------------------------------------------------------------------
            .hex 63 20         ; $e486: 63 20     Invalid Opcode - RRA ($20,x)
            AND $3030,x        ; $e488: 3d 30 30  
            BMI __e4bd         ; $e48b: 30 30     
            BMI __e4bf         ; $e48d: 30 30     
            JSR $2d2c          ; $e48f: 20 2c 2d  
            ROL $3030          ; $e492: 2e 30 30  
            BMI __e4c7         ; $e495: 30 30     
            BMI __e4c9         ; $e497: 30 30     
            JSR $2020          ; $e499: 20 20 20  
            JSR $2020          ; $e49c: 20 20 20  
            JSR $2020          ; $e49f: 20 20 20  
            BRK                ; $e4a2: 00        
            STY $2220          ; $e4a3: 8c 20 22  
            .hex 2f 3e 3f      ; $e4a6: 2f 3e 3f  Invalid Opcode - RLA $3f3e
            ROL                ; $e4a9: 2a        
            .hex 22            ; $e4aa: 22        Invalid Opcode - KIL 
            .hex 23 24         ; $e4ab: 23 24     Invalid Opcode - RLA ($24,x)
            AND $26            ; $e4ad: 25 26     
            ROL                ; $e4af: 2a        
            .hex 22            ; $e4b0: 22        Invalid Opcode - KIL 
            .hex 5b 5c 5d      ; $e4b1: 5b 5c 5d  Invalid Opcode - SRE $5d5c,y
            .hex 5e 2a 00      ; $e4b4: 5e 2a 00  Bad Addr Mode - LSR $002a,x
            LDY $2920          ; $e4b7: ac 20 29  
            JSR $2030          ; $e4ba: 20 30 20  
__e4bd:     .hex 2b 29         ; $e4bd: 2b 29     Invalid Opcode - ANC #$29
__e4bf:     BMI __e4f1         ; $e4bf: 30 30     
            BMI __e4f3         ; $e4c1: 30 30     
            .hex 2b 29         ; $e4c3: 2b 29     Invalid Opcode - ANC #$29
            .hex 20 30         ; $e4c5: 20 30     Suspected data
__e4c7:     BMI __e4e9         ; $e4c7: 30 20     
__e4c9:     .hex 2b 00         ; $e4c9: 2b 00     Invalid Opcode - ANC #$00
            .hex ff ff 75      ; $e4cb: ff ff 75  Invalid Opcode - ISC $75ff,x
            JSR $3d3c          ; $e4ce: 20 3c 3d  
            BMI __e503         ; $e4d1: 30 30     
            BMI __e505         ; $e4d3: 30 30     
            BMI __e507         ; $e4d5: 30 30     
            BRK                ; $e4d7: 00        
            .hex ff ff 8c      ; $e4d8: ff ff 8c  Invalid Opcode - ISC $8cff,x
            AND ($86,x)        ; $e4db: 21 86     
            .hex 87 87         ; $e4dd: 87 87     Invalid Opcode - SAX $87
            .hex 87 87         ; $e4df: 87 87     Invalid Opcode - SAX $87
            .hex 87 87         ; $e4e1: 87 87     Invalid Opcode - SAX $87
            DEY                ; $e4e3: 88        
            BRK                ; $e4e4: 00        
            LDY $8921          ; $e4e5: ac 21 89  
            TXA                ; $e4e8: 8a        
__e4e9:     .hex 8b 8b         ; $e4e9: 8b 8b     Invalid Opcode - XAA #$8b
            .hex 8b 8b         ; $e4eb: 8b 8b     Invalid Opcode - XAA #$8b
            .hex 8c 99 00      ; $e4ed: 8c 99 00  Bad Addr Mode - STY $0099
            .hex cc            ; $e4f0: cc        Suspected data
__e4f1:     AND ($89,x)        ; $e4f1: 21 89     
__e4f3:     STA $2423          ; $e4f3: 8d 23 24  
            AND $26            ; $e4f6: 25 26     
            .hex 9d 99 00      ; $e4f8: 9d 99 00  Bad Addr Mode - STA $0099,x
            CPX $8921          ; $e4fb: ec 21 89  
            .hex 8d 30         ; $e4fe: 8d 30     Suspected data
__e500:     BMI __e532         ; $e500: 30 30     
            .hex 30            ; $e502: 30        Suspected data
__e503:     .hex 9d 99         ; $e503: 9d 99     Suspected data
__e505:     BRK                ; $e505: 00        
            .hex 0c            ; $e506: 0c        Suspected data
__e507:     .hex 22            ; $e507: 22        Invalid Opcode - KIL 
            .hex 89 9a         ; $e508: 89 9a     Invalid Opcode - NOP #$9a
            .hex 9b            ; $e50a: 9b        Invalid Opcode - TAS 
            .hex 9b            ; $e50b: 9b        Invalid Opcode - TAS 
            .hex 9b            ; $e50c: 9b        Invalid Opcode - TAS 
            .hex 9b            ; $e50d: 9b        Invalid Opcode - TAS 
            .hex 9c 99 00      ; $e50e: 9c 99 00  Bad Addr Mode - SHY $0099,x
            BIT $9622          ; $e511: 2c 22 96  
            .hex 97 97         ; $e514: 97 97     Invalid Opcode - SAX $97,y
            .hex 97 97         ; $e516: 97 97     Invalid Opcode - SAX $97,y
            .hex 97 97         ; $e518: 97 97     Invalid Opcode - SAX $97,y
            TYA                ; $e51a: 98        
            BRK                ; $e51b: 00        
            .hex ff ff 84      ; $e51c: ff ff 84  Invalid Opcode - ISC $84ff,x
            JSR $bbba          ; $e51f: 20 ba bb  
            LDY $bebd,x        ; $e522: bc bd be  
            .hex bf 00 a4      ; $e525: bf 00 a4  Invalid Opcode - LAX $a400,y
            JSR __cbca         ; $e528: 20 ca cb  
            CPY __cecd         ; $e52b: cc cd ce  
            .hex cf 00 c4      ; $e52e: cf 00 c4  Invalid Opcode - DCP __c400
            .hex 20            ; $e531: 20        Suspected data
__e532:     .hex da            ; $e532: da        Invalid Opcode - NOP 
            .hex db dc dd      ; $e533: db dc dd  Invalid Opcode - DCP __dddc,y
            .hex de df 00      ; $e536: de df 00  Bad Addr Mode - DEC $00df,x
            CPX $20            ; $e539: e4 20     
            NOP                ; $e53b: ea        
            .hex eb ec         ; $e53c: eb ec     Invalid Opcode - SBC #$ec
            SBC __efee         ; $e53e: ed ee ef  
            BRK                ; $e541: 00        
            .hex ff ff         ; $e542: ff ff     Suspected data
__e544:     LDX #$0e           ; $e544: a2 0e     
            LDY #$05           ; $e546: a0 05     
            LDA $22            ; $e548: a5 22     
            STA $b6            ; $e54a: 85 b6     
            LDA #$00           ; $e54c: a9 00     
            STA $b7            ; $e54e: 85 b7     
            JSR __c729         ; $e550: 20 29 c7  
            LDX #$12           ; $e553: a2 12     
            LDY #$05           ; $e555: a0 05     
            LDA $21            ; $e557: a5 21     
            STA $b6            ; $e559: 85 b6     
            JSR __e5ab         ; $e55b: 20 ab e5  
            LDX #$19           ; $e55e: a2 19     
            LDY #$05           ; $e560: a0 05     
            LDA $20            ; $e562: a5 20     
            STA $b6            ; $e564: 85 b6     
            JSR __e5ab         ; $e566: 20 ab e5  
            LDA $8f            ; $e569: a5 8f     
            BEQ __e578         ; $e56b: f0 0b     
            LDX #$0e           ; $e56d: a2 0e     
            LDY #$0f           ; $e56f: a0 0f     
            LDA $21            ; $e571: a5 21     
            STA $b6            ; $e573: 85 b6     
            JSR __e5ab         ; $e575: 20 ab e5  
__e578:     RTS                ; $e578: 60        

;-------------------------------------------------------------------------------
__e579:     LDX #$04           ; $e579: a2 04     
            LDY #$03           ; $e57b: a0 03     
            LDA $b8            ; $e57d: a5 b8     
            STA $b6            ; $e57f: 85 b6     
            LDA $b9            ; $e581: a5 b9     
            STA $b7            ; $e583: 85 b7     
            JSR __c70d         ; $e585: 20 0d c7  
            LDX #$0e           ; $e588: a2 0e     
            LDY #$03           ; $e58a: a0 03     
            LDA $ba            ; $e58c: a5 ba     
            STA $b6            ; $e58e: 85 b6     
            LDA $bb            ; $e590: a5 bb     
            STA $b7            ; $e592: 85 b7     
            JSR __c70d         ; $e594: 20 0d c7  
            LDA $e0            ; $e597: a5 e0     
            BEQ __e5aa         ; $e599: f0 0f     
            LDX #$17           ; $e59b: a2 17     
            LDY #$03           ; $e59d: a0 03     
            LDA $bc            ; $e59f: a5 bc     
            STA $b6            ; $e5a1: 85 b6     
            LDA $bd            ; $e5a3: a5 bd     
            STA $b7            ; $e5a5: 85 b7     
            JSR __c70d         ; $e5a7: 20 0d c7  
__e5aa:     RTS                ; $e5aa: 60        

;-------------------------------------------------------------------------------
__e5ab:     LDA #$00           ; $e5ab: a9 00     
            STA $b7            ; $e5ad: 85 b7     
            JSR __c71b         ; $e5af: 20 1b c7  
            RTS                ; $e5b2: 60        

;-------------------------------------------------------------------------------
__e5b3:     LDX #$00           ; $e5b3: a2 00     
__e5b5:     LDA $0600,x        ; $e5b5: bd 00 06  
            CMP #$0a           ; $e5b8: c9 0a     
            BCC __e5c1         ; $e5ba: 90 05     
            LDA #$00           ; $e5bc: a9 00     
            STA $0600,x        ; $e5be: 9d 00 06  
__e5c1:     INX                ; $e5c1: e8        
            CPX #$d0           ; $e5c2: e0 d0     
            BNE __e5b5         ; $e5c4: d0 ef     
            RTS                ; $e5c6: 60        

;-------------------------------------------------------------------------------
__e5c7:     LDA #$40           ; $e5c7: a9 40     
            STA $10            ; $e5c9: 85 10     
            LDA #$06           ; $e5cb: a9 06     
            STA $11            ; $e5cd: 85 11     
            LDA #$c8           ; $e5cf: a9 c8     
            STA $16            ; $e5d1: 85 16     
            LDA #$23           ; $e5d3: a9 23     
            STA $17            ; $e5d5: 85 17     
            LDA #$40           ; $e5d7: a9 40     
            STA $02            ; $e5d9: 85 02     
            LDA #$07           ; $e5db: a9 07     
            STA $03            ; $e5dd: 85 03     
            LDA #$90           ; $e5df: a9 90     
            STA $04            ; $e5e1: 85 04     
            LDA #$07           ; $e5e3: a9 07     
            STA $05            ; $e5e5: 85 05     
            LDA #$e0           ; $e5e7: a9 e0     
            STA $06            ; $e5e9: 85 06     
            LDA #$07           ; $e5eb: a9 07     
            STA $07            ; $e5ed: 85 07     
            LDA #$c6           ; $e5ef: a9 c6     
            STA $08            ; $e5f1: 85 08     
            LDA #$00           ; $e5f3: a9 00     
            STA $09            ; $e5f5: 85 09     
            LDA #$00           ; $e5f7: a9 00     
            STA $2b            ; $e5f9: 85 2b     
            STA $2c            ; $e5fb: 85 2c     
            STA $2d            ; $e5fd: 85 2d     
            STA $2e            ; $e5ff: 85 2e     
            LDX #$0c           ; $e601: a2 0c     
            LDA #$00           ; $e603: a9 00     
__e605:     STA $90,x          ; $e605: 95 90     
            DEX                ; $e607: ca        
            BPL __e605         ; $e608: 10 fb     
            LDA #$04           ; $e60a: a9 04     
            STA $42            ; $e60c: 85 42     
            LDA #$06           ; $e60e: a9 06     
            STA $43            ; $e610: 85 43     
__e612:     LDA #$00           ; $e612: a9 00     
            STA $40            ; $e614: 85 40     
            LDA #$08           ; $e616: a9 08     
            STA $41            ; $e618: 85 41     
__e61a:     JSR __e658         ; $e61a: 20 58 e6  
            INC $10            ; $e61d: e6 10     
            INC $10            ; $e61f: e6 10     
            LDA $40            ; $e621: a5 40     
            CLC                ; $e623: 18        
            ADC #$04           ; $e624: 69 04     
            STA $40            ; $e626: 85 40     
            DEC $41            ; $e628: c6 41     
            BNE __e61a         ; $e62a: d0 ee     
            LDA $10            ; $e62c: a5 10     
            CLC                ; $e62e: 18        
            ADC #$10           ; $e62f: 69 10     
            STA $10            ; $e631: 85 10     
            LDA $42            ; $e633: a5 42     
            CLC                ; $e635: 18        
            ADC #$04           ; $e636: 69 04     
            STA $42            ; $e638: 85 42     
            DEC $43            ; $e63a: c6 43     
            BNE __e612         ; $e63c: d0 d4     
            LDA $2b            ; $e63e: a5 2b     
            BEQ __e653         ; $e640: f0 11     
            LDA $2c            ; $e642: a5 2c     
            BEQ __e653         ; $e644: f0 0d     
            LDA $2d            ; $e646: a5 2d     
            BEQ __e653         ; $e648: f0 09     
            LDA $2e            ; $e64a: a5 2e     
            BEQ __e653         ; $e64c: f0 05     
            LDA #$00           ; $e64e: a9 00     
            STA $0f            ; $e650: 85 0f     
            RTS                ; $e652: 60        

;-------------------------------------------------------------------------------
__e653:     LDA #$01           ; $e653: a9 01     
            STA $0f            ; $e655: 85 0f     
            RTS                ; $e657: 60        

;-------------------------------------------------------------------------------
__e658:     LDA #$00           ; $e658: a9 00     
            STA $44            ; $e65a: 85 44     
            LDY #$00           ; $e65c: a0 00     
            LDA ($10),y        ; $e65e: b1 10     
            JSR __e6c6         ; $e660: 20 c6 e6  
            LDY #$00           ; $e663: a0 00     
            STA ($10),y        ; $e665: 91 10     
            TXA                ; $e667: 8a        
            AND #$03           ; $e668: 29 03     
            ORA $44            ; $e66a: 05 44     
            STA $44            ; $e66c: 85 44     
            INC $40            ; $e66e: e6 40     
            INC $40            ; $e670: e6 40     
            LDY #$01           ; $e672: a0 01     
            LDA ($10),y        ; $e674: b1 10     
            JSR __e6c6         ; $e676: 20 c6 e6  
            LDY #$01           ; $e679: a0 01     
            STA ($10),y        ; $e67b: 91 10     
            TXA                ; $e67d: 8a        
            AND #$0c           ; $e67e: 29 0c     
            ORA $44            ; $e680: 05 44     
            STA $44            ; $e682: 85 44     
            INC $42            ; $e684: e6 42     
            INC $42            ; $e686: e6 42     
            LDY #$11           ; $e688: a0 11     
            LDA ($10),y        ; $e68a: b1 10     
            JSR __e6c6         ; $e68c: 20 c6 e6  
            LDY #$11           ; $e68f: a0 11     
            STA ($10),y        ; $e691: 91 10     
            TXA                ; $e693: 8a        
            AND #$c0           ; $e694: 29 c0     
            ORA $44            ; $e696: 05 44     
            STA $44            ; $e698: 85 44     
            DEC $40            ; $e69a: c6 40     
            DEC $40            ; $e69c: c6 40     
            LDY #$10           ; $e69e: a0 10     
            LDA ($10),y        ; $e6a0: b1 10     
            JSR __e6c6         ; $e6a2: 20 c6 e6  
            LDY #$10           ; $e6a5: a0 10     
            STA ($10),y        ; $e6a7: 91 10     
            TXA                ; $e6a9: 8a        
            AND #$30           ; $e6aa: 29 30     
            ORA $44            ; $e6ac: 05 44     
            STA $44            ; $e6ae: 85 44     
            DEC $42            ; $e6b0: c6 42     
            DEC $42            ; $e6b2: c6 42     
            LDA $17            ; $e6b4: a5 17     
            STA $2006          ; $e6b6: 8d 06 20  
            LDA $16            ; $e6b9: a5 16     
            STA $2006          ; $e6bb: 8d 06 20  
            LDA $44            ; $e6be: a5 44     
            JSR __c026         ; $e6c0: 20 26 c0  
            INC $16            ; $e6c3: e6 16     
            RTS                ; $e6c5: 60        

;-------------------------------------------------------------------------------
__e6c6:     AND #$0f           ; $e6c6: 29 0f     
            STA $4e            ; $e6c8: 85 4e     
            ASL                ; $e6ca: 0a        
            ASL                ; $e6cb: 0a        
            ASL                ; $e6cc: 0a        
            CLC                ; $e6cd: 18        
            ADC #$f5           ; $e6ce: 69 f5     
            STA $12            ; $e6d0: 85 12     
            STA $18            ; $e6d2: 85 18     
            LDA #$e8           ; $e6d4: a9 e8     
            ADC #$00           ; $e6d6: 69 00     
            STA $13            ; $e6d8: 85 13     
            STA $19            ; $e6da: 85 19     
            LDA $4e            ; $e6dc: a5 4e     
            CMP #$04           ; $e6de: c9 04     
            BCC __e6ea         ; $e6e0: 90 08     
            LDA #$f5           ; $e6e2: a9 f5     
            STA $12            ; $e6e4: 85 12     
            LDA #$e8           ; $e6e6: a9 e8     
            STA $13            ; $e6e8: 85 13     
__e6ea:     LDX $40            ; $e6ea: a6 40     
            LDY $42            ; $e6ec: a4 42     
            JSR __e945         ; $e6ee: 20 45 e9  
            LDY #$00           ; $e6f1: a0 00     
            LDA ($12),y        ; $e6f3: b1 12     
            JSR __c026         ; $e6f5: 20 26 c0  
            INY                ; $e6f8: c8        
            LDA ($12),y        ; $e6f9: b1 12     
            JSR __c026         ; $e6fb: 20 26 c0  
            LDX $40            ; $e6fe: a6 40     
            LDY $42            ; $e700: a4 42     
            INY                ; $e702: c8        
            JSR __e945         ; $e703: 20 45 e9  
            LDY #$02           ; $e706: a0 02     
            LDA ($12),y        ; $e708: b1 12     
            JSR __c026         ; $e70a: 20 26 c0  
            INY                ; $e70d: c8        
            LDA ($12),y        ; $e70e: b1 12     
            JSR __c026         ; $e710: 20 26 c0  
            INY                ; $e713: c8        
            LDA ($12),y        ; $e714: b1 12     
            STA $4f            ; $e716: 85 4f     
            JSR __e72a         ; $e718: 20 2a e7  
            CPX #$00           ; $e71b: e0 00     
            BEQ __e725         ; $e71d: f0 06     
            LDA $9d            ; $e71f: a5 9d     
            CMP $4e            ; $e721: c5 4e     
            BNE __e6c6         ; $e723: d0 a1     
__e725:     LDX $4f            ; $e725: a6 4f     
            LDA $4e            ; $e727: a5 4e     
            RTS                ; $e729: 60        

;-------------------------------------------------------------------------------
__e72a:     LDA $4e            ; $e72a: a5 4e     
            CMP #$05           ; $e72c: c9 05     
            BNE __e733         ; $e72e: d0 03     
            JMP __e796         ; $e730: 4c 96 e7  

;-------------------------------------------------------------------------------
__e733:     CMP #$06           ; $e733: c9 06     
            BNE __e73a         ; $e735: d0 03     
            JMP __e796         ; $e737: 4c 96 e7  

;-------------------------------------------------------------------------------
__e73a:     CMP #$07           ; $e73a: c9 07     
            BNE __e741         ; $e73c: d0 03     
            JMP __e7bb         ; $e73e: 4c bb e7  

;-------------------------------------------------------------------------------
__e741:     CMP #$08           ; $e741: c9 08     
            BNE __e748         ; $e743: d0 03     
            JMP __e752         ; $e745: 4c 52 e7  

;-------------------------------------------------------------------------------
__e748:     CMP #$09           ; $e748: c9 09     
            BNE __e74f         ; $e74a: d0 03     
            JMP __e871         ; $e74c: 4c 71 e8  

;-------------------------------------------------------------------------------
__e74f:     LDX #$00           ; $e74f: a2 00     
            RTS                ; $e751: 60        

;-------------------------------------------------------------------------------
__e752:     LDA $2b            ; $e752: a5 2b     
            CMP #$03           ; $e754: c9 03     
            BNE __e75b         ; $e756: d0 03     
            JMP __e7e0         ; $e758: 4c e0 e7  

;-------------------------------------------------------------------------------
__e75b:     JSR __e7eb         ; $e75b: 20 eb e7  
            CMP #$02           ; $e75e: c9 02     
            BNE __e765         ; $e760: d0 03     
            JMP __e7e0         ; $e762: 4c e0 e7  

;-------------------------------------------------------------------------------
__e765:     INC $2b            ; $e765: e6 2b     
            LDA $02            ; $e767: a5 02     
            STA $0a            ; $e769: 85 0a     
            LDA $03            ; $e76b: a5 03     
            STA $0b            ; $e76d: 85 0b     
            JSR __e7f5         ; $e76f: 20 f5 e7  
            LDA $0a            ; $e772: a5 0a     
            STA $02            ; $e774: 85 02     
            LDA $0b            ; $e776: a5 0b     
            STA $03            ; $e778: 85 03     
            LDY #$00           ; $e77a: a0 00     
            LDA $42            ; $e77c: a5 42     
            ASL                ; $e77e: 0a        
            ASL                ; $e77f: 0a        
            ASL                ; $e780: 0a        
            STA ($08),y        ; $e781: 91 08     
            LDY #$01           ; $e783: a0 01     
            LDA $40            ; $e785: a5 40     
            ASL                ; $e787: 0a        
            ASL                ; $e788: 0a        
            ASL                ; $e789: 0a        
            STA ($08),y        ; $e78a: 91 08     
            LDA $08            ; $e78c: a5 08     
            CLC                ; $e78e: 18        
            ADC #$02           ; $e78f: 69 02     
            STA $08            ; $e791: 85 08     
            JMP __e7e3         ; $e793: 4c e3 e7  

;-------------------------------------------------------------------------------
__e796:     LDA $2c            ; $e796: a5 2c     
            CMP #$05           ; $e798: c9 05     
            BEQ __e7e0         ; $e79a: f0 44     
            JSR __e7eb         ; $e79c: 20 eb e7  
            CMP #$02           ; $e79f: c9 02     
            BEQ __e7e0         ; $e7a1: f0 3d     
            INC $2c            ; $e7a3: e6 2c     
            LDA $04            ; $e7a5: a5 04     
            STA $0a            ; $e7a7: 85 0a     
            LDA $05            ; $e7a9: a5 05     
            STA $0b            ; $e7ab: 85 0b     
            JSR __e7f5         ; $e7ad: 20 f5 e7  
            LDA $0a            ; $e7b0: a5 0a     
            STA $04            ; $e7b2: 85 04     
            LDA $0b            ; $e7b4: a5 0b     
            STA $05            ; $e7b6: 85 05     
            JMP __e7e3         ; $e7b8: 4c e3 e7  

;-------------------------------------------------------------------------------
__e7bb:     LDA $2d            ; $e7bb: a5 2d     
            CMP #$02           ; $e7bd: c9 02     
            BEQ __e7e0         ; $e7bf: f0 1f     
            JSR __e7eb         ; $e7c1: 20 eb e7  
            CMP #$02           ; $e7c4: c9 02     
            BEQ __e7e0         ; $e7c6: f0 18     
            INC $2d            ; $e7c8: e6 2d     
            LDA $06            ; $e7ca: a5 06     
            STA $0a            ; $e7cc: 85 0a     
            LDA $07            ; $e7ce: a5 07     
__e7d0:     STA $0b            ; $e7d0: 85 0b     
            JSR __e7f5         ; $e7d2: 20 f5 e7  
            LDA $0a            ; $e7d5: a5 0a     
            STA $06            ; $e7d7: 85 06     
            LDA $0b            ; $e7d9: a5 0b     
            STA $07            ; $e7db: 85 07     
            JMP __e7e3         ; $e7dd: 4c e3 e7  

;-------------------------------------------------------------------------------
__e7e0:     LDX #$01           ; $e7e0: a2 01     
            RTS                ; $e7e2: 60        

;-------------------------------------------------------------------------------
__e7e3:     JSR __e7eb         ; $e7e3: 20 eb e7  
            INC $90,x          ; $e7e6: f6 90     
            LDX #$00           ; $e7e8: a2 00     
            RTS                ; $e7ea: 60        

;-------------------------------------------------------------------------------
__e7eb:     LDA $42            ; $e7eb: a5 42     
            SEC                ; $e7ed: 38        
            SBC #$04           ; $e7ee: e9 04     
            LSR                ; $e7f0: 4a        
            TAX                ; $e7f1: aa        
            LDA $90,x          ; $e7f2: b5 90     
            RTS                ; $e7f4: 60        

;-------------------------------------------------------------------------------
__e7f5:     JSR __e8cf         ; $e7f5: 20 cf e8  
            LDY #$00           ; $e7f8: a0 00     
            STA ($0a),y        ; $e7fa: 91 0a     
            LDY #$03           ; $e7fc: a0 03     
            TXA                ; $e7fe: 8a        
            STA ($0a),y        ; $e7ff: 91 0a     
            INC $40            ; $e801: e6 40     
            JSR __e8cf         ; $e803: 20 cf e8  
            LDY #$04           ; $e806: a0 04     
            STA ($0a),y        ; $e808: 91 0a     
            LDY #$07           ; $e80a: a0 07     
            TXA                ; $e80c: 8a        
            STA ($0a),y        ; $e80d: 91 0a     
            INC $42            ; $e80f: e6 42     
            JSR __e8cf         ; $e811: 20 cf e8  
            LDY #$08           ; $e814: a0 08     
            STA ($0a),y        ; $e816: 91 0a     
            LDY #$0b           ; $e818: a0 0b     
            TXA                ; $e81a: 8a        
            STA ($0a),y        ; $e81b: 91 0a     
            DEC $40            ; $e81d: c6 40     
            JSR __e8cf         ; $e81f: 20 cf e8  
            LDY #$0c           ; $e822: a0 0c     
            STA ($0a),y        ; $e824: 91 0a     
            LDY #$0f           ; $e826: a0 0f     
            TXA                ; $e828: 8a        
            STA ($0a),y        ; $e829: 91 0a     
            DEC $42            ; $e82b: c6 42     
            LDY #$00           ; $e82d: a0 00     
            LDA ($18),y        ; $e82f: b1 18     
            LDY #$01           ; $e831: a0 01     
            STA ($0a),y        ; $e833: 91 0a     
            LDY #$01           ; $e835: a0 01     
            LDA ($18),y        ; $e837: b1 18     
            LDY #$05           ; $e839: a0 05     
            STA ($0a),y        ; $e83b: 91 0a     
            LDY #$03           ; $e83d: a0 03     
            LDA ($18),y        ; $e83f: b1 18     
            LDY #$09           ; $e841: a0 09     
            STA ($0a),y        ; $e843: 91 0a     
            LDY #$02           ; $e845: a0 02     
            LDA ($18),y        ; $e847: b1 18     
            LDY #$0d           ; $e849: a0 0d     
            STA ($0a),y        ; $e84b: 91 0a     
            LDY #$04           ; $e84d: a0 04     
            LDA ($18),y        ; $e84f: b1 18     
            AND #$03           ; $e851: 29 03     
            LDY #$02           ; $e853: a0 02     
            STA ($0a),y        ; $e855: 91 0a     
            LDY #$06           ; $e857: a0 06     
            STA ($0a),y        ; $e859: 91 0a     
            LDY #$0a           ; $e85b: a0 0a     
            STA ($0a),y        ; $e85d: 91 0a     
            LDY #$0e           ; $e85f: a0 0e     
            STA ($0a),y        ; $e861: 91 0a     
            LDA $0a            ; $e863: a5 0a     
            CLC                ; $e865: 18        
            ADC #$10           ; $e866: 69 10     
            STA $0a            ; $e868: 85 0a     
            LDA $0b            ; $e86a: a5 0b     
            ADC #$00           ; $e86c: 69 00     
            STA $0b            ; $e86e: 85 0b     
            RTS                ; $e870: 60        

;-------------------------------------------------------------------------------
__e871:     LDA $2e            ; $e871: a5 2e     
            BEQ __e878         ; $e873: f0 03     
            JMP __e7e0         ; $e875: 4c e0 e7  

;-------------------------------------------------------------------------------
__e878:     JSR __e7eb         ; $e878: 20 eb e7  
            CMP #$02           ; $e87b: c9 02     
            BNE __e882         ; $e87d: d0 03     
            JMP __e7e0         ; $e87f: 4c e0 e7  

;-------------------------------------------------------------------------------
__e882:     INC $2e            ; $e882: e6 2e     
            JSR __e8cf         ; $e884: 20 cf e8  
            STA $0720          ; $e887: 8d 20 07  
            STX $0723          ; $e88a: 8e 23 07  
            INC $40            ; $e88d: e6 40     
            JSR __e8cf         ; $e88f: 20 cf e8  
            STA $0724          ; $e892: 8d 24 07  
            STX $0727          ; $e895: 8e 27 07  
            INC $42            ; $e898: e6 42     
            JSR __e8cf         ; $e89a: 20 cf e8  
            STA $0728          ; $e89d: 8d 28 07  
            STX $072b          ; $e8a0: 8e 2b 07  
            DEC $40            ; $e8a3: c6 40     
            JSR __e8cf         ; $e8a5: 20 cf e8  
            STA $072c          ; $e8a8: 8d 2c 07  
            STX $072f          ; $e8ab: 8e 2f 07  
            DEC $42            ; $e8ae: c6 42     
            LDA #$60           ; $e8b0: a9 60     
            JSR __dfe8         ; $e8b2: 20 e8 df  
            LDA $8e            ; $e8b5: a5 8e     
            BEQ __e8be         ; $e8b7: f0 05     
            LDA #$86           ; $e8b9: a9 86     
            JSR __dfe8         ; $e8bb: 20 e8 df  
__e8be:     LDA #$01           ; $e8be: a9 01     
            STA $0722          ; $e8c0: 8d 22 07  
            STA $0726          ; $e8c3: 8d 26 07  
            STA $072a          ; $e8c6: 8d 2a 07  
            STA $072e          ; $e8c9: 8d 2e 07  
__e8cc:     JMP __e7e3         ; $e8cc: 4c e3 e7  

;-------------------------------------------------------------------------------
__e8cf:     LDA $40            ; $e8cf: a5 40     
            ASL                ; $e8d1: 0a        
            ASL                ; $e8d2: 0a        
            ASL                ; $e8d3: 0a        
            TAX                ; $e8d4: aa        
            LDA $42            ; $e8d5: a5 42     
            ASL                ; $e8d7: 0a        
            ASL                ; $e8d8: 0a        
            ASL                ; $e8d9: 0a        
            TAY                ; $e8da: a8        
            RTS                ; $e8db: 60        

;-------------------------------------------------------------------------------
__e8dc:     LDA $28            ; $e8dc: a5 28     
            LSR                ; $e8de: 4a        
            LSR                ; $e8df: 4a        
            LSR                ; $e8e0: 4a        
            LSR                ; $e8e1: 4a        
            STA $28            ; $e8e2: 85 28     
            LDA $29            ; $e8e4: a5 29     
            LSR                ; $e8e6: 4a        
            LSR                ; $e8e7: 4a        
            LSR                ; $e8e8: 4a        
            LSR                ; $e8e9: 4a        
            STA $29            ; $e8ea: 85 29     
            RTS                ; $e8ec: 60        

;-------------------------------------------------------------------------------
            ASL                ; $e8ed: 0a        
            .hex 0b 1a         ; $e8ee: 0b 1a     Invalid Opcode - ANC #$1a
            .hex 1b 00 00      ; $e8f0: 1b 00 00  Invalid Opcode - SLO $0000,y
            BRK                ; $e8f3: 00        
            BRK                ; $e8f4: 00        
            JSR $2020          ; $e8f5: 20 20 20  
            JSR $0000          ; $e8f8: 20 00 00  
            BRK                ; $e8fb: 00        
            BRK                ; $e8fc: 00        
            .hex 62            ; $e8fd: 62        Invalid Opcode - KIL 
            .hex 63 72         ; $e8fe: 63 72     Invalid Opcode - RRA ($72,x)
            .hex 73 aa         ; $e900: 73 aa     Invalid Opcode - RRA ($aa),y
__e902:     BRK                ; $e902: 00        
            BRK                ; $e903: 00        
            BRK                ; $e904: 00        
            .hex 04 05         ; $e905: 04 05     Invalid Opcode - NOP $05
            .hex 14 15         ; $e907: 14 15     Invalid Opcode - NOP $15,x
            .hex ff 00 00      ; $e909: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $e90c: 00        
            .hex 6f 6f 7f      ; $e90d: 6f 6f 7f  Invalid Opcode - RRA $7f6f
            .hex 7f 55 00      ; $e910: 7f 55 00  Bad Addr Mode - RRA $0055,x
            BRK                ; $e913: 00        
            BRK                ; $e914: 00        
            PHP                ; $e915: 08        
            ORA #$18           ; $e916: 09 18     
            ORA $0055,y        ; $e918: 19 55 00  
            BRK                ; $e91b: 00        
            BRK                ; $e91c: 00        
            .hex 0c 0d 1c      ; $e91d: 0c 0d 1c  Invalid Opcode - NOP $1c0d
            .hex 1d ff 00      ; $e920: 1d ff 00  Bad Addr Mode - ORA $00ff,x
            BRK                ; $e923: 00        
            BRK                ; $e924: 00        
            ASL $1e0f          ; $e925: 0e 0f 1e  
            .hex 1f aa 00      ; $e928: 1f aa 00  Bad Addr Mode - SLO $00aa,x
            BRK                ; $e92b: 00        
            BRK                ; $e92c: 00        
            CPY #$c1           ; $e92d: c0 c1     
            BNE __e902         ; $e92f: d0 d1     
            .hex ff 00 00      ; $e931: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $e934: 00        
__e935:     STX $87            ; $e935: 86 87     
            STX $97,y          ; $e937: 96 97     
            BRK                ; $e939: 00        
            BRK                ; $e93a: 00        
            BRK                ; $e93b: 00        
            BRK                ; $e93c: 00        
            STX $87            ; $e93d: 86 87     
            STX $97,y          ; $e93f: 96 97     
            EOR $00,x          ; $e941: 55 00     
            BRK                ; $e943: 00        
            BRK                ; $e944: 00        
__e945:     JSR __e953         ; $e945: 20 53 e9  
            LDA $01            ; $e948: a5 01     
            STA $2006          ; $e94a: 8d 06 20  
            LDA $00            ; $e94d: a5 00     
            STA $2006          ; $e94f: 8d 06 20  
            RTS                ; $e952: 60        

;-------------------------------------------------------------------------------
__e953:     STY $00            ; $e953: 84 00     
            LDA #$00           ; $e955: a9 00     
            ASL $00            ; $e957: 06 00     
            ROL                ; $e959: 2a        
            ASL $00            ; $e95a: 06 00     
            ROL                ; $e95c: 2a        
            ASL $00            ; $e95d: 06 00     
            ROL                ; $e95f: 2a        
            ASL $00            ; $e960: 06 00     
            ROL                ; $e962: 2a        
            ASL $00            ; $e963: 06 00     
            ROL                ; $e965: 2a        
            STA $01            ; $e966: 85 01     
            TXA                ; $e968: 8a        
            CLC                ; $e969: 18        
            ADC $00            ; $e96a: 65 00     
            STA $00            ; $e96c: 85 00     
            LDA $01            ; $e96e: a5 01     
            ADC #$20           ; $e970: 69 20     
            STA $01            ; $e972: 85 01     
            RTS                ; $e974: 60        

;-------------------------------------------------------------------------------
__e975:     LDX $20            ; $e975: a6 20     
            DEX                ; $e977: ca        
            BNE __e984         ; $e978: d0 0a     
__e97a:     LDA $0500,x        ; $e97a: bd 00 05  
            STA $0600,x        ; $e97d: 9d 00 06  
            INX                ; $e980: e8        
            BNE __e97a         ; $e981: d0 f7     
            RTS                ; $e983: 60        

;-------------------------------------------------------------------------------
__e984:     JSR __ebb9         ; $e984: 20 b9 eb  
            LDX #$00           ; $e987: a2 00     
            LDY #$b0           ; $e989: a0 b0     
            STY $05            ; $e98b: 84 05     
            LDY #$0d           ; $e98d: a0 0d     
            STY $04            ; $e98f: 84 04     
__e991:     LDY $04            ; $e991: a4 04     
            LDA ($00),y        ; $e993: b1 00     
            STA $08            ; $e995: 85 08     
            INC $04            ; $e997: e6 04     
__e999:     LDA #$00           ; $e999: a9 00     
            STA $07            ; $e99b: 85 07     
            STA $06            ; $e99d: 85 06     
            LSR $08            ; $e99f: 46 08     
            ROR $06            ; $e9a1: 66 06     
            LSR $08            ; $e9a3: 46 08     
            ROL $06            ; $e9a5: 26 06     
            ROL $06            ; $e9a7: 26 06     
            LSR $08            ; $e9a9: 46 08     
            ROR $07            ; $e9ab: 66 07     
            LSR $08            ; $e9ad: 46 08     
            ROL $07            ; $e9af: 26 07     
            ROL $07            ; $e9b1: 26 07     
            INC $07            ; $e9b3: e6 07     
__e9b5:     DEC $05            ; $e9b5: c6 05     
            LDY $05            ; $e9b7: a4 05     
            LDA $06            ; $e9b9: a5 06     
            STA $0650,y        ; $e9bb: 99 50 06  
            TYA                ; $e9be: 98        
            BEQ __e9cd         ; $e9bf: f0 0c     
            DEC $07            ; $e9c1: c6 07     
            BNE __e9b5         ; $e9c3: d0 f0     
            INX                ; $e9c5: e8        
            TXA                ; $e9c6: 8a        
            AND #$01           ; $e9c7: 29 01     
            BEQ __e991         ; $e9c9: f0 c6     
            BNE __e999         ; $e9cb: d0 cc     
__e9cd:     LDY #$01           ; $e9cd: a0 01     
            STY $04            ; $e9cf: 84 04     
            LDA #$00           ; $e9d1: a9 00     
            STA $05            ; $e9d3: 85 05     
            LDA #$09           ; $e9d5: a9 09     
            STA $08            ; $e9d7: 85 08     
            LDX #$01           ; $e9d9: a2 01     
            JSR __e9f8         ; $e9db: 20 f8 e9  
            DEC $08            ; $e9de: c6 08     
            LDX #$03           ; $e9e0: a2 03     
            JSR __e9f8         ; $e9e2: 20 f8 e9  
            DEC $08            ; $e9e5: c6 08     
            LDX #$02           ; $e9e7: a2 02     
            JSR __e9f8         ; $e9e9: 20 f8 e9  
            DEC $08            ; $e9ec: c6 08     
            DEC $08            ; $e9ee: c6 08     
            LDY #$0c           ; $e9f0: a0 0c     
            LDA ($00),y        ; $e9f2: b1 00     
            STA $05            ; $e9f4: 85 05     
            LDX #$05           ; $e9f6: a2 05     
__e9f8:     LDY $04            ; $e9f8: a4 04     
            LDA ($00),y        ; $e9fa: b1 00     
            TAY                ; $e9fc: a8        
            INY                ; $e9fd: c8        
            BNE __ea06         ; $e9fe: d0 06     
__ea00:     INC $04            ; $ea00: e6 04     
            DEX                ; $ea02: ca        
            BNE __e9f8         ; $ea03: d0 f3     
            RTS                ; $ea05: 60        

;-------------------------------------------------------------------------------
__ea06:     DEY                ; $ea06: 88        
            LDA $08            ; $ea07: a5 08     
            ROL $05            ; $ea09: 26 05     
            ADC #$00           ; $ea0b: 69 00     
            STA $0650,y        ; $ea0d: 99 50 06  
            JMP __ea00         ; $ea10: 4c 00 ea  

;-------------------------------------------------------------------------------
__ea13:     LDX $20            ; $ea13: a6 20     
            DEX                ; $ea15: ca        
            BNE __ea22         ; $ea16: d0 0a     
__ea18:     LDA $0600,x        ; $ea18: bd 00 06  
            STA $0500,x        ; $ea1b: 9d 00 05  
            INX                ; $ea1e: e8        
            BNE __ea18         ; $ea1f: d0 f7     
            RTS                ; $ea21: 60        

;-------------------------------------------------------------------------------
__ea22:     LDY #$01           ; $ea22: a0 01     
            LDA #$09           ; $ea24: a9 09     
            LDX #$01           ; $ea26: a2 01     
            JSR __eb92         ; $ea28: 20 92 eb  
            LDA #$08           ; $ea2b: a9 08     
            LDX #$03           ; $ea2d: a2 03     
            JSR __eb92         ; $ea2f: 20 92 eb  
            LDA #$07           ; $ea32: a9 07     
            LDX #$02           ; $ea34: a2 02     
            JSR __eb92         ; $ea36: 20 92 eb  
            LDA #$b0           ; $ea39: a9 b0     
            STA $05            ; $ea3b: 85 05     
            LDA #$06           ; $ea3d: a9 06     
            STA $06            ; $ea3f: 85 06     
            LDA #$80           ; $ea41: a9 80     
            STA $07            ; $ea43: 85 07     
            LDA #$00           ; $ea45: a9 00     
            STA $040c          ; $ea47: 8d 0c 04  
            LDX #$05           ; $ea4a: a2 05     
__ea4c:     LDA $06            ; $ea4c: a5 06     
            JSR __eb8a         ; $ea4e: 20 8a eb  
            BCS __ea66         ; $ea51: b0 13     
            STA $0400,y        ; $ea53: 99 00 04  
            INY                ; $ea56: c8        
            LDA $07            ; $ea57: a5 07     
            ORA $040c          ; $ea59: 0d 0c 04  
            STA $040c          ; $ea5c: 8d 0c 04  
            LSR $07            ; $ea5f: 46 07     
            DEX                ; $ea61: ca        
            BNE __ea4c         ; $ea62: d0 e8     
            BEQ __ea7f         ; $ea64: f0 19     
__ea66:     LDA #$b0           ; $ea66: a9 b0     
            STA $05            ; $ea68: 85 05     
            LDA #$00           ; $ea6a: a9 00     
            STA $07            ; $ea6c: 85 07     
            DEC $06            ; $ea6e: c6 06     
            LDA $06            ; $ea70: a5 06     
            CMP #$04           ; $ea72: c9 04     
            BNE __ea4c         ; $ea74: d0 d6     
__ea76:     LDA #$ff           ; $ea76: a9 ff     
            STA $0400,y        ; $ea78: 99 00 04  
            INY                ; $ea7b: c8        
            DEX                ; $ea7c: ca        
            BNE __ea76         ; $ea7d: d0 f7     
__ea7f:     INY                ; $ea7f: c8        
            LDA #$00           ; $ea80: a9 00     
            STA $06            ; $ea82: 85 06     
            STA $08            ; $ea84: 85 08     
            TAX                ; $ea86: aa        
            LDA #$b0           ; $ea87: a9 b0     
            STA $05            ; $ea89: 85 05     
            STY $04            ; $ea8b: 84 04     
            LDA #$00           ; $ea8d: a9 00     
            STA $07            ; $ea8f: 85 07     
__ea91:     DEC $05            ; $ea91: c6 05     
            LDY $05            ; $ea93: a4 05     
            LDA $0650,y        ; $ea95: b9 50 06  
            TAY                ; $ea98: a8        
            CMP #$04           ; $ea99: c9 04     
            BCS __eaa5         ; $ea9b: b0 08     
            CMP $06            ; $ea9d: c5 06     
            BEQ __eaa5         ; $ea9f: f0 04     
            INC $05            ; $eaa1: e6 05     
            BNE __eab3         ; $eaa3: d0 0e     
__eaa5:     INC $07            ; $eaa5: e6 07     
            LDA $07            ; $eaa7: a5 07     
            CMP #$04           ; $eaa9: c9 04     
            BEQ __eabd         ; $eaab: f0 10     
            LDY $05            ; $eaad: a4 05     
            BEQ __eabd         ; $eaaf: f0 0c     
            BNE __ea91         ; $eab1: d0 de     
__eab3:     LDA $07            ; $eab3: a5 07     
            BNE __eabd         ; $eab5: d0 06     
            STY $06            ; $eab7: 84 06     
            BEQ __ea91         ; $eab9: f0 d6     
            INC $05            ; $eabb: e6 05     
__eabd:     DEC $07            ; $eabd: c6 07     
            LSR $06            ; $eabf: 46 06     
            ROR $08            ; $eac1: 66 08     
            LSR $06            ; $eac3: 46 06     
            ROR $08            ; $eac5: 66 08     
            LSR $07            ; $eac7: 46 07     
            ROR $08            ; $eac9: 66 08     
            LSR $07            ; $eacb: 46 07     
            ROR $08            ; $eacd: 66 08     
            LDA #$00           ; $eacf: a9 00     
            STA $07            ; $ead1: 85 07     
            INX                ; $ead3: e8        
            TXA                ; $ead4: 8a        
            AND #$01           ; $ead5: 29 01     
            BEQ __eadf         ; $ead7: f0 06     
            LDY $05            ; $ead9: a4 05     
            BEQ __eabd         ; $eadb: f0 e0     
            BNE __ea91         ; $eadd: d0 b2     
__eadf:     LDY $04            ; $eadf: a4 04     
            LDA $08            ; $eae1: a5 08     
            STA $0400,y        ; $eae3: 99 00 04  
            INC $04            ; $eae6: e6 04     
            LDY $05            ; $eae8: a4 05     
            BEQ __eaee         ; $eaea: f0 02     
            BNE __ea91         ; $eaec: d0 a3     
__eaee:     LDA $04            ; $eaee: a5 04     
            STA $0400          ; $eaf0: 8d 00 04  
            JSR __ebb9         ; $eaf3: 20 b9 eb  
            LDX #$00           ; $eaf6: a2 00     
            LDA $0400          ; $eaf8: ad 00 04  
            SEC                ; $eafb: 38        
            SBC ($00,x)        ; $eafc: e1 00     
            BEQ __eb79         ; $eafe: f0 79     
            BCS __eb4b         ; $eb00: b0 49     
            STA $04            ; $eb02: 85 04     
            LDA #$00           ; $eb04: a9 00     
            SEC                ; $eb06: 38        
            SBC $04            ; $eb07: e5 04     
            STA $04            ; $eb09: 85 04     
            LDA #$f8           ; $eb0b: a9 f8     
            STA $02            ; $eb0d: 85 02     
            LDA #$ff           ; $eb0f: a9 ff     
            STA $03            ; $eb11: 85 03     
            INC $20            ; $eb13: e6 20     
            JSR __ebb9         ; $eb15: 20 b9 eb  
            DEC $20            ; $eb18: c6 20     
            LDA $00            ; $eb1a: a5 00     
            SEC                ; $eb1c: 38        
            SBC $04            ; $eb1d: e5 04     
            STA $00            ; $eb1f: 85 00     
            LDA $01            ; $eb21: a5 01     
            SBC #$00           ; $eb23: e9 00     
            STA $01            ; $eb25: 85 01     
            LDY $04            ; $eb27: a4 04     
            LDX #$00           ; $eb29: a2 00     
            LDA $00            ; $eb2b: a5 00     
            BNE __eb31         ; $eb2d: d0 02     
            DEC $01            ; $eb2f: c6 01     
__eb31:     DEC $00            ; $eb31: c6 00     
__eb33:     INC $00            ; $eb33: e6 00     
            BNE __eb39         ; $eb35: d0 02     
            INC $01            ; $eb37: e6 01     
__eb39:     LDA ($00),y        ; $eb39: b1 00     
            STA ($00,x)        ; $eb3b: 81 00     
            LDA $01            ; $eb3d: a5 01     
            CMP $03            ; $eb3f: c5 03     
            BNE __eb33         ; $eb41: d0 f0     
            LDA $00            ; $eb43: a5 00     
            CMP $02            ; $eb45: c5 02     
            BNE __eb33         ; $eb47: d0 ea     
            BEQ __eb79         ; $eb49: f0 2e     
__eb4b:     STA $04            ; $eb4b: 85 04     
            JSR __ebb9         ; $eb4d: 20 b9 eb  
            LDA #$f8           ; $eb50: a9 f8     
            SEC                ; $eb52: 38        
            SBC $04            ; $eb53: e5 04     
            STA $02            ; $eb55: 85 02     
            LDA #$ff           ; $eb57: a9 ff     
            SBC #$00           ; $eb59: e9 00     
            STA $03            ; $eb5b: 85 03     
            LDX #$00           ; $eb5d: a2 00     
            LDY $04            ; $eb5f: a4 04     
__eb61:     LDA ($02,x)        ; $eb61: a1 02     
            STA ($02),y        ; $eb63: 91 02     
            LDA $02            ; $eb65: a5 02     
            BNE __eb6b         ; $eb67: d0 02     
            DEC $03            ; $eb69: c6 03     
__eb6b:     DEC $02            ; $eb6b: c6 02     
            LDA $01            ; $eb6d: a5 01     
            CMP $03            ; $eb6f: c5 03     
            BNE __eb61         ; $eb71: d0 ee     
            LDA $00            ; $eb73: a5 00     
            CMP $02            ; $eb75: c5 02     
            BNE __eb61         ; $eb77: d0 e8     
__eb79:     JSR __ebb9         ; $eb79: 20 b9 eb  
            LDY #$00           ; $eb7c: a0 00     
__eb7e:     LDA $0400,y        ; $eb7e: b9 00 04  
            STA ($00),y        ; $eb81: 91 00     
            INY                ; $eb83: c8        
            CPY $0400          ; $eb84: cc 00 04  
            BNE __eb7e         ; $eb87: d0 f5     
            RTS                ; $eb89: 60        

;-------------------------------------------------------------------------------
__eb8a:     STY $04            ; $eb8a: 84 04     
            JSR __eba5         ; $eb8c: 20 a5 eb  
            LDY $04            ; $eb8f: a4 04     
            RTS                ; $eb91: 60        

;-------------------------------------------------------------------------------
__eb92:     PHA                ; $eb92: 48        
            LDA #$b0           ; $eb93: a9 b0     
            STA $05            ; $eb95: 85 05     
            PLA                ; $eb97: 68        
__eb98:     PHA                ; $eb98: 48        
            JSR __eb8a         ; $eb99: 20 8a eb  
            STA $0400,y        ; $eb9c: 99 00 04  
            INY                ; $eb9f: c8        
            PLA                ; $eba0: 68        
            DEX                ; $eba1: ca        
            BNE __eb98         ; $eba2: d0 f4     
            RTS                ; $eba4: 60        

;-------------------------------------------------------------------------------
__eba5:     LDY $05            ; $eba5: a4 05     
            BNE __ebad         ; $eba7: d0 04     
            LDA #$ff           ; $eba9: a9 ff     
            SEC                ; $ebab: 38        
            RTS                ; $ebac: 60        

;-------------------------------------------------------------------------------
__ebad:     DEC $05            ; $ebad: c6 05     
            LDY $05            ; $ebaf: a4 05     
            CMP $0650,y        ; $ebb1: d9 50 06  
            BNE __eba5         ; $ebb4: d0 ef     
            TYA                ; $ebb6: 98        
            CLC                ; $ebb7: 18        
            RTS                ; $ebb8: 60        

;-------------------------------------------------------------------------------
__ebb9:     LDY #$00           ; $ebb9: a0 00     
            LDA #$00           ; $ebbb: a9 00     
            STA $00            ; $ebbd: 85 00     
            LDA #$f6           ; $ebbf: a9 f6     
            STA $01            ; $ebc1: 85 01     
            LDX $20            ; $ebc3: a6 20     
__ebc5:     DEX                ; $ebc5: ca        
            BNE __ebc9         ; $ebc6: d0 01     
            RTS                ; $ebc8: 60        

;-------------------------------------------------------------------------------
__ebc9:     LDA ($00),y        ; $ebc9: b1 00     
            CLC                ; $ebcb: 18        
            ADC $00            ; $ebcc: 65 00     
            STA $00            ; $ebce: 85 00     
            BCC __ebd4         ; $ebd0: 90 02     
            INC $01            ; $ebd2: e6 01     
__ebd4:     JMP __ebc5         ; $ebd4: 4c c5 eb  

;-------------------------------------------------------------------------------
__ebd7:     LDA $0200          ; $ebd7: ad 00 02  
            BNE __ebd7         ; $ebda: d0 fb     
            LDY #$00           ; $ebdc: a0 00     
__ebde:     LDA ($00),y        ; $ebde: b1 00     
            BEQ __ebe5         ; $ebe0: f0 03     
            INY                ; $ebe2: c8        
            BNE __ebde         ; $ebe3: d0 f9     
__ebe5:     STY $0f            ; $ebe5: 84 0f     
            LDX $27            ; $ebe7: a6 27     
            TYA                ; $ebe9: 98        
            ORA #$80           ; $ebea: 09 80     
            JSR __ec17         ; $ebec: 20 17 ec  
            LDA $03            ; $ebef: a5 03     
            JSR __ec17         ; $ebf1: 20 17 ec  
            LDA $02            ; $ebf4: a5 02     
            JSR __ec17         ; $ebf6: 20 17 ec  
            LDY #$00           ; $ebf9: a0 00     
__ebfb:     LDA ($00),y        ; $ebfb: b1 00     
            JSR __ec17         ; $ebfd: 20 17 ec  
            INY                ; $ec00: c8        
            CPY $0f            ; $ec01: c4 0f     
            BNE __ebfb         ; $ec03: d0 f6     
            STX $27            ; $ec05: 86 27     
            RTS                ; $ec07: 60        

;-------------------------------------------------------------------------------
__ec08:     LDX $27            ; $ec08: a6 27     
            LDA #$00           ; $ec0a: a9 00     
            JSR __ec17         ; $ec0c: 20 17 ec  
            STX $27            ; $ec0f: 86 27     
            LDA #$01           ; $ec11: a9 01     
            STA $0200          ; $ec13: 8d 00 02  
            RTS                ; $ec16: 60        

;-------------------------------------------------------------------------------
__ec17:     STA $0200,x        ; $ec17: 9d 00 02  
            INX                ; $ec1a: e8        
            CPX #$40           ; $ec1b: e0 40     
            BEQ __ec20         ; $ec1d: f0 01     
            RTS                ; $ec1f: 60        

;-------------------------------------------------------------------------------
__ec20:     LDA #$00           ; $ec20: a9 00     
            STA $0201          ; $ec22: 8d 01 02  
            LDX #$02           ; $ec25: a2 02     
            RTS                ; $ec27: 60        

;-------------------------------------------------------------------------------
__ec28:     LDY #$00           ; $ec28: a0 00     
            LDA ($00),y        ; $ec2a: b1 00     
            STA $02            ; $ec2c: 85 02     
            INY                ; $ec2e: c8        
            LDA ($00),y        ; $ec2f: b1 00     
            STA $03            ; $ec31: 85 03     
            INY                ; $ec33: c8        
            AND $02            ; $ec34: 25 02     
            CMP #$ff           ; $ec36: c9 ff     
            BEQ __ec5a         ; $ec38: f0 20     
            LDA $03            ; $ec3a: a5 03     
            STA $2006          ; $ec3c: 8d 06 20  
            LDA $02            ; $ec3f: a5 02     
            STA $2006          ; $ec41: 8d 06 20  
__ec44:     LDA ($00),y        ; $ec44: b1 00     
            BEQ __ec4e         ; $ec46: f0 06     
            JSR __c026         ; $ec48: 20 26 c0  
            INY                ; $ec4b: c8        
            BNE __ec44         ; $ec4c: d0 f6     
__ec4e:     TYA                ; $ec4e: 98        
            SEC                ; $ec4f: 38        
            ADC $00            ; $ec50: 65 00     
            STA $00            ; $ec52: 85 00     
            BCC __ec28         ; $ec54: 90 d2     
            INC $01            ; $ec56: e6 01     
            BNE __ec28         ; $ec58: d0 ce     
__ec5a:     RTS                ; $ec5a: 60        

;-------------------------------------------------------------------------------
__ec5b:     LDA $03            ; $ec5b: a5 03     
            STA $2006          ; $ec5d: 8d 06 20  
            LDA $02            ; $ec60: a5 02     
            STA $2006          ; $ec62: 8d 06 20  
            LDY #$00           ; $ec65: a0 00     
__ec67:     LDA ($00),y        ; $ec67: b1 00     
            BEQ __ec72         ; $ec69: f0 07     
            JSR __c026         ; $ec6b: 20 26 c0  
            INY                ; $ec6e: c8        
            JMP __ec67         ; $ec6f: 4c 67 ec  

;-------------------------------------------------------------------------------
__ec72:     RTS                ; $ec72: 60        

;-------------------------------------------------------------------------------
__ec73:     JSR __efaa         ; $ec73: 20 aa ef  
            JSR __ef4d         ; $ec76: 20 4d ef  
            JSR __ef6c         ; $ec79: 20 6c ef  
            LDA #$3f           ; $ec7c: a9 3f     
            STA $2006          ; $ec7e: 8d 06 20  
            LDX #$00           ; $ec81: a2 00     
            STX $2006          ; $ec83: 8e 06 20  
            LDX #$00           ; $ec86: a2 00     
__ec88:     LDA __c030,x       ; $ec88: bd 30 c0  
            JSR __c026         ; $ec8b: 20 26 c0  
            INX                ; $ec8e: e8        
            CPX #$20           ; $ec8f: e0 20     
            BNE __ec88         ; $ec91: d0 f5     
            LDA #$3f           ; $ec93: a9 3f     
            STA $2006          ; $ec95: 8d 06 20  
            LDX #$06           ; $ec98: a2 06     
            STX $2006          ; $ec9a: 8e 06 20  
            LDA #$2a           ; $ec9d: a9 2a     
            JSR __c026         ; $ec9f: 20 26 c0  
            LDA #$21           ; $eca2: a9 21     
            JSR __c026         ; $eca4: 20 26 c0  
            LDA #$3f           ; $eca7: a9 3f     
            STA $2006          ; $eca9: 8d 06 20  
            LDX #$0d           ; $ecac: a2 0d     
            STX $2006          ; $ecae: 8e 06 20  
            LDA #$26           ; $ecb1: a9 26     
            JSR __c026         ; $ecb3: 20 26 c0  
            LDA #$23           ; $ecb6: a9 23     
            STA $2006          ; $ecb8: 8d 06 20  
            LDX #$c0           ; $ecbb: a2 c0     
            STX $2006          ; $ecbd: 8e 06 20  
            LDX #$20           ; $ecc0: a2 20     
__ecc2:     LDA #$55           ; $ecc2: a9 55     
            JSR __c026         ; $ecc4: 20 26 c0  
__ecc7:     DEX                ; $ecc7: ca        
            BNE __ecc2         ; $ecc8: d0 f8     
            LDX #$10           ; $ecca: a2 10     
__eccc:     LDA #$ff           ; $eccc: a9 ff     
            JSR __c026         ; $ecce: 20 26 c0  
            DEX                ; $ecd1: ca        
            BNE __eccc         ; $ecd2: d0 f8     
            LDX #$10           ; $ecd4: a2 10     
__ecd6:     LDA #$5f           ; $ecd6: a9 5f     
            JSR __c026         ; $ecd8: 20 26 c0  
            DEX                ; $ecdb: ca        
            BNE __ecd6         ; $ecdc: d0 f8     
            LDA #$dc           ; $ecde: a9 dc     
            STA $00            ; $ece0: 85 00     
            LDA #$ed           ; $ece2: a9 ed     
            STA $01            ; $ece4: 85 01     
            JSR __ec28         ; $ece6: 20 28 ec  
            JSR __ef76         ; $ece9: 20 76 ef  
            JSR __f31b         ; $ecec: 20 1b f3  
            LDA $eb            ; $ecef: a5 eb     
            BNE __ecf9         ; $ecf1: d0 06     
            JSR __f2d4         ; $ecf3: 20 d4 f2  
            JSR __f046         ; $ecf6: 20 46 f0  
__ecf9:     LDA #$00           ; $ecf9: a9 00     
            STA $a7            ; $ecfb: 85 a7     
            LDA #$04           ; $ecfd: a9 04     
            STA $a3            ; $ecff: 85 a3     
            LDA #$00           ; $ed01: a9 00     
            STA $a4            ; $ed03: 85 a4     
            LDA #$00           ; $ed05: a9 00     
            STA $a5            ; $ed07: 85 a5     
            LDA #$00           ; $ed09: a9 00     
            STA $e1            ; $ed0b: 85 e1     
            LDA $2f            ; $ed0d: a5 2f     
            SEC                ; $ed0f: 38        
            SBC #$80           ; $ed10: e9 80     
            LSR                ; $ed12: 4a        
            LSR                ; $ed13: 4a        
            LSR                ; $ed14: 4a        
            LSR                ; $ed15: 4a        
            STA $e0            ; $ed16: 85 e0     
            JSR __edc7         ; $ed18: 20 c7 ed  
            LDA #$01           ; $ed1b: a9 01     
            STA $26            ; $ed1d: 85 26     
__ed1f:     LDA $26            ; $ed1f: a5 26     
            BNE __ed1f         ; $ed21: d0 fc     
__ed23:     LDA $1a            ; $ed23: a5 1a     
            BNE __ed23         ; $ed25: d0 fc     
__ed27:     LDA $eb            ; $ed27: a5 eb     
            BNE __ed32         ; $ed29: d0 07     
            LDA $34            ; $ed2b: a5 34     
            BEQ __ed3e         ; $ed2d: f0 0f     
            JMP __ed5b         ; $ed2f: 4c 5b ed  

;-------------------------------------------------------------------------------
__ed32:     DEC $a5            ; $ed32: c6 a5     
            BNE __ed5b         ; $ed34: d0 25     
            DEC $a4            ; $ed36: c6 a4     
            BNE __ed5b         ; $ed38: d0 21     
            DEC $a3            ; $ed3a: c6 a3     
            BNE __ed5b         ; $ed3c: d0 1d     
__ed3e:     LDA #$02           ; $ed3e: a9 02     
            STA $a0            ; $ed40: 85 a0     
            LDA __c070         ; $ed42: ad 70 c0  
            STA $a1            ; $ed45: 85 a1     
            LDA __c071         ; $ed47: ad 71 c0  
            STA $a2            ; $ed4a: 85 a2     
            LDA #$00           ; $ed4c: a9 00     
            STA $e0            ; $ed4e: 85 e0     
            LDA #$01           ; $ed50: a9 01     
            STA $a7            ; $ed52: 85 a7     
            JSR __efaa         ; $ed54: 20 aa ef  
            JSR __f31b         ; $ed57: 20 1b f3  
            RTS                ; $ed5a: 60        

;-------------------------------------------------------------------------------
__ed5b:     JSR __edc7         ; $ed5b: 20 c7 ed  
            LDA $1a            ; $ed5e: a5 1a     
            AND #$10           ; $ed60: 29 10     
            BNE __ed8f         ; $ed62: d0 2b     
            LDA $1a            ; $ed64: a5 1a     
            AND #$20           ; $ed66: 29 20     
            BEQ __ed27         ; $ed68: f0 bd     
            LDY $e0            ; $ed6a: a4 e0     
            LDX $2f            ; $ed6c: a6 2f     
            CPY #$04           ; $ed6e: c0 04     
            BNE __ed76         ; $ed70: d0 04     
            LDY #$ff           ; $ed72: a0 ff     
            LDX #$70           ; $ed74: a2 70     
__ed76:     TXA                ; $ed76: 8a        
            CLC                ; $ed77: 18        
            ADC #$10           ; $ed78: 69 10     
            STA $2f            ; $ed7a: 85 2f     
            STA $0700          ; $ed7c: 8d 00 07  
            INY                ; $ed7f: c8        
            STY $e0            ; $ed80: 84 e0     
__ed82:     LDA $1a            ; $ed82: a5 1a     
            AND #$20           ; $ed84: 29 20     
            BNE __ed82         ; $ed86: d0 fa     
            LDA #$04           ; $ed88: a9 04     
            STA $a3            ; $ed8a: 85 a3     
            JMP __ed27         ; $ed8c: 4c 27 ed  

;-------------------------------------------------------------------------------
__ed8f:     JSR __efaa         ; $ed8f: 20 aa ef  
            JSR __f31b         ; $ed92: 20 1b f3  
            LDA $e0            ; $ed95: a5 e0     
            CMP #$04           ; $ed97: c9 04     
            BEQ __edc1         ; $ed99: f0 26     
            TAX                ; $ed9b: aa        
            LSR                ; $ed9c: 4a        
            STA $e0            ; $ed9d: 85 e0     
            TXA                ; $ed9f: 8a        
            AND #$01           ; $eda0: 29 01     
            STA $e8            ; $eda2: 85 e8     
            STA $e9            ; $eda4: 85 e9     
            LDA #$00           ; $eda6: a9 00     
            STA $a0            ; $eda8: 85 a0     
            LDA #$00           ; $edaa: a9 00     
            STA $a1            ; $edac: 85 a1     
            LDA #$00           ; $edae: a9 00     
            STA $a2            ; $edb0: 85 a2     
            LDA #$00           ; $edb2: a9 00     
            STA $a7            ; $edb4: 85 a7     
            LDA #$00           ; $edb6: a9 00     
            STA $b8            ; $edb8: 85 b8     
            STA $b9            ; $edba: 85 b9     
            STA $bc            ; $edbc: 85 bc     
            STA $bd            ; $edbe: 85 bd     
            RTS                ; $edc0: 60        

;-------------------------------------------------------------------------------
__edc1:     JSR __e135         ; $edc1: 20 35 e1  
            JMP __ec73         ; $edc4: 4c 73 ec  

;-------------------------------------------------------------------------------
__edc7:     LDA $2f            ; $edc7: a5 2f     
            STA $0700          ; $edc9: 8d 00 07  
            LDA #$fe           ; $edcc: a9 fe     
            STA $0701          ; $edce: 8d 01 07  
            LDA #$01           ; $edd1: a9 01     
            STA $0702          ; $edd3: 8d 02 07  
            LDA #$38           ; $edd6: a9 38     
            STA $0703          ; $edd8: 8d 03 07  
            RTS                ; $eddb: 60        

;-------------------------------------------------------------------------------
            ADC $20            ; $eddc: 65 20     
            JSR $2020          ; $edde: 20 20 20  
            ROR $66            ; $ede1: 66 66     
            ROR $66            ; $ede3: 66 66     
            ROR $20            ; $ede5: 66 20     
            JSR $2066          ; $ede7: 20 66 20  
            JSR $2066          ; $edea: 20 66 20  
            JSR $2020          ; $eded: 20 20 20  
            JSR $2066          ; $edf0: 20 66 20  
            JSR $8500          ; $edf3: 20 00 85  
            JSR $2020          ; $edf6: 20 20 20  
            JSR $2020          ; $edf9: 20 20 20  
            JSR $6620          ; $edfc: 20 20 66  
            JSR $6620          ; $edff: 20 20 66  
            JSR $6620          ; $ee02: 20 20 66  
            JSR $6620          ; $ee05: 20 20 66  
            ROR $66            ; $ee08: 66 66     
            ROR $66            ; $ee0a: 66 66     
            ROR $00            ; $ee0c: 66 00     
            LDA $20            ; $ee0e: a5 20     
            JSR $2020          ; $ee10: 20 20 20  
            JSR $2066          ; $ee13: 20 66 20  
            ROR $20            ; $ee16: 66 20     
            JSR $6620          ; $ee18: 20 20 66  
            JSR $6620          ; $ee1b: 20 20 66  
            JSR $2020          ; $ee1e: 20 20 20  
            JSR $6666          ; $ee21: 20 66 66  
            JSR $0020          ; $ee24: 20 20 00  
            CMP $20            ; $ee27: c5 20     
            JSR $2020          ; $ee29: 20 20 20  
            JSR $6620          ; $ee2c: 20 20 66  
            JSR $2020          ; $ee2f: 20 20 20  
            JSR $2020          ; $ee32: 20 20 20  
            JSR $2066          ; $ee35: 20 66 20  
            JSR $6620          ; $ee38: 20 20 66  
            JSR $2066          ; $ee3b: 20 66 20  
            JSR __e500         ; $ee3e: 20 00 e5  
            JSR $2020          ; $ee41: 20 20 20  
            JSR $2020          ; $ee44: 20 20 20  
            JSR $2066          ; $ee47: 20 66 20  
            JSR $2020          ; $ee4a: 20 20 20  
            JSR $2066          ; $ee4d: 20 66 20  
            JSR $6620          ; $ee50: 20 20 66  
            JSR $6620          ; $ee53: 20 20 66  
            JSR $0020          ; $ee56: 20 20 00  
            .hex 0f 21 06      ; $ee59: 0f 21 06  Invalid Opcode - SLO $0621
            .hex 07 00         ; $ee5c: 07 00     Invalid Opcode - SLO $00
            .hex 2f 21 16      ; $ee5e: 2f 21 16  Invalid Opcode - RLA $1621
            .hex 17 00         ; $ee61: 17 00     Invalid Opcode - SLO $00,x
            EOR $21            ; $ee63: 45 21     
            JSR $2066          ; $ee65: 20 66 20  
            ROR $20            ; $ee68: 66 20     
            JSR $2020          ; $ee6a: 20 20 20  
            JSR $6666          ; $ee6d: 20 66 66  
            JSR $2020          ; $ee70: 20 20 20  
            JSR $6620          ; $ee73: 20 20 66  
            ROR $20            ; $ee76: 66 20     
            JSR $6969          ; $ee78: 20 69 69  
            BRK                ; $ee7b: 00        
            ADC $21            ; $ee7c: 65 21     
            JSR $2066          ; $ee7e: 20 66 20  
            ROR $20            ; $ee81: 66 20     
            JSR $2020          ; $ee83: 20 20 20  
            ROR $66            ; $ee86: 66 66     
            JSR $2020          ; $ee88: 20 20 20  
            JSR $2020          ; $ee8b: 20 20 20  
            JSR $2020          ; $ee8e: 20 20 20  
            ROR $20            ; $ee91: 66 20     
            JSR $8500          ; $ee93: 20 00 85  
            AND ($20,x)        ; $ee96: 21 20     
            ROR $20            ; $ee98: 66 20     
            ROR $20            ; $ee9a: 66 20     
            ROR $20            ; $ee9c: 66 20     
            ROR $20            ; $ee9e: 66 20     
            ROR $20            ; $eea0: 66 20     
            JSR $6666          ; $eea2: 20 66 66  
            ROR $20            ; $eea5: 66 20     
            ROR $66            ; $eea7: 66 66     
            JSR $2066          ; $eea9: 20 66 20  
            JSR $a500          ; $eeac: 20 00 a5  
            AND ($20,x)        ; $eeaf: 21 20     
            ROR $20            ; $eeb1: 66 20     
            ROR $66            ; $eeb3: 66 66     
            JSR $2020          ; $eeb5: 20 20 20  
            JSR $2066          ; $eeb8: 20 66 20  
            JSR $2020          ; $eebb: 20 20 20  
            JSR $2020          ; $eebe: 20 20 20  
            .hex 20            ; $eec1: 20        Suspected data
__eec2:     JSR $2066          ; $eec2: 20 66 20  
            JSR __c500         ; $eec5: 20 00 c5  
            AND ($66,x)        ; $eec8: 21 66     
            JSR $6620          ; $eeca: 20 20 66  
            JSR $2020          ; $eecd: 20 20 20  
            JSR $6620          ; $eed0: 20 20 66  
            JSR $2020          ; $eed3: 20 20 20  
            JSR $2020          ; $eed6: 20 20 20  
            JSR $6666          ; $eed9: 20 66 66  
            JSR $2020          ; $eedc: 20 20 20  
            BRK                ; $eedf: 00        
            ORA #$22           ; $eee0: 09 22     
            AND ($20),y        ; $eee2: 31 20     
            BVC __ef32         ; $eee4: 50 4c     
            EOR ($59,x)        ; $eee6: 41 59     
            EOR $52            ; $eee8: 45 52     
            JSR $4147          ; $eeea: 20 47 41  
            EOR $2045          ; $eeed: 4d 45 20  
            EOR ($00,x)        ; $eef0: 41 00     
            EOR #$22           ; $eef2: 49 22     
            AND ($20),y        ; $eef4: 31 20     
            BVC __ef44         ; $eef6: 50 4c     
            EOR ($59,x)        ; $eef8: 41 59     
            EOR $52            ; $eefa: 45 52     
            JSR $4147          ; $eefc: 20 47 41  
            EOR $2045          ; $eeff: 4d 45 20  
            .hex 42            ; $ef02: 42        Invalid Opcode - KIL 
            BRK                ; $ef03: 00        
            .hex 89 22         ; $ef04: 89 22     Invalid Opcode - NOP #$22
            .hex 32            ; $ef06: 32        Invalid Opcode - KIL 
            JSR $4c50          ; $ef07: 20 50 4c  
            EOR ($59,x)        ; $ef0a: 41 59     
            EOR $52            ; $ef0c: 45 52     
            JSR $4147          ; $ef0e: 20 47 41  
            EOR $2045          ; $ef11: 4d 45 20  
            EOR ($00,x)        ; $ef14: 41 00     
            CMP #$22           ; $ef16: c9 22     
            .hex 32            ; $ef18: 32        Invalid Opcode - KIL 
            JSR $4c50          ; $ef19: 20 50 4c  
            EOR ($59,x)        ; $ef1c: 41 59     
            EOR $52            ; $ef1e: 45 52     
            JSR $4147          ; $ef20: 20 47 41  
            EOR $2045          ; $ef23: 4d 45 20  
            .hex 42            ; $ef26: 42        Invalid Opcode - KIL 
            BRK                ; $ef27: 00        
            .hex 0b 23         ; $ef28: 0b 23     Invalid Opcode - ANC #$23
            .hex 47 41         ; $ef2a: 47 41     Invalid Opcode - SRE $41
            EOR $2045          ; $ef2c: 4d 45 20  
            EOR $44            ; $ef2f: 45 44     
            .hex 49            ; $ef31: 49        Suspected data
__ef32:     .hex 54 4f         ; $ef32: 54 4f     Invalid Opcode - NOP $4f,x
            .hex 52            ; $ef34: 52        Invalid Opcode - KIL 
            BRK                ; $ef35: 00        
            PHA                ; $ef36: 48        
            .hex 23 40         ; $ef37: 23 40     Invalid Opcode - RLA ($40,x)
            JSR $3931          ; $ef39: 20 31 39  
            AND $2039,y        ; $ef3c: 39 39 20  
            JSR $5220          ; $ef3f: 20 20 52  
            EOR #$4e           ; $ef42: 49 4e     
__ef44:     .hex 4b 41         ; $ef44: 4b 41     Invalid Opcode - ALR #$41
            .hex 4b 55         ; $ef46: 4b 55     Invalid Opcode - ALR #$55
            JSR $0020          ; $ef48: 20 20 00  
            .hex ff ff         ; $ef4b: ff ff     Suspected data
__ef4d:     JSR __ef6c         ; $ef4d: 20 6c ef  
            LDA #$20           ; $ef50: a9 20     
            STA $2006          ; $ef52: 8d 06 20  
            LDX #$00           ; $ef55: a2 00     
            STX $2006          ; $ef57: 8e 06 20  
            LDX #$c0           ; $ef5a: a2 c0     
            LDY #$04           ; $ef5c: a0 04     
__ef5e:     LDA #$20           ; $ef5e: a9 20     
            JSR __c026         ; $ef60: 20 26 c0  
            DEX                ; $ef63: ca        
            BNE __ef5e         ; $ef64: d0 f8     
            DEY                ; $ef66: 88        
            BNE __ef5e         ; $ef67: d0 f5     
            JMP __ef76         ; $ef69: 4c 76 ef  

;-------------------------------------------------------------------------------
__ef6c:     LDA #$01           ; $ef6c: a9 01     
            STA $e6            ; $ef6e: 85 e6     
            JSR __efd0         ; $ef70: 20 d0 ef  
            JMP __efa1         ; $ef73: 4c a1 ef  

;-------------------------------------------------------------------------------
__ef76:     LDA #$00           ; $ef76: a9 00     
            STA $e6            ; $ef78: 85 e6     
            JSR __ef83         ; $ef7a: 20 83 ef  
            JSR __ef8e         ; $ef7d: 20 8e ef  
            JMP __efc7         ; $ef80: 4c c7 ef  

;-------------------------------------------------------------------------------
__ef83:     LDA #$00           ; $ef83: a9 00     
            STA $2005          ; $ef85: 8d 05 20  
            LDA #$ff           ; $ef88: a9 ff     
            STA $2005          ; $ef8a: 8d 05 20  
            RTS                ; $ef8d: 60        

;-------------------------------------------------------------------------------
__ef8e:     JSR __efbc         ; $ef8e: 20 bc ef  
            LDA #$00           ; $ef91: a9 00     
            STA $2003          ; $ef93: 8d 03 20  
            LDA #$07           ; $ef96: a9 07     
            STA $4014          ; $ef98: 8d 14 40  
            LDA #$1e           ; $ef9b: a9 1e     
            STA $2001          ; $ef9d: 8d 01 20  
            RTS                ; $efa0: 60        

;-------------------------------------------------------------------------------
__efa1:     JSR __efbc         ; $efa1: 20 bc ef  
            LDA #$00           ; $efa4: a9 00     
            STA $2001          ; $efa6: 8d 01 20  
            RTS                ; $efa9: 60        

;-------------------------------------------------------------------------------
__efaa:     LDA #$00           ; $efaa: a9 00     
            STA $10            ; $efac: 85 10     
            LDA #$07           ; $efae: a9 07     
            STA $11            ; $efb0: 85 11     
            LDY #$00           ; $efb2: a0 00     
            LDA #$f8           ; $efb4: a9 f8     
__efb6:     STA ($10),y        ; $efb6: 91 10     
            INY                ; $efb8: c8        
            BNE __efb6         ; $efb9: d0 fb     
            RTS                ; $efbb: 60        

;-------------------------------------------------------------------------------
__efbc:     LDA $2002          ; $efbc: ad 02 20  
            BMI __efbc         ; $efbf: 30 fb     
__efc1:     LDA $2002          ; $efc1: ad 02 20  
            BPL __efc1         ; $efc4: 10 fb     
            RTS                ; $efc6: 60        

;-------------------------------------------------------------------------------
__efc7:     JSR __efbc         ; $efc7: 20 bc ef  
            LDA #$90           ; $efca: a9 90     
            STA $2000          ; $efcc: 8d 00 20  
            RTS                ; $efcf: 60        

;-------------------------------------------------------------------------------
__efd0:     LDA #$00           ; $efd0: a9 00     
            STA $0200          ; $efd2: 8d 00 02  
            STA $0201          ; $efd5: 8d 01 02  
__efd8:     LDA $0200          ; $efd8: ad 00 02  
            BNE __efd8         ; $efdb: d0 fb     
            LDA #$10           ; $efdd: a9 10     
            STA $2000          ; $efdf: 8d 00 20  
            RTS                ; $efe2: 60        

;-------------------------------------------------------------------------------
            LDA #$00           ; $efe3: a9 00     
            STA $34            ; $efe5: 85 34     
            RTS                ; $efe7: 60        

;-------------------------------------------------------------------------------
__efe8:     LDA #$00           ; $efe8: a9 00     
            STA $38            ; $efea: 85 38     
            RTS                ; $efec: 60        

;-------------------------------------------------------------------------------
__efed:     PHA                ; $efed: 48        
__efee:     LDA $a7            ; $efee: a5 a7     
            BNE __f002         ; $eff0: d0 10     
            LDA #$da           ; $eff2: a9 da     
            STA $36            ; $eff4: 85 36     
            LDA #$f5           ; $eff6: a9 f5     
            STA $37            ; $eff8: 85 37     
            LDA #$01           ; $effa: a9 01     
            STA $38            ; $effc: 85 38     
            LDA #$02           ; $effe: a9 02     
            STA $39            ; $f000: 85 39     
__f002:     PLA                ; $f002: 68        
            RTS                ; $f003: 60        

;-------------------------------------------------------------------------------
__f004:     LDA #$b9           ; $f004: a9 b9     
            STA $32            ; $f006: 85 32     
            LDA #$f5           ; $f008: a9 f5     
            STA $33            ; $f00a: 85 33     
            LDA #$ba           ; $f00c: a9 ba     
            STA $36            ; $f00e: 85 36     
            LDA #$f5           ; $f010: a9 f5     
            STA $37            ; $f012: 85 37     
__f014:     LDA #$01           ; $f014: a9 01     
            STA $34            ; $f016: 85 34     
            STA $38            ; $f018: 85 38     
            RTS                ; $f01a: 60        

;-------------------------------------------------------------------------------
__f01b:     LDA $20            ; $f01b: a5 20     
            AND #$01           ; $f01d: 29 01     
            BNE __f02c         ; $f01f: d0 0b     
            LDA #$44           ; $f021: a9 44     
            STA $3a            ; $f023: 85 3a     
            LDA #$f5           ; $f025: a9 f5     
            STA $3b            ; $f027: 85 3b     
            JMP __f034         ; $f029: 4c 34 f0  

;-------------------------------------------------------------------------------
__f02c:     LDA #$03           ; $f02c: a9 03     
            STA $3a            ; $f02e: 85 3a     
            LDA #$f5           ; $f030: a9 f5     
            STA $3b            ; $f032: 85 3b     
__f034:     LDA #$01           ; $f034: a9 01     
            STA $3c            ; $f036: 85 3c     
            RTS                ; $f038: 60        

;-------------------------------------------------------------------------------
__f039:     LDA #$7b           ; $f039: a9 7b     
            STA $3a            ; $f03b: 85 3a     
            LDA #$f3           ; $f03d: a9 f3     
            STA $3b            ; $f03f: 85 3b     
            LDA #$01           ; $f041: a9 01     
            STA $3c            ; $f043: 85 3c     
            RTS                ; $f045: 60        

;-------------------------------------------------------------------------------
__f046:     LDA #$7a           ; $f046: a9 7a     
            STA $32            ; $f048: 85 32     
            LDA #$f3           ; $f04a: a9 f3     
            STA $33            ; $f04c: 85 33     
            LDA #$7b           ; $f04e: a9 7b     
            STA $36            ; $f050: 85 36     
            LDA #$f3           ; $f052: a9 f3     
            STA $37            ; $f054: 85 37     
            LDA #$7c           ; $f056: a9 7c     
            STA $3a            ; $f058: 85 3a     
            LDA #$f3           ; $f05a: a9 f3     
            STA $3b            ; $f05c: 85 3b     
__f05e:     JSR __f014         ; $f05e: 20 14 f0  
            STA $3c            ; $f061: 85 3c     
            RTS                ; $f063: 60        

;-------------------------------------------------------------------------------
__f064:     LDA #$da           ; $f064: a9 da     
            STA $32            ; $f066: 85 32     
            LDA #$f3           ; $f068: a9 f3     
            STA $33            ; $f06a: 85 33     
            LDA #$db           ; $f06c: a9 db     
            STA $36            ; $f06e: 85 36     
            LDA #$f3           ; $f070: a9 f3     
            STA $37            ; $f072: 85 37     
            LDA #$dc           ; $f074: a9 dc     
            STA $3a            ; $f076: 85 3a     
            LDA #$f3           ; $f078: a9 f3     
            STA $3b            ; $f07a: 85 3b     
            JSR __f05e         ; $f07c: 20 5e f0  
            RTS                ; $f07f: 60        

;-------------------------------------------------------------------------------
__f080:     LDA #$b6           ; $f080: a9 b6     
            STA $32            ; $f082: 85 32     
            LDA #$f5           ; $f084: a9 f5     
            STA $33            ; $f086: 85 33     
            LDA #$01           ; $f088: a9 01     
            STA $34            ; $f08a: 85 34     
            RTS                ; $f08c: 60        

;-------------------------------------------------------------------------------
__f08d:     LDA #$aa           ; $f08d: a9 aa     
            STA $32            ; $f08f: 85 32     
            LDA #$f5           ; $f091: a9 f5     
            STA $33            ; $f093: 85 33     
            LDA #$01           ; $f095: a9 01     
            STA $34            ; $f097: 85 34     
            RTS                ; $f099: 60        

;-------------------------------------------------------------------------------
__f09a:     PHA                ; $f09a: 48        
            LDA $a7            ; $f09b: a5 a7     
            BNE __f0af         ; $f09d: d0 10     
            LDA #$85           ; $f09f: a9 85     
            STA $32            ; $f0a1: 85 32     
            LDA #$f5           ; $f0a3: a9 f5     
            STA $33            ; $f0a5: 85 33     
            LDA #$01           ; $f0a7: a9 01     
            STA $34            ; $f0a9: 85 34     
            LDA #$04           ; $f0ab: a9 04     
            STA $35            ; $f0ad: 85 35     
__f0af:     PLA                ; $f0af: 68        
            RTS                ; $f0b0: 60        

;-------------------------------------------------------------------------------
__f0b1:     PHA                ; $f0b1: 48        
            LDA $a7            ; $f0b2: a5 a7     
            BNE __f0c6         ; $f0b4: d0 10     
            LDA #$8b           ; $f0b6: a9 8b     
            STA $32            ; $f0b8: 85 32     
            LDA #$f5           ; $f0ba: a9 f5     
            STA $33            ; $f0bc: 85 33     
            LDA #$01           ; $f0be: a9 01     
            STA $34            ; $f0c0: 85 34     
            LDA #$04           ; $f0c2: a9 04     
            STA $35            ; $f0c4: 85 35     
__f0c6:     PLA                ; $f0c6: 68        
            RTS                ; $f0c7: 60        

;-------------------------------------------------------------------------------
__f0c8:     PHA                ; $f0c8: 48        
            LDA $a7            ; $f0c9: a5 a7     
            BNE __f0e6         ; $f0cb: d0 19     
            LDA $38            ; $f0cd: a5 38     
            BNE __f0e6         ; $f0cf: d0 15     
            LDA #$94           ; $f0d1: a9 94     
            STA $36            ; $f0d3: 85 36     
            LDA #$f5           ; $f0d5: a9 f5     
            STA $37            ; $f0d7: 85 37     
            LDA #$01           ; $f0d9: a9 01     
            STA $38            ; $f0db: 85 38     
            LDA #$02           ; $f0dd: a9 02     
            STA $39            ; $f0df: 85 39     
            LDA #$ac           ; $f0e1: a9 ac     
            STA $4005          ; $f0e3: 8d 05 40  
__f0e6:     PLA                ; $f0e6: 68        
            RTS                ; $f0e7: 60        

;-------------------------------------------------------------------------------
__f0e8:     PHA                ; $f0e8: 48        
            LDA $a7            ; $f0e9: a5 a7     
            BNE __f10a         ; $f0eb: d0 1d     
            LDA #$00           ; $f0ed: a9 00     
            STA $3c            ; $f0ef: 85 3c     
            LDA #$01           ; $f0f1: a9 01     
            STA $3f            ; $f0f3: 85 3f     
            LDA #$99           ; $f0f5: a9 99     
            STA $36            ; $f0f7: 85 36     
            LDA #$f5           ; $f0f9: a9 f5     
            STA $37            ; $f0fb: 85 37     
            LDA #$01           ; $f0fd: a9 01     
            STA $38            ; $f0ff: 85 38     
            LDA #$02           ; $f101: a9 02     
            STA $39            ; $f103: 85 39     
            LDA #$ac           ; $f105: a9 ac     
            STA $4005          ; $f107: 8d 05 40  
__f10a:     PLA                ; $f10a: 68        
            RTS                ; $f10b: 60        

;-------------------------------------------------------------------------------
__f10c:     PHA                ; $f10c: 48        
            LDA $a7            ; $f10d: a5 a7     
            BNE __f126         ; $f10f: d0 15     
            LDA #$91           ; $f111: a9 91     
            STA $36            ; $f113: 85 36     
            LDA #$f5           ; $f115: a9 f5     
            STA $37            ; $f117: 85 37     
            LDA #$01           ; $f119: a9 01     
            STA $38            ; $f11b: 85 38     
            LDA #$02           ; $f11d: a9 02     
            STA $39            ; $f11f: 85 39     
            LDA #$ac           ; $f121: a9 ac     
            STA $4005          ; $f123: 8d 05 40  
__f126:     PLA                ; $f126: 68        
            RTS                ; $f127: 60        

;-------------------------------------------------------------------------------
__f128:     PHA                ; $f128: 48        
            LDA $a7            ; $f129: a5 a7     
            BNE __f142         ; $f12b: d0 15     
            LDA #$97           ; $f12d: a9 97     
            STA $36            ; $f12f: 85 36     
            LDA #$f5           ; $f131: a9 f5     
            STA $37            ; $f133: 85 37     
            LDA #$01           ; $f135: a9 01     
            STA $38            ; $f137: 85 38     
            LDA #$02           ; $f139: a9 02     
            STA $39            ; $f13b: 85 39     
            LDA #$b3           ; $f13d: a9 b3     
            STA $4005          ; $f13f: 8d 05 40  
__f142:     PLA                ; $f142: 68        
            RTS                ; $f143: 60        

;-------------------------------------------------------------------------------
__f144:     JSR __f2d4         ; $f144: 20 d4 f2  
            LDA #$3d           ; $f147: a9 3d     
            STA $32            ; $f149: 85 32     
            LDA #$f4           ; $f14b: a9 f4     
            STA $33            ; $f14d: 85 33     
            LDA #$3e           ; $f14f: a9 3e     
            STA $36            ; $f151: 85 36     
            LDA #$f4           ; $f153: a9 f4     
            STA $37            ; $f155: 85 37     
            LDA #$3f           ; $f157: a9 3f     
            STA $3a            ; $f159: 85 3a     
            LDA #$f4           ; $f15b: a9 f4     
            STA $3b            ; $f15d: 85 3b     
            JSR __f05e         ; $f15f: 20 5e f0  
            RTS                ; $f162: 60        

;-------------------------------------------------------------------------------
__f163:     JSR __f2d4         ; $f163: 20 d4 f2  
            LDA #$9d           ; $f166: a9 9d     
            STA $32            ; $f168: 85 32     
            LDA #$f4           ; $f16a: a9 f4     
            STA $33            ; $f16c: 85 33     
            LDA #$9e           ; $f16e: a9 9e     
            STA $36            ; $f170: 85 36     
            LDA #$f4           ; $f172: a9 f4     
            STA $37            ; $f174: 85 37     
            LDA #$9f           ; $f176: a9 9f     
            STA $3a            ; $f178: 85 3a     
            LDA #$f4           ; $f17a: a9 f4     
            STA $3b            ; $f17c: 85 3b     
            JSR __f05e         ; $f17e: 20 5e f0  
            RTS                ; $f181: 60        

;-------------------------------------------------------------------------------
__f182:     PHA                ; $f182: 48        
            LDA $a7            ; $f183: a5 a7     
            BNE __f1a5         ; $f185: d0 1e     
            JSR __f2d4         ; $f187: 20 d4 f2  
            LDA #$d0           ; $f18a: a9 d0     
            STA $32            ; $f18c: 85 32     
            LDA #$f4           ; $f18e: a9 f4     
            STA $33            ; $f190: 85 33     
            LDA #$d1           ; $f192: a9 d1     
            STA $36            ; $f194: 85 36     
            LDA #$f4           ; $f196: a9 f4     
            STA $37            ; $f198: 85 37     
            LDA #$d2           ; $f19a: a9 d2     
            STA $3a            ; $f19c: 85 3a     
            LDA #$f4           ; $f19e: a9 f4     
            STA $3b            ; $f1a0: 85 3b     
            JSR __f05e         ; $f1a2: 20 5e f0  
__f1a5:     PLA                ; $f1a5: 68        
            RTS                ; $f1a6: 60        

;-------------------------------------------------------------------------------
__f1a7:     LDA $34            ; $f1a7: a5 34     
            BNE __f1ac         ; $f1a9: d0 01     
            RTS                ; $f1ab: 60        

;-------------------------------------------------------------------------------
__f1ac:     LDX #$05           ; $f1ac: a2 05     
            LDA $3e            ; $f1ae: a5 3e     
            BEQ __f1b4         ; $f1b0: f0 02     
            LDX #$09           ; $f1b2: a2 09     
__f1b4:     INC $35            ; $f1b4: e6 35     
            CPX $35            ; $f1b6: e4 35     
            BEQ __f1bb         ; $f1b8: f0 01     
            RTS                ; $f1ba: 60        

;-------------------------------------------------------------------------------
__f1bb:     LDA #$00           ; $f1bb: a9 00     
            STA $35            ; $f1bd: 85 35     
            LDY #$00           ; $f1bf: a0 00     
            LDA ($32),y        ; $f1c1: b1 32     
            BNE __f1ca         ; $f1c3: d0 05     
            LDA #$00           ; $f1c5: a9 00     
            STA $34            ; $f1c7: 85 34     
            RTS                ; $f1c9: 60        

;-------------------------------------------------------------------------------
__f1ca:     JSR __f329         ; $f1ca: 20 29 f3  
            BEQ __f1db         ; $f1cd: f0 0c     
            LDA $30            ; $f1cf: a5 30     
            STA $4002          ; $f1d1: 8d 02 40  
            LDA $31            ; $f1d4: a5 31     
            ORA #$20           ; $f1d6: 09 20     
            STA $4003          ; $f1d8: 8d 03 40  
__f1db:     LDA $3e            ; $f1db: a5 3e     
            BEQ __f1eb         ; $f1dd: f0 0c     
            INC $32            ; $f1df: e6 32     
            BNE __f1e5         ; $f1e1: d0 02     
            INC $33            ; $f1e3: e6 33     
__f1e5:     INC $32            ; $f1e5: e6 32     
            BNE __f1eb         ; $f1e7: d0 02     
            INC $33            ; $f1e9: e6 33     
__f1eb:     INC $32            ; $f1eb: e6 32     
            BNE __f1f1         ; $f1ed: d0 02     
            INC $33            ; $f1ef: e6 33     
__f1f1:     RTS                ; $f1f1: 60        

;-------------------------------------------------------------------------------
__f1f2:     LDA $38            ; $f1f2: a5 38     
            BNE __f1f7         ; $f1f4: d0 01     
            RTS                ; $f1f6: 60        

;-------------------------------------------------------------------------------
__f1f7:     LDX #$03           ; $f1f7: a2 03     
            LDA $3e            ; $f1f9: a5 3e     
            BEQ __f1ff         ; $f1fb: f0 02     
            LDX #$09           ; $f1fd: a2 09     
__f1ff:     INC $39            ; $f1ff: e6 39     
            CPX $39            ; $f201: e4 39     
            BEQ __f206         ; $f203: f0 01     
            RTS                ; $f205: 60        

;-------------------------------------------------------------------------------
__f206:     LDA #$00           ; $f206: a9 00     
            STA $39            ; $f208: 85 39     
            LDY #$00           ; $f20a: a0 00     
            LDA ($36),y        ; $f20c: b1 36     
            BNE __f215         ; $f20e: d0 05     
            LDA #$00           ; $f210: a9 00     
            STA $38            ; $f212: 85 38     
            RTS                ; $f214: 60        

;-------------------------------------------------------------------------------
__f215:     JSR __f329         ; $f215: 20 29 f3  
            BEQ __f226         ; $f218: f0 0c     
            LDA $30            ; $f21a: a5 30     
            STA $4006          ; $f21c: 8d 06 40  
            LDA $31            ; $f21f: a5 31     
            ORA #$20           ; $f221: 09 20     
            STA $4007          ; $f223: 8d 07 40  
__f226:     LDA $3e            ; $f226: a5 3e     
            BEQ __f236         ; $f228: f0 0c     
            INC $36            ; $f22a: e6 36     
            BNE __f230         ; $f22c: d0 02     
            INC $37            ; $f22e: e6 37     
__f230:     INC $36            ; $f230: e6 36     
            BNE __f236         ; $f232: d0 02     
            INC $37            ; $f234: e6 37     
__f236:     INC $36            ; $f236: e6 36     
            BNE __f23c         ; $f238: d0 02     
            INC $37            ; $f23a: e6 37     
__f23c:     RTS                ; $f23c: 60        

;-------------------------------------------------------------------------------
__f23d:     LDA $3c            ; $f23d: a5 3c     
            BNE __f242         ; $f23f: d0 01     
            RTS                ; $f241: 60        

;-------------------------------------------------------------------------------
__f242:     LDX #$09           ; $f242: a2 09     
            INC $3d            ; $f244: e6 3d     
            CPX $3d            ; $f246: e4 3d     
            BEQ __f24b         ; $f248: f0 01     
            RTS                ; $f24a: 60        

;-------------------------------------------------------------------------------
__f24b:     LDA #$00           ; $f24b: a9 00     
            STA $3d            ; $f24d: 85 3d     
__f24f:     LDY #$00           ; $f24f: a0 00     
            LDA ($3a),y        ; $f251: b1 3a     
            BNE __f26f         ; $f253: d0 1a     
            LDA $8f            ; $f255: a5 8f     
            BNE __f25f         ; $f257: d0 06     
            JSR __f01b         ; $f259: 20 1b f0  
            JMP __f262         ; $f25c: 4c 62 f2  

;-------------------------------------------------------------------------------
__f25f:     JSR __f039         ; $f25f: 20 39 f0  
__f262:     LDA $3f            ; $f262: a5 3f     
            BNE __f26a         ; $f264: d0 04     
            LDA $3e            ; $f266: a5 3e     
            BEQ __f24f         ; $f268: f0 e5     
__f26a:     LDA #$00           ; $f26a: a9 00     
            STA $3c            ; $f26c: 85 3c     
            RTS                ; $f26e: 60        

;-------------------------------------------------------------------------------
__f26f:     JSR __f329         ; $f26f: 20 29 f3  
            BEQ __f289         ; $f272: f0 15     
            LDA $30            ; $f274: a5 30     
            STA $400a          ; $f276: 8d 0a 40  
            LDA $31            ; $f279: a5 31     
            ORA #$10           ; $f27b: 09 10     
            STA $400b          ; $f27d: 8d 0b 40  
            LDA $57            ; $f280: a5 57     
            BNE __f289         ; $f282: d0 05     
            LDA #$01           ; $f284: a9 01     
            STA $400f          ; $f286: 8d 0f 40  
__f289:     LDA $8f            ; $f289: a5 8f     
            BNE __f291         ; $f28b: d0 04     
            LDA $3e            ; $f28d: a5 3e     
            BEQ __f29d         ; $f28f: f0 0c     
__f291:     INC $3a            ; $f291: e6 3a     
            BNE __f297         ; $f293: d0 02     
            INC $3b            ; $f295: e6 3b     
__f297:     INC $3a            ; $f297: e6 3a     
            BNE __f29d         ; $f299: d0 02     
            INC $3b            ; $f29b: e6 3b     
__f29d:     INC $3a            ; $f29d: e6 3a     
            BNE __f2a3         ; $f29f: d0 02     
            INC $3b            ; $f2a1: e6 3b     
__f2a3:     RTS                ; $f2a3: 60        

;-------------------------------------------------------------------------------
__f2a4:     LDA $a7            ; $f2a4: a5 a7     
            BNE __f2d0         ; $f2a6: d0 28     
            LDX $57            ; $f2a8: a6 57     
            DEX                ; $f2aa: ca        
            BNE __f2d0         ; $f2ab: d0 23     
            LDA $55            ; $f2ad: a5 55     
            LDX #$02           ; $f2af: a2 02     
            CMP #$31           ; $f2b1: c9 31     
            BEQ __f2c0         ; $f2b3: f0 0b     
            DEX                ; $f2b5: ca        
            CMP #$2e           ; $f2b6: c9 2e     
            BEQ __f2c0         ; $f2b8: f0 06     
            DEX                ; $f2ba: ca        
            CMP #$2b           ; $f2bb: c9 2b     
            BEQ __f2c0         ; $f2bd: f0 01     
            RTS                ; $f2bf: 60        

;-------------------------------------------------------------------------------
__f2c0:     LDA #$0a           ; $f2c0: a9 0a     
            STA $400c          ; $f2c2: 8d 0c 40  
            LDA __f2d1,x       ; $f2c5: bd d1 f2  
            STA $400e          ; $f2c8: 8d 0e 40  
            LDA #$40           ; $f2cb: a9 40     
            STA $400f          ; $f2cd: 8d 0f 40  
__f2d0:     RTS                ; $f2d0: 60        

;-------------------------------------------------------------------------------
__f2d1:     .hex 0c 05 08      ; $f2d1: 0c 05 08  Invalid Opcode - NOP $0805
__f2d4:     JSR __f2e4         ; $f2d4: 20 e4 f2  
            LDA #$01           ; $f2d7: a9 01     
            STA $3e            ; $f2d9: 85 3e     
            RTS                ; $f2db: 60        

;-------------------------------------------------------------------------------
__f2dc:     JSR __f2e4         ; $f2dc: 20 e4 f2  
            LDA #$00           ; $f2df: a9 00     
            STA $3e            ; $f2e1: 85 3e     
            RTS                ; $f2e3: 60        

;-------------------------------------------------------------------------------
__f2e4:     LDA #$0f           ; $f2e4: a9 0f     
            STA $4015          ; $f2e6: 8d 15 40  
            LDA #$00           ; $f2e9: a9 00     
            STA $35            ; $f2eb: 85 35     
            STA $34            ; $f2ed: 85 34     
            STA $39            ; $f2ef: 85 39     
            STA $38            ; $f2f1: 85 38     
            STA $3d            ; $f2f3: 85 3d     
            STA $3c            ; $f2f5: 85 3c     
            LDA #$ca           ; $f2f7: a9 ca     
            STA $4000          ; $f2f9: 8d 00 40  
            LDA #$00           ; $f2fc: a9 00     
            STA $4001          ; $f2fe: 8d 01 40  
            LDA #$c4           ; $f301: a9 c4     
            STA $4004          ; $f303: 8d 04 40  
            LDA #$00           ; $f306: a9 00     
            STA $4005          ; $f308: 8d 05 40  
            LDA #$20           ; $f30b: a9 20     
            STA $4008          ; $f30d: 8d 08 40  
            LDA #$00           ; $f310: a9 00     
            STA $400c          ; $f312: 8d 0c 40  
            LDA #$00           ; $f315: a9 00     
            STA $400e          ; $f317: 8d 0e 40  
            RTS                ; $f31a: 60        

;-------------------------------------------------------------------------------
__f31b:     LDA #$00           ; $f31b: a9 00     
            STA $4015          ; $f31d: 8d 15 40  
            LDA #$00           ; $f320: a9 00     
            STA $34            ; $f322: 85 34     
            STA $38            ; $f324: 85 38     
            STA $3c            ; $f326: 85 3c     
            RTS                ; $f328: 60        

;-------------------------------------------------------------------------------
__f329:     LDX #$00           ; $f329: a2 00     
            STX $30            ; $f32b: 86 30     
            STX $31            ; $f32d: 86 31     
            CMP #$81           ; $f32f: c9 81     
            BEQ __f35d         ; $f331: f0 2a     
            PHA                ; $f333: 48        
            AND #$0f           ; $f334: 29 0f     
            ASL                ; $f336: 0a        
            CLC                ; $f337: 18        
            ADC #$62           ; $f338: 69 62     
            STA $30            ; $f33a: 85 30     
            LDA #$f3           ; $f33c: a9 f3     
            ADC #$00           ; $f33e: 69 00     
            STA $31            ; $f340: 85 31     
            LDY #$00           ; $f342: a0 00     
            LDA ($30),y        ; $f344: b1 30     
            TAX                ; $f346: aa        
            INY                ; $f347: c8        
            LDA ($30),y        ; $f348: b1 30     
            STA $31            ; $f34a: 85 31     
            STX $30            ; $f34c: 86 30     
            PLA                ; $f34e: 68        
            LSR                ; $f34f: 4a        
            LSR                ; $f350: 4a        
            LSR                ; $f351: 4a        
            LSR                ; $f352: 4a        
            TAX                ; $f353: aa        
            BEQ __f35d         ; $f354: f0 07     
__f356:     LSR $31            ; $f356: 46 31     
            ROR $30            ; $f358: 66 30     
            DEX                ; $f35a: ca        
            BNE __f356         ; $f35b: d0 f9     
__f35d:     LDA $30            ; $f35d: a5 30     
            ORA $31            ; $f35f: 05 31     
            RTS                ; $f361: 60        

;-------------------------------------------------------------------------------
            LDX $4e06          ; $f362: ae 06 4e  
            ASL $f3            ; $f365: 06 f3     
            ORA $9e            ; $f367: 05 9e     
            ORA $4d            ; $f369: 05 4d     
            ORA $01            ; $f36b: 05 01     
            ORA $b9            ; $f36d: 05 b9     
            .hex 04 75         ; $f36f: 04 75     Invalid Opcode - NOP $75
            .hex 04 35         ; $f371: 04 35     Invalid Opcode - NOP $35
            .hex 04 f8         ; $f373: 04 f8     Invalid Opcode - NOP $f8
            .hex 03 bf         ; $f375: 03 bf     Invalid Opcode - SLO ($bf,x)
            .hex 03 89         ; $f377: 03 89     Invalid Opcode - SLO ($89,x)
            .hex 03 34         ; $f379: 03 34     Invalid Opcode - SLO ($34,x)
            BMI __f39d         ; $f37b: 30 20     
            STA ($27,x)        ; $f37d: 81 27     
            STA ($81,x)        ; $f37f: 81 81     
            BIT $81            ; $f381: 24 81     
            .hex 37 27         ; $f383: 37 27     Invalid Opcode - RLA $27,x
            JSR $3081          ; $f385: 20 81 30  
            JSR $2781          ; $f388: 20 81 27  
            STA ($34,x)        ; $f38b: 81 34     
            BIT $81            ; $f38d: 24 81     
            STA ($27,x)        ; $f38f: 81 27     
            STA ($32,x)        ; $f391: 81 32     
            .hex 2b 1b         ; $f393: 2b 1b     Invalid Opcode - ANC #$1b
            STA ($28,x)        ; $f395: 81 28     
            STA ($81,x)        ; $f397: 81 81     
            BIT $81            ; $f399: 24 81     
            .hex 34 28         ; $f39b: 34 28     Invalid Opcode - NOP $28,x
__f39d:     .hex 1b 81 2b      ; $f39d: 1b 81 2b  Invalid Opcode - SLO $2b81,y
            .hex 1b 81 28      ; $f3a0: 1b 81 28  Invalid Opcode - SLO $2881,y
            STA ($32,x)        ; $f3a3: 81 32     
            BIT $81            ; $f3a5: 24 81     
            STA ($28,x)        ; $f3a7: 81 28     
            STA ($30,x)        ; $f3a9: 81 30     
            AND #$19           ; $f3ab: 29 19     
            STA ($25,x)        ; $f3ad: 81 25     
            STA ($81,x)        ; $f3af: 81 81     
            JSR $3281          ; $f3b1: 20 81 32  
            AND $19            ; $f3b4: 25 19     
            STA ($29,x)        ; $f3b6: 81 29     
            ORA $2581,y        ; $f3b8: 19 81 25  
            STA ($30,x)        ; $f3bb: 81 30     
            JSR $8181          ; $f3bd: 20 81 81  
            AND $81            ; $f3c0: 25 81     
            AND #$29           ; $f3c2: 29 29     
            .hex 17 81         ; $f3c4: 17 81     Invalid Opcode - SLO $81,x
            BIT $81            ; $f3c6: 24 81     
            STA ($20,x)        ; $f3c8: 81 20     
            STA ($81,x)        ; $f3ca: 81 81     
            BIT $17            ; $f3cc: 24 17     
            STA ($29,x)        ; $f3ce: 81 29     
            .hex 17 81         ; $f3d0: 17 81     Invalid Opcode - SLO $81,x
            BIT $81            ; $f3d2: 24 81     
            STA ($20,x)        ; $f3d4: 81 20     
            STA ($81,x)        ; $f3d6: 81 81     
            BIT $81            ; $f3d8: 24 81     
            .hex 32            ; $f3da: 32        Invalid Opcode - KIL 
            AND #$19           ; $f3db: 29 19     
            STA ($22,x)        ; $f3dd: 81 22     
            STA ($81,x)        ; $f3df: 81 81     
            AND #$81           ; $f3e1: 29 81     
            .hex 34 22         ; $f3e3: 34 22     Invalid Opcode - NOP $22,x
            ORA $2981,y        ; $f3e5: 19 81 29  
            ORA $2281,y        ; $f3e8: 19 81 22  
            STA ($32,x)        ; $f3eb: 81 32     
            AND #$81           ; $f3ed: 29 81     
            STA ($22,x)        ; $f3ef: 81 22     
            STA ($37,x)        ; $f3f1: 81 37     
            .hex 2b 1b         ; $f3f3: 2b 1b     Invalid Opcode - ANC #$1b
            STA ($27,x)        ; $f3f5: 81 27     
            STA ($81,x)        ; $f3f7: 81 81     
            .hex 22            ; $f3f9: 22        Invalid Opcode - KIL 
            STA ($33,x)        ; $f3fa: 81 33     
            .hex 27 1b         ; $f3fc: 27 1b     Invalid Opcode - RLA $1b
            STA ($2b,x)        ; $f3fe: 81 2b     
            .hex 1b 81 27      ; $f400: 1b 81 27  Invalid Opcode - SLO $2781,y
            STA ($34,x)        ; $f403: 81 34     
            AND #$81           ; $f405: 29 81     
            STA ($2b,x)        ; $f407: 81 2b     
            STA ($30,x)        ; $f409: 81 30     
            BMI __f42d         ; $f40b: 30 20     
            BMI __f443         ; $f40d: 30 34     
            STA ($34,x)        ; $f40f: 81 34     
            .hex 37 17         ; $f411: 37 17     Invalid Opcode - RLA $17,x
            .hex 27 30         ; $f413: 27 30     Invalid Opcode - RLA $30
            STA ($30,x)        ; $f415: 81 30     
            .hex 34 19         ; $f417: 34 19     Invalid Opcode - NOP $19,x
            .hex 34 37         ; $f419: 34 37     Invalid Opcode - NOP $37,x
            STA ($30,x)        ; $f41b: 81 30     
            .hex 34 1b         ; $f41d: 34 1b     Invalid Opcode - NOP $1b,x
            .hex 34 37         ; $f41f: 34 37     Invalid Opcode - NOP $37,x
            STA ($37,x)        ; $f421: 81 37     
            RTI                ; $f423: 40        

;-------------------------------------------------------------------------------
            JSR $8181          ; $f424: 20 81 81  
            STA ($81,x)        ; $f427: 81 81     
            STA ($17,x)        ; $f429: 81 17     
            STA ($81,x)        ; $f42b: 81 81     
__f42d:     STA ($81,x)        ; $f42d: 81 81     
            STA ($20,x)        ; $f42f: 81 20     
            STA ($81,x)        ; $f431: 81 81     
            STA ($81,x)        ; $f433: 81 81     
            STA ($81,x)        ; $f435: 81 81     
            STA ($81,x)        ; $f437: 81 81     
            STA ($00,x)        ; $f439: 81 00     
            BRK                ; $f43b: 00        
            BRK                ; $f43c: 00        
            .hex 34 30         ; $f43d: 34 30     Invalid Opcode - NOP $30,x
            JSR $8181          ; $f43f: 20 81 81  
            .hex 81            ; $f442: 81        Suspected data
__f443:     .hex 34 24         ; $f443: 34 24     Invalid Opcode - NOP $24,x
            STA ($81,x)        ; $f445: 81 81     
            .hex 27 81         ; $f447: 27 81     Invalid Opcode - RLA $81
            .hex 34 30         ; $f449: 34 30     Invalid Opcode - NOP $30,x
            .hex 17 81         ; $f44b: 17 81     Invalid Opcode - SLO $81,x
            STA ($81,x)        ; $f44d: 81 81     
            .hex 32            ; $f44f: 32        Invalid Opcode - KIL 
            BIT $81            ; $f450: 24 81     
            .hex 34 27         ; $f452: 34 27     Invalid Opcode - NOP $27,x
            STA ($35,x)        ; $f454: 81 35     
            BMI __f46d         ; $f456: 30 15     
            STA ($81,x)        ; $f458: 81 81     
            STA ($32,x)        ; $f45a: 81 32     
            AND $81            ; $f45c: 25 81     
            STA ($29,x)        ; $f45e: 81 29     
            STA ($32,x)        ; $f460: 81 32     
            STA ($20,x)        ; $f462: 81 20     
            STA ($25,x)        ; $f464: 81 25     
            STA ($81,x)        ; $f466: 81 81     
            AND #$81           ; $f468: 29 81     
            STA ($81,x)        ; $f46a: 81 81     
            .hex 81            ; $f46c: 81        Suspected data
__f46d:     .hex 2b 25         ; $f46d: 2b 25     Invalid Opcode - ANC #$25
            .hex 17 29         ; $f46f: 17 29     Invalid Opcode - SLO $29,x
            STA ($81,x)        ; $f471: 81 81     
            .hex 27 22         ; $f473: 27 22     Invalid Opcode - RLA $22
            STA ($2b,x)        ; $f475: 81 2b     
            STA ($81,x)        ; $f477: 81 81     
            AND #$1b           ; $f479: 29 1b     
            .hex 1b 27 81      ; $f47b: 1b 27 81  Invalid Opcode - SLO $8127,y
            STA ($29,x)        ; $f47e: 81 29     
            .hex 22            ; $f480: 22        Invalid Opcode - KIL 
            STA ($2b,x)        ; $f481: 81 2b     
            STA ($81,x)        ; $f483: 81 81     
            BMI __f4ae         ; $f485: 30 27     
            JSR $8181          ; $f487: 20 81 81  
            STA ($30,x)        ; $f48a: 81 30     
            .hex 23 81         ; $f48c: 23 81     Invalid Opcode - RLA ($81,x)
            STA ($24,x)        ; $f48e: 81 24     
            STA ($30,x)        ; $f490: 81 30     
            JSR $8120          ; $f492: 20 20 81  
            STA ($81,x)        ; $f495: 81 81     
            STA ($81,x)        ; $f497: 81 81     
__f499:     STA ($00,x)        ; $f499: 81 00     
            BRK                ; $f49b: 00        
            BRK                ; $f49c: 00        
            .hex 37 28         ; $f49d: 37 28     Invalid Opcode - RLA $28,x
            ORA $35,x          ; $f49f: 15 35     
__f4a1:     AND #$81           ; $f4a1: 29 81     
            STA ($30,x)        ; $f4a3: 81 30     
            STA ($35,x)        ; $f4a5: 81 35     
            AND #$15           ; $f4a7: 29 15     
            AND $23,x          ; $f4a9: 35 23     
            JSR $2434          ; $f4ab: 20 34 24  
__f4ae:     STA ($81,x)        ; $f4ae: 81 81     
            .hex 27 81         ; $f4b0: 27 81     Invalid Opcode - RLA $81
            .hex 34 24         ; $f4b2: 34 24     Invalid Opcode - NOP $24,x
            JSR $2737          ; $f4b4: 20 37 27  
            .hex 17 35         ; $f4b7: 17 35     Invalid Opcode - SLO $35,x
            AND #$81           ; $f4b9: 29 81     
            .hex 34 2b         ; $f4bb: 34 2b     Invalid Opcode - NOP $2b,x
            .hex 1b 32 32      ; $f4bd: 1b 32 32  Invalid Opcode - SLO $3232,y
            STA ($30,x)        ; $f4c0: 81 30     
            BMI __f4e4         ; $f4c2: 30 20     
            STA ($81,x)        ; $f4c4: 81 81     
            STA ($81,x)        ; $f4c6: 81 81     
            STA ($81,x)        ; $f4c8: 81 81     
            STA ($81,x)        ; $f4ca: 81 81     
            STA ($00,x)        ; $f4cc: 81 00     
            BRK                ; $f4ce: 00        
            BRK                ; $f4cf: 00        
            BMI __f4f2         ; $f4d0: 30 20     
            JSR $8181          ; $f4d2: 20 81 81  
            STA ($27,x)        ; $f4d5: 81 27     
            .hex 17 24         ; $f4d7: 17 24     Invalid Opcode - SLO $24,x
            .hex 27 17         ; $f4d9: 27 17     Invalid Opcode - RLA $17
            STA ($28,x)        ; $f4db: 81 28     
            CLC                ; $f4dd: 18        
            .hex 17 81         ; $f4de: 17 81     Invalid Opcode - SLO $81,x
            STA ($81,x)        ; $f4e0: 81 81     
            BIT $14            ; $f4e2: 24 14     
__f4e4:     BIT $25            ; $f4e4: 24 25     
            ORA $81,x          ; $f4e6: 15 81     
            .hex 27 17         ; $f4e8: 27 17     Invalid Opcode - RLA $17
            .hex 1b 29 19      ; $f4ea: 1b 29 19  Invalid Opcode - SLO $1929,y
            STA ($2b,x)        ; $f4ed: 81 2b     
            .hex 1b 22 81      ; $f4ef: 1b 22 81  Invalid Opcode - SLO $8122,y
__f4f2:     STA ($81,x)        ; $f4f2: 81 81     
            BMI __f516         ; $f4f4: 30 20     
            JSR $8181          ; $f4f6: 20 81 81  
            STA ($81,x)        ; $f4f9: 81 81     
            STA ($81,x)        ; $f4fb: 81 81     
            STA ($81,x)        ; $f4fd: 81 81     
            STA ($00,x)        ; $f4ff: 81 00     
            BRK                ; $f501: 00        
            BRK                ; $f502: 00        
            JSR $8181          ; $f503: 20 81 81  
            .hex 27 81         ; $f506: 27 81     Invalid Opcode - RLA $81
            STA ($24,x)        ; $f508: 81 24     
            STA ($20,x)        ; $f50a: 81 20     
            STA ($81,x)        ; $f50c: 81 81     
            .hex 27 81         ; $f50e: 27 81     Invalid Opcode - RLA $81
            STA ($24,x)        ; $f510: 81 24     
            STA ($25,x)        ; $f512: 81 25     
            STA ($81,x)        ; $f514: 81 81     
__f516:     BMI __f499         ; $f516: 30 81     
            STA ($29,x)        ; $f518: 81 29     
            STA ($25,x)        ; $f51a: 81 25     
            STA ($81,x)        ; $f51c: 81 81     
            BMI __f4a1         ; $f51e: 30 81     
            STA ($29,x)        ; $f520: 81 29     
            STA ($20,x)        ; $f522: 81 20     
            STA ($81,x)        ; $f524: 81 81     
            .hex 27 81         ; $f526: 27 81     Invalid Opcode - RLA $81
            STA ($24,x)        ; $f528: 81 24     
            STA ($20,x)        ; $f52a: 81 20     
            STA ($81,x)        ; $f52c: 81 81     
            .hex 27 81         ; $f52e: 27 81     Invalid Opcode - RLA $81
            STA ($24,x)        ; $f530: 81 24     
            STA ($17,x)        ; $f532: 81 17     
            STA ($81,x)        ; $f534: 81 81     
            .hex 1b 81 81      ; $f536: 1b 81 81  Invalid Opcode - SLO $8181,y
            .hex 22            ; $f539: 22        Invalid Opcode - KIL 
            STA ($17,x)        ; $f53a: 81 17     
            STA ($81,x)        ; $f53c: 81 81     
            .hex 1b 81 81      ; $f53e: 1b 81 81  Invalid Opcode - SLO $8181,y
            .hex 22            ; $f541: 22        Invalid Opcode - KIL 
            STA ($00,x)        ; $f542: 81 00     
            JSR $2481          ; $f544: 20 81 24  
            STA ($27,x)        ; $f547: 81 27     
            STA ($17,x)        ; $f549: 81 17     
            JSR $2081          ; $f54b: 20 81 20  
            BIT $81            ; $f54e: 24 81     
            .hex 27 81         ; $f550: 27 81     Invalid Opcode - RLA $81
            JSR $2581          ; $f552: 20 81 25  
            STA ($29,x)        ; $f555: 81 29     
            STA ($30,x)        ; $f557: 81 30     
            STA ($20,x)        ; $f559: 81 20     
            AND $81            ; $f55b: 25 81     
            AND $29            ; $f55d: 25 29     
            STA ($30,x)        ; $f55f: 81 30     
            STA ($1b,x)        ; $f561: 81 1b     
            STA ($20,x)        ; $f563: 81 20     
            STA ($24,x)        ; $f565: 81 24     
            STA ($27,x)        ; $f567: 81 27     
            STA ($17,x)        ; $f569: 81 17     
            JSR $2081          ; $f56b: 20 81 20  
            BIT $81            ; $f56e: 24 81     
            .hex 27 81         ; $f570: 27 81     Invalid Opcode - RLA $81
            JSR $2581          ; $f572: 20 81 25  
            STA ($22,x)        ; $f575: 81 22     
            STA ($1b,x)        ; $f577: 81 1b     
            STA ($25,x)        ; $f579: 81 25     
            .hex 22            ; $f57b: 22        Invalid Opcode - KIL 
            STA ($1b,x)        ; $f57c: 81 1b     
            .hex 17 81         ; $f57e: 17 81     Invalid Opcode - SLO $81,x
            ORA $1b81,y        ; $f580: 19 81 1b  
            STA ($00,x)        ; $f583: 81 00     
            .hex 14 24         ; $f585: 14 24     Invalid Opcode - NOP $24,x
            .hex 34 44         ; $f587: 34 44     Invalid Opcode - NOP $44,x
            RTI                ; $f589: 40        

;-------------------------------------------------------------------------------
            BRK                ; $f58a: 00        
            .hex 17 27         ; $f58b: 17 27     Invalid Opcode - SLO $27,x
            .hex 37 47         ; $f58d: 37 47     Invalid Opcode - RLA $47,x
            .hex 44 00         ; $f58f: 44 00     Invalid Opcode - NOP $00
            JSR $0022          ; $f591: 20 22 00  
            BIT $28            ; $f594: 24 28     
            BRK                ; $f596: 00        
            BPL __f599         ; $f597: 10 00     
__f599:     BVC __f5e3         ; $f599: 50 48     
            .hex 44 40         ; $f59b: 44 40     Invalid Opcode - NOP $40
            RTI                ; $f59d: 40        

;-------------------------------------------------------------------------------
            SEC                ; $f59e: 38        
            .hex 34 30         ; $f59f: 34 30     Invalid Opcode - NOP $30,x
            BMI __f5cb         ; $f5a1: 30 28     
            BIT $20            ; $f5a3: 24 20     
            JSR $1418          ; $f5a5: 20 18 14  
            BPL __f5aa         ; $f5a8: 10 00     
__f5aa:     RTI                ; $f5aa: 40        

;-------------------------------------------------------------------------------
            STA ($81,x)        ; $f5ab: 81 81     
            .hex 3b 81 81      ; $f5ad: 3b 81 81  Invalid Opcode - RLA $8181,y
            RTI                ; $f5b0: 40        

;-------------------------------------------------------------------------------
            STA ($81,x)        ; $f5b1: 81 81     
            BRK                ; $f5b3: 00        
            BRK                ; $f5b4: 00        
            BRK                ; $f5b5: 00        
            BVC __f5f8         ; $f5b6: 50 40     
            BRK                ; $f5b8: 00        
            .hex 37 34         ; $f5b9: 37 34     Invalid Opcode - RLA $34,x
            STA ($37,x)        ; $f5bb: 81 37     
            .hex 34 81         ; $f5bd: 34 81     Invalid Opcode - NOP $81,x
            .hex 37 34         ; $f5bf: 37 34     Invalid Opcode - RLA $34,x
            STA ($39,x)        ; $f5c1: 81 39     
            ROL $81,x          ; $f5c3: 36 81     
            AND $8136,y        ; $f5c5: 39 36 81  
            AND $8136,y        ; $f5c8: 39 36 81  
__f5cb:     .hex 4b 38         ; $f5cb: 4b 38     Invalid Opcode - ALR #$38
            STA ($81,x)        ; $f5cd: 81 81     
            STA ($81,x)        ; $f5cf: 81 81     
            STA ($81,x)        ; $f5d1: 81 81     
            STA ($81,x)        ; $f5d3: 81 81     
            STA ($81,x)        ; $f5d5: 81 81     
            BRK                ; $f5d7: 00        
            BRK                ; $f5d8: 00        
            BRK                ; $f5d9: 00        
            LSR                ; $f5da: 4a        
            .hex 44 42         ; $f5db: 44 42     Invalid Opcode - NOP $42
            RTI                ; $f5dd: 40        

;-------------------------------------------------------------------------------
            .hex 3a            ; $f5de: 3a        Invalid Opcode - NOP 
            .hex 34 32         ; $f5df: 34 32     Invalid Opcode - NOP $32,x
            BMI __f5e3         ; $f5e1: 30 00     
__f5e3:     .hex ff ff ff      ; $f5e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5e9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5ec: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5ef: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5f2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5f5: ff ff ff  Invalid Opcode - ISC $ffff,x
__f5f8:     .hex ff ff ff      ; $f5f8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5fb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff 2a      ; $f5fe: ff ff 2a  Invalid Opcode - ISC $2aff,x
            .hex 47 8e         ; $f601: 47 8e     Invalid Opcode - SRE $8e
            .hex ff            ; $f603: ff        Suspected data
__f604:     .hex ff 95 ff      ; $f604: ff 95 ff  Invalid Opcode - ISC __ff95,x
            .hex 72            ; $f607: 72        Invalid Opcode - KIL 
            EOR __ff25,x       ; $f608: 5d 25 ff  
            .hex ff 80 cc      ; $f60b: ff 80 cc  Invalid Opcode - ISC __cc80,x
            CPY __e0ae         ; $f60e: cc ae e0  
            LDY #$cc           ; $f611: a0 cc     
            CPY __c30c         ; $f613: cc 0c c3  
            CPY $8c38          ; $f616: cc 38 8c  
            .hex c3 f8         ; $f619: c3 f8     Invalid Opcode - DCP ($f8,x)
            .hex 3f 8c c3      ; $f61b: 3f 8c c3  Invalid Opcode - RLA __c38c,x
            .hex cc cf         ; $f61e: cc cf     Suspected data
__f620:     DEC __cc38         ; $f620: ce 38 cc  
            .hex d4 31         ; $f623: d4 31     Invalid Opcode - NOP $31,x
            ORA __c10a         ; $f625: 0d 0a c1  
            CPY $2ecc          ; $f628: cc cc 2e  
            .hex 1a            ; $f62b: 1a        Invalid Opcode - NOP 
            EOR #$ff           ; $f62c: 49 ff     
            .hex ff 16 ff      ; $f62e: ff 16 ff  Invalid Opcode - ISC __ff16,x
            EOR $52,x          ; $f631: 55 52     
            .hex ff ff ff      ; $f633: ff ff ff  Invalid Opcode - ISC $ffff,x
            BRK                ; $f636: 00        
            CPY __cccc         ; $f637: cc cc cc  
            CPY $3e09          ; $f63a: cc 09 3e  
            BNE __f604         ; $f63d: d0 c5     
            .hex 3c cc 8c      ; $f63f: 3c cc 8c  Invalid Opcode - NOP $8ccc,x
            .hex 43 c3         ; $f642: 43 c3     Invalid Opcode - SRE ($c3,x)
            SEC                ; $f644: 38        
            ROL $8c34,x        ; $f645: 3e 34 8c  
            .hex c3 38         ; $f648: c3 38     Invalid Opcode - DCP ($38,x)
            BMI __f658         ; $f64a: 30 0c     
            .hex c3 38         ; $f64c: c3 38     Invalid Opcode - DCP ($38,x)
            BMI __f65c         ; $f64e: 30 0c     
            .hex e3 38         ; $f650: e3 38     Invalid Opcode - ISC ($38,x)
            BMI __f620         ; $f652: 30 cc     
            .hex 0c c9 cc      ; $f654: 0c c9 cc  Invalid Opcode - NOP __ccc9
            .hex 4c            ; $f657: 4c        Suspected data
__f658:     ROL $4884          ; $f658: 2e 84 48  
            .hex ff            ; $f65b: ff        Suspected data
__f65c:     .hex ff 47 ff      ; $f65c: ff 47 ff  Invalid Opcode - ISC __ff47,x
            JMP ($7553)        ; $f65f: 6c 53 75  

;-------------------------------------------------------------------------------
            .hex 3a            ; $f662: 3a        Invalid Opcode - NOP 
            .hex ff c0 cc      ; $f663: ff c0 cc  Invalid Opcode - ISC __ccc0,x
            CPY $0a06          ; $f666: cc 06 0a  
            ASL $0a            ; $f669: 06 0a     
            DEC $cc            ; $f66b: c6 cc     
            .hex 0c            ; $f66d: 0c        Suspected data
__f66e:     .hex c3 cc         ; $f66e: c3 cc     Invalid Opcode - DCP ($cc,x)
            .hex 43 c3         ; $f670: 43 c3     Invalid Opcode - SRE ($c3,x)
            CPY __c343         ; $f672: cc 43 c3  
            CMP __c343         ; $f675: cd 43 c3  
            CMP __c343         ; $f678: cd 43 c3  
            CMP __c343         ; $f67b: cd 43 c3  
            CPY $1743          ; $f67e: cc 43 17  
            CPY __cc71         ; $f681: cc 71 cc  
            CPY $2cc0          ; $f684: cc c0 2c  
            ROR __ff57,x       ; $f687: 7e 57 ff  
            .hex ff 19 16      ; $f68a: ff 19 16  Invalid Opcode - ISC $1619,x
            CLI                ; $f68d: 58        
            AND __ff32,x       ; $f68e: 3d 32 ff  
            .hex ff 80 cc      ; $f691: ff 80 cc  Invalid Opcode - ISC __cc80,x
            CPY __c68c         ; $f694: cc 8c c6  
            PLA                ; $f697: 68        
            BNE __f66e         ; $f698: d0 d4     
            RTS                ; $f69a: 60        

;-------------------------------------------------------------------------------
            CPY $30cc          ; $f69b: cc cc 30  
            CPX $343c          ; $f69e: ec 3c 34  
            CPY $343c          ; $f6a1: cc 3c 34  
            CPY $743c          ; $f6a4: cc 3c 74  
            CPY $3438          ; $f6a7: cc 38 34  
            .hex cc 3c         ; $f6aa: cc 3c     Suspected data
__f6ac:     .hex 34 ca         ; $f6ac: 34 ca     Invalid Opcode - NOP $ca,x
            CPX $cc            ; $f6ae: e4 cc     
            CPY $2cc0          ; $f6b0: cc c0 2c  
            CLC                ; $f6b3: 18        
            .hex 7e 72         ; $f6b4: 7e 72     Suspected data
__f6b6:     .hex ff 16 ff      ; $f6b6: ff 16 ff  Invalid Opcode - ISC __ff16,x
            .hex 64 59         ; $f6b9: 64 59     Invalid Opcode - NOP $59
            .hex 57 ff         ; $f6bb: 57 ff     Invalid Opcode - SRE $ff,x
            .hex ff 80 d8      ; $f6bd: ff 80 d8  Invalid Opcode - ISC __d880,x
            ORA __c18c,x       ; $f6c0: 1d 8c c1  
            CLC                ; $f6c3: 18        
            .hex dc 30 0c      ; $f6c4: dc 30 0c  Invalid Opcode - NOP $0c30,x
            ORA $3f0c,x        ; $f6c7: 1d 0c 3f  
            CPY $3838          ; $f6ca: cc 38 38  
            CPY $3478          ; $f6cd: cc 78 34  
            CPY $3838          ; $f6d0: cc 38 38  
            CPY __cc38         ; $f6d3: cc 38 cc  
            STY __cce3         ; $f6d6: 8c e3 cc  
            CPY __cc90         ; $f6d9: cc 90 cc  
            CPY $37c4          ; $f6dc: cc c4 37  
__f6df:     .hex 33 0b         ; $f6df: 33 0b     Invalid Opcode - RLA ($0b),y
            .hex ff ff 93      ; $f6e1: ff ff 93  Invalid Opcode - ISC $93ff,x
            .hex ff 57 4b      ; $f6e4: ff 57 4b  Invalid Opcode - ISC $4b57,x
            .hex 7c 76 ff      ; $f6e7: 7c 76 ff  Invalid Opcode - NOP __ff76,x
            CPY #$cc           ; $f6ea: c0 cc     
            CPY $1d09          ; $f6ec: cc 09 1d  
            BNE __f6b6         ; $f6ef: d0 c5     
            CPY __cccc         ; $f6f1: cc cc cc  
            .hex 0c 0e 03      ; $f6f4: 0c 0e 03  Invalid Opcode - NOP $030e
            .hex 7a            ; $f6f7: 7a        Invalid Opcode - NOP 
            BMI __f71e         ; $f6f8: 30 24     
            .hex 3c 28 07      ; $f6fa: 3c 28 07  Invalid Opcode - NOP $0728,x
            .hex 43 0e         ; $f6fd: 43 0e     Invalid Opcode - SRE ($0e,x)
            .hex 03 02         ; $f6ff: 03 02     Invalid Opcode - SLO ($02,x)
            .hex 72            ; $f701: 72        Invalid Opcode - KIL 
            BMI __f6ac         ; $f702: 30 a8     
            BMI __f726         ; $f704: 30 20     
            JSR $20cf          ; $f706: 20 cf 20  
            BMI __f72b         ; $f709: 30 20     
            JSR $4703          ; $f70b: 20 03 47  
            LDX $3202,y        ; $f70e: be 02 32  
            BVS __f6df         ; $f711: 70 cc     
            CPY $3bc0          ; $f713: cc c0 3b  
            BIT $7a            ; $f716: 24 7a     
            .hex ff ff 17      ; $f718: ff ff 17  Invalid Opcode - ISC $17ff,x
            .hex ff 83 39      ; $f71b: ff 83 39  Invalid Opcode - ISC $3983,x
__f71e:     .hex ff ff ff      ; $f71e: ff ff ff  Invalid Opcode - ISC $ffff,x
            BRK                ; $f721: 00        
            LDX __c6e8         ; $f722: ae e8 c6  
            .hex cc            ; $f725: cc        Suspected data
__f726:     .hex 3c 34 b0      ; $f726: 3c 34 b0  Invalid Opcode - NOP $b034,x
            BMI __f79b         ; $f729: 30 70     
__f72b:     .hex 74 34         ; $f72b: 74 34     Invalid Opcode - NOP $34,x
            SEC                ; $f72d: 38        
            BMI __f760         ; $f72e: 30 30     
            SEC                ; $f730: 38        
            BMI __f763         ; $f731: 30 30     
            SEC                ; $f733: 38        
            BMI __f766         ; $f734: 30 30     
            SEC                ; $f736: 38        
            .hex 74 38         ; $f737: 74 38     Invalid Opcode - NOP $38,x
            BMI __f76b         ; $f739: 30 30     
            BMI __f76d         ; $f73b: 30 30     
            BMI __f76f         ; $f73d: 30 30     
            SEC                ; $f73f: 38        
            BMI __f7b2         ; $f740: 30 70     
            BCS __f778         ; $f742: b0 34     
            .hex 3a            ; $f744: 3a        Invalid Opcode - NOP 
            BMI __f777         ; $f745: 30 30     
            SEC                ; $f747: 38        
            .hex 0c c6 cc      ; $f748: 0c c6 cc  Invalid Opcode - NOP __ccc6
            TAY                ; $f74b: a8        
            LDY $cc            ; $f74c: a4 cc     
            CPY $34c4          ; $f74e: cc c4 34  
            ADC ($48),y        ; $f751: 71 48     
            .hex ff ff 47      ; $f753: ff ff 47  Invalid Opcode - ISC $47ff,x
            .hex ff 8c 63      ; $f756: ff 8c 63  Invalid Opcode - ISC $638c,x
            STX $69            ; $f759: 86 69     
            .hex ff c0 cc      ; $f75b: ff c0 cc  Invalid Opcode - ISC __ccc0,x
            .hex cc d2         ; $f75e: cc d2     Suspected data
__f760:     CMP __c365,x       ; $f760: dd 65 c3  
__f763:     CPY __d360         ; $f763: cc 60 d3  
__f766:     CMP __cc60,x       ; $f766: dd 60 cc  
            .hex 0c 63         ; $f769: 0c 63     Suspected data
__f76b:     .hex 1d de         ; $f76b: 1d de     Suspected data
__f76d:     .hex 63 83         ; $f76d: 63 83     Invalid Opcode - RRA ($83,x)
__f76f:     .hex e3 30         ; $f76f: e3 30     Invalid Opcode - ISC ($30,x)
            PLA                ; $f771: 68        
            .hex 93 e3         ; $f772: 93 e3     Invalid Opcode - AHX ($e3),y
            AND ($69),y        ; $f774: 31 69     
            .hex 34            ; $f776: 34        Suspected data
__f777:     .hex c1            ; $f777: c1        Suspected data
__f778:     BPL __f7ae         ; $f778: 10 34     
            RTS                ; $f77a: 60        

;-------------------------------------------------------------------------------
            .hex 34 c1         ; $f77b: 34 c1     Invalid Opcode - NOP $c1,x
            EOR $03            ; $f77d: 45 03     
            LSR $d3,x          ; $f77f: 56 d3     
            EOR $31            ; $f781: 45 31     
            JSR $8229          ; $f783: 20 29 82  
            STY $ffff          ; $f786: 8c ff ff  
            .hex 97 94         ; $f789: 97 94     Invalid Opcode - SAX $94,y
            EOR ($21),y        ; $f78b: 51 21     
            ROR $75,x          ; $f78d: 76 75     
            .hex ff c0 cc      ; $f78f: ff c0 cc  Invalid Opcode - ISC __ccc0,x
            CPY __dcdd         ; $f792: cc dd dc  
            CPY $0ccc          ; $f795: cc cc 0c  
            .hex c3 cc         ; $f798: c3 cc     Invalid Opcode - DCP ($cc,x)
            SEC                ; $f79a: 38        
__f79b:     CPY $760c          ; $f79b: cc 0c 76  
            DEC $0c            ; $f79e: c6 0c     
            DEC $c6            ; $f7a0: c6 c6     
            PLA                ; $f7a2: 68        
            JMP $60c6          ; $f7a3: 4c c6 60  

;-------------------------------------------------------------------------------
            CPY __c2c6         ; $f7a6: cc c6 c2  
            JMP __ccca         ; $f7a9: 4c ca cc  

;-------------------------------------------------------------------------------
            .hex 4c 2d         ; $f7ac: 4c 2d     Suspected data
__f7ae:     .hex 27 87         ; $f7ae: 27 87     Invalid Opcode - RLA $87
            .hex 53 ff         ; $f7b0: 53 ff     Invalid Opcode - SRE ($ff),y
__f7b2:     STY $ff,x          ; $f7b2: 94 ff     
            ORA $7815,y        ; $f7b4: 19 15 78  
            .hex ff ff c0      ; $f7b7: ff ff c0  Invalid Opcode - ISC __c0ff,x
            CPY $2ecc          ; $f7ba: cc cc 2e  
            LDY $e4            ; $f7bd: a4 e4     
            CPY $38cc          ; $f7bf: cc cc 38  
            CPY $0c30          ; $f7c2: cc 30 0c  
            .hex e3 e0         ; $f7c5: e3 e0     Invalid Opcode - ISC ($e0,x)
            .hex c3 cc         ; $f7c7: c3 cc     Invalid Opcode - DCP ($cc,x)
            CPY $383c          ; $f7c9: cc 3c 38  
            STY $3063          ; $f7cc: 8c 63 30  
            .hex 7a            ; $f7cf: 7a        Invalid Opcode - NOP 
            ROL $38,x          ; $f7d0: 36 38     
            CPY $3838          ; $f7d2: cc 38 38  
            CMP __cc39         ; $f7d5: cd 39 cc  
            CPY $2ac0          ; $f7d8: cc c0 2a  
            STY __ff08         ; $f7db: 8c 08 ff  
            .hex ff 99 96      ; $f7de: ff 99 96  Invalid Opcode - ISC $9699,x
            .hex 3c 32 29      ; $f7e1: 3c 32 29  Invalid Opcode - NOP $2932,x
            ROL $ff            ; $f7e4: 26 ff     
            CPY #$cc           ; $f7e6: c0 cc     
            CPY $a42e          ; $f7e8: cc 2e a4  
            CPX #$c2           ; $f7eb: e0 c2     
            CPY __cccc         ; $f7ed: cc cc cc  
            CPY $6ccc          ; $f7f0: cc cc 6c  
            .hex 54 53         ; $f7f3: 54 53     Invalid Opcode - NOP $53,x
            .hex 53 64         ; $f7f5: 53 64     Invalid Opcode - SRE ($64),y
            CPY $74cc          ; $f7f7: cc cc 74  
            CPY __c34c         ; $f7fa: cc 4c c3  
            CPY $4638          ; $f7fd: cc 38 46  
            LDX __cccc         ; $f800: ae cc cc  
            CPY $2f            ; $f803: c4 2f     
            ASL $96,x          ; $f805: 16 96     
            ROL $a8ff,x        ; $f807: 3e ff a8  
            .hex 17 78         ; $f80a: 17 78     Invalid Opcode - SLO $78,x
            PHA                ; $f80c: 48        
            AND __ff23         ; $f80d: 2d 23 ff  
            BRK                ; $f810: 00        
            LDY #$e0           ; $f811: a0 e0     
            ASL $ca            ; $f813: 06 ca     
            CPY __c34c         ; $f815: cc 4c c3  
            ORA ($c1,x)        ; $f818: 01 c1     
            BMI __f850         ; $f81a: 30 34     
            CLD                ; $f81c: d8        
            CMP ($43,x)        ; $f81d: c1 43     
            .hex d7            ; $f81f: d7        Suspected data
__f820:     BNE __f893         ; $f820: d0 71     
            CPY __d0cc         ; $f822: cc cc d0  
            .hex 13 98         ; $f825: 13 98     Invalid Opcode - SLO ($98),y
            .hex 93 0c         ; $f827: 93 0c     Invalid Opcode - AHX ($0c),y
            ORA $c5            ; $f829: 05 c5     
            .hex 0c c3 cc      ; $f82b: 0c c3 cc  Invalid Opcode - NOP __ccc3
__f82e:     SEC                ; $f82e: 38        
            STX __ccca         ; $f82f: 8e ca cc  
            JMP $872f          ; $f832: 4c 2f 87  

;-------------------------------------------------------------------------------
            PHA                ; $f835: 48        
            .hex ff ff 47      ; $f836: ff ff 47  Invalid Opcode - ISC $47ff,x
__f839:     .hex ff 5b 54      ; $f839: ff 5b 54  Invalid Opcode - ISC $545b,x
            .hex 3a            ; $f83c: 3a        Invalid Opcode - NOP 
            AND $ff,x          ; $f83d: 35 ff     
__f83f:     CPY #$cc           ; $f83f: c0 cc     
            CPY $5d0c          ; $f841: cc 0c 5d  
            STY $4cc3          ; $f844: 8c c3 4c  
            .hex c3 03         ; $f847: c3 03     Invalid Opcode - DCP ($03,x)
            .hex c3 34         ; $f849: c3 34     Invalid Opcode - DCP ($34,x)
            BMI __f889         ; $f84b: 30 3c     
            BMI __f83f         ; $f84d: 30 f0     
            .hex 30            ; $f84f: 30        Suspected data
__f850:     BMI __f88e         ; $f850: 30 3c     
            INX                ; $f852: e8        
            SEC                ; $f853: 38        
            .hex 3c e8 38      ; $f854: 3c e8 38  Invalid Opcode - NOP $38e8,x
            .hex 3c 41 4e      ; $f857: 3c 41 4e  Invalid Opcode - NOP $4e41,x
            AND ($cc),y        ; $f85a: 31 cc     
            CPY __cccc         ; $f85c: cc cc cc  
            CPY __c4cc         ; $f85f: cc cc c4  
            .hex 3f 32 0c      ; $f862: 3f 32 0c  Invalid Opcode - RLA $0c32,x
            ASL                ; $f865: 0a        
            .hex ff aa a4      ; $f866: ff aa a4  Invalid Opcode - ISC $a4aa,x
            .hex 7a            ; $f869: 7a        Invalid Opcode - NOP 
            .hex 5c 74 56      ; $f86a: 5c 74 56  Invalid Opcode - NOP $5674,x
            .hex ff c0 9c      ; $f86d: ff c0 9c  Invalid Opcode - ISC $9cc0,x
            TYA                ; $f870: 98        
            CPY $68cc          ; $f871: cc cc 68  
            .hex 0b 03         ; $f874: 0b 03     Invalid Opcode - ANC #$03
            .hex 03 03         ; $f876: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $f878: 03 03     Invalid Opcode - SLO ($03,x)
            ROL $b0,x          ; $f87a: 36 b0     
            BMI __f82e         ; $f87c: 30 b0     
            BMI __f8b8         ; $f87e: 30 38     
            BMI __f8b2         ; $f880: 30 30     
            BMI __f8b4         ; $f882: 30 30     
            BMI __f8b6         ; $f884: 30 30     
            CLV                ; $f886: b8        
            .hex f4 74         ; $f887: f4 74     Invalid Opcode - NOP $74,x
__f889:     SEC                ; $f889: 38        
            BMI __f900         ; $f88a: 30 74     
            BMI __f902         ; $f88c: 30 74     
__f88e:     SEC                ; $f88e: 38        
            BMI __f8c1         ; $f88f: 30 30     
            BMI __f8c3         ; $f891: 30 30     
__f893:     BCS __f8cd         ; $f893: b0 38     
            BMI __f8c7         ; $f895: 30 30     
            BMI __f8c9         ; $f897: 30 30     
            BMI __f8cb         ; $f899: 30 30     
            SEC                ; $f89b: 38        
            EOR __cc5d         ; $f89c: 4d 5d cc  
            CPY $2bc0          ; $f89f: cc c0 2b  
            ADC $08,x          ; $f8a2: 75 08     
            .hex ff ff 89      ; $f8a4: ff ff 89  Invalid Opcode - ISC $89ff,x
            STX $29            ; $f8a7: 86 29     
            ROL $68            ; $f8a9: 26 68     
            .hex 67 ff         ; $f8ab: 67 ff     Invalid Opcode - RRA $ff
            CPY #$cc           ; $f8ad: c0 cc     
            CPY __cccc         ; $f8af: cc cc cc  
__f8b2:     .hex d0            ; $f8b2: d0        Suspected data
__f8b3:     .hex 85            ; $f8b3: 85        Suspected data
__f8b4:     .hex 1d            ; $f8b4: 1d        Suspected data
__f8b5:     .hex cc            ; $f8b5: cc        Suspected data
__f8b6:     .hex cc cc         ; $f8b6: cc cc     Suspected data
__f8b8:     STY $46c3          ; $f8b8: 8c c3 46  
            .hex 47 06         ; $f8bb: 47 06     Invalid Opcode - SRE $06
            .hex c3 ca         ; $f8bd: c3 ca     Invalid Opcode - DCP ($ca,x)
            ASL                ; $f8bf: 0a        
            .hex c3            ; $f8c0: c3        Suspected data
__f8c1:     .hex ee 06         ; $f8c1: ee 06     Suspected data
__f8c3:     .hex c3 cc         ; $f8c3: c3 cc     Invalid Opcode - DCP ($cc,x)
            SEC                ; $f8c5: 38        
            TYA                ; $f8c6: 98        
__f8c7:     .hex 4c 39         ; $f8c7: 4c 39     Suspected data
__f8c9:     .hex cc cc         ; $f8c9: cc cc     Suspected data
__f8cb:     CPY #$35           ; $f8cb: c0 35     
__f8cd:     ASL $0e            ; $f8cd: 06 0e     
            .hex ff ff ac      ; $f8cf: ff ff ac  Invalid Opcode - ISC $acff,x
            LDY $8b            ; $f8d2: a4 8b     
            STA $ff            ; $f8d4: 85 ff     
            .hex ff ff 00      ; $f8d6: ff ff 00  Bad Addr Mode - ISC $00ff,x
            CPY $30cc          ; $f8d9: cc cc 30  
            SEC                ; $f8dc: 38        
            SEC                ; $f8dd: 38        
            SEC                ; $f8de: 38        
            SEC                ; $f8df: 38        
            SEC                ; $f8e0: 38        
            SEI                ; $f8e1: 78        
            .hex 34 38         ; $f8e2: 34 38     Invalid Opcode - NOP $38,x
            SEC                ; $f8e4: 38        
            SEC                ; $f8e5: 38        
            SEC                ; $f8e6: 38        
            SEC                ; $f8e7: 38        
            SEC                ; $f8e8: 38        
            SEC                ; $f8e9: 38        
            SEC                ; $f8ea: 38        
            SEC                ; $f8eb: 38        
            SEC                ; $f8ec: 38        
            SEC                ; $f8ed: 38        
            SEC                ; $f8ee: 38        
            SEC                ; $f8ef: 38        
            SEC                ; $f8f0: 38        
            SEC                ; $f8f1: 38        
            SEC                ; $f8f2: 38        
            SEC                ; $f8f3: 38        
            SEC                ; $f8f4: 38        
            SEC                ; $f8f5: 38        
            SEC                ; $f8f6: 38        
            SEC                ; $f8f7: 38        
            SEC                ; $f8f8: 38        
            SEC                ; $f8f9: 38        
            SEC                ; $f8fa: 38        
            SEC                ; $f8fb: 38        
            .hex 3a            ; $f8fc: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f8fd: 3a        Invalid Opcode - NOP 
            .hex ce cc         ; $f8fe: ce cc     Suspected data
__f900:     .hex 4c 26         ; $f900: 4c 26     Suspected data
__f902:     .hex 43 4f         ; $f902: 43 4f     Invalid Opcode - SRE ($4f,x)
            .hex ff ff 79      ; $f904: ff ff 79  Invalid Opcode - ISC $79ff,x
            ROR $3c            ; $f907: 66 3c     
            .hex 3a            ; $f909: 3a        Invalid Opcode - NOP 
            .hex ff ff ff      ; $f90a: ff ff ff  Invalid Opcode - ISC $ffff,x
            BRK                ; $f90d: 00        
            CPY __cccc         ; $f90e: cc cc cc  
            CPY $6e4c          ; $f911: cc 4c 6e  
            CPY __cccc         ; $f914: cc cc cc  
            CPY __c1dc         ; $f917: cc dc c1  
            STY $cc,x          ; $f91a: 94 cc     
            CPY $4ccc          ; $f91c: cc cc 4c  
            .hex c3 cc         ; $f91f: c3 cc     Invalid Opcode - DCP ($cc,x)
            SEC                ; $f921: 38        
            CPY __cb4c         ; $f922: cc 4c cb  
            CPY $3f4c          ; $f925: cc 4c 3f  
            .hex 12            ; $f928: 12        Invalid Opcode - KIL 
            PHA                ; $f929: 48        
            .hex ff ff 47      ; $f92a: ff ff 47  Invalid Opcode - ISC $47ff,x
            .hex ff 5c 53      ; $f92d: ff 5c 53  Invalid Opcode - ISC $535c,x
            .hex 3a            ; $f930: 3a        Invalid Opcode - NOP 
            AND $ff,x          ; $f931: 35 ff     
            CPY #$cc           ; $f933: c0 cc     
            CPY $5ab0          ; $f935: cc b0 5a  
            TSX                ; $f938: ba        
            .hex 34 c2         ; $f939: 34 c2     Invalid Opcode - NOP $c2,x
            JMP $3432          ; $f93b: 4c 32 34  

;-------------------------------------------------------------------------------
            .hex 02            ; $f93e: 02        Invalid Opcode - KIL 
            ADC $3209,y        ; $f93f: 79 09 32  
            .hex 34 02         ; $f942: 34 02     Invalid Opcode - NOP $02,x
            CMP ($14,x)        ; $f944: c1 14     
            JSR $6343          ; $f946: 20 43 63  
            AND ($3d),y        ; $f949: 31 3d     
            AND $43            ; $f94b: 25 43     
            .hex 23 34         ; $f94d: 23 34     Invalid Opcode - RLA ($34,x)
            AND $4324,x        ; $f94f: 3d 24 43  
            .hex 23 d0         ; $f952: 23 d0     Invalid Opcode - RLA ($d0,x)
            ORA $3432          ; $f954: 0d 32 34  
            .hex 02            ; $f957: 02        Invalid Opcode - KIL 
            CMP ($14,x)        ; $f958: c1 14     
            JSR $4343          ; $f95a: 20 43 43  
            CMP ($14,x)        ; $f95d: c1 14     
            .hex 34 34         ; $f95f: 34 34     Invalid Opcode - NOP $34,x
            .hex 02            ; $f961: 02        Invalid Opcode - KIL 
            EOR #$09           ; $f962: 49 09     
            .hex 32            ; $f964: 32        Invalid Opcode - KIL 
            CPY #$2b           ; $f965: c0 2b     
            STA ($39),y        ; $f967: 91 39     
            .hex 07 ff         ; $f969: 07 ff     Invalid Opcode - SLO $ff
            ORA ($ff),y        ; $f96b: 11 ff     
            .hex 5b 56 89      ; $f96d: 5b 56 89  Invalid Opcode - SRE $8956,y
            ROL                ; $f970: 2a        
            AND $c0            ; $f971: 25 c0     
            CPX #$ee           ; $f973: e0 ee     
            DEC $c3            ; $f975: c6 c3     
            .hex 34 cc         ; $f977: 34 cc     Invalid Opcode - NOP $cc,x
            .hex c3 cc         ; $f979: c3 cc     Invalid Opcode - DCP ($cc,x)
            .hex 14 d3         ; $f97b: 14 d3     Invalid Opcode - NOP $d3,x
            AND $cd,x          ; $f97d: 35 cd     
            .hex 0c c3 c3      ; $f97f: 0c c3 c3  Invalid Opcode - NOP __c3c3
            JMP __ecc7         ; $f982: 4c c7 ec  

;-------------------------------------------------------------------------------
            ROL $3e,x          ; $f985: 36 3e     
            .hex 3c cc 8c      ; $f987: 3c cc 8c  Invalid Opcode - NOP $8ccc,x
            .hex c3 cc         ; $f98a: c3 cc     Invalid Opcode - DCP ($cc,x)
            SEC                ; $f98c: 38        
            CMP __cccd,x       ; $f98d: dd cd cc  
            .hex 0c 2f 73      ; $f990: 0c 2f 73  Invalid Opcode - NOP $732f
            .hex 7b 05 ff      ; $f993: 7b 05 ff  Invalid Opcode - RRA __ff05,y
            CLC                ; $f996: 18        
            .hex ff 68 56      ; $f997: ff 68 56  Invalid Opcode - ISC $5668,x
            EOR ($2d),y        ; $f99a: 51 2d     
            PLP                ; $f99c: 28        
            BRK                ; $f99d: 00        
            BMI __f9dc         ; $f99e: 30 3c     
            .hex 3c 0c c3      ; $f9a0: 3c 0c c3  Invalid Opcode - NOP __c30c,x
            .hex c3 c3         ; $f9a3: c3 c3     Invalid Opcode - DCP ($c3,x)
            .hex f0 ff         ; $f9a5: f0 ff     Illegal Branch - BEQ #$ff
            .hex c7 87         ; $f9a7: c7 87     Invalid Opcode - DCP $87
            .hex c3 c3         ; $f9a9: c3 c3     Invalid Opcode - DCP ($c3,x)
            BMI __f9e9         ; $f9ab: 30 3c     
            .hex 3c 0c c3      ; $f9ad: 3c 0c c3  Invalid Opcode - NOP __c30c,x
            .hex 87 47         ; $f9b0: 87 47     Invalid Opcode - SAX $47
            .hex ff 7f 34      ; $f9b2: ff 7f 34  Invalid Opcode - ISC $347f,x
            .hex 3c 3c 0c      ; $f9b5: 3c 3c 0c  Invalid Opcode - NOP $0c3c,x
            .hex 87 c7         ; $f9b8: 87 c7     Invalid Opcode - SAX $c7
            .hex 0c bf f4      ; $f9ba: 0c bf f4  Invalid Opcode - NOP __f4bf
            .hex c3 cc         ; $f9bd: c3 cc     Invalid Opcode - DCP ($cc,x)
            .hex 0c 2c 88      ; $f9bf: 0c 2c 88  Invalid Opcode - NOP $882c
            .hex 47 0a         ; $f9c2: 47 0a     Invalid Opcode - SRE $0a
            .hex ff 19 16      ; $f9c4: ff 19 16  Invalid Opcode - ISC $1619,x
            .hex 7b 74 3b      ; $f9c7: 7b 74 3b  Invalid Opcode - RRA $3b74,y
            .hex 34 ff         ; $f9ca: 34 ff     Invalid Opcode - NOP $ff,x
            BRK                ; $f9cc: 00        
            CPY $0ecc          ; $f9cd: cc cc 0e  
            ROR __cce0         ; $f9d0: 6e e0 cc  
            CPY __cc34         ; $f9d3: cc 34 cc  
            .hex 34 3c         ; $f9d6: 34 3c     Invalid Opcode - NOP $3c,x
            CPY $6434          ; $f9d8: cc 34 64  
            .hex 23            ; $f9db: 23        Suspected data
__f9dc:     CPX #$06           ; $f9dc: e0 06     
            .hex 32            ; $f9de: 32        Invalid Opcode - KIL 
            DEC $cc            ; $f9df: c6 cc     
            .hex 0c c3 cc      ; $f9e1: 0c c3 cc  Invalid Opcode - NOP __ccc3
            SEC                ; $f9e4: 38        
            CPY __e38c         ; $f9e5: cc 8c e3  
__f9e8:     .hex ec            ; $f9e8: ec        Suspected data
__f9e9:     DEC $cc            ; $f9e9: c6 cc     
            CPY $5532          ; $f9eb: cc 32 55  
            AND __ff22         ; $f9ee: 2d 22 ff  
            PLA                ; $f9f1: 68        
            .hex ff 7b 49      ; $f9f2: ff 7b 49  Invalid Opcode - ISC $497b,x
            .hex 44 ff         ; $f9f5: 44 ff     Invalid Opcode - NOP $ff
            .hex ff 80 d0      ; $f9f7: ff 80 d0  Invalid Opcode - ISC __d080,x
            CMP __c385,x       ; $f9fa: dd 85 c3  
            JMP $03c3          ; $f9fd: 4c c3 03  

;-------------------------------------------------------------------------------
            LSR                ; $fa00: 4a        
            ASL                ; $fa01: 0a        
            .hex c3 83         ; $fa02: c3 83     Invalid Opcode - DCP ($83,x)
            .hex c2 02         ; $fa04: c2 02     Invalid Opcode - NOP #$02
            .hex c3 43         ; $fa06: c3 43     Invalid Opcode - DCP ($43,x)
            LSR                ; $fa08: 4a        
            ASL $c3            ; $fa09: 06 c3     
            .hex 03 c2         ; $fa0b: 03 c2     Invalid Opcode - SLO ($c2,x)
            LSR $c3            ; $fa0d: 46 c3     
            .hex 03 c2         ; $fa0f: 03 c2     Invalid Opcode - SLO ($c2,x)
            .hex 82 c3         ; $fa11: 82 c3     Invalid Opcode - NOP #$c3
            .hex a7 a4         ; $fa13: a7 a4     Invalid Opcode - LAX $a4
            .hex c7 cc         ; $fa15: c7 cc     Invalid Opcode - DCP $cc
            CPY $171c          ; $fa17: cc 1c 17  
            BCC __f9e8         ; $fa1a: 90 cc     
            CPY $3ac4          ; $fa1c: cc c4 3a  
            STX $48            ; $fa1f: 86 48     
            .hex ff ff 47      ; $fa21: ff ff 47  Invalid Opcode - ISC $47ff,x
            .hex ff 79 76      ; $fa24: ff 79 76  Invalid Opcode - ISC $7679,x
            EOR __ff52,x       ; $fa27: 5d 52 ff  
            CPY #$cc           ; $fa2a: c0 cc     
            CPY $463c          ; $fa2c: cc 3c 46  
            ROL $cc,x          ; $fa2f: 36 cc     
            .hex c3 34         ; $fa31: c3 34     Invalid Opcode - DCP ($34,x)
            .hex dc 53 18      ; $fa33: dc 53 18  Invalid Opcode - NOP $1853,x
            .hex d3 3c         ; $fa36: d3 3c     Invalid Opcode - DCP ($3c),y
            CMP ($31,x)        ; $fa38: c1 31     
            CPY $1e13          ; $fa3a: cc 13 1e  
            .hex c3 30         ; $fa3d: c3 30     Invalid Opcode - DCP ($30,x)
            .hex 34 e1         ; $fa3f: 34 e1     Invalid Opcode - NOP $e1,x
            AND ($34),y        ; $fa41: 31 34     
            .hex 34 70         ; $fa43: 34 70     Invalid Opcode - NOP $70,x
            SBC ($71,x)        ; $fa45: e1 71     
            BMI __fa7d         ; $fa47: 30 34     
            .hex 34 c1         ; $fa49: 34 c1     Invalid Opcode - NOP $c1,x
            AND ($34),y        ; $fa4b: 31 34     
            BPL __fa62         ; $fa4d: 10 13     
            BVC __faad         ; $fa4f: 50 5c     
            BPL __fa66         ; $fa51: 10 13     
            BIT $24            ; $fa53: 24 24     
__fa55:     BIT __c424         ; $fa55: 2c 24 c4  
            .hex 37 08         ; $fa58: 37 08     Invalid Opcode - RLA $08,x
            .hex 87 84         ; $fa5a: 87 84     Invalid Opcode - SAX $84
            .hex 7b 1a 17      ; $fa5c: 7b 1a 17  Invalid Opcode - RRA $171a,y
            AND #$23           ; $fa5f: 29 23     
            .hex 3b            ; $fa61: 3b        Suspected data
__fa62:     AND $ff,x          ; $fa62: 35 ff     
            CPY #$cc           ; $fa64: c0 cc     
__fa66:     CPY __dddd         ; $fa66: cc dd dd  
            CPY __cccc         ; $fa69: cc cc cc  
            CPY $1010          ; $fa6c: cc 10 10  
            BPL __fa81         ; $fa6f: 10 10     
            BPL __fa83         ; $fa71: 10 10     
            BPL __fa85         ; $fa73: 10 10     
            BPL __fa87         ; $fa75: 10 10     
            BPL __fa89         ; $fa77: 10 10     
            BPL __fa8b         ; $fa79: 10 10     
            BPL __fa8d         ; $fa7b: 10 10     
__fa7d:     BPL __fa8f         ; $fa7d: 10 10     
            BPL __fa91         ; $fa7f: 10 10     
__fa81:     .hex 13 10         ; $fa81: 13 10     Invalid Opcode - SLO ($10),y
__fa83:     BPL __fa95         ; $fa83: 10 10     
__fa85:     .hex cc cc         ; $fa85: cc cc     Suspected data
__fa87:     BMI __fa55         ; $fa87: 30 cc     
__fa89:     .hex 8c e3         ; $fa89: 8c e3     Suspected data
__fa8b:     INX                ; $fa8b: e8        
            .hex c2            ; $fa8c: c2        Suspected data
__fa8d:     .hex cc 4c         ; $fa8d: cc 4c     Suspected data
__fa8f:     .hex 34 2e         ; $fa8f: 34 2e     Invalid Opcode - NOP $2e,x
__fa91:     STA $5b,x          ; $fa91: 95 5b     
            .hex ff ae         ; $fa93: ff ae     Suspected data
__fa95:     .hex ff 77 73      ; $fa95: ff 77 73  Invalid Opcode - ISC $7377,x
            .hex 1b 36 34      ; $fa98: 1b 36 34  Invalid Opcode - SLO $3436,y
            CPX #$d4           ; $fa9b: e0 d4     
            CMP __cccc,x       ; $fa9d: dd cc cc  
            CPY $0c20          ; $faa0: cc 20 0c  
            .hex 82 c3         ; $faa3: 82 c3     Invalid Opcode - NOP #$c3
            RTS                ; $faa5: 60        

;-------------------------------------------------------------------------------
            BIT $a038          ; $faa6: 2c 38 a0  
            JSR $2424          ; $faa9: 20 24 24  
            SEC                ; $faac: 38        
__faad:     .hex 0c 02 0a      ; $faad: 0c 02 0a  Invalid Opcode - NOP $0a02
            .hex 82 03         ; $fab0: 82 03     Invalid Opcode - NOP #$03
            ASL                ; $fab2: 0a        
            .hex 42            ; $fab3: 42        Invalid Opcode - KIL 
            .hex 42            ; $fab4: 42        Invalid Opcode - KIL 
            .hex 82 c3         ; $fab5: 82 c3     Invalid Opcode - NOP #$c3
            .hex 23 0c         ; $fab7: 23 0c     Invalid Opcode - RLA ($0c,x)
            .hex c2 3c         ; $fab9: c2 3c     Invalid Opcode - NOP #$3c
            .hex 42            ; $fabb: 42        Invalid Opcode - KIL 
            .hex 43 c2         ; $fabc: 43 c2     Invalid Opcode - SRE ($c2,x)
            CPY __cc93         ; $fabe: cc 93 cc  
            CPY $38c4          ; $fac1: cc c4 38  
            STY $6a,x          ; $fac4: 94 6a     
            ASL                ; $fac6: 0a        
            .hex ff 49 47      ; $fac7: ff 49 47  Invalid Opcode - ISC $4749,x
            CLI                ; $faca: 58        
            .hex 8b 85         ; $facb: 8b 85     Invalid Opcode - XAA #$85
            .hex 2b 25         ; $facd: 2b 25     Invalid Opcode - ANC #$25
            .hex 80 02         ; $facf: 80 02     Invalid Opcode - NOP #$02
            ASL $06            ; $fad1: 06 06     
__fad3:     ASL $06            ; $fad3: 06 06     
            DEC $cc            ; $fad5: c6 cc     
__fad7:     .hex 0c c3 30      ; $fad7: 0c c3 30  Invalid Opcode - NOP $30c3
            .hex 0c 43 32      ; $fada: 0c 43 32  Invalid Opcode - NOP $3243
            ASL $36            ; $fadd: 06 36     
            ASL $36            ; $fadf: 06 36     
            DEC $cc            ; $fae1: c6 cc     
            CPY $30c3          ; $fae3: cc c3 30  
            .hex 0c 02 36      ; $fae6: 0c 02 36  Invalid Opcode - NOP $3602
            LSR $32            ; $fae9: 46 32     
            ASL $c6            ; $faeb: 06 c6     
            CPY __c30c         ; $faed: cc 0c c3  
            BMI __fafe         ; $faf0: 30 0c     
            .hex 43 32         ; $faf2: 43 32     Invalid Opcode - SRE ($32,x)
            ASL $36            ; $faf4: 06 36     
            ASL $36            ; $faf6: 06 36     
            DEC $cc            ; $faf8: c6 cc     
            CPY $8133          ; $fafa: cc 33 81  
            .hex 8e            ; $fafd: 8e        Suspected data
__fafe:     .hex ff ff 18      ; $fafe: ff ff 18  Invalid Opcode - ISC $18ff,x
            ASL $7a,x          ; $fb01: 16 7a     
            .hex 74 4a         ; $fb03: 74 4a     Invalid Opcode - NOP $4a,x
            .hex 44 ff         ; $fb05: 44 ff     Invalid Opcode - NOP $ff
            CPY #$cc           ; $fb07: c0 cc     
            CPY $309d          ; $fb09: cc 9d 30  
            BNE __fad3         ; $fb0c: d0 c5     
            CPY __c38c         ; $fb0e: cc 8c c3  
            .hex c3 c3         ; $fb11: c3 c3     Invalid Opcode - DCP ($c3,x)
            BMI __fb51         ; $fb13: 30 3c     
            .hex 3c 0c 83      ; $fb15: 3c 0c 83  Invalid Opcode - NOP $830c,x
            .hex c3 30         ; $fb18: c3 30     Invalid Opcode - DCP ($30,x)
            .hex 0c 43 c3      ; $fb1a: 0c 43 c3  Invalid Opcode - NOP __c343
            .hex 34 0c         ; $fb1d: 34 0c     Invalid Opcode - NOP $0c,x
            .hex 43 83         ; $fb1f: 43 83     Invalid Opcode - SRE ($83,x)
            .hex 43 c3         ; $fb21: 43 c3     Invalid Opcode - SRE ($c3,x)
            BMI __fb59         ; $fb23: 30 34     
            SEC                ; $fb25: 38        
            .hex 34 0c         ; $fb26: 34 0c     Invalid Opcode - NOP $0c,x
            .hex 63 74         ; $fb28: 63 74     Invalid Opcode - RRA ($74,x)
            LDY #$cc           ; $fb2a: a0 cc     
            CPY $3bc4          ; $fb2c: cc c4 3b  
            ORA __ff48         ; $fb2f: 0d 48 ff  
            .hex ff 47 ff      ; $fb32: ff 47 ff  Invalid Opcode - ISC __ff47,x
            .hex 3a            ; $fb35: 3a        Invalid Opcode - NOP 
            .hex 33 6c         ; $fb36: 33 6c     Invalid Opcode - RLA ($6c),y
            ADC $ff            ; $fb38: 65 ff     
            CPY #$f1           ; $fb3a: c0 f1     
            .hex ff 57 d0      ; $fb3c: ff 57 d0  Invalid Opcode - ISC __d057,x
            CMP $1053,x        ; $fb3f: dd 53 10  
            CPY $5314          ; $fb42: cc 14 53  
            BPL __fad7         ; $fb45: 10 90     
            .hex d3 10         ; $fb47: d3 10     Invalid Opcode - DCP ($10),y
            .hex 53 90         ; $fb49: 53 90     Invalid Opcode - SRE ($90),y
            .hex c3 10         ; $fb4b: c3 10     Invalid Opcode - DCP ($10,x)
            BPL __fba2         ; $fb4d: 10 53     
            BPL __fb61         ; $fb4f: 10 10     
__fb51:     .hex e3 10         ; $fb51: e3 10     Invalid Opcode - ISC ($10,x)
            BPL __fba8         ; $fb53: 10 53     
            .hex 34 e4         ; $fb55: 34 e4     Invalid Opcode - NOP $e4,x
            BPL __fb69         ; $fb57: 10 10     
__fb59:     .hex 53 10         ; $fb59: 53 10     Invalid Opcode - SRE ($10),y
            BVC __fb6b         ; $fb5b: 50 0e     
            AND $0105,y        ; $fb5d: 39 05 01  
            .hex c1            ; $fb60: c1        Suspected data
__fb61:     STY $53,x          ; $fb61: 94 53     
            BPL __fb75         ; $fb63: 10 10     
            CPY __d854         ; $fb65: cc 54 d8  
            .hex dd            ; $fb68: dd        Suspected data
__fb69:     SEC                ; $fb69: 38        
            .hex 36            ; $fb6a: 36        Suspected data
__fb6b:     TXS                ; $fb6b: 9a        
            .hex 1a            ; $fb6c: 1a        Invalid Opcode - NOP 
            .hex ff a7 ff      ; $fb6d: ff a7 ff  Invalid Opcode - ISC __ffa7,x
            .hex 8b 1b         ; $fb70: 8b 1b     Invalid Opcode - XAA #$1b
            .hex 97 07         ; $fb72: 97 07     Invalid Opcode - SAX $07,y
            .hex ff            ; $fb74: ff        Suspected data
__fb75:     CPY #$d8           ; $fb75: c0 d8     
            CPY __cc38         ; $fb77: cc 38 cc  
            STY $58c3          ; $fb7a: 8c c3 58  
            .hex 13 3c         ; $fb7d: 13 3c     Invalid Opcode - SLO ($3c),y
            BPL __fb93         ; $fb7f: 10 12     
            .hex 0c c3 30      ; $fb81: 0c c3 30  Invalid Opcode - NOP $30c3
            BPL __fb98         ; $fb84: 10 12     
            .hex 0c c3 30      ; $fb86: 0c c3 30  Invalid Opcode - NOP $30c3
            BPL __fbf9         ; $fb89: 10 6e     
            AND ($0c),y        ; $fb8b: 31 0c     
            .hex 03 e1         ; $fb8d: 03 e1     Invalid Opcode - SLO ($e1,x)
            ASL $c3,x          ; $fb8f: 16 c3     
            BMI __fba3         ; $fb91: 30 10     
__fb93:     .hex 12            ; $fb93: 12        Invalid Opcode - KIL 
            .hex 0c c3 30      ; $fb94: 0c c3 30  Invalid Opcode - NOP $30c3
            .hex 10            ; $fb97: 10        Suspected data
__fb98:     .hex 12            ; $fb98: 12        Invalid Opcode - KIL 
            .hex 0c c3 30      ; $fb99: 0c c3 30  Invalid Opcode - NOP $30c3
            STY __c135         ; $fb9c: 8c 35 c1  
            .hex cb 8c         ; $fb9f: cb 8c     Invalid Opcode - AXS #$8c
            .hex 50            ; $fba1: 50        Suspected data
__fba2:     .hex 0d            ; $fba2: 0d        Suspected data
__fba3:     AND $ff,x          ; $fba3: 35 ff     
            .hex ff 8b 85      ; $fba5: ff 8b 85  Invalid Opcode - ISC $858b,x
__fba8:     ADC $6b72,y        ; $fba8: 79 72 6b  
            ROR $07            ; $fbab: 66 07     
            CPY #$02           ; $fbad: c0 02     
            .hex 02            ; $fbaf: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb0: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb1: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb2: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb3: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb4: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb5: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb6: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb7: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb8: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbb9: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbba: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbbb: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbbc: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbbd: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbbe: 02        Invalid Opcode - KIL 
            .hex 82 02         ; $fbbf: 82 02     Invalid Opcode - NOP #$02
            .hex 82 02         ; $fbc1: 82 02     Invalid Opcode - NOP #$02
            .hex c2 cc         ; $fbc3: c2 cc     Invalid Opcode - NOP #$cc
            JMP __ccc3         ; $fbc5: 4c c3 cc  

;-------------------------------------------------------------------------------
            SEC                ; $fbc8: 38        
            JSR $2020          ; $fbc9: 20 20 20  
            JSR $2020          ; $fbcc: 20 20 20  
            JSR $2030          ; $fbcf: 20 30 20  
            JSR $2020          ; $fbd2: 20 20 20  
            JSR $2020          ; $fbd5: 20 20 20  
            BMI __fbfa         ; $fbd8: 30 20     
            JSR $a020          ; $fbda: 20 20 a0  
            JSR $3020          ; $fbdd: 20 20 30  
            JSR $2020          ; $fbe0: 20 20 20  
            .hex 20            ; $fbe3: 20        Suspected data
__fbe4:     JSR $2020          ; $fbe4: 20 20 20  
            BMI __fbef         ; $fbe7: 30 06     
            .hex 02            ; $fbe9: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbea: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbeb: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbec: 02        Invalid Opcode - KIL 
            .hex 02            ; $fbed: 02        Invalid Opcode - KIL 
            .hex c2            ; $fbee: c2        Suspected data
__fbef:     CPY $2bcc          ; $fbef: cc cc 2b  
            ORA $53            ; $fbf2: 05 53     
            .hex ff ff 64      ; $fbf4: ff ff 64  Invalid Opcode - ISC $64ff,x
            .hex 4c 85         ; $fbf7: 4c 85     Suspected data
__fbf9:     .hex 6c            ; $fbf9: 6c        Suspected data
__fbfa:     LSR $21            ; $fbfa: 46 21     
            ORA __cc00         ; $fbfc: 0d 00 cc  
            CPY __dc5d         ; $fbff: cc 5d dc  
            CMP $d3            ; $fc02: c5 d3     
            CPY $3c30          ; $fc04: cc 30 3c  
            CMP $4c74          ; $fc07: cd 74 4c  
            .hex 97 50         ; $fc0a: 97 50     Invalid Opcode - SAX $50,y
            .hex c3 4c         ; $fc0c: c3 4c     Invalid Opcode - DCP ($4c,x)
            .hex 53 d0         ; $fc0e: 53 d0     Invalid Opcode - SRE ($d0),y
            CPY $018c          ; $fc10: cc 8c 01  
            CMP $cc            ; $fc13: c5 cc     
            CLC                ; $fc15: 18        
            BVC __fbe4         ; $fc16: 50 cc     
            STY __cccd         ; $fc18: 8c cd cc  
            JMP $3426          ; $fc1b: 4c 26 34  

;-------------------------------------------------------------------------------
            AND $ffff,y        ; $fc1e: 39 ff ff  
            .hex 77 4c         ; $fc21: 77 4c     Invalid Opcode - RRA $4c,x
            EOR $2a54,x        ; $fc23: 5d 54 2a  
            .hex 22            ; $fc26: 22        Invalid Opcode - KIL 
            .hex ff f0 cc      ; $fc27: ff f0 cc  Invalid Opcode - ISC __ccf0,x
            CPY __cccc         ; $fc2a: cc cc cc  
            CPY $0dcc          ; $fc2d: cc cc 0d  
            CMP __ccc1,x       ; $fc30: dd c1 cc  
            CPY $4ccc          ; $fc33: cc cc 4c  
            INC __c6e4         ; $fc36: ee e4 c6  
            CPY __cccc         ; $fc39: cc cc cc  
            .hex 9c d4 1d      ; $fc3c: 9c d4 1d  Invalid Opcode - SHY $1dd4,x
            CPY __c4cc         ; $fc3f: cc cc c4  
            .hex 3b 78 48      ; $fc42: 3b 78 48  Invalid Opcode - RLA $4878,y
            .hex ff ff 47      ; $fc45: ff ff 47  Invalid Opcode - ISC $47ff,x
            .hex ff 6a 65      ; $fc48: ff 6a 65  Invalid Opcode - ISC $656a,x
            .hex 5c 53 ff      ; $fc4b: 5c 53 ff  Invalid Opcode - NOP __ff53,x
            CPY #$24           ; $fc4e: c0 24     
            CPX #$0e           ; $fc50: e0 0e     
            .hex c2 02         ; $fc52: c2 02     Invalid Opcode - NOP #$02
            INC $2c20          ; $fc54: ee 20 2c  
            CPX #$0e           ; $fc57: e0 0e     
            .hex c2 02         ; $fc59: c2 02     Invalid Opcode - NOP #$02
            .hex c2 24         ; $fc5b: c2 24     Invalid Opcode - NOP #$24
            JSR __cccc         ; $fc5d: 20 cc cc  
            SEC                ; $fc60: 38        
            .hex dc 3c 34      ; $fc61: dc 3c 34  Invalid Opcode - NOP $343c,x
            .hex 02            ; $fc64: 02        Invalid Opcode - KIL 
            .hex 02            ; $fc65: 02        Invalid Opcode - KIL 
            ORA $3202          ; $fc66: 0d 02 32  
            .hex 34 82         ; $fc69: 34 82     Invalid Opcode - NOP $82,x
            STA $3432          ; $fc6b: 8d 32 34  
            .hex 42            ; $fc6e: 42        Invalid Opcode - KIL 
            .hex c2 42         ; $fc6f: c2 42     Invalid Opcode - NOP #$42
            .hex 32            ; $fc71: 32        Invalid Opcode - KIL 
            .hex 34 42         ; $fc72: 34 42     Invalid Opcode - NOP $42,x
            .hex c2 42         ; $fc74: c2 42     Invalid Opcode - NOP #$42
            .hex 32            ; $fc76: 32        Invalid Opcode - KIL 
            .hex 34 42         ; $fc77: 34 42     Invalid Opcode - NOP $42,x
            LSR $46            ; $fc79: 46 46     
            .hex 32            ; $fc7b: 32        Invalid Opcode - KIL 
            CPY #$2d           ; $fc7c: c0 2d     
            PHP                ; $fc7e: 08        
            .hex 9b            ; $fc7f: 9b        Invalid Opcode - TAS 
            STY $ff,x          ; $fc80: 94 ff     
            ORA $8617,y        ; $fc82: 19 17 86  
            .hex 5b 25 ff      ; $fc85: 5b 25 ff  Invalid Opcode - SRE __ff25,y
            .hex ff 00 ee      ; $fc88: ff 00 ee  Invalid Opcode - ISC __ee00,x
            INC __cccc         ; $fc8b: ee cc cc  
            BMI __fc9c         ; $fc8e: 30 0c     
            .hex c3 c3         ; $fc90: c3 c3     Invalid Opcode - DCP ($c3,x)
            .hex 63 24         ; $fc92: 63 24     Invalid Opcode - RRA ($24,x)
            .hex 23 24         ; $fc94: 23 24     Invalid Opcode - RLA ($24,x)
            .hex 23 cc         ; $fc96: 23 cc     Invalid Opcode - RLA ($cc,x)
            CPY __cccc         ; $fc98: cc cc cc  
            .hex 03            ; $fc9b: 03        Suspected data
__fc9c:     LSR $46            ; $fc9c: 46 46     
            LSR $36            ; $fc9e: 46 36     
            CPY __cccc         ; $fca0: cc cc cc  
            .hex c3 4c         ; $fca3: c3 4c     Invalid Opcode - DCP ($4c,x)
            STX $47            ; $fca5: 86 47     
            DEX                ; $fca7: ca        
            CPY $264c          ; $fca8: cc 4c 26  
            ROL __ff62         ; $fcab: 2e 62 ff  
            .hex ff 75 5b      ; $fcae: ff 75 5b  Invalid Opcode - ISC $5b75,x
            EOR $1b            ; $fcb1: 45 1b     
            .hex ff ff ff      ; $fcb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            BRK                ; $fcb6: 00        
            CPY __cccc         ; $fcb7: cc cc cc  
            CPY __cccc         ; $fcba: cc cc cc  
            CPY __ccdc         ; $fcbd: cc dc cc  
            CPY __c94c         ; $fcc0: cc 4c c9  
            CPY $98cc          ; $fcc3: cc cc 98  
            STY __ccc3         ; $fcc6: 8c c3 cc  
            SEC                ; $fcc9: 38        
            CPY $938c          ; $fcca: cc 8c 93  
            CPY __c4cc         ; $fccd: cc cc c4  
            ROL $66            ; $fcd0: 26 66     
            .hex 62            ; $fcd2: 62        Invalid Opcode - KIL 
            .hex ff ff 49      ; $fcd3: ff ff 49  Invalid Opcode - ISC $49ff,x
            ROL $59,x          ; $fcd6: 36 59     
            LSR $39,x          ; $fcd8: 56 39     
            ROL $ff            ; $fcda: 26 ff     
            CPY #$cc           ; $fcdc: c0 cc     
            CPY __cccc         ; $fcde: cc cc cc  
            CPY __d0cc         ; $fce1: cc cc d0  
            CMP __c381,x       ; $fce4: dd 81 c3  
            CPY __cc38         ; $fce7: cc 38 cc  
            STY __cc93         ; $fcea: 8c 93 cc  
            CPY __cccc         ; $fced: cc cc cc  
            CPY $4ccc          ; $fcf0: cc cc 4c  
            DEX                ; $fcf3: ca        
            CPY $2f4c          ; $fcf4: cc 4c 2f  
            .hex 0b 78         ; $fcf7: 0b 78     Invalid Opcode - ANC #$78
            .hex ff ff 49      ; $fcf9: ff ff 49  Invalid Opcode - ISC $49ff,x
            .hex 27 07         ; $fcfc: 27 07     Invalid Opcode - RLA $07
__fcfe:     .hex 53 3c         ; $fcfe: 53 3c     Invalid Opcode - SRE ($3c),y
            .hex ff ff 80      ; $fd00: ff ff 80  Invalid Opcode - ISC $80ff,x
            ORA __cc5d         ; $fd03: 0d 5d cc  
            CPY $838c          ; $fd06: cc 8c 83  
            ASL                ; $fd09: 0a        
            DEC __c203         ; $fd0a: ce 03 c2  
            CPY __c207         ; $fd0d: cc 07 c2  
            BMI __fd5e         ; $fd10: 30 4c     
            .hex 03 c6         ; $fd12: 03 c6     Invalid Opcode - SLO ($c6,x)
            LDY #$3c           ; $fd14: a0 3c     
            DEC $a8            ; $fd16: c6 a8     
            SEC                ; $fd18: 38        
            DEC $64            ; $fd19: c6 64     
            .hex 0c 23 7c      ; $fd1b: 0c 23 7c  Invalid Opcode - NOP $7c23
            JSR $a34c          ; $fd1e: 20 4c a3  
            .hex 0c ce cc      ; $fd21: 0c ce cc  Invalid Opcode - NOP __ccce
            JMP $782e          ; $fd24: 4c 2e 78  

;-------------------------------------------------------------------------------
            PHA                ; $fd27: 48        
            .hex ff ff 47      ; $fd28: ff ff 47  Invalid Opcode - ISC $47ff,x
            .hex ff 5d 52      ; $fd2b: ff 5d 52  Invalid Opcode - ISC $525d,x
            .hex 3b 34 ff      ; $fd2e: 3b 34 ff  Invalid Opcode - RLA __ff34,y
            CPY #$30           ; $fd31: c0 30     
            CPY $343c          ; $fd33: cc 3c 34  
            CPY $343c          ; $fd36: cc 3c 34  
            CPX $4e            ; $fd39: e4 4e     
            .hex 43 c3         ; $fd3b: 43 c3     Invalid Opcode - SRE ($c3,x)
            CPY __c343         ; $fd3d: cc 43 c3  
            CPY $8743          ; $fd40: cc 43 87  
            DEC __c343         ; $fd43: ce 43 c3  
            DEC $3103          ; $fd46: ce 03 31  
            ORA #$4e           ; $fd49: 09 4e     
            AND $c1,x          ; $fd4b: 35 c1     
            CPY __cccc         ; $fd4d: cc cc cc  
            CPY __cccc         ; $fd50: cc cc cc  
            SEC                ; $fd53: 38        
            ASL                ; $fd54: 0a        
            ROR $37            ; $fd55: 66 37     
            .hex ff ac a8      ; $fd57: ff ac a8  Invalid Opcode - ISC $a8ac,x
            .hex 12            ; $fd5a: 12        Invalid Opcode - KIL 
            STX $67,y          ; $fd5b: 96 67     
            .hex 36            ; $fd5d: 36        Suspected data
__fd5e:     .hex 07 80         ; $fd5e: 07 80     Invalid Opcode - SLO $80
            STA ($dd,x)        ; $fd60: 81 dd     
            CMP $0ccc          ; $fd62: cd cc 0c  
            .hex 83 32         ; $fd65: 83 32     Invalid Opcode - SAX ($32,x)
            .hex 3c c2 43      ; $fd67: 3c c2 43  Invalid Opcode - NOP $43c2,x
            .hex 83 86         ; $fd6a: 83 86     Invalid Opcode - SAX ($86,x)
            .hex 83 43         ; $fd6c: 83 43     Invalid Opcode - SAX ($43,x)
            .hex 23 4c         ; $fd6e: 23 4c     Invalid Opcode - RLA ($4c,x)
            .hex 32            ; $fd70: 32        Invalid Opcode - KIL 
            SEC                ; $fd71: 38        
            .hex 34 32         ; $fd72: 34 32     Invalid Opcode - NOP $32,x
            .hex 3c 32 38      ; $fd74: 3c 32 38  Invalid Opcode - NOP $3832,x
            .hex 34 68         ; $fd77: 34 68     Invalid Opcode - NOP $68,x
            SEC                ; $fd79: 38        
            SEC                ; $fd7a: 38        
            .hex 34 c2         ; $fd7b: 34 c2     Invalid Opcode - NOP $c2,x
            BIT $83            ; $fd7d: 24 83     
            .hex 43 23         ; $fd7f: 43 23     Invalid Opcode - SRE ($23,x)
            .hex c3 23         ; $fd81: c3 23     Invalid Opcode - DCP ($23,x)
            .hex 83 43         ; $fd83: 83 43     Invalid Opcode - SAX ($43,x)
            .hex 23 64         ; $fd85: 23 64     Invalid Opcode - RLA ($64,x)
            .hex 64 cc         ; $fd87: 64 cc     Invalid Opcode - NOP $cc
            CPY $2fc4          ; $fd89: cc c4 2f  
            ASL $85            ; $fd8c: 06 85     
            .hex ff ff 58      ; $fd8e: ff ff 58  Invalid Opcode - ISC $58ff,x
            ROL $0a            ; $fd91: 26 0a     
            EOR $3843          ; $fd93: 4d 43 38  
            .hex ff 80 cc      ; $fd96: ff 80 cc  Invalid Opcode - ISC __cc80,x
            CPY $9dd4          ; $fd99: cc d4 9d  
            .hex 0c c1 0c      ; $fd9c: 0c c1 0c  Invalid Opcode - NOP $0cc1
            CMP ($10,x)        ; $fd9f: c1 10     
            CPY $0c10          ; $fda1: cc 10 0c  
            EOR ($01,x)        ; $fda4: 41 01     
            ORA ($41,x)        ; $fda6: 01 41     
            STA ($09,x)        ; $fda8: 81 09     
            STA $41            ; $fdaa: 85 41     
            CMP $1810          ; $fdac: cd 10 18  
            JMP $1345          ; $fdaf: 4c 45 13  

;-------------------------------------------------------------------------------
            CLD                ; $fdb2: d8        
            CMP #$cc           ; $fdb3: c9 cc     
            .hex cc            ; $fdb5: cc        Suspected data
__fdb6:     STY __ccc9         ; $fdb6: 8c c9 cc  
            JMP $942e          ; $fdb9: 4c 2e 94  

;-------------------------------------------------------------------------------
            ORA __ff16,y       ; $fdbc: 19 16 ff  
            ROL                ; $fdbf: 2a        
            AND $6d            ; $fdc0: 25 6d     
            .hex 62            ; $fdc2: 62        Invalid Opcode - KIL 
            JMP __ff43         ; $fdc3: 4c 43 ff  

;-------------------------------------------------------------------------------
            CPY #$6e           ; $fdc6: c0 6e     
            CPX __ccc6         ; $fdc8: ec c6 cc  
            JMP __c7c1         ; $fdcb: 4c c1 c7  

;-------------------------------------------------------------------------------
            CMP ($85,x)        ; $fdce: c1 85     
            .hex 87 c5         ; $fdd0: 87 c5     Invalid Opcode - SAX $c5
            BPL __fe4c         ; $fdd2: 10 78     
            CLI                ; $fdd4: 58        
            .hex 0c 45 47      ; $fdd5: 0c 45 47  Invalid Opcode - NOP $4745
            CMP $18            ; $fdd8: c5 18     
            .hex 74 54         ; $fdda: 74 54     Invalid Opcode - NOP $54,x
            STY $0705          ; $fddc: 8c 05 07  
            CMP $4c            ; $fddf: c5 4c     
            ADC ($c5),y        ; $fde1: 71 c5     
            CPY __c20c         ; $fde3: cc 0c c2  
            CPY $3d8c          ; $fde6: cc 8c 3d  
            ORA __ff1b         ; $fde9: 0d 1b ff  
            .hex ff a9 25      ; $fdec: ff a9 25  Invalid Opcode - ISC $25a9,x
            .hex 67 64         ; $fdef: 67 64     Invalid Opcode - RRA $64
            BIT $09            ; $fdf1: 24 09     
            .hex ff c0 cc      ; $fdf3: ff c0 cc  Invalid Opcode - ISC __ccc0,x
            CPY $383c          ; $fdf6: cc 3c 38  
            .hex 34 cc         ; $fdf9: 34 cc     Invalid Opcode - NOP $cc,x
            .hex 03 03         ; $fdfb: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 43 03         ; $fdfd: 43 03     Invalid Opcode - SRE ($03,x)
            .hex c3 03         ; $fdff: c3 03     Invalid Opcode - DCP ($03,x)
            .hex 03 03         ; $fe01: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 43 03         ; $fe03: 43 03     Invalid Opcode - SRE ($03,x)
            .hex c3 83         ; $fe05: c3 83     Invalid Opcode - DCP ($83,x)
            .hex c3 34         ; $fe07: c3 34     Invalid Opcode - DCP ($34,x)
            .hex 3c 30 30      ; $fe09: 3c 30 30  Invalid Opcode - NOP $3030,x
            BMI __fe42         ; $fe0c: 30 34     
            BMI __fe5c         ; $fe0e: 30 4c     
            .hex 03 03         ; $fe10: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 43 03         ; $fe12: 43 03     Invalid Opcode - SRE ($03,x)
            .hex c3 03         ; $fe14: c3 03     Invalid Opcode - DCP ($03,x)
            .hex 83 43         ; $fe16: 83 43     Invalid Opcode - SAX ($43,x)
            .hex c3 34         ; $fe18: c3 34     Invalid Opcode - DCP ($34,x)
            BMI __fe4c         ; $fe1a: 30 30     
            .hex 30            ; $fe1c: 30        Suspected data
__fe1d:     .hex 3c 3c 38      ; $fe1d: 3c 3c 38  Invalid Opcode - NOP $383c,x
            BMI __fdb6         ; $fe20: 30 94     
            CPY __c4cc         ; $fe22: cc cc c4  
            .hex 34 88         ; $fe25: 34 88     Invalid Opcode - NOP $88,x
            PHA                ; $fe27: 48        
            .hex ff            ; $fe28: ff        Suspected data
__fe29:     .hex ff 47 ff      ; $fe29: ff 47 ff  Invalid Opcode - ISC __ff47,x
            ROR                ; $fe2c: 6a        
            .hex 65            ; $fe2d: 65        Suspected data
__fe2e:     .hex 5c 53 ff      ; $fe2e: 5c 53 ff  Invalid Opcode - NOP __ff53,x
            BRK                ; $fe31: 00        
            CPY __eccc         ; $fe32: cc cc ec  
            DEC __cc34         ; $fe35: ce 34 cc  
            .hex 34 3c         ; $fe38: 34 3c     Invalid Opcode - NOP $3c,x
            BMI __fe88         ; $fe3a: 30 4c     
            .hex 03 c3         ; $fe3c: 03 c3     Invalid Opcode - SLO ($c3,x)
            .hex 03 c7         ; $fe3e: 03 c7     Invalid Opcode - SLO ($c7,x)
            BMI __fe72         ; $fe40: 30 30     
__fe42:     JMP $0e03          ; $fe42: 4c 03 0e  

;-------------------------------------------------------------------------------
            .hex c7 30         ; $fe45: c7 30     Invalid Opcode - DCP $30
            BMI __fe29         ; $fe47: 30 e0     
            BMI __fe7b         ; $fe49: 30 30     
            .hex 3c            ; $fe4b: 3c        Suspected data
__fe4c:     .hex 30            ; $fe4c: 30        Suspected data
__fe4d:     CPX #$30           ; $fe4d: e0 30     
            BMI __fe8d         ; $fe4f: 30 3c     
            CPY $3c34          ; $fe51: cc 34 3c  
            .hex c2 2c         ; $fe54: c2 2c     Invalid Opcode - NOP #$2c
            .hex c3 cc         ; $fe56: c3 cc     Invalid Opcode - DCP ($cc,x)
            JMP $1830          ; $fe58: 4c 30 18  

;-------------------------------------------------------------------------------
            TYA                ; $fe5b: 98        
__fe5c:     .hex ff ff 48      ; $fe5c: ff ff 48  Invalid Opcode - ISC $48ff,x
            AND $0c            ; $fe5f: 25 0c     
            STX $7d81          ; $fe61: 8e 81 7d  
            .hex 72            ; $fe64: 72        Invalid Opcode - KIL 
            .hex 80 50         ; $fe65: 80 50     Invalid Opcode - NOP #$50
            CLD                ; $fe67: d8        
            CLI                ; $fe68: 58        
            STY $cc,x          ; $fe69: 94 cc     
            .hex 89 09         ; $fe6b: 89 09     Invalid Opcode - NOP #$09
            .hex 43 03         ; $fe6d: 43 03     Invalid Opcode - SRE ($03,x)
            CMP $7475          ; $fe6f: cd 75 74  
__fe72:     CMP #$0c           ; $fe72: c9 0c     
            CMP ($cc,x)        ; $fe74: c1 cc     
            .hex 03 05         ; $fe76: 03 05     Invalid Opcode - SLO ($05,x)
            ORA ($c3,x)        ; $fe78: 01 c3     
            .hex 90            ; $fe7a: 90        Suspected data
__fe7b:     .hex 93 50         ; $fe7b: 93 50     Invalid Opcode - AHX ($50),y
            .hex 93 14         ; $fe7d: 93 14     Invalid Opcode - AHX ($14),y
            .hex cc            ; $fe7f: cc        Suspected data
__fe80:     .hex 1c d4 c1      ; $fe80: 1c d4 c1  Invalid Opcode - NOP __c1d4,x
            BNE __fe1d         ; $fe83: d0 98     
            JMP __ccc9         ; $fe85: 4c c9 cc  

;-------------------------------------------------------------------------------
__fe88:     JMP $1d28          ; $fe88: 4c 28 1d  

;-------------------------------------------------------------------------------
            .hex 57 46         ; $fe8b: 57 46     Invalid Opcode - SRE $46,x
__fe8d:     ASL $3a,x          ; $fe8d: 16 3a     
            .hex 27 32         ; $fe8f: 27 32     Invalid Opcode - RLA $32
            PLP                ; $fe91: 28        
            ASL $ff            ; $fe92: 06 ff     
            .hex ff 00 cc      ; $fe94: ff 00 cc  Invalid Opcode - ISC __cc00,x
            CPY __cccc         ; $fe97: cc cc cc  
            CPY __cccc         ; $fe9a: cc cc cc  
            CPY $ae30          ; $fe9d: cc 30 ae  
            CPX #$43           ; $fea0: e0 43     
            .hex c3 cc         ; $fea2: c3 cc     Invalid Opcode - DCP ($cc,x)
            .hex 43 63         ; $fea4: 43 63     Invalid Opcode - SRE ($63,x)
            CPY __cc34         ; $fea6: cc 34 cc  
            STY __ccc3         ; $fea9: 8c c3 cc  
            CPY __ce8c         ; $feac: cc 8c ce  
            CPY $2b4c          ; $feaf: cc 4c 2b  
            STY $08            ; $feb2: 84 08     
            .hex 07 ff         ; $feb4: 07 ff     Invalid Opcode - SLO $ff
            TYA                ; $feb6: 98        
            .hex 97 39         ; $feb7: 97 39     Invalid Opcode - SAX $39,y
            ROL $ff,x          ; $feb9: 36 ff     
            .hex ff ff 00      ; $febb: ff ff 00  Bad Addr Mode - ISC $00ff,x
            CPY __e8cc         ; $febe: cc cc e8  
            CPX $cc            ; $fec1: e4 cc     
            CPY $034c          ; $fec3: cc 4c 03  
            EOR $c5            ; $fec6: 45 c5     
            .hex 3c 10 1c      ; $fec8: 3c 10 1c  Invalid Opcode - NOP $1c10,x
            CPY __ccc3         ; $fecb: cc c3 cc  
            CLV                ; $fece: b8        
            LDY $8ccc,x        ; $fecf: bc cc 8c  
            .hex c3 1c         ; $fed2: c3 1c     Invalid Opcode - DCP ($1c,x)
            .hex 1c 30 cc      ; $fed4: 1c 30 cc  Invalid Opcode - NOP __cc30,x
            EOR __cc30,x       ; $fed7: 5d 30 cc  
            CPY $34c8          ; $feda: cc c8 34  
            .hex 47 9c         ; $fedd: 47 9c     Invalid Opcode - SRE $9c
            STX $8a,y          ; $fedf: 96 8a     
            EOR $3b1a,y        ; $fee1: 59 1a 3b  
            .hex 37 19         ; $fee4: 37 19     Invalid Opcode - RLA $19,x
            .hex 0b 07         ; $fee6: 0b 07     Invalid Opcode - ANC #$07
            BRK                ; $fee8: 00        
            INC __ccee         ; $fee9: ee ee cc  
            TAY                ; $feec: a8        
            CPY $a0b0          ; $feed: cc b0 a0  
            CPY $6038          ; $fef0: cc 38 60  
            .hex 0c 01 01      ; $fef3: 0c 01 01  Invalid Opcode - NOP $0101
            ORA ($31,x)        ; $fef6: 01 31     
            LDY #$1c           ; $fef8: a0 1c     
            BPL __ff14         ; $fefa: 10 18     
            .hex 43 c6         ; $fefc: 43 c6     Invalid Opcode - SRE ($c6,x)
            CPY $38a0          ; $fefe: cc a0 38  
            CPY $3c60          ; $ff01: cc 60 3c  
            BPL __ff16         ; $ff04: 10 10     
            BPL __ff18         ; $ff06: 10 10     
__ff08:     LDY #$38           ; $ff08: a0 38     
            STA $01            ; $ff0a: 85 01     
            ORA ($ca,x)        ; $ff0c: 01 ca     
            CPY $2c4c          ; $ff0e: cc 4c 2c  
            .hex 9e 48 ff      ; $ff11: 9e 48 ff  Invalid Opcode - SHX __ff48,y
__ff14:     .hex ff 47         ; $ff14: ff 47     Suspected data
__ff16:     .hex ff 3b         ; $ff16: ff 3b     Suspected data
__ff18:     .hex 3a            ; $ff18: 3a        Invalid Opcode - NOP 
            STA $84            ; $ff19: 85 84     
__ff1b:     .hex ff c0 e0      ; $ff1b: ff c0 e0  Invalid Opcode - ISC __e0c0,x
            CPX $ce            ; $ff1e: e4 ce     
            .hex cc cc         ; $ff20: cc cc     Suspected data
__ff22:     .hex cc            ; $ff22: cc        Suspected data
__ff23:     SEC                ; $ff23: 38        
            .hex e4            ; $ff24: e4        Suspected data
__ff25:     ROR __c324         ; $ff25: 6e 24 c3  
            CPY __c34c         ; $ff28: cc 4c c3  
            STA $a383          ; $ff2b: 8d 83 a3  
            BNE __ff68         ; $ff2e: d0 38     
            .hex cc 8d         ; $ff30: cc 8d     Suspected data
__ff32:     .hex c3 cc         ; $ff32: c3 cc     Invalid Opcode - DCP ($cc,x)
            SEC                ; $ff34: 38        
            CPY $020c          ; $ff35: cc 0c 02  
            .hex c3 cc         ; $ff38: c3 cc     Invalid Opcode - DCP ($cc,x)
            SEC                ; $ff3a: 38        
            CPY $37            ; $ff3b: c4 37     
            CLI                ; $ff3d: 58        
            TYA                ; $ff3e: 98        
            SEI                ; $ff3f: 78        
            .hex ff a3 85      ; $ff40: ff a3 85  Invalid Opcode - ISC $85a3,x
__ff43:     STY $6573          ; $ff43: 8c 73 65  
            .hex 5a            ; $ff46: 5a        Invalid Opcode - NOP 
            CLC                ; $ff47: 18        
__ff48:     BRK                ; $ff48: 00        
            CPX $ee            ; $ff49: e4 ee     
            .hex cc            ; $ff4b: cc        Suspected data
__ff4c:     STY __eec2         ; $ff4c: 8c c2 ee  
            JSR $2c20          ; $ff4f: 20 20 2c  
__ff52:     CPY $02ca          ; $ff52: cc ca 02  
            .hex 02            ; $ff55: 02        Invalid Opcode - KIL 
            .hex 0e            ; $ff56: 0e        Suspected data
__ff57:     .hex 32            ; $ff57: 32        Invalid Opcode - KIL 
            .hex c2 02         ; $ff58: c2 02     Invalid Opcode - NOP #$02
            ASL $3202          ; $ff5a: 0e 02 32  
            .hex c2 02         ; $ff5d: c2 02     Invalid Opcode - NOP #$02
            .hex 02            ; $ff5f: 02        Invalid Opcode - KIL 
            ROL $32,x          ; $ff60: 36 32     
__ff62:     .hex 32            ; $ff62: 32        Invalid Opcode - KIL 
            .hex c2 02         ; $ff63: c2 02     Invalid Opcode - NOP #$02
            .hex c2 32         ; $ff65: c2 32     Invalid Opcode - NOP #$32
            .hex 32            ; $ff67: 32        Invalid Opcode - KIL 
__ff68:     .hex c2 02         ; $ff68: c2 02     Invalid Opcode - NOP #$02
            ROR $2323          ; $ff6a: 6e 23 23  
            BIT $32cc          ; $ff6d: 2c cc 32  
            .hex c2 ee         ; $ff70: c2 ee     Invalid Opcode - NOP #$ee
            JMP $8338          ; $ff72: 4c 38 83  

;-------------------------------------------------------------------------------
            CLI                ; $ff75: 58        
            .hex 0b ff         ; $ff76: 0b ff     Invalid Opcode - ANC #$ff
            .hex 17 ff         ; $ff78: 17 ff     Invalid Opcode - SLO $ff,x
            .hex 67 34         ; $ff7a: 67 34     Invalid Opcode - RRA $34
            .hex 73 5d         ; $ff7c: 73 5d     Invalid Opcode - RRA ($5d),y
            LSR                ; $ff7e: 4a        
            CPY #$cc           ; $ff7f: c0 cc     
            CPY $30b4          ; $ff81: cc b4 30  
            .hex 34 f0         ; $ff84: 34 f0     Invalid Opcode - NOP $f0,x
            .hex 34 34         ; $ff86: 34 34     Invalid Opcode - NOP $34,x
            BVS __ffba         ; $ff88: 70 30     
            .hex 3c 34 34      ; $ff8a: 3c 34 34  Invalid Opcode - NOP $3434,x
            BVS __ffbf         ; $ff8d: 70 30     
            .hex 3c 34 34      ; $ff8f: 3c 34 34  Invalid Opcode - NOP $3434,x
            BEQ __ffd0         ; $ff92: f0 3c     
            .hex 74 30         ; $ff94: 74 30     Invalid Opcode - NOP $30,x
            BEQ __ff4c         ; $ff96: f0 b4     
            .hex 34 b4         ; $ff98: 34 b4     Invalid Opcode - NOP $b4,x
            BVS __ffd8         ; $ff9a: 70 3c     
            .hex 34 34         ; $ff9c: 34 34     Invalid Opcode - NOP $34,x
            .hex 30 70         ; $ff9e: 30 70     Illegal Branch - BMI #$70
            .hex 3c b8 30      ; $ffa0: 3c b8 30  Invalid Opcode - NOP $30b8,x
            .hex 34 f0         ; $ffa3: 34 f0     Invalid Opcode - NOP $f0,x
            .hex 0c 53 9c      ; $ffa5: 0c 53 9c  Invalid Opcode - NOP $9c53
            CPY __c4cc         ; $ffa8: cc cc c4  
            .hex 23 ff         ; $ffab: 23 ff     Invalid Opcode - RLA ($ff,x)
            .hex ff ff ff      ; $ffad: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffb0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffb3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $ffb6: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $ffb9: 00        
__ffba:     BRK                ; $ffba: 00        
            BRK                ; $ffbb: 00        
            BRK                ; $ffbc: 00        
            BRK                ; $ffbd: 00        
            BRK                ; $ffbe: 00        
__ffbf:     BRK                ; $ffbf: 00        
            BRK                ; $ffc0: 00        
            BRK                ; $ffc1: 00        
            BRK                ; $ffc2: 00        
            BRK                ; $ffc3: 00        
            BRK                ; $ffc4: 00        
            BRK                ; $ffc5: 00        
            BRK                ; $ffc6: 00        
            BRK                ; $ffc7: 00        
            BRK                ; $ffc8: 00        
            BRK                ; $ffc9: 00        
            BRK                ; $ffca: 00        
            BRK                ; $ffcb: 00        
            BRK                ; $ffcc: 00        
            BRK                ; $ffcd: 00        
            .hex 23 ff         ; $ffce: 23 ff     Invalid Opcode - RLA ($ff,x)
__ffd0:     .hex ff ff ff      ; $ffd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ffd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $ffd6: ff ff     Suspected data
__ffd8:     .hex ff ff 00      ; $ffd8: ff ff 00  Bad Addr Mode - ISC $00ff,x
            BRK                ; $ffdb: 00        
            BRK                ; $ffdc: 00        
            BRK                ; $ffdd: 00        
            BRK                ; $ffde: 00        
            BRK                ; $ffdf: 00        
            BRK                ; $ffe0: 00        
            BRK                ; $ffe1: 00        
            BRK                ; $ffe2: 00        
            BRK                ; $ffe3: 00        
            BRK                ; $ffe4: 00        
            BRK                ; $ffe5: 00        
            BRK                ; $ffe6: 00        
            BRK                ; $ffe7: 00        
            BRK                ; $ffe8: 00        
            BRK                ; $ffe9: 00        
            BRK                ; $ffea: 00        
            BRK                ; $ffeb: 00        
            BRK                ; $ffec: 00        
            BRK                ; $ffed: 00        
            BRK                ; $ffee: 00        
            BRK                ; $ffef: 00        
            .hex ff ff ff      ; $fff0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fff3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $fff6: ff ff ff  Invalid Opcode - ISC $ffff,x
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        RTI                ; $fff9: 40        

;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: c0 c0     Vector table
            .dw reset                      ; $fffc: 00 c0     Vector table
            .dw irq                        ; $fffe: f9 ff     Vector table
