;-------------------------------------------------------------------------------
; Ice Climber.nes disasembled by DISASM6 v1.4
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
__c000:     ORA ($4c,x)        ; $c000: 01 4c     
            CLV                ; $c002: b8        
            .hex e3 94         ; $c003: e3 94     Invalid Opcode - ISC ($94,x)
            BRK                ; $c005: 00        
            SBC $81df          ; $c006: ed df 81  
            BRK                ; $c009: 00        
__c00a:     .hex 03 05         ; $c00a: 03 05     Invalid Opcode - SLO ($05,x)
            DEC $c6            ; $c00c: c6 c6     
            DEC $04            ; $c00e: c6 04     
            DEC $04            ; $c010: c6 04     
            .hex 04 06         ; $c012: 04 06     Invalid Opcode - NOP $06

;-------------------------------------------------------------------------------
; reset vector
;-------------------------------------------------------------------------------
reset:      SEI                ; $c014: 78        
            CLD                ; $c015: d8        
            LDA #$10           ; $c016: a9 10     
            STA $2000          ; $c018: 8d 00 20  
            LDX #$ff           ; $c01b: a2 ff     
            TXS                ; $c01d: 9a        
__c01e:     LDA $2002          ; $c01e: ad 02 20  
            ASL                ; $c021: 0a        
            BCC __c01e         ; $c022: 90 fa     
__c024:     LDA $2002          ; $c024: ad 02 20  
            ASL                ; $c027: 0a        
            BCC __c024         ; $c028: 90 fa     
            LDY #$07           ; $c02a: a0 07     
            STY $01            ; $c02c: 84 01     
            LDY #$00           ; $c02e: a0 00     
            STY $00            ; $c030: 84 00     
            TYA                ; $c032: 98        
            LDX #$5a           ; $c033: a2 5a     
            CPX $0780          ; $c035: ec 80 07  
            BNE __c041         ; $c038: d0 07     
            CPX $0781          ; $c03a: ec 81 07  
            BNE __c041         ; $c03d: d0 02     
            LDY #$ec           ; $c03f: a0 ec     
__c041:     STA ($00),y        ; $c041: 91 00     
            DEY                ; $c043: 88        
            BNE __c041         ; $c044: d0 fb     
            DEC $01            ; $c046: c6 01     
            BPL __c041         ; $c048: 10 f7     
            LDA #$5a           ; $c04a: a9 5a     
            STA $0780          ; $c04c: 8d 80 07  
            STA $0781          ; $c04f: 8d 81 07  
            JSR __c05e         ; $c052: 20 5e c0  
            JSR __c141         ; $c055: 20 41 c1  
__c058:     JSR __cace         ; $c058: 20 ce ca  
            JMP __c058         ; $c05b: 4c 58 c0  

;-------------------------------------------------------------------------------
__c05e:     LDA #$00           ; $c05e: a9 00     
            STA $4011          ; $c060: 8d 11 40  
            LDA #$0f           ; $c063: a9 0f     
            STA $4015          ; $c065: 8d 15 40  
            LDA #$06           ; $c068: a9 06     
            STA $2001          ; $c06a: 8d 01 20  
__c06d:     JSR __c883         ; $c06d: 20 83 c8  
__c070:     JSR __c89a         ; $c070: 20 9a c8  
            JMP __c81d         ; $c073: 4c 1d c8  

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        PHA                ; $c076: 48        
            TXA                ; $c077: 8a        
            PHA                ; $c078: 48        
            TYA                ; $c079: 98        
            PHA                ; $c07a: 48        
            LDA $10            ; $c07b: a5 10     
            LDX $de            ; $c07d: a6 de     
            BEQ __c083         ; $c07f: f0 02     
            EOR #$02           ; $c081: 49 02     
__c083:     AND #$7f           ; $c083: 29 7f     
            JSR __c148         ; $c085: 20 48 c1  
            LDA $52            ; $c088: a5 52     
            BNE __c095         ; $c08a: d0 09     
            LDA $11            ; $c08c: a5 11     
            ORA #$1e           ; $c08e: 09 1e     
            STA $2001          ; $c090: 8d 01 20  
            STA $11            ; $c093: 85 11     
__c095:     LDA #$00           ; $c095: a9 00     
            STA $2003          ; $c097: 8d 03 20  
            LDA #$02           ; $c09a: a9 02     
            STA $4014          ; $c09c: 8d 14 40  
            LDX $52            ; $c09f: a6 52     
            JSR __c150         ; $c0a1: 20 50 c1  
            STA $52            ; $c0a4: 85 52     
            STA $de            ; $c0a6: 85 de     
            LDA #$3f           ; $c0a8: a9 3f     
            STA $2006          ; $c0aa: 8d 06 20  
            LDA #$00           ; $c0ad: a9 00     
            STA $2006          ; $c0af: 8d 06 20  
            STA $2006          ; $c0b2: 8d 06 20  
            STA $2006          ; $c0b5: 8d 06 20  
            LDA $2002          ; $c0b8: ad 02 20  
            JSR __cb81         ; $c0bb: 20 81 cb  
            LDA $10            ; $c0be: a5 10     
            STA $2000          ; $c0c0: 8d 00 20  
            JSR __caed         ; $c0c3: 20 ed ca  
            JSR __f91e         ; $c0c6: 20 1e f9  
            LDA $53            ; $c0c9: a5 53     
            BEQ __c0d3         ; $c0cb: f0 06     
            JSR __c620         ; $c0cd: 20 20 c6  
            JMP __c126         ; $c0d0: 4c 26 c1  

;-------------------------------------------------------------------------------
__c0d3:     LDA $51            ; $c0d3: a5 51     
            BEQ __c126         ; $c0d5: f0 4f     
            LDX $034c          ; $c0d7: ae 4c 03  
            BEQ __c11a         ; $c0da: f0 3e     
            DEX                ; $c0dc: ca        
            BEQ __c103         ; $c0dd: f0 24     
            DEX                ; $c0df: ca        
            BNE __c100         ; $c0e0: d0 1e     
            LDA $11            ; $c0e2: a5 11     
            AND #$ef           ; $c0e4: 29 ef     
            STA $2001          ; $c0e6: 8d 01 20  
            STA $11            ; $c0e9: 85 11     
            LDA $15            ; $c0eb: a5 15     
            AND #$10           ; $c0ed: 29 10     
            BEQ __c138         ; $c0ef: f0 47     
            LDY #$40           ; $c0f1: a0 40     
__c0f3:     STY $fb            ; $c0f3: 84 fb     
            LDA #$40           ; $c0f5: a9 40     
            STA $034d          ; $c0f7: 8d 4d 03  
__c0fa:     INC $034c          ; $c0fa: ee 4c 03  
            JMP __c138         ; $c0fd: 4c 38 c1  

;-------------------------------------------------------------------------------
__c100:     DEX                ; $c100: ca        
            BNE __c10a         ; $c101: d0 07     
__c103:     DEC $034d          ; $c103: ce 4d 03  
            BEQ __c0fa         ; $c106: f0 f2     
            BNE __c138         ; $c108: d0 2e     
__c10a:     LDA $11            ; $c10a: a5 11     
            ORA #$10           ; $c10c: 09 10     
            STA $2001          ; $c10e: 8d 01 20  
            STA $11            ; $c111: 85 11     
            LDA #$00           ; $c113: a9 00     
            STA $034c          ; $c115: 8d 4c 03  
            BEQ __c138         ; $c118: f0 1e     
__c11a:     LDY #$20           ; $c11a: a0 20     
            LDA $15            ; $c11c: a5 15     
            AND #$10           ; $c11e: 29 10     
            BEQ __c126         ; $c120: f0 04     
            LDA $55            ; $c122: a5 55     
            BNE __c0f3         ; $c124: d0 cd     
__c126:     JSR __cb9d         ; $c126: 20 9d cb  
            INC $50            ; $c129: e6 50     
            LDA $51            ; $c12b: a5 51     
            BNE __c135         ; $c12d: d0 06     
            JSR __c437         ; $c12f: 20 37 c4  
            JMP __c138         ; $c132: 4c 38 c1  

;-------------------------------------------------------------------------------
__c135:     JSR __c44a         ; $c135: 20 4a c4  
__c138:     JSR __c141         ; $c138: 20 41 c1  
            PLA                ; $c13b: 68        
            TAY                ; $c13c: a8        
            PLA                ; $c13d: 68        
            TAX                ; $c13e: aa        
            PLA                ; $c13f: 68        
            RTI                ; $c140: 40        

;-------------------------------------------------------------------------------
__c141:     LDA $2002          ; $c141: ad 02 20  
            LDA $10            ; $c144: a5 10     
            ORA #$80           ; $c146: 09 80     
__c148:     STA $10            ; $c148: 85 10     
            STA $2000          ; $c14a: 8d 00 20  
            RTS                ; $c14d: 60        

;-------------------------------------------------------------------------------
__c14e:     LDX #$00           ; $c14e: a2 00     
__c150:     LDA __c000,x       ; $c150: bd 00 c0  
            STA $00            ; $c153: 85 00     
            LDA __c00a,x       ; $c155: bd 0a c0  
            STA $01            ; $c158: 85 01     
            JSR __cb78         ; $c15a: 20 78 cb  
__c15d:     LDA #$00           ; $c15d: a9 00     
            STA $0300          ; $c15f: 8d 00 03  
            STA $0301          ; $c162: 8d 01 03  
            RTS                ; $c165: 60        

;-------------------------------------------------------------------------------
            LDA $43            ; $c166: a5 43     
            BNE __c1d6         ; $c168: d0 6c     
            JSR __c891         ; $c16a: 20 91 c8  
            LDX $57            ; $c16d: a6 57     
            BNE __c182         ; $c16f: d0 11     
            LDA #$80           ; $c171: a9 80     
            STA $fb            ; $c173: 85 fb     
            JSR __c06d         ; $c175: 20 6d c0  
            LDX #$00           ; $c178: a2 00     
            JSR __c6fb         ; $c17a: 20 fb c6  
            LDA #$01           ; $c17d: a9 01     
__c17f:     JMP __c218         ; $c17f: 4c 18 c2  

;-------------------------------------------------------------------------------
__c182:     DEX                ; $c182: ca        
            BNE __c189         ; $c183: d0 04     
            LDA #$05           ; $c185: a9 05     
            BNE __c17f         ; $c187: d0 f6     
__c189:     DEX                ; $c189: ca        
            BNE __c19b         ; $c18a: d0 0f     
            LDA #$f9           ; $c18c: a9 f9     
            STA $00            ; $c18e: 85 00     
            JSR __ca4c         ; $c190: 20 4c ca  
            LDA #$f1           ; $c193: a9 f1     
            JSR __c8e0         ; $c195: 20 e0 c8  
            JMP __c21a         ; $c198: 4c 1a c2  

;-------------------------------------------------------------------------------
__c19b:     LDA #$00           ; $c19b: a9 00     
            STA $56            ; $c19d: 85 56     
            STA $57            ; $c19f: 85 57     
            STA $03fa          ; $c1a1: 8d fa 03  
            STA $03fb          ; $c1a4: 8d fb 03  
            STA $13            ; $c1a7: 85 13     
            STA $22            ; $c1a9: 85 22     
            STA $23            ; $c1ab: 85 23     
            LDX #$09           ; $c1ad: a2 09     
__c1af:     STA $0360,x        ; $c1af: 9d 60 03  
            DEX                ; $c1b2: ca        
            BPL __c1af         ; $c1b3: 10 fa     
            STA $4d            ; $c1b5: 85 4d     
            JSR __c8e0         ; $c1b7: 20 e0 c8  
            JSR __c4c0         ; $c1ba: 20 c0 c4  
            LDA $54            ; $c1bd: a5 54     
            BNE __c1d0         ; $c1bf: d0 0f     
            LDA #$03           ; $c1c1: a9 03     
            STA $54            ; $c1c3: 85 54     
            LDA #$58           ; $c1c5: a9 58     
            STA $4d            ; $c1c7: 85 4d     
            LDA #$09           ; $c1c9: a9 09     
            STA $31            ; $c1cb: 85 31     
            LSR                ; $c1cd: 4a        
            STA $fb            ; $c1ce: 85 fb     
__c1d0:     LDA #$80           ; $c1d0: a9 80     
            STA $4e            ; $c1d2: 85 4e     
            INC $51            ; $c1d4: e6 51     
__c1d6:     RTS                ; $c1d6: 60        

;-------------------------------------------------------------------------------
__c1d7:     JSR __c891         ; $c1d7: 20 91 c8  
            LDA $57            ; $c1da: a5 57     
            BNE __c1f0         ; $c1dc: d0 12     
            JSR __c070         ; $c1de: 20 70 c0  
            LDA $10            ; $c1e1: a5 10     
            AND #$fd           ; $c1e3: 29 fd     
            STA $10            ; $c1e5: 85 10     
            LDA #$9f           ; $c1e7: a9 9f     
            STA $13            ; $c1e9: 85 13     
            LDA #$04           ; $c1eb: a9 04     
            JMP __c218         ; $c1ed: 4c 18 c2  

;-------------------------------------------------------------------------------
__c1f0:     CMP #$01           ; $c1f0: c9 01     
            BEQ __c21a         ; $c1f2: f0 26     
            CMP #$02           ; $c1f4: c9 02     
            BNE __c21d         ; $c1f6: d0 25     
            LDA #$00           ; $c1f8: a9 00     
            STA $7c            ; $c1fa: 85 7c     
            LDX #$77           ; $c1fc: a2 77     
__c1fe:     STA $78,x          ; $c1fe: 95 78     
            CPX #$01           ; $c200: e0 01     
            BCC __c207         ; $c202: 90 03     
            STA $0380,x        ; $c204: 9d 80 03  
__c207:     DEX                ; $c207: ca        
            BPL __c1fe         ; $c208: 10 f4     
            JSR __c5a7         ; $c20a: 20 a7 c5  
            LDA #$01           ; $c20d: a9 01     
            STA $da            ; $c20f: 85 da     
            LDA #$04           ; $c211: a9 04     
            STA $90            ; $c213: 85 90     
            LSR                ; $c215: 4a        
            STA $db            ; $c216: 85 db     
__c218:     STA $52            ; $c218: 85 52     
__c21a:     INC $57            ; $c21a: e6 57     
            RTS                ; $c21c: 60        

;-------------------------------------------------------------------------------
__c21d:     CMP #$03           ; $c21d: c9 03     
            BNE __c23b         ; $c21f: d0 1a     
            JSR __e79d         ; $c221: 20 9d e7  
            JSR __e4c2         ; $c224: 20 c2 e4  
            JSR __c542         ; $c227: 20 42 c5  
            JSR __c4d7         ; $c22a: 20 d7 c4  
            JSR __dfab         ; $c22d: 20 ab df  
            JSR __dd16         ; $c230: 20 16 dd  
            JSR __dd1d         ; $c233: 20 1d dd  
            INC $57            ; $c236: e6 57     
            JMP __e05e         ; $c238: 4c 5e e0  

;-------------------------------------------------------------------------------
__c23b:     LDA #$00           ; $c23b: a9 00     
            LDY #$90           ; $c23d: a0 90     
__c23f:     STA $005f,y        ; $c23f: 99 5f 00  
            DEY                ; $c242: 88        
            BNE __c23f         ; $c243: d0 fa     
            LDA #$04           ; $c245: a9 04     
            STA $90            ; $c247: 85 90     
            LDA #$38           ; $c249: a9 38     
            STA $64            ; $c24b: 85 64     
            LDA #$b8           ; $c24d: a9 b8     
            STA $65            ; $c24f: 85 65     
            LDX #$01           ; $c251: a2 01     
__c253:     LDA #$00           ; $c253: a9 00     
            STA $5a,x          ; $c255: 95 5a     
            STA $6a,x          ; $c257: 95 6a     
            LDA $20,x          ; $c259: b5 20     
            BMI __c274         ; $c25b: 30 17     
            LDA #$01           ; $c25d: a9 01     
            STA $037a          ; $c25f: 8d 7a 03  
            STA $62            ; $c262: 85 62     
            STA $5a,x          ; $c264: 95 5a     
            STA $6a,x          ; $c266: 95 6a     
            LSR                ; $c268: 4a        
            STA $2f,x          ; $c269: 95 2f     
            STA $063f          ; $c26b: 8d 3f 06  
            STA $2d,x          ; $c26e: 95 2d     
            LDA #$c0           ; $c270: a9 c0     
            STA $66,x          ; $c272: 95 66     
__c274:     DEX                ; $c274: ca        
            BPL __c253         ; $c275: 10 dc     
            LDX #$02           ; $c277: a2 02     
__c279:     JSR __f19e         ; $c279: 20 9e f1  
            DEX                ; $c27c: ca        
            BPL __c279         ; $c27d: 10 fa     
            LDA #$05           ; $c27f: a9 05     
            STA $8b            ; $c281: 85 8b     
            LDA #$80           ; $c283: a9 80     
            STA $3d            ; $c285: 85 3d     
            LDA #$01           ; $c287: a9 01     
            STA $2c            ; $c289: 85 2c     
            LDA #$1a           ; $c28b: a9 1a     
            STA $4a            ; $c28d: 85 4a     
            LDA #$21           ; $c28f: a9 21     
            STA $4b            ; $c291: 85 4b     
            LDA #$22           ; $c293: a9 22     
            STA $39            ; $c295: 85 39     
            JSR __f80c         ; $c297: 20 0c f8  
            LDX $55            ; $c29a: a6 55     
            CPX #$01           ; $c29c: e0 01     
            BNE __c2ab         ; $c29e: d0 0b     
            LDA #$02           ; $c2a0: a9 02     
            STA $fb            ; $c2a2: 85 fb     
            JSR __e002         ; $c2a4: 20 02 e0  
__c2a7:     LDA #$01           ; $c2a7: a9 01     
            STA $8d            ; $c2a9: 85 8d     
__c2ab:     INC $57            ; $c2ab: e6 57     
            INC $51            ; $c2ad: e6 51     
            RTS                ; $c2af: 60        

;-------------------------------------------------------------------------------
            JSR __c891         ; $c2b0: 20 91 c8  
            LDX $57            ; $c2b3: a6 57     
            BNE __c2c4         ; $c2b5: d0 0d     
            JSR __c06d         ; $c2b7: 20 6d c0  
            LDX #$01           ; $c2ba: a2 01     
            JSR __c6fb         ; $c2bc: 20 fb c6  
            LDA #$07           ; $c2bf: a9 07     
__c2c1:     JMP __c218         ; $c2c1: 4c 18 c2  

;-------------------------------------------------------------------------------
__c2c4:     DEX                ; $c2c4: ca        
            BNE __c2ce         ; $c2c5: d0 07     
            JSR __f524         ; $c2c7: 20 24 f5  
            LDA #$05           ; $c2ca: a9 05     
            BNE __c2c1         ; $c2cc: d0 f3     
__c2ce:     DEX                ; $c2ce: ca        
            BNE __c2d9         ; $c2cf: d0 08     
            LDA $58            ; $c2d1: a5 58     
            BEQ __c2d9         ; $c2d3: f0 04     
            LDA #$08           ; $c2d5: a9 08     
            BNE __c2c1         ; $c2d7: d0 e8     
__c2d9:     JSR __f586         ; $c2d9: 20 86 f5  
            LDA #$00           ; $c2dc: a9 00     
            STA $84            ; $c2de: 85 84     
            LDA #$10           ; $c2e0: a9 10     
            STA $37            ; $c2e2: 85 37     
            STA $38            ; $c2e4: 85 38     
            LDA #$68           ; $c2e6: a9 68     
            STA $34            ; $c2e8: 85 34     
            JMP __c2ab         ; $c2ea: 4c ab c2  

;-------------------------------------------------------------------------------
            LDX $57            ; $c2ed: a6 57     
            BNE __c324         ; $c2ef: d0 33     
            JSR __c81d         ; $c2f1: 20 1d c8  
            LDA #$01           ; $c2f4: a9 01     
            STA $27            ; $c2f6: 85 27     
            LSR                ; $c2f8: 4a        
            STA $05fb          ; $c2f9: 8d fb 05  
            LDX #$07           ; $c2fc: a2 07     
__c2fe:     STA $07f8,x        ; $c2fe: 9d f8 07  
            DEX                ; $c301: ca        
            BPL __c2fe         ; $c302: 10 fa     
            LDA #$40           ; $c304: a9 40     
            STA $07fa          ; $c306: 8d fa 07  
            STA $07fe          ; $c309: 8d fe 07  
            LDX $58            ; $c30c: a6 58     
__c30e:     LDA $6a,x          ; $c30e: b5 6a     
            CMP #$07           ; $c310: c9 07     
            BNE __c31a         ; $c312: d0 06     
            LDA $5a,x          ; $c314: b5 5a     
            BEQ __c31a         ; $c316: f0 02     
            DEC $20,x          ; $c318: d6 20     
__c31a:     DEX                ; $c31a: ca        
            BPL __c30e         ; $c31b: 10 f1     
            LDA #$06           ; $c31d: a9 06     
            STA $7a            ; $c31f: 85 7a     
            JMP __c218         ; $c321: 4c 18 c2  

;-------------------------------------------------------------------------------
__c324:     DEX                ; $c324: ca        
            BNE __c349         ; $c325: d0 22     
            DEC $13            ; $c327: c6 13     
            DEC $13            ; $c329: c6 13     
            LDX $26            ; $c32b: a6 26     
            CPX #$02           ; $c32d: e0 02     
            BNE __c338         ; $c32f: d0 07     
            LDX #$00           ; $c331: a2 00     
            JSR __c38d         ; $c333: 20 8d c3  
            LDX #$01           ; $c336: a2 01     
__c338:     JSR __c38d         ; $c338: 20 8d c3  
            JSR __ecbf         ; $c33b: 20 bf ec  
            LDA $13            ; $c33e: a5 13     
            CMP #$20           ; $c340: c9 20     
            BCS __c38c         ; $c342: b0 48     
            LDA #$03           ; $c344: a9 03     
            JMP __c218         ; $c346: 4c 18 c2  

;-------------------------------------------------------------------------------
__c349:     DEX                ; $c349: ca        
            BNE __c353         ; $c34a: d0 07     
            INC $57            ; $c34c: e6 57     
            LDX #$0a           ; $c34e: a2 0a     
            JMP __f691         ; $c350: 4c 91 f6  

;-------------------------------------------------------------------------------
__c353:     LDA #$00           ; $c353: a9 00     
            STA $6a            ; $c355: 85 6a     
            STA $6b            ; $c357: 85 6b     
            STA $5a            ; $c359: 85 5a     
            STA $5b            ; $c35b: 85 5b     
            STA $0352          ; $c35d: 8d 52 03  
            STA $0353          ; $c360: 8d 53 03  
            LDX $26            ; $c363: a6 26     
            CPX #$02           ; $c365: e0 02     
            BNE __c370         ; $c367: d0 07     
            LDX #$00           ; $c369: a2 00     
            JSR __c399         ; $c36b: 20 99 c3  
            LDX #$01           ; $c36e: a2 01     
__c370:     JSR __c399         ; $c370: 20 99 c3  
            LDA #$15           ; $c373: a9 15     
            STA $d7            ; $c375: 85 d7     
            LDA #$00           ; $c377: a9 00     
            STA $d5            ; $c379: 85 d5     
            STA $d4            ; $c37b: 85 d4     
            JSR __f60f         ; $c37d: 20 0f f6  
            JSR __f6f2         ; $c380: 20 f2 f6  
            JSR __e562         ; $c383: 20 62 e5  
            LDA #$04           ; $c386: a9 04     
            STA $fb            ; $c388: 85 fb     
            INC $51            ; $c38a: e6 51     
__c38c:     RTS                ; $c38c: 60        

;-------------------------------------------------------------------------------
__c38d:     INC $66,x          ; $c38d: f6 66     
            INC $66,x          ; $c38f: f6 66     
            LDA #$00           ; $c391: a9 00     
            STA $70,x          ; $c393: 95 70     
            STA $6c,x          ; $c395: 95 6c     
            BEQ __c39f         ; $c397: f0 06     
__c399:     LDA #$01           ; $c399: a9 01     
            STA $6a,x          ; $c39b: 95 6a     
            STA $5a,x          ; $c39d: 95 5a     
__c39f:     STX $5f            ; $c39f: 86 5f     
            JMP __cdff         ; $c3a1: 4c ff cd  

;-------------------------------------------------------------------------------
            LDA $57            ; $c3a4: a5 57     
            CMP #$06           ; $c3a6: c9 06     
            BEQ __c3cc         ; $c3a8: f0 22     
            JSR __c1d7         ; $c3aa: 20 d7 c1  
            LDA $57            ; $c3ad: a5 57     
            CMP #$05           ; $c3af: c9 05     
            BNE __c3cb         ; $c3b1: d0 18     
            LDA $53            ; $c3b3: a5 53     
            BNE __c3c1         ; $c3b5: d0 0a     
            LDA #$00           ; $c3b7: a9 00     
            LDX #$0e           ; $c3b9: a2 0e     
__c3bb:     STA $07f0,x        ; $c3bb: 9d f0 07  
            DEX                ; $c3be: ca        
            BPL __c3bb         ; $c3bf: 10 fa     
__c3c1:     JSR __c81d         ; $c3c1: 20 1d c8  
            JSR __f60f         ; $c3c4: 20 0f f6  
            INC $57            ; $c3c7: e6 57     
            DEC $51            ; $c3c9: c6 51     
__c3cb:     RTS                ; $c3cb: 60        

;-------------------------------------------------------------------------------
__c3cc:     LDX #$0a           ; $c3cc: a2 0a     
            JSR __f691         ; $c3ce: 20 91 f6  
            LDA #$70           ; $c3d1: a9 70     
            STA $d6            ; $c3d3: 85 d6     
            ASL                ; $c3d5: 0a        
            STA $d7            ; $c3d6: 85 d7     
            LDA #$00           ; $c3d8: a9 00     
            STA $d4            ; $c3da: 85 d4     
            STA $d5            ; $c3dc: 85 d5     
            LDA #$04           ; $c3de: a9 04     
            STA $1f            ; $c3e0: 85 1f     
            LSR                ; $c3e2: 4a        
            STA $7a            ; $c3e3: 85 7a     
            JMP __c2a7         ; $c3e5: 4c a7 c2  

;-------------------------------------------------------------------------------
            LDA $d7            ; $c3e8: a5 d7     
            CMP #$1d           ; $c3ea: c9 1d     
            BCC __c423         ; $c3ec: 90 35     
            CMP #$80           ; $c3ee: c9 80     
            BNE __c419         ; $c3f0: d0 27     
            DEC $13            ; $c3f2: c6 13     
            DEC $13            ; $c3f4: c6 13     
            JSR __d8ea         ; $c3f6: 20 ea d8  
            LDA $13            ; $c3f9: a5 13     
            CMP #$02           ; $c3fb: c9 02     
            BCS __c40b         ; $c3fd: b0 0c     
            LDX $7a            ; $c3ff: a6 7a     
            BEQ __c419         ; $c401: f0 16     
            LDA #$03           ; $c403: a9 03     
            DEX                ; $c405: ca        
            BEQ __c409         ; $c406: f0 01     
            ASL                ; $c408: 0a        
__c409:     STA $52            ; $c409: 85 52     
__c40b:     DEC $1f            ; $c40b: c6 1f     
            BNE __c416         ; $c40d: d0 07     
            LDA #$04           ; $c40f: a9 04     
            STA $1f            ; $c411: 85 1f     
            JSR __f2ec         ; $c413: 20 ec f2  
__c416:     JMP __c41d         ; $c416: 4c 1d c4  

;-------------------------------------------------------------------------------
__c419:     DEC $d7            ; $c419: c6 d7     
            DEC $d7            ; $c41b: c6 d7     
__c41d:     JSR __f737         ; $c41d: 20 37 f7  
            JMP __f67e         ; $c420: 4c 7e f6  

;-------------------------------------------------------------------------------
__c423:     LDA $46            ; $c423: a5 46     
            BNE __c42b         ; $c425: d0 04     
            LDA #$10           ; $c427: a9 10     
            STA $46            ; $c429: 85 46     
__c42b:     CMP #$01           ; $c42b: c9 01     
            BNE __c436         ; $c42d: d0 07     
            LDA #$01           ; $c42f: a9 01     
            JSR __d4f5         ; $c431: 20 f5 d4  
            DEC $54            ; $c434: c6 54     
__c436:     RTS                ; $c436: 60        

;-------------------------------------------------------------------------------
__c437:     LDA $34            ; $c437: a5 34     
            BNE __c436         ; $c439: d0 fb     
            JSR __c726         ; $c43b: 20 26 c7  
            ROR $c1            ; $c43e: 66 c1     
            .hex d7 c1         ; $c440: d7 c1     Invalid Opcode - DCP $c1,x
            SBC $adc2          ; $c442: ed c2 ad  
            .hex c2 b0         ; $c445: c2 b0     Invalid Opcode - NOP #$b0
            .hex c2 a4         ; $c447: c2 a4     Invalid Opcode - NOP #$a4
            .hex c3            ; $c449: c3        Suspected data
__c44a:     LDA #$00           ; $c44a: a9 00     
            STA $57            ; $c44c: 85 57     
            JSR __c726         ; $c44e: 20 26 c7  
            RTS                ; $c451: 60        

;-------------------------------------------------------------------------------
            CPY $fb            ; $c452: c4 fb     
            .hex cb 9e         ; $c454: cb 9e     Invalid Opcode - AXS #$9e
            CPY __cc67         ; $c456: cc 67 cc  
            JMP (__e8cc)       ; $c459: 6c cc e8  

;-------------------------------------------------------------------------------
            .hex c3            ; $c45c: c3        Suspected data
__c45d:     .hex 6f 00 38      ; $c45d: 6f 00 38  Invalid Opcode - RRA $3800
            LDA $59            ; $c460: a5 59     
            AND #$1f           ; $c462: 29 1f     
            STA $59            ; $c464: 85 59     
            JSR __f53e         ; $c466: 20 3e f5  
            LDA $4e            ; $c469: a5 4e     
            BNE __c484         ; $c46b: d0 17     
            STA $4015          ; $c46d: 8d 15 40  
            STA $58            ; $c470: 85 58     
            LDA $59            ; $c472: a5 59     
            STA $03fe          ; $c474: 8d fe 03  
            LDA $03fd          ; $c477: ad fd 03  
            AND #$03           ; $c47a: 29 03     
            STA $59            ; $c47c: 85 59     
            LDA #$01           ; $c47e: a9 01     
            STA $53            ; $c480: 85 53     
            BNE __c4a4         ; $c482: d0 20     
__c484:     LDA $4d            ; $c484: a5 4d     
            CMP #$01           ; $c486: c9 01     
            BNE __c490         ; $c488: d0 06     
            LSR                ; $c48a: 4a        
            STA $4d            ; $c48b: 85 4d     
            ROR                ; $c48d: 6a        
            STA $fb            ; $c48e: 85 fb     
__c490:     LDA $15            ; $c490: a5 15     
            AND #$20           ; $c492: 29 20     
            BEQ __c49e         ; $c494: f0 08     
            JSR __c4ba         ; $c496: 20 ba c4  
            LDA #$80           ; $c499: a9 80     
            STA $4e            ; $c49b: 85 4e     
            RTS                ; $c49d: 60        

;-------------------------------------------------------------------------------
__c49e:     LDA $15            ; $c49e: a5 15     
            AND #$10           ; $c4a0: 29 10     
            BEQ __c4b9         ; $c4a2: f0 15     
__c4a4:     LDA #$05           ; $c4a4: a9 05     
            JSR __d4f5         ; $c4a6: 20 f5 d4  
            LDA #$01           ; $c4a9: a9 01     
            STA $fb            ; $c4ab: 85 fb     
            LDA #$03           ; $c4ad: a9 03     
            STA $20            ; $c4af: 85 20     
            LDY $58            ; $c4b1: a4 58     
            BNE __c4b7         ; $c4b3: d0 02     
            LDA #$fc           ; $c4b5: a9 fc     
__c4b7:     STA $21            ; $c4b7: 85 21     
__c4b9:     RTS                ; $c4b9: 60        

;-------------------------------------------------------------------------------
__c4ba:     LDA $58            ; $c4ba: a5 58     
            EOR #$01           ; $c4bc: 49 01     
            STA $58            ; $c4be: 85 58     
__c4c0:     LDA #$7f           ; $c4c0: a9 7f     
            LDY $58            ; $c4c2: a4 58     
            BEQ __c4c8         ; $c4c4: f0 02     
            LDA #$8f           ; $c4c6: a9 8f     
__c4c8:     STA $0200          ; $c4c8: 8d 00 02  
            LDX #$02           ; $c4cb: a2 02     
__c4cd:     LDA __c45d,x       ; $c4cd: bd 5d c4  
            STA $0201,x        ; $c4d0: 9d 01 02  
            DEX                ; $c4d3: ca        
            BPL __c4cd         ; $c4d4: 10 f7     
            RTS                ; $c4d6: 60        

;-------------------------------------------------------------------------------
__c4d7:     LDY #$17           ; $c4d7: a0 17     
__c4d9:     LDA #$00           ; $c4d9: a9 00     
            STA $04c0,y        ; $c4db: 99 c0 04  
            LDA #$ff           ; $c4de: a9 ff     
            STA $05c0,y        ; $c4e0: 99 c0 05  
            DEY                ; $c4e3: 88        
            BPL __c4d9         ; $c4e4: 10 f3     
            LDY #$01           ; $c4e6: a0 01     
__c4e8:     STA $04c3,y        ; $c4e8: 99 c3 04  
            STA $04cb,y        ; $c4eb: 99 cb 04  
            STA $04d3,y        ; $c4ee: 99 d3 04  
            DEY                ; $c4f1: 88        
            BPL __c4e8         ; $c4f2: 10 f4     
            LDX #$00           ; $c4f4: a2 00     
__c4f6:     LDA #$00           ; $c4f6: a9 00     
            STA $0430,x        ; $c4f8: 9d 30 04  
            STA $0447,x        ; $c4fb: 9d 47 04  
            CPX #$48           ; $c4fe: e0 48     
            BCC __c508         ; $c500: 90 06     
            STA $0431,x        ; $c502: 9d 31 04  
            STA $0446,x        ; $c505: 9d 46 04  
__c508:     TXA                ; $c508: 8a        
            CLC                ; $c509: 18        
            ADC #$18           ; $c50a: 69 18     
            TAX                ; $c50c: aa        
            CPX #$90           ; $c50d: e0 90     
            BCC __c4f6         ; $c50f: 90 e5     
            RTS                ; $c511: 60        

;-------------------------------------------------------------------------------
__c512:     BRK                ; $c512: 00        
__c513:     BRK                ; $c513: 00        
__c514:     BRK                ; $c514: 00        
            .hex ff ff ff      ; $c515: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex f3 e7         ; $c518: f3 e7     Invalid Opcode - ISC ($e7),y
            .hex cf 33 33      ; $c51a: cf 33 33  Invalid Opcode - DCP $3333
            .hex 33            ; $c51d: 33        Suspected data
__c51e:     .hex 0f 0f 0f      ; $c51e: 0f 0f 0f  Invalid Opcode - SLO $0f0f
            .hex 33 00         ; $c521: 33 00     Invalid Opcode - RLA ($00),y
            CPY $0fff          ; $c523: cc ff 0f  
            .hex ff c3 fc      ; $c526: ff c3 fc  Invalid Opcode - ISC __fcc3,x
            .hex 3f f0 f0      ; $c529: 3f f0 f0  Invalid Opcode - RLA __f0f0,x
            BEQ __c51e         ; $c52c: f0 f0     
            BRK                ; $c52e: 00        
            .hex 0f cf cf      ; $c52f: 0f cf cf  Invalid Opcode - SLO __cfcf
            .hex 3f f0 00      ; $c532: 3f f0 00  Bad Addr Mode - RLA $00f0,x
            .hex ff cc cc      ; $c535: ff cc cc  Invalid Opcode - ISC __cccc,x
            CPY $33f3          ; $c538: cc f3 33  
            BRK                ; $c53b: 00        
            .hex fc fc ff      ; $c53c: fc fc ff  Invalid Opcode - NOP $fffc,x
            .hex fc 00 3f      ; $c53f: fc 00 3f  Invalid Opcode - NOP $3f00,x
__c542:     JSR __e72b         ; $c542: 20 2b e7  
            LDA #$bf           ; $c545: a9 bf     
            STA $0c            ; $c547: 85 0c     
            LDA #$00           ; $c549: a9 00     
            STA $0d            ; $c54b: 85 0d     
            LDA #$04           ; $c54d: a9 04     
            STA $0e            ; $c54f: 85 0e     
            LDX #$07           ; $c551: a2 07     
__c553:     LDA $04,x          ; $c553: b5 04     
            ASL                ; $c555: 0a        
            CLC                ; $c556: 18        
            ADC $04,x          ; $c557: 75 04     
            TAY                ; $c559: a8        
            LDA __c512,y       ; $c55a: b9 12 c5  
            STA $00            ; $c55d: 85 00     
            LDA __c513,y       ; $c55f: b9 13 c5  
            STA $01            ; $c562: 85 01     
            LDA __c514,y       ; $c564: b9 14 c5  
            STA $02            ; $c567: 85 02     
            LDY $0c            ; $c569: a4 0c     
            LDA #$01           ; $c56b: a9 01     
            STA $1f            ; $c56d: 85 1f     
            JSR __c5d3         ; $c56f: 20 d3 c5  
            STY $0c            ; $c572: 84 0c     
            DEX                ; $c574: ca        
            BPL __c553         ; $c575: 10 dc     
            LDX #$c0           ; $c577: a2 c0     
__c579:     LDA #$00           ; $c579: a9 00     
            ASL $0785          ; $c57b: 0e 85 07  
            BCS __c582         ; $c57e: b0 02     
            LDA #$01           ; $c580: a9 01     
__c582:     STA $00            ; $c582: 85 00     
            LDY #$18           ; $c584: a0 18     
__c586:     LDA $03ff,x        ; $c586: bd ff 03  
            BMI __c592         ; $c589: 30 07     
            LDA $00            ; $c58b: a5 00     
            STA $03ff,x        ; $c58d: 9d ff 03  
            BNE __c597         ; $c590: d0 05     
__c592:     LDA #$ff           ; $c592: a9 ff     
            STA $04ff,x        ; $c594: 9d ff 04  
__c597:     DEX                ; $c597: ca        
            BEQ __c5d2         ; $c598: f0 38     
            DEY                ; $c59a: 88        
            BNE __c586         ; $c59b: d0 e9     
            BEQ __c579         ; $c59d: f0 da     
__c59f:     BEQ __c5b0         ; $c59f: f0 0f     
            .hex e7 3c         ; $c5a1: e7 3c     Invalid Opcode - ISC $3c
            .hex fc 3f cf      ; $c5a3: fc 3f cf  Invalid Opcode - NOP __cf3f,x
            .hex e3            ; $c5a6: e3        Suspected data
__c5a7:     LDY #$d7           ; $c5a7: a0 d7     
__c5a9:     TYA                ; $c5a9: 98        
            PHA                ; $c5aa: 48        
            JSR __cace         ; $c5ab: 20 ce ca  
            LDX #$02           ; $c5ae: a2 02     
__c5b0:     LDA $18,x          ; $c5b0: b5 18     
            AND #$07           ; $c5b2: 29 07     
            TAY                ; $c5b4: a8        
            LDA __c59f,y       ; $c5b5: b9 9f c5  
            STA $00,x          ; $c5b8: 95 00     
            DEX                ; $c5ba: ca        
            BPL __c5b0         ; $c5bb: 10 f3     
            PLA                ; $c5bd: 68        
            TAY                ; $c5be: a8        
            LDA #$00           ; $c5bf: a9 00     
            STA $0d            ; $c5c1: 85 0d     
            LDA #$05           ; $c5c3: a9 05     
            STA $0e            ; $c5c5: 85 0e     
            LDA #$00           ; $c5c7: a9 00     
            STA $1f            ; $c5c9: 85 1f     
            JSR __c5d3         ; $c5cb: 20 d3 c5  
            CPY #$ff           ; $c5ce: c0 ff     
            BNE __c5a9         ; $c5d0: d0 d7     
__c5d2:     RTS                ; $c5d2: 60        

;-------------------------------------------------------------------------------
__c5d3:     LDA #$00           ; $c5d3: a9 00     
            STA $0f            ; $c5d5: 85 0f     
            LDA #$18           ; $c5d7: a9 18     
            STA $03            ; $c5d9: 85 03     
__c5db:     LSR $00            ; $c5db: 46 00     
            ROR $01            ; $c5dd: 66 01     
            ROR $02            ; $c5df: 66 02     
            PHP                ; $c5e1: 08        
            LDA $1f            ; $c5e2: a5 1f     
            BNE __c5ed         ; $c5e4: d0 07     
            LDA $0f            ; $c5e6: a5 0f     
            BEQ __c5ef         ; $c5e8: f0 05     
            LDA #$01           ; $c5ea: a9 01     
            .hex 2c            ; $c5ec: 2c        Suspected data
__c5ed:     LDA #$00           ; $c5ed: a9 00     
__c5ef:     ROL                ; $c5ef: 2a        
            BEQ __c5fc         ; $c5f0: f0 0a     
            CMP #$03           ; $c5f2: c9 03     
            BCS __c5f9         ; $c5f4: b0 03     
            LDA #$02           ; $c5f6: a9 02     
            .hex 2c            ; $c5f8: 2c        Suspected data
__c5f9:     LDA #$01           ; $c5f9: a9 01     
            .hex 2c            ; $c5fb: 2c        Suspected data
__c5fc:     LDA #$ff           ; $c5fc: a9 ff     
            STA ($0d),y        ; $c5fe: 91 0d     
            PLP                ; $c600: 28        
            BCS __c608         ; $c601: b0 05     
            LDA #$00           ; $c603: a9 00     
            STA $0f            ; $c605: 85 0f     
            .hex 2c            ; $c607: 2c        Suspected data
__c608:     INC $0f            ; $c608: e6 0f     
            DEY                ; $c60a: 88        
            DEC $03            ; $c60b: c6 03     
            BNE __c5db         ; $c60d: d0 cc     
__c60f:     RTS                ; $c60f: 60        

;-------------------------------------------------------------------------------
__c610:     ORA ($22),y        ; $c610: 11 22     
            ORA ($38),y        ; $c612: 11 38     
            AND #$28           ; $c614: 29 28     
            ORA $1a21,y        ; $c616: 19 21 1a  
            PLP                ; $c619: 28        
            ROL                ; $c61a: 2a        
            .hex 12            ; $c61b: 12        Invalid Opcode - KIL 
            ROL                ; $c61c: 2a        
            .hex 22            ; $c61d: 22        Invalid Opcode - KIL 
            .hex 14 12         ; $c61e: 14 12     Invalid Opcode - NOP $12,x
__c620:     LDA $14            ; $c620: a5 14     
            AND #$30           ; $c622: 29 30     
            BEQ __c63a         ; $c624: f0 14     
__c626:     LDA $03fe          ; $c626: ad fe 03  
            STA $59            ; $c629: 85 59     
            LDA #$0f           ; $c62b: a9 0f     
            STA $4015          ; $c62d: 8d 15 40  
            LDA #$00           ; $c630: a9 00     
            STA $53            ; $c632: 85 53     
            INC $03fd          ; $c634: ee fd 03  
            JMP __d4f5         ; $c637: 4c f5 d4  

;-------------------------------------------------------------------------------
__c63a:     LDA $55            ; $c63a: a5 55     
            CMP #$01           ; $c63c: c9 01     
            BNE __c60f         ; $c63e: d0 cf     
            LDA $51            ; $c640: a5 51     
            BEQ __c60f         ; $c642: f0 cb     
            LDA $66            ; $c644: a5 66     
            CMP #$d4           ; $c646: c9 d4     
            BCS __c626         ; $c648: b0 dc     
            LDA $03fa          ; $c64a: ad fa 03  
            AND #$0f           ; $c64d: 29 0f     
            TAX                ; $c64f: aa        
            LDA __c610,x       ; $c650: bd 10 c6  
            LDY __c60f,x       ; $c653: bc 0f c6  
            LDX $03fb          ; $c656: ae fb 03  
            BNE __c664         ; $c659: d0 09     
            TAY                ; $c65b: a8        
            AND #$f0           ; $c65c: 29 f0     
            STA $03fb          ; $c65e: 8d fb 03  
            INC $03fa          ; $c661: ee fa 03  
__c664:     TYA                ; $c664: 98        
            AND #$0f           ; $c665: 29 0f     
            STA $14            ; $c667: 85 14     
            TYA                ; $c669: 98        
            ASL                ; $c66a: 0a        
            ASL                ; $c66b: 0a        
            ASL                ; $c66c: 0a        
            ASL                ; $c66d: 0a        
            ORA $14            ; $c66e: 05 14     
            AND #$c3           ; $c670: 29 c3     
            STA $14            ; $c672: 85 14     
            STA $15            ; $c674: 85 15     
            LDA $50            ; $c676: a5 50     
            AND #$01           ; $c678: 29 01     
            BNE __c67f         ; $c67a: d0 03     
__c67c:     DEC $03fb          ; $c67c: ce fb 03  
__c67f:     RTS                ; $c67f: 60        

;-------------------------------------------------------------------------------
__c680:     .hex 22            ; $c680: 22        Invalid Opcode - KIL 
            .hex cd 05 00      ; $c681: cd 05 00  Bad Addr Mode - CMP $0005
            .hex 23 06         ; $c684: 23 06     Invalid Opcode - RLA ($06,x)
            ORA $00            ; $c686: 05 00     
            .hex 23 14         ; $c688: 23 14     Invalid Opcode - RLA ($14,x)
            ORA $00            ; $c68a: 05 00     
            PLP                ; $c68c: 28        
            .hex c3 04         ; $c68d: c3 04     Invalid Opcode - DCP ($04,x)
            BRK                ; $c68f: 00        
            JSR $04c3          ; $c690: 20 c3 04  
            BRK                ; $c693: 00        
            .hex 3f 00 20      ; $c694: 3f 00 20  Invalid Opcode - RLA $2000,x
            .hex 0f 30 21      ; $c697: 0f 30 21  Invalid Opcode - SLO $2130
            ORA ($0f,x)        ; $c69a: 01 0f     
            ROL $2a            ; $c69c: 26 2a     
            BMI __c6af         ; $c69e: 30 0f     
            SEC                ; $c6a0: 38        
            AND #$0a           ; $c6a1: 29 0a     
            .hex 0f 27 17      ; $c6a3: 0f 27 17  Invalid Opcode - SLO $1727
            .hex 07 0f         ; $c6a6: 07 0f     Invalid Opcode - SLO $0f
            BMI __c6bb         ; $c6a8: 30 11     
            ROL $0f            ; $c6aa: 26 0f     
            BMI __c6c3         ; $c6ac: 30 15     
            .hex 26            ; $c6ae: 26        Suspected data
__c6af:     .hex 0f 30 21      ; $c6af: 0f 30 21  Invalid Opcode - SLO $2130
            .hex 12            ; $c6b2: 12        Invalid Opcode - KIL 
            .hex 0f 38 29      ; $c6b3: 0f 38 29  Invalid Opcode - SLO $2938
            ASL                ; $c6b6: 0a        
            BRK                ; $c6b7: 00        
            .hex 23 e8         ; $c6b8: 23 e8     Invalid Opcode - RLA ($e8,x)
            CLI                ; $c6ba: 58        
__c6bb:     .hex ff 23 e0      ; $c6bb: ff 23 e0  Invalid Opcode - ISC __e023,x
            .hex 02            ; $c6be: 02        Invalid Opcode - KIL 
            BEQ __c6f1         ; $c6bf: f0 30     
            .hex 23 e6         ; $c6c1: 23 e6     Invalid Opcode - RLA ($e6,x)
__c6c3:     .hex 02            ; $c6c3: 02        Invalid Opcode - KIL 
            CPY #$f0           ; $c6c4: c0 f0     
            .hex 2b c0         ; $c6c6: 2b c0     Invalid Opcode - ANC #$c0
            PHA                ; $c6c8: 48        
            .hex ff 2b c8      ; $c6c9: ff 2b c8  Invalid Opcode - ISC __c82b,x
            PHA                ; $c6cc: 48        
            .hex af 2b d0      ; $c6cd: af 2b d0  Invalid Opcode - LAX __d02b
            BVC __c67c         ; $c6d0: 50 aa     
            .hex 2b e0         ; $c6d2: 2b e0     Invalid Opcode - ANC #$e0
            PHA                ; $c6d4: 48        
            ASL                ; $c6d5: 0a        
            .hex 2b c9         ; $c6d6: 2b c9     Invalid Opcode - ANC #$c9
            LSR $ff            ; $c6d8: 46 ff     
            ROL                ; $c6da: 2a        
            RTI                ; $c6db: 40        

;-------------------------------------------------------------------------------
            RTS                ; $c6dc: 60        

;-------------------------------------------------------------------------------
            AND ($2a),y        ; $c6dd: 31 2a     
            RTS                ; $c6df: 60        

;-------------------------------------------------------------------------------
            .hex 7f 32 00      ; $c6e0: 7f 32 00  Bad Addr Mode - RRA $0032,x
            .hex 23 e0         ; $c6e3: 23 e0     Invalid Opcode - RLA ($e0,x)
            RTS                ; $c6e5: 60        

;-------------------------------------------------------------------------------
            BRK                ; $c6e6: 00        
            .hex 23 c8         ; $c6e7: 23 c8     Invalid Opcode - RLA ($c8,x)
            .hex 02            ; $c6e9: 02        Invalid Opcode - KIL 
            .hex 44 55         ; $c6ea: 44 55     Invalid Opcode - NOP $55
            BRK                ; $c6ec: 00        
            .hex 2b c0         ; $c6ed: 2b c0     Invalid Opcode - ANC #$c0
            ADC ($00),y        ; $c6ef: 71 00     
__c6f1:     .hex 2b c8         ; $c6f1: 2b c8     Invalid Opcode - ANC #$c8
            .hex 02            ; $c6f3: 02        Invalid Opcode - KIL 
            .hex 44 55         ; $c6f4: 44 55     Invalid Opcode - NOP $55
            BRK                ; $c6f6: 00        
__c6f7:     LDY #$04           ; $c6f7: a0 04     
__c6f9:     BPL __c70d         ; $c6f9: 10 12     
__c6fb:     JSR __c891         ; $c6fb: 20 91 c8  
            LDA __c6f9,x       ; $c6fe: bd f9 c6  
            STA $2006          ; $c701: 8d 06 20  
            LDA __c6f7,x       ; $c704: bd f7 c6  
            STA $2006          ; $c707: 8d 06 20  
            LDA $2007          ; $c70a: ad 07 20  
__c70d:     LDA #$00           ; $c70d: a9 00     
            STA $00            ; $c70f: 85 00     
            TAY                ; $c711: a8        
            LDA #$04           ; $c712: a9 04     
            STA $01            ; $c714: 85 01     
            LDX #$02           ; $c716: a2 02     
__c718:     LDA $2007          ; $c718: ad 07 20  
            STA ($00),y        ; $c71b: 91 00     
            INY                ; $c71d: c8        
            BNE __c718         ; $c71e: d0 f8     
            INC $01            ; $c720: e6 01     
            DEX                ; $c722: ca        
            BNE __c718         ; $c723: d0 f3     
            RTS                ; $c725: 60        

;-------------------------------------------------------------------------------
__c726:     LDA $55            ; $c726: a5 55     
__c728:     ASL                ; $c728: 0a        
            TAY                ; $c729: a8        
            PLA                ; $c72a: 68        
            STA $00            ; $c72b: 85 00     
            PLA                ; $c72d: 68        
            STA $01            ; $c72e: 85 01     
            INY                ; $c730: c8        
            LDA ($00),y        ; $c731: b1 00     
            STA $02            ; $c733: 85 02     
            INY                ; $c735: c8        
            LDA ($00),y        ; $c736: b1 00     
            STA $03            ; $c738: 85 03     
            JMP ($0002)        ; $c73a: 6c 02 00  

;-------------------------------------------------------------------------------
            STA $03            ; $c73d: 85 03     
            TXA                ; $c73f: 8a        
            PHA                ; $c740: 48        
            TYA                ; $c741: 98        
            PHA                ; $c742: 48        
            LDA #$02           ; $c743: a9 02     
            STA $05            ; $c745: 85 05     
            LDA #$0f           ; $c747: a9 0f     
            AND $03            ; $c749: 25 03     
            STA $07            ; $c74b: 85 07     
            LDA $03            ; $c74d: a5 03     
            LSR                ; $c74f: 4a        
            LSR                ; $c750: 4a        
            LSR                ; $c751: 4a        
            LSR                ; $c752: 4a        
            STA $06            ; $c753: 85 06     
            TAX                ; $c755: aa        
            LDA #$00           ; $c756: a9 00     
            CLC                ; $c758: 18        
__c759:     ADC $07            ; $c759: 65 07     
            DEX                ; $c75b: ca        
            BNE __c759         ; $c75c: d0 fb     
            STA $08            ; $c75e: 85 08     
            TAX                ; $c760: aa        
            LDA $0e            ; $c761: a5 0e     
            BEQ __c76f         ; $c763: f0 0a     
            JSR __c777         ; $c765: 20 77 c7  
            LDA $0f            ; $c768: a5 0f     
            BEQ __c76f         ; $c76a: f0 03     
            JSR __c7c1         ; $c76c: 20 c1 c7  
__c76f:     JSR __c7f5         ; $c76f: 20 f5 c7  
            PLA                ; $c772: 68        
            TAY                ; $c773: a8        
            PLA                ; $c774: 68        
            TAX                ; $c775: aa        
            RTS                ; $c776: 60        

;-------------------------------------------------------------------------------
__c777:     LDA $02            ; $c777: a5 02     
            LDY #$01           ; $c779: a0 01     
__c77b:     STA ($04),y        ; $c77b: 91 04     
            CLC                ; $c77d: 18        
            ADC #$01           ; $c77e: 69 01     
            INY                ; $c780: c8        
            PHA                ; $c781: 48        
            LDA ($04),y        ; $c782: b1 04     
            AND #$3f           ; $c784: 29 3f     
            STA ($04),y        ; $c786: 91 04     
            TXA                ; $c788: 8a        
            PHA                ; $c789: 48        
            LDA $0d            ; $c78a: a5 0d     
            AND #$03           ; $c78c: 29 03     
            LDX $09            ; $c78e: a6 09     
            CPX #$03           ; $c790: e0 03     
            BMI __c7a5         ; $c792: 30 11     
            CPX #$18           ; $c794: e0 18     
            BCS __c7a5         ; $c796: b0 0d     
            LDX $55            ; $c798: a6 55     
            DEX                ; $c79a: ca        
            BNE __c7a5         ; $c79b: d0 08     
            LDX $09            ; $c79d: a6 09     
            CPX #$03           ; $c79f: e0 03     
            BEQ __c7a5         ; $c7a1: f0 02     
            ORA #$20           ; $c7a3: 09 20     
__c7a5:     STA ($04),y        ; $c7a5: 91 04     
            PLA                ; $c7a7: 68        
            TAX                ; $c7a8: aa        
            LSR $0a            ; $c7a9: 46 0a     
            ROR $0b            ; $c7ab: 66 0b     
            ROR $0c            ; $c7ad: 66 0c     
            ROR $0d            ; $c7af: 66 0d     
            LSR $0a            ; $c7b1: 46 0a     
            ROR $0b            ; $c7b3: 66 0b     
            ROR $0c            ; $c7b5: 66 0c     
            ROR $0d            ; $c7b7: 66 0d     
            PLA                ; $c7b9: 68        
            INY                ; $c7ba: c8        
            INY                ; $c7bb: c8        
            INY                ; $c7bc: c8        
            DEX                ; $c7bd: ca        
            BNE __c77b         ; $c7be: d0 bb     
            RTS                ; $c7c0: 60        

;-------------------------------------------------------------------------------
__c7c1:     LDY #$01           ; $c7c1: a0 01     
            .hex 84            ; $c7c3: 84        Suspected data
__c7c4:     ASL                ; $c7c4: 0a        
            LDA $08            ; $c7c5: a5 08     
            SEC                ; $c7c7: 38        
            SBC $06            ; $c7c8: e5 06     
__c7ca:     TAY                ; $c7ca: a8        
            STA $0b            ; $c7cb: 85 0b     
            LDX $06            ; $c7cd: a6 06     
__c7cf:     TYA                ; $c7cf: 98        
            PHA                ; $c7d0: 48        
            CLC                ; $c7d1: 18        
            TYA                ; $c7d2: 98        
            ADC $02            ; $c7d3: 65 02     
            LDY $0a            ; $c7d5: a4 0a     
            STA ($04),y        ; $c7d7: 91 04     
            INY                ; $c7d9: c8        
            LDA ($04),y        ; $c7da: b1 04     
            AND #$3f           ; $c7dc: 29 3f     
            EOR #$40           ; $c7de: 49 40     
            STA ($04),y        ; $c7e0: 91 04     
            INY                ; $c7e2: c8        
            INY                ; $c7e3: c8        
            INY                ; $c7e4: c8        
            STY $0a            ; $c7e5: 84 0a     
            PLA                ; $c7e7: 68        
            TAY                ; $c7e8: a8        
            INY                ; $c7e9: c8        
            DEX                ; $c7ea: ca        
            BNE __c7cf         ; $c7eb: d0 e2     
            LDA $0b            ; $c7ed: a5 0b     
            SEC                ; $c7ef: 38        
            SBC $06            ; $c7f0: e5 06     
            BPL __c7ca         ; $c7f2: 10 d6     
            RTS                ; $c7f4: 60        

;-------------------------------------------------------------------------------
__c7f5:     LDY #$00           ; $c7f5: a0 00     
__c7f7:     LDX $06            ; $c7f7: a6 06     
            LDA $01            ; $c7f9: a5 01     
            STA $09            ; $c7fb: 85 09     
__c7fd:     LDA $09            ; $c7fd: a5 09     
            STA ($04),y        ; $c7ff: 91 04     
            CLC                ; $c801: 18        
            ADC #$08           ; $c802: 69 08     
            STA $09            ; $c804: 85 09     
            INY                ; $c806: c8        
            INY                ; $c807: c8        
            INY                ; $c808: c8        
            LDA $00            ; $c809: a5 00     
            STA ($04),y        ; $c80b: 91 04     
            INY                ; $c80d: c8        
            DEX                ; $c80e: ca        
            BNE __c7fd         ; $c80f: d0 ec     
            LDA $00            ; $c811: a5 00     
            CLC                ; $c813: 18        
            ADC #$08           ; $c814: 69 08     
            STA $00            ; $c816: 85 00     
            DEC $07            ; $c818: c6 07     
            BNE __c7f7         ; $c81a: d0 db     
            RTS                ; $c81c: 60        

;-------------------------------------------------------------------------------
__c81d:     LDX #$40           ; $c81d: a2 40     
            LDA #$00           ; $c81f: a9 00     
__c821:     STA $04            ; $c821: 85 04     
            LDA #$02           ; $c823: a9 02     
            STA $05            ; $c825: 85 05     
            LDY #$00           ; $c827: a0 00     
__c829:     LDA #$f8           ; $c829: a9 f8     
            STA ($04),y        ; $c82b: 91 04     
            INY                ; $c82d: c8        
            INY                ; $c82e: c8        
            LDA #$00           ; $c82f: a9 00     
            STA ($04),y        ; $c831: 91 04     
            INY                ; $c833: c8        
            INY                ; $c834: c8        
            DEX                ; $c835: ca        
            BNE __c829         ; $c836: d0 f1     
            RTS                ; $c838: 60        

;-------------------------------------------------------------------------------
__c839:     .hex 22            ; $c839: 22        Invalid Opcode - KIL 
            .hex 17 22         ; $c83a: 17 22     Invalid Opcode - SLO $22,x
            .hex 27            ; $c83c: 27        Suspected data
__c83d:     STX $0f            ; $c83d: 86 0f     
            TAX                ; $c83f: aa        
            LDA $e0,x          ; $c840: b5 e0     
            BNE __c853         ; $c842: d0 0f     
            STA $e6,x          ; $c844: 95 e6     
            LDA #$08           ; $c846: a9 08     
            STA $e8,x          ; $c848: 95 e8     
            LDA #$f0           ; $c84a: a9 f0     
            STA $ea,x          ; $c84c: 95 ea     
            INC $e0,x          ; $c84e: f6 e0     
            JMP __c868         ; $c850: 4c 68 c8  

;-------------------------------------------------------------------------------
__c853:     LDA $e6,x          ; $c853: b5 e6     
            CMP #$08           ; $c855: c9 08     
            BCS __c868         ; $c857: b0 0f     
            LDY $2f,x          ; $c859: b4 2f     
            LDA $e8,x          ; $c85b: b5 e8     
            ADC __c839,y       ; $c85d: 79 39 c8  
            STA $e8,x          ; $c860: 95 e8     
            LDA $e6,x          ; $c862: b5 e6     
            ADC #$00           ; $c864: 69 00     
            STA $e6,x          ; $c866: 95 e6     
__c868:     LDA $ea,x          ; $c868: b5 ea     
            SEC                ; $c86a: 38        
            SBC $e2,x          ; $c86b: f5 e2     
            STA $ea,x          ; $c86d: 95 ea     
            LDA $01            ; $c86f: a5 01     
            SBC $e4,x          ; $c871: f5 e4     
            PHA                ; $c873: 48        
            CLC                ; $c874: 18        
            LDA $ea,x          ; $c875: b5 ea     
            ADC $e8,x          ; $c877: 75 e8     
            STA $ea,x          ; $c879: 95 ea     
            PLA                ; $c87b: 68        
            ADC $e6,x          ; $c87c: 75 e6     
            STA $01            ; $c87e: 85 01     
            LDX $0f            ; $c880: a6 0f     
            RTS                ; $c882: 60        

;-------------------------------------------------------------------------------
__c883:     LDA #$10           ; $c883: a9 10     
            JSR __c148         ; $c885: 20 48 c1  
            LDA #$00           ; $c888: a9 00     
            STA $12            ; $c88a: 85 12     
            STA $13            ; $c88c: 85 13     
            JMP __cb81         ; $c88e: 4c 81 cb  

;-------------------------------------------------------------------------------
__c891:     LDA #$00           ; $c891: a9 00     
            STA $2001          ; $c893: 8d 01 20  
            RTS                ; $c896: 60        

;-------------------------------------------------------------------------------
            JSR __c15d         ; $c897: 20 5d c1  
__c89a:     JSR __c891         ; $c89a: 20 91 c8  
            LDA #$20           ; $c89d: a9 20     
            JSR __c8a4         ; $c89f: 20 a4 c8  
            LDA #$28           ; $c8a2: a9 28     
__c8a4:     STA $00            ; $c8a4: 85 00     
            LDA $2002          ; $c8a6: ad 02 20  
            LDA $10            ; $c8a9: a5 10     
            AND #$fb           ; $c8ab: 29 fb     
            STA $2000          ; $c8ad: 8d 00 20  
            LDA $00            ; $c8b0: a5 00     
            STA $2006          ; $c8b2: 8d 06 20  
            LDA #$00           ; $c8b5: a9 00     
            STA $2006          ; $c8b7: 8d 06 20  
            TAY                ; $c8ba: a8        
            LDX #$04           ; $c8bb: a2 04     
            LDA #$38           ; $c8bd: a9 38     
__c8bf:     STA $2007          ; $c8bf: 8d 07 20  
            DEY                ; $c8c2: 88        
            BNE __c8bf         ; $c8c3: d0 fa     
            DEX                ; $c8c5: ca        
            BNE __c8bf         ; $c8c6: d0 f7     
            LDA $00            ; $c8c8: a5 00     
            CLC                ; $c8ca: 18        
            ADC #$03           ; $c8cb: 69 03     
            STA $2006          ; $c8cd: 8d 06 20  
            LDA #$c0           ; $c8d0: a9 c0     
            STA $2006          ; $c8d2: 8d 06 20  
            LDY #$40           ; $c8d5: a0 40     
            LDA #$00           ; $c8d7: a9 00     
__c8d9:     STA $2007          ; $c8d9: 8d 07 20  
            DEY                ; $c8dc: 88        
            BNE __c8d9         ; $c8dd: d0 fa     
            RTS                ; $c8df: 60        

;-------------------------------------------------------------------------------
__c8e0:     STA $00            ; $c8e0: 85 00     
            LDX $00            ; $c8e2: a6 00     
            JSR __c8ee         ; $c8e4: 20 ee c8  
            LDA $00            ; $c8e7: a5 00     
            LSR                ; $c8e9: 4a        
            LSR                ; $c8ea: 4a        
            LSR                ; $c8eb: 4a        
            LSR                ; $c8ec: 4a        
            TAX                ; $c8ed: aa        
__c8ee:     INX                ; $c8ee: e8        
            TXA                ; $c8ef: 8a        
            AND #$0f           ; $c8f0: 29 0f     
            CMP #$09           ; $c8f2: c9 09     
            BCS __c94a         ; $c8f4: b0 54     
            ASL                ; $c8f6: 0a        
            ASL                ; $c8f7: 0a        
            TAY                ; $c8f8: a8        
            LDX $0300          ; $c8f9: ae 00 03  
            LDA __c680,y       ; $c8fc: b9 80 c6  
            STA $0301,x        ; $c8ff: 9d 01 03  
            JSR __cb8c         ; $c902: 20 8c cb  
            INY                ; $c905: c8        
            LDA __c680,y       ; $c906: b9 80 c6  
            STA $0301,x        ; $c909: 9d 01 03  
            JSR __cb8c         ; $c90c: 20 8c cb  
            INY                ; $c90f: c8        
            LDA __c680,y       ; $c910: b9 80 c6  
            AND #$07           ; $c913: 29 07     
            STA $0301,x        ; $c915: 9d 01 03  
            STA $01            ; $c918: 85 01     
            TXA                ; $c91a: 8a        
            SEC                ; $c91b: 38        
            ADC $01            ; $c91c: 65 01     
            JSR __cb8e         ; $c91e: 20 8e cb  
            TAX                ; $c921: aa        
            STX $0300          ; $c922: 8e 00 03  
            LDA #$00           ; $c925: a9 00     
            STA $0301,x        ; $c927: 9d 01 03  
            INY                ; $c92a: c8        
__c92b:     DEX                ; $c92b: ca        
            LDA $07ec,y        ; $c92c: b9 ec 07  
            AND #$0f           ; $c92f: 29 0f     
            STA $0301,x        ; $c931: 9d 01 03  
            DEC $01            ; $c934: c6 01     
            BEQ __c94a         ; $c936: f0 12     
            DEX                ; $c938: ca        
            LDA $07ec,y        ; $c939: b9 ec 07  
            AND #$f0           ; $c93c: 29 f0     
            LSR                ; $c93e: 4a        
            LSR                ; $c93f: 4a        
            LSR                ; $c940: 4a        
            LSR                ; $c941: 4a        
            STA $0301,x        ; $c942: 9d 01 03  
            DEY                ; $c945: 88        
            DEC $01            ; $c946: c6 01     
            BNE __c92b         ; $c948: d0 e1     
__c94a:     RTS                ; $c94a: 60        

;-------------------------------------------------------------------------------
__c94b:     LDX #$ff           ; $c94b: a2 ff     
            .hex 2c            ; $c94d: 2c        Suspected data
__c94e:     LDX #$00           ; $c94e: a2 00     
            STA $00            ; $c950: 85 00     
            STX $04            ; $c952: 86 04     
            LDX #$00           ; $c954: a2 00     
            STX $05            ; $c956: 86 05     
            STX $06            ; $c958: 86 06     
            STX $07            ; $c95a: 86 07     
            LDA $01            ; $c95c: a5 01     
            AND #$08           ; $c95e: 29 08     
            BNE __c963         ; $c960: d0 01     
            INX                ; $c962: e8        
__c963:     LDA $00            ; $c963: a5 00     
            STA $06,x          ; $c965: 95 06     
            LDA $01            ; $c967: a5 01     
            AND #$07           ; $c969: 29 07     
            ASL                ; $c96b: 0a        
            ASL                ; $c96c: 0a        
            TAX                ; $c96d: aa        
            LDA $04            ; $c96e: a5 04     
            BEQ __c995         ; $c970: f0 23     
            LDA $07f0,x        ; $c972: bd f0 07  
            BEQ __c99a         ; $c975: f0 23     
__c977:     CLC                ; $c977: 18        
            JSR __ca44         ; $c978: 20 44 ca  
            JSR __c9d7         ; $c97b: 20 d7 c9  
            JSR __ca2c         ; $c97e: 20 2c ca  
            STA $03            ; $c981: 85 03     
            LDA $06            ; $c983: a5 06     
            JSR __c9d7         ; $c985: 20 d7 c9  
            JSR __ca36         ; $c988: 20 36 ca  
            STA $03            ; $c98b: 85 03     
            LDA $05            ; $c98d: a5 05     
            JSR __c9d7         ; $c98f: 20 d7 c9  
            JMP __ca40         ; $c992: 4c 40 ca  

;-------------------------------------------------------------------------------
__c995:     LDA $07f0,x        ; $c995: bd f0 07  
            BEQ __c977         ; $c998: f0 dd     
__c99a:     SEC                ; $c99a: 38        
            JSR __ca44         ; $c99b: 20 44 ca  
            JSR __ca29         ; $c99e: 20 29 ca  
            STA $03            ; $c9a1: 85 03     
            LDA $06            ; $c9a3: a5 06     
            JSR __ca33         ; $c9a5: 20 33 ca  
            STA $03            ; $c9a8: 85 03     
            LDA $05            ; $c9aa: a5 05     
            JSR __ca3d         ; $c9ac: 20 3d ca  
            BNE __c9bb         ; $c9af: d0 0a     
            LDA $07f2,x        ; $c9b1: bd f2 07  
            BNE __c9bb         ; $c9b4: d0 05     
            LDA $07f3,x        ; $c9b6: bd f3 07  
            BEQ __c9c2         ; $c9b9: f0 07     
__c9bb:     BCS __c9d6         ; $c9bb: b0 19     
            LDA $07f0,x        ; $c9bd: bd f0 07  
            EOR #$ff           ; $c9c0: 49 ff     
__c9c2:     STA $07f0,x        ; $c9c2: 9d f0 07  
            SEC                ; $c9c5: 38        
            LDA #$00           ; $c9c6: a9 00     
            STA $03            ; $c9c8: 85 03     
            LDA $07f3,x        ; $c9ca: bd f3 07  
            JSR __ca29         ; $c9cd: 20 29 ca  
            JSR __ca33         ; $c9d0: 20 33 ca  
            JSR __ca3d         ; $c9d3: 20 3d ca  
__c9d6:     RTS                ; $c9d6: 60        

;-------------------------------------------------------------------------------
__c9d7:     JSR __ca1a         ; $c9d7: 20 1a ca  
            ADC $01            ; $c9da: 65 01     
            CMP #$0a           ; $c9dc: c9 0a     
            BCC __c9e2         ; $c9de: 90 02     
            ADC #$05           ; $c9e0: 69 05     
__c9e2:     CLC                ; $c9e2: 18        
            ADC $02            ; $c9e3: 65 02     
            STA $02            ; $c9e5: 85 02     
            LDA $03            ; $c9e7: a5 03     
            AND #$f0           ; $c9e9: 29 f0     
            ADC $02            ; $c9eb: 65 02     
            BCC __c9f3         ; $c9ed: 90 04     
__c9ef:     ADC #$5f           ; $c9ef: 69 5f     
            SEC                ; $c9f1: 38        
            RTS                ; $c9f2: 60        

;-------------------------------------------------------------------------------
__c9f3:     CMP #$a0           ; $c9f3: c9 a0     
            BCS __c9ef         ; $c9f5: b0 f8     
            RTS                ; $c9f7: 60        

;-------------------------------------------------------------------------------
__c9f8:     JSR __ca1a         ; $c9f8: 20 1a ca  
            SBC $01            ; $c9fb: e5 01     
            STA $01            ; $c9fd: 85 01     
            BCS __ca0b         ; $c9ff: b0 0a     
            ADC #$0a           ; $ca01: 69 0a     
            STA $01            ; $ca03: 85 01     
            LDA $02            ; $ca05: a5 02     
            ADC #$0f           ; $ca07: 69 0f     
            STA $02            ; $ca09: 85 02     
__ca0b:     LDA $03            ; $ca0b: a5 03     
            AND #$f0           ; $ca0d: 29 f0     
            SEC                ; $ca0f: 38        
            SBC $02            ; $ca10: e5 02     
            BCS __ca17         ; $ca12: b0 03     
            ADC #$a0           ; $ca14: 69 a0     
            CLC                ; $ca16: 18        
__ca17:     ORA $01            ; $ca17: 05 01     
            RTS                ; $ca19: 60        

;-------------------------------------------------------------------------------
__ca1a:     PHA                ; $ca1a: 48        
            AND #$0f           ; $ca1b: 29 0f     
            STA $01            ; $ca1d: 85 01     
            PLA                ; $ca1f: 68        
            AND #$f0           ; $ca20: 29 f0     
            STA $02            ; $ca22: 85 02     
            LDA $03            ; $ca24: a5 03     
            AND #$0f           ; $ca26: 29 0f     
            RTS                ; $ca28: 60        

;-------------------------------------------------------------------------------
__ca29:     JSR __c9f8         ; $ca29: 20 f8 c9  
__ca2c:     STA $07f3,x        ; $ca2c: 9d f3 07  
            LDA $07f2,x        ; $ca2f: bd f2 07  
            RTS                ; $ca32: 60        

;-------------------------------------------------------------------------------
__ca33:     JSR __c9f8         ; $ca33: 20 f8 c9  
__ca36:     STA $07f2,x        ; $ca36: 9d f2 07  
            LDA $07f1,x        ; $ca39: bd f1 07  
            RTS                ; $ca3c: 60        

;-------------------------------------------------------------------------------
__ca3d:     JSR __c9f8         ; $ca3d: 20 f8 c9  
__ca40:     STA $07f1,x        ; $ca40: 9d f1 07  
            RTS                ; $ca43: 60        

;-------------------------------------------------------------------------------
__ca44:     LDA $07f3,x        ; $ca44: bd f3 07  
            STA $03            ; $ca47: 85 03     
            LDA $07            ; $ca49: a5 07     
            RTS                ; $ca4b: 60        

;-------------------------------------------------------------------------------
__ca4c:     LDA #$00           ; $ca4c: a9 00     
            STA $04            ; $ca4e: 85 04     
            CLC                ; $ca50: 18        
            LDA $00            ; $ca51: a5 00     
            ADC #$10           ; $ca53: 69 10     
            AND #$f0           ; $ca55: 29 f0     
            LSR                ; $ca57: 4a        
            LSR                ; $ca58: 4a        
            TAY                ; $ca59: a8        
            LDA $00            ; $ca5a: a5 00     
            AND #$07           ; $ca5c: 29 07     
            ASL                ; $ca5e: 0a        
            ASL                ; $ca5f: 0a        
            TAX                ; $ca60: aa        
__ca61:     LDA $07ec,y        ; $ca61: b9 ec 07  
            BEQ __cac1         ; $ca64: f0 5b     
            LDA $07f0,x        ; $ca66: bd f0 07  
            BEQ __ca94         ; $ca69: f0 29     
__ca6b:     SEC                ; $ca6b: 38        
            LDA $07ef,y        ; $ca6c: b9 ef 07  
            STA $03            ; $ca6f: 85 03     
            LDA $07f3,x        ; $ca71: bd f3 07  
            JSR __c9f8         ; $ca74: 20 f8 c9  
            LDA $07ee,y        ; $ca77: b9 ee 07  
            STA $03            ; $ca7a: 85 03     
            LDA $07f2,x        ; $ca7c: bd f2 07  
            JSR __c9f8         ; $ca7f: 20 f8 c9  
            LDA $07ed,y        ; $ca82: b9 ed 07  
            STA $03            ; $ca85: 85 03     
            LDA $07f1,x        ; $ca87: bd f1 07  
            JSR __c9f8         ; $ca8a: 20 f8 c9  
            BCS __cac6         ; $ca8d: b0 37     
            LDA $07ec,y        ; $ca8f: b9 ec 07  
            BNE __cacb         ; $ca92: d0 37     
__ca94:     LDA #$ff           ; $ca94: a9 ff     
            STA $04            ; $ca96: 85 04     
            SEC                ; $ca98: 38        
__ca99:     TYA                ; $ca99: 98        
            BNE __cac0         ; $ca9a: d0 24     
            BCC __cab4         ; $ca9c: 90 16     
            TXA                ; $ca9e: 8a        
            PHA                ; $ca9f: 48        
            TYA                ; $caa0: 98        
            PHA                ; $caa1: 48        
            LDY #$00           ; $caa2: a0 00     
__caa4:     LDA $07f0,x        ; $caa4: bd f0 07  
            STA $07ec,y        ; $caa7: 99 ec 07  
            INX                ; $caaa: e8        
            INY                ; $caab: c8        
            CPY #$04           ; $caac: c0 04     
            BCC __caa4         ; $caae: 90 f4     
            PLA                ; $cab0: 68        
            TAY                ; $cab1: a8        
            PLA                ; $cab2: 68        
            TAX                ; $cab3: aa        
__cab4:     LDA $00            ; $cab4: a5 00     
            AND #$08           ; $cab6: 29 08     
            BEQ __cac0         ; $cab8: f0 06     
            DEX                ; $caba: ca        
            DEX                ; $cabb: ca        
            DEX                ; $cabc: ca        
            DEX                ; $cabd: ca        
            BPL __ca61         ; $cabe: 10 a1     
__cac0:     RTS                ; $cac0: 60        

;-------------------------------------------------------------------------------
__cac1:     LDA $07f0,x        ; $cac1: bd f0 07  
            BEQ __ca6b         ; $cac4: f0 a5     
__cac6:     LDA $07ec,y        ; $cac6: b9 ec 07  
            BNE __ca94         ; $cac9: d0 c9     
__cacb:     CLC                ; $cacb: 18        
            BCC __ca99         ; $cacc: 90 cb     
__cace:     LDX #$00           ; $cace: a2 00     
            LDY #$05           ; $cad0: a0 05     
            LDA $18            ; $cad2: a5 18     
            BNE __cad8         ; $cad4: d0 02     
            LDA #$37           ; $cad6: a9 37     
__cad8:     AND #$02           ; $cad8: 29 02     
            STA $00            ; $cada: 85 00     
            LDA $19            ; $cadc: a5 19     
            AND #$02           ; $cade: 29 02     
            EOR $00            ; $cae0: 45 00     
            CLC                ; $cae2: 18        
            BEQ __cae6         ; $cae3: f0 01     
            SEC                ; $cae5: 38        
__cae6:     ROR $18,x          ; $cae6: 76 18     
            INX                ; $cae8: e8        
            DEY                ; $cae9: 88        
            BNE __cae6         ; $caea: d0 fa     
            RTS                ; $caec: 60        

;-------------------------------------------------------------------------------
__caed:     JSR __cb35         ; $caed: 20 35 cb  
            LDA #$01           ; $caf0: a9 01     
            STA $4016          ; $caf2: 8d 16 40  
            LDX #$00           ; $caf5: a2 00     
            LDA #$00           ; $caf7: a9 00     
            STA $4016          ; $caf9: 8d 16 40  
            JSR __cb00         ; $cafc: 20 00 cb  
            INX                ; $caff: e8        
__cb00:     LDY #$08           ; $cb00: a0 08     
__cb02:     PHA                ; $cb02: 48        
            LDA $4016,x        ; $cb03: bd 16 40  
            STA $00            ; $cb06: 85 00     
            LSR                ; $cb08: 4a        
            ORA $00            ; $cb09: 05 00     
            LSR                ; $cb0b: 4a        
            PLA                ; $cb0c: 68        
            ROL                ; $cb0d: 2a        
            DEY                ; $cb0e: 88        
            BNE __cb02         ; $cb0f: d0 f1     
            STX $00            ; $cb11: 86 00     
            ASL $00            ; $cb13: 06 00     
            LDX $00            ; $cb15: a6 00     
            LDY $14,x          ; $cb17: b4 14     
            STY $00            ; $cb19: 84 00     
            STA $14,x          ; $cb1b: 95 14     
            STA $15,x          ; $cb1d: 95 15     
            LDY #$04           ; $cb1f: a0 04     
__cb21:     LDA $02            ; $cb21: a5 02     
            BIT $00            ; $cb23: 24 00     
            BEQ __cb2d         ; $cb25: f0 06     
            LDA $15,x          ; $cb27: b5 15     
            AND $01            ; $cb29: 25 01     
            STA $15,x          ; $cb2b: 95 15     
__cb2d:     SEC                ; $cb2d: 38        
            ROR $01            ; $cb2e: 66 01     
            LSR $02            ; $cb30: 46 02     
            DEY                ; $cb32: 88        
            BNE __cb21         ; $cb33: d0 ec     
__cb35:     LDA #$7f           ; $cb35: a9 7f     
            STA $01            ; $cb37: 85 01     
            LDA #$80           ; $cb39: a9 80     
            STA $02            ; $cb3b: 85 02     
            RTS                ; $cb3d: 60        

;-------------------------------------------------------------------------------
__cb3e:     STA $2006          ; $cb3e: 8d 06 20  
            INY                ; $cb41: c8        
            LDA ($00),y        ; $cb42: b1 00     
            STA $2006          ; $cb44: 8d 06 20  
            INY                ; $cb47: c8        
            LDA ($00),y        ; $cb48: b1 00     
            ASL                ; $cb4a: 0a        
            PHA                ; $cb4b: 48        
            LDA $10            ; $cb4c: a5 10     
            ORA #$04           ; $cb4e: 09 04     
            BCS __cb54         ; $cb50: b0 02     
            AND #$fb           ; $cb52: 29 fb     
__cb54:     JSR __c148         ; $cb54: 20 48 c1  
            PLA                ; $cb57: 68        
            ASL                ; $cb58: 0a        
            BCC __cb5e         ; $cb59: 90 03     
            ORA #$02           ; $cb5b: 09 02     
            INY                ; $cb5d: c8        
__cb5e:     LSR                ; $cb5e: 4a        
            LSR                ; $cb5f: 4a        
            TAX                ; $cb60: aa        
__cb61:     BCS __cb64         ; $cb61: b0 01     
            INY                ; $cb63: c8        
__cb64:     LDA ($00),y        ; $cb64: b1 00     
            STA $2007          ; $cb66: 8d 07 20  
            DEX                ; $cb69: ca        
            BNE __cb61         ; $cb6a: d0 f5     
            SEC                ; $cb6c: 38        
            TYA                ; $cb6d: 98        
            ADC $00            ; $cb6e: 65 00     
            STA $00            ; $cb70: 85 00     
            LDA #$00           ; $cb72: a9 00     
            ADC $01            ; $cb74: 65 01     
            STA $01            ; $cb76: 85 01     
__cb78:     LDX $2002          ; $cb78: ae 02 20  
            LDY #$00           ; $cb7b: a0 00     
            LDA ($00),y        ; $cb7d: b1 00     
            BNE __cb3e         ; $cb7f: d0 bd     
__cb81:     LDA $12            ; $cb81: a5 12     
            STA $2005          ; $cb83: 8d 05 20  
            LDA $13            ; $cb86: a5 13     
            STA $2005          ; $cb88: 8d 05 20  
            RTS                ; $cb8b: 60        

;-------------------------------------------------------------------------------
__cb8c:     INX                ; $cb8c: e8        
            TXA                ; $cb8d: 8a        
__cb8e:     CMP #$3f           ; $cb8e: c9 3f     
            BCC __cb9c         ; $cb90: 90 0a     
            LDX $0300          ; $cb92: ae 00 03  
            LDA #$00           ; $cb95: a9 00     
            STA $0301,x        ; $cb97: 9d 01 03  
            PLA                ; $cb9a: 68        
            PLA                ; $cb9b: 68        
__cb9c:     RTS                ; $cb9c: 60        

;-------------------------------------------------------------------------------
__cb9d:     LDX #$09           ; $cb9d: a2 09     
            DEC $31            ; $cb9f: c6 31     
            BPL __cba9         ; $cba1: 10 06     
            LDA #$0a           ; $cba3: a9 0a     
            STA $31            ; $cba5: 85 31     
            LDX #$1d           ; $cba7: a2 1d     
__cba9:     LDA $32,x          ; $cba9: b5 32     
            BEQ __cbaf         ; $cbab: f0 02     
            DEC $32,x          ; $cbad: d6 32     
__cbaf:     DEX                ; $cbaf: ca        
            BPL __cba9         ; $cbb0: 10 f7     
            RTS                ; $cbb2: 60        

;-------------------------------------------------------------------------------
__cbb3:     .hex 5c 62 5c      ; $cbb3: 5c 62 5c  Invalid Opcode - NOP $5c62,x
            LSR $6e,x          ; $cbb6: 56 6e     
            .hex 74 8c         ; $cbb8: 74 8c     Invalid Opcode - NOP $8c,x
            .hex 92            ; $cbba: 92        Invalid Opcode - KIL 
            .hex 7a            ; $cbbb: 7a        Invalid Opcode - NOP 
            .hex 80 86         ; $cbbc: 80 86     Invalid Opcode - NOP #$86
__cbbe:     BRK                ; $cbbe: 00        
__cbbf:     BRK                ; $cbbf: 00        
            .hex 24            ; $cbc0: 24        Suspected data
__cbc1:     DEC $17,x          ; $cbc1: d6 17     
            ROR $166f          ; $cbc3: 6e 6f 16  
__cbc6:     .hex 10            ; $cbc6: 10        Suspected data
__cbc7:     PHP                ; $cbc7: 08        
            SED                ; $cbc8: f8        
            PHP                ; $cbc9: 08        
            PHP                ; $cbca: 08        
            SED                ; $cbcb: f8        
            BRK                ; $cbcc: 00        
            SED                ; $cbcd: f8        
            PHP                ; $cbce: 08        
            SED                ; $cbcf: f8        
            BRK                ; $cbd0: 00        
            SED                ; $cbd1: f8        
            SED                ; $cbd2: f8        
            BRK                ; $cbd3: 00        
            BPL __cbd6         ; $cbd4: 10 00     
__cbd6:     SED                ; $cbd6: f8        
            BPL __cbe9         ; $cbd7: 10 10     
            .hex 10            ; $cbd9: 10        Suspected data
__cbda:     .hex ff 01         ; $cbda: ff 01     Suspected data
__cbdc:     .hex f2            ; $cbdc: f2        Invalid Opcode - KIL 
__cbdd:     BEQ __cc28         ; $cbdd: f0 49     
            BVC __cc5a         ; $cbdf: 50 79     
            .hex 80 a9         ; $cbe1: 80 a9     Invalid Opcode - NOP #$a9
            BCS __cbbe         ; $cbe3: b0 d9     
            .hex e2 f1         ; $cbe5: e2 f1     Invalid Opcode - NOP #$f1
            .hex fa            ; $cbe7: fa        Invalid Opcode - NOP 
__cbe8:     LSR                ; $cbe8: 4a        
__cbe9:     .hex 7a            ; $cbe9: 7a        Invalid Opcode - NOP 
            TAX                ; $cbea: aa        
            .hex da            ; $cbeb: da        Invalid Opcode - NOP 
            .hex f5            ; $cbec: f5        Suspected data
__cbed:     .hex 80 40         ; $cbed: 80 40     Invalid Opcode - NOP #$40
            JSR $0810          ; $cbef: 20 10 08  
            .hex 04 02         ; $cbf2: 04 02     Invalid Opcode - NOP $02
            .hex 01            ; $cbf4: 01        Suspected data
__cbf5:     BRK                ; $cbf5: 00        
            .hex 04 08         ; $cbf6: 04 08     Invalid Opcode - NOP $08
__cbf8:     .hex 04 02         ; $cbf8: 04 02     Invalid Opcode - NOP $02
            INC $8ca5,x        ; $cbfa: fe a5 8c  
            BNE __cc5e         ; $cbfd: d0 5f     
            LDA $15            ; $cbff: a5 15     
            STA $70            ; $cc01: 85 70     
            LDX #$00           ; $cc03: a2 00     
            JSR __cd13         ; $cc05: 20 13 cd  
            LDX #$00           ; $cc08: a2 00     
            JSR __da99         ; $cc0a: 20 99 da  
            LDA $58            ; $cc0d: a5 58     
            BEQ __cc1f         ; $cc0f: f0 0e     
            LDA $17            ; $cc11: a5 17     
            STA $71            ; $cc13: 85 71     
            LDX #$01           ; $cc15: a2 01     
            JSR __cd13         ; $cc17: 20 13 cd  
            LDX #$01           ; $cc1a: a2 01     
            JSR __da99         ; $cc1c: 20 99 da  
__cc1f:     JSR __efec         ; $cc1f: 20 ec ef  
            JSR __e189         ; $cc22: 20 89 e1  
            JSR __dc6a         ; $cc25: 20 6a dc  
__cc28:     JSR __d1e5         ; $cc28: 20 e5 d1  
            JSR __de22         ; $cc2b: 20 22 de  
            JSR __ee0d         ; $cc2e: 20 0d ee  
            JSR __ef9a         ; $cc31: 20 9a ef  
            JSR __f10b         ; $cc34: 20 0b f1  
            JSR __d3ac         ; $cc37: 20 ac d3  
            JSR __d212         ; $cc3a: 20 12 d2  
            JSR __d301         ; $cc3d: 20 01 d3  
            JSR __eb7f         ; $cc40: 20 7f eb  
            JSR __ec23         ; $cc43: 20 23 ec  
            JSR __f838         ; $cc46: 20 38 f8  
            JSR __d493         ; $cc49: 20 93 d4  
            JSR __e29a         ; $cc4c: 20 9a e2  
            JSR __e0b9         ; $cc4f: 20 b9 e0  
            JSR __d9cc         ; $cc52: 20 cc d9  
            JSR __da4b         ; $cc55: 20 4b da  
            .hex 20 2e         ; $cc58: 20 2e     Suspected data
__cc5a:     .hex eb 20         ; $cc5a: eb 20     Invalid Opcode - SBC #$20
            .hex bf ec         ; $cc5c: bf ec     Suspected data
__cc5e:     JSR __d463         ; $cc5e: 20 63 d4  
            JSR __d82f         ; $cc61: 20 2f d8  
            JMP __d7de         ; $cc64: 4c de d7  

;-------------------------------------------------------------------------------
__cc67:     LDA #$04           ; $cc67: a9 04     
            JMP __d4f5         ; $cc69: 4c f5 d4  

;-------------------------------------------------------------------------------
            JSR __f471         ; $cc6c: 20 71 f4  
            JSR __e88f         ; $cc6f: 20 8f e8  
            LDA $45            ; $cc72: a5 45     
            BEQ __cc7b         ; $cc74: f0 05     
            CMP #$01           ; $cc76: c9 01     
            BEQ __cc7e         ; $cc78: f0 04     
            RTS                ; $cc7a: 60        

;-------------------------------------------------------------------------------
__cc7b:     JMP __e8f2         ; $cc7b: 4c f2 e8  

;-------------------------------------------------------------------------------
__cc7e:     LDA $20            ; $cc7e: a5 20     
            CMP #$80           ; $cc80: c9 80     
            BEQ __cc97         ; $cc82: f0 13     
            INC $59            ; $cc84: e6 59     
            LDA $59            ; $cc86: a5 59     
            CMP #$63           ; $cc88: c9 63     
            BCC __cc90         ; $cc8a: 90 04     
            LDA #$00           ; $cc8c: a9 00     
            STA $59            ; $cc8e: 85 59     
__cc90:     INC $56            ; $cc90: e6 56     
            LDA #$01           ; $cc92: a9 01     
__cc94:     JMP __d4f5         ; $cc94: 4c f5 d4  

;-------------------------------------------------------------------------------
__cc97:     LDA #$00           ; $cc97: a9 00     
            STA $51            ; $cc99: 85 51     
            STA $55            ; $cc9b: 85 55     
            RTS                ; $cc9d: 60        

;-------------------------------------------------------------------------------
            LDA #$06           ; $cc9e: a9 06     
            CMP $6a            ; $cca0: c5 6a     
            BEQ __cced         ; $cca2: f0 49     
            CMP $6b            ; $cca4: c5 6b     
            BEQ __cced         ; $cca6: f0 45     
            LDA $8c            ; $cca8: a5 8c     
            BNE __cce4         ; $ccaa: d0 38     
            LDX $26            ; $ccac: a6 26     
            CPX #$02           ; $ccae: e0 02     
            BNE __ccb9         ; $ccb0: d0 07     
            LDX #$00           ; $ccb2: a2 00     
            JSR __ccf6         ; $ccb4: 20 f6 cc  
            LDX #$01           ; $ccb7: a2 01     
__ccb9:     JSR __ccf6         ; $ccb9: 20 f6 cc  
            JSR __d212         ; $ccbc: 20 12 d2  
            JSR __f78b         ; $ccbf: 20 8b f7  
            JSR __d301         ; $ccc2: 20 01 d3  
            JSR __f6a4         ; $ccc5: 20 a4 f6  
            JSR __f71d         ; $ccc8: 20 1d f7  
            JSR __eb2e         ; $cccb: 20 2e eb  
            JSR __e277         ; $ccce: 20 77 e2  
            JSR __e33c         ; $ccd1: 20 3c e3  
            JSR __ecbf         ; $ccd4: 20 bf ec  
__ccd7:     LDA $8d            ; $ccd7: a5 8d     
            CMP #$2f           ; $ccd9: c9 2f     
            BMI __cce1         ; $ccdb: 30 04     
            LDA $27            ; $ccdd: a5 27     
            BNE __cce4         ; $ccdf: d0 03     
__cce1:     JSR __f2ec         ; $cce1: 20 ec f2  
__cce4:     JSR __d724         ; $cce4: 20 24 d7  
            JSR __d8af         ; $cce7: 20 af d8  
            JMP __d890         ; $ccea: 4c 90 d8  

;-------------------------------------------------------------------------------
__cced:     LDA $4d            ; $cced: a5 4d     
            BNE __cd12         ; $ccef: d0 21     
            LDA #$03           ; $ccf1: a9 03     
            JMP __d4f5         ; $ccf3: 4c f5 d4  

;-------------------------------------------------------------------------------
__ccf6:     STX $5f            ; $ccf6: 86 5f     
            TXA                ; $ccf8: 8a        
            ASL                ; $ccf9: 0a        
            TAY                ; $ccfa: a8        
            LDA $0015,y        ; $ccfb: b9 15 00  
            STA $70,x          ; $ccfe: 95 70     
            .hex 20 52         ; $cd00: 20 52     Suspected data
__cd02:     CMP $bd,x          ; $cd02: d5 bd     
            .hex 52            ; $cd04: 52        Invalid Opcode - KIL 
            .hex 03 d0         ; $cd05: 03 d0     Invalid Opcode - SLO ($d0,x)
            ORA $a6            ; $cd07: 05 a6     
            .hex 5f 20 9c      ; $cd09: 5f 20 9c  Invalid Opcode - SRE $9c20,x
            CMP $a6,x          ; $cd0c: d5 a6     
            .hex 5f 20 07      ; $cd0e: 5f 20 07  Invalid Opcode - SRE $0720,x
            .hex d5            ; $cd11: d5        Suspected data
__cd12:     RTS                ; $cd12: 60        

;-------------------------------------------------------------------------------
__cd13:     STX $5f            ; $cd13: 86 5f     
            LDA $5a,x          ; $cd15: b5 5a     
            BEQ __cd61         ; $cd17: f0 48     
            LDY $6a,x          ; $cd19: b4 6a     
            DEY                ; $cd1b: 88        
            TYA                ; $cd1c: 98        
            JSR __c728         ; $cd1d: 20 28 c7  
            .hex 32            ; $cd20: 32        Invalid Opcode - KIL 
            CMP __ce5d         ; $cd21: cd 5d ce  
            SEC                ; $cd24: 38        
            CMP __d008         ; $cd25: cd 08 d0  
            EOR $08d0,x        ; $cd28: 5d d0 08  
            BNE __ccd7         ; $cd2b: d0 aa     
            BNE __cd37         ; $cd2d: d0 08     
            BNE __cd31         ; $cd2f: d0 00     
__cd31:     CMP $20,x          ; $cd31: d5 20     
            BCS __cd02         ; $cd33: b0 cd     
            .hex 4c 3b         ; $cd35: 4c 3b     Suspected data
__cd37:     CMP __c620         ; $cd37: cd 20 c6  
            .hex cf 20 62      ; $cd3a: cf 20 62  Invalid Opcode - DCP $6220
            CMP $21b0          ; $cd3d: cd b0 21  
            LDA #$05           ; $cd40: a9 05     
            STA $e8,x          ; $cd42: 95 e8     
            STA $6e,x          ; $cd44: 95 6e     
            LDA #$04           ; $cd46: a9 04     
            STA $e6,x          ; $cd48: 95 e6     
            LSR                ; $cd4a: 4a        
            STA $6a,x          ; $cd4b: 95 6a     
            LSR                ; $cd4d: 4a        
            STA $e0,x          ; $cd4e: 95 e0     
            STA $86,x          ; $cd50: 95 86     
            LSR                ; $cd52: 4a        
            STA $88,x          ; $cd53: 95 88     
            LDY $68,x          ; $cd55: b4 68     
            BEQ __cd61         ; $cd57: f0 08     
            LDA __cbf8,y       ; $cd59: b9 f8 cb  
            CLC                ; $cd5c: 18        
            ADC $64,x          ; $cd5d: 75 64     
            STA $64,x          ; $cd5f: 95 64     
__cd61:     RTS                ; $cd61: 60        

;-------------------------------------------------------------------------------
__cd62:     LDA #$00           ; $cd62: a9 00     
            STA $82,x          ; $cd64: 95 82     
            LDA #$06           ; $cd66: a9 06     
__cd68:     STA $01            ; $cd68: 85 01     
            LDA $64,x          ; $cd6a: b5 64     
            CLC                ; $cd6c: 18        
            ADC $01            ; $cd6d: 65 01     
            JSR __dbb4         ; $cd6f: 20 b4 db  
            BMI __cd83         ; $cd72: 30 0f     
            CMP #$04           ; $cd74: c9 04     
            BNE __cd8b         ; $cd76: d0 13     
            INY                ; $cd78: c8        
            LDA ($03),y        ; $cd79: b1 03     
            BPL __cd8b         ; $cd7b: 10 0e     
            DEY                ; $cd7d: 88        
            DEY                ; $cd7e: 88        
            LDA ($03),y        ; $cd7f: b1 03     
            BPL __cd8b         ; $cd81: 10 08     
__cd83:     LDA #$09           ; $cd83: a9 09     
            CMP $01            ; $cd85: c5 01     
            BNE __cd68         ; $cd87: d0 df     
            CLC                ; $cd89: 18        
            RTS                ; $cd8a: 60        

;-------------------------------------------------------------------------------
__cd8b:     SEC                ; $cd8b: 38        
            RTS                ; $cd8c: 60        

;-------------------------------------------------------------------------------
__cd8d:     .hex 02            ; $cd8d: 02        Invalid Opcode - KIL 
            ORA #$06           ; $cd8e: 09 06     
            .hex 04            ; $cd90: 04        Suspected data
__cd91:     .hex 04 02         ; $cd91: 04 02     Invalid Opcode - NOP $02
            .hex 02            ; $cd93: 02        Invalid Opcode - KIL 
            .hex 04            ; $cd94: 04        Suspected data
__cd95:     INC $60,x          ; $cd95: f6 60     
            LDA $60,x          ; $cd97: b5 60     
            CMP __cd8d,y       ; $cd99: d9 8d cd  
            BCC __cdaf         ; $cd9c: 90 11     
            LDA #$00           ; $cd9e: a9 00     
            STA $60,x          ; $cda0: 95 60     
            INC $6c,x          ; $cda2: f6 6c     
            LDA $6c,x          ; $cda4: b5 6c     
            CMP __cd91,y       ; $cda6: d9 91 cd  
            BCC __cdaf         ; $cda9: 90 04     
            LDA #$00           ; $cdab: a9 00     
            STA $6c,x          ; $cdad: 95 6c     
__cdaf:     RTS                ; $cdaf: 60        

;-------------------------------------------------------------------------------
__cdb0:     LDA $55            ; $cdb0: a5 55     
            CMP #$01           ; $cdb2: c9 01     
            BNE __cdc4         ; $cdb4: d0 0e     
            TXA                ; $cdb6: 8a        
            ASL                ; $cdb7: 0a        
            TAY                ; $cdb8: a8        
            LDA $0014,y        ; $cdb9: b9 14 00  
            AND #$40           ; $cdbc: 29 40     
            BEQ __cdc4         ; $cdbe: f0 04     
            LDA #$05           ; $cdc0: a9 05     
            BNE __cddb         ; $cdc2: d0 17     
__cdc4:     LDA $70,x          ; $cdc4: b5 70     
            AND #$01           ; $cdc6: 29 01     
            BNE __cddf         ; $cdc8: d0 15     
            LDA $70,x          ; $cdca: b5 70     
            AND #$02           ; $cdcc: 29 02     
            BNE __cde9         ; $cdce: d0 19     
__cdd0:     LDA $68,x          ; $cdd0: b5 68     
            BEQ __cdff         ; $cdd2: f0 2b     
            LDA $6e,x          ; $cdd4: b5 6e     
            LSR                ; $cdd6: 4a        
            STA $32,x          ; $cdd7: 95 32     
            LDA #$03           ; $cdd9: a9 03     
__cddb:     STA $6a,x          ; $cddb: 95 6a     
            BNE __cdff         ; $cddd: d0 20     
__cddf:     LDA #$01           ; $cddf: a9 01     
            LDY $68,x          ; $cde1: b4 68     
            CPY #$02           ; $cde3: c0 02     
            BEQ __cdd0         ; $cde5: f0 e9     
            BNE __cdf1         ; $cde7: d0 08     
__cde9:     LDA #$02           ; $cde9: a9 02     
            LDY $68,x          ; $cdeb: b4 68     
            CPY #$01           ; $cded: c0 01     
            BEQ __cdd0         ; $cdef: f0 df     
__cdf1:     STA $68,x          ; $cdf1: 95 68     
            AND #$01           ; $cdf3: 29 01     
            STA $62,x          ; $cdf5: 95 62     
            JSR __d143         ; $cdf7: 20 43 d1  
            LDY #$00           ; $cdfa: a0 00     
            JSR __cd95         ; $cdfc: 20 95 cd  
__cdff:     LDY $6c,x          ; $cdff: b4 6c     
            JSR __d17c         ; $ce01: 20 7c d1  
            LDY #$d9           ; $ce04: a0 d9     
            LDA $55            ; $ce06: a5 55     
            CMP #$01           ; $ce08: c9 01     
            BEQ __ce29         ; $ce0a: f0 1d     
            LDY __cbbf,x       ; $ce0c: bc bf cb  
            LDX #$00           ; $ce0f: a2 00     
__ce11:     TYA                ; $ce11: 98        
            CLC                ; $ce12: 18        
            ADC __cbf5,x       ; $ce13: 7d f5 cb  
            TAY                ; $ce16: a8        
            LDA $0205,y        ; $ce17: b9 05 02  
            CLC                ; $ce1a: 18        
            ADC #$77           ; $ce1b: 69 77     
            STA $0205,y        ; $ce1d: 99 05 02  
            INX                ; $ce20: e8        
            CPX #$04           ; $ce21: e0 04     
            BCC __ce11         ; $ce23: 90 ec     
            LDY #$df           ; $ce25: a0 df     
            LDX $5f            ; $ce27: a6 5f     
__ce29:     LDA $70,x          ; $ce29: b5 70     
            AND #$03           ; $ce2b: 29 03     
            BNE __ce43         ; $ce2d: d0 14     
            TYA                ; $ce2f: 98        
            PHA                ; $ce30: 48        
            LDY __cbbf,x       ; $ce31: bc bf cb  
            LDA $62,x          ; $ce34: b5 62     
            BNE __ce3f         ; $ce36: d0 07     
            PLA                ; $ce38: 68        
            STA $0209,y        ; $ce39: 99 09 02  
            JMP __ce43         ; $ce3c: 4c 43 ce  

;-------------------------------------------------------------------------------
__ce3f:     PLA                ; $ce3f: 68        
            STA $0215,y        ; $ce40: 99 15 02  
__ce43:     LDA $70,x          ; $ce43: b5 70     
            AND #$80           ; $ce45: 29 80     
            BEQ __ce5c         ; $ce47: f0 13     
            LDA $55            ; $ce49: a5 55     
            CMP #$01           ; $ce4b: c9 01     
            BEQ __ce54         ; $ce4d: f0 05     
            DEC $66,x          ; $ce4f: d6 66     
            LDA #$02           ; $ce51: a9 02     
            .hex 2c            ; $ce53: 2c        Suspected data
__ce54:     LDA #$04           ; $ce54: a9 04     
            STA $6a,x          ; $ce56: 95 6a     
            LDA #$04           ; $ce58: a9 04     
            STA $ff            ; $ce5a: 85 ff     
__ce5c:     RTS                ; $ce5c: 60        

;-------------------------------------------------------------------------------
__ce5d:     LDA #$a8           ; $ce5d: a9 a8     
            STA $e2,x          ; $ce5f: 95 e2     
            LDA #$03           ; $ce61: a9 03     
            STA $e4,x          ; $ce63: 95 e4     
            LDA $68,x          ; $ce65: b5 68     
            BNE __ce93         ; $ce67: d0 2a     
            LDA $e6,x          ; $ce69: b5 e6     
            CMP #$03           ; $ce6b: c9 03     
            BCC __ce93         ; $ce6d: 90 24     
            LDA $70,x          ; $ce6f: b5 70     
            AND #$03           ; $ce71: 29 03     
            BEQ __ce93         ; $ce73: f0 1e     
            STA $68,x          ; $ce75: 95 68     
            CMP #$01           ; $ce77: c9 01     
            BEQ __ce7e         ; $ce79: f0 03     
            LDA #$00           ; $ce7b: a9 00     
            .hex 2c            ; $ce7d: 2c        Suspected data
__ce7e:     LDA #$01           ; $ce7e: a9 01     
            STA $62,x          ; $ce80: 95 62     
            LDA #$0f           ; $ce82: a9 0f     
            STA $6e,x          ; $ce84: 95 6e     
            BNE __ce93         ; $ce86: d0 0b     
__ce88:     LDA #$f0           ; $ce88: a9 f0     
            .hex 2c            ; $ce8a: 2c        Suspected data
__ce8b:     LDA #$b0           ; $ce8b: a9 b0     
            STA $e2,x          ; $ce8d: 95 e2     
            LDA #$00           ; $ce8f: a9 00     
            STA $e4,x          ; $ce91: 95 e4     
__ce93:     LDA $68,x          ; $ce93: b5 68     
            BEQ __ce9a         ; $ce95: f0 03     
            JSR __d160         ; $ce97: 20 60 d1  
__ce9a:     JSR __d133         ; $ce9a: 20 33 d1  
            JSR __ceef         ; $ce9d: 20 ef ce  
            JSR __cf1a         ; $cea0: 20 1a cf  
            BCC __ced0         ; $cea3: 90 2b     
            LDA $0e            ; $cea5: a5 0e     
            SEC                ; $cea7: 38        
            SBC #$19           ; $cea8: e9 19     
            STA $66,x          ; $ceaa: 95 66     
            LDA #$00           ; $ceac: a9 00     
            STA $e0,x          ; $ceae: 95 e0     
            STA $86,x          ; $ceb0: 95 86     
            STA $88,x          ; $ceb2: 95 88     
            STA $60,x          ; $ceb4: 95 60     
            LDX $5f            ; $ceb6: a6 5f     
            LDA #$01           ; $ceb8: a9 01     
            STA $6a,x          ; $ceba: 95 6a     
            LDA $68,x          ; $cebc: b5 68     
            BEQ __ceee         ; $cebe: f0 2e     
            LDA #$03           ; $cec0: a9 03     
            STA $6a,x          ; $cec2: 95 6a     
            LDA $6e,x          ; $cec4: b5 6e     
            LDY $5a,x          ; $cec6: b4 5a     
            CPY #$08           ; $cec8: c0 08     
            BCS __cecd         ; $ceca: b0 01     
            LSR                ; $cecc: 4a        
__cecd:     LSR                ; $cecd: 4a        
            STA $32,x          ; $cece: 95 32     
__ced0:     LDA $6a,x          ; $ced0: b5 6a     
            CMP #$04           ; $ced2: c9 04     
            BCS __ceee         ; $ced4: b0 18     
            LDY #$07           ; $ced6: a0 07     
            JMP __d17c         ; $ced8: 4c 7c d1  

;-------------------------------------------------------------------------------
__cedb:     LDY #$00           ; $cedb: a0 00     
__cedd:     CMP __cbdc,y       ; $cedd: d9 dc cb  
            BCC __cee7         ; $cee0: 90 05     
            CMP __cbdd,y       ; $cee2: d9 dd cb  
            BCC __ceee         ; $cee5: 90 07     
__cee7:     INY                ; $cee7: c8        
            INY                ; $cee8: c8        
            CPY #$0c           ; $cee9: c0 0c     
            BNE __cedd         ; $ceeb: d0 f0     
            SEC                ; $ceed: 38        
__ceee:     RTS                ; $ceee: 60        

;-------------------------------------------------------------------------------
__ceef:     LDA $86,x          ; $ceef: b5 86     
            BNE __cf19         ; $cef1: d0 26     
            LDA $66,x          ; $cef3: b5 66     
            CLC                ; $cef5: 18        
            ADC #$fa           ; $cef6: 69 fa     
            JSR __cedb         ; $cef8: 20 db ce  
            BCS __cf19         ; $cefb: b0 1c     
            JSR __cf5b         ; $cefd: 20 5b cf  
            STA $0b            ; $cf00: 85 0b     
            LDA $64,x          ; $cf02: b5 64     
            CLC                ; $cf04: 18        
            ADC #$08           ; $cf05: 69 08     
            JSR __dbb0         ; $cf07: 20 b0 db  
            BPL __cf12         ; $cf0a: 10 06     
            LDY $0b            ; $cf0c: a4 0b     
            BEQ __cf19         ; $cf0e: f0 09     
            BNE __cf15         ; $cf10: d0 03     
__cf12:     LDA #$08           ; $cf12: a9 08     
            .hex 2c            ; $cf14: 2c        Suspected data
__cf15:     LDA #$06           ; $cf15: a9 06     
            STA $6a,x          ; $cf17: 95 6a     
__cf19:     RTS                ; $cf19: 60        

;-------------------------------------------------------------------------------
__cf1a:     LDA $66,x          ; $cf1a: b5 66     
            CLC                ; $cf1c: 18        
            ADC #$18           ; $cf1d: 69 18     
            JSR __cedb         ; $cf1f: 20 db ce  
            BCS __cf51         ; $cf22: b0 2d     
            TYA                ; $cf24: 98        
            STY $07            ; $cf25: 84 07     
            CMP $88,x          ; $cf27: d5 88     
            BEQ __cf55         ; $cf29: f0 2a     
            LDA __cbdc,y       ; $cf2b: b9 dc cb  
            STA $0e            ; $cf2e: 85 0e     
            LDA $e6,x          ; $cf30: b5 e6     
            CMP #$03           ; $cf32: c9 03     
            BCS __cf46         ; $cf34: b0 10     
            CMP #$02           ; $cf36: c9 02     
            BCC __cf55         ; $cf38: 90 1b     
            LDA $6a,x          ; $cf3a: b5 6a     
            CMP #$08           ; $cf3c: c9 08     
            BEQ __cf46         ; $cf3e: f0 06     
            LDA $e8,x          ; $cf40: b5 e8     
            CMP #$c0           ; $cf42: c9 c0     
            BCC __cf55         ; $cf44: 90 0f     
__cf46:     LDY $07            ; $cf46: a4 07     
            STY $88,x          ; $cf48: 94 88     
            JSR __cd62         ; $cf4a: 20 62 cd  
            BCC __cf55         ; $cf4d: 90 06     
            SEC                ; $cf4f: 38        
            RTS                ; $cf50: 60        

;-------------------------------------------------------------------------------
__cf51:     LDA #$00           ; $cf51: a9 00     
            STA $88,x          ; $cf53: 95 88     
__cf55:     CLC                ; $cf55: 18        
            RTS                ; $cf56: 60        

;-------------------------------------------------------------------------------
__cf57:     ORA ($80,x)        ; $cf57: 01 80     
__cf59:     .hex 03 0d         ; $cf59: 03 0d     Invalid Opcode - SLO ($0d,x)
__cf5b:     LDA #$01           ; $cf5b: a9 01     
            STA $82,x          ; $cf5d: 95 82     
            LSR                ; $cf5f: 4a        
            STA $0a            ; $cf60: 85 0a     
            LDA #$08           ; $cf62: a9 08     
            JSR __cfc0         ; $cf64: 20 c0 cf  
            BMI __cf6d         ; $cf67: 30 04     
            LDA #$ff           ; $cf69: a9 ff     
            BNE __cfa7         ; $cf6b: d0 3a     
__cf6d:     LDA $68,x          ; $cf6d: b5 68     
            BNE __cf89         ; $cf6f: d0 18     
            LDA #$06           ; $cf71: a9 06     
            JSR __cfc0         ; $cf73: 20 c0 cf  
            BMI __cf7c         ; $cf76: 30 04     
            LDA #$e0           ; $cf78: a9 e0     
            STA $0a            ; $cf7a: 85 0a     
__cf7c:     LDA #$0a           ; $cf7c: a9 0a     
            JSR __cfc0         ; $cf7e: 20 c0 cf  
            BMI __cfa9         ; $cf81: 30 26     
            LDA $0a            ; $cf83: a5 0a     
            ORA #$07           ; $cf85: 09 07     
            BNE __cfa7         ; $cf87: d0 1e     
__cf89:     LDA #$01           ; $cf89: a9 01     
            STA $0c            ; $cf8b: 85 0c     
            LDY $62,x          ; $cf8d: b4 62     
            LDA __cf59,y       ; $cf8f: b9 59 cf  
            JSR __cfc0         ; $cf92: 20 c0 cf  
            BPL __cf99         ; $cf95: 10 02     
            DEC $0c            ; $cf97: c6 0c     
__cf99:     LDY $68,x          ; $cf99: b4 68     
            DEY                ; $cf9b: 88        
            LDA $0c            ; $cf9c: a5 0c     
            BNE __cfa4         ; $cf9e: d0 04     
            LDA #$00           ; $cfa0: a9 00     
            BEQ __cfa7         ; $cfa2: f0 03     
__cfa4:     LDA __cf57,y       ; $cfa4: b9 57 cf  
__cfa7:     STA $0a            ; $cfa7: 85 0a     
__cfa9:     LDA $64,x          ; $cfa9: b5 64     
            CLC                ; $cfab: 18        
            ADC #$08           ; $cfac: 69 08     
            AND #$07           ; $cfae: 29 07     
            TAY                ; $cfb0: a8        
            LDA __cbed,y       ; $cfb1: b9 ed cb  
            ORA $0a            ; $cfb4: 05 0a     
            CMP $0a            ; $cfb6: c5 0a     
            BNE __cfbd         ; $cfb8: d0 03     
            LDA #$01           ; $cfba: a9 01     
            RTS                ; $cfbc: 60        

;-------------------------------------------------------------------------------
__cfbd:     LDA #$00           ; $cfbd: a9 00     
            RTS                ; $cfbf: 60        

;-------------------------------------------------------------------------------
__cfc0:     CLC                ; $cfc0: 18        
            ADC $64,x          ; $cfc1: 75 64     
            JMP __dbb4         ; $cfc3: 4c b4 db  

;-------------------------------------------------------------------------------
__cfc6:     LDA $68,x          ; $cfc6: b5 68     
            BEQ __cfd3         ; $cfc8: f0 09     
            CMP #$01           ; $cfca: c9 01     
            BEQ __cfd1         ; $cfcc: f0 03     
            DEC $64,x          ; $cfce: d6 64     
            .hex 2c            ; $cfd0: 2c        Suspected data
__cfd1:     INC $64,x          ; $cfd1: f6 64     
__cfd3:     LDY #$05           ; $cfd3: a0 05     
            JSR __d17c         ; $cfd5: 20 7c d1  
            LDA $32,x          ; $cfd8: b5 32     
            BEQ __cfeb         ; $cfda: f0 0f     
            LDA $5a,x          ; $cfdc: b5 5a     
            CMP #$06           ; $cfde: c9 06     
            BCC __cfeb         ; $cfe0: 90 09     
            LDA $70,x          ; $cfe2: b5 70     
            AND #$40           ; $cfe4: 29 40     
            BEQ __cffc         ; $cfe6: f0 14     
            LDA #$05           ; $cfe8: a9 05     
            .hex 2c            ; $cfea: 2c        Suspected data
__cfeb:     LDA #$01           ; $cfeb: a9 01     
            STA $6a,x          ; $cfed: 95 6a     
__cfef:     LDA #$00           ; $cfef: a9 00     
            STA $32,x          ; $cff1: 95 32     
            STA $68,x          ; $cff3: 95 68     
            STA $60,x          ; $cff5: 95 60     
            STA $6c,x          ; $cff7: 95 6c     
            STA $6e,x          ; $cff9: 95 6e     
__cffb:     RTS                ; $cffb: 60        

;-------------------------------------------------------------------------------
__cffc:     LDA $70,x          ; $cffc: b5 70     
            AND #$80           ; $cffe: 29 80     
            BEQ __cffb         ; $d000: f0 f9     
            JSR __ce43         ; $d002: 20 43 ce  
            JMP __cfef         ; $d005: 4c ef cf  

;-------------------------------------------------------------------------------
__d008:     LDA $6a,x          ; $d008: b5 6a     
            CMP #$06           ; $d00a: c9 06     
            BEQ __d018         ; $d00c: f0 0a     
            CMP #$08           ; $d00e: c9 08     
            BEQ __d01e         ; $d010: f0 0c     
            JSR __ce5d         ; $d012: 20 5d ce  
            JMP __d021         ; $d015: 4c 21 d0  

;-------------------------------------------------------------------------------
__d018:     JSR __ce88         ; $d018: 20 88 ce  
            .hex 4c 21         ; $d01b: 4c 21     Suspected data
__d01d:     .hex d0            ; $d01d: d0        Suspected data
__d01e:     JSR __ce8b         ; $d01e: 20 8b ce  
__d021:     LDA $e0,x          ; $d021: b5 e0     
            BEQ __cffb         ; $d023: f0 d6     
__d025:     LDX $5f            ; $d025: a6 5f     
            LDA $86,x          ; $d027: b5 86     
            BNE __d04f         ; $d029: d0 24     
            LDA $6a,x          ; $d02b: b5 6a     
__d02d:     CMP #$04           ; $d02d: c9 04     
            BEQ __d04f         ; $d02f: f0 1e     
            LDA $5f            ; $d031: a5 5f     
            ASL                ; $d033: 0a        
            ASL                ; $d034: 0a        
            TAY                ; $d035: a8        
            LDA $021c,y        ; $d036: b9 1c 02  
            SEC                ; $d039: 38        
            SBC #$01           ; $d03a: e9 01     
            JSR __cedb         ; $d03c: 20 db ce  
            BCS __d04f         ; $d03f: b0 0e     
            LDA $e6,x          ; $d041: b5 e6     
            CMP #$03           ; $d043: c9 03     
            BCS __d04f         ; $d045: b0 08     
            LDA #$01           ; $d047: a9 01     
            STA $80,x          ; $d049: 95 80     
            STA $86,x          ; $d04b: 95 86     
            STA $82,x          ; $d04d: 95 82     
__d04f:     LDY #$07           ; $d04f: a0 07     
            LDA $60,x          ; $d051: b5 60     
            CMP #$0b           ; $d053: c9 0b     
            BCS __d05a         ; $d055: b0 03     
            INC $60,x          ; $d057: f6 60     
            DEY                ; $d059: 88        
__d05a:     JMP __d17c         ; $d05a: 4c 7c d1  

;-------------------------------------------------------------------------------
            INC $60,x          ; $d05d: f6 60     
            LDA $60,x          ; $d05f: b5 60     
            CMP #$14           ; $d061: c9 14     
            BCS __d07c         ; $d063: b0 17     
            CMP #$01           ; $d065: c9 01     
            BCC __cffb         ; $d067: 90 92     
            LDY #$0a           ; $d069: a0 0a     
            CMP #$0b           ; $d06b: c9 0b     
            BCS __d079         ; $d06d: b0 0a     
            CMP #$07           ; $d06f: c9 07     
            BCS __d077         ; $d071: b0 04     
            LDY #$07           ; $d073: a0 07     
            BNE __d079         ; $d075: d0 02     
__d077:     LDY #$09           ; $d077: a0 09     
__d079:     JMP __d17c         ; $d079: 4c 7c d1  

;-------------------------------------------------------------------------------
__d07c:     LDA #$01           ; $d07c: a9 01     
            STA $6a,x          ; $d07e: 95 6a     
            LSR                ; $d080: 4a        
            STA $60,x          ; $d081: 95 60     
            TAY                ; $d083: a8        
            BEQ __d079         ; $d084: f0 f3     
__d086:     .hex 8e            ; $d086: 8e        Suspected data
__d087:     BNE __d01d         ; $d087: d0 94     
            BNE __d025         ; $d089: d0 9a     
            BNE __d02d         ; $d08b: d0 a0     
            BNE __d0f7         ; $d08d: d0 68     
            ADC #$6a           ; $d08f: 69 6a     
            .hex 6b 6c         ; $d091: 6b 6c     Invalid Opcode - ARR #$6c
            ADC $696a          ; $d093: 6d 6a 69  
            PLA                ; $d096: 68        
            ADC $6b6c          ; $d097: 6d 6c 6b  
            ADC $6b6c          ; $d09a: 6d 6c 6b  
            ROR                ; $d09d: 6a        
            ADC #$68           ; $d09e: 69 68     
            .hex 6b 6c         ; $d0a0: 6b 6c     Invalid Opcode - ARR #$6c
            ADC $6968          ; $d0a2: 6d 68 69  
            ROR                ; $d0a5: 6a        
__d0a6:     BRK                ; $d0a6: 00        
            .hex 80 c0         ; $d0a7: 80 c0     Invalid Opcode - NOP #$c0
__d0a9:     RTI                ; $d0a9: 40        

;-------------------------------------------------------------------------------
            LDA $32,x          ; $d0aa: b5 32     
            BEQ __d0ca         ; $d0ac: f0 1c     
            CMP #$10           ; $d0ae: c9 10     
            BEQ __d0b8         ; $d0b0: f0 06     
            BCS __d0c0         ; $d0b2: b0 0c     
            LDY #$0b           ; $d0b4: a0 0b     
            BNE __d0c7         ; $d0b6: d0 0f     
__d0b8:     TXA                ; $d0b8: 8a        
            CLC                ; $d0b9: 18        
            ADC #$0b           ; $d0ba: 69 0b     
            TAX                ; $d0bc: aa        
            JMP __f691         ; $d0bd: 4c 91 f6  

;-------------------------------------------------------------------------------
__d0c0:     LDA #$00           ; $d0c0: a9 00     
            STA $e0,x          ; $d0c2: 95 e0     
            RTS                ; $d0c4: 60        

;-------------------------------------------------------------------------------
__d0c5:     LDY #$00           ; $d0c5: a0 00     
__d0c7:     JMP __d17c         ; $d0c7: 4c 7c d1  

;-------------------------------------------------------------------------------
__d0ca:     LDX $5f            ; $d0ca: a6 5f     
            JSR __d127         ; $d0cc: 20 27 d1  
            JSR __d0c5         ; $d0cf: 20 c5 d0  
            LDY #$03           ; $d0d2: a0 03     
            JSR __cd95         ; $d0d4: 20 95 cd  
            LDA $6c,x          ; $d0d7: b5 6c     
            ASL                ; $d0d9: 0a        
            TAY                ; $d0da: a8        
            LDA __d086,y       ; $d0db: b9 86 d0  
            STA $00            ; $d0de: 85 00     
            LDA __d087,y       ; $d0e0: b9 87 d0  
            STA $01            ; $d0e3: 85 01     
            LDY $6c,x          ; $d0e5: b4 6c     
            LDA __d0a6,y       ; $d0e7: b9 a6 d0  
            STA $02            ; $d0ea: 85 02     
            LDA #$01           ; $d0ec: a9 01     
            CPX #$00           ; $d0ee: e0 00     
            BEQ __d0f4         ; $d0f0: f0 02     
            LDA #$25           ; $d0f2: a9 25     
__d0f4:     TAX                ; $d0f4: aa        
            LDY #$00           ; $d0f5: a0 00     
__d0f7:     LDA ($00),y        ; $d0f7: b1 00     
            STA $0200,x        ; $d0f9: 9d 00 02  
            INX                ; $d0fc: e8        
            LDA $0200,x        ; $d0fd: bd 00 02  
            AND #$03           ; $d100: 29 03     
            ORA $02            ; $d102: 05 02     
            STA $0200,x        ; $d104: 9d 00 02  
            INX                ; $d107: e8        
            INX                ; $d108: e8        
            INX                ; $d109: e8        
            INY                ; $d10a: c8        
            CPY #$06           ; $d10b: c0 06     
            BCC __d0f7         ; $d10d: 90 e8     
            LDX $5f            ; $d10f: a6 5f     
__d111:     LDA $32,x          ; $d111: b5 32     
            BNE __d126         ; $d113: d0 11     
            LDY #$0b           ; $d115: a0 0b     
__d117:     LDA $0090,y        ; $d117: b9 90 00  
            CMP #$20           ; $d11a: c9 20     
            BNE __d123         ; $d11c: d0 05     
            LDA #$ff           ; $d11e: a9 ff     
            STA $0090,y        ; $d120: 99 90 00  
__d123:     DEY                ; $d123: 88        
            BNE __d117         ; $d124: d0 f1     
__d126:     RTS                ; $d126: 60        

;-------------------------------------------------------------------------------
__d127:     LDA #$01           ; $d127: a9 01     
            STA $e4,x          ; $d129: 95 e4     
            LDA #$80           ; $d12b: a9 80     
            STA $e2,x          ; $d12d: 95 e2     
            LDA #$01           ; $d12f: a9 01     
            STA $2f,x          ; $d131: 95 2f     
__d133:     LDA $66,x          ; $d133: b5 66     
            STA $01            ; $d135: 85 01     
            LDA $5f            ; $d137: a5 5f     
            JSR __c83d         ; $d139: 20 3d c8  
            LDX $5f            ; $d13c: a6 5f     
            LDA $01            ; $d13e: a5 01     
            STA $66,x          ; $d140: 95 66     
            RTS                ; $d142: 60        

;-------------------------------------------------------------------------------
__d143:     LDY $6a,x          ; $d143: b4 6a     
            CPY #$01           ; $d145: c0 01     
            BNE __d160         ; $d147: d0 17     
            LDA $6e,x          ; $d149: b5 6e     
            CMP #$18           ; $d14b: c9 18     
            BCS __d151         ; $d14d: b0 02     
            INC $6e,x          ; $d14f: f6 6e     
__d151:     LDA $76,x          ; $d151: b5 76     
            CLC                ; $d153: 18        
            ADC #$20           ; $d154: 69 20     
            STA $76,x          ; $d156: 95 76     
            BCC __d171         ; $d158: 90 17     
            JSR __d171         ; $d15a: 20 71 d1  
            JMP __d171         ; $d15d: 4c 71 d1  

;-------------------------------------------------------------------------------
__d160:     LDA #$90           ; $d160: a9 90     
            LDY $6e,x          ; $d162: b4 6e     
            CPY #$0c           ; $d164: c0 0c     
            BCS __d16a         ; $d166: b0 02     
            LDA #$45           ; $d168: a9 45     
__d16a:     CLC                ; $d16a: 18        
            ADC $72,x          ; $d16b: 75 72     
            STA $72,x          ; $d16d: 95 72     
            BCC __d17b         ; $d16f: 90 0a     
__d171:     LDY $62,x          ; $d171: b4 62     
            LDA __cbda,y       ; $d173: b9 da cb  
            CLC                ; $d176: 18        
            ADC $64,x          ; $d177: 75 64     
            STA $64,x          ; $d179: 95 64     
__d17b:     RTS                ; $d17b: 60        

;-------------------------------------------------------------------------------
__d17c:     LDA __cbb3,y       ; $d17c: b9 b3 cb  
            STA $02            ; $d17f: 85 02     
            TYA                ; $d181: 98        
            PHA                ; $d182: 48        
            LDX $5f            ; $d183: a6 5f     
            LDA $64,x          ; $d185: b5 64     
            STA $00            ; $d187: 85 00     
            LDA $66,x          ; $d189: b5 66     
            CPY #$0a           ; $d18b: c0 0a     
            BNE __d192         ; $d18d: d0 03     
            SEC                ; $d18f: 38        
            SBC #$08           ; $d190: e9 08     
__d192:     STA $01            ; $d192: 85 01     
            LDA $62,x          ; $d194: b5 62     
            STA $0f            ; $d196: 85 0f     
            TXA                ; $d198: 8a        
            TAY                ; $d199: a8        
            INY                ; $d19a: c8        
            JSR __d1db         ; $d19b: 20 db d1  
            PLA                ; $d19e: 68        
            CMP #$0b           ; $d19f: c9 0b     
            BEQ __d1a7         ; $d1a1: f0 04     
            CMP #$06           ; $d1a3: c9 06     
            BCS __d1ab         ; $d1a5: b0 04     
__d1a7:     LDA #$f8           ; $d1a7: a9 f8     
            BNE __d1d2         ; $d1a9: d0 27     
__d1ab:     SEC                ; $d1ab: 38        
            SBC #$06           ; $d1ac: e9 06     
            STA $07            ; $d1ae: 85 07     
            LDY $07            ; $d1b0: a4 07     
            LDA __cbc1,y       ; $d1b2: b9 c1 cb  
            STA $02            ; $d1b5: 85 02     
            LDA $07            ; $d1b7: a5 07     
            ASL                ; $d1b9: 0a        
            ASL                ; $d1ba: 0a        
            TAY                ; $d1bb: a8        
            LDX $5f            ; $d1bc: a6 5f     
            LDA $62,x          ; $d1be: b5 62     
            BEQ __d1c4         ; $d1c0: f0 02     
            INY                ; $d1c2: c8        
            INY                ; $d1c3: c8        
__d1c4:     LDA __cbc6,y       ; $d1c4: b9 c6 cb  
            CLC                ; $d1c7: 18        
            ADC $64,x          ; $d1c8: 75 64     
            STA $00            ; $d1ca: 85 00     
            LDA __cbc7,y       ; $d1cc: b9 c7 cb  
            CLC                ; $d1cf: 18        
            ADC $66,x          ; $d1d0: 75 66     
__d1d2:     STA $01            ; $d1d2: 85 01     
            LDY #$0b           ; $d1d4: a0 0b     
            CPX #$00           ; $d1d6: e0 00     
            BEQ __d1db         ; $d1d8: f0 01     
            INY                ; $d1da: c8        
__d1db:     LDA #$01           ; $d1db: a9 01     
            STA $0e            ; $d1dd: 85 0e     
            JSR __eafc         ; $d1df: 20 fc ea  
            LDX $5f            ; $d1e2: a6 5f     
            RTS                ; $d1e4: 60        

;-------------------------------------------------------------------------------
__d1e5:     LDX #$01           ; $d1e5: a2 01     
__d1e7:     LDA $5a,x          ; $d1e7: b5 5a     
            BEQ __d1f5         ; $d1e9: f0 0a     
            LDA $66,x          ; $d1eb: b5 66     
            CLC                ; $d1ed: 18        
            ADC #$18           ; $d1ee: 69 18     
            JSR __d1f9         ; $d1f0: 20 f9 d1  
            STA $5a,x          ; $d1f3: 95 5a     
__d1f5:     DEX                ; $d1f5: ca        
            BPL __d1e7         ; $d1f6: 10 ef     
            RTS                ; $d1f8: 60        

;-------------------------------------------------------------------------------
__d1f9:     LDY #$00           ; $d1f9: a0 00     
__d1fb:     CMP __cbe8,y       ; $d1fb: d9 e8 cb  
            BCC __d206         ; $d1fe: 90 06     
            INY                ; $d200: c8        
            CPY #$05           ; $d201: c0 05     
            BNE __d1fb         ; $d203: d0 f6     
            DEY                ; $d205: 88        
__d206:     STY $0a            ; $d206: 84 0a     
            LDA $90            ; $d208: a5 90     
            SEC                ; $d20a: 38        
            SBC $0a            ; $d20b: e5 0a     
            BNE __d211         ; $d20d: d0 02     
            LDA #$01           ; $d20f: a9 01     
__d211:     RTS                ; $d211: 60        

;-------------------------------------------------------------------------------
__d212:     LDA $5a            ; $d212: a5 5a     
            AND $5b            ; $d214: 25 5b     
            BEQ __d211         ; $d216: f0 f9     
            LDA $2d            ; $d218: a5 2d     
            ORA $2e            ; $d21a: 05 2e     
            BNE __d211         ; $d21c: d0 f3     
            LDA #$07           ; $d21e: a9 07     
            CMP $6a            ; $d220: c5 6a     
            BEQ __d211         ; $d222: f0 ed     
            CMP $6b            ; $d224: c5 6b     
            BEQ __d211         ; $d226: f0 e9     
            JSR __d2d9         ; $d228: 20 d9 d2  
            BCS __d211         ; $d22b: b0 e4     
            LDA #$00           ; $d22d: a9 00     
            STA $02            ; $d22f: 85 02     
            LDA $6a            ; $d231: a5 6a     
            LSR                ; $d233: 4a        
            BCS __d25a         ; $d234: b0 24     
            LDA $00            ; $d236: a5 00     
            CMP #$09           ; $d238: c9 09     
            BCS __d25a         ; $d23a: b0 1e     
            LDA $66            ; $d23c: a5 66     
            CMP $67            ; $d23e: c5 67     
            BCS __d249         ; $d240: b0 07     
            CMP #$c3           ; $d242: c9 c3     
            BCS __d24b         ; $d244: b0 05     
            DEC $66            ; $d246: c6 66     
            .hex 2c            ; $d248: 2c        Suspected data
__d249:     INC $66            ; $d249: e6 66     
__d24b:     LDA $62            ; $d24b: a5 62     
            BEQ __d252         ; $d24d: f0 03     
            INC $64            ; $d24f: e6 64     
            .hex 2c            ; $d251: 2c        Suspected data
__d252:     DEC $64            ; $d252: c6 64     
            LDA #$01           ; $d254: a9 01     
            STA $02            ; $d256: 85 02     
            BNE __d269         ; $d258: d0 0f     
__d25a:     LDX #$00           ; $d25a: a2 00     
            LDA $03            ; $d25c: a5 03     
            BPL __d264         ; $d25e: 10 04     
            LDA #$00           ; $d260: a9 00     
            BEQ __d266         ; $d262: f0 02     
__d264:     LDA #$01           ; $d264: a9 01     
__d266:     JSR __d2bc         ; $d266: 20 bc d2  
__d269:     LDA $6b            ; $d269: a5 6b     
            AND #$01           ; $d26b: 29 01     
            BNE __d2b6         ; $d26d: d0 47     
            LDA $00            ; $d26f: a5 00     
            CMP #$09           ; $d271: c9 09     
            BCS __d2b6         ; $d273: b0 41     
            LDA $67            ; $d275: a5 67     
            CMP $66            ; $d277: c5 66     
            BCS __d282         ; $d279: b0 07     
            CMP #$c3           ; $d27b: c9 c3     
            BCS __d284         ; $d27d: b0 05     
            DEC $67            ; $d27f: c6 67     
            .hex 2c            ; $d281: 2c        Suspected data
__d282:     INC $67            ; $d282: e6 67     
__d284:     LDA $02            ; $d284: a5 02     
            BEQ __d2b5         ; $d286: f0 2d     
            LDA $e6            ; $d288: a5 e6     
            PHA                ; $d28a: 48        
            LDA $e7            ; $d28b: a5 e7     
            STA $e6            ; $d28d: 85 e6     
            PLA                ; $d28f: 68        
            STA $e7            ; $d290: 85 e7     
            LDA $e8            ; $d292: a5 e8     
            PHA                ; $d294: 48        
            LDA $e9            ; $d295: a5 e9     
            STA $e8            ; $d297: 85 e8     
            PLA                ; $d299: 68        
            STA $e9            ; $d29a: 85 e9     
            LDX #$01           ; $d29c: a2 01     
__d29e:     LDA $e6,x          ; $d29e: b5 e6     
            CMP #$06           ; $d2a0: c9 06     
            BCC __d2a8         ; $d2a2: 90 04     
            LDA #$05           ; $d2a4: a9 05     
            STA $e6,x          ; $d2a6: 95 e6     
__d2a8:     DEX                ; $d2a8: ca        
            BPL __d29e         ; $d2a9: 10 f3     
            LDA #$00           ; $d2ab: a9 00     
            STA $86            ; $d2ad: 85 86     
            STA $87            ; $d2af: 85 87     
            STA $88            ; $d2b1: 85 88     
            STA $89            ; $d2b3: 85 89     
__d2b5:     RTS                ; $d2b5: 60        

;-------------------------------------------------------------------------------
__d2b6:     LDX #$01           ; $d2b6: a2 01     
            LDA $62            ; $d2b8: a5 62     
            EOR #$01           ; $d2ba: 49 01     
__d2bc:     STA $62,x          ; $d2bc: 95 62     
            BEQ __d2c7         ; $d2be: f0 07     
            INC $64,x          ; $d2c0: f6 64     
            INC $64,x          ; $d2c2: f6 64     
            JMP __d2cb         ; $d2c4: 4c cb d2  

;-------------------------------------------------------------------------------
__d2c7:     DEC $64,x          ; $d2c7: d6 64     
            DEC $64,x          ; $d2c9: d6 64     
__d2cb:     LDA $68,x          ; $d2cb: b5 68     
            LSR                ; $d2cd: 4a        
            BCC __d2d2         ; $d2ce: 90 02     
            LDA #$02           ; $d2d0: a9 02     
__d2d2:     STA $68,x          ; $d2d2: 95 68     
            LDA #$18           ; $d2d4: a9 18     
            STA $6e,x          ; $d2d6: 95 6e     
            RTS                ; $d2d8: 60        

;-------------------------------------------------------------------------------
__d2d9:     LDA $64            ; $d2d9: a5 64     
            SEC                ; $d2db: 38        
            SBC $65            ; $d2dc: e5 65     
            STA $03            ; $d2de: 85 03     
            JSR __d2f9         ; $d2e0: 20 f9 d2  
            STA $00            ; $d2e3: 85 00     
            CMP #$0a           ; $d2e5: c9 0a     
            BCS __d2f8         ; $d2e7: b0 0f     
            LDA $66            ; $d2e9: a5 66     
            SEC                ; $d2eb: 38        
            SBC $67            ; $d2ec: e5 67     
            JSR __d2f9         ; $d2ee: 20 f9 d2  
            STA $01            ; $d2f1: 85 01     
            CMP #$15           ; $d2f3: c9 15     
            BCC __d2f8         ; $d2f5: 90 01     
            SEC                ; $d2f7: 38        
__d2f8:     RTS                ; $d2f8: 60        

;-------------------------------------------------------------------------------
__d2f9:     BPL __d300         ; $d2f9: 10 05     
__d2fb:     EOR #$ff           ; $d2fb: 49 ff     
            CLC                ; $d2fd: 18        
            ADC #$01           ; $d2fe: 69 01     
__d300:     RTS                ; $d300: 60        

;-------------------------------------------------------------------------------
__d301:     LDX #$00           ; $d301: a2 00     
            JSR __d308         ; $d303: 20 08 d3  
            LDX #$01           ; $d306: a2 01     
__d308:     LDA $5a,x          ; $d308: b5 5a     
            BEQ __d371         ; $d30a: f0 65     
            LDA $6a,x          ; $d30c: b5 6a     
            BEQ __d371         ; $d30e: f0 61     
            CMP #$07           ; $d310: c9 07     
            BEQ __d371         ; $d312: f0 5d     
            CMP #$09           ; $d314: c9 09     
            BEQ __d371         ; $d316: f0 59     
            LDA $2d,x          ; $d318: b5 2d     
            BNE __d371         ; $d31a: d0 55     
            LDA $64,x          ; $d31c: b5 64     
            CLC                ; $d31e: 18        
            ADC #$08           ; $d31f: 69 08     
            STA $0a            ; $d321: 85 0a     
            LDA $66,x          ; $d323: b5 66     
            CLC                ; $d325: 18        
            ADC #$0c           ; $d326: 69 0c     
            STA $0b            ; $d328: 85 0b     
            TXA                ; $d32a: 8a        
            PHA                ; $d32b: 48        
            LDY #$00           ; $d32c: a0 00     
__d32e:     LDA #$01           ; $d32e: a9 01     
            JSR __db1d         ; $d330: 20 1d db  
            BCS __d33c         ; $d333: b0 07     
            INY                ; $d335: c8        
            CPY #$0b           ; $d336: c0 0b     
            BCC __d32e         ; $d338: 90 f4     
            PLA                ; $d33a: 68        
            RTS                ; $d33b: 60        

;-------------------------------------------------------------------------------
__d33c:     PLA                ; $d33c: 68        
            TAX                ; $d33d: aa        
            LDA $55            ; $d33e: a5 55     
            CMP #$02           ; $d340: c9 02     
            BEQ __d393         ; $d342: f0 4f     
            CPY #$01           ; $d344: c0 01     
            BEQ __d372         ; $d346: f0 2a     
            JSR __d446         ; $d348: 20 46 d4  
            LDA #$20           ; $d34b: a9 20     
            STA $0091,y        ; $d34d: 99 91 00  
            CPY #$02           ; $d350: c0 02     
            BCC __d371         ; $d352: 90 1d     
            CPY #$08           ; $d354: c0 08     
            BCS __d371         ; $d356: b0 19     
            CPY #$05           ; $d358: c0 05     
            BCS __d367         ; $d35a: b0 0b     
            LDA $0094,y        ; $d35c: b9 94 00  
            BPL __d371         ; $d35f: 10 10     
            LDA #$20           ; $d361: a9 20     
            STA $0094,y        ; $d363: 99 94 00  
            RTS                ; $d366: 60        

;-------------------------------------------------------------------------------
__d367:     LDA $008e,y        ; $d367: b9 8e 00  
            BPL __d371         ; $d36a: 10 05     
            LDA #$20           ; $d36c: a9 20     
            STA $008e,y        ; $d36e: 99 8e 00  
__d371:     RTS                ; $d371: 60        

;-------------------------------------------------------------------------------
__d372:     LDY #$01           ; $d372: a0 01     
            LDA $00            ; $d374: a5 00     
            BMI __d37f         ; $d376: 30 07     
            DEC $64,x          ; $d378: d6 64     
            DEC $64,x          ; $d37a: d6 64     
            INY                ; $d37c: c8        
            BNE __d383         ; $d37d: d0 04     
__d37f:     INC $64,x          ; $d37f: f6 64     
            INC $64,x          ; $d381: f6 64     
__d383:     LDA $6a,x          ; $d383: b5 6a     
            AND #$01           ; $d385: 29 01     
            BEQ __d390         ; $d387: f0 07     
            STY $68,x          ; $d389: 94 68     
            TYA                ; $d38b: 98        
            AND #$01           ; $d38c: 29 01     
            STA $62,x          ; $d38e: 95 62     
__d390:     RTS                ; $d390: 60        

;-------------------------------------------------------------------------------
__d391:     BRK                ; $d391: 00        
            .hex 05            ; $d392: 05        Suspected data
__d393:     CPY #$03           ; $d393: c0 03     
            BCC __d3ab         ; $d395: 90 14     
            CPY #$09           ; $d397: c0 09     
            BCS __d3ab         ; $d399: b0 10     
            LDA #$01           ; $d39b: a9 01     
            STA $0091,y        ; $d39d: 99 91 00  
            LDA __d391,x       ; $d3a0: bd 91 d3  
            TAX                ; $d3a3: aa        
            INC $0361,x        ; $d3a4: fe 61 03  
            LDA #$10           ; $d3a7: a9 10     
            STA $fe            ; $d3a9: 85 fe     
__d3ab:     RTS                ; $d3ab: 60        

;-------------------------------------------------------------------------------
__d3ac:     LDX #$00           ; $d3ac: a2 00     
            JSR __d3b3         ; $d3ae: 20 b3 d3  
            LDX #$01           ; $d3b1: a2 01     
__d3b3:     LDA $5a,x          ; $d3b3: b5 5a     
            BEQ __d3f5         ; $d3b5: f0 3e     
            TXA                ; $d3b7: 8a        
            ASL                ; $d3b8: 0a        
            ASL                ; $d3b9: 0a        
            TAY                ; $d3ba: a8        
            LDA $021c,y        ; $d3bb: b9 1c 02  
            CLC                ; $d3be: 18        
            ADC #$0a           ; $d3bf: 69 0a     
            STA $0b            ; $d3c1: 85 0b     
            LDA $021f,y        ; $d3c3: b9 1f 02  
            CLC                ; $d3c6: 18        
            ADC #$04           ; $d3c7: 69 04     
            STA $0a            ; $d3c9: 85 0a     
            STX $09            ; $d3cb: 86 09     
            LDY #$0a           ; $d3cd: a0 0a     
__d3cf:     LDX $09            ; $d3cf: a6 09     
            CPY #$00           ; $d3d1: c0 00     
            BEQ __d3d9         ; $d3d3: f0 04     
            CPY #$08           ; $d3d5: c0 08     
            BCC __d3df         ; $d3d7: 90 06     
__d3d9:     LDA $6a,x          ; $d3d9: b5 6a     
            CMP #$04           ; $d3db: c9 04     
            BEQ __d3eb         ; $d3dd: f0 0c     
__d3df:     LDA $6a,x          ; $d3df: b5 6a     
            CMP #$05           ; $d3e1: c9 05     
            BNE __d3f2         ; $d3e3: d0 0d     
            LDA $60,x          ; $d3e5: b5 60     
            CMP #$09           ; $d3e7: c9 09     
            BNE __d3f2         ; $d3e9: d0 07     
__d3eb:     LDA #$00           ; $d3eb: a9 00     
            JSR __db1d         ; $d3ed: 20 1d db  
            BCS __d3f6         ; $d3f0: b0 04     
__d3f2:     DEY                ; $d3f2: 88        
            BPL __d3cf         ; $d3f3: 10 da     
__d3f5:     RTS                ; $d3f5: 60        

;-------------------------------------------------------------------------------
__d3f6:     LDX $09            ; $d3f6: a6 09     
            LDA #$01           ; $d3f8: a9 01     
            CPY #$01           ; $d3fa: c0 01     
            BNE __d400         ; $d3fc: d0 02     
            LDA #$05           ; $d3fe: a9 05     
__d400:     STA $0091,y        ; $d400: 99 91 00  
            LDA #$00           ; $d403: a9 00     
            STA $03b1,y        ; $d405: 99 b1 03  
            LDA #$ff           ; $d408: a9 ff     
            STA $03d2,y        ; $d40a: 99 d2 03  
            TXA                ; $d40d: 8a        
            PHA                ; $d40e: 48        
            JSR __d421         ; $d40f: 20 21 d4  
            PLA                ; $d412: 68        
            TAX                ; $d413: aa        
            CPY #$00           ; $d414: c0 00     
            BEQ __d3f5         ; $d416: f0 dd     
            CPY #$08           ; $d418: c0 08     
            BCS __d3f5         ; $d41a: b0 d9     
            STX $5f            ; $d41c: 86 5f     
            JMP __d07c         ; $d41e: 4c 7c d0  

;-------------------------------------------------------------------------------
__d421:     LDA __d391,x       ; $d421: bd 91 d3  
            TAX                ; $d424: aa        
            CPY #$00           ; $d425: c0 00     
            BNE __d431         ; $d427: d0 08     
            INC $0363,x        ; $d429: fe 63 03  
            LDA #$01           ; $d42c: a9 01     
            STA $fe            ; $d42e: 85 fe     
            RTS                ; $d430: 60        

;-------------------------------------------------------------------------------
__d431:     CPY #$05           ; $d431: c0 05     
            BCC __d43c         ; $d433: 90 07     
            CPY #$08           ; $d435: c0 08     
            BCS __d441         ; $d437: b0 08     
            INC $0362,x        ; $d439: fe 62 03  
__d43c:     LDA #$08           ; $d43c: a9 08     
            STA $ff            ; $d43e: 85 ff     
            RTS                ; $d440: 60        

;-------------------------------------------------------------------------------
__d441:     LDA #$02           ; $d441: a9 02     
            STA $fc            ; $d443: 85 fc     
            RTS                ; $d445: 60        

;-------------------------------------------------------------------------------
__d446:     LDA #$07           ; $d446: a9 07     
            STA $6a,x          ; $d448: 95 6a     
            LDA $5a,x          ; $d44a: b5 5a     
            STA $0382,x        ; $d44c: 9d 82 03  
            TXA                ; $d44f: 8a        
            PHA                ; $d450: 48        
            CLC                ; $d451: 18        
            ADC #$0d           ; $d452: 69 0d     
            TAX                ; $d454: aa        
            JSR __f691         ; $d455: 20 91 f6  
            PLA                ; $d458: 68        
            TAX                ; $d459: aa        
            LDA #$40           ; $d45a: a9 40     
            STA $32,x          ; $d45c: 95 32     
            LDA #$01           ; $d45e: a9 01     
            STA $ff            ; $d460: 85 ff     
            RTS                ; $d462: 60        

;-------------------------------------------------------------------------------
__d463:     LDX #$00           ; $d463: a2 00     
__d465:     LDA $5a,x          ; $d465: b5 5a     
            BEQ __d487         ; $d467: f0 1e     
            LDA $66,x          ; $d469: b5 66     
            CLC                ; $d46b: 18        
            ADC #$19           ; $d46c: 69 19     
            JSR __cedb         ; $d46e: 20 db ce  
            BCS __d487         ; $d471: b0 14     
            CPY #$0a           ; $d473: c0 0a     
            BNE __d487         ; $d475: d0 10     
            LDA #$00           ; $d477: a9 00     
            STA $5a,x          ; $d479: 95 5a     
            STA $e0,x          ; $d47b: 95 e0     
            LDA $2d,x          ; $d47d: b5 2d     
            BNE __d483         ; $d47f: d0 02     
            DEC $20,x          ; $d481: d6 20     
__d483:     LDA #$08           ; $d483: a9 08     
            STA $3f,x          ; $d485: 95 3f     
__d487:     INX                ; $d487: e8        
            CPX #$02           ; $d488: e0 02     
            BNE __d465         ; $d48a: d0 d9     
__d48c:     RTS                ; $d48c: 60        

;-------------------------------------------------------------------------------
__d48d:     BIT $ac64          ; $d48d: 2c 64 ac  
__d490:     JMP __cc94         ; $d490: 4c 94 cc  

;-------------------------------------------------------------------------------
__d493:     LDX #$01           ; $d493: a2 01     
__d495:     LDA $5a,x          ; $d495: b5 5a     
            CMP #$09           ; $d497: c9 09     
            BNE __d4ce         ; $d499: d0 33     
            LDY #$02           ; $d49b: a0 02     
__d49d:     LDA $64,x          ; $d49d: b5 64     
            CMP __d48d,y       ; $d49f: d9 8d d4  
            BCC __d4a9         ; $d4a2: 90 05     
            CMP __d490,y       ; $d4a4: d9 90 d4  
            BCC __d4ae         ; $d4a7: 90 05     
__d4a9:     DEY                ; $d4a9: 88        
            BPL __d49d         ; $d4aa: 10 f1     
            BMI __d4ce         ; $d4ac: 30 20     
__d4ae:     LDA $e6,x          ; $d4ae: b5 e6     
            CMP #$03           ; $d4b0: c9 03     
            BCC __d4c0         ; $d4b2: 90 0c     
            LDA $66,x          ; $d4b4: b5 66     
            CMP #$14           ; $d4b6: c9 14     
            BCS __d4ce         ; $d4b8: b0 14     
            CMP #$10           ; $d4ba: c9 10     
            BCS __d4d2         ; $d4bc: b0 14     
            BCC __d4ce         ; $d4be: 90 0e     
__d4c0:     LDA $66,x          ; $d4c0: b5 66     
            CMP #$2c           ; $d4c2: c9 2c     
            BCS __d4ce         ; $d4c4: b0 08     
            CMP #$28           ; $d4c6: c9 28     
            BCC __d4ce         ; $d4c8: 90 04     
            LDA #$03           ; $d4ca: a9 03     
            STA $e6,x          ; $d4cc: 95 e6     
__d4ce:     DEX                ; $d4ce: ca        
            BPL __d495         ; $d4cf: 10 c4     
            RTS                ; $d4d1: 60        

;-------------------------------------------------------------------------------
__d4d2:     LDA #$10           ; $d4d2: a9 10     
            STA $66,x          ; $d4d4: 95 66     
            LDA #$09           ; $d4d6: a9 09     
            CMP $5a            ; $d4d8: c5 5a     
            BEQ __d4e4         ; $d4da: f0 08     
            CMP $5b            ; $d4dc: c5 5b     
            BNE __d48c         ; $d4de: d0 ac     
            LDA #$01           ; $d4e0: a9 01     
            BNE __d4ee         ; $d4e2: d0 0a     
__d4e4:     LDA #$00           ; $d4e4: a9 00     
            LDY $5b            ; $d4e6: a4 5b     
            CPY #$09           ; $d4e8: c0 09     
            BNE __d4ee         ; $d4ea: d0 02     
            LDA #$02           ; $d4ec: a9 02     
__d4ee:     STA $26            ; $d4ee: 85 26     
            LDA #$02           ; $d4f0: a9 02     
            BIT $01a9          ; $d4f2: 2c a9 01  
__d4f5:     STA $55            ; $d4f5: 85 55     
            LDA #$80           ; $d4f7: a9 80     
            STA $fb            ; $d4f9: 85 fb     
            ASL                ; $d4fb: 0a        
            STA $34            ; $d4fc: 85 34     
            STA $51            ; $d4fe: 85 51     
            RTS                ; $d500: 60        

;-------------------------------------------------------------------------------
__d501:     ORA ($02,x)        ; $d501: 01 02     
            .hex 04 04         ; $d503: 04 04     Invalid Opcode - NOP $04
__d505:     ASL                ; $d505: 0a        
            .hex 05            ; $d506: 05        Suspected data
__d507:     LDA $13            ; $d507: a5 13     
            BNE __d547         ; $d509: d0 3c     
            LDA $66,x          ; $d50b: b5 66     
            CMP #$26           ; $d50d: c9 26     
            BCS __d547         ; $d50f: b0 36     
            LDA $0361          ; $d511: ad 61 03  
            ADC $0366          ; $d514: 6d 66 03  
            LSR                ; $d517: 4a        
            AND #$03           ; $d518: 29 03     
            TAY                ; $d51a: a8        
            LDA __d501,y       ; $d51b: b9 01 d5  
            STA $01            ; $d51e: 85 01     
            LDY $d5            ; $d520: a4 d5     
            LDA __d505,y       ; $d522: b9 05 d5  
            CLC                ; $d525: 18        
            ADC $d6            ; $d526: 65 d6     
            STA $00            ; $d528: 85 00     
            CMP $64,x          ; $d52a: d5 64     
            BCS __d547         ; $d52c: b0 19     
            ADC $01            ; $d52e: 65 01     
            CMP $64,x          ; $d530: d5 64     
            BCC __d547         ; $d532: 90 13     
            LDA $00            ; $d534: a5 00     
            STA $64,x          ; $d536: 95 64     
            INX                ; $d538: e8        
            STX $1e            ; $d539: 86 1e     
            DEX                ; $d53b: ca        
            LDA #$06           ; $d53c: a9 06     
            STA $6a,x          ; $d53e: 95 6a     
            LDA #$10           ; $d540: a9 10     
            STA $fb            ; $d542: 85 fb     
            ASL                ; $d544: 0a        
            STA $4d            ; $d545: 85 4d     
__d547:     LDA $5f            ; $d547: a5 5f     
            ASL                ; $d549: 0a        
            ASL                ; $d54a: 0a        
            TAY                ; $d54b: a8        
            LDA #$f8           ; $d54c: a9 f8     
            STA $021c,y        ; $d54e: 99 1c 02  
            RTS                ; $d551: 60        

;-------------------------------------------------------------------------------
            LDA $6a,x          ; $d552: b5 6a     
            CMP #$01           ; $d554: c9 01     
            BEQ __d561         ; $d556: f0 09     
            CMP #$02           ; $d558: c9 02     
            BEQ __d567         ; $d55a: f0 0b     
            CMP #$03           ; $d55c: c9 03     
            BEQ __d564         ; $d55e: f0 04     
            RTS                ; $d560: 60        

;-------------------------------------------------------------------------------
__d561:     JMP __cdb0         ; $d561: 4c b0 cd  

;-------------------------------------------------------------------------------
__d564:     JMP __cfc6         ; $d564: 4c c6 cf  

;-------------------------------------------------------------------------------
__d567:     LDA #$a8           ; $d567: a9 a8     
            STA $e2,x          ; $d569: 95 e2     
            LDA #$03           ; $d56b: a9 03     
            STA $e4,x          ; $d56d: 95 e4     
            LDA $68,x          ; $d56f: b5 68     
            BNE __d58d         ; $d571: d0 1a     
            LDA $e6,x          ; $d573: b5 e6     
            CMP #$03           ; $d575: c9 03     
            BCC __d58d         ; $d577: 90 14     
            LDA $70,x          ; $d579: b5 70     
            AND #$03           ; $d57b: 29 03     
            BEQ __d58d         ; $d57d: f0 0e     
            STA $68,x          ; $d57f: 95 68     
            CMP #$01           ; $d581: c9 01     
            BEQ __d587         ; $d583: f0 02     
            LDA #$00           ; $d585: a9 00     
__d587:     STA $62,x          ; $d587: 95 62     
            LDA #$0f           ; $d589: a9 0f     
            STA $6e,x          ; $d58b: 95 6e     
__d58d:     LDA $68,x          ; $d58d: b5 68     
            BEQ __d594         ; $d58f: f0 03     
            JSR __d160         ; $d591: 20 60 d1  
__d594:     JSR __d133         ; $d594: 20 33 d1  
            LDY #$07           ; $d597: a0 07     
            JMP __d17c         ; $d599: 4c 7c d1  

;-------------------------------------------------------------------------------
            LDA #$00           ; $d59c: a9 00     
            STA $2a,x          ; $d59e: 95 2a     
            LDA $13            ; $d5a0: a5 13     
            CLC                ; $d5a2: 18        
            ADC $66,x          ; $d5a3: 75 66     
            BCS __d5b0         ; $d5a5: b0 09     
            STA $28,x          ; $d5a7: 95 28     
            LDY $27            ; $d5a9: a4 27     
            BEQ __d5b4         ; $d5ab: f0 07     
            SEC                ; $d5ad: 38        
            SBC #$10           ; $d5ae: e9 10     
__d5b0:     STA $28,x          ; $d5b0: 95 28     
            INC $2a,x          ; $d5b2: f6 2a     
__d5b4:     LDA $2a,x          ; $d5b4: b5 2a     
            STA $09            ; $d5b6: 85 09     
            LDA $28,x          ; $d5b8: b5 28     
            STA $0b            ; $d5ba: 85 0b     
            CLC                ; $d5bc: 18        
            ADC #$18           ; $d5bd: 69 18     
            STA $0a            ; $d5bf: 85 0a     
            BCC __d5c5         ; $d5c1: 90 02     
            INC $09            ; $d5c3: e6 09     
__d5c5:     LDA $64,x          ; $d5c5: b5 64     
            STA $0d            ; $d5c7: 85 0d     
            CLC                ; $d5c9: 18        
            ADC #$10           ; $d5ca: 69 10     
            STA $0c            ; $d5cc: 85 0c     
            LDA $0352,x        ; $d5ce: bd 52 03  
            BNE __d648         ; $d5d1: d0 75     
            LDY #$00           ; $d5d3: a0 00     
__d5d5:     LDA $06e0,y        ; $d5d5: b9 e0 06  
            BMI __d603         ; $d5d8: 30 29     
            CMP $09            ; $d5da: c5 09     
            BNE __d603         ; $d5dc: d0 25     
            LDA $0668,y        ; $d5de: b9 68 06  
            SBC #$08           ; $d5e1: e9 08     
            CMP $64,x          ; $d5e3: d5 64     
            BCS __d603         ; $d5e5: b0 1c     
            LDA $0686,y        ; $d5e7: b9 86 06  
            SEC                ; $d5ea: 38        
            SBC #$08           ; $d5eb: e9 08     
            CMP $64,x          ; $d5ed: d5 64     
            BCC __d603         ; $d5ef: 90 12     
            LDA $0a            ; $d5f1: a5 0a     
            SBC #$03           ; $d5f3: e9 03     
            CMP $06a4,y        ; $d5f5: d9 a4 06  
            BEQ __d617         ; $d5f8: f0 1d     
            BCS __d603         ; $d5fa: b0 07     
            ADC #$04           ; $d5fc: 69 04     
            CMP $06a4,y        ; $d5fe: d9 a4 06  
            BCS __d617         ; $d601: b0 14     
__d603:     INY                ; $d603: c8        
            CPY #$1e           ; $d604: c0 1e     
            BNE __d5d5         ; $d606: d0 cd     
            LDA #$02           ; $d608: a9 02     
            CMP $6a,x          ; $d60a: d5 6a     
            BEQ __d63b         ; $d60c: f0 2d     
            STA $6a,x          ; $d60e: 95 6a     
            LDA #$03           ; $d610: a9 03     
            STA $e6,x          ; $d612: 95 e6     
            LSR                ; $d614: 4a        
            BNE __d639         ; $d615: d0 22     
__d617:     TYA                ; $d617: 98        
            STA $0783,x        ; $d618: 9d 83 07  
            LDA $6a,x          ; $d61b: b5 6a     
            CMP #$01           ; $d61d: c9 01     
            BEQ __d62f         ; $d61f: f0 0e     
            CMP #$03           ; $d621: c9 03     
            BEQ __d63b         ; $d623: f0 16     
            LDA $e6,x          ; $d625: b5 e6     
            CMP #$03           ; $d627: c9 03     
            BCC __d63b         ; $d629: 90 10     
            LDA #$03           ; $d62b: a9 03     
            STA $6a,x          ; $d62d: 95 6a     
__d62f:     LDA $06a4,y        ; $d62f: b9 a4 06  
            SEC                ; $d632: 38        
            SBC #$19           ; $d633: e9 19     
            STA $28,x          ; $d635: 95 28     
            LDA #$00           ; $d637: a9 00     
__d639:     STA $e0,x          ; $d639: 95 e0     
__d63b:     JSR __d6e0         ; $d63b: 20 e0 d6  
            LDA $28,x          ; $d63e: b5 28     
            SEC                ; $d640: 38        
            SBC $0b            ; $d641: e5 0b     
            CLC                ; $d643: 18        
            ADC $66,x          ; $d644: 75 66     
            STA $66,x          ; $d646: 95 66     
__d648:     LDX $5f            ; $d648: a6 5f     
            LDA #$00           ; $d64a: a9 00     
            STA $0352,x        ; $d64c: 9d 52 03  
            LDA $6a,x          ; $d64f: b5 6a     
            BEQ __d6cb         ; $d651: f0 78     
            LDA $13            ; $d653: a5 13     
            ORA $2a,x          ; $d655: 15 2a     
            BNE __d669         ; $d657: d0 10     
            LDA $64,x          ; $d659: b5 64     
            CMP #$2b           ; $d65b: c9 2b     
            BCC __d6cc         ; $d65d: 90 6d     
            CMP #$c6           ; $d65f: c9 c6     
            BCS __d6cc         ; $d661: b0 69     
            LDA $28,x          ; $d663: b5 28     
            CMP #$58           ; $d665: c9 58     
            BCC __d6cb         ; $d667: 90 62     
__d669:     LDA #$00           ; $d669: a9 00     
            STA $09            ; $d66b: 85 09     
            LDA $28,x          ; $d66d: b5 28     
            SEC                ; $d66f: 38        
            SBC #$57           ; $d670: e9 57     
            BCC __d680         ; $d672: 90 0c     
            LDY $2a,x          ; $d674: b4 2a     
            STY $09            ; $d676: 84 09     
            BEQ __d684         ; $d678: f0 0a     
            CLC                ; $d67a: 18        
            ADC #$20           ; $d67b: 69 20     
            JMP __d684         ; $d67d: 4c 84 d6  

;-------------------------------------------------------------------------------
__d680:     LDY $2a,x          ; $d680: b4 2a     
            BEQ __d697         ; $d682: f0 13     
__d684:     LDY #$00           ; $d684: a0 00     
__d686:     CMP #$38           ; $d686: c9 38     
            BCC __d68f         ; $d688: 90 05     
            SBC #$38           ; $d68a: e9 38     
            INY                ; $d68c: c8        
            BNE __d686         ; $d68d: d0 f7     
__d68f:     LDA $09            ; $d68f: a5 09     
            BEQ __d697         ; $d691: f0 04     
            INY                ; $d693: c8        
            INY                ; $d694: c8        
            INY                ; $d695: c8        
            INY                ; $d696: c8        
__d697:     LDA #$a8           ; $d697: a9 a8     
__d699:     CPY #$00           ; $d699: c0 00     
            BEQ __d6a3         ; $d69b: f0 06     
            CLC                ; $d69d: 18        
            ADC #$08           ; $d69e: 69 08     
            DEY                ; $d6a0: 88        
            BNE __d699         ; $d6a1: d0 f6     
__d6a3:     STA $0a            ; $d6a3: 85 0a     
            SEC                ; $d6a5: 38        
            SBC #$a8           ; $d6a6: e9 a8     
            STA $09            ; $d6a8: 85 09     
            LDA #$48           ; $d6aa: a9 48     
            SEC                ; $d6ac: 38        
            SBC $09            ; $d6ad: e5 09     
            STA $0b            ; $d6af: 85 0b     
            LDA $64,x          ; $d6b1: b5 64     
            CMP $0a            ; $d6b3: c5 0a     
            BCC __d6bf         ; $d6b5: 90 08     
            LDA $0a            ; $d6b7: a5 0a     
            STA $64,x          ; $d6b9: 95 64     
            LDA #$00           ; $d6bb: a9 00     
            BEQ __d6c9         ; $d6bd: f0 0a     
__d6bf:     CMP $0b            ; $d6bf: c5 0b     
            BCS __d6cb         ; $d6c1: b0 08     
            LDA $0b            ; $d6c3: a5 0b     
            STA $64,x          ; $d6c5: 95 64     
            LDA #$01           ; $d6c7: a9 01     
__d6c9:     STA $62,x          ; $d6c9: 95 62     
__d6cb:     RTS                ; $d6cb: 60        

;-------------------------------------------------------------------------------
__d6cc:     LDA #$02           ; $d6cc: a9 02     
            CMP $6a,x          ; $d6ce: d5 6a     
            BEQ __d6dc         ; $d6d0: f0 0a     
            STA $6a,x          ; $d6d2: 95 6a     
            LDA #$03           ; $d6d4: a9 03     
            STA $e6,x          ; $d6d6: 95 e6     
            LDA #$01           ; $d6d8: a9 01     
            STA $e0,x          ; $d6da: 95 e0     
__d6dc:     INC $0352,x        ; $d6dc: fe 52 03  
            RTS                ; $d6df: 60        

;-------------------------------------------------------------------------------
__d6e0:     LDA $e6,x          ; $d6e0: b5 e6     
            CMP #$04           ; $d6e2: c9 04     
            BCS __d71a         ; $d6e4: b0 34     
            LDY #$00           ; $d6e6: a0 00     
__d6e8:     LDA $06e0,y        ; $d6e8: b9 e0 06  
            BMI __d715         ; $d6eb: 30 28     
            CMP $2a,x          ; $d6ed: d5 2a     
            BNE __d715         ; $d6ef: d0 24     
            LDA $0b            ; $d6f1: a5 0b     
            SEC                ; $d6f3: 38        
            SBC #$02           ; $d6f4: e9 02     
            CMP $06c2,y        ; $d6f6: d9 c2 06  
            BCS __d715         ; $d6f9: b0 1a     
            ADC #$04           ; $d6fb: 69 04     
            CMP $06c2,y        ; $d6fd: d9 c2 06  
            BCC __d715         ; $d700: 90 13     
            LDA $0668,y        ; $d702: b9 68 06  
            SBC #$0a           ; $d705: e9 0a     
            CMP $64,x          ; $d707: d5 64     
            BCS __d715         ; $d709: b0 0a     
            LDA $0686,y        ; $d70b: b9 86 06  
            SEC                ; $d70e: 38        
            SBC #$06           ; $d70f: e9 06     
            CMP $64,x          ; $d711: d5 64     
__d713:     BCS __d71b         ; $d713: b0 06     
__d715:     INY                ; $d715: c8        
            CPY #$1e           ; $d716: c0 1e     
            BNE __d6e8         ; $d718: d0 ce     
__d71a:     RTS                ; $d71a: 60        

;-------------------------------------------------------------------------------
__d71b:     LDA #$04           ; $d71b: a9 04     
            STA $e6,x          ; $d71d: 95 e6     
            LDA #$20           ; $d71f: a9 20     
            STA $e8,x          ; $d721: 95 e8     
__d723:     RTS                ; $d723: 60        

;-------------------------------------------------------------------------------
__d724:     LDX #$01           ; $d724: a2 01     
__d726:     LDA $6a,x          ; $d726: b5 6a     
            CMP #$06           ; $d728: c9 06     
            BEQ __d74c         ; $d72a: f0 20     
            LDA $66,x          ; $d72c: b5 66     
            CMP #$d4           ; $d72e: c9 d4     
            BCC __d74c         ; $d730: 90 1a     
            LDA #$f8           ; $d732: a9 f8     
            STA $66,x          ; $d734: 95 66     
            LDA #$00           ; $d736: a9 00     
            STA $6a,x          ; $d738: 95 6a     
            STA $5a,x          ; $d73a: 95 5a     
            LDA $20,x          ; $d73c: b5 20     
            BMI __d74c         ; $d73e: 30 0c     
            TXA                ; $d740: 8a        
            PHA                ; $d741: 48        
            LDA __cbbf,x       ; $d742: bd bf cb  
            LDX #$06           ; $d745: a2 06     
            JSR __c821         ; $d747: 20 21 c8  
            PLA                ; $d74a: 68        
            TAX                ; $d74b: aa        
__d74c:     DEX                ; $d74c: ca        
            BPL __d726         ; $d74d: 10 d7     
            LDA $6a            ; $d74f: a5 6a     
            BNE __d723         ; $d751: d0 d0     
            LDA $6b            ; $d753: a5 6b     
            BNE __d723         ; $d755: d0 cc     
            STA $1e            ; $d757: 85 1e     
            LDA #$03           ; $d759: a9 03     
            JMP __d4f5         ; $d75b: 4c f5 d4  

;-------------------------------------------------------------------------------
__d75e:     .hex 80 5d         ; $d75e: 80 5d     Invalid Opcode - NOP #$5d
            .hex 3e 1f         ; $d760: 3e 1f     Suspected data
__d762:     .hex 02            ; $d762: 02        Invalid Opcode - KIL 
            BRK                ; $d763: 00        
            CLC                ; $d764: 18        
            BMI __d7af         ; $d765: 30 48     
            RTS                ; $d767: 60        

;-------------------------------------------------------------------------------
            SEI                ; $d768: 78        
            BCC __d713         ; $d769: 90 a8     
            CPY #$d8           ; $d76b: c0 d8     
            ROL                ; $d76d: 2a        
            AND #$28           ; $d76e: 29 28     
            .hex 23 22         ; $d770: 23 22     Invalid Opcode - RLA ($22,x)
            .hex 22            ; $d772: 22        Invalid Opcode - KIL 
            AND ($20,x)        ; $d773: 21 20     
            .hex 2b 20         ; $d775: 2b 20     Invalid Opcode - ANC #$20
            RTS                ; $d777: 60        

;-------------------------------------------------------------------------------
            LDY #$a0           ; $d778: a0 a0     
            CPX #$20           ; $d77a: e0 20     
            RTS                ; $d77c: 60        

;-------------------------------------------------------------------------------
            LDY #$a0           ; $d77d: a0 a0     
__d77f:     BRK                ; $d77f: 00        
            ORA ($02,x)        ; $d780: 01 02     
            .hex 03 04         ; $d782: 03 04     Invalid Opcode - SLO ($04,x)
            .hex ff            ; $d784: ff        Suspected data
__d785:     .hex eb 90         ; $d785: eb 90     Invalid Opcode - SBC #$90
__d787:     STA ($eb),y        ; $d787: 91 eb     
            .hex eb 38         ; $d789: eb 38     Invalid Opcode - SBC #$38
__d78b:     ROL                ; $d78b: 2a        
            AND #$28           ; $d78c: 29 28     
            PLP                ; $d78e: 28        
            .hex 23 22         ; $d78f: 23 22     Invalid Opcode - RLA ($22,x)
            AND ($20,x)        ; $d791: 21 20     
            .hex 20            ; $d793: 20        Suspected data
__d794:     RTI                ; $d794: 40        

;-------------------------------------------------------------------------------
            .hex 80 c0         ; $d795: 80 c0     Invalid Opcode - NOP #$c0
            BRK                ; $d797: 00        
            BRK                ; $d798: 00        
            RTI                ; $d799: 40        

;-------------------------------------------------------------------------------
            .hex 80 c0         ; $d79a: 80 c0     Invalid Opcode - NOP #$c0
            BRK                ; $d79c: 00        
__d79d:     .hex eb 90         ; $d79d: eb 90     Invalid Opcode - SBC #$90
            .hex 92            ; $d79f: 92        Invalid Opcode - KIL 
            .hex eb eb         ; $d7a0: eb eb     Invalid Opcode - SBC #$eb
            SEC                ; $d7a2: 38        
__d7a3:     JSR $2020          ; $d7a3: 20 20 20  
            PLP                ; $d7a6: 28        
            PLP                ; $d7a7: 28        
            PLP                ; $d7a8: 28        
            BMI __d7db         ; $d7a9: 30 30     
            BMI __d7dd         ; $d7ab: 30 30     
__d7ad:     CPX #$e0           ; $d7ad: e0 e0     
__d7af:     CPX #$d8           ; $d7af: e0 d8     
            CLD                ; $d7b1: d8        
            CLD                ; $d7b2: d8        
            BNE __d785         ; $d7b3: d0 d0     
            BNE __d787         ; $d7b5: d0 d0     
__d7b7:     .hex 0c 08 0c      ; $d7b7: 0c 08 0c  Invalid Opcode - NOP $0c08
            .hex 0c 0c 08      ; $d7ba: 0c 0c 08  Invalid Opcode - NOP $080c
__d7bd:     PHP                ; $d7bd: 08        
            PHP                ; $d7be: 08        
            PHP                ; $d7bf: 08        
            PHP                ; $d7c0: 08        
            PHP                ; $d7c1: 08        
            .hex 04 04         ; $d7c2: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $d7c4: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $d7c6: 04 04     Invalid Opcode - NOP $04
__d7c8:     .hex 0b 10         ; $d7c8: 0b 10     Invalid Opcode - ANC #$10
            .hex 0b 0b         ; $d7ca: 0b 0b     Invalid Opcode - ANC #$0b
            .hex 0b 08         ; $d7cc: 0b 08     Invalid Opcode - ANC #$08
            PHP                ; $d7ce: 08        
            PHP                ; $d7cf: 08        
            PHP                ; $d7d0: 08        
            PHP                ; $d7d1: 08        
            PHP                ; $d7d2: 08        
__d7d3:     PHP                ; $d7d3: 08        
            .hex 0c 08 08      ; $d7d4: 0c 08 08  Invalid Opcode - NOP $0808
            PHP                ; $d7d7: 08        
            PHP                ; $d7d8: 08        
            PHP                ; $d7d9: 08        
            PHP                ; $d7da: 08        
__d7db:     ASL $06            ; $d7db: 06 06     
__d7dd:     .hex 06            ; $d7dd: 06        Suspected data
__d7de:     LDA $8c            ; $d7de: a5 8c     
            BNE __d82e         ; $d7e0: d0 4c     
            LDA $3d            ; $d7e2: a5 3d     
            BNE __d7fc         ; $d7e4: d0 16     
            LDA $2c            ; $d7e6: a5 2c     
            BEQ __d7f1         ; $d7e8: f0 07     
            DEC $2c            ; $d7ea: c6 2c     
            LDA #$ff           ; $d7ec: a9 ff     
            STA $3d            ; $d7ee: 85 3d     
            RTS                ; $d7f0: 60        

;-------------------------------------------------------------------------------
__d7f1:     LDA $7c            ; $d7f1: a5 7c     
            BNE __d7f8         ; $d7f3: d0 03     
            INC $7c            ; $d7f5: e6 7c     
            RTS                ; $d7f7: 60        

;-------------------------------------------------------------------------------
__d7f8:     CMP #$80           ; $d7f8: c9 80     
            BEQ __d816         ; $d7fa: f0 1a     
__d7fc:     LDX #$01           ; $d7fc: a2 01     
__d7fe:     LDA $6a,x          ; $d7fe: b5 6a     
            CMP #$01           ; $d800: c9 01     
            BNE __d80a         ; $d802: d0 06     
            LDA $90            ; $d804: a5 90     
            CMP $5a,x          ; $d806: d5 5a     
            BEQ __d80f         ; $d808: f0 05     
__d80a:     DEX                ; $d80a: ca        
            BPL __d7fe         ; $d80b: 10 f1     
            BMI __d82e         ; $d80d: 30 1f     
__d80f:     LDA #$01           ; $d80f: a9 01     
            STA $0376          ; $d811: 8d 76 03  
            BNE __d819         ; $d814: d0 03     
__d816:     JSR __e215         ; $d816: 20 15 e2  
__d819:     LDA $90            ; $d819: a5 90     
            CMP #$09           ; $d81b: c9 09     
            BEQ __d82e         ; $d81d: f0 0f     
__d81f:     LDA #$0c           ; $d81f: a9 0c     
            STA $8b            ; $d821: 85 8b     
            STA $8c            ; $d823: 85 8c     
            INC $90            ; $d825: e6 90     
            LDA $8a            ; $d827: a5 8a     
            CLC                ; $d829: 18        
            ADC #$06           ; $d82a: 69 06     
            STA $8a            ; $d82c: 85 8a     
__d82e:     RTS                ; $d82e: 60        

;-------------------------------------------------------------------------------
__d82f:     LDA $8c            ; $d82f: a5 8c     
            BEQ __d887         ; $d831: f0 54     
            JSR __e27a         ; $d833: 20 7a e2  
            JSR __e002         ; $d836: 20 02 e0  
            JSR __ec51         ; $d839: 20 51 ec  
            JSR __d90f         ; $d83c: 20 0f d9  
            LDX #$00           ; $d83f: a2 00     
            JSR __d111         ; $d841: 20 11 d1  
            LDX #$01           ; $d844: a2 01     
            JSR __d111         ; $d846: 20 11 d1  
            LDA $13            ; $d849: a5 13     
            SEC                ; $d84b: 38        
            SBC #$04           ; $d84c: e9 04     
            STA $13            ; $d84e: 85 13     
            JSR __d8ea         ; $d850: 20 ea d8  
            DEC $8b            ; $d853: c6 8b     
            BNE __d887         ; $d855: d0 30     
            LDA #$00           ; $d857: a9 00     
            STA $8c            ; $d859: 85 8c     
            JSR __d8fd         ; $d85b: 20 fd d8  
            JSR __e63d         ; $d85e: 20 3d e6  
            LDX #$07           ; $d861: a2 07     
__d863:     CPX #$00           ; $d863: e0 00     
            BEQ __d884         ; $d865: f0 1d     
            LDA $91,x          ; $d867: b5 91     
            BEQ __d884         ; $d869: f0 19     
            LDA $90            ; $d86b: a5 90     
            SEC                ; $d86d: 38        
            SBC $b2,x          ; $d86e: f5 b2     
            CMP #$04           ; $d870: c9 04     
            BCC __d884         ; $d872: 90 10     
            JSR __d888         ; $d874: 20 88 d8  
            CPX #$02           ; $d877: e0 02     
            BCC __d884         ; $d879: 90 09     
            CPX #$05           ; $d87b: e0 05     
            BCS __d884         ; $d87d: b0 05     
            LDA #$00           ; $d87f: a9 00     
            STA $0382,x        ; $d881: 9d 82 03  
__d884:     DEX                ; $d884: ca        
            BPL __d863         ; $d885: 10 dc     
__d887:     RTS                ; $d887: 60        

;-------------------------------------------------------------------------------
__d888:     TXA                ; $d888: 8a        
            CLC                ; $d889: 18        
            ADC #$83           ; $d88a: 69 83     
            STA $03e8,x        ; $d88c: 9d e8 03  
            RTS                ; $d88f: 60        

;-------------------------------------------------------------------------------
__d890:     LDA $8c            ; $d890: a5 8c     
            BNE __d8a5         ; $d892: d0 11     
            LDX #$01           ; $d894: a2 01     
__d896:     LDA $6a,x          ; $d896: b5 6a     
            CMP #$01           ; $d898: c9 01     
            BNE __d8a2         ; $d89a: d0 06     
            LDA $66,x          ; $d89c: b5 66     
            CMP #$60           ; $d89e: c9 60     
            BCC __d8a6         ; $d8a0: 90 04     
__d8a2:     DEX                ; $d8a2: ca        
            BPL __d896         ; $d8a3: 10 f1     
__d8a5:     RTS                ; $d8a5: 60        

;-------------------------------------------------------------------------------
__d8a6:     LDA $13            ; $d8a6: a5 13     
            ORA $27            ; $d8a8: 05 27     
            BEQ __d8a5         ; $d8aa: f0 f9     
            JMP __d81f         ; $d8ac: 4c 1f d8  

;-------------------------------------------------------------------------------
__d8af:     LDA $8c            ; $d8af: a5 8c     
            BEQ __d8a5         ; $d8b1: f0 f2     
            LDA $13            ; $d8b3: a5 13     
            SEC                ; $d8b5: 38        
            SBC #$04           ; $d8b6: e9 04     
            STA $13            ; $d8b8: 85 13     
            CMP #$f0           ; $d8ba: c9 f0     
            BCC __d8c8         ; $d8bc: 90 0a     
            LDA $27            ; $d8be: a5 27     
            BNE __d8c6         ; $d8c0: d0 04     
            STA $13            ; $d8c2: 85 13     
            BEQ __d8c8         ; $d8c4: f0 02     
__d8c6:     DEC $27            ; $d8c6: c6 27     
__d8c8:     JSR __d8ea         ; $d8c8: 20 ea d8  
            JSR __e277         ; $d8cb: 20 77 e2  
            JSR __ec51         ; $d8ce: 20 51 ec  
            JSR __d90f         ; $d8d1: 20 0f d9  
            LDA $13            ; $d8d4: a5 13     
            BEQ __d8dc         ; $d8d6: f0 04     
            DEC $8b            ; $d8d8: c6 8b     
            BNE __d8a5         ; $d8da: d0 c9     
__d8dc:     LDA #$00           ; $d8dc: a9 00     
            STA $8c            ; $d8de: 85 8c     
            LDA $24            ; $d8e0: a5 24     
            CLC                ; $d8e2: 18        
            ADC #$06           ; $d8e3: 69 06     
            STA $24            ; $d8e5: 85 24     
            JMP __e573         ; $d8e7: 4c 73 e5  

;-------------------------------------------------------------------------------
__d8ea:     LDA $13            ; $d8ea: a5 13     
            AND #$f0           ; $d8ec: 29 f0     
            CMP #$f0           ; $d8ee: c9 f0     
            BNE __d8fc         ; $d8f0: d0 0a     
            LDA $13            ; $d8f2: a5 13     
            AND #$ef           ; $d8f4: 29 ef     
            STA $13            ; $d8f6: 85 13     
            INC $de            ; $d8f8: e6 de     
            DEC $7a            ; $d8fa: c6 7a     
__d8fc:     RTS                ; $d8fc: 60        

;-------------------------------------------------------------------------------
__d8fd:     LDY $56            ; $d8fd: a4 56     
            CPY #$04           ; $d8ff: c0 04     
            BCC __d905         ; $d901: 90 02     
            LDY #$04           ; $d903: a0 04     
__d905:     LDA __d75e,y       ; $d905: b9 5e d7  
            STA $3d            ; $d908: 85 3d     
            LDA #$01           ; $d90a: a9 01     
            STA $2c            ; $d90c: 85 2c     
__d90e:     RTS                ; $d90e: 60        

;-------------------------------------------------------------------------------
__d90f:     LDA $8d            ; $d90f: a5 8d     
            CMP $8a            ; $d911: c5 8a     
            BCS __d90e         ; $d913: b0 f9     
            JMP __f2ec         ; $d915: 4c ec f2  

;-------------------------------------------------------------------------------
__d918:     SED                ; $d918: f8        
            PHP                ; $d919: 08        
__d91a:     BRK                ; $d91a: 00        
            .hex 05            ; $d91b: 05        Suspected data
__d91c:     TXA                ; $d91c: 8a        
            PHA                ; $d91d: 48        
            TYA                ; $d91e: 98        
            PHA                ; $d91f: 48        
            TXA                ; $d920: 8a        
            ASL                ; $d921: 0a        
            ASL                ; $d922: 0a        
            TAY                ; $d923: a8        
            LDA $021c,y        ; $d924: b9 1c 02  
            STA $0b            ; $d927: 85 0b     
            LDA $021f,y        ; $d929: b9 1f 02  
            STA $0a            ; $d92c: 85 0a     
            LDA $62,x          ; $d92e: b5 62     
            STA $0c            ; $d930: 85 0c     
            TXA                ; $d932: 8a        
            PHA                ; $d933: 48        
            LDA __d91a,x       ; $d934: bd 1a d9  
            TAX                ; $d937: aa        
            LDA $0364,x        ; $d938: bd 64 03  
            CMP #$63           ; $d93b: c9 63     
            BCS __d942         ; $d93d: b0 03     
            INC $0364,x        ; $d93f: fe 64 03  
__d942:     PLA                ; $d942: 68        
            TAX                ; $d943: aa        
            LDY #$00           ; $d944: a0 00     
__d946:     LDA $02d0,y        ; $d946: b9 d0 02  
            CMP #$f8           ; $d949: c9 f8     
            BEQ __d957         ; $d94b: f0 0a     
            INY                ; $d94d: c8        
            INY                ; $d94e: c8        
            INY                ; $d94f: c8        
            INY                ; $d950: c8        
            CPY #$18           ; $d951: c0 18     
            BCC __d946         ; $d953: 90 f1     
            BCS __d9a8         ; $d955: b0 51     
__d957:     LDA $d7,x          ; $d957: b5 d7     
            CMP #$06           ; $d959: c9 06     
            BCS __d967         ; $d95b: b0 0a     
            CMP #$03           ; $d95d: c9 03     
            BCC __d964         ; $d95f: 90 03     
            JSR __d9ad         ; $d961: 20 ad d9  
__d964:     LDA #$03           ; $d964: a9 03     
            .hex 2c            ; $d966: 2c        Suspected data
__d967:     LDA #$02           ; $d967: a9 02     
            STA $02d2,y        ; $d969: 99 d2 02  
            LDX $0c            ; $d96c: a6 0c     
            LDA __d918,x       ; $d96e: bd 18 d9  
            CLC                ; $d971: 18        
            ADC $0a            ; $d972: 65 0a     
            STA $02d3,y        ; $d974: 99 d3 02  
            LDA $0b            ; $d977: a5 0b     
            SEC                ; $d979: 38        
            SBC #$08           ; $d97a: e9 08     
            STA $02d0,y        ; $d97c: 99 d0 02  
            LDA #$0b           ; $d97f: a9 0b     
            LDX $063e          ; $d981: ae 3e 06  
            BNE __d988         ; $d984: d0 02     
            LDA #$0a           ; $d986: a9 0a     
__d988:     STA $02d1,y        ; $d988: 99 d1 02  
            TYA                ; $d98b: 98        
            LSR                ; $d98c: 4a        
            LSR                ; $d98d: 4a        
            TAY                ; $d98e: a8        
            LDA #$00           ; $d98f: a9 00     
            STA $0650,y        ; $d991: 99 50 06  
            STA $0640,y        ; $d994: 99 40 06  
            STA $0660,y        ; $d997: 99 60 06  
            LDA #$fe           ; $d99a: a9 fe     
            STA $0648,y        ; $d99c: 99 48 06  
            LDA $0c            ; $d99f: a5 0c     
            BNE __d9a5         ; $d9a1: d0 02     
            LDA #$ff           ; $d9a3: a9 ff     
__d9a5:     STA $0658,y        ; $d9a5: 99 58 06  
__d9a8:     PLA                ; $d9a8: 68        
            TAY                ; $d9a9: a8        
            PLA                ; $d9aa: 68        
            TAX                ; $d9ab: aa        
            RTS                ; $d9ac: 60        

;-------------------------------------------------------------------------------
__d9ad:     LDA $063f          ; $d9ad: ad 3f 06  
            ORA $0301          ; $d9b0: 0d 01 03  
            BNE __d9c3         ; $d9b3: d0 0e     
            TXA                ; $d9b5: 8a        
            PHA                ; $d9b6: 48        
            LDX #$0f           ; $d9b7: a2 0f     
            JSR __f691         ; $d9b9: 20 91 f6  
            LDA #$01           ; $d9bc: a9 01     
            STA $063f          ; $d9be: 8d 3f 06  
            PLA                ; $d9c1: 68        
            TAX                ; $d9c2: aa        
__d9c3:     RTS                ; $d9c3: 60        

;-------------------------------------------------------------------------------
__d9c4:     BRK                ; $d9c4: 00        
            RTI                ; $d9c5: 40        

;-------------------------------------------------------------------------------
            CPY #$80           ; $d9c6: c0 80     
            RTI                ; $d9c8: 40        

;-------------------------------------------------------------------------------
            BRK                ; $d9c9: 00        
            .hex 80 c0         ; $d9ca: 80 c0     Invalid Opcode - NOP #$c0
__d9cc:     LDY #$14           ; $d9cc: a0 14     
__d9ce:     LDA $02d0,y        ; $d9ce: b9 d0 02  
            CMP #$f8           ; $d9d1: c9 f8     
            BEQ __da44         ; $d9d3: f0 6f     
            TYA                ; $d9d5: 98        
            LSR                ; $d9d6: 4a        
            LSR                ; $d9d7: 4a        
            TAX                ; $d9d8: aa        
            LDA $0650,x        ; $d9d9: bd 50 06  
            CLC                ; $d9dc: 18        
            ADC $0640,x        ; $d9dd: 7d 40 06  
            STA $0640,x        ; $d9e0: 9d 40 06  
            LDA $02d0,y        ; $d9e3: b9 d0 02  
            ADC $0648,x        ; $d9e6: 7d 48 06  
            STA $02d0,y        ; $d9e9: 99 d0 02  
            CMP #$f4           ; $d9ec: c9 f4     
            BCS __da3a         ; $d9ee: b0 4a     
            LDA $0658,x        ; $d9f0: bd 58 06  
            STA $03            ; $d9f3: 85 03     
            ADC $02d3,y        ; $d9f5: 79 d3 02  
            STA $02d3,y        ; $d9f8: 99 d3 02  
            INC $0660,x        ; $d9fb: fe 60 06  
            TXA                ; $d9fe: 8a        
            PHA                ; $d9ff: 48        
            LDA $0660,x        ; $da00: bd 60 06  
            AND #$30           ; $da03: 29 30     
            LSR                ; $da05: 4a        
            LSR                ; $da06: 4a        
            LSR                ; $da07: 4a        
            LSR                ; $da08: 4a        
            LDX $03            ; $da09: a6 03     
            DEX                ; $da0b: ca        
            BEQ __da11         ; $da0c: f0 03     
            CLC                ; $da0e: 18        
            ADC #$04           ; $da0f: 69 04     
__da11:     TAX                ; $da11: aa        
            LDA $02d2,y        ; $da12: b9 d2 02  
            AND #$03           ; $da15: 29 03     
            ORA __d9c4,x       ; $da17: 1d c4 d9  
            STA $02d2,y        ; $da1a: 99 d2 02  
            PLA                ; $da1d: 68        
            TAX                ; $da1e: aa        
            LDA $0648,x        ; $da1f: bd 48 06  
            CMP #$05           ; $da22: c9 05     
            BPL __da44         ; $da24: 10 1e     
            LDA $0650,x        ; $da26: bd 50 06  
            CLC                ; $da29: 18        
            ADC #$40           ; $da2a: 69 40     
            STA $0650,x        ; $da2c: 9d 50 06  
            LDA $0648,x        ; $da2f: bd 48 06  
            ADC #$00           ; $da32: 69 00     
            STA $0648,x        ; $da34: 9d 48 06  
            JMP __da44         ; $da37: 4c 44 da  

;-------------------------------------------------------------------------------
__da3a:     LDA #$f8           ; $da3a: a9 f8     
            STA $02d0,y        ; $da3c: 99 d0 02  
            LDA #$00           ; $da3f: a9 00     
            STA $02d3,y        ; $da41: 99 d3 02  
__da44:     DEY                ; $da44: 88        
            DEY                ; $da45: 88        
            DEY                ; $da46: 88        
            DEY                ; $da47: 88        
            BPL __d9ce         ; $da48: 10 84     
            RTS                ; $da4a: 60        

;-------------------------------------------------------------------------------
__da4b:     LDX #$01           ; $da4b: a2 01     
__da4d:     LDA $66,x          ; $da4d: b5 66     
            CLC                ; $da4f: 18        
            ADC #$0c           ; $da50: 69 0c     
            JSR __d1f9         ; $da52: 20 f9 d1  
            TAY                ; $da55: a8        
            CPY #$09           ; $da56: c0 09     
            BEQ __da93         ; $da58: f0 39     
            CPY $0786          ; $da5a: cc 86 07  
            BEQ __da64         ; $da5d: f0 05     
            CPY $0787          ; $da5f: cc 87 07  
            BNE __da93         ; $da62: d0 2f     
__da64:     LDA $062f,y        ; $da64: b9 2f 06  
            CMP #$01           ; $da67: c9 01     
            BNE __da93         ; $da69: d0 28     
            LDA $64,x          ; $da6b: b5 64     
            SEC                ; $da6d: 38        
            SBC #$02           ; $da6e: e9 02     
            CMP __d7a3,y       ; $da70: d9 a3 d7  
            BCC __da87         ; $da73: 90 12     
            CLC                ; $da75: 18        
            ADC #$12           ; $da76: 69 12     
            CMP __d7ad,y       ; $da78: d9 ad d7  
            BCC __da93         ; $da7b: 90 16     
            LDA __d7ad,y       ; $da7d: b9 ad d7  
            SEC                ; $da80: 38        
            SBC #$10           ; $da81: e9 10     
            LDY #$00           ; $da83: a0 00     
            BEQ __da8f         ; $da85: f0 08     
__da87:     LDA __d7a3,y       ; $da87: b9 a3 d7  
            SEC                ; $da8a: 38        
            SBC #$fe           ; $da8b: e9 fe     
            LDY #$01           ; $da8d: a0 01     
__da8f:     STA $64,x          ; $da8f: 95 64     
            STY $62,x          ; $da91: 94 62     
__da93:     DEX                ; $da93: ca        
            BPL __da4d         ; $da94: 10 b7     
            RTS                ; $da96: 60        

;-------------------------------------------------------------------------------
__da97:     .hex fc 0c         ; $da97: fc 0c     Suspected data
__da99:     JSR __ddc9         ; $da99: 20 c9 dd  
            BCC __dad3         ; $da9c: 90 35     
            LDA #$00           ; $da9e: a9 00     
            STA $80,x          ; $daa0: 95 80     
            LDA #$04           ; $daa2: a9 04     
            STA $00            ; $daa4: 85 00     
            JSR __dab2         ; $daa6: 20 b2 da  
            BCC __dad4         ; $daa9: 90 29     
            LDY $62,x          ; $daab: b4 62     
            LDA __da97,y       ; $daad: b9 97 da  
            STA $00            ; $dab0: 85 00     
__dab2:     JSR __dad5         ; $dab2: 20 d5 da  
            BCS __dabc         ; $dab5: b0 05     
__dab7:     LDA #$04           ; $dab7: a9 04     
            STA $fc            ; $dab9: 85 fc     
            RTS                ; $dabb: 60        

;-------------------------------------------------------------------------------
__dabc:     JSR __dbb4         ; $dabc: 20 b4 db  
            STY $5c,x          ; $dabf: 94 5c     
            LDA $03            ; $dac1: a5 03     
            STA $7d,x          ; $dac3: 95 7d     
            JSR __daf2         ; $dac5: 20 f2 da  
            BCS __dab7         ; $dac8: b0 ed     
            JSR __d91c         ; $daca: 20 1c d9  
            LDA $84,x          ; $dacd: b5 84     
            ORA #$01           ; $dacf: 09 01     
            STA $84,x          ; $dad1: 95 84     
__dad3:     CLC                ; $dad3: 18        
__dad4:     RTS                ; $dad4: 60        

;-------------------------------------------------------------------------------
__dad5:     TXA                ; $dad5: 8a        
            ASL                ; $dad6: 0a        
            ASL                ; $dad7: 0a        
            TAY                ; $dad8: a8        
            LDA $021f,y        ; $dad9: b9 1f 02  
            CLC                ; $dadc: 18        
            ADC $00            ; $dadd: 65 00     
            LDY $5a,x          ; $dadf: b4 5a     
            INY                ; $dae1: c8        
            CPY #$0a           ; $dae2: c0 0a     
            BCS __dad3         ; $dae4: b0 ed     
            CMP __d7a3,y       ; $dae6: d9 a3 d7  
            BCC __dad3         ; $dae9: 90 e8     
            CMP __d7ad,y       ; $daeb: d9 ad d7  
            BCS __dad3         ; $daee: b0 e3     
__daf0:     SEC                ; $daf0: 38        
            RTS                ; $daf1: 60        

;-------------------------------------------------------------------------------
__daf2:     LDA #$00           ; $daf2: a9 00     
            STA $063e          ; $daf4: 8d 3e 06  
            LDA ($03),y        ; $daf7: b1 03     
            BEQ __daf0         ; $daf9: f0 f5     
            CMP #$03           ; $dafb: c9 03     
            BPL __daf0         ; $dafd: 10 f1     
            CMP #$ff           ; $daff: c9 ff     
            BEQ __daf0         ; $db01: f0 ed     
            CMP #$02           ; $db03: c9 02     
            BNE __db0e         ; $db05: d0 07     
            PHA                ; $db07: 48        
            LDA #$01           ; $db08: a9 01     
            STA $063e          ; $db0a: 8d 3e 06  
            PLA                ; $db0d: 68        
__db0e:     CLC                ; $db0e: 18        
            ADC $02            ; $db0f: 65 02     
            STA ($03),y        ; $db11: 91 03     
            CMP #$03           ; $db13: c9 03     
            BMI __db1b         ; $db15: 30 04     
            LDA #$ff           ; $db17: a9 ff     
            STA ($03),y        ; $db19: 91 03     
__db1b:     CLC                ; $db1b: 18        
            RTS                ; $db1c: 60        

;-------------------------------------------------------------------------------
__db1d:     STA $08            ; $db1d: 85 08     
            BNE __db2c         ; $db1f: d0 0b     
            CPY #$08           ; $db21: c0 08     
            BCC __db2c         ; $db23: 90 07     
            LDA $0091,y        ; $db25: b9 91 00  
            CMP #$02           ; $db28: c9 02     
            BEQ __db31         ; $db2a: f0 05     
__db2c:     LDA $0091,y        ; $db2c: b9 91 00  
            BPL __dba4         ; $db2f: 10 73     
__db31:     LDA $55            ; $db31: a5 55     
            BEQ __db65         ; $db33: f0 30     
            CMP #$02           ; $db35: c9 02     
            BEQ __db65         ; $db37: f0 2c     
            CPY #$08           ; $db39: c0 08     
            BCS __db65         ; $db3b: b0 28     
            LDX $b2,y          ; $db3d: b6 b2     
            LDA $08            ; $db3f: a5 08     
            BNE __db54         ; $db41: d0 11     
            LDA $009c,y        ; $db43: b9 9c 00  
            BMI __db4b         ; $db46: 30 03     
            LDA #$10           ; $db48: a9 10     
            .hex 2c            ; $db4a: 2c        Suspected data
__db4b:     LDA #$f8           ; $db4b: a9 f8     
            CLC                ; $db4d: 18        
            ADC $009c,y        ; $db4e: 79 9c 00  
            JMP __db57         ; $db51: 4c 57 db  

;-------------------------------------------------------------------------------
__db54:     LDA $009c,y        ; $db54: b9 9c 00  
__db57:     CLC                ; $db57: 18        
            ADC __d7bd,y       ; $db58: 79 bd d7  
            CMP __d7a3,x       ; $db5b: dd a3 d7  
            BCC __dba4         ; $db5e: 90 44     
            CMP __d7ad,x       ; $db60: dd ad d7  
            BCS __dba4         ; $db63: b0 3f     
__db65:     LDA $009c,y        ; $db65: b9 9c 00  
            CLC                ; $db68: 18        
            ADC __d7bd,y       ; $db69: 79 bd d7  
            SEC                ; $db6c: 38        
            SBC $0a            ; $db6d: e5 0a     
            STA $00            ; $db6f: 85 00     
            JSR __d2f9         ; $db71: 20 f9 d2  
            PHA                ; $db74: 48        
            LDA $08            ; $db75: a5 08     
            BEQ __db81         ; $db77: f0 08     
            PLA                ; $db79: 68        
            CMP __d7d3,y       ; $db7a: d9 d3 d7  
            BCS __dba4         ; $db7d: b0 25     
            BCC __db86         ; $db7f: 90 05     
__db81:     PLA                ; $db81: 68        
            CMP #$0c           ; $db82: c9 0c     
            BCS __dba4         ; $db84: b0 1e     
__db86:     LDA $00a7,y        ; $db86: b9 a7 00  
            CLC                ; $db89: 18        
            ADC __d7b7,y       ; $db8a: 79 b7 d7  
            SEC                ; $db8d: 38        
            SBC $0b            ; $db8e: e5 0b     
            JSR __d2f9         ; $db90: 20 f9 d2  
            PHA                ; $db93: 48        
            CPY #$00           ; $db94: c0 00     
            BNE __db9c         ; $db96: d0 04     
            LDA $08            ; $db98: a5 08     
            BEQ __dba6         ; $db9a: f0 0a     
__db9c:     PLA                ; $db9c: 68        
            CMP __d7c8,y       ; $db9d: d9 c8 d7  
            BCS __dba4         ; $dba0: b0 02     
__dba2:     SEC                ; $dba2: 38        
            RTS                ; $dba3: 60        

;-------------------------------------------------------------------------------
__dba4:     CLC                ; $dba4: 18        
            RTS                ; $dba5: 60        

;-------------------------------------------------------------------------------
__dba6:     PLA                ; $dba6: 68        
            CMP #$10           ; $dba7: c9 10     
            BCS __dba4         ; $dba9: b0 f9     
            BCC __dba2         ; $dbab: 90 f5     
__dbad:     LDA #$ff           ; $dbad: a9 ff     
            RTS                ; $dbaf: 60        

;-------------------------------------------------------------------------------
__dbb0:     LDY #$05           ; $dbb0: a0 05     
            BNE __dbb6         ; $dbb2: d0 02     
__dbb4:     LDY #$04           ; $dbb4: a0 04     
__dbb6:     STY $04            ; $dbb6: 84 04     
            STA $00            ; $dbb8: 85 00     
            LDA #$ff           ; $dbba: a9 ff     
            STA $0783,x        ; $dbbc: 9d 83 07  
            LDA #$00           ; $dbbf: a9 00     
            STA $0343,x        ; $dbc1: 9d 43 03  
            LDY $5a,x          ; $dbc4: b4 5a     
            LDA $82,x          ; $dbc6: b5 82     
            BEQ __dbcb         ; $dbc8: f0 01     
            INY                ; $dbca: c8        
__dbcb:     STY $d7,x          ; $dbcb: 94 d7     
            CPY #$0a           ; $dbcd: c0 0a     
            BCS __dbad         ; $dbcf: b0 dc     
            LDA $00            ; $dbd1: a5 00     
            CMP __d7a3,y       ; $dbd3: d9 a3 d7  
            BCC __dc56         ; $dbd6: 90 7e     
            CMP __d7ad,y       ; $dbd8: d9 ad d7  
            BCS __dc56         ; $dbdb: b0 79     
            LDA #$02           ; $dbdd: a9 02     
            STA $02            ; $dbdf: 85 02     
            LDA $00            ; $dbe1: a5 00     
            JSR __edbf         ; $dbe3: 20 bf ed  
            STA $d4,x          ; $dbe6: 95 d4     
            LDY $d7,x          ; $dbe8: b4 d7     
            LDA __d762,y       ; $dbea: b9 62 d7  
            STA $03            ; $dbed: 85 03     
            LDA $d4,x          ; $dbef: b5 d4     
            SEC                ; $dbf1: 38        
            SBC #$04           ; $dbf2: e9 04     
            PHA                ; $dbf4: 48        
            TAY                ; $dbf5: a8        
            LDA ($03),y        ; $dbf6: b1 03     
            BPL __dbfd         ; $dbf8: 10 03     
            INC $0343,x        ; $dbfa: fe 43 03  
__dbfd:     LDA $d7,x          ; $dbfd: b5 d7     
            LDY #$00           ; $dbff: a0 00     
            CMP $0786          ; $dc01: cd 86 07  
            BEQ __dc0c         ; $dc04: f0 06     
            INY                ; $dc06: c8        
            CMP $0787          ; $dc07: cd 87 07  
            BNE __dc4d         ; $dc0a: d0 41     
__dc0c:     STY $00            ; $dc0c: 84 00     
            LDA $6a,x          ; $dc0e: b5 6a     
            CMP #$04           ; $dc10: c9 04     
            BEQ __dc18         ; $dc12: f0 04     
            CMP #$02           ; $dc14: c9 02     
            BNE __dc34         ; $dc16: d0 1c     
__dc18:     LDA $68,x          ; $dc18: b5 68     
            BEQ __dc34         ; $dc1a: f0 18     
            LDA $07d7,y        ; $dc1c: b9 d7 07  
            BEQ __dc2b         ; $dc1f: f0 0a     
            LDA $68,x          ; $dc21: b5 68     
            CMP #$01           ; $dc23: c9 01     
            BNE __dc34         ; $dc25: d0 0d     
            LDA #$14           ; $dc27: a9 14     
            BNE __dc36         ; $dc29: d0 0b     
__dc2b:     LDA $68,x          ; $dc2b: b5 68     
            CMP #$02           ; $dc2d: c9 02     
            BNE __dc34         ; $dc2f: d0 03     
            LDA #$04           ; $dc31: a9 04     
            .hex 2c            ; $dc33: 2c        Suspected data
__dc34:     LDA #$09           ; $dc34: a9 09     
__dc36:     CLC                ; $dc36: 18        
            ADC $64,x          ; $dc37: 75 64     
            CMP $0788,y        ; $dc39: d9 88 07  
            BCC __dc43         ; $dc3c: 90 05     
            CMP $078a,y        ; $dc3e: d9 8a 07  
            BCC __dc59         ; $dc41: 90 16     
__dc43:     CMP $078c,y        ; $dc43: d9 8c 07  
            BCC __dc4d         ; $dc46: 90 05     
            CMP $078e,y        ; $dc48: d9 8e 07  
            BCC __dc59         ; $dc4b: 90 0c     
__dc4d:     LDA $2d,x          ; $dc4d: b5 2d     
            BNE __dc5e         ; $dc4f: d0 0d     
            PLA                ; $dc51: 68        
            TAY                ; $dc52: a8        
__dc53:     LDA ($03),y        ; $dc53: b1 03     
            RTS                ; $dc55: 60        

;-------------------------------------------------------------------------------
__dc56:     LDA #$00           ; $dc56: a9 00     
__dc58:     RTS                ; $dc58: 60        

;-------------------------------------------------------------------------------
__dc59:     LDA $00            ; $dc59: a5 00     
            STA $0783,x        ; $dc5b: 9d 83 07  
__dc5e:     PLA                ; $dc5e: 68        
            TAY                ; $dc5f: a8        
            LDA ($03),y        ; $dc60: b1 03     
            BMI __dc56         ; $dc62: 30 f2     
            CMP #$04           ; $dc64: c9 04     
            BEQ __dc56         ; $dc66: f0 ee     
            BNE __dc53         ; $dc68: d0 e9     
__dc6a:     LDA $0301          ; $dc6a: ad 01 03  
            BNE __dc58         ; $dc6d: d0 e9     
            STA $0300          ; $dc6f: 8d 00 03  
            LDA $84            ; $dc72: a5 84     
            BEQ __dc80         ; $dc74: f0 0a     
            LDX #$00           ; $dc76: a2 00     
            LDY #$00           ; $dc78: a0 00     
            JSR __dc97         ; $dc7a: 20 97 dc  
            JSR __dda9         ; $dc7d: 20 a9 dd  
__dc80:     LDA $85            ; $dc80: a5 85     
            BEQ __dc58         ; $dc82: f0 d4     
            LDX #$01           ; $dc84: a2 01     
            LDY $0300          ; $dc86: ac 00 03  
            JSR __dc97         ; $dc89: 20 97 dc  
            JMP __dda9         ; $dc8c: 4c a9 dd  

;-------------------------------------------------------------------------------
            JMP ($75d7)        ; $dc8f: 6c d7 75  

;-------------------------------------------------------------------------------
            .hex d7 8a         ; $dc92: d7 8a     Invalid Opcode - DCP $8a,x
            .hex d7 93         ; $dc94: d7 93     Invalid Opcode - DCP $93,x
            .hex d7            ; $dc96: d7        Suspected data
__dc97:     LDA $84,x          ; $dc97: b5 84     
            AND #$01           ; $dc99: 29 01     
            BNE __dca4         ; $dc9b: d0 07     
            LDA $84,x          ; $dc9d: b5 84     
            AND #$02           ; $dc9f: 29 02     
            BNE __dcad         ; $dca1: d0 0a     
            RTS                ; $dca3: 60        

;-------------------------------------------------------------------------------
__dca4:     JSR __ddb6         ; $dca4: 20 b6 dd  
            JSR __dcf0         ; $dca7: 20 f0 dc  
            JMP __dcb3         ; $dcaa: 4c b3 dc  

;-------------------------------------------------------------------------------
__dcad:     JSR __ddb6         ; $dcad: 20 b6 dd  
            JSR __dcf6         ; $dcb0: 20 f6 dc  
__dcb3:     LDA $d7,x          ; $dcb3: b5 d7     
            PHA                ; $dcb5: 48        
            TAY                ; $dcb6: a8        
            LDA ($05),y        ; $dcb7: b1 05     
            JSR __dcea         ; $dcb9: 20 ea dc  
            INY                ; $dcbc: c8        
            STY $00            ; $dcbd: 84 00     
            PLA                ; $dcbf: 68        
            TAY                ; $dcc0: a8        
            LDA $d4,x          ; $dcc1: b5 d4     
            CLC                ; $dcc3: 18        
            ADC ($07),y        ; $dcc4: 71 07     
            JSR __dcea         ; $dcc6: 20 ea dc  
            INY                ; $dcc9: c8        
            LDA #$01           ; $dcca: a9 01     
            STA $0301,y        ; $dccc: 99 01 03  
            INY                ; $dccf: c8        
            STY $00            ; $dcd0: 84 00     
            LDA $7d,x          ; $dcd2: b5 7d     
            STA $03            ; $dcd4: 85 03     
            LDY $5c,x          ; $dcd6: b4 5c     
            JSR __de12         ; $dcd8: 20 12 de  
            JSR __dcea         ; $dcdb: 20 ea dc  
            LDA #$00           ; $dcde: a9 00     
            STA $0302,y        ; $dce0: 99 02 03  
            INY                ; $dce3: c8        
            STY $0300          ; $dce4: 8c 00 03  
            LDX $0f            ; $dce7: a6 0f     
            RTS                ; $dce9: 60        

;-------------------------------------------------------------------------------
__dcea:     LDY $00            ; $dcea: a4 00     
            STA $0301,y        ; $dcec: 99 01 03  
            RTS                ; $dcef: 60        

;-------------------------------------------------------------------------------
__dcf0:     LDA #$04           ; $dcf0: a9 04     
            LDY #$03           ; $dcf2: a0 03     
            BNE __dcfa         ; $dcf4: d0 04     
__dcf6:     LDA #$05           ; $dcf6: a9 05     
            LDY #$07           ; $dcf8: a0 07     
__dcfa:     STA $04            ; $dcfa: 85 04     
            LDX #$03           ; $dcfc: a2 03     
__dcfe:     .hex b9            ; $dcfe: b9        Suspected data
__dcff:     .hex 8f dc 95      ; $dcff: 8f dc 95  Invalid Opcode - SAX $95dc
            ORA $88            ; $dd02: 05 88     
            DEX                ; $dd04: ca        
            BPL __dcfe         ; $dd05: 10 f7     
            LDY $00            ; $dd07: a4 00     
            LDX $0f            ; $dd09: a6 0f     
__dd0b:     RTS                ; $dd0b: 60        

;-------------------------------------------------------------------------------
__dd0c:     CLC                ; $dd0c: 18        
            CLC                ; $dd0d: 18        
            CLC                ; $dd0e: 18        
            ASL $16,x          ; $dd0f: 16 16     
            ASL $14,x          ; $dd11: 16 14     
            .hex 14 14         ; $dd13: 14 14     Invalid Opcode - NOP $14,x
            .hex 14            ; $dd15: 14        Suspected data
__dd16:     JSR __dcf6         ; $dd16: 20 f6 dc  
            LDX #$01           ; $dd19: a2 01     
            BNE __dd22         ; $dd1b: d0 05     
__dd1d:     JSR __dcf0         ; $dd1d: 20 f0 dc  
            LDX #$00           ; $dd20: a2 00     
__dd22:     STX $0b            ; $dd22: 86 0b     
__dd24:     LDA $da,x          ; $dd24: b5 da     
            CMP #$0a           ; $dd26: c9 0a     
            BEQ __dd0b         ; $dd28: f0 e1     
            TAY                ; $dd2a: a8        
            TAX                ; $dd2b: aa        
            JSR __dda1         ; $dd2c: 20 a1 dd  
            CLC                ; $dd2f: 18        
            ADC __d762,x       ; $dd30: 7d 62 d7  
            STA $03            ; $dd33: 85 03     
            JSR __dda1         ; $dd35: 20 a1 dd  
            CLC                ; $dd38: 18        
            ADC #$04           ; $dd39: 69 04     
            CLC                ; $dd3b: 18        
            ADC ($07),y        ; $dd3c: 71 07     
            STA $0302          ; $dd3e: 8d 02 03  
            LDA __dd0c,x       ; $dd41: bd 0c dd  
            STA $0303          ; $dd44: 8d 03 03  
            LDA ($05),y        ; $dd47: b1 05     
            STA $0301          ; $dd49: 8d 01 03  
            LDY #$00           ; $dd4c: a0 00     
            STY $02            ; $dd4e: 84 02     
__dd50:     JSR __de12         ; $dd50: 20 12 de  
            LDY $02            ; $dd53: a4 02     
            STA $0304,y        ; $dd55: 99 04 03  
            INY                ; $dd58: c8        
            STY $02            ; $dd59: 84 02     
            TYA                ; $dd5b: 98        
            CMP __dd0c,x       ; $dd5c: dd 0c dd  
            BCC __dd50         ; $dd5f: 90 ef     
            LDA #$00           ; $dd61: a9 00     
            STA $0304,y        ; $dd63: 99 04 03  
            LDX $0b            ; $dd66: a6 0b     
            BNE __dd97         ; $dd68: d0 2d     
            LDY $da,x          ; $dd6a: b4 da     
            LDA $062f,y        ; $dd6c: b9 2f 06  
            BPL __dd97         ; $dd6f: 10 26     
            STA $00            ; $dd71: 85 00     
            LDY #$03           ; $dd73: a0 03     
__dd75:     LDA $00            ; $dd75: a5 00     
            LDX $0301,y        ; $dd77: be 01 03  
            BEQ __dd97         ; $dd7a: f0 1b     
            CPX #$38           ; $dd7c: e0 38     
            BEQ __dd94         ; $dd7e: f0 14     
            CPX #$eb           ; $dd80: e0 eb     
            BNE __dd91         ; $dd82: d0 0d     
            CMP #$90           ; $dd84: c9 90     
            BCC __dd91         ; $dd86: 90 09     
            CMP #$d3           ; $dd88: c9 d3     
            BEQ __dd8f         ; $dd8a: f0 03     
            LDA #$8f           ; $dd8c: a9 8f     
            .hex 2c            ; $dd8e: 2c        Suspected data
__dd8f:     LDA #$8c           ; $dd8f: a9 8c     
__dd91:     STA $0301,y        ; $dd91: 99 01 03  
__dd94:     INY                ; $dd94: c8        
            BNE __dd75         ; $dd95: d0 de     
__dd97:     JSR __c14e         ; $dd97: 20 4e c1  
            LDX $0b            ; $dd9a: a6 0b     
            INC $da,x          ; $dd9c: f6 da     
            JMP __dd24         ; $dd9e: 4c 24 dd  

;-------------------------------------------------------------------------------
__dda1:     LDA #$18           ; $dda1: a9 18     
            SEC                ; $dda3: 38        
            SBC __dd0c,x       ; $dda4: fd 0c dd  
            LSR                ; $dda7: 4a        
            RTS                ; $dda8: 60        

;-------------------------------------------------------------------------------
__dda9:     LDA #$02           ; $dda9: a9 02     
            STA $fc            ; $ddab: 85 fc     
            LDA $0e            ; $ddad: a5 0e     
            EOR #$ff           ; $ddaf: 49 ff     
            AND $84,x          ; $ddb1: 35 84     
            STA $84,x          ; $ddb3: 95 84     
            RTS                ; $ddb5: 60        

;-------------------------------------------------------------------------------
__ddb6:     STA $0e            ; $ddb6: 85 0e     
            STX $0f            ; $ddb8: 86 0f     
            STY $00            ; $ddba: 84 00     
            RTS                ; $ddbc: 60        

;-------------------------------------------------------------------------------
__ddbd:     LDY #$06           ; $ddbd: a0 06     
__ddbf:     DEY                ; $ddbf: 88        
            CMP __d77f,y       ; $ddc0: d9 7f d7  
            BNE __ddbf         ; $ddc3: d0 fa     
            LDA __d785,y       ; $ddc5: b9 85 d7  
            RTS                ; $ddc8: 60        

;-------------------------------------------------------------------------------
__ddc9:     LDA $80,x          ; $ddc9: b5 80     
            BEQ __de10         ; $ddcb: f0 43     
            LDA #$00           ; $ddcd: a9 00     
            STA $80,x          ; $ddcf: 95 80     
            LDA #$04           ; $ddd1: a9 04     
            STA $00            ; $ddd3: 85 00     
            JSR __dde1         ; $ddd5: 20 e1 dd  
            BCC __de11         ; $ddd8: 90 37     
            LDY $62,x          ; $ddda: b4 62     
            LDA __da97,y       ; $dddc: b9 97 da  
            STA $00            ; $dddf: 85 00     
__dde1:     JSR __dad5         ; $dde1: 20 d5 da  
            BCS __ddec         ; $dde4: b0 06     
            LDA #$04           ; $dde6: a9 04     
            STA $fc            ; $dde8: 85 fc     
            CLC                ; $ddea: 18        
            RTS                ; $ddeb: 60        

;-------------------------------------------------------------------------------
__ddec:     JSR __dbb0         ; $ddec: 20 b0 db  
            LDA $90            ; $ddef: a5 90     
            SEC                ; $ddf1: 38        
            SBC $d7,x          ; $ddf2: f5 d7     
            CMP #$03           ; $ddf4: c9 03     
            BCS __de10         ; $ddf6: b0 18     
            STY $5c,x          ; $ddf8: 94 5c     
            LDA $03            ; $ddfa: a5 03     
            STA $7d,x          ; $ddfc: 95 7d     
            JSR __daf2         ; $ddfe: 20 f2 da  
            BCC __de07         ; $de01: 90 04     
            LDA $82,x          ; $de03: b5 82     
            BNE __de11         ; $de05: d0 0a     
__de07:     JSR __d91c         ; $de07: 20 1c d9  
            LDA $84,x          ; $de0a: b5 84     
            ORA #$02           ; $de0c: 09 02     
            STA $84,x          ; $de0e: 95 84     
__de10:     CLC                ; $de10: 18        
__de11:     RTS                ; $de11: 60        

;-------------------------------------------------------------------------------
__de12:     LDA $04            ; $de12: a5 04     
            CMP #$05           ; $de14: c9 05     
            BEQ __de1d         ; $de16: f0 05     
            LDA ($03),y        ; $de18: b1 03     
            JMP __ddbd         ; $de1a: 4c bd dd  

;-------------------------------------------------------------------------------
__de1d:     LDA ($03),y        ; $de1d: b1 03     
            JMP __deea         ; $de1f: 4c ea de  

;-------------------------------------------------------------------------------
__de22:     LDA $0301          ; $de22: ad 01 03  
            BNE __de11         ; $de25: d0 ea     
            STA $0300          ; $de27: 8d 00 03  
            LDA #$05           ; $de2a: a9 05     
            STA $0f            ; $de2c: 85 0f     
__de2e:     TAX                ; $de2e: aa        
            LDA $91,x          ; $de2f: b5 91     
            BPL __de9c         ; $de31: 10 69     
            LDA $b2,x          ; $de33: b5 b2     
            BEQ __de9c         ; $de35: f0 65     
            STA $d9            ; $de37: 85 d9     
            LDA $9c,x          ; $de39: b5 9c     
            CLC                ; $de3b: 18        
            ADC #$08           ; $de3c: 69 08     
            STA $0e            ; $de3e: 85 0e     
            LDA #$00           ; $de40: a9 00     
            STA $0d            ; $de42: 85 0d     
__de44:     JSR __deb2         ; $de44: 20 b2 de  
            BPL __dea5         ; $de47: 10 5c     
            LDA #$01           ; $de49: a9 01     
            STA ($03),y        ; $de4b: 91 03     
            LDX #$02           ; $de4d: a2 02     
            STY $5c,x          ; $de4f: 94 5c     
            LDA $03            ; $de51: a5 03     
            STA $7d,x          ; $de53: 95 7d     
            LDA $0e            ; $de55: a5 0e     
            JSR __edbf         ; $de57: 20 bf ed  
            STA $d6            ; $de5a: 85 d6     
            JSR __dcf0         ; $de5c: 20 f0 dc  
            LDY $0300          ; $de5f: ac 00 03  
            STY $00            ; $de62: 84 00     
            LDX #$02           ; $de64: a2 02     
            JSR __dcb3         ; $de66: 20 b3 dc  
            LDY $d9            ; $de69: a4 d9     
            LDA $062f,y        ; $de6b: b9 2f 06  
            BPL __de83         ; $de6e: 10 13     
            CMP #$90           ; $de70: c9 90     
            BCS __de7d         ; $de72: b0 09     
            CMP #$8c           ; $de74: c9 8c     
            BEQ __de7b         ; $de76: f0 03     
__de78:     LDA #$cd           ; $de78: a9 cd     
            .hex 2c            ; $de7a: 2c        Suspected data
__de7b:     LDA #$d3           ; $de7b: a9 d3     
__de7d:     LDY $0300          ; $de7d: ac 00 03  
            STA $0300,y        ; $de80: 99 00 03  
__de83:     LDA $0d            ; $de83: a5 0d     
            BNE __dea9         ; $de85: d0 22     
            LDX $0f            ; $de87: a6 0f     
            LDA $bd,x          ; $de89: b5 bd     
            BMI __de90         ; $de8b: 30 03     
            LDA #$08           ; $de8d: a9 08     
            .hex 2c            ; $de8f: 2c        Suspected data
__de90:     LDA #$f8           ; $de90: a9 f8     
            STA $0d            ; $de92: 85 0d     
            CLC                ; $de94: 18        
            ADC $0e            ; $de95: 65 0e     
            STA $0e            ; $de97: 85 0e     
            JMP __de44         ; $de99: 4c 44 de  

;-------------------------------------------------------------------------------
__de9c:     INC $0f            ; $de9c: e6 0f     
            LDA $0f            ; $de9e: a5 0f     
            CMP #$08           ; $dea0: c9 08     
            BCC __de2e         ; $dea2: 90 8a     
            RTS                ; $dea4: 60        

;-------------------------------------------------------------------------------
__dea5:     LDA $0d            ; $dea5: a5 0d     
            BEQ __de9c         ; $dea7: f0 f3     
__dea9:     LDA #$02           ; $dea9: a9 02     
            STA $fc            ; $deab: 85 fc     
            LDX $0f            ; $dead: a6 0f     
            JMP __d888         ; $deaf: 4c 88 d8  

;-------------------------------------------------------------------------------
__deb2:     LDX $0f            ; $deb2: a6 0f     
            LDA $b2,x          ; $deb4: b5 b2     
            AND #$0f           ; $deb6: 29 0f     
            .hex 2c            ; $deb8: 2c        Suspected data
__deb9:     LDA $0f            ; $deb9: a5 0f     
            PHA                ; $debb: 48        
            LDA $0e            ; $debc: a5 0e     
            CMP #$20           ; $debe: c9 20     
            BCC __dee4         ; $dec0: 90 22     
            CMP #$e0           ; $dec2: c9 e0     
            BCS __dee4         ; $dec4: b0 1e     
__dec6:     JSR __edbf         ; $dec6: 20 bf ed  
            SEC                ; $dec9: 38        
            SBC #$04           ; $deca: e9 04     
            STA $02            ; $decc: 85 02     
            PLA                ; $dece: 68        
            TAY                ; $decf: a8        
            LDA __d762,y       ; $ded0: b9 62 d7  
            STA $03            ; $ded3: 85 03     
            LDA #$05           ; $ded5: a9 05     
            STA $04            ; $ded7: 85 04     
            .hex a4            ; $ded9: a4        Suspected data
__deda:     .hex 02            ; $deda: 02        Invalid Opcode - KIL 
            LDA ($03),y        ; $dedb: b1 03     
            STA $02            ; $dedd: 85 02     
            DEC $04            ; $dedf: c6 04     
            LDA ($03),y        ; $dee1: b1 03     
            RTS                ; $dee3: 60        

;-------------------------------------------------------------------------------
__dee4:     PLA                ; $dee4: 68        
            LDA #$01           ; $dee5: a9 01     
            STA $02            ; $dee7: 85 02     
            RTS                ; $dee9: 60        

;-------------------------------------------------------------------------------
__deea:     LDY #$06           ; $deea: a0 06     
__deec:     DEY                ; $deec: 88        
            CMP __d77f,y       ; $deed: d9 7f d7  
            BNE __deec         ; $def0: d0 fa     
            LDA __d79d,y       ; $def2: b9 9d d7  
            RTS                ; $def5: 60        

;-------------------------------------------------------------------------------
__def6:     BVC __de78         ; $def6: 50 80     
            BCS __deda         ; $def8: b0 e0     
__defa:     BRK                ; $defa: 00        
__defb:     BRK                ; $defb: 00        
            BRK                ; $defc: 00        
            .hex 02            ; $defd: 02        Invalid Opcode - KIL 
            .hex 04 07         ; $defe: 04 07     Invalid Opcode - NOP $07
            PHP                ; $df00: 08        
            .hex 0c 0e 12      ; $df01: 0c 0e 12  Invalid Opcode - NOP $120e
            .hex 12            ; $df04: 12        Invalid Opcode - KIL 
            ORA $17,x          ; $df05: 15 17     
            .hex 17            ; $df07: 17        Suspected data
__df08:     CLC                ; $df08: 18        
            .hex 23 23         ; $df09: 23 23     Invalid Opcode - RLA ($23,x)
            ROL $2d            ; $df0b: 26 2d     
            BMI __df48         ; $df0d: 30 39     
            .hex 44 4e         ; $df0f: 44 4e     Invalid Opcode - NOP $4e
            .hex 53 5a         ; $df11: 53 5a     Invalid Opcode - SRE ($5a),y
            RTS                ; $df13: 60        

;-------------------------------------------------------------------------------
            ROR                ; $df14: 6a        
            ROR $736f          ; $df15: 6e 6f 73  
            SEI                ; $df18: 78        
            STA ($89,x)        ; $df19: 81 89     
__df1b:     .hex 89 85         ; $df1b: 89 85     Invalid Opcode - NOP #$85
            .hex b2            ; $df1d: b2        Invalid Opcode - KIL 
            STA ($ab),y        ; $df1e: 91 ab     
            .hex 27 67         ; $df20: 27 67     Invalid Opcode - RLA $67
            JMP ($2793)        ; $df22: 6c 93 27  

;-------------------------------------------------------------------------------
            ADC $81            ; $df25: 65 81     
            STA __f2cb         ; $df27: 8d cb f2  
            .hex 22            ; $df2a: 22        Invalid Opcode - KIL 
            LDX #$ae           ; $df2b: a2 ae     
            INY                ; $df2d: c8        
            .hex 27 c7         ; $df2e: 27 c7     Invalid Opcode - RLA $c7
            BNE __def6         ; $df30: d0 c4     
__df32:     .hex d2            ; $df32: d2        Invalid Opcode - KIL 
            STA ($4a,x)        ; $df33: 81 4a     
            STY $8c            ; $df35: 84 8c     
            STY $a8,x          ; $df37: 94 a8     
            .hex c2 44         ; $df39: c2 44     Invalid Opcode - NOP #$44
            LSR                ; $df3b: 4a        
            BVC __df08         ; $df3c: 50 ca     
            CMP ($48),y        ; $df3e: d1 48     
            BVS __dec6         ; $df40: 70 84     
            ROL $2e            ; $df42: 26 2e     
            .hex 64 70         ; $df44: 64 70     Invalid Opcode - NOP $70
            .hex c7 cd         ; $df46: c7 cd     Invalid Opcode - DCP $cd
__df48:     .hex d3 a2         ; $df48: d3 a2     Invalid Opcode - DCP ($a2),y
            .hex ab b1         ; $df4a: ab b1     Invalid Opcode - LAX #$b1
            BIT $8b85          ; $df4c: 2c 85 8b  
            STA ($96),y        ; $df4f: 91 96     
            .hex a7 ae         ; $df51: a7 ae     Invalid Opcode - LAX $ae
            .hex cf d4 27      ; $df53: cf d4 27  Invalid Opcode - DCP $27d4
            .hex 44 50         ; $df56: 44 50     Invalid Opcode - NOP $50
            .hex 63 6d         ; $df58: 63 6d     Invalid Opcode - RRA ($6d,x)
__df5a:     STX $90            ; $df5a: 86 90     
            .hex a3 a9         ; $df5c: a3 a9     Invalid Opcode - LAX ($a9,x)
            .hex af e3 e5      ; $df5e: af e3 e5  Invalid Opcode - LAX __e5e3
            SBC $48f4          ; $df61: ed f4 48  
            .hex 4f a3 ab      ; $df64: 4f a3 ab  Invalid Opcode - SRE $aba3
            .hex b3 c3         ; $df67: b3 c3     Invalid Opcode - LAX ($c3),y
            .hex cb 6d         ; $df69: cb 6d     Invalid Opcode - AXS #$6d
            .hex 92            ; $df6b: 92        Invalid Opcode - KIL 
            LDA $af            ; $df6c: a5 af     
            .hex eb 64         ; $df6e: eb 64     Invalid Opcode - SBC #$64
            DEY                ; $df70: 88        
            STX $ac94          ; $df71: 8e 94 ac  
__df74:     CPX $a7f2          ; $df74: ec f2 a7  
            LDX __c7c4         ; $df77: ae c4 c7  
            .hex d3 ce         ; $df7a: d3 ce     Invalid Opcode - DCP ($ce),y
            .hex 23 64         ; $df7c: 23 64     Invalid Opcode - RLA ($64,x)
            STX __d0a9         ; $df7e: 8e a9 d0  
            CPX $e9            ; $df81: e4 e9     
            INY                ; $df83: c8        
            BNE __df5a         ; $df84: d0 d4     
            .hex 8b c9         ; $df86: 8b c9     Invalid Opcode - XAA #$c9
            .hex d4 cf         ; $df88: d4 cf     Invalid Opcode - NOP $cf,x
            .hex cb 88         ; $df8a: cb 88     Invalid Opcode - AXS #$88
            BCC __df32         ; $df8c: 90 a4     
            .hex d4 c7         ; $df8e: d4 c7     Invalid Opcode - NOP $c7,x
            BNE __df74         ; $df90: d0 e2     
            SBC #$f1           ; $df92: e9 f1     
            .hex 2b 50         ; $df94: 2b 50     Invalid Opcode - ANC #$50
            .hex 67 70         ; $df96: 67 70     Invalid Opcode - RRA $70
            .hex 82 8b         ; $df98: 82 8b     Invalid Opcode - NOP #$8b
            .hex c2 c9         ; $df9a: c2 c9     Invalid Opcode - NOP #$c9
            CMP ($48),y        ; $df9c: d1 48     
            EOR ($87),y        ; $df9e: 51 87     
            STA $b0,x          ; $dfa0: 95 b0     
            CPX $ed            ; $dfa2: e4 ed     
            .hex f5            ; $dfa4: f5        Suspected data
__dfa5:     LDA $59            ; $dfa5: a5 59     
            AND #$1f           ; $dfa7: 29 1f     
            TAY                ; $dfa9: a8        
            RTS                ; $dfaa: 60        

;-------------------------------------------------------------------------------
__dfab:     JSR __dfea         ; $dfab: 20 ea df  
            BEQ __dfe9         ; $dfae: f0 39     
            TAX                ; $dfb0: aa        
__dfb1:     LDA #$04           ; $dfb1: a9 04     
            STA $04            ; $dfb3: 85 04     
            STA $06            ; $dfb5: 85 06     
            JSR __dff8         ; $dfb7: 20 f8 df  
            LDA __df1b,x       ; $dfba: bd 1b df  
            AND #$1f           ; $dfbd: 29 1f     
            CLC                ; $dfbf: 18        
            ADC __d762,y       ; $dfc0: 79 62 d7  
            SEC                ; $dfc3: 38        
            SBC #$01           ; $dfc4: e9 01     
            STA $03            ; $dfc6: 85 03     
            CLC                ; $dfc8: 18        
            ADC #$18           ; $dfc9: 69 18     
            STA $05            ; $dfcb: 85 05     
            LDY #$02           ; $dfcd: a0 02     
__dfcf:     LDA #$03           ; $dfcf: a9 03     
            STA ($03),y        ; $dfd1: 91 03     
            CPY #$01           ; $dfd3: c0 01     
            BNE __dfe1         ; $dfd5: d0 0a     
            LDA #$04           ; $dfd7: a9 04     
            STA ($05),y        ; $dfd9: 91 05     
            INC $06            ; $dfdb: e6 06     
            STA ($05),y        ; $dfdd: 91 05     
            DEC $06            ; $dfdf: c6 06     
__dfe1:     DEY                ; $dfe1: 88        
            BPL __dfcf         ; $dfe2: 10 eb     
            DEX                ; $dfe4: ca        
            CPX $0a            ; $dfe5: e4 0a     
            BNE __dfb1         ; $dfe7: d0 c8     
__dfe9:     RTS                ; $dfe9: 60        

;-------------------------------------------------------------------------------
__dfea:     JSR __dfa5         ; $dfea: 20 a5 df  
            LDA __defa,y       ; $dfed: b9 fa de  
            STA $0a            ; $dff0: 85 0a     
            LDA __defb,y       ; $dff2: b9 fb de  
            CMP $0a            ; $dff5: c5 0a     
            RTS                ; $dff7: 60        

;-------------------------------------------------------------------------------
__dff8:     LDA __df1b,x       ; $dff8: bd 1b df  
            LSR                ; $dffb: 4a        
            LSR                ; $dffc: 4a        
            LSR                ; $dffd: 4a        
            LSR                ; $dffe: 4a        
            LSR                ; $dfff: 4a        
            TAY                ; $e000: a8        
            RTS                ; $e001: 60        

;-------------------------------------------------------------------------------
__e002:     LDX #$0b           ; $e002: a2 0b     
__e004:     LDA #$00           ; $e004: a9 00     
            STA $0600,x        ; $e006: 9d 00 06  
            STA $0610,x        ; $e009: 9d 10 06  
            STA $0620,x        ; $e00c: 9d 20 06  
            DEX                ; $e00f: ca        
            BPL __e004         ; $e010: 10 f2     
            JSR __dfea         ; $e012: 20 ea df  
            BEQ __e05d         ; $e015: f0 46     
            STA $0b            ; $e017: 85 0b     
            LDX #$00           ; $e019: a2 00     
__e01b:     LDY $0b            ; $e01b: a4 0b     
            LDA __df1b,y       ; $e01d: b9 1b df  
            LSR                ; $e020: 4a        
            LSR                ; $e021: 4a        
            LSR                ; $e022: 4a        
            LSR                ; $e023: 4a        
            LSR                ; $e024: 4a        
            STA $00            ; $e025: 85 00     
            LDA $90            ; $e027: a5 90     
            SEC                ; $e029: 38        
            SBC $00            ; $e02a: e5 00     
            CMP #$04           ; $e02c: c9 04     
            BCS __e054         ; $e02e: b0 24     
            TAY                ; $e030: a8        
            LDA __def6,y       ; $e031: b9 f6 de  
            STA $0610,x        ; $e034: 9d 10 06  
            LDY $0b            ; $e037: a4 0b     
            LDA __df1b,y       ; $e039: b9 1b df  
            AND #$1f           ; $e03c: 29 1f     
            ADC #$04           ; $e03e: 69 04     
            ASL                ; $e040: 0a        
            ASL                ; $e041: 0a        
            ASL                ; $e042: 0a        
            STA $0600,x        ; $e043: 9d 00 06  
            LDA __df1b,y       ; $e046: b9 1b df  
            AND #$1f           ; $e049: 29 1f     
            CLC                ; $e04b: 18        
            ADC #$05           ; $e04c: 69 05     
            ASL                ; $e04e: 0a        
            ASL                ; $e04f: 0a        
            ASL                ; $e050: 0a        
            STA $0620,x        ; $e051: 9d 20 06  
__e054:     INX                ; $e054: e8        
            DEC $0b            ; $e055: c6 0b     
            LDA $0b            ; $e057: a5 0b     
            CMP $0a            ; $e059: c5 0a     
            BNE __e01b         ; $e05b: d0 be     
__e05d:     RTS                ; $e05d: 60        

;-------------------------------------------------------------------------------
__e05e:     JSR __dfea         ; $e05e: 20 ea df  
            BEQ __e05d         ; $e061: f0 fa     
            STA $01            ; $e063: 85 01     
            LDA #$00           ; $e065: a9 00     
            STA $00            ; $e067: 85 00     
__e069:     LDX $01            ; $e069: a6 01     
            JSR __dff8         ; $e06b: 20 f8 df  
            LDA __d794,y       ; $e06e: b9 94 d7  
            STA $02            ; $e071: 85 02     
            LDA __d78b,y       ; $e073: b9 8b d7  
            JSR __e0a7         ; $e076: 20 a7 e0  
            JSR __e097         ; $e079: 20 97 e0  
            LDA $00            ; $e07c: a5 00     
            CLC                ; $e07e: 18        
            ADC #$04           ; $e07f: 69 04     
            STA $00            ; $e081: 85 00     
            CMP #$38           ; $e083: c9 38     
            BCS __e08f         ; $e085: b0 08     
            DEC $01            ; $e087: c6 01     
            LDA $01            ; $e089: a5 01     
            CMP $0a            ; $e08b: c5 0a     
            BNE __e069         ; $e08d: d0 da     
__e08f:     LDY $00            ; $e08f: a4 00     
            STY $0300          ; $e091: 8c 00 03  
            JMP __c14e         ; $e094: 4c 4e c1  

;-------------------------------------------------------------------------------
__e097:     LDA #$c5           ; $e097: a9 c5     
            STA $0303,y        ; $e099: 99 03 03  
            LDA #$eb           ; $e09c: a9 eb     
            STA $0304,y        ; $e09e: 99 04 03  
            LDA #$00           ; $e0a1: a9 00     
            STA $0305,y        ; $e0a3: 99 05 03  
            RTS                ; $e0a6: 60        

;-------------------------------------------------------------------------------
__e0a7:     JSR __dcea         ; $e0a7: 20 ea dc  
            LDA __df1b,x       ; $e0aa: bd 1b df  
            AND #$1f           ; $e0ad: 29 1f     
            CLC                ; $e0af: 18        
            ADC #$04           ; $e0b0: 69 04     
            CLC                ; $e0b2: 18        
            ADC $02            ; $e0b3: 65 02     
            STA $0302,y        ; $e0b5: 99 02 03  
            RTS                ; $e0b8: 60        

;-------------------------------------------------------------------------------
__e0b9:     LDX #$00           ; $e0b9: a2 00     
            JSR __e0c0         ; $e0bb: 20 c0 e0  
            LDX #$01           ; $e0be: a2 01     
__e0c0:     LDA $3a,x          ; $e0c0: b5 3a     
            BNE __e11b         ; $e0c2: d0 57     
            LDA $5a,x          ; $e0c4: b5 5a     
            BEQ __e11a         ; $e0c6: f0 52     
            LDA $6a,x          ; $e0c8: b5 6a     
            CMP #$07           ; $e0ca: c9 07     
            BEQ __e11a         ; $e0cc: f0 4c     
            LDA $2d,x          ; $e0ce: b5 2d     
            BNE __e11a         ; $e0d0: d0 48     
            LDA $64,x          ; $e0d2: b5 64     
            CLC                ; $e0d4: 18        
            ADC #$08           ; $e0d5: 69 08     
            STA $0a            ; $e0d7: 85 0a     
            LDA $66,x          ; $e0d9: b5 66     
            CLC                ; $e0db: 18        
            ADC #$0c           ; $e0dc: 69 0c     
            STA $0b            ; $e0de: 85 0b     
            LDY #$00           ; $e0e0: a0 00     
__e0e2:     LDA $0600,y        ; $e0e2: b9 00 06  
            BEQ __e115         ; $e0e5: f0 2e     
            CLC                ; $e0e7: 18        
            ADC #$04           ; $e0e8: 69 04     
            SEC                ; $e0ea: 38        
            SBC $0a            ; $e0eb: e5 0a     
            STA $00            ; $e0ed: 85 00     
            JSR __d2f9         ; $e0ef: 20 f9 d2  
            CMP #$0c           ; $e0f2: c9 0c     
            BCS __e115         ; $e0f4: b0 1f     
            LDA $0610,y        ; $e0f6: b9 10 06  
            SEC                ; $e0f9: 38        
            SBC #$1c           ; $e0fa: e9 1c     
            SEC                ; $e0fc: 38        
            SBC $0b            ; $e0fd: e5 0b     
            JSR __d2f9         ; $e0ff: 20 f9 d2  
            PHA                ; $e102: 48        
            LDA $e6,x          ; $e103: b5 e6     
            CMP #$02           ; $e105: c9 02     
            BCS __e110         ; $e107: b0 07     
            PLA                ; $e109: 68        
            CMP #$1c           ; $e10a: c9 1c     
            BCC __e12f         ; $e10c: 90 21     
            BCS __e115         ; $e10e: b0 05     
__e110:     PLA                ; $e110: 68        
            CMP #$24           ; $e111: c9 24     
            BCC __e12f         ; $e113: 90 1a     
__e115:     INY                ; $e115: c8        
            CPY #$0b           ; $e116: c0 0b     
            BCC __e0e2         ; $e118: 90 c8     
__e11a:     RTS                ; $e11a: 60        

;-------------------------------------------------------------------------------
__e11b:     LDA $50            ; $e11b: a5 50     
            AND #$01           ; $e11d: 29 01     
            BEQ __e12e         ; $e11f: f0 0d     
            LDA $68,x          ; $e121: b5 68     
            BEQ __e12e         ; $e123: f0 09     
            CMP #$02           ; $e125: c9 02     
            BEQ __e12c         ; $e127: f0 03     
            INC $64,x          ; $e129: f6 64     
            .hex 2c            ; $e12b: 2c        Suspected data
__e12c:     DEC $64,x          ; $e12c: d6 64     
__e12e:     RTS                ; $e12e: 60        

;-------------------------------------------------------------------------------
__e12f:     PHA                ; $e12f: 48        
            LDA $e6,x          ; $e130: b5 e6     
            CMP #$02           ; $e132: c9 02     
            BCS __e13d         ; $e134: b0 07     
            PLA                ; $e136: 68        
            CMP #$18           ; $e137: c9 18     
            BCC __e158         ; $e139: 90 1d     
            BCS __e142         ; $e13b: b0 05     
__e13d:     PLA                ; $e13d: 68        
            CMP #$23           ; $e13e: c9 23     
            BCC __e158         ; $e140: 90 16     
__e142:     LDA $68,x          ; $e142: b5 68     
            BEQ __e158         ; $e144: f0 12     
            LDA $00            ; $e146: a5 00     
            CMP #$03           ; $e148: c9 03     
            BCC __e153         ; $e14a: 90 07     
            CMP #$fd           ; $e14c: c9 fd     
            BCS __e153         ; $e14e: b0 03     
            JSR __e176         ; $e150: 20 76 e1  
__e153:     LDA #$08           ; $e153: a9 08     
            STA $3a,x          ; $e155: 95 3a     
            RTS                ; $e157: 60        

;-------------------------------------------------------------------------------
__e158:     LDA $00            ; $e158: a5 00     
            BMI __e165         ; $e15a: 30 09     
            LDA $0600,y        ; $e15c: b9 00 06  
            SEC                ; $e15f: 38        
            SBC #$10           ; $e160: e9 10     
            JMP __e16b         ; $e162: 4c 6b e1  

;-------------------------------------------------------------------------------
__e165:     LDA $0600,y        ; $e165: b9 00 06  
            CLC                ; $e168: 18        
            ADC #$07           ; $e169: 69 07     
__e16b:     STA $64,x          ; $e16b: 95 64     
            LDA $6a,x          ; $e16d: b5 6a     
            AND #$01           ; $e16f: 29 01     
            BNE __e184         ; $e171: d0 11     
            JMP __e176         ; $e173: 4c 76 e1  

;-------------------------------------------------------------------------------
__e176:     LDA $00            ; $e176: a5 00     
            ASL                ; $e178: 0a        
            LDA #$01           ; $e179: a9 01     
            BCS __e17e         ; $e17b: b0 01     
            ASL                ; $e17d: 0a        
__e17e:     STA $68,x          ; $e17e: 95 68     
            AND #$01           ; $e180: 29 01     
            STA $62,x          ; $e182: 95 62     
__e184:     RTS                ; $e184: 60        

;-------------------------------------------------------------------------------
__e185:     PLP                ; $e185: 28        
            CLI                ; $e186: 58        
            DEY                ; $e187: 88        
            CLV                ; $e188: b8        
__e189:     LDX $90            ; $e189: a6 90     
            CPX #$09           ; $e18b: e0 09     
            BEQ __e1e0         ; $e18d: f0 51     
            LDX $7c            ; $e18f: a6 7c     
            DEX                ; $e191: ca        
            BNE __e1e1         ; $e192: d0 4d     
            LDX #$02           ; $e194: a2 02     
__e196:     LDA $99,x          ; $e196: b5 99     
            BNE __e1e0         ; $e198: d0 46     
            DEX                ; $e19a: ca        
            BPL __e196         ; $e19b: 10 f9     
            LDY $92            ; $e19d: a4 92     
__e19f:     BNE __e1e0         ; $e19f: d0 3f     
            TXA                ; $e1a1: 8a        
            JSR __e23e         ; $e1a2: 20 3e e2  
            STA $92            ; $e1a5: 85 92     
            STA $03d3          ; $e1a7: 8d d3 03  
            STY $0376          ; $e1aa: 8c 76 03  
            STY $03b2          ; $e1ad: 8c b2 03  
            STY $03c8          ; $e1b0: 8c c8 03  
            LDA #$40           ; $e1b3: a9 40     
            STA $03bd          ; $e1b5: 8d bd 03  
            ASL                ; $e1b8: 0a        
            STA $03a7          ; $e1b9: 8d a7 03  
            INY                ; $e1bc: c8        
            STY $be            ; $e1bd: 84 be     
            LDA #$04           ; $e1bf: a9 04     
            STA $9d            ; $e1c1: 85 9d     
            LDX $90            ; $e1c3: a6 90     
            INX                ; $e1c5: e8        
__e1c6:     DEX                ; $e1c6: ca        
            CPX $0786          ; $e1c7: ec 86 07  
            BEQ __e1c6         ; $e1ca: f0 fa     
            CPX $0787          ; $e1cc: ec 87 07  
            BEQ __e1c6         ; $e1cf: f0 f5     
            STX $b3            ; $e1d1: 86 b3     
            LDA $90            ; $e1d3: a5 90     
            SEC                ; $e1d5: 38        
            SBC $b3            ; $e1d6: e5 b3     
            TAX                ; $e1d8: aa        
            LDA __e185,x       ; $e1d9: bd 85 e1  
            STA $a8            ; $e1dc: 85 a8     
            .hex e6            ; $e1de: e6        Suspected data
__e1df:     .hex 7c            ; $e1df: 7c        Suspected data
__e1e0:     RTS                ; $e1e0: 60        

;-------------------------------------------------------------------------------
__e1e1:     DEX                ; $e1e1: ca        
            BNE __e1ee         ; $e1e2: d0 0a     
__e1e4:     LDA $0376          ; $e1e4: ad 76 03  
            BNE __e215         ; $e1e7: d0 2c     
            DEC $df            ; $e1e9: c6 df     
            BEQ __e202         ; $e1eb: f0 15     
            RTS                ; $e1ed: 60        

;-------------------------------------------------------------------------------
__e1ee:     DEX                ; $e1ee: ca        
            BNE __e21a         ; $e1ef: d0 29     
            LDA $0376          ; $e1f1: ad 76 03  
            BNE __e215         ; $e1f4: d0 1f     
            LDA $a8            ; $e1f6: a5 a8     
            CMP #$17           ; $e1f8: c9 17     
            BNE __e1e4         ; $e1fa: d0 e8     
            LDA $9d            ; $e1fc: a5 9d     
            CMP #$78           ; $e1fe: c9 78     
            BNE __e1e4         ; $e200: d0 e2     
__e202:     LDA #$04           ; $e202: a9 04     
            STA $7c            ; $e204: 85 7c     
            LDA #$0c           ; $e206: a9 0c     
            STA $df            ; $e208: 85 df     
            LDA $92            ; $e20a: a5 92     
            CMP #$ff           ; $e20c: c9 ff     
            BNE __e214         ; $e20e: d0 04     
            LDA #$04           ; $e210: a9 04     
            STA $92            ; $e212: 85 92     
__e214:     RTS                ; $e214: 60        

;-------------------------------------------------------------------------------
__e215:     LDA #$00           ; $e215: a9 00     
            STA $7c            ; $e217: 85 7c     
            RTS                ; $e219: 60        

;-------------------------------------------------------------------------------
__e21a:     DEX                ; $e21a: ca        
            BNE __e235         ; $e21b: d0 18     
            DEC $df            ; $e21d: c6 df     
            BPL __e225         ; $e21f: 10 04     
            LDA #$03           ; $e221: a9 03     
            BNE __e23e         ; $e223: d0 19     
__e225:     BEQ __e214         ; $e225: f0 ed     
            LDA $92            ; $e227: a5 92     
            CMP #$04           ; $e229: c9 04     
            BNE __e234         ; $e22b: d0 07     
            LDA $a8            ; $e22d: a5 a8     
            SEC                ; $e22f: 38        
            SBC #$01           ; $e230: e9 01     
            STA $a8            ; $e232: 85 a8     
__e234:     RTS                ; $e234: 60        

;-------------------------------------------------------------------------------
__e235:     DEX                ; $e235: ca        
            BNE __e251         ; $e236: d0 19     
            DEC $df            ; $e238: c6 df     
            BNE __e243         ; $e23a: d0 07     
            LDA #$10           ; $e23c: a9 10     
__e23e:     STA $df            ; $e23e: 85 df     
            INC $7c            ; $e240: e6 7c     
            RTS                ; $e242: 60        

;-------------------------------------------------------------------------------
__e243:     LDA $92            ; $e243: a5 92     
            CMP #$04           ; $e245: c9 04     
            BNE __e250         ; $e247: d0 07     
            LDA #$05           ; $e249: a9 05     
            CLC                ; $e24b: 18        
            ADC $a8            ; $e24c: 65 a8     
            STA $a8            ; $e24e: 85 a8     
__e250:     RTS                ; $e250: 60        

;-------------------------------------------------------------------------------
__e251:     DEX                ; $e251: ca        
            BNE __e250         ; $e252: d0 fc     
            DEC $df            ; $e254: c6 df     
            BNE __e250         ; $e256: d0 f8     
            LDA $92            ; $e258: a5 92     
            CMP #$04           ; $e25a: c9 04     
            BNE __e265         ; $e25c: d0 07     
            LDA #$ff           ; $e25e: a9 ff     
            STA $92            ; $e260: 85 92     
            STA $03d3          ; $e262: 8d d3 03  
__e265:     LDA $0376          ; $e265: ad 76 03  
            BNE __e215         ; $e268: d0 ab     
            LDA #$80           ; $e26a: a9 80     
            STA $7c            ; $e26c: 85 7c     
            LDA #$02           ; $e26e: a9 02     
            STA $ff            ; $e270: 85 ff     
            RTS                ; $e272: 60        

;-------------------------------------------------------------------------------
__e273:     BRK                ; $e273: 00        
            CLC                ; $e274: 18        
            BMI __e2bf         ; $e275: 30 48     
__e277:     LDX #$03           ; $e277: a2 03     
            .hex 2c            ; $e279: 2c        Suspected data
__e27a:     LDX #$01           ; $e27a: a2 01     
__e27c:     LDA __e273,x       ; $e27c: bd 73 e2  
            TAY                ; $e27f: a8        
            LDA $0786,x        ; $e280: bd 86 07  
            BEQ __e296         ; $e283: f0 11     
            LDA $02a0,y        ; $e285: b9 a0 02  
            CMP #$ec           ; $e288: c9 ec     
            BCC __e296         ; $e28a: 90 0a     
            LDA #$00           ; $e28c: a9 00     
            STA $0786,x        ; $e28e: 9d 86 07  
            LDA #$ff           ; $e291: a9 ff     
            STA $06f5,x        ; $e293: 9d f5 06  
__e296:     DEX                ; $e296: ca        
            BPL __e27c         ; $e297: 10 e3     
            RTS                ; $e299: 60        

;-------------------------------------------------------------------------------
__e29a:     LDX #$08           ; $e29a: a2 08     
            JSR __e303         ; $e29c: 20 03 e3  
            LDY #$2c           ; $e29f: a0 2c     
            LDX #$01           ; $e2a1: a2 01     
__e2a3:     LDA $0786,x        ; $e2a3: bd 86 07  
            BEQ __e2be         ; $e2a6: f0 16     
            JSR __e321         ; $e2a8: 20 21 e3  
            TXA                ; $e2ab: 8a        
            CLC                ; $e2ac: 18        
            ADC #$06           ; $e2ad: 69 06     
            TAY                ; $e2af: a8        
__e2b0:     LDA $07b7,x        ; $e2b0: bd b7 07  
            CLC                ; $e2b3: 18        
            ADC $0788,y        ; $e2b4: 79 88 07  
            STA $0788,y        ; $e2b7: 99 88 07  
            DEY                ; $e2ba: 88        
            DEY                ; $e2bb: 88        
            BPL __e2b0         ; $e2bc: 10 f2     
__e2be:     .hex a0            ; $e2be: a0        Suspected data
__e2bf:     .hex 14 ca         ; $e2bf: 14 ca     Invalid Opcode - NOP $ca,x
            BPL __e2a3         ; $e2c1: 10 e0     
            LDY #$01           ; $e2c3: a0 01     
__e2c5:     LDA $006a,y        ; $e2c5: b9 6a 00  
            CMP #$01           ; $e2c8: c9 01     
            BEQ __e2d0         ; $e2ca: f0 04     
            CMP #$03           ; $e2cc: c9 03     
            BNE __e2f4         ; $e2ce: d0 24     
__e2d0:     LDX $5a,y          ; $e2d0: b6 5a     
            BEQ __e2f4         ; $e2d2: f0 20     
            CPX #$02           ; $e2d4: e0 02     
            BMI __e2f4         ; $e2d6: 30 1c     
            CPX #$09           ; $e2d8: e0 09     
            BEQ __e2f4         ; $e2da: f0 18     
            LDA $002d,y        ; $e2dc: b9 2d 00  
            BNE __e2e6         ; $e2df: d0 05     
            LDA $0343,y        ; $e2e1: b9 43 03  
            BNE __e2ec         ; $e2e4: d0 06     
__e2e6:     LDA $07ae,x        ; $e2e6: bd ae 07  
            JSR __e2fb         ; $e2e9: 20 fb e2  
__e2ec:     LDX $0783,y        ; $e2ec: be 83 07  
            BMI __e2f4         ; $e2ef: 30 03     
            JSR __e2f8         ; $e2f1: 20 f8 e2  
__e2f4:     DEY                ; $e2f4: 88        
            BPL __e2c5         ; $e2f5: 10 ce     
            RTS                ; $e2f7: 60        

;-------------------------------------------------------------------------------
__e2f8:     LDA $07b7,x        ; $e2f8: bd b7 07  
__e2fb:     CLC                ; $e2fb: 18        
            ADC $0064,y        ; $e2fc: 79 64 00  
            STA $0064,y        ; $e2ff: 99 64 00  
            RTS                ; $e302: 60        

;-------------------------------------------------------------------------------
__e303:     LDA $07c0,x        ; $e303: bd c0 07  
            CLC                ; $e306: 18        
            ADC $07a0,x        ; $e307: 7d a0 07  
            STA $07c0,x        ; $e30a: 9d c0 07  
            LDA #$00           ; $e30d: a9 00     
            ADC $0790,x        ; $e30f: 7d 90 07  
            LDY $07d0,x        ; $e312: bc d0 07  
            BEQ __e31a         ; $e315: f0 03     
            JSR __d2fb         ; $e317: 20 fb d2  
__e31a:     STA $07b0,x        ; $e31a: 9d b0 07  
            DEX                ; $e31d: ca        
            BPL __e303         ; $e31e: 10 e3     
            RTS                ; $e320: 60        

;-------------------------------------------------------------------------------
__e321:     LDA #$05           ; $e321: a9 05     
            STA $01            ; $e323: 85 01     
__e325:     LDA $07b7,x        ; $e325: bd b7 07  
            CLC                ; $e328: 18        
            ADC $02a3,y        ; $e329: 79 a3 02  
            STA $02a3,y        ; $e32c: 99 a3 02  
            DEY                ; $e32f: 88        
            DEY                ; $e330: 88        
            DEY                ; $e331: 88        
            DEY                ; $e332: 88        
            DEC $01            ; $e333: c6 01     
            BPL __e325         ; $e335: 10 ee     
            RTS                ; $e337: 60        

;-------------------------------------------------------------------------------
__e338:     .hex 14 2c         ; $e338: 14 2c     Invalid Opcode - NOP $2c,x
            .hex 44 5c         ; $e33a: 44 5c     Invalid Opcode - NOP $5c
__e33c:     LDX #$0a           ; $e33c: a2 0a     
            JSR __e303         ; $e33e: 20 03 e3  
__e341:     LDX #$03           ; $e341: a2 03     
__e343:     LDA $0786,x        ; $e343: bd 86 07  
            BEQ __e362         ; $e346: f0 1a     
            LDA __e338,x       ; $e348: bd 38 e3  
            TAY                ; $e34b: a8        
            JSR __e321         ; $e34c: 20 21 e3  
            LDA $07b7,x        ; $e34f: bd b7 07  
            PHA                ; $e352: 48        
            CLC                ; $e353: 18        
            ADC $0682,x        ; $e354: 7d 82 06  
            STA $0682,x        ; $e357: 9d 82 06  
            PLA                ; $e35a: 68        
            CLC                ; $e35b: 18        
            ADC $06a0,x        ; $e35c: 7d a0 06  
            STA $06a0,x        ; $e35f: 9d a0 06  
__e362:     DEX                ; $e362: ca        
            BPL __e343         ; $e363: 10 de     
            LDY #$01           ; $e365: a0 01     
            LDA $006a,y        ; $e367: b9 6a 00  
            CMP #$01           ; $e36a: c9 01     
            BEQ __e372         ; $e36c: f0 04     
            CMP #$03           ; $e36e: c9 03     
            BNE __e37e         ; $e370: d0 0c     
__e372:     LDA $0783,y        ; $e372: b9 83 07  
            SEC                ; $e375: 38        
            SBC #$1a           ; $e376: e9 1a     
            BMI __e37e         ; $e378: 30 04     
            TAX                ; $e37a: aa        
            JSR __e2f8         ; $e37b: 20 f8 e2  
__e37e:     DEY                ; $e37e: 88        
            .hex 10            ; $e37f: 10        Suspected data
__e380:     INC $60            ; $e380: e6 60     
__e382:     BRK                ; $e382: 00        
            BRK                ; $e383: 00        
            BRK                ; $e384: 00        
            BRK                ; $e385: 00        
            BRK                ; $e386: 00        
            BRK                ; $e387: 00        
            BRK                ; $e388: 00        
            BRK                ; $e389: 00        
            BRK                ; $e38a: 00        
            LDA ($00,x)        ; $e38b: a1 00     
            BRK                ; $e38d: 00        
            BRK                ; $e38e: 00        
            BRK                ; $e38f: 00        
            BCS __e392         ; $e390: b0 00     
__e392:     BMI __e394         ; $e392: 30 00     
__e394:     BRK                ; $e394: 00        
            LDA ($00),y        ; $e395: b1 00     
            PHP                ; $e397: 08        
            LDA ($00,x)        ; $e398: a1 00     
            BMI __e39c         ; $e39a: 30 00     
__e39c:     BCS __e341         ; $e39c: b0 a3     
            BEQ __e3a0         ; $e39e: f0 00     
__e3a0:     BRK                ; $e3a0: 00        
            CMP $00            ; $e3a1: c5 00     
            .hex b3 32         ; $e3a3: b3 32     Invalid Opcode - LAX ($32),y
            LDY #$d4           ; $e3a5: a0 d4     
            BRK                ; $e3a7: 00        
            .hex 23 08         ; $e3a8: 23 08     Invalid Opcode - RLA ($08,x)
            LDX $00,y          ; $e3aa: b6 00     
            .hex c3 31         ; $e3ac: c3 31     Invalid Opcode - DCP ($31,x)
            BRK                ; $e3ae: 00        
            PHP                ; $e3af: 08        
            PHP                ; $e3b0: 08        
            LDA ($23),y        ; $e3b1: b1 23     
            BRK                ; $e3b3: 00        
            INC $24            ; $e3b4: e6 24     
            LDA $00            ; $e3b6: a5 00     
            .hex 32            ; $e3b8: 32        Invalid Opcode - KIL 
            CMP $00,x          ; $e3b9: d5 00     
            CPY $b7            ; $e3bb: c4 b7     
            BMI __e3e2         ; $e3bd: 30 23     
            .hex 3c f3 d7      ; $e3bf: 3c f3 d7  Invalid Opcode - NOP __d7f3,x
            BRK                ; $e3c2: 00        
            STX $00            ; $e3c3: 86 00     
            .hex 2b 33         ; $e3c5: 2b 33     Invalid Opcode - ANC #$33
            .hex d7 34         ; $e3c7: d7 34     Invalid Opcode - DCP $34,x
            BRK                ; $e3c9: 00        
            LDX $08,y          ; $e3ca: b6 08     
            BRK                ; $e3cc: 00        
            PHP                ; $e3cd: 08        
            ROR $2a,x          ; $e3ce: 76 2a     
            .hex 23 00         ; $e3d0: 23 00     Invalid Opcode - RLA ($00,x)
            .hex b2            ; $e3d2: b2        Invalid Opcode - KIL 
            .hex 33 a6         ; $e3d3: 33 a6     Invalid Opcode - RLA ($a6),y
            .hex 34 e6         ; $e3d5: 34 e6     Invalid Opcode - NOP $e6,x
            .hex 33 75         ; $e3d7: 33 75     Invalid Opcode - RLA ($75),y
            BRK                ; $e3d9: 00        
            JSR $00a6          ; $e3da: 20 a6 00  
            DEC $d5            ; $e3dd: c6 d5     
            BRK                ; $e3df: 00        
            .hex 3a            ; $e3e0: 3a        Invalid Opcode - NOP 
            BRK                ; $e3e1: 00        
__e3e2:     CPX $f7            ; $e3e2: e4 f7     
            BRK                ; $e3e4: 00        
            DEC $00,x          ; $e3e5: d6 00     
            .hex 22            ; $e3e7: 22        Invalid Opcode - KIL 
            BRK                ; $e3e8: 00        
            LDX $d7            ; $e3e9: a6 d7     
            .hex d7 00         ; $e3eb: d7 00     Invalid Opcode - DCP $00,x
            DEC $00            ; $e3ed: c6 00     
            BRK                ; $e3ef: 00        
            .hex 33 f6         ; $e3f0: 33 f6     Invalid Opcode - RLA ($f6),y
            JSR $2231          ; $e3f2: 20 31 22  
            .hex 33 a4         ; $e3f5: 33 a4     Invalid Opcode - RLA ($a4),y
            LDX $24,y          ; $e3f7: b6 24     
            ADC $a4,x          ; $e3f9: 75 a4     
            BRK                ; $e3fb: 00        
            SEC                ; $e3fc: 38        
            .hex 34 a5         ; $e3fd: 34 a5     Invalid Opcode - NOP $a5,x
            .hex 34 38         ; $e3ff: 34 38     Invalid Opcode - NOP $38,x
            .hex f4 a4         ; $e401: f4 a4     Invalid Opcode - NOP $a4,x
            BRK                ; $e403: 00        
            BRK                ; $e404: 00        
            DEC $2b,x          ; $e405: d6 2b     
            CPY $00            ; $e407: c4 00     
            .hex 32            ; $e409: 32        Invalid Opcode - KIL 
            BIT $00            ; $e40a: 24 00     
            LDA $d3,x          ; $e40c: b5 d3     
            AND #$22           ; $e40e: 29 22     
            .hex 34 24         ; $e410: 34 24     Invalid Opcode - NOP $24,x
            .hex f2            ; $e412: f2        Invalid Opcode - KIL 
            LDX $00,y          ; $e413: b6 00     
            STY $08,x          ; $e415: 94 08     
            LDA $00            ; $e417: a5 00     
            BRK                ; $e419: 00        
            DEC $00,x          ; $e41a: d6 00     
            BRK                ; $e41c: 00        
            BRK                ; $e41d: 00        
            BRK                ; $e41e: 00        
            BIT $00            ; $e41f: 24 00     
            CMP $00            ; $e421: c5 00     
            BRK                ; $e423: 00        
            ROR $65,x          ; $e424: 76 65     
            .hex 23 34         ; $e426: 23 34     Invalid Opcode - RLA ($34,x)
            .hex 34 d6         ; $e428: 34 d6     Invalid Opcode - NOP $d6,x
            BRK                ; $e42a: 00        
            DEC $b5            ; $e42b: c6 b5     
            .hex 22            ; $e42d: 22        Invalid Opcode - KIL 
            .hex 32            ; $e42e: 32        Invalid Opcode - KIL 
            .hex 34 e7         ; $e42f: 34 e7     Invalid Opcode - NOP $e7,x
            BRK                ; $e431: 00        
            ROR $76            ; $e432: 66 76     
            LDX $00            ; $e434: a6 00     
            BIT $c7            ; $e436: 24 c7     
            SBC $00            ; $e438: e5 00     
            SBC $2b,x          ; $e43a: f5 2b     
            BRK                ; $e43c: 00        
            JSR __f6c7         ; $e43d: 20 c7 f6  
            BRK                ; $e440: 00        
            .hex 33 e5         ; $e441: 33 e5     Invalid Opcode - RLA ($e5),y
            BRK                ; $e443: 00        
            INC $34,x          ; $e444: f6 34     
            .hex 33 d6         ; $e446: 33 d6     Invalid Opcode - RLA ($d6),y
            JSR $3300          ; $e448: 20 00 33  
            LDX $00            ; $e44b: a6 00     
            .hex 67 d6         ; $e44d: 67 d6     Invalid Opcode - RRA $d6
            .hex 23 3b         ; $e44f: 23 3b     Invalid Opcode - RLA ($3b,x)
            BRK                ; $e451: 00        
            .hex 7d e6 00      ; $e452: 7d e6 00  Bad Addr Mode - ADC $00e6,x
            SBC $7623,x        ; $e455: fd 23 76  
            BIT $33            ; $e458: 24 33     
            .hex c7 23         ; $e45a: c7 23     Invalid Opcode - DCP $23
            .hex e7 9e         ; $e45c: e7 9e     Invalid Opcode - ISC $9e
            BRK                ; $e45e: 00        
            .hex 3b 2e d7      ; $e45f: 3b 2e d7  Invalid Opcode - RLA __d72e,y
__e462:     BRK                ; $e462: 00        
            RTI                ; $e463: 40        

;-------------------------------------------------------------------------------
            RTI                ; $e464: 40        

;-------------------------------------------------------------------------------
            BRK                ; $e465: 00        
            RTI                ; $e466: 40        

;-------------------------------------------------------------------------------
            ADC $2074          ; $e467: 6d 74 20  
            BRK                ; $e46a: 00        
            BPL __e497         ; $e46b: 10 2a     
            ORA ($41,x)        ; $e46d: 01 41     
            ASL                ; $e46f: 0a        
            PHA                ; $e470: 48        
            BRK                ; $e471: 00        
__e472:     BRK                ; $e472: 00        
            PHA                ; $e473: 48        
            BRK                ; $e474: 00        
            BRK                ; $e475: 00        
            ADC #$24           ; $e476: 69 24     
            BIT $00            ; $e478: 24 00     
            BRK                ; $e47a: 00        
            .hex 44 21         ; $e47b: 44 21     Invalid Opcode - NOP $21
            ADC ($04,x)        ; $e47d: 61 04     
            PHP                ; $e47f: 08        
            .hex 12            ; $e480: 12        Invalid Opcode - KIL 
            .hex 10            ; $e481: 10        Suspected data
__e482:     BRK                ; $e482: 00        
            RTI                ; $e483: 40        

;-------------------------------------------------------------------------------
            ORA #$40           ; $e484: 09 40     
            PLA                ; $e486: 68        
            .hex 04 48         ; $e487: 04 48     Invalid Opcode - NOP $48
            BRK                ; $e489: 00        
            .hex 02            ; $e48a: 02        Invalid Opcode - KIL 
            JMP ($0408)        ; $e48b: 6c 08 04  

;-------------------------------------------------------------------------------
            BPL __e4d8         ; $e48e: 10 48     
            BRK                ; $e490: 00        
            .hex 66            ; $e491: 66        Suspected data
__e492:     .hex ff f7 b7      ; $e492: ff f7 b7  Invalid Opcode - ISC $b7f7,x
            .hex ff 9e         ; $e495: ff 9e     Suspected data
__e497:     DEC $fb,x          ; $e497: d6 fb     
            .hex df ff af      ; $e499: df ff af  Invalid Opcode - DCP $afff,x
            DEC $fe,x          ; $e49c: d6 fe     
            .hex bb f5 e5      ; $e49e: bb f5 e5  Invalid Opcode - LAS __e5f5,y
            .hex ef            ; $e4a1: ef        Suspected data
__e4a2:     BRK                ; $e4a2: 00        
__e4a3:     .hex 80 00         ; $e4a3: 80 00     Invalid Opcode - NOP #$00
            LDY #$00           ; $e4a5: a0 00     
            CPY #$00           ; $e4a7: c0 00     
            CPX #$01           ; $e4a9: e0 01     
            BRK                ; $e4ab: 00        
            ORA ($40,x)        ; $e4ac: 01 40     
            ORA ($80,x)        ; $e4ae: 01 80     
            .hex 02            ; $e4b0: 02        Invalid Opcode - KIL 
            BRK                ; $e4b1: 00        
__e4b2:     INX                ; $e4b2: e8        
            .hex 02            ; $e4b3: 02        Invalid Opcode - KIL 
            BRK                ; $e4b4: 00        
            .hex 1c 00         ; $e4b5: 1c 00     Suspected data
__e4b7:     CLC                ; $e4b7: 18        
            PHA                ; $e4b8: 48        
            SEI                ; $e4b9: 78        
            TAY                ; $e4ba: a8        
__e4bb:     CLD                ; $e4bb: d8        
            INC __dcff,x       ; $e4bc: fe ff dc  
            INC __dcff,x       ; $e4bf: fe ff dc  
__e4c2:     JSR __e523         ; $e4c2: 20 23 e5  
            JSR __e719         ; $e4c5: 20 19 e7  
            STA $00            ; $e4c8: 85 00     
            LDY #$00           ; $e4ca: a0 00     
__e4cc:     LDX $00            ; $e4cc: a6 00     
            LDA __e382,x       ; $e4ce: bd 82 e3  
            STA $01            ; $e4d1: 85 01     
            AND #$e0           ; $e4d3: 29 e0     
            BEQ __e502         ; $e4d5: f0 2b     
            .hex c9            ; $e4d7: c9        Suspected data
__e4d8:     ADC ($b0,x)        ; $e4d8: 61 b0     
            .hex 27 48         ; $e4da: 27 48     Invalid Opcode - RLA $48
            LDA $01            ; $e4dc: a5 01     
            AND #$07           ; $e4de: 29 07     
            TAX                ; $e4e0: aa        
            PLA                ; $e4e1: 68        
            CMP #$60           ; $e4e2: c9 60     
            BNE __e4ec         ; $e4e4: d0 06     
            DEX                ; $e4e6: ca        
            DEX                ; $e4e7: ca        
            BPL __e4ec         ; $e4e8: 10 02     
            LDX #$06           ; $e4ea: a2 06     
__e4ec:     TXA                ; $e4ec: 8a        
            ASL                ; $e4ed: 0a        
            TAX                ; $e4ee: aa        
            LDA __e4a2,x       ; $e4ef: bd a2 e4  
            STA $0790,y        ; $e4f2: 99 90 07  
            LDA __e4a3,x       ; $e4f5: bd a3 e4  
            STA $07a0,y        ; $e4f8: 99 a0 07  
            LDA $01            ; $e4fb: a5 01     
            AND #$10           ; $e4fd: 29 10     
            STA $07d0,y        ; $e4ff: 99 d0 07  
__e502:     LDA $01            ; $e502: a5 01     
            LSR                ; $e504: 4a        
            LSR                ; $e505: 4a        
            LSR                ; $e506: 4a        
            LSR                ; $e507: 4a        
            ROR $0785          ; $e508: 6e 85 07  
            INC $00            ; $e50b: e6 00     
            INY                ; $e50d: c8        
            CPY #$07           ; $e50e: c0 07     
            BNE __e4cc         ; $e510: d0 ba     
            LDY #$05           ; $e512: a0 05     
            STY $0782          ; $e514: 8c 82 07  
__e517:     LDY $0782          ; $e517: ac 82 07  
            JSR __e640         ; $e51a: 20 40 e6  
            DEC $0782          ; $e51d: ce 82 07  
            BNE __e517         ; $e520: d0 f5     
            RTS                ; $e522: 60        

;-------------------------------------------------------------------------------
__e523:     LDA #$00           ; $e523: a9 00     
            LDX #$2d           ; $e525: a2 2d     
__e527:     STA $0790,x        ; $e527: 9d 90 07  
            DEX                ; $e52a: ca        
            BPL __e527         ; $e52b: 10 fa     
            LDX #$03           ; $e52d: a2 03     
__e52f:     STA $0786,x        ; $e52f: 9d 86 07  
            DEX                ; $e532: ca        
            BPL __e52f         ; $e533: 10 fa     
            STA $0785          ; $e535: 8d 85 07  
            RTS                ; $e538: 60        

;-------------------------------------------------------------------------------
__e539:     .hex cb 1b         ; $e539: cb 1b     Invalid Opcode - AXS #$1b
            .hex ff 4a 92      ; $e53b: ff 4a 92  Invalid Opcode - ISC $924a,x
            .hex 1b a4 ff      ; $e53e: 1b a4 ff  Invalid Opcode - SLO __ffa4,y
            .hex 0b 50         ; $e541: 0b 50     Invalid Opcode - ANC #$50
            STA $da,x          ; $e543: 95 da     
            SBC #$ff           ; $e545: e9 ff     
            .hex cb a1         ; $e547: cb a1     Invalid Opcode - AXS #$a1
            ADC $ff            ; $e549: 65 ff     
            .hex 9b            ; $e54b: 9b        Invalid Opcode - TAS 
            DEC $8bff,x        ; $e54c: de ff 8b  
            EOR $a0,x          ; $e54f: 55 a0     
            .hex 64 ff         ; $e551: 64 ff     Invalid Opcode - NOP $ff
            CMP $ff,x          ; $e553: d5 ff     
            .hex 52            ; $e555: 52        Invalid Opcode - KIL 
            STX $5a,y          ; $e556: 96 5a     
            INX                ; $e558: e8        
            .hex ff            ; $e559: ff        Suspected data
__e55a:     BRK                ; $e55a: 00        
            .hex 03 08         ; $e55b: 03 08     Invalid Opcode - SLO ($08,x)
            ASL $1512          ; $e55d: 0e 12 15  
            .hex 1a            ; $e560: 1a        Invalid Opcode - NOP 
            .hex 1c            ; $e561: 1c        Suspected data
__e562:     JSR __e523         ; $e562: 20 23 e5  
            LDA #$19           ; $e565: a9 19     
            STA $24            ; $e567: 85 24     
            LDA $59            ; $e569: a5 59     
            AND #$07           ; $e56b: 29 07     
            TAX                ; $e56d: aa        
            LDA __e55a,x       ; $e56e: bd 5a e5  
            STA $25            ; $e571: 85 25     
__e573:     LDX $25            ; $e573: a6 25     
            LDA __e539,x       ; $e575: bd 39 e5  
            PHA                ; $e578: 48        
            AND #$3f           ; $e579: 29 3f     
            CMP $24            ; $e57b: c5 24     
            BEQ __e583         ; $e57d: f0 04     
            BCC __e583         ; $e57f: 90 02     
            PLA                ; $e581: 68        
            RTS                ; $e582: 60        

;-------------------------------------------------------------------------------
__e583:     INC $25            ; $e583: e6 25     
            LDY #$03           ; $e585: a0 03     
__e587:     LDA $0786,y        ; $e587: b9 86 07  
            BEQ __e58f         ; $e58a: f0 03     
            DEY                ; $e58c: 88        
            BPL __e587         ; $e58d: 10 f8     
__e58f:     PLA                ; $e58f: 68        
            STA $0786,y        ; $e590: 99 86 07  
            PHA                ; $e593: 48        
            LDX #$00           ; $e594: a2 00     
            AND #$40           ; $e596: 29 40     
            BNE __e59b         ; $e598: d0 01     
            DEX                ; $e59a: ca        
__e59b:     TXA                ; $e59b: 8a        
            STA $07d7,y        ; $e59c: 99 d7 07  
            PLA                ; $e59f: 68        
            PHA                ; $e5a0: 48        
            LDX #$c0           ; $e5a1: a2 c0     
            AND #$80           ; $e5a3: 29 80     
            BNE __e5a9         ; $e5a5: d0 02     
            LDX #$80           ; $e5a7: a2 80     
__e5a9:     TXA                ; $e5a9: 8a        
            STA $07a7,y        ; $e5aa: 99 a7 07  
            LDA #$00           ; $e5ad: a9 00     
            STA $0797,y        ; $e5af: 99 97 07  
            LDX #$06           ; $e5b2: a2 06     
            LDA $59            ; $e5b4: a5 59     
            AND #$04           ; $e5b6: 29 04     
            BEQ __e5bb         ; $e5b8: f0 01     
            TAX                ; $e5ba: aa        
__e5bb:     STX $03            ; $e5bb: 86 03     
            PLA                ; $e5bd: 68        
            AND #$3f           ; $e5be: 29 3f     
            PHA                ; $e5c0: 48        
            CMP #$1e           ; $e5c1: c9 1e     
            BMI __e5c8         ; $e5c3: 30 03     
            LDX #$00           ; $e5c5: a2 00     
            .hex 2c            ; $e5c7: 2c        Suspected data
__e5c8:     LDX #$01           ; $e5c8: a2 01     
            TXA                ; $e5ca: 8a        
            STA $06fa,y        ; $e5cb: 99 fa 06  
            PLA                ; $e5ce: 68        
            TAX                ; $e5cf: aa        
            LDA #$de           ; $e5d0: a9 de     
__e5d2:     SEC                ; $e5d2: 38        
            SBC #$08           ; $e5d3: e9 08     
            DEX                ; $e5d5: ca        
            BNE __e5d2         ; $e5d6: d0 fa     
            STA $08            ; $e5d8: 85 08     
            STA $06be,y        ; $e5da: 99 be 06  
            CLC                ; $e5dd: 18        
            ADC #$05           ; $e5de: 69 05     
            STA $06dc,y        ; $e5e0: 99 dc 06  
            LDA #$e8           ; $e5e3: a9 e8     
            STA $0682,y        ; $e5e5: 99 82 06  
            LDA #$18           ; $e5e8: a9 18     
            LDX $03            ; $e5ea: a6 03     
            CPX #$04           ; $e5ec: e0 04     
            BNE __e5f2         ; $e5ee: d0 02     
            LDA #$08           ; $e5f0: a9 08     
__e5f2:     STA $06a0,y        ; $e5f2: 99 a0 06  
            LDA $27            ; $e5f5: a5 27     
            BEQ __e5ff         ; $e5f7: f0 06     
            LDA $08            ; $e5f9: a5 08     
            CLC                ; $e5fb: 18        
            ADC #$10           ; $e5fc: 69 10     
            .hex 2c            ; $e5fe: 2c        Suspected data
__e5ff:     LDA $08            ; $e5ff: a5 08     
            SEC                ; $e601: 38        
            SBC $13            ; $e602: e5 13     
            STA $05            ; $e604: 85 05     
            DEC $05            ; $e606: c6 05     
            LDA #$dc           ; $e608: a9 dc     
            STA $07            ; $e60a: 85 07     
            LDA #$e8           ; $e60c: a9 e8     
            STA $01            ; $e60e: 85 01     
            LDA __e273,y       ; $e610: b9 73 e2  
            TAY                ; $e613: a8        
__e614:     LDA #$00           ; $e614: a9 00     
            STA $02a2,y        ; $e616: 99 a2 02  
            LDA $05            ; $e619: a5 05     
            STA $02a0,y        ; $e61b: 99 a0 02  
            JSR __e881         ; $e61e: 20 81 e8  
            LDA $07            ; $e621: a5 07     
            STA $02a1,y        ; $e623: 99 a1 02  
            LDA #$ff           ; $e626: a9 ff     
            STA $07            ; $e628: 85 07     
            DEC $03            ; $e62a: c6 03     
            BEQ __e635         ; $e62c: f0 07     
            INY                ; $e62e: c8        
            INY                ; $e62f: c8        
            INY                ; $e630: c8        
            INY                ; $e631: c8        
            JMP __e614         ; $e632: 4c 14 e6  

;-------------------------------------------------------------------------------
__e635:     LDA #$fe           ; $e635: a9 fe     
            STA $02a1,y        ; $e637: 99 a1 02  
            JMP __e573         ; $e63a: 4c 73 e5  

;-------------------------------------------------------------------------------
__e63d:     LDY $90            ; $e63d: a4 90     
            INY                ; $e63f: c8        
__e640:     CPY #$09           ; $e640: c0 09     
            BPL __e64d         ; $e642: 10 09     
            CPY #$01           ; $e644: c0 01     
            BEQ __e64d         ; $e646: f0 05     
            JSR __e64e         ; $e648: 20 4e e6  
            BCS __e662         ; $e64b: b0 15     
__e64d:     RTS                ; $e64d: 60        

;-------------------------------------------------------------------------------
__e64e:     JSR __e719         ; $e64e: 20 19 e7  
            STA $0c            ; $e651: 85 0c     
            TYA                ; $e653: 98        
            CLC                ; $e654: 18        
            ADC $0c            ; $e655: 65 0c     
            TAX                ; $e657: aa        
            LDA __e380,x       ; $e658: bd 80 e3  
            STA $0c            ; $e65b: 85 0c     
            AND #$e0           ; $e65d: 29 e0     
            CMP #$60           ; $e65f: c9 60     
            RTS                ; $e661: 60        

;-------------------------------------------------------------------------------
__e662:     STA $0e            ; $e662: 85 0e     
            STY $00            ; $e664: 84 00     
            LDX #$05           ; $e666: a2 05     
__e668:     LDA __e4b2,x       ; $e668: bd b2 e4  
            STA $01,x          ; $e66b: 95 01     
            DEX                ; $e66d: ca        
            BPL __e668         ; $e66e: 10 f8     
            LDA $0c            ; $e670: a5 0c     
            AND #$10           ; $e672: 29 10     
            BNE __e678         ; $e674: d0 02     
            INC $05            ; $e676: e6 05     
__e678:     LDA $0c            ; $e678: a5 0c     
            AND #$07           ; $e67a: 29 07     
            ASL                ; $e67c: 0a        
            TAX                ; $e67d: aa        
            LDA __e4a2,x       ; $e67e: bd a2 e4  
            STA $06            ; $e681: 85 06     
            LDA __e4a3,x       ; $e683: bd a3 e4  
            STA $07            ; $e686: 85 07     
            LDA $19            ; $e688: a5 19     
            AND #$1f           ; $e68a: 29 1f     
            CLC                ; $e68c: 18        
            ADC #$80           ; $e68d: 69 80     
            LDX $0e            ; $e68f: a6 0e     
            CPX #$e0           ; $e691: e0 e0     
            BEQ __e69b         ; $e693: f0 06     
            CPX #$c0           ; $e695: e0 c0     
            BNE __e6a5         ; $e697: d0 0c     
            LDA #$f0           ; $e699: a9 f0     
__e69b:     CLC                ; $e69b: 18        
            ADC $03            ; $e69c: 65 03     
            STA $03            ; $e69e: 85 03     
            CLC                ; $e6a0: 18        
            ADC #$1b           ; $e6a1: 69 1b     
            STA $04            ; $e6a3: 85 04     
__e6a5:     LDX #$00           ; $e6a5: a2 00     
            LDA $0786          ; $e6a7: ad 86 07  
            BEQ __e6ad         ; $e6aa: f0 01     
            INX                ; $e6ac: e8        
__e6ad:     LDA $05            ; $e6ad: a5 05     
            STA $07d7,x        ; $e6af: 9d d7 07  
            LDA $06            ; $e6b2: a5 06     
            STA $0797,x        ; $e6b4: 9d 97 07  
            LDA $07            ; $e6b7: a5 07     
            STA $07a7,x        ; $e6b9: 9d a7 07  
            LDY #$00           ; $e6bc: a0 00     
__e6be:     LDA $0000,y        ; $e6be: b9 00 00  
            STA $0786,x        ; $e6c1: 9d 86 07  
            INX                ; $e6c4: e8        
            INX                ; $e6c5: e8        
            INY                ; $e6c6: c8        
            CPY #$05           ; $e6c7: c0 05     
            BNE __e6be         ; $e6c9: d0 f3     
            LDY #$00           ; $e6cb: a0 00     
            CPX #$0a           ; $e6cd: e0 0a     
            BEQ __e6d3         ; $e6cf: f0 02     
            LDY #$18           ; $e6d1: a0 18     
__e6d3:     LDX #$06           ; $e6d3: a2 06     
            STX $0a            ; $e6d5: 86 0a     
__e6d7:     LDA #$22           ; $e6d7: a9 22     
            STA $02a2,y        ; $e6d9: 99 a2 02  
            LDX $0a            ; $e6dc: a6 0a     
            LDA __e4bb,x       ; $e6de: bd bb e4  
            CPX #$03           ; $e6e1: e0 03     
            BEQ __e6e9         ; $e6e3: f0 04     
            CPX #$04           ; $e6e5: e0 04     
            BNE __e6f1         ; $e6e7: d0 08     
__e6e9:     LDX $0e            ; $e6e9: a6 0e     
            CPX #$e0           ; $e6eb: e0 e0     
            BEQ __e6f1         ; $e6ed: f0 02     
            LDA #$ff           ; $e6ef: a9 ff     
__e6f1:     STA $02a1,y        ; $e6f1: 99 a1 02  
            JSR __e881         ; $e6f4: 20 81 e8  
            LDA $90            ; $e6f7: a5 90     
            SEC                ; $e6f9: 38        
            SBC $00            ; $e6fa: e5 00     
            TAX                ; $e6fc: aa        
            INX                ; $e6fd: e8        
            LDA __e4b7,x       ; $e6fe: bd b7 e4  
            STA $02a0,y        ; $e701: 99 a0 02  
            INY                ; $e704: c8        
            INY                ; $e705: c8        
            INY                ; $e706: c8        
            INY                ; $e707: c8        
            DEC $0a            ; $e708: c6 0a     
            BEQ __e726         ; $e70a: f0 1a     
            LDA $0a            ; $e70c: a5 0a     
            CMP #$03           ; $e70e: c9 03     
            BNE __e6d7         ; $e710: d0 c5     
            LDA $03            ; $e712: a5 03     
            STA $01            ; $e714: 85 01     
            JMP __e6d7         ; $e716: 4c d7 e6  

;-------------------------------------------------------------------------------
__e719:     LDA $59            ; $e719: a5 59     
            AND #$1f           ; $e71b: 29 1f     
            TAX                ; $e71d: aa        
            LDA #$f9           ; $e71e: a9 f9     
__e720:     CLC                ; $e720: 18        
            ADC #$07           ; $e721: 69 07     
            DEX                ; $e723: ca        
            BPL __e720         ; $e724: 10 fa     
__e726:     RTS                ; $e726: 60        

;-------------------------------------------------------------------------------
__e727:     .hex d3 8c         ; $e727: d3 8c     Invalid Opcode - DCP ($8c),y
            .hex cd 8f         ; $e729: cd 8f     Suspected data
__e72b:     LDA $59            ; $e72b: a5 59     
            TAX                ; $e72d: aa        
            AND #$0f           ; $e72e: 29 0f     
            TAY                ; $e730: a8        
            LDA __e492,y       ; $e731: b9 92 e4  
            STA $00            ; $e734: 85 00     
            LDA __e482,y       ; $e736: b9 82 e4  
            STA $01            ; $e739: 85 01     
            LDA __e472,y       ; $e73b: b9 72 e4  
            STA $02            ; $e73e: 85 02     
            LDA __e462,y       ; $e740: b9 62 e4  
            STA $03            ; $e743: 85 03     
            LDY #$07           ; $e745: a0 07     
__e747:     LDA #$00           ; $e747: a9 00     
            LDX #$03           ; $e749: a2 03     
__e74b:     LSR $00,x          ; $e74b: 56 00     
            ROL                ; $e74d: 2a        
            DEX                ; $e74e: ca        
            BPL __e74b         ; $e74f: 10 fa     
            PHA                ; $e751: 48        
            INY                ; $e752: c8        
            JSR __e64e         ; $e753: 20 4e e6  
            DEY                ; $e756: 88        
            CMP #$a0           ; $e757: c9 a0     
            PLA                ; $e759: 68        
            BCC __e75e         ; $e75a: 90 02     
            LDA #$00           ; $e75c: a9 00     
__e75e:     STA $0004,y        ; $e75e: 99 04 00  
            LDA $0c            ; $e761: a5 0c     
            TAX                ; $e763: aa        
            AND #$e0           ; $e764: 29 e0     
            CMP #$a0           ; $e766: c9 a0     
            BCS __e77c         ; $e768: b0 12     
            AND #$70           ; $e76a: 29 70     
            BEQ __e779         ; $e76c: f0 0b     
            TXA                ; $e76e: 8a        
            LSR                ; $e76f: 4a        
            LSR                ; $e770: 4a        
            LSR                ; $e771: 4a        
            AND #$03           ; $e772: 29 03     
            TAX                ; $e774: aa        
            LDA __e727,x       ; $e775: bd 27 e7  
            .hex 2c            ; $e778: 2c        Suspected data
__e779:     LDA #$00           ; $e779: a9 00     
            .hex 2c            ; $e77b: 2c        Suspected data
__e77c:     LDA #$01           ; $e77c: a9 01     
            STA $0630,y        ; $e77e: 99 30 06  
            DEY                ; $e781: 88        
            BNE __e747         ; $e782: d0 c3     
            LDA #$01           ; $e784: a9 01     
            STA $04            ; $e786: 85 04     
            LSR                ; $e788: 4a        
            STA $0630,y        ; $e789: 99 30 06  
            RTS                ; $e78c: 60        

;-------------------------------------------------------------------------------
__e78d:     AND ($4e,x)        ; $e78d: 21 4e     
            .hex 20            ; $e78f: 20        Suspected data
__e790:     EOR $4242          ; $e790: 4d 42 42  
            .hex 42            ; $e793: 42        Invalid Opcode - KIL 
            .hex 42            ; $e794: 42        Invalid Opcode - KIL 
            .hex 42            ; $e795: 42        Invalid Opcode - KIL 
            PHA                ; $e796: 48        
            LSR $9d9d          ; $e797: 4e 9d 9d  
            STA $9d9d,x        ; $e79a: 9d 9d 9d  
__e79d:     LDA #$08           ; $e79d: a9 08     
            STA $0f            ; $e79f: 85 0f     
__e7a1:     LDY $0f            ; $e7a1: a4 0f     
            CPY #$01           ; $e7a3: c0 01     
            BEQ __e7b2         ; $e7a5: f0 0b     
            JSR __e64e         ; $e7a7: 20 4e e6  
            CMP #$81           ; $e7aa: c9 81     
            BCC __e7b2         ; $e7ac: 90 04     
            LDA #$01           ; $e7ae: a9 01     
            BNE __e7b8         ; $e7b0: d0 06     
__e7b2:     LDA #$a4           ; $e7b2: a9 a4     
            STA $04            ; $e7b4: 85 04     
            LDA #$00           ; $e7b6: a9 00     
__e7b8:     STA $0d            ; $e7b8: 85 0d     
            LDX $0f            ; $e7ba: a6 0f     
            LDA __d78b,x       ; $e7bc: bd 8b d7  
            STA $01            ; $e7bf: 85 01     
            LDA __d794,x       ; $e7c1: bd 94 d7  
            STA $00            ; $e7c4: 85 00     
            LDY #$00           ; $e7c6: a0 00     
            STY $066c          ; $e7c8: 8c 6c 06  
__e7cb:     LDA #$86           ; $e7cb: a9 86     
            STA $0602,y        ; $e7cd: 99 02 06  
            LDA $00            ; $e7d0: a5 00     
            STA $0601,y        ; $e7d2: 99 01 06  
            LDA $01            ; $e7d5: a5 01     
            STA $0600,y        ; $e7d7: 99 00 06  
            INC $00            ; $e7da: e6 00     
            LDX $0d            ; $e7dc: a6 0d     
            BEQ __e7e7         ; $e7de: f0 07     
            LDA __e790,x       ; $e7e0: bd 90 e7  
            STA $04            ; $e7e3: 85 04     
            INC $0d            ; $e7e5: e6 0d     
__e7e7:     LDX #$06           ; $e7e7: a2 06     
            INY                ; $e7e9: c8        
            INY                ; $e7ea: c8        
            INY                ; $e7eb: c8        
            CPY #$30           ; $e7ec: c0 30     
            BNE __e7f7         ; $e7ee: d0 07     
            LDA $00            ; $e7f0: a5 00     
            CLC                ; $e7f2: 18        
            ADC #$14           ; $e7f3: 69 14     
            STA $00            ; $e7f5: 85 00     
__e7f7:     LDA $04            ; $e7f7: a5 04     
            STA $0600,y        ; $e7f9: 99 00 06  
            INC $04            ; $e7fc: e6 04     
            INY                ; $e7fe: c8        
            CPY #$6c           ; $e7ff: c0 6c     
            BEQ __e80d         ; $e801: f0 0a     
            DEX                ; $e803: ca        
            BNE __e7f7         ; $e804: d0 f1     
            LDA #$eb           ; $e806: a9 eb     
            STA $05ff,y        ; $e808: 99 ff 05  
            BNE __e7cb         ; $e80b: d0 be     
__e80d:     LDA $0f            ; $e80d: a5 0f     
            ASL                ; $e80f: 0a        
            CLC                ; $e810: 18        
            ADC #$ea           ; $e811: 69 ea     
            LDY #$03           ; $e813: a0 03     
__e815:     CPY #$01           ; $e815: c0 01     
            BNE __e81c         ; $e817: d0 03     
            CLC                ; $e819: 18        
            ADC #$01           ; $e81a: 69 01     
__e81c:     LDX __e78d,y       ; $e81c: be 8d e7  
            STA $0600,x        ; $e81f: 9d 00 06  
            DEY                ; $e822: 88        
            BPL __e815         ; $e823: 10 f0     
            LDA $0f            ; $e825: a5 0f     
            CMP #$06           ; $e827: c9 06     
            BPL __e875         ; $e829: 10 4a     
            LDY #$08           ; $e82b: a0 08     
            CMP #$03           ; $e82d: c9 03     
            BPL __e833         ; $e82f: 10 02     
            LDY #$10           ; $e831: a0 10     
__e833:     STY $0a            ; $e833: 84 0a     
            LDX #$05           ; $e835: a2 05     
__e837:     LDY $0a            ; $e837: a4 0a     
            LDA #$38           ; $e839: a9 38     
            STA $06            ; $e83b: 85 06     
            STA $07            ; $e83d: 85 07     
            STA $08            ; $e83f: 85 08     
            STA $09            ; $e841: 85 09     
__e843:     ROR $06            ; $e843: 66 06     
            ROR $07            ; $e845: 66 07     
            ROR $0639,x        ; $e847: 7e 39 06  
            ROR $0642,x        ; $e84a: 7e 42 06  
            ROR $064b,x        ; $e84d: 7e 4b 06  
            ROR $0654,x        ; $e850: 7e 54 06  
            ROR $065d,x        ; $e853: 7e 5d 06  
            ROR $0666,x        ; $e856: 7e 66 06  
            ROL $08            ; $e859: 26 08     
            ROL $09            ; $e85b: 26 09     
            ROL $0630,x        ; $e85d: 3e 30 06  
            ROL $0627,x        ; $e860: 3e 27 06  
            ROL $061e,x        ; $e863: 3e 1e 06  
            ROL $0615,x        ; $e866: 3e 15 06  
            ROL $060c,x        ; $e869: 3e 0c 06  
            ROL $0603,x        ; $e86c: 3e 03 06  
            DEY                ; $e86f: 88        
            BNE __e843         ; $e870: d0 d1     
            DEX                ; $e872: ca        
            BPL __e837         ; $e873: 10 c2     
__e875:     LDX #$09           ; $e875: a2 09     
            JSR __c150         ; $e877: 20 50 c1  
            DEC $0f            ; $e87a: c6 0f     
            BEQ __e88b         ; $e87c: f0 0d     
            JMP __e7a1         ; $e87e: 4c a1 e7  

;-------------------------------------------------------------------------------
__e881:     LDA $01            ; $e881: a5 01     
            STA $02a3,y        ; $e883: 99 a3 02  
            CLC                ; $e886: 18        
            ADC #$08           ; $e887: 69 08     
            STA $01            ; $e889: 85 01     
__e88b:     RTS                ; $e88b: 60        

;-------------------------------------------------------------------------------
            .hex ff            ; $e88c: ff        Suspected data
__e88d:     BRK                ; $e88d: 00        
            .hex 05            ; $e88e: 05        Suspected data
__e88f:     LDX #$01           ; $e88f: a2 01     
__e891:     LDA $22,x          ; $e891: b5 22     
            BNE __e8ab         ; $e893: d0 16     
            LDA $20,x          ; $e895: b5 20     
            BMI __e8ab         ; $e897: 30 12     
            LDY __e88d,x       ; $e899: bc 8d e8  
            LDA $0361,y        ; $e89c: b9 61 03  
            BEQ __e8ab         ; $e89f: f0 0a     
            LDA $56            ; $e8a1: a5 56     
            CMP #$04           ; $e8a3: c9 04     
            BNE __e8ab         ; $e8a5: d0 04     
            STA $22,x          ; $e8a7: 95 22     
            INC $20,x          ; $e8a9: f6 20     
__e8ab:     DEX                ; $e8ab: ca        
            BPL __e891         ; $e8ac: 10 e3     
__e8ae:     RTS                ; $e8ae: 60        

;-------------------------------------------------------------------------------
            AND ($67,x)        ; $e8af: 21 67     
            .hex 07 38         ; $e8b1: 07 38     Invalid Opcode - SLO $38
            SEC                ; $e8b3: 38        
            BRK                ; $e8b4: 00        
            BRK                ; $e8b5: 00        
            .hex 5c 38 00      ; $e8b6: 5c 38 00  Bad Addr Mode - NOP $0038,x
            AND ($75,x)        ; $e8b9: 21 75     
            .hex 07 38         ; $e8bb: 07 38     Invalid Opcode - SLO $38
            SEC                ; $e8bd: 38        
            BRK                ; $e8be: 00        
            BRK                ; $e8bf: 00        
            .hex 5c 38 00      ; $e8c0: 5c 38 00  Bad Addr Mode - NOP $0038,x
__e8c3:     BRK                ; $e8c3: 00        
            BIT $27            ; $e8c4: 24 27     
            .hex 24            ; $e8c6: 24        Suspected data
__e8c7:     .hex 27 60         ; $e8c7: 27 60     Invalid Opcode - RLA $60
            .hex 6e 81         ; $e8c9: 6e 81     Suspected data
__e8cb:     .hex 97            ; $e8cb: 97        Suspected data
__e8cc:     .hex 52            ; $e8cc: 52        Invalid Opcode - KIL 
            .hex ac e0         ; $e8cd: ac e0     Suspected data
__e8cf:     ASL                ; $e8cf: 0a        
            .hex 13 08         ; $e8d0: 13 08     Invalid Opcode - SLO ($08),y
            ORA $1b,x          ; $e8d2: 15 1b     
__e8d4:     ORA ($00,x)        ; $e8d4: 01 00     
__e8d6:     PLP                ; $e8d6: 28        
            BVC __e8dd         ; $e8d7: 50 04     
__e8d9:     PHP                ; $e8d9: 08        
            BRK                ; $e8da: 00        
            BRK                ; $e8db: 00        
            BRK                ; $e8dc: 00        
__e8dd:     BRK                ; $e8dd: 00        
__e8de:     .hex 03 05         ; $e8de: 03 05     Invalid Opcode - SLO ($05,x)
            ASL $07            ; $e8e0: 06 07     
            PHP                ; $e8e2: 08        
            ASL                ; $e8e3: 0a        
            .hex 14 1e         ; $e8e4: 14 1e     Invalid Opcode - NOP $1e,x
            PLP                ; $e8e6: 28        
            .hex 32            ; $e8e7: 32        Invalid Opcode - KIL 
__e8e8:     ASL $3c32,x        ; $e8e8: 1e 32 3c  
            LSR $50            ; $e8eb: 46 50     
            ORA ($02,x)        ; $e8ed: 01 02     
            .hex 03 04         ; $e8ef: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 05            ; $e8f1: 05        Suspected data
__e8f2:     LDA $34            ; $e8f2: a5 34     
            BNE __e903         ; $e8f4: d0 0d     
            LDY $03a3          ; $e8f6: ac a3 03  
            BEQ __e900         ; $e8f9: f0 05     
            LDA $50            ; $e8fb: a5 50     
            LSR                ; $e8fd: 4a        
            BCC __e91a         ; $e8fe: 90 1a     
__e900:     JMP __e9ce         ; $e900: 4c ce e9  

;-------------------------------------------------------------------------------
__e903:     LDY $03a3          ; $e903: ac a3 03  
            BEQ __e90c         ; $e906: f0 04     
            CMP #$31           ; $e908: c9 31     
            BEQ __e90f         ; $e90a: f0 03     
__e90c:     JMP __ea35         ; $e90c: 4c 35 ea  

;-------------------------------------------------------------------------------
__e90f:     LDX #$09           ; $e90f: a2 09     
__e911:     LDA $0360,x        ; $e911: bd 60 03  
            STA $038f,x        ; $e914: 9d 8f 03  
            DEX                ; $e917: ca        
            BPL __e911         ; $e918: 10 f7     
__e91a:     LDX #$15           ; $e91a: a2 15     
__e91c:     LDA __e8ae,x       ; $e91c: bd ae e8  
            STA $0300,x        ; $e91f: 9d 00 03  
            DEX                ; $e922: ca        
            BNE __e91c         ; $e923: d0 f7     
__e925:     LDY $03a3          ; $e925: ac a3 03  
__e928:     BEQ __e947         ; $e928: f0 1d     
            LDA $0302,x        ; $e92a: bd 02 03  
            CLC                ; $e92d: 18        
            ADC #$40           ; $e92e: 69 40     
            STA $0302,x        ; $e930: 9d 02 03  
            LDA $0301,x        ; $e933: bd 01 03  
            ADC #$00           ; $e936: 69 00     
            STA $0301,x        ; $e938: 9d 01 03  
            DEY                ; $e93b: 88        
            BNE __e928         ; $e93c: d0 ea     
            TXA                ; $e93e: 8a        
            CLC                ; $e93f: 18        
            ADC #$0a           ; $e940: 69 0a     
            TAX                ; $e942: aa        
            CPX #$0b           ; $e943: e0 0b     
            BCC __e925         ; $e945: 90 de     
__e947:     LDY $03a3          ; $e947: ac a3 03  
            LDX #$00           ; $e94a: a2 00     
__e94c:     TYA                ; $e94c: 98        
            PHA                ; $e94d: 48        
            LDA $0399,y        ; $e94e: b9 99 03  
            JSR __ea4a         ; $e951: 20 4a ea  
            STA $030a,x        ; $e954: 9d 0a 03  
            TYA                ; $e957: 98        
            STA $0309,x        ; $e958: 9d 09 03  
            JSR __ea5c         ; $e95b: 20 5c ea  
            PLA                ; $e95e: 68        
            TAY                ; $e95f: a8        
            LDA $0399,y        ; $e960: b9 99 03  
            CMP $038f,y        ; $e963: d9 8f 03  
            BEQ __e974         ; $e966: f0 0c     
            CMP #$63           ; $e968: c9 63     
            BCS __e974         ; $e96a: b0 08     
            LDA $0399,y        ; $e96c: b9 99 03  
            ADC #$01           ; $e96f: 69 01     
            STA $0399,y        ; $e971: 99 99 03  
__e974:     INY                ; $e974: c8        
            INY                ; $e975: c8        
            INY                ; $e976: c8        
            INY                ; $e977: c8        
            INY                ; $e978: c8        
            TXA                ; $e979: 8a        
            CLC                ; $e97a: 18        
            ADC #$0a           ; $e97b: 69 0a     
            TAX                ; $e97d: aa        
            CPX #$0b           ; $e97e: e0 0b     
            BCC __e94c         ; $e980: 90 ca     
            LDX $58            ; $e982: a6 58     
            BNE __e989         ; $e984: d0 03     
            STX $030b          ; $e986: 8e 0b 03  
__e989:     LDY $03a3          ; $e989: ac a3 03  
            DEY                ; $e98c: 88        
            BNE __e999         ; $e98d: d0 0a     
            LDA $20            ; $e98f: a5 20     
            CMP #$80           ; $e991: c9 80     
            BNE __e999         ; $e993: d0 04     
            STY $0301          ; $e995: 8c 01 03  
            RTS                ; $e998: 60        

;-------------------------------------------------------------------------------
__e999:     TXA                ; $e999: 8a        
            STX $06            ; $e99a: 86 06     
            PHA                ; $e99c: 48        
            LDX $03a3          ; $e99d: ae a3 03  
            LDA __e8cb,x       ; $e9a0: bd cb e8  
            CPX #$01           ; $e9a3: e0 01     
            BNE __e9aa         ; $e9a5: d0 03     
            LDA $05fe          ; $e9a7: ad fe 05  
__e9aa:     STA $02            ; $e9aa: 85 02     
            LDA __e8c7,x       ; $e9ac: bd c7 e8  
            STA $01            ; $e9af: 85 01     
            STA $0e            ; $e9b1: 85 0e     
            LDA __e8cf,x       ; $e9b3: bd cf e8  
            CLC                ; $e9b6: 18        
            ADC $06            ; $e9b7: 65 06     
            TAY                ; $e9b9: a8        
            LDA __e8c3,x       ; $e9ba: bd c3 e8  
            LDX $06            ; $e9bd: a6 06     
            BEQ __e9c3         ; $e9bf: f0 02     
            ADC #$70           ; $e9c1: 69 70     
__e9c3:     STA $00            ; $e9c3: 85 00     
__e9c5:     JSR __eafc         ; $e9c5: 20 fc ea  
            PLA                ; $e9c8: 68        
            TAX                ; $e9c9: aa        
            DEX                ; $e9ca: ca        
            BPL __e999         ; $e9cb: 10 cc     
            RTS                ; $e9cd: 60        

;-------------------------------------------------------------------------------
__e9ce:     LDA $0360,y        ; $e9ce: b9 60 03  
            ORA $0365,y        ; $e9d1: 19 65 03  
            BEQ __ea3a         ; $e9d4: f0 64     
            LDA $58            ; $e9d6: a5 58     
            STA $0e            ; $e9d8: 85 0e     
            TYA                ; $e9da: 98        
            TAX                ; $e9db: aa        
            PHA                ; $e9dc: 48        
            LDA $0360,x        ; $e9dd: bd 60 03  
            BEQ __ea26         ; $e9e0: f0 44     
            DEC $0360,x        ; $e9e2: de 60 03  
            LDA __e8d9,y       ; $e9e5: b9 d9 e8  
            CPY #$01           ; $e9e8: c0 01     
            BNE __e9f5         ; $e9ea: d0 09     
            JSR __ea8e         ; $e9ec: 20 8e ea  
            CPY #$05           ; $e9ef: c0 05     
            BCC __e9f5         ; $e9f1: 90 02     
            LDA #$08           ; $e9f3: a9 08     
__e9f5:     CPX #$05           ; $e9f5: e0 05     
            ADC #$00           ; $e9f7: 69 00     
            STA $01            ; $e9f9: 85 01     
            LDY $03a3          ; $e9fb: ac a3 03  
            LDA __e8d4,y       ; $e9fe: b9 d4 e8  
            LDX $03a3          ; $ea01: ae a3 03  
            CPX #$04           ; $ea04: e0 04     
            BEQ __ea14         ; $ea06: f0 0c     
            CPX #$01           ; $ea08: e0 01     
            BNE __ea17         ; $ea0a: d0 0b     
            JSR __ea8e         ; $ea0c: 20 8e ea  
            LDA __e8e8,y       ; $ea0f: b9 e8 e8  
            BNE __ea17         ; $ea12: d0 03     
__ea14:     JSR __ea97         ; $ea14: 20 97 ea  
__ea17:     JSR __ea4a         ; $ea17: 20 4a ea  
            STA $00            ; $ea1a: 85 00     
            TYA                ; $ea1c: 98        
            ASL                ; $ea1d: 0a        
            ASL                ; $ea1e: 0a        
            ASL                ; $ea1f: 0a        
            ASL                ; $ea20: 0a        
            ADC $00            ; $ea21: 65 00     
            JSR __c94e         ; $ea23: 20 4e c9  
__ea26:     LDY $03a3          ; $ea26: ac a3 03  
            PLA                ; $ea29: 68        
            CLC                ; $ea2a: 18        
            ADC #$05           ; $ea2b: 69 05     
            DEC $0e            ; $ea2d: c6 0e     
            .hex 10            ; $ea2f: 10        Suspected data
__ea30:     TAX                ; $ea30: aa        
            LDA #$08           ; $ea31: a9 08     
__ea33:     STA $fe            ; $ea33: 85 fe     
__ea35:     LDA $58            ; $ea35: a5 58     
            JMP __c8e0         ; $ea37: 4c e0 c8  

;-------------------------------------------------------------------------------
__ea3a:     CPY #$04           ; $ea3a: c0 04     
            BCC __ea42         ; $ea3c: 90 04     
            LDX #$10           ; $ea3e: a2 10     
            STX $45            ; $ea40: 86 45     
__ea42:     INC $03a3          ; $ea42: ee a3 03  
            LDA #$40           ; $ea45: a9 40     
            STA $34            ; $ea47: 85 34     
__ea49:     RTS                ; $ea49: 60        

;-------------------------------------------------------------------------------
__ea4a:     LDY #$00           ; $ea4a: a0 00     
__ea4c:     CMP #$0a           ; $ea4c: c9 0a     
            BCC __ea49         ; $ea4e: 90 f9     
            SBC #$0a           ; $ea50: e9 0a     
            INY                ; $ea52: c8        
            BNE __ea4c         ; $ea53: d0 f7     
__ea55:     JSR __ea8e         ; $ea55: 20 8e ea  
            LDA __e8de,y       ; $ea58: b9 de e8  
            RTS                ; $ea5b: 60        

;-------------------------------------------------------------------------------
__ea5c:     LDY $03a3          ; $ea5c: ac a3 03  
            CPY #$01           ; $ea5f: c0 01     
            BEQ __ea6e         ; $ea61: f0 0b     
            CPY #$04           ; $ea63: c0 04     
            BEQ __ea7e         ; $ea65: f0 17     
            LDA __e8d6,y       ; $ea67: b9 d6 e8  
            STA $0305,x        ; $ea6a: 9d 05 03  
            RTS                ; $ea6d: 60        

;-------------------------------------------------------------------------------
__ea6e:     JSR __ea55         ; $ea6e: 20 55 ea  
            JSR __ea4a         ; $ea71: 20 4a ea  
            STA $0305,x        ; $ea74: 9d 05 03  
            TYA                ; $ea77: 98        
            BEQ __ea7d         ; $ea78: f0 03     
            STA $0304,x        ; $ea7a: 9d 04 03  
__ea7d:     RTS                ; $ea7d: 60        

;-------------------------------------------------------------------------------
__ea7e:     JSR __ea97         ; $ea7e: 20 97 ea  
            JSR __ea4a         ; $ea81: 20 4a ea  
            STA $0306,x        ; $ea84: 9d 06 03  
            TYA                ; $ea87: 98        
            BEQ __ea8d         ; $ea88: f0 03     
            STA $0305,x        ; $ea8a: 9d 05 03  
__ea8d:     RTS                ; $ea8d: 60        

;-------------------------------------------------------------------------------
__ea8e:     LDY $56            ; $ea8e: a4 56     
            CPY #$0a           ; $ea90: c0 0a     
            BCC __ea96         ; $ea92: 90 02     
            LDY #$09           ; $ea94: a0 09     
__ea96:     RTS                ; $ea96: 60        

;-------------------------------------------------------------------------------
__ea97:     LDY $59            ; $ea97: a4 59     
            INY                ; $ea99: c8        
            TYA                ; $ea9a: 98        
            CMP #$21           ; $ea9b: c9 21     
            BCC __eaa1         ; $ea9d: 90 02     
            SBC #$20           ; $ea9f: e9 20     
__eaa1:     RTS                ; $eaa1: 60        

;-------------------------------------------------------------------------------
__eaa2:     BRK                ; $eaa2: 00        
            BIT $60            ; $eaa3: 24 60     
            RTI                ; $eaa5: 40        

;-------------------------------------------------------------------------------
            BVS __ea30         ; $eaa6: 70 88     
            LDY #$80           ; $eaa8: a0 80     
            TYA                ; $eaaa: 98        
            BCS __eac9         ; $eaab: b0 1c     
            JSR $40e0          ; $eaad: 20 e0 40  
            RTS                ; $eab0: 60        

;-------------------------------------------------------------------------------
            BVS __ea33         ; $eab1: 70 80     
            BCC __ea55         ; $eab3: 90 a0     
            BCS __eb13         ; $eab5: b0 5c     
            JMP ($407c)        ; $eab7: 6c 7c 40  

;-------------------------------------------------------------------------------
            PHA                ; $eaba: 48        
            BVC __ead9         ; $eabb: 50 1c     
            .hex 20 00         ; $eabd: 20 00     Suspected data
__eabf:     JSR $5500          ; $eabf: 20 00 55  
            EOR $55,x          ; $eac2: 55 55     
            BRK                ; $eac4: 00        
            BRK                ; $eac5: 00        
            BRK                ; $eac6: 00        
            TAX                ; $eac7: aa        
            TAX                ; $eac8: aa        
__eac9:     TAX                ; $eac9: aa        
            BRK                ; $eaca: 00        
            EOR $ff,x          ; $eacb: 55 ff     
            TAX                ; $eacd: aa        
            .hex ff ff ff      ; $eace: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ead1: ff ff ff  Invalid Opcode - ISC $ffff,x
            EOR $55,x          ; $ead4: 55 55     
            EOR $aa,x          ; $ead6: 55 aa     
            TAX                ; $ead8: aa        
__ead9:     TAX                ; $ead9: aa        
            TAX                ; $eada: aa        
            TAX                ; $eadb: aa        
            BRK                ; $eadc: 00        
__eadd:     EOR $32,x          ; $eadd: 55 32     
            .hex 32            ; $eadf: 32        Invalid Opcode - KIL 
            .hex 22            ; $eae0: 22        Invalid Opcode - KIL 
            .hex 42            ; $eae1: 42        Invalid Opcode - KIL 
            .hex 22            ; $eae2: 22        Invalid Opcode - KIL 
            .hex 22            ; $eae3: 22        Invalid Opcode - KIL 
            .hex 22            ; $eae4: 22        Invalid Opcode - KIL 
            AND ($21,x)        ; $eae5: 21 21     
            AND ($11,x)        ; $eae7: 21 11     
            ORA ($22),y        ; $eae9: 11 22     
            BIT $22            ; $eaeb: 24 22     
            .hex 22            ; $eaed: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaee: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaef: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf0: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf1: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf2: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf3: 22        Invalid Opcode - KIL 
            .hex 22            ; $eaf4: 22        Invalid Opcode - KIL 
            AND ($21,x)        ; $eaf5: 21 21     
            AND ($11,x)        ; $eaf7: 21 11     
            ORA ($24),y        ; $eaf9: 11 24     
            .hex 24            ; $eafb: 24        Suspected data
__eafc:     STY $09            ; $eafc: 84 09     
            LDA __eaa1,y       ; $eafe: b9 a1 ea  
            STA $04            ; $eb01: 85 04     
            LDA __eabf,y       ; $eb03: b9 bf ea  
            STA $0a            ; $eb06: 85 0a     
            STA $0b            ; $eb08: 85 0b     
            STA $0c            ; $eb0a: 85 0c     
            STA $0d            ; $eb0c: 85 0d     
            LDA __eadd,y       ; $eb0e: b9 dd ea  
            .hex 4c 3d         ; $eb11: 4c 3d     Suspected data
__eb13:     .hex c7 06         ; $eb13: c7 06     Invalid Opcode - DCP $06
            ASL $04            ; $eb15: 06 04     
            PHP                ; $eb17: 08        
            .hex 04 04         ; $eb18: 04 04     Invalid Opcode - NOP $04
            .hex 04 02         ; $eb1a: 04 02     Invalid Opcode - NOP $02
            .hex 02            ; $eb1c: 02        Invalid Opcode - KIL 
            .hex 02            ; $eb1d: 02        Invalid Opcode - KIL 
            ORA ($01,x)        ; $eb1e: 01 01     
            .hex 04 06         ; $eb20: 04 06     Invalid Opcode - NOP $06
            .hex 04 04         ; $eb22: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $eb24: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $eb26: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $eb28: 04 04     Invalid Opcode - NOP $04
            .hex 04 02         ; $eb2a: 04 02     Invalid Opcode - NOP $02
            .hex 02            ; $eb2c: 02        Invalid Opcode - KIL 
            .hex 02            ; $eb2d: 02        Invalid Opcode - KIL 
__eb2e:     LDX #$0a           ; $eb2e: a2 0a     
__eb30:     LDA $03e8,x        ; $eb30: bd e8 03  
            BEQ __eb68         ; $eb33: f0 33     
            PHA                ; $eb35: 48        
            AND #$1f           ; $eb36: 29 1f     
            BEQ __eb62         ; $eb38: f0 28     
            TAY                ; $eb3a: a8        
            PLA                ; $eb3b: 68        
            BMI __eb6c         ; $eb3c: 30 2e     
            AND #$40           ; $eb3e: 29 40     
            STA $0e            ; $eb40: 85 0e     
            LDA $9c,x          ; $eb42: b5 9c     
            STA $00            ; $eb44: 85 00     
            LDA $a7,x          ; $eb46: b5 a7     
            STA $01            ; $eb48: 85 01     
            LDA $03dd,x        ; $eb4a: bd dd 03  
            STA $02            ; $eb4d: 85 02     
            LDA $bd,x          ; $eb4f: b5 bd     
            BPL __eb56         ; $eb51: 10 03     
            LDA #$00           ; $eb53: a9 00     
            .hex 2c            ; $eb55: 2c        Suspected data
__eb56:     LDA #$01           ; $eb56: a9 01     
            STA $0f            ; $eb58: 85 0f     
            TXA                ; $eb5a: 8a        
            PHA                ; $eb5b: 48        
            JSR __eafc         ; $eb5c: 20 fc ea  
__eb5f:     PLA                ; $eb5f: 68        
            TAX                ; $eb60: aa        
            .hex 24            ; $eb61: 24        Suspected data
__eb62:     PLA                ; $eb62: 68        
            LDA #$00           ; $eb63: a9 00     
            STA $03e8,x        ; $eb65: 9d e8 03  
__eb68:     DEX                ; $eb68: ca        
            BPL __eb30         ; $eb69: 10 c5     
__eb6b:     RTS                ; $eb6b: 60        

;-------------------------------------------------------------------------------
__eb6c:     LDA #$00           ; $eb6c: a9 00     
            STA $91,x          ; $eb6e: 95 91     
            TXA                ; $eb70: 8a        
            PHA                ; $eb71: 48        
            LDA __eb13,y       ; $eb72: b9 13 eb  
            TAX                ; $eb75: aa        
            LDA __eaa1,y       ; $eb76: b9 a1 ea  
            JSR __c821         ; $eb79: 20 21 c8  
            JMP __eb5f         ; $eb7c: 4c 5f eb  

;-------------------------------------------------------------------------------
__eb7f:     LDX #$00           ; $eb7f: a2 00     
            JSR __eb8a         ; $eb81: 20 8a eb  
            LDA $58            ; $eb84: a5 58     
            BEQ __eb6b         ; $eb86: f0 e3     
            LDX #$01           ; $eb88: a2 01     
__eb8a:     LDA $5a,x          ; $eb8a: b5 5a     
            BNE __eb6b         ; $eb8c: d0 dd     
            LDA $20,x          ; $eb8e: b5 20     
            BMI __eb6b         ; $eb90: 30 d9     
            TXA                ; $eb92: 8a        
            PHA                ; $eb93: 48        
            ASL                ; $eb94: 0a        
            ASL                ; $eb95: 0a        
            TAY                ; $eb96: a8        
            LDA #$f8           ; $eb97: a9 f8     
            STA $021c,y        ; $eb99: 99 1c 02  
            LDA __eaa2,x       ; $eb9c: bd a2 ea  
            LDX #$06           ; $eb9f: a2 06     
            JSR __c821         ; $eba1: 20 21 c8  
            PLA                ; $eba4: 68        
            TAX                ; $eba5: aa        
            LDA $3f,x          ; $eba6: b5 3f     
            BNE __eb6b         ; $eba8: d0 c1     
            JSR __cfeb         ; $ebaa: 20 eb cf  
            STA $e0,x          ; $ebad: 95 e0     
            STA $80,x          ; $ebaf: 95 80     
            STA $86,x          ; $ebb1: 95 86     
            LDA #$00           ; $ebb3: a9 00     
            STA $2f,x          ; $ebb5: 95 2f     
            LDA $90            ; $ebb7: a5 90     
            SEC                ; $ebb9: 38        
            SBC #$03           ; $ebba: e9 03     
            STA $00            ; $ebbc: 85 00     
            LDA $0382,x        ; $ebbe: bd 82 03  
            CMP $90            ; $ebc1: c5 90     
            BCS __ebce         ; $ebc3: b0 09     
            CMP $00            ; $ebc5: c5 00     
            BCS __ebd3         ; $ebc7: b0 0a     
            LDA $00            ; $ebc9: a5 00     
            JMP __ebd3         ; $ebcb: 4c d3 eb  

;-------------------------------------------------------------------------------
__ebce:     LDA $00            ; $ebce: a5 00     
            CLC                ; $ebd0: 18        
            ADC #$02           ; $ebd1: 69 02     
__ebd3:     CMP $0786          ; $ebd3: cd 86 07  
            BEQ __ebdd         ; $ebd6: f0 05     
            CMP $0787          ; $ebd8: cd 87 07  
            BNE __ebe9         ; $ebdb: d0 0c     
__ebdd:     SEC                ; $ebdd: 38        
            SBC #$01           ; $ebde: e9 01     
            CMP $00            ; $ebe0: c5 00     
            BCS __ebd3         ; $ebe2: b0 ef     
            ADC #$03           ; $ebe4: 69 03     
            JMP __ebd3         ; $ebe6: 4c d3 eb  

;-------------------------------------------------------------------------------
__ebe9:     STA $5a,x          ; $ebe9: 95 5a     
            JSR __edd5         ; $ebeb: 20 d5 ed  
            SEC                ; $ebee: 38        
            SBC #$08           ; $ebef: e9 08     
            STA $66,x          ; $ebf1: 95 66     
            LDA $5a,x          ; $ebf3: b5 5a     
            STA $0f            ; $ebf5: 85 0f     
            LDA $64,x          ; $ebf7: b5 64     
            CLC                ; $ebf9: 18        
            ADC #$08           ; $ebfa: 69 08     
            STA $0e            ; $ebfc: 85 0e     
__ebfe:     JSR __deb9         ; $ebfe: 20 b9 de  
            BMI __ec07         ; $ec01: 30 04     
            CMP #$03           ; $ec03: c9 03     
            BNE __ec12         ; $ec05: d0 0b     
__ec07:     LDA $0e            ; $ec07: a5 0e     
            CLC                ; $ec09: 18        
            ADC #$08           ; $ec0a: 69 08     
            STA $0e            ; $ec0c: 85 0e     
            CMP #$e0           ; $ec0e: c9 e0     
            BCC __ebfe         ; $ec10: 90 ec     
__ec12:     LDA $0e            ; $ec12: a5 0e     
            SEC                ; $ec14: 38        
            SBC #$08           ; $ec15: e9 08     
            STA $64,x          ; $ec17: 95 64     
            LDA #$01           ; $ec19: a9 01     
            STA $2d,x          ; $ec1b: 95 2d     
            JSR __d0b8         ; $ec1d: 20 b8 d0  
            JMP __d8fd         ; $ec20: 4c fd d8  

;-------------------------------------------------------------------------------
__ec23:     LDX #$00           ; $ec23: a2 00     
            JSR __ec2a         ; $ec25: 20 2a ec  
            LDX #$01           ; $ec28: a2 01     
__ec2a:     LDA $2d,x          ; $ec2a: b5 2d     
            BEQ __ec50         ; $ec2c: f0 22     
            LDA $20,x          ; $ec2e: b5 20     
            BMI __ec50         ; $ec30: 30 1e     
            TXA                ; $ec32: 8a        
            ASL                ; $ec33: 0a        
            TAY                ; $ec34: a8        
            LDA $0014,y        ; $ec35: b9 14 00  
            ORA $70,x          ; $ec38: 15 70     
            AND #$cf           ; $ec3a: 29 cf     
            BEQ __ec42         ; $ec3c: f0 04     
            LDA #$00           ; $ec3e: a9 00     
            STA $2d,x          ; $ec40: 95 2d     
__ec42:     LDA $50            ; $ec42: a5 50     
            AND #$01           ; $ec44: 29 01     
            BEQ __ec50         ; $ec46: f0 08     
            LDA __eaa2,x       ; $ec48: bd a2 ea  
            LDX #$06           ; $ec4b: a2 06     
            JMP __c821         ; $ec4d: 4c 21 c8  

;-------------------------------------------------------------------------------
__ec50:     RTS                ; $ec50: 60        

;-------------------------------------------------------------------------------
__ec51:     LDX #$07           ; $ec51: a2 07     
__ec53:     LDA $91,x          ; $ec53: b5 91     
            BEQ __ec74         ; $ec55: f0 1d     
            LDA $a7,x          ; $ec57: b5 a7     
            CPX #$00           ; $ec59: e0 00     
            BNE __ec63         ; $ec5b: d0 06     
            CMP #$f0           ; $ec5d: c9 f0     
            BCC __ec63         ; $ec5f: 90 02     
            LDA #$ec           ; $ec61: a9 ec     
__ec63:     CLC                ; $ec63: 18        
            ADC #$04           ; $ec64: 69 04     
            STA $a7,x          ; $ec66: 95 a7     
            CPX #$00           ; $ec68: e0 00     
            BEQ __ec74         ; $ec6a: f0 08     
            CMP #$f8           ; $ec6c: c9 f8     
            BCC __ec74         ; $ec6e: 90 04     
            LDA #$00           ; $ec70: a9 00     
            STA $91,x          ; $ec72: 95 91     
__ec74:     CPX #$02           ; $ec74: e0 02     
            BCS __ec82         ; $ec76: b0 0a     
            LDA $5a,x          ; $ec78: b5 5a     
            BEQ __ec82         ; $ec7a: f0 06     
            LDA $66,x          ; $ec7c: b5 66     
            ADC #$04           ; $ec7e: 69 04     
            STA $66,x          ; $ec80: 95 66     
__ec82:     CPX #$03           ; $ec82: e0 03     
            BCS __ec92         ; $ec84: b0 0c     
            LDA $af,x          ; $ec86: b5 af     
            BEQ __ec92         ; $ec88: f0 08     
            CMP #$f0           ; $ec8a: c9 f0     
            BCS __ec92         ; $ec8c: b0 04     
            ADC #$04           ; $ec8e: 69 04     
            STA $af,x          ; $ec90: 95 af     
__ec92:     DEX                ; $ec92: ca        
            BPL __ec53         ; $ec93: 10 be     
            LDX #$e4           ; $ec95: a2 e4     
            LDA $55            ; $ec97: a5 55     
            CMP #$02           ; $ec99: c9 02     
            BNE __ec9f         ; $ec9b: d0 02     
            LDX #$fc           ; $ec9d: a2 fc     
__ec9f:     LDA $0200,x        ; $ec9f: bd 00 02  
            CMP #$f2           ; $eca2: c9 f2     
            BCC __eca8         ; $eca4: 90 02     
            LDA #$f4           ; $eca6: a9 f4     
__eca8:     CLC                ; $eca8: 18        
            ADC #$04           ; $eca9: 69 04     
            STA $0200,x        ; $ecab: 9d 00 02  
            DEX                ; $ecae: ca        
            DEX                ; $ecaf: ca        
            DEX                ; $ecb0: ca        
            DEX                ; $ecb1: ca        
            CPX #$fc           ; $ecb2: e0 fc     
            BNE __ec9f         ; $ecb4: d0 e9     
            RTS                ; $ecb6: 60        

;-------------------------------------------------------------------------------
__ecb7:     JSR $30f0          ; $ecb7: 20 f0 30  
            ORA __f0c0,x       ; $ecba: 1d c0 f0  
            BMI __ecdd         ; $ecbd: 30 1e     
__ecbf:     LDX $58            ; $ecbf: a6 58     
__ecc1:     LDA $20,x          ; $ecc1: b5 20     
            BMI __ecc7         ; $ecc3: 30 02     
            LDA #$fb           ; $ecc5: a9 fb     
__ecc7:     EOR #$ff           ; $ecc7: 49 ff     
            JSR __ecf0         ; $ecc9: 20 f0 ec  
            DEX                ; $eccc: ca        
            BPL __ecc1         ; $eccd: 10 f2     
            LDA #$fc           ; $eccf: a9 fc     
            CMP $20            ; $ecd1: c5 20     
            BNE __ed08         ; $ecd3: d0 33     
            LDY $58            ; $ecd5: a4 58     
            BEQ __ecdd         ; $ecd7: f0 04     
            CMP $21            ; $ecd9: c5 21     
            BNE __ed08         ; $ecdb: d0 2b     
__ecdd:     LDY $43            ; $ecdd: a4 43     
            BEQ __ed08         ; $ecdf: f0 27     
            DEY                ; $ece1: 88        
__ece2:     BNE __ed08         ; $ece2: d0 24     
            LDA #$80           ; $ece4: a9 80     
            STA $20            ; $ece6: 85 20     
            ASL                ; $ece8: 0a        
            .hex 85            ; $ece9: 85        Suspected data
__ecea:     ASL $04a9,x        ; $ecea: 1e a9 04  
            JMP __d4f5         ; $eced: 4c f5 d4  

;-------------------------------------------------------------------------------
__ecf0:     JSR __c728         ; $ecf0: 20 28 c7  
            BPL __ece2         ; $ecf3: 10 ed     
            SBC $09ec,x        ; $ecf5: fd ec 09  
            SBC __ed08         ; $ecf8: ed 08 ed  
            BVS __ecea         ; $ecfb: 70 ed     
            JSR __ed51         ; $ecfd: 20 51 ed  
            BCS __ed08         ; $ed00: b0 06     
            LDA #$10           ; $ed02: a9 10     
            STA $43            ; $ed04: 85 43     
            DEC $20,x          ; $ed06: d6 20     
__ed08:     RTS                ; $ed08: 60        

;-------------------------------------------------------------------------------
            LDY $43            ; $ed09: a4 43     
            DEY                ; $ed0b: 88        
            BNE __ed08         ; $ed0c: d0 fa     
            BEQ __ed14         ; $ed0e: f0 04     
            LDA #$01           ; $ed10: a9 01     
            STA $fc            ; $ed12: 85 fc     
__ed14:     DEC $20,x          ; $ed14: d6 20     
            JSR __ed63         ; $ed16: 20 63 ed  
__ed19:     LDA __ecb7,y       ; $ed19: b9 b7 ec  
            STA $0358,y        ; $ed1c: 99 58 03  
            INY                ; $ed1f: c8        
            TYA                ; $ed20: 98        
            AND #$03           ; $ed21: 29 03     
            BNE __ed19         ; $ed23: d0 f4     
__ed25:     TXA                ; $ed25: 8a        
            PHA                ; $ed26: 48        
            JSR __ed63         ; $ed27: 20 63 ed  
            LDX #$00           ; $ed2a: a2 00     
__ed2c:     LDA $0358,y        ; $ed2c: b9 58 03  
            STA $00,x          ; $ed2f: 95 00     
            INY                ; $ed31: c8        
            INX                ; $ed32: e8        
            CPX #$04           ; $ed33: e0 04     
            BNE __ed2c         ; $ed35: d0 f5     
            LDY #$01           ; $ed37: a0 01     
            STY $0e            ; $ed39: 84 0e     
            DEY                ; $ed3b: 88        
            STY $0f            ; $ed3c: 84 0f     
            LDY $03            ; $ed3e: a4 03     
            JSR __eafc         ; $ed40: 20 fc ea  
            LDY #$00           ; $ed43: a0 00     
            PLA                ; $ed45: 68        
            TAX                ; $ed46: aa        
            BEQ __ed4b         ; $ed47: f0 02     
            LDY #$20           ; $ed49: a0 20     
__ed4b:     LDA #$35           ; $ed4b: a9 35     
            STA $0219,y        ; $ed4d: 99 19 02  
            RTS                ; $ed50: 60        

;-------------------------------------------------------------------------------
__ed51:     JSR __ed25         ; $ed51: 20 25 ed  
            JSR __ed63         ; $ed54: 20 63 ed  
            LDA $0359,y        ; $ed57: b9 59 03  
            SEC                ; $ed5a: 38        
            SBC #$02           ; $ed5b: e9 02     
            STA $0359,y        ; $ed5d: 99 59 03  
            CMP #$30           ; $ed60: c9 30     
            RTS                ; $ed62: 60        

;-------------------------------------------------------------------------------
__ed63:     TXA                ; $ed63: 8a        
            ASL                ; $ed64: 0a        
            ASL                ; $ed65: 0a        
            TAY                ; $ed66: a8        
            RTS                ; $ed67: 60        

;-------------------------------------------------------------------------------
__ed68:     INX                ; $ed68: e8        
            .hex f4            ; $ed69: f4        Suspected data
__ed6a:     BRK                ; $ed6a: 00        
            .hex 01            ; $ed6b: 01        Suspected data
__ed6c:     SEC                ; $ed6c: 38        
            .hex b0            ; $ed6d: b0        Suspected data
__ed6e:     BRK                ; $ed6e: 00        
            .hex 0c a5 55      ; $ed6f: 0c a5 55  Invalid Opcode - NOP $55a5
            CMP #$02           ; $ed72: c9 02     
            BEQ __edbe         ; $ed74: f0 48     
            TXA                ; $ed76: 8a        
            PHA                ; $ed77: 48        
            LDA __ed68,x       ; $ed78: bd 68 ed  
            LDX #$03           ; $ed7b: a2 03     
            JSR __c821         ; $ed7d: 20 21 c8  
            PLA                ; $ed80: 68        
            PHA                ; $ed81: 48        
            TAX                ; $ed82: aa        
            LDY $20,x          ; $ed83: b4 20     
            DEY                ; $ed85: 88        
            BMI __edbc         ; $ed86: 30 34     
            CPY #$03           ; $ed88: c0 03     
            BCC __ed8e         ; $ed8a: 90 02     
            LDY #$02           ; $ed8c: a0 02     
__ed8e:     LDA __ed6a,x       ; $ed8e: bd 6a ed  
            STA $02            ; $ed91: 85 02     
            LDA __ed6c,x       ; $ed93: bd 6c ed  
            STA $03            ; $ed96: 85 03     
            LDA __ed6e,x       ; $ed98: bd 6e ed  
            TAX                ; $ed9b: aa        
__ed9c:     LDA #$21           ; $ed9c: a9 21     
            STA $02e8,x        ; $ed9e: 9d e8 02  
            LDA #$36           ; $eda1: a9 36     
            STA $02e9,x        ; $eda3: 9d e9 02  
            LDA $02            ; $eda6: a5 02     
            STA $02ea,x        ; $eda8: 9d ea 02  
            LDA $03            ; $edab: a5 03     
            STA $02eb,x        ; $edad: 9d eb 02  
            INX                ; $edb0: e8        
            INX                ; $edb1: e8        
            INX                ; $edb2: e8        
            INX                ; $edb3: e8        
            CLC                ; $edb4: 18        
            ADC #$08           ; $edb5: 69 08     
            STA $03            ; $edb7: 85 03     
            DEY                ; $edb9: 88        
            BPL __ed9c         ; $edba: 10 e0     
__edbc:     PLA                ; $edbc: 68        
            TAX                ; $edbd: aa        
__edbe:     RTS                ; $edbe: 60        

;-------------------------------------------------------------------------------
__edbf:     PHA                ; $edbf: 48        
            AND #$80           ; $edc0: 29 80     
            LSR                ; $edc2: 4a        
            LSR                ; $edc3: 4a        
            LSR                ; $edc4: 4a        
            STA $00            ; $edc5: 85 00     
            PLA                ; $edc7: 68        
            AND #$78           ; $edc8: 29 78     
            LSR                ; $edca: 4a        
            LSR                ; $edcb: 4a        
            LSR                ; $edcc: 4a        
            ADC $00            ; $edcd: 65 00     
            RTS                ; $edcf: 60        

;-------------------------------------------------------------------------------
            LDA $5a            ; $edd0: a5 5a     
            BIT $5ba5          ; $edd2: 2c a5 5b  
__edd5:     STA $00            ; $edd5: 85 00     
            LDA $90            ; $edd7: a5 90     
            SEC                ; $edd9: 38        
            SBC $00            ; $edda: e5 00     
            TAY                ; $eddc: a8        
            LDA #$08           ; $eddd: a9 08     
__eddf:     CLC                ; $eddf: 18        
            ADC #$30           ; $ede0: 69 30     
            DEY                ; $ede2: 88        
            BPL __eddf         ; $ede3: 10 fa     
__ede5:     RTS                ; $ede5: 60        

;-------------------------------------------------------------------------------
            BRK                ; $ede6: 00        
            ORA $05            ; $ede7: 05 05     
            ORA $0a            ; $ede9: 05 0a     
__edeb:     ASL                ; $edeb: 0a        
            ASL                ; $edec: 0a        
__eded:     PLA                ; $eded: 68        
            TYA                ; $edee: 98        
            INY                ; $edef: c8        
            .hex f0            ; $edf0: f0        Suspected data
__edf1:     CLC                ; $edf1: 18        
            JSR $2028          ; $edf2: 20 28 20  
            .hex ff a0 a4      ; $edf5: ff a0 a4  Invalid Opcode - ISC $a4a0,x
            TAY                ; $edf8: a8        
            LDY $ff            ; $edf9: a4 ff     
            .hex ac ff         ; $edfb: ac ff     Suspected data
__edfd:     .hex 12            ; $edfd: 12        Invalid Opcode - KIL 
            .hex 14 ff         ; $edfe: 14 ff     Invalid Opcode - NOP $ff,x
__ee00:     INC __ff00,x       ; $ee00: fe 00 ff  
            BRK                ; $ee03: 00        
            .hex ff 00 00      ; $ee04: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $ee07: 00        
            ORA ($00,x)        ; $ee08: 01 00     
            ORA ($00,x)        ; $ee0a: 01 00     
            .hex 02            ; $ee0c: 02        Invalid Opcode - KIL 
__ee0d:     LDX #$07           ; $ee0d: a2 07     
__ee0f:     CPX #$00           ; $ee0f: e0 00     
            BEQ __ee54         ; $ee11: f0 41     
            LDA $03e8,x        ; $ee13: bd e8 03  
            BMI __ee54         ; $ee16: 30 3c     
            LDA $91,x          ; $ee18: b5 91     
            BEQ __ee54         ; $ee1a: f0 38     
            BPL __ee58         ; $ee1c: 10 3a     
            JSR __ef70         ; $ee1e: 20 70 ef  
            BCC __ee26         ; $ee21: 90 03     
            JSR __ef7b         ; $ee23: 20 7b ef  
__ee26:     JSR __ef56         ; $ee26: 20 56 ef  
            CPX #$01           ; $ee29: e0 01     
            BNE __ee31         ; $ee2b: d0 04     
            LDA $3d            ; $ee2d: a5 3d     
            BEQ __ee38         ; $ee2f: f0 07     
__ee31:     LDA $9c,x          ; $ee31: b5 9c     
            BNE __ee38         ; $ee33: d0 03     
            JMP __eebd         ; $ee35: 4c bd ee  

;-------------------------------------------------------------------------------
__ee38:     JSR __ef8e         ; $ee38: 20 8e ef  
            CMP #$ff           ; $ee3b: c9 ff     
            BNE __ee44         ; $ee3d: d0 05     
            LDA #$00           ; $ee3f: a9 00     
            STA $03b1,x        ; $ee41: 9d b1 03  
__ee44:     JSR __ef8e         ; $ee44: 20 8e ef  
            STA $03dd,x        ; $ee47: 9d dd 03  
__ee4a:     TXA                ; $ee4a: 8a        
            CLC                ; $ee4b: 18        
            ADC #$03           ; $ee4c: 69 03     
            ORA $03e8,x        ; $ee4e: 1d e8 03  
            STA $03e8,x        ; $ee51: 9d e8 03  
__ee54:     DEX                ; $ee54: ca        
            BPL __ee0f         ; $ee55: 10 b8     
            RTS                ; $ee57: 60        

;-------------------------------------------------------------------------------
__ee58:     CPX #$01           ; $ee58: e0 01     
            BEQ __eea7         ; $ee5a: f0 4b     
            CMP #$01           ; $ee5c: c9 01     
            BNE __eec5         ; $ee5e: d0 65     
            CPX #$05           ; $ee60: e0 05     
            BCS __eeaa         ; $ee62: b0 46     
            LDA #$00           ; $ee64: a9 00     
            STA $0382,x        ; $ee66: 9d 82 03  
            INC $03d2,x        ; $ee69: fe d2 03  
            LDA $03d2,x        ; $ee6c: bd d2 03  
            AND #$07           ; $ee6f: 29 07     
            BNE __ee82         ; $ee71: d0 0f     
            JSR __ef4e         ; $ee73: 20 4e ef  
            TAY                ; $ee76: a8        
            LDA $03d2,x        ; $ee77: bd d2 03  
            AND #$0f           ; $ee7a: 29 0f     
            BNE __ee82         ; $ee7c: d0 04     
            TYA                ; $ee7e: 98        
            STA $03b1,x        ; $ee7f: 9d b1 03  
__ee82:     JSR __ef70         ; $ee82: 20 70 ef  
            BCC __ee8d         ; $ee85: 90 06     
            LDA $03b1,x        ; $ee87: bd b1 03  
            JSR __ef7d         ; $ee8a: 20 7d ef  
__ee8d:     LDA $9c,x          ; $ee8d: b5 9c     
            BEQ __eebd         ; $ee8f: f0 2c     
            JSR __ef42         ; $ee91: 20 42 ef  
            BPL __ee9d         ; $ee94: 10 07     
            INC $91,x          ; $ee96: f6 91     
            LDA #$00           ; $ee98: a9 00     
            STA $03b1,x        ; $ee9a: 9d b1 03  
__ee9d:     LDA #$06           ; $ee9d: a9 06     
            STA $03dd,x        ; $ee9f: 9d dd 03  
__eea2:     JSR __ef6a         ; $eea2: 20 6a ef  
            BNE __ee4a         ; $eea5: d0 a3     
__eea7:     JMP __ef06         ; $eea7: 4c 06 ef  

;-------------------------------------------------------------------------------
__eeaa:     LDA #$10           ; $eeaa: a9 10     
            STA $03bc,x        ; $eeac: 9d bc 03  
            JSR __ef56         ; $eeaf: 20 56 ef  
            LDY $03b1,x        ; $eeb2: bc b1 03  
            LDA __edfd,y       ; $eeb5: b9 fd ed  
            STA $03dd,x        ; $eeb8: 9d dd 03  
            BPL __eec2         ; $eebb: 10 05     
__eebd:     LDA #$80           ; $eebd: a9 80     
            STA $03e8,x        ; $eebf: 9d e8 03  
__eec2:     JMP __ee4a         ; $eec2: 4c 4a ee  

;-------------------------------------------------------------------------------
__eec5:     CMP #$02           ; $eec5: c9 02     
            BNE __eec2         ; $eec7: d0 f9     
            INC $a7,x          ; $eec9: f6 a7     
            JSR __ef70         ; $eecb: 20 70 ef  
            BCC __ef03         ; $eece: 90 33     
            JSR __ef6a         ; $eed0: 20 6a ef  
            INC $a7,x          ; $eed3: f6 a7     
            LDA $90            ; $eed5: a5 90     
            SEC                ; $eed7: 38        
            SBC $b2,x          ; $eed8: f5 b2     
            STA $05            ; $eeda: 85 05     
            TAY                ; $eedc: a8        
            LDA __eded,y       ; $eedd: b9 ed ed  
            CMP $a7,x          ; $eee0: d5 a7     
            BCS __ef03         ; $eee2: b0 1f     
            STA $a7,x          ; $eee4: 95 a7     
            LDA $05            ; $eee6: a5 05     
            CMP #$03           ; $eee8: c9 03     
            BCS __eebd         ; $eeea: b0 d1     
            DEC $b2,x          ; $eeec: d6 b2     
            JSR __ef42         ; $eeee: 20 42 ef  
            BMI __ef03         ; $eef1: 30 10     
            LDA #$01           ; $eef3: a9 01     
            STA $91,x          ; $eef5: 95 91     
            LSR                ; $eef7: 4a        
            STA $03b1,x        ; $eef8: 9d b1 03  
            LDA #$ff           ; $eefb: a9 ff     
            STA $03d2,x        ; $eefd: 9d d2 03  
            JSR __ef6a         ; $ef00: 20 6a ef  
__ef03:     JMP __ee9d         ; $ef03: 4c 9d ee  

;-------------------------------------------------------------------------------
__ef06:     CMP #$04           ; $ef06: c9 04     
            BEQ __eec2         ; $ef08: f0 b8     
            CMP #$05           ; $ef0a: c9 05     
            BNE __eec2         ; $ef0c: d0 b4     
            JSR __ef70         ; $ef0e: 20 70 ef  
            BCC __ef19         ; $ef11: 90 06     
            JSR __ef6a         ; $ef13: 20 6a ef  
            JSR __ef7b         ; $ef16: 20 7b ef  
__ef19:     LDA $9c,x          ; $ef19: b5 9c     
            BEQ __eebd         ; $ef1b: f0 a0     
            JSR __ef83         ; $ef1d: 20 83 ef  
            BCC __ef3a         ; $ef20: 90 18     
            LDA $03b1,x        ; $ef22: bd b1 03  
            TAY                ; $ef25: a8        
            LDA __ee00,y       ; $ef26: b9 00 ee  
            CLC                ; $ef29: 18        
            ADC $a7,x          ; $ef2a: 75 a7     
            STA $a7,x          ; $ef2c: 95 a7     
            INC $03b1,x        ; $ef2e: fe b1 03  
            CPY #$0c           ; $ef31: c0 0c     
            BNE __ef3a         ; $ef33: d0 05     
            LDA #$00           ; $ef35: a9 00     
            STA $03b1,x        ; $ef37: 9d b1 03  
__ef3a:     LDA #$98           ; $ef3a: a9 98     
            STA $03dd,x        ; $ef3c: 9d dd 03  
            JMP __eea2         ; $ef3f: 4c a2 ee  

;-------------------------------------------------------------------------------
__ef42:     LDA $9c,x          ; $ef42: b5 9c     
            CLC                ; $ef44: 18        
            ADC #$08           ; $ef45: 69 08     
__ef47:     STA $0e            ; $ef47: 85 0e     
            STX $0f            ; $ef49: 86 0f     
            JMP __deb2         ; $ef4b: 4c b2 de  

;-------------------------------------------------------------------------------
__ef4e:     LDA $bd,x          ; $ef4e: b5 bd     
            JSR __d2fb         ; $ef50: 20 fb d2  
            STA $bd,x          ; $ef53: 95 bd     
            RTS                ; $ef55: 60        

;-------------------------------------------------------------------------------
__ef56:     LDA $03d2,x        ; $ef56: bd d2 03  
            CMP #$ff           ; $ef59: c9 ff     
            BNE __ef62         ; $ef5b: d0 05     
            INC $03d2,x        ; $ef5d: fe d2 03  
            BEQ __ef6a         ; $ef60: f0 08     
__ef62:     JSR __ef83         ; $ef62: 20 83 ef  
            BCC __ef6f         ; $ef65: 90 08     
            INC $03b1,x        ; $ef67: fe b1 03  
__ef6a:     LDA #$40           ; $ef6a: a9 40     
            STA $03e8,x        ; $ef6c: 9d e8 03  
__ef6f:     RTS                ; $ef6f: 60        

;-------------------------------------------------------------------------------
__ef70:     LDA $03a6,x        ; $ef70: bd a6 03  
            CLC                ; $ef73: 18        
            ADC $03c7,x        ; $ef74: 7d c7 03  
            STA $03c7,x        ; $ef77: 9d c7 03  
            RTS                ; $ef7a: 60        

;-------------------------------------------------------------------------------
__ef7b:     LDA $bd,x          ; $ef7b: b5 bd     
__ef7d:     CLC                ; $ef7d: 18        
            ADC $9c,x          ; $ef7e: 75 9c     
            STA $9c,x          ; $ef80: 95 9c     
            RTS                ; $ef82: 60        

;-------------------------------------------------------------------------------
__ef83:     .hex bd            ; $ef83: bd        Suspected data
__ef84:     LDY $1803,x        ; $ef84: bc 03 18  
            ADC $03d2,x        ; $ef87: 7d d2 03  
            STA $03d2,x        ; $ef8a: 9d d2 03  
            RTS                ; $ef8d: 60        

;-------------------------------------------------------------------------------
__ef8e:     LDA $03b1,x        ; $ef8e: bd b1 03  
            CLC                ; $ef91: 18        
            ADC __ede5,x       ; $ef92: 7d e5 ed  
            TAY                ; $ef95: a8        
            LDA __edf1,y       ; $ef96: b9 f1 ed  
            RTS                ; $ef99: 60        

;-------------------------------------------------------------------------------
__ef9a:     LDY $dc            ; $ef9a: a4 dc     
            DEY                ; $ef9c: 88        
            DEY                ; $ef9d: 88        
            BMI __efb7         ; $ef9e: 30 17     
            BNE __efa8         ; $efa0: d0 06     
            LDA #$18           ; $efa2: a9 18     
            STA $dd            ; $efa4: 85 dd     
            INC $dc            ; $efa6: e6 dc     
__efa8:     INC $a8            ; $efa8: e6 a8     
            INC $a8            ; $efaa: e6 a8     
            DEC $dd            ; $efac: c6 dd     
            .hex d0            ; $efae: d0        Suspected data
__efaf:     ASL $a9            ; $efaf: 06 a9     
            BRK                ; $efb1: 00        
            STA $dc            ; $efb2: 85 dc     
            DEC $b3            ; $efb4: c6 b3     
__efb6:     RTS                ; $efb6: 60        

;-------------------------------------------------------------------------------
__efb7:     LDX #$01           ; $efb7: a2 01     
            LDA $91,x          ; $efb9: b5 91     
            BEQ __efe1         ; $efbb: f0 24     
            LDA $90            ; $efbd: a5 90     
            SEC                ; $efbf: 38        
            SBC $b2,x          ; $efc0: f5 b2     
            CMP #$04           ; $efc2: c9 04     
            BCC __efcb         ; $efc4: 90 05     
            LDA #$84           ; $efc6: a9 84     
            STA $03e8,x        ; $efc8: 9d e8 03  
__efcb:     LDA $9c,x          ; $efcb: b5 9c     
            LDY $bd,x          ; $efcd: b4 bd     
            BMI __efd3         ; $efcf: 30 02     
            ADC #$08           ; $efd1: 69 08     
__efd3:     JSR __ef47         ; $efd3: 20 47 ef  
            BPL __efe1         ; $efd6: 10 09     
            LDA $dc            ; $efd8: a5 dc     
            BNE __efdf         ; $efda: d0 03     
            JSR __ef4e         ; $efdc: 20 4e ef  
__efdf:     .hex e6            ; $efdf: e6        Suspected data
__efe0:     .hex dc            ; $efe0: dc        Suspected data
__efe1:     RTS                ; $efe1: 60        

;-------------------------------------------------------------------------------
            CLC                ; $efe2: 18        
            .hex 30            ; $efe3: 30        Suspected data
__efe4:     RTI                ; $efe4: 40        

;-------------------------------------------------------------------------------
            RTI                ; $efe5: 40        

;-------------------------------------------------------------------------------
            BVC __f048         ; $efe6: 50 60     
            BVS __ef6a         ; $efe8: 70 80     
            BCC __ef84         ; $efea: 90 98     
__efec:     LDX #$02           ; $efec: a2 02     
            JSR __eff3         ; $efee: 20 f3 ef  
            LDX #$03           ; $eff1: a2 03     
__eff3:     LDA $91,x          ; $eff3: b5 91     
            BEQ __f03b         ; $eff5: f0 44     
            BPL __f014         ; $eff7: 10 1b     
            JSR __ef42         ; $eff9: 20 42 ef  
            BPL __f014         ; $effc: 10 16     
            LDA $03a6,x        ; $effe: bd a6 03  
            .hex c9            ; $f001: c9        Suspected data
__f002:     CPY #$d0           ; $f002: c0 d0     
            BPL __efaf         ; $f004: 10 a9     
            .hex 04 85         ; $f006: 04 85     Invalid Opcode - NOP $85
            INC $954a,x        ; $f008: fe 4a 95  
            STA ($a9),y        ; $f00b: 91 a9     
            BRK                ; $f00d: 00        
            STA $03d2,x        ; $f00e: 9d d2 03  
            STA $0382,x        ; $f011: 9d 82 03  
__f014:     RTS                ; $f014: 60        

;-------------------------------------------------------------------------------
            LDA $b2,x          ; $f015: b5 b2     
            STA $0386,x        ; $f017: 9d 86 03  
            LDA $bd,x          ; $f01a: b5 bd     
            STA $0382,x        ; $f01c: 9d 82 03  
            LDA #$c0           ; $f01f: a9 c0     
            STA $03a6,x        ; $f021: 9d a6 03  
            LDA __efe0,x       ; $f024: bd e0 ef  
            STA $48,x          ; $f027: 95 48     
            JSR __ef4e         ; $f029: 20 4e ef  
            JMP __ef7d         ; $f02c: 4c 7d ef  

;-------------------------------------------------------------------------------
__f02f:     ORA ($03,x)        ; $f02f: 01 03     
            ORA $03            ; $f031: 05 03     
            ORA $03            ; $f033: 05 03     
            ORA $07            ; $f035: 05 07     
            ORA $07            ; $f037: 05 07     
            ASL $07            ; $f039: 06 07     
__f03b:     LDA $0382,x        ; $f03b: bd 82 03  
            BEQ __f043         ; $f03e: f0 03     
            JMP __f0c9         ; $f040: 4c c9 f0  

;-------------------------------------------------------------------------------
__f043:     LDA $48,x          ; $f043: b5 48     
            BNE __f014         ; $f045: d0 cd     
            .hex b5            ; $f047: b5        Suspected data
__f048:     ASL $29,x          ; $f048: 16 29     
            ORA ($d0,x)        ; $f04a: 01 d0     
            .hex 02            ; $f04c: 02        Invalid Opcode - KIL 
            LDA #$ff           ; $f04d: a9 ff     
            STA $bd,x          ; $f04f: 95 bd     
            STA $9c,x          ; $f051: 95 9c     
            TXA                ; $f053: 8a        
            SEC                ; $f054: 38        
            SBC #$02           ; $f055: e9 02     
            STA $00            ; $f057: 85 00     
            LDA $90            ; $f059: a5 90     
            SEC                ; $f05b: 38        
            SBC #$04           ; $f05c: e9 04     
            ASL                ; $f05e: 0a        
            CLC                ; $f05f: 18        
            ADC $00            ; $f060: 65 00     
            TAY                ; $f062: a8        
            LDA __f02f,y       ; $f063: b9 2f f0  
            CPY #$0b           ; $f066: c0 0b     
            BNE __f075         ; $f068: d0 0b     
            CMP #$07           ; $f06a: c9 07     
            BNE __f075         ; $f06c: d0 07     
            LDA $19            ; $f06e: a5 19     
            AND #$01           ; $f070: 29 01     
            CLC                ; $f072: 18        
            ADC #$07           ; $f073: 69 07     
__f075:     CMP $0786          ; $f075: cd 86 07  
            BEQ __f07f         ; $f078: f0 05     
            CMP $0787          ; $f07a: cd 87 07  
            BNE __f092         ; $f07d: d0 13     
__f07f:     CLC                ; $f07f: 18        
            ADC #$01           ; $f080: 69 01     
            CMP $0786          ; $f082: cd 86 07  
            BEQ __f0c8         ; $f085: f0 41     
            CMP $0787          ; $f087: cd 87 07  
            BEQ __f0c8         ; $f08a: f0 3c     
            CMP $90            ; $f08c: c5 90     
            BEQ __f092         ; $f08e: f0 02     
            BCS __f0c8         ; $f090: b0 36     
__f092:     CMP #$09           ; $f092: c9 09     
            BCS __f0c8         ; $f094: b0 32     
            STA $00            ; $f096: 85 00     
            LDA $90            ; $f098: a5 90     
            SEC                ; $f09a: 38        
            SBC #$04           ; $f09b: e9 04     
            CMP $00            ; $f09d: c5 00     
            BCS __f0c8         ; $f09f: b0 27     
            LDA $00            ; $f0a1: a5 00     
            STA $b2,x          ; $f0a3: 95 b2     
            LDA #$ff           ; $f0a5: a9 ff     
            STA $91,x          ; $f0a7: 95 91     
            STA $03d2,x        ; $f0a9: 9d d2 03  
            LDA $56            ; $f0ac: a5 56     
            AND #$07           ; $f0ae: 29 07     
            TAY                ; $f0b0: a8        
            LDA __efe4,y       ; $f0b1: b9 e4 ef  
            STA $03a6,x        ; $f0b4: 9d a6 03  
            LDA #$40           ; $f0b7: a9 40     
            STA $03bc,x        ; $f0b9: 9d bc 03  
            LDA $b2,x          ; $f0bc: b5 b2     
            .hex 20 d5         ; $f0be: 20 d5     Suspected data
__f0c0:     SBC $a795          ; $f0c0: ed 95 a7  
            LDA __efe0,x       ; $f0c3: bd e0 ef  
            STA $48,x          ; $f0c6: 95 48     
__f0c8:     RTS                ; $f0c8: 60        

;-------------------------------------------------------------------------------
__f0c9:     STA $bd,x          ; $f0c9: 95 bd     
            STA $9c,x          ; $f0cb: 95 9c     
            LDA #$00           ; $f0cd: a9 00     
            STA $0382,x        ; $f0cf: 9d 82 03  
            STA $00            ; $f0d2: 85 00     
            LDA $0386,x        ; $f0d4: bd 86 03  
            JSR __f075         ; $f0d7: 20 75 f0  
            TXA                ; $f0da: 8a        
            PHA                ; $f0db: 48        
__f0dc:     LDA $91,x          ; $f0dc: b5 91     
            STA $94,x          ; $f0de: 95 94     
            LDA $03a6,x        ; $f0e0: bd a6 03  
            STA $03a9,x        ; $f0e3: 9d a9 03  
            TXA                ; $f0e6: 8a        
            CLC                ; $f0e7: 18        
            ADC #$0b           ; $f0e8: 69 0b     
            TAX                ; $f0ea: aa        
            CPX #$37           ; $f0eb: e0 37     
            BCC __f0dc         ; $f0ed: 90 ed     
            PLA                ; $f0ef: 68        
            TAX                ; $f0f0: aa        
            LDA #$0e           ; $f0f1: a9 0e     
            LDY $bd,x          ; $f0f3: b4 bd     
            BPL __f0f9         ; $f0f5: 10 02     
            LDA #$fa           ; $f0f7: a9 fa     
__f0f9:     CLC                ; $f0f9: 18        
            ADC $9c,x          ; $f0fa: 75 9c     
            STA $9f,x          ; $f0fc: 95 9f     
            LDA #$00           ; $f0fe: a9 00     
            STA $03b4,x        ; $f100: 9d b4 03  
            STA $03bf,x        ; $f103: 9d bf 03  
            RTS                ; $f106: 60        

;-------------------------------------------------------------------------------
__f107:     BPL __f117         ; $f107: 10 0e     
            .hex 0c 0c         ; $f109: 0c 0c     Suspected data
__f10b:     LDX #$02           ; $f10b: a2 02     
            LDA $59            ; $f10d: a5 59     
            CMP #$20           ; $f10f: c9 20     
            BCS __f11c         ; $f111: b0 09     
            LDX $56            ; $f113: a6 56     
            BEQ __f13a         ; $f115: f0 23     
__f117:     DEX                ; $f117: ca        
            BEQ __f11c         ; $f118: f0 02     
            LDX #$01           ; $f11a: a2 01     
__f11c:     TXA                ; $f11c: 8a        
            CLC                ; $f11d: 18        
            ADC #$18           ; $f11e: 69 18     
            ORA #$40           ; $f120: 09 40     
            STA $03f0,x        ; $f122: 9d f0 03  
            LDA $c5,x          ; $f125: b5 c5     
            ADC #$60           ; $f127: 69 60     
            STA $c5,x          ; $f129: 95 c5     
            LDA $99,x          ; $f12b: b5 99     
            CMP #$20           ; $f12d: c9 20     
            BEQ __f137         ; $f12f: f0 06     
            CLC                ; $f131: 18        
            ADC #$01           ; $f132: 69 01     
            JSR __f13b         ; $f134: 20 3b f1  
__f137:     DEX                ; $f137: ca        
            BPL __f11c         ; $f138: 10 e2     
__f13a:     RTS                ; $f13a: 60        

;-------------------------------------------------------------------------------
__f13b:     JSR __c728         ; $f13b: 20 28 c7  
            STA $48f1          ; $f13e: 8d f1 48  
            SBC ($96),y        ; $f141: f1 96     
            SBC ($56),y        ; $f143: f1 56     
            SBC ($50),y        ; $f145: f1 50     
            SBC ($de),y        ; $f147: f1 de     
            .hex cf 03 d0      ; $f149: cf 03 d0  Invalid Opcode - DCP __d003
            .hex 03 20         ; $f14c: 03 20     Invalid Opcode - SLO ($20,x)
            LDX $a9f1          ; $f14e: ae f1 a9  
            BRK                ; $f151: 00        
            STA $03f0,x        ; $f152: 9d f0 03  
            RTS                ; $f155: 60        

;-------------------------------------------------------------------------------
            DEC $03da,x        ; $f156: de da 03  
            BNE __f163         ; $f159: d0 08     
            LDA #$02           ; $f15b: a9 02     
            STA $fe            ; $f15d: 85 fe     
            LDA #$ff           ; $f15f: a9 ff     
            STA $99,x          ; $f161: 95 99     
__f163:     JSR __f222         ; $f163: 20 22 f2  
            BMI __f174         ; $f166: 30 0c     
            TXA                ; $f168: 8a        
            ASL                ; $f169: 0a        
            ASL                ; $f16a: 0a        
            ASL                ; $f16b: 0a        
            CLC                ; $f16c: 18        
            ADC #$08           ; $f16d: 69 08     
            ADC $0788,y        ; $f16f: 79 88 07  
            STA $a4,x          ; $f172: 95 a4     
__f174:     LDA $03da,x        ; $f174: bd da 03  
            ASL                ; $f177: 0a        
            ROL                ; $f178: 2a        
            ROL                ; $f179: 2a        
            AND #$03           ; $f17a: 29 03     
            TAY                ; $f17c: a8        
            LDA __f107,y       ; $f17d: b9 07 f1  
            STA $03e5,x        ; $f180: 9d e5 03  
            LDA $af,x          ; $f183: b5 af     
            AND #$f8           ; $f185: 29 f8     
            STA $af,x          ; $f187: 95 af     
            JSR __f1f3         ; $f189: 20 f3 f1  
__f18c:     RTS                ; $f18c: 60        

;-------------------------------------------------------------------------------
            LDA #$02           ; $f18d: a9 02     
            JSR __f215         ; $f18f: 20 15 f2  
            CMP #$f0           ; $f192: c9 f0     
            BCC __f18c         ; $f194: 90 f6     
__f196:     LDA $03f0,x        ; $f196: bd f0 03  
            ORA #$80           ; $f199: 09 80     
            STA $03f0,x        ; $f19b: 9d f0 03  
__f19e:     JSR __f7ab         ; $f19e: 20 ab f7  
            ASL                ; $f1a1: 0a        
            ASL                ; $f1a2: 0a        
            STA $03cf,x        ; $f1a3: 9d cf 03  
            LDA #$00           ; $f1a6: a9 00     
            STA $03da,x        ; $f1a8: 9d da 03  
__f1ab:     RTS                ; $f1ab: 60        

;-------------------------------------------------------------------------------
            .hex 07 03         ; $f1ac: 07 03     Invalid Opcode - SLO $03
            LDA $92            ; $f1ae: a5 92     
            ORA $7c            ; $f1b0: 05 7c     
            BNE __f196         ; $f1b2: d0 e2     
            LDA $18,x          ; $f1b4: b5 18     
            AND #$f8           ; $f1b6: 29 f8     
            CMP #$38           ; $f1b8: c9 38     
            BCC __f1c3         ; $f1ba: 90 07     
            CMP #$c9           ; $f1bc: c9 c9     
            BCC __f1c5         ; $f1be: 90 05     
            SBC #$38           ; $f1c0: e9 38     
            .hex 2c            ; $f1c2: 2c        Suspected data
__f1c3:     ADC #$38           ; $f1c3: 69 38     
__f1c5:     CMP $a4            ; $f1c5: c5 a4     
            BEQ __f21d         ; $f1c7: f0 54     
            CMP $a5            ; $f1c9: c5 a5     
            BEQ __f21d         ; $f1cb: f0 50     
            CMP $a6            ; $f1cd: c5 a6     
            BEQ __f21d         ; $f1cf: f0 4c     
            STA $a4,x          ; $f1d1: 95 a4     
            LDA $90            ; $f1d3: a5 90     
            TAY                ; $f1d5: a8        
            DEY                ; $f1d6: 88        
            DEY                ; $f1d7: 88        
            SEC                ; $f1d8: 38        
            SBC #$08           ; $f1d9: e9 08     
            BEQ __f1e3         ; $f1db: f0 06     
            BPL __f1e7         ; $f1dd: 10 08     
            LDA #$20           ; $f1df: a9 20     
            INY                ; $f1e1: c8        
            .hex 2c            ; $f1e2: 2c        Suspected data
__f1e3:     LDA #$50           ; $f1e3: a9 50     
            INY                ; $f1e5: c8        
            .hex 2c            ; $f1e6: 2c        Suspected data
__f1e7:     LDA #$80           ; $f1e7: a9 80     
            STA $af,x          ; $f1e9: 95 af     
            INY                ; $f1eb: c8        
            TYA                ; $f1ec: 98        
            STA $ba,x          ; $f1ed: 95 ba     
            LDA #$02           ; $f1ef: a9 02     
            STA $99,x          ; $f1f1: 95 99     
__f1f3:     JSR __f222         ; $f1f3: 20 22 f2  
            BPL __f221         ; $f1f6: 10 29     
            TXA                ; $f1f8: 8a        
            PHA                ; $f1f9: 48        
            LDA $a4,x          ; $f1fa: b5 a4     
            STA $0e            ; $f1fc: 85 0e     
            LDA $ba,x          ; $f1fe: b5 ba     
            STA $0f            ; $f200: 85 0f     
            JSR __deb9         ; $f202: 20 b9 de  
            TAY                ; $f205: a8        
            BMI __f21b         ; $f206: 30 13     
            PLA                ; $f208: 68        
            TAX                ; $f209: aa        
            LDY $02            ; $f20a: a4 02     
            BMI __f221         ; $f20c: 30 13     
            CPY #$04           ; $f20e: c0 04     
            BEQ __f21d         ; $f210: f0 0b     
            LDA __f1ab,y       ; $f212: b9 ab f1  
__f215:     CLC                ; $f215: 18        
            ADC $af,x          ; $f216: 75 af     
            STA $af,x          ; $f218: 95 af     
            RTS                ; $f21a: 60        

;-------------------------------------------------------------------------------
__f21b:     PLA                ; $f21b: 68        
            TAX                ; $f21c: aa        
__f21d:     LDA #$01           ; $f21d: a9 01     
            STA $99,x          ; $f21f: 95 99     
__f221:     RTS                ; $f221: 60        

;-------------------------------------------------------------------------------
__f222:     LDY #$01           ; $f222: a0 01     
            LDA $ba,x          ; $f224: b5 ba     
__f226:     CMP $0786,y        ; $f226: d9 86 07  
            BEQ __f22e         ; $f229: f0 03     
            DEY                ; $f22b: 88        
            BPL __f226         ; $f22c: 10 f8     
__f22e:     RTS                ; $f22e: 60        

;-------------------------------------------------------------------------------
__f22f:     ASL $3839          ; $f22f: 0e 39 38  
            .hex 37 36         ; $f232: 37 36     Invalid Opcode - RLA $36,x
            .hex 1b 1a 19      ; $f234: 1b 1a 19  Invalid Opcode - SLO $191a,y
            CLC                ; $f237: 18        
__f238:     SEC                ; $f238: 38        
            .hex 34 5b         ; $f239: 34 5b     Invalid Opcode - NOP $5b,x
            .hex 5a            ; $f23b: 5a        Invalid Opcode - NOP 
            .hex 93 91         ; $f23c: 93 91     Invalid Opcode - AHX ($91),y
            SEC                ; $f23e: 38        
            SEC                ; $f23f: 38        
            STA ($3a),y        ; $f240: 91 3a     
            .hex 33 36         ; $f242: 33 36     Invalid Opcode - RLA ($36),y
            AND $4d38,x        ; $f244: 3d 38 4d  
            .hex 53 53         ; $f247: 53 53     Invalid Opcode - SRE ($53),y
            .hex 53 53         ; $f249: 53 53     Invalid Opcode - SRE ($53),y
            LDA #$af           ; $f24b: a9 af     
            .hex 3a            ; $f24d: 3a        Invalid Opcode - NOP 
            .hex 3b 3c 3d      ; $f24e: 3b 3c 3d  Invalid Opcode - RLA $3d3c,y
            LDA $af,x          ; $f251: b5 af     
            .hex 04 00         ; $f253: 04 00     Invalid Opcode - NOP $00
            EOR $b500,x        ; $f255: 5d 00 b5  
            .hex bb c1 c1      ; $f258: bb c1 c1  Invalid Opcode - LAS __c1c1,y
            CMP ($c1,x)        ; $f25b: c1 c1     
            .hex c7            ; $f25d: c7        Suspected data
__f25e:     ORA $1913          ; $f25e: 0d 13 19  
            .hex 1f 25 13      ; $f261: 1f 25 13  Invalid Opcode - SLO $1325,x
            ORA $251f,y        ; $f264: 19 1f 25  
__f267:     ORA ($01,x)        ; $f267: 01 01     
            ORA ($01,x)        ; $f269: 01 01     
            ORA $05            ; $f26b: 05 05     
            ORA $09            ; $f26d: 05 09     
            .hex 0b 0c         ; $f26f: 0b 0c     Invalid Opcode - ANC #$0c
            .hex 0f 10 11      ; $f271: 0f 10 11  Invalid Opcode - SLO $1110
            .hex 13 15         ; $f274: 13 15     Invalid Opcode - SLO ($15),y
            ASL $1a,x          ; $f276: 16 1a     
            .hex 1a            ; $f278: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f279: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f27a: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f27b: 1a        Invalid Opcode - NOP 
            .hex 1a            ; $f27c: 1a        Invalid Opcode - NOP 
            .hex 1b 1b 1e      ; $f27d: 1b 1b 1e  Invalid Opcode - SLO $1e1b,y
            .hex 1f 1f 20      ; $f280: 1f 1f 20  Invalid Opcode - SLO $201f,x
            AND ($21,x)        ; $f283: 21 21     
            BIT $24            ; $f285: 24 24     
            BIT $24            ; $f287: 24 24     
            ROL $29            ; $f289: 26 29     
            ROL                ; $f28b: 2a        
            ROL $2e2e          ; $f28c: 2e 2e 2e  
            .hex 2e 00         ; $f28f: 2e 00     Suspected data
__f291:     LDA ($a9,x)        ; $f291: a1 a9     
            LDA ($d9),y        ; $f293: b1 d9     
            ROR $ad            ; $f295: 66 ad     
            ROR $74,x          ; $f297: 76 74     
            ROR                ; $f299: 6a        
            ROR                ; $f29a: 6a        
            .hex 72            ; $f29b: 72        Invalid Opcode - KIL 
            .hex 72            ; $f29c: 72        Invalid Opcode - KIL 
            CMP $74            ; $f29d: c5 74     
            EOR $ac,x          ; $f29f: 55 ac     
            TAX                ; $f2a1: aa        
            BCS __f30b         ; $f2a2: b0 67     
            EOR $7752          ; $f2a4: 4d 52 77  
            ROR $f2            ; $f2a7: 66 f2     
            STY $6f69          ; $f2a9: 8c 69 6f  
            BVS __f31c         ; $f2ac: 70 6e     
            PHA                ; $f2ae: 48        
            PHA                ; $f2af: 48        
            LSR                ; $f2b0: 4a        
            ADC ($53),y        ; $f2b1: 71 53     
            JMP $ad6e          ; $f2b3: 4c 6e ad  

;-------------------------------------------------------------------------------
            .hex 0c 51 a6      ; $f2b6: 0c 51 a6  Invalid Opcode - NOP $a651
            .hex b4            ; $f2b9: b4        Suspected data
__f2ba:     .hex ff ff ff      ; $f2ba: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2bd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 1b 0a      ; $f2c0: ff 1b 0a  Invalid Opcode - ISC $0a1b,x
            EOR ($0b,x)        ; $f2c3: 41 0b     
            .hex d4 9e         ; $f2c5: d4 9e     Invalid Opcode - NOP $9e,x
            .hex 02            ; $f2c7: 02        Invalid Opcode - KIL 
            DEY                ; $f2c8: 88        
            CLD                ; $f2c9: d8        
            .hex 02            ; $f2ca: 02        Invalid Opcode - KIL 
__f2cb:     .hex 02            ; $f2cb: 02        Invalid Opcode - KIL 
            .hex 04 04         ; $f2cc: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $f2ce: 04 04     Invalid Opcode - NOP $04
            BPL __f2e2         ; $f2d0: 10 10     
            ORA ($40,x)        ; $f2d2: 01 40     
            RTS                ; $f2d4: 60        

;-------------------------------------------------------------------------------
            .hex 80 02         ; $f2d5: 80 02     Invalid Opcode - NOP #$02
            .hex 80 20         ; $f2d7: 80 20     Invalid Opcode - NOP #$20
            .hex 2b 09         ; $f2d9: 2b 09     Invalid Opcode - ANC #$09
            LDX #$80           ; $f2db: a2 80     
            TYA                ; $f2dd: 98        
            LSR $a8            ; $f2de: 46 a8     
            PLP                ; $f2e0: 28        
            .hex ff            ; $f2e1: ff        Suspected data
__f2e2:     .hex ff ff         ; $f2e2: ff ff     Suspected data
__f2e4:     SBC $38            ; $f2e4: e5 38     
            SEC                ; $f2e6: 38        
            CMP $3838,y        ; $f2e7: d9 38 38  
            .hex df 38         ; $f2ea: df 38     Suspected data
__f2ec:     LDA $52            ; $f2ec: a5 52     
            ORA $0300          ; $f2ee: 0d 00 03  
            BNE __f35a         ; $f2f1: d0 67     
            LDA $8d            ; $f2f3: a5 8d     
            TAY                ; $f2f5: a8        
            BEQ __f35a         ; $f2f6: f0 62     
            CMP #$01           ; $f2f8: c9 01     
            BEQ __f305         ; $f2fa: f0 09     
            CMP #$3e           ; $f2fc: c9 3e     
            BCC __f32e         ; $f2fe: 90 2e     
            LDA #$00           ; $f300: a9 00     
            STA $8d            ; $f302: 85 8d     
            RTS                ; $f304: 60        

;-------------------------------------------------------------------------------
__f305:     LDA #$ff           ; $f305: a9 ff     
            LDX #$77           ; $f307: a2 77     
__f309:     .hex 9d 68         ; $f309: 9d 68     Suspected data
__f30b:     ASL $ca            ; $f30b: 06 ca     
            BPL __f309         ; $f30d: 10 fa     
            LDA #$00           ; $f30f: a9 00     
            STA $0346          ; $f311: 8d 46 03  
            STA $0347          ; $f314: 8d 47 03  
            LDA #$d8           ; $f317: a9 d8     
            STA $034a          ; $f319: 8d 4a 03  
__f31c:     JSR __f45b         ; $f31c: 20 5b f4  
            LDA $59            ; $f31f: a5 59     
            AND #$07           ; $f321: 29 07     
            TAX                ; $f323: aa        
            LDA #$00           ; $f324: a9 00     
            SEC                ; $f326: 38        
__f327:     ROR                ; $f327: 6a        
            DEX                ; $f328: ca        
            BPL __f327         ; $f329: 10 fc     
            STA $0345          ; $f32b: 8d 45 03  
__f32e:     JSR __f35b         ; $f32e: 20 5b f3  
            JSR __f3d2         ; $f331: 20 d2 f3  
            INC $8d            ; $f334: e6 8d     
            LDA $8d            ; $f336: a5 8d     
            LDX #$08           ; $f338: a2 08     
__f33a:     CMP __f22f,x       ; $f33a: dd 2f f2  
            BEQ __f343         ; $f33d: f0 04     
            DEX                ; $f33f: ca        
            BPL __f33a         ; $f340: 10 f8     
            RTS                ; $f342: 60        

;-------------------------------------------------------------------------------
__f343:     LDY #$15           ; $f343: a0 15     
            TXA                ; $f345: 8a        
            BEQ __f34a         ; $f346: f0 02     
            LDY #$06           ; $f348: a0 06     
__f34a:     LDA __f25e,x       ; $f34a: bd 5e f2  
            TAX                ; $f34d: aa        
__f34e:     LDA __f238,x       ; $f34e: bd 38 f2  
            STA $0305,y        ; $f351: 99 05 03  
            DEX                ; $f354: ca        
            BMI __f35a         ; $f355: 30 03     
            DEY                ; $f357: 88        
            BNE __f34e         ; $f358: d0 f4     
__f35a:     RTS                ; $f35a: 60        

;-------------------------------------------------------------------------------
__f35b:     LDA #$38           ; $f35b: a9 38     
            BIT $90a9          ; $f35d: 2c a9 90  
            LDY #$1f           ; $f360: a0 1f     
__f362:     STA $0304,y        ; $f362: 99 04 03  
            DEY                ; $f365: 88        
            BPL __f362         ; $f366: 10 fa     
            LDA #$23           ; $f368: a9 23     
            STA $0300          ; $f36a: 8d 00 03  
            LDA $0349          ; $f36d: ad 49 03  
            STA $0301          ; $f370: 8d 01 03  
            LDA $0348          ; $f373: ad 48 03  
            STA $0302          ; $f376: 8d 02 03  
            LDA #$20           ; $f379: a9 20     
            STA $0303          ; $f37b: 8d 03 03  
            LDA #$00           ; $f37e: a9 00     
            STA $0324          ; $f380: 8d 24 03  
            LDY $8d            ; $f383: a4 8d     
            CPY #$2e           ; $f385: c0 2e     
            BCS __f3d1         ; $f387: b0 48     
            DEY                ; $f389: 88        
            TYA                ; $f38a: 98        
            LDY #$00           ; $f38b: a0 00     
__f38d:     SEC                ; $f38d: 38        
            SBC #$07           ; $f38e: e9 07     
            BCC __f395         ; $f390: 90 03     
            INY                ; $f392: c8        
            BCS __f38d         ; $f393: b0 f8     
__f395:     TYA                ; $f395: 98        
            STA $00            ; $f396: 85 00     
            EOR #$ff           ; $f398: 49 ff     
            SEC                ; $f39a: 38        
            ADC #$1d           ; $f39b: 69 1d     
            PHA                ; $f39d: 48        
            TAY                ; $f39e: a8        
__f39f:     LDX #$04           ; $f39f: a2 04     
__f3a1:     ROL $19,x          ; $f3a1: 36 19     
            DEX                ; $f3a3: ca        
            BPL __f3a1         ; $f3a4: 10 fb     
            LDA $19            ; $f3a6: a5 19     
            AND #$07           ; $f3a8: 29 07     
            TAX                ; $f3aa: aa        
            LDA __f2e4,x       ; $f3ab: bd e4 f2  
            STA $0304,y        ; $f3ae: 99 04 03  
            DEY                ; $f3b1: 88        
            CPY $00            ; $f3b2: c4 00     
            BNE __f39f         ; $f3b4: d0 e9     
            PLA                ; $f3b6: 68        
            TAY                ; $f3b7: a8        
            JSR __f3bd         ; $f3b8: 20 bd f3  
            LDY $00            ; $f3bb: a4 00     
__f3bd:     LDA $8d            ; $f3bd: a5 8d     
            AND #$01           ; $f3bf: 29 01     
            BNE __f3c6         ; $f3c1: d0 03     
            LDA #$55           ; $f3c3: a9 55     
            .hex 2c            ; $f3c5: 2c        Suspected data
__f3c6:     LDA #$58           ; $f3c6: a9 58     
            STA $0304,y        ; $f3c8: 99 04 03  
            STA $0305,y        ; $f3cb: 99 05 03  
            STA $0306,y        ; $f3ce: 99 06 03  
__f3d1:     RTS                ; $f3d1: 60        

;-------------------------------------------------------------------------------
__f3d2:     LDY $0346          ; $f3d2: ac 46 03  
            LDA __f2ba,y       ; $f3d5: b9 ba f2  
            AND $0345          ; $f3d8: 2d 45 03  
            BEQ __f430         ; $f3db: f0 53     
            LDA __f267,y       ; $f3dd: b9 67 f2  
            CMP $8d            ; $f3e0: c5 8d     
            BNE __f436         ; $f3e2: d0 52     
            LDA __f291,y       ; $f3e4: b9 91 f2  
            PHA                ; $f3e7: 48        
            AND #$1f           ; $f3e8: 29 1f     
            TAY                ; $f3ea: a8        
            PLA                ; $f3eb: 68        
            LSR                ; $f3ec: 4a        
            LSR                ; $f3ed: 4a        
            LSR                ; $f3ee: 4a        
            LSR                ; $f3ef: 4a        
            LSR                ; $f3f0: 4a        
            TAX                ; $f3f1: aa        
            STY $00            ; $f3f2: 84 00     
            STX $01            ; $f3f4: 86 01     
            LDA #$eb           ; $f3f6: a9 eb     
__f3f8:     STA $0304,y        ; $f3f8: 99 04 03  
            INY                ; $f3fb: c8        
            DEX                ; $f3fc: ca        
            BPL __f3f8         ; $f3fd: 10 f9     
            LDY $0347          ; $f3ff: ac 47 03  
            LDA $00            ; $f402: a5 00     
            PHA                ; $f404: 48        
            ASL                ; $f405: 0a        
            ASL                ; $f406: 0a        
            ASL                ; $f407: 0a        
            STA $0668,y        ; $f408: 99 68 06  
            PLA                ; $f40b: 68        
            SEC                ; $f40c: 38        
            ADC $01            ; $f40d: 65 01     
            ASL                ; $f40f: 0a        
            ASL                ; $f410: 0a        
            ASL                ; $f411: 0a        
            STA $0686,y        ; $f412: 99 86 06  
            LDA $034a          ; $f415: ad 4a 03  
            STA $06a4,y        ; $f418: 99 a4 06  
            CLC                ; $f41b: 18        
            ADC #$03           ; $f41c: 69 03     
            STA $06c2,y        ; $f41e: 99 c2 06  
            LDA #$00           ; $f421: a9 00     
            LDX #$1d           ; $f423: a2 1d     
            CPX $8d            ; $f425: e4 8d     
            BCC __f42a         ; $f427: 90 01     
            ROL                ; $f429: 2a        
__f42a:     STA $06e0,y        ; $f42a: 99 e0 06  
            INC $0347          ; $f42d: ee 47 03  
__f430:     INC $0346          ; $f430: ee 46 03  
            JMP __f3d2         ; $f433: 4c d2 f3  

;-------------------------------------------------------------------------------
__f436:     LDA $034a          ; $f436: ad 4a 03  
            SEC                ; $f439: 38        
            SBC #$08           ; $f43a: e9 08     
            STA $034a          ; $f43c: 8d 4a 03  
            LDA $0348          ; $f43f: ad 48 03  
            SEC                ; $f442: 38        
            SBC #$20           ; $f443: e9 20     
            STA $0348          ; $f445: 8d 48 03  
            LDA $0349          ; $f448: ad 49 03  
            SBC #$00           ; $f44b: e9 00     
            STA $0349          ; $f44d: 8d 49 03  
            CMP #$1f           ; $f450: c9 1f     
            BEQ __f45b         ; $f452: f0 07     
            CMP #$27           ; $f454: c9 27     
            BNE __f465         ; $f456: d0 0d     
            LDA #$23           ; $f458: a9 23     
            .hex 2c            ; $f45a: 2c        Suspected data
__f45b:     LDA #$2b           ; $f45b: a9 2b     
            STA $0349          ; $f45d: 8d 49 03  
            LDA #$a0           ; $f460: a9 a0     
            STA $0348          ; $f462: 8d 48 03  
__f465:     RTS                ; $f465: 60        

;-------------------------------------------------------------------------------
__f466:     INC $38f4          ; $f466: ee f4 38  
            INX                ; $f469: e8        
__f46a:     .hex 20 90         ; $f46a: 20 90     Suspected data
__f46c:     ASL $1000,x        ; $f46c: 1e 00 10  
__f46f:     BRK                ; $f46f: 00        
            .hex 24            ; $f470: 24        Suspected data
__f471:     LDX $58            ; $f471: a6 58     
            LDA $84            ; $f473: a5 84     
            BNE __f499         ; $f475: d0 22     
__f477:     LDY #$00           ; $f477: a0 00     
            STY $6c,x          ; $f479: 94 6c     
            INY                ; $f47b: c8        
            STY $e4,x          ; $f47c: 94 e4     
            INY                ; $f47e: c8        
            STY $6a,x          ; $f47f: 94 6a     
            LDA #$f0           ; $f481: a9 f0     
            STA $e2,x          ; $f483: 95 e2     
            LDA #$3f           ; $f485: a9 3f     
            STA $66,x          ; $f487: 95 66     
            DEX                ; $f489: ca        
            BPL __f477         ; $f48a: 10 eb     
            LDX $1e            ; $f48c: a6 1e     
            BEQ __f494         ; $f48e: f0 04     
            LDA #$00           ; $f490: a9 00     
            STA $69,x          ; $f492: 95 69     
__f494:     INC $84            ; $f494: e6 84     
            JMP __f63b         ; $f496: 4c 3b f6  

;-------------------------------------------------------------------------------
__f499:     LDA $37,x          ; $f499: b5 37     
            BNE __f4a0         ; $f49b: d0 03     
            JSR __f504         ; $f49d: 20 04 f5  
__f4a0:     LDA $66,x          ; $f4a0: b5 66     
            STA $01            ; $f4a2: 85 01     
            LDA $6a,x          ; $f4a4: b5 6a     
            ORA $6c,x          ; $f4a6: 15 6c     
            PHA                ; $f4a8: 48        
            CMP #$01           ; $f4a9: c9 01     
            BNE __f4c9         ; $f4ab: d0 1c     
            LDA $01            ; $f4ad: a5 01     
            CMP #$3f           ; $f4af: c9 3f     
            BNE __f4b7         ; $f4b1: d0 04     
            LDA #$04           ; $f4b3: a9 04     
            STA $ff            ; $f4b5: 85 ff     
__f4b7:     LDA #$00           ; $f4b7: a9 00     
            STA $2f,x          ; $f4b9: 95 2f     
            TXA                ; $f4bb: 8a        
            JSR __c83d         ; $f4bc: 20 3d c8  
            LDA $01            ; $f4bf: a5 01     
            CMP #$3f           ; $f4c1: c9 3f     
            BCC __f4c7         ; $f4c3: 90 02     
            LDA #$3f           ; $f4c5: a9 3f     
__f4c7:     STA $66,x          ; $f4c7: 95 66     
__f4c9:     PLA                ; $f4c9: 68        
            PHA                ; $f4ca: 48        
            TAY                ; $f4cb: a8        
            LDA __f466,y       ; $f4cc: b9 66 f4  
            STA $02            ; $f4cf: 85 02     
            LDA __f46a,x       ; $f4d1: bd 6a f4  
            STA $00            ; $f4d4: 85 00     
            STA $0e            ; $f4d6: 85 0e     
            LDA #$00           ; $f4d8: a9 00     
            STA $0f            ; $f4da: 85 0f     
            TXA                ; $f4dc: 8a        
            PHA                ; $f4dd: 48        
            TAY                ; $f4de: a8        
            INY                ; $f4df: c8        
            JSR __eafc         ; $f4e0: 20 fc ea  
            PLA                ; $f4e3: 68        
            TAX                ; $f4e4: aa        
            PLA                ; $f4e5: 68        
            CMP #$01           ; $f4e6: c9 01     
            BNE __f500         ; $f4e8: d0 16     
            LDA __f46f,x       ; $f4ea: bd 6f f4  
            TAY                ; $f4ed: a8        
            LDA $0203,y        ; $f4ee: b9 03 02  
            CLC                ; $f4f1: 18        
            ADC #$08           ; $f4f2: 69 08     
            STA $0203,y        ; $f4f4: 99 03 02  
            LDA $020f,y        ; $f4f7: b9 0f 02  
            CLC                ; $f4fa: 18        
            ADC #$08           ; $f4fb: 69 08     
            STA $020f,y        ; $f4fd: 99 0f 02  
__f500:     DEX                ; $f500: ca        
            BPL __f499         ; $f501: 10 96     
            RTS                ; $f503: 60        

;-------------------------------------------------------------------------------
__f504:     LDY $6a,x          ; $f504: b4 6a     
            LDA __f46c,y       ; $f506: b9 6c f4  
            STA $37,x          ; $f509: 95 37     
            LDA $6c,x          ; $f50b: b5 6c     
            EOR #$01           ; $f50d: 49 01     
            STA $6c,x          ; $f50f: 95 6c     
            BNE __f517         ; $f511: d0 04     
            LDA #$08           ; $f513: a9 08     
            STA $ff            ; $f515: 85 ff     
__f517:     LDA #$00           ; $f517: a9 00     
            STA $e0,x          ; $f519: 95 e0     
__f51b:     RTS                ; $f51b: 60        

;-------------------------------------------------------------------------------
            .hex 20 89         ; $f51c: 20 89     Suspected data
__f51e:     STY $3b,x          ; $f51e: 94 3b     
            .hex 5a            ; $f520: 5a        Invalid Opcode - NOP 
            .hex 5a            ; $f521: 5a        Invalid Opcode - NOP 
            .hex 3d 8e         ; $f522: 3d 8e     Suspected data
__f524:     LDX $1e            ; $f524: a6 1e     
            BEQ __f537         ; $f526: f0 0f     
            LDY __f51b,x       ; $f528: bc 1b f5  
            LDX #$05           ; $f52b: a2 05     
__f52d:     LDA __f51e,x       ; $f52d: bd 1e f5  
            STA $0400,y        ; $f530: 99 00 04  
            DEY                ; $f533: 88        
            DEX                ; $f534: ca        
            BPL __f52d         ; $f535: 10 f6     
__f537:     RTS                ; $f537: 60        

;-------------------------------------------------------------------------------
__f538:     .hex 22            ; $f538: 22        Invalid Opcode - KIL 
            .hex 93 02         ; $f539: 93 02     Invalid Opcode - AHX ($02),y
            JSR $0273          ; $f53b: 20 73 02  
__f53e:     LDY $59            ; $f53e: a4 59     
            DEY                ; $f540: 88        
            LDA $14            ; $f541: a5 14     
            AND #$0f           ; $f543: 29 0f     
            BEQ __f560         ; $f545: f0 19     
            AND #$05           ; $f547: 29 05     
            BEQ __f54d         ; $f549: f0 02     
            INY                ; $f54b: c8        
            INY                ; $f54c: c8        
__f54d:     TYA                ; $f54d: 98        
            AND #$1f           ; $f54e: 29 1f     
            LDY $37            ; $f550: a4 37     
            BNE __f562         ; $f552: d0 0e     
            STA $59            ; $f554: 85 59     
            LDA #$80           ; $f556: a9 80     
            STA $4e            ; $f558: 85 4e     
            LDA #$08           ; $f55a: a9 08     
            STA $fe            ; $f55c: 85 fe     
            LDA #$0f           ; $f55e: a9 0f     
__f560:     STA $37            ; $f560: 85 37     
__f562:     LDY #$02           ; $f562: a0 02     
__f564:     LDX #$02           ; $f564: a2 02     
__f566:     LDA __f538,y       ; $f566: b9 38 f5  
            STA $0301,x        ; $f569: 9d 01 03  
            DEY                ; $f56c: 88        
            DEX                ; $f56d: ca        
            BPL __f566         ; $f56e: 10 f6     
            INX                ; $f570: e8        
            STX $0306          ; $f571: 8e 06 03  
            LDY $59            ; $f574: a4 59     
            INY                ; $f576: c8        
            TYA                ; $f577: 98        
            .hex 20 4a         ; $f578: 20 4a     Suspected data
__f57a:     NOP                ; $f57a: ea        
            STY $0304          ; $f57b: 8c 04 03  
            STA $0305          ; $f57e: 8d 05 03  
__f581:     RTS                ; $f581: 60        

;-------------------------------------------------------------------------------
            BRK                ; $f582: 00        
__f583:     ORA $00            ; $f583: 05 00     
            .hex 0e            ; $f585: 0e        Suspected data
__f586:     LDX $1e            ; $f586: a6 1e     
            BEQ __f5c4         ; $f588: f0 3a     
            LDA #$21           ; $f58a: a9 21     
            STA $0301          ; $f58c: 8d 01 03  
            LDA #$48           ; $f58f: a9 48     
            CLC                ; $f591: 18        
            ADC __f583,x       ; $f592: 7d 83 f5  
            STA $0302          ; $f595: 8d 02 03  
            LDA #$05           ; $f598: a9 05     
            STA $0303          ; $f59a: 8d 03 03  
            JSR __ea55         ; $f59d: 20 55 ea  
            LDX $1e            ; $f5a0: a6 1e     
            LDY __f581,x       ; $f5a2: bc 81 f5  
            STA $0360,y        ; $f5a5: 99 60 03  
            JSR __ea4a         ; $f5a8: 20 4a ea  
            CPY #$00           ; $f5ab: c0 00     
            BNE __f5b1         ; $f5ad: d0 02     
            LDY #$38           ; $f5af: a0 38     
__f5b1:     STY $0304          ; $f5b1: 8c 04 03  
            STA $0305          ; $f5b4: 8d 05 03  
            LDX #$03           ; $f5b7: a2 03     
            LDA #$00           ; $f5b9: a9 00     
__f5bb:     STA $0306,x        ; $f5bb: 9d 06 03  
            DEX                ; $f5be: ca        
            BPL __f5bb         ; $f5bf: 10 fa     
            JSR __c14e         ; $f5c1: 20 4e c1  
__f5c4:     LDY #$05           ; $f5c4: a0 05     
            JMP __f564         ; $f5c6: 4c 64 f5  

;-------------------------------------------------------------------------------
__f5c9:     .hex 52            ; $f5c9: 52        Invalid Opcode - KIL 
            BVS __f57a         ; $f5ca: 70 ae     
            LDX $ba,y          ; $f5cc: b6 ba     
            .hex c2 c6         ; $f5ce: c2 c6     Invalid Opcode - NOP #$c6
            DEX                ; $f5d0: ca        
            .hex be fa         ; $f5d1: be fa     Suspected data
__f5d3:     BMI __f5e8         ; $f5d3: 30 13     
            ORA ($30,x)        ; $f5d5: 01 30     
            ASL $19,x          ; $f5d7: 16 19     
            BMI __f614         ; $f5d9: 30 39     
            AND #$30           ; $f5db: 29 30     
            .hex 3a            ; $f5dd: 3a        Invalid Opcode - NOP 
            .hex 1a            ; $f5de: 1a        Invalid Opcode - NOP 
            AND #$26           ; $f5df: 29 26     
            .hex 07 30         ; $f5e1: 07 30     Invalid Opcode - SLO $30
            ASL $19,x          ; $f5e3: 16 19     
            BMI __f5fd         ; $f5e5: 30 16     
            .hex 26            ; $f5e7: 26        Suspected data
__f5e8:     BMI __f601         ; $f5e8: 30 17     
            AND #$30           ; $f5ea: 29 30     
            .hex 17 06         ; $f5ec: 17 06     Invalid Opcode - SLO $06,x
            BMI __f607         ; $f5ee: 30 17     
            ASL $30            ; $f5f0: 06 30     
            ASL $27,x          ; $f5f2: 16 27     
            BMI __f607         ; $f5f4: 30 11     
            ROL $30            ; $f5f6: 26 30     
            .hex 15            ; $f5f8: 15        Suspected data
__f5f9:     ROL $30            ; $f5f9: 26 30     
            AND ($26,x)        ; $f5fb: 21 26     
__f5fd:     BMI __f624         ; $f5fd: 30 25     
            ROL $27            ; $f5ff: 26 27     
__f601:     .hex 17 07         ; $f601: 17 07     Invalid Opcode - SLO $07,x
            CLC                ; $f603: 18        
__f604:     BPL __f61a         ; $f604: 10 14     
            .hex 10            ; $f606: 10        Suspected data
__f607:     .hex 14 1c         ; $f607: 14 1c     Invalid Opcode - NOP $1c,x
__f609:     .hex 3f 1c 04      ; $f609: 3f 1c 04  Invalid Opcode - RLA $041c,x
            .hex 0f f0 f0      ; $f60c: 0f f0 f0  Invalid Opcode - SLO __f0f0
__f60f:     JSR __f63b         ; $f60f: 20 3b f6  
            LDA $55            ; $f612: a5 55     
__f614:     AND #$01           ; $f614: 29 01     
            EOR $51            ; $f616: 45 51     
            TAX                ; $f618: aa        
            .hex bd            ; $f619: bd        Suspected data
__f61a:     .hex 0d f6         ; $f61a: 0d f6     Suspected data
__f61c:     STA $05fd          ; $f61c: 8d fd 05  
            LDA #$78           ; $f61f: a9 78     
            STA $05fc          ; $f621: 8d fc 05  
__f624:     LDX #$02           ; $f624: a2 02     
__f626:     LDA $05fc,x        ; $f626: bd fc 05  
            STA $00,x          ; $f629: 95 00     
            DEX                ; $f62b: ca        
            BPL __f626         ; $f62c: 10 f8     
            LDY #$0d           ; $f62e: a0 0d     
__f630:     LDA $d5            ; $f630: a5 d5     
            STA $0f            ; $f632: 85 0f     
            LDA #$01           ; $f634: a9 01     
            STA $0e            ; $f636: 85 0e     
            JMP __eafc         ; $f638: 4c fc ea  

;-------------------------------------------------------------------------------
__f63b:     LDA $56            ; $f63b: a5 56     
__f63d:     CMP #$0a           ; $f63d: c9 0a     
            BCC __f645         ; $f63f: 90 04     
            SBC #$0a           ; $f641: e9 0a     
            BCS __f63d         ; $f643: b0 f8     
__f645:     TAX                ; $f645: aa        
            LDA __f5c9,x       ; $f646: bd c9 f5  
            STA $05fe          ; $f649: 8d fe 05  
__f64c:     STX $0f            ; $f64c: 86 0f     
            TXA                ; $f64e: 8a        
            ASL                ; $f64f: 0a        
            CLC                ; $f650: 18        
            ADC $0f            ; $f651: 65 0f     
            TAY                ; $f653: a8        
            LDX $0300          ; $f654: ae 00 03  
            LDA #$00           ; $f657: a9 00     
            STA $0308,x        ; $f659: 9d 08 03  
            LDA #$03           ; $f65c: a9 03     
            STA $00            ; $f65e: 85 00     
__f660:     LDA __f5d3,y       ; $f660: b9 d3 f5  
            STA $0305,x        ; $f663: 9d 05 03  
            INY                ; $f666: c8        
            INX                ; $f667: e8        
            DEC $00            ; $f668: c6 00     
            BNE __f660         ; $f66a: d0 f4     
            LDX $0300          ; $f66c: ae 00 03  
            LDY #$00           ; $f66f: a0 00     
__f671:     LDA __f609,y       ; $f671: b9 09 f6  
            STA $0301,x        ; $f674: 9d 01 03  
            INX                ; $f677: e8        
            INY                ; $f678: c8        
            CPY #$04           ; $f679: c0 04     
            BNE __f671         ; $f67b: d0 f4     
            RTS                ; $f67d: 60        

;-------------------------------------------------------------------------------
__f67e:     LDA $d6            ; $f67e: a5 d6     
            CLC                ; $f680: 18        
            ADC #$0a           ; $f681: 69 0a     
            STA $05fc          ; $f683: 8d fc 05  
            LDA $d7            ; $f686: a5 d7     
            CLC                ; $f688: 18        
            ADC #$0e           ; $f689: 69 0e     
            STA $05fd          ; $f68b: 8d fd 05  
            JMP __f624         ; $f68e: 4c 24 f6  

;-------------------------------------------------------------------------------
__f691:     TYA                ; $f691: 98        
            PHA                ; $f692: 48        
            LDA __f5f9,x       ; $f693: bd f9 f5  
            PHA                ; $f696: 48        
            JSR __f64c         ; $f697: 20 4c f6  
            PLA                ; $f69a: 68        
            LDY $0300          ; $f69b: ac 00 03  
            STA $0302,y        ; $f69e: 99 02 03  
            PLA                ; $f6a1: 68        
            TAY                ; $f6a2: a8        
            RTS                ; $f6a3: 60        

;-------------------------------------------------------------------------------
__f6a4:     LDA $3b            ; $f6a4: a5 3b     
            BNE __f6da         ; $f6a6: d0 32     
            LDA $07fa          ; $f6a8: ad fa 07  
            ORA $07fb          ; $f6ab: 0d fb 07  
            BEQ __f6db         ; $f6ae: f0 2b     
            LDA #$02           ; $f6b0: a9 02     
            STA $01            ; $f6b2: 85 01     
            LDA #$01           ; $f6b4: a9 01     
            LDY $07fb          ; $f6b6: ac fb 07  
            BEQ __f6bd         ; $f6b9: f0 02     
            LDA #$11           ; $f6bb: a9 11     
__f6bd:     PHA                ; $f6bd: 48        
            JSR __c94b         ; $f6be: 20 4b c9  
            LDA #$03           ; $f6c1: a9 03     
            STA $01            ; $f6c3: 85 01     
            PLA                ; $f6c5: 68        
            .hex 20            ; $f6c6: 20        Suspected data
__f6c7:     .hex 4b c9         ; $f6c7: 4b c9     Invalid Opcode - ALR #$c9
            LDA #$23           ; $f6c9: a9 23     
            JSR __c8e0         ; $f6cb: 20 e0 c8  
            LDA #$5d           ; $f6ce: a9 5d     
            STA $0306          ; $f6d0: 8d 06 03  
            STA $030d          ; $f6d3: 8d 0d 03  
            LDA #$06           ; $f6d6: a9 06     
            STA $3b            ; $f6d8: 85 3b     
__f6da:     RTS                ; $f6da: 60        

;-------------------------------------------------------------------------------
__f6db:     STA $1e            ; $f6db: 85 1e     
            LDA #$06           ; $f6dd: a9 06     
            STA $6a            ; $f6df: 85 6a     
            LDA #$0a           ; $f6e1: a9 0a     
            STA $4d            ; $f6e3: 85 4d     
            LDA #$80           ; $f6e5: a9 80     
            STA $fb            ; $f6e7: 85 fb     
            RTS                ; $f6e9: 60        

;-------------------------------------------------------------------------------
__f6ea:     BPL __f72c         ; $f6ea: 10 40     
            TYA                ; $f6ec: 98        
            TYA                ; $f6ed: 98        
__f6ee:     RTS                ; $f6ee: 60        

;-------------------------------------------------------------------------------
            LDY #$30           ; $f6ef: a0 30     
            .hex c0            ; $f6f1: c0        Suspected data
__f6f2:     LDX #$0a           ; $f6f2: a2 0a     
__f6f4:     LDA #$00           ; $f6f4: a9 00     
            STA $91,x          ; $f6f6: 95 91     
            CPX #$04           ; $f6f8: e0 04     
            BCS __f719         ; $f6fa: b0 1d     
            LDA __f6ee,x       ; $f6fc: bd ee f6  
            STA $9f,x          ; $f6ff: 95 9f     
            LDA __f6ea,x       ; $f701: bd ea f6  
            STA $aa,x          ; $f704: 95 aa     
            LDA #$ff           ; $f706: a9 ff     
            STA $94,x          ; $f708: 95 94     
            STA $c0,x          ; $f70a: 95 c0     
            LDA $05fe          ; $f70c: ad fe 05  
            STA $03e0,x        ; $f70f: 9d e0 03  
            TXA                ; $f712: 8a        
            CLC                ; $f713: 18        
            ADC #$4f           ; $f714: 69 4f     
            STA $03eb,x        ; $f716: 9d eb 03  
__f719:     DEX                ; $f719: ca        
            BPL __f6f4         ; $f71a: 10 d8     
            RTS                ; $f71c: 60        

;-------------------------------------------------------------------------------
__f71d:     LDX #$03           ; $f71d: a2 03     
__f71f:     LDA $94,x          ; $f71f: b5 94     
            CMP #$01           ; $f721: c9 01     
            BNE __f72c         ; $f723: d0 07     
            TXA                ; $f725: 8a        
            CLC                ; $f726: 18        
            ADC #$8f           ; $f727: 69 8f     
            STA $03eb,x        ; $f729: 9d eb 03  
__f72c:     DEX                ; $f72c: ca        
            BPL __f71f         ; $f72d: 10 f0     
            RTS                ; $f72f: 60        

;-------------------------------------------------------------------------------
__f730:     ROL $4646,x        ; $f730: 3e 46 46  
__f733:     BVC __f786         ; $f733: 50 51     
            .hex 4e 4f         ; $f735: 4e 4f     Suspected data
__f737:     INC $d3            ; $f737: e6 d3     
            LDA $d3            ; $f739: a5 d3     
            CMP #$08           ; $f73b: c9 08     
            BCC __f74f         ; $f73d: 90 10     
            LDA #$00           ; $f73f: a9 00     
            STA $d3            ; $f741: 85 d3     
            INC $d4            ; $f743: e6 d4     
            LDA $d4            ; $f745: a5 d4     
            CMP #$03           ; $f747: c9 03     
            BCC __f74f         ; $f749: 90 04     
            LDA #$00           ; $f74b: a9 00     
            STA $d4            ; $f74d: 85 d4     
__f74f:     LDY $d4            ; $f74f: a4 d4     
            LDA __f730,y       ; $f751: b9 30 f7  
            STA $02            ; $f754: 85 02     
            LDY #$0e           ; $f756: a0 0e     
            LDA $d6            ; $f758: a5 d6     
            STA $00            ; $f75a: 85 00     
            LDA $d7            ; $f75c: a5 d7     
            STA $01            ; $f75e: 85 01     
            JSR __f630         ; $f760: 20 30 f6  
            LDA $d4            ; $f763: a5 d4     
            CMP #$02           ; $f765: c9 02     
            BNE __f78a         ; $f767: d0 21     
            LDY #$0c           ; $f769: a0 0c     
            LDX #$03           ; $f76b: a2 03     
            LDA $d5            ; $f76d: a5 d5     
            BNE __f773         ; $f76f: d0 02     
            LDX #$51           ; $f771: a2 51     
__f773:     LDA $d5            ; $f773: a5 d5     
            BNE __f77d         ; $f775: d0 06     
            TXA                ; $f777: 8a        
            STA $0251,y        ; $f778: 99 51 02  
            BNE __f783         ; $f77b: d0 06     
__f77d:     LDA __f733,x       ; $f77d: bd 33 f7  
            STA $0241,y        ; $f780: 99 41 02  
__f783:     DEX                ; $f783: ca        
            DEY                ; $f784: 88        
            DEY                ; $f785: 88        
__f786:     DEY                ; $f786: 88        
            DEY                ; $f787: 88        
            BPL __f773         ; $f788: 10 e9     
__f78a:     RTS                ; $f78a: 60        

;-------------------------------------------------------------------------------
__f78b:     LDA #$ff           ; $f78b: a9 ff     
            LDX $d5            ; $f78d: a6 d5     
            BEQ __f793         ; $f78f: f0 02     
            LDA #$01           ; $f791: a9 01     
__f793:     CLC                ; $f793: 18        
            ADC $d6            ; $f794: 65 d6     
            STA $d6            ; $f796: 85 d6     
            CMP #$60           ; $f798: c9 60     
            BNE __f7a2         ; $f79a: d0 06     
            LDA $19            ; $f79c: a5 19     
            AND #$01           ; $f79e: 29 01     
            STA $d5            ; $f7a0: 85 d5     
__f7a2:     LDA $13            ; $f7a2: a5 13     
            ORA $27            ; $f7a4: 05 27     
            BNE __f78a         ; $f7a6: d0 e2     
            JMP __f737         ; $f7a8: 4c 37 f7  

;-------------------------------------------------------------------------------
__f7ab:     LDA $56            ; $f7ab: a5 56     
            AND #$3c           ; $f7ad: 29 3c     
            EOR #$3c           ; $f7af: 49 3c     
            ASL                ; $f7b1: 0a        
            ASL                ; $f7b2: 0a        
            ORA #$0f           ; $f7b3: 09 0f     
            AND $18,x          ; $f7b5: 35 18     
            RTS                ; $f7b7: 60        

;-------------------------------------------------------------------------------
__f7b8:     .hex ff 08 11      ; $f7b8: ff 08 11  Invalid Opcode - ISC $1108,x
            .hex 1e            ; $f7bb: 1e        Suspected data
__f7bc:     .hex 04 00         ; $f7bc: 04 00     Invalid Opcode - NOP $00
            ASL $03            ; $f7be: 06 03     
            ORA $00            ; $f7c0: 05 00     
            ASL $02            ; $f7c2: 06 02     
            .hex ff 05 01      ; $f7c4: ff 05 01  Invalid Opcode - ISC $0105,x
            .hex 07 02         ; $f7c7: 07 02     Invalid Opcode - SLO $02
            .hex 04 01         ; $f7c9: 04 01     Invalid Opcode - NOP $01
            .hex 07 03         ; $f7cb: 07 03     Invalid Opcode - SLO $03
            .hex ff 04 00      ; $f7cd: ff 04 00  Bad Addr Mode - ISC $0004,x
            ASL $03            ; $f7d0: 06 03     
            ORA $00            ; $f7d2: 05 00     
            .hex 04 01         ; $f7d4: 04 01     Invalid Opcode - NOP $01
            .hex 07 02         ; $f7d6: 07 02     Invalid Opcode - SLO $02
            .hex 04 00         ; $f7d8: 04 00     Invalid Opcode - NOP $00
__f7da:     .hex ff 05         ; $f7da: ff 05     Suspected data
__f7dc:     ORA ($07,x)        ; $f7dc: 01 07     
            .hex 02            ; $f7de: 02        Invalid Opcode - KIL 
            .hex 04 01         ; $f7df: 04 01     Invalid Opcode - NOP $01
            ORA $00            ; $f7e1: 05 00     
            ASL $03            ; $f7e3: 06 03     
            ORA $01            ; $f7e5: 05 01     
            .hex ff            ; $f7e7: ff        Suspected data
__f7e8:     BPL __f7da         ; $f7e8: 10 f0     
            BPL __f7dc         ; $f7ea: 10 f0     
__f7ec:     BRK                ; $f7ec: 00        
            BRK                ; $f7ed: 00        
            BRK                ; $f7ee: 00        
            BRK                ; $f7ef: 00        
            ORA ($00,x)        ; $f7f0: 01 00     
            ORA ($01,x)        ; $f7f2: 01 01     
            ORA ($01,x)        ; $f7f4: 01 01     
            ORA ($02,x)        ; $f7f6: 01 02     
            ORA ($02,x)        ; $f7f8: 01 02     
            .hex 02            ; $f7fa: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fb: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fc: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fd: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7fe: 02        Invalid Opcode - KIL 
            .hex 02            ; $f7ff: 02        Invalid Opcode - KIL 
            .hex 03 02         ; $f800: 03 02     Invalid Opcode - SLO ($02,x)
            .hex 03 03         ; $f802: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $f804: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 04         ; $f806: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 03 04         ; $f808: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $f80a: 04 04     Invalid Opcode - NOP $04
__f80c:     LDA $18            ; $f80c: a5 18     
            AND #$03           ; $f80e: 29 03     
            TAY                ; $f810: a8        
            LDA #$20           ; $f811: a9 20     
            STA $a7            ; $f813: 85 a7     
            LDA __f7e8,y       ; $f815: b9 e8 f7  
            STA $9c            ; $f818: 85 9c     
            LDA __f7b8,y       ; $f81a: b9 b8 f7  
            STA $03bc          ; $f81d: 8d bc 03  
            LDA #$00           ; $f820: a9 00     
            STA $03b1          ; $f822: 8d b1 03  
            STA $91            ; $f825: 85 91     
            LDA $56            ; $f827: a5 56     
            CMP #$3d           ; $f829: c9 3d     
            BCC __f82f         ; $f82b: 90 02     
            LDA #$3d           ; $f82d: a9 3d     
__f82f:     ASL                ; $f82f: 0a        
            ASL                ; $f830: 0a        
            CLC                ; $f831: 18        
            ADC #$2f           ; $f832: 69 2f     
            STA $03a6          ; $f834: 8d a6 03  
            RTS                ; $f837: 60        

;-------------------------------------------------------------------------------
__f838:     LDA #$03           ; $f838: a9 03     
            STA $03e8          ; $f83a: 8d e8 03  
            LDA $91            ; $f83d: a5 91     
            BEQ __f877         ; $f83f: f0 36     
            CMP #$20           ; $f841: c9 20     
            BEQ __f898         ; $f843: f0 53     
            CMP #$01           ; $f845: c9 01     
            BEQ __f899         ; $f847: f0 50     
            CMP #$02           ; $f849: c9 02     
            BEQ __f87c         ; $f84b: f0 2f     
            LDX #$00           ; $f84d: a2 00     
            JSR __ef70         ; $f84f: 20 70 ef  
            BCC __f85c         ; $f852: 90 08     
            JSR __f8db         ; $f854: 20 db f8  
            BMI __f85c         ; $f857: 30 03     
            JSR __f8ac         ; $f859: 20 ac f8  
__f85c:     LDA $b2            ; $f85c: a5 b2     
            LSR                ; $f85e: 4a        
            ROR                ; $f85f: 6a        
            EOR #$80           ; $f860: 49 80     
            STA $bd            ; $f862: 85 bd     
            LDA $50            ; $f864: a5 50     
            AND #$08           ; $f866: 29 08     
            LSR                ; $f868: 4a        
            ORA #$e0           ; $f869: 09 e0     
__f86b:     STA $03dd          ; $f86b: 8d dd 03  
            LDA $03e8          ; $f86e: ad e8 03  
            ORA #$40           ; $f871: 09 40     
            STA $03e8          ; $f873: 8d e8 03  
            RTS                ; $f876: 60        

;-------------------------------------------------------------------------------
__f877:     STA $03e8          ; $f877: 8d e8 03  
            BEQ __f889         ; $f87a: f0 0d     
__f87c:     JSR __f7ab         ; $f87c: 20 ab f7  
            STA $4e            ; $f87f: 85 4e     
            LDA $03e8          ; $f881: ad e8 03  
            ORA #$80           ; $f884: 09 80     
            STA $03e8          ; $f886: 8d e8 03  
__f889:     LDA $4e            ; $f889: a5 4e     
            BNE __f898         ; $f88b: d0 0b     
            LDA $91            ; $f88d: a5 91     
            BMI __f898         ; $f88f: 30 07     
            JSR __f80c         ; $f891: 20 0c f8  
            LDA #$ff           ; $f894: a9 ff     
            STA $91            ; $f896: 85 91     
__f898:     RTS                ; $f898: 60        

;-------------------------------------------------------------------------------
__f899:     LDA $a7            ; $f899: a5 a7     
            CLC                ; $f89b: 18        
            ADC #$02           ; $f89c: 69 02     
            STA $a7            ; $f89e: 85 a7     
            CMP #$f0           ; $f8a0: c9 f0     
            BCC __f8a8         ; $f8a2: 90 04     
            LDA #$02           ; $f8a4: a9 02     
            STA $91            ; $f8a6: 85 91     
__f8a8:     LDA #$b2           ; $f8a8: a9 b2     
            BNE __f86b         ; $f8aa: d0 bf     
__f8ac:     LDY $03b1          ; $f8ac: ac b1 03  
            LDA __f7ec,y       ; $f8af: b9 ec f7  
            PHA                ; $f8b2: 48        
            LDA $b2            ; $f8b3: a5 b2     
            AND #$01           ; $f8b5: 29 01     
            BEQ __f8be         ; $f8b7: f0 05     
            PLA                ; $f8b9: 68        
            JSR __d2fb         ; $f8ba: 20 fb d2  
            PHA                ; $f8bd: 48        
__f8be:     PLA                ; $f8be: 68        
            JSR __ef7d         ; $f8bf: 20 7d ef  
            LDA $b2            ; $f8c2: a5 b2     
            AND #$02           ; $f8c4: 29 02     
            BEQ __f8cb         ; $f8c6: f0 03     
            DEC $a7            ; $f8c8: c6 a7     
            .hex 2c            ; $f8ca: 2c        Suspected data
__f8cb:     INC $a7            ; $f8cb: e6 a7     
            LDA $b2            ; $f8cd: a5 b2     
            AND #$04           ; $f8cf: 29 04     
            BNE __f8d7         ; $f8d1: d0 04     
            INC $03b1          ; $f8d3: ee b1 03  
            RTS                ; $f8d6: 60        

;-------------------------------------------------------------------------------
__f8d7:     DEC $03b1          ; $f8d7: ce b1 03  
            RTS                ; $f8da: 60        

;-------------------------------------------------------------------------------
__f8db:     LDA $03b1          ; $f8db: ad b1 03  
            AND #$1f           ; $f8de: 29 1f     
            BNE __f8f4         ; $f8e0: d0 12     
__f8e2:     INC $03bc          ; $f8e2: ee bc 03  
            LDY $03bc          ; $f8e5: ac bc 03  
            LDA __f7bc,y       ; $f8e8: b9 bc f7  
            AND #$04           ; $f8eb: 29 04     
            BEQ __f8f1         ; $f8ed: f0 02     
            LDA #$1f           ; $f8ef: a9 1f     
__f8f1:     STA $03b1          ; $f8f1: 8d b1 03  
__f8f4:     LDA $9c            ; $f8f4: a5 9c     
            CMP #$0f           ; $f8f6: c9 0f     
            BCC __f911         ; $f8f8: 90 17     
            CMP #$f1           ; $f8fa: c9 f1     
            BCS __f911         ; $f8fc: b0 13     
            LDA $a7            ; $f8fe: a5 a7     
            CMP #$f0           ; $f900: c9 f0     
            BCS __f911         ; $f902: b0 0d     
            LDY $03bc          ; $f904: ac bc 03  
            BMI __f8e2         ; $f907: 30 d9     
            LDA __f7bc,y       ; $f909: b9 bc f7  
            CMP #$ff           ; $f90c: c9 ff     
            BNE __f919         ; $f90e: d0 09     
            .hex 2c            ; $f910: 2c        Suspected data
__f911:     LDA #$ff           ; $f911: a9 ff     
            PHA                ; $f913: 48        
            LDA #$02           ; $f914: a9 02     
            STA $91            ; $f916: 85 91     
            PLA                ; $f918: 68        
__f919:     STA $b2            ; $f919: 85 b2     
            RTS                ; $f91b: 60        

;-------------------------------------------------------------------------------
            .hex ff ff         ; $f91c: ff ff     Suspected data
__f91e:     LDA #$ff           ; $f91e: a9 ff     
            STA $4017          ; $f920: 8d 17 40  
            JSR __f9eb         ; $f923: 20 eb f9  
            JSR __fac4         ; $f926: 20 c4 fa  
            JSR __fba1         ; $f929: 20 a1 fb  
            JSR __fbfc         ; $f92c: 20 fc fb  
            LDA #$00           ; $f92f: a9 00     
            STA $ff            ; $f931: 85 ff     
            STA $fe            ; $f933: 85 fe     
            STA $fc            ; $f935: 85 fc     
            STA $fb            ; $f937: 85 fb     
            LDY $0711          ; $f939: ac 11 07  
            LDA $f3            ; $f93c: a5 f3     
            AND #$0c           ; $f93e: 29 0c     
            BEQ __f949         ; $f940: f0 07     
            INC $0711          ; $f942: ee 11 07  
            CPY #$30           ; $f945: c0 30     
            BCC __f94f         ; $f947: 90 06     
__f949:     TYA                ; $f949: 98        
            BEQ __f94f         ; $f94a: f0 03     
            DEC $0711          ; $f94c: ce 11 07  
__f94f:     STY $4011          ; $f94f: 8c 11 40  
            RTS                ; $f952: 60        

;-------------------------------------------------------------------------------
__f953:     STX $4000          ; $f953: 8e 00 40  
            STY $4001          ; $f956: 8c 01 40  
            RTS                ; $f959: 60        

;-------------------------------------------------------------------------------
__f95a:     STX $4004          ; $f95a: 8e 04 40  
            STY $4005          ; $f95d: 8c 05 40  
            RTS                ; $f960: 60        

;-------------------------------------------------------------------------------
__f961:     JSR __f953         ; $f961: 20 53 f9  
__f964:     LDX #$00           ; $f964: a2 00     
__f966:     TAY                ; $f966: a8        
            LDA __ff01,y       ; $f967: b9 01 ff  
            BEQ __f977         ; $f96a: f0 0b     
            STA $4002,x        ; $f96c: 9d 02 40  
            LDA __ff00,y       ; $f96f: b9 00 ff  
            ORA #$08           ; $f972: 09 08     
            STA $4003,x        ; $f974: 9d 03 40  
__f977:     RTS                ; $f977: 60        

;-------------------------------------------------------------------------------
__f978:     JSR __f95a         ; $f978: 20 5a f9  
__f97b:     LDX #$04           ; $f97b: a2 04     
            BNE __f966         ; $f97d: d0 e7     
__f97f:     LDX #$08           ; $f97f: a2 08     
            BNE __f966         ; $f981: d0 e3     
__f983:     TAX                ; $f983: aa        
            ROR                ; $f984: 6a        
            TXA                ; $f985: 8a        
            ROL                ; $f986: 2a        
            ROL                ; $f987: 2a        
            ROL                ; $f988: 2a        
            AND #$07           ; $f989: 29 07     
            CLC                ; $f98b: 18        
            ADC $f5            ; $f98c: 65 f5     
            TAY                ; $f98e: a8        
            LDA __ff40,y       ; $f98f: b9 40 ff  
            RTS                ; $f992: 60        

;-------------------------------------------------------------------------------
__f993:     TYA                ; $f993: 98        
            .hex 5a            ; $f994: 5a        Invalid Opcode - NOP 
            STA $5a9b,y        ; $f995: 99 9b 5a  
            .hex 5c 9b 5d      ; $f998: 5c 9b 5d  Invalid Opcode - NOP $5d9b,x
            .hex 9c 9e 5d      ; $f99b: 9c 9e 5d  Invalid Opcode - SHY $5d9e,x
            .hex 5f            ; $f99e: 5f        Suspected data
__f99f:     .hex bf be aa      ; $f99f: bf be aa  Invalid Opcode - LAX $aabe,y
            LDA #$98           ; $f9a2: a9 98     
            .hex 97 87         ; $f9a4: 97 87     Invalid Opcode - SAX $87,y
            STX $78            ; $f9a6: 86 78     
            .hex 77 6b         ; $f9a8: 77 6b     Invalid Opcode - RRA $6b,x
            ROR                ; $f9aa: 6a        
__f9ab:     STY $f0            ; $f9ab: 84 f0     
            LDA #$2f           ; $f9ad: a9 2f     
            STA $f4            ; $f9af: 85 f4     
__f9b1:     LDA $f4            ; $f9b1: a5 f4     
            LSR                ; $f9b3: 4a        
            LSR                ; $f9b4: 4a        
            TAY                ; $f9b5: a8        
            LDA __f99f,y       ; $f9b6: b9 9f f9  
            STA $4002          ; $f9b9: 8d 02 40  
            LDA #$08           ; $f9bc: a9 08     
            STA $4003          ; $f9be: 8d 03 40  
            LDX __f993,y       ; $f9c1: be 93 f9  
            LDY #$81           ; $f9c4: a0 81     
            BNE __fa2f         ; $f9c6: d0 67     
__f9c8:     STY $f0            ; $f9c8: 84 f0     
            LDA #$20           ; $f9ca: a9 20     
            STA $f4            ; $f9cc: 85 f4     
            BNE __f9d6         ; $f9ce: d0 06     
__f9d0:     LDA $f4            ; $f9d0: a5 f4     
            CMP #$1b           ; $f9d2: c9 1b     
            BNE __fa32         ; $f9d4: d0 5c     
__f9d6:     LDX #$88           ; $f9d6: a2 88     
            LDY #$d3           ; $f9d8: a0 d3     
            LDA #$00           ; $f9da: a9 00     
            JSR __f961         ; $f9dc: 20 61 f9  
            LDA #$20           ; $f9df: a9 20     
            JSR __f97f         ; $f9e1: 20 7f f9  
            LDA #$1c           ; $f9e4: a9 1c     
            STA $4008          ; $f9e6: 8d 08 40  
            BNE __fa32         ; $f9e9: d0 47     
__f9eb:     LDY $ff            ; $f9eb: a4 ff     
            LDA $f0            ; $f9ed: a5 f0     
            LSR $ff            ; $f9ef: 46 ff     
            BCS __f9ab         ; $f9f1: b0 b8     
            LSR                ; $f9f3: 4a        
            BCS __f9b1         ; $f9f4: b0 bb     
            LSR $ff            ; $f9f6: 46 ff     
            BCS __f9c8         ; $f9f8: b0 ce     
            LSR                ; $f9fa: 4a        
            BCS __f9d0         ; $f9fb: b0 d3     
            LSR $ff            ; $f9fd: 46 ff     
            BCS __fa0c         ; $f9ff: b0 0b     
            LSR                ; $fa01: 4a        
            BCS __fa1b         ; $fa02: b0 17     
            LSR $ff            ; $fa04: 46 ff     
            BCS __fa40         ; $fa06: b0 38     
            LSR                ; $fa08: 4a        
            BCS __fa4a         ; $fa09: b0 3f     
            RTS                ; $fa0b: 60        

;-------------------------------------------------------------------------------
__fa0c:     STY $f0            ; $fa0c: 84 f0     
            LDA #$28           ; $fa0e: a9 28     
            STA $f4            ; $fa10: 85 f4     
            LDX #$9a           ; $fa12: a2 9a     
            LDY #$a7           ; $fa14: a0 a7     
            LDA #$36           ; $fa16: a9 36     
            JSR __f961         ; $fa18: 20 61 f9  
__fa1b:     LDA $f4            ; $fa1b: a5 f4     
            CMP #$25           ; $fa1d: c9 25     
            BNE __fa27         ; $fa1f: d0 06     
            LDX #$47           ; $fa21: a2 47     
            LDY #$f6           ; $fa23: a0 f6     
            BNE __fa2f         ; $fa25: d0 08     
__fa27:     CMP #$20           ; $fa27: c9 20     
            BNE __fa32         ; $fa29: d0 07     
            LDY #$bc           ; $fa2b: a0 bc     
            LDX #$4c           ; $fa2d: a2 4c     
__fa2f:     JSR __f953         ; $fa2f: 20 53 f9  
__fa32:     DEC $f4            ; $fa32: c6 f4     
            BNE __fa3f         ; $fa34: d0 09     
__fa36:     LDA #$00           ; $fa36: a9 00     
            STA $f0            ; $fa38: 85 f0     
__fa3a:     LDA #$90           ; $fa3a: a9 90     
            STA $4000          ; $fa3c: 8d 00 40  
__fa3f:     RTS                ; $fa3f: 60        

;-------------------------------------------------------------------------------
__fa40:     STY $f0            ; $fa40: 84 f0     
            LDA #$0b           ; $fa42: a9 0b     
            STA $f4            ; $fa44: 85 f4     
            LDA #$57           ; $fa46: a9 57     
            BNE __fa52         ; $fa48: d0 08     
__fa4a:     LDA $f4            ; $fa4a: a5 f4     
            CMP #$07           ; $fa4c: c9 07     
            BNE __fa32         ; $fa4e: d0 e2     
            LDA #$02           ; $fa50: a9 02     
__fa52:     STA $4002          ; $fa52: 8d 02 40  
            LDA #$3b           ; $fa55: a9 3b     
            STA $4003          ; $fa57: 8d 03 40  
            LDX #$bd           ; $fa5a: a2 bd     
            LDY #$8a           ; $fa5c: a0 8a     
            .hex d0            ; $fa5e: d0        Suspected data
__fa5f:     .hex cf 20 1e      ; $fa5f: cf 20 1e  Invalid Opcode - DCP $1e20
            .hex 1c 1a         ; $fa62: 1c 1a     Suspected data
__fa64:     STY $f1            ; $fa64: 84 f1     
            LDA #$30           ; $fa66: a9 30     
            STA $0712          ; $fa68: 8d 12 07  
__fa6b:     LDA $0712          ; $fa6b: ad 12 07  
            LDX #$03           ; $fa6e: a2 03     
__fa70:     LSR                ; $fa70: 4a        
            BCS __fab5         ; $fa71: b0 42     
            DEX                ; $fa73: ca        
            BNE __fa70         ; $fa74: d0 fa     
            TAY                ; $fa76: a8        
            LDA __fa5f,y       ; $fa77: b9 5f fa  
            LDY #$8b           ; $fa7a: a0 8b     
__fa7c:     LDX #$b8           ; $fa7c: a2 b8     
            JSR __f978         ; $fa7e: 20 78 f9  
            BNE __fab5         ; $fa81: d0 32     
__fa83:     STY $f1            ; $fa83: 84 f1     
            LDA #$5e           ; $fa85: a9 5e     
            STA $0712          ; $fa87: 8d 12 07  
            LDA #$91           ; $fa8a: a9 91     
            STA $0709          ; $fa8c: 8d 09 07  
            LDA #$3c           ; $fa8f: a9 3c     
            JSR __f97b         ; $fa91: 20 7b f9  
__fa94:     LDA $0709          ; $fa94: ad 09 07  
            STA $4004          ; $fa97: 8d 04 40  
            CMP #$95           ; $fa9a: c9 95     
            BEQ __faa1         ; $fa9c: f0 03     
            INC $0709          ; $fa9e: ee 09 07  
__faa1:     LDA $0712          ; $faa1: ad 12 07  
            AND #$07           ; $faa4: 29 07     
            BNE __faac         ; $faa6: d0 04     
            LDA #$9f           ; $faa8: a9 9f     
            BNE __fab2         ; $faaa: d0 06     
__faac:     CMP #$06           ; $faac: c9 06     
            BNE __fab5         ; $faae: d0 05     
            LDA #$a3           ; $fab0: a9 a3     
__fab2:     STA $4005          ; $fab2: 8d 05 40  
__fab5:     DEC $0712          ; $fab5: ce 12 07  
            BNE __fac3         ; $fab8: d0 09     
            LDA #$00           ; $faba: a9 00     
            STA $f1            ; $fabc: 85 f1     
            LDA #$90           ; $fabe: a9 90     
            STA $4004          ; $fac0: 8d 04 40  
__fac3:     RTS                ; $fac3: 60        

;-------------------------------------------------------------------------------
__fac4:     LDY $fe            ; $fac4: a4 fe     
            LDA $f1            ; $fac6: a5 f1     
            LSR $fe            ; $fac8: 46 fe     
            BCS __fa64         ; $faca: b0 98     
            LSR                ; $facc: 4a        
            BCS __fa6b         ; $facd: b0 9c     
            LSR $fe            ; $facf: 46 fe     
            BCS __fa83         ; $fad1: b0 b0     
            LSR                ; $fad3: 4a        
            BCS __fa94         ; $fad4: b0 be     
            LSR $fe            ; $fad6: 46 fe     
            BCS __faec         ; $fad8: b0 12     
            LSR                ; $fada: 4a        
            BCS __fab5         ; $fadb: b0 d8     
            LSR                ; $fadd: 4a        
            BCS __fb09         ; $fade: b0 29     
            LSR $fe            ; $fae0: 46 fe     
            BCS __faf9         ; $fae2: b0 15     
            LSR $fe            ; $fae4: 46 fe     
            BCS __fb17         ; $fae6: b0 2f     
            LSR                ; $fae8: 4a        
            BCS __fab5         ; $fae9: b0 ca     
            RTS                ; $faeb: 60        

;-------------------------------------------------------------------------------
__faec:     STY $f1            ; $faec: 84 f1     
            LDA #$20           ; $faee: a9 20     
            STA $0712          ; $faf0: 8d 12 07  
            LDA #$18           ; $faf3: a9 18     
            LDY #$b3           ; $faf5: a0 b3     
            BNE __fa7c         ; $faf7: d0 83     
__faf9:     STY $f1            ; $faf9: 84 f1     
            LDA #$08           ; $fafb: a9 08     
            STA $0712          ; $fafd: 8d 12 07  
            LDX #$1f           ; $fb00: a2 1f     
            LDY #$7f           ; $fb02: a0 7f     
            LDA #$04           ; $fb04: a9 04     
            JSR __f978         ; $fb06: 20 78 f9  
__fb09:     LDA $0712          ; $fb09: ad 12 07  
            CMP #$04           ; $fb0c: c9 04     
            BNE __fab5         ; $fb0e: d0 a5     
            LDA #$a9           ; $fb10: a9 a9     
            STA $4006          ; $fb12: 8d 06 40  
            BNE __fab5         ; $fb15: d0 9e     
__fb17:     STY $f1            ; $fb17: 84 f1     
            LDA #$18           ; $fb19: a9 18     
            STA $0712          ; $fb1b: 8d 12 07  
            LDX #$1f           ; $fb1e: a2 1f     
            LDY #$92           ; $fb20: a0 92     
            LDA #$3e           ; $fb22: a9 3e     
            JSR __f978         ; $fb24: 20 78 f9  
            LDA #$08           ; $fb27: a9 08     
            STA $4007          ; $fb29: 8d 07 40  
            LDA $0712          ; $fb2c: ad 12 07  
            CMP #$10           ; $fb2f: c9 10     
            BNE __fb38         ; $fb31: d0 05     
            LDA #$32           ; $fb33: a9 32     
            STA $4006          ; $fb35: 8d 06 40  
__fb38:     JMP __fab5         ; $fb38: 4c b5 fa  

;-------------------------------------------------------------------------------
__fb3b:     ASL $10,x          ; $fb3b: 16 10     
            .hex 17 18         ; $fb3d: 17 18     Invalid Opcode - SLO $18,x
            ORA $1b1a,y        ; $fb3f: 19 1a 1b  
            .hex 1f 1f 1f      ; $fb42: 1f 1f 1f  Invalid Opcode - SLO $1f1f,x
            .hex 1f 1c 1a      ; $fb45: 1f 1c 1a  Invalid Opcode - SLO $1a1c,x
            .hex 17 15         ; $fb48: 17 15     Invalid Opcode - SLO $15,x
            .hex 14            ; $fb4a: 14        Suspected data
__fb4b:     .hex 02            ; $fb4b: 02        Invalid Opcode - KIL 
            .hex 04 06         ; $fb4c: 04 06     Invalid Opcode - NOP $06
            PHP                ; $fb4e: 08        
            ASL                ; $fb4f: 0a        
            .hex 0b 0c         ; $fb50: 0b 0c     Invalid Opcode - ANC #$0c
__fb52:     ORA $1410          ; $fb52: 0d 10 14  
            ORA $1d1b,y        ; $fb55: 19 1b 1d  
            .hex 1f 1f 13      ; $fb58: 1f 1f 13  Invalid Opcode - SLO $131f,x
            ORA $1a,x          ; $fb5b: 15 1a     
            .hex 1c 1e 1f      ; $fb5d: 1c 1e 1f  Invalid Opcode - NOP $1f1e,x
            .hex 1f 1f         ; $fb60: 1f 1f     Suspected data
__fb62:     .hex 1f 06 0a      ; $fb62: 1f 06 0a  Invalid Opcode - SLO $0a06,x
            .hex 0b 09         ; $fb65: 0b 09     Invalid Opcode - ANC #$09
            .hex 0c 0f 0e      ; $fb67: 0c 0f 0e  Invalid Opcode - NOP $0e0f
__fb6a:     .hex 0f 10 1f      ; $fb6a: 0f 10 1f  Invalid Opcode - SLO $1f10
            .hex 1f            ; $fb6d: 1f        Suspected data
__fb6e:     .hex 1f 09 0b      ; $fb6e: 1f 09 0b  Invalid Opcode - SLO $0b09,x
__fb71:     STY $f2            ; $fb71: 84 f2     
            LDA #$7f           ; $fb73: a9 7f     
            STA $070e          ; $fb75: 8d 0e 07  
__fb78:     LDA $070e          ; $fb78: ad 0e 07  
            LSR                ; $fb7b: 4a        
            LSR                ; $fb7c: 4a        
            LSR                ; $fb7d: 4a        
            LSR                ; $fb7e: 4a        
            TAY                ; $fb7f: a8        
            LDX __fb4b,y       ; $fb80: be 4b fb  
            LDA $070e          ; $fb83: ad 0e 07  
            AND #$0f           ; $fb86: 29 0f     
            TAY                ; $fb88: a8        
            LDA __fb3b,y       ; $fb89: b9 3b fb  
__fb8c:     STA $400c          ; $fb8c: 8d 0c 40  
            STX $400e          ; $fb8f: 8e 0e 40  
            LDA #$08           ; $fb92: a9 08     
            STA $400f          ; $fb94: 8d 0f 40  
            DEC $070e          ; $fb97: ce 0e 07  
            BNE __fba0         ; $fb9a: d0 04     
            LDA #$00           ; $fb9c: a9 00     
            STA $f2            ; $fb9e: 85 f2     
__fba0:     RTS                ; $fba0: 60        

;-------------------------------------------------------------------------------
__fba1:     LDY $fc            ; $fba1: a4 fc     
            LDA $f2            ; $fba3: a5 f2     
            LSR $fc            ; $fba5: 46 fc     
            BCS __fb71         ; $fba7: b0 c8     
            LSR                ; $fba9: 4a        
            BCS __fb78         ; $fbaa: b0 cc     
            LSR $fc            ; $fbac: 46 fc     
            BCS __fbbb         ; $fbae: b0 0b     
            LSR                ; $fbb0: 4a        
            BCS __fbcb         ; $fbb1: b0 18     
            LSR $fc            ; $fbb3: 46 fc     
            BCS __fbdb         ; $fbb5: b0 24     
            LSR                ; $fbb7: 4a        
            BCS __fbeb         ; $fbb8: b0 31     
            RTS                ; $fbba: 60        

;-------------------------------------------------------------------------------
__fbbb:     STY $f2            ; $fbbb: 84 f2     
            LDA #$10           ; $fbbd: a9 10     
            STA $070e          ; $fbbf: 8d 0e 07  
            LDA $f0            ; $fbc2: a5 f0     
            CMP #$04           ; $fbc4: c9 04     
            BNE __fbcb         ; $fbc6: d0 03     
            JSR __fa36         ; $fbc8: 20 36 fa  
__fbcb:     LDA $070e          ; $fbcb: ad 0e 07  
            LSR                ; $fbce: 4a        
            TAY                ; $fbcf: a8        
            LDX __fb62,y       ; $fbd0: be 62 fb  
            LDY $070e          ; $fbd3: ac 0e 07  
            LDA __fb52,y       ; $fbd6: b9 52 fb  
            BNE __fb8c         ; $fbd9: d0 b1     
__fbdb:     STY $f2            ; $fbdb: 84 f2     
            LDA #$04           ; $fbdd: a9 04     
            STA $070e          ; $fbdf: 8d 0e 07  
            LDA $f0            ; $fbe2: a5 f0     
            CMP #$04           ; $fbe4: c9 04     
            BNE __fbeb         ; $fbe6: d0 03     
            JSR __fa36         ; $fbe8: 20 36 fa  
__fbeb:     LDA $070e          ; $fbeb: ad 0e 07  
            LSR                ; $fbee: 4a        
            TAY                ; $fbef: a8        
            LDX __fb6e,y       ; $fbf0: be 6e fb  
            LDY $070e          ; $fbf3: ac 0e 07  
            LDA __fb6a,y       ; $fbf6: b9 6a fb  
            JMP __fb8c         ; $fbf9: 4c 8c fb  

;-------------------------------------------------------------------------------
__fbfc:     LDA $fb            ; $fbfc: a5 fb     
            BNE __fc05         ; $fbfe: d0 05     
            LDA $f3            ; $fc00: a5 f3     
            BNE __fc51         ; $fc02: d0 4d     
            RTS                ; $fc04: 60        

;-------------------------------------------------------------------------------
__fc05:     CMP #$20           ; $fc05: c9 20     
            BNE __fc11         ; $fc07: d0 08     
            LDA $f3            ; $fc09: a5 f3     
            AND #$0e           ; $fc0b: 29 0e     
            STA $fd            ; $fc0d: 85 fd     
            LDA $fb            ; $fc0f: a5 fb     
__fc11:     STA $f3            ; $fc11: 85 f3     
            LDY #$00           ; $fc13: a0 00     
            STY $f8            ; $fc15: 84 f8     
__fc17:     INY                ; $fc17: c8        
            LSR                ; $fc18: 4a        
            BCC __fc17         ; $fc19: 90 fc     
            LDA __fd21,y       ; $fc1b: b9 21 fd  
            TAY                ; $fc1e: a8        
            LDA __fd22,y       ; $fc1f: b9 22 fd  
            STA $f5            ; $fc22: 85 f5     
            LDA __fd23,y       ; $fc24: b9 23 fd  
            STA $f6            ; $fc27: 85 f6     
            LDA __fd24,y       ; $fc29: b9 24 fd  
            STA $f7            ; $fc2c: 85 f7     
            LDA __fd25,y       ; $fc2e: b9 25 fd  
            STA $fa            ; $fc31: 85 fa     
            LDA __fd26,y       ; $fc33: b9 26 fd  
            STA $f9            ; $fc36: 85 f9     
            LDA __fd27,y       ; $fc38: b9 27 fd  
            STA $0705          ; $fc3b: 8d 05 07  
            LDA #$01           ; $fc3e: a9 01     
            STA $0701          ; $fc40: 8d 01 07  
            STA $0703          ; $fc43: 8d 03 07  
            STA $0704          ; $fc46: 8d 04 07  
            STA $0706          ; $fc49: 8d 06 07  
            LDA #$7f           ; $fc4c: a9 7f     
            STA $0700          ; $fc4e: 8d 00 07  
__fc51:     DEC $0701          ; $fc51: ce 01 07  
            BNE __fcac         ; $fc54: d0 56     
            LDY $f8            ; $fc56: a4 f8     
            INC $f8            ; $fc58: e6 f8     
            LDA ($f6),y        ; $fc5a: b1 f6     
            BNE __fc84         ; $fc5c: d0 26     
            LDA $f3            ; $fc5e: a5 f3     
            CMP #$40           ; $fc60: c9 40     
            BNE __fc68         ; $fc62: d0 04     
            LDA $fd            ; $fc64: a5 fd     
            BNE __fc11         ; $fc66: d0 a9     
__fc68:     CMP #$02           ; $fc68: c9 02     
            BEQ __fc11         ; $fc6a: f0 a5     
            AND #$0c           ; $fc6c: 29 0c     
            BEQ __fc79         ; $fc6e: f0 09     
            LSR                ; $fc70: 4a        
            CMP #$04           ; $fc71: c9 04     
            BEQ __fc11         ; $fc73: f0 9c     
            LDA #$08           ; $fc75: a9 08     
            BNE __fc11         ; $fc77: d0 98     
__fc79:     LDA #$00           ; $fc79: a9 00     
            STA $f3            ; $fc7b: 85 f3     
            JSR __fa3a         ; $fc7d: 20 3a fa  
            STA $4004          ; $fc80: 8d 04 40  
            RTS                ; $fc83: 60        

;-------------------------------------------------------------------------------
__fc84:     JSR __f983         ; $fc84: 20 83 f9  
            STA $0701          ; $fc87: 8d 01 07  
            LDA $f1            ; $fc8a: a5 f1     
            BNE __fcc4         ; $fc8c: d0 36     
            TXA                ; $fc8e: 8a        
            AND #$3e           ; $fc8f: 29 3e     
            JSR __f97b         ; $fc91: 20 7b f9  
            TAY                ; $fc94: a8        
            BEQ __fc99         ; $fc95: f0 02     
            LDY #$1f           ; $fc97: a0 1f     
__fc99:     STY $0702          ; $fc99: 8c 02 07  
            LDX #$84           ; $fc9c: a2 84     
            LDA $0701          ; $fc9e: ad 01 07  
            CMP #$10           ; $fca1: c9 10     
            BCS __fca7         ; $fca3: b0 02     
            LDX #$82           ; $fca5: a2 82     
__fca7:     LDY #$7f           ; $fca7: a0 7f     
            JSR __f95a         ; $fca9: 20 5a f9  
__fcac:     LDA $f1            ; $fcac: a5 f1     
            BNE __fcc4         ; $fcae: d0 14     
            LDA $f3            ; $fcb0: a5 f3     
            AND #$0c           ; $fcb2: 29 0c     
            BEQ __fcc4         ; $fcb4: f0 0e     
            LDY $0702          ; $fcb6: ac 02 07  
            BEQ __fcbe         ; $fcb9: f0 03     
            DEC $0702          ; $fcbb: ce 02 07  
__fcbe:     LDA __ffd9,y       ; $fcbe: b9 d9 ff  
            STA $4004          ; $fcc1: 8d 04 40  
__fcc4:     LDY $f9            ; $fcc4: a4 f9     
            BEQ __fcfa         ; $fcc6: f0 32     
            DEC $0703          ; $fcc8: ce 03 07  
            BNE __fcfa         ; $fccb: d0 2d     
__fccd:     LDY $f9            ; $fccd: a4 f9     
            INC $f9            ; $fccf: e6 f9     
            LDA ($f6),y        ; $fcd1: b1 f6     
            BNE __fce0         ; $fcd3: d0 0b     
            LDY $f9            ; $fcd5: a4 f9     
            INC $f9            ; $fcd7: e6 f9     
            LDA ($f6),y        ; $fcd9: b1 f6     
            STA $0700          ; $fcdb: 8d 00 07  
            BNE __fccd         ; $fcde: d0 ed     
__fce0:     JSR __f983         ; $fce0: 20 83 f9  
            STA $0703          ; $fce3: 8d 03 07  
            TXA                ; $fce6: 8a        
            AND #$3e           ; $fce7: 29 3e     
            JSR __f964         ; $fce9: 20 64 f9  
            BNE __fcf2         ; $fcec: d0 04     
            LDX #$10           ; $fcee: a2 10     
            BNE __fcf4         ; $fcf0: d0 02     
__fcf2:     LDX #$06           ; $fcf2: a2 06     
__fcf4:     LDY $0700          ; $fcf4: ac 00 07  
            JSR __f953         ; $fcf7: 20 53 f9  
__fcfa:     LDY $fa            ; $fcfa: a4 fa     
            BEQ __fd21         ; $fcfc: f0 23     
            DEC $0704          ; $fcfe: ce 04 07  
            BNE __fd21         ; $fd01: d0 1e     
            INC $fa            ; $fd03: e6 fa     
            LDA ($f6),y        ; $fd05: b1 f6     
            JSR __f983         ; $fd07: 20 83 f9  
            STA $0704          ; $fd0a: 8d 04 07  
            CLC                ; $fd0d: 18        
            ADC #$fe           ; $fd0e: 69 fe     
            CMP #$0e           ; $fd10: c9 0e     
            BCC __fd16         ; $fd12: 90 02     
            LDA #$0e           ; $fd14: a9 0e     
__fd16:     ASL                ; $fd16: 0a        
            ASL                ; $fd17: 0a        
            STA $4008          ; $fd18: 8d 08 40  
            TXA                ; $fd1b: 8a        
            AND #$3e           ; $fd1c: 29 3e     
            JSR __f97f         ; $fd1e: 20 7f f9  
__fd21:     RTS                ; $fd21: 60        

;-------------------------------------------------------------------------------
__fd22:     .hex 21            ; $fd22: 21        Suspected data
__fd23:     PHP                ; $fd23: 08        
__fd24:     .hex 0d            ; $fd24: 0d        Suspected data
__fd25:     .hex 12            ; $fd25: 12        Invalid Opcode - KIL 
__fd26:     .hex 26            ; $fd26: 26        Suspected data
__fd27:     .hex 17 17         ; $fd27: 17 17     Invalid Opcode - SLO $17,x
            .hex 1c 06 4a      ; $fd29: 1c 06 4a  Invalid Opcode - NOP $4a06,x
            .hex fe 09 00      ; $fd2c: fe 09 00  Bad Addr Mode - INC $0009,x
            ASL $4d            ; $fd2f: 06 4d     
            SBC $4282,x        ; $fd31: fd 82 42  
            ASL $ef            ; $fd34: 06 ef     
            SBC $2549,x        ; $fd36: fd 49 25  
            BRK                ; $fd39: 00        
            .hex d2            ; $fd3a: d2        Invalid Opcode - KIL 
            .hex ff 00 00      ; $fd3b: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $fd3e: 00        
            CLD                ; $fd3f: d8        
            .hex ff 00 00      ; $fd40: ff 00 00  Bad Addr Mode - ISC $0000,x
            ASL $b9            ; $fd43: 06 b9     
            INC $2495,x        ; $fd45: fe 95 24  
            ASL $71            ; $fd48: 06 71     
            .hex ff 40 28      ; $fd4a: ff 40 28  Invalid Opcode - ISC $2840,x
            .hex 42            ; $fd4d: 42        Invalid Opcode - KIL 
            .hex 02            ; $fd4e: 02        Invalid Opcode - KIL 
            .hex 04 82         ; $fd4f: 04 82     Invalid Opcode - NOP $82
            .hex 04 30         ; $fd51: 04 30     Invalid Opcode - NOP $30
            .hex 04 30         ; $fd53: 04 30     Invalid Opcode - NOP $30
            .hex 44 02         ; $fd55: 44 02     Invalid Opcode - NOP $02
            .hex 04 4b         ; $fd57: 04 4b     Invalid Opcode - NOP $4b
            STY $02            ; $fd59: 84 02     
            PLP                ; $fd5b: 28        
            .hex af e9 ef      ; $fd5c: af e9 ef  Invalid Opcode - LAX __efe9
            .hex 42            ; $fd5f: 42        Invalid Opcode - KIL 
            .hex 02            ; $fd60: 02        Invalid Opcode - KIL 
            .hex 04 82         ; $fd61: 04 82     Invalid Opcode - NOP $82
            STY $44            ; $fd63: 84 44     
            .hex 02            ; $fd65: 02        Invalid Opcode - KIL 
            .hex 04 4b         ; $fd66: 04 4b     Invalid Opcode - NOP $4b
            STY $02            ; $fd68: 84 02     
            PLP                ; $fd6a: 28        
            .hex af e9 ef      ; $fd6b: af e9 ef  Invalid Opcode - LAX __efe9
            .hex 82 45         ; $fd6e: 82 45     Invalid Opcode - NOP #$45
            ADC $488a          ; $fd70: 6d 8a 48  
            .hex 02            ; $fd73: 02        Invalid Opcode - KIL 
            .hex 04 6e         ; $fd74: 04 6e     Invalid Opcode - NOP $6e
            .hex 02            ; $fd76: 02        Invalid Opcode - KIL 
            PLP                ; $fd77: 28        
            ROR $02            ; $fd78: 66 02     
            BIT $60            ; $fd7a: 24 60     
            .hex 02            ; $fd7c: 02        Invalid Opcode - KIL 
            .hex e2 28         ; $fd7d: e2 28     Invalid Opcode - NOP #$28
            .hex ab ed         ; $fd7f: ab ed     Invalid Opcode - LAX #$ed
            CMP $91            ; $fd81: c5 91     
            .hex cf cb 85      ; $fd83: cf cb 85  Invalid Opcode - DCP $85cb
            .hex ef e9 a7      ; $fd86: ef e9 a7  Invalid Opcode - ISC $a7e9
            SBC $e1            ; $fd89: e5 e1     
            .hex 9b            ; $fd8b: 9b        Invalid Opcode - TAS 
            SBC ($e5,x)        ; $fd8c: e1 e5     
            BRK                ; $fd8e: 00        
            .hex 42            ; $fd8f: 42        Invalid Opcode - KIL 
            .hex 02            ; $fd90: 02        Invalid Opcode - KIL 
            .hex 22            ; $fd91: 22        Invalid Opcode - KIL 
            .hex 82 a2         ; $fd92: 82 a2     Invalid Opcode - NOP #$a2
            .hex 62            ; $fd94: 62        Invalid Opcode - KIL 
            .hex 02            ; $fd95: 02        Invalid Opcode - KIL 
            .hex 22            ; $fd96: 22        Invalid Opcode - KIL 
            .hex 63 a2         ; $fd97: 63 a2     Invalid Opcode - RRA ($a2,x)
            .hex 02            ; $fd99: 02        Invalid Opcode - KIL 
            ASL __dfa5,x       ; $fd9a: 1e a5 df  
            SBC $42            ; $fd9d: e5 42     
            .hex 02            ; $fd9f: 02        Invalid Opcode - KIL 
            .hex 22            ; $fda0: 22        Invalid Opcode - KIL 
            .hex 82 a2         ; $fda1: 82 a2     Invalid Opcode - NOP #$a2
            .hex 62            ; $fda3: 62        Invalid Opcode - KIL 
            .hex 02            ; $fda4: 02        Invalid Opcode - KIL 
            .hex 22            ; $fda5: 22        Invalid Opcode - KIL 
            .hex 63 a2         ; $fda6: 63 a2     Invalid Opcode - RRA ($a2,x)
            .hex 02            ; $fda8: 02        Invalid Opcode - KIL 
            ASL __dfa5,x       ; $fda9: 1e a5 df  
            SBC $82            ; $fdac: e5 82     
            ADC ($61,x)        ; $fdae: 61 61     
            LDY $026c          ; $fdb0: ac 6c 02  
            BIT $0268          ; $fdb3: 2c 68 02  
            BIT $60            ; $fdb6: 24 60     
            .hex 02            ; $fdb8: 02        Invalid Opcode - KIL 
            ASL $025a,x        ; $fdb9: 1e 5a 02  
            .hex 1a            ; $fdbc: 1a        Invalid Opcode - NOP 
            .hex 43 02         ; $fdbd: 43 02     Invalid Opcode - SRE ($02,x)
            BIT $a5            ; $fdbf: 24 a5     
            .hex e7 ed         ; $fdc1: e7 ed     Invalid Opcode - ISC $ed
__fdc3:     .hex 8b c9         ; $fdc3: 8b c9     Invalid Opcode - XAA #$c9
            CMP $ad            ; $fdc5: c5 ad     
            SBC #$e1           ; $fdc7: e9 e1     
            LDA ($df,x)        ; $fdc9: a1 df     
            .hex db b3 db      ; $fdcb: db b3 db  Invalid Opcode - DCP __dbb3,y
            .hex df 9a a2      ; $fdce: df 9a a2  Invalid Opcode - DCP $a29a,x
            TAY                ; $fdd1: a8        
            LDY $acae          ; $fdd2: ac ae ac  
__fdd5:     TAY                ; $fdd5: a8        
            LDX #$9a           ; $fdd6: a2 9a     
            LDX #$a8           ; $fdd8: a2 a8     
            LDY $acae          ; $fdda: ac ae ac  
            TAY                ; $fddd: a8        
            LDX #$a4           ; $fdde: a2 a4     
            LDY $8884          ; $fde0: ac 84 88  
            TXA                ; $fde3: 8a        
            DEY                ; $fde4: 88        
            STY $ac            ; $fde5: 84 ac     
            TXS                ; $fde7: 9a        
            LDX #$a8           ; $fde8: a2 a8     
            LDY $acae          ; $fdea: ac ae ac  
            TAY                ; $fded: a8        
            LDX #$a7           ; $fdee: a2 a7     
            SBC #$e9           ; $fdf0: e9 e9     
            .hex a7 e9         ; $fdf2: a7 e9     Invalid Opcode - LAX $e9
            SBC #$87           ; $fdf4: e9 87     
            CMP #$c9           ; $fdf6: c9 c9     
            .hex 87 c9         ; $fdf8: 87 c9     Invalid Opcode - SAX $c9
            CMP #$92           ; $fdfa: c9 92     
            STX $024a          ; $fdfc: 8e 4a 02  
            STY $04            ; $fdff: 84 04     
            .hex 44 02         ; $fe01: 44 02     Invalid Opcode - NOP $02
            LDX #$02           ; $fe03: a2 02     
            LDY $a6            ; $fe05: a4 a6     
            LDA #$e7           ; $fe07: a9 e7     
            SBC #$ab           ; $fe09: e9 ab     
            SBC #$eb           ; $fe0b: e9 eb     
            LDA __edeb         ; $fe0d: ad eb ed  
            LDA ($ed),y        ; $fe10: b1 ed     
            SBC ($00),y        ; $fe12: f1 00     
            .hex 9f df df      ; $fe14: 9f df df  Invalid Opcode - AHX __dfdf,y
            .hex 9f df df      ; $fe17: 9f df df  Invalid Opcode - AHX __dfdf,y
            .hex a7 e7         ; $fe1a: a7 e7     Invalid Opcode - LAX $e7
            .hex e7 ad         ; $fe1c: e7 ad     Invalid Opcode - ISC $ad
            SBC $88ed          ; $fe1e: ed ed 88  
            DEY                ; $fe21: 88        
            .hex 44 02         ; $fe22: 44 02     Invalid Opcode - NOP $02
            LDY $682c          ; $fe24: ac 2c 68  
            .hex 02            ; $fe27: 02        Invalid Opcode - KIL 
            TXS                ; $fe28: 9a        
            .hex 02            ; $fe29: 02        Invalid Opcode - KIL 
            .hex 9e a0 bb      ; $fe2a: 9e a0 bb  Invalid Opcode - SHX $bba0,y
            SBC $9bfb,y        ; $fe2d: f9 fb 9b  
            .hex fb db 9d      ; $fe30: fb db 9d  Invalid Opcode - ISC $9ddb,y
            .hex db dd a9      ; $fe33: db dd a9  Invalid Opcode - DCP $a9dd,y
            SBC $e9            ; $fe36: e5 e9     
            TAY                ; $fe38: a8        
            BCS __fdc3         ; $fe39: b0 88     
            BCC __fdd5         ; $fe3b: 90 98     
            TYA                ; $fe3d: 98        
            .hex 54 02         ; $fe3e: 54 02     Invalid Opcode - NOP $02,x
            STX $9a0e          ; $fe40: 8e 0e 9a  
            LDX #$a4           ; $fe43: a2 a4     
            LDX $a8            ; $fe45: a6 a8     
            TAX                ; $fe47: aa        
            LDY $03b0          ; $fe48: ac b0 03  
            .hex 03 03         ; $fe4b: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $fe4d: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $fe4f: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 00         ; $fe51: 03 00     Invalid Opcode - SLO ($00,x)
            PLA                ; $fe53: 68        
            .hex 02            ; $fe54: 02        Invalid Opcode - KIL 
            .hex 22            ; $fe55: 22        Invalid Opcode - KIL 
            .hex 64 02         ; $fe56: 64 02     Invalid Opcode - NOP $02
            PLP                ; $fe58: 28        
            .hex 42            ; $fe59: 42        Invalid Opcode - KIL 
            .hex 02            ; $fe5a: 02        Invalid Opcode - KIL 
            .hex 04 30         ; $fe5b: 04 30     Invalid Opcode - NOP $30
            .hex 04 30         ; $fe5d: 04 30     Invalid Opcode - NOP $30
            .hex 04 68         ; $fe5f: 04 68     Invalid Opcode - NOP $68
            .hex 02            ; $fe61: 02        Invalid Opcode - KIL 
            .hex 22            ; $fe62: 22        Invalid Opcode - KIL 
            .hex 64 02         ; $fe63: 64 02     Invalid Opcode - NOP $02
            PLP                ; $fe65: 28        
            .hex 42            ; $fe66: 42        Invalid Opcode - KIL 
            .hex 02            ; $fe67: 02        Invalid Opcode - KIL 
            .hex 04 30         ; $fe68: 04 30     Invalid Opcode - NOP $30
            .hex 04 30         ; $fe6a: 04 30     Invalid Opcode - NOP $30
            .hex 04 6c         ; $fe6c: 04 6c     Invalid Opcode - NOP $6c
            .hex 02            ; $fe6e: 02        Invalid Opcode - KIL 
            BIT $68            ; $fe6f: 24 68     
            .hex 02            ; $fe71: 02        Invalid Opcode - KIL 
            BIT $0242          ; $fe72: 2c 42 02  
            PHP                ; $fe75: 08        
            ASL $08            ; $fe76: 06 08     
            ASL $08            ; $fe78: 06 08     
            JMP ($2402)        ; $fe7a: 6c 02 24  

;-------------------------------------------------------------------------------
            PLA                ; $fe7d: 68        
            .hex 02            ; $fe7e: 02        Invalid Opcode - KIL 
            BIT $0242          ; $fe7f: 2c 42 02  
            PHP                ; $fe82: 08        
            ASL $08            ; $fe83: 06 08     
            ASL $08            ; $fe85: 06 08     
            BVS __fe8b         ; $fe87: 70 02     
            PLP                ; $fe89: 28        
            .hex 6c            ; $fe8a: 6c        Suspected data
__fe8b:     .hex 02            ; $fe8b: 02        Invalid Opcode - KIL 
            BMI __fed0         ; $fe8c: 30 42     
            .hex 02            ; $fe8e: 02        Invalid Opcode - KIL 
            ASL $0e0c          ; $fe8f: 0e 0c 0e  
            .hex 0c 0e 70      ; $fe92: 0c 0e 70  Invalid Opcode - NOP $700e
            .hex 02            ; $fe95: 02        Invalid Opcode - KIL 
            PLP                ; $fe96: 28        
            JMP ($3002)        ; $fe97: 6c 02 30  

;-------------------------------------------------------------------------------
            .hex 42            ; $fe9a: 42        Invalid Opcode - KIL 
            .hex 02            ; $fe9b: 02        Invalid Opcode - KIL 
            ASL $0e0c          ; $fe9c: 0e 0c 0e  
            .hex 0c 0e 8d      ; $fe9f: 0c 0e 8d  Invalid Opcode - NOP $8d0e
            CMP $e9            ; $fea2: c5 e9     
            STA __e9c5         ; $fea4: 8d c5 e9  
            .hex 8f c9 ed      ; $fea7: 8f c9 ed  Invalid Opcode - SAX __edc9
            .hex 8f c9 ed      ; $feaa: 8f c9 ed  Invalid Opcode - SAX __edc9
            STA ($c9),y        ; $fead: 91 c9     
            CMP $91            ; $feaf: c5 91     
            CMP #$c5           ; $feb1: c9 c5     
            .hex 93 cf         ; $feb3: 93 cf     Invalid Opcode - AHX ($cf),y
            CMP #$b1           ; $feb5: c9 b1     
            .hex ef ed 5a      ; $feb7: ef ed 5a  Invalid Opcode - ISC $5aed
            .hex 5c 5e 60      ; $feba: 5c 5e 60  Invalid Opcode - NOP $605e,x
            LDX #$69           ; $febd: a2 69     
            .hex 67 6b         ; $febf: 67 6b     Invalid Opcode - RRA $6b
            TAY                ; $fec1: a8        
            STY $68            ; $fec2: 84 68     
            ROR $02            ; $fec4: 66 02     
            BIT $60            ; $fec6: 24 60     
            .hex 02            ; $fec8: 02        Invalid Opcode - KIL 
            TXS                ; $fec9: 9a        
            .hex 1a            ; $feca: 1a        Invalid Opcode - NOP 
            STA __e1df,x       ; $fecb: 9d df e1  
            .hex a3 e5         ; $fece: a3 e5     Invalid Opcode - LAX ($e5,x)
__fed0:     .hex e7 a9         ; $fed0: e7 a9     Invalid Opcode - ISC $a9
            .hex eb ed         ; $fed2: eb ed     Invalid Opcode - SBC #$ed
            BEQ __ff18         ; $fed4: f0 42     
            .hex 02            ; $fed6: 02        Invalid Opcode - KIL 
            .hex 04 4a         ; $fed7: 04 4a     Invalid Opcode - NOP $4a
            .hex 02            ; $fed9: 02        Invalid Opcode - KIL 
            .hex cc 02 00      ; $feda: cc 02 00  Bad Addr Mode - CPY $0002
            .hex 72            ; $fedd: 72        Invalid Opcode - KIL 
            .hex 74 76         ; $fede: 74 76     Invalid Opcode - NOP $76,x
            SEI                ; $fee0: 78        
            TSX                ; $fee1: ba        
            .hex 5f 5d 61      ; $fee2: 5f 5d 61  Invalid Opcode - SRE $615d,x
            .hex 9e a8 5e      ; $fee5: 9e a8 5e  Invalid Opcode - SHX $5ea8,y
            .hex 5c 02 1a      ; $fee8: 5c 02 1a  Invalid Opcode - NOP $1a02,x
            SEI                ; $feeb: 78        
            .hex 02            ; $feec: 02        Invalid Opcode - KIL 
            .hex b2            ; $feed: b2        Invalid Opcode - KIL 
            SEC                ; $feee: 38        
            LDA ($db),y        ; $feef: b1 db     
            CMP __e19f,x       ; $fef1: dd 9f e1  
            .hex e3 a5         ; $fef4: e3 a5     Invalid Opcode - ISC ($a5,x)
            .hex e7 e9         ; $fef6: e7 e9     Invalid Opcode - ISC $e9
            CPX $0242          ; $fef8: ec 42 02  
            PLP                ; $fefb: 28        
            ROR __f002         ; $fefc: 6e 02 f0  
            .hex 02            ; $feff: 02        Invalid Opcode - KIL 
__ff00:     .hex 03            ; $ff00: 03        Suspected data
__ff01:     .hex 57 00         ; $ff01: 57 00     Invalid Opcode - SRE $00,x
            BRK                ; $ff03: 00        
            BRK                ; $ff04: 00        
            .hex d4 00         ; $ff05: d4 00     Invalid Opcode - NOP $00,x
            INY                ; $ff07: c8        
            BRK                ; $ff08: 00        
            LDA $b200,x        ; $ff09: bd 00 b2  
            BRK                ; $ff0c: 00        
            TAY                ; $ff0d: a8        
            BRK                ; $ff0e: 00        
            .hex 9f 00 96      ; $ff0f: 9f 00 96  Invalid Opcode - AHX $9600,y
            BRK                ; $ff12: 00        
            STA $7e00          ; $ff13: 8d 00 7e  
            BRK                ; $ff16: 00        
            .hex 76            ; $ff17: 76        Suspected data
__ff18:     BRK                ; $ff18: 00        
            BVS __ff1c         ; $ff19: 70 01     
            .hex ab            ; $ff1b: ab        Suspected data
__ff1c:     ORA ($93,x)        ; $ff1c: 01 93     
            ORA ($7c,x)        ; $ff1e: 01 7c     
            ORA ($67,x)        ; $ff20: 01 67     
            ORA ($52,x)        ; $ff22: 01 52     
            ORA ($3f,x)        ; $ff24: 01 3f     
            ORA ($2d,x)        ; $ff26: 01 2d     
            ORA ($1c,x)        ; $ff28: 01 1c     
            ORA ($0c,x)        ; $ff2a: 01 0c     
            BRK                ; $ff2c: 00        
            SBC __ee00,x       ; $ff2d: fd 00 ee  
            BRK                ; $ff30: 00        
            SBC ($02,x)        ; $ff31: e1 02     
            .hex 3a            ; $ff33: 3a        Invalid Opcode - NOP 
            .hex 02            ; $ff34: 02        Invalid Opcode - KIL 
            .hex 1a            ; $ff35: 1a        Invalid Opcode - NOP 
            ORA ($fc,x)        ; $ff36: 01 fc     
            ORA ($df,x)        ; $ff38: 01 df     
            ORA ($c4,x)        ; $ff3a: 01 c4     
            BRK                ; $ff3c: 00        
            ASL $7504          ; $ff3d: 0e 04 75  
__ff40:     ORA $0a            ; $ff40: 05 0a     
            .hex 14 28         ; $ff42: 14 28     Invalid Opcode - NOP $28,x
            BVC __ff64         ; $ff44: 50 1e     
            ORA $0a            ; $ff46: 05 0a     
            .hex 14 28         ; $ff48: 14 28     Invalid Opcode - NOP $28,x
            BVC __ff6a         ; $ff4a: 50 1e     
            ASL $07            ; $ff4c: 06 07     
            .hex 5a            ; $ff4e: 5a        Invalid Opcode - NOP 
            .hex 5c 5e 60      ; $ff4f: 5c 5e 60  Invalid Opcode - NOP $605e,x
            LDX #$69           ; $ff52: a2 69     
            .hex 67 6b         ; $ff54: 67 6b     Invalid Opcode - RRA $6b
            TAY                ; $ff56: a8        
            STY $68            ; $ff57: 84 68     
            ROR $02            ; $ff59: 66 02     
            BIT $60            ; $ff5b: 24 60     
            .hex 02            ; $ff5d: 02        Invalid Opcode - KIL 
            TXS                ; $ff5e: 9a        
            PLP                ; $ff5f: 28        
            .hex ab ed         ; $ff60: ab ed     Invalid Opcode - LAX #$ed
            .hex ef b1         ; $ff62: ef b1     Suspected data
__ff64:     CMP $c7            ; $ff64: c5 c7     
            .hex 89 cb         ; $ff66: 89 cb     Invalid Opcode - NOP #$cb
            .hex cd d0         ; $ff68: cd d0     Suspected data
__ff6a:     .hex 42            ; $ff6a: 42        Invalid Opcode - KIL 
            .hex 02            ; $ff6b: 02        Invalid Opcode - KIL 
            .hex 04 4a         ; $ff6c: 04 4a     Invalid Opcode - NOP $4a
            .hex 02            ; $ff6e: 02        Invalid Opcode - KIL 
            CPY $a302          ; $ff6f: cc 02 a3  
            .hex e3 e3         ; $ff72: e3 e3     Invalid Opcode - ISC ($e3,x)
            .hex 64 02         ; $ff74: 64 02     Invalid Opcode - NOP $02
            LDX $28            ; $ff76: a6 28     
            ROL                ; $ff78: 2a        
            PLP                ; $ff79: 28        
            ROL                ; $ff7a: 2a        
            PLP                ; $ff7b: 28        
            .hex a7 e9         ; $ff7c: a7 e9     Invalid Opcode - LAX $e9
            CMP $4a            ; $ff7e: c5 4a     
            .hex 02            ; $ff80: 02        Invalid Opcode - KIL 
            STY $2e            ; $ff81: 84 2e     
            LDA #$e7           ; $ff83: a9 e7     
            SBC $a3            ; $ff85: e5 a3     
            .hex e3 e3         ; $ff87: e3 e3     Invalid Opcode - ISC ($e3,x)
            .hex 64 02         ; $ff89: 64 02     Invalid Opcode - NOP $02
            LDX $28            ; $ff8b: a6 28     
            ROL                ; $ff8d: 2a        
            PLP                ; $ff8e: 28        
            ROL                ; $ff8f: 2a        
            PLP                ; $ff90: 28        
            .hex 52            ; $ff91: 52        Invalid Opcode - KIL 
            .hex 02            ; $ff92: 02        Invalid Opcode - KIL 
            ASL $024a          ; $ff93: 0e 4a 02  
            CPY $02            ; $ff96: c4 02     
            BRK                ; $ff98: 00        
            .hex 9b            ; $ff99: 9b        Invalid Opcode - TAS 
            .hex db db 5e      ; $ff9a: db db 5e  Invalid Opcode - DCP $5edb,y
            .hex 02            ; $ff9d: 02        Invalid Opcode - KIL 
            TXS                ; $ff9e: 9a        
            .hex 9e 02 03      ; $ff9f: 9e 02 03  Invalid Opcode - SHX $0302,y
            .hex 9b            ; $ffa2: 9b        Invalid Opcode - TAS 
            .hex db db 5e      ; $ffa3: db db 5e  Invalid Opcode - DCP $5edb,y
            .hex 02            ; $ffa6: 02        Invalid Opcode - KIL 
            TXS                ; $ffa7: 9a        
            .hex 9e 02 48      ; $ffa8: 9e 02 48  Invalid Opcode - SHX $4802,y
            .hex 02            ; $ffab: 02        Invalid Opcode - KIL 
            PHP                ; $ffac: 08        
            .hex 44 02         ; $ffad: 44 02     Invalid Opcode - NOP $02
            INX                ; $ffaf: e8        
            .hex 02            ; $ffb0: 02        Invalid Opcode - KIL 
            LDA #$e9           ; $ffb1: a9 e9     
            SBC #$6c           ; $ffb3: e9 6c     
            .hex 02            ; $ffb5: 02        Invalid Opcode - KIL 
            TAX                ; $ffb6: aa        
            BCS __ffbb         ; $ffb7: b0 02     
            .hex a7 e9         ; $ffb9: a7 e9     Invalid Opcode - LAX $e9
__ffbb:     CMP $4a            ; $ffbb: c5 4a     
            .hex 02            ; $ffbd: 02        Invalid Opcode - KIL 
            STY $2e            ; $ffbe: 84 2e     
            LDA #$e7           ; $ffc0: a9 e7     
            SBC $a9            ; $ffc2: e5 a9     
            SBC #$e9           ; $ffc4: e9 e9     
            JMP ($aa02)        ; $ffc6: 6c 02 aa  

;-------------------------------------------------------------------------------
            BCS __ffcd         ; $ffc9: b0 02     
            CLI                ; $ffcb: 58        
            .hex 02            ; $ffcc: 02        Invalid Opcode - KIL 
__ffcd:     CLC                ; $ffcd: 18        
            .hex 54 02         ; $ffce: 54 02     Invalid Opcode - NOP $02,x
            CPY $2802          ; $ffd0: cc 02 28  
            ROL $28            ; $ffd3: 26 28     
            ROL $e8            ; $ffd5: 26 e8     
            BRK                ; $ffd7: 00        
            BRK                ; $ffd8: 00        
__ffd9:     .hex 50 51         ; $ffd9: 50 51     Illegal Branch - BVC #$51
            EOR ($51),y        ; $ffdb: 51 51     
            EOR ($51),y        ; $ffdd: 51 51     
            EOR ($51),y        ; $ffdf: 51 51     
            EOR ($52),y        ; $ffe1: 51 52     
            .hex 52            ; $ffe3: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe4: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe5: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe6: 52        Invalid Opcode - KIL 
            .hex 52            ; $ffe7: 52        Invalid Opcode - KIL 
            .hex 53 53         ; $ffe8: 53 53     Invalid Opcode - SRE ($53),y
            .hex 53 53         ; $ffea: 53 53     Invalid Opcode - SRE ($53),y
            .hex 53 54         ; $ffec: 53 54     Invalid Opcode - SRE ($54),y
            .hex 54 54         ; $ffee: 54 54     Invalid Opcode - NOP $54,x

;-------------------------------------------------------------------------------
; irq/brk vector
;-------------------------------------------------------------------------------
irq:        .hex 54 55         ; $fff0: 54 55     Invalid Opcode - NOP $55,x
            EOR $55,x          ; $fff2: 55 55     
            LSR $56,x          ; $fff4: 56 56     
            LSR $56,x          ; $fff6: 56 56     
            .hex 57 ff         ; $fff8: 57 ff     Invalid Opcode - SRE $ff,x

;-------------------------------------------------------------------------------
; Vector Table
;-------------------------------------------------------------------------------
vectors:    .dw nmi                        ; $fffa: 76 c0     Vector table
            .dw reset                      ; $fffc: 14 c0     Vector table
            .dw irq                        ; $fffe: f0 ff     Vector table
