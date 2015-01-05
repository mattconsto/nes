;-------------------------------------------------------------------------------
; Donkey Kong.nes disasembled by DISASM6 v1.4
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
__c000:     JSR $0670          ; $c000: 20 70 06  
            BRK                ; $c003: 00        
            JSR $0664          ; $c004: 20 64 06  
            BRK                ; $c007: 00        
            JSR $0678          ; $c008: 20 78 06  
            BRK                ; $c00b: 00        
            JSR $04b7          ; $c00c: 20 b7 04  
            BRK                ; $c00f: 00        
            JSR $01bc          ; $c010: 20 bc 01  
            BRK                ; $c013: 00        
__c014:     ORA ($08,x)        ; $c014: 01 08     
            .hex 02            ; $c016: 02        Invalid Opcode - KIL 
            PHP                ; $c017: 08        
            .hex 02            ; $c018: 02        Invalid Opcode - KIL 
            BRK                ; $c019: 00        
            ORA $01            ; $c01a: 05 01     
            BRK                ; $c01c: 00        
            .hex 02            ; $c01d: 02        Invalid Opcode - KIL 
            ORA ($01,x)        ; $c01e: 01 01     
            ORA ($05,x)        ; $c020: 01 05     
            ORA ($05,x)        ; $c022: 01 05     
            ORA ($02,x)        ; $c024: 01 02     
            ORA ($02,x)        ; $c026: 01 02     
__c028:     .hex db 60 e2      ; $c028: db 60 e2  Invalid Opcode - DCP __e260,y
            EOR $14,x          ; $c02b: 55 14     
            JSR __f901         ; $c02d: 20 01 f9  
            LDY #$e0           ; $c030: a0 e0     
            BMI __c044         ; $c032: 30 10     
            BPL __c037         ; $c034: 10 01     
            .hex 50            ; $c036: 50        Suspected data
__c037:     ORA ($30,x)        ; $c037: 01 30     
            .hex d0 ff         ; $c039: d0 ff     Illegal Branch - BNE #$ff
            .hex ff            ; $c03b: ff        Suspected data
__c03c:     .hex 3e            ; $c03c: 3e        Suspected data
__c03d:     DEC $57            ; $c03d: c6 57     
            DEC $e1            ; $c03f: c6 e1     
            DEC $60            ; $c041: c6 60     
            .hex c7            ; $c043: c7        Suspected data
__c044:     .hex 7d            ; $c044: 7d        Suspected data
__c045:     .hex c7 e4         ; $c045: c7 e4     Invalid Opcode - DCP $e4
            DEC $f1            ; $c047: c6 f1     
            DEC $53            ; $c049: c6 53     
            .hex c7 08         ; $c04b: c7 08     Invalid Opcode - DCP $08
            .hex c7 19         ; $c04d: c7 19     Invalid Opcode - DCP $19
            .hex c7 1c         ; $c04f: c7 1c     Invalid Opcode - DCP $1c
            .hex c7 35         ; $c051: c7 35     Invalid Opcode - DCP $35
            .hex c7 4e         ; $c053: c7 4e     Invalid Opcode - DCP $4e
            .hex c7 8c         ; $c055: c7 8c     Invalid Opcode - DCP $8c
            CPY #$cf           ; $c057: c0 cf     
            CPY #$61           ; $c059: c0 61     
            CMP ($60,x)        ; $c05b: c1 60     
            .hex 04 c3         ; $c05d: 04 c3     Invalid Opcode - NOP $c3
            CPY #$df           ; $c05f: c0 df     
            CPY #$6e           ; $c061: c0 6e     
            CMP ($c4,x)        ; $c063: c1 c4     
            .hex c2 c8         ; $c065: c2 c8     Invalid Opcode - NOP #$c8
            .hex c2 86         ; $c067: c2 86     Invalid Opcode - NOP #$86
            CMP ($b0,x)        ; $c069: c1 b0     
            CMP ($92,x)        ; $c06b: c1 92     
            CMP ($cf,x)        ; $c06d: c1 cf     
            CMP ($d5,x)        ; $c06f: c1 d5     
            .hex c1            ; $c071: c1        Suspected data
__c072:     .hex db c1 e1      ; $c072: db c1 e1  Invalid Opcode - DCP __e1c1,y
            CMP ($9e,x)        ; $c075: c1 9e     
            CMP ($e7,x)        ; $c077: c1 e7     
            CMP ($0c,x)        ; $c079: c1 0c     
            DEC $70            ; $c07b: c6 70     
            DEC $89            ; $c07d: c6 89     
            DEC $25            ; $c07f: c6 25     
            DEC $a2            ; $c081: c6 a2     
            DEC $cc            ; $c083: c6 cc     
            BRK                ; $c085: 00        
            STX $96c1          ; $c086: 8e c1 96  
            CMP ($a6,x)        ; $c089: c1 a6     
            .hex c6            ; $c08b: c6        Suspected data
__c08c:     BRK                ; $c08c: 00        
            CLD                ; $c08d: d8        
            BRK                ; $c08e: 00        
            BRK                ; $c08f: 00        
            ORA ($00,x)        ; $c090: 01 00     
            .hex 80 d7         ; $c092: 80 d7     Invalid Opcode - NOP #$d7
            .hex 04 18         ; $c094: 04 18     Invalid Opcode - NOP $18
            ASL $fe            ; $c096: 06 fe     
__c098:     INY                ; $c098: c8        
            LDY __e804,x       ; $c099: bc 04 e8  
            ORA #$fe           ; $c09c: 09 fe     
            JSR $049e          ; $c09e: 20 9e 04  
            CLC                ; $c0a1: 18        
            ORA #$fe           ; $c0a2: 09 fe     
            INY                ; $c0a4: c8        
            .hex 80 04         ; $c0a5: 80 04     Invalid Opcode - NOP #$04
            INX                ; $c0a7: e8        
            ORA #$fe           ; $c0a8: 09 fe     
            JSR $0462          ; $c0aa: 20 62 04  
            CLC                ; $c0ad: 18        
            ORA #$fe           ; $c0ae: 09 fe     
            INY                ; $c0b0: c8        
            .hex 44 04         ; $c0b1: 44 04     Invalid Opcode - NOP $04
            INX                ; $c0b3: e8        
            ASL $fe            ; $c0b4: 06 fe     
            .hex 80 28         ; $c0b6: 80 28     Invalid Opcode - NOP #$28
            .hex 04 00         ; $c0b8: 04 00     Invalid Opcode - NOP $00
            ORA ($fe,x)        ; $c0ba: 01 fe     
            LDY $809e,x        ; $c0bc: bc 9e 80  
            .hex 62            ; $c0bf: 62        Invalid Opcode - KIL 
            .hex 44 28         ; $c0c0: 44 28     Invalid Opcode - NOP $28
            .hex ff 00 00      ; $c0c2: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex 80 00         ; $c0c5: 80 00     Invalid Opcode - NOP #$00
__c0c7:     BRK                ; $c0c7: 00        
            BRK                ; $c0c8: 00        
            CLC                ; $c0c9: 18        
            BRK                ; $c0ca: 00        
            BRK                ; $c0cb: 00        
            BRK                ; $c0cc: 00        
__c0cd:     BPL __c0cf         ; $c0cd: 10 00     
__c0cf:     CPX #$bc           ; $c0cf: e0 bc     
            BRK                ; $c0d1: 00        
            BPL __c072         ; $c0d2: 10 9e     
            BRK                ; $c0d4: 00        
            CPX #$80           ; $c0d5: e0 80     
            BRK                ; $c0d7: 00        
            BPL __c13c         ; $c0d8: 10 62     
            BRK                ; $c0da: 00        
            CPX #$44           ; $c0db: e0 44     
            BRK                ; $c0dd: 00        
            .hex fe 00 00      ; $c0de: fe 00 00  Bad Addr Mode - INC $0000,x
            BPL __c0e6         ; $c0e1: 10 03     
            INY                ; $c0e3: c8        
            .hex bc 08         ; $c0e4: bc 08     Suspected data
__c0e6:     INY                ; $c0e6: c8        
            .hex 80 04         ; $c0e7: 80 04     Invalid Opcode - NOP #$04
            CLV                ; $c0e9: b8        
            .hex 74 10         ; $c0ea: 74 10     Invalid Opcode - NOP $10,x
            PLA                ; $c0ec: 68        
            CLI                ; $c0ed: 58        
            .hex 14 c8         ; $c0ee: 14 c8     Invalid Opcode - NOP $c8,x
            .hex 44 04         ; $c0f0: 44 04     Invalid Opcode - NOP $04
            RTS                ; $c0f2: 60        

;-------------------------------------------------------------------------------
            .hex cf 0c 70      ; $c0f3: cf 0c 70  Invalid Opcode - DCP $700c
            .hex 9b            ; $c0f6: 9b        Invalid Opcode - TAS 
            BRK                ; $c0f7: 00        
            BMI __c098         ; $c0f8: 30 9e     
            .hex 04 50         ; $c0fa: 04 50     Invalid Opcode - NOP $50
            STA $08            ; $c0fc: 85 08     
            .hex 80 7d         ; $c0fe: 80 7d     Invalid Opcode - NOP #$7d
            BRK                ; $c100: 00        
            BMI __c165         ; $c101: 30 62     
            .hex 04 58         ; $c103: 04 58     Invalid Opcode - NOP $58
            RTS                ; $c105: 60        

;-------------------------------------------------------------------------------
            BRK                ; $c106: 00        
            BCC __c131         ; $c107: 90 28     
            CLC                ; $c109: 18        
            .hex fe 00 00      ; $c10a: fe 00 00  Bad Addr Mode - INC $0000,x
            PHP                ; $c10d: 08        
            .hex 1d 00 00      ; $c10e: 1d 00 00  Bad Addr Mode - ORA $0000,x
            PHP                ; $c111: 08        
            .hex 17 00         ; $c112: 17 00     Invalid Opcode - SLO $00,x
            BRK                ; $c114: 00        
            PHP                ; $c115: 08        
            CLC                ; $c116: 18        
            BRK                ; $c117: 00        
            BRK                ; $c118: 00        
            PHP                ; $c119: 08        
            ORA #$00           ; $c11a: 09 00     
            BRK                ; $c11c: 00        
            PHP                ; $c11d: 08        
            .hex 0b 00         ; $c11e: 0b 00     Invalid Opcode - ANC #$00
            BRK                ; $c120: 00        
            PHP                ; $c121: 08        
            .hex 07 00         ; $c122: 07 00     Invalid Opcode - SLO $00
            BRK                ; $c124: 00        
            PHP                ; $c125: 08        
            ORA $bcc8,y        ; $c126: 19 c8 bc  
            BRK                ; $c129: 00        
            BVS __c0c7         ; $c12a: 70 9b     
            BRK                ; $c12c: 00        
            BMI __c0cd         ; $c12d: 30 9e     
            BRK                ; $c12f: 00        
            INY                ; $c130: c8        
__c131:     .hex 80 00         ; $c131: 80 00     Invalid Opcode - NOP #$00
            .hex 80 7d         ; $c133: 80 7d     Invalid Opcode - NOP #$7d
            BRK                ; $c135: 00        
            BMI __c19a         ; $c136: 30 62     
            BRK                ; $c138: 00        
            CLI                ; $c139: 58        
            RTS                ; $c13a: 60        

;-------------------------------------------------------------------------------
            BRK                ; $c13b: 00        
__c13c:     INY                ; $c13c: c8        
            .hex 44 00         ; $c13d: 44 00     Invalid Opcode - NOP $00
            BCC __c169         ; $c13f: 90 28     
            BRK                ; $c141: 00        
            .hex fe 00 00      ; $c142: fe 00 00  Bad Addr Mode - INC $0000,x
            PHP                ; $c145: 08        
            .hex 0d            ; $c146: 0d        Suspected data
__c147:     BIT $24            ; $c147: 24 24     
            .hex 54 54         ; $c149: 54 54     Invalid Opcode - NOP $54,x
            RTS                ; $c14b: 60        

;-------------------------------------------------------------------------------
            RTS                ; $c14c: 60        

;-------------------------------------------------------------------------------
            .hex 64 64         ; $c14d: 64 64     Invalid Opcode - NOP $64
            RTS                ; $c14f: 60        

;-------------------------------------------------------------------------------
            RTS                ; $c150: 60        

;-------------------------------------------------------------------------------
            BIT $24            ; $c151: 24 24     
            PLA                ; $c153: 68        
            PLA                ; $c154: 68        
            PLA                ; $c155: 68        
            PLA                ; $c156: 68        
            PLA                ; $c157: 68        
            PLA                ; $c158: 68        
__c159:     BIT $24            ; $c159: 24 24     
            BIT $54            ; $c15b: 24 54     
            .hex 54 54         ; $c15d: 54 54     Invalid Opcode - NOP $54,x
            BRK                ; $c15f: 00        
            BRK                ; $c160: 00        
            RTS                ; $c161: 60        

;-------------------------------------------------------------------------------
            .hex b7 00         ; $c162: b7 00     Invalid Opcode - LAX $00,y
            .hex 50            ; $c164: 50        Suspected data
__c165:     .hex 7b 00 b8      ; $c165: 7b 00 b8  Invalid Opcode - RRA $b800,y
            .hex 5c            ; $c168: 5c        Suspected data
__c169:     BRK                ; $c169: 00        
            PLA                ; $c16a: 68        
            RTI                ; $c16b: 40        

;-------------------------------------------------------------------------------
            BRK                ; $c16c: 00        
            .hex fe 00 00      ; $c16d: fe 00 00  Bad Addr Mode - INC $0000,x
            PHP                ; $c170: 08        
            CLC                ; $c171: 18        
__c172:     DEX                ; $c172: ca        
__c173:     .hex a7 8e         ; $c173: a7 8e     Invalid Opcode - LAX $8e
            .hex 6b 51         ; $c175: 6b 51     Invalid Opcode - ARR #$51
__c177:     .hex 5c 2c 4c      ; $c177: 5c 2c 4c  Invalid Opcode - NOP $4c2c,x
            .hex 2c 64         ; $c17a: 2c 64     Suspected data
__c17c:     DEC $aa            ; $c17c: c6 aa     
            STY $4d6d          ; $c17e: 8c 6d 4d  
__c181:     CPY $6c            ; $c181: c4 6c     
            .hex 7c 54 c4      ; $c183: 7c 54 c4  Invalid Opcode - NOP __c454,x
            PHP                ; $c186: 08        
            ORA ($0a),y        ; $c187: 11 0a     
            ORA ($08),y        ; $c189: 11 08     
__c18b:     BPL __c197         ; $c18b: 10 0a     
            ORA ($08),y        ; $c18d: 11 08     
            .hex 0f 0a 11      ; $c18f: 0f 0a 11  Invalid Opcode - SLO $110a
            ORA $01            ; $c192: 05 01     
            .hex 0c 09         ; $c194: 0c 09     Suspected data
__c196:     .hex 05            ; $c196: 05        Suspected data
__c197:     .hex 05            ; $c197: 05        Suspected data
__c198:     ASL                ; $c198: 0a        
            ASL                ; $c199: 0a        
__c19a:     PHP                ; $c19a: 08        
            BPL __c1a5         ; $c19b: 10 08     
            BPL __c1a3         ; $c19d: 10 04     
            .hex 04 0c         ; $c19f: 04 0c     Invalid Opcode - NOP $0c
            .hex 0d            ; $c1a1: 0d        Suspected data
__c1a2:     .hex 0c            ; $c1a2: 0c        Suspected data
__c1a3:     .hex 14 1c         ; $c1a3: 14 1c     Invalid Opcode - NOP $1c,x
__c1a5:     BPL __c1bf         ; $c1a5: 10 18     
            .hex 20            ; $c1a7: 20        Suspected data
__c1a8:     .hex 03 05         ; $c1a8: 03 05     Invalid Opcode - SLO ($05,x)
            .hex 02            ; $c1aa: 02        Invalid Opcode - KIL 
            .hex 03 00         ; $c1ab: 03 00     Invalid Opcode - SLO ($00,x)
            BRK                ; $c1ad: 00        
            .hex 03 04         ; $c1ae: 03 04     Invalid Opcode - SLO ($04,x)
            BRK                ; $c1b0: 00        
            BRK                ; $c1b1: 00        
            PHP                ; $c1b2: 08        
            PHP                ; $c1b3: 08        
__c1b4:     BPL __c196         ; $c1b4: 10 e0     
            BPL __c198         ; $c1b6: 10 e0     
            .hex 0c e0 08      ; $c1b8: 0c e0 08  Invalid Opcode - NOP $08e0
            INX                ; $c1bb: e8        
__c1bc:     ORA ($02,x)        ; $c1bc: 01 02     
            .hex 04            ; $c1be: 04        Suspected data
__c1bf:     PHP                ; $c1bf: 08        
            BPL __c1e2         ; $c1c0: 10 20     
            RTI                ; $c1c2: 40        

;-------------------------------------------------------------------------------
            .hex 80            ; $c1c3: 80        Suspected data
__c1c4:     .hex 13 30         ; $c1c4: 13 30     Invalid Opcode - SLO ($30),y
            PHA                ; $c1c6: 48        
            RTS                ; $c1c7: 60        

;-------------------------------------------------------------------------------
            SEI                ; $c1c8: 78        
            BCC __c173         ; $c1c9: 90 a8     
            CPY #$e0           ; $c1cb: c0 e0     
__c1cd:     .hex 13 db         ; $c1cd: 13 db     Invalid Opcode - SLO ($db),y
__c1cf:     JMP $886a          ; $c1cf: 4c 6a 88  

;-------------------------------------------------------------------------------
            LDX $c5            ; $c1d2: a6 c5     
            INC $6b53,x        ; $c1d4: fe 53 6b  
            .hex 8f a7 ca      ; $c1d7: 8f a7 ca  Invalid Opcode - SAX __caa7
            INC $6e52,x        ; $c1da: fe 52 6e  
            STY __c5ac         ; $c1dd: 8c ac c5  
            .hex fe 52         ; $c1e0: fe 52     Suspected data
__c1e2:     JMP ($a88e)        ; $c1e2: 6c 8e a8  

;-------------------------------------------------------------------------------
            DEX                ; $c1e5: ca        
            INC $0600,x        ; $c1e6: fe 00 06  
            PHP                ; $c1e9: 08        
            PHP                ; $c1ea: 08        
__c1eb:     .hex 19            ; $c1eb: 19        Suspected data
__c1ec:     BMI __c222         ; $c1ec: 30 34     
            BMI __c224         ; $c1ee: 30 34     
            BMI __c226         ; $c1f0: 30 34     
            SEC                ; $c1f2: 38        
            .hex 3c 3c 3c      ; $c1f3: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
__c1f6:     .hex 02            ; $c1f6: 02        Invalid Opcode - KIL 
            .hex 04 02         ; $c1f7: 04 02     Invalid Opcode - NOP $02
            .hex 04            ; $c1f9: 04        Suspected data
__c1fa:     .hex 07 05         ; $c1fa: 07 05     Invalid Opcode - SLO $05
            .hex 07            ; $c1fc: 07        Suspected data
__c1fd:     ORA #$03           ; $c1fd: 09 03     
__c1ff:     BRK                ; $c1ff: 00        
            BRK                ; $c200: 00        
            .hex 04 08         ; $c201: 04 08     Invalid Opcode - NOP $08
            ORA ($02,x)        ; $c203: 01 02     
            .hex 03 04         ; $c205: 03 04     Invalid Opcode - SLO ($04,x)
__c207:     BVC __c269         ; $c207: 50 60     
            BVS __c18b         ; $c209: 70 80     
            BCC __c21b         ; $c20b: 90 0e     
            CLD                ; $c20d: d8        
            CLC                ; $c20e: 18        
            ASL $04c8          ; $c20f: 0e c8 04  
            STX $c8            ; $c212: 86 c8     
            .hex 04 a6         ; $c214: 04 a6     Invalid Opcode - NOP $a6
            CPY #$00           ; $c216: c0 00     
            LDX $00b8,y        ; $c218: be b8 00  
__c21b:     DEC $b0,x          ; $c21b: d6 b0     
            .hex 04 4e         ; $c21d: 04 4e     Invalid Opcode - NOP $4e
            BCS __c225         ; $c21f: b0 04     
            .hex 0e            ; $c221: 0e        Suspected data
__c222:     LDY #$04           ; $c222: a0 04     
__c224:     .hex de            ; $c224: de        Suspected data
__c225:     .hex a0            ; $c225: a0        Suspected data
__c226:     BRK                ; $c226: 00        
            DEC $98            ; $c227: c6 98     
            BRK                ; $c229: 00        
            .hex ae 90 00      ; $c22a: ae 90 00  Bad Addr Mode - LDX $0090
            STX $88,y          ; $c22d: 96 88     
            .hex 14 c6         ; $c22f: 14 c6     Invalid Opcode - NOP $c6,x
            SEI                ; $c231: 78        
            .hex 0c 0e 70      ; $c232: 0c 0e 70  Invalid Opcode - NOP $700e
            .hex 04 46         ; $c235: 04 46     Invalid Opcode - NOP $46
            BVS __c241         ; $c237: 70 08     
            STX $0468          ; $c239: 8e 68 04  
            .hex ae 60 00      ; $c23c: ae 60 00  Bad Addr Mode - LDX $0060
            DEC $58            ; $c23f: c6 58     
__c241:     BRK                ; $c241: 00        
            .hex de 50 00      ; $c242: de 50 00  Bad Addr Mode - DEC $0050,x
            ROR $40            ; $c245: 66 40     
            BPL __c1cf         ; $c247: 10 86     
            PLP                ; $c249: 28        
            BRK                ; $c24a: 00        
            INC $78b0,x        ; $c24b: fe b0 78  
            RTS                ; $c24e: 60        

;-------------------------------------------------------------------------------
            RTI                ; $c24f: 40        

;-------------------------------------------------------------------------------
            PLP                ; $c250: 28        
            .hex ff 00 00      ; $c251: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex 14 00         ; $c254: 14 00     Invalid Opcode - NOP $00,x
            BRK                ; $c256: 00        
            BRK                ; $c257: 00        
            .hex 1c 00 00      ; $c258: 1c 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $c25b: 00        
            BIT $00            ; $c25c: 24 00     
            BRK                ; $c25e: 00        
            BRK                ; $c25f: 00        
            .hex 2c 00 00      ; $c260: 2c 00 00  Bad Addr Mode - BIT $0000
            BRK                ; $c263: 00        
            .hex 54 00         ; $c264: 54 00     Invalid Opcode - NOP $00,x
            BRK                ; $c266: 00        
            BRK                ; $c267: 00        
            .hex 12            ; $c268: 12        Invalid Opcode - KIL 
__c269:     BRK                ; $c269: 00        
            BRK                ; $c26a: 00        
            BRK                ; $c26b: 00        
            CPX $00            ; $c26c: e4 00     
            CLC                ; $c26e: 18        
            LDY #$0c           ; $c26f: a0 0c     
            JSR $1070          ; $c271: 20 70 10  
            BVC __c2e6         ; $c274: 50 70     
            .hex 14 60         ; $c276: 14 60     Invalid Opcode - NOP $60,x
            BVS __c28e         ; $c278: 70 14     
            TYA                ; $c27a: 98        
            PLA                ; $c27b: 68        
            PHP                ; $c27c: 08        
            INY                ; $c27d: c8        
            SEI                ; $c27e: 78        
            PHP                ; $c27f: 08        
            CPX #$a0           ; $c280: e0 a0     
            BRK                ; $c282: 00        
            CPX #$50           ; $c283: e0 50     
            .hex 0c b0 40      ; $c285: 0c b0 40  Invalid Opcode - NOP $40b0
            PHP                ; $c288: 08        
            BCC __c2b3         ; $c289: 90 28     
            .hex 04 fe         ; $c28b: 04 fe     Invalid Opcode - NOP $fe
            BRK                ; $c28d: 00        
__c28e:     BRK                ; $c28e: 00        
            PHP                ; $c28f: 08        
            BPL __c292         ; $c290: 10 00     
__c292:     BRK                ; $c292: 00        
            PHP                ; $c293: 08        
            CLC                ; $c294: 18        
            BRK                ; $c295: 00        
            BRK                ; $c296: 00        
            PHP                ; $c297: 08        
            JSR $0000          ; $c298: 20 00 00  
            PHP                ; $c29b: 08        
            PLP                ; $c29c: 28        
            BRK                ; $c29d: 00        
            BRK                ; $c29e: 00        
            PHP                ; $c29f: 08        
            BMI __c2a2         ; $c2a0: 30 00     
__c2a2:     BRK                ; $c2a2: 00        
            PHP                ; $c2a3: 08        
            RTI                ; $c2a4: 40        

;-------------------------------------------------------------------------------
            CLC                ; $c2a5: 18        
            LDY #$00           ; $c2a6: a0 00     
            JSR $0070          ; $c2a8: 20 70 00  
            BVC __c31d         ; $c2ab: 50 70     
__c2ad:     BRK                ; $c2ad: 00        
            RTS                ; $c2ae: 60        

;-------------------------------------------------------------------------------
            BVS __c2b1         ; $c2af: 70 00     
__c2b1:     TYA                ; $c2b1: 98        
__c2b2:     PLA                ; $c2b2: 68        
__c2b3:     BRK                ; $c2b3: 00        
            INY                ; $c2b4: c8        
            SEI                ; $c2b5: 78        
            BRK                ; $c2b6: 00        
            CPX #$a0           ; $c2b7: e0 a0     
            BRK                ; $c2b9: 00        
            CPX #$50           ; $c2ba: e0 50     
            BRK                ; $c2bc: 00        
            BCS __c2ff         ; $c2bd: b0 40     
            BRK                ; $c2bf: 00        
            BCC __c2ea         ; $c2c0: 90 28     
            BRK                ; $c2c2: 00        
            INC $0104,x        ; $c2c3: fe 04 01  
            .hex 1b 0e 00      ; $c2c6: 1b 0e 00  Invalid Opcode - SLO $000e,y
            ORA ($12,x)        ; $c2c9: 01 12     
            .hex 01            ; $c2cb: 01        Suspected data
__c2cc:     BMI __c306         ; $c2cc: 30 38     
__c2ce:     RTI                ; $c2ce: 40        

;-------------------------------------------------------------------------------
            PHA                ; $c2cf: 48        
__c2d0:     BVC __c32a         ; $c2d0: 50 58     
__c2d2:     BRK                ; $c2d2: 00        
            BRK                ; $c2d3: 00        
            ORA #$15           ; $c2d4: 09 15     
            CLC                ; $c2d6: 18        
            BRK                ; $c2d7: 00        
            JMP $035f          ; $c2d8: 4c 5f 03  

;-------------------------------------------------------------------------------
            .hex 5c 5f 03      ; $c2db: 5c 5f 03  Invalid Opcode - NOP $035f,x
            CPY $67            ; $c2de: c4 67     
            .hex 03 4c         ; $c2e0: 03 4c     Invalid Opcode - SLO ($4c,x)
            .hex 9f 13 5c      ; $c2e2: 9f 13 5c  Invalid Opcode - AHX $5c13,y
            .hex 9f            ; $c2e5: 9f        Suspected data
__c2e6:     .hex 13 c4         ; $c2e6: 13 c4     Invalid Opcode - SLO ($c4),y
            .hex 87 13         ; $c2e8: 87 13     Invalid Opcode - SAX $13
__c2ea:     .hex dc 3f 03      ; $c2ea: dc 3f 03  Invalid Opcode - NOP $033f,x
            .hex dc 67 13      ; $c2ed: dc 67 13  Invalid Opcode - NOP $1367,x
            ASL $d8            ; $c2f0: 06 d8     
            BRK                ; $c2f2: 00        
            ASL $b8            ; $c2f3: 06 b8     
            BRK                ; $c2f5: 00        
            ASL $90,x          ; $c2f6: 16 90     
            .hex 04 1e         ; $c2f8: 04 1e     Invalid Opcode - NOP $1e
            PLA                ; $c2fa: 68        
            PHP                ; $c2fb: 08        
            ROL $40            ; $c2fc: 26 40     
            .hex 0c            ; $c2fe: 0c        Suspected data
__c2ff:     INC $90b8,x        ; $c2ff: fe b8 90  
            PLA                ; $c302: 68        
__c303:     RTI                ; $c303: 40        

;-------------------------------------------------------------------------------
            PLP                ; $c304: 28        
            .hex ff            ; $c305: ff        Suspected data
__c306:     BRK                ; $c306: 00        
            BRK                ; $c307: 00        
            SBC $00,x          ; $c308: f5 00     
            BRK                ; $c30a: 00        
            BRK                ; $c30b: 00        
            CMP $00,x          ; $c30c: d5 00     
            BRK                ; $c30e: 00        
            BRK                ; $c30f: 00        
            CMP $00            ; $c310: c5 00     
            BRK                ; $c312: 00        
            BRK                ; $c313: 00        
            LDA $00,x          ; $c314: b5 00     
            BPL __c2d0         ; $c316: 10 b8     
            BRK                ; $c318: 00        
            SEI                ; $c319: 78        
            CLV                ; $c31a: b8        
            BRK                ; $c31b: 00        
            INX                ; $c31c: e8        
__c31d:     CLV                ; $c31d: b8        
            BRK                ; $c31e: 00        
            CLC                ; $c31f: 18        
            BCC __c326         ; $c320: 90 04     
            RTS                ; $c322: 60        

;-------------------------------------------------------------------------------
            BCC __c329         ; $c323: 90 04     
            TYA                ; $c325: 98        
__c326:     BCC __c32c         ; $c326: 90 04     
            .hex e0            ; $c328: e0        Suspected data
__c329:     .hex 90            ; $c329: 90        Suspected data
__c32a:     .hex 04 20         ; $c32a: 04 20     Invalid Opcode - NOP $20
__c32c:     PLA                ; $c32c: 68        
            .hex 04 80         ; $c32d: 04 80     Invalid Opcode - NOP $80
            PLA                ; $c32f: 68        
            .hex 04 d8         ; $c330: 04 d8     Invalid Opcode - NOP $d8
            PLA                ; $c332: 68        
            .hex 04 28         ; $c333: 04 28     Invalid Opcode - NOP $28
            RTI                ; $c335: 40        

;-------------------------------------------------------------------------------
            .hex 04 48         ; $c336: 04 48     Invalid Opcode - NOP $48
            RTI                ; $c338: 40        

;-------------------------------------------------------------------------------
            .hex 04 b0         ; $c339: 04 b0     Invalid Opcode - NOP $b0
            RTI                ; $c33b: 40        

;-------------------------------------------------------------------------------
            .hex 04 d0         ; $c33c: 04 d0     Invalid Opcode - NOP $d0
            RTI                ; $c33e: 40        

;-------------------------------------------------------------------------------
            .hex 04 fe         ; $c33f: 04 fe     Invalid Opcode - NOP $fe
            BRK                ; $c341: 00        
            BRK                ; $c342: 00        
            PHP                ; $c343: 08        
            JSR $0000          ; $c344: 20 00 00  
            PHP                ; $c347: 08        
            PLP                ; $c348: 28        
            BPL __c303         ; $c349: 10 b8     
            BRK                ; $c34b: 00        
            SEI                ; $c34c: 78        
            CLV                ; $c34d: b8        
            BRK                ; $c34e: 00        
            INX                ; $c34f: e8        
            CLV                ; $c350: b8        
            BRK                ; $c351: 00        
            CLC                ; $c352: 18        
            BCC __c355         ; $c353: 90 00     
__c355:     RTS                ; $c355: 60        

;-------------------------------------------------------------------------------
            BCC __c358         ; $c356: 90 00     
__c358:     TYA                ; $c358: 98        
            BCC __c35b         ; $c359: 90 00     
__c35b:     CPX #$90           ; $c35b: e0 90     
            BRK                ; $c35d: 00        
            JSR $0068          ; $c35e: 20 68 00  
            .hex 80 68         ; $c361: 80 68     Invalid Opcode - NOP #$68
            BRK                ; $c363: 00        
            CLD                ; $c364: d8        
            PLA                ; $c365: 68        
            BRK                ; $c366: 00        
            PLP                ; $c367: 28        
            RTI                ; $c368: 40        

;-------------------------------------------------------------------------------
            BRK                ; $c369: 00        
            PHA                ; $c36a: 48        
            RTI                ; $c36b: 40        

;-------------------------------------------------------------------------------
            BRK                ; $c36c: 00        
            BCS __c3af         ; $c36d: b0 40     
            BRK                ; $c36f: 00        
            BNE __c3b2         ; $c370: d0 40     
            BRK                ; $c372: 00        
            INC $0900,x        ; $c373: fe 00 09  
            ASL $4833,x        ; $c376: 1e 33 48  
            .hex 54 0c         ; $c379: 54 0c     Invalid Opcode - NOP $0c,x
            .hex a7 03         ; $c37b: a7 03     Invalid Opcode - LAX $03
            .hex 74 a7         ; $c37d: 74 a7     Invalid Opcode - NOP $a7,x
            .hex 03 e4         ; $c37f: 03 e4     Invalid Opcode - SLO ($e4,x)
            .hex a7 03         ; $c381: a7 03     Invalid Opcode - LAX $03
            .hex 0c c7 13      ; $c383: 0c c7 13  Invalid Opcode - NOP $13c7
            .hex 74 c7         ; $c386: 74 c7     Invalid Opcode - NOP $c7,x
            .hex 13 e4         ; $c388: 13 e4     Invalid Opcode - SLO ($e4),y
            .hex c7 13         ; $c38a: c7 13     Invalid Opcode - DCP $13
            .hex 14 7f         ; $c38c: 14 7f     Invalid Opcode - NOP $7f,x
            .hex 03 5c         ; $c38e: 03 5c     Invalid Opcode - SLO ($5c,x)
            .hex 7f 03 94      ; $c390: 7f 03 94  Invalid Opcode - RRA $9403,x
            .hex 7f 03 dc      ; $c393: 7f 03 dc  Invalid Opcode - RRA __dc03,x
            .hex 7f 03 1c      ; $c396: 7f 03 1c  Invalid Opcode - RRA $1c03,x
            .hex 57            ; $c399: 57        Suspected data
__c39a:     .hex 03 7c         ; $c39a: 03 7c     Invalid Opcode - SLO ($7c,x)
__c39c:     .hex 57 03         ; $c39c: 57 03     Invalid Opcode - SRE $03,x
            .hex d4 57         ; $c39e: d4 57     Invalid Opcode - NOP $57,x
            .hex 03 14         ; $c3a0: 03 14     Invalid Opcode - SLO ($14,x)
            .hex a7 13         ; $c3a2: a7 13     Invalid Opcode - LAX $13
            .hex 5c a7         ; $c3a4: 5c a7     Suspected data
__c3a6:     .hex 13 94         ; $c3a6: 13 94     Invalid Opcode - SLO ($94),y
            .hex a7 13         ; $c3a8: a7 13     Invalid Opcode - LAX $13
            .hex dc a7 13      ; $c3aa: dc a7 13  Invalid Opcode - NOP $13a7,x
            BIT $2f            ; $c3ad: 24 2f     
__c3af:     .hex 03 44         ; $c3af: 03 44     Invalid Opcode - SLO ($44,x)
            .hex 2f            ; $c3b1: 2f        Suspected data
__c3b2:     .hex 03 ac         ; $c3b2: 03 ac     Invalid Opcode - SLO ($ac,x)
            .hex 2f 03 cc      ; $c3b4: 2f 03 cc  Invalid Opcode - RLA __cc03
            .hex 2f 03 1c      ; $c3b7: 2f 03 1c  Invalid Opcode - RLA $1c03
            .hex 7f 13 7c      ; $c3ba: 7f 13 7c  Invalid Opcode - RRA $7c13,x
            .hex 7f 13 d4      ; $c3bd: 7f 13 d4  Invalid Opcode - RRA __d413,x
            .hex 7f 13 24      ; $c3c0: 7f 13 24  Invalid Opcode - RRA $2413,x
            .hex 57 13         ; $c3c3: 57 13     Invalid Opcode - SRE $13,x
            .hex 44 57         ; $c3c5: 44 57     Invalid Opcode - NOP $57
            .hex 13 ac         ; $c3c7: 13 ac     Invalid Opcode - SLO ($ac),y
            .hex 57 13         ; $c3c9: 57 13     Invalid Opcode - SRE $13,x
            CPY $1357          ; $c3cb: cc 57 13  
__c3ce:     PHP                ; $c3ce: 08        
__c3cf:     .hex c7 10         ; $c3cf: c7 10     Invalid Opcode - DCP $10
            .hex a7 18         ; $c3d1: a7 18     Invalid Opcode - LAX $18
            .hex 7f 20 57      ; $c3d3: 7f 20 57  Invalid Opcode - RRA $5720,x
            INX                ; $c3d6: e8        
            .hex c7 e0         ; $c3d7: c7 e0     Invalid Opcode - DCP $e0
            .hex a7 d8         ; $c3d9: a7 d8     Invalid Opcode - LAX $d8
__c3db:     .hex 7f d0 57      ; $c3db: 7f d0 57  Invalid Opcode - RRA $57d0,x
__c3de:     .hex 34            ; $c3de: 34        Suspected data
__c3df:     LDY $bc44          ; $c3df: ac 44 bc  
__c3e2:     ORA $03            ; $c3e2: 05 03     
__c3e4:     .hex 0d            ; $c3e4: 0d        Suspected data
__c3e5:     .hex 0b            ; $c3e5: 0b        Suspected data
__c3e6:     .hex d4 0c         ; $c3e6: d4 0c     Invalid Opcode - NOP $0c,x
__c3e8:     CPX $0c            ; $c3e8: e4 0c     
__c3ea:     .hex 5d 4b         ; $c3ea: 5d 4b     Suspected data
__c3ec:     .hex cd c3         ; $c3ec: cd c3     Suspected data
__c3ee:     .hex 5d 43         ; $c3ee: 5d 43     Suspected data
__c3f0:     SBC $c3            ; $c3f0: e5 c3     
__c3f2:     .hex ed 03         ; $c3f2: ed 03     Suspected data
__c3f4:     .hex 24            ; $c3f4: 24        Suspected data
__c3f5:     EOR #$77           ; $c3f5: 49 77     
            .hex 77            ; $c3f7: 77        Suspected data
__c3f8:     .hex 77            ; $c3f8: 77        Suspected data
__c3f9:     .hex 77 ff         ; $c3f9: 77 ff     Invalid Opcode - RRA $ff,x
            .hex ff            ; $c3fb: ff        Suspected data
__c3fc:     .hex 0b 0c         ; $c3fc: 0b 0c     Invalid Opcode - ANC #$0c
            ORA $1615          ; $c3fe: 0d 15 16  
            .hex 17 18         ; $c401: 17 18     Invalid Opcode - SLO $18,x
            ORA $1e1a,y        ; $c403: 19 1a 1e  
            .hex 1f            ; $c406: 1f        Suspected data
__c407:     .hex ff ff ff      ; $c407: ff ff ff  Invalid Opcode - ISC $ffff,x
            ORA ($01,x)        ; $c40a: 01 01     
            ORA ($01,x)        ; $c40c: 01 01     
            .hex ff ff 01      ; $c40e: ff ff 01  Invalid Opcode - ISC $01ff,x
            .hex 01            ; $c411: 01        Suspected data
__c412:     CPX $e3            ; $c412: e4 e3     
            .hex e2 d8         ; $c414: e2 d8     Invalid Opcode - NOP #$d8
            .hex d7 d6         ; $c416: d7 d6     Invalid Opcode - DCP $d6,x
            CMP $d4,x          ; $c418: d5 d4     
            .hex d3 d0         ; $c41a: d3 d0     Invalid Opcode - DCP ($d0),y
            .hex cf            ; $c41c: cf        Suspected data
__c41d:     PHA                ; $c41d: 48        
            STY $c0            ; $c41e: 84 c0     
__c420:     BVC __c3af         ; $c420: 50 8d     
            .hex c7            ; $c422: c7        Suspected data
__c423:     .hex 20            ; $c423: 20        Suspected data
__c424:     CPY #$78           ; $c424: c0 78     
            RTS                ; $c426: 60        

;-------------------------------------------------------------------------------
            PLP                ; $c427: 28        
            .hex 44 6b         ; $c428: 44 6b     Invalid Opcode - NOP $6b
            .hex 20            ; $c42a: 20        Suspected data
__c42b:     .hex 33            ; $c42b: 33        Suspected data
__c42c:     CPY $37            ; $c42c: c4 37     
            CPY $3b            ; $c42e: c4 3b     
            CPY $3f            ; $c430: c4 3f     
            CPY $00            ; $c432: c4 00     
            BRK                ; $c434: 00        
            BPL __c43f         ; $c435: 10 08     
            BRK                ; $c437: 00        
            BRK                ; $c438: 00        
            BPL __c443         ; $c439: 10 08     
            BRK                ; $c43b: 00        
            BRK                ; $c43c: 00        
            RTS                ; $c43d: 60        

;-------------------------------------------------------------------------------
            .hex 10            ; $c43e: 10        Suspected data
__c43f:     BRK                ; $c43f: 00        
            BRK                ; $c440: 00        
            ROL                ; $c441: 2a        
            .hex 20            ; $c442: 20        Suspected data
__c443:     BCS __c3e5         ; $c443: b0 a0     
            SEI                ; $c445: 78        
            PLA                ; $c446: 68        
            PLA                ; $c447: 68        
__c448:     DEY                ; $c448: 88        
            DEY                ; $c449: 88        
            DEY                ; $c44a: 88        
            DEY                ; $c44b: 88        
            DEY                ; $c44c: 88        
__c44d:     PHA                ; $c44d: 48        
            SEC                ; $c44e: 38        
            PLP                ; $c44f: 28        
            CLC                ; $c450: 18        
            CLC                ; $c451: 18        
            .hex bb bb 5e      ; $c452: bb bb 5e  Invalid Opcode - LAS $5ebb,y
            .hex 2f 13         ; $c455: 2f 13     Suspected data
__c457:     DEY                ; $c457: 88        
            SEI                ; $c458: 78        
            .hex 64 56         ; $c459: 64 56     Invalid Opcode - NOP $56
            .hex 49            ; $c45b: 49        Suspected data
__c45c:     DEY                ; $c45c: 88        
            DEY                ; $c45d: 88        
            BIT $55            ; $c45e: 24 55     
            .hex 55            ; $c460: 55        Suspected data
__c461:     DEY                ; $c461: 88        
            DEY                ; $c462: 88        
            EOR #$55           ; $c463: 49 55     
            .hex 55            ; $c465: 55        Suspected data
__c466:     RTI                ; $c466: 40        

;-------------------------------------------------------------------------------
            JSR $0810          ; $c467: 20 10 08  
            .hex 01            ; $c46a: 01        Suspected data
__c46b:     .hex 8c            ; $c46b: 8c        Suspected data
__c46c:     CPY #$0c           ; $c46c: c0 0c     
            .hex c2 0c         ; $c46e: c2 0c     Invalid Opcode - NOP #$0c
            .hex c2 f0         ; $c470: c2 f0     Invalid Opcode - NOP #$f0
            .hex c2            ; $c472: c2        Suspected data
__c473:     .hex c3            ; $c473: c3        Suspected data
__c474:     CPY #$0c           ; $c474: c0 0c     
            .hex c2 52         ; $c476: c2 52     Invalid Opcode - NOP #$52
            .hex c2 06         ; $c478: c2 06     Invalid Opcode - NOP #$06
            .hex c3            ; $c47a: c3        Suspected data
__c47b:     .hex e3            ; $c47b: e3        Suspected data
__c47c:     CPY #$0c           ; $c47c: c0 0c     
            .hex c2 6e         ; $c47e: c2 6e     Invalid Opcode - NOP #$6e
            .hex c2 16         ; $c480: c2 16     Invalid Opcode - NOP #$16
            .hex c3            ; $c482: c3        Suspected data
__c483:     .hex 0b            ; $c483: 0b        Suspected data
__c484:     CMP ($0c,x)        ; $c484: c1 0c     
            .hex c2 8d         ; $c486: c2 8d     Invalid Opcode - NOP #$8d
            .hex c2 41         ; $c488: c2 41     Invalid Opcode - NOP #$41
            .hex c3            ; $c48a: c3        Suspected data
__c48b:     .hex 27            ; $c48b: 27        Suspected data
__c48c:     CMP ($0c,x)        ; $c48c: c1 0c     
            .hex c2 a5         ; $c48e: c2 a5     Invalid Opcode - NOP #$a5
            .hex c2 49         ; $c490: c2 49     Invalid Opcode - NOP #$49
            .hex c3            ; $c492: c3        Suspected data
__c493:     .hex bc            ; $c493: bc        Suspected data
__c494:     CPY #$0c           ; $c494: c0 0c     
            .hex c2 4c         ; $c496: c2 4c     Invalid Opcode - NOP #$4c
            .hex c2 00         ; $c498: c2 00     Invalid Opcode - NOP #$00
            .hex c3            ; $c49a: c3        Suspected data
__c49b:     .hex 0c            ; $c49b: 0c        Suspected data
__c49c:     .hex c2 d2         ; $c49c: c2 d2     Invalid Opcode - NOP #$d2
            .hex c2 74         ; $c49e: c2 74     Invalid Opcode - NOP #$74
            .hex c3            ; $c4a0: c3        Suspected data
__c4a1:     .hex 0c            ; $c4a1: 0c        Suspected data
__c4a2:     .hex c2 d8         ; $c4a2: c2 d8     Invalid Opcode - NOP #$d8
            .hex c2 7a         ; $c4a4: c2 7a     Invalid Opcode - NOP #$7a
            .hex c3            ; $c4a6: c3        Suspected data
__c4a7:     .hex 5b            ; $c4a7: 5b        Suspected data
__c4a8:     SBC $d9,x          ; $c4a8: f5 d9     
            SED                ; $c4aa: f8        
            CMP $1cf7          ; $c4ab: cd f7 1c  
            .hex f7 d9         ; $c4ae: f7 d9     Invalid Opcode - ISC $d9,x
            SED                ; $c4b0: f8        
            .hex 1b fa 00      ; $c4b1: 1b fa 00  Invalid Opcode - SLO $00fa,y
            BRK                ; $c4b4: 00        
            ORA ($06,x)        ; $c4b5: 01 06     
            INX                ; $c4b7: e8        
            .hex 04 50         ; $c4b8: 04 50     Invalid Opcode - NOP $50
            CLC                ; $c4ba: 18        
            CMP $12,x          ; $c4bb: d5 12     
            INX                ; $c4bd: e8        
__c4be:     BRK                ; $c4be: 00        
            BVC __c4e1         ; $c4bf: 50 20     
            .hex db 22 f0      ; $c4c1: db 22 f0  Invalid Opcode - DCP __f022,y
            BRK                ; $c4c4: 00        
            BRK                ; $c4c5: 00        
            BRK                ; $c4c6: 00        
            .hex 03            ; $c4c7: 03        Suspected data
__c4c8:     BIT $0430          ; $c4c8: 2c 30 04  
            JSR __f67f         ; $c4cb: 20 7f f6  
            AND ($d0,x)        ; $c4ce: 21 d0     
            BRK                ; $c4d0: 00        
__c4d1:     JSR __f646         ; $c4d1: 20 46 f6  
            AND ($d8,x)        ; $c4d4: 21 d8     
            BRK                ; $c4d6: 00        
            BRK                ; $c4d7: 00        
            BRK                ; $c4d8: 00        
            ORA ($04,x)        ; $c4d9: 01 04     
            CPY #$04           ; $c4db: c0 04     
            BRK                ; $c4dd: 00        
            BRK                ; $c4de: 00        
            BRK                ; $c4df: 00        
            .hex 04            ; $c4e0: 04        Suspected data
__c4e1:     BRK                ; $c4e1: 00        
            .hex 04 30         ; $c4e2: 04 30     Invalid Opcode - NOP $30
            .hex c7 04         ; $c4e4: c7 04     Invalid Opcode - DCP $04
            .hex 22            ; $c4e6: 22        Invalid Opcode - KIL 
            BRK                ; $c4e7: 00        
            BRK                ; $c4e8: 00        
            BRK                ; $c4e9: 00        
            BRK                ; $c4ea: 00        
            .hex 02            ; $c4eb: 02        Invalid Opcode - KIL 
            PHP                ; $c4ec: 08        
            BPL __c4f3         ; $c4ed: 10 04     
            BRK                ; $c4ef: 00        
            BRK                ; $c4f0: 00        
            .hex 02            ; $c4f1: 02        Invalid Opcode - KIL 
            .hex 02            ; $c4f2: 02        Invalid Opcode - KIL 
__c4f3:     CPX #$04           ; $c4f3: e0 04     
            .hex fe 00 00      ; $c4f5: fe 00 00  Bad Addr Mode - INC $0000,x
            ORA ($06,x)        ; $c4f8: 01 06     
            INX                ; $c4fa: e8        
            .hex 04 50         ; $c4fb: 04 50     Invalid Opcode - NOP $50
            CLC                ; $c4fd: 18        
            CMP $12,x          ; $c4fe: d5 12     
            INX                ; $c500: e8        
            BRK                ; $c501: 00        
            BVC __c524         ; $c502: 50 20     
            .hex db            ; $c504: db        Suspected data
__c505:     .hex 22            ; $c505: 22        Invalid Opcode - KIL 
            BEQ __c508         ; $c506: f0 00     
__c508:     BRK                ; $c508: 00        
            BRK                ; $c509: 00        
            .hex 03 0c         ; $c50a: 03 0c     Invalid Opcode - SLO ($0c,x)
            BMI __c512         ; $c50c: 30 04     
            BMI __c588         ; $c50e: 30 78     
            LDY #$12           ; $c510: a0 12     
__c512:     BMI __c514         ; $c512: 30 00     
__c514:     BMI __c4be         ; $c514: 30 a8     
            LDY #$12           ; $c516: a0 12     
            SEC                ; $c518: 38        
            BRK                ; $c519: 00        
            BMI __c565         ; $c51a: 30 49     
            LDY #$12           ; $c51c: a0 12     
            RTI                ; $c51e: 40        

;-------------------------------------------------------------------------------
            BRK                ; $c51f: 00        
            BVS __c592         ; $c520: 70 70     
            LDY #$12           ; $c522: a0 12     
__c524:     PHA                ; $c524: 48        
            BRK                ; $c525: 00        
            BVS __c4c8         ; $c526: 70 a0     
            LDY #$12           ; $c528: a0 12     
            BVC __c52c         ; $c52a: 50 00     
__c52c:     BVS __c505         ; $c52c: 70 d7     
            LDY #$12           ; $c52e: a0 12     
            CLI                ; $c530: 58        
            BRK                ; $c531: 00        
            BRK                ; $c532: 00        
            BRK                ; $c533: 00        
            .hex 23 02         ; $c534: 23 02     Invalid Opcode - RLA ($02,x)
            RTI                ; $c536: 40        

;-------------------------------------------------------------------------------
            .hex 04 00         ; $c537: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c539: 00        
            .hex 23 02         ; $c53a: 23 02     Invalid Opcode - RLA ($02,x)
            CLI                ; $c53c: 58        
            .hex 04 00         ; $c53d: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c53f: 00        
            BRK                ; $c540: 00        
            .hex 04 00         ; $c541: 04 00     Invalid Opcode - NOP $00
            .hex 04 10         ; $c543: 04 10     Invalid Opcode - NOP $10
            .hex b7 04         ; $c545: b7 04     Invalid Opcode - LAX $04,y
            .hex 22            ; $c547: 22        Invalid Opcode - KIL 
            BRK                ; $c548: 00        
            BRK                ; $c549: 00        
            BRK                ; $c54a: 00        
            BRK                ; $c54b: 00        
            .hex 02            ; $c54c: 02        Invalid Opcode - KIL 
            PHP                ; $c54d: 08        
            BPL __c554         ; $c54e: 10 04     
            JMP $989f          ; $c550: 4c 9f 98  

;-------------------------------------------------------------------------------
            .hex 22            ; $c553: 22        Invalid Opcode - KIL 
__c554:     BPL __c556         ; $c554: 10 00     
__c556:     CPY $9867          ; $c556: cc 67 98  
            .hex 22            ; $c559: 22        Invalid Opcode - KIL 
            JSR $0000          ; $c55a: 20 00 00  
            BRK                ; $c55d: 00        
            .hex 03 0c         ; $c55e: 03 0c     Invalid Opcode - SLO ($0c,x)
            RTS                ; $c560: 60        

;-------------------------------------------------------------------------------
            .hex 04 00         ; $c561: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c563: 00        
            .hex 01            ; $c564: 01        Suspected data
__c565:     ASL $90,x          ; $c565: 16 90     
            .hex 04 fe         ; $c567: 04 fe     Invalid Opcode - NOP $fe
            BRK                ; $c569: 00        
            BRK                ; $c56a: 00        
            ORA ($06,x)        ; $c56b: 01 06     
            INX                ; $c56d: e8        
            .hex 04 50         ; $c56e: 04 50     Invalid Opcode - NOP $50
            CLC                ; $c570: 18        
            CMP $12,x          ; $c571: d5 12     
            INX                ; $c573: e8        
            BRK                ; $c574: 00        
            BVC __c597         ; $c575: 50 20     
            .hex db 22 f0      ; $c577: db 22 f0  Invalid Opcode - DCP __f022,y
            BRK                ; $c57a: 00        
            BRK                ; $c57b: 00        
            BRK                ; $c57c: 00        
            .hex 03 04         ; $c57d: 03 04     Invalid Opcode - SLO ($04,x)
            BNE __c585         ; $c57f: d0 04     
            .hex 14 6e         ; $c581: 14 6e     Invalid Opcode - NOP $6e,x
__c583:     .hex f6            ; $c583: f6        Suspected data
__c584:     .hex 21            ; $c584: 21        Suspected data
__c585:     BNE __c587         ; $c585: d0 00     
__c587:     .hex 7c            ; $c587: 7c        Suspected data
__c588:     LSR $f6            ; $c588: 46 f6     
            AND ($d8,x)        ; $c58a: 21 d8     
__c58c:     BRK                ; $c58c: 00        
            BRK                ; $c58d: 00        
            BRK                ; $c58e: 00        
__c58f:     ORA ($20,x)        ; $c58f: 01 20     
__c591:     .hex 50            ; $c591: 50        Suspected data
__c592:     .hex 04 00         ; $c592: 04 00     Invalid Opcode - NOP $00
            BRK                ; $c594: 00        
            BRK                ; $c595: 00        
__c596:     .hex 04            ; $c596: 04        Suspected data
__c597:     BRK                ; $c597: 00        
            .hex 04 38         ; $c598: 04 38     Invalid Opcode - NOP $38
            .hex c7 04         ; $c59a: c7 04     Invalid Opcode - DCP $04
            .hex 22            ; $c59c: 22        Invalid Opcode - KIL 
            BRK                ; $c59d: 00        
            BRK                ; $c59e: 00        
            BRK                ; $c59f: 00        
            BRK                ; $c5a0: 00        
            .hex 02            ; $c5a1: 02        Invalid Opcode - KIL 
            BPL __c5b4         ; $c5a2: 10 10     
            .hex 04 fe         ; $c5a4: 04 fe     Invalid Opcode - NOP $fe
__c5a6:     .hex b3            ; $c5a6: b3        Suspected data
__c5a7:     .hex c4            ; $c5a7: c4        Suspected data
__c5a8:     INC $c4,x          ; $c5a8: f6 c4     
            INC $c4,x          ; $c5aa: f6 c4     
__c5ac:     ADC #$c5           ; $c5ac: 69 c5     
__c5ae:     .hex 7f 7f 7f      ; $c5ae: 7f 7f 7f  Invalid Opcode - RRA $7f7f,x
            BRK                ; $c5b1: 00        
            .hex 5f 3f         ; $c5b2: 5f 3f     Suspected data
__c5b4:     BRK                ; $c5b4: 00        
            .hex 2f 7f 7f      ; $c5b5: 2f 7f 7f  Invalid Opcode - RLA $7f7f
            BRK                ; $c5b8: 00        
            LDA #$a9           ; $c5b9: a9 a9     
            STA ($81,x)        ; $c5bb: 81 81     
            EOR $3159,y        ; $c5bd: 59 59 31  
            AND ($00),y        ; $c5c0: 31 00     
__c5c2:     BMI __c610         ; $c5c2: 30 4c     
            CMP $00,x          ; $c5c4: d5 00     
            BPL __c5a8         ; $c5c6: 10 e0     
            BRK                ; $c5c8: 00        
            BIT $50            ; $c5c9: 24 50     
            CPY #$00           ; $c5cb: c0 00     
            .hex 3b b3 3b      ; $c5cd: 3b b3 3b  Invalid Opcode - RLA $3bb3,y
            .hex b3 3b         ; $c5d0: b3 3b     Invalid Opcode - LAX ($3b),y
            .hex b3 38         ; $c5d2: b3 38     Invalid Opcode - LAX ($38),y
            .hex b3 00         ; $c5d4: b3 00     Invalid Opcode - LAX ($00),y
__c5d6:     .hex 22            ; $c5d6: 22        Invalid Opcode - KIL 
__c5d7:     .hex 22            ; $c5d7: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5d8: 22        Invalid Opcode - KIL 
            BRK                ; $c5d9: 00        
            AND ($21,x)        ; $c5da: 21 21     
            BRK                ; $c5dc: 00        
            .hex 20            ; $c5dd: 20        Suspected data
__c5de:     .hex 22            ; $c5de: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5df: 22        Invalid Opcode - KIL 
            BRK                ; $c5e0: 00        
            .hex 22            ; $c5e1: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5e2: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5e3: 22        Invalid Opcode - KIL 
            .hex 22            ; $c5e4: 22        Invalid Opcode - KIL 
            AND ($21,x)        ; $c5e5: 21 21     
            AND ($21,x)        ; $c5e7: 21 21     
__c5e9:     ASL $0a            ; $c5e9: 06 0a     
            .hex 1b 00 82      ; $c5eb: 1b 00 82  Invalid Opcode - SLO $8200,y
            .hex 1c 00 c5      ; $c5ee: 1c 00 c5  Invalid Opcode - NOP __c500,x
            ASL                ; $c5f1: 0a        
            CLC                ; $c5f2: 18        
            BRK                ; $c5f3: 00        
            INX                ; $c5f4: e8        
            .hex f7 48         ; $c5f5: f7 48     Invalid Opcode - ISC $48,x
            .hex 57 a8         ; $c5f7: 57 a8     Invalid Opcode - SRE $a8,x
            .hex b7            ; $c5f9: b7        Suspected data
__c5fa:     PHP                ; $c5fa: 08        
            .hex 17 00         ; $c5fb: 17 00     Invalid Opcode - SLO $00,x
            .hex 04 07         ; $c5fd: 04 07     Invalid Opcode - NOP $07
__c5ff:     .hex 0b            ; $c5ff: 0b        Suspected data
__c600:     ORA ($03,x)        ; $c600: 01 03     
            ORA $08            ; $c602: 05 08     
__c604:     BNE __c5d7         ; $c604: d0 d1     
            .hex d2            ; $c606: d2        Invalid Opcode - KIL 
            .hex d3            ; $c607: d3        Suspected data
__c608:     STY $8d            ; $c608: 84 8d     
            STY $8d            ; $c60a: 84 8d     
            LSR $76            ; $c60c: 46 76     
            .hex 77 78         ; $c60e: 77 78     Invalid Opcode - RRA $78,x
__c610:     ADC $7b7a,y        ; $c610: 79 7a 7b  
            .hex 7c 7d 7e      ; $c613: 7c 7d 7e  Invalid Opcode - NOP $7e7d,x
            .hex 7f 80 81      ; $c616: 7f 80 81  Invalid Opcode - RRA $8180,x
            .hex 82 83         ; $c619: 82 83     Invalid Opcode - NOP #$83
            STY $85            ; $c61b: 84 85     
            BIT $24            ; $c61d: 24 24     
            STX $87            ; $c61f: 86 87     
            BIT $24            ; $c621: 24 24     
            BIT $88            ; $c623: 24 88     
            LSR $24            ; $c625: 46 24     
            .hex 9c 9d 9e      ; $c627: 9c 9d 9e  Invalid Opcode - SHY $9e9d,x
            .hex 9f a0 a1      ; $c62a: 9f a0 a1  Invalid Opcode - AHX $a1a0,y
            LDX #$a3           ; $c62d: a2 a3     
            LDY $a5            ; $c62f: a4 a5     
            LDX $a7            ; $c631: a6 a7     
            TAY                ; $c633: a8        
            LDA #$aa           ; $c634: a9 aa     
            .hex ab ac         ; $c636: ab ac     Invalid Opcode - LAX #$ac
            LDA $24ae          ; $c638: ad ae 24  
            .hex af b0 b1      ; $c63b: af b0 b1  Invalid Opcode - LAX $b1b0
            LSR $24            ; $c63e: 46 24     
            BIT $24            ; $c640: 24 24     
            .hex 89 24         ; $c642: 89 24     Invalid Opcode - NOP #$24
            BIT $8a            ; $c644: 24 8a     
            .hex 8b 8c         ; $c646: 8b 8c     Invalid Opcode - XAA #$8c
            STA $8f8e          ; $c648: 8d 8e 8f  
            BCC __c5de         ; $c64b: 90 91     
            .hex 92            ; $c64d: 92        Invalid Opcode - KIL 
            .hex 93 94         ; $c64e: 93 94     Invalid Opcode - AHX ($94),y
            STA $96,x          ; $c650: 95 96     
            .hex 97 98         ; $c652: 97 98     Invalid Opcode - SAX $98,y
            STA $9b9a,y        ; $c654: 99 9a 9b  
            LSR $24            ; $c657: 46 24     
            .hex b2            ; $c659: b2        Invalid Opcode - KIL 
            PLA                ; $c65a: 68        
            .hex 9e b5 b6      ; $c65b: 9e b5 b6  Invalid Opcode - SHX $b6b5,y
            JMP ($a3c7)        ; $c65e: 6c c7 a3  

;-------------------------------------------------------------------------------
            LDY $69            ; $c661: a4 69     
            LDX $a7            ; $c663: a6 a7     
            TAY                ; $c665: a8        
            .hex 6b aa         ; $c666: 6b aa     Invalid Opcode - ARR #$aa
            CMP #$ca           ; $c668: c9 ca     
            ADC $24bf          ; $c66a: 6d bf 24  
            CMP $b16a          ; $c66d: cd 6a b1  
            LSR $c2            ; $c670: 46 c2     
            .hex c3 24         ; $c672: c3 24     Invalid Opcode - DCP ($24,x)
            .hex 9e c4 c5      ; $c674: 9e c4 c5  Invalid Opcode - SHX __c5c4,y
            DEC $c7            ; $c677: c6 c7     
            .hex a3 b9         ; $c679: a3 b9     Invalid Opcode - LAX ($b9,x)
            LDA $a6            ; $c67b: a5 a6     
            .hex a7 bb         ; $c67d: a7 bb     Invalid Opcode - LAX $bb
            .hex 6b c8         ; $c67f: 6b c8     Invalid Opcode - ARR #$c8
            CMP #$ca           ; $c681: c9 ca     
            .hex cb cc         ; $c683: cb cc     Invalid Opcode - AXS #$cc
            BIT $cd            ; $c685: 24 cd     
            DEC $46cf          ; $c687: ce cf 46  
            BIT $b2            ; $c68a: 24 b2     
            .hex b3 b4         ; $c68c: b3 b4     Invalid Opcode - LAX ($b4),y
            LDA $b6,x          ; $c68e: b5 b6     
            .hex b7 b8         ; $c690: b7 b8     Invalid Opcode - LAX $b8,y
            .hex a3 b9         ; $c692: a3 b9     Invalid Opcode - LAX ($b9,x)
            ADC #$ba           ; $c694: 69 ba     
            .hex a7 bb         ; $c696: a7 bb     Invalid Opcode - LAX $bb
            LDA #$aa           ; $c698: a9 aa     
            LDY $bebd,x        ; $c69a: bc bd be  
            .hex bf c0 c1      ; $c69d: bf c0 c1  Invalid Opcode - LAX __c1c0,y
            BIT $b1            ; $c6a0: 24 b1     
            .hex 13 2c         ; $c6a2: 13 2c     Invalid Opcode - SLO ($2c),y
            ASL $13,x          ; $c6a4: 16 13     
            .hex 13 16         ; $c6a6: 13 16     Invalid Opcode - SLO ($16),y
            BMI __c6e1         ; $c6a8: 30 37     
__c6aa:     .hex 23 db         ; $c6aa: 23 db     Invalid Opcode - RLA ($db,x)
            .hex 42            ; $c6ac: 42        Invalid Opcode - KIL 
            LDY #$21           ; $c6ad: a0 21     
            DEX                ; $c6af: ca        
            JMP $2124          ; $c6b0: 4c 24 21  

;-------------------------------------------------------------------------------
            NOP                ; $c6b3: ea        
            .hex 0c 24 24      ; $c6b4: 0c 24 24  Invalid Opcode - NOP $2424
            ORA $0a15,y        ; $c6b7: 19 15 0a  
            .hex 22            ; $c6ba: 22        Invalid Opcode - KIL 
            ASL $241b          ; $c6bb: 0e 1b 24  
            ROR $24            ; $c6be: 66 24     
            BIT $00            ; $c6c0: 24 00     
__c6c2:     .hex 23 e2         ; $c6c2: 23 e2     Invalid Opcode - RLA ($e2,x)
            .hex 04 08         ; $c6c4: 04 08     Invalid Opcode - NOP $08
            ASL                ; $c6c6: 0a        
            ASL                ; $c6c7: 0a        
            .hex 02            ; $c6c8: 02        Invalid Opcode - KIL 
            .hex 22            ; $c6c9: 22        Invalid Opcode - KIL 
            ASL                ; $c6ca: 0a        
            JMP $2224          ; $c6cb: 4c 24 22  

;-------------------------------------------------------------------------------
            ROL                ; $c6ce: 2a        
            .hex 0c 24 10      ; $c6cf: 0c 24 10  Invalid Opcode - NOP $1024
            ASL                ; $c6d2: 0a        
            ASL $0e,x          ; $c6d3: 16 0e     
            BIT $24            ; $c6d5: 24 24     
            CLC                ; $c6d7: 18        
            .hex 1f 0e 1b      ; $c6d8: 1f 0e 1b  Invalid Opcode - SLO $1b0e,x
            BIT $22            ; $c6db: 24 22     
            LSR                ; $c6dd: 4a        
            JMP $0024          ; $c6de: 4c 24 00  

;-------------------------------------------------------------------------------
__c6e1:     .hex 12            ; $c6e1: 12        Invalid Opcode - KIL 
            BIT $24            ; $c6e2: 24 24     
            JSR $5b63          ; $c6e4: 20 63 5b  
            BIT $20            ; $c6e7: 24 20     
            STY $4a,x          ; $c6e9: 94 4a     
            BIT $20            ; $c6eb: 24 20     
            LDY $4a,x          ; $c6ed: b4 4a     
            BIT $00            ; $c6ef: 24 00     
            AND ($09,x)        ; $c6f1: 21 09     
            LSR $2124          ; $c6f3: 4e 24 21  
            LDA #$4e           ; $c6f6: a9 4e     
            BIT $22            ; $c6f8: 24 22     
            EOR #$4e           ; $c6fa: 49 4e     
            BIT $22            ; $c6fc: 24 22     
            SBC #$4e           ; $c6fe: e9 4e     
            BIT $3f            ; $c700: 24 3f     
            ORA $3003,x        ; $c702: 1d 03 30  
            ROL $06,x          ; $c705: 36 06     
            BRK                ; $c707: 00        
            JSR $468d          ; $c708: 20 8d 46  
            BIT $20            ; $c70b: 24 20     
            LDA $2446          ; $c70d: ad 46 24  
            JSR $46cd          ; $c710: 20 cd 46  
            BIT $20            ; $c713: 24 20     
            SBC $2446          ; $c715: ed 46 24  
            BRK                ; $c718: 00        
            .hex 12            ; $c719: 12        Invalid Opcode - KIL 
            TAX                ; $c71a: aa        
            TAX                ; $c71b: aa        
            LSR $24            ; $c71c: 46 24     
            BIT $dc            ; $c71e: 24 dc     
            CMP __d5d4,x       ; $c720: dd d4 d5  
            DEC __d6df,x       ; $c723: de df d6  
            .hex d7 e0         ; $c726: d7 e0     Invalid Opcode - DCP $e0,x
            SBC ($d8,x)        ; $c728: e1 d8     
__c72a:     .hex d9 e2         ; $c72a: d9 e2     Suspected data
__c72c:     .hex e3 da         ; $c72c: e3 da     Invalid Opcode - ISC ($da,x)
            .hex db e4 e5      ; $c72e: db e4 e5  Invalid Opcode - DCP __e5e4,y
            BIT $24            ; $c731: 24 24     
            INC $e7            ; $c733: e6 e7     
            LSR $e8            ; $c735: 46 e8     
            SBC #$ea           ; $c737: e9 ea     
            .hex eb ec         ; $c739: eb ec     Invalid Opcode - SBC #$ec
            SBC __efee         ; $c73b: ed ee ef  
            BIT $f0            ; $c73e: 24 f0     
            SBC ($f2),y        ; $c740: f1 f2     
            BIT $f3            ; $c742: 24 f3     
            .hex f4 f5         ; $c744: f4 f5     Invalid Opcode - NOP $f5,x
            INC $f7,x          ; $c746: f6 f7     
            SED                ; $c748: f8        
            SBC __fbfa,y       ; $c749: f9 fa fb  
            .hex fc fd 21      ; $c74c: fc fd 21  Invalid Opcode - NOP $21fd,x
            PHP                ; $c74f: 08        
__c750:     BVC __c7b4         ; $c750: 50 62     
            BRK                ; $c752: 00        
            .hex 23 09         ; $c753: 23 09     Invalid Opcode - RLA ($09,x)
            LSR $2362          ; $c755: 4e 62 23  
            AND #$4e           ; $c758: 29 4e     
            .hex 62            ; $c75a: 62        Invalid Opcode - KIL 
            .hex 23 49         ; $c75b: 23 49     Invalid Opcode - RLA ($49,x)
            .hex 4e 62 00      ; $c75d: 4e 62 00  Bad Addr Mode - LSR $0062
            JSR $42c5          ; $c760: 20 c5 42  
            BIT $20            ; $c763: 24 20     
            DEX                ; $c765: ca        
            .hex 42            ; $c766: 42        Invalid Opcode - KIL 
            BIT $20            ; $c767: 24 20     
            NOP                ; $c769: ea        
            .hex 42            ; $c76a: 42        Invalid Opcode - KIL 
            BIT $20            ; $c76b: 24 20     
            SBC $42            ; $c76d: e5 42     
            BIT $22            ; $c76f: 24 22     
            ASL                ; $c771: 0a        
            .hex 42            ; $c772: 42        Invalid Opcode - KIL 
            BIT $22            ; $c773: 24 22     
            ROL                ; $c775: 2a        
            .hex 42            ; $c776: 42        Invalid Opcode - KIL 
            BIT $22            ; $c777: 24 22     
            CLC                ; $c779: 18        
            .hex 42            ; $c77a: 42        Invalid Opcode - KIL 
            BIT $00            ; $c77b: 24 00     
            .hex 22            ; $c77d: 22        Invalid Opcode - KIL 
            SEC                ; $c77e: 38        
            .hex 42            ; $c77f: 42        Invalid Opcode - KIL 
            BIT $21            ; $c780: 24 21     
            AND #$c4           ; $c782: 29 c4     
            BIT $21            ; $c784: 24 21     
            ROL $c4,x          ; $c786: 36 c4     
            BIT $21            ; $c788: 24 21     
            BNE __c750         ; $c78a: d0 c4     
            BIT $22            ; $c78c: 24 22     
            JMP ($24c4)        ; $c78e: 6c c4 24  

;-------------------------------------------------------------------------------
            .hex 22            ; $c791: 22        Invalid Opcode - KIL 
            .hex 73 c4         ; $c792: 73 c4     Invalid Opcode - RRA ($c4),y
            BIT $23            ; $c794: 24 23     
            .hex 0f c3 24      ; $c796: 0f c3 24  Invalid Opcode - SLO $24c3
            BRK                ; $c799: 00        
__c79a:     .hex ff 01         ; $c79a: ff 01     Suspected data
__c79c:     ORA ($ff,x)        ; $c79c: 01 ff     

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      SEI                ; $c79e: 78        
            CLD                ; $c79f: d8        
            LDA #$10           ; $c7a0: a9 10     
            STA $2000          ; $c7a2: 8d 00 20  
            LDX #$ff           ; $c7a5: a2 ff     
            TXS                ; $c7a7: 9a        
__c7a8:     LDA $2002          ; $c7a8: ad 02 20  
            AND #$80           ; $c7ab: 29 80     
            BEQ __c7a8         ; $c7ad: f0 f9     
            LDY #$07           ; $c7af: a0 07     
            STY $01            ; $c7b1: 84 01     
            .hex a0            ; $c7b3: a0        Suspected data
__c7b4:     BRK                ; $c7b4: 00        
            STY $00            ; $c7b5: 84 00     
            LDA #$00           ; $c7b7: a9 00     
__c7b9:     STA ($00),y        ; $c7b9: 91 00     
            DEY                ; $c7bb: 88        
            BNE __c7b9         ; $c7bc: d0 fb     
            DEC $01            ; $c7be: c6 01     
            BPL __c7b9         ; $c7c0: 10 f7     
            JSR __c7e7         ; $c7c2: 20 e7 c7  
            LDA #$7f           ; $c7c5: a9 7f     
            STA $0511          ; $c7c7: 8d 11 05  
            LDA #$18           ; $c7ca: a9 18     
            STA $51            ; $c7cc: 85 51     
            LDA #$01           ; $c7ce: a9 01     
            STA $4e            ; $c7d0: 85 4e     
            STA $55            ; $c7d2: 85 55     
            LDA #$00           ; $c7d4: a9 00     
            STA $4f            ; $c7d6: 85 4f     
            LDA $10            ; $c7d8: a5 10     
            EOR #$80           ; $c7da: 49 80     
            STA $2000          ; $c7dc: 8d 00 20  
            STA $10            ; $c7df: 85 10     
__c7e1:     JSR __f4ed         ; $c7e1: 20 ed f4  
            JMP __c7e1         ; $c7e4: 4c e1 c7  

;-------------------------------------------------------------------------------
__c7e7:     LDA #$10           ; $c7e7: a9 10     
            STA $2000          ; $c7e9: 8d 00 20  
            STA $10            ; $c7ec: 85 10     
            LDA #$06           ; $c7ee: a9 06     
            STA $2001          ; $c7f0: 8d 01 20  
            STA $11            ; $c7f3: 85 11     
            LDA #$00           ; $c7f5: a9 00     
            STA $2005          ; $c7f7: 8d 05 20  
            STA $12            ; $c7fa: 85 12     
            STA $2005          ; $c7fc: 8d 05 20  
            STA $13            ; $c7ff: 85 13     
            JSR __cbae         ; $c801: 20 ae cb  
            JMP __cbb7         ; $c804: 4c b7 cb  

;-------------------------------------------------------------------------------
__c807:     TAX                ; $c807: aa        
            LDA __c4a7,x       ; $c808: bd a7 c4  
            STA $00            ; $c80b: 85 00     
            LDA __c4a8,x       ; $c80d: bd a8 c4  
            STA $01            ; $c810: 85 01     
            JMP __f228         ; $c812: 4c 28 f2  

;-------------------------------------------------------------------------------
__c815:     TAX                ; $c815: aa        
            LDA __c03c,x       ; $c816: bd 3c c0  
            STA $02            ; $c819: 85 02     
            LDA __c03d,x       ; $c81b: bd 3d c0  
            STA $03            ; $c81e: 85 03     
            JMP __f2d7         ; $c820: 4c d7 f2  

;-------------------------------------------------------------------------------
__c823:     TAX                ; $c823: aa        
            LDA __c03c,x       ; $c824: bd 3c c0  
            STA $00            ; $c827: 85 00     
            LDA __c03d,x       ; $c829: bd 3d c0  
            STA $01            ; $c82c: 85 01     
            JMP __cd76         ; $c82e: 4c 76 cd  

;-------------------------------------------------------------------------------
__c831:     TAX                ; $c831: aa        
            LDA __c03c,x       ; $c832: bd 3c c0  
            STA $04            ; $c835: 85 04     
            LDA __c03d,x       ; $c837: bd 3d c0  
            STA $05            ; $c83a: 85 05     
            LDA __c044,x       ; $c83c: bd 44 c0  
            STA $06            ; $c83f: 85 06     
            LDA __c045,x       ; $c841: bd 45 c0  
            STA $07            ; $c844: 85 07     
            RTS                ; $c846: 60        

;-------------------------------------------------------------------------------
__c847:     TAX                ; $c847: aa        
            LDA __c03c,x       ; $c848: bd 3c c0  
            STA $02            ; $c84b: 85 02     
            LDA __c03d,x       ; $c84d: bd 3d c0  
            STA $03            ; $c850: 85 03     
            RTS                ; $c852: 60        

;-------------------------------------------------------------------------------
__c853:     TAX                ; $c853: aa        
            LDA __c03c,x       ; $c854: bd 3c c0  
            STA $08            ; $c857: 85 08     
            LDA __c03d,x       ; $c859: bd 3d c0  
            STA $09            ; $c85c: 85 09     
            RTS                ; $c85e: 60        

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        PHA                ; $c85f: 48        
            LDA $10            ; $c860: a5 10     
            AND #$7f           ; $c862: 29 7f     
            STA $2000          ; $c864: 8d 00 20  
            STA $10            ; $c867: 85 10     
            LDA #$00           ; $c869: a9 00     
            STA $2003          ; $c86b: 8d 03 20  
            LDA #$02           ; $c86e: a9 02     
            STA $4014          ; $c870: 8d 14 40  
            LDA #$31           ; $c873: a9 31     
            STA $00            ; $c875: 85 00     
            LDA #$03           ; $c877: a9 03     
            STA $01            ; $c879: 85 01     
            JSR __f228         ; $c87b: 20 28 f2  
            LDA #$00           ; $c87e: a9 00     
            STA $0330          ; $c880: 8d 30 03  
            STA $0331          ; $c883: 8d 31 03  
            JSR __f50e         ; $c886: 20 0e f5  
            LDA $11            ; $c889: a5 11     
            EOR #$18           ; $c88b: 49 18     
            STA $2001          ; $c88d: 8d 01 20  
            JSR __fa48         ; $c890: 20 48 fa  
            LDA $4e            ; $c893: a5 4e     
            BNE __c8c1         ; $c895: d0 2a     
            LDA $4f            ; $c897: a5 4f     
            BEQ __c8d4         ; $c899: f0 39     
            LDA $9a            ; $c89b: a5 9a     
            BNE __c8a5         ; $c89d: d0 06     
            JSR __ce7c         ; $c89f: 20 7c ce  
            JMP __c8d7         ; $c8a2: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8a5:     LDA $044f          ; $c8a5: ad 4f 04  
            CMP #$08           ; $c8a8: c9 08     
            BNE __c8d4         ; $c8aa: d0 28     
            JSR __ccf4         ; $c8ac: 20 f4 cc  
            LDA $43            ; $c8af: a5 43     
            BNE __c8d7         ; $c8b1: d0 24     
            LDA #$00           ; $c8b3: a9 00     
            STA $044f          ; $c8b5: 8d 4f 04  
            STA $4f            ; $c8b8: 85 4f     
            LDA #$79           ; $c8ba: a9 79     
            STA $43            ; $c8bc: 85 43     
            JMP __c8d7         ; $c8be: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8c1:     LDA $55            ; $c8c1: a5 55     
            BNE __c8cb         ; $c8c3: d0 06     
            JSR __ca30         ; $c8c5: 20 30 ca  
            JMP __c8d7         ; $c8c8: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8cb:     JSR __c8f3         ; $c8cb: 20 f3 c8  
            JSR __f4ac         ; $c8ce: 20 ac f4  
            JMP __c8d7         ; $c8d1: 4c d7 c8  

;-------------------------------------------------------------------------------
__c8d4:     JSR __cac9         ; $c8d4: 20 c9 ca  
__c8d7:     LDA $0505          ; $c8d7: ad 05 05  
            CMP #$01           ; $c8da: c9 01     
            BNE __c8e8         ; $c8dc: d0 0a     
            LDA $51            ; $c8de: a5 51     
            STA $00            ; $c8e0: 85 00     
            JSR __f23c         ; $c8e2: 20 3c f2  
            DEC $0505          ; $c8e5: ce 05 05  
__c8e8:     LDA $10            ; $c8e8: a5 10     
            EOR #$80           ; $c8ea: 49 80     
            STA $2000          ; $c8ec: 8d 00 20  
            STA $10            ; $c8ef: 85 10     
            PLA                ; $c8f1: 68        
            RTI                ; $c8f2: 40        

;-------------------------------------------------------------------------------
__c8f3:     LDA $0102          ; $c8f3: ad 02 01  
            BNE __c8fe         ; $c8f6: d0 06     
            STA $4015          ; $c8f8: 8d 15 40  
            STA $0100          ; $c8fb: 8d 00 01  
__c8fe:     LDA $0518          ; $c8fe: ad 18 05  
            BNE __c914         ; $c901: d0 11     
            LDA #$80           ; $c903: a9 80     
            STA $fd            ; $c905: 85 fd     
            LDA #$04           ; $c907: a9 04     
            STA $0518          ; $c909: 8d 18 05  
            LDA #$0f           ; $c90c: a9 0f     
            STA $4015          ; $c90e: 8d 15 40  
            STA $0100          ; $c911: 8d 00 01  
__c914:     LDA $0510          ; $c914: ad 10 05  
            BNE __c940         ; $c917: d0 27     
            JSR __d19a         ; $c919: 20 9a d1  
            LDA #$08           ; $c91c: a9 08     
            JSR __c807         ; $c91e: 20 07 c8  
            LDA $0511          ; $c921: ad 11 05  
            STA $0200          ; $c924: 8d 00 02  
            LDA #$a2           ; $c927: a9 a2     
            STA $0201          ; $c929: 8d 01 02  
            LDA #$00           ; $c92c: a9 00     
            STA $0202          ; $c92e: 8d 02 02  
            STA $58            ; $c931: 85 58     
            LDA #$38           ; $c933: a9 38     
            STA $0203          ; $c935: 8d 03 02  
            STA $0510          ; $c938: 8d 10 05  
            LDA #$20           ; $c93b: a9 20     
            STA $44            ; $c93d: 85 44     
            RTS                ; $c93f: 60        

;-------------------------------------------------------------------------------
__c940:     LDA $15            ; $c940: a5 15     
            AND #$20           ; $c942: 29 20     
            BNE __c95d         ; $c944: d0 17     
            LDA $15            ; $c946: a5 15     
            AND #$10           ; $c948: 29 10     
            BNE __c98a         ; $c94a: d0 3e     
            LDA #$00           ; $c94c: a9 00     
            STA $0512          ; $c94e: 8d 12 05  
            LDA $44            ; $c951: a5 44     
            BNE __c95c         ; $c953: d0 07     
            LDA #$01           ; $c955: a9 01     
            STA $58            ; $c957: 85 58     
            JMP __c9b1         ; $c959: 4c b1 c9  

;-------------------------------------------------------------------------------
__c95c:     RTS                ; $c95c: 60        

;-------------------------------------------------------------------------------
__c95d:     LDA #$40           ; $c95d: a9 40     
            STA $44            ; $c95f: 85 44     
            LDA $0512          ; $c961: ad 12 05  
            BNE __c985         ; $c964: d0 1f     
            LDA #$40           ; $c966: a9 40     
            STA $35            ; $c968: 85 35     
            LDA $0200          ; $c96a: ad 00 02  
            CLC                ; $c96d: 18        
            ADC #$10           ; $c96e: 69 10     
            CMP #$bf           ; $c970: c9 bf     
            BNE __c976         ; $c972: d0 02     
            LDA #$7f           ; $c974: a9 7f     
__c976:     STA $0200          ; $c976: 8d 00 02  
            STA $0511          ; $c979: 8d 11 05  
            INC $0512          ; $c97c: ee 12 05  
            LDA #$0a           ; $c97f: a9 0a     
            STA $0513          ; $c981: 8d 13 05  
            RTS                ; $c984: 60        

;-------------------------------------------------------------------------------
__c985:     LDA $35            ; $c985: a5 35     
            BNE __c989         ; $c987: d0 00     
__c989:     RTS                ; $c989: 60        

;-------------------------------------------------------------------------------
__c98a:     STA $0514          ; $c98a: 8d 14 05  
            LDX #$0a           ; $c98d: a2 0a     
            LDA #$00           ; $c98f: a9 00     
__c991:     STA $24,x          ; $c991: 95 24     
            DEX                ; $c993: ca        
            BNE __c991         ; $c994: d0 fb     
            LDA $0511          ; $c996: ad 11 05  
            LSR                ; $c999: 4a        
            LSR                ; $c99a: 4a        
            LSR                ; $c99b: 4a        
            LSR                ; $c99c: 4a        
            SEC                ; $c99d: 38        
            SBC #$07           ; $c99e: e9 07     
            STA $50            ; $c9a0: 85 50     
            CMP #$02           ; $c9a2: c9 02     
            BMI __c9ad         ; $c9a4: 30 07     
            LDA #$1c           ; $c9a6: a9 1c     
            STA $51            ; $c9a8: 85 51     
            JMP __c9b1         ; $c9aa: 4c b1 c9  

;-------------------------------------------------------------------------------
__c9ad:     LDA #$18           ; $c9ad: a9 18     
            STA $51            ; $c9af: 85 51     
__c9b1:     LDA $50            ; $c9b1: a5 50     
            AND #$01           ; $c9b3: 29 01     
            ASL                ; $c9b5: 0a        
            TAX                ; $c9b6: aa        
            LDA $0507,x        ; $c9b7: bd 07 05  
            STA $21            ; $c9ba: 85 21     
            LDA $0508,x        ; $c9bc: bd 08 05  
            STA $22            ; $c9bf: 85 22     
            LDA #$0f           ; $c9c1: a9 0f     
            STA $18            ; $c9c3: 85 18     
            LDA #$13           ; $c9c5: a9 13     
            STA $19            ; $c9c7: 85 19     
            LDA #$00           ; $c9c9: a9 00     
            STA $4e            ; $c9cb: 85 4e     
            STA $0406          ; $c9cd: 8d 06 04  
            STA $0407          ; $c9d0: 8d 07 04  
            STA $4f            ; $c9d3: 85 4f     
            STA $0510          ; $c9d5: 8d 10 05  
            STA $050b          ; $c9d8: 8d 0b 05  
            STA $0512          ; $c9db: 8d 12 05  
            LDA #$01           ; $c9de: a9 01     
            STA $53            ; $c9e0: 85 53     
            STA $0400          ; $c9e2: 8d 00 04  
            STA $0401          ; $c9e5: 8d 01 04  
            LDA #$00           ; $c9e8: a9 00     
            STA $54            ; $c9ea: 85 54     
            STA $0402          ; $c9ec: 8d 02 04  
            STA $0403          ; $c9ef: 8d 03 04  
            LDA #$00           ; $c9f2: a9 00     
            STA $52            ; $c9f4: 85 52     
            STA $0408          ; $c9f6: 8d 08 04  
            STA $0409          ; $c9f9: 8d 09 04  
            STA $fc            ; $c9fc: 85 fc     
            LDA #$03           ; $c9fe: a9 03     
            LDX $58            ; $ca00: a6 58     
            BEQ __ca06         ; $ca02: f0 02     
            LDA #$01           ; $ca04: a9 01     
__ca06:     STA $55            ; $ca06: 85 55     
            STA $0404          ; $ca08: 8d 04 04  
            STA $0405          ; $ca0b: 8d 05 04  
            STA $040b          ; $ca0e: 8d 0b 04  
            LDA $58            ; $ca11: a5 58     
            BNE __ca26         ; $ca13: d0 11     
            LDA #$97           ; $ca15: a9 97     
            STA $43            ; $ca17: 85 43     
            LDA #$01           ; $ca19: a9 01     
            STA $fd            ; $ca1b: 85 fd     
            LDA #$0f           ; $ca1d: a9 0f     
            STA $4015          ; $ca1f: 8d 15 40  
            STA $0100          ; $ca22: 8d 00 01  
            RTS                ; $ca25: 60        

;-------------------------------------------------------------------------------
__ca26:     DEC $0518          ; $ca26: ce 18 05  
            LDA #$75           ; $ca29: a9 75     
            STA $43            ; $ca2b: 85 43     
            JMP __cbae         ; $ca2d: 4c ae cb  

;-------------------------------------------------------------------------------
__ca30:     JSR __f4ac         ; $ca30: 20 ac f4  
            LDA $58            ; $ca33: a5 58     
            BNE __ca4a         ; $ca35: d0 13     
            LDA $43            ; $ca37: a5 43     
            CMP #$75           ; $ca39: c9 75     
            BEQ __ca5a         ; $ca3b: f0 1d     
            CMP #$74           ; $ca3d: c9 74     
            BEQ __ca5f         ; $ca3f: f0 1e     
            CMP #$73           ; $ca41: c9 73     
            BEQ __ca64         ; $ca43: f0 1f     
            CMP #$5f           ; $ca45: c9 5f     
            BEQ __ca79         ; $ca47: f0 30     
            RTS                ; $ca49: 60        

;-------------------------------------------------------------------------------
__ca4a:     STA $55            ; $ca4a: 85 55     
            LDA #$00           ; $ca4c: a9 00     
            STA $58            ; $ca4e: 85 58     
            STA $0510          ; $ca50: 8d 10 05  
__ca53:     JSR __cbb7         ; $ca53: 20 b7 cb  
            JSR __cbae         ; $ca56: 20 ae cb  
            RTS                ; $ca59: 60        

;-------------------------------------------------------------------------------
__ca5a:     DEC $43            ; $ca5a: c6 43     
            JMP __cbae         ; $ca5c: 4c ae cb  

;-------------------------------------------------------------------------------
__ca5f:     DEC $43            ; $ca5f: c6 43     
            JMP __cbca         ; $ca61: 4c ca cb  

;-------------------------------------------------------------------------------
__ca64:     DEC $43            ; $ca64: c6 43     
            LDA $50            ; $ca66: a5 50     
            AND #$01           ; $ca68: 29 01     
            ASL                ; $ca6a: 0a        
            TAX                ; $ca6b: aa        
            LDA $21            ; $ca6c: a5 21     
            STA $0507,x        ; $ca6e: 9d 07 05  
            LDA $22            ; $ca71: a5 22     
            STA $0508,x        ; $ca73: 9d 08 05  
            JMP __cbf5         ; $ca76: 4c f5 cb  

;-------------------------------------------------------------------------------
__ca79:     LDX $52            ; $ca79: a6 52     
            LDA #$01           ; $ca7b: a9 01     
            STA $0406,x        ; $ca7d: 9d 06 04  
            STA $4e            ; $ca80: 85 4e     
            LDA $51            ; $ca82: a5 51     
            CMP #$1c           ; $ca84: c9 1c     
            BNE __ca94         ; $ca86: d0 0c     
            LDA $52            ; $ca88: a5 52     
            EOR #$01           ; $ca8a: 49 01     
            TAX                ; $ca8c: aa        
            LDA $0406,x        ; $ca8d: bd 06 04  
            STA $4e            ; $ca90: 85 4e     
            BEQ __ca99         ; $ca92: f0 05     
__ca94:     STA $55            ; $ca94: 85 55     
            JMP __ca53         ; $ca96: 4c 53 ca  

;-------------------------------------------------------------------------------
__ca99:     LDA #$85           ; $ca99: a9 85     
            STA $43            ; $ca9b: 85 43     
            STA $040b          ; $ca9d: 8d 0b 04  
            LDY #$00           ; $caa0: a0 00     
            STY $4f            ; $caa2: 84 4f     
            STX $52            ; $caa4: 86 52     
            JMP __caa9         ; $caa6: 4c a9 ca  

;-------------------------------------------------------------------------------
__caa9:     LDY #$00           ; $caa9: a0 00     
__caab:     LDA $0400,x        ; $caab: bd 00 04  
            STA $0053,y        ; $caae: 99 53 00  
            INX                ; $cab1: e8        
            INX                ; $cab2: e8        
            INY                ; $cab3: c8        
            CPY #$03           ; $cab4: c0 03     
            BNE __caab         ; $cab6: d0 f3     
            RTS                ; $cab8: 60        

;-------------------------------------------------------------------------------
__cab9:     LDY #$00           ; $cab9: a0 00     
__cabb:     LDA $0053,y        ; $cabb: b9 53 00  
            STA $0400,x        ; $cabe: 9d 00 04  
            INX                ; $cac1: e8        
            INX                ; $cac2: e8        
            INY                ; $cac3: c8        
            CPY #$03           ; $cac4: c0 03     
            BNE __cabb         ; $cac6: d0 f3     
            RTS                ; $cac8: 60        

;-------------------------------------------------------------------------------
__cac9:     JSR __f4ac         ; $cac9: 20 ac f4  
            LDA $53            ; $cacc: a5 53     
            CMP #$01           ; $cace: c9 01     
            BEQ __cad8         ; $cad0: f0 06     
            LDA $43            ; $cad2: a5 43     
            CMP #$84           ; $cad4: c9 84     
            BEQ __cb02         ; $cad6: f0 2a     
__cad8:     LDA $43            ; $cad8: a5 43     
            CMP #$72           ; $cada: c9 72     
            BCS __cb18         ; $cadc: b0 3a     
            CMP #$6d           ; $cade: c9 6d     
            BEQ __cae7         ; $cae0: f0 05     
            CMP #$62           ; $cae2: c9 62     
            BEQ __cafa         ; $cae4: f0 14     
            RTS                ; $cae6: 60        

;-------------------------------------------------------------------------------
__cae7:     LDA $040b          ; $cae7: ad 0b 04  
            BEQ __caf6         ; $caea: f0 0a     
            LDA #$00           ; $caec: a9 00     
            STA $040b          ; $caee: 8d 0b 04  
            DEC $55            ; $caf1: c6 55     
            JSR __cbbd         ; $caf3: 20 bd cb  
__caf6:     JSR __cc34         ; $caf6: 20 34 cc  
            RTS                ; $caf9: 60        

;-------------------------------------------------------------------------------
__cafa:     LDA #$01           ; $cafa: a9 01     
            STA $4f            ; $cafc: 85 4f     
            JSR __cc47         ; $cafe: 20 47 cc  
            RTS                ; $cb01: 60        

;-------------------------------------------------------------------------------
__cb02:     LDX $52            ; $cb02: a6 52     
            LDA $53            ; $cb04: a5 53     
            CMP $0400,x        ; $cb06: dd 00 04  
            BEQ __cb15         ; $cb09: f0 0a     
            CMP #$01           ; $cb0b: c9 01     
            BEQ __cb15         ; $cb0d: f0 06     
            JSR __cc24         ; $cb0f: 20 24 cc  
            JSR __cc04         ; $cb12: 20 04 cc  
__cb15:     DEC $43            ; $cb15: c6 43     
            RTS                ; $cb17: 60        

;-------------------------------------------------------------------------------
__cb18:     JMP __cb1b         ; $cb18: 4c 1b cb  

;-------------------------------------------------------------------------------
__cb1b:     CMP #$7a           ; $cb1b: c9 7a     
            BEQ __cb30         ; $cb1d: f0 11     
            CMP #$75           ; $cb1f: c9 75     
            BEQ __cb39         ; $cb21: f0 16     
            CMP #$74           ; $cb23: c9 74     
            BEQ __cb36         ; $cb25: f0 0f     
            CMP #$73           ; $cb27: c9 73     
            BEQ __cb58         ; $cb29: f0 2d     
            CMP #$72           ; $cb2b: c9 72     
            BEQ __cb47         ; $cb2d: f0 18     
            RTS                ; $cb2f: 60        

;-------------------------------------------------------------------------------
__cb30:     JSR __ca53         ; $cb30: 20 53 ca  
            JSR __cbca         ; $cb33: 20 ca cb  
__cb36:     DEC $43            ; $cb36: c6 43     
            RTS                ; $cb38: 60        

;-------------------------------------------------------------------------------
__cb39:     JSR __cbb7         ; $cb39: 20 b7 cb  
            DEC $43            ; $cb3c: c6 43     
            LDA $58            ; $cb3e: a5 58     
            BNE __cb46         ; $cb40: d0 04     
            LDA #$08           ; $cb42: a9 08     
            STA $fd            ; $cb44: 85 fd     
__cb46:     RTS                ; $cb46: 60        

;-------------------------------------------------------------------------------
__cb47:     DEC $43            ; $cb47: c6 43     
            LDX $53            ; $cb49: a6 53     
            DEX                ; $cb4b: ca        
            LDA __c608,x       ; $cb4c: bd 08 c6  
            STA $00            ; $cb4f: 85 00     
            LDA #$20           ; $cb51: a9 20     
            STA $01            ; $cb53: 85 01     
            JMP __eba6         ; $cb55: 4c a6 eb  

;-------------------------------------------------------------------------------
__cb58:     JSR __d19a         ; $cb58: 20 9a d1  
            LDX $53            ; $cb5b: a6 53     
            DEX                ; $cb5d: ca        
            TXA                ; $cb5e: 8a        
            ASL                ; $cb5f: 0a        
            JSR __c807         ; $cb60: 20 07 c8  
            LDA #$0a           ; $cb63: a9 0a     
            JSR __c807         ; $cb65: 20 07 c8  
            LDA $51            ; $cb68: a5 51     
            CMP #$1c           ; $cb6a: c9 1c     
            BEQ __cb7b         ; $cb6c: f0 0d     
            LDA #$76           ; $cb6e: a9 76     
            STA $00            ; $cb70: 85 00     
            LDA #$20           ; $cb72: a9 20     
            STA $01            ; $cb74: 85 01     
            LDA #$04           ; $cb76: a9 04     
            JSR __c815         ; $cb78: 20 15 c8  
__cb7b:     LDA #$01           ; $cb7b: a9 01     
            STA $0505          ; $cb7d: 8d 05 05  
            JSR __d032         ; $cb80: 20 32 d0  
            JSR __cbbd         ; $cb83: 20 bd cb  
            LDA #$bc           ; $cb86: a9 bc     
            STA $00            ; $cb88: 85 00     
            LDY $54            ; $cb8a: a4 54     
            INY                ; $cb8c: c8        
            JSR __f4c2         ; $cb8d: 20 c2 f4  
            LDA #$00           ; $cb90: a9 00     
            STA $2c            ; $cb92: 85 2c     
            LDA #$80           ; $cb94: a9 80     
            DEY                ; $cb96: 88        
            CPY #$04           ; $cb97: c0 04     
            BPL __cb9e         ; $cb99: 10 03     
            LDA __c207,y       ; $cb9b: b9 07 c2  
__cb9e:     STA $2e            ; $cb9e: 85 2e     
            LDA #$0d           ; $cba0: a9 0d     
            STA $45            ; $cba2: 85 45     
            LDA #$02           ; $cba4: a9 02     
            STA $00            ; $cba6: 85 00     
            JSR __f23c         ; $cba8: 20 3c f2  
            DEC $43            ; $cbab: c6 43     
            RTS                ; $cbad: 60        

;-------------------------------------------------------------------------------
__cbae:     LDA #$00           ; $cbae: a9 00     
            STA $04            ; $cbb0: 85 04     
            LDA #$ff           ; $cbb2: a9 ff     
            JMP __f092         ; $cbb4: 4c 92 f0  

;-------------------------------------------------------------------------------
__cbb7:     JSR __d19a         ; $cbb7: 20 9a d1  
            JMP __f1b4         ; $cbba: 4c b4 f1  

;-------------------------------------------------------------------------------
__cbbd:     LDA #$b5           ; $cbbd: a9 b5     
            STA $00            ; $cbbf: 85 00     
            LDA #$20           ; $cbc1: a9 20     
            STA $01            ; $cbc3: 85 01     
            LDY $55            ; $cbc5: a4 55     
            JMP __f4c2         ; $cbc7: 4c c2 f4  

;-------------------------------------------------------------------------------
__cbca:     LDA $58            ; $cbca: a5 58     
            BNE __cbf4         ; $cbcc: d0 26     
            LDA $51            ; $cbce: a5 51     
            CMP #$1c           ; $cbd0: c9 1c     
            BNE __cbf4         ; $cbd2: d0 20     
            LDX $52            ; $cbd4: a6 52     
            LDA $53            ; $cbd6: a5 53     
            CMP $0400,x        ; $cbd8: dd 00 04  
            BNE __cbf4         ; $cbdb: d0 17     
            LDY #$00           ; $cbdd: a0 00     
__cbdf:     LDA __c6aa,y       ; $cbdf: b9 aa c6  
            STA $0331,y        ; $cbe2: 99 31 03  
            BEQ __cbeb         ; $cbe5: f0 04     
            INY                ; $cbe7: c8        
            JMP __cbdf         ; $cbe8: 4c df cb  

;-------------------------------------------------------------------------------
__cbeb:     LDA $52            ; $cbeb: a5 52     
            BEQ __cbf4         ; $cbed: f0 05     
            LDA #$67           ; $cbef: a9 67     
            STA $0345          ; $cbf1: 8d 45 03  
__cbf4:     RTS                ; $cbf4: 60        

;-------------------------------------------------------------------------------
__cbf5:     LDY #$00           ; $cbf5: a0 00     
__cbf7:     LDA __c6c2,y       ; $cbf7: b9 c2 c6  
            STA $0331,y        ; $cbfa: 99 31 03  
            BEQ __cc03         ; $cbfd: f0 04     
            INY                ; $cbff: c8        
            JMP __cbf7         ; $cc00: 4c f7 cb  

;-------------------------------------------------------------------------------
__cc03:     RTS                ; $cc03: 60        

;-------------------------------------------------------------------------------
__cc04:     LDA $58            ; $cc04: a5 58     
            BNE __cc23         ; $cc06: d0 1b     
            LDX $52            ; $cc08: a6 52     
            LDA $0408,x        ; $cc0a: bd 08 04  
            BNE __cc23         ; $cc0d: d0 14     
            TXA                ; $cc0f: 8a        
            TAY                ; $cc10: a8        
            CLC                ; $cc11: 18        
            ASL                ; $cc12: 0a        
            ASL                ; $cc13: 0a        
            TAX                ; $cc14: aa        
            LDA $25,x          ; $cc15: b5 25     
            CMP #$02           ; $cc17: c9 02     
            BCC __cc23         ; $cc19: 90 08     
            STA $0408,y        ; $cc1b: 99 08 04  
            INC $55            ; $cc1e: e6 55     
            JSR __cbbd         ; $cc20: 20 bd cb  
__cc23:     RTS                ; $cc23: 60        

;-------------------------------------------------------------------------------
__cc24:     LDA $2e            ; $cc24: a5 2e     
            STA $00            ; $cc26: 85 00     
            LDA $52            ; $cc28: a5 52     
            ORA #$08           ; $cc2a: 09 08     
            STA $01            ; $cc2c: 85 01     
            JSR __f342         ; $cc2e: 20 42 f3  
            JMP __d032         ; $cc31: 4c 32 d0  

;-------------------------------------------------------------------------------
__cc34:     LDA #$01           ; $cc34: a9 01     
            STA $0505          ; $cc36: 8d 05 05  
            JSR __d032         ; $cc39: 20 32 d0  
            LDA #$00           ; $cc3c: a9 00     
            STA $050b          ; $cc3e: 8d 0b 05  
            JSR __ccc1         ; $cc41: 20 c1 cc  
            JMP __d7f2         ; $cc44: 4c f2 d7  

;-------------------------------------------------------------------------------
__cc47:     LDA #$00           ; $cc47: a9 00     
            TAX                ; $cc49: aa        
__cc4a:     STA $59,x          ; $cc4a: 95 59     
            STA $040d,x        ; $cc4c: 9d 0d 04  
            INX                ; $cc4f: e8        
            CPX #$89           ; $cc50: e0 89     
            BNE __cc4a         ; $cc52: d0 f6     
            LDA #$01           ; $cc54: a9 01     
            STA $59            ; $cc56: 85 59     
            STA $96            ; $cc58: 85 96     
            STA $043e          ; $cc5a: 8d 3e 04  
            STA $0451          ; $cc5d: 8d 51 04  
            STA $0452          ; $cc60: 8d 52 04  
            STA $9f            ; $cc63: 85 9f     
            STA $0503          ; $cc65: 8d 03 05  
            LDA #$04           ; $cc68: a9 04     
            STA $97            ; $cc6a: 85 97     
            LDA #$58           ; $cc6c: a9 58     
            STA $043d          ; $cc6e: 8d 3d 04  
            LDA #$20           ; $cc71: a9 20     
            STA $a2            ; $cc73: 85 a2     
            LDA #$80           ; $cc75: a9 80     
            STA $18            ; $cc77: 85 18     
            LDA #$0a           ; $cc79: a9 0a     
            STA $34            ; $cc7b: 85 34     
            LDX $52            ; $cc7d: a6 52     
            JSR __cab9         ; $cc7f: 20 b9 ca  
            LDA #$bb           ; $cc82: a9 bb     
            STA $39            ; $cc84: 85 39     
            LDA #$27           ; $cc86: a9 27     
            STA $44            ; $cc88: 85 44     
            LDA $53            ; $cc8a: a5 53     
            CMP #$01           ; $cc8c: c9 01     
            BEQ __cc99         ; $cc8e: f0 09     
            CMP #$03           ; $cc90: c9 03     
            BEQ __cca6         ; $cc92: f0 12     
            LDA #$10           ; $cc94: a9 10     
            STA $fc            ; $cc96: 85 fc     
            RTS                ; $cc98: 60        

;-------------------------------------------------------------------------------
__cc99:     LDA #$38           ; $cc99: a9 38     
            STA $36            ; $cc9b: 85 36     
            LDA #$40           ; $cc9d: a9 40     
            STA $43            ; $cc9f: 85 43     
            LDA #$02           ; $cca1: a9 02     
            STA $fc            ; $cca3: 85 fc     
            RTS                ; $cca5: 60        

;-------------------------------------------------------------------------------
__cca6:     LDA #$20           ; $cca6: a9 20     
            STA $36            ; $cca8: 85 36     
            LDA #$50           ; $ccaa: a9 50     
            STA $043f          ; $ccac: 8d 3f 04  
            STA $0441          ; $ccaf: 8d 41 04  
            STA $0443          ; $ccb2: 8d 43 04  
            LDA #$03           ; $ccb5: a9 03     
            STA $0440          ; $ccb7: 8d 40 04  
            STA $0442          ; $ccba: 8d 42 04  
            STA $0444          ; $ccbd: 8d 44 04  
            RTS                ; $ccc0: 60        

;-------------------------------------------------------------------------------
__ccc1:     LDA $53            ; $ccc1: a5 53     
            SEC                ; $ccc3: 38        
            SBC #$01           ; $ccc4: e9 01     
            ASL                ; $ccc6: 0a        
            TAX                ; $ccc7: aa        
            LDA __c5a6,x       ; $ccc8: bd a6 c5  
            STA $09            ; $cccb: 85 09     
            LDA __c5a7,x       ; $cccd: bd a7 c5  
            STA $0a            ; $ccd0: 85 0a     
            LDX #$00           ; $ccd2: a2 00     
            LDY #$00           ; $ccd4: a0 00     
__ccd6:     LDA ($09),y        ; $ccd6: b1 09     
            CMP #$fe           ; $ccd8: c9 fe     
            BEQ __ccf3         ; $ccda: f0 17     
            STA $00,x          ; $ccdc: 95 00     
            INY                ; $ccde: c8        
            INX                ; $ccdf: e8        
            CPX #$05           ; $cce0: e0 05     
            BNE __ccd6         ; $cce2: d0 f2     
            STY $86            ; $cce4: 84 86     
            LDA ($09),y        ; $cce6: b1 09     
            JSR __f096         ; $cce8: 20 96 f0  
            LDY $86            ; $cceb: a4 86     
            INY                ; $cced: c8        
            LDX #$00           ; $ccee: a2 00     
            JMP __ccd6         ; $ccf0: 4c d6 cc  

;-------------------------------------------------------------------------------
__ccf3:     RTS                ; $ccf3: 60        

;-------------------------------------------------------------------------------
__ccf4:     LDA $0450          ; $ccf4: ad 50 04  
            BNE __cd07         ; $ccf7: d0 0e     
            LDA #$01           ; $ccf9: a9 01     
            STA $0450          ; $ccfb: 8d 50 04  
            LDA #$0a           ; $ccfe: a9 0a     
            STA $34            ; $cd00: 85 34     
            LDA #$10           ; $cd02: a9 10     
            STA $fd            ; $cd04: 85 fd     
            RTS                ; $cd06: 60        

;-------------------------------------------------------------------------------
__cd07:     LDA $43            ; $cd07: a5 43     
            CMP #$58           ; $cd09: c9 58     
            BCC __cd13         ; $cd0b: 90 06     
            JSR __f4ac         ; $cd0d: 20 ac f4  
            JMP __cd22         ; $cd10: 4c 22 cd  

;-------------------------------------------------------------------------------
__cd13:     JSR __cc24         ; $cd13: 20 24 cc  
            JSR __cc04         ; $cd16: 20 04 cc  
            LDA #$00           ; $cd19: a9 00     
            STA $43            ; $cd1b: 85 43     
            STA $9a            ; $cd1d: 85 9a     
            JMP __ca53         ; $cd1f: 4c 53 ca  

;-------------------------------------------------------------------------------
__cd22:     LDA $43            ; $cd22: a5 43     
            CMP #$9f           ; $cd24: c9 9f     
            BEQ __cd45         ; $cd26: f0 1d     
            CMP #$9e           ; $cd28: c9 9e     
            BEQ __cd4a         ; $cd2a: f0 1e     
            CMP #$9d           ; $cd2c: c9 9d     
            BEQ __cd4f         ; $cd2e: f0 1f     
            CMP #$9c           ; $cd30: c9 9c     
            BEQ __cd58         ; $cd32: f0 24     
            CMP #$9b           ; $cd34: c9 9b     
            BEQ __cd61         ; $cd36: f0 29     
            CMP #$90           ; $cd38: c9 90     
            BCS __cd66         ; $cd3a: b0 2a     
            CMP #$86           ; $cd3c: c9 86     
            BCS __cd69         ; $cd3e: b0 29     
            CMP #$70           ; $cd40: c9 70     
            BCS __cd6c         ; $cd42: b0 28     
            RTS                ; $cd44: 60        

;-------------------------------------------------------------------------------
__cd45:     DEC $43            ; $cd45: c6 43     
            JMP __cd6f         ; $cd47: 4c 6f cd  

;-------------------------------------------------------------------------------
__cd4a:     DEC $43            ; $cd4a: c6 43     
            JMP __cd7f         ; $cd4c: 4c 7f cd  

;-------------------------------------------------------------------------------
__cd4f:     LDY #$1c           ; $cd4f: a0 1c     
            DEC $43            ; $cd51: c6 43     
            LDA #$06           ; $cd53: a9 06     
            JMP __c823         ; $cd55: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd58:     LDY #$1c           ; $cd58: a0 1c     
            DEC $43            ; $cd5a: c6 43     
            LDA #$08           ; $cd5c: a9 08     
            JMP __c823         ; $cd5e: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd61:     DEC $43            ; $cd61: c6 43     
            JMP __cd89         ; $cd63: 4c 89 cd  

;-------------------------------------------------------------------------------
__cd66:     JMP __cd9d         ; $cd66: 4c 9d cd  

;-------------------------------------------------------------------------------
__cd69:     JMP __cdb1         ; $cd69: 4c b1 cd  

;-------------------------------------------------------------------------------
__cd6c:     JMP __ce24         ; $cd6c: 4c 24 ce  

;-------------------------------------------------------------------------------
__cd6f:     LDY #$0c           ; $cd6f: a0 0c     
            LDA #$0a           ; $cd71: a9 0a     
            JMP __c823         ; $cd73: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd76:     LDA ($00),y        ; $cd76: b1 00     
            STA $0331,y        ; $cd78: 99 31 03  
            DEY                ; $cd7b: 88        
            BPL __cd76         ; $cd7c: 10 f8     
            RTS                ; $cd7e: 60        

;-------------------------------------------------------------------------------
__cd7f:     JSR __cbae         ; $cd7f: 20 ae cb  
            LDY #$16           ; $cd82: a0 16     
            LDA #$0c           ; $cd84: a9 0c     
            JMP __c823         ; $cd86: 4c 23 c8  

;-------------------------------------------------------------------------------
__cd89:     LDY #$0c           ; $cd89: a0 0c     
            LDA #$0e           ; $cd8b: a9 0e     
            JSR __c823         ; $cd8d: 20 23 c8  
            LDA #$03           ; $cd90: a9 03     
            STA $02            ; $cd92: 85 02     
            LDA #$18           ; $cd94: a9 18     
            STA $03            ; $cd96: 85 03     
            LDA #$50           ; $cd98: a9 50     
            JMP __f08c         ; $cd9a: 4c 8c f0  

;-------------------------------------------------------------------------------
__cd9d:     LDA #$8d           ; $cd9d: a9 8d     
            STA $00            ; $cd9f: 85 00     
            LDA #$20           ; $cda1: a9 20     
            STA $01            ; $cda3: 85 01     
            LDA $43            ; $cda5: a5 43     
            AND #$01           ; $cda7: 29 01     
            BEQ __cdae         ; $cda9: f0 03     
            JMP __eb89         ; $cdab: 4c 89 eb  

;-------------------------------------------------------------------------------
__cdae:     JMP __eb92         ; $cdae: 4c 92 eb  

;-------------------------------------------------------------------------------
__cdb1:     CMP #$8f           ; $cdb1: c9 8f     
            BNE __cdd7         ; $cdb3: d0 22     
            DEC $43            ; $cdb5: c6 43     
            LDY #$10           ; $cdb7: a0 10     
            LDA #$10           ; $cdb9: a9 10     
            JSR __c823         ; $cdbb: 20 23 c8  
            LDA #$01           ; $cdbe: a9 01     
            STA $fe            ; $cdc0: 85 fe     
            LDA #$68           ; $cdc2: a9 68     
            STA $00            ; $cdc4: 85 00     
            LDA #$3e           ; $cdc6: a9 3e     
            STA $01            ; $cdc8: 85 01     
__cdca:     LDA #$40           ; $cdca: a9 40     
            STA $02            ; $cdcc: 85 02     
            LDA #$46           ; $cdce: a9 46     
            STA $03            ; $cdd0: 85 03     
            LDA #$50           ; $cdd2: a9 50     
            JMP __f080         ; $cdd4: 4c 80 f0  

;-------------------------------------------------------------------------------
__cdd7:     LDA $0250          ; $cdd7: ad 50 02  
            CMP #$a0           ; $cdda: c9 a0     
            BEQ __cdef         ; $cddc: f0 11     
            CMP #$ff           ; $cdde: c9 ff     
            BEQ __cdf3         ; $cde0: f0 11     
            CLC                ; $cde2: 18        
            ADC #$02           ; $cde3: 69 02     
            STA $01            ; $cde5: 85 01     
            LDA $0253          ; $cde7: ad 53 02  
            STA $00            ; $cdea: 85 00     
            JMP __cdca         ; $cdec: 4c ca cd  

;-------------------------------------------------------------------------------
__cdef:     LDA #$80           ; $cdef: a9 80     
            STA $fe            ; $cdf1: 85 fe     
__cdf3:     LDA #$18           ; $cdf3: a9 18     
            STA $03            ; $cdf5: 85 03     
            LDA #$50           ; $cdf7: a9 50     
            JSR __f08c         ; $cdf9: 20 8c f0  
            LDA #$eb           ; $cdfc: a9 eb     
            STA $00            ; $cdfe: 85 00     
            LDA #$23           ; $ce00: a9 23     
            STA $01            ; $ce02: 85 01     
            LDA #$12           ; $ce04: a9 12     
            JSR __c815         ; $ce06: 20 15 c8  
            LDA #$01           ; $ce09: a9 01     
            JMP __ce0e         ; $ce0b: 4c 0e ce  

;-------------------------------------------------------------------------------
__ce0e:     PHP                ; $ce0e: 08        
            LDA #$8d           ; $ce0f: a9 8d     
            STA $00            ; $ce11: 85 00     
            LDA #$22           ; $ce13: a9 22     
            STA $01            ; $ce15: 85 01     
            PLP                ; $ce17: 28        
            BNE __ce1f         ; $ce18: d0 05     
            LDA #$16           ; $ce1a: a9 16     
            JMP __c815         ; $ce1c: 4c 15 c8  

;-------------------------------------------------------------------------------
__ce1f:     LDA #$14           ; $ce1f: a9 14     
            JMP __c815         ; $ce21: 4c 15 c8  

;-------------------------------------------------------------------------------
__ce24:     CMP #$85           ; $ce24: c9 85     
            BEQ __ce2f         ; $ce26: f0 07     
            LDA $43            ; $ce28: a5 43     
            AND #$01           ; $ce2a: 29 01     
            JMP __ce0e         ; $ce2c: 4c 0e ce  

;-------------------------------------------------------------------------------
__ce2f:     LDA #$04           ; $ce2f: a9 04     
            STA $fd            ; $ce31: 85 fd     
            LDY #$04           ; $ce33: a0 04     
            LDA #$18           ; $ce35: a9 18     
            JSR __c823         ; $ce37: 20 23 c8  
            LDA #$78           ; $ce3a: a9 78     
            STA $00            ; $ce3c: 85 00     
            LDA #$20           ; $ce3e: a9 20     
            STA $01            ; $ce40: 85 01     
            LDA #$c8           ; $ce42: a9 c8     
            STA $02            ; $ce44: 85 02     
            LDA #$22           ; $ce46: a9 22     
            STA $03            ; $ce48: 85 03     
            LDA #$b0           ; $ce4a: a9 b0     
            JSR __f080         ; $ce4c: 20 80 f0  
            DEC $43            ; $ce4f: c6 43     
            LDA #$a0           ; $ce51: a9 a0     
            STA $00            ; $ce53: 85 00     
            LDA #$30           ; $ce55: a9 30     
            STA $01            ; $ce57: 85 01     
            LDA #$04           ; $ce59: a9 04     
            JSR __ead4         ; $ce5b: 20 d4 ea  
            LDA #$00           ; $ce5e: a9 00     
            JSR __f086         ; $ce60: 20 86 f0  
            LDA #$28           ; $ce63: a9 28     
            STA $02e8          ; $ce65: 8d e8 02  
            STA $02ec          ; $ce68: 8d ec 02  
            LDA #$30           ; $ce6b: a9 30     
            STA $02f0          ; $ce6d: 8d f0 02  
            STA $02f8          ; $ce70: 8d f8 02  
            LDA #$38           ; $ce73: a9 38     
            STA $02f4          ; $ce75: 8d f4 02  
            STA $02fc          ; $ce78: 8d fc 02  
            RTS                ; $ce7b: 60        

;-------------------------------------------------------------------------------
__ce7c:     LDA $58            ; $ce7c: a5 58     
            BEQ __ce94         ; $ce7e: f0 14     
            LDA $0102          ; $ce80: ad 02 01  
            BNE __ce8b         ; $ce83: d0 06     
            STA $4015          ; $ce85: 8d 15 40  
            STA $0100          ; $ce88: 8d 00 01  
__ce8b:     LDA $15            ; $ce8b: a5 15     
            .hex 29            ; $ce8d: 29        Suspected data
__ce8e:     JSR $03f0          ; $ce8e: 20 f0 03  
            JMP __cf2b         ; $ce91: 4c 2b cf  

;-------------------------------------------------------------------------------
__ce94:     LDA $0516          ; $ce94: ad 16 05  
            BNE __ceae         ; $ce97: d0 15     
            LDA $0517          ; $ce99: ad 17 05  
            BEQ __cea2         ; $ce9c: f0 04     
            DEC $0517          ; $ce9e: ce 17 05  
            RTS                ; $cea1: 60        

;-------------------------------------------------------------------------------
__cea2:     JSR __cc04         ; $cea2: 20 04 cc  
            JSR __cfa8         ; $cea5: 20 a8 cf  
            LDA $9a            ; $cea8: a5 9a     
            CMP #$01           ; $ceaa: c9 01     
            BNE __ceb1         ; $ceac: d0 03     
__ceae:     JMP __cf1c         ; $ceae: 4c 1c cf  

;-------------------------------------------------------------------------------
__ceb1:     LDA $bf            ; $ceb1: a5 bf     
            BEQ __ceb8         ; $ceb3: f0 03     
            JMP __cf13         ; $ceb5: 4c 13 cf  

;-------------------------------------------------------------------------------
__ceb8:     LDA $96            ; $ceb8: a5 96     
            CMP #$ff           ; $ceba: c9 ff     
            BNE __cec1         ; $cebc: d0 03     
            JMP __cf19         ; $cebe: 4c 19 cf  

;-------------------------------------------------------------------------------
__cec1:     CMP #$08           ; $cec1: c9 08     
            BEQ __ced6         ; $cec3: f0 11     
            CMP #$04           ; $cec5: c9 04     
            BEQ __ced6         ; $cec7: f0 0d     
            .hex a5            ; $cec9: a5        Suspected data
__ceca:     CLI                ; $ceca: 58        
            BEQ __ced3         ; $cecb: f0 06     
            JSR __ebda         ; $cecd: 20 da eb  
            .hex 4c d6         ; $ced0: 4c d6     Suspected data
__ced2:     .hex ce            ; $ced2: ce        Suspected data
__ced3:     JSR __d175         ; $ced3: 20 75 d1  
__ced6:     JSR __eb06         ; $ced6: 20 06 eb  
            JSR __ebb6         ; $ced9: 20 b6 eb  
            JSR __d041         ; $cedc: 20 41 d0  
            JSR __d1a4         ; $cedf: 20 a4 d1  
            JSR __ea5f         ; $cee2: 20 5f ea  
            JSR __e1e5         ; $cee5: 20 e5 e1  
            JSR __ee79         ; $cee8: 20 79 ee  
            LDA $53            ; $ceeb: a5 53     
            CMP #$03           ; $ceed: c9 03     
            BEQ __cf01         ; $ceef: f0 10     
            CMP #$04           ; $cef1: c9 04     
            BEQ __cf0d         ; $cef3: f0 18     
            JSR __da16         ; $cef5: 20 16 da  
            JSR __e19a         ; $cef8: 20 9a e1  
            JSR __ec29         ; $cefb: 20 29 ec  
            JMP __cf1c         ; $cefe: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf01:     .hex 20            ; $cf01: 20        Suspected data
__cf02:     .hex 34 e8         ; $cf02: 34 e8     Invalid Opcode - NOP $e8,x
            JSR __e981         ; $cf04: 20 81 e9  
            JSR __ec29         ; $cf07: 20 29 ec  
            JMP __cf1c         ; $cf0a: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf0d:     JSR __ec29         ; $cf0d: 20 29 ec  
            JMP __cf1c         ; $cf10: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf13:     JSR __ee0c         ; $cf13: 20 0c ee  
            JMP __cf1c         ; $cf16: 4c 1c cf  

;-------------------------------------------------------------------------------
__cf19:     JSR __d0c0         ; $cf19: 20 c0 d0  
__cf1c:     JSR __cf42         ; $cf1c: 20 42 cf  
            LDA $0516          ; $cf1f: ad 16 05  
            BNE __cf2a         ; $cf22: d0 06     
            JSR __d04c         ; $cf24: 20 4c d0  
            JSR __f4ac         ; $cf27: 20 ac f4  
__cf2a:     RTS                ; $cf2a: 60        

;-------------------------------------------------------------------------------
__cf2b:     LDA #$01           ; $cf2b: a9 01     
            STA $4e            ; $cf2d: 85 4e     
            STA $0512          ; $cf2f: 8d 12 05  
            STA $55            ; $cf32: 85 55     
            LDA #$20           ; $cf34: a9 20     
            STA $44            ; $cf36: 85 44     
            LDA #$00           ; $cf38: a9 00     
            STA $58            ; $cf3a: 85 58     
            STA $0510          ; $cf3c: 8d 10 05  
            JMP __ca53         ; $cf3f: 4c 53 ca  

;-------------------------------------------------------------------------------
__cf42:     LDA $15            ; $cf42: a5 15     
            AND #$10           ; $cf44: 29 10     
            BEQ __cf8f         ; $cf46: f0 47     
            LDA $58            ; $cf48: a5 58     
            BEQ __cf55         ; $cf4a: f0 09     
            LDA #$00           ; $cf4c: a9 00     
            STA $58            ; $cf4e: 85 58     
            LDA $15            ; $cf50: a5 15     
            JMP __c98a         ; $cf52: 4c 8a c9  

;-------------------------------------------------------------------------------
__cf55:     LDA $15            ; $cf55: a5 15     
            CMP $0514          ; $cf57: cd 14 05  
            BEQ __cf92         ; $cf5a: f0 36     
            STA $0514          ; $cf5c: 8d 14 05  
            LDA $0516          ; $cf5f: ad 16 05  
            BEQ __cf7a         ; $cf62: f0 16     
            LDA $0517          ; $cf64: ad 17 05  
            BNE __cf79         ; $cf67: d0 10     
            STA $0516          ; $cf69: 8d 16 05  
            LDA $0f            ; $cf6c: a5 0f     
            STA $fc            ; $cf6e: 85 fc     
            LDA $11            ; $cf70: a5 11     
            AND #$ef           ; $cf72: 29 ef     
            STA $11            ; $cf74: 85 11     
            JMP __cf87         ; $cf76: 4c 87 cf  

;-------------------------------------------------------------------------------
__cf79:     RTS                ; $cf79: 60        

;-------------------------------------------------------------------------------
__cf7a:     LDA #$01           ; $cf7a: a9 01     
            STA $0516          ; $cf7c: 8d 16 05  
            LDA $fc            ; $cf7f: a5 fc     
            STA $0f            ; $cf81: 85 0f     
            LDA #$00           ; $cf83: a9 00     
            STA $fc            ; $cf85: 85 fc     
__cf87:     LDA #$40           ; $cf87: a9 40     
            STA $0517          ; $cf89: 8d 17 05  
            STA $fd            ; $cf8c: 85 fd     
            RTS                ; $cf8e: 60        

;-------------------------------------------------------------------------------
__cf8f:     STA $0514          ; $cf8f: 8d 14 05  
__cf92:     LDA $0517          ; $cf92: ad 17 05  
            BEQ __cf9b         ; $cf95: f0 04     
            DEC $0517          ; $cf97: ce 17 05  
            RTS                ; $cf9a: 60        

;-------------------------------------------------------------------------------
__cf9b:     LDA $0516          ; $cf9b: ad 16 05  
            BNE __cfa1         ; $cf9e: d0 01     
            RTS                ; $cfa0: 60        

;-------------------------------------------------------------------------------
__cfa1:     LDA $11            ; $cfa1: a5 11     
            ORA #$10           ; $cfa3: 09 10     
            STA $11            ; $cfa5: 85 11     
            RTS                ; $cfa7: 60        

;-------------------------------------------------------------------------------
__cfa8:     LDX #$00           ; $cfa8: a2 00     
            LDY #$00           ; $cfaa: a0 00     
__cfac:     LDA $41,x          ; $cfac: b5 41     
            BNE __cfb8         ; $cfae: d0 08     
            LDA #$ff           ; $cfb0: a9 ff     
            STA $02c0,y        ; $cfb2: 99 c0 02  
            STA $02c4,y        ; $cfb5: 99 c4 02  
__cfb8:     INX                ; $cfb8: e8        
            INY                ; $cfb9: c8        
            INY                ; $cfba: c8        
            INY                ; $cfbb: c8        
            INY                ; $cfbc: c8        
            INY                ; $cfbd: c8        
            INY                ; $cfbe: c8        
            INY                ; $cfbf: c8        
            INY                ; $cfc0: c8        
            CPX #$02           ; $cfc1: e0 02     
            BMI __cfac         ; $cfc3: 30 e7     
            RTS                ; $cfc5: 60        

;-------------------------------------------------------------------------------
__cfc6:     LDY #$00           ; $cfc6: a0 00     
            STY $0f            ; $cfc8: 84 0f     
            JSR __d008         ; $cfca: 20 08 d0  
__cfcd:     LDA $02c0,y        ; $cfcd: b9 c0 02  
            CMP #$ff           ; $cfd0: c9 ff     
            BNE __cff9         ; $cfd2: d0 25     
            LDA $05            ; $cfd4: a5 05     
            STA $02c3,y        ; $cfd6: 99 c3 02  
            CLC                ; $cfd9: 18        
            ADC #$08           ; $cfda: 69 08     
            STA $02c7,y        ; $cfdc: 99 c7 02  
            LDA $06            ; $cfdf: a5 06     
            STA $02c0,y        ; $cfe1: 99 c0 02  
            STA $02c4,y        ; $cfe4: 99 c4 02  
            LDA __c604,x       ; $cfe7: bd 04 c6  
            STA $02c1,y        ; $cfea: 99 c1 02  
            LDA #$d4           ; $cfed: a9 d4     
            STA $02c5,y        ; $cfef: 99 c5 02  
            LDX $0f            ; $cff2: a6 0f     
            LDA #$03           ; $cff4: a9 03     
            STA $41,x          ; $cff6: 95 41     
            RTS                ; $cff8: 60        

;-------------------------------------------------------------------------------
__cff9:     INY                ; $cff9: c8        
            INY                ; $cffa: c8        
            INY                ; $cffb: c8        
            INY                ; $cffc: c8        
            INY                ; $cffd: c8        
            INY                ; $cffe: c8        
            INY                ; $cfff: c8        
            INY                ; $d000: c8        
            INC $0f            ; $d001: e6 0f     
            CPY #$10           ; $d003: c0 10     
            BMI __cfcd         ; $d005: 30 c6     
            RTS                ; $d007: 60        

;-------------------------------------------------------------------------------
__d008:     TXA                ; $d008: 8a        
            PHA                ; $d009: 48        
            TYA                ; $d00a: 98        
            PHA                ; $d00b: 48        
            LDA $58            ; $d00c: a5 58     
            BNE __d02a         ; $d00e: d0 1a     
            LDA $52            ; $d010: a5 52     
            ORA #$18           ; $d012: 09 18     
            STA $01            ; $d014: 85 01     
            LDA __c600,x       ; $d016: bd 00 c6  
            STA $00            ; $d019: 85 00     
            LDA $05            ; $d01b: a5 05     
            PHA                ; $d01d: 48        
            LDA $06            ; $d01e: a5 06     
            PHA                ; $d020: 48        
            JSR __f342         ; $d021: 20 42 f3  
            PLA                ; $d024: 68        
            STA $06            ; $d025: 85 06     
            PLA                ; $d027: 68        
            STA $05            ; $d028: 85 05     
__d02a:     JSR __d032         ; $d02a: 20 32 d0  
            PLA                ; $d02d: 68        
            TAY                ; $d02e: a8        
            PLA                ; $d02f: 68        
            TAX                ; $d030: aa        
            RTS                ; $d031: 60        

;-------------------------------------------------------------------------------
__d032:     LDA $0505          ; $d032: ad 05 05  
            ORA #$01           ; $d035: 09 01     
            STA $0505          ; $d037: 8d 05 05  
            LDA #$f9           ; $d03a: a9 f9     
            STA $00            ; $d03c: 85 00     
            JMP __f435         ; $d03e: 4c 35 f4  

;-------------------------------------------------------------------------------
__d041:     LDA $2e            ; $d041: a5 2e     
            CMP #$10           ; $d043: c9 10     
            BPL __d04b         ; $d045: 10 04     
            LDA #$20           ; $d047: a9 20     
            STA $fc            ; $d049: 85 fc     
__d04b:     RTS                ; $d04b: 60        

;-------------------------------------------------------------------------------
__d04c:     LDA $9a            ; $d04c: a5 9a     
            BNE __d092         ; $d04e: d0 42     
            LDX $53            ; $d050: a6 53     
            CPX #$04           ; $d052: e0 04     
            BEQ __d063         ; $d054: f0 0d     
            LDA $5a            ; $d056: a5 5a     
            BEQ __d0bf         ; $d058: f0 65     
            DEX                ; $d05a: ca        
            LDA __c1fa,x       ; $d05b: bd fa c1  
            CMP $59            ; $d05e: c5 59     
            BEQ __d074         ; $d060: f0 12     
            RTS                ; $d062: 60        

;-------------------------------------------------------------------------------
__d063:     LDX #$00           ; $d063: a2 00     
__d065:     LDA $c1,x          ; $d065: b5 c1     
            BEQ __d0bf         ; $d067: f0 56     
            INX                ; $d069: e8        
            STX $044f          ; $d06a: 8e 4f 04  
            CPX #$08           ; $d06d: e0 08     
            BNE __d065         ; $d06f: d0 f4     
            JMP __d086         ; $d071: 4c 86 d0  

;-------------------------------------------------------------------------------
__d074:     JSR __eae1         ; $d074: 20 e1 ea  
            LDA #$04           ; $d077: a9 04     
            JSR __ead4         ; $d079: 20 d4 ea  
            JSR __eacd         ; $d07c: 20 cd ea  
            JSR __f088         ; $d07f: 20 88 f0  
            LDA #$02           ; $d082: a9 02     
            STA $fd            ; $d084: 85 fd     
__d086:     LDA #$00           ; $d086: a9 00     
            STA $fc            ; $d088: 85 fc     
            LDA #$01           ; $d08a: a9 01     
            STA $9a            ; $d08c: 85 9a     
            LDA #$00           ; $d08e: a9 00     
            STA $3a            ; $d090: 85 3a     
__d092:     LDA $3a            ; $d092: a5 3a     
            BNE __d0bf         ; $d094: d0 29     
            INC $53            ; $d096: e6 53     
            LDA $53            ; $d098: a5 53     
            CMP #$02           ; $d09a: c9 02     
            BEQ __d0a5         ; $d09c: f0 07     
            CMP #$05           ; $d09e: c9 05     
            BCS __d0aa         ; $d0a0: b0 08     
            JMP __d0b5         ; $d0a2: 4c b5 d0  

;-------------------------------------------------------------------------------
__d0a5:     INC $53            ; $d0a5: e6 53     
            JMP __d0b5         ; $d0a7: 4c b5 d0  

;-------------------------------------------------------------------------------
__d0aa:     LDA #$01           ; $d0aa: a9 01     
            STA $53            ; $d0ac: 85 53     
            INC $54            ; $d0ae: e6 54     
            LDA #$a0           ; $d0b0: a9 a0     
            STA $43            ; $d0b2: 85 43     
            RTS                ; $d0b4: 60        

;-------------------------------------------------------------------------------
__d0b5:     LDA #$8d           ; $d0b5: a9 8d     
            STA $43            ; $d0b7: 85 43     
            LDA #$00           ; $d0b9: a9 00     
            STA $4f            ; $d0bb: 85 4f     
            STA $9a            ; $d0bd: 85 9a     
__d0bf:     RTS                ; $d0bf: 60        

;-------------------------------------------------------------------------------
__d0c0:     LDA #$00           ; $d0c0: a9 00     
            STA $fc            ; $d0c2: 85 fc     
            LDA #$10           ; $d0c4: a9 10     
            JSR __d9e6         ; $d0c6: 20 e6 d9  
            BEQ __d138         ; $d0c9: f0 6d     
            LDA $98            ; $d0cb: a5 98     
            CMP #$ff           ; $d0cd: c9 ff     
            BEQ __d130         ; $d0cf: f0 5f     
            LDA $98            ; $d0d1: a5 98     
            BNE __d0e4         ; $d0d3: d0 0f     
            LDA $58            ; $d0d5: a5 58     
            BNE __d0dd         ; $d0d7: d0 04     
            LDA #$80           ; $d0d9: a9 80     
            STA $fe            ; $d0db: 85 fe     
__d0dd:     LDA #$40           ; $d0dd: a9 40     
            STA $3a            ; $d0df: 85 3a     
            INC $98            ; $d0e1: e6 98     
            RTS                ; $d0e3: 60        

;-------------------------------------------------------------------------------
__d0e4:     LDA $3a            ; $d0e4: a5 3a     
            BEQ __d0f8         ; $d0e6: f0 10     
            CMP #$0e           ; $d0e8: c9 0e     
            BCC __d138         ; $d0ea: 90 4c     
            LDA $58            ; $d0ec: a5 58     
            BNE __d0f4         ; $d0ee: d0 04     
            LDA #$01           ; $d0f0: a9 01     
            STA $ff            ; $d0f2: 85 ff     
__d0f4:     LDA #$00           ; $d0f4: a9 00     
            STA $3a            ; $d0f6: 85 3a     
__d0f8:     LDA $0201          ; $d0f8: ad 01 02  
            CMP #$6c           ; $d0fb: c9 6c     
            BCS __d101         ; $d0fd: b0 02     
            LDA #$6c           ; $d0ff: a9 6c     
__d101:     CLC                ; $d101: 18        
            ADC #$04           ; $d102: 69 04     
            CMP #$7c           ; $d104: c9 7c     
            BCC __d11f         ; $d106: 90 17     
            INC $98            ; $d108: e6 98     
            LDA $98            ; $d10a: a5 98     
            CMP #$05           ; $d10c: c9 05     
            BEQ __d115         ; $d10e: f0 05     
            LDA #$6c           ; $d110: a9 6c     
            JMP __d11f         ; $d112: 4c 1f d1  

;-------------------------------------------------------------------------------
__d115:     LDA $58            ; $d115: a5 58     
            BEQ __d11d         ; $d117: f0 04     
            LDA #$7d           ; $d119: a9 7d     
            STA $3a            ; $d11b: 85 3a     
__d11d:     LDA #$7c           ; $d11d: a9 7c     
__d11f:     STA $02            ; $d11f: 85 02     
            JSR __eae1         ; $d121: 20 e1 ea  
            JSR __eacd         ; $d124: 20 cd ea  
            JSR __f082         ; $d127: 20 82 f0  
            LDA $98            ; $d12a: a5 98     
            CMP #$05           ; $d12c: c9 05     
            BNE __d138         ; $d12e: d0 08     
__d130:     LDA #$ff           ; $d130: a9 ff     
            STA $98            ; $d132: 85 98     
            LDA $3a            ; $d134: a5 3a     
            BEQ __d139         ; $d136: f0 01     
__d138:     RTS                ; $d138: 60        

;-------------------------------------------------------------------------------
__d139:     LDX $52            ; $d139: a6 52     
            JSR __cab9         ; $d13b: 20 b9 ca  
            LDA $55            ; $d13e: a5 55     
            BNE __d14b         ; $d140: d0 09     
            LDA #$01           ; $d142: a9 01     
            STA $4e            ; $d144: 85 4e     
            LDA #$87           ; $d146: a9 87     
            STA $43            ; $d148: 85 43     
            RTS                ; $d14a: 60        

;-------------------------------------------------------------------------------
__d14b:     LDA $51            ; $d14b: a5 51     
            CMP #$1c           ; $d14d: c9 1c     
            BNE __d169         ; $d14f: d0 18     
            LDA $52            ; $d151: a5 52     
            EOR #$01           ; $d153: 49 01     
            TAX                ; $d155: aa        
            STX $52            ; $d156: 86 52     
            LDA $0406,x        ; $d158: bd 06 04  
            BEQ __d166         ; $d15b: f0 09     
            TXA                ; $d15d: 8a        
            EOR #$01           ; $d15e: 49 01     
            TAX                ; $d160: aa        
            STX $52            ; $d161: 86 52     
            JMP __d169         ; $d163: 4c 69 d1  

;-------------------------------------------------------------------------------
__d166:     JSR __caa9         ; $d166: 20 a9 ca  
__d169:     LDA #$87           ; $d169: a9 87     
            STA $43            ; $d16b: 85 43     
            STA $040b          ; $d16d: 8d 0b 04  
            LDA #$00           ; $d170: a9 00     
            STA $4f            ; $d172: 85 4f     
            RTS                ; $d174: 60        

;-------------------------------------------------------------------------------
__d175:     LDA $52            ; $d175: a5 52     
            ASL                ; $d177: 0a        
            TAX                ; $d178: aa        
            LDA $15,x          ; $d179: b5 15     
            AND #$0f           ; $d17b: 29 0f     
            STA $56            ; $d17d: 85 56     
            BEQ __d189         ; $d17f: f0 08     
            LSR                ; $d181: 4a        
            LSR                ; $d182: 4a        
            BNE __d189         ; $d183: d0 04     
            LDA $56            ; $d185: a5 56     
            STA $57            ; $d187: 85 57     
__d189:     LDA $96            ; $d189: a5 96     
            CMP #$01           ; $d18b: c9 01     
            BNE __d199         ; $d18d: d0 0a     
            LDA $15,x          ; $d18f: b5 15     
            AND #$80           ; $d191: 29 80     
            BEQ __d199         ; $d193: f0 04     
            LDA #$04           ; $d195: a9 04     
            STA $96            ; $d197: 85 96     
__d199:     RTS                ; $d199: 60        

;-------------------------------------------------------------------------------
__d19a:     LDA $11            ; $d19a: a5 11     
            AND #$e7           ; $d19c: 29 e7     
            STA $2001          ; $d19e: 8d 01 20  
            STA $11            ; $d1a1: 85 11     
            RTS                ; $d1a3: 60        

;-------------------------------------------------------------------------------
__d1a4:     LDA $96            ; $d1a4: a5 96     
            CMP #$01           ; $d1a6: c9 01     
            BEQ __d1bb         ; $d1a8: f0 11     
__d1aa:     CMP #$02           ; $d1aa: c9 02     
            BEQ __d1c3         ; $d1ac: f0 15     
            CMP #$04           ; $d1ae: c9 04     
            BEQ __d1c6         ; $d1b0: f0 14     
            CMP #$08           ; $d1b2: c9 08     
            BEQ __d1c9         ; $d1b4: f0 13     
            CMP #$0a           ; $d1b6: c9 0a     
            BEQ __d1cc         ; $d1b8: f0 12     
            RTS                ; $d1ba: 60        

;-------------------------------------------------------------------------------
__d1bb:     JSR __d1cf         ; $d1bb: 20 cf d1  
            LDA $96            ; $d1be: a5 96     
            JMP __d1aa         ; $d1c0: 4c aa d1  

;-------------------------------------------------------------------------------
__d1c3:     JMP __d37e         ; $d1c3: 4c 7e d3  

;-------------------------------------------------------------------------------
__d1c6:     JMP __d547         ; $d1c6: 4c 47 d5  

;-------------------------------------------------------------------------------
__d1c9:     JMP __d697         ; $d1c9: 4c 97 d6  

;-------------------------------------------------------------------------------
__d1cc:     JMP __d6c6         ; $d1cc: 4c c6 d6  

;-------------------------------------------------------------------------------
__d1cf:     LDA $56            ; $d1cf: a5 56     
            CMP #$01           ; $d1d1: c9 01     
            BEQ __d1e5         ; $d1d3: f0 10     
            CMP #$02           ; $d1d5: c9 02     
            BEQ __d1e5         ; $d1d7: f0 0c     
            CMP #$04           ; $d1d9: c9 04     
            BEQ __d1e2         ; $d1db: f0 05     
            CMP #$08           ; $d1dd: c9 08     
            BEQ __d1e2         ; $d1df: f0 01     
            RTS                ; $d1e1: 60        

;-------------------------------------------------------------------------------
__d1e2:     JMP __d28b         ; $d1e2: 4c 8b d2  

;-------------------------------------------------------------------------------
__d1e5:     LDA #$db           ; $d1e5: a9 db     
            STA $0a            ; $d1e7: 85 0a     
            LDA #$36           ; $d1e9: a9 36     
            JSR __d9e8         ; $d1eb: 20 e8 d9  
            BNE __d1f3         ; $d1ee: d0 03     
            JMP __d275         ; $d1f0: 4c 75 d2  

;-------------------------------------------------------------------------------
__d1f3:     JSR __d990         ; $d1f3: 20 90 d9  
            BEQ __d1f9         ; $d1f6: f0 01     
            RTS                ; $d1f8: 60        

;-------------------------------------------------------------------------------
__d1f9:     LDA $56            ; $d1f9: a5 56     
            CMP #$02           ; $d1fb: c9 02     
            BEQ __d205         ; $d1fd: f0 06     
            INC $0203          ; $d1ff: ee 03 02  
            JMP __d208         ; $d202: 4c 08 d2  

;-------------------------------------------------------------------------------
__d205:     DEC $0203          ; $d205: ce 03 02  
__d208:     JSR __d2cb         ; $d208: 20 cb d2  
            STA $5a            ; $d20b: 85 5a     
            LDA $0200          ; $d20d: ad 00 02  
            JSR __e016         ; $d210: 20 16 e0  
            STA $59            ; $d213: 85 59     
            JSR __d8eb         ; $d215: 20 eb d8  
            BEQ __d233         ; $d218: f0 19     
            LDX $53            ; $d21a: a6 53     
            CPX #$01           ; $d21c: e0 01     
            BNE __d227         ; $d21e: d0 07     
            CLC                ; $d220: 18        
            ADC $0200          ; $d221: 6d 00 02  
            STA $0200          ; $d224: 8d 00 02  
__d227:     JSR __d36a         ; $d227: 20 6a d3  
            CMP #$00           ; $d22a: c9 00     
            BEQ __d233         ; $d22c: f0 05     
            LDA #$08           ; $d22e: a9 08     
            STA $96            ; $d230: 85 96     
            RTS                ; $d232: 60        

;-------------------------------------------------------------------------------
__d233:     LDA $9b            ; $d233: a5 9b     
            BNE __d23e         ; $d235: d0 07     
            LDA #$01           ; $d237: a9 01     
            STA $9b            ; $d239: 85 9b     
            JMP __d275         ; $d23b: 4c 75 d2  

;-------------------------------------------------------------------------------
__d23e:     LDA #$08           ; $d23e: a9 08     
            STA $ff            ; $d240: 85 ff     
            LDA #$00           ; $d242: a9 00     
            STA $9b            ; $d244: 85 9b     
            LDA $97            ; $d246: a5 97     
            BEQ __d262         ; $d248: f0 18     
            CMP #$08           ; $d24a: c9 08     
            BEQ __d26d         ; $d24c: f0 1f     
            LDA #$04           ; $d24e: a9 04     
            STA $97            ; $d250: 85 97     
            LDA $85            ; $d252: a5 85     
            BEQ __d25b         ; $d254: f0 05     
            LDA #$00           ; $d256: a9 00     
            JMP __d25d         ; $d258: 4c 5d d2  

;-------------------------------------------------------------------------------
__d25b:     LDA #$08           ; $d25b: a9 08     
__d25d:     STA $97            ; $d25d: 85 97     
            JMP __d275         ; $d25f: 4c 75 d2  

;-------------------------------------------------------------------------------
__d262:     LDA #$04           ; $d262: a9 04     
            STA $97            ; $d264: 85 97     
            LDA #$00           ; $d266: a9 00     
            STA $85            ; $d268: 85 85     
            JMP __d275         ; $d26a: 4c 75 d2  

;-------------------------------------------------------------------------------
__d26d:     LDA #$04           ; $d26d: a9 04     
            STA $97            ; $d26f: 85 97     
            LDA #$01           ; $d271: a9 01     
            STA $85            ; $d273: 85 85     
__d275:     JSR __eae1         ; $d275: 20 e1 ea  
            LDA $97            ; $d278: a5 97     
            STA $02            ; $d27a: 85 02     
            JSR __eacd         ; $d27c: 20 cd ea  
            LDA $56            ; $d27f: a5 56     
            CMP #$02           ; $d281: c9 02     
            BEQ __d288         ; $d283: f0 03     
            JMP __f082         ; $d285: 4c 82 f0  

;-------------------------------------------------------------------------------
__d288:     JMP __f088         ; $d288: 4c 88 f0  

;-------------------------------------------------------------------------------
__d28b:     JSR __eae1         ; $d28b: 20 e1 ea  
            LDA #$86           ; $d28e: a9 86     
            STA $02            ; $d290: 85 02     
            LDA #$c1           ; $d292: a9 c1     
            STA $03            ; $d294: 85 03     
            JSR __efeb         ; $d296: 20 eb ef  
            LDA $53            ; $d299: a5 53     
            SEC                ; $d29b: 38        
            SBC #$01           ; $d29c: e9 01     
            ASL                ; $d29e: 0a        
            TAX                ; $d29f: aa        
            LDA __c47b,x       ; $d2a0: bd 7b c4  
            STA $04            ; $d2a3: 85 04     
            LDA __c47c,x       ; $d2a5: bd 7c c4  
            STA $05            ; $d2a8: 85 05     
            LDA __c483,x       ; $d2aa: bd 83 c4  
            STA $06            ; $d2ad: 85 06     
            LDA __c484,x       ; $d2af: bd 84 c4  
            STA $07            ; $d2b2: 85 07     
            JSR __d8ad         ; $d2b4: 20 ad d8  
            BEQ __d2ca         ; $d2b7: f0 11     
            LDA $00            ; $d2b9: a5 00     
            SEC                ; $d2bb: 38        
            SBC #$04           ; $d2bc: e9 04     
            STA $a1            ; $d2be: 85 a1     
            LDA #$02           ; $d2c0: a9 02     
            STA $96            ; $d2c2: 85 96     
            LDA #$00           ; $d2c4: a9 00     
            STA $5b            ; $d2c6: 85 5b     
            STA $5c            ; $d2c8: 85 5c     
__d2ca:     RTS                ; $d2ca: 60        

;-------------------------------------------------------------------------------
__d2cb:     JSR __eae1         ; $d2cb: 20 e1 ea  
            LDA $96            ; $d2ce: a5 96     
            CMP #$04           ; $d2d0: c9 04     
            BEQ __d2dd         ; $d2d2: f0 09     
            CMP #$08           ; $d2d4: c9 08     
            BEQ __d2dd         ; $d2d6: f0 05     
            LDA #$2c           ; $d2d8: a9 2c     
            JMP __d2df         ; $d2da: 4c df d2  

;-------------------------------------------------------------------------------
__d2dd:     LDA #$4a           ; $d2dd: a9 4a     
__d2df:     JSR __efe8         ; $d2df: 20 e8 ef  
            LDA $53            ; $d2e2: a5 53     
            CMP #$01           ; $d2e4: c9 01     
            BEQ __d2f0         ; $d2e6: f0 08     
            SEC                ; $d2e8: 38        
            SBC #$01           ; $d2e9: e9 01     
            ASL                ; $d2eb: 0a        
            TAX                ; $d2ec: aa        
            JMP __d2fd         ; $d2ed: 4c fd d2  

;-------------------------------------------------------------------------------
__d2f0:     LDA #$1a           ; $d2f0: a9 1a     
            JSR __c831         ; $d2f2: 20 31 c8  
            JSR __d91a         ; $d2f5: 20 1a d9  
            STA $0c            ; $d2f8: 85 0c     
            JMP __d323         ; $d2fa: 4c 23 d3  

;-------------------------------------------------------------------------------
__d2fd:     LDA __c46b,x       ; $d2fd: bd 6b c4  
            STA $04            ; $d300: 85 04     
            LDA __c46c,x       ; $d302: bd 6c c4  
            STA $05            ; $d305: 85 05     
            LDA __c473,x       ; $d307: bd 73 c4  
            STA $06            ; $d30a: 85 06     
            LDA __c474,x       ; $d30c: bd 74 c4  
            STA $07            ; $d30f: 85 07     
            JSR __d8ad         ; $d311: 20 ad d8  
            STA $0c            ; $d314: 85 0c     
            BNE __d323         ; $d316: d0 0b     
            LDA $53            ; $d318: a5 53     
            CMP #$03           ; $d31a: c9 03     
            BNE __d323         ; $d31c: d0 05     
            JSR __d326         ; $d31e: 20 26 d3  
            STA $0c            ; $d321: 85 0c     
__d323:     LDA $0c            ; $d323: a5 0c     
            RTS                ; $d325: 60        

;-------------------------------------------------------------------------------
__d326:     LDA #$2a           ; $d326: a9 2a     
            JSR __c847         ; $d328: 20 47 c8  
            LDA #$00           ; $d32b: a9 00     
            STA $d2            ; $d32d: 85 d2     
__d32f:     LDA $d2            ; $d32f: a5 d2     
            CMP #$06           ; $d331: c9 06     
            BEQ __d365         ; $d333: f0 30     
            TAX                ; $d335: aa        
            LDY __c2cc,x       ; $d336: bc cc c2  
            LDA $0200,y        ; $d339: b9 00 02  
            CMP #$ff           ; $d33c: c9 ff     
            BEQ __d34e         ; $d33e: f0 0e     
            STA $01            ; $d340: 85 01     
            LDA $0203,y        ; $d342: b9 03 02  
            STA $00            ; $d345: 85 00     
            JSR __efef         ; $d347: 20 ef ef  
            CMP #$01           ; $d34a: c9 01     
            BEQ __d353         ; $d34c: f0 05     
__d34e:     INC $d2            ; $d34e: e6 d2     
            JMP __d32f         ; $d350: 4c 2f d3  

;-------------------------------------------------------------------------------
__d353:     LDA $d2            ; $d353: a5 d2     
            CMP #$03           ; $d355: c9 03     
            BCS __d35e         ; $d357: b0 05     
            LDA #$01           ; $d359: a9 01     
            JMP __d360         ; $d35b: 4c 60 d3  

;-------------------------------------------------------------------------------
__d35e:     LDA #$02           ; $d35e: a9 02     
__d360:     STA $da            ; $d360: 85 da     
            LDA #$01           ; $d362: a9 01     
            RTS                ; $d364: 60        

;-------------------------------------------------------------------------------
__d365:     LDA #$00           ; $d365: a9 00     
            STA $da            ; $d367: 85 da     
            RTS                ; $d369: 60        

;-------------------------------------------------------------------------------
__d36a:     LDA $53            ; $d36a: a5 53     
            CMP #$01           ; $d36c: c9 01     
            BEQ __d373         ; $d36e: f0 03     
            JMP __d37b         ; $d370: 4c 7b d3  

;-------------------------------------------------------------------------------
__d373:     LDA #$1c           ; $d373: a9 1c     
            JSR __c831         ; $d375: 20 31 c8  
            JMP __d8ad         ; $d378: 4c ad d8  

;-------------------------------------------------------------------------------
__d37b:     LDA #$01           ; $d37b: a9 01     
            RTS                ; $d37d: 60        

;-------------------------------------------------------------------------------
__d37e:     LDA $56            ; $d37e: a5 56     
            CMP #$08           ; $d380: c9 08     
            BEQ __d38e         ; $d382: f0 0a     
            CMP #$04           ; $d384: c9 04     
            BEQ __d38b         ; $d386: f0 03     
            JMP __d4cf         ; $d388: 4c cf d4  

;-------------------------------------------------------------------------------
__d38b:     JMP __d432         ; $d38b: 4c 32 d4  

;-------------------------------------------------------------------------------
__d38e:     LDA $5a            ; $d38e: a5 5a     
            BEQ __d39c         ; $d390: f0 0a     
            JSR __eae1         ; $d392: 20 e1 ea  
            DEC $01            ; $d395: c6 01     
            JSR __d50a         ; $d397: 20 0a d5  
            BNE __d3cd         ; $d39a: d0 31     
__d39c:     LDA #$24           ; $d39c: a9 24     
            STA $0a            ; $d39e: 85 0a     
            LDA #$49           ; $d3a0: a9 49     
            JSR __d9e8         ; $d3a2: 20 e8 d9  
            BNE __d3af         ; $d3a5: d0 08     
            LDA $0200          ; $d3a7: ad 00 02  
            STA $01            ; $d3aa: 85 01     
            JMP __d4cf         ; $d3ac: 4c cf d4  

;-------------------------------------------------------------------------------
__d3af:     JSR __d50a         ; $d3af: 20 0a d5  
            BEQ __d3e7         ; $d3b2: f0 33     
            CMP #$02           ; $d3b4: c9 02     
            BNE __d3bb         ; $d3b6: d0 03     
            JMP __d4cf         ; $d3b8: 4c cf d4  

;-------------------------------------------------------------------------------
__d3bb:     LDA $5b            ; $d3bb: a5 5b     
            BEQ __d3d0         ; $d3bd: f0 11     
            CLC                ; $d3bf: 18        
            ADC #$01           ; $d3c0: 69 01     
            CMP #$10           ; $d3c2: c9 10     
            BEQ __d3d2         ; $d3c4: f0 0c     
            BCC __d3d2         ; $d3c6: 90 0a     
            LDA #$10           ; $d3c8: a9 10     
            JMP __d3d2         ; $d3ca: 4c d2 d3  

;-------------------------------------------------------------------------------
__d3cd:     JMP __d4cf         ; $d3cd: 4c cf d4  

;-------------------------------------------------------------------------------
__d3d0:     LDA #$01           ; $d3d0: a9 01     
__d3d2:     STA $5b            ; $d3d2: 85 5b     
            TAX                ; $d3d4: aa        
            DEX                ; $d3d5: ca        
            LDA __c147,x       ; $d3d6: bd 47 c1  
            STA $02            ; $d3d9: 85 02     
            LDA #$00           ; $d3db: a9 00     
            STA $5a            ; $d3dd: 85 5a     
            STA $5c            ; $d3df: 85 5c     
            JSR __d4ee         ; $d3e1: 20 ee d4  
            JMP __d40d         ; $d3e4: 4c 0d d4  

;-------------------------------------------------------------------------------
__d3e7:     LDA $5c            ; $d3e7: a5 5c     
            BEQ __d3f9         ; $d3e9: f0 0e     
            CLC                ; $d3eb: 18        
            ADC #$01           ; $d3ec: 69 01     
            CMP #$06           ; $d3ee: c9 06     
            BEQ __d3fb         ; $d3f0: f0 09     
            BCC __d3fb         ; $d3f2: 90 07     
            LDA #$01           ; $d3f4: a9 01     
            JMP __d3fb         ; $d3f6: 4c fb d3  

;-------------------------------------------------------------------------------
__d3f9:     LDA #$02           ; $d3f9: a9 02     
__d3fb:     STA $5c            ; $d3fb: 85 5c     
            TAX                ; $d3fd: aa        
            DEX                ; $d3fe: ca        
            LDA __c159,x       ; $d3ff: bd 59 c1  
            STA $02            ; $d402: 85 02     
            LDA #$00           ; $d404: a9 00     
            STA $5a            ; $d406: 85 5a     
            STA $5b            ; $d408: 85 5b     
            JSR __d4ee         ; $d40a: 20 ee d4  
__d40d:     LDA $a1            ; $d40d: a5 a1     
            STA $00            ; $d40f: 85 00     
            STA $0203          ; $d411: 8d 03 02  
            JSR __ead1         ; $d414: 20 d1 ea  
            LDA #$00           ; $d417: a9 00     
            STA $04            ; $d419: 85 04     
            LDA $02            ; $d41b: a5 02     
            CMP #$54           ; $d41d: c9 54     
            BEQ __d426         ; $d41f: f0 05     
            LDA #$00           ; $d421: a9 00     
            JMP __d42c         ; $d423: 4c 2c d4  

;-------------------------------------------------------------------------------
__d426:     LDA #$24           ; $d426: a9 24     
            STA $02            ; $d428: 85 02     
            LDA #$01           ; $d42a: a9 01     
__d42c:     JSR __f096         ; $d42c: 20 96 f0  
            JMP __d4cf         ; $d42f: 4c cf d4  

;-------------------------------------------------------------------------------
__d432:     LDA $5a            ; $d432: a5 5a     
            BEQ __d445         ; $d434: f0 0f     
            JSR __eae1         ; $d436: 20 e1 ea  
            INC $01            ; $d439: e6 01     
            JSR __d50a         ; $d43b: 20 0a d5  
            CMP #$01           ; $d43e: c9 01     
            BEQ __d445         ; $d440: f0 03     
            JMP __d4cf         ; $d442: 4c cf d4  

;-------------------------------------------------------------------------------
__d445:     LDA #$24           ; $d445: a9 24     
            STA $0a            ; $d447: 85 0a     
            LDA #$49           ; $d449: a9 49     
            STA $0b            ; $d44b: 85 0b     
            JSR __d9e6         ; $d44d: 20 e6 d9  
            BNE __d45a         ; $d450: d0 08     
            LDA $0200          ; $d452: ad 00 02  
            STA $01            ; $d455: 85 01     
            JMP __d4cf         ; $d457: 4c cf d4  

;-------------------------------------------------------------------------------
__d45a:     JSR __d50a         ; $d45a: 20 0a d5  
            BEQ __d48b         ; $d45d: f0 2c     
            CMP #$02           ; $d45f: c9 02     
            BEQ __d48b         ; $d461: f0 28     
            LDA $5b            ; $d463: a5 5b     
            BEQ __d471         ; $d465: f0 0a     
            SEC                ; $d467: 38        
            SBC #$01           ; $d468: e9 01     
            CMP #$01           ; $d46a: c9 01     
            BCC __d476         ; $d46c: 90 08     
            JMP __d478         ; $d46e: 4c 78 d4  

;-------------------------------------------------------------------------------
__d471:     LDA #$0d           ; $d471: a9 0d     
            JMP __d478         ; $d473: 4c 78 d4  

;-------------------------------------------------------------------------------
__d476:     LDA #$01           ; $d476: a9 01     
__d478:     STA $5b            ; $d478: 85 5b     
            TAX                ; $d47a: aa        
            DEX                ; $d47b: ca        
            LDA __c147,x       ; $d47c: bd 47 c1  
            STA $02            ; $d47f: 85 02     
            LDA #$03           ; $d481: a9 03     
            STA $5c            ; $d483: 85 5c     
            JSR __d4f9         ; $d485: 20 f9 d4  
            JMP __d4b1         ; $d488: 4c b1 d4  

;-------------------------------------------------------------------------------
__d48b:     LDA $5c            ; $d48b: a5 5c     
            BEQ __d49d         ; $d48d: f0 0e     
            CLC                ; $d48f: 18        
            ADC #$01           ; $d490: 69 01     
            CMP #$06           ; $d492: c9 06     
            BEQ __d49f         ; $d494: f0 09     
            BCC __d49f         ; $d496: 90 07     
            LDA #$01           ; $d498: a9 01     
            JMP __d49f         ; $d49a: 4c 9f d4  

;-------------------------------------------------------------------------------
__d49d:     LDA #$01           ; $d49d: a9 01     
__d49f:     STA $5c            ; $d49f: 85 5c     
            SEC                ; $d4a1: 38        
            SBC #$01           ; $d4a2: e9 01     
            TAX                ; $d4a4: aa        
            LDA __c159,x       ; $d4a5: bd 59 c1  
            STA $02            ; $d4a8: 85 02     
            LDA #$00           ; $d4aa: a9 00     
            STA $5b            ; $d4ac: 85 5b     
            JSR __d4f9         ; $d4ae: 20 f9 d4  
__d4b1:     LDA $a1            ; $d4b1: a5 a1     
            STA $0203          ; $d4b3: 8d 03 02  
            STA $00            ; $d4b6: 85 00     
            JSR __eacd         ; $d4b8: 20 cd ea  
            LDA $02            ; $d4bb: a5 02     
            CMP #$54           ; $d4bd: c9 54     
            BEQ __d4c6         ; $d4bf: f0 05     
            LDA #$00           ; $d4c1: a9 00     
            JMP __d4cc         ; $d4c3: 4c cc d4  

;-------------------------------------------------------------------------------
__d4c6:     LDA #$24           ; $d4c6: a9 24     
            STA $02            ; $d4c8: 85 02     
            LDA #$01           ; $d4ca: a9 01     
__d4cc:     JSR __f096         ; $d4cc: 20 96 f0  
__d4cf:     JSR __d2cb         ; $d4cf: 20 cb d2  
            STA $5a            ; $d4d2: 85 5a     
            BEQ __d4ed         ; $d4d4: f0 17     
            LDA $0200          ; $d4d6: ad 00 02  
            CLC                ; $d4d9: 18        
            ADC #$08           ; $d4da: 69 08     
            JSR __e016         ; $d4dc: 20 16 e0  
            STA $59            ; $d4df: 85 59     
            LDA #$01           ; $d4e1: a9 01     
            STA $96            ; $d4e3: 85 96     
            LDA #$00           ; $d4e5: a9 00     
            STA $5c            ; $d4e7: 85 5c     
            STA $5b            ; $d4e9: 85 5b     
            STA $85            ; $d4eb: 85 85     
__d4ed:     RTS                ; $d4ed: 60        

;-------------------------------------------------------------------------------
__d4ee:     LDA $0200          ; $d4ee: ad 00 02  
            SEC                ; $d4f1: 38        
            SBC #$01           ; $d4f2: e9 01     
            STA $01            ; $d4f4: 85 01     
            JMP __d501         ; $d4f6: 4c 01 d5  

;-------------------------------------------------------------------------------
__d4f9:     LDA $0200          ; $d4f9: ad 00 02  
            CLC                ; $d4fc: 18        
            ADC #$01           ; $d4fd: 69 01     
            STA $01            ; $d4ff: 85 01     
__d501:     AND #$06           ; $d501: 29 06     
            BNE __d509         ; $d503: d0 04     
            LDA #$08           ; $d505: a9 08     
            STA $ff            ; $d507: 85 ff     
__d509:     RTS                ; $d509: 60        

;-------------------------------------------------------------------------------
__d50a:     JSR __eae1         ; $d50a: 20 e1 ea  
            LDA #$2c           ; $d50d: a9 2c     
            JSR __efe8         ; $d50f: 20 e8 ef  
            LDA $53            ; $d512: a5 53     
            SEC                ; $d514: 38        
            SBC #$01           ; $d515: e9 01     
            ASL                ; $d517: 0a        
            TAX                ; $d518: aa        
            LDA __c48b,x       ; $d519: bd 8b c4  
            STA $04            ; $d51c: 85 04     
            LDA __c48c,x       ; $d51e: bd 8c c4  
            STA $05            ; $d521: 85 05     
            LDA #$43           ; $d523: a9 43     
            STA $06            ; $d525: 85 06     
            LDA #$c1           ; $d527: a9 c1     
            STA $07            ; $d529: 85 07     
            JSR __d8ad         ; $d52b: 20 ad d8  
            STA $08            ; $d52e: 85 08     
            LDA $53            ; $d530: a5 53     
            CMP #$01           ; $d532: c9 01     
            BNE __d544         ; $d534: d0 0e     
            LDA #$1e           ; $d536: a9 1e     
            JSR __c831         ; $d538: 20 31 c8  
            JSR __d8ad         ; $d53b: 20 ad d8  
            BEQ __d544         ; $d53e: f0 04     
            LDA #$02           ; $d540: a9 02     
            STA $08            ; $d542: 85 08     
__d544:     LDA $08            ; $d544: a5 08     
            RTS                ; $d546: 60        

;-------------------------------------------------------------------------------
__d547:     LDA #$ff           ; $d547: a9 ff     
            JSR __d9e6         ; $d549: 20 e6 d9  
            CMP #$00           ; $d54c: c9 00     
            BNE __d551         ; $d54e: d0 01     
            RTS                ; $d550: 60        

;-------------------------------------------------------------------------------
__d551:     LDA $94            ; $d551: a5 94     
            CMP #$f0           ; $d553: c9 f0     
            BCC __d55a         ; $d555: 90 03     
            JMP __d60d         ; $d557: 4c 0d d6  

;-------------------------------------------------------------------------------
__d55a:     JSR __d990         ; $d55a: 20 90 d9  
            BEQ __d570         ; $d55d: f0 11     
            LDA $56            ; $d55f: a5 56     
            CMP #$01           ; $d561: c9 01     
            BNE __d56a         ; $d563: d0 05     
            LDA #$02           ; $d565: a9 02     
            JMP __d56c         ; $d567: 4c 6c d5  

;-------------------------------------------------------------------------------
__d56a:     LDA #$01           ; $d56a: a9 01     
__d56c:     STA $56            ; $d56c: 85 56     
            STA $57            ; $d56e: 85 57     
__d570:     LDA $0200          ; $d570: ad 00 02  
            STA $01            ; $d573: 85 01     
            LDA #$00           ; $d575: a9 00     
            JSR __ef72         ; $d577: 20 72 ef  
            LDA $01            ; $d57a: a5 01     
            STA $0200          ; $d57c: 8d 00 02  
            LDA $56            ; $d57f: a5 56     
            CMP #$01           ; $d581: c9 01     
            BEQ __d58c         ; $d583: f0 07     
            CMP #$02           ; $d585: c9 02     
            BEQ __d5a1         ; $d587: f0 18     
            JMP __d5b3         ; $d589: 4c b3 d5  

;-------------------------------------------------------------------------------
__d58c:     LDA $9e            ; $d58c: a5 9e     
            BEQ __d59a         ; $d58e: f0 0a     
            INC $0203          ; $d590: ee 03 02  
            LDA #$00           ; $d593: a9 00     
            STA $9e            ; $d595: 85 9e     
            JMP __d5b3         ; $d597: 4c b3 d5  

;-------------------------------------------------------------------------------
__d59a:     LDA #$01           ; $d59a: a9 01     
            STA $9e            ; $d59c: 85 9e     
            JMP __d5b3         ; $d59e: 4c b3 d5  

;-------------------------------------------------------------------------------
__d5a1:     LDA $9e            ; $d5a1: a5 9e     
            BEQ __d5af         ; $d5a3: f0 0a     
            DEC $0203          ; $d5a5: ce 03 02  
            LDA #$00           ; $d5a8: a9 00     
            STA $9e            ; $d5aa: 85 9e     
            JMP __d5b3         ; $d5ac: 4c b3 d5  

;-------------------------------------------------------------------------------
__d5af:     LDA #$01           ; $d5af: a9 01     
            STA $9e            ; $d5b1: 85 9e     
__d5b3:     LDA $0203          ; $d5b3: ad 03 02  
            STA $00            ; $d5b6: 85 00     
            JSR __d800         ; $d5b8: 20 00 d8  
            LDA $94            ; $d5bb: a5 94     
            BEQ __d5e2         ; $d5bd: f0 23     
            LDA $01            ; $d5bf: a5 01     
            SEC                ; $d5c1: 38        
            SBC #$10           ; $d5c2: e9 10     
            CMP $95            ; $d5c4: c5 95     
            BCC __d5cc         ; $d5c6: 90 04     
            LDA #$ff           ; $d5c8: a9 ff     
            STA $95            ; $d5ca: 85 95     
__d5cc:     JSR __d2cb         ; $d5cc: 20 cb d2  
            STA $5a            ; $d5cf: 85 5a     
            BEQ __d5f1         ; $d5d1: f0 1e     
            .hex a5            ; $d5d3: a5        Suspected data
__d5d4:     .hex 4b 38         ; $d5d4: 4b 38     Invalid Opcode - ALR #$38
            SBC #$11           ; $d5d6: e9 11     
            STA $0200          ; $d5d8: 8d 00 02  
            LDA #$01           ; $d5db: a9 01     
            STA $5a            ; $d5dd: 85 5a     
            JMP __d5f6         ; $d5df: 4c f6 d5  

;-------------------------------------------------------------------------------
__d5e2:     LDA #$04           ; $d5e2: a9 04     
            STA $ff            ; $d5e4: 85 ff     
            LDA #$01           ; $d5e6: a9 01     
            STA $94            ; $d5e8: 85 94     
            LDA $01            ; $d5ea: a5 01     
            STA $95            ; $d5ec: 85 95     
            JMP __d5f1         ; $d5ee: 4c f1 d5  

;-------------------------------------------------------------------------------
__d5f1:     LDA #$28           ; $d5f1: a9 28     
            JMP __f070         ; $d5f3: 4c 70 f0  

;-------------------------------------------------------------------------------
__d5f6:     JSR __eae1         ; $d5f6: 20 e1 ea  
            LDA #$2c           ; $d5f9: a9 2c     
            STA $02            ; $d5fb: 85 02     
            JSR __eacd         ; $d5fd: 20 cd ea  
            LDA $57            ; $d600: a5 57     
            AND #$03           ; $d602: 29 03     
            LSR                ; $d604: 4a        
            JSR __f096         ; $d605: 20 96 f0  
            LDA #$f0           ; $d608: a9 f0     
            STA $94            ; $d60a: 85 94     
            RTS                ; $d60c: 60        

;-------------------------------------------------------------------------------
__d60d:     INC $94            ; $d60d: e6 94     
            LDA $94            ; $d60f: a5 94     
            CMP #$f4           ; $d611: c9 f4     
            BNE __d64f         ; $d613: d0 3a     
            LDA $95            ; $d615: a5 95     
            CMP #$ff           ; $d617: c9 ff     
            BEQ __d642         ; $d619: f0 27     
            LDA #$04           ; $d61b: a9 04     
            JSR __f070         ; $d61d: 20 70 f0  
            LDA #$00           ; $d620: a9 00     
            STA $042c          ; $d622: 8d 2c 04  
            STA $94            ; $d625: 85 94     
            STA $95            ; $d627: 85 95     
            LDA #$01           ; $d629: a9 01     
            STA $96            ; $d62b: 85 96     
            LDA $a0            ; $d62d: a5 a0     
            BEQ __d64f         ; $d62f: f0 1e     
            LDA #$01           ; $d631: a9 01     
            STA $9f            ; $d633: 85 9f     
            LDA #$4b           ; $d635: a9 4b     
            STA $3f            ; $d637: 85 3f     
            LDA #$0a           ; $d639: a9 0a     
            STA $96            ; $d63b: 85 96     
            LDA #$40           ; $d63d: a9 40     
            STA $fc            ; $d63f: 85 fc     
            RTS                ; $d641: 60        

;-------------------------------------------------------------------------------
__d642:     LDA #$00           ; $d642: a9 00     
            STA $042c          ; $d644: 8d 2c 04  
            STA $94            ; $d647: 85 94     
            STA $95            ; $d649: 85 95     
            LDA #$ff           ; $d64b: a9 ff     
            STA $96            ; $d64d: 85 96     
__d64f:     RTS                ; $d64f: 60        

;-------------------------------------------------------------------------------
            LDA #$fe           ; $d650: a9 fe     
            STA $0472          ; $d652: 8d 72 04  
            STA $0473          ; $d655: 8d 73 04  
            LDX #$00           ; $d658: a2 00     
            LDY #$60           ; $d65a: a0 60     
__d65c:     LDA $0200,y        ; $d65c: b9 00 02  
            CMP #$ff           ; $d65f: c9 ff     
            BEQ __d672         ; $d661: f0 0f     
            STA $0461,x        ; $d663: 9d 61 04  
            LDA $0203,y        ; $d666: b9 03 02  
            SEC                ; $d669: 38        
            SBC #$08           ; $d66a: e9 08     
            STA $0460,x        ; $d66c: 9d 60 04  
            JMP __d67a         ; $d66f: 4c 7a d6  

;-------------------------------------------------------------------------------
__d672:     LDA #$00           ; $d672: a9 00     
            STA $0461,x        ; $d674: 9d 61 04  
            STA $0460,x        ; $d677: 9d 60 04  
__d67a:     TYA                ; $d67a: 98        
            CLC                ; $d67b: 18        
            ADC #$08           ; $d67c: 69 08     
            TAY                ; $d67e: a8        
            INX                ; $d67f: e8        
            INX                ; $d680: e8        
            INX                ; $d681: e8        
            CPY #$90           ; $d682: c0 90     
            BNE __d65c         ; $d684: d0 d6     
            LDA #$20           ; $d686: a9 20     
            JSR __c831         ; $d688: 20 31 c8  
            JSR __d8ad         ; $d68b: 20 ad d8  
            BEQ __d696         ; $d68e: f0 06     
            LDA #$08           ; $d690: a9 08     
            STA $96            ; $d692: 85 96     
            LDA #$01           ; $d694: a9 01     
__d696:     RTS                ; $d696: 60        

;-------------------------------------------------------------------------------
__d697:     LDA #$ff           ; $d697: a9 ff     
            JSR __d9e6         ; $d699: 20 e6 d9  
            BEQ __d6c5         ; $d69c: f0 27     
            JSR __eae1         ; $d69e: 20 e1 ea  
            INC $01            ; $d6a1: e6 01     
            INC $01            ; $d6a3: e6 01     
            LDA $57            ; $d6a5: a5 57     
            CMP #$02           ; $d6a7: c9 02     
            BEQ __d6b1         ; $d6a9: f0 06     
            LDA $0201          ; $d6ab: ad 01 02  
            JMP __d6b7         ; $d6ae: 4c b7 d6  

;-------------------------------------------------------------------------------
__d6b1:     LDA $0201          ; $d6b1: ad 01 02  
            SEC                ; $d6b4: 38        
            SBC #$02           ; $d6b5: e9 02     
__d6b7:     STA $02            ; $d6b7: 85 02     
            JSR __f075         ; $d6b9: 20 75 f0  
            JSR __d2cb         ; $d6bc: 20 cb d2  
            BEQ __d6c5         ; $d6bf: f0 04     
            LDA #$ff           ; $d6c1: a9 ff     
            STA $96            ; $d6c3: 85 96     
__d6c5:     RTS                ; $d6c5: 60        

;-------------------------------------------------------------------------------
__d6c6:     LDA $3f            ; $d6c6: a5 3f     
            BNE __d6cd         ; $d6c8: d0 03     
            JMP __d7bf         ; $d6ca: 4c bf d7  

;-------------------------------------------------------------------------------
__d6cd:     LDA #$db           ; $d6cd: a9 db     
            STA $0a            ; $d6cf: 85 0a     
            LDA #$36           ; $d6d1: a9 36     
            JSR __d9e8         ; $d6d3: 20 e8 d9  
            BNE __d6d9         ; $d6d6: d0 01     
            RTS                ; $d6d8: 60        

;-------------------------------------------------------------------------------
__d6d9:     JSR __d990         ; $d6d9: 20 90 d9  
            BNE __d6e8         ; $d6dc: d0 0a     
            .hex a5            ; $d6de: a5        Suspected data
__d6df:     LSR $c9,x          ; $d6df: 56 c9     
            ORA ($f0,x)        ; $d6e1: 01 f0     
            ROL $c9            ; $d6e3: 26 c9     
            .hex 02            ; $d6e5: 02        Invalid Opcode - KIL 
            BEQ __d710         ; $d6e6: f0 28     
__d6e8:     LDA $a2            ; $d6e8: a5 a2     
            ASL                ; $d6ea: 0a        
            STA $a2            ; $d6eb: 85 a2     
            BEQ __d6f2         ; $d6ed: f0 03     
            JMP __d753         ; $d6ef: 4c 53 d7  

;-------------------------------------------------------------------------------
__d6f2:     LDA #$20           ; $d6f2: a9 20     
            STA $a2            ; $d6f4: 85 a2     
            LDA $9f            ; $d6f6: a5 9f     
            BEQ __d6fe         ; $d6f8: f0 04     
            CMP #$04           ; $d6fa: c9 04     
            BCC __d703         ; $d6fc: 90 05     
__d6fe:     LDA #$02           ; $d6fe: a9 02     
            JMP __d705         ; $d700: 4c 05 d7  

;-------------------------------------------------------------------------------
__d703:     LDA #$05           ; $d703: a9 05     
__d705:     STA $9f            ; $d705: 85 9f     
            JMP __d753         ; $d707: 4c 53 d7  

;-------------------------------------------------------------------------------
            INC $0203          ; $d70a: ee 03 02  
            JMP __d713         ; $d70d: 4c 13 d7  

;-------------------------------------------------------------------------------
__d710:     DEC $0203          ; $d710: ce 03 02  
__d713:     JSR __d2cb         ; $d713: 20 cb d2  
            STA $5a            ; $d716: 85 5a     
            LDA $0200          ; $d718: ad 00 02  
            JSR __e016         ; $d71b: 20 16 e0  
            STA $59            ; $d71e: 85 59     
            JSR __d8eb         ; $d720: 20 eb d8  
            BEQ __d73e         ; $d723: f0 19     
            LDX $53            ; $d725: a6 53     
            CPX #$01           ; $d727: e0 01     
            BNE __d732         ; $d729: d0 07     
            CLC                ; $d72b: 18        
            ADC $0200          ; $d72c: 6d 00 02  
            STA $0200          ; $d72f: 8d 00 02  
__d732:     JSR __d36a         ; $d732: 20 6a d3  
            BEQ __d73e         ; $d735: f0 07     
            LDA #$08           ; $d737: a9 08     
            STA $96            ; $d739: 85 96     
            JMP __d7bf         ; $d73b: 4c bf d7  

;-------------------------------------------------------------------------------
__d73e:     LDA #$08           ; $d73e: a9 08     
            STA $ff            ; $d740: 85 ff     
            LDA $9f            ; $d742: a5 9f     
            BEQ __d74f         ; $d744: f0 09     
            CMP #$06           ; $d746: c9 06     
            BCS __d74f         ; $d748: b0 05     
            INC $9f            ; $d74a: e6 9f     
            JMP __d753         ; $d74c: 4c 53 d7  

;-------------------------------------------------------------------------------
__d74f:     LDA #$01           ; $d74f: a9 01     
            STA $9f            ; $d751: 85 9f     
__d753:     LDX $9f            ; $d753: a6 9f     
            DEX                ; $d755: ca        
            LDA __c1a2,x       ; $d756: bd a2 c1  
            JSR __f070         ; $d759: 20 70 f0  
            LDA $9f            ; $d75c: a5 9f     
            LSR                ; $d75e: 4a        
            LSR                ; $d75f: 4a        
            BEQ __d767         ; $d760: f0 05     
            LDA #$00           ; $d762: a9 00     
            JMP __d769         ; $d764: 4c 69 d7  

;-------------------------------------------------------------------------------
__d767:     LDA #$01           ; $d767: a9 01     
__d769:     BEQ __d786         ; $d769: f0 1b     
            LDA #$04           ; $d76b: a9 04     
            CLC                ; $d76d: 18        
            ADC $0203          ; $d76e: 6d 03 02  
            STA $00            ; $d771: 85 00     
            LDA $0200          ; $d773: ad 00 02  
            SEC                ; $d776: 38        
            SBC #$0e           ; $d777: e9 0e     
            STA $01            ; $d779: 85 01     
            LDA #$21           ; $d77b: a9 21     
            STA $03            ; $d77d: 85 03     
            LDA #$f6           ; $d77f: a9 f6     
            STA $02            ; $d781: 85 02     
            JMP __d7ad         ; $d783: 4c ad d7  

;-------------------------------------------------------------------------------
__d786:     LDA $57            ; $d786: a5 57     
            CMP #$01           ; $d788: c9 01     
            BNE __d795         ; $d78a: d0 09     
            LDA #$0e           ; $d78c: a9 0e     
            CLC                ; $d78e: 18        
            ADC $0203          ; $d78f: 6d 03 02  
            JMP __d79b         ; $d792: 4c 9b d7  

;-------------------------------------------------------------------------------
__d795:     LDA $0203          ; $d795: ad 03 02  
            SEC                ; $d798: 38        
            SBC #$0e           ; $d799: e9 0e     
__d79b:     STA $00            ; $d79b: 85 00     
            LDA #$06           ; $d79d: a9 06     
            CLC                ; $d79f: 18        
            ADC $0200          ; $d7a0: 6d 00 02  
            STA $01            ; $d7a3: 85 01     
            LDA #$12           ; $d7a5: a9 12     
            STA $03            ; $d7a7: 85 03     
            LDA #$fa           ; $d7a9: a9 fa     
            STA $02            ; $d7ab: 85 02     
__d7ad:     LDA $a0            ; $d7ad: a5 a0     
            CMP #$01           ; $d7af: c9 01     
            BEQ __d7b8         ; $d7b1: f0 05     
            LDA #$d8           ; $d7b3: a9 d8     
            JMP __d7ba         ; $d7b5: 4c ba d7  

;-------------------------------------------------------------------------------
__d7b8:     LDA #$d0           ; $d7b8: a9 d0     
__d7ba:     STA $04            ; $d7ba: 85 04     
            JMP __f078         ; $d7bc: 4c 78 f0  

;-------------------------------------------------------------------------------
__d7bf:     LDA #$12           ; $d7bf: a9 12     
            STA $03            ; $d7c1: 85 03     
            LDA $a0            ; $d7c3: a5 a0     
            CMP #$01           ; $d7c5: c9 01     
            BEQ __d7d3         ; $d7c7: f0 0a     
            LDA #$00           ; $d7c9: a9 00     
            STA $0452          ; $d7cb: 8d 52 04  
            LDA #$d8           ; $d7ce: a9 d8     
            JMP __d7da         ; $d7d0: 4c da d7  

;-------------------------------------------------------------------------------
__d7d3:     LDA #$00           ; $d7d3: a9 00     
            STA $0451          ; $d7d5: 8d 51 04  
            LDA #$d0           ; $d7d8: a9 d0     
__d7da:     STA $04            ; $d7da: 85 04     
            JSR __f094         ; $d7dc: 20 94 f0  
            JSR __d7f2         ; $d7df: 20 f2 d7  
            LDA #$01           ; $d7e2: a9 01     
            STA $96            ; $d7e4: 85 96     
            LDA #$00           ; $d7e6: a9 00     
            STA $a0            ; $d7e8: 85 a0     
            STA $9f            ; $d7ea: 85 9f     
            LDA $0519          ; $d7ec: ad 19 05  
            STA $fc            ; $d7ef: 85 fc     
            RTS                ; $d7f1: 60        

;-------------------------------------------------------------------------------
__d7f2:     LDA #$19           ; $d7f2: a9 19     
            STA $00            ; $d7f4: 85 00     
            LDA #$3f           ; $d7f6: a9 3f     
            STA $01            ; $d7f8: 85 01     
            LDA #$4e           ; $d7fa: a9 4e     
            JSR __c815         ; $d7fc: 20 15 c8  
            RTS                ; $d7ff: 60        

;-------------------------------------------------------------------------------
__d800:     LDA $a0            ; $d800: a5 a0     
            BEQ __d805         ; $d802: f0 01     
            RTS                ; $d804: 60        

;-------------------------------------------------------------------------------
__d805:     LDY $53            ; $d805: a4 53     
            CPY #$03           ; $d807: c0 03     
            BNE __d80e         ; $d809: d0 03     
            JMP __d8a8         ; $d80b: 4c a8 d8  

;-------------------------------------------------------------------------------
__d80e:     LDA $0203          ; $d80e: ad 03 02  
            CPY #$01           ; $d811: c0 01     
            BEQ __d81e         ; $d813: f0 09     
            CMP #$88           ; $d815: c9 88     
            BEQ __d827         ; $d817: f0 0e     
            BCC __d827         ; $d819: 90 0c     
            JMP __d8a8         ; $d81b: 4c a8 d8  

;-------------------------------------------------------------------------------
__d81e:     CMP #$28           ; $d81e: c9 28     
            BEQ __d827         ; $d820: f0 05     
            BCC __d827         ; $d822: 90 03     
            JMP __d8a8         ; $d824: 4c a8 d8  

;-------------------------------------------------------------------------------
__d827:     LDA $0200          ; $d827: ad 00 02  
            CLC                ; $d82a: 18        
            ADC #$08           ; $d82b: 69 08     
            JSR __e016         ; $d82d: 20 16 e0  
            STA $59            ; $d830: 85 59     
            LDA $53            ; $d832: a5 53     
            SEC                ; $d834: 38        
            SBC #$01           ; $d835: e9 01     
            ASL                ; $d837: 0a        
            TAX                ; $d838: aa        
            LDA $59            ; $d839: a5 59     
            CMP __c1a8,x       ; $d83b: dd a8 c1  
            BEQ __d849         ; $d83e: f0 09     
            INX                ; $d840: e8        
            CMP __c1a8,x       ; $d841: dd a8 c1  
            BEQ __d849         ; $d844: f0 03     
            JMP __d8a8         ; $d846: 4c a8 d8  

;-------------------------------------------------------------------------------
__d849:     TXA                ; $d849: 8a        
            AND #$01           ; $d84a: 29 01     
            BEQ __d867         ; $d84c: f0 19     
            LDA $0452          ; $d84e: ad 52 04  
            BNE __d856         ; $d851: d0 03     
            JMP __d8a8         ; $d853: 4c a8 d8  

;-------------------------------------------------------------------------------
__d856:     LDA #$02           ; $d856: a9 02     
            STA $a0            ; $d858: 85 a0     
            LDA $02d8          ; $d85a: ad d8 02  
            STA $01            ; $d85d: 85 01     
            LDA $02db          ; $d85f: ad db 02  
            STA $00            ; $d862: 85 00     
            JMP __d87d         ; $d864: 4c 7d d8  

;-------------------------------------------------------------------------------
__d867:     LDA $0451          ; $d867: ad 51 04  
            BNE __d86f         ; $d86a: d0 03     
            JMP __d8a8         ; $d86c: 4c a8 d8  

;-------------------------------------------------------------------------------
__d86f:     LDA #$01           ; $d86f: a9 01     
            STA $a0            ; $d871: 85 a0     
            LDA $02d0          ; $d873: ad d0 02  
            STA $01            ; $d876: 85 01     
            LDA $02d3          ; $d878: ad d3 02  
            STA $00            ; $d87b: 85 00     
__d87d:     LDA #$2e           ; $d87d: a9 2e     
            JSR __efe8         ; $d87f: 20 e8 ef  
            JSR __eae1         ; $d882: 20 e1 ea  
            LDA #$30           ; $d885: a9 30     
            JSR __c847         ; $d887: 20 47 c8  
            JSR __efef         ; $d88a: 20 ef ef  
            BEQ __d8a8         ; $d88d: f0 19     
            LDA $fc            ; $d88f: a5 fc     
            STA $0519          ; $d891: 8d 19 05  
            LDA $53            ; $d894: a5 53     
            CMP #$04           ; $d896: c9 04     
            BNE __d8a7         ; $d898: d0 0d     
            LDA #$19           ; $d89a: a9 19     
            STA $00            ; $d89c: 85 00     
            LDA #$3f           ; $d89e: a9 3f     
            STA $01            ; $d8a0: 85 01     
            LDA #$46           ; $d8a2: a9 46     
            JSR __c815         ; $d8a4: 20 15 c8  
__d8a7:     RTS                ; $d8a7: 60        

;-------------------------------------------------------------------------------
__d8a8:     LDA #$00           ; $d8a8: a9 00     
            STA $a0            ; $d8aa: 85 a0     
            RTS                ; $d8ac: 60        

;-------------------------------------------------------------------------------
__d8ad:     LDA #$f3           ; $d8ad: a9 f3     
            STA $0b            ; $d8af: 85 0b     
            LDA #$00           ; $d8b1: a9 00     
            STA $86            ; $d8b3: 85 86     
            LDY #$00           ; $d8b5: a0 00     
            LDA ($04),y        ; $d8b7: b1 04     
__d8b9:     STA $00            ; $d8b9: 85 00     
            INY                ; $d8bb: c8        
            LDA ($04),y        ; $d8bc: b1 04     
            STA $01            ; $d8be: 85 01     
            INY                ; $d8c0: c8        
            LDA ($04),y        ; $d8c1: b1 04     
            CLC                ; $d8c3: 18        
            ADC $06            ; $d8c4: 65 06     
            STA $02            ; $d8c6: 85 02     
            LDA $07            ; $d8c8: a5 07     
            ADC #$00           ; $d8ca: 69 00     
            STA $03            ; $d8cc: 85 03     
            STY $86            ; $d8ce: 84 86     
            JSR __eff3         ; $d8d0: 20 f3 ef  
            BNE __d8e1         ; $d8d3: d0 0c     
            LDY $86            ; $d8d5: a4 86     
            INY                ; $d8d7: c8        
            LDA ($04),y        ; $d8d8: b1 04     
            CMP #$fe           ; $d8da: c9 fe     
            BEQ __d8e6         ; $d8dc: f0 08     
            JMP __d8b9         ; $d8de: 4c b9 d8  

;-------------------------------------------------------------------------------
__d8e1:     LDA #$01           ; $d8e1: a9 01     
            JMP __d8e8         ; $d8e3: 4c e8 d8  

;-------------------------------------------------------------------------------
__d8e6:     LDA #$00           ; $d8e6: a9 00     
__d8e8:     STA $0c            ; $d8e8: 85 0c     
            RTS                ; $d8ea: 60        

;-------------------------------------------------------------------------------
__d8eb:     LDA $5a            ; $d8eb: a5 5a     
            BNE __d917         ; $d8ed: d0 28     
            LDA $59            ; $d8ef: a5 59     
            BEQ __d917         ; $d8f1: f0 24     
            AND #$01           ; $d8f3: 29 01     
            BNE __d904         ; $d8f5: d0 0d     
            LDA $56            ; $d8f7: a5 56     
            CMP #$01           ; $d8f9: c9 01     
            BEQ __d914         ; $d8fb: f0 17     
            CMP #$02           ; $d8fd: c9 02     
            BEQ __d911         ; $d8ff: f0 10     
            JMP __d917         ; $d901: 4c 17 d9  

;-------------------------------------------------------------------------------
__d904:     LDA $56            ; $d904: a5 56     
            CMP #$01           ; $d906: c9 01     
            BEQ __d911         ; $d908: f0 07     
            CMP #$02           ; $d90a: c9 02     
            BEQ __d914         ; $d90c: f0 06     
            JMP __d917         ; $d90e: 4c 17 d9  

;-------------------------------------------------------------------------------
__d911:     LDA #$ff           ; $d911: a9 ff     
            RTS                ; $d913: 60        

;-------------------------------------------------------------------------------
__d914:     LDA #$01           ; $d914: a9 01     
            RTS                ; $d916: 60        

;-------------------------------------------------------------------------------
__d917:     LDA #$00           ; $d917: a9 00     
            RTS                ; $d919: 60        

;-------------------------------------------------------------------------------
__d91a:     LDA $0200          ; $d91a: ad 00 02  
            CLC                ; $d91d: 18        
            ADC #$08           ; $d91e: 69 08     
            JSR __e016         ; $d920: 20 16 e0  
            STA $59            ; $d923: 85 59     
            CMP #$01           ; $d925: c9 01     
            BEQ __d938         ; $d927: f0 0f     
            LDX #$02           ; $d929: a2 02     
            LDA #$0c           ; $d92b: a9 0c     
__d92d:     CPX $59            ; $d92d: e4 59     
            BEQ __d93b         ; $d92f: f0 0a     
            CLC                ; $d931: 18        
            ADC #$06           ; $d932: 69 06     
            INX                ; $d934: e8        
            JMP __d92d         ; $d935: 4c 2d d9  

;-------------------------------------------------------------------------------
__d938:     SEC                ; $d938: 38        
            SBC #$01           ; $d939: e9 01     
__d93b:     TAX                ; $d93b: aa        
__d93c:     LDA #$00           ; $d93c: a9 00     
            STA $86            ; $d93e: 85 86     
            LDA __c08c,x       ; $d940: bd 8c c0  
            STA $00            ; $d943: 85 00     
            INX                ; $d945: e8        
            LDA __c08c,x       ; $d946: bd 8c c0  
            STA $01            ; $d949: 85 01     
            INX                ; $d94b: e8        
            LDA __c08c,x       ; $d94c: bd 8c c0  
            CLC                ; $d94f: 18        
            ADC $06            ; $d950: 65 06     
            STA $02            ; $d952: 85 02     
            LDA $07            ; $d954: a5 07     
            STA $03            ; $d956: 85 03     
            INX                ; $d958: e8        
            LDA __c08c,x       ; $d959: bd 8c c0  
            STA $08            ; $d95c: 85 08     
            INX                ; $d95e: e8        
            LDA __c08c,x       ; $d95f: bd 8c c0  
            STA $09            ; $d962: 85 09     
__d964:     JSR __efef         ; $d964: 20 ef ef  
            BNE __d98b         ; $d967: d0 22     
            LDA $00            ; $d969: a5 00     
            CLC                ; $d96b: 18        
            ADC $08            ; $d96c: 65 08     
            STA $00            ; $d96e: 85 00     
            DEC $01            ; $d970: c6 01     
            INC $86            ; $d972: e6 86     
            LDA $09            ; $d974: a5 09     
            CMP $86            ; $d976: c5 86     
            BNE __d964         ; $d978: d0 ea     
            INX                ; $d97a: e8        
            LDA __c08c,x       ; $d97b: bd 8c c0  
            CMP #$fe           ; $d97e: c9 fe     
            BEQ __d986         ; $d980: f0 04     
            INX                ; $d982: e8        
            JMP __d93c         ; $d983: 4c 3c d9  

;-------------------------------------------------------------------------------
__d986:     LDA #$00           ; $d986: a9 00     
            JMP __d98d         ; $d988: 4c 8d d9  

;-------------------------------------------------------------------------------
__d98b:     LDA #$01           ; $d98b: a9 01     
__d98d:     STA $5a            ; $d98d: 85 5a     
            RTS                ; $d98f: 60        

;-------------------------------------------------------------------------------
__d990:     LDA $56            ; $d990: a5 56     
            CMP #$01           ; $d992: c9 01     
            BEQ __d99d         ; $d994: f0 07     
            CMP #$02           ; $d996: c9 02     
            BEQ __d9af         ; $d998: f0 15     
            JMP __d9e3         ; $d99a: 4c e3 d9  

;-------------------------------------------------------------------------------
__d99d:     LDA $53            ; $d99d: a5 53     
            ASL                ; $d99f: 0a        
            TAX                ; $d9a0: aa        
            DEX                ; $d9a1: ca        
            LDA __c1b4,x       ; $d9a2: bd b4 c1  
            CMP $0203          ; $d9a5: cd 03 02  
            BEQ __d9e0         ; $d9a8: f0 36     
            BCC __d9e0         ; $d9aa: 90 34     
            JMP __d9e3         ; $d9ac: 4c e3 d9  

;-------------------------------------------------------------------------------
__d9af:     LDA $53            ; $d9af: a5 53     
            ASL                ; $d9b1: 0a        
            TAX                ; $d9b2: aa        
            DEX                ; $d9b3: ca        
            DEX                ; $d9b4: ca        
            LDA __c1b4,x       ; $d9b5: bd b4 c1  
            CMP $0203          ; $d9b8: cd 03 02  
            BCS __d9e0         ; $d9bb: b0 23     
            LDA $53            ; $d9bd: a5 53     
            CMP #$04           ; $d9bf: c9 04     
            BEQ __d9e3         ; $d9c1: f0 20     
            LDX $59            ; $d9c3: a6 59     
            CMP #$03           ; $d9c5: c9 03     
            BEQ __d9d0         ; $d9c7: f0 07     
            CPX #$06           ; $d9c9: e0 06     
            BNE __d9e3         ; $d9cb: d0 16     
            JMP __d9d4         ; $d9cd: 4c d4 d9  

;-------------------------------------------------------------------------------
__d9d0:     CPX #$05           ; $d9d0: e0 05     
            BNE __d9e3         ; $d9d2: d0 0f     
__d9d4:     LDA $0203          ; $d9d4: ad 03 02  
            CMP #$68           ; $d9d7: c9 68     
            BEQ __d9e0         ; $d9d9: f0 05     
            BCC __d9e0         ; $d9db: 90 03     
            JMP __d9e3         ; $d9dd: 4c e3 d9  

;-------------------------------------------------------------------------------
__d9e0:     LDA #$01           ; $d9e0: a9 01     
            RTS                ; $d9e2: 60        

;-------------------------------------------------------------------------------
__d9e3:     LDA #$00           ; $d9e3: a9 00     
            RTS                ; $d9e5: 60        

;-------------------------------------------------------------------------------
__d9e6:     STA $0a            ; $d9e6: 85 0a     
__d9e8:     STA $0b            ; $d9e8: 85 0b     
            INC $88            ; $d9ea: e6 88     
            LDA $88            ; $d9ec: a5 88     
            CMP #$0f           ; $d9ee: c9 0f     
            BCS __d9f5         ; $d9f0: b0 03     
            JMP __d9f9         ; $d9f2: 4c f9 d9  

;-------------------------------------------------------------------------------
__d9f5:     LDA #$00           ; $d9f5: a9 00     
            STA $88            ; $d9f7: 85 88     
__d9f9:     CMP #$08           ; $d9f9: c9 08     
            BCS __da06         ; $d9fb: b0 09     
            TAX                ; $d9fd: aa        
            LDA __c1bc,x       ; $d9fe: bd bc c1  
            AND $0a            ; $da01: 25 0a     
            JMP __da0f         ; $da03: 4c 0f da  

;-------------------------------------------------------------------------------
__da06:     SEC                ; $da06: 38        
            SBC #$08           ; $da07: e9 08     
            TAX                ; $da09: aa        
            LDA __c1bc,x       ; $da0a: bd bc c1  
            AND $0b            ; $da0d: 25 0b     
__da0f:     BEQ __da13         ; $da0f: f0 02     
            LDA #$01           ; $da11: a9 01     
__da13:     STA $be            ; $da13: 85 be     
            RTS                ; $da15: 60        

;-------------------------------------------------------------------------------
__da16:     JSR __e166         ; $da16: 20 66 e1  
            LDA #$00           ; $da19: a9 00     
            STA $5d            ; $da1b: 85 5d     
__da1d:     JSR __efd5         ; $da1d: 20 d5 ef  
            LDA $0200,x        ; $da20: bd 00 02  
            CMP #$ff           ; $da23: c9 ff     
            BNE __da3d         ; $da25: d0 16     
            LDA $36            ; $da27: a5 36     
            BNE __da40         ; $da29: d0 15     
            LDA #$80           ; $da2b: a9 80     
            LDX $5d            ; $da2d: a6 5d     
            STA $5e,x          ; $da2f: 95 5e     
            LDA #$10           ; $da31: a9 10     
            STA $37            ; $da33: 85 37     
            JSR __eaf7         ; $da35: 20 f7 ea  
            LDA __c443,x       ; $da38: bd 43 c4  
            STA $36            ; $da3b: 85 36     
__da3d:     JSR __da4c         ; $da3d: 20 4c da  
__da40:     LDA $5d            ; $da40: a5 5d     
            CLC                ; $da42: 18        
            ADC #$01           ; $da43: 69 01     
            STA $5d            ; $da45: 85 5d     
            CMP #$09           ; $da47: c9 09     
            BNE __da1d         ; $da49: d0 d2     
            RTS                ; $da4b: 60        

;-------------------------------------------------------------------------------
__da4c:     LDX $5d            ; $da4c: a6 5d     
            LDA $5e,x          ; $da4e: b5 5e     
            CMP #$80           ; $da50: c9 80     
            BEQ __da7d         ; $da52: f0 29     
            CMP #$81           ; $da54: c9 81     
            BEQ __da80         ; $da56: f0 28     
            CMP #$01           ; $da58: c9 01     
            BEQ __da83         ; $da5a: f0 27     
            CMP #$02           ; $da5c: c9 02     
            BEQ __da86         ; $da5e: f0 26     
            CMP #$c0           ; $da60: c9 c0     
            BEQ __da89         ; $da62: f0 25     
            CMP #$c1           ; $da64: c9 c1     
            BEQ __da89         ; $da66: f0 21     
            CMP #$c2           ; $da68: c9 c2     
            BEQ __da89         ; $da6a: f0 1d     
            CMP #$08           ; $da6c: c9 08     
            BEQ __da8f         ; $da6e: f0 1f     
            CMP #$10           ; $da70: c9 10     
            BEQ __da92         ; $da72: f0 1e     
            CMP #$20           ; $da74: c9 20     
            BEQ __da95         ; $da76: f0 1d     
            CMP #$40           ; $da78: c9 40     
            BEQ __da98         ; $da7a: f0 1c     
            RTS                ; $da7c: 60        

;-------------------------------------------------------------------------------
__da7d:     JMP __da9c         ; $da7d: 4c 9c da  

;-------------------------------------------------------------------------------
__da80:     JMP __db00         ; $da80: 4c 00 db  

;-------------------------------------------------------------------------------
__da83:     JMP __db2c         ; $da83: 4c 2c db  

;-------------------------------------------------------------------------------
__da86:     JMP __dc30         ; $da86: 4c 30 dc  

;-------------------------------------------------------------------------------
__da89:     LDA $0421,x        ; $da89: bd 21 04  
            JMP __dd8b         ; $da8c: 4c 8b dd  

;-------------------------------------------------------------------------------
__da8f:     JMP __dc69         ; $da8f: 4c 69 dc  

;-------------------------------------------------------------------------------
__da92:     JMP __dcd0         ; $da92: 4c d0 dc  

;-------------------------------------------------------------------------------
__da95:     JMP __dd32         ; $da95: 4c 32 dd  

;-------------------------------------------------------------------------------
__da98:     JSR __df07         ; $da98: 20 07 df  
            RTS                ; $da9b: 60        

;-------------------------------------------------------------------------------
__da9c:     JSR __efd5         ; $da9c: 20 d5 ef  
            LDA #$30           ; $da9f: a9 30     
            STA $00            ; $daa1: 85 00     
            STA $01            ; $daa3: 85 01     
            LDA #$90           ; $daa5: a9 90     
            STA $02            ; $daa7: 85 02     
            STX $04            ; $daa9: 86 04     
            JSR __eadb         ; $daab: 20 db ea  
            LDA $37            ; $daae: a5 37     
            BNE __daff         ; $dab0: d0 4d     
            LDA #$81           ; $dab2: a9 81     
            LDX $5d            ; $dab4: a6 5d     
            STA $5e,x          ; $dab6: 95 5e     
            LDA #$00           ; $dab8: a9 00     
            STA $8a,x          ; $daba: 95 8a     
            LDA $ad            ; $dabc: a5 ad     
            BEQ __dac3         ; $dabe: f0 03     
            JMP __dad5         ; $dac0: 4c d5 da  

;-------------------------------------------------------------------------------
__dac3:     LDA $5d            ; $dac3: a5 5d     
            BNE __daff         ; $dac5: d0 38     
            LDA #$c0           ; $dac7: a9 c0     
            LDX $5d            ; $dac9: a6 5d     
            STA $5e,x          ; $dacb: 95 5e     
            LDA #$01           ; $dacd: a9 01     
            STA $0421,x        ; $dacf: 9d 21 04  
            JMP __daf7         ; $dad2: 4c f7 da  

;-------------------------------------------------------------------------------
__dad5:     LDA $43            ; $dad5: a5 43     
            BNE __daff         ; $dad7: d0 26     
            LDA $5d            ; $dad9: a5 5d     
            BNE __daff         ; $dadb: d0 22     
            LDA #$c0           ; $dadd: a9 c0     
            LDX $5d            ; $dadf: a6 5d     
            STA $5e,x          ; $dae1: 95 5e     
            LDA $0421,x        ; $dae3: bd 21 04  
            CMP #$01           ; $dae6: c9 01     
            BNE __daf2         ; $dae8: d0 08     
            LDA #$03           ; $daea: a9 03     
            STA $0421,x        ; $daec: 9d 21 04  
            JMP __daf7         ; $daef: 4c f7 da  

;-------------------------------------------------------------------------------
__daf2:     LDA #$01           ; $daf2: a9 01     
            STA $0421,x        ; $daf4: 9d 21 04  
__daf7:     JSR __eaf7         ; $daf7: 20 f7 ea  
            LDA __c44d,x       ; $dafa: bd 4d c4  
            STA $43            ; $dafd: 85 43     
__daff:     RTS                ; $daff: 60        

;-------------------------------------------------------------------------------
__db00:     LDA #$55           ; $db00: a9 55     
            JSR __dfe4         ; $db02: 20 e4 df  
            BNE __db21         ; $db05: d0 1a     
            JSR __efd5         ; $db07: 20 d5 ef  
            LDA #$4d           ; $db0a: a9 4d     
            STA $00            ; $db0c: 85 00     
            LDA #$32           ; $db0e: a9 32     
            STA $01            ; $db10: 85 01     
            LDA #$84           ; $db12: a9 84     
            STA $02            ; $db14: 85 02     
            STX $04            ; $db16: 86 04     
            JSR __eadb         ; $db18: 20 db ea  
            INC $0515          ; $db1b: ee 15 05  
            JMP __db2b         ; $db1e: 4c 2b db  

;-------------------------------------------------------------------------------
__db21:     LDX $5d            ; $db21: a6 5d     
            LDA #$01           ; $db23: a9 01     
            STA $5e,x          ; $db25: 95 5e     
            LDA #$84           ; $db27: a9 84     
            STA $72,x          ; $db29: 95 72     
__db2b:     RTS                ; $db2b: 60        

;-------------------------------------------------------------------------------
__db2c:     LDA #$ff           ; $db2c: a9 ff     
            JSR __dfe4         ; $db2e: 20 e4 df  
            BNE __db34         ; $db31: d0 01     
            RTS                ; $db33: 60        

;-------------------------------------------------------------------------------
__db34:     JSR __efd5         ; $db34: 20 d5 ef  
            PHA                ; $db37: 48        
            JSR __eaec         ; $db38: 20 ec ea  
            LDA $01            ; $db3b: a5 01     
            JSR __e016         ; $db3d: 20 16 e0  
            LDY $5d            ; $db40: a4 5d     
            STA $0068,y        ; $db42: 99 68 00  
            AND #$01           ; $db45: 29 01     
            BNE __db4e         ; $db47: d0 05     
            INC $00            ; $db49: e6 00     
            JMP __db50         ; $db4b: 4c 50 db  

;-------------------------------------------------------------------------------
__db4e:     DEC $00            ; $db4e: c6 00     
__db50:     LDA $00            ; $db50: a5 00     
            JSR __e05a         ; $db52: 20 5a e0  
            STA $7d            ; $db55: 85 7d     
            JSR __e048         ; $db57: 20 48 e0  
            CLC                ; $db5a: 18        
            ADC $01            ; $db5b: 65 01     
            STA $01            ; $db5d: 85 01     
            JSR __dbee         ; $db5f: 20 ee db  
            LDX $5d            ; $db62: a6 5d     
            LDA $72,x          ; $db64: b5 72     
            JSR __ead4         ; $db66: 20 d4 ea  
            PLA                ; $db69: 68        
            TAX                ; $db6a: aa        
            JSR __f080         ; $db6b: 20 80 f0  
            LDA $00            ; $db6e: a5 00     
            JSR __e0ae         ; $db70: 20 ae e0  
            BEQ __dbac         ; $db73: f0 37     
            JSR __eaf7         ; $db75: 20 f7 ea  
            LDA __c448,x       ; $db78: bd 48 c4  
            AND $19            ; $db7b: 25 19     
            BNE __dbac         ; $db7d: d0 2d     
            LDX $5d            ; $db7f: a6 5d     
            LDA $68,x          ; $db81: b5 68     
            TAX                ; $db83: aa        
            DEX                ; $db84: ca        
            LDA $7e,x          ; $db85: b5 7e     
            CMP #$04           ; $db87: c9 04     
            BCS __dbac         ; $db89: b0 21     
            LDA $96            ; $db8b: a5 96     
            CMP #$02           ; $db8d: c9 02     
            BNE __dba3         ; $db8f: d0 12     
            LDX $04            ; $db91: a6 04     
            LDA $0200,x        ; $db93: bd 00 02  
            CMP $0200          ; $db96: cd 00 02  
            BCS __dba3         ; $db99: b0 08     
            CLC                ; $db9b: 18        
            ADC #$0f           ; $db9c: 69 0f     
            CMP $0200          ; $db9e: cd 00 02  
            BCS __dbac         ; $dba1: b0 09     
__dba3:     LDA #$02           ; $dba3: a9 02     
            LDX $5d            ; $dba5: a6 5d     
            STA $5e,x          ; $dba7: 95 5e     
            DEC $68,x          ; $dba9: d6 68     
            RTS                ; $dbab: 60        

;-------------------------------------------------------------------------------
__dbac:     LDA $00            ; $dbac: a5 00     
            JSR __e090         ; $dbae: 20 90 e0  
            BEQ __dbb6         ; $dbb1: f0 03     
            JMP __dbe7         ; $dbb3: 4c e7 db  

;-------------------------------------------------------------------------------
__dbb6:     JSR __df40         ; $dbb6: 20 40 df  
            LDX $5d            ; $dbb9: a6 5d     
            LDA $68,x          ; $dbbb: b5 68     
            CMP #$01           ; $dbbd: c9 01     
            BNE __dbed         ; $dbbf: d0 2c     
            JSR __dfc3         ; $dbc1: 20 c3 df  
            LDA $00            ; $dbc4: a5 00     
            CMP #$20           ; $dbc6: c9 20     
            BEQ __dbcd         ; $dbc8: f0 03     
            BCC __dbcd         ; $dbca: 90 01     
            RTS                ; $dbcc: 60        

;-------------------------------------------------------------------------------
__dbcd:     LDA #$03           ; $dbcd: a9 03     
            STA $02            ; $dbcf: 85 02     
            LDA #$04           ; $dbd1: a9 04     
            STA $03            ; $dbd3: 85 03     
            JSR __f08e         ; $dbd5: 20 8e f0  
            LDA #$01           ; $dbd8: a9 01     
            STA $ad            ; $dbda: 85 ad     
            LDA #$00           ; $dbdc: a9 00     
            LDX $5d            ; $dbde: a6 5d     
            STA $68,x          ; $dbe0: 95 68     
            LDA #$80           ; $dbe2: a9 80     
            STA $fe            ; $dbe4: 85 fe     
            RTS                ; $dbe6: 60        

;-------------------------------------------------------------------------------
__dbe7:     LDX $5d            ; $dbe7: a6 5d     
            LDA #$08           ; $dbe9: a9 08     
            STA $5e,x          ; $dbeb: 95 5e     
__dbed:     RTS                ; $dbed: 60        

;-------------------------------------------------------------------------------
__dbee:     LDX $5d            ; $dbee: a6 5d     
            INC $040d,x        ; $dbf0: fe 0d 04  
            LDA $040d,x        ; $dbf3: bd 0d 04  
            CMP #$06           ; $dbf6: c9 06     
            BCS __dbfb         ; $dbf8: b0 01     
            RTS                ; $dbfa: 60        

;-------------------------------------------------------------------------------
__dbfb:     LDA #$00           ; $dbfb: a9 00     
            STA $040d,x        ; $dbfd: 9d 0d 04  
            LDA $68,x          ; $dc00: b5 68     
            AND #$01           ; $dc02: 29 01     
            BEQ __dc1b         ; $dc04: f0 15     
            LDA $72,x          ; $dc06: b5 72     
            CLC                ; $dc08: 18        
            ADC #$04           ; $dc09: 69 04     
            CMP #$80           ; $dc0b: c9 80     
            BCC __dc16         ; $dc0d: 90 07     
            CMP #$90           ; $dc0f: c9 90     
            BCS __dc16         ; $dc11: b0 03     
            JMP __dc2d         ; $dc13: 4c 2d dc  

;-------------------------------------------------------------------------------
__dc16:     LDA #$80           ; $dc16: a9 80     
            JMP __dc2d         ; $dc18: 4c 2d dc  

;-------------------------------------------------------------------------------
__dc1b:     LDA $72,x          ; $dc1b: b5 72     
            SEC                ; $dc1d: 38        
            SBC #$04           ; $dc1e: e9 04     
            CMP #$80           ; $dc20: c9 80     
            BCC __dc2b         ; $dc22: 90 07     
            CMP #$90           ; $dc24: c9 90     
            BCS __dc2b         ; $dc26: b0 03     
            JMP __dc2d         ; $dc28: 4c 2d dc  

;-------------------------------------------------------------------------------
__dc2b:     LDA #$8c           ; $dc2b: a9 8c     
__dc2d:     STA $72,x          ; $dc2d: 95 72     
            RTS                ; $dc2f: 60        

;-------------------------------------------------------------------------------
__dc30:     LDA #$55           ; $dc30: a9 55     
            JSR __dfe4         ; $dc32: 20 e4 df  
            BEQ __dc68         ; $dc35: f0 31     
            JSR __efd5         ; $dc37: 20 d5 ef  
            STX $04            ; $dc3a: 86 04     
            JSR __eaec         ; $dc3c: 20 ec ea  
            INC $01            ; $dc3f: e6 01     
            LDY $5d            ; $dc41: a4 5d     
            LDA $0072,y        ; $dc43: b9 72 00  
            CMP #$90           ; $dc46: c9 90     
            BNE __dc4f         ; $dc48: d0 05     
            LDA #$94           ; $dc4a: a9 94     
            JMP __dc51         ; $dc4c: 4c 51 dc  

;-------------------------------------------------------------------------------
__dc4f:     LDA #$90           ; $dc4f: a9 90     
__dc51:     STA $02            ; $dc51: 85 02     
            LDX $5d            ; $dc53: a6 5d     
            STA $72,x          ; $dc55: 95 72     
            JSR __eadb         ; $dc57: 20 db ea  
            LDA $01            ; $dc5a: a5 01     
            LDX $5d            ; $dc5c: a6 5d     
            CMP $a3,x          ; $dc5e: d5 a3     
            BNE __dc68         ; $dc60: d0 06     
            LDX $5d            ; $dc62: a6 5d     
            LDA #$01           ; $dc64: a9 01     
            STA $5e,x          ; $dc66: 95 5e     
__dc68:     RTS                ; $dc68: 60        

;-------------------------------------------------------------------------------
__dc69:     LDA #$ff           ; $dc69: a9 ff     
            JSR __dfe4         ; $dc6b: 20 e4 df  
            BNE __dc71         ; $dc6e: d0 01     
            RTS                ; $dc70: 60        

;-------------------------------------------------------------------------------
__dc71:     JSR __efd5         ; $dc71: 20 d5 ef  
            STX $04            ; $dc74: 86 04     
            JSR __eaec         ; $dc76: 20 ec ea  
            INC $01            ; $dc79: e6 01     
            LDA $01            ; $dc7b: a5 01     
            AND #$01           ; $dc7d: 29 01     
            BEQ __dc90         ; $dc7f: f0 0f     
            LDX $5d            ; $dc81: a6 5d     
            LDA $68,x          ; $dc83: b5 68     
            AND #$01           ; $dc85: 29 01     
            BEQ __dc8e         ; $dc87: f0 05     
            DEC $00            ; $dc89: c6 00     
            JMP __dc90         ; $dc8b: 4c 90 dc  

;-------------------------------------------------------------------------------
__dc8e:     INC $00            ; $dc8e: e6 00     
__dc90:     JSR __dbee         ; $dc90: 20 ee db  
            LDX $5d            ; $dc93: a6 5d     
            LDA $72,x          ; $dc95: b5 72     
            STA $02            ; $dc97: 85 02     
            JSR __eadb         ; $dc99: 20 db ea  
            LDA #$32           ; $dc9c: a9 32     
            JSR __c853         ; $dc9e: 20 53 c8  
            LDA $01            ; $dca1: a5 01     
            JSR __e112         ; $dca3: 20 12 e1  
            BEQ __dccf         ; $dca6: f0 27     
            LDX $5d            ; $dca8: a6 5d     
            LDA #$10           ; $dcaa: a9 10     
            STA $5e,x          ; $dcac: 95 5e     
            JSR __e130         ; $dcae: 20 30 e1  
            BEQ __dcbc         ; $dcb1: f0 09     
            LDA $19            ; $dcb3: a5 19     
            AND #$01           ; $dcb5: 29 01     
            BEQ __dcbc         ; $dcb7: f0 03     
            JMP __dcc9         ; $dcb9: 4c c9 dc  

;-------------------------------------------------------------------------------
__dcbc:     LDX $5d            ; $dcbc: a6 5d     
            LDA $68,x          ; $dcbe: b5 68     
            TAX                ; $dcc0: aa        
            DEX                ; $dcc1: ca        
            LDA $7e,x          ; $dcc2: b5 7e     
            CMP #$04           ; $dcc4: c9 04     
            BCS __dcc9         ; $dcc6: b0 01     
            RTS                ; $dcc8: 60        

;-------------------------------------------------------------------------------
__dcc9:     LDX $5d            ; $dcc9: a6 5d     
            LDA #$20           ; $dccb: a9 20     
            STA $5e,x          ; $dccd: 95 5e     
__dccf:     RTS                ; $dccf: 60        

;-------------------------------------------------------------------------------
__dcd0:     LDA #$77           ; $dcd0: a9 77     
            JSR __dfe4         ; $dcd2: 20 e4 df  
            BNE __dcd8         ; $dcd5: d0 01     
            RTS                ; $dcd7: 60        

;-------------------------------------------------------------------------------
__dcd8:     JSR __efd5         ; $dcd8: 20 d5 ef  
            STX $04            ; $dcdb: 86 04     
            JSR __eaec         ; $dcdd: 20 ec ea  
            LDA $01            ; $dce0: a5 01     
            JSR __e016         ; $dce2: 20 16 e0  
            LDX $5d            ; $dce5: a6 5d     
            STA $68,x          ; $dce7: 95 68     
            AND #$01           ; $dce9: 29 01     
            BNE __dd00         ; $dceb: d0 13     
            INC $00            ; $dced: e6 00     
            LDA $00            ; $dcef: a5 00     
            LDX #$00           ; $dcf1: a2 00     
__dcf3:     CMP __c3fc,x       ; $dcf3: dd fc c3  
            BEQ __dd13         ; $dcf6: f0 1b     
            INX                ; $dcf8: e8        
            CPX #$0b           ; $dcf9: e0 0b     
            BEQ __dd25         ; $dcfb: f0 28     
            JMP __dcf3         ; $dcfd: 4c f3 dc  

;-------------------------------------------------------------------------------
__dd00:     DEC $00            ; $dd00: c6 00     
            LDA $00            ; $dd02: a5 00     
            LDX #$00           ; $dd04: a2 00     
__dd06:     CMP __c412,x       ; $dd06: dd 12 c4  
            BEQ __dd13         ; $dd09: f0 08     
            INX                ; $dd0b: e8        
            CPX #$0b           ; $dd0c: e0 0b     
            BEQ __dd25         ; $dd0e: f0 15     
            JMP __dd06         ; $dd10: 4c 06 dd  

;-------------------------------------------------------------------------------
__dd13:     LDA $01            ; $dd13: a5 01     
            CLC                ; $dd15: 18        
            ADC __c407,x       ; $dd16: 7d 07 c4  
            STA $01            ; $dd19: 85 01     
            CPX #$0a           ; $dd1b: e0 0a     
            BNE __dd25         ; $dd1d: d0 06     
            LDX $5d            ; $dd1f: a6 5d     
            LDA #$01           ; $dd21: a9 01     
            STA $5e,x          ; $dd23: 95 5e     
__dd25:     JSR __dbee         ; $dd25: 20 ee db  
            LDX $5d            ; $dd28: a6 5d     
            LDA $72,x          ; $dd2a: b5 72     
            STA $02            ; $dd2c: 85 02     
            JSR __eadb         ; $dd2e: 20 db ea  
            RTS                ; $dd31: 60        

;-------------------------------------------------------------------------------
__dd32:     LDA #$55           ; $dd32: a9 55     
            JSR __dfe4         ; $dd34: 20 e4 df  
            BNE __dd3a         ; $dd37: d0 01     
            RTS                ; $dd39: 60        

;-------------------------------------------------------------------------------
__dd3a:     JSR __efd5         ; $dd3a: 20 d5 ef  
            STX $04            ; $dd3d: 86 04     
            JSR __eaec         ; $dd3f: 20 ec ea  
            LDA $01            ; $dd42: a5 01     
            JSR __e016         ; $dd44: 20 16 e0  
            LDX $5d            ; $dd47: a6 5d     
            STA $68,x          ; $dd49: 95 68     
            AND #$01           ; $dd4b: 29 01     
            BNE __dd60         ; $dd4d: d0 11     
            DEC $00            ; $dd4f: c6 00     
            LDA $01            ; $dd51: a5 01     
            CMP #$14           ; $dd53: c9 14     
            BNE __dd59         ; $dd55: d0 02     
            DEC $01            ; $dd57: c6 01     
__dd59:     LDA $00            ; $dd59: a5 00     
            BNE __dd73         ; $dd5b: d0 16     
            JMP __dd7f         ; $dd5d: 4c 7f dd  

;-------------------------------------------------------------------------------
__dd60:     INC $00            ; $dd60: e6 00     
            LDA $01            ; $dd62: a5 01     
            CMP #$ec           ; $dd64: c9 ec     
            BNE __dd6a         ; $dd66: d0 02     
            DEC $01            ; $dd68: c6 01     
__dd6a:     LDA $00            ; $dd6a: a5 00     
            CMP #$f4           ; $dd6c: c9 f4     
            BNE __dd73         ; $dd6e: d0 03     
            JMP __dd7f         ; $dd70: 4c 7f dd  

;-------------------------------------------------------------------------------
__dd73:     JSR __dbee         ; $dd73: 20 ee db  
            LDX $5d            ; $dd76: a6 5d     
            LDA $72,x          ; $dd78: b5 72     
            STA $02            ; $dd7a: 85 02     
            JMP __eadb         ; $dd7c: 4c db ea  

;-------------------------------------------------------------------------------
__dd7f:     LDA #$22           ; $dd7f: a9 22     
            JSR __f092         ; $dd81: 20 92 f0  
            LDA #$00           ; $dd84: a9 00     
            LDX $5d            ; $dd86: a6 5d     
            STA $68,x          ; $dd88: 95 68     
            RTS                ; $dd8a: 60        

;-------------------------------------------------------------------------------
__dd8b:     STA $07            ; $dd8b: 85 07     
            LDX $5d            ; $dd8d: a6 5d     
            LDA $5e,x          ; $dd8f: b5 5e     
            CMP #$c2           ; $dd91: c9 c2     
            BNE __dd98         ; $dd93: d0 03     
            JMP __de82         ; $dd95: 4c 82 de  

;-------------------------------------------------------------------------------
__dd98:     CMP #$c1           ; $dd98: c9 c1     
            BEQ __ddd7         ; $dd9a: f0 3b     
            LDA $07            ; $dd9c: a5 07     
            CMP #$02           ; $dd9e: c9 02     
            BEQ __ddab         ; $dda0: f0 09     
            CMP #$03           ; $dda2: c9 03     
            BEQ __ddb0         ; $dda4: f0 0a     
            LDA #$34           ; $dda6: a9 34     
            JMP __ddb2         ; $dda8: 4c b2 dd  

;-------------------------------------------------------------------------------
__ddab:     LDA #$36           ; $ddab: a9 36     
            JMP __ddb2         ; $ddad: 4c b2 dd  

;-------------------------------------------------------------------------------
__ddb0:     LDA #$38           ; $ddb0: a9 38     
__ddb2:     JSR __c853         ; $ddb2: 20 53 c8  
            JSR __efd5         ; $ddb5: 20 d5 ef  
            STX $04            ; $ddb8: 86 04     
            LDA $0200,x        ; $ddba: bd 00 02  
            JSR __e112         ; $ddbd: 20 12 e1  
            LDY $0a            ; $ddc0: a4 0a     
            CPY #$04           ; $ddc2: c0 04     
            BNE __ddc9         ; $ddc4: d0 03     
            JMP __de73         ; $ddc6: 4c 73 de  

;-------------------------------------------------------------------------------
__ddc9:     CMP #$00           ; $ddc9: c9 00     
            BEQ __ddd7         ; $ddcb: f0 0a     
            LDX $5d            ; $ddcd: a6 5d     
            LDA #$01           ; $ddcf: a9 01     
            STA $8a,x          ; $ddd1: 95 8a     
            LDA #$c1           ; $ddd3: a9 c1     
            STA $5e,x          ; $ddd5: 95 5e     
__ddd7:     JSR __efd5         ; $ddd7: 20 d5 ef  
            STX $04            ; $ddda: 86 04     
            LDX $5d            ; $dddc: a6 5d     
            LDA $5e,x          ; $ddde: b5 5e     
            CMP #$c1           ; $dde0: c9 c1     
            BNE __de13         ; $dde2: d0 2f     
            LDA #$20           ; $dde4: a9 20     
            JSR __dfe4         ; $dde6: 20 e4 df  
            BNE __ddf5         ; $dde9: d0 0a     
            LDX $04            ; $ddeb: a6 04     
            LDA $0200,x        ; $dded: bd 00 02  
            STA $01            ; $ddf0: 85 01     
            JMP __de27         ; $ddf2: 4c 27 de  

;-------------------------------------------------------------------------------
__ddf5:     LDX $5d            ; $ddf5: a6 5d     
            LDA #$c0           ; $ddf7: a9 c0     
            STA $5e,x          ; $ddf9: 95 5e     
            LDA $07            ; $ddfb: a5 07     
            CMP #$03           ; $ddfd: c9 03     
            BNE __de10         ; $ddff: d0 0f     
            LDA $0417,x        ; $de01: bd 17 04  
            BEQ __de0b         ; $de04: f0 05     
            LDA #$00           ; $de06: a9 00     
            JMP __de0d         ; $de08: 4c 0d de  

;-------------------------------------------------------------------------------
__de0b:     LDA #$01           ; $de0b: a9 01     
__de0d:     STA $0417,x        ; $de0d: 9d 17 04  
__de10:     JMP __de1a         ; $de10: 4c 1a de  

;-------------------------------------------------------------------------------
__de13:     LDA #$ff           ; $de13: a9 ff     
            JSR __dfe4         ; $de15: 20 e4 df  
            BEQ __de85         ; $de18: f0 6b     
__de1a:     LDX $04            ; $de1a: a6 04     
            LDA #$01           ; $de1c: a9 01     
            CLC                ; $de1e: 18        
            ADC $0200,x        ; $de1f: 7d 00 02  
            STA $01            ; $de22: 85 01     
            JSR __de86         ; $de24: 20 86 de  
__de27:     INX                ; $de27: e8        
            INX                ; $de28: e8        
            INX                ; $de29: e8        
            LDA $07            ; $de2a: a5 07     
            CMP #$02           ; $de2c: c9 02     
            BNE __de36         ; $de2e: d0 06     
            INC $0200,x        ; $de30: fe 00 02  
            JMP __de56         ; $de33: 4c 56 de  

;-------------------------------------------------------------------------------
__de36:     CMP #$03           ; $de36: c9 03     
            BNE __de56         ; $de38: d0 1c     
            LDA $01            ; $de3a: a5 01     
            AND #$01           ; $de3c: 29 01     
            BEQ __de56         ; $de3e: f0 16     
            LDY $5d            ; $de40: a4 5d     
            LDA $0417,y        ; $de42: b9 17 04  
            BNE __de50         ; $de45: d0 09     
            INC $0200,x        ; $de47: fe 00 02  
            INC $0200,x        ; $de4a: fe 00 02  
            JMP __de56         ; $de4d: 4c 56 de  

;-------------------------------------------------------------------------------
__de50:     DEC $0200,x        ; $de50: de 00 02  
            DEC $0200,x        ; $de53: de 00 02  
__de56:     LDA $0200,x        ; $de56: bd 00 02  
            STA $00            ; $de59: 85 00     
            LDX $5d            ; $de5b: a6 5d     
            LDA $72,x          ; $de5d: b5 72     
            CMP #$90           ; $de5f: c9 90     
            BNE __de68         ; $de61: d0 05     
            LDA #$94           ; $de63: a9 94     
            JMP __de6a         ; $de65: 4c 6a de  

;-------------------------------------------------------------------------------
__de68:     LDA #$90           ; $de68: a9 90     
__de6a:     STA $02            ; $de6a: 85 02     
            LDX $5d            ; $de6c: a6 5d     
            STA $72,x          ; $de6e: 95 72     
            JMP __eadb         ; $de70: 4c db ea  

;-------------------------------------------------------------------------------
__de73:     LDA #$c2           ; $de73: a9 c2     
            LDX $5d            ; $de75: a6 5d     
            STA $5e,x          ; $de77: 95 5e     
            LDX $04            ; $de79: a6 04     
            LDA $0203,x        ; $de7b: bd 03 02  
            STA $042b          ; $de7e: 8d 2b 04  
            RTS                ; $de81: 60        

;-------------------------------------------------------------------------------
__de82:     JSR __dea5         ; $de82: 20 a5 de  
__de85:     RTS                ; $de85: 60        

;-------------------------------------------------------------------------------
__de86:     LDA $07            ; $de86: a5 07     
            CMP #$01           ; $de88: c9 01     
            BNE __dea4         ; $de8a: d0 18     
            LDY #$00           ; $de8c: a0 00     
            LDA $01            ; $de8e: a5 01     
__de90:     CMP __c41d,y       ; $de90: d9 1d c4  
            BCC __de9f         ; $de93: 90 0a     
            CMP __c420,y       ; $de95: d9 20 c4  
            BCS __de9f         ; $de98: b0 05     
            INC $01            ; $de9a: e6 01     
            JMP __dea4         ; $de9c: 4c a4 de  

;-------------------------------------------------------------------------------
__de9f:     INY                ; $de9f: c8        
            CPY #$03           ; $dea0: c0 03     
            BNE __de90         ; $dea2: d0 ec     
__dea4:     RTS                ; $dea4: 60        

;-------------------------------------------------------------------------------
__dea5:     JSR __efd5         ; $dea5: 20 d5 ef  
            STX $04            ; $dea8: 86 04     
            JSR __eaec         ; $deaa: 20 ec ea  
            DEC $00            ; $dead: c6 00     
            LDA $042b          ; $deaf: ad 2b 04  
            SEC                ; $deb2: 38        
            SBC #$01           ; $deb3: e9 01     
            CMP $00            ; $deb5: c5 00     
            BEQ __dee8         ; $deb7: f0 2f     
            SEC                ; $deb9: 38        
            SBC #$01           ; $deba: e9 01     
            CMP $00            ; $debc: c5 00     
            BEQ __dee8         ; $debe: f0 28     
            SEC                ; $dec0: 38        
            SBC #$01           ; $dec1: e9 01     
            CMP $00            ; $dec3: c5 00     
            BEQ __def2         ; $dec5: f0 2b     
            SEC                ; $dec7: 38        
            SBC #$08           ; $dec8: e9 08     
            CMP $00            ; $deca: c5 00     
            BEQ __deed         ; $decc: f0 1f     
            SEC                ; $dece: 38        
            SBC #$01           ; $decf: e9 01     
            CMP $00            ; $ded1: c5 00     
            BEQ __deed         ; $ded3: f0 18     
            SEC                ; $ded5: 38        
            SBC #$01           ; $ded6: e9 01     
            CMP $00            ; $ded8: c5 00     
            BNE __defb         ; $deda: d0 1f     
__dedc:     LDA #$01           ; $dedc: a9 01     
            LDX $5d            ; $dede: a6 5d     
            STA $5e,x          ; $dee0: 95 5e     
            LDA #$00           ; $dee2: a9 00     
            STA $0417,x        ; $dee4: 9d 17 04  
            RTS                ; $dee7: 60        

;-------------------------------------------------------------------------------
__dee8:     DEC $01            ; $dee8: c6 01     
            JMP __defb         ; $deea: 4c fb de  

;-------------------------------------------------------------------------------
__deed:     INC $01            ; $deed: e6 01     
            JMP __defb         ; $deef: 4c fb de  

;-------------------------------------------------------------------------------
__def2:     LDX $5d            ; $def2: a6 5d     
            LDA $0421,x        ; $def4: bd 21 04  
            CMP #$01           ; $def7: c9 01     
            BEQ __dedc         ; $def9: f0 e1     
__defb:     LDA #$84           ; $defb: a9 84     
            LDX $5d            ; $defd: a6 5d     
            STA $72,x          ; $deff: 95 72     
            STA $02            ; $df01: 85 02     
            JSR __eadb         ; $df03: 20 db ea  
            RTS                ; $df06: 60        

;-------------------------------------------------------------------------------
__df07:     LDA #$55           ; $df07: a9 55     
            JSR __dfe4         ; $df09: 20 e4 df  
            BNE __df0f         ; $df0c: d0 01     
            RTS                ; $df0e: 60        

;-------------------------------------------------------------------------------
__df0f:     JSR __efd5         ; $df0f: 20 d5 ef  
            STX $04            ; $df12: 86 04     
            JSR __eaec         ; $df14: 20 ec ea  
            INC $01            ; $df17: e6 01     
            LDA $0201,x        ; $df19: bd 01 02  
            CMP #$90           ; $df1c: c9 90     
            BEQ __df25         ; $df1e: f0 05     
            LDA #$90           ; $df20: a9 90     
            JMP __df27         ; $df22: 4c 27 df  

;-------------------------------------------------------------------------------
__df25:     LDA #$94           ; $df25: a9 94     
__df27:     STA $02            ; $df27: 85 02     
            JSR __eadb         ; $df29: 20 db ea  
            LDA $c0            ; $df2c: a5 c0     
            CMP $01            ; $df2e: c5 01     
            BEQ __df35         ; $df30: f0 03     
            BCC __df35         ; $df32: 90 01     
            RTS                ; $df34: 60        

;-------------------------------------------------------------------------------
__df35:     LDX $5d            ; $df35: a6 5d     
            LDA #$01           ; $df37: a9 01     
            STA $5e,x          ; $df39: 95 5e     
            LDA #$00           ; $df3b: a9 00     
            STA $c0            ; $df3d: 85 c0     
            RTS                ; $df3f: 60        

;-------------------------------------------------------------------------------
__df40:     LDA $c0            ; $df40: a5 c0     
            BEQ __df45         ; $df42: f0 01     
            RTS                ; $df44: 60        

;-------------------------------------------------------------------------------
__df45:     LDA $96            ; $df45: a5 96     
            CMP #$0a           ; $df47: c9 0a     
            BEQ __df4c         ; $df49: f0 01     
            RTS                ; $df4b: 60        

;-------------------------------------------------------------------------------
__df4c:     LDA $59            ; $df4c: a5 59     
            CMP #$03           ; $df4e: c9 03     
            BEQ __df55         ; $df50: f0 03     
            JMP __df72         ; $df52: 4c 72 df  

;-------------------------------------------------------------------------------
__df55:     LDX #$03           ; $df55: a2 03     
            LDA $7e,x          ; $df57: b5 7e     
            CMP #$05           ; $df59: c9 05     
            BCS __df5e         ; $df5b: b0 01     
            RTS                ; $df5d: 60        

;-------------------------------------------------------------------------------
__df5e:     LDX #$00           ; $df5e: a2 00     
__df60:     LDA $5e,x          ; $df60: b5 5e     
            CMP #$01           ; $df62: c9 01     
            BNE __df6c         ; $df64: d0 06     
            LDA $68,x          ; $df66: b5 68     
            CMP #$03           ; $df68: c9 03     
            BEQ __df8f         ; $df6a: f0 23     
__df6c:     INX                ; $df6c: e8        
            CPX #$0a           ; $df6d: e0 0a     
            BNE __df60         ; $df6f: d0 ef     
            RTS                ; $df71: 60        

;-------------------------------------------------------------------------------
__df72:     LDX #$05           ; $df72: a2 05     
            LDA $7e,x          ; $df74: b5 7e     
            CMP #$05           ; $df76: c9 05     
            BCS __df7b         ; $df78: b0 01     
            RTS                ; $df7a: 60        

;-------------------------------------------------------------------------------
__df7b:     LDX #$00           ; $df7b: a2 00     
__df7d:     LDA $5e,x          ; $df7d: b5 5e     
            CMP #$01           ; $df7f: c9 01     
            BNE __df89         ; $df81: d0 06     
            LDA $68,x          ; $df83: b5 68     
            CMP #$05           ; $df85: c9 05     
            BEQ __df8f         ; $df87: f0 06     
__df89:     INX                ; $df89: e8        
            CMP #$0a           ; $df8a: c9 0a     
            BNE __df7d         ; $df8c: d0 ef     
            RTS                ; $df8e: 60        

;-------------------------------------------------------------------------------
__df8f:     LDA #$40           ; $df8f: a9 40     
            STA $5e,x          ; $df91: 95 5e     
            DEC $68,x          ; $df93: d6 68     
            TXA                ; $df95: 8a        
            CLC                ; $df96: 18        
            ADC #$03           ; $df97: 69 03     
            ASL                ; $df99: 0a        
            ASL                ; $df9a: 0a        
            ASL                ; $df9b: 0a        
            ASL                ; $df9c: 0a        
            TAY                ; $df9d: a8        
            LDA $0200,y        ; $df9e: b9 00 02  
            STA $01            ; $dfa1: 85 01     
            LDA $0203,y        ; $dfa3: b9 03 02  
            STA $00            ; $dfa6: 85 00     
            LDA __c1eb         ; $dfa8: ad eb c1  
            LDY #$00           ; $dfab: a0 00     
__dfad:     CMP $00            ; $dfad: c5 00     
            BCS __dfb8         ; $dfaf: b0 07     
            CLC                ; $dfb1: 18        
            ADC #$18           ; $dfb2: 69 18     
            INY                ; $dfb4: c8        
            JMP __dfad         ; $dfb5: 4c ad df  

;-------------------------------------------------------------------------------
__dfb8:     TYA                ; $dfb8: 98        
            ASL                ; $dfb9: 0a        
            CLC                ; $dfba: 18        
            ADC #$15           ; $dfbb: 69 15     
            CLC                ; $dfbd: 18        
            ADC $01            ; $dfbe: 65 01     
            STA $c0            ; $dfc0: 85 c0     
            RTS                ; $dfc2: 60        

;-------------------------------------------------------------------------------
__dfc3:     LDX $5d            ; $dfc3: a6 5d     
            LDA $68,x          ; $dfc5: b5 68     
            CMP #$01           ; $dfc7: c9 01     
            BNE __dfe3         ; $dfc9: d0 18     
            JSR __efd5         ; $dfcb: 20 d5 ef  
            LDA $0203,x        ; $dfce: bd 03 02  
            CMP #$30           ; $dfd1: c9 30     
            BCS __dfe3         ; $dfd3: b0 0e     
            LDA #$23           ; $dfd5: a9 23     
            STA $0202,x        ; $dfd7: 9d 02 02  
            STA $0206,x        ; $dfda: 9d 06 02  
            STA $020a,x        ; $dfdd: 9d 0a 02  
            STA $020e,x        ; $dfe0: 9d 0e 02  
__dfe3:     RTS                ; $dfe3: 60        

;-------------------------------------------------------------------------------
__dfe4:     STA $0a            ; $dfe4: 85 0a     
            STA $0b            ; $dfe6: 85 0b     
__dfe8:     LDX $5d            ; $dfe8: a6 5d     
            INC $8a,x          ; $dfea: f6 8a     
            LDA $8a,x          ; $dfec: b5 8a     
            BMI __dff7         ; $dfee: 30 07     
            CMP #$10           ; $dff0: c9 10     
            BCS __dff7         ; $dff2: b0 03     
            JMP __dffb         ; $dff4: 4c fb df  

;-------------------------------------------------------------------------------
__dff7:     LDA #$00           ; $dff7: a9 00     
            STA $8a,x          ; $dff9: 95 8a     
__dffb:     CMP #$08           ; $dffb: c9 08     
            BCS __e008         ; $dffd: b0 09     
            TAX                ; $dfff: aa        
            LDA __c1bc,x       ; $e000: bd bc c1  
            AND $0a            ; $e003: 25 0a     
            JMP __e011         ; $e005: 4c 11 e0  

;-------------------------------------------------------------------------------
__e008:     SEC                ; $e008: 38        
            SBC #$08           ; $e009: e9 08     
            TAX                ; $e00b: aa        
            LDA __c1bc,x       ; $e00c: bd bc c1  
            AND $0b            ; $e00f: 25 0b     
__e011:     BEQ __e015         ; $e011: f0 02     
            LDA #$01           ; $e013: a9 01     
__e015:     RTS                ; $e015: 60        

;-------------------------------------------------------------------------------
__e016:     STA $0a            ; $e016: 85 0a     
            LDA $53            ; $e018: a5 53     
            SEC                ; $e01a: 38        
            SBC #$01           ; $e01b: e9 01     
            ASL                ; $e01d: 0a        
            TAX                ; $e01e: aa        
            LDA __c493,x       ; $e01f: bd 93 c4  
            STA $08            ; $e022: 85 08     
            LDA __c494,x       ; $e024: bd 94 c4  
            STA $09            ; $e027: 85 09     
            LDY #$00           ; $e029: a0 00     
            LDA #$01           ; $e02b: a9 01     
            STA $0b            ; $e02d: 85 0b     
__e02f:     LDA ($08),y        ; $e02f: b1 08     
            CMP #$ff           ; $e031: c9 ff     
            BEQ __e041         ; $e033: f0 0c     
            CMP $0a            ; $e035: c5 0a     
            BEQ __e045         ; $e037: f0 0c     
            BCC __e045         ; $e039: 90 0a     
            INC $0b            ; $e03b: e6 0b     
            INY                ; $e03d: c8        
            JMP __e02f         ; $e03e: 4c 2f e0  

;-------------------------------------------------------------------------------
__e041:     LDA #$07           ; $e041: a9 07     
            STA $0b            ; $e043: 85 0b     
__e045:     LDA $0b            ; $e045: a5 0b     
            RTS                ; $e047: 60        

;-------------------------------------------------------------------------------
__e048:     LDX $5d            ; $e048: a6 5d     
            LDA $5e,x          ; $e04a: b5 5e     
            CMP #$01           ; $e04c: c9 01     
            BNE __e057         ; $e04e: d0 07     
            LDA $7d            ; $e050: a5 7d     
            BNE __e057         ; $e052: d0 03     
            LDA #$01           ; $e054: a9 01     
            RTS                ; $e056: 60        

;-------------------------------------------------------------------------------
__e057:     LDA #$00           ; $e057: a9 00     
            RTS                ; $e059: 60        

;-------------------------------------------------------------------------------
__e05a:     STA $0c            ; $e05a: 85 0c     
            LDX $5d            ; $e05c: a6 5d     
            LDA $68,x          ; $e05e: b5 68     
            CMP #$01           ; $e060: c9 01     
            BEQ __e079         ; $e062: f0 15     
            CMP #$06           ; $e064: c9 06     
            BEQ __e079         ; $e066: f0 11     
            LDX #$00           ; $e068: a2 00     
__e06a:     LDA __c1c4,x       ; $e06a: bd c4 c1  
            CMP $0c            ; $e06d: c5 0c     
            BEQ __e08a         ; $e06f: f0 19     
            INX                ; $e071: e8        
            CPX #$09           ; $e072: e0 09     
            BEQ __e08d         ; $e074: f0 17     
            JMP __e06a         ; $e076: 4c 6a e0  

;-------------------------------------------------------------------------------
__e079:     LDX #$04           ; $e079: a2 04     
__e07b:     LDA __c1c4,x       ; $e07b: bd c4 c1  
            CMP $0c            ; $e07e: c5 0c     
            BEQ __e08a         ; $e080: f0 08     
            INX                ; $e082: e8        
            CPX #$09           ; $e083: e0 09     
            BEQ __e08d         ; $e085: f0 06     
            JMP __e07b         ; $e087: 4c 7b e0  

;-------------------------------------------------------------------------------
__e08a:     LDA #$00           ; $e08a: a9 00     
            RTS                ; $e08c: 60        

;-------------------------------------------------------------------------------
__e08d:     LDA #$01           ; $e08d: a9 01     
            RTS                ; $e08f: 60        

;-------------------------------------------------------------------------------
__e090:     STA $0c            ; $e090: 85 0c     
            LDX $5d            ; $e092: a6 5d     
            LDA $68,x          ; $e094: b5 68     
            AND #$01           ; $e096: 29 01     
            BEQ __e09f         ; $e098: f0 05     
            LDX #$00           ; $e09a: a2 00     
            JMP __e0a1         ; $e09c: 4c a1 e0  

;-------------------------------------------------------------------------------
__e09f:     LDX #$01           ; $e09f: a2 01     
__e0a1:     LDA __c1cd,x       ; $e0a1: bd cd c1  
            CMP $0c            ; $e0a4: c5 0c     
            BEQ __e0ab         ; $e0a6: f0 03     
            LDA #$00           ; $e0a8: a9 00     
            RTS                ; $e0aa: 60        

;-------------------------------------------------------------------------------
__e0ab:     LDA #$01           ; $e0ab: a9 01     
            RTS                ; $e0ad: 60        

;-------------------------------------------------------------------------------
__e0ae:     STA $0c            ; $e0ae: 85 0c     
            LDX $5d            ; $e0b0: a6 5d     
            LDA $68,x          ; $e0b2: b5 68     
            CMP #$02           ; $e0b4: c9 02     
            BEQ __e0cb         ; $e0b6: f0 13     
            CMP #$03           ; $e0b8: c9 03     
            BEQ __e0cb         ; $e0ba: f0 0f     
            CMP #$04           ; $e0bc: c9 04     
            BEQ __e0d1         ; $e0be: f0 11     
            CMP #$05           ; $e0c0: c9 05     
            BEQ __e0dd         ; $e0c2: f0 19     
            CMP #$06           ; $e0c4: c9 06     
            BEQ __e0e9         ; $e0c6: f0 21     
            JMP __e0ec         ; $e0c8: 4c ec e0  

;-------------------------------------------------------------------------------
__e0cb:     JSR __e0f1         ; $e0cb: 20 f1 e0  
            JMP __e0ec         ; $e0ce: 4c ec e0  

;-------------------------------------------------------------------------------
__e0d1:     JSR __e0f1         ; $e0d1: 20 f1 e0  
            LDY #$89           ; $e0d4: a0 89     
            CMP #$c4           ; $e0d6: c9 c4     
            BEQ __e109         ; $e0d8: f0 2f     
            JMP __e0ec         ; $e0da: 4c ec e0  

;-------------------------------------------------------------------------------
__e0dd:     JSR __e0f1         ; $e0dd: 20 f1 e0  
            LDY #$71           ; $e0e0: a0 71     
            CMP #$b4           ; $e0e2: c9 b4     
            BEQ __e109         ; $e0e4: f0 23     
            JMP __e0ec         ; $e0e6: 4c ec e0  

;-------------------------------------------------------------------------------
__e0e9:     JSR __e0f1         ; $e0e9: 20 f1 e0  
__e0ec:     LDA #$00           ; $e0ec: a9 00     
            JMP __e10f         ; $e0ee: 4c 0f e1  

;-------------------------------------------------------------------------------
__e0f1:     TAX                ; $e0f1: aa        
            DEX                ; $e0f2: ca        
            DEX                ; $e0f3: ca        
            LDA $0c            ; $e0f4: a5 0c     
            LDY __c172,x       ; $e0f6: bc 72 c1  
            CMP __c177,x       ; $e0f9: dd 77 c1  
            BEQ __e107         ; $e0fc: f0 09     
            LDY __c17c,x       ; $e0fe: bc 7c c1  
            CMP __c181,x       ; $e101: dd 81 c1  
            BEQ __e107         ; $e104: f0 01     
            RTS                ; $e106: 60        

;-------------------------------------------------------------------------------
__e107:     PLA                ; $e107: 68        
            PLA                ; $e108: 68        
__e109:     LDX $5d            ; $e109: a6 5d     
            STY $a3,x          ; $e10b: 94 a3     
            LDA #$01           ; $e10d: a9 01     
__e10f:     STA $0c            ; $e10f: 85 0c     
            RTS                ; $e111: 60        

;-------------------------------------------------------------------------------
__e112:     STA $0b            ; $e112: 85 0b     
            LDY #$00           ; $e114: a0 00     
__e116:     LDA ($08),y        ; $e116: b1 08     
            CMP #$fe           ; $e118: c9 fe     
            BEQ __e129         ; $e11a: f0 0d     
            CMP $0b            ; $e11c: c5 0b     
            BEQ __e124         ; $e11e: f0 04     
            INY                ; $e120: c8        
            JMP __e116         ; $e121: 4c 16 e1  

;-------------------------------------------------------------------------------
__e124:     LDA #$01           ; $e124: a9 01     
            JMP __e12b         ; $e126: 4c 2b e1  

;-------------------------------------------------------------------------------
__e129:     LDA #$00           ; $e129: a9 00     
__e12b:     STA $0c            ; $e12b: 85 0c     
            STY $0a            ; $e12d: 84 0a     
            RTS                ; $e12f: 60        

;-------------------------------------------------------------------------------
__e130:     LDX $5d            ; $e130: a6 5d     
            LDA $68,x          ; $e132: b5 68     
            SEC                ; $e134: 38        
            SBC $59            ; $e135: e5 59     
            BEQ __e13e         ; $e137: f0 05     
            BMI __e13e         ; $e139: 30 03     
            JMP __e141         ; $e13b: 4c 41 e1  

;-------------------------------------------------------------------------------
__e13e:     LDA #$01           ; $e13e: a9 01     
            RTS                ; $e140: 60        

;-------------------------------------------------------------------------------
__e141:     LDA #$00           ; $e141: a9 00     
            RTS                ; $e143: 60        

;-------------------------------------------------------------------------------
            LDX #$00           ; $e144: a2 00     
            LDY #$20           ; $e146: a0 20     
__e148:     LDA $0200,y        ; $e148: b9 00 02  
            CMP #$ff           ; $e14b: c9 ff     
            BEQ __e157         ; $e14d: f0 08     
            JSR __e016         ; $e14f: 20 16 e0  
            STA $68,x          ; $e152: 95 68     
            JMP __e15b         ; $e154: 4c 5b e1  

;-------------------------------------------------------------------------------
__e157:     LDA #$00           ; $e157: a9 00     
            STA $68,x          ; $e159: 95 68     
__e15b:     TYA                ; $e15b: 98        
            CLC                ; $e15c: 18        
            ADC #$10           ; $e15d: 69 10     
            TAY                ; $e15f: a8        
            INX                ; $e160: e8        
            CPX #$0a           ; $e161: e0 0a     
            BNE __e148         ; $e163: d0 e3     
            RTS                ; $e165: 60        

;-------------------------------------------------------------------------------
__e166:     LDA #$00           ; $e166: a9 00     
            LDY #$06           ; $e168: a0 06     
__e16a:     STA $007e,y        ; $e16a: 99 7e 00  
            DEY                ; $e16d: 88        
            BPL __e16a         ; $e16e: 10 fa     
            LDY #$00           ; $e170: a0 00     
__e172:     LDA $0068,y        ; $e172: b9 68 00  
            BEQ __e17f         ; $e175: f0 08     
            TAX                ; $e177: aa        
            LDA $7e,x          ; $e178: b5 7e     
            CLC                ; $e17a: 18        
            ADC #$01           ; $e17b: 69 01     
            STA $7e,x          ; $e17d: 95 7e     
__e17f:     CPY #$09           ; $e17f: c0 09     
            BEQ __e187         ; $e181: f0 04     
            INY                ; $e183: c8        
            JMP __e172         ; $e184: 4c 72 e1  

;-------------------------------------------------------------------------------
__e187:     LDX $59            ; $e187: a6 59     
            CPX #$07           ; $e189: e0 07     
            BEQ __e199         ; $e18b: f0 0c     
            INC $7e,x          ; $e18d: f6 7e     
            LDA $96            ; $e18f: a5 96     
            CMP #$0a           ; $e191: c9 0a     
            BNE __e199         ; $e193: d0 04     
            LDX $59            ; $e195: a6 59     
            INC $7e,x          ; $e197: f6 7e     
__e199:     RTS                ; $e199: 60        

;-------------------------------------------------------------------------------
__e19a:     LDA $ad            ; $e19a: a5 ad     
            BNE __e19f         ; $e19c: d0 01     
            RTS                ; $e19e: 60        

;-------------------------------------------------------------------------------
__e19f:     CMP #$01           ; $e19f: c9 01     
            BNE __e1bf         ; $e1a1: d0 1c     
            LDA #$20           ; $e1a3: a9 20     
            STA $00            ; $e1a5: 85 00     
            LDA #$c0           ; $e1a7: a9 c0     
            STA $01            ; $e1a9: 85 01     
            LDA #$fc           ; $e1ab: a9 fc     
            STA $02            ; $e1ad: 85 02     
            LDA #$12           ; $e1af: a9 12     
            STA $03            ; $e1b1: 85 03     
            LDA #$e0           ; $e1b3: a9 e0     
            JSR __f080         ; $e1b5: 20 80 f0  
            LDA #$02           ; $e1b8: a9 02     
            STA $ad            ; $e1ba: 85 ad     
            JMP __e1e0         ; $e1bc: 4c e0 e1  

;-------------------------------------------------------------------------------
__e1bf:     LDA $38            ; $e1bf: a5 38     
            BNE __e1e4         ; $e1c1: d0 21     
            LDA #$03           ; $e1c3: a9 03     
            STA $ad            ; $e1c5: 85 ad     
            LDX #$e1           ; $e1c7: a2 e1     
            LDA $0200,x        ; $e1c9: bd 00 02  
            CMP #$fc           ; $e1cc: c9 fc     
            BEQ __e1d5         ; $e1ce: f0 05     
            LDA #$fc           ; $e1d0: a9 fc     
            JMP __e1d7         ; $e1d2: 4c d7 e1  

;-------------------------------------------------------------------------------
__e1d5:     LDA #$fe           ; $e1d5: a9 fe     
__e1d7:     STA $0200,x        ; $e1d7: 9d 00 02  
            CLC                ; $e1da: 18        
            ADC #$01           ; $e1db: 69 01     
            STA $0204,x        ; $e1dd: 9d 04 02  
__e1e0:     LDA #$10           ; $e1e0: a9 10     
            STA $38            ; $e1e2: 85 38     
__e1e4:     RTS                ; $e1e4: 60        

;-------------------------------------------------------------------------------
__e1e5:     LDA #$00           ; $e1e5: a9 00     
            STA $ae            ; $e1e7: 85 ae     
__e1e9:     JSR __efdd         ; $e1e9: 20 dd ef  
            LDA $0200,x        ; $e1ec: bd 00 02  
            CMP #$ff           ; $e1ef: c9 ff     
            BNE __e225         ; $e1f1: d0 32     
            LDA $53            ; $e1f3: a5 53     
            CMP #$01           ; $e1f5: c9 01     
            BEQ __e200         ; $e1f7: f0 07     
            CMP #$04           ; $e1f9: c9 04     
            BEQ __e213         ; $e1fb: f0 16     
            JMP __e225         ; $e1fd: 4c 25 e2  

;-------------------------------------------------------------------------------
__e200:     LDA $40            ; $e200: a5 40     
            BNE __e228         ; $e202: d0 24     
            LDA $ad            ; $e204: a5 ad     
            BEQ __e228         ; $e206: f0 20     
            CMP #$02           ; $e208: c9 02     
            BNE __e228         ; $e20a: d0 1c     
            LDA #$19           ; $e20c: a9 19     
            STA $40            ; $e20e: 85 40     
            JMP __e21f         ; $e210: 4c 1f e2  

;-------------------------------------------------------------------------------
__e213:     LDA $40            ; $e213: a5 40     
            BNE __e228         ; $e215: d0 11     
            JSR __eaf7         ; $e217: 20 f7 ea  
            LDA __c466,x       ; $e21a: bd 66 c4  
            STA $40            ; $e21d: 85 40     
__e21f:     LDA #$06           ; $e21f: a9 06     
            LDX $ae            ; $e221: a6 ae     
            STA $af,x          ; $e223: 95 af     
__e225:     JSR __e250         ; $e225: 20 50 e2  
__e228:     LDX $53            ; $e228: a6 53     
            DEX                ; $e22a: ca        
            INC $ae            ; $e22b: e6 ae     
            LDA $ae            ; $e22d: a5 ae     
            CMP __c1f6,x       ; $e22f: dd f6 c1  
            BEQ __e237         ; $e232: f0 03     
            JMP __e1e9         ; $e234: 4c e9 e1  

;-------------------------------------------------------------------------------
__e237:     LDA $53            ; $e237: a5 53     
            CMP #$03           ; $e239: c9 03     
            BEQ __e24f         ; $e23b: f0 12     
            LDA $3b            ; $e23d: a5 3b     
            BNE __e24f         ; $e23f: d0 0e     
            LDA #$00           ; $e241: a9 00     
            STA $d2            ; $e243: 85 d2     
            STA $d3            ; $e245: 85 d3     
            STA $d4            ; $e247: 85 d4     
            STA $d5            ; $e249: 85 d5     
            LDA #$bc           ; $e24b: a9 bc     
            STA $3b            ; $e24d: 85 3b     
__e24f:     RTS                ; $e24f: 60        

;-------------------------------------------------------------------------------
__e250:     LDX $ae            ; $e250: a6 ae     
            LDA $af,x          ; $e252: b5 af     
__e254:     AND #$0f           ; $e254: 29 0f     
            BEQ __e292         ; $e256: f0 3a     
            CMP #$06           ; $e258: c9 06     
            BEQ __e28f         ; $e25a: f0 33     
            CMP #$08           ; $e25c: c9 08     
            BEQ __e28f         ; $e25e: f0 2f     
            CMP #$01           ; $e260: c9 01     
            BEQ __e295         ; $e262: f0 31     
            CMP #$02           ; $e264: c9 02     
            BEQ __e29a         ; $e266: f0 32     
            CMP #$03           ; $e268: c9 03     
            BEQ __e2a1         ; $e26a: f0 35     
            LDA $53            ; $e26c: a5 53     
            CMP #$03           ; $e26e: c9 03     
            BEQ __e278         ; $e270: f0 06     
            JSR __e2b6         ; $e272: 20 b6 e2  
            JMP __e280         ; $e275: 4c 80 e2  

;-------------------------------------------------------------------------------
__e278:     LDA $19,x          ; $e278: b5 19     
            AND #$03           ; $e27a: 29 03     
            LDX $ae            ; $e27c: a6 ae     
            STA $af,x          ; $e27e: 95 af     
__e280:     LDA $af,x          ; $e280: b5 af     
            CMP #$01           ; $e282: c9 01     
            BEQ __e28a         ; $e284: f0 04     
            CMP #$02           ; $e286: c9 02     
            BNE __e28c         ; $e288: d0 02     
__e28a:     STA $b3,x          ; $e28a: 95 b3     
__e28c:     JMP __e254         ; $e28c: 4c 54 e2  

;-------------------------------------------------------------------------------
__e28f:     JMP __e538         ; $e28f: 4c 38 e5  

;-------------------------------------------------------------------------------
__e292:     JMP __e2f9         ; $e292: 4c f9 e2  

;-------------------------------------------------------------------------------
__e295:     LDA #$00           ; $e295: a9 00     
            JMP __e29c         ; $e297: 4c 9c e2  

;-------------------------------------------------------------------------------
__e29a:     LDA #$01           ; $e29a: a9 01     
__e29c:     STA $99            ; $e29c: 85 99     
            JMP __e368         ; $e29e: 4c 68 e3  

;-------------------------------------------------------------------------------
__e2a1:     LDA $53            ; $e2a1: a5 53     
            CMP #$01           ; $e2a3: c9 01     
            BNE __e2b3         ; $e2a5: d0 0c     
            JSR __e626         ; $e2a7: 20 26 e6  
            LDX $ae            ; $e2aa: a6 ae     
            LDA $af,x          ; $e2ac: b5 af     
            BNE __e2b3         ; $e2ae: d0 03     
            JMP __e292         ; $e2b0: 4c 92 e2  

;-------------------------------------------------------------------------------
__e2b3:     JMP __e41b         ; $e2b3: 4c 1b e4  

;-------------------------------------------------------------------------------
__e2b6:     LDX $ae            ; $e2b6: a6 ae     
            LDA $d2,x          ; $e2b8: b5 d2     
            BNE __e2dd         ; $e2ba: d0 21     
            LDA #$01           ; $e2bc: a9 01     
            STA $d2,x          ; $e2be: 95 d2     
            LDA $ae            ; $e2c0: a5 ae     
            CLC                ; $e2c2: 18        
            ADC #$01           ; $e2c3: 69 01     
            ASL                ; $e2c5: 0a        
            ASL                ; $e2c6: 0a        
            ASL                ; $e2c7: 0a        
            ASL                ; $e2c8: 0a        
            TAY                ; $e2c9: a8        
            LDA $0203,y        ; $e2ca: b9 03 02  
            CMP $0203          ; $e2cd: cd 03 02  
            BCS __e2d9         ; $e2d0: b0 07     
            LDA #$01           ; $e2d2: a9 01     
            STA $ec,x          ; $e2d4: 95 ec     
            JMP __e2dd         ; $e2d6: 4c dd e2  

;-------------------------------------------------------------------------------
__e2d9:     LDA #$02           ; $e2d9: a9 02     
            STA $ec,x          ; $e2db: 95 ec     
__e2dd:     LDA $19,x          ; $e2dd: b5 19     
            AND #$07           ; $e2df: 29 07     
            STA $af,x          ; $e2e1: 95 af     
            TAY                ; $e2e3: a8        
            CMP #$04           ; $e2e4: c9 04     
            BCS __e2eb         ; $e2e6: b0 03     
            JMP __e2f6         ; $e2e8: 4c f6 e2  

;-------------------------------------------------------------------------------
__e2eb:     LDY $ec,x          ; $e2eb: b4 ec     
            CMP #$07           ; $e2ed: c9 07     
            BCS __e2f4         ; $e2ef: b0 03     
            JMP __e2f6         ; $e2f1: 4c f6 e2  

;-------------------------------------------------------------------------------
__e2f4:     LDY #$03           ; $e2f4: a0 03     
__e2f6:     STY $af,x          ; $e2f6: 94 af     
            RTS                ; $e2f8: 60        

;-------------------------------------------------------------------------------
__e2f9:     LDA #$55           ; $e2f9: a9 55     
            STA $0a            ; $e2fb: 85 0a     
            STA $0b            ; $e2fd: 85 0b     
            JSR __e806         ; $e2ff: 20 06 e8  
            BNE __e305         ; $e302: d0 01     
            RTS                ; $e304: 60        

;-------------------------------------------------------------------------------
__e305:     JSR __efdd         ; $e305: 20 dd ef  
            STX $04            ; $e308: 86 04     
            JSR __eaec         ; $e30a: 20 ec ea  
            LDX $ae            ; $e30d: a6 ae     
            LDA $af,x          ; $e30f: b5 af     
            CMP #$20           ; $e311: c9 20     
            BNE __e31a         ; $e313: d0 05     
            LDA #$ff           ; $e315: a9 ff     
            STA $af,x          ; $e317: 95 af     
            RTS                ; $e319: 60        

;-------------------------------------------------------------------------------
__e31a:     CMP #$10           ; $e31a: c9 10     
            BEQ __e323         ; $e31c: f0 05     
            DEC $01            ; $e31e: c6 01     
            JMP __e325         ; $e320: 4c 25 e3  

;-------------------------------------------------------------------------------
__e323:     INC $01            ; $e323: e6 01     
__e325:     LDA $04            ; $e325: a5 04     
            TAY                ; $e327: a8        
            INY                ; $e328: c8        
            LDA $0200,y        ; $e329: b9 00 02  
            LDX $53            ; $e32c: a6 53     
            CPX #$04           ; $e32e: e0 04     
            BEQ __e340         ; $e330: f0 0e     
            CMP #$9c           ; $e332: c9 9c     
            BEQ __e33b         ; $e334: f0 05     
            LDA #$9c           ; $e336: a9 9c     
            JMP __e34b         ; $e338: 4c 4b e3  

;-------------------------------------------------------------------------------
__e33b:     LDA #$98           ; $e33b: a9 98     
            JMP __e34b         ; $e33d: 4c 4b e3  

;-------------------------------------------------------------------------------
__e340:     CMP #$ac           ; $e340: c9 ac     
            BEQ __e349         ; $e342: f0 05     
            LDA #$ac           ; $e344: a9 ac     
            JMP __e34b         ; $e346: 4c 4b e3  

;-------------------------------------------------------------------------------
__e349:     LDA #$a8           ; $e349: a9 a8     
__e34b:     JSR __ead4         ; $e34b: 20 d4 ea  
            LDX $ae            ; $e34e: a6 ae     
            LDA $b3,x          ; $e350: b5 b3     
            LSR                ; $e352: 4a        
            JSR __f096         ; $e353: 20 96 f0  
            LDX $ae            ; $e356: a6 ae     
            LDA $af,x          ; $e358: b5 af     
            CMP #$10           ; $e35a: c9 10     
            BEQ __e363         ; $e35c: f0 05     
            LDA #$10           ; $e35e: a9 10     
            JMP __e365         ; $e360: 4c 65 e3  

;-------------------------------------------------------------------------------
__e363:     LDA #$20           ; $e363: a9 20     
__e365:     STA $af,x          ; $e365: 95 af     
            RTS                ; $e367: 60        

;-------------------------------------------------------------------------------
__e368:     LDA #$55           ; $e368: a9 55     
            STA $0a            ; $e36a: 85 0a     
            STA $0b            ; $e36c: 85 0b     
            JSR __e806         ; $e36e: 20 06 e8  
            BNE __e374         ; $e371: d0 01     
            RTS                ; $e373: 60        

;-------------------------------------------------------------------------------
__e374:     JSR __efdd         ; $e374: 20 dd ef  
            STX $04            ; $e377: 86 04     
            JSR __eaec         ; $e379: 20 ec ea  
            LDA $99            ; $e37c: a5 99     
            BNE __e385         ; $e37e: d0 05     
            INC $00            ; $e380: e6 00     
            JMP __e387         ; $e382: 4c 87 e3  

;-------------------------------------------------------------------------------
__e385:     DEC $00            ; $e385: c6 00     
__e387:     LDA $00            ; $e387: a5 00     
            AND #$0f           ; $e389: 29 0f     
            CMP #$04           ; $e38b: c9 04     
            BEQ __e396         ; $e38d: f0 07     
            CMP #$0c           ; $e38f: c9 0c     
            BEQ __e396         ; $e391: f0 03     
            JMP __e39b         ; $e393: 4c 9b e3  

;-------------------------------------------------------------------------------
__e396:     INC $01            ; $e396: e6 01     
            JMP __e3af         ; $e398: 4c af e3  

;-------------------------------------------------------------------------------
__e39b:     LDX $99            ; $e39b: a6 99     
            CMP __c3e2,x       ; $e39d: dd e2 c3  
            BEQ __e3aa         ; $e3a0: f0 08     
            CMP __c3e4,x       ; $e3a2: dd e4 c3  
            BEQ __e3aa         ; $e3a5: f0 03     
            JMP __e3af         ; $e3a7: 4c af e3  

;-------------------------------------------------------------------------------
__e3aa:     DEC $01            ; $e3aa: c6 01     
            JMP __e3c0         ; $e3ac: 4c c0 e3  

;-------------------------------------------------------------------------------
__e3af:     CMP #$04           ; $e3af: c9 04     
            BEQ __e3ba         ; $e3b1: f0 07     
            CMP #$0c           ; $e3b3: c9 0c     
            BEQ __e3ba         ; $e3b5: f0 03     
            JMP __e3c0         ; $e3b7: 4c c0 e3  

;-------------------------------------------------------------------------------
__e3ba:     LDX $ae            ; $e3ba: a6 ae     
            LDA #$ff           ; $e3bc: a9 ff     
            STA $af,x          ; $e3be: 95 af     
__e3c0:     LDY $99            ; $e3c0: a4 99     
            JSR __e6a5         ; $e3c2: 20 a5 e6  
            BNE __e3ce         ; $e3c5: d0 07     
            LDA #$00           ; $e3c7: a9 00     
            LDX $ae            ; $e3c9: a6 ae     
            STA $af,x          ; $e3cb: 95 af     
            RTS                ; $e3cd: 60        

;-------------------------------------------------------------------------------
__e3ce:     LDA $99            ; $e3ce: a5 99     
            BEQ __e3ed         ; $e3d0: f0 1b     
            LDA $00            ; $e3d2: a5 00     
            CMP #$0c           ; $e3d4: c9 0c     
            BEQ __e3dd         ; $e3d6: f0 05     
            BCC __e3e6         ; $e3d8: 90 0c     
            JMP __e3ed         ; $e3da: 4c ed e3  

;-------------------------------------------------------------------------------
__e3dd:     LDA #$00           ; $e3dd: a9 00     
            LDX $ae            ; $e3df: a6 ae     
            STA $af,x          ; $e3e1: 95 af     
            JMP __e3ed         ; $e3e3: 4c ed e3  

;-------------------------------------------------------------------------------
__e3e6:     LDA #$00           ; $e3e6: a9 00     
            LDX $ae            ; $e3e8: a6 ae     
            STA $af,x          ; $e3ea: 95 af     
            RTS                ; $e3ec: 60        

;-------------------------------------------------------------------------------
__e3ed:     LDA $04            ; $e3ed: a5 04     
            TAY                ; $e3ef: a8        
            INY                ; $e3f0: c8        
            LDA $0200,y        ; $e3f1: b9 00 02  
            LDX $53            ; $e3f4: a6 53     
            CPX #$04           ; $e3f6: e0 04     
            BEQ __e408         ; $e3f8: f0 0e     
            CMP #$9c           ; $e3fa: c9 9c     
            BCS __e403         ; $e3fc: b0 05     
            LDA #$9c           ; $e3fe: a9 9c     
            JMP __e413         ; $e400: 4c 13 e4  

;-------------------------------------------------------------------------------
__e403:     LDA #$98           ; $e403: a9 98     
            JMP __e413         ; $e405: 4c 13 e4  

;-------------------------------------------------------------------------------
__e408:     CMP #$ac           ; $e408: c9 ac     
            BCS __e411         ; $e40a: b0 05     
            LDA #$ac           ; $e40c: a9 ac     
            JMP __e413         ; $e40e: 4c 13 e4  

;-------------------------------------------------------------------------------
__e411:     LDA #$a8           ; $e411: a9 a8     
__e413:     JSR __ead4         ; $e413: 20 d4 ea  
            LDA $99            ; $e416: a5 99     
            JMP __f096         ; $e418: 4c 96 f0  

;-------------------------------------------------------------------------------
__e41b:     LDX $ae            ; $e41b: a6 ae     
            LDA $af,x          ; $e41d: b5 af     
            LSR                ; $e41f: 4a        
            LSR                ; $e420: 4a        
            LSR                ; $e421: 4a        
            TAX                ; $e422: aa        
            LDA $53            ; $e423: a5 53     
            CMP #$04           ; $e425: c9 04     
            BEQ __e436         ; $e427: f0 0d     
__e429:     LDA __c3f4,x       ; $e429: bd f4 c3  
            STA $0a            ; $e42c: 85 0a     
            LDA __c3f5,x       ; $e42e: bd f5 c3  
            STA $0b            ; $e431: 85 0b     
            JMP __e44b         ; $e433: 4c 4b e4  

;-------------------------------------------------------------------------------
__e436:     LDA $50            ; $e436: a5 50     
            AND #$01           ; $e438: 29 01     
            CLC                ; $e43a: 18        
            ADC $54            ; $e43b: 65 54     
            CMP #$03           ; $e43d: c9 03     
            BCC __e429         ; $e43f: 90 e8     
            LDA __c3f8,x       ; $e441: bd f8 c3  
            STA $0a            ; $e444: 85 0a     
            LDA __c3f9,x       ; $e446: bd f9 c3  
            STA $0b            ; $e449: 85 0b     
__e44b:     JSR __e806         ; $e44b: 20 06 e8  
            BNE __e451         ; $e44e: d0 01     
            RTS                ; $e450: 60        

;-------------------------------------------------------------------------------
__e451:     JSR __efdd         ; $e451: 20 dd ef  
            STX $04            ; $e454: 86 04     
            JSR __eaec         ; $e456: 20 ec ea  
            LDX $ae            ; $e459: a6 ae     
            LDA $e8,x          ; $e45b: b5 e8     
            BEQ __e46d         ; $e45d: f0 0e     
            CMP #$03           ; $e45f: c9 03     
            BEQ __e466         ; $e461: f0 03     
            JMP __e46d         ; $e463: 4c 6d e4  

;-------------------------------------------------------------------------------
__e466:     LDA #$00           ; $e466: a9 00     
            STA $e8,x          ; $e468: 95 e8     
            JMP __e47a         ; $e46a: 4c 7a e4  

;-------------------------------------------------------------------------------
__e46d:     LDA $01            ; $e46d: a5 01     
            AND #$03           ; $e46f: 29 03     
            BNE __e47a         ; $e471: d0 07     
            LDA #$01           ; $e473: a9 01     
            INC $e8,x          ; $e475: f6 e8     
            JMP __e50c         ; $e477: 4c 0c e5  

;-------------------------------------------------------------------------------
__e47a:     LDA $53            ; $e47a: a5 53     
            CMP #$01           ; $e47c: c9 01     
            BEQ __e4b5         ; $e47e: f0 35     
            JSR __e7a3         ; $e480: 20 a3 e7  
            CMP #$03           ; $e483: c9 03     
            BEQ __e48e         ; $e485: f0 07     
            CMP #$13           ; $e487: c9 13     
            BEQ __e49b         ; $e489: f0 10     
            JMP __e50c         ; $e48b: 4c 0c e5  

;-------------------------------------------------------------------------------
__e48e:     DEC $01            ; $e48e: c6 01     
            LDA $01            ; $e490: a5 01     
            LDX $ae            ; $e492: a6 ae     
            CMP $db,x          ; $e494: d5 db     
            BEQ __e4a8         ; $e496: f0 10     
            JMP __e50c         ; $e498: 4c 0c e5  

;-------------------------------------------------------------------------------
__e49b:     INC $01            ; $e49b: e6 01     
            LDA $01            ; $e49d: a5 01     
            LDX $ae            ; $e49f: a6 ae     
            CMP $db,x          ; $e4a1: d5 db     
            BEQ __e4a8         ; $e4a3: f0 03     
            JMP __e50c         ; $e4a5: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4a8:     LDA #$01           ; $e4a8: a9 01     
            LDX $ae            ; $e4aa: a6 ae     
            STA $af,x          ; $e4ac: 95 af     
            LDA #$00           ; $e4ae: a9 00     
            STA $db,x          ; $e4b0: 95 db     
            JMP __e50c         ; $e4b2: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4b5:     LDX $ae            ; $e4b5: a6 ae     
            LDA $af,x          ; $e4b7: b5 af     
            CMP #$13           ; $e4b9: c9 13     
            BEQ __e4c0         ; $e4bb: f0 03     
            JMP __e4d6         ; $e4bd: 4c d6 e4  

;-------------------------------------------------------------------------------
__e4c0:     INC $01            ; $e4c0: e6 01     
            LDA $ae            ; $e4c2: a5 ae     
            ASL                ; $e4c4: 0a        
            TAX                ; $e4c5: aa        
            INX                ; $e4c6: e8        
            LDA $b9,x          ; $e4c7: b5 b9     
            CMP $01            ; $e4c9: c5 01     
            BNE __e4d3         ; $e4cb: d0 06     
            LDA #$01           ; $e4cd: a9 01     
            LDX $ae            ; $e4cf: a6 ae     
            STA $af,x          ; $e4d1: 95 af     
__e4d3:     JMP __e50c         ; $e4d3: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4d6:     DEC $01            ; $e4d6: c6 01     
            LDX $ae            ; $e4d8: a6 ae     
            CPX #$00           ; $e4da: e0 00     
            BNE __e4f9         ; $e4dc: d0 1b     
            LDX $ae            ; $e4de: a6 ae     
            LDA $e0,x          ; $e4e0: b5 e0     
            CMP #$02           ; $e4e2: c9 02     
            BEQ __e4f9         ; $e4e4: f0 13     
            LDA $ae            ; $e4e6: a5 ae     
            ASL                ; $e4e8: 0a        
            TAX                ; $e4e9: aa        
            LDA $b9,x          ; $e4ea: b5 b9     
            CMP $01            ; $e4ec: c5 01     
            BNE __e50c         ; $e4ee: d0 1c     
            LDA #$02           ; $e4f0: a9 02     
            LDX $ae            ; $e4f2: a6 ae     
            STA $af,x          ; $e4f4: 95 af     
            JMP __e50c         ; $e4f6: 4c 0c e5  

;-------------------------------------------------------------------------------
__e4f9:     LDA $ae            ; $e4f9: a5 ae     
            ASL                ; $e4fb: 0a        
            TAX                ; $e4fc: aa        
            LDA $b9,x          ; $e4fd: b5 b9     
            CLC                ; $e4ff: 18        
            ADC #$0d           ; $e500: 69 0d     
            CMP $01            ; $e502: c5 01     
            BNE __e50c         ; $e504: d0 06     
            LDA #$13           ; $e506: a9 13     
            LDX $ae            ; $e508: a6 ae     
            STA $af,x          ; $e50a: 95 af     
__e50c:     LDA $04            ; $e50c: a5 04     
            TAY                ; $e50e: a8        
            INY                ; $e50f: c8        
            LDA $0200,y        ; $e510: b9 00 02  
            LDX $53            ; $e513: a6 53     
            CPX #$04           ; $e515: e0 04     
            BEQ __e527         ; $e517: f0 0e     
            CMP #$9c           ; $e519: c9 9c     
            BCS __e522         ; $e51b: b0 05     
            LDA #$9c           ; $e51d: a9 9c     
            JMP __e532         ; $e51f: 4c 32 e5  

;-------------------------------------------------------------------------------
__e522:     LDA #$98           ; $e522: a9 98     
            JMP __e532         ; $e524: 4c 32 e5  

;-------------------------------------------------------------------------------
__e527:     CMP #$ac           ; $e527: c9 ac     
            BCS __e530         ; $e529: b0 05     
            LDA #$ac           ; $e52b: a9 ac     
            JMP __e532         ; $e52d: 4c 32 e5  

;-------------------------------------------------------------------------------
__e530:     LDA #$a8           ; $e530: a9 a8     
__e532:     JSR __ead4         ; $e532: 20 d4 ea  
            JMP __f088         ; $e535: 4c 88 f0  

;-------------------------------------------------------------------------------
__e538:     LDX $ae            ; $e538: a6 ae     
            LDA $af,x          ; $e53a: b5 af     
            CMP #$06           ; $e53c: c9 06     
            BEQ __e548         ; $e53e: f0 08     
            CMP #$08           ; $e540: c9 08     
            BEQ __e545         ; $e542: f0 01     
            RTS                ; $e544: 60        

;-------------------------------------------------------------------------------
__e545:     JMP __e59f         ; $e545: 4c 9f e5  

;-------------------------------------------------------------------------------
__e548:     LDA $53            ; $e548: a5 53     
            CMP #$01           ; $e54a: c9 01     
            BEQ __e553         ; $e54c: f0 05     
            CMP #$04           ; $e54e: c9 04     
            BEQ __e564         ; $e550: f0 12     
            RTS                ; $e552: 60        

;-------------------------------------------------------------------------------
__e553:     LDA #$20           ; $e553: a9 20     
            STA $00            ; $e555: 85 00     
            LDA #$b8           ; $e557: a9 b8     
            STA $01            ; $e559: 85 01     
            LDX $ae            ; $e55b: a6 ae     
            LDA #$08           ; $e55d: a9 08     
            STA $af,x          ; $e55f: 95 af     
            JMP __e592         ; $e561: 4c 92 e5  

;-------------------------------------------------------------------------------
__e564:     LDA $0203          ; $e564: ad 03 02  
            CMP #$78           ; $e567: c9 78     
            BCC __e570         ; $e569: 90 05     
            LDY #$00           ; $e56b: a0 00     
            JMP __e572         ; $e56d: 4c 72 e5  

;-------------------------------------------------------------------------------
__e570:     LDY #$08           ; $e570: a0 08     
__e572:     STY $0c            ; $e572: 84 0c     
            LDA $19            ; $e574: a5 19     
            AND #$03           ; $e576: 29 03     
            ASL                ; $e578: 0a        
            CLC                ; $e579: 18        
            ADC $0c            ; $e57a: 65 0c     
            TAX                ; $e57c: aa        
            LDA __c3ce,x       ; $e57d: bd ce c3  
            STA $00            ; $e580: 85 00     
            LDA __c3cf,x       ; $e582: bd cf c3  
            STA $01            ; $e585: 85 01     
            LDX $ae            ; $e587: a6 ae     
            LDA #$00           ; $e589: a9 00     
            STA $af,x          ; $e58b: 95 af     
            LDA #$a8           ; $e58d: a9 a8     
            JMP __e594         ; $e58f: 4c 94 e5  

;-------------------------------------------------------------------------------
__e592:     LDA #$98           ; $e592: a9 98     
__e594:     JSR __ead4         ; $e594: 20 d4 ea  
            JSR __efdd         ; $e597: 20 dd ef  
            STA $04            ; $e59a: 85 04     
            JMP __f082         ; $e59c: 4c 82 f0  

;-------------------------------------------------------------------------------
__e59f:     JSR __efdd         ; $e59f: 20 dd ef  
            STX $04            ; $e5a2: 86 04     
            JSR __eaec         ; $e5a4: 20 ec ea  
            LDA $0201,x        ; $e5a7: bd 01 02  
            JSR __ead4         ; $e5aa: 20 d4 ea  
            LDA $53            ; $e5ad: a5 53     
            CMP #$01           ; $e5af: c9 01     
            BEQ __e5b4         ; $e5b1: f0 01     
            RTS                ; $e5b3: 60        

;-------------------------------------------------------------------------------
__e5b4:     INC $00            ; $e5b4: e6 00     
            LDA $00            ; $e5b6: a5 00     
            CMP #$2c           ; $e5b8: c9 2c     
            BEQ __e5be         ; $e5ba: f0 02     
            BCC __e5e5         ; $e5bc: 90 27     
__e5be:     INC $01            ; $e5be: e6 01     
            LDA $01            ; $e5c0: a5 01     
            CMP #$c5           ; $e5c2: c9 c5     
            BNE __e5e5         ; $e5c4: d0 1f     
            LDA #$00           ; $e5c6: a9 00     
            LDX $ae            ; $e5c8: a6 ae     
            STA $af,x          ; $e5ca: 95 af     
            DEC $00            ; $e5cc: c6 00     
            LDA $00            ; $e5ce: a5 00     
            CMP #$68           ; $e5d0: c9 68     
            BCS __e5d9         ; $e5d2: b0 05     
            INC $01            ; $e5d4: e6 01     
            JMP __e5db         ; $e5d6: 4c db e5  

;-------------------------------------------------------------------------------
__e5d9:     DEC $01            ; $e5d9: c6 01     
__e5db:     CMP #$60           ; $e5db: c9 60     
            BNE __e5e5         ; $e5dd: d0 06     
            LDX $ae            ; $e5df: a6 ae     
            LDA #$00           ; $e5e1: a9 00     
            STA $af,x          ; $e5e3: 95 af     
__e5e5:     JMP __f082         ; $e5e5: 4c 82 f0  

;-------------------------------------------------------------------------------
__e5e8:     STA $0c            ; $e5e8: 85 0c     
            LDX $ae            ; $e5ea: a6 ae     
            LDA $e0,x          ; $e5ec: b5 e0     
            CMP #$01           ; $e5ee: c9 01     
            BEQ __e60f         ; $e5f0: f0 1d     
            CMP #$06           ; $e5f2: c9 06     
            BEQ __e60f         ; $e5f4: f0 19     
            LDX #$00           ; $e5f6: a2 00     
            LDA #$18           ; $e5f8: a9 18     
__e5fa:     CMP $0c            ; $e5fa: c5 0c     
            BEQ __e609         ; $e5fc: f0 0b     
            INX                ; $e5fe: e8        
            CPX #$09           ; $e5ff: e0 09     
            BEQ __e60c         ; $e601: f0 09     
            LDA __c1c4,x       ; $e603: bd c4 c1  
            JMP __e5fa         ; $e606: 4c fa e5  

;-------------------------------------------------------------------------------
__e609:     LDA #$00           ; $e609: a9 00     
            RTS                ; $e60b: 60        

;-------------------------------------------------------------------------------
__e60c:     LDA #$01           ; $e60c: a9 01     
            RTS                ; $e60e: 60        

;-------------------------------------------------------------------------------
__e60f:     LDX #$04           ; $e60f: a2 04     
__e611:     LDA __c1c4,x       ; $e611: bd c4 c1  
            CMP $0c            ; $e614: c5 0c     
            BEQ __e620         ; $e616: f0 08     
            INX                ; $e618: e8        
            CPX #$09           ; $e619: e0 09     
            BEQ __e623         ; $e61b: f0 06     
            JMP __e611         ; $e61d: 4c 11 e6  

;-------------------------------------------------------------------------------
__e620:     LDA #$00           ; $e620: a9 00     
            RTS                ; $e622: 60        

;-------------------------------------------------------------------------------
__e623:     LDA #$01           ; $e623: a9 01     
            RTS                ; $e625: 60        

;-------------------------------------------------------------------------------
__e626:     LDX $ae            ; $e626: a6 ae     
            LDA $af,x          ; $e628: b5 af     
            CMP #$13           ; $e62a: c9 13     
            BNE __e62f         ; $e62c: d0 01     
            RTS                ; $e62e: 60        

;-------------------------------------------------------------------------------
__e62f:     JSR __efdd         ; $e62f: 20 dd ef  
            JSR __eaec         ; $e632: 20 ec ea  
            LDX $ae            ; $e635: a6 ae     
            LDA $e0,x          ; $e637: b5 e0     
            CMP #$01           ; $e639: c9 01     
            BEQ __e640         ; $e63b: f0 03     
            JMP __e66d         ; $e63d: 4c 6d e6  

;-------------------------------------------------------------------------------
__e640:     LDA $00            ; $e640: a5 00     
            CMP #$5c           ; $e642: c9 5c     
            BEQ __e64d         ; $e644: f0 07     
            CMP #$c4           ; $e646: c9 c4     
            BEQ __e65d         ; $e648: f0 13     
            JMP __e69e         ; $e64a: 4c 9e e6  

;-------------------------------------------------------------------------------
__e64d:     LDA $ae            ; $e64d: a5 ae     
            ASL                ; $e64f: 0a        
            TAX                ; $e650: aa        
            LDA #$a6           ; $e651: a9 a6     
            STA $b9,x          ; $e653: 95 b9     
            INX                ; $e655: e8        
            LDA #$c7           ; $e656: a9 c7     
            STA $b9,x          ; $e658: 95 b9     
            JMP __e697         ; $e65a: 4c 97 e6  

;-------------------------------------------------------------------------------
__e65d:     LDA $ae            ; $e65d: a5 ae     
            ASL                ; $e65f: 0a        
            TAX                ; $e660: aa        
            LDA #$ab           ; $e661: a9 ab     
            STA $b9,x          ; $e663: 95 b9     
            INX                ; $e665: e8        
            LDA #$c3           ; $e666: a9 c3     
            STA $b9,x          ; $e668: 95 b9     
            JMP __e697         ; $e66a: 4c 97 e6  

;-------------------------------------------------------------------------------
__e66d:     LDA $00            ; $e66d: a5 00     
            CMP #$2c           ; $e66f: c9 2c     
            BEQ __e67a         ; $e671: f0 07     
            CMP #$6c           ; $e673: c9 6c     
            BEQ __e68a         ; $e675: f0 13     
            JMP __e69e         ; $e677: 4c 9e e6  

;-------------------------------------------------------------------------------
__e67a:     LDA $ae            ; $e67a: a5 ae     
            ASL                ; $e67c: 0a        
            TAX                ; $e67d: aa        
            LDA #$8d           ; $e67e: a9 8d     
            STA $b9,x          ; $e680: 95 b9     
            INX                ; $e682: e8        
            LDA #$a4           ; $e683: a9 a4     
            STA $b9,x          ; $e685: 95 b9     
            JMP __e697         ; $e687: 4c 97 e6  

;-------------------------------------------------------------------------------
__e68a:     LDA $ae            ; $e68a: a5 ae     
            ASL                ; $e68c: 0a        
            TAX                ; $e68d: aa        
            LDA #$8a           ; $e68e: a9 8a     
            STA $b9,x          ; $e690: 95 b9     
            INX                ; $e692: e8        
            LDA #$a7           ; $e693: a9 a7     
            STA $b9,x          ; $e695: 95 b9     
__e697:     LDA #$03           ; $e697: a9 03     
            LDX $ae            ; $e699: a6 ae     
            STA $af,x          ; $e69b: 95 af     
            RTS                ; $e69d: 60        

;-------------------------------------------------------------------------------
__e69e:     LDA #$00           ; $e69e: a9 00     
            LDX $ae            ; $e6a0: a6 ae     
            STA $af,x          ; $e6a2: 95 af     
            RTS                ; $e6a4: 60        

;-------------------------------------------------------------------------------
__e6a5:     LDA $01            ; $e6a5: a5 01     
            CLC                ; $e6a7: 18        
            ADC #$0b           ; $e6a8: 69 0b     
            JSR __e016         ; $e6aa: 20 16 e0  
            LDY $99            ; $e6ad: a4 99     
            LDX $ae            ; $e6af: a6 ae     
            STA $e0,x          ; $e6b1: 95 e0     
            LDA $53            ; $e6b3: a5 53     
            CMP #$01           ; $e6b5: c9 01     
            BNE __e6bc         ; $e6b7: d0 03     
            JMP __e6c6         ; $e6b9: 4c c6 e6  

;-------------------------------------------------------------------------------
__e6bc:     CMP #$03           ; $e6bc: c9 03     
            BNE __e6c3         ; $e6be: d0 03     
            JMP __e702         ; $e6c0: 4c 02 e7  

;-------------------------------------------------------------------------------
__e6c3:     JMP __e73c         ; $e6c3: 4c 3c e7  

;-------------------------------------------------------------------------------
__e6c6:     LDA $00            ; $e6c6: a5 00     
            JSR __e5e8         ; $e6c8: 20 e8 e5  
            BNE __e6e3         ; $e6cb: d0 16     
            LDX $ae            ; $e6cd: a6 ae     
            LDA $e0,x          ; $e6cf: b5 e0     
            AND #$01           ; $e6d1: 29 01     
            BEQ __e6db         ; $e6d3: f0 06     
            LDA __c79a,y       ; $e6d5: b9 9a c7  
            JMP __e6de         ; $e6d8: 4c de e6  

;-------------------------------------------------------------------------------
__e6db:     LDA __c79c,y       ; $e6db: b9 9c c7  
__e6de:     CLC                ; $e6de: 18        
            ADC $01            ; $e6df: 65 01     
            STA $01            ; $e6e1: 85 01     
__e6e3:     LDX $ae            ; $e6e3: a6 ae     
            LDA $e0,x          ; $e6e5: b5 e0     
            CMP #$01           ; $e6e7: c9 01     
            BEQ __e6f3         ; $e6e9: f0 08     
            LDA $00            ; $e6eb: a5 00     
            CMP __c3e6,y       ; $e6ed: d9 e6 c3  
            BEQ __e6fb         ; $e6f0: f0 09     
            RTS                ; $e6f2: 60        

;-------------------------------------------------------------------------------
__e6f3:     LDA $00            ; $e6f3: a5 00     
            CMP __c3e8,y       ; $e6f5: d9 e8 c3  
            BEQ __e6fb         ; $e6f8: f0 01     
            RTS                ; $e6fa: 60        

;-------------------------------------------------------------------------------
__e6fb:     LDA #$00           ; $e6fb: a9 00     
            LDX $ae            ; $e6fd: a6 ae     
            STA $af,x          ; $e6ff: 95 af     
            RTS                ; $e701: 60        

;-------------------------------------------------------------------------------
__e702:     LDX $ae            ; $e702: a6 ae     
            LDA $e0,x          ; $e704: b5 e0     
            CMP #$02           ; $e706: c9 02     
            BNE __e719         ; $e708: d0 0f     
            LDA $00            ; $e70a: a5 00     
            CMP __c3ea,y       ; $e70c: d9 ea c3  
            BEQ __e735         ; $e70f: f0 24     
            CMP __c3ec,y       ; $e711: d9 ec c3  
            BEQ __e735         ; $e714: f0 1f     
            JMP __e72d         ; $e716: 4c 2d e7  

;-------------------------------------------------------------------------------
__e719:     CPY #$01           ; $e719: c0 01     
            BNE __e721         ; $e71b: d0 04     
            CMP #$04           ; $e71d: c9 04     
            BEQ __e72e         ; $e71f: f0 0d     
__e721:     LDA $00            ; $e721: a5 00     
            CMP __c3ee,y       ; $e723: d9 ee c3  
            BEQ __e735         ; $e726: f0 0d     
            CMP __c3f0,y       ; $e728: d9 f0 c3  
            BEQ __e735         ; $e72b: f0 08     
__e72d:     RTS                ; $e72d: 60        

;-------------------------------------------------------------------------------
__e72e:     LDA $00            ; $e72e: a5 00     
            CMP #$db           ; $e730: c9 db     
            BEQ __e735         ; $e732: f0 01     
            RTS                ; $e734: 60        

;-------------------------------------------------------------------------------
__e735:     LDX $ae            ; $e735: a6 ae     
            LDA #$00           ; $e737: a9 00     
            STA $af,x          ; $e739: 95 af     
            RTS                ; $e73b: 60        

;-------------------------------------------------------------------------------
__e73c:     LDX $ae            ; $e73c: a6 ae     
            LDA $e0,x          ; $e73e: b5 e0     
            TAY                ; $e740: a8        
            DEY                ; $e741: 88        
            LDX $99            ; $e742: a6 99     
            LDA __c3f2,x       ; $e744: bd f2 c3  
__e747:     CPY #$00           ; $e747: c0 00     
            BEQ __e75c         ; $e749: f0 11     
            CPX #$00           ; $e74b: e0 00     
            BEQ __e755         ; $e74d: f0 06     
            CLC                ; $e74f: 18        
            ADC #$08           ; $e750: 69 08     
            JMP __e758         ; $e752: 4c 58 e7  

;-------------------------------------------------------------------------------
__e755:     SEC                ; $e755: 38        
            SBC #$08           ; $e756: e9 08     
__e758:     DEY                ; $e758: 88        
            JMP __e747         ; $e759: 4c 47 e7  

;-------------------------------------------------------------------------------
__e75c:     CMP $00            ; $e75c: c5 00     
            BEQ __e769         ; $e75e: f0 09     
            LDA $99            ; $e760: a5 99     
            ASL                ; $e762: 0a        
            JSR __e770         ; $e763: 20 70 e7  
            BEQ __e769         ; $e766: f0 01     
            RTS                ; $e768: 60        

;-------------------------------------------------------------------------------
__e769:     LDX $ae            ; $e769: a6 ae     
            LDA #$00           ; $e76b: a9 00     
            STA $af,x          ; $e76d: 95 af     
            RTS                ; $e76f: 60        

;-------------------------------------------------------------------------------
__e770:     STA $09            ; $e770: 85 09     
            JSR __efdd         ; $e772: 20 dd ef  
            LDA $0203,x        ; $e775: bd 03 02  
            STA $0a            ; $e778: 85 0a     
            LDX $ae            ; $e77a: a6 ae     
            LDA $e0,x          ; $e77c: b5 e0     
            SEC                ; $e77e: 38        
            SBC #$02           ; $e77f: e9 02     
            ASL                ; $e781: 0a        
            TAX                ; $e782: aa        
            LDA $c1,x          ; $e783: b5 c1     
            BEQ __e790         ; $e785: f0 09     
            LDY $09            ; $e787: a4 09     
            LDA __c3de,y       ; $e789: b9 de c3  
            CMP $0a            ; $e78c: c5 0a     
            BEQ __e79d         ; $e78e: f0 0d     
__e790:     LDA $c2,x          ; $e790: b5 c2     
            BEQ __e7a0         ; $e792: f0 0c     
            LDY $09            ; $e794: a4 09     
            LDA __c3df,y       ; $e796: b9 df c3  
            CMP $0a            ; $e799: c5 0a     
            BNE __e7a0         ; $e79b: d0 03     
__e79d:     LDA #$00           ; $e79d: a9 00     
            RTS                ; $e79f: 60        

;-------------------------------------------------------------------------------
__e7a0:     LDA #$01           ; $e7a0: a9 01     
            RTS                ; $e7a2: 60        

;-------------------------------------------------------------------------------
__e7a3:     LDX $ae            ; $e7a3: a6 ae     
            LDA $db,x          ; $e7a5: b5 db     
            BEQ __e7ae         ; $e7a7: f0 05     
            LDX $ae            ; $e7a9: a6 ae     
            LDA $af,x          ; $e7ab: b5 af     
            RTS                ; $e7ad: 60        

;-------------------------------------------------------------------------------
__e7ae:     LDA $53            ; $e7ae: a5 53     
            SEC                ; $e7b0: 38        
            SBC #$02           ; $e7b1: e9 02     
            ASL                ; $e7b3: 0a        
            TAY                ; $e7b4: a8        
            LDA __c49b,y       ; $e7b5: b9 9b c4  
            STA $07            ; $e7b8: 85 07     
            LDA __c49c,y       ; $e7ba: b9 9c c4  
            STA $08            ; $e7bd: 85 08     
            LDX $ae            ; $e7bf: a6 ae     
            LDY $e0,x          ; $e7c1: b4 e0     
            BEQ __e7f2         ; $e7c3: f0 2d     
            DEY                ; $e7c5: 88        
            LDA ($07),y        ; $e7c6: b1 07     
            STA $09            ; $e7c8: 85 09     
            INY                ; $e7ca: c8        
            LDA ($07),y        ; $e7cb: b1 07     
            STA $0a            ; $e7cd: 85 0a     
            LDA $53            ; $e7cf: a5 53     
            SEC                ; $e7d1: 38        
            SBC #$02           ; $e7d2: e9 02     
            ASL                ; $e7d4: 0a        
            TAY                ; $e7d5: a8        
            LDA __c4a1,y       ; $e7d6: b9 a1 c4  
            STA $07            ; $e7d9: 85 07     
            LDA __c4a2,y       ; $e7db: b9 a2 c4  
            STA $08            ; $e7de: 85 08     
            LDY $09            ; $e7e0: a4 09     
__e7e2:     CPY $0a            ; $e7e2: c4 0a     
            BEQ __e7f2         ; $e7e4: f0 0c     
            LDA ($07),y        ; $e7e6: b1 07     
            CMP $00            ; $e7e8: c5 00     
            BEQ __e7f9         ; $e7ea: f0 0d     
            INY                ; $e7ec: c8        
            INY                ; $e7ed: c8        
            INY                ; $e7ee: c8        
            JMP __e7e2         ; $e7ef: 4c e2 e7  

;-------------------------------------------------------------------------------
__e7f2:     LDA #$00           ; $e7f2: a9 00     
            LDX $ae            ; $e7f4: a6 ae     
            STA $af,x          ; $e7f6: 95 af     
            RTS                ; $e7f8: 60        

;-------------------------------------------------------------------------------
__e7f9:     INY                ; $e7f9: c8        
            LDA ($07),y        ; $e7fa: b1 07     
            LDX $ae            ; $e7fc: a6 ae     
            STA $db,x          ; $e7fe: 95 db     
            INY                ; $e800: c8        
            LDA ($07),y        ; $e801: b1 07     
            .hex 95            ; $e803: 95        Suspected data
__e804:     .hex af 60         ; $e804: af 60     Suspected data
__e806:     LDX $ae            ; $e806: a6 ae     
            INC $e4,x          ; $e808: f6 e4     
            LDA $e4,x          ; $e80a: b5 e4     
            BMI __e815         ; $e80c: 30 07     
            CMP #$10           ; $e80e: c9 10     
            BCS __e815         ; $e810: b0 03     
            JMP __e819         ; $e812: 4c 19 e8  

;-------------------------------------------------------------------------------
__e815:     LDA #$00           ; $e815: a9 00     
            STA $e4,x          ; $e817: 95 e4     
__e819:     CMP #$08           ; $e819: c9 08     
            BCS __e826         ; $e81b: b0 09     
            TAX                ; $e81d: aa        
            LDA __c1bc,x       ; $e81e: bd bc c1  
            AND $0a            ; $e821: 25 0a     
            JMP __e82f         ; $e823: 4c 2f e8  

;-------------------------------------------------------------------------------
__e826:     SEC                ; $e826: 38        
            SBC #$08           ; $e827: e9 08     
            TAX                ; $e829: aa        
            LDA __c1bc,x       ; $e82a: bd bc c1  
            AND $0b            ; $e82d: 25 0b     
__e82f:     BEQ __e833         ; $e82f: f0 02     
            LDA #$01           ; $e831: a9 01     
__e833:     RTS                ; $e833: 60        

;-------------------------------------------------------------------------------
            JSR __eaf7         ; $e834: 20 f7 ea  
            LDA __c45c,x       ; $e837: bd 5c c4  
            STA $0a            ; $e83a: 85 0a     
            LDA __c461,x       ; $e83c: bd 61 c4  
            STA $0b            ; $e83f: 85 0b     
            LDA #$00           ; $e841: a9 00     
            STA $5d            ; $e843: 85 5d     
            JSR __dfe8         ; $e845: 20 e8 df  
            BNE __e84b         ; $e848: d0 01     
            RTS                ; $e84a: 60        

;-------------------------------------------------------------------------------
__e84b:     LDA #$00           ; $e84b: a9 00     
            STA $d2            ; $e84d: 85 d2     
__e84f:     LDA $d2            ; $e84f: a5 d2     
            CMP #$03           ; $e851: c9 03     
            BCS __e8a9         ; $e853: b0 54     
            TAX                ; $e855: aa        
            BNE __e86a         ; $e856: d0 12     
            LDA $da            ; $e858: a5 da     
            CMP #$01           ; $e85a: c9 01     
            BNE __e86a         ; $e85c: d0 0c     
            DEC $0200          ; $e85e: ce 00 02  
            DEC $0204          ; $e861: ce 04 02  
            DEC $0208          ; $e864: ce 08 02  
            DEC $020c          ; $e867: ce 0c 02  
__e86a:     LDY __c2cc,x       ; $e86a: bc cc c2  
            LDA $0200,y        ; $e86d: b9 00 02  
            CMP #$ff           ; $e870: c9 ff     
            BEQ __e8a4         ; $e872: f0 30     
            TYA                ; $e874: 98        
            TAX                ; $e875: aa        
            DEC $0200,x        ; $e876: de 00 02  
            DEC $0204,x        ; $e879: de 04 02  
            LDA $0200,x        ; $e87c: bd 00 02  
            CMP #$50           ; $e87f: c9 50     
            BNE __e889         ; $e881: d0 06     
            JSR __e968         ; $e883: 20 68 e9  
            JMP __e890         ; $e886: 4c 90 e8  

;-------------------------------------------------------------------------------
__e889:     CMP #$c8           ; $e889: c9 c8     
            BNE __e890         ; $e88b: d0 03     
            JSR __e971         ; $e88d: 20 71 e9  
__e890:     LDA $0200,y        ; $e890: b9 00 02  
            CMP #$70           ; $e893: c9 70     
            BNE __e89b         ; $e895: d0 04     
            LDA #$01           ; $e897: a9 01     
            STA $d8            ; $e899: 85 d8     
__e89b:     LDA $0200,y        ; $e89b: b9 00 02  
            CMP #$48           ; $e89e: c9 48     
            BEQ __e901         ; $e8a0: f0 5f     
            BCC __e901         ; $e8a2: 90 5d     
__e8a4:     INC $d2            ; $e8a4: e6 d2     
            JMP __e84f         ; $e8a6: 4c 4f e8  

;-------------------------------------------------------------------------------
__e8a9:     CMP #$06           ; $e8a9: c9 06     
            BEQ __e90e         ; $e8ab: f0 61     
            TAX                ; $e8ad: aa        
            CMP #$03           ; $e8ae: c9 03     
            BNE __e8c4         ; $e8b0: d0 12     
            LDA $da            ; $e8b2: a5 da     
            CMP #$02           ; $e8b4: c9 02     
            BNE __e8c4         ; $e8b6: d0 0c     
            INC $0200          ; $e8b8: ee 00 02  
            INC $0204          ; $e8bb: ee 04 02  
            INC $0208          ; $e8be: ee 08 02  
            INC $020c          ; $e8c1: ee 0c 02  
__e8c4:     LDY __c2cc,x       ; $e8c4: bc cc c2  
            LDA $0200,y        ; $e8c7: b9 00 02  
            CMP #$ff           ; $e8ca: c9 ff     
            BEQ __e8fc         ; $e8cc: f0 2e     
            TYA                ; $e8ce: 98        
            TAX                ; $e8cf: aa        
            INC $0200,x        ; $e8d0: fe 00 02  
            INC $0204,x        ; $e8d3: fe 04 02  
            LDA $0200,x        ; $e8d6: bd 00 02  
            CMP #$50           ; $e8d9: c9 50     
            BNE __e8e3         ; $e8db: d0 06     
            JSR __e971         ; $e8dd: 20 71 e9  
            JMP __e8ea         ; $e8e0: 4c ea e8  

;-------------------------------------------------------------------------------
__e8e3:     CMP #$c8           ; $e8e3: c9 c8     
            BNE __e8ea         ; $e8e5: d0 03     
            JSR __e968         ; $e8e7: 20 68 e9  
__e8ea:     LDA $0200,y        ; $e8ea: b9 00 02  
            CMP #$a8           ; $e8ed: c9 a8     
            BNE __e8f8         ; $e8ef: d0 07     
            LDA #$01           ; $e8f1: a9 01     
            STA $d9            ; $e8f3: 85 d9     
            LDA $0200,y        ; $e8f5: b9 00 02  
__e8f8:     CMP #$d0           ; $e8f8: c9 d0     
            BCS __e901         ; $e8fa: b0 05     
__e8fc:     INC $d2            ; $e8fc: e6 d2     
            JMP __e84f         ; $e8fe: 4c 4f e8  

;-------------------------------------------------------------------------------
__e901:     LDA #$ff           ; $e901: a9 ff     
            STA $0200,y        ; $e903: 99 00 02  
            STA $0204,y        ; $e906: 99 04 02  
            INC $d2            ; $e909: e6 d2     
            JMP __e84f         ; $e90b: 4c 4f e8  

;-------------------------------------------------------------------------------
__e90e:     LDA $d8            ; $e90e: a5 d8     
            CMP #$01           ; $e910: c9 01     
            BNE __e93b         ; $e912: d0 27     
            LDA #$00           ; $e914: a9 00     
            STA $d2            ; $e916: 85 d2     
__e918:     LDA $d2            ; $e918: a5 d2     
            CMP #$03           ; $e91a: c9 03     
            BEQ __e967         ; $e91c: f0 49     
            TAX                ; $e91e: aa        
            LDY __c2cc,x       ; $e91f: bc cc c2  
            LDA $0200,y        ; $e922: b9 00 02  
            CMP #$ff           ; $e925: c9 ff     
            BEQ __e92e         ; $e927: f0 05     
            INC $d2            ; $e929: e6 d2     
            JMP __e918         ; $e92b: 4c 18 e9  

;-------------------------------------------------------------------------------
__e92e:     LDA #$d0           ; $e92e: a9 d0     
            JSR __e97a         ; $e930: 20 7a e9  
            JSR __e968         ; $e933: 20 68 e9  
            LDA #$00           ; $e936: a9 00     
            STA $d8            ; $e938: 85 d8     
            RTS                ; $e93a: 60        

;-------------------------------------------------------------------------------
__e93b:     LDA $d9            ; $e93b: a5 d9     
            CMP #$01           ; $e93d: c9 01     
            BNE __e967         ; $e93f: d0 26     
            LDA #$03           ; $e941: a9 03     
            STA $d2            ; $e943: 85 d2     
__e945:     LDA $d2            ; $e945: a5 d2     
            CMP #$06           ; $e947: c9 06     
            BEQ __e967         ; $e949: f0 1c     
            TAX                ; $e94b: aa        
            LDY __c2cc,x       ; $e94c: bc cc c2  
            LDA $0200,y        ; $e94f: b9 00 02  
            CMP #$ff           ; $e952: c9 ff     
            BEQ __e95b         ; $e954: f0 05     
            INC $d2            ; $e956: e6 d2     
            JMP __e945         ; $e958: 4c 45 e9  

;-------------------------------------------------------------------------------
__e95b:     LDA #$48           ; $e95b: a9 48     
            JSR __e97a         ; $e95d: 20 7a e9  
            JSR __e968         ; $e960: 20 68 e9  
            LDA #$00           ; $e963: a9 00     
            STA $d9            ; $e965: 85 d9     
__e967:     RTS                ; $e967: 60        

;-------------------------------------------------------------------------------
__e968:     LDA #$23           ; $e968: a9 23     
            STA $0202,y        ; $e96a: 99 02 02  
            STA $0206,y        ; $e96d: 99 06 02  
            RTS                ; $e970: 60        

;-------------------------------------------------------------------------------
__e971:     LDA #$03           ; $e971: a9 03     
            STA $0202,y        ; $e973: 99 02 02  
            STA $0206,y        ; $e976: 99 06 02  
            RTS                ; $e979: 60        

;-------------------------------------------------------------------------------
__e97a:     STA $0200,y        ; $e97a: 99 00 02  
            STA $0204,y        ; $e97d: 99 04 02  
            RTS                ; $e980: 60        

;-------------------------------------------------------------------------------
__e981:     LDA #$00           ; $e981: a9 00     
            STA $0445          ; $e983: 8d 45 04  
__e986:     LDA $0445          ; $e986: ad 45 04  
            JSR __efd7         ; $e989: 20 d7 ef  
            TXA                ; $e98c: 8a        
            CLC                ; $e98d: 18        
            ADC #$30           ; $e98e: 69 30     
            TAX                ; $e990: aa        
            STX $04            ; $e991: 86 04     
            JSR __eaec         ; $e993: 20 ec ea  
            CMP #$ff           ; $e996: c9 ff     
            BEQ __e9f0         ; $e998: f0 56     
            LDX $0445          ; $e99a: ae 45 04  
            LDA $0446,x        ; $e99d: bd 46 04  
            CLC                ; $e9a0: 18        
            ADC #$b0           ; $e9a1: 69 b0     
            CMP $00            ; $e9a3: c5 00     
            BCC __e9b4         ; $e9a5: 90 0d     
            LDA $01            ; $e9a7: a5 01     
            CMP #$26           ; $e9a9: c9 26     
            BCS __e9be         ; $e9ab: b0 11     
            LDA #$c0           ; $e9ad: a9 c0     
            STA $02            ; $e9af: 85 02     
            JMP __e9da         ; $e9b1: 4c da e9  

;-------------------------------------------------------------------------------
__e9b4:     JSR __ea01         ; $e9b4: 20 01 ea  
            CMP #$ff           ; $e9b7: c9 ff     
            BEQ __e9f3         ; $e9b9: f0 38     
            JMP __e9ea         ; $e9bb: 4c ea e9  

;-------------------------------------------------------------------------------
__e9be:     LDA #$c4           ; $e9be: a9 c4     
            STA $02            ; $e9c0: 85 02     
            LDA $01            ; $e9c2: a5 01     
            CMP #$2e           ; $e9c4: c9 2e     
            BCC __e9da         ; $e9c6: 90 12     
            LDA #$02           ; $e9c8: a9 02     
            STA $fe            ; $e9ca: 85 fe     
            LDA #$2e           ; $e9cc: a9 2e     
            STA $01            ; $e9ce: 85 01     
            LDA $0445          ; $e9d0: ad 45 04  
            ASL                ; $e9d3: 0a        
            TAX                ; $e9d4: aa        
            LDA #$00           ; $e9d5: a9 00     
            STA $042e,x        ; $e9d7: 9d 2e 04  
__e9da:     LDA $00            ; $e9da: a5 00     
            CLC                ; $e9dc: 18        
            ADC #$02           ; $e9dd: 69 02     
            STA $00            ; $e9df: 85 00     
            LDA $0445          ; $e9e1: ad 45 04  
            CLC                ; $e9e4: 18        
            ADC #$01           ; $e9e5: 69 01     
            JSR __ef72         ; $e9e7: 20 72 ef  
__e9ea:     JSR __eadb         ; $e9ea: 20 db ea  
            JMP __e9f3         ; $e9ed: 4c f3 e9  

;-------------------------------------------------------------------------------
__e9f0:     JSR __ea34         ; $e9f0: 20 34 ea  
__e9f3:     INC $0445          ; $e9f3: ee 45 04  
            LDA $0445          ; $e9f6: ad 45 04  
            CMP #$03           ; $e9f9: c9 03     
            BEQ __ea00         ; $e9fb: f0 03     
            JMP __e986         ; $e9fd: 4c 86 e9  

;-------------------------------------------------------------------------------
__ea00:     RTS                ; $ea00: 60        

;-------------------------------------------------------------------------------
__ea01:     LDA $01            ; $ea01: a5 01     
            INC $01            ; $ea03: e6 01     
            INC $01            ; $ea05: e6 01     
            INC $01            ; $ea07: e6 01     
            CMP #$26           ; $ea09: c9 26     
            BNE __ea11         ; $ea0b: d0 04     
            LDX #$01           ; $ea0d: a2 01     
            STX $fe            ; $ea0f: 86 fe     
__ea11:     CMP #$50           ; $ea11: c9 50     
            BCC __ea2a         ; $ea13: 90 15     
            CMP #$90           ; $ea15: c9 90     
            BCC __ea2f         ; $ea17: 90 16     
            CMP #$c0           ; $ea19: c9 c0     
            BCC __ea2a         ; $ea1b: 90 0d     
            CMP #$d8           ; $ea1d: c9 d8     
            BCC __ea2f         ; $ea1f: 90 0e     
            JSR __ead1         ; $ea21: 20 d1 ea  
            JSR __f094         ; $ea24: 20 94 f0  
            LDA #$ff           ; $ea27: a9 ff     
            RTS                ; $ea29: 60        

;-------------------------------------------------------------------------------
__ea2a:     LDA #$c4           ; $ea2a: a9 c4     
            STA $02            ; $ea2c: 85 02     
            RTS                ; $ea2e: 60        

;-------------------------------------------------------------------------------
__ea2f:     LDA #$c0           ; $ea2f: a9 c0     
            STA $02            ; $ea31: 85 02     
            RTS                ; $ea33: 60        

;-------------------------------------------------------------------------------
__ea34:     LDA $36            ; $ea34: a5 36     
            BNE __ea5e         ; $ea36: d0 26     
            LDA $19            ; $ea38: a5 19     
            AND #$03           ; $ea3a: 29 03     
            TAX                ; $ea3c: aa        
            LDA __c1ff,x       ; $ea3d: bd ff c1  
            CLC                ; $ea40: 18        
            ADC #$10           ; $ea41: 69 10     
            LDX $0445          ; $ea43: ae 45 04  
            STA $0446,x        ; $ea46: 9d 46 04  
            STA $00            ; $ea49: 85 00     
            LDA #$30           ; $ea4b: a9 30     
            STA $01            ; $ea4d: 85 01     
            LDA #$c4           ; $ea4f: a9 c4     
            STA $02            ; $ea51: 85 02     
            JSR __eadb         ; $ea53: 20 db ea  
            JSR __eaf7         ; $ea56: 20 f7 ea  
            LDA __c457,x       ; $ea59: bd 57 c4  
            STA $36            ; $ea5c: 85 36     
__ea5e:     RTS                ; $ea5e: 60        

;-------------------------------------------------------------------------------
__ea5f:     LDA $39            ; $ea5f: a5 39     
            BEQ __ea64         ; $ea61: f0 01     
            RTS                ; $ea63: 60        

;-------------------------------------------------------------------------------
__ea64:     LDA #$08           ; $ea64: a9 08     
            STA $0a            ; $ea66: 85 0a     
            LDA #$00           ; $ea68: a9 00     
            STA $0b            ; $ea6a: 85 0b     
            JSR __eaa1         ; $ea6c: 20 a1 ea  
            BNE __ea72         ; $ea6f: d0 01     
            RTS                ; $ea71: 60        

;-------------------------------------------------------------------------------
__ea72:     LDA #$50           ; $ea72: a9 50     
            STA $00            ; $ea74: 85 00     
            LDA #$20           ; $ea76: a9 20     
            STA $01            ; $ea78: 85 01     
            LDA $02f1          ; $ea7a: ad f1 02  
            CMP #$db           ; $ea7d: c9 db     
            BEQ __ea88         ; $ea7f: f0 07     
            INC $b7            ; $ea81: e6 b7     
            LDA #$db           ; $ea83: a9 db     
            JMP __ea8a         ; $ea85: 4c 8a ea  

;-------------------------------------------------------------------------------
__ea88:     LDA #$d7           ; $ea88: a9 d7     
__ea8a:     JSR __ead4         ; $ea8a: 20 d4 ea  
            LDA #$f0           ; $ea8d: a9 f0     
            JSR __f080         ; $ea8f: 20 80 f0  
            LDA $b7            ; $ea92: a5 b7     
            CMP #$04           ; $ea94: c9 04     
            BNE __eaa0         ; $ea96: d0 08     
            LDA #$00           ; $ea98: a9 00     
            STA $b7            ; $ea9a: 85 b7     
            LDA #$bb           ; $ea9c: a9 bb     
            STA $39            ; $ea9e: 85 39     
__eaa0:     RTS                ; $eaa0: 60        

;-------------------------------------------------------------------------------
__eaa1:     INC $b8            ; $eaa1: e6 b8     
            LDA $b8            ; $eaa3: a5 b8     
            BMI __eaae         ; $eaa5: 30 07     
            CMP #$10           ; $eaa7: c9 10     
            BCS __eaae         ; $eaa9: b0 03     
            JMP __eab2         ; $eaab: 4c b2 ea  

;-------------------------------------------------------------------------------
__eaae:     LDA #$00           ; $eaae: a9 00     
            STA $b8            ; $eab0: 85 b8     
__eab2:     CMP #$08           ; $eab2: c9 08     
            BCS __eabf         ; $eab4: b0 09     
            TAX                ; $eab6: aa        
            LDA __c1bc,x       ; $eab7: bd bc c1  
            AND $0a            ; $eaba: 25 0a     
            JMP __eac8         ; $eabc: 4c c8 ea  

;-------------------------------------------------------------------------------
__eabf:     SEC                ; $eabf: 38        
            SBC #$08           ; $eac0: e9 08     
            TAX                ; $eac2: aa        
            LDA __c1bc,x       ; $eac3: bd bc c1  
            AND $0b            ; $eac6: 25 0b     
__eac8:     BEQ __eacc         ; $eac8: f0 02     
            LDA #$01           ; $eaca: a9 01     
__eacc:     RTS                ; $eacc: 60        

;-------------------------------------------------------------------------------
__eacd:     LDA #$00           ; $eacd: a9 00     
            STA $04            ; $eacf: 85 04     
__ead1:     JMP __ead6         ; $ead1: 4c d6 ea  

;-------------------------------------------------------------------------------
__ead4:     STA $02            ; $ead4: 85 02     
__ead6:     LDA #$22           ; $ead6: a9 22     
            STA $03            ; $ead8: 85 03     
            RTS                ; $eada: 60        

;-------------------------------------------------------------------------------
__eadb:     JSR __ead1         ; $eadb: 20 d1 ea  
            JMP __f082         ; $eade: 4c 82 f0  

;-------------------------------------------------------------------------------
__eae1:     LDA $0203          ; $eae1: ad 03 02  
            STA $00            ; $eae4: 85 00     
            LDA $0200          ; $eae6: ad 00 02  
            STA $01            ; $eae9: 85 01     
            RTS                ; $eaeb: 60        

;-------------------------------------------------------------------------------
__eaec:     LDA $0203,x        ; $eaec: bd 03 02  
            STA $00            ; $eaef: 85 00     
            LDA $0200,x        ; $eaf1: bd 00 02  
            STA $01            ; $eaf4: 85 01     
            RTS                ; $eaf6: 60        

;-------------------------------------------------------------------------------
__eaf7:     LDA $50            ; $eaf7: a5 50     
            AND #$01           ; $eaf9: 29 01     
            CLC                ; $eafb: 18        
            ADC $54            ; $eafc: 65 54     
            TAX                ; $eafe: aa        
            CPX #$04           ; $eaff: e0 04     
            BCC __eb05         ; $eb01: 90 02     
            LDX #$04           ; $eb03: a2 04     
__eb05:     RTS                ; $eb05: 60        

;-------------------------------------------------------------------------------
__eb06:     LDA $0503          ; $eb06: ad 03 05  
            BNE __eb0c         ; $eb09: d0 01     
            RTS                ; $eb0b: 60        

;-------------------------------------------------------------------------------
__eb0c:     LDA $0505          ; $eb0c: ad 05 05  
            AND #$0f           ; $eb0f: 29 0f     
            STA $0505          ; $eb11: 8d 05 05  
            LDA $53            ; $eb14: a5 53     
            TAX                ; $eb16: aa        
            TAY                ; $eb17: a8        
            DEX                ; $eb18: ca        
            LDA __c608,x       ; $eb19: bd 08 c6  
            STA $00            ; $eb1c: 85 00     
            LDA #$20           ; $eb1e: a9 20     
            STA $01            ; $eb20: 85 01     
            TYA                ; $eb22: 98        
            CMP #$02           ; $eb23: c9 02     
            BMI __eb54         ; $eb25: 30 2d     
            LDA $44            ; $eb27: a5 44     
            BEQ __eb4f         ; $eb29: f0 24     
__eb2b:     CMP #$13           ; $eb2b: c9 13     
            BNE __eb32         ; $eb2d: d0 03     
            JMP __eb85         ; $eb2f: 4c 85 eb  

;-------------------------------------------------------------------------------
__eb32:     CMP #$0f           ; $eb32: c9 0f     
            BNE __eb39         ; $eb34: d0 03     
            JMP __eb8e         ; $eb36: 4c 8e eb  

;-------------------------------------------------------------------------------
__eb39:     CMP #$0b           ; $eb39: c9 0b     
            BNE __eb40         ; $eb3b: d0 03     
            JMP __eb85         ; $eb3d: 4c 85 eb  

;-------------------------------------------------------------------------------
__eb40:     CMP #$08           ; $eb40: c9 08     
            BNE __eb47         ; $eb42: d0 03     
            JMP __eb8e         ; $eb44: 4c 8e eb  

;-------------------------------------------------------------------------------
__eb47:     CMP #$04           ; $eb47: c9 04     
            BNE __eb4e         ; $eb49: d0 03     
            JSR __eba6         ; $eb4b: 20 a6 eb  
__eb4e:     RTS                ; $eb4e: 60        

;-------------------------------------------------------------------------------
__eb4f:     LDA #$25           ; $eb4f: a9 25     
            STA $44            ; $eb51: 85 44     
            RTS                ; $eb53: 60        

;-------------------------------------------------------------------------------
__eb54:     LDA $36            ; $eb54: a5 36     
            CMP #$18           ; $eb56: c9 18     
            BEQ __eb74         ; $eb58: f0 1a     
            CMP #$00           ; $eb5a: c9 00     
            BEQ __eb7b         ; $eb5c: f0 1d     
            LDA $0515          ; $eb5e: ad 15 05  
            BEQ __eb6f         ; $eb61: f0 0c     
            JSR __eba1         ; $eb63: 20 a1 eb  
            LDA #$00           ; $eb66: a9 00     
            STA $0515          ; $eb68: 8d 15 05  
            LDA #$1a           ; $eb6b: a9 1a     
            STA $44            ; $eb6d: 85 44     
__eb6f:     LDA $44            ; $eb6f: a5 44     
            JMP __eb2b         ; $eb71: 4c 2b eb  

;-------------------------------------------------------------------------------
__eb74:     LDA #$30           ; $eb74: a9 30     
            STA $44            ; $eb76: 85 44     
            JMP __eb9c         ; $eb78: 4c 9c eb  

;-------------------------------------------------------------------------------
__eb7b:     LDA #$1a           ; $eb7b: a9 1a     
            STA $44            ; $eb7d: 85 44     
            JSR __eb97         ; $eb7f: 20 97 eb  
            JMP __eb2b         ; $eb82: 4c 2b eb  

;-------------------------------------------------------------------------------
__eb85:     LDA #$80           ; $eb85: a9 80     
            STA $fe            ; $eb87: 85 fe     
__eb89:     LDA #$40           ; $eb89: a9 40     
            JMP __eba8         ; $eb8b: 4c a8 eb  

;-------------------------------------------------------------------------------
__eb8e:     LDA #$80           ; $eb8e: a9 80     
            STA $fe            ; $eb90: 85 fe     
__eb92:     LDA #$42           ; $eb92: a9 42     
            JMP __eba8         ; $eb94: 4c a8 eb  

;-------------------------------------------------------------------------------
__eb97:     LDA #$44           ; $eb97: a9 44     
            JMP __eba8         ; $eb99: 4c a8 eb  

;-------------------------------------------------------------------------------
__eb9c:     LDA #$3e           ; $eb9c: a9 3e     
            JMP __eba8         ; $eb9e: 4c a8 eb  

;-------------------------------------------------------------------------------
__eba1:     LDA #$00           ; $eba1: a9 00     
            JMP __eba8         ; $eba3: 4c a8 eb  

;-------------------------------------------------------------------------------
__eba6:     LDA #$02           ; $eba6: a9 02     
__eba8:     JSR __c815         ; $eba8: 20 15 c8  
            DEC $44            ; $ebab: c6 44     
            LDA $0505          ; $ebad: ad 05 05  
            ORA #$10           ; $ebb0: 09 10     
            STA $0505          ; $ebb2: 8d 05 05  
            RTS                ; $ebb5: 60        

;-------------------------------------------------------------------------------
__ebb6:     LDA $45            ; $ebb6: a5 45     
            BEQ __ebbb         ; $ebb8: f0 01     
            RTS                ; $ebba: 60        

;-------------------------------------------------------------------------------
__ebbb:     LDA $2e            ; $ebbb: a5 2e     
            BNE __ebc4         ; $ebbd: d0 05     
            LDA #$ff           ; $ebbf: a9 ff     
            STA $96            ; $ebc1: 85 96     
            RTS                ; $ebc3: 60        

;-------------------------------------------------------------------------------
__ebc4:     LDA #$0b           ; $ebc4: a9 0b     
            STA $45            ; $ebc6: 85 45     
            LDA #$01           ; $ebc8: a9 01     
            STA $00            ; $ebca: 85 00     
            LDA #$0a           ; $ebcc: a9 0a     
            STA $01            ; $ebce: 85 01     
            JSR __f33e         ; $ebd0: 20 3e f3  
            LDA #$02           ; $ebd3: a9 02     
            STA $00            ; $ebd5: 85 00     
            JMP __f23c         ; $ebd7: 4c 3c f2  

;-------------------------------------------------------------------------------
__ebda:     LDA $050b          ; $ebda: ad 0b 05  
            BNE __ebed         ; $ebdd: d0 0e     
            LDA #$01           ; $ebdf: a9 01     
            STA $050b          ; $ebe1: 8d 0b 05  
            LDA #$00           ; $ebe4: a9 00     
            STA $050e          ; $ebe6: 8d 0e 05  
            STA $050c          ; $ebe9: 8d 0c 05  
            RTS                ; $ebec: 60        

;-------------------------------------------------------------------------------
__ebed:     LDA $050c          ; $ebed: ad 0c 05  
            BEQ __ec16         ; $ebf0: f0 24     
            LDA $050d          ; $ebf2: ad 0d 05  
            CMP #$05           ; $ebf5: c9 05     
            BNE __ec0a         ; $ebf7: d0 11     
            LDA $96            ; $ebf9: a5 96     
            CMP #$0a           ; $ebfb: c9 0a     
            BNE __ec03         ; $ebfd: d0 04     
            LDA #$00           ; $ebff: a9 00     
            BEQ __ec0a         ; $ec01: f0 07     
__ec03:     LDA #$04           ; $ec03: a9 04     
            STA $96            ; $ec05: 85 96     
            JMP __ec12         ; $ec07: 4c 12 ec  

;-------------------------------------------------------------------------------
__ec0a:     STA $56            ; $ec0a: 85 56     
            AND #$03           ; $ec0c: 29 03     
            BEQ __ec12         ; $ec0e: f0 02     
            STA $57            ; $ec10: 85 57     
__ec12:     DEC $050c          ; $ec12: ce 0c 05  
            RTS                ; $ec15: 60        

;-------------------------------------------------------------------------------
__ec16:     LDX $050e          ; $ec16: ae 0e 05  
            LDA __c028,x       ; $ec19: bd 28 c0  
            STA $050c          ; $ec1c: 8d 0c 05  
            LDA __c014,x       ; $ec1f: bd 14 c0  
            STA $050d          ; $ec22: 8d 0d 05  
            INC $050e          ; $ec25: ee 0e 05  
            RTS                ; $ec28: 60        

;-------------------------------------------------------------------------------
__ec29:     JSR __eae1         ; $ec29: 20 e1 ea  
            LDA #$4c           ; $ec2c: a9 4c     
            JSR __efe8         ; $ec2e: 20 e8 ef  
            LDA $53            ; $ec31: a5 53     
            CMP #$03           ; $ec33: c9 03     
            BEQ __ec3b         ; $ec35: f0 04     
            CMP #$01           ; $ec37: c9 01     
            BNE __ec3e         ; $ec39: d0 03     
__ec3b:     JSR __ec44         ; $ec3b: 20 44 ec  
__ec3e:     JSR __ed8a         ; $ec3e: 20 8a ed  
            JMP __edc5         ; $ec41: 4c c5 ed  

;-------------------------------------------------------------------------------
__ec44:     LDA #$00           ; $ec44: a9 00     
            STA $5d            ; $ec46: 85 5d     
__ec48:     LDA #$3a           ; $ec48: a9 3a     
            JSR __c847         ; $ec4a: 20 47 c8  
            JSR __efd5         ; $ec4d: 20 d5 ef  
            LDA $53            ; $ec50: a5 53     
            CMP #$01           ; $ec52: c9 01     
            BEQ __ec5b         ; $ec54: f0 05     
            TXA                ; $ec56: 8a        
            CLC                ; $ec57: 18        
            ADC #$30           ; $ec58: 69 30     
            TAX                ; $ec5a: aa        
__ec5b:     JSR __eaec         ; $ec5b: 20 ec ea  
            JSR __efef         ; $ec5e: 20 ef ef  
            BNE __eca7         ; $ec61: d0 44     
            LDA $96            ; $ec63: a5 96     
            CMP #$04           ; $ec65: c9 04     
            BNE __ec97         ; $ec67: d0 2e     
            LDA $56            ; $ec69: a5 56     
            AND #$03           ; $ec6b: 29 03     
            BNE __ec76         ; $ec6d: d0 07     
            LDA $9c            ; $ec6f: a5 9c     
            BEQ __ec80         ; $ec71: f0 0d     
            JMP __ec97         ; $ec73: 4c 97 ec  

;-------------------------------------------------------------------------------
__ec76:     LDA $9c            ; $ec76: a5 9c     
            CMP #$03           ; $ec78: c9 03     
            BCS __ec97         ; $ec7a: b0 1b     
            LDA $9e            ; $ec7c: a5 9e     
            BNE __ec97         ; $ec7e: d0 17     
__ec80:     LDA $9d            ; $ec80: a5 9d     
            CMP #$18           ; $ec82: c9 18     
            BCS __ec97         ; $ec84: b0 11     
            LDA $00            ; $ec86: a5 00     
            STA $05            ; $ec88: 85 05     
            LDA $01            ; $ec8a: a5 01     
            STA $06            ; $ec8c: 85 06     
            LDX #$00           ; $ec8e: a2 00     
            JSR __cfc6         ; $ec90: 20 c6 cf  
            LDA #$20           ; $ec93: a9 20     
            STA $fd            ; $ec95: 85 fd     
__ec97:     INC $5d            ; $ec97: e6 5d     
            LDA $53            ; $ec99: a5 53     
            LSR                ; $ec9b: 4a        
            TAX                ; $ec9c: aa        
            LDA $5d            ; $ec9d: a5 5d     
            CMP __c1fd,x       ; $ec9f: dd fd c1  
            BEQ __ecaf         ; $eca2: f0 0b     
            JMP __ec48         ; $eca4: 4c 48 ec  

;-------------------------------------------------------------------------------
__eca7:     JSR __ef51         ; $eca7: 20 51 ef  
            LDA #$ff           ; $ecaa: a9 ff     
            STA $96            ; $ecac: 85 96     
            RTS                ; $ecae: 60        

;-------------------------------------------------------------------------------
__ecaf:     LDA $53            ; $ecaf: a5 53     
            CMP #$03           ; $ecb1: c9 03     
            BEQ __ecbe         ; $ecb3: f0 09     
            LDA $96            ; $ecb5: a5 96     
            CMP #$0a           ; $ecb7: c9 0a     
            BNE __ecbe         ; $ecb9: d0 03     
            JMP __ecbf         ; $ecbb: 4c bf ec  

;-------------------------------------------------------------------------------
__ecbe:     RTS                ; $ecbe: 60        

;-------------------------------------------------------------------------------
__ecbf:     LDA $a0            ; $ecbf: a5 a0     
            BNE __ecc6         ; $ecc1: d0 03     
            JMP __ed87         ; $ecc3: 4c 87 ed  

;-------------------------------------------------------------------------------
__ecc6:     LDA $9f            ; $ecc6: a5 9f     
            LSR                ; $ecc8: 4a        
            LSR                ; $ecc9: 4a        
            BEQ __ecd1         ; $ecca: f0 05     
            LDA #$00           ; $eccc: a9 00     
            JMP __ecd3         ; $ecce: 4c d3 ec  

;-------------------------------------------------------------------------------
__ecd1:     LDA #$01           ; $ecd1: a9 01     
__ecd3:     BEQ __ece8         ; $ecd3: f0 13     
            LDA #$04           ; $ecd5: a9 04     
            CLC                ; $ecd7: 18        
            ADC $0203          ; $ecd8: 6d 03 02  
            STA $00            ; $ecdb: 85 00     
            LDA $0200          ; $ecdd: ad 00 02  
            SEC                ; $ece0: 38        
            SBC #$10           ; $ece1: e9 10     
            STA $01            ; $ece3: 85 01     
            JMP __ed07         ; $ece5: 4c 07 ed  

;-------------------------------------------------------------------------------
__ece8:     LDA $57            ; $ece8: a5 57     
            CMP #$01           ; $ecea: c9 01     
            BEQ __ecf7         ; $ecec: f0 09     
            LDA $0203          ; $ecee: ad 03 02  
            SEC                ; $ecf1: 38        
            SBC #$10           ; $ecf2: e9 10     
            JMP __ecfd         ; $ecf4: 4c fd ec  

;-------------------------------------------------------------------------------
__ecf7:     LDA $0203          ; $ecf7: ad 03 02  
            CLC                ; $ecfa: 18        
            ADC #$10           ; $ecfb: 69 10     
__ecfd:     STA $00            ; $ecfd: 85 00     
            LDA $0200          ; $ecff: ad 00 02  
            CLC                ; $ed02: 18        
            ADC #$06           ; $ed03: 69 06     
            STA $01            ; $ed05: 85 01     
__ed07:     LDA #$3c           ; $ed07: a9 3c     
            JSR __efe8         ; $ed09: 20 e8 ef  
            LDA $53            ; $ed0c: a5 53     
            CMP #$01           ; $ed0e: c9 01     
            BNE __ed34         ; $ed10: d0 22     
            LDA #$00           ; $ed12: a9 00     
            STA $5d            ; $ed14: 85 5d     
__ed16:     JSR __efd5         ; $ed16: 20 d5 ef  
            JSR __eaec         ; $ed19: 20 ec ea  
            LDA #$3a           ; $ed1c: a9 3a     
            JSR __c847         ; $ed1e: 20 47 c8  
            JSR __efef         ; $ed21: 20 ef ef  
            BNE __ed57         ; $ed24: d0 31     
            LDA $5d            ; $ed26: a5 5d     
            CLC                ; $ed28: 18        
            ADC #$01           ; $ed29: 69 01     
            STA $5d            ; $ed2b: 85 5d     
            CMP #$09           ; $ed2d: c9 09     
            BEQ __ed85         ; $ed2f: f0 54     
            JMP __ed16         ; $ed31: 4c 16 ed  

;-------------------------------------------------------------------------------
__ed34:     LDA #$00           ; $ed34: a9 00     
            STA $ae            ; $ed36: 85 ae     
__ed38:     JSR __efdd         ; $ed38: 20 dd ef  
            JSR __eaec         ; $ed3b: 20 ec ea  
            LDA #$3a           ; $ed3e: a9 3a     
            JSR __c847         ; $ed40: 20 47 c8  
            JSR __efef         ; $ed43: 20 ef ef  
            BNE __ed57         ; $ed46: d0 0f     
            INC $ae            ; $ed48: e6 ae     
            LDA $ae            ; $ed4a: a5 ae     
            LDX $53            ; $ed4c: a6 53     
            DEX                ; $ed4e: ca        
            CMP __c1f6,x       ; $ed4f: dd f6 c1  
            BEQ __ed85         ; $ed52: f0 31     
            JMP __ed38         ; $ed54: 4c 38 ed  

;-------------------------------------------------------------------------------
__ed57:     LDA #$02           ; $ed57: a9 02     
            STA $ff            ; $ed59: 85 ff     
            LDA $00            ; $ed5b: a5 00     
            STA $05            ; $ed5d: 85 05     
            LDA $01            ; $ed5f: a5 01     
            STA $06            ; $ed61: 85 06     
            LDA $53            ; $ed63: a5 53     
            CMP #$01           ; $ed65: c9 01     
            BNE __ed74         ; $ed67: d0 0b     
            LDA #$00           ; $ed69: a9 00     
            LDX $5d            ; $ed6b: a6 5d     
            STA $68,x          ; $ed6d: 95 68     
            LDA #$01           ; $ed6f: a9 01     
            JMP __ed87         ; $ed71: 4c 87 ed  

;-------------------------------------------------------------------------------
__ed74:     LDA #$10           ; $ed74: a9 10     
            STA $40            ; $ed76: 85 40     
            LDA #$00           ; $ed78: a9 00     
            LDX $ae            ; $ed7a: a6 ae     
            STA $e0,x          ; $ed7c: 95 e0     
            STA $db,x          ; $ed7e: 95 db     
            LDA #$01           ; $ed80: a9 01     
            JMP __ed87         ; $ed82: 4c 87 ed  

;-------------------------------------------------------------------------------
__ed85:     LDA #$00           ; $ed85: a9 00     
__ed87:     STA $bf            ; $ed87: 85 bf     
            RTS                ; $ed89: 60        

;-------------------------------------------------------------------------------
__ed8a:     LDA #$00           ; $ed8a: a9 00     
            STA $ae            ; $ed8c: 85 ae     
            LDA #$3a           ; $ed8e: a9 3a     
            JSR __c847         ; $ed90: 20 47 c8  
__ed93:     JSR __efdd         ; $ed93: 20 dd ef  
            JSR __eaec         ; $ed96: 20 ec ea  
            JSR __efef         ; $ed99: 20 ef ef  
            BNE __edad         ; $ed9c: d0 0f     
            INC $ae            ; $ed9e: e6 ae     
            LDA $ae            ; $eda0: a5 ae     
            LDX $53            ; $eda2: a6 53     
            DEX                ; $eda4: ca        
            CMP __c1f6,x       ; $eda5: dd f6 c1  
            BEQ __edb5         ; $eda8: f0 0b     
            JMP __ed93         ; $edaa: 4c 93 ed  

;-------------------------------------------------------------------------------
__edad:     JSR __ef51         ; $edad: 20 51 ef  
            LDA #$ff           ; $edb0: a9 ff     
            STA $96            ; $edb2: 85 96     
            RTS                ; $edb4: 60        

;-------------------------------------------------------------------------------
__edb5:     LDA $96            ; $edb5: a5 96     
            CMP #$0a           ; $edb7: c9 0a     
            BNE __edc4         ; $edb9: d0 09     
            LDA $53            ; $edbb: a5 53     
            CMP #$01           ; $edbd: c9 01     
            BEQ __edc4         ; $edbf: f0 03     
            JSR __ecbf         ; $edc1: 20 bf ec  
__edc4:     RTS                ; $edc4: 60        

;-------------------------------------------------------------------------------
__edc5:     LDA $53            ; $edc5: a5 53     
            CMP #$03           ; $edc7: c9 03     
            BNE __edd2         ; $edc9: d0 07     
            LDY $96            ; $edcb: a4 96     
            CPY #$01           ; $edcd: c0 01     
            BEQ __edd2         ; $edcf: f0 01     
            RTS                ; $edd1: 60        

;-------------------------------------------------------------------------------
__edd2:     SEC                ; $edd2: 38        
            SBC #$01           ; $edd3: e9 01     
            ASL                ; $edd5: 0a        
            TAX                ; $edd6: aa        
            LDA __c42b,x       ; $edd7: bd 2b c4  
            STA $02            ; $edda: 85 02     
            LDA __c42c,x       ; $eddc: bd 2c c4  
            STA $03            ; $eddf: 85 03     
            LDA __c423,x       ; $ede1: bd 23 c4  
            STA $00            ; $ede4: 85 00     
            LDA __c424,x       ; $ede6: bd 24 c4  
            STA $01            ; $ede9: 85 01     
__edeb:     JSR __efef         ; $edeb: 20 ef ef  
            BNE __ee07         ; $edee: d0 17     
            LDA $53            ; $edf0: a5 53     
            CMP #$03           ; $edf2: c9 03     
            BNE __ee0b         ; $edf4: d0 15     
            LDA $01            ; $edf6: a5 01     
            CMP #$c9           ; $edf8: c9 c9     
            BEQ __ee0b         ; $edfa: f0 0f     
            LDA #$70           ; $edfc: a9 70     
            STA $00            ; $edfe: 85 00     
__ee00:     LDA #$c9           ; $ee00: a9 c9     
            STA $01            ; $ee02: 85 01     
            JMP __edeb         ; $ee04: 4c eb ed  

;-------------------------------------------------------------------------------
__ee07:     LDA #$ff           ; $ee07: a9 ff     
            STA $96            ; $ee09: 85 96     
__ee0b:     RTS                ; $ee0b: 60        

;-------------------------------------------------------------------------------
__ee0c:     LDA #$80           ; $ee0c: a9 80     
            STA $0a            ; $ee0e: 85 0a     
            LDA #$80           ; $ee10: a9 80     
            STA $0b            ; $ee12: 85 0b     
            JSR __dfe4         ; $ee14: 20 e4 df  
            BNE __ee1a         ; $ee17: d0 01     
            RTS                ; $ee19: 60        

;-------------------------------------------------------------------------------
__ee1a:     LDA $53            ; $ee1a: a5 53     
            CMP #$01           ; $ee1c: c9 01     
            BNE __ee26         ; $ee1e: d0 06     
            JSR __efd5         ; $ee20: 20 d5 ef  
            JMP __ee29         ; $ee23: 4c 29 ee  

;-------------------------------------------------------------------------------
__ee26:     JSR __efdd         ; $ee26: 20 dd ef  
__ee29:     STX $04            ; $ee29: 86 04     
            JSR __eaec         ; $ee2b: 20 ec ea  
            LDA $bf            ; $ee2e: a5 bf     
            CMP #$01           ; $ee30: c9 01     
            BNE __ee38         ; $ee32: d0 04     
            LDY #$02           ; $ee34: a0 02     
            STY $ff            ; $ee36: 84 ff     
__ee38:     CMP #$0b           ; $ee38: c9 0b     
            BEQ __ee51         ; $ee3a: f0 15     
            LDX $bf            ; $ee3c: a6 bf     
            DEX                ; $ee3e: ca        
            LDA __c1ec,x       ; $ee3f: bd ec c1  
            STA $02            ; $ee42: 85 02     
            JSR __eadb         ; $ee44: 20 db ea  
            LDX $04            ; $ee47: a6 04     
            LDA #$02           ; $ee49: a9 02     
            JSR __ee6c         ; $ee4b: 20 6c ee  
            INC $bf            ; $ee4e: e6 bf     
            RTS                ; $ee50: 60        

;-------------------------------------------------------------------------------
__ee51:     LDA $53            ; $ee51: a5 53     
            CMP #$01           ; $ee53: c9 01     
            BNE __ee5c         ; $ee55: d0 05     
            LDA #$03           ; $ee57: a9 03     
            JSR __ee6c         ; $ee59: 20 6c ee  
__ee5c:     JSR __ead1         ; $ee5c: 20 d1 ea  
            JSR __f094         ; $ee5f: 20 94 f0  
            LDX #$02           ; $ee62: a2 02     
            JSR __cfc6         ; $ee64: 20 c6 cf  
            LDA #$00           ; $ee67: a9 00     
            STA $bf            ; $ee69: 85 bf     
            RTS                ; $ee6b: 60        

;-------------------------------------------------------------------------------
__ee6c:     STA $0202,x        ; $ee6c: 9d 02 02  
            STA $0206,x        ; $ee6f: 9d 06 02  
            STA $020a,x        ; $ee72: 9d 0a 02  
            STA $020e,x        ; $ee75: 9d 0e 02  
            RTS                ; $ee78: 60        

;-------------------------------------------------------------------------------
__ee79:     LDY $53            ; $ee79: a4 53     
            CPY #$01           ; $ee7b: c0 01     
            BNE __ee80         ; $ee7d: d0 01     
            RTS                ; $ee7f: 60        

;-------------------------------------------------------------------------------
__ee80:     LDA $be            ; $ee80: a5 be     
            BEQ __eed8         ; $ee82: f0 54     
            CPY #$04           ; $ee84: c0 04     
            BNE __eef0         ; $ee86: d0 68     
            LDY #$00           ; $ee88: a0 00     
            LDX __c5ff         ; $ee8a: ae ff c5  
__ee8d:     LDA __c5c2,x       ; $ee8d: bd c2 c5  
            CMP $0203          ; $ee90: cd 03 02  
            BNE __eee7         ; $ee93: d0 52     
            LDA __c5ae,x       ; $ee95: bd ae c5  
            CMP $0200          ; $ee98: cd 00 02  
            BCC __eee7         ; $ee9b: 90 4a     
            SEC                ; $ee9d: 38        
            SBC #$11           ; $ee9e: e9 11     
            CMP $0200          ; $eea0: cd 00 02  
            BCS __eee7         ; $eea3: b0 42     
            LDA $00c1,y        ; $eea5: b9 c1 00  
            CMP #$00           ; $eea8: c9 00     
            BNE __eed9         ; $eeaa: d0 2d     
            LDA $96            ; $eeac: a5 96     
            CMP #$08           ; $eeae: c9 08     
            BEQ __eed8         ; $eeb0: f0 26     
            CMP #$ff           ; $eeb2: c9 ff     
            BEQ __eed8         ; $eeb4: f0 22     
            LDA #$11           ; $eeb6: a9 11     
            STA $cc            ; $eeb8: 85 cc     
            LDA #$01           ; $eeba: a9 01     
            STA $00c1,y        ; $eebc: 99 c1 00  
            JSR __ef38         ; $eebf: 20 38 ef  
            LDA $0200          ; $eec2: ad 00 02  
            CLC                ; $eec5: 18        
            ADC #$10           ; $eec6: 69 10     
            STA $06            ; $eec8: 85 06     
            LDA $0203          ; $eeca: ad 03 02  
            STA $05            ; $eecd: 85 05     
            LDX #$00           ; $eecf: a2 00     
            JSR __cfc6         ; $eed1: 20 c6 cf  
            LDA #$20           ; $eed4: a9 20     
            STA $fd            ; $eed6: 85 fd     
__eed8:     RTS                ; $eed8: 60        

;-------------------------------------------------------------------------------
__eed9:     LDA $96            ; $eed9: a5 96     
            CMP #$04           ; $eedb: c9 04     
            BEQ __eee6         ; $eedd: f0 07     
            JSR __ef51         ; $eedf: 20 51 ef  
            LDA #$08           ; $eee2: a9 08     
            STA $96            ; $eee4: 85 96     
__eee6:     RTS                ; $eee6: 60        

;-------------------------------------------------------------------------------
__eee7:     CPY #$07           ; $eee7: c0 07     
            BEQ __eef0         ; $eee9: f0 05     
            INX                ; $eeeb: e8        
            INY                ; $eeec: c8        
            JMP __ee8d         ; $eeed: 4c 8d ee  

;-------------------------------------------------------------------------------
__eef0:     LDY $53            ; $eef0: a4 53     
            LDX __c5fa,y       ; $eef2: be fa c5  
            LDY #$00           ; $eef5: a0 00     
__eef7:     LDA __c5ae,x       ; $eef7: bd ae c5  
            CMP $0200          ; $eefa: cd 00 02  
            BNE __ef2f         ; $eefd: d0 30     
            LDA __c5c2,x       ; $eeff: bd c2 c5  
            CMP $0203          ; $ef02: cd 03 02  
            BNE __ef2f         ; $ef05: d0 28     
            LDA $00c9,y        ; $ef07: b9 c9 00  
            BNE __ef2f         ; $ef0a: d0 23     
            LDA #$22           ; $ef0c: a9 22     
            STA $cc            ; $ef0e: 85 cc     
            LDA #$01           ; $ef10: a9 01     
            STA $00c9,y        ; $ef12: 99 c9 00  
            JSR __ef38         ; $ef15: 20 38 ef  
            LDA $0200          ; $ef18: ad 00 02  
            SEC                ; $ef1b: 38        
            SBC #$08           ; $ef1c: e9 08     
            STA $06            ; $ef1e: 85 06     
            LDA $0203          ; $ef20: ad 03 02  
            STA $05            ; $ef23: 85 05     
            LDX #$03           ; $ef25: a2 03     
            JSR __cfc6         ; $ef27: 20 c6 cf  
            LDA #$20           ; $ef2a: a9 20     
            STA $fd            ; $ef2c: 85 fd     
__ef2e:     RTS                ; $ef2e: 60        

;-------------------------------------------------------------------------------
__ef2f:     CPY #$02           ; $ef2f: c0 02     
            BEQ __ef2e         ; $ef31: f0 fb     
            INX                ; $ef33: e8        
            INY                ; $ef34: c8        
            JMP __eef7         ; $ef35: 4c f7 ee  

;-------------------------------------------------------------------------------
__ef38:     LDA #$24           ; $ef38: a9 24     
            STA $cd            ; $ef3a: 85 cd     
            STA $ce            ; $ef3c: 85 ce     
            STA $cf            ; $ef3e: 85 cf     
            STA $d0            ; $ef40: 85 d0     
            LDA __c5d6,x       ; $ef42: bd d6 c5  
            STA $01            ; $ef45: 85 01     
            LDA __c5e9,x       ; $ef47: bd e9 c5  
            STA $00            ; $ef4a: 85 00     
            LDA #$48           ; $ef4c: a9 48     
            JMP __c815         ; $ef4e: 4c 15 c8  

;-------------------------------------------------------------------------------
__ef51:     LDA $96            ; $ef51: a5 96     
            CMP #$0a           ; $ef53: c9 0a     
            BNE __ef71         ; $ef55: d0 1a     
            LDA $a0            ; $ef57: a5 a0     
            BEQ __ef71         ; $ef59: f0 16     
            SEC                ; $ef5b: 38        
            SBC #$01           ; $ef5c: e9 01     
            TAX                ; $ef5e: aa        
            LDA #$00           ; $ef5f: a9 00     
            STA $0451,x        ; $ef61: 9d 51 04  
            TXA                ; $ef64: 8a        
            ASL                ; $ef65: 0a        
            ASL                ; $ef66: 0a        
            ASL                ; $ef67: 0a        
            TAX                ; $ef68: aa        
            LDA #$ff           ; $ef69: a9 ff     
            STA $02d0,x        ; $ef6b: 9d d0 02  
            STA $02d4,x        ; $ef6e: 9d d4 02  
__ef71:     RTS                ; $ef71: 60        

;-------------------------------------------------------------------------------
__ef72:     STX $0f            ; $ef72: 86 0f     
            ASL                ; $ef74: 0a        
            TAX                ; $ef75: aa        
            LDA $042c,x        ; $ef76: bd 2c 04  
            BNE __ef94         ; $ef79: d0 19     
            STA $0436,x        ; $ef7b: 9d 36 04  
            CPX #$00           ; $ef7e: e0 00     
            BNE __ef87         ; $ef80: d0 05     
            LDA #$08           ; $ef82: a9 08     
            JMP __ef89         ; $ef84: 4c 89 ef  

;-------------------------------------------------------------------------------
__ef87:     LDA #$80           ; $ef87: a9 80     
__ef89:     STA $0435,x        ; $ef89: 9d 35 04  
            LDA #$f0           ; $ef8c: a9 f0     
            STA $042d,x        ; $ef8e: 9d 2d 04  
            JMP __efad         ; $ef91: 4c ad ef  

;-------------------------------------------------------------------------------
__ef94:     LDA $0435,x        ; $ef94: bd 35 04  
            CPX #$00           ; $ef97: e0 00     
            BNE __efa0         ; $ef99: d0 05     
            ADC #$10           ; $ef9b: 69 10     
            JMP __efa2         ; $ef9d: 4c a2 ef  

;-------------------------------------------------------------------------------
__efa0:     ADC #$30           ; $efa0: 69 30     
__efa2:     STA $0435,x        ; $efa2: 9d 35 04  
            LDA $0436,x        ; $efa5: bd 36 04  
            ADC #$00           ; $efa8: 69 00     
            STA $0436,x        ; $efaa: 9d 36 04  
__efad:     LDA $042d,x        ; $efad: bd 2d 04  
            SEC                ; $efb0: 38        
            SBC $043d,x        ; $efb1: fd 3d 04  
            STA $042d,x        ; $efb4: 9d 2d 04  
            LDA $01            ; $efb7: a5 01     
            SBC $043e,x        ; $efb9: fd 3e 04  
            STA $01            ; $efbc: 85 01     
            CLC                ; $efbe: 18        
            LDA $042d,x        ; $efbf: bd 2d 04  
            ADC $0435,x        ; $efc2: 7d 35 04  
            STA $042d,x        ; $efc5: 9d 2d 04  
            LDA $01            ; $efc8: a5 01     
            ADC $0436,x        ; $efca: 7d 36 04  
            STA $01            ; $efcd: 85 01     
            INC $042c,x        ; $efcf: fe 2c 04  
            LDX $0f            ; $efd2: a6 0f     
            RTS                ; $efd4: 60        

;-------------------------------------------------------------------------------
__efd5:     LDA $5d            ; $efd5: a5 5d     
__efd7:     CLC                ; $efd7: 18        
            ADC #$03           ; $efd8: 69 03     
            JMP __efe2         ; $efda: 4c e2 ef  

;-------------------------------------------------------------------------------
__efdd:     LDA $ae            ; $efdd: a5 ae     
            CLC                ; $efdf: 18        
            ADC #$01           ; $efe0: 69 01     
__efe2:     ASL                ; $efe2: 0a        
            ASL                ; $efe3: 0a        
            ASL                ; $efe4: 0a        
            ASL                ; $efe5: 0a        
            TAX                ; $efe6: aa        
            RTS                ; $efe7: 60        

;-------------------------------------------------------------------------------
__efe8:     JSR __c847         ; $efe8: 20 47 c8  
__efeb:     LDA #$00           ; $efeb: a9 00     
            .hex f0            ; $efed: f0        Suspected data
__efee:     .hex 06            ; $efee: 06        Suspected data
__efef:     LDA #$01           ; $efef: a9 01     
            BNE __eff5         ; $eff1: d0 02     
__eff3:     LDA #$02           ; $eff3: a9 02     
__eff5:     STA $0c            ; $eff5: 85 0c     
            TXA                ; $eff7: 8a        
            PHA                ; $eff8: 48        
            TYA                ; $eff9: 98        
            PHA                ; $effa: 48        
            LDY #$00           ; $effb: a0 00     
            LDA $0c            ; $effd: a5 0c     
            BNE __f018         ; $efff: d0 17     
            JSR __f063         ; $f001: 20 63 f0  
            STA $46            ; $f004: 85 46     
            JSR __f069         ; $f006: 20 69 f0  
            STA $47            ; $f009: 85 47     
            JSR __f062         ; $f00b: 20 62 f0  
            STA $48            ; $f00e: 85 48     
            JSR __f069         ; $f010: 20 69 f0  
            STA $49            ; $f013: 85 49     
            JMP __f059         ; $f015: 4c 59 f0  

;-------------------------------------------------------------------------------
__f018:     JSR __f063         ; $f018: 20 63 f0  
            STA $4a            ; $f01b: 85 4a     
            JSR __f069         ; $f01d: 20 69 f0  
            STA $4b            ; $f020: 85 4b     
            JSR __f062         ; $f022: 20 62 f0  
            STA $4c            ; $f025: 85 4c     
            JSR __f069         ; $f027: 20 69 f0  
            STA $4d            ; $f02a: 85 4d     
            LDA $4a            ; $f02c: a5 4a     
            SEC                ; $f02e: 38        
            SBC $46            ; $f02f: e5 46     
            STA $9c            ; $f031: 85 9c     
            LDA $4b            ; $f033: a5 4b     
            SEC                ; $f035: 38        
            SBC $47            ; $f036: e5 47     
            STA $9d            ; $f038: 85 9d     
            LDA $49            ; $f03a: a5 49     
            CMP $4b            ; $f03c: c5 4b     
            BCC __f057         ; $f03e: 90 17     
            LDA $4d            ; $f040: a5 4d     
            CMP $47            ; $f042: c5 47     
            BCC __f057         ; $f044: 90 11     
            LDA $4c            ; $f046: a5 4c     
            CMP $46            ; $f048: c5 46     
            BCC __f057         ; $f04a: 90 0b     
            LDA $48            ; $f04c: a5 48     
            CMP $4a            ; $f04e: c5 4a     
            BCC __f057         ; $f050: 90 05     
            LDA #$01           ; $f052: a9 01     
            JMP __f059         ; $f054: 4c 59 f0  

;-------------------------------------------------------------------------------
__f057:     LDA #$00           ; $f057: a9 00     
__f059:     STA $0c            ; $f059: 85 0c     
            PLA                ; $f05b: 68        
            TAY                ; $f05c: a8        
            PLA                ; $f05d: 68        
            TAX                ; $f05e: aa        
            LDA $0c            ; $f05f: a5 0c     
            RTS                ; $f061: 60        

;-------------------------------------------------------------------------------
__f062:     INY                ; $f062: c8        
__f063:     LDA ($02),y        ; $f063: b1 02     
            CLC                ; $f065: 18        
            ADC $00            ; $f066: 65 00     
            RTS                ; $f068: 60        

;-------------------------------------------------------------------------------
__f069:     INY                ; $f069: c8        
            LDA ($02),y        ; $f06a: b1 02     
            CLC                ; $f06c: 18        
            ADC $01            ; $f06d: 65 01     
            RTS                ; $f06f: 60        

;-------------------------------------------------------------------------------
__f070:     STA $02            ; $f070: 85 02     
            JSR __eae1         ; $f072: 20 e1 ea  
__f075:     JSR __eacd         ; $f075: 20 cd ea  
__f078:     LDA $57            ; $f078: a5 57     
            AND #$03           ; $f07a: 29 03     
            LSR                ; $f07c: 4a        
            JMP __f096         ; $f07d: 4c 96 f0  

;-------------------------------------------------------------------------------
__f080:     STA $04            ; $f080: 85 04     
__f082:     LDA #$00           ; $f082: a9 00     
            BEQ __f096         ; $f084: f0 10     
__f086:     STA $04            ; $f086: 85 04     
__f088:     LDA #$01           ; $f088: a9 01     
            BNE __f096         ; $f08a: d0 0a     
__f08c:     STA $04            ; $f08c: 85 04     
__f08e:     LDA #$04           ; $f08e: a9 04     
            BNE __f096         ; $f090: d0 04     
__f092:     STA $03            ; $f092: 85 03     
__f094:     LDA #$0f           ; $f094: a9 0f     
__f096:     PHA                ; $f096: 48        
            STA $0f            ; $f097: 85 0f     
            TXA                ; $f099: 8a        
            PHA                ; $f09a: 48        
            TYA                ; $f09b: 98        
            PHA                ; $f09c: 48        
            LDA $00            ; $f09d: a5 00     
            PHA                ; $f09f: 48        
            LDA $05            ; $f0a0: a5 05     
            PHA                ; $f0a2: 48        
            LDA $06            ; $f0a3: a5 06     
            PHA                ; $f0a5: 48        
            LDA $07            ; $f0a6: a5 07     
            PHA                ; $f0a8: 48        
            LDA $08            ; $f0a9: a5 08     
            PHA                ; $f0ab: 48        
            LDA $09            ; $f0ac: a5 09     
            PHA                ; $f0ae: 48        
            LDA #$02           ; $f0af: a9 02     
            STA $05            ; $f0b1: 85 05     
            LDA $0f            ; $f0b3: a5 0f     
            CMP #$04           ; $f0b5: c9 04     
            BEQ __f0ef         ; $f0b7: f0 36     
            LDA #$0f           ; $f0b9: a9 0f     
            AND $03            ; $f0bb: 25 03     
            STA $07            ; $f0bd: 85 07     
            LDA $03            ; $f0bf: a5 03     
            LSR                ; $f0c1: 4a        
            LSR                ; $f0c2: 4a        
            LSR                ; $f0c3: 4a        
            LSR                ; $f0c4: 4a        
            STA $06            ; $f0c5: 85 06     
            TAX                ; $f0c7: aa        
            LDA #$00           ; $f0c8: a9 00     
            CLC                ; $f0ca: 18        
__f0cb:     ADC $07            ; $f0cb: 65 07     
            DEX                ; $f0cd: ca        
            BNE __f0cb         ; $f0ce: d0 fb     
            STA $08            ; $f0d0: 85 08     
            LDA $0f            ; $f0d2: a5 0f     
            BNE __f0dc         ; $f0d4: d0 06     
            JSR __f11e         ; $f0d6: 20 1e f1  
            JMP __f0e9         ; $f0d9: 4c e9 f0  

;-------------------------------------------------------------------------------
__f0dc:     CMP #$01           ; $f0dc: c9 01     
            BEQ __f0e6         ; $f0de: f0 06     
            JSR __f195         ; $f0e0: 20 95 f1  
            JMP __f0f2         ; $f0e3: 4c f2 f0  

;-------------------------------------------------------------------------------
__f0e6:     JSR __f161         ; $f0e6: 20 61 f1  
__f0e9:     JSR __f139         ; $f0e9: 20 39 f1  
            JMP __f0f2         ; $f0ec: 4c f2 f0  

;-------------------------------------------------------------------------------
__f0ef:     JSR __f10a         ; $f0ef: 20 0a f1  
__f0f2:     PLA                ; $f0f2: 68        
            STA $09            ; $f0f3: 85 09     
            PLA                ; $f0f5: 68        
            STA $08            ; $f0f6: 85 08     
            PLA                ; $f0f8: 68        
            STA $07            ; $f0f9: 85 07     
            PLA                ; $f0fb: 68        
            STA $06            ; $f0fc: 85 06     
            PLA                ; $f0fe: 68        
            STA $05            ; $f0ff: 85 05     
            PLA                ; $f101: 68        
            STA $00            ; $f102: 85 00     
            PLA                ; $f104: 68        
            TAY                ; $f105: a8        
            PLA                ; $f106: 68        
            TAX                ; $f107: aa        
            PLA                ; $f108: 68        
            RTS                ; $f109: 60        

;-------------------------------------------------------------------------------
__f10a:     LDX $03            ; $f10a: a6 03     
            LDY #$00           ; $f10c: a0 00     
__f10e:     LDA #$ff           ; $f10e: a9 ff     
            STA ($04),y        ; $f110: 91 04     
            INY                ; $f112: c8        
            INY                ; $f113: c8        
            LDA $02            ; $f114: a5 02     
            STA ($04),y        ; $f116: 91 04     
            INY                ; $f118: c8        
            INY                ; $f119: c8        
            DEX                ; $f11a: ca        
            BNE __f10e         ; $f11b: d0 f1     
            RTS                ; $f11d: 60        

;-------------------------------------------------------------------------------
__f11e:     LDA $02            ; $f11e: a5 02     
            LDX $08            ; $f120: a6 08     
            LDY #$01           ; $f122: a0 01     
__f124:     STA ($04),y        ; $f124: 91 04     
            CLC                ; $f126: 18        
            ADC #$01           ; $f127: 69 01     
            INY                ; $f129: c8        
            PHA                ; $f12a: 48        
            LDA ($04),y        ; $f12b: b1 04     
            AND #$3f           ; $f12d: 29 3f     
            STA ($04),y        ; $f12f: 91 04     
            PLA                ; $f131: 68        
            INY                ; $f132: c8        
            INY                ; $f133: c8        
            INY                ; $f134: c8        
            DEX                ; $f135: ca        
            BNE __f124         ; $f136: d0 ec     
            RTS                ; $f138: 60        

;-------------------------------------------------------------------------------
__f139:     LDY #$00           ; $f139: a0 00     
__f13b:     LDX $06            ; $f13b: a6 06     
            LDA $01            ; $f13d: a5 01     
            STA $09            ; $f13f: 85 09     
__f141:     LDA $09            ; $f141: a5 09     
            STA ($04),y        ; $f143: 91 04     
            CLC                ; $f145: 18        
            ADC #$08           ; $f146: 69 08     
            STA $09            ; $f148: 85 09     
            INY                ; $f14a: c8        
            INY                ; $f14b: c8        
            INY                ; $f14c: c8        
            LDA $00            ; $f14d: a5 00     
            STA ($04),y        ; $f14f: 91 04     
            INY                ; $f151: c8        
            DEX                ; $f152: ca        
            BNE __f141         ; $f153: d0 ec     
            LDA $00            ; $f155: a5 00     
            CLC                ; $f157: 18        
            ADC #$08           ; $f158: 69 08     
            STA $00            ; $f15a: 85 00     
            DEC $07            ; $f15c: c6 07     
            BNE __f13b         ; $f15e: d0 db     
            RTS                ; $f160: 60        

;-------------------------------------------------------------------------------
__f161:     LDY #$01           ; $f161: a0 01     
            STY $0a            ; $f163: 84 0a     
            LDA $08            ; $f165: a5 08     
            SEC                ; $f167: 38        
            SBC $06            ; $f168: e5 06     
__f16a:     TAY                ; $f16a: a8        
            STA $0b            ; $f16b: 85 0b     
            LDX $06            ; $f16d: a6 06     
__f16f:     TYA                ; $f16f: 98        
            PHA                ; $f170: 48        
            CLC                ; $f171: 18        
            TYA                ; $f172: 98        
            ADC $02            ; $f173: 65 02     
            LDY $0a            ; $f175: a4 0a     
            STA ($04),y        ; $f177: 91 04     
            INY                ; $f179: c8        
            LDA ($04),y        ; $f17a: b1 04     
            AND #$3f           ; $f17c: 29 3f     
            EOR #$40           ; $f17e: 49 40     
            STA ($04),y        ; $f180: 91 04     
            INY                ; $f182: c8        
            INY                ; $f183: c8        
            INY                ; $f184: c8        
            STY $0a            ; $f185: 84 0a     
            PLA                ; $f187: 68        
            TAY                ; $f188: a8        
            INY                ; $f189: c8        
            DEX                ; $f18a: ca        
            BNE __f16f         ; $f18b: d0 e2     
            LDA $0b            ; $f18d: a5 0b     
            SEC                ; $f18f: 38        
            SBC $06            ; $f190: e5 06     
            BPL __f16a         ; $f192: 10 d6     
            RTS                ; $f194: 60        

;-------------------------------------------------------------------------------
__f195:     LDY #$00           ; $f195: a0 00     
__f197:     LDX $06            ; $f197: a6 06     
            LDA $01            ; $f199: a5 01     
            STA $09            ; $f19b: 85 09     
            LDA #$ff           ; $f19d: a9 ff     
__f19f:     STA ($04),y        ; $f19f: 91 04     
            INY                ; $f1a1: c8        
            INY                ; $f1a2: c8        
            INY                ; $f1a3: c8        
            INY                ; $f1a4: c8        
            DEX                ; $f1a5: ca        
            BNE __f19f         ; $f1a6: d0 f7     
            LDA $00            ; $f1a8: a5 00     
            CLC                ; $f1aa: 18        
            ADC #$08           ; $f1ab: 69 08     
            STA $00            ; $f1ad: 85 00     
            DEC $07            ; $f1af: c6 07     
            BNE __f197         ; $f1b1: d0 e4     
            RTS                ; $f1b3: 60        

;-------------------------------------------------------------------------------
__f1b4:     LDA $2002          ; $f1b4: ad 02 20  
            LDA $10            ; $f1b7: a5 10     
            AND #$fb           ; $f1b9: 29 fb     
            STA $2000          ; $f1bb: 8d 00 20  
            LDA #$20           ; $f1be: a9 20     
            STA $2006          ; $f1c0: 8d 06 20  
            LDA #$00           ; $f1c3: a9 00     
            STA $2006          ; $f1c5: 8d 06 20  
            LDX #$04           ; $f1c8: a2 04     
            LDY #$00           ; $f1ca: a0 00     
            LDA #$24           ; $f1cc: a9 24     
__f1ce:     STA $2007          ; $f1ce: 8d 07 20  
            DEY                ; $f1d1: 88        
            BNE __f1ce         ; $f1d2: d0 fa     
            DEX                ; $f1d4: ca        
            BNE __f1ce         ; $f1d5: d0 f7     
            LDA #$23           ; $f1d7: a9 23     
            STA $2006          ; $f1d9: 8d 06 20  
            LDA #$c0           ; $f1dc: a9 c0     
            STA $2006          ; $f1de: 8d 06 20  
            LDY #$40           ; $f1e1: a0 40     
            LDA #$00           ; $f1e3: a9 00     
__f1e5:     STA $2007          ; $f1e5: 8d 07 20  
            DEY                ; $f1e8: 88        
            BNE __f1e5         ; $f1e9: d0 fa     
            RTS                ; $f1eb: 60        

;-------------------------------------------------------------------------------
__f1ec:     STA $2006          ; $f1ec: 8d 06 20  
            INY                ; $f1ef: c8        
            LDA ($00),y        ; $f1f0: b1 00     
            STA $2006          ; $f1f2: 8d 06 20  
            INY                ; $f1f5: c8        
            LDA ($00),y        ; $f1f6: b1 00     
            ASL                ; $f1f8: 0a        
            PHA                ; $f1f9: 48        
            LDA $10            ; $f1fa: a5 10     
            ORA #$04           ; $f1fc: 09 04     
            BCS __f202         ; $f1fe: b0 02     
            AND #$fb           ; $f200: 29 fb     
__f202:     STA $2000          ; $f202: 8d 00 20  
            STA $10            ; $f205: 85 10     
            PLA                ; $f207: 68        
            ASL                ; $f208: 0a        
            BCC __f20e         ; $f209: 90 03     
            ORA #$02           ; $f20b: 09 02     
            INY                ; $f20d: c8        
__f20e:     LSR                ; $f20e: 4a        
            LSR                ; $f20f: 4a        
            TAX                ; $f210: aa        
__f211:     BCS __f214         ; $f211: b0 01     
            INY                ; $f213: c8        
__f214:     LDA ($00),y        ; $f214: b1 00     
            STA $2007          ; $f216: 8d 07 20  
            DEX                ; $f219: ca        
            BNE __f211         ; $f21a: d0 f5     
            SEC                ; $f21c: 38        
            TYA                ; $f21d: 98        
            ADC $00            ; $f21e: 65 00     
            STA $00            ; $f220: 85 00     
            LDA #$00           ; $f222: a9 00     
            ADC $01            ; $f224: 65 01     
            STA $01            ; $f226: 85 01     
__f228:     LDX $2002          ; $f228: ae 02 20  
            LDY #$00           ; $f22b: a0 00     
            LDA ($00),y        ; $f22d: b1 00     
            BNE __f1ec         ; $f22f: d0 bb     
            LDA $12            ; $f231: a5 12     
            STA $2005          ; $f233: 8d 05 20  
            LDA $13            ; $f236: a5 13     
            STA $2005          ; $f238: 8d 05 20  
            RTS                ; $f23b: 60        

;-------------------------------------------------------------------------------
__f23c:     CLD                ; $f23c: d8        
            LDA #$04           ; $f23d: a9 04     
__f23f:     LSR $00            ; $f23f: 46 00     
            BCC __f248         ; $f241: 90 05     
            PHA                ; $f243: 48        
            JSR __f24e         ; $f244: 20 4e f2  
            PLA                ; $f247: 68        
__f248:     CLC                ; $f248: 18        
            SBC #$00           ; $f249: e9 00     
            BPL __f23f         ; $f24b: 10 f2     
            RTS                ; $f24d: 60        

;-------------------------------------------------------------------------------
__f24e:     ASL                ; $f24e: 0a        
            ASL                ; $f24f: 0a        
            TAY                ; $f250: a8        
            STA $01            ; $f251: 85 01     
            LDX $0330          ; $f253: ae 30 03  
            LDA __c000,y       ; $f256: b9 00 c0  
            STA $0331,x        ; $f259: 9d 31 03  
            JSR __f32d         ; $f25c: 20 2d f3  
            INY                ; $f25f: c8        
            LDA __c000,y       ; $f260: b9 00 c0  
            STA $0331,x        ; $f263: 9d 31 03  
            JSR __f32d         ; $f266: 20 2d f3  
            INY                ; $f269: c8        
            LDA __c000,y       ; $f26a: b9 00 c0  
            AND #$87           ; $f26d: 29 87     
            STA $0331,x        ; $f26f: 9d 31 03  
            AND #$07           ; $f272: 29 07     
            STA $02            ; $f274: 85 02     
            TXA                ; $f276: 8a        
            SEC                ; $f277: 38        
            ADC $02            ; $f278: 65 02     
            JSR __f32f         ; $f27a: 20 2f f3  
            TAX                ; $f27d: aa        
            STX $0330          ; $f27e: 8e 30 03  
            LDA #$00           ; $f281: a9 00     
            STA $0331,x        ; $f283: 9d 31 03  
            INY                ; $f286: c8        
            LDA __c000,y       ; $f287: b9 00 c0  
            STA $03            ; $f28a: 85 03     
            DEX                ; $f28c: ca        
            CLC                ; $f28d: 18        
__f28e:     LDA $0020,y        ; $f28e: b9 20 00  
            AND #$0f           ; $f291: 29 0f     
            BEQ __f296         ; $f293: f0 01     
            CLC                ; $f295: 18        
__f296:     BCC __f29a         ; $f296: 90 02     
            LDA #$24           ; $f298: a9 24     
__f29a:     STA $0331,x        ; $f29a: 9d 31 03  
            DEX                ; $f29d: ca        
            DEC $02            ; $f29e: c6 02     
            BEQ __f2c4         ; $f2a0: f0 22     
            LDA $0020,y        ; $f2a2: b9 20 00  
            AND #$f0           ; $f2a5: 29 f0     
            PHP                ; $f2a7: 08        
            LSR                ; $f2a8: 4a        
            LSR                ; $f2a9: 4a        
            LSR                ; $f2aa: 4a        
            LSR                ; $f2ab: 4a        
            PLP                ; $f2ac: 28        
            BEQ __f2b0         ; $f2ad: f0 01     
            CLC                ; $f2af: 18        
__f2b0:     BCC __f2b4         ; $f2b0: 90 02     
            LDA #$24           ; $f2b2: a9 24     
__f2b4:     STA $0331,x        ; $f2b4: 9d 31 03  
            LDA $03            ; $f2b7: a5 03     
            AND #$01           ; $f2b9: 29 01     
            BEQ __f2be         ; $f2bb: f0 01     
            SEC                ; $f2bd: 38        
__f2be:     DEY                ; $f2be: 88        
            DEX                ; $f2bf: ca        
            DEC $02            ; $f2c0: c6 02     
            BNE __f28e         ; $f2c2: d0 ca     
__f2c4:     LDA $03            ; $f2c4: a5 03     
            AND #$10           ; $f2c6: 29 10     
            BEQ __f2d6         ; $f2c8: f0 0c     
            INX                ; $f2ca: e8        
            LDY $01            ; $f2cb: a4 01     
            CLC                ; $f2cd: 18        
            LDA $0020,y        ; $f2ce: b9 20 00  
            ADC #$37           ; $f2d1: 69 37     
            STA $0331,x        ; $f2d3: 9d 31 03  
__f2d6:     RTS                ; $f2d6: 60        

;-------------------------------------------------------------------------------
__f2d7:     LDY #$00           ; $f2d7: a0 00     
            LDA ($02),y        ; $f2d9: b1 02     
            AND #$0f           ; $f2db: 29 0f     
            STA $05            ; $f2dd: 85 05     
            LDA ($02),y        ; $f2df: b1 02     
            LSR                ; $f2e1: 4a        
            LSR                ; $f2e2: 4a        
            LSR                ; $f2e3: 4a        
            LSR                ; $f2e4: 4a        
            STA $04            ; $f2e5: 85 04     
            LDX $0330          ; $f2e7: ae 30 03  
__f2ea:     LDA $01            ; $f2ea: a5 01     
            STA $0331,x        ; $f2ec: 9d 31 03  
            JSR __f32d         ; $f2ef: 20 2d f3  
            LDA $00            ; $f2f2: a5 00     
            STA $0331,x        ; $f2f4: 9d 31 03  
            JSR __f32d         ; $f2f7: 20 2d f3  
            LDA $04            ; $f2fa: a5 04     
            STA $06            ; $f2fc: 85 06     
            ORA #$80           ; $f2fe: 09 80     
            STA $0331,x        ; $f300: 9d 31 03  
__f303:     JSR __f32d         ; $f303: 20 2d f3  
            INY                ; $f306: c8        
            LDA ($02),y        ; $f307: b1 02     
            STA $0331,x        ; $f309: 9d 31 03  
            DEC $06            ; $f30c: c6 06     
            BNE __f303         ; $f30e: d0 f3     
            JSR __f32d         ; $f310: 20 2d f3  
            CLC                ; $f313: 18        
            LDA #$01           ; $f314: a9 01     
            ADC $00            ; $f316: 65 00     
            STA $00            ; $f318: 85 00     
            LDA #$00           ; $f31a: a9 00     
            ADC $01            ; $f31c: 65 01     
            STA $01            ; $f31e: 85 01     
            STX $0330          ; $f320: 8e 30 03  
            DEC $05            ; $f323: c6 05     
            BNE __f2ea         ; $f325: d0 c3     
            LDA #$00           ; $f327: a9 00     
            STA $0331,x        ; $f329: 9d 31 03  
            RTS                ; $f32c: 60        

;-------------------------------------------------------------------------------
__f32d:     INX                ; $f32d: e8        
            TXA                ; $f32e: 8a        
__f32f:     CMP #$3f           ; $f32f: c9 3f     
            BCC __f33d         ; $f331: 90 0a     
            LDX $0330          ; $f333: ae 30 03  
            LDA #$00           ; $f336: a9 00     
            STA $0331,x        ; $f338: 9d 31 03  
            PLA                ; $f33b: 68        
            PLA                ; $f33c: 68        
__f33d:     RTS                ; $f33d: 60        

;-------------------------------------------------------------------------------
__f33e:     LDX #$ff           ; $f33e: a2 ff     
            BNE __f344         ; $f340: d0 02     
__f342:     LDX #$00           ; $f342: a2 00     
__f344:     STX $04            ; $f344: 86 04     
            LDX #$00           ; $f346: a2 00     
            STX $05            ; $f348: 86 05     
            STX $06            ; $f34a: 86 06     
            STX $07            ; $f34c: 86 07     
            LDA $01            ; $f34e: a5 01     
            AND #$08           ; $f350: 29 08     
            BNE __f355         ; $f352: d0 01     
            INX                ; $f354: e8        
__f355:     LDA $00            ; $f355: a5 00     
            STA $06,x          ; $f357: 95 06     
            LDA $01            ; $f359: a5 01     
            JMP __f35e         ; $f35b: 4c 5e f3  

;-------------------------------------------------------------------------------
__f35e:     AND #$07           ; $f35e: 29 07     
            ASL                ; $f360: 0a        
            ASL                ; $f361: 0a        
            TAX                ; $f362: aa        
            LDA $04            ; $f363: a5 04     
            BEQ __f38e         ; $f365: f0 27     
            LDA $24,x          ; $f367: b5 24     
            BEQ __f392         ; $f369: f0 27     
__f36b:     CLC                ; $f36b: 18        
            LDA $27,x          ; $f36c: b5 27     
            STA $03            ; $f36e: 85 03     
            LDA $07            ; $f370: a5 07     
            JSR __f3e3         ; $f372: 20 e3 f3  
            STA $27,x          ; $f375: 95 27     
            LDA $26,x          ; $f377: b5 26     
            STA $03            ; $f379: 85 03     
            LDA $06            ; $f37b: a5 06     
            JSR __f3e3         ; $f37d: 20 e3 f3  
            STA $26,x          ; $f380: 95 26     
            LDA $25,x          ; $f382: b5 25     
            STA $03            ; $f384: 85 03     
            LDA $05            ; $f386: a5 05     
            JSR __f3e3         ; $f388: 20 e3 f3  
            STA $25,x          ; $f38b: 95 25     
            RTS                ; $f38d: 60        

;-------------------------------------------------------------------------------
__f38e:     LDA $24,x          ; $f38e: b5 24     
            BEQ __f36b         ; $f390: f0 d9     
__f392:     SEC                ; $f392: 38        
            LDA $27,x          ; $f393: b5 27     
            STA $03            ; $f395: 85 03     
            LDA $07            ; $f397: a5 07     
            JSR __f404         ; $f399: 20 04 f4  
            STA $27,x          ; $f39c: 95 27     
            LDA $26,x          ; $f39e: b5 26     
            STA $03            ; $f3a0: 85 03     
            LDA $06            ; $f3a2: a5 06     
            JSR __f404         ; $f3a4: 20 04 f4  
            STA $26,x          ; $f3a7: 95 26     
            LDA $25,x          ; $f3a9: b5 25     
            STA $03            ; $f3ab: 85 03     
            LDA $05            ; $f3ad: a5 05     
            JSR __f404         ; $f3af: 20 04 f4  
            STA $25,x          ; $f3b2: 95 25     
            LDA $25,x          ; $f3b4: b5 25     
            BNE __f3c0         ; $f3b6: d0 08     
            LDA $26,x          ; $f3b8: b5 26     
            BNE __f3c0         ; $f3ba: d0 04     
            LDA $27,x          ; $f3bc: b5 27     
            BEQ __f3c6         ; $f3be: f0 06     
__f3c0:     BCS __f3e2         ; $f3c0: b0 20     
            LDA $24,x          ; $f3c2: b5 24     
            EOR #$ff           ; $f3c4: 49 ff     
__f3c6:     STA $24,x          ; $f3c6: 95 24     
            SEC                ; $f3c8: 38        
            LDA #$00           ; $f3c9: a9 00     
            STA $03            ; $f3cb: 85 03     
            LDA $27,x          ; $f3cd: b5 27     
            JSR __f404         ; $f3cf: 20 04 f4  
            STA $27,x          ; $f3d2: 95 27     
            LDA $26,x          ; $f3d4: b5 26     
            JSR __f404         ; $f3d6: 20 04 f4  
            STA $26,x          ; $f3d9: 95 26     
            LDA $25,x          ; $f3db: b5 25     
            JSR __f404         ; $f3dd: 20 04 f4  
            STA $25,x          ; $f3e0: 95 25     
__f3e2:     RTS                ; $f3e2: 60        

;-------------------------------------------------------------------------------
__f3e3:     JSR __f426         ; $f3e3: 20 26 f4  
            ADC $01            ; $f3e6: 65 01     
            CMP #$0a           ; $f3e8: c9 0a     
            BCC __f3ee         ; $f3ea: 90 02     
            ADC #$05           ; $f3ec: 69 05     
__f3ee:     CLC                ; $f3ee: 18        
            ADC $02            ; $f3ef: 65 02     
            STA $02            ; $f3f1: 85 02     
            LDA $03            ; $f3f3: a5 03     
            AND #$f0           ; $f3f5: 29 f0     
            ADC $02            ; $f3f7: 65 02     
            BCC __f3ff         ; $f3f9: 90 04     
__f3fb:     ADC #$5f           ; $f3fb: 69 5f     
            SEC                ; $f3fd: 38        
            RTS                ; $f3fe: 60        

;-------------------------------------------------------------------------------
__f3ff:     CMP #$a0           ; $f3ff: c9 a0     
            BCS __f3fb         ; $f401: b0 f8     
            RTS                ; $f403: 60        

;-------------------------------------------------------------------------------
__f404:     JSR __f426         ; $f404: 20 26 f4  
            SBC $01            ; $f407: e5 01     
            STA $01            ; $f409: 85 01     
            BCS __f417         ; $f40b: b0 0a     
            ADC #$0a           ; $f40d: 69 0a     
            STA $01            ; $f40f: 85 01     
            LDA $02            ; $f411: a5 02     
            ADC #$0f           ; $f413: 69 0f     
            STA $02            ; $f415: 85 02     
__f417:     LDA $03            ; $f417: a5 03     
            AND #$f0           ; $f419: 29 f0     
            SEC                ; $f41b: 38        
            SBC $02            ; $f41c: e5 02     
            BCS __f423         ; $f41e: b0 03     
            ADC #$a0           ; $f420: 69 a0     
            CLC                ; $f422: 18        
__f423:     ORA $01            ; $f423: 05 01     
            RTS                ; $f425: 60        

;-------------------------------------------------------------------------------
__f426:     PHA                ; $f426: 48        
            AND #$0f           ; $f427: 29 0f     
            STA $01            ; $f429: 85 01     
            PLA                ; $f42b: 68        
            AND #$f0           ; $f42c: 29 f0     
            STA $02            ; $f42e: 85 02     
            LDA $03            ; $f430: a5 03     
            AND #$0f           ; $f432: 29 0f     
            RTS                ; $f434: 60        

;-------------------------------------------------------------------------------
__f435:     LDA #$00           ; $f435: a9 00     
            STA $04            ; $f437: 85 04     
            CLC                ; $f439: 18        
            LDA $00            ; $f43a: a5 00     
            ADC #$10           ; $f43c: 69 10     
            AND #$f0           ; $f43e: 29 f0     
            LSR                ; $f440: 4a        
            LSR                ; $f441: 4a        
            TAY                ; $f442: a8        
            LDA $00            ; $f443: a5 00     
            AND #$07           ; $f445: 29 07     
            ASL                ; $f447: 0a        
            ASL                ; $f448: 0a        
            TAX                ; $f449: aa        
__f44a:     LDA $0020,y        ; $f44a: b9 20 00  
            BEQ __f4a0         ; $f44d: f0 51     
            LDA $24,x          ; $f44f: b5 24     
            BEQ __f479         ; $f451: f0 26     
__f453:     SEC                ; $f453: 38        
            LDA $0023,y        ; $f454: b9 23 00  
            STA $03            ; $f457: 85 03     
            LDA $27,x          ; $f459: b5 27     
            JSR __f404         ; $f45b: 20 04 f4  
            LDA $0022,y        ; $f45e: b9 22 00  
            STA $03            ; $f461: 85 03     
            LDA $26,x          ; $f463: b5 26     
            JSR __f404         ; $f465: 20 04 f4  
            LDA $0021,y        ; $f468: b9 21 00  
            STA $03            ; $f46b: 85 03     
            LDA $25,x          ; $f46d: b5 25     
            JSR __f404         ; $f46f: 20 04 f4  
            BCS __f4a4         ; $f472: b0 30     
            LDA $0020,y        ; $f474: b9 20 00  
            BNE __f4a9         ; $f477: d0 30     
__f479:     LDA #$ff           ; $f479: a9 ff     
            STA $04            ; $f47b: 85 04     
            SEC                ; $f47d: 38        
__f47e:     TYA                ; $f47e: 98        
            BNE __f49f         ; $f47f: d0 1e     
            BCC __f493         ; $f481: 90 10     
            LDA $24,x          ; $f483: b5 24     
            STA $20            ; $f485: 85 20     
            LDA $25,x          ; $f487: b5 25     
            STA $21            ; $f489: 85 21     
            LDA $26,x          ; $f48b: b5 26     
            STA $22            ; $f48d: 85 22     
            LDA $27,x          ; $f48f: b5 27     
            STA $23            ; $f491: 85 23     
__f493:     LDA $00            ; $f493: a5 00     
            AND #$08           ; $f495: 29 08     
            BEQ __f49f         ; $f497: f0 06     
            DEX                ; $f499: ca        
            DEX                ; $f49a: ca        
            DEX                ; $f49b: ca        
            DEX                ; $f49c: ca        
            BPL __f44a         ; $f49d: 10 ab     
__f49f:     RTS                ; $f49f: 60        

;-------------------------------------------------------------------------------
__f4a0:     LDA $24,x          ; $f4a0: b5 24     
            BEQ __f453         ; $f4a2: f0 af     
__f4a4:     LDA $0020,y        ; $f4a4: b9 20 00  
            BNE __f479         ; $f4a7: d0 d0     
__f4a9:     CLC                ; $f4a9: 18        
            BCC __f47e         ; $f4aa: 90 d2     
__f4ac:     LDX #$09           ; $f4ac: a2 09     
            DEC $34            ; $f4ae: c6 34     
            BPL __f4b8         ; $f4b0: 10 06     
            LDA #$0a           ; $f4b2: a9 0a     
            STA $34            ; $f4b4: 85 34     
            LDX #$10           ; $f4b6: a2 10     
__f4b8:     LDA $35,x          ; $f4b8: b5 35     
            BEQ __f4be         ; $f4ba: f0 02     
            DEC $35,x          ; $f4bc: d6 35     
__f4be:     DEX                ; $f4be: ca        
            BPL __f4b8         ; $f4bf: 10 f7     
            RTS                ; $f4c1: 60        

;-------------------------------------------------------------------------------
__f4c2:     LDX $0330          ; $f4c2: ae 30 03  
            LDA $01            ; $f4c5: a5 01     
            STA $0331,x        ; $f4c7: 9d 31 03  
            JSR __f32d         ; $f4ca: 20 2d f3  
            LDA $00            ; $f4cd: a5 00     
            STA $0331,x        ; $f4cf: 9d 31 03  
            JSR __f32d         ; $f4d2: 20 2d f3  
            LDA #$01           ; $f4d5: a9 01     
            STA $0331,x        ; $f4d7: 9d 31 03  
            JSR __f32d         ; $f4da: 20 2d f3  
            TYA                ; $f4dd: 98        
            STA $0331,x        ; $f4de: 9d 31 03  
            JSR __f32d         ; $f4e1: 20 2d f3  
            LDA #$00           ; $f4e4: a9 00     
            STA $0331,x        ; $f4e6: 9d 31 03  
            STX $0330          ; $f4e9: 8e 30 03  
            RTS                ; $f4ec: 60        

;-------------------------------------------------------------------------------
__f4ed:     LDA $18            ; $f4ed: a5 18     
            AND #$02           ; $f4ef: 29 02     
            STA $00            ; $f4f1: 85 00     
            LDA $19            ; $f4f3: a5 19     
            AND #$02           ; $f4f5: 29 02     
            EOR $00            ; $f4f7: 45 00     
            CLC                ; $f4f9: 18        
            BEQ __f4fd         ; $f4fa: f0 01     
            SEC                ; $f4fc: 38        
__f4fd:     ROR $18            ; $f4fd: 66 18     
            ROR $19            ; $f4ff: 66 19     
            ROR $1a            ; $f501: 66 1a     
            ROR $1b            ; $f503: 66 1b     
            ROR $1c            ; $f505: 66 1c     
            ROR $1d            ; $f507: 66 1d     
            ROR $1e            ; $f509: 66 1e     
            ROR $1f            ; $f50b: 66 1f     
            RTS                ; $f50d: 60        

;-------------------------------------------------------------------------------
__f50e:     LDA #$01           ; $f50e: a9 01     
            STA $4016          ; $f510: 8d 16 40  
            LDX #$00           ; $f513: a2 00     
            LDA #$00           ; $f515: a9 00     
            STA $4016          ; $f517: 8d 16 40  
            JSR __f522         ; $f51a: 20 22 f5  
            INX                ; $f51d: e8        
            JSR __f522         ; $f51e: 20 22 f5  
            RTS                ; $f521: 60        

;-------------------------------------------------------------------------------
__f522:     LDY #$08           ; $f522: a0 08     
__f524:     PHA                ; $f524: 48        
            LDA $4016,x        ; $f525: bd 16 40  
            STA $00            ; $f528: 85 00     
            LSR                ; $f52a: 4a        
            ORA $00            ; $f52b: 05 00     
            LSR                ; $f52d: 4a        
            PLA                ; $f52e: 68        
            ROL                ; $f52f: 2a        
            DEY                ; $f530: 88        
            BNE __f524         ; $f531: d0 f1     
            STX $00            ; $f533: 86 00     
            ASL $00            ; $f535: 06 00     
            LDX $00            ; $f537: a6 00     
            LDY $14,x          ; $f539: b4 14     
            STY $00            ; $f53b: 84 00     
            STA $14,x          ; $f53d: 95 14     
            AND #$ff           ; $f53f: 29 ff     
            BPL __f549         ; $f541: 10 06     
            BIT $00            ; $f543: 24 00     
            BPL __f549         ; $f545: 10 02     
            AND #$7f           ; $f547: 29 7f     
__f549:     LDY $15,x          ; $f549: b4 15     
            STA $15,x          ; $f54b: 95 15     
            TYA                ; $f54d: 98        
            AND #$0f           ; $f54e: 29 0f     
            AND $15,x          ; $f550: 35 15     
            BEQ __f55a         ; $f552: f0 06     
            ORA #$f0           ; $f554: 09 f0     
            AND $15,x          ; $f556: 35 15     
            STA $15,x          ; $f558: 95 15     
__f55a:     RTS                ; $f55a: 60        

;-------------------------------------------------------------------------------
            .hex 3f 00 20      ; $f55b: 3f 00 20  Invalid Opcode - RLA $2000,x
            .hex 0f 15 2c      ; $f55e: 0f 15 2c  Invalid Opcode - SLO $2c15
            .hex 12            ; $f561: 12        Invalid Opcode - KIL 
            .hex 0f 27 02      ; $f562: 0f 27 02  Invalid Opcode - SLO $0227
            .hex 17 0f         ; $f565: 17 0f     Invalid Opcode - SLO $0f,x
            BMI __f59f         ; $f567: 30 36     
            ASL $0f            ; $f569: 06 0f     
            BMI __f599         ; $f56b: 30 2c     
            BIT $0f            ; $f56d: 24 0f     
            .hex 02            ; $f56f: 02        Invalid Opcode - KIL 
            ROL $16,x          ; $f570: 36 16     
            .hex 0f 30 27      ; $f572: 0f 30 27  Invalid Opcode - SLO $2730
            BIT $0f            ; $f575: 24 0f     
            ASL $30,x          ; $f577: 16 30     
            .hex 37 0f         ; $f579: 37 0f     Invalid Opcode - RLA $0f,x
            ASL $27            ; $f57b: 06 27     
            .hex 02            ; $f57d: 02        Invalid Opcode - KIL 
            .hex 23 c0         ; $f57e: 23 c0     Invalid Opcode - RLA ($c0,x)
            PHA                ; $f580: 48        
            .hex ff 23 c8      ; $f581: ff 23 c8  Invalid Opcode - ISC __c823,x
            .hex 03 55         ; $f584: 03 55     Invalid Opcode - SLO ($55,x)
            TAX                ; $f586: aa        
            .hex 22            ; $f587: 22        Invalid Opcode - KIL 
            .hex 23 cd         ; $f588: 23 cd     Invalid Opcode - RLA ($cd,x)
            .hex 43 0f         ; $f58a: 43 0f     Invalid Opcode - SRE ($0f,x)
            JSR __c72c         ; $f58c: 20 2c c7  
            .hex 3f 20 81      ; $f58f: 3f 20 81  Invalid Opcode - RLA $8120,x
            STY $50            ; $f592: 84 50     
            EOR ($52),y        ; $f594: 51 52     
            .hex 53 20         ; $f596: 53 20     Invalid Opcode - SRE ($20),y
            .hex 82            ; $f598: 82        Suspected data
__f599:     STY $54            ; $f599: 84 54     
            EOR $56,x          ; $f59b: 55 56     
            .hex 57 20         ; $f59d: 57 20     Invalid Opcode - SRE $20,x
__f59f:     .hex 83 84         ; $f59f: 83 84     Invalid Opcode - SAX ($84,x)
            CLI                ; $f5a1: 58        
            EOR $5b5a,y        ; $f5a2: 59 5a 5b  
            JSR __c72a         ; $f5a5: 20 2a c7  
            .hex 3f 20 ad      ; $f5a8: 3f 20 ad  Invalid Opcode - RLA $ad20,x
            LSR $30            ; $f5ab: 46 30     
            JSR $43ca          ; $f5ad: 20 ca 43  
            BMI __f5d2         ; $f5b0: 30 20     
            .hex d2            ; $f5b2: d2        Invalid Opcode - KIL 
            .hex c2 3f         ; $f5b3: c2 3f     Invalid Opcode - NOP #$3f
            AND ($02,x)        ; $f5b5: 21 02     
            LSR $2130          ; $f5b7: 4e 30 21  
            BPL __f5c8         ; $f5ba: 10 0c     
            ROL $453e,x        ; $f5bc: 3e 3e 45  
            AND $3d3d,x        ; $f5bf: 3d 3d 3d  
            .hex 3c 3c 3c      ; $f5c2: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
            .hex 3b 3b 3b      ; $f5c5: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
__f5c8:     AND ($2d,x)        ; $f5c8: 21 2d     
            .hex 0f 3f 24      ; $f5ca: 0f 3f 24  Invalid Opcode - SLO $243f
            BIT $37            ; $f5cd: 24 37     
            .hex 37 37         ; $f5cf: 37 37     Invalid Opcode - RLA $37,x
            .hex 36            ; $f5d1: 36        Suspected data
__f5d2:     ROL $36,x          ; $f5d2: 36 36     
            AND $35,x          ; $f5d4: 35 35     
            AND $49,x          ; $f5d6: 35 49     
            .hex 34 34         ; $f5d8: 34 34     Invalid Opcode - NOP $34,x
            AND ($59,x)        ; $f5da: 21 59     
            ORA ($3f,x)        ; $f5dc: 01 3f     
            AND ($6d,x)        ; $f5de: 21 6d     
            ORA ($40),y        ; $f5e0: 11 40     
            SEC                ; $f5e2: 38        
            SEC                ; $f5e3: 38        
            AND $3939,y        ; $f5e4: 39 39 39  
            .hex 3a            ; $f5e7: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f5e8: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f5e9: 3a        Invalid Opcode - NOP 
            .hex 3b 3b 3b      ; $f5ea: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
            .hex 43 3c         ; $f5ed: 43 3c     Invalid Opcode - SRE ($3c,x)
            .hex 3c 3d 3d      ; $f5ef: 3c 3d 3d  Invalid Opcode - NOP $3d3d,x
            AND ($84,x)        ; $f5f2: 21 84     
            .hex 1a            ; $f5f4: 1a        Invalid Opcode - NOP 
            AND $3d3d,x        ; $f5f5: 3d 3d 3d  
            ROL $3e3e,x        ; $f5f8: 3e 3e 3e  
            BMI __f62d         ; $f5fb: 30 30     
            BMI __f630         ; $f5fd: 30 31     
            AND ($31),y        ; $f5ff: 31 31     
            .hex 32            ; $f601: 32        Invalid Opcode - KIL 
            .hex 32            ; $f602: 32        Invalid Opcode - KIL 
            .hex 32            ; $f603: 32        Invalid Opcode - KIL 
            .hex 33 33         ; $f604: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 34         ; $f606: 33 34     Invalid Opcode - RLA ($34),y
            EOR #$34           ; $f608: 49 34     
            AND $35,x          ; $f60a: 35 35     
            AND $36,x          ; $f60c: 35 36     
            ROL $21,x          ; $f60e: 36 21     
            LDY $06            ; $f610: a4 06     
            ROL $36,x          ; $f612: 36 36     
            .hex 4b 37         ; $f614: 4b 37     Invalid Opcode - ALR #$37
            .hex 37 37         ; $f616: 37 37     Invalid Opcode - RLA $37,x
            AND ($c6,x)        ; $f618: 21 c6     
__f61a:     ORA ($3f,x)        ; $f61a: 01 3f     
            AND ($e2,x)        ; $f61c: 21 e2     
            .hex 17 30         ; $f61e: 17 30     Invalid Opcode - SLO $30,x
            BMI __f660         ; $f620: 30 3e     
            ROL $3d45,x        ; $f622: 3e 45 3d  
            AND $3c3d,x        ; $f625: 3d 3d 3c  
            .hex 43 3c         ; $f628: 43 3c     Invalid Opcode - SRE ($3c,x)
            .hex 3b 3b 3b      ; $f62a: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
__f62d:     .hex 3a            ; $f62d: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f62e: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f62f: 3a        Invalid Opcode - NOP 
__f630:     AND $3939,y        ; $f630: 39 39 39  
            SEC                ; $f633: 38        
            RTI                ; $f634: 40        

;-------------------------------------------------------------------------------
            SEC                ; $f635: 38        
            AND ($ab,x)        ; $f636: 21 ab     
            .hex c2 3f         ; $f638: c2 3f     Invalid Opcode - NOP #$3f
            .hex 22            ; $f63a: 22        Invalid Opcode - KIL 
            .hex 04 18         ; $f63b: 04 18     Invalid Opcode - NOP $18
            .hex 37 37         ; $f63d: 37 37     Invalid Opcode - RLA $37,x
            .hex 37 36         ; $f63f: 37 36     Invalid Opcode - RLA $36,x
            ROL $36,x          ; $f641: 36 36     
            LSR                ; $f643: 4a        
            AND $35,x          ; $f644: 35 35     
__f646:     .hex 34 34         ; $f646: 34 34     Invalid Opcode - NOP $34,x
            .hex 34 48         ; $f648: 34 48     Invalid Opcode - NOP $48,x
            .hex 33 33         ; $f64a: 33 33     Invalid Opcode - RLA ($33),y
            .hex 32            ; $f64c: 32        Invalid Opcode - KIL 
            .hex 32            ; $f64d: 32        Invalid Opcode - KIL 
            .hex 32            ; $f64e: 32        Invalid Opcode - KIL 
            AND ($31),y        ; $f64f: 31 31     
            AND ($30),y        ; $f651: 31 30     
            BMI __f685         ; $f653: 30 30     
            .hex 22            ; $f655: 22        Invalid Opcode - KIL 
            BMI __f61a         ; $f656: 30 c2     
            .hex 3f 22 39      ; $f658: 3f 22 39  Invalid Opcode - RLA $3922,x
            ORA ($3f,x)        ; $f65b: 01 3f     
            .hex 22            ; $f65d: 22        Invalid Opcode - KIL 
            LSR                ; $f65e: 4a        
            .hex 01            ; $f65f: 01        Suspected data
__f660:     .hex 3f 22 59      ; $f660: 3f 22 59  Invalid Opcode - RLA $5922,x
            ORA $40            ; $f663: 05 40     
            SEC                ; $f665: 38        
            SEC                ; $f666: 38        
            AND $2239,y        ; $f667: 39 39 22  
            .hex 64 1a         ; $f66a: 64 1a     Invalid Opcode - NOP $1a
            AND $3939,y        ; $f66c: 39 39 39  
            .hex 3a            ; $f66f: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f670: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f671: 3a        Invalid Opcode - NOP 
            .hex 42            ; $f672: 42        Invalid Opcode - KIL 
            .hex 3b 3b 3c      ; $f673: 3b 3b 3c  Invalid Opcode - RLA $3c3b,y
            .hex 3c 3c 44      ; $f676: 3c 3c 44  Invalid Opcode - NOP $443c,x
            AND $3e3d,x        ; $f679: 3d 3d 3e  
            ROL $303e,x        ; $f67c: 3e 3e 30  
__f67f:     BMI __f6b1         ; $f67f: 30 30     
            AND ($31),y        ; $f681: 31 31     
            AND ($32),y        ; $f683: 31 32     
__f685:     .hex 32            ; $f685: 32        Invalid Opcode - KIL 
            .hex 22            ; $f686: 22        Invalid Opcode - KIL 
            STY $12            ; $f687: 84 12     
            .hex 32            ; $f689: 32        Invalid Opcode - KIL 
            .hex 32            ; $f68a: 32        Invalid Opcode - KIL 
            .hex 47 33         ; $f68b: 47 33     Invalid Opcode - SRE $33
            .hex 33 33         ; $f68d: 33 33     Invalid Opcode - RLA ($33),y
            .hex 34 34         ; $f68f: 34 34     Invalid Opcode - NOP $34,x
            .hex 34 35         ; $f691: 34 35     Invalid Opcode - NOP $35,x
            LSR                ; $f693: 4a        
            AND $36,x          ; $f694: 35 36     
            ROL $36,x          ; $f696: 36 36     
            .hex 37 37         ; $f698: 37 37     Invalid Opcode - RLA $37,x
            .hex 37 22         ; $f69a: 37 22     Invalid Opcode - RLA $22,x
            LDX $01            ; $f69c: a6 01     
            .hex 3f 22 ae      ; $f69e: 3f 22 ae  Invalid Opcode - RLA $ae22,x
            .hex c2 3f         ; $f6a1: c2 3f     Invalid Opcode - NOP #$3f
            .hex 22            ; $f6a3: 22        Invalid Opcode - KIL 
            .hex c2 0b         ; $f6a4: c2 0b     Invalid Opcode - NOP #$0b
            .hex 3b 3b 3a      ; $f6a6: 3b 3b 3a  Invalid Opcode - RLA $3a3b,y
            .hex 3a            ; $f6a9: 3a        Invalid Opcode - NOP 
            EOR ($39,x)        ; $f6aa: 41 39     
            AND $3839,y        ; $f6ac: 39 39 38  
            SEC                ; $f6af: 38        
            SEC                ; $f6b0: 38        
__f6b1:     .hex 22            ; $f6b1: 22        Invalid Opcode - KIL 
            .hex e2 1a         ; $f6b2: e2 1a     Invalid Opcode - NOP #$1a
            .hex 34 34         ; $f6b4: 34 34     Invalid Opcode - NOP $34,x
            .hex 33 33         ; $f6b6: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 32         ; $f6b8: 33 32     Invalid Opcode - RLA ($32),y
            .hex 32            ; $f6ba: 32        Invalid Opcode - KIL 
            .hex 32            ; $f6bb: 32        Invalid Opcode - KIL 
            AND ($31),y        ; $f6bc: 31 31     
            LSR $30            ; $f6be: 46 30     
            BMI __f6f2         ; $f6c0: 30 30     
            ROL $3e3e,x        ; $f6c2: 3e 3e 3e  
            AND $3d3d,x        ; $f6c5: 3d 3d 3d  
            .hex 3c 3c 3c      ; $f6c8: 3c 3c 3c  Invalid Opcode - NOP $3c3c,x
            .hex 3b 3b 3b      ; $f6cb: 3b 3b 3b  Invalid Opcode - RLA $3b3b,y
            .hex 23 0c         ; $f6ce: 23 0c     Invalid Opcode - RLA ($0c,x)
            BPL __f711         ; $f6d0: 10 3f     
            BIT $24            ; $f6d2: 24 24     
            BIT $37            ; $f6d4: 24 37     
            .hex 37 37         ; $f6d6: 37 37     Invalid Opcode - RLA $37,x
            ROL $36,x          ; $f6d8: 36 36     
            ROL $35,x          ; $f6da: 36 35     
            AND $35,x          ; $f6dc: 35 35     
            EOR #$34           ; $f6de: 49 34     
            .hex 34 23         ; $f6e0: 34 23     Invalid Opcode - NOP $23,x
            AND $3f01,y        ; $f6e2: 39 01 3f  
            .hex 23 4c         ; $f6e5: 23 4c     Invalid Opcode - RLA ($4c,x)
            .hex 13 3f         ; $f6e7: 13 3f     Invalid Opcode - SLO ($3f),y
            BIT $24            ; $f6e9: 24 24     
            BIT $38            ; $f6eb: 24 38     
            SEC                ; $f6ed: 38        
            SEC                ; $f6ee: 38        
            AND $3939,y        ; $f6ef: 39 39 39  
__f6f2:     .hex 3a            ; $f6f2: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f6f3: 3a        Invalid Opcode - NOP 
            .hex 3a            ; $f6f4: 3a        Invalid Opcode - NOP 
            .hex 42            ; $f6f5: 42        Invalid Opcode - KIL 
            .hex 3b 3b 3c      ; $f6f6: 3b 3b 3c  Invalid Opcode - RLA $3c3b,y
            .hex 3c 3c 23      ; $f6f9: 3c 3c 23  Invalid Opcode - NOP $233c,x
            ADC ($4f,x)        ; $f6fc: 61 4f     
            BMI __f723         ; $f6fe: 30 23     
            BVS __f711         ; $f700: 70 0f     
            AND ($31),y        ; $f702: 31 31     
            AND ($32),y        ; $f704: 31 32     
            .hex 32            ; $f706: 32        Invalid Opcode - KIL 
            .hex 32            ; $f707: 32        Invalid Opcode - KIL 
            .hex 33 33         ; $f708: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 34         ; $f70a: 33 34     Invalid Opcode - RLA ($34),y
            .hex 34 34         ; $f70c: 34 34     Invalid Opcode - NOP $34,x
            AND $35,x          ; $f70e: 35 35     
            .hex 35            ; $f710: 35        Suspected data
__f711:     .hex 23 24         ; $f711: 23 24     Invalid Opcode - RLA ($24,x)
            .hex 82 4c         ; $f713: 82 4c     Invalid Opcode - NOP #$4c
            EOR $2523          ; $f715: 4d 23 25  
            .hex 82 4e         ; $f718: 82 4e     Invalid Opcode - NOP #$4e
            .hex 4f 00 3f      ; $f71a: 4f 00 3f  Invalid Opcode - SRE $3f00
            BRK                ; $f71d: 00        
            PHP                ; $f71e: 08        
            .hex 0f 2c 27      ; $f71f: 0f 2c 27  Invalid Opcode - SLO $272c
            .hex 02            ; $f722: 02        Invalid Opcode - KIL 
__f723:     .hex 0f 30 12      ; $f723: 0f 30 12  Invalid Opcode - SLO $1230
            BIT $3f            ; $f726: 24 3f     
            ORA $0603,x        ; $f728: 1d 03 06  
            BMI __f73f         ; $f72b: 30 12     
            .hex 23 c0         ; $f72d: 23 c0     Invalid Opcode - RLA ($c0,x)
            PHA                ; $f72f: 48        
            .hex ff 23 c9      ; $f730: ff 23 c9  Invalid Opcode - ISC __c923,x
            .hex 07 55         ; $f733: 07 55     Invalid Opcode - SLO $55
            BRK                ; $f735: 00        
            TAX                ; $f736: aa        
            TAX                ; $f737: aa        
            .hex 0f 0f 0f      ; $f738: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            .hex 23 e2         ; $f73b: 23 e2     Invalid Opcode - RLA ($e2,x)
            ORA $04            ; $f73d: 05 04     
__f73f:     BRK                ; $f73f: 00        
            BRK                ; $f740: 00        
            BRK                ; $f741: 00        
            ORA ($20,x)        ; $f742: 01 20     
            CMP $02            ; $f744: c5 02     
            BVS __f7ba         ; $f746: 70 72     
            JSR $02e5          ; $f748: 20 e5 02  
            ADC ($73),y        ; $f74b: 71 73     
            JSR $42ca          ; $f74d: 20 ca 42  
            .hex 62            ; $f750: 62        Invalid Opcode - KIL 
            AND ($05,x)        ; $f751: 21 05     
            LSR $62,x          ; $f753: 56 62     
            AND ($a4,x)        ; $f755: 21 a4     
            CLI                ; $f757: 58        
            .hex 62            ; $f758: 62        Invalid Opcode - KIL 
            .hex 22            ; $f759: 22        Invalid Opcode - KIL 
            .hex 43 5a         ; $f75a: 43 5a     Invalid Opcode - SRE ($5a,x)
            .hex 62            ; $f75c: 62        Invalid Opcode - KIL 
            .hex 22            ; $f75d: 22        Invalid Opcode - KIL 
            .hex e2 5c         ; $f75e: e2 5c     Invalid Opcode - NOP #$5c
            .hex 62            ; $f760: 62        Invalid Opcode - KIL 
            .hex 23 61         ; $f761: 23 61     Invalid Opcode - RLA ($61,x)
            LSR $2162,x        ; $f763: 5e 62 21  
            PHP                ; $f766: 08        
            ORA ($63,x)        ; $f767: 01 63     
            AND ($17,x)        ; $f769: 21 17     
            ORA ($63,x)        ; $f76b: 01 63     
            AND ($a8,x)        ; $f76d: 21 a8     
            ORA ($63,x)        ; $f76f: 01 63     
            AND ($b7,x)        ; $f771: 21 b7     
            ORA ($63,x)        ; $f773: 01 63     
            .hex 22            ; $f775: 22        Invalid Opcode - KIL 
            PHA                ; $f776: 48        
            ORA ($63,x)        ; $f777: 01 63     
            .hex 22            ; $f779: 22        Invalid Opcode - KIL 
            .hex 57 01         ; $f77a: 57 01     Invalid Opcode - SRE $01,x
            .hex 63 22         ; $f77c: 63 22     Invalid Opcode - RRA ($22,x)
            INX                ; $f77e: e8        
            ORA ($63,x)        ; $f77f: 01 63     
            .hex 22            ; $f781: 22        Invalid Opcode - KIL 
            .hex f7 01         ; $f782: f7 01     Invalid Opcode - ISC $01,x
            .hex 63 21         ; $f784: 63 21     Invalid Opcode - RRA ($21,x)
            AND $c4            ; $f786: 25 c4     
            .hex 3f 21 29      ; $f788: 3f 21 29  Invalid Opcode - RLA $2921,x
            CPY $3f            ; $f78b: c4 3f     
            AND ($36,x)        ; $f78d: 21 36     
            CPY $3f            ; $f78f: c4 3f     
            AND ($3a,x)        ; $f791: 21 3a     
            CPY $3f            ; $f793: c4 3f     
            AND ($c4,x)        ; $f795: 21 c4     
            CPY $3f            ; $f797: c4 3f     
            AND ($d0,x)        ; $f799: 21 d0     
            CPY $3f            ; $f79b: c4 3f     
            AND ($db,x)        ; $f79d: 21 db     
            CPY $3f            ; $f79f: c4 3f     
            .hex 22            ; $f7a1: 22        Invalid Opcode - KIL 
            .hex 63 c4         ; $f7a2: 63 c4     Invalid Opcode - RRA ($c4,x)
            .hex 3f 22 6c      ; $f7a4: 3f 22 6c  Invalid Opcode - RLA $6c22,x
            CPY $3f            ; $f7a7: c4 3f     
            .hex 22            ; $f7a9: 22        Invalid Opcode - KIL 
            .hex 73 c4         ; $f7aa: 73 c4     Invalid Opcode - RRA ($c4),y
            .hex 3f 22 7c      ; $f7ac: 3f 22 7c  Invalid Opcode - RLA $7c22,x
            CPY $3f            ; $f7af: c4 3f     
            .hex 23 02         ; $f7b1: 23 02     Invalid Opcode - RLA ($02,x)
            .hex c3 3f         ; $f7b3: c3 3f     Invalid Opcode - DCP ($3f,x)
            .hex 23 0f         ; $f7b5: 23 0f     Invalid Opcode - RLA ($0f,x)
            .hex c3 3f         ; $f7b7: c3 3f     Invalid Opcode - DCP ($3f,x)
            .hex 23            ; $f7b9: 23        Suspected data
__f7ba:     ORA $3fc3,x        ; $f7ba: 1d c3 3f  
            .hex 22            ; $f7bd: 22        Invalid Opcode - KIL 
            ASL                ; $f7be: 0a        
            .hex 82 6e         ; $f7bf: 82 6e     Invalid Opcode - NOP #$6e
            .hex 6f 22 18      ; $f7c1: 6f 22 18  Invalid Opcode - RRA $1822
            .hex 82 70         ; $f7c4: 82 70     Invalid Opcode - NOP #$70
            ADC ($22),y        ; $f7c6: 71 22     
            ORA $7282,y        ; $f7c8: 19 82 72  
            .hex 73 00         ; $f7cb: 73 00     Invalid Opcode - RRA ($00),y
            .hex 3f 00 08      ; $f7cd: 3f 00 08  Invalid Opcode - RLA $0800,x
            .hex 0f 15 2c      ; $f7d0: 0f 15 2c  Invalid Opcode - SLO $2c15
            ASL $0f            ; $f7d3: 06 0f     
            BMI __f7fe         ; $f7d5: 30 27     
            ASL $3f,x          ; $f7d7: 16 3f     
            ORA $1203,x        ; $f7d9: 1d 03 12  
            .hex 37 15         ; $f7dc: 37 15     Invalid Opcode - RLA $15,x
            .hex 23 c0         ; $f7de: 23 c0     Invalid Opcode - RLA ($c0,x)
            PHA                ; $f7e0: 48        
            .hex ff 23 c9      ; $f7e1: ff 23 c9  Invalid Opcode - ISC __c923,x
            .hex 02            ; $f7e4: 02        Invalid Opcode - KIL 
            TAX                ; $f7e5: aa        
            .hex 22            ; $f7e6: 22        Invalid Opcode - KIL 
            .hex 23 cd         ; $f7e7: 23 cd     Invalid Opcode - RLA ($cd,x)
            .hex 43 0f         ; $f7e9: 43 0f     Invalid Opcode - SRE ($0f,x)
            .hex 23 d1         ; $f7eb: 23 d1     Invalid Opcode - RLA ($d1,x)
            .hex 82 84         ; $f7ed: 82 84     Invalid Opcode - NOP #$84
            PHA                ; $f7ef: 48        
            .hex 23 d7         ; $f7f0: 23 d7     Invalid Opcode - RLA ($d7,x)
            ORA $03            ; $f7f2: 05 03     
            .hex 0c 88 00      ; $f7f4: 0c 88 00  Bad Addr Mode - NOP $0088
            DEY                ; $f7f7: 88        
            .hex 23 e1         ; $f7f8: 23 e1     Invalid Opcode - RLA ($e1,x)
            .hex 03 88         ; $f7fa: 03 88     Invalid Opcode - SLO ($88,x)
            BRK                ; $f7fc: 00        
            DEY                ; $f7fd: 88        
__f7fe:     .hex 23 e9         ; $f7fe: 23 e9     Invalid Opcode - RLA ($e9,x)
            .hex 03 88         ; $f800: 03 88     Invalid Opcode - SLO ($88,x)
            BRK                ; $f802: 00        
            DEY                ; $f803: 88        
            .hex 23 d3         ; $f804: 23 d3     Invalid Opcode - RLA ($d3,x)
            .hex 82 84         ; $f806: 82 84     Invalid Opcode - NOP #$84
            PHA                ; $f808: 48        
            JSR __c72c         ; $f809: 20 2c c7  
            .hex 3f 20 2a      ; $f80c: 3f 20 2a  Invalid Opcode - RLA $2a20,x
            .hex c7 3f         ; $f80f: c7 3f     Invalid Opcode - DCP $3f
            JSR $43ca          ; $f811: 20 ca 43  
            BMI __f836         ; $f814: 30 20     
            LDA $3046          ; $f816: ad 46 30  
            JSR __c2d2         ; $f819: 20 d2 c2  
            .hex 3f 21 02      ; $f81c: 3f 21 02  Invalid Opcode - RLA $0221,x
            EOR $30,x          ; $f81f: 55 30     
            AND ($06,x)        ; $f821: 21 06     
            .hex 02            ; $f823: 02        Invalid Opcode - KIL 
            LSR $215f,x        ; $f824: 5e 5f 21  
            ROL $02            ; $f827: 26 02     
            .hex 5c 5d 21      ; $f829: 5c 5d 21  Invalid Opcode - NOP $215d,x
            ASL $5e02          ; $f82c: 0e 02 5e  
            .hex 5f 21 2e      ; $f82f: 5f 21 2e  Invalid Opcode - SRE $2e21,x
            .hex 02            ; $f832: 02        Invalid Opcode - KIL 
            .hex 5c 5d 23      ; $f833: 5c 5d 23  Invalid Opcode - NOP $235d,x
__f836:     ADC ($5e,x)        ; $f836: 61 5e     
            BMI __f85d         ; $f838: 30 23     
            LSR $02            ; $f83a: 46 02     
            .hex 5c 5d 23      ; $f83c: 5c 5d 23  Invalid Opcode - NOP $235d,x
            ROR $02            ; $f83f: 66 02     
            RTS                ; $f841: 60        

;-------------------------------------------------------------------------------
            ADC ($23,x)        ; $f842: 61 23     
            LSR $5c02          ; $f844: 4e 02 5c  
            EOR $6e23,x        ; $f847: 5d 23 6e  
            .hex 02            ; $f84a: 02        Invalid Opcode - KIL 
            RTS                ; $f84b: 60        

;-------------------------------------------------------------------------------
            ADC ($21,x)        ; $f84c: 61 21     
            LSR $d0            ; $f84e: 46 d0     
            .hex 74 21         ; $f850: 74 21     Invalid Opcode - NOP $21,x
            .hex 47 d0         ; $f852: 47 d0     Invalid Opcode - SRE $d0
            ADC $21,x          ; $f854: 75 21     
            .hex 5c 42 30      ; $f856: 5c 42 30  Invalid Opcode - NOP $3042,x
            AND ($79,x)        ; $f859: 21 79     
            .hex 42            ; $f85b: 42        Invalid Opcode - KIL 
            .hex 30            ; $f85c: 30        Suspected data
__f85d:     AND ($96,x)        ; $f85d: 21 96     
            .hex 42            ; $f85f: 42        Invalid Opcode - KIL 
            BMI __f883         ; $f860: 30 21     
            .hex b2            ; $f862: b2        Invalid Opcode - KIL 
            .hex 43 30         ; $f863: 43 30     Invalid Opcode - SRE ($30,x)
            AND ($c2,x)        ; $f865: 21 c2     
            .hex 43 30         ; $f867: 43 30     Invalid Opcode - SRE ($30,x)
            AND ($c9,x)        ; $f869: 21 c9     
            .hex 44 30         ; $f86b: 44 30     Invalid Opcode - NOP $30
            AND ($f9,x)        ; $f86d: 21 f9     
            EOR $30            ; $f86f: 45 30     
            .hex 22            ; $f871: 22        Invalid Opcode - KIL 
            .hex 33 42         ; $f872: 33 42     Invalid Opcode - RLA ($42),y
            BMI __f898         ; $f874: 30 22     
            LSR $42,x          ; $f876: 56 42     
            BMI __f89c         ; $f878: 30 22     
            ADC $3042,y        ; $f87a: 79 42 30  
            .hex 22            ; $f87d: 22        Invalid Opcode - KIL 
            .hex 9c 42 30      ; $f87e: 9c 42 30  Invalid Opcode - SHY $3042,x
            .hex 22            ; $f881: 22        Invalid Opcode - KIL 
            .hex 82            ; $f882: 82        Suspected data
__f883:     .hex 43 30         ; $f883: 43 30     Invalid Opcode - SRE ($30,x)
            .hex 22            ; $f885: 22        Invalid Opcode - KIL 
            DEX                ; $f886: ca        
            .hex 43 30         ; $f887: 43 30     Invalid Opcode - SRE ($30,x)
            .hex 22            ; $f889: 22        Invalid Opcode - KIL 
            .hex db 43 30      ; $f88a: db 43 30  Invalid Opcode - DCP $3043,y
            .hex 22            ; $f88d: 22        Invalid Opcode - KIL 
            SED                ; $f88e: f8        
            .hex 42            ; $f88f: 42        Invalid Opcode - KIL 
            BMI __f8b5         ; $f890: 30 23     
            ORA $42,x          ; $f892: 15 42     
            BMI __f8b9         ; $f894: 30 23     
            .hex 22            ; $f896: 22        Invalid Opcode - KIL 
            .hex 43            ; $f897: 43        Suspected data
__f898:     BMI __f8bd         ; $f898: 30 23     
            AND ($43),y        ; $f89a: 31 43     
__f89c:     BMI __f8bf         ; $f89c: 30 21     
            ROL $c3,x          ; $f89e: 36 c3     
            .hex 3f 21 7c      ; $f8a0: 3f 21 7c  Invalid Opcode - RLA $7c21,x
            .hex c4            ; $f8a3: c4        Suspected data
__f8a4:     .hex 3f 21 d3      ; $f8a4: 3f 21 d3  Invalid Opcode - RLA __d321,x
            .hex c3 3f         ; $f8a7: c3 3f     Invalid Opcode - DCP ($3f,x)
            AND ($e4,x)        ; $f8a9: 21 e4     
            CMP $3f            ; $f8ab: c5 3f     
            AND ($ea,x)        ; $f8ad: 21 ea     
            .hex c7 3f         ; $f8af: c7 3f     Invalid Opcode - DCP $3f
            AND ($ec,x)        ; $f8b1: 21 ec     
            .hex c7 3f         ; $f8b3: c7 3f     Invalid Opcode - DCP $3f
__f8b5:     .hex 22            ; $f8b5: 22        Invalid Opcode - KIL 
            ORA $3fc3,y        ; $f8b6: 19 c3 3f  
__f8b9:     .hex 22            ; $f8b9: 22        Invalid Opcode - KIL 
            .hex a3 c4         ; $f8ba: a3 c4     Invalid Opcode - LAX ($c4,x)
            .hex 3f            ; $f8bc: 3f        Suspected data
__f8bd:     .hex 22            ; $f8bd: 22        Invalid Opcode - KIL 
            .hex bc            ; $f8be: bc        Suspected data
__f8bf:     ORA ($3f,x)        ; $f8bf: 01 3f     
            AND ($82,x)        ; $f8c1: 21 82     
            .hex 82 70         ; $f8c3: 82 70     Invalid Opcode - NOP #$70
            ADC ($21),y        ; $f8c5: 71 21     
            .hex 83 82         ; $f8c7: 83 82     Invalid Opcode - SAX ($82,x)
            .hex 72            ; $f8c9: 72        Invalid Opcode - KIL 
            .hex 73 21         ; $f8ca: 73 21     Invalid Opcode - RRA ($21),y
            ORA $6e82,x        ; $f8cc: 1d 82 6e  
            .hex 6f 21 4e      ; $f8cf: 6f 21 4e  Invalid Opcode - RRA $4e21
            BNE __f948         ; $f8d2: d0 74     
            AND ($4f,x)        ; $f8d4: 21 4f     
            BNE __f94d         ; $f8d6: d0 75     
            BRK                ; $f8d8: 00        
            .hex 3f 00 0d      ; $f8d9: 3f 00 0d  Invalid Opcode - RLA $0d00,x
            .hex 0f 2c 38      ; $f8dc: 0f 2c 38  Invalid Opcode - SLO $382c
            .hex 12            ; $f8df: 12        Invalid Opcode - KIL 
            .hex 0f 27 27      ; $f8e0: 0f 27 27  Invalid Opcode - SLO $2727
            .hex 27 0f         ; $f8e3: 27 0f     Invalid Opcode - RLA $0f
            BMI __f917         ; $f8e5: 30 30     
            BMI __f8f8         ; $f8e7: 30 0f     
            .hex 3f 11 01      ; $f8e9: 3f 11 01  Invalid Opcode - RLA $0111,x
            AND $23            ; $f8ec: 25 23     
            CPX #$50           ; $f8ee: e0 50     
            EOR $23,x          ; $f8f0: 55 23     
            BEQ __f93c         ; $f8f2: f0 48     
            TAX                ; $f8f4: aa        
            JSR __c583         ; $f8f5: 20 83 c5  
__f8f8:     .hex 62            ; $f8f8: 62        Invalid Opcode - KIL 
            JSR __c584         ; $f8f9: 20 84 c5  
            .hex 62            ; $f8fc: 62        Invalid Opcode - KIL 
            JSR $0185          ; $f8fd: 20 85 01  
            .hex 62            ; $f900: 62        Invalid Opcode - KIL 
__f901:     AND ($05,x)        ; $f901: 21 05     
            ORA ($62,x)        ; $f903: 01 62     
            JSR __c3a6         ; $f905: 20 a6 c3  
            .hex 62            ; $f908: 62        Invalid Opcode - KIL 
            JSR __c588         ; $f909: 20 88 c5  
            .hex 62            ; $f90c: 62        Invalid Opcode - KIL 
            JSR $0189          ; $f90d: 20 89 01  
            .hex 62            ; $f910: 62        Invalid Opcode - KIL 
            AND ($09,x)        ; $f911: 21 09     
            ORA ($62,x)        ; $f913: 01 62     
            .hex 20 8a         ; $f915: 20 8a     Suspected data
__f917:     CMP $62            ; $f917: c5 62     
            JSR __c58c         ; $f919: 20 8c c5  
            .hex 62            ; $f91c: 62        Invalid Opcode - KIL 
            JSR __c2ad         ; $f91d: 20 ad c2  
            .hex 62            ; $f920: 62        Invalid Opcode - KIL 
            JSR __c2ce         ; $f921: 20 ce c2  
            .hex 62            ; $f924: 62        Invalid Opcode - KIL 
            JSR __c58f         ; $f925: 20 8f c5  
            .hex 62            ; $f928: 62        Invalid Opcode - KIL 
            JSR __c591         ; $f929: 20 91 c5  
            .hex 62            ; $f92c: 62        Invalid Opcode - KIL 
            JSR __c2b2         ; $f92d: 20 b2 c2  
            .hex 62            ; $f930: 62        Invalid Opcode - KIL 
            JSR $01b3          ; $f931: 20 b3 01  
            .hex 62            ; $f934: 62        Invalid Opcode - KIL 
            JSR $0194          ; $f935: 20 94 01  
            .hex 62            ; $f938: 62        Invalid Opcode - KIL 
            JSR $01f3          ; $f939: 20 f3 01  
__f93c:     .hex 62            ; $f93c: 62        Invalid Opcode - KIL 
            AND ($14,x)        ; $f93d: 21 14     
            ORA ($62,x)        ; $f93f: 01 62     
            JSR __c596         ; $f941: 20 96 c5  
            .hex 62            ; $f944: 62        Invalid Opcode - KIL 
            JSR $4297          ; $f945: 20 97 42  
__f948:     .hex 62            ; $f948: 62        Invalid Opcode - KIL 
            JSR $42d7          ; $f949: 20 d7 42  
            .hex 62            ; $f94c: 62        Invalid Opcode - KIL 
__f94d:     AND ($17,x)        ; $f94d: 21 17     
            .hex 42            ; $f94f: 42        Invalid Opcode - KIL 
            .hex 62            ; $f950: 62        Invalid Opcode - KIL 
            JSR __c39a         ; $f951: 20 9a c3  
            .hex 62            ; $f954: 62        Invalid Opcode - KIL 
            JSR __c3db         ; $f955: 20 db c3  
            .hex 62            ; $f958: 62        Invalid Opcode - KIL 
            JSR __c39c         ; $f959: 20 9c c3  
            .hex 62            ; $f95c: 62        Invalid Opcode - KIL 
            AND ($47,x)        ; $f95d: 21 47     
            CMP $62            ; $f95f: c5 62     
            AND ($68,x)        ; $f961: 21 68     
            .hex c2 62         ; $f963: c2 62     Invalid Opcode - NOP #$62
            AND ($69,x)        ; $f965: 21 69     
            ORA ($62,x)        ; $f967: 01 62     
            AND ($4a,x)        ; $f969: 21 4a     
            ORA ($62,x)        ; $f96b: 01 62     
            AND ($a9,x)        ; $f96d: 21 a9     
            ORA ($62,x)        ; $f96f: 01 62     
            AND ($ca,x)        ; $f971: 21 ca     
            ORA ($62,x)        ; $f973: 01 62     
            AND ($4c,x)        ; $f975: 21 4c     
            CMP $62            ; $f977: c5 62     
            AND ($4d,x)        ; $f979: 21 4d     
            ORA ($62,x)        ; $f97b: 01 62     
            AND ($cd,x)        ; $f97d: 21 cd     
            ORA ($62,x)        ; $f97f: 01 62     
            AND ($4e,x)        ; $f981: 21 4e     
            CMP $62            ; $f983: c5 62     
            AND ($50,x)        ; $f985: 21 50     
            CMP $62            ; $f987: c5 62     
            AND ($71,x)        ; $f989: 21 71     
            .hex c2 62         ; $f98b: c2 62     Invalid Opcode - NOP #$62
            AND ($92,x)        ; $f98d: 21 92     
            .hex c2 62         ; $f98f: c2 62     Invalid Opcode - NOP #$62
            AND ($53,x)        ; $f991: 21 53     
            CMP $62            ; $f993: c5 62     
            AND ($55,x)        ; $f995: 21 55     
            CMP $62            ; $f997: c5 62     
            AND ($56,x)        ; $f999: 21 56     
            .hex 43 62         ; $f99b: 43 62     Invalid Opcode - SRE ($62,x)
            AND ($d6,x)        ; $f99d: 21 d6     
            .hex 43 62         ; $f99f: 43 62     Invalid Opcode - SRE ($62,x)
            AND ($98,x)        ; $f9a1: 21 98     
            .hex c2 62         ; $f9a3: c2 62     Invalid Opcode - NOP #$62
            AND ($97,x)        ; $f9a5: 21 97     
            ORA ($62,x)        ; $f9a7: 01 62     
            .hex 22            ; $f9a9: 22        Invalid Opcode - KIL 
            ORA #$0f           ; $f9aa: 09 0f     
            ORA ($24,x)        ; $f9ac: 01 24     
            ORA $0a15,y        ; $f9ae: 19 15 0a  
            .hex 22            ; $f9b1: 22        Invalid Opcode - KIL 
            ASL $241b          ; $f9b2: 0e 1b 24  
            BPL __f9c1         ; $f9b5: 10 0a     
            ASL $0e,x          ; $f9b7: 16 0e     
            BIT $0a            ; $f9b9: 24 0a     
            .hex 22            ; $f9bb: 22        Invalid Opcode - KIL 
            EOR #$0f           ; $f9bc: 49 0f     
            ORA ($24,x)        ; $f9be: 01 24     
            .hex 19            ; $f9c0: 19        Suspected data
__f9c1:     ORA $0a,x          ; $f9c1: 15 0a     
            .hex 22            ; $f9c3: 22        Invalid Opcode - KIL 
            ASL $241b          ; $f9c4: 0e 1b 24  
            BPL __f9d3         ; $f9c7: 10 0a     
            ASL $0e,x          ; $f9c9: 16 0e     
            BIT $0b            ; $f9cb: 24 0b     
            .hex 22            ; $f9cd: 22        Invalid Opcode - KIL 
            .hex 89 0f         ; $f9ce: 89 0f     Invalid Opcode - NOP #$0f
            .hex 02            ; $f9d0: 02        Invalid Opcode - KIL 
            BIT $19            ; $f9d1: 24 19     
__f9d3:     ORA $0a,x          ; $f9d3: 15 0a     
            .hex 22            ; $f9d5: 22        Invalid Opcode - KIL 
            ASL $241b          ; $f9d6: 0e 1b 24  
            BPL __f9e5         ; $f9d9: 10 0a     
            ASL $0e,x          ; $f9db: 16 0e     
            BIT $0a            ; $f9dd: 24 0a     
            .hex 22            ; $f9df: 22        Invalid Opcode - KIL 
            CMP #$0f           ; $f9e0: c9 0f     
            .hex 02            ; $f9e2: 02        Invalid Opcode - KIL 
            BIT $19            ; $f9e3: 24 19     
__f9e5:     ORA $0a,x          ; $f9e5: 15 0a     
            .hex 22            ; $f9e7: 22        Invalid Opcode - KIL 
            ASL $241b          ; $f9e8: 0e 1b 24  
            BPL __f9f7         ; $f9eb: 10 0a     
            ASL $0e,x          ; $f9ed: 16 0e     
            BIT $0b            ; $f9ef: 24 0b     
            .hex 23 05         ; $f9f1: 23 05     Invalid Opcode - RLA ($05,x)
            ASL $d3,x          ; $f9f3: 16 d3     
            ORA ($09,x)        ; $f9f5: 01 09     
__f9f7:     PHP                ; $f9f7: 08        
            ORA ($24,x)        ; $f9f8: 01 24     
            .hex 17 12         ; $f9fa: 17 12     Invalid Opcode - SLO $12,x
            .hex 17 1d         ; $f9fc: 17 1d     Invalid Opcode - SLO $1d,x
            ASL $0d17          ; $f9fe: 0e 17 0d  
            CLC                ; $fa01: 18        
            BIT $0c            ; $fa02: 24 0c     
            CLC                ; $fa04: 18        
            ADC $15            ; $fa05: 65 15     
            ORA $640d,x        ; $fa07: 1d 0d 64  
            .hex 23 4b         ; $fa0a: 23 4b     Invalid Opcode - RLA ($4b,x)
            ORA $0a16          ; $fa0c: 0d 16 0a  
            ORA $240e          ; $fa0f: 0d 0e 24  
            .hex 12            ; $fa12: 12        Invalid Opcode - KIL 
            .hex 17 24         ; $fa13: 17 24     Invalid Opcode - SLO $24,x
            .hex 13 0a         ; $fa15: 13 0a     Invalid Opcode - SLO ($0a),y
            ORA $170a,y        ; $fa17: 19 0a 17  
            BRK                ; $fa1a: 00        
            JSR $0163          ; $fa1b: 20 63 01  
            .hex ff 20 6d      ; $fa1e: ff 20 6d  Invalid Opcode - ISC $6d20,x
            .hex 03 d0         ; $fa21: 03 d0     Invalid Opcode - SLO ($d0,x)
            CMP ($d2),y        ; $fa23: d1 d2     
            JSR $0276          ; $fa25: 20 76 02  
            INC $20ff,x        ; $fa28: fe ff 20  
            STY $0a,x          ; $fa2b: 94 0a     
            AND $16            ; $fa2d: 25 16     
            ROL                ; $fa2f: 2a        
            ROL $27            ; $fa30: 26 27     
            PLP                ; $fa32: 28        
            AND #$2a           ; $fa33: 29 2a     
            ORA $2d,x          ; $fa35: 15 2d     
            JSR $0ab4          ; $fa37: 20 b4 0a  
            .hex 2b 24         ; $fa3a: 2b 24     Invalid Opcode - ANC #$24
            BIT $2424          ; $fa3c: 2c 24 24  
            BIT $24            ; $fa3f: 24 24     
            BIT $2f24          ; $fa41: 2c 24 2f  
            BRK                ; $fa44: 00        
            .hex ff ff ff      ; $fa45: ff ff ff  Invalid Opcode - ISC $ffff,x
__fa48:     LDA #$c0           ; $fa48: a9 c0     
            STA $4017          ; $fa4a: 8d 17 40  
            JSR __fbf2         ; $fa4d: 20 f2 fb  
            LDX #$00           ; $fa50: a2 00     
            STX $ff            ; $fa52: 86 ff     
            STX $fe            ; $fa54: 86 fe     
            STX $fd            ; $fa56: 86 fd     
            LDA $06f0          ; $fa58: ad f0 06  
            CMP #$90           ; $fa5b: c9 90     
            BCS __fa64         ; $fa5d: b0 05     
            LDX #$00           ; $fa5f: a2 00     
            STX $06f1          ; $fa61: 8e f1 06  
__fa64:     CMP #$d8           ; $fa64: c9 d8     
            BCC __fa6b         ; $fa66: 90 03     
            INC $06f1          ; $fa68: ee f1 06  
__fa6b:     TAY                ; $fa6b: a8        
            LSR                ; $fa6c: 4a        
            LSR                ; $fa6d: 4a        
            LSR                ; $fa6e: 4a        
            LSR                ; $fa6f: 4a        
            LSR                ; $fa70: 4a        
            LSR                ; $fa71: 4a        
            STA $00            ; $fa72: 85 00     
            TYA                ; $fa74: 98        
            LDX $06f1          ; $fa75: ae f1 06  
            BNE __fa7f         ; $fa78: d0 05     
            SEC                ; $fa7a: 38        
            ADC $00            ; $fa7b: 65 00     
            BNE __fa82         ; $fa7d: d0 03     
__fa7f:     CLC                ; $fa7f: 18        
            SBC $00            ; $fa80: e5 00     
__fa82:     STA $06f0          ; $fa82: 8d f0 06  
            RTS                ; $fa85: 60        

;-------------------------------------------------------------------------------
__fa86:     LDY #$07           ; $fa86: a0 07     
__fa88:     ASL                ; $fa88: 0a        
            BCS __fa8e         ; $fa89: b0 03     
            DEY                ; $fa8b: 88        
            BNE __fa88         ; $fa8c: d0 fa     
__fa8e:     RTS                ; $fa8e: 60        

;-------------------------------------------------------------------------------
__fa8f:     STA $f1            ; $fa8f: 85 f1     
            STY $f2            ; $fa91: 84 f2     
__fa93:     LDY #$7f           ; $fa93: a0 7f     
__fa95:     STX $4000          ; $fa95: 8e 00 40  
            STY $4001          ; $fa98: 8c 01 40  
            RTS                ; $fa9b: 60        

;-------------------------------------------------------------------------------
            JSR __fa95         ; $fa9c: 20 95 fa  
__fa9f:     LDX #$00           ; $fa9f: a2 00     
__faa1:     TAY                ; $faa1: a8        
            LDA __fb01,y       ; $faa2: b9 01 fb  
            BEQ __fab2         ; $faa5: f0 0b     
            STA $4002,x        ; $faa7: 9d 02 40  
            LDA __fb00,y       ; $faaa: b9 00 fb  
            ORA #$08           ; $faad: 09 08     
            STA $4003,x        ; $faaf: 9d 03 40  
__fab2:     RTS                ; $fab2: 60        

;-------------------------------------------------------------------------------
__fab3:     STY $4005          ; $fab3: 8c 05 40  
            LDX #$04           ; $fab6: a2 04     
            BNE __faa1         ; $fab8: d0 e7     
__faba:     STA $4008          ; $faba: 8d 08 40  
            TXA                ; $fabd: 8a        
            AND #$3e           ; $fabe: 29 3e     
            LDX #$08           ; $fac0: a2 08     
            BNE __faa1         ; $fac2: d0 dd     
__fac4:     TAX                ; $fac4: aa        
            ROR                ; $fac5: 6a        
            TXA                ; $fac6: 8a        
            ROL                ; $fac7: 2a        
            ROL                ; $fac8: 2a        
            ROL                ; $fac9: 2a        
__faca:     AND #$07           ; $faca: 29 07     
            CLC                ; $facc: 18        
            ADC $068d          ; $facd: 6d 8d 06  
            TAY                ; $fad0: a8        
            LDA __fb4c,y       ; $fad1: b9 4c fb  
            RTS                ; $fad4: 60        

;-------------------------------------------------------------------------------
__fad5:     TYA                ; $fad5: 98        
            LSR                ; $fad6: 4a        
__fad7:     LSR                ; $fad7: 4a        
            LSR                ; $fad8: 4a        
            STA $00            ; $fad9: 85 00     
            TYA                ; $fadb: 98        
            SEC                ; $fadc: 38        
            SBC $00            ; $fadd: e5 00     
            RTS                ; $fadf: 60        

;-------------------------------------------------------------------------------
__fae0:     LDA #$90           ; $fae0: a9 90     
            STA $4000          ; $fae2: 8d 00 40  
__fae5:     RTS                ; $fae5: 60        

;-------------------------------------------------------------------------------
            STA $8c8d          ; $fae6: 8d 8d 8c  
            STY $8c8b          ; $fae9: 8c 8b 8c  
            .hex 83 83         ; $faec: 83 83     Invalid Opcode - SAX ($83,x)
            .hex 8f 8f 8f      ; $faee: 8f 8f 8f  Invalid Opcode - SAX $8f8f
            .hex 8f 8d 85      ; $faf1: 8f 8d 85  Invalid Opcode - SAX $858d
            .hex 84            ; $faf4: 84        Suspected data
__faf5:     STA $7f            ; $faf5: 85 7f     
            STA $85            ; $faf7: 85 85     
            STA $7f            ; $faf9: 85 7f     
            STA $8d8d          ; $fafb: 8d 8d 8d  
            .hex 8d 8d         ; $fafe: 8d 8d     Suspected data
__fb00:     .hex 07            ; $fb00: 07        Suspected data
__fb01:     BEQ __fb03         ; $fb01: f0 00     
__fb03:     BRK                ; $fb03: 00        
            BRK                ; $fb04: 00        
            ADC #$00           ; $fb05: 69 00     
            .hex 53 00         ; $fb07: 53 00     Invalid Opcode - SRE ($00),y
            LSR $00            ; $fb09: 46 00     
            .hex d4 00         ; $fb0b: d4 00     Invalid Opcode - NOP $00,x
            .hex bd 00         ; $fb0d: bd 00     Suspected data
__fb0f:     TAY                ; $fb0f: a8        
            BRK                ; $fb10: 00        
            .hex 9f 00 8d      ; $fb11: 9f 00 8d  Invalid Opcode - AHX $8d00,y
            BRK                ; $fb14: 00        
            ROR $ab01,x        ; $fb15: 7e 01 ab  
            ORA ($7c,x)        ; $fb18: 01 7c     
            ORA ($52,x)        ; $fb1a: 01 52     
            ORA ($3f,x)        ; $fb1c: 01 3f     
            ORA ($1c,x)        ; $fb1e: 01 1c     
            BRK                ; $fb20: 00        
            SBC __ee00,x       ; $fb21: fd 00 ee  
            BRK                ; $fb24: 00        
            SBC ($03,x)        ; $fb25: e1 03     
            .hex 57 02         ; $fb27: 57 02     Invalid Opcode - SRE $02,x
            SBC __cf02,y       ; $fb29: f9 02 cf  
            .hex 02            ; $fb2c: 02        Invalid Opcode - KIL 
            LDX $02            ; $fb2d: a6 02     
            .hex 80 02         ; $fb2f: 80 02     Invalid Opcode - NOP #$02
            .hex 3a            ; $fb31: 3a        Invalid Opcode - NOP 
            .hex 02            ; $fb32: 02        Invalid Opcode - KIL 
            .hex 1a            ; $fb33: 1a        Invalid Opcode - NOP 
            ORA ($fc,x)        ; $fb34: 01 fc     
            ORA ($df,x)        ; $fb36: 01 df     
            ORA ($c4,x)        ; $fb38: 01 c4     
            ASL $ae            ; $fb3a: 06 ae     
            ORA $9e            ; $fb3c: 05 9e     
            ORA $4d            ; $fb3e: 05 4d     
            ORA $01            ; $fb40: 05 01     
            .hex 04 75         ; $fb42: 04 75     Invalid Opcode - NOP $75
            .hex 04 35         ; $fb44: 04 35     Invalid Opcode - NOP $35
            .hex 03 f8         ; $fb46: 03 f8     Invalid Opcode - SLO ($f8,x)
            .hex 03 bf         ; $fb48: 03 bf     Invalid Opcode - SLO ($bf,x)
            .hex 03 89         ; $fb4a: 03 89     Invalid Opcode - SLO ($89,x)
__fb4c:     ORA $0a            ; $fb4c: 05 0a     
            .hex 14 28         ; $fb4e: 14 28     Invalid Opcode - NOP $28,x
            BVC __fb70         ; $fb50: 50 1e     
            .hex 3c 0b 06      ; $fb52: 3c 0b 06  Invalid Opcode - NOP $060b,x
            .hex 0c 18 30      ; $fb55: 0c 18 30  Invalid Opcode - NOP $3018
            RTS                ; $fb58: 60        

;-------------------------------------------------------------------------------
            BIT $48            ; $fb59: 24 48     
            .hex 07 0d         ; $fb5b: 07 0d     Invalid Opcode - SLO $0d
            .hex 1a            ; $fb5d: 1a        Invalid Opcode - NOP 
            .hex 34 78         ; $fb5e: 34 78     Invalid Opcode - NOP $78,x
            .hex 27 4e         ; $fb60: 27 4e     Invalid Opcode - RLA $4e
__fb62:     ASL                ; $fb62: 0a        
            PHP                ; $fb63: 08        
            ORA $0a            ; $fb64: 05 0a     
            .hex 09            ; $fb66: 09        Suspected data
__fb67:     BVC __fba9         ; $fb67: 50 40     
            LSR $4a            ; $fb69: 46 4a     
            BVC __fbc3         ; $fb6b: 50 56     
            .hex 5c 64 6c      ; $fb6d: 5c 64 6c  Invalid Opcode - NOP $6c64,x
__fb70:     .hex 74 7c         ; $fb70: 74 7c     Invalid Opcode - NOP $7c,x
            DEY                ; $fb72: 88        
            BCC __fb0f         ; $fb73: 90 9a     
__fb75:     STA $f0            ; $fb75: 85 f0     
            STA $fb            ; $fb77: 85 fb     
            LDY #$08           ; $fb79: a0 08     
            JMP __fd67         ; $fb7b: 4c 67 fd  

;-------------------------------------------------------------------------------
            STY $f0            ; $fb7e: 84 f0     
            LDA #$71           ; $fb80: a9 71     
            LDY #$00           ; $fb82: a0 00     
            LDX #$9f           ; $fb84: a2 9f     
            JSR __fa8f         ; $fb86: 20 8f fa  
__fb89:     LDX $f2            ; $fb89: a6 f2     
            LDY __fb67,x       ; $fb8b: bc 67 fb  
            DEC $f1            ; $fb8e: c6 f1     
            LDA $f1            ; $fb90: a5 f1     
            BEQ __fb75         ; $fb92: f0 e1     
            AND #$07           ; $fb94: 29 07     
            BNE __fba0         ; $fb96: d0 08     
            TYA                ; $fb98: 98        
            LSR                ; $fb99: 4a        
            ADC __fb67,x       ; $fb9a: 7d 67 fb  
            TAY                ; $fb9d: a8        
            BNE __fba7         ; $fb9e: d0 07     
__fba0:     AND #$03           ; $fba0: 29 03     
            BNE __fbb2         ; $fba2: d0 0e     
            INC $f2            ; $fba4: e6 f2     
            CLC                ; $fba6: 18        
__fba7:     .hex 8c 02         ; $fba7: 8c 02     Suspected data
__fba9:     RTI                ; $fba9: 40        

;-------------------------------------------------------------------------------
            LDY #$28           ; $fbaa: a0 28     
            BCC __fbaf         ; $fbac: 90 01     
            INY                ; $fbae: c8        
__fbaf:     STY $4003          ; $fbaf: 8c 03 40  
__fbb2:     LDA #$00           ; $fbb2: a9 00     
            JMP __fe00         ; $fbb4: 4c 00 fe  

;-------------------------------------------------------------------------------
__fbb7:     STY $f0            ; $fbb7: 84 f0     
            LDA #$54           ; $fbb9: a9 54     
            LDY #$6a           ; $fbbb: a0 6a     
            LDX #$9c           ; $fbbd: a2 9c     
            JSR __fa8f         ; $fbbf: 20 8f fa  
__fbc2:     .hex a4            ; $fbc2: a4        Suspected data
__fbc3:     .hex f2            ; $fbc3: f2        Invalid Opcode - KIL 
            LDA $f1            ; $fbc4: a5 f1     
            AND #$03           ; $fbc6: 29 03     
            BEQ __fbd4         ; $fbc8: f0 0a     
            CMP #$03           ; $fbca: c9 03     
            BNE __fbd9         ; $fbcc: d0 0b     
            JSR __fad5         ; $fbce: 20 d5 fa  
            STA $f2            ; $fbd1: 85 f2     
            TAY                ; $fbd3: a8        
__fbd4:     TYA                ; $fbd4: 98        
            LSR                ; $fbd5: 4a        
            ADC $f2            ; $fbd6: 65 f2     
            TAY                ; $fbd8: a8        
__fbd9:     TYA                ; $fbd9: 98        
            ROL                ; $fbda: 2a        
            ROL                ; $fbdb: 2a        
            ROL                ; $fbdc: 2a        
            STA $4002          ; $fbdd: 8d 02 40  
            ROL                ; $fbe0: 2a        
            STA $4003          ; $fbe1: 8d 03 40  
            LDA $f1            ; $fbe4: a5 f1     
            CMP #$18           ; $fbe6: c9 18     
            BCS __fc44         ; $fbe8: b0 5a     
            LSR                ; $fbea: 4a        
            ORA #$90           ; $fbeb: 09 90     
            STA $4000          ; $fbed: 8d 00 40  
            BNE __fc44         ; $fbf0: d0 52     
__fbf2:     LDY $ff            ; $fbf2: a4 ff     
            LDA $f0            ; $fbf4: a5 f0     
            LSR                ; $fbf6: 4a        
            BCS __fb89         ; $fbf7: b0 90     
            .hex 46            ; $fbf9: 46        Suspected data
__fbfa:     .hex ff b0 81      ; $fbfa: ff b0 81  Invalid Opcode - ISC $81b0,x
            LDX $fa            ; $fbfd: a6 fa     
            BNE __fc4b         ; $fbff: d0 4a     
            LSR                ; $fc01: 4a        
            BCS __fbc2         ; $fc02: b0 be     
            LSR $ff            ; $fc04: 46 ff     
            BCS __fbb7         ; $fc06: b0 af     
            LSR                ; $fc08: 4a        
            BCS __fc28         ; $fc09: b0 1d     
            LSR $ff            ; $fc0b: 46 ff     
            BCS __fc19         ; $fc0d: b0 0a     
            LSR                ; $fc0f: 4a        
            BCS __fc62         ; $fc10: b0 50     
            LSR $ff            ; $fc12: 46 ff     
            BCS __fc51         ; $fc14: b0 3b     
__fc16:     JMP __fc90         ; $fc16: 4c 90 fc  

;-------------------------------------------------------------------------------
__fc19:     STY $f0            ; $fc19: 84 f0     
            LDA #$22           ; $fc1b: a9 22     
            STA $f1            ; $fc1d: 85 f1     
            LDY #$0b           ; $fc1f: a0 0b     
            STY $f2            ; $fc21: 84 f2     
            LDA #$20           ; $fc23: a9 20     
            JSR __fa9f         ; $fc25: 20 9f fa  
__fc28:     DEC $f2            ; $fc28: c6 f2     
            BNE __fc30         ; $fc2a: d0 04     
            LDA #$07           ; $fc2c: a9 07     
            STA $f2            ; $fc2e: 85 f2     
__fc30:     LDX $f2            ; $fc30: a6 f2     
            LDY __faf5,x       ; $fc32: bc f5 fa  
            LDX #$5a           ; $fc35: a2 5a     
            LDA $f1            ; $fc37: a5 f1     
            CMP #$14           ; $fc39: c9 14     
            BCS __fc41         ; $fc3b: b0 04     
            LSR                ; $fc3d: 4a        
            ORA #$50           ; $fc3e: 09 50     
            TAX                ; $fc40: aa        
__fc41:     JSR __fa95         ; $fc41: 20 95 fa  
__fc44:     DEC $f1            ; $fc44: c6 f1     
            BNE __fc16         ; $fc46: d0 ce     
            JSR __fae0         ; $fc48: 20 e0 fa  
__fc4b:     LDA #$00           ; $fc4b: a9 00     
            STA $f0            ; $fc4d: 85 f0     
            BEQ __fc16         ; $fc4f: f0 c5     
__fc51:     STY $f0            ; $fc51: 84 f0     
            LDA #$0a           ; $fc53: a9 0a     
            STA $f1            ; $fc55: 85 f1     
            LDY $06f0          ; $fc57: ac f0 06  
            STY $4002          ; $fc5a: 8c 02 40  
            LDA #$88           ; $fc5d: a9 88     
            STA $4003          ; $fc5f: 8d 03 40  
__fc62:     LDA $18            ; $fc62: a5 18     
            AND #$08           ; $fc64: 29 08     
            CLC                ; $fc66: 18        
            ADC $f1            ; $fc67: 65 f1     
            ADC #$fe           ; $fc69: 69 fe     
            TAX                ; $fc6b: aa        
            LDY __fae5,x       ; $fc6c: bc e5 fa  
            LDX #$41           ; $fc6f: a2 41     
            BNE __fc41         ; $fc71: d0 ce     
__fc73:     LDA #$0e           ; $fc73: a9 0e     
            STA $06a5          ; $fc75: 8d a5 06  
            LDY #$85           ; $fc78: a0 85     
            LDA #$46           ; $fc7a: a9 46     
            JSR __fab3         ; $fc7c: 20 b3 fa  
__fc7f:     DEC $06a5          ; $fc7f: ce a5 06  
            BEQ __fc9d         ; $fc82: f0 19     
            LDA $06a5          ; $fc84: ad a5 06  
            ORA #$90           ; $fc87: 09 90     
            TAY                ; $fc89: a8        
            DEY                ; $fc8a: 88        
            STY $4004          ; $fc8b: 8c 04 40  
            BNE __fc9d         ; $fc8e: d0 0d     
__fc90:     LDA $f3            ; $fc90: a5 f3     
            BNE __fc9d         ; $fc92: d0 09     
            LDA $06a5          ; $fc94: ad a5 06  
            BNE __fc7f         ; $fc97: d0 e6     
            LDY $fe            ; $fc99: a4 fe     
            BMI __fc73         ; $fc9b: 30 d6     
__fc9d:     LDA $fc            ; $fc9d: a5 fc     
            BNE __fd0b         ; $fc9f: d0 6a     
            LDA $f9            ; $fca1: a5 f9     
            BNE __fd0b         ; $fca3: d0 66     
            LDY $fe            ; $fca5: a4 fe     
            LDA $06a1          ; $fca7: ad a1 06  
            LSR $fe            ; $fcaa: 46 fe     
            BCS __fcba         ; $fcac: b0 0c     
            LSR                ; $fcae: 4a        
            BCS __fcbe         ; $fcaf: b0 0d     
            LSR                ; $fcb1: 4a        
            BCS __fcf0         ; $fcb2: b0 3c     
            LSR $fe            ; $fcb4: 46 fe     
            BCS __fcdb         ; $fcb6: b0 23     
            BCC __fd0b         ; $fcb8: 90 51     
__fcba:     LDA #$28           ; $fcba: a9 28     
            BNE __fcdd         ; $fcbc: d0 1f     
__fcbe:     LDA $f5            ; $fcbe: a5 f5     
            BNE __fcc6         ; $fcc0: d0 04     
            LSR $fe            ; $fcc2: 46 fe     
            BCS __fcdb         ; $fcc4: b0 15     
__fcc6:     LDA $f6            ; $fcc6: a5 f6     
            LSR                ; $fcc8: 4a        
            LSR                ; $fcc9: 4a        
            LSR                ; $fcca: 4a        
            LSR                ; $fccb: 4a        
            LSR                ; $fccc: 4a        
            ADC $f6            ; $fccd: 65 f6     
            BCC __fd00         ; $fccf: 90 2f     
__fcd1:     LDA #$00           ; $fcd1: a9 00     
            STA $06a1          ; $fcd3: 8d a1 06  
            STA $4008          ; $fcd6: 8d 08 40  
            BEQ __fd0b         ; $fcd9: f0 30     
__fcdb:     LDA #$fe           ; $fcdb: a9 fe     
__fcdd:     STY $06a1          ; $fcdd: 8c a1 06  
            LDX #$0e           ; $fce0: a2 0e     
            STX $f5            ; $fce2: 86 f5     
            LDY #$ff           ; $fce4: a0 ff     
            STY $4008          ; $fce6: 8c 08 40  
            LDY #$08           ; $fce9: a0 08     
            STY $400b          ; $fceb: 8c 0b 40  
            BNE __fd00         ; $fcee: d0 10     
__fcf0:     LDA #$fe           ; $fcf0: a9 fe     
            LDY $f5            ; $fcf2: a4 f5     
            BEQ __fcd1         ; $fcf4: f0 db     
            CPY #$07           ; $fcf6: c0 07     
            BEQ __fd00         ; $fcf8: f0 06     
            LDA $f6            ; $fcfa: a5 f6     
            TAY                ; $fcfc: a8        
            JSR __fad7         ; $fcfd: 20 d7 fa  
__fd00:     STA $f6            ; $fd00: 85 f6     
            STA $400a          ; $fd02: 8d 0a 40  
            LDA $f5            ; $fd05: a5 f5     
            BEQ __fd0b         ; $fd07: f0 02     
            DEC $f5            ; $fd09: c6 f5     
__fd0b:     LDX $fa            ; $fd0b: a6 fa     
            BNE __fd58         ; $fd0d: d0 49     
            LDA $fc            ; $fd0f: a5 fc     
            BNE __fd18         ; $fd11: d0 05     
            STA $06a3          ; $fd13: 8d a3 06  
            BEQ __fd58         ; $fd16: f0 40     
__fd18:     EOR $06a3          ; $fd18: 4d a3 06  
            BEQ __fd35         ; $fd1b: f0 18     
__fd1d:     LDA $fc            ; $fd1d: a5 fc     
            STA $06a3          ; $fd1f: 8d a3 06  
            JSR __fa86         ; $fd22: 20 86 fa  
            LDA __ffcd,y       ; $fd25: b9 cd ff  
            STA $0680          ; $fd28: 8d 80 06  
            LDA #$d4           ; $fd2b: a9 d4     
            STA $f5            ; $fd2d: 85 f5     
            LDA #$ff           ; $fd2f: a9 ff     
            STA $f6            ; $fd31: 85 f6     
            BNE __fd3a         ; $fd33: d0 05     
__fd35:     DEC $0698          ; $fd35: ce 98 06  
            BNE __fd58         ; $fd38: d0 1e     
__fd3a:     LDY $0680          ; $fd3a: ac 80 06  
            INC $0680          ; $fd3d: ee 80 06  
            LDA ($f5),y        ; $fd40: b1 f5     
            BEQ __fd1d         ; $fd42: f0 d9     
            TAX                ; $fd44: aa        
            ROR                ; $fd45: 6a        
            TXA                ; $fd46: 8a        
            ROL                ; $fd47: 2a        
            ROL                ; $fd48: 2a        
            ROL                ; $fd49: 2a        
            AND #$07           ; $fd4a: 29 07     
            TAY                ; $fd4c: a8        
            LDA __fb62,y       ; $fd4d: b9 62 fb  
            STA $0698          ; $fd50: 8d 98 06  
            LDA #$10           ; $fd53: a9 10     
            JSR __faba         ; $fd55: 20 ba fa  
__fd58:     LDA $fd            ; $fd58: a5 fd     
            BNE __fd62         ; $fd5a: d0 06     
            LDA $0102          ; $fd5c: ad 02 01  
            BNE __fd9b         ; $fd5f: d0 3a     
            RTS                ; $fd61: 60        

;-------------------------------------------------------------------------------
__fd62:     JSR __fa86         ; $fd62: 20 86 fa  
            STY $fb            ; $fd65: 84 fb     
__fd67:     LDA __fe59,y       ; $fd67: b9 59 fe  
            TAY                ; $fd6a: a8        
            LDA __fe59,y       ; $fd6b: b9 59 fe  
            STA $068d          ; $fd6e: 8d 8d 06  
            LDA __fe5a,y       ; $fd71: b9 5a fe  
            STA $f7            ; $fd74: 85 f7     
            LDA __fe5b,y       ; $fd76: b9 5b fe  
            STA $f8            ; $fd79: 85 f8     
            LDA __fe5c,y       ; $fd7b: b9 5c fe  
            STA $f9            ; $fd7e: 85 f9     
            LDA __fe5d,y       ; $fd80: b9 5d fe  
            STA $fa            ; $fd83: 85 fa     
            LDA #$01           ; $fd85: a9 01     
            STA $0695          ; $fd87: 8d 95 06  
            STA $0696          ; $fd8a: 8d 96 06  
            STA $0698          ; $fd8d: 8d 98 06  
            STA $0102          ; $fd90: 8d 02 01  
            LDY #$00           ; $fd93: a0 00     
            STY $f3            ; $fd95: 84 f3     
            LDA $fb            ; $fd97: a5 fb     
            BEQ __fda4         ; $fd99: f0 09     
__fd9b:     LDY $fa            ; $fd9b: a4 fa     
            BEQ __fdd8         ; $fd9d: f0 39     
            DEC $0696          ; $fd9f: ce 96 06  
            BNE __fdd8         ; $fda2: d0 34     
__fda4:     INC $fa            ; $fda4: e6 fa     
            LDA ($f7),y        ; $fda6: b1 f7     
            BEQ __fde9         ; $fda8: f0 3f     
            BPL __fdb8         ; $fdaa: 10 0c     
            JSR __faca         ; $fdac: 20 ca fa  
            STA $0691          ; $fdaf: 8d 91 06  
            LDY $fa            ; $fdb2: a4 fa     
            INC $fa            ; $fdb4: e6 fa     
            LDA ($f7),y        ; $fdb6: b1 f7     
__fdb8:     JSR __fa9f         ; $fdb8: 20 9f fa  
            BNE __fdc1         ; $fdbb: d0 04     
            LDY #$10           ; $fdbd: a0 10     
            BNE __fdcf         ; $fdbf: d0 0e     
__fdc1:     LDX #$9f           ; $fdc1: a2 9f     
            LDA $fb            ; $fdc3: a5 fb     
            BEQ __fdcf         ; $fdc5: f0 08     
            LDX #$06           ; $fdc7: a2 06     
            LDA $f9            ; $fdc9: a5 f9     
            BNE __fdcf         ; $fdcb: d0 02     
            LDX #$86           ; $fdcd: a2 86     
__fdcf:     JSR __fa93         ; $fdcf: 20 93 fa  
            LDA $0691          ; $fdd2: ad 91 06  
            STA $0696          ; $fdd5: 8d 96 06  
__fdd8:     LDA $fb            ; $fdd8: a5 fb     
            BEQ __fe31         ; $fdda: f0 55     
            DEC $0695          ; $fddc: ce 95 06  
            BNE __fe31         ; $fddf: d0 50     
            LDY $f3            ; $fde1: a4 f3     
            INC $f3            ; $fde3: e6 f3     
            LDA ($f7),y        ; $fde5: b1 f7     
            BNE __fe09         ; $fde7: d0 20     
__fde9:     JSR __fae0         ; $fde9: 20 e0 fa  
            LDA #$00           ; $fdec: a9 00     
            STA $fa            ; $fdee: 85 fa     
            STA $f3            ; $fdf0: 85 f3     
            STA $f9            ; $fdf2: 85 f9     
            STA $0102          ; $fdf4: 8d 02 01  
            LDY $fb            ; $fdf7: a4 fb     
            BEQ __fe00         ; $fdf9: f0 05     
            LDY $06a1          ; $fdfb: ac a1 06  
            BNE __fe03         ; $fdfe: d0 03     
__fe00:     STA $4008          ; $fe00: 8d 08 40  
__fe03:     LDA #$10           ; $fe03: a9 10     
            STA $4004          ; $fe05: 8d 04 40  
            RTS                ; $fe08: 60        

;-------------------------------------------------------------------------------
__fe09:     JSR __fac4         ; $fe09: 20 c4 fa  
            STA $0695          ; $fe0c: 8d 95 06  
            TXA                ; $fe0f: 8a        
            AND #$3e           ; $fe10: 29 3e     
            LDY #$7f           ; $fe12: a0 7f     
            JSR __fab3         ; $fe14: 20 b3 fa  
            BNE __fe1d         ; $fe17: d0 04     
            LDX #$10           ; $fe19: a2 10     
            BNE __fe2e         ; $fe1b: d0 11     
__fe1d:     LDX #$89           ; $fe1d: a2 89     
            LDA $0695          ; $fe1f: ad 95 06  
            CMP #$18           ; $fe22: c9 18     
            BCS __fe2e         ; $fe24: b0 08     
            LDX #$86           ; $fe26: a2 86     
            CMP #$10           ; $fe28: c9 10     
            BCS __fe2e         ; $fe2a: b0 02     
            LDX #$84           ; $fe2c: a2 84     
__fe2e:     STX $4004          ; $fe2e: 8e 04 40  
__fe31:     LDY $f9            ; $fe31: a4 f9     
            BEQ __fe58         ; $fe33: f0 23     
            DEC $0698          ; $fe35: ce 98 06  
            BNE __fe58         ; $fe38: d0 1e     
            INC $f9            ; $fe3a: e6 f9     
            LDA ($f7),y        ; $fe3c: b1 f7     
            JSR __fac4         ; $fe3e: 20 c4 fa  
            .hex 8d            ; $fe41: 8d        Suspected data
__fe42:     TYA                ; $fe42: 98        
            ASL $18            ; $fe43: 06 18     
__fe45:     ADC #$fe           ; $fe45: 69 fe     
            ASL                ; $fe47: 0a        
            ASL                ; $fe48: 0a        
            CMP #$38           ; $fe49: c9 38     
            BCC __fe4f         ; $fe4b: 90 02     
            LDA #$38           ; $fe4d: a9 38     
__fe4f:     LDY $fb            ; $fe4f: a4 fb     
            BNE __fe55         ; $fe51: d0 02     
            LDA #$ff           ; $fe53: a9 ff     
__fe55:     JSR __faba         ; $fe55: 20 ba fa  
__fe58:     RTS                ; $fe58: 60        

;-------------------------------------------------------------------------------
__fe59:     .hex 09            ; $fe59: 09        Suspected data
__fe5a:     .hex 0e            ; $fe5a: 0e        Suspected data
__fe5b:     .hex 13            ; $fe5b: 13        Suspected data
__fe5c:     CLC                ; $fe5c: 18        
__fe5d:     ORA $2722,x        ; $fe5d: 1d 22 27  
            .hex 2c 31 00      ; $fe60: 2c 31 00  Bad Addr Mode - BIT $0031
            .hex 8f fe 1b      ; $fe63: 8f fe 1b  Invalid Opcode - SAX $1bfe
            BRK                ; $fe66: 00        
            PHP                ; $fe67: 08        
__fe68:     BCS __fe68         ; $fe68: b0 fe     
            BRK                ; $fe6a: 00        
            .hex 0c 00 cf      ; $fe6b: 0c 00 cf  Invalid Opcode - NOP __cf00
            INC $1a00,x        ; $fe6e: fe 00 1a  
            PHP                ; $fe71: 08        
            ORA $ff            ; $fe72: 05 ff     
            BRK                ; $fe74: 00        
            .hex 0b 00         ; $fe75: 0b 00     Invalid Opcode - ANC #$00
            .hex ad ff 00      ; $fe77: ad ff 00  Bad Addr Mode - LDA $00ff
            .hex 03 00         ; $fe7a: 03 00     Invalid Opcode - SLO ($00,x)
            LDX $00ff,y        ; $fe7c: be ff 00  
            BRK                ; $fe7f: 00        
            BRK                ; $fe80: 00        
            CPY $ff            ; $fe81: c4 ff     
            BRK                ; $fe83: 00        
            BRK                ; $fe84: 00        
            .hex 0f 20 ff      ; $fe85: 0f 20 ff  Invalid Opcode - SLO __ff20
            AND ($3e,x)        ; $fe88: 21 3e     
            BRK                ; $fe8a: 00        
            LDA ($ff,x)        ; $fe8b: a1 ff     
            PHP                ; $fe8d: 08        
            BRK                ; $fe8e: 00        
            STX $46            ; $fe8f: 86 46     
            .hex 82 4a         ; $fe91: 82 4a     Invalid Opcode - NOP #$4a
            .hex 83 26         ; $fe93: 83 26     Invalid Opcode - SAX ($26,x)
            LSR $80            ; $fe95: 46 80     
            .hex 34 32         ; $fe97: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe99: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe9b: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe9d: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fe9f: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fea1: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fea3: 34 32     Invalid Opcode - NOP $32,x
            .hex 34 32         ; $fea5: 34 32     Invalid Opcode - NOP $32,x
            STY $34            ; $fea7: 84 34     
            BRK                ; $fea9: 00        
            LDA #$ac           ; $feaa: a9 ac     
            INC $33e8          ; $feac: ee e8 33  
            AND $16,x          ; $feaf: 35 16     
            ASL $57,x          ; $feb1: 16 57     
            ASL $6420,x        ; $feb3: 1e 20 64  
            .hex 9e 1e 20      ; $feb6: 9e 1e 20  Invalid Opcode - SHX $201e,y
            .hex 64 9e         ; $feb9: 64 9e     Invalid Opcode - NOP $9e
            BRK                ; $febb: 00        
            .hex 80 30         ; $febc: 80 30     Invalid Opcode - NOP #$30
            BMI __fe45         ; $febe: 30 85     
            BMI __fe42         ; $fec0: 30 80     
            .hex 1a            ; $fec2: 1a        Invalid Opcode - NOP 
            .hex 1c 81 1e      ; $fec3: 1c 81 1e  Invalid Opcode - NOP $1e81,x
            .hex 82 1a         ; $fec6: 82 1a     Invalid Opcode - NOP #$1a
            .hex 80 1a         ; $fec8: 80 1a     Invalid Opcode - NOP #$1a
            .hex 1c 81 1e      ; $feca: 1c 81 1e  Invalid Opcode - NOP $1e81,x
            .hex 82 1a         ; $fecd: 82 1a     Invalid Opcode - NOP #$1a
            LSR $5c5e,x        ; $fecf: 5e 5e 5c  
            .hex 5c 5a 5a      ; $fed2: 5c 5a 5a  Invalid Opcode - NOP $5a5a,x
            CLI                ; $fed5: 58        
            CLI                ; $fed6: 58        
            .hex 57 16         ; $fed7: 57 16     Invalid Opcode - SRE $16,x
            CLC                ; $fed9: 18        
            TXS                ; $feda: 9a        
            STX $59,y          ; $fedb: 96 59     
            CLC                ; $fedd: 18        
            .hex 1a            ; $fede: 1a        Invalid Opcode - NOP 
            .hex 9c 98 5f      ; $fedf: 9c 98 5f  Invalid Opcode - SHY $5f98,x
            LSR $5e60,x        ; $fee2: 5e 60 5e  
            .hex 5c 5a 1f      ; $fee5: 5c 5a 1f  Invalid Opcode - NOP $1f5a,x
            BRK                ; $fee8: 00        
            STA ($1a,x)        ; $fee9: 81 1a     
            .hex 1a            ; $feeb: 1a        Invalid Opcode - NOP 
            CLC                ; $feec: 18        
            CLC                ; $feed: 18        
            ASL $16,x          ; $feee: 16 16     
            SEC                ; $fef0: 38        
            SEC                ; $fef1: 38        
            .hex 82 26         ; $fef2: 82 26     Invalid Opcode - NOP #$26
            .hex 42            ; $fef4: 42        Invalid Opcode - KIL 
            ROL $42            ; $fef5: 26 42     
            PLP                ; $fef7: 28        
            LSR $28            ; $fef8: 46 28     
            LSR $30            ; $fefa: 46 30     
            PLP                ; $fefc: 28        
            BMI __ff27         ; $fefd: 30 28     
            .hex 81            ; $feff: 81        Suspected data
__ff00:     .hex 3a            ; $ff00: 3a        Invalid Opcode - NOP 
            STA $3c            ; $ff01: 85 3c     
            STY $3a            ; $ff03: 84 3a     
            LSR $2002,x        ; $ff05: 5e 02 20  
            .hex 42            ; $ff08: 42        Invalid Opcode - KIL 
            LSR                ; $ff09: 4a        
            .hex 42            ; $ff0a: 42        Invalid Opcode - KIL 
            RTS                ; $ff0b: 60        

;-------------------------------------------------------------------------------
            LSR $1d60,x        ; $ff0c: 5e 60 1d  
            BRK                ; $ff0f: 00        
            .hex 82 26         ; $ff10: 82 26     Invalid Opcode - NOP #$26
            .hex 42            ; $ff12: 42        Invalid Opcode - KIL 
            ROL $42            ; $ff13: 26 42     
            STA ($40,x)        ; $ff15: 81 40     
            .hex 80 42         ; $ff17: 80 42     Invalid Opcode - NOP #$42
            .hex 44 48         ; $ff19: 44 48     Invalid Opcode - NOP $48
            ROL $28            ; $ff1b: 26 28     
            BIT $2e83          ; $ff1d: 2c 83 2e  
            LSR $56,x          ; $ff20: 56 56     
            CPX #$42           ; $ff22: e0 42     
            .hex 5a            ; $ff24: 5a        Invalid Opcode - NOP 
            .hex 5e            ; $ff25: 5e        Suspected data
__ff26:     .hex 5c            ; $ff26: 5c        Suspected data
__ff27:     STA $5858,y        ; $ff27: 99 58 58  
__ff2a:     .hex e2 42         ; $ff2a: e2 42     Invalid Opcode - NOP #$42
            LSR $5e60,x        ; $ff2c: 5e 60 5e  
            .hex 9b            ; $ff2f: 9b        Invalid Opcode - TAS 
            .hex 5a            ; $ff30: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $ff31: 5a        Invalid Opcode - NOP 
            DEX                ; $ff32: ca        
            .hex 42            ; $ff33: 42        Invalid Opcode - KIL 
            RTS                ; $ff34: 60        

;-------------------------------------------------------------------------------
            .hex 62            ; $ff35: 62        Invalid Opcode - KIL 
            LSR                ; $ff36: 4a        
            .hex 8d            ; $ff37: 8d        Suspected data
__ff38:     .hex 5c 5e e0      ; $ff38: 5c 5e e0  Invalid Opcode - NOP __e05e,x
            .hex 42            ; $ff3b: 42        Invalid Opcode - KIL 
            .hex 5a            ; $ff3c: 5a        Invalid Opcode - NOP 
            .hex 5c 5e 1d      ; $ff3d: 5c 5e 1d  Invalid Opcode - NOP $1d5e,x
            BRK                ; $ff40: 00        
            .hex 82 6f         ; $ff41: 82 6f     Invalid Opcode - NOP #$6f
            ROR $71ee          ; $ff43: 6e ee 71  
            BVS __ff38         ; $ff46: 70 f0     
            .hex 77 76         ; $ff48: 77 76     Invalid Opcode - RRA $76,x
            INC $57,x          ; $ff4a: f6 57     
            LSR $d6,x          ; $ff4c: 56 d6     
            LDY #$9a           ; $ff4e: a0 9a     
            STX $b4,y          ; $ff50: 96 b4     
            LDX #$9c           ; $ff52: a2 9c     
            TYA                ; $ff54: 98        
            LDX $5c,y          ; $ff55: b6 5c     
            .hex 9c 96 57      ; $ff57: 9c 96 57  Invalid Opcode - SHY $5796,x
            .hex 5c 96 74      ; $ff5a: 5c 96 74  Invalid Opcode - NOP $7496,x
            .hex 2f 85 02      ; $ff5d: 2f 85 02  Invalid Opcode - RLA $0285
            STA ($2e,x)        ; $ff60: 81 2e     
            .hex 34 2e         ; $ff62: 34 2e     Invalid Opcode - NOP $2e,x
            .hex 83 34         ; $ff64: 83 34     Invalid Opcode - SAX ($34,x)
            STA ($48,x)        ; $ff66: 81 48     
            PLP                ; $ff68: 28        
            BMI __ff93         ; $ff69: 30 28     
            BMI __ff95         ; $ff6b: 30 28     
            STA $30            ; $ff6d: 85 30     
            STA ($30,x)        ; $ff6f: 81 30     
            ROL $30,x          ; $ff71: 36 30     
            .hex 83 36         ; $ff73: 83 36     Invalid Opcode - SAX ($36,x)
            STA ($26,x)        ; $ff75: 81 26     
            BIT $2c30          ; $ff77: 2c 30 2c  
            BMI __ffa8         ; $ff7a: 30 2c     
            ASL $16,x          ; $ff7c: 16 16     
            .hex 1a            ; $ff7e: 1a        Invalid Opcode - NOP 
            ASL $34,x          ; $ff7f: 16 34     
            ASL $1a,x          ; $ff81: 16 1a     
            ASL $34,x          ; $ff83: 16 34     
            ASL $1c,x          ; $ff85: 16 1c     
            CLC                ; $ff87: 18        
            ROL $18,x          ; $ff88: 36 18     
            .hex 1c 18 36      ; $ff8a: 1c 18 36  Invalid Opcode - NOP $3618,x
            CLC                ; $ff8d: 18        
            ASL $2e,x          ; $ff8e: 16 2e     
            .hex 80 16         ; $ff90: 80 16     Invalid Opcode - NOP #$16
            .hex 36            ; $ff92: 36        Suspected data
__ff93:     .hex 34 36         ; $ff93: 34 36     Invalid Opcode - NOP $36,x
__ff95:     .hex 83 16         ; $ff95: 83 16     Invalid Opcode - SAX ($16,x)
            STA ($02,x)        ; $ff97: 81 02     
            ROL $1680          ; $ff99: 2e 80 16  
            ROL $34,x          ; $ff9c: 36 34     
            BMI __ff26         ; $ff9e: 30 86     
            ROL $1a81          ; $ffa0: 2e 81 1a  
            .hex 82 1e         ; $ffa3: 82 1e     Invalid Opcode - NOP #$1e
            BMI __ff2a         ; $ffa5: 30 83     
            .hex 16            ; $ffa7: 16        Suspected data
__ffa8:     BRK                ; $ffa8: 00        
            .hex 42            ; $ffa9: 42        Invalid Opcode - KIL 
            STX $b0,y          ; $ffaa: 96 b0     
            INC $03            ; $ffac: e6 03     
            .hex 83 00         ; $ffae: 83 00     Invalid Opcode - SAX ($00,x)
            .hex 87 42         ; $ffb0: 87 42     Invalid Opcode - SAX $42
            ROL $3e42,x        ; $ffb2: 3e 42 3e  
            .hex 42            ; $ffb5: 42        Invalid Opcode - KIL 
            ROL $3e42,x        ; $ffb6: 3e 42 3e  
            .hex 42            ; $ffb9: 42        Invalid Opcode - KIL 
            ROL $8242,x        ; $ffba: 3e 42 82  
            ROL $0c0a,x        ; $ffbd: 3e 0a 0c  
            ASL $9054          ; $ffc0: 0e 54 90  
            BRK                ; $ffc3: 00        
            .hex 04 12         ; $ffc4: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $ffc6: 04 12     Invalid Opcode - NOP $12
            .hex 04 12         ; $ffc8: 04 12     Invalid Opcode - NOP $12
            .hex 04 92         ; $ffca: 04 92     Invalid Opcode - NOP $92
            BRK                ; $ffcc: 00        
__ffcd:     BRK                ; $ffcd: 00        
            BRK                ; $ffce: 00        
            BRK                ; $ffcf: 00        
            BRK                ; $ffd0: 00        
            ORA #$0e           ; $ffd1: 09 0e     
            .hex 12            ; $ffd3: 12        Invalid Opcode - KIL 
            ASL $02,x          ; $ffd4: 16 02     
            .hex 02            ; $ffd6: 02        Invalid Opcode - KIL 
            .hex 1a            ; $ffd7: 1a        Invalid Opcode - NOP 
            .hex 02            ; $ffd8: 02        Invalid Opcode - KIL 
            ASL $1e20,x        ; $ffd9: 1e 20 1e  
            BRK                ; $ffdc: 00        
            .hex 5a            ; $ffdd: 5a        Invalid Opcode - NOP 
            .hex 42            ; $ffde: 42        Invalid Opcode - KIL 
            LSR $56,x          ; $ffdf: 56 56     
            BRK                ; $ffe1: 00        
            ORA #$07           ; $ffe2: 09 07     
            ORA $00            ; $ffe4: 05 00     
            DEX                ; $ffe6: ca        
            TXA                ; $ffe7: 8a        
            TXA                ; $ffe8: 8a        
            DEX                ; $ffe9: ca        
            DEX                ; $ffea: ca        
            DEC __ceca         ; $ffeb: ce ca ce  
            DEX                ; $ffee: ca        
            .hex ce            ; $ffef: ce        Suspected data

;-------------------------------------------------------------------------------
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        STX __ce8e         ; $fff0: 8e 8e ce  
            DEC __ced2         ; $fff3: ce d2 ce  
            .hex d2            ; $fff6: d2        Invalid Opcode - KIL 
            DEC __ff00         ; $fff7: ce 00 ff  

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 5f c8     Vector table
            .dw reset                      ; $fffc: 9e c7     Vector table
            .dw irq                        ; $fffe: f0 ff     Vector table
