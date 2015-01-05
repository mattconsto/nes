;-------------------------------------------------------------------------------
; rom.nes disasembled by DISASM6 v1.4
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; iNES Header
;-------------------------------------------------------------------------------
            .db "NES", $1A     ; Header
            .db 1              ; 1 x 16k PRG banks
            .db 1              ; 1 x 8k CHR banks
            .db %00000001      ; Mirroring: Vertical
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
reset:      SEI                ; $c000: 78        
            LDA #$00           ; $c001: a9 00     
            STA $2001          ; $c003: 8d 01 20  
            STA $2000          ; $c006: 8d 00 20  
            CLD                ; $c009: d8        
            LDX #$ff           ; $c00a: a2 ff     
            TXS                ; $c00c: 9a        
__c00d:     LDA $2002          ; $c00d: ad 02 20  
            BPL __c00d         ; $c010: 10 fb     
__c012:     LDA $2002          ; $c012: ad 02 20  
            BPL __c012         ; $c015: 10 fb     
            JMP __c30c         ; $c017: 4c 0c c3  

;-------------------------------------------------------------------------------
; nmi vector
;-------------------------------------------------------------------------------
nmi:        PHA                ; $c01a: 48        
            TXA                ; $c01b: 8a        
            PHA                ; $c01c: 48        
            TYA                ; $c01d: 98        
            PHA                ; $c01e: 48        
            LDX #$00           ; $c01f: a2 00     
            STX $0b            ; $c021: 86 0b     
            STX $2003          ; $c023: 8e 03 20  
            LDA $60            ; $c026: a5 60     
            BEQ __c03e         ; $c028: f0 14     
            LDA #$19           ; $c02a: a9 19     
            STA $0700          ; $c02c: 8d 00 07  
            LDA #$ec           ; $c02f: a9 ec     
            STA $0701          ; $c031: 8d 01 07  
            LDA #$00           ; $c034: a9 00     
            STA $0702          ; $c036: 8d 02 07  
            LDA #$f8           ; $c039: a9 f8     
            STA $0703          ; $c03b: 8d 03 07  
__c03e:     LDA #$07           ; $c03e: a9 07     
            STA $4014          ; $c040: 8d 14 40  
            LDX #$09           ; $c043: a2 09     
            STX $16            ; $c045: 86 16     
            BNE __c0b3         ; $c047: d0 6a     
__c049:     LDA $0602,y        ; $c049: b9 02 06  
            ORA $0600,y        ; $c04c: 19 00 06  
            PHA                ; $c04f: 48        
            STA $2006          ; $c050: 8d 06 20  
            LDX $0601,y        ; $c053: be 01 06  
            STX $2006          ; $c056: 8e 06 20  
            LDX $0603,y        ; $c059: be 03 06  
            LDA __d9c6,x       ; $c05c: bd c6 d9  
            STA $2007          ; $c05f: 8d 07 20  
            LDA __d9c7,x       ; $c062: bd c7 d9  
            STA $2007          ; $c065: 8d 07 20  
            PLA                ; $c068: 68        
            STA $2006          ; $c069: 8d 06 20  
            LDA $0601,y        ; $c06c: b9 01 06  
            CLC                ; $c06f: 18        
            ADC #$20           ; $c070: 69 20     
            STA $2006          ; $c072: 8d 06 20  
            LDA __d9c8,x       ; $c075: bd c8 d9  
            STA $2007          ; $c078: 8d 07 20  
            LDA __d9c9,x       ; $c07b: bd c9 d9  
            STA $2007          ; $c07e: 8d 07 20  
            LDA #$23           ; $c081: a9 23     
            ORA $0600,y        ; $c083: 19 00 06  
            PHA                ; $c086: 48        
            STA $2006          ; $c087: 8d 06 20  
            LDA $0604,y        ; $c08a: b9 04 06  
            STA $2006          ; $c08d: 8d 06 20  
            TAX                ; $c090: aa        
            LDA $2007          ; $c091: ad 07 20  
            LDA $2007          ; $c094: ad 07 20  
            AND $0606,y        ; $c097: 39 06 06  
            ORA $0607,y        ; $c09a: 19 07 06  
            TAY                ; $c09d: a8        
            PLA                ; $c09e: 68        
            STA $2006          ; $c09f: 8d 06 20  
            STX $2006          ; $c0a2: 8e 06 20  
            STY $2007          ; $c0a5: 8c 07 20  
            LDA #$08           ; $c0a8: a9 08     
            CLC                ; $c0aa: 18        
            ADC $14            ; $c0ab: 65 14     
            STA $14            ; $c0ad: 85 14     
            DEC $16            ; $c0af: c6 16     
            BEQ __c0b9         ; $c0b1: f0 06     
__c0b3:     LDY $14            ; $c0b3: a4 14     
            CPY $15            ; $c0b5: c4 15     
            BNE __c049         ; $c0b7: d0 90     
__c0b9:     LDA $72            ; $c0b9: a5 72     
            BEQ __c0e4         ; $c0bb: f0 27     
            LDA #$22           ; $c0bd: a9 22     
            LDX #$68           ; $c0bf: a2 68     
            JSR __c196         ; $c0c1: 20 96 c1  
            LDY #$b0           ; $c0c4: a0 b0     
            LDA $5f            ; $c0c6: a5 5f     
            BNE __c0cc         ; $c0c8: d0 02     
            LDY #$40           ; $c0ca: a0 40     
__c0cc:     STY $2007          ; $c0cc: 8c 07 20  
            LDA #$22           ; $c0cf: a9 22     
            LDX #$70           ; $c0d1: a2 70     
            JSR __c196         ; $c0d3: 20 96 c1  
            LDY #$b0           ; $c0d6: a0 b0     
            LDA $5f            ; $c0d8: a5 5f     
            BEQ __c0de         ; $c0da: f0 02     
            LDY #$40           ; $c0dc: a0 40     
__c0de:     STY $2007          ; $c0de: 8c 07 20  
            JMP __c126         ; $c0e1: 4c 26 c1  

;-------------------------------------------------------------------------------
__c0e4:     LDA $60            ; $c0e4: a5 60     
            BEQ __c126         ; $c0e6: f0 3e     
            LDA $16            ; $c0e8: a5 16     
            CMP #$04           ; $c0ea: c9 04     
            BCC __c126         ; $c0ec: 90 38     
            LDA #$20           ; $c0ee: a9 20     
            LDX #$4b           ; $c0f0: a2 4b     
            JSR __c196         ; $c0f2: 20 96 c1  
            LDX #$00           ; $c0f5: a2 00     
__c0f7:     LDA $61,x          ; $c0f7: b5 61     
            BNE __c107         ; $c0f9: d0 0c     
            LDA #$3a           ; $c0fb: a9 3a     
            STA $2007          ; $c0fd: 8d 07 20  
            INX                ; $c100: e8        
            CPX #$07           ; $c101: e0 07     
            BNE __c0f7         ; $c103: d0 f2     
            BEQ __c114         ; $c105: f0 0d     
__c107:     LDA $61,x          ; $c107: b5 61     
            CLC                ; $c109: 18        
            ADC #$30           ; $c10a: 69 30     
            STA $2007          ; $c10c: 8d 07 20  
            INX                ; $c10f: e8        
            CPX #$07           ; $c110: e0 07     
            BNE __c107         ; $c112: d0 f3     
__c114:     LDA #$20           ; $c114: a9 20     
            LDX #$46           ; $c116: a2 46     
            JSR __c196         ; $c118: 20 96 c1  
            LDA $93            ; $c11b: a5 93     
            CMP #$ff           ; $c11d: c9 ff     
            BNE __c123         ; $c11f: d0 02     
            LDA #$00           ; $c121: a9 00     
__c123:     JSR __df48         ; $c123: 20 48 df  
__c126:     LDA $2002          ; $c126: ad 02 20  
            JSR __c296         ; $c129: 20 96 c2  
            INC $33            ; $c12c: e6 33     
            LDA $6a            ; $c12e: a5 6a     
            BEQ __c13e         ; $c130: f0 0c     
            INC $69            ; $c132: e6 69     
            LDA $69            ; $c134: a5 69     
            CMP #$3c           ; $c136: c9 3c     
            BCC __c13e         ; $c138: 90 04     
            LDA #$00           ; $c13a: a9 00     
            STA $6a            ; $c13c: 85 6a     
__c13e:     STA $69            ; $c13e: 85 69     
            JSR __c19d         ; $c140: 20 9d c1  
            JSR __e4c7         ; $c143: 20 c7 e4  
            JSR __e65f         ; $c146: 20 5f e6  
            LDA $38            ; $c149: a5 38     
            BEQ __c16e         ; $c14b: f0 21     
            LDA $59            ; $c14d: a5 59     
            BNE __c16e         ; $c14f: d0 1d     
            LDA #$0e           ; $c151: a9 0e     
            STA $4010          ; $c153: 8d 10 40  
            LDA #$00           ; $c156: a9 00     
            STA $38            ; $c158: 85 38     
            LDA #$c0           ; $c15a: a9 c0     
            STA $4012          ; $c15c: 8d 12 40  
            LDA #$ff           ; $c15f: a9 ff     
            STA $4013          ; $c161: 8d 13 40  
            LDA #$0f           ; $c164: a9 0f     
            STA $4015          ; $c166: 8d 15 40  
            LDA #$1f           ; $c169: a9 1f     
            STA $4015          ; $c16b: 8d 15 40  
__c16e:     LDA $60            ; $c16e: a5 60     
            BEQ __c18a         ; $c170: f0 18     
__c172:     LDA $2002          ; $c172: ad 02 20  
            AND #$40           ; $c175: 29 40     
            BNE __c172         ; $c177: d0 f9     
__c179:     LDA $2002          ; $c179: ad 02 20  
            AND #$40           ; $c17c: 29 40     
            BEQ __c179         ; $c17e: f0 f9     
            LDA $0e            ; $c180: a5 0e     
            STA $2005          ; $c182: 8d 05 20  
            LDA $0f            ; $c185: a5 0f     
            STA $2005          ; $c187: 8d 05 20  
__c18a:     LDA #$05           ; $c18a: a9 05     
            EOR $db            ; $c18c: 45 db     
            STA $db            ; $c18e: 85 db     
            PLA                ; $c190: 68        
            TAY                ; $c191: a8        
            PLA                ; $c192: 68        
            TAX                ; $c193: aa        
            PLA                ; $c194: 68        
            RTI                ; $c195: 40        

;-------------------------------------------------------------------------------
__c196:     STA $2006          ; $c196: 8d 06 20  
            STX $2006          ; $c199: 8e 06 20  
            RTS                ; $c19c: 60        

;-------------------------------------------------------------------------------
__c19d:     JSR __c1bf         ; $c19d: 20 bf c1  
            LDA $12            ; $c1a0: a5 12     
            STA $10            ; $c1a2: 85 10     
            LDA $13            ; $c1a4: a5 13     
            STA $11            ; $c1a6: 85 11     
            JSR __c1bf         ; $c1a8: 20 bf c1  
            LDA $12            ; $c1ab: a5 12     
            CMP $10            ; $c1ad: c5 10     
            BNE __c1b8         ; $c1af: d0 07     
            LDA $13            ; $c1b1: a5 13     
            CMP $11            ; $c1b3: c5 11     
            BNE __c1b8         ; $c1b5: d0 01     
            RTS                ; $c1b7: 60        

;-------------------------------------------------------------------------------
__c1b8:     LDA #$00           ; $c1b8: a9 00     
            STA $12            ; $c1ba: 85 12     
            STA $13            ; $c1bc: 85 13     
            RTS                ; $c1be: 60        

;-------------------------------------------------------------------------------
__c1bf:     LDA #$01           ; $c1bf: a9 01     
            STA $4016          ; $c1c1: 8d 16 40  
            LDA #$00           ; $c1c4: a9 00     
            STA $4016          ; $c1c6: 8d 16 40  
            TAX                ; $c1c9: aa        
            LDY #$08           ; $c1ca: a0 08     
__c1cc:     TXA                ; $c1cc: 8a        
            ASL                ; $c1cd: 0a        
            TAX                ; $c1ce: aa        
            LDA $4016          ; $c1cf: ad 16 40  
            JSR __c1eb         ; $c1d2: 20 eb c1  
            BNE __c1cc         ; $c1d5: d0 f5     
            STX $12            ; $c1d7: 86 12     
            LDX #$00           ; $c1d9: a2 00     
            LDY #$08           ; $c1db: a0 08     
__c1dd:     TXA                ; $c1dd: 8a        
            ASL                ; $c1de: 0a        
            TAX                ; $c1df: aa        
            LDA $4017          ; $c1e0: ad 17 40  
            JSR __c1eb         ; $c1e3: 20 eb c1  
            BNE __c1dd         ; $c1e6: d0 f5     
            STX $13            ; $c1e8: 86 13     
            RTS                ; $c1ea: 60        

;-------------------------------------------------------------------------------
__c1eb:     AND #$03           ; $c1eb: 29 03     
            BEQ __c1f0         ; $c1ed: f0 01     
            INX                ; $c1ef: e8        
__c1f0:     DEY                ; $c1f0: 88        
            RTS                ; $c1f1: 60        

;-------------------------------------------------------------------------------
__c1f2:     JSR __c257         ; $c1f2: 20 57 c2  
            JSR __c2b9         ; $c1f5: 20 b9 c2  
            LDA #$10           ; $c1f8: a9 10     
            STA $0c            ; $c1fa: 85 0c     
            STA $2000          ; $c1fc: 8d 00 20  
            LDA #$00           ; $c1ff: a9 00     
            STA $0e            ; $c201: 85 0e     
            STA $14            ; $c203: 85 14     
            STA $15            ; $c205: 85 15     
            STA $0f            ; $c207: 85 0f     
            JSR __c268         ; $c209: 20 68 c2  
            JSR __c257         ; $c20c: 20 57 c2  
            JSR __c28b         ; $c20f: 20 8b c2  
            JSR __c2c3         ; $c212: 20 c3 c2  
__c215:     LDA #$20           ; $c215: a9 20     
            LDX #$00           ; $c217: a2 00     
            JSR __c196         ; $c219: 20 96 c1  
            LDY #$08           ; $c21c: a0 08     
            LDA #$b0           ; $c21e: a9 b0     
__c220:     STA $2007          ; $c220: 8d 07 20  
            DEX                ; $c223: ca        
            BNE __c220         ; $c224: d0 fa     
            DEY                ; $c226: 88        
            BNE __c220         ; $c227: d0 f7     
            LDA #$23           ; $c229: a9 23     
            LDX #$c0           ; $c22b: a2 c0     
            JSR __c196         ; $c22d: 20 96 c1  
            LDX #$40           ; $c230: a2 40     
            LDA #$00           ; $c232: a9 00     
__c234:     STA $2007          ; $c234: 8d 07 20  
            DEX                ; $c237: ca        
            BNE __c234         ; $c238: d0 fa     
            RTS                ; $c23a: 60        

;-------------------------------------------------------------------------------
__c23b:     JSR __c2b9         ; $c23b: 20 b9 c2  
            JSR __c28b         ; $c23e: 20 8b c2  
            LDA #$0e           ; $c241: a9 0e     
            JSR __c25c         ; $c243: 20 5c c2  
            JSR __c24c         ; $c246: 20 4c c2  
            JMP __c2b0         ; $c249: 4c b0 c2  

;-------------------------------------------------------------------------------
__c24c:     LDA #$00           ; $c24c: a9 00     
            STA $2003          ; $c24e: 8d 03 20  
            LDA #$07           ; $c251: a9 07     
            STA $4014          ; $c253: 8d 14 40  
            RTS                ; $c256: 60        

;-------------------------------------------------------------------------------
__c257:     JSR __c28b         ; $c257: 20 8b c2  
            LDA #$00           ; $c25a: a9 00     
__c25c:     STA $2001          ; $c25c: 8d 01 20  
__c25f:     STA $0d            ; $c25f: 85 0d     
            RTS                ; $c261: 60        

;-------------------------------------------------------------------------------
__c262:     LDA $0d            ; $c262: a5 0d     
            ORA #$10           ; $c264: 09 10     
            BNE __c25f         ; $c266: d0 f7     
__c268:     LDY #$1c           ; $c268: a0 1c     
            LDA #$f8           ; $c26a: a9 f8     
__c26c:     STA $0700,y        ; $c26c: 99 00 07  
            STA $0720,y        ; $c26f: 99 20 07  
            STA $0740,y        ; $c272: 99 40 07  
            STA $0760,y        ; $c275: 99 60 07  
            STA $0780,y        ; $c278: 99 80 07  
            STA $07a0,y        ; $c27b: 99 a0 07  
            STA $07c0,y        ; $c27e: 99 c0 07  
            STA $07e0,y        ; $c281: 99 e0 07  
            DEY                ; $c284: 88        
            DEY                ; $c285: 88        
            DEY                ; $c286: 88        
            DEY                ; $c287: 88        
            BPL __c26c         ; $c288: 10 e2     
            RTS                ; $c28a: 60        

;-------------------------------------------------------------------------------
__c28b:     LDA $2002          ; $c28b: ad 02 20  
            BMI __c28b         ; $c28e: 30 fb     
__c290:     LDA $2002          ; $c290: ad 02 20  
            BPL __c290         ; $c293: 10 fb     
            RTS                ; $c295: 60        

;-------------------------------------------------------------------------------
__c296:     LDA $0d            ; $c296: a5 0d     
            STA $2001          ; $c298: 8d 01 20  
            LDA #$00           ; $c29b: a9 00     
            LDX #$00           ; $c29d: a2 00     
            JSR __c196         ; $c29f: 20 96 c1  
            LDA #$00           ; $c2a2: a9 00     
            STA $2005          ; $c2a4: 8d 05 20  
            STA $2005          ; $c2a7: 8d 05 20  
            LDA $0c            ; $c2aa: a5 0c     
            STA $2000          ; $c2ac: 8d 00 20  
            RTS                ; $c2af: 60        

;-------------------------------------------------------------------------------
__c2b0:     JSR __c28b         ; $c2b0: 20 8b c2  
            LDA $0c            ; $c2b3: a5 0c     
            ORA #$80           ; $c2b5: 09 80     
            BNE __c2bd         ; $c2b7: d0 04     
__c2b9:     LDA $0c            ; $c2b9: a5 0c     
            AND #$7f           ; $c2bb: 29 7f     
__c2bd:     STA $0c            ; $c2bd: 85 0c     
            STA $2000          ; $c2bf: 8d 00 20  
            RTS                ; $c2c2: 60        

;-------------------------------------------------------------------------------
__c2c3:     LDA #$3f           ; $c2c3: a9 3f     
            LDX #$00           ; $c2c5: a2 00     
            JSR __c196         ; $c2c7: 20 96 c1  
            LDY #$20           ; $c2ca: a0 20     
__c2cc:     LDA __c2e7,x       ; $c2cc: bd e7 c2  
            STA $2007          ; $c2cf: 8d 07 20  
            INX                ; $c2d2: e8        
            DEY                ; $c2d3: 88        
            BNE __c2cc         ; $c2d4: d0 f6     
__c2d6:     LDA #$3f           ; $c2d6: a9 3f     
            STA $2006          ; $c2d8: 8d 06 20  
            LDA #$00           ; $c2db: a9 00     
            STA $2006          ; $c2dd: 8d 06 20  
            STA $2006          ; $c2e0: 8d 06 20  
            STA $2006          ; $c2e3: 8d 06 20  
            RTS                ; $c2e6: 60        

;-------------------------------------------------------------------------------
__c2e7:     ORA $100f,y        ; $c2e7: 19 0f 10  
            BMI __c305         ; $c2ea: 30 19     
            ASL $26,x          ; $c2ec: 16 26     
            ROL $19,x          ; $c2ee: 36 19     
            .hex 0f 18 28      ; $c2f0: 0f 18 28  Invalid Opcode - SLO $2818
            ORA $170f,y        ; $c2f3: 19 0f 17  
            .hex 07 19         ; $c2f6: 07 19     Invalid Opcode - SLO $19
            BMI __c31b         ; $c2f8: 30 21     
            ROL $19            ; $c2fa: 26 19     
            .hex 0f 26 30      ; $c2fc: 0f 26 30  Invalid Opcode - SLO $3026
            ORA $150f,y        ; $c2ff: 19 0f 15  
            BMI __c31d         ; $c302: 30 19     
            .hex 0f            ; $c304: 0f        Suspected data
__c305:     AND ($30,x)        ; $c305: 21 30     
__c307:     LDA $12            ; $c307: a5 12     
            BNE __c307         ; $c309: d0 fc     
            RTS                ; $c30b: 60        

;-------------------------------------------------------------------------------
__c30c:     LDY #$00           ; $c30c: a0 00     
            STY $e0            ; $c30e: 84 e0     
            INY                ; $c310: c8        
            STY $e1            ; $c311: 84 e1     
            DEY                ; $c313: 88        
            TYA                ; $c314: 98        
            LDX #$07           ; $c315: a2 07     
__c317:     STA ($e0),y        ; $c317: 91 e0     
            INY                ; $c319: c8        
            .hex d0            ; $c31a: d0        Suspected data
__c31b:     .hex fb e6         ; $c31b: fb e6     Suspected data
__c31d:     SBC ($ca,x)        ; $c31d: e1 ca     
            BNE __c317         ; $c31f: d0 f6     
            LDX #$00           ; $c321: a2 00     
            LDY $08            ; $c323: a4 08     
            CPY #$93           ; $c325: c0 93     
            BNE __c333         ; $c327: d0 0a     
            LDY $09            ; $c329: a4 09     
            BNE __c333         ; $c32b: d0 06     
            LDY $0a            ; $c32d: a4 0a     
            BNE __c333         ; $c32f: d0 02     
            LDX #$08           ; $c331: a2 08     
__c333:     STA $00,x          ; $c333: 95 00     
            INX                ; $c335: e8        
            BNE __c333         ; $c336: d0 fb     
            LDA #$93           ; $c338: a9 93     
            STA $08            ; $c33a: 85 08     
__c33c:     JSR __c1f2         ; $c33c: 20 f2 c1  
            LDA #$00           ; $c33f: a9 00     
            STA $db            ; $c341: 85 db     
            JSR __e642         ; $c343: 20 42 e6  
            LDA #$01           ; $c346: a9 01     
            STA $b5            ; $c348: 85 b5     
__c34a:     LDX #$ff           ; $c34a: a2 ff     
            TXS                ; $c34c: 9a        
            LDA #$0f           ; $c34d: a9 0f     
            STA $4015          ; $c34f: 8d 15 40  
            LDA #$00           ; $c352: a9 00     
            STA $38            ; $c354: 85 38     
            STA $59            ; $c356: 85 59     
            STA $b2            ; $c358: 85 b2     
            STA $60            ; $c35a: 85 60     
            STA $70            ; $c35c: 85 70     
            JSR __de83         ; $c35e: 20 83 de  
            JSR __c2b0         ; $c361: 20 b0 c2  
            LDA #$01           ; $c364: a9 01     
            STA $72            ; $c366: 85 72     
__c368:     LDA $12            ; $c368: a5 12     
            BNE __c368         ; $c36a: d0 fc     
__c36c:     LDA #$08           ; $c36c: a9 08     
            STA $70            ; $c36e: 85 70     
__c370:     JSR __cbfb         ; $c370: 20 fb cb  
            LDA $12            ; $c373: a5 12     
            AND #$10           ; $c375: 29 10     
            BNE __c398         ; $c377: d0 1f     
            LDA $12            ; $c379: a5 12     
            AND #$20           ; $c37b: 29 20     
            BEQ __c38b         ; $c37d: f0 0c     
            LDA $5f            ; $c37f: a5 5f     
            EOR #$01           ; $c381: 49 01     
            STA $5f            ; $c383: 85 5f     
            JSR __c307         ; $c385: 20 07 c3  
            JMP __c36c         ; $c388: 4c 6c c3  

;-------------------------------------------------------------------------------
__c38b:     JSR __d670         ; $c38b: 20 70 d6  
            DEC $71            ; $c38e: c6 71     
            BNE __c370         ; $c390: d0 de     
            DEC $70            ; $c392: c6 70     
            BNE __c370         ; $c394: d0 da     
            INC $59            ; $c396: e6 59     
__c398:     LDA $59            ; $c398: a5 59     
            BNE __c3a3         ; $c39a: d0 07     
            LDA $5f            ; $c39c: a5 5f     
            BEQ __c3a3         ; $c39e: f0 03     
            JSR __da8e         ; $c3a0: 20 8e da  
__c3a3:     LDA #$00           ; $c3a3: a9 00     
            STA $72            ; $c3a5: 85 72     
            JSR __c307         ; $c3a7: 20 07 c3  
            LDA #$02           ; $c3aa: a9 02     
            STA $68            ; $c3ac: 85 68     
            LDA $59            ; $c3ae: a5 59     
            BNE __c3b6         ; $c3b0: d0 04     
            LDA $5f            ; $c3b2: a5 5f     
            BNE __c40a         ; $c3b4: d0 54     
__c3b6:     LDA #$01           ; $c3b6: a9 01     
            STA $58            ; $c3b8: 85 58     
            LDA $59            ; $c3ba: a5 59     
            BNE __c3c7         ; $c3bc: d0 09     
            LDX #$06           ; $c3be: a2 06     
            LDA #$00           ; $c3c0: a9 00     
__c3c2:     STA $61,x          ; $c3c2: 95 61     
            DEX                ; $c3c4: ca        
            BPL __c3c2         ; $c3c5: 10 fb     
__c3c7:     LDA #$10           ; $c3c7: a9 10     
            STA $73            ; $c3c9: 85 73     
            LDA #$00           ; $c3cb: a9 00     
            STA $74            ; $c3cd: 85 74     
            STA $77            ; $c3cf: 85 77     
            STA $75            ; $c3d1: 85 75     
            STA $76            ; $c3d3: 85 76     
            STA $79            ; $c3d5: 85 79     
            STA $94            ; $c3d7: 85 94     
            LDA $59            ; $c3d9: a5 59     
            BEQ __c40a         ; $c3db: f0 2d     
            LDA #$09           ; $c3dd: a9 09     
            STA $74            ; $c3df: 85 74     
            LDA #$40           ; $c3e1: a9 40     
            STA $73            ; $c3e3: 85 73     
            LDA #$01           ; $c3e5: a9 01     
            STA $77            ; $c3e7: 85 77     
            LDA #$00           ; $c3e9: a9 00     
            STA $4015          ; $c3eb: 8d 15 40  
            STA $54            ; $c3ee: 85 54     
            STA $55            ; $c3f0: 85 55     
            STA $56            ; $c3f2: 85 56     
            STA $57            ; $c3f4: 85 57     
            STA $33            ; $c3f6: 85 33     
            LDA #$f4           ; $c3f8: a9 f4     
            STA $ac            ; $c3fa: 85 ac     
            LDA #$ed           ; $c3fc: a9 ed     
            STA $ad            ; $c3fe: 85 ad     
            LDA __edf2         ; $c400: ad f2 ed  
            STA $ae            ; $c403: 85 ae     
            LDA __edf3         ; $c405: ad f3 ed  
            STA $af            ; $c408: 85 af     
__c40a:     LDA #$00           ; $c40a: a9 00     
            STA $78            ; $c40c: 85 78     
            STA $7a            ; $c40e: 85 7a     
__c410:     LDA #$00           ; $c410: a9 00     
            STA $b1            ; $c412: 85 b1     
            STA $a8            ; $c414: 85 a8     
            STA $60            ; $c416: 85 60     
            STA $9e            ; $c418: 85 9e     
            STA $9f            ; $c41a: 85 9f     
            STA $9c            ; $c41c: 85 9c     
            STA $a0            ; $c41e: 85 a0     
            STA $a1            ; $c420: 85 a1     
            STA $a2            ; $c422: 85 a2     
            STA $a3            ; $c424: 85 a3     
            STA $a4            ; $c426: 85 a4     
            STA $a5            ; $c428: 85 a5     
            STA $a6            ; $c42a: 85 a6     
            STA $a7            ; $c42c: 85 a7     
            JSR __de1d         ; $c42e: 20 1d de  
            LDA #$02           ; $c431: a9 02     
            STA $b5            ; $c433: 85 b5     
            JSR __c60b         ; $c435: 20 0b c6  
            LDA #$03           ; $c438: a9 03     
            STA $b5            ; $c43a: 85 b5     
            JSR __c2b9         ; $c43c: 20 b9 c2  
            JSR __ca4b         ; $c43f: 20 4b ca  
            JSR __c5ce         ; $c442: 20 ce c5  
            JSR __e4af         ; $c445: 20 af e4  
            JSR __c5ff         ; $c448: 20 ff c5  
            LDA #$c8           ; $c44b: a9 c8     
            STA $93            ; $c44d: 85 93     
__c44f:     JSR __c613         ; $c44f: 20 13 c6  
            JSR __c268         ; $c452: 20 68 c2  
            JSR __cc36         ; $c455: 20 36 cc  
            JSR __c96a         ; $c458: 20 6a c9  
            JSR __ce5b         ; $c45b: 20 5b ce  
            JSR __cfb0         ; $c45e: 20 b0 cf  
            JSR __ca1b         ; $c461: 20 1b ca  
            JSR __c644         ; $c464: 20 44 c6  
            JSR __e399         ; $c467: 20 99 e3  
            LDA $5d            ; $c46a: a5 5d     
            BNE __c481         ; $c46c: d0 13     
            LDA $5e            ; $c46e: a5 5e     
            BNE __c4bf         ; $c470: d0 4d     
            LDA $33            ; $c472: a5 33     
            AND #$03           ; $c474: 29 03     
            BNE __c44f         ; $c476: d0 d7     
            JSR __c79d         ; $c478: 20 9d c7  
            JSR __c66c         ; $c47b: 20 6c c6  
            JMP __c44f         ; $c47e: 4c 4f c4  

;-------------------------------------------------------------------------------
__c481:     LDA $59            ; $c481: a5 59     
            BNE __c4c3         ; $c483: d0 3e     
            LDA #$00           ; $c485: a9 00     
            STA $76            ; $c487: 85 76     
            STA $78            ; $c489: 85 78     
            STA $77            ; $c48b: 85 77     
            STA $79            ; $c48d: 85 79     
            STA $7a            ; $c48f: 85 7a     
            LDA #$08           ; $c491: a9 08     
            STA $b5            ; $c493: 85 b5     
            JSR __c60b         ; $c495: 20 0b c6  
            DEC $68            ; $c498: c6 68     
            BMI __c49f         ; $c49a: 30 03     
            JMP __c410         ; $c49c: 4c 10 c4  

;-------------------------------------------------------------------------------
__c49f:     LDA #$00           ; $c49f: a9 00     
            STA $60            ; $c4a1: 85 60     
            JSR __dd3e         ; $c4a3: 20 3e dd  
            LDA #$09           ; $c4a6: a9 09     
            STA $b5            ; $c4a8: 85 b5     
__c4aa:     LDA $12            ; $c4aa: a5 12     
            AND #$10           ; $c4ac: 29 10     
            BNE __c4b4         ; $c4ae: d0 04     
            LDA $b5            ; $c4b0: a5 b5     
            BNE __c4aa         ; $c4b2: d0 f6     
__c4b4:     LDA #$00           ; $c4b4: a9 00     
            STA $b5            ; $c4b6: 85 b5     
__c4b8:     LDA $12            ; $c4b8: a5 12     
            BEQ __c4b8         ; $c4ba: f0 fc     
            JMP __c34a         ; $c4bc: 4c 4a c3  

;-------------------------------------------------------------------------------
__c4bf:     LDA $59            ; $c4bf: a5 59     
            BEQ __c4d5         ; $c4c1: f0 12     
__c4c3:     LDA #$00           ; $c4c3: a9 00     
            STA $b5            ; $c4c5: 85 b5     
            INC $b0            ; $c4c7: e6 b0     
            LDA $b0            ; $c4c9: a5 b0     
            AND #$03           ; $c4cb: 29 03     
            BEQ __c4d2         ; $c4cd: f0 03     
            JMP __c34a         ; $c4cf: 4c 4a c3  

;-------------------------------------------------------------------------------
__c4d2:     JMP __c33c         ; $c4d2: 4c 3c c3  

;-------------------------------------------------------------------------------
__c4d5:     LDA #$0a           ; $c4d5: a9 0a     
            STA $b5            ; $c4d7: 85 b5     
            JSR __c60b         ; $c4d9: 20 0b c6  
            INC $68            ; $c4dc: e6 68     
            INC $58            ; $c4de: e6 58     
            LDY #$00           ; $c4e0: a0 00     
            LDA $58            ; $c4e2: a5 58     
            CMP #$33           ; $c4e4: c9 33     
            BNE __c4eb         ; $c4e6: d0 03     
            JMP __c56c         ; $c4e8: 4c 6c c5  

;-------------------------------------------------------------------------------
__c4eb:     INY                ; $c4eb: c8        
            SEC                ; $c4ec: 38        
            SBC #$05           ; $c4ed: e9 05     
            BCS __c4eb         ; $c4ef: b0 fa     
            DEY                ; $c4f1: 88        
            CPY #$08           ; $c4f2: c0 08     
            BCC __c4f8         ; $c4f4: 90 02     
            LDY #$08           ; $c4f6: a0 08     
__c4f8:     STY $7e            ; $c4f8: 84 7e     
            ADC #$05           ; $c4fa: 69 05     
            CMP #$01           ; $c4fc: c9 01     
            BEQ __c503         ; $c4fe: f0 03     
            JMP __c410         ; $c500: 4c 10 c4  

;-------------------------------------------------------------------------------
__c503:     LDA #$00           ; $c503: a9 00     
            STA $60            ; $c505: 85 60     
            JSR __de53         ; $c507: 20 53 de  
            LDA #$02           ; $c50a: a9 02     
            STA $b5            ; $c50c: 85 b5     
            JSR __c60b         ; $c50e: 20 0b c6  
            JSR __c2b9         ; $c511: 20 b9 c2  
            JSR __ca72         ; $c514: 20 72 ca  
            JSR __c5ce         ; $c517: 20 ce c5  
            JSR __c5ff         ; $c51a: 20 ff c5  
            JSR __cbc5         ; $c51d: 20 c5 cb  
            LDA #$06           ; $c520: a9 06     
            STA $b5            ; $c522: 85 b5     
            LDA #$01           ; $c524: a9 01     
            STA $7a            ; $c526: 85 7a     
            STA $7d            ; $c528: 85 7d     
            LDA #$1e           ; $c52a: a9 1e     
            STA $93            ; $c52c: 85 93     
__c52e:     JSR __c613         ; $c52e: 20 13 c6  
            LDA $93            ; $c531: a5 93     
            BEQ __c55c         ; $c533: f0 27     
            JSR __c268         ; $c535: 20 68 c2  
            JSR __c8ed         ; $c538: 20 ed c8  
            JSR __cc36         ; $c53b: 20 36 cc  
            JSR __c96a         ; $c53e: 20 6a c9  
            JSR __ce5b         ; $c541: 20 5b ce  
            JSR __cfb0         ; $c544: 20 b0 cf  
            JSR __ca1b         ; $c547: 20 1b ca  
            JSR __c65f         ; $c54a: 20 5f c6  
            LDA $33            ; $c54d: a5 33     
            AND #$01           ; $c54f: 29 01     
            BNE __c52e         ; $c551: d0 db     
            JSR __c79d         ; $c553: 20 9d c7  
            JSR __c66c         ; $c556: 20 6c c6  
            JMP __c52e         ; $c559: 4c 2e c5  

;-------------------------------------------------------------------------------
__c55c:     LDA #$0a           ; $c55c: a9 0a     
            STA $b5            ; $c55e: 85 b5     
            JSR __c60b         ; $c560: 20 0b c6  
            LDA #$00           ; $c563: a9 00     
            STA $7d            ; $c565: 85 7d     
            STA $7a            ; $c567: 85 7a     
            JMP __c410         ; $c569: 4c 10 c4  

;-------------------------------------------------------------------------------
__c56c:     JSR __c1f2         ; $c56c: 20 f2 c1  
            JSR __dbf9         ; $c56f: 20 f9 db  
            JSR __ca72         ; $c572: 20 72 ca  
            LDA #$08           ; $c575: a9 08     
            STA $29            ; $c577: 85 29     
            STA $2b            ; $c579: 85 2b     
            LDA #$00           ; $c57b: a9 00     
            STA $60            ; $c57d: 85 60     
            STA $28            ; $c57f: 85 28     
            LDA #$09           ; $c581: a9 09     
            STA $2a            ; $c583: 85 2a     
            LDA #$07           ; $c585: a9 07     
            STA $b5            ; $c587: 85 b5     
            JSR __c262         ; $c589: 20 62 c2  
            JSR __c2b0         ; $c58c: 20 b0 c2  
__c58f:     JSR __cbfb         ; $c58f: 20 fb cb  
            LDA #$01           ; $c592: a9 01     
__c594:     STA $39            ; $c594: 85 39     
            JSR __c268         ; $c596: 20 68 c2  
            JSR __ce5b         ; $c599: 20 5b ce  
            LDA $33            ; $c59c: a5 33     
            ROR                ; $c59e: 6a        
            BCS __c5a4         ; $c59f: b0 03     
            JSR __cdd4         ; $c5a1: 20 d4 cd  
__c5a4:     LDA $28            ; $c5a4: a5 28     
            CMP #$08           ; $c5a6: c9 08     
            BNE __c58f         ; $c5a8: d0 e5     
__c5aa:     JSR __cbfb         ; $c5aa: 20 fb cb  
            LDA #$01           ; $c5ad: a9 01     
            STA $39            ; $c5af: 85 39     
            JSR __c268         ; $c5b1: 20 68 c2  
            JSR __cea7         ; $c5b4: 20 a7 ce  
            LDA $33            ; $c5b7: a5 33     
            ROR                ; $c5b9: 6a        
            BCS __c5bf         ; $c5ba: b0 03     
            JSR __cdd4         ; $c5bc: 20 d4 cd  
__c5bf:     LDA $b5            ; $c5bf: a5 b5     
            BNE __c5aa         ; $c5c1: d0 e7     
__c5c3:     LDA $12            ; $c5c3: a5 12     
            BEQ __c5c3         ; $c5c5: f0 fc     
            LDA #$01           ; $c5c7: a9 01     
            STA $58            ; $c5c9: 85 58     
            JMP __c410         ; $c5cb: 4c 10 c4  

;-------------------------------------------------------------------------------
__c5ce:     LDA #$01           ; $c5ce: a9 01     
            STA $28            ; $c5d0: 85 28     
            STA $2a            ; $c5d2: 85 2a     
            LDA #$08           ; $c5d4: a9 08     
            STA $29            ; $c5d6: 85 29     
            STA $2b            ; $c5d8: 85 2b     
            LDA #$00           ; $c5da: a9 00     
            STA $2c            ; $c5dc: 85 2c     
            STA $5d            ; $c5de: 85 5d     
            STA $5c            ; $c5e0: 85 5c     
            STA $5e            ; $c5e2: 85 5e     
            JSR __cbc5         ; $c5e4: 20 c5 cb  
            JSR __d69a         ; $c5e7: 20 9a d6  
            JSR __cb06         ; $c5ea: 20 06 cb  
            JSR __c28b         ; $c5ed: 20 8b c2  
            JSR __c2c3         ; $c5f0: 20 c3 c2  
            LDX $58            ; $c5f3: a6 58     
            LDA __cc03,x       ; $c5f5: bd 03 cc  
            STA $5b            ; $c5f8: 85 5b     
            LDA #$01           ; $c5fa: a9 01     
            STA $60            ; $c5fc: 85 60     
            RTS                ; $c5fe: 60        

;-------------------------------------------------------------------------------
__c5ff:     JSR __c268         ; $c5ff: 20 68 c2  
            JSR __c2b0         ; $c602: 20 b0 c2  
            JSR __c23b         ; $c605: 20 3b c2  
            JMP __c262         ; $c608: 4c 62 c2  

;-------------------------------------------------------------------------------
__c60b:     LDA $b5            ; $c60b: a5 b5     
            BNE __c60b         ; $c60d: d0 fc     
            RTS                ; $c60f: 60        

;-------------------------------------------------------------------------------
__c610:     JMP __c4c3         ; $c610: 4c c3 c4  

;-------------------------------------------------------------------------------
__c613:     JSR __cbfb         ; $c613: 20 fb cb  
            LDA #$01           ; $c616: a9 01     
            STA $39            ; $c618: 85 39     
            LDA $12            ; $c61a: a5 12     
            AND #$10           ; $c61c: 29 10     
            BEQ __c643         ; $c61e: f0 23     
            LDA $59            ; $c620: a5 59     
            BNE __c610         ; $c622: d0 ec     
            LDA #$01           ; $c624: a9 01     
            STA $b2            ; $c626: 85 b2     
            LDA #$06           ; $c628: a9 06     
            STA $df            ; $c62a: 85 df     
            JSR __c307         ; $c62c: 20 07 c3  
__c62f:     LDA $12            ; $c62f: a5 12     
            AND #$10           ; $c631: 29 10     
            BEQ __c62f         ; $c633: f0 fa     
            LDA #$06           ; $c635: a9 06     
            STA $df            ; $c637: 85 df     
            LDA #$00           ; $c639: a9 00     
            STA $b2            ; $c63b: 85 b2     
            JSR __c307         ; $c63d: 20 07 c3  
            JMP __cbfb         ; $c640: 4c fb cb  

;-------------------------------------------------------------------------------
__c643:     RTS                ; $c643: 60        

;-------------------------------------------------------------------------------
__c644:     LDA $33            ; $c644: a5 33     
            AND #$3f           ; $c646: 29 3f     
            BNE __c65e         ; $c648: d0 14     
            LDA $93            ; $c64a: a5 93     
            CMP #$ff           ; $c64c: c9 ff     
            BEQ __c65e         ; $c64e: f0 0e     
            DEC $93            ; $c650: c6 93     
            BNE __c65e         ; $c652: d0 0a     
            JSR __cbd7         ; $c654: 20 d7 cb  
            LDA #$08           ; $c657: a9 08     
            STA $7e            ; $c659: 85 7e     
            JMP __c8ed         ; $c65b: 4c ed c8  

;-------------------------------------------------------------------------------
__c65e:     RTS                ; $c65e: 60        

;-------------------------------------------------------------------------------
__c65f:     LDA $33            ; $c65f: a5 33     
            AND #$3f           ; $c661: 29 3f     
            BNE __c65e         ; $c663: d0 f9     
            LDA $93            ; $c665: a5 93     
            BEQ __c65e         ; $c667: f0 f5     
            DEC $93            ; $c669: c6 93     
            RTS                ; $c66b: 60        

;-------------------------------------------------------------------------------
__c66c:     LDX #$4f           ; $c66c: a2 4f     
__c66e:     LDA $03e6,x        ; $c66e: bd e6 03  
            BEQ __c6cd         ; $c671: f0 5a     
            BPL __c688         ; $c673: 10 13     
            AND #$7f           ; $c675: 29 7f     
            TAY                ; $c677: a8        
            LDA $0436,x        ; $c678: bd 36 04  
            STA $1f            ; $c67b: 85 1f     
            LDA $0486,x        ; $c67d: bd 86 04  
            STA $20            ; $c680: 85 20     
            LDA __c75d,y       ; $c682: b9 5d c7  
            JMP __c6da         ; $c685: 4c da c6  

;-------------------------------------------------------------------------------
__c688:     LDA $0436,x        ; $c688: bd 36 04  
            STA $1f            ; $c68b: 85 1f     
            LDA $0486,x        ; $c68d: bd 86 04  
            STA $20            ; $c690: 85 20     
            .hex bd 26         ; $c692: bd 26     Suspected data
__c694:     ORA $29            ; $c694: 05 29     
            SEI                ; $c696: 78        
            .hex f0            ; $c697: f0        Suspected data
__c698:     .hex 34 bd         ; $c698: 34 bd     Invalid Opcode - NOP $bd,x
            ROL $05            ; $c69a: 26 05     
            BPL __c6b2         ; $c69c: 10 14     
            AND #$07           ; $c69e: 29 07     
            STA $32            ; $c6a0: 85 32     
            LDA $0526,x        ; $c6a2: bd 26 05  
            LSR                ; $c6a5: 4a        
            AND #$3c           ; $c6a6: 29 3c     
            CLC                ; $c6a8: 18        
            ADC $32            ; $c6a9: 65 32     
            TAY                ; $c6ab: a8        
            LDA __c778,y       ; $c6ac: b9 78 c7  
            JMP __c6da         ; $c6af: 4c da c6  

;-------------------------------------------------------------------------------
__c6b2:     AND #$07           ; $c6b2: 29 07     
            BEQ __c6d0         ; $c6b4: f0 1a     
            AND #$01           ; $c6b6: 29 01     
            EOR #$01           ; $c6b8: 49 01     
            STA $32            ; $c6ba: 85 32     
            LDA $0526,x        ; $c6bc: bd 26 05  
            LSR                ; $c6bf: 4a        
            LSR                ; $c6c0: 4a        
            AND #$1e           ; $c6c1: 29 1e     
            CLC                ; $c6c3: 18        
            ADC $32            ; $c6c4: 65 32     
            CLC                ; $c6c6: 18        
            ADC #$07           ; $c6c7: 69 07     
            TAY                ; $c6c9: a8        
            .hex 4c d6         ; $c6ca: 4c d6     Suspected data
__c6cc:     .hex c6            ; $c6cc: c6        Suspected data
__c6cd:     JMP __c756         ; $c6cd: 4c 56 c7  

;-------------------------------------------------------------------------------
__c6d0:     LDA $0526,x        ; $c6d0: bd 26 05  
            LSR                ; $c6d3: 4a        
            LSR                ; $c6d4: 4a        
            LSR                ; $c6d5: 4a        
            TAY                ; $c6d6: a8        
            LDA __c764,y       ; $c6d7: b9 64 c7  
__c6da:     AND #$ff           ; $c6da: 29 ff     
            BEQ __c753         ; $c6dc: f0 75     
            JSR __d8fc         ; $c6de: 20 fc d8  
            LDA $5c            ; $c6e1: a5 5c     
            BNE __c705         ; $c6e3: d0 20     
            LDA $79            ; $c6e5: a5 79     
            BNE __c705         ; $c6e7: d0 1c     
            LDA $7a            ; $c6e9: a5 7a     
            BNE __c705         ; $c6eb: d0 18     
            LDA $28            ; $c6ed: a5 28     
            CMP $1f            ; $c6ef: c5 1f     
            BNE __c705         ; $c6f1: d0 12     
            LDA $2a            ; $c6f3: a5 2a     
            CMP $20            ; $c6f5: c5 20     
            BNE __c705         ; $c6f7: d0 0c     
            LDA #$05           ; $c6f9: a9 05     
            STA $df            ; $c6fb: 85 df     
            LDA #$01           ; $c6fd: a9 01     
            STA $5c            ; $c6ff: 85 5c     
            LDA #$0c           ; $c701: a9 0c     
            STA $2c            ; $c703: 85 2c     
__c705:     LDY #$09           ; $c705: a0 09     
__c707:     LDA $0576,y        ; $c707: b9 76 05  
            BEQ __c74e         ; $c70a: f0 42     
            CMP #$09           ; $c70c: c9 09     
            BCS __c74e         ; $c70e: b0 3e     
            LDA $0580,y        ; $c710: b9 80 05  
            CMP $1f            ; $c713: c5 1f     
            BNE __c74e         ; $c715: d0 37     
            LDA $0594,y        ; $c717: b9 94 05  
            CMP $20            ; $c71a: c5 20     
            BNE __c74e         ; $c71c: d0 30     
            INC $9e            ; $c71e: e6 9e     
            LDA #$00           ; $c720: a9 00     
            STA $a0            ; $c722: 85 a0     
            STA $a1            ; $c724: 85 a1     
            STA $a2            ; $c726: 85 a2     
            STA $a3            ; $c728: 85 a3     
            LDA #$64           ; $c72a: a9 64     
            STA $05c6,y        ; $c72c: 99 c6 05  
            LDA $0576,y        ; $c72f: b9 76 05  
            STA $05d0,y        ; $c732: 99 d0 05  
            LDA $6a            ; $c735: a5 6a     
            STA $05da,y        ; $c737: 99 da 05  
            INC $6a            ; $c73a: e6 6a     
            LDA #$09           ; $c73c: a9 09     
            STA $0576,y        ; $c73e: 99 76 05  
            LDA $05a8,y        ; $c741: b9 a8 05  
            LSR                ; $c744: 4a        
            LSR                ; $c745: 4a        
            AND #$07           ; $c746: 29 07     
            CLC                ; $c748: 18        
            ADC #$20           ; $c749: 69 20     
            STA $05a8,y        ; $c74b: 99 a8 05  
__c74e:     DEY                ; $c74e: 88        
            BPL __c707         ; $c74f: 10 b6     
            BMI __c756         ; $c751: 30 03     
__c753:     JSR __d8fc         ; $c753: 20 fc d8  
__c756:     DEX                ; $c756: ca        
            BMI __c75c         ; $c757: 30 03     
            JMP __c66e         ; $c759: 4c 6e c6  

;-------------------------------------------------------------------------------
__c75c:     RTS                ; $c75c: 60        

;-------------------------------------------------------------------------------
__c75d:     .hex 27 03         ; $c75d: 27 03     Invalid Opcode - RLA $03
            .hex 04 05         ; $c75f: 04 05     Invalid Opcode - NOP $05
            ASL $07            ; $c761: 06 07     
            BRK                ; $c763: 00        
__c764:     BRK                ; $c764: 00        
            .hex 0b 0c         ; $c765: 0b 0c     Invalid Opcode - ANC #$0c
            ORA $0d0e          ; $c767: 0d 0e 0d  
            .hex 0c 0b 00      ; $c76a: 0c 0b 00  Bad Addr Mode - NOP $000b
            .hex 0f 10 11      ; $c76d: 0f 10 11  Invalid Opcode - SLO $1110
            .hex 12            ; $c770: 12        Invalid Opcode - KIL 
            .hex 13 14         ; $c771: 13 14     Invalid Opcode - SLO ($14),y
            ORA $16,x          ; $c773: 15 16     
            .hex 13 14         ; $c775: 13 14     Invalid Opcode - SLO ($14),y
            .hex 11            ; $c777: 11        Suspected data
__c778:     .hex 12            ; $c778: 12        Invalid Opcode - KIL 
            .hex 0f 10 00      ; $c779: 0f 10 00  Bad Addr Mode - SLO $0010
            BRK                ; $c77c: 00        
            .hex 17 18         ; $c77d: 17 18     Invalid Opcode - SLO $18,x
            ORA $1b1a,y        ; $c77f: 19 1a 1b  
            .hex 1c 1d 1e      ; $c782: 1c 1d 1e  Invalid Opcode - NOP $1e1d,x
            .hex 1f 20 21      ; $c785: 1f 20 21  Invalid Opcode - SLO $2120,x
            .hex 22            ; $c788: 22        Invalid Opcode - KIL 
            .hex 23 24         ; $c789: 23 24     Invalid Opcode - RLA ($24,x)
            AND $26            ; $c78b: 25 26     
            .hex 1f 20 21      ; $c78d: 1f 20 21  Invalid Opcode - SLO $2120,x
            .hex 22            ; $c790: 22        Invalid Opcode - KIL 
            .hex 1b 1c 1d      ; $c791: 1b 1c 1d  Invalid Opcode - SLO $1d1c,y
            ASL $1817,x        ; $c794: 1e 17 18  
            ORA $001a,y        ; $c797: 19 1a 00  
            BRK                ; $c79a: 00        
            BRK                ; $c79b: 00        
            BRK                ; $c79c: 00        
__c79d:     LDX #$4f           ; $c79d: a2 4f     
__c79f:     LDA $03e6,x        ; $c79f: bd e6 03  
            BNE __c7a7         ; $c7a2: d0 03     
__c7a4:     JMP __c8a6         ; $c7a4: 4c a6 c8  

;-------------------------------------------------------------------------------
__c7a7:     PHA                ; $c7a7: 48        
            LDY $0486,x        ; $c7a8: bc 86 04  
            STY $20            ; $c7ab: 84 20     
            JSR __cbeb         ; $c7ad: 20 eb cb  
            LDY $0436,x        ; $c7b0: bc 36 04  
            STY $1f            ; $c7b3: 84 1f     
            PLA                ; $c7b5: 68        
            BPL __c7cb         ; $c7b6: 10 13     
            INC $03e6,x        ; $c7b8: fe e6 03  
            LDA $03e6,x        ; $c7bb: bd e6 03  
            CMP #$87           ; $c7be: c9 87     
            BNE __c7a4         ; $c7c0: d0 e2     
            LDA #$00           ; $c7c2: a9 00     
            STA $03e6,x        ; $c7c4: 9d e6 03  
            STA ($34),y        ; $c7c7: 91 34     
            BEQ __c7a4         ; $c7c9: f0 d9     
__c7cb:     LDA ($34),y        ; $c7cb: b1 34     
            TAY                ; $c7cd: a8        
            BEQ __c838         ; $c7ce: f0 68     
            CPY #$02           ; $c7d0: c0 02     
            BNE __c7de         ; $c7d2: d0 0a     
            INC $a4            ; $c7d4: e6 a4     
            LDA #$80           ; $c7d6: a9 80     
            STA $03e6,x        ; $c7d8: 9d e6 03  
            JMP __c8a6         ; $c7db: 4c a6 c8  

;-------------------------------------------------------------------------------
__c7de:     CPY #$03           ; $c7de: c0 03     
            BNE __c7ee         ; $c7e0: d0 0c     
            LDA $04d6,x        ; $c7e2: bd d6 04  
            ORA #$10           ; $c7e5: 09 10     
            LDY $1f            ; $c7e7: a4 1f     
            STA ($34),y        ; $c7e9: 91 34     
            JMP __c830         ; $c7eb: 4c 30 c8  

;-------------------------------------------------------------------------------
__c7ee:     CPY #$04           ; $c7ee: c0 04     
            BNE __c800         ; $c7f0: d0 0e     
            LDY $1f            ; $c7f2: a4 1f     
            LDA #$08           ; $c7f4: a9 08     
            STA ($34),y        ; $c7f6: 91 34     
            LDA #$28           ; $c7f8: a9 28     
            JSR __d8fc         ; $c7fa: 20 fc d8  
            JMP __c830         ; $c7fd: 4c 30 c8  

;-------------------------------------------------------------------------------
__c800:     CPY #$05           ; $c800: c0 05     
            BNE __c815         ; $c802: d0 11     
            LDY $1f            ; $c804: a4 1f     
            LDA #$06           ; $c806: a9 06     
            STA ($34),y        ; $c808: 91 34     
            LDA #$28           ; $c80a: a9 28     
            CLC                ; $c80c: 18        
            ADC $5b            ; $c80d: 65 5b     
            JSR __d8fc         ; $c80f: 20 fc d8  
            JMP __c830         ; $c812: 4c 30 c8  

;-------------------------------------------------------------------------------
__c815:     CPY #$08           ; $c815: c0 08     
            BEQ __c828         ; $c817: f0 0f     
            CPY #$06           ; $c819: c0 06     
            BNE __c830         ; $c81b: d0 13     
            LDY $1f            ; $c81d: a4 1f     
            LDA #$00           ; $c81f: a9 00     
            STA ($34),y        ; $c821: 91 34     
            .hex 20            ; $c823: 20        Suspected data
__c824:     .hex fc d8 c6      ; $c824: fc d8 c6  Invalid Opcode - NOP __c6d8,x
            .hex a7            ; $c827: a7        Suspected data
__c828:     INC $a7            ; $c828: e6 a7     
            JSR __c8ad         ; $c82a: 20 ad c8  
            JMP __c830         ; $c82d: 4c 30 c8  

;-------------------------------------------------------------------------------
__c830:     LDA #$00           ; $c830: a9 00     
            STA $03e6,x        ; $c832: 9d e6 03  
__c835:     JMP __c8a6         ; $c835: 4c a6 c8  

;-------------------------------------------------------------------------------
__c838:     LDA $0526,x        ; $c838: bd 26 05  
            CLC                ; $c83b: 18        
            ADC #$08           ; $c83c: 69 08     
            STA $0526,x        ; $c83e: 9d 26 05  
            AND #$7f           ; $c841: 29 7f     
            CMP #$48           ; $c843: c9 48     
            BCS __c7ee         ; $c845: b0 a7     
            LDA $04d6,x        ; $c847: bd d6 04  
            STA $36            ; $c84a: 85 36     
            AND #$07           ; $c84c: 29 07     
            BEQ __c835         ; $c84e: f0 e5     
            TAY                ; $c850: a8        
            LDA #$00           ; $c851: a9 00     
            STA $04d6,x        ; $c853: 9d d6 04  
            LDA $0436,x        ; $c856: bd 36 04  
            CLC                ; $c859: 18        
            ADC __ca16,y       ; $c85a: 79 16 ca  
            STA $1f            ; $c85d: 85 1f     
            LDA $0486,x        ; $c85f: bd 86 04  
            CLC                ; $c862: 18        
            ADC __ca11,y       ; $c863: 79 11 ca  
            STA $20            ; $c866: 85 20     
            LDY #$4f           ; $c868: a0 4f     
            JSR __cbe5         ; $c86a: 20 e5 cb  
            BNE __c8a6         ; $c86d: d0 37     
            LDA $1f            ; $c86f: a5 1f     
            STA $0436,y        ; $c871: 99 36 04  
            LDA $20            ; $c874: a5 20     
            STA $0486,y        ; $c876: 99 86 04  
            LDA #$01           ; $c879: a9 01     
            STA $03e6,y        ; $c87b: 99 e6 03  
            LDA $36            ; $c87e: a5 36     
            AND #$07           ; $c880: 29 07     
            STA $0526,y        ; $c882: 99 26 05  
            LDA $36            ; $c885: a5 36     
            CLC                ; $c887: 18        
            ADC #$10           ; $c888: 69 10     
            CMP $73            ; $c88a: c5 73     
            BCC __c89e         ; $c88c: 90 10     
            LDA #$00           ; $c88e: a9 00     
            STA $03e6,y        ; $c890: 99 e6 03  
            LDA $0526,x        ; $c893: bd 26 05  
            ORA #$80           ; $c896: 09 80     
            STA $0526,x        ; $c898: 9d 26 05  
            JMP __c8a1         ; $c89b: 4c a1 c8  

;-------------------------------------------------------------------------------
__c89e:     STA $04d6,y        ; $c89e: 99 d6 04  
__c8a1:     LDA #$00           ; $c8a1: a9 00     
            STA $04d6,x        ; $c8a3: 9d d6 04  
__c8a6:     DEX                ; $c8a6: ca        
            BMI __c8ac         ; $c8a7: 30 03     
            JMP __c79f         ; $c8a9: 4c 9f c7  

;-------------------------------------------------------------------------------
__c8ac:     RTS                ; $c8ac: 60        

;-------------------------------------------------------------------------------
__c8ad:     LDY #$09           ; $c8ad: a0 09     
__c8af:     LDA $0576,y        ; $c8af: b9 76 05  
            BNE __c8e9         ; $c8b2: d0 35     
            LDA $5b            ; $c8b4: a5 5b     
            STA $0576,y        ; $c8b6: 99 76 05  
            STA $05a8,y        ; $c8b9: 99 a8 05  
            LDA #$08           ; $c8bc: a9 08     
            STA $058a,y        ; $c8be: 99 8a 05  
            STA $059e,y        ; $c8c1: 99 9e 05  
            JSR __d670         ; $c8c4: 20 70 d6  
            AND #$03           ; $c8c7: 29 03     
            CLC                ; $c8c9: 18        
            ADC #$01           ; $c8ca: 69 01     
            STA $05d0,y        ; $c8cc: 99 d0 05  
            LDA $1f            ; $c8cf: a5 1f     
            STA $0580,y        ; $c8d1: 99 80 05  
            LDA $20            ; $c8d4: a5 20     
            STA $0594,y        ; $c8d6: 99 94 05  
            LDA #$00           ; $c8d9: a9 00     
            STA $05da,y        ; $c8db: 99 da 05  
            STA $05c6,y        ; $c8de: 99 c6 05  
            STA $05e4,y        ; $c8e1: 99 e4 05  
            LDA #$1e           ; $c8e4: a9 1e     
            STA $05b2,y        ; $c8e6: 99 b2 05  
__c8e9:     DEY                ; $c8e9: 88        
            BPL __c8af         ; $c8ea: 10 c3     
            RTS                ; $c8ec: 60        

;-------------------------------------------------------------------------------
__c8ed:     LDY #$09           ; $c8ed: a0 09     
__c8ef:     LDA $0576,y        ; $c8ef: b9 76 05  
            BNE __c935         ; $c8f2: d0 41     
            LDA $7e            ; $c8f4: a5 7e     
            STA $0576,y        ; $c8f6: 99 76 05  
            SEC                ; $c8f9: 38        
            SBC #$01           ; $c8fa: e9 01     
            ASL                ; $c8fc: 0a        
            ASL                ; $c8fd: 0a        
            STA $05a8,y        ; $c8fe: 99 a8 05  
            LDA #$08           ; $c901: a9 08     
            STA $058a,y        ; $c903: 99 8a 05  
            STA $059e,y        ; $c906: 99 9e 05  
            JSR __d670         ; $c909: 20 70 d6  
            AND #$03           ; $c90c: 29 03     
            CLC                ; $c90e: 18        
            ADC #$01           ; $c90f: 69 01     
            STA $05d0,y        ; $c911: 99 d0 05  
            STY $5a            ; $c914: 84 5a     
            JSR __cacf         ; $c916: 20 cf ca  
            LDY $5a            ; $c919: a4 5a     
            LDA $24            ; $c91b: a5 24     
            STA $0580,y        ; $c91d: 99 80 05  
            LDA $25            ; $c920: a5 25     
            STA $0594,y        ; $c922: 99 94 05  
            LDA #$00           ; $c925: a9 00     
            STA $05da,y        ; $c927: 99 da 05  
            STA $05c6,y        ; $c92a: 99 c6 05  
            STA $05e4,y        ; $c92d: 99 e4 05  
            LDA #$1e           ; $c930: a9 1e     
            STA $05b2,y        ; $c932: 99 b2 05  
__c935:     DEY                ; $c935: 88        
            BPL __c8ef         ; $c936: 10 b7     
            RTS                ; $c938: 60        

;-------------------------------------------------------------------------------
__c939:     LDX #$09           ; $c939: a2 09     
__c93b:     LDA $03a0,x        ; $c93b: bd a0 03  
            BEQ __c966         ; $c93e: f0 26     
            LDY $03b4,x        ; $c940: bc b4 03  
            LDA __e2a3,y       ; $c943: b9 a3 e2  
            STA $34            ; $c946: 85 34     
            LDA __e2b0,y       ; $c948: b9 b0 e2  
            STA $35            ; $c94b: 85 35     
            STY $20            ; $c94d: 84 20     
            LDY $03aa,x        ; $c94f: bc aa 03  
            STY $1f            ; $c952: 84 1f     
            LDA #$00           ; $c954: a9 00     
            JSR __c9b6         ; $c956: 20 b6 c9  
            JSR __cbf6         ; $c959: 20 f6 cb  
            LDA #$00           ; $c95c: a9 00     
            STA ($34),y        ; $c95e: 91 34     
            LDA #$00           ; $c960: a9 00     
            STA $03a0,x        ; $c962: 9d a0 03  
            RTS                ; $c965: 60        

;-------------------------------------------------------------------------------
__c966:     DEX                ; $c966: ca        
            BPL __c93b         ; $c967: 10 d2     
            RTS                ; $c969: 60        

;-------------------------------------------------------------------------------
__c96a:     LDX #$09           ; $c96a: a2 09     
__c96c:     LDA $03a0,x        ; $c96c: bd a0 03  
            BEQ __c9b2         ; $c96f: f0 41     
            LDY $03b4,x        ; $c971: bc b4 03  
            LDA __e2a3,y       ; $c974: b9 a3 e2  
            STA $34            ; $c977: 85 34     
            LDA __e2b0,y       ; $c979: b9 b0 e2  
            STA $35            ; $c97c: 85 35     
            STY $20            ; $c97e: 84 20     
            LDY $03aa,x        ; $c980: bc aa 03  
            STY $1f            ; $c983: 84 1f     
            LDA ($34),y        ; $c985: b1 34     
            CMP #$03           ; $c987: c9 03     
            BNE __c999         ; $c989: d0 0e     
            INC $03d2,x        ; $c98b: fe d2 03  
            LDA $77            ; $c98e: a5 77     
            BNE __c9b2         ; $c990: d0 20     
            .hex de be         ; $c992: de be     Suspected data
__c994:     .hex 03 d0         ; $c994: 03 d0     Invalid Opcode - SLO ($d0,x)
            .hex 1b a9 00      ; $c996: 1b a9 00  Invalid Opcode - SLO $00a9,y
__c999:     AND #$07           ; $c999: 29 07     
            JSR __c9b6         ; $c99b: 20 b6 c9  
            LDA $a5            ; $c99e: a5 a5     
            CMP #$ff           ; $c9a0: c9 ff     
            BEQ __c9a6         ; $c9a2: f0 02     
            INC $a5            ; $c9a4: e6 a5     
__c9a6:     JSR __cbf6         ; $c9a6: 20 f6 cb  
            LDA #$00           ; $c9a9: a9 00     
            STA ($34),y        ; $c9ab: 91 34     
            LDA #$00           ; $c9ad: a9 00     
            STA $03a0,x        ; $c9af: 9d a0 03  
__c9b2:     DEX                ; $c9b2: ca        
            BPL __c96c         ; $c9b3: 10 b7     
__c9b5:     RTS                ; $c9b5: 60        

;-------------------------------------------------------------------------------
__c9b6:     STX $2f            ; $c9b6: 86 2f     
            STY $30            ; $c9b8: 84 30     
            TAY                ; $c9ba: a8        
            LDA __c9de,y       ; $c9bb: b9 de c9  
            STA $2e            ; $c9be: 85 2e     
            LDA #$01           ; $c9c0: a9 01     
            JSR __c9e3         ; $c9c2: 20 e3 c9  
            LDA #$02           ; $c9c5: a9 02     
            JSR __c9e3         ; $c9c7: 20 e3 c9  
            LDA #$03           ; $c9ca: a9 03     
            JSR __c9e3         ; $c9cc: 20 e3 c9  
            LDA #$04           ; $c9cf: a9 04     
            JSR __c9e3         ; $c9d1: 20 e3 c9  
            LDA #$00           ; $c9d4: a9 00     
            JSR __c9e3         ; $c9d6: 20 e3 c9  
            LDX $2f            ; $c9d9: a6 2f     
            LDY $30            ; $c9db: a4 30     
            RTS                ; $c9dd: 60        

;-------------------------------------------------------------------------------
__c9de:     .hex ff 03 04      ; $c9de: ff 03 04  Invalid Opcode - ISC $0403,x
            ORA ($02,x)        ; $c9e1: 01 02     
__c9e3:     CMP $2e            ; $c9e3: c5 2e     
            BEQ __c9b5         ; $c9e5: f0 ce     
            STA $31            ; $c9e7: 85 31     
            TAX                ; $c9e9: aa        
            LDY #$4f           ; $c9ea: a0 4f     
            JSR __cbe5         ; $c9ec: 20 e5 cb  
            BMI __ca10         ; $c9ef: 30 1f     
            LDA $20            ; $c9f1: a5 20     
            CLC                ; $c9f3: 18        
            ADC __ca11,x       ; $c9f4: 7d 11 ca  
            STA $0486,y        ; $c9f7: 99 86 04  
            LDA $1f            ; $c9fa: a5 1f     
            CLC                ; $c9fc: 18        
            ADC __ca16,x       ; $c9fd: 7d 16 ca  
            STA $0436,y        ; $ca00: 99 36 04  
            LDA $31            ; $ca03: a5 31     
            STA $04d6,y        ; $ca05: 99 d6 04  
            STA $0526,y        ; $ca08: 99 26 05  
            LDA #$01           ; $ca0b: a9 01     
            STA $03e6,y        ; $ca0d: 99 e6 03  
__ca10:     RTS                ; $ca10: 60        

;-------------------------------------------------------------------------------
__ca11:     BRK                ; $ca11: 00        
            BRK                ; $ca12: 00        
            .hex ff 00 01      ; $ca13: ff 00 01  Invalid Opcode - ISC $0100,x
__ca16:     BRK                ; $ca16: 00        
            ORA ($00,x)        ; $ca17: 01 00     
            .hex ff 00         ; $ca19: ff 00     Suspected data
__ca1b:     LDX #$09           ; $ca1b: a2 09     
__ca1d:     LDA $03a0,x        ; $ca1d: bd a0 03  
            BEQ __ca43         ; $ca20: f0 21     
            LDA $03aa,x        ; $ca22: bd aa 03  
            STA $1f            ; $ca25: 85 1f     
            LDA $03b4,x        ; $ca27: bd b4 03  
            STA $20            ; $ca2a: 85 20     
            LDA $03d2,x        ; $ca2c: bd d2 03  
            AND #$0f           ; $ca2f: 29 0f     
            BNE __ca43         ; $ca31: d0 10     
            LDA $03d2,x        ; $ca33: bd d2 03  
            LSR                ; $ca36: 4a        
            LSR                ; $ca37: 4a        
            LSR                ; $ca38: 4a        
            LSR                ; $ca39: 4a        
            AND #$03           ; $ca3a: 29 03     
            TAY                ; $ca3c: a8        
            LDA __ca47,y       ; $ca3d: b9 47 ca  
            JSR __d8fc         ; $ca40: 20 fc d8  
__ca43:     DEX                ; $ca43: ca        
            BPL __ca1d         ; $ca44: 10 d7     
            RTS                ; $ca46: 60        

;-------------------------------------------------------------------------------
__ca47:     ORA #$0a           ; $ca47: 09 0a     
            ORA #$08           ; $ca49: 09 08     
__ca4b:     JSR __ca72         ; $ca4b: 20 72 ca  
            JSR __cacf         ; $ca4e: 20 cf ca  
            LDA #$04           ; $ca51: a9 04     
            STA ($34),y        ; $ca53: 91 34     
            JSR __cacf         ; $ca55: 20 cf ca  
            LDA #$05           ; $ca58: a9 05     
            STA ($34),y        ; $ca5a: 91 34     
            LDA #$32           ; $ca5c: a9 32     
            CLC                ; $ca5e: 18        
            ADC $58            ; $ca5f: 65 58     
            CLC                ; $ca61: 18        
            ADC $58            ; $ca62: 65 58     
            STA $1f            ; $ca64: 85 1f     
__ca66:     JSR __cacf         ; $ca66: 20 cf ca  
            LDA #$02           ; $ca69: a9 02     
            STA ($34),y        ; $ca6b: 91 34     
            DEC $1f            ; $ca6d: c6 1f     
            BNE __ca66         ; $ca6f: d0 f5     
            RTS                ; $ca71: 60        

;-------------------------------------------------------------------------------
__ca72:     LDA #$00           ; $ca72: a9 00     
            STA $34            ; $ca74: 85 34     
            LDA #$02           ; $ca76: a9 02     
            STA $35            ; $ca78: 85 35     
            LDY #$00           ; $ca7a: a0 00     
            LDX #$00           ; $ca7c: a2 00     
            JSR __caba         ; $ca7e: 20 ba ca  
            LDX #$20           ; $ca81: a2 20     
            JSR __caba         ; $ca83: 20 ba ca  
            LDX #$40           ; $ca86: a2 40     
            JSR __caba         ; $ca88: 20 ba ca  
            LDX #$20           ; $ca8b: a2 20     
            JSR __caba         ; $ca8d: 20 ba ca  
            LDX #$40           ; $ca90: a2 40     
            JSR __caba         ; $ca92: 20 ba ca  
            LDX #$20           ; $ca95: a2 20     
            JSR __caba         ; $ca97: 20 ba ca  
            LDX #$40           ; $ca9a: a2 40     
            JSR __caba         ; $ca9c: 20 ba ca  
            LDX #$20           ; $ca9f: a2 20     
            JSR __caba         ; $caa1: 20 ba ca  
            LDX #$40           ; $caa4: a2 40     
            JSR __caba         ; $caa6: 20 ba ca  
            LDX #$20           ; $caa9: a2 20     
            JSR __caba         ; $caab: 20 ba ca  
            LDX #$40           ; $caae: a2 40     
            JSR __caba         ; $cab0: 20 ba ca  
            LDX #$20           ; $cab3: a2 20     
            JSR __caba         ; $cab5: 20 ba ca  
            LDX #$00           ; $cab8: a2 00     
__caba:     LDA #$20           ; $caba: a9 20     
            STA $24            ; $cabc: 85 24     
__cabe:     LDA __e243,x       ; $cabe: bd 43 e2  
            STA ($34),y        ; $cac1: 91 34     
            INC $34            ; $cac3: e6 34     
            BNE __cac9         ; $cac5: d0 02     
            INC $35            ; $cac7: e6 35     
__cac9:     INX                ; $cac9: e8        
            DEC $24            ; $caca: c6 24     
__cacc:     BNE __cabe         ; $cacc: d0 f0     
            RTS                ; $cace: 60        

;-------------------------------------------------------------------------------
__cacf:     JSR __d670         ; $cacf: 20 70 d6  
            ROR                ; $cad2: 6a        
            ROR                ; $cad3: 6a        
            AND #$1f           ; $cad4: 29 1f     
            BEQ __cacf         ; $cad6: f0 f7     
            STA $24            ; $cad8: 85 24     
__cada:     JSR __d670         ; $cada: 20 70 d6  
            ROR                ; $cadd: 6a        
            ROR                ; $cade: 6a        
            ROR                ; $cadf: 6a        
            AND #$0f           ; $cae0: 29 0f     
            BEQ __cada         ; $cae2: f0 f6     
            CMP #$0c           ; $cae4: c9 0c     
            BCS __cada         ; $cae6: b0 f2     
            STA $25            ; $cae8: 85 25     
            TAY                ; $caea: a8        
            LDA __e2a3,y       ; $caeb: b9 a3 e2  
            STA $34            ; $caee: 85 34     
            LDA __e2b0,y       ; $caf0: b9 b0 e2  
            STA $35            ; $caf3: 85 35     
            LDY $24            ; $caf5: a4 24     
            LDA ($34),y        ; $caf7: b1 34     
            BNE __cacf         ; $caf9: d0 d4     
            CPY #$03           ; $cafb: c0 03     
            BCS __cb05         ; $cafd: b0 06     
            LDA $25            ; $caff: a5 25     
            CMP #$03           ; $cb01: c9 03     
            BCC __cacf         ; $cb03: 90 ca     
__cb05:     RTS                ; $cb05: 60        

;-------------------------------------------------------------------------------
__cb06:     JSR __c257         ; $cb06: 20 57 c2  
            LDA #$00           ; $cb09: a9 00     
            STA $20            ; $cb0b: 85 20     
            LDA #$00           ; $cb0d: a9 00     
            STA $26            ; $cb0f: 85 26     
            LDA #$02           ; $cb11: a9 02     
            STA $27            ; $cb13: 85 27     
            LDY #$00           ; $cb15: a0 00     
__cb17:     LDA #$00           ; $cb17: a9 00     
            STA $1f            ; $cb19: 85 1f     
__cb1b:     LDA $94            ; $cb1b: a5 94     
            BEQ __cb24         ; $cb1d: f0 05     
            LDA ($26),y        ; $cb1f: b1 26     
            JMP __cb30         ; $cb21: 4c 30 cb  

;-------------------------------------------------------------------------------
__cb24:     LDA ($26),y        ; $cb24: b1 26     
            CMP #$04           ; $cb26: c9 04     
            BEQ __cb2e         ; $cb28: f0 04     
            CMP #$05           ; $cb2a: c9 05     
            BNE __cb30         ; $cb2c: d0 02     
__cb2e:     LDA #$02           ; $cb2e: a9 02     
__cb30:     JSR __cb4e         ; $cb30: 20 4e cb  
            INY                ; $cb33: c8        
            BNE __cb38         ; $cb34: d0 02     
            INC $27            ; $cb36: e6 27     
__cb38:     INC $1f            ; $cb38: e6 1f     
            LDA $1f            ; $cb3a: a5 1f     
            AND #$20           ; $cb3c: 29 20     
            BEQ __cb1b         ; $cb3e: f0 db     
            INC $20            ; $cb40: e6 20     
            LDA $20            ; $cb42: a5 20     
            CMP #$0d           ; $cb44: c9 0d     
            BNE __cb17         ; $cb46: d0 cf     
            JSR __ddc7         ; $cb48: 20 c7 dd  
            JMP __c296         ; $cb4b: 4c 96 c2  

;-------------------------------------------------------------------------------
__cb4e:     STY $25            ; $cb4e: 84 25     
            JSR __d924         ; $cb50: 20 24 d9  
            LDX #$00           ; $cb53: a2 00     
__cb55:     LDA $17,x          ; $cb55: b5 17     
            STA $0600,x        ; $cb57: 9d 00 06  
            INX                ; $cb5a: e8        
            CPX #$08           ; $cb5b: e0 08     
            BNE __cb55         ; $cb5d: d0 f6     
            JSR __cb65         ; $cb5f: 20 65 cb  
            LDY $25            ; $cb62: a4 25     
            RTS                ; $cb64: 60        

;-------------------------------------------------------------------------------
__cb65:     LDA $0602          ; $cb65: ad 02 06  
            ORA $0600          ; $cb68: 0d 00 06  
            PHA                ; $cb6b: 48        
            STA $2006          ; $cb6c: 8d 06 20  
            LDX $0601          ; $cb6f: ae 01 06  
            STX $2006          ; $cb72: 8e 06 20  
            LDX $0603          ; $cb75: ae 03 06  
            LDA __d9c6,x       ; $cb78: bd c6 d9  
            STA $2007          ; $cb7b: 8d 07 20  
            LDA __d9c7,x       ; $cb7e: bd c7 d9  
            STA $2007          ; $cb81: 8d 07 20  
            PLA                ; $cb84: 68        
            STA $2006          ; $cb85: 8d 06 20  
            LDA $0601          ; $cb88: ad 01 06  
            CLC                ; $cb8b: 18        
            ADC #$20           ; $cb8c: 69 20     
            STA $2006          ; $cb8e: 8d 06 20  
            LDA __d9c8,x       ; $cb91: bd c8 d9  
            STA $2007          ; $cb94: 8d 07 20  
            .hex bd c9         ; $cb97: bd c9     Suspected data
__cb99:     CMP $078d,y        ; $cb99: d9 8d 07  
            JSR $23a9          ; $cb9c: 20 a9 23  
            ORA $0600          ; $cb9f: 0d 00 06  
            PHA                ; $cba2: 48        
            STA $2006          ; $cba3: 8d 06 20  
            LDA $0604          ; $cba6: ad 04 06  
            STA $2006          ; $cba9: 8d 06 20  
__cbac:     TAX                ; $cbac: aa        
            LDA $2007          ; $cbad: ad 07 20  
            LDA $2007          ; $cbb0: ad 07 20  
            AND $0606          ; $cbb3: 2d 06 06  
            ORA $0607          ; $cbb6: 0d 07 06  
            TAY                ; $cbb9: a8        
            PLA                ; $cbba: 68        
            STA $2006          ; $cbbb: 8d 06 20  
            STX $2006          ; $cbbe: 8e 06 20  
            STY $2007          ; $cbc1: 8c 07 20  
            RTS                ; $cbc4: 60        

;-------------------------------------------------------------------------------
__cbc5:     LDX #$09           ; $cbc5: a2 09     
            LDA #$00           ; $cbc7: a9 00     
__cbc9:     .hex 9d a0         ; $cbc9: 9d a0     Suspected data
__cbcb:     .hex 03 ca         ; $cbcb: 03 ca     Invalid Opcode - SLO ($ca,x)
            BPL __cbc9         ; $cbcd: 10 fa     
            LDX #$4f           ; $cbcf: a2 4f     
__cbd1:     STA $03e6,x        ; $cbd1: 9d e6 03  
            DEX                ; $cbd4: ca        
            BPL __cbd1         ; $cbd5: 10 fa     
__cbd7:     LDA #$00           ; $cbd7: a9 00     
            LDX #$09           ; $cbd9: a2 09     
__cbdb:     STA $0576,x        ; $cbdb: 9d 76 05  
            DEX                ; $cbde: ca        
            BPL __cbdb         ; $cbdf: 10 fa     
            RTS                ; $cbe1: 60        

;-------------------------------------------------------------------------------
__cbe2:     DEY                ; $cbe2: 88        
            BMI __cbea         ; $cbe3: 30 05     
__cbe5:     LDA $03e6,y        ; $cbe5: b9 e6 03  
            BNE __cbe2         ; $cbe8: d0 f8     
__cbea:     RTS                ; $cbea: 60        

;-------------------------------------------------------------------------------
__cbeb:     LDA __e2a3,y       ; $cbeb: b9 a3 e2  
            STA $34            ; $cbee: 85 34     
            LDA __e2b0,y       ; $cbf0: b9 b0 e2  
            STA $35            ; $cbf3: 85 35     
            RTS                ; $cbf5: 60        

;-------------------------------------------------------------------------------
__cbf6:     LDA #$01           ; $cbf6: a9 01     
            STA $38            ; $cbf8: 85 38     
            RTS                ; $cbfa: 60        

;-------------------------------------------------------------------------------
__cbfb:     LDA $0b            ; $cbfb: a5 0b     
            BNE __cbfb         ; $cbfd: d0 fc     
            LDA #$01           ; $cbff: a9 01     
            STA $0b            ; $cc01: 85 0b     
__cc03:     RTS                ; $cc03: 60        

;-------------------------------------------------------------------------------
            .hex 02            ; $cc04: 02        Invalid Opcode - KIL 
            ORA ($05,x)        ; $cc05: 01 05     
            .hex 03 01         ; $cc07: 03 01     Invalid Opcode - SLO ($01,x)
            ORA ($02,x)        ; $cc09: 01 02     
            ORA $06            ; $cc0b: 05 06     
            .hex 04 01         ; $cc0d: 04 01     Invalid Opcode - NOP $01
            ORA ($05,x)        ; $cc0f: 01 05     
            ASL $02            ; $cc11: 06 02     
            .hex 04 01         ; $cc13: 04 01     Invalid Opcode - NOP $01
            ASL $01            ; $cc15: 06 01     
            ORA $06            ; $cc17: 05 06     
            ORA $01            ; $cc19: 05 01     
            ORA $06            ; $cc1b: 05 06     
            PHP                ; $cc1d: 08        
            .hex 02            ; $cc1e: 02        Invalid Opcode - KIL 
            ORA ($05,x)        ; $cc1f: 01 05     
            .hex 07 04         ; $cc21: 07 04     Invalid Opcode - SLO $04
            ORA ($05,x)        ; $cc23: 01 05     
            PHP                ; $cc25: 08        
            ASL $07            ; $cc26: 06 07     
            ORA $02            ; $cc28: 05 02     
            .hex 04 08         ; $cc2a: 04 08     Invalid Opcode - NOP $08
            ORA $04            ; $cc2c: 05 04     
            ASL $05            ; $cc2e: 06 05     
            PHP                ; $cc30: 08        
            .hex 04 06         ; $cc31: 04 06     Invalid Opcode - NOP $06
            ORA $07            ; $cc33: 05 07     
            PHP                ; $cc35: 08        
__cc36:     LDA $7d            ; $cc36: a5 7d     
            BNE __cc4c         ; $cc38: d0 12     
            LDA $7a            ; $cc3a: a5 7a     
            BEQ __cc4c         ; $cc3c: f0 0e     
            LDA $33            ; $cc3e: a5 33     
            AND #$07           ; $cc40: 29 07     
            BNE __cc4c         ; $cc42: d0 08     
            DEC $7a            ; $cc44: c6 7a     
            BNE __cc4c         ; $cc46: d0 04     
            LDA #$03           ; $cc48: a9 03     
            STA $b5            ; $cc4a: 85 b5     
__cc4c:     LDA $5c            ; $cc4c: a5 5c     
            BEQ __cc63         ; $cc4e: f0 13     
            LDA $33            ; $cc50: a5 33     
            AND #$0f           ; $cc52: 29 0f     
__cc54:     BNE __cc62         ; $cc54: d0 0c     
            INC $2c            ; $cc56: e6 2c     
            LDA $2c            ; $cc58: a5 2c     
            CMP #$14           ; $cc5a: c9 14     
            BNE __cc62         ; $cc5c: d0 04     
            LDA #$01           ; $cc5e: a9 01     
            STA $5d            ; $cc60: 85 5d     
__cc62:     RTS                ; $cc62: 60        

;-------------------------------------------------------------------------------
__cc63:     LDA $29            ; $cc63: a5 29     
            CMP #$08           ; $cc65: c9 08     
            BNE __cca4         ; $cc67: d0 3b     
            LDA $2b            ; $cc69: a5 2b     
            CMP #$08           ; $cc6b: c9 08     
            BNE __cca4         ; $cc6d: d0 35     
            LDY $2a            ; $cc6f: a4 2a     
            STY $20            ; $cc71: 84 20     
            LDA __e2a3,y       ; $cc73: b9 a3 e2  
            STA $34            ; $cc76: 85 34     
            LDA __e2b0,y       ; $cc78: b9 b0 e2  
            STA $35            ; $cc7b: 85 35     
            LDY $28            ; $cc7d: a4 28     
            STY $1f            ; $cc7f: 84 1f     
            LDA ($34),y        ; $cc81: b1 34     
            CMP #$08           ; $cc83: c9 08     
            BEQ __cc95         ; $cc85: f0 0e     
            CMP #$06           ; $cc87: c9 06     
            BNE __cca4         ; $cc89: d0 19     
            .hex a9            ; $cc8b: a9        Suspected data
__cc8c:     BRK                ; $cc8c: 00        
            STA ($34),y        ; $cc8d: 91 34     
            JSR __d8fc         ; $cc8f: 20 fc d8  
            JMP __cee9         ; $cc92: 4c e9 ce  

;-------------------------------------------------------------------------------
__cc95:     INC $9f            ; $cc95: e6 9f     
            LDA #$00           ; $cc97: a9 00     
__cc99:     .hex 85            ; $cc99: 85        Suspected data
__cc9a:     LDX $a5            ; $cc9a: a6 a5     
__cc9c:     .hex 9c d0 05      ; $cc9c: 9c d0 05  Invalid Opcode - SHY $05d0,x
            LDA #$01           ; $cc9f: a9 01     
            STA $5e            ; $cca1: 85 5e     
__cca3:     RTS                ; $cca3: 60        

;-------------------------------------------------------------------------------
__cca4:     LDA $75            ; $cca4: a5 75     
            BNE __ccae         ; $cca6: d0 06     
            LDA $33            ; $cca8: a5 33     
__ccaa:     AND #$03           ; $ccaa: 29 03     
__ccac:     BEQ __cca3         ; $ccac: f0 f5     
__ccae:     JSR __cf87         ; $ccae: 20 87 cf  
            BNE __ccb7         ; $ccb1: d0 04     
            STA $a6            ; $ccb3: 85 a6     
            STA $7b            ; $ccb5: 85 7b     
__ccb7:     TAX                ; $ccb7: aa        
            AND #$01           ; $ccb8: 29 01     
__ccba:     BEQ __ccbf         ; $ccba: f0 03     
            JSR __cdd4         ; $ccbc: 20 d4 cd  
__ccbf:     TXA                ; $ccbf: 8a        
            AND #$02           ; $ccc0: 29 02     
            BEQ __ccc7         ; $ccc2: f0 03     
            JSR __cda3         ; $ccc4: 20 a3 cd  
__ccc7:     TXA                ; $ccc7: 8a        
            AND #$08           ; $ccc8: 29 08     
            BEQ __cccf         ; $ccca: f0 03     
__cccc:     JSR __cd70         ; $cccc: 20 70 cd  
__cccf:     TXA                ; $cccf: 8a        
            AND #$04           ; $ccd0: 29 04     
            BEQ __ccd7         ; $ccd2: f0 03     
            .hex 20 39         ; $ccd4: 20 39     Suspected data
__ccd6:     .hex cd            ; $ccd6: cd        Suspected data
__ccd7:     TXA                ; $ccd7: 8a        
            .hex 29            ; $ccd8: 29        Suspected data
__ccd9:     .hex 80 d0         ; $ccd9: 80 d0     Invalid Opcode - NOP #$d0
            .hex 13 a5         ; $ccdb: 13 a5     Invalid Opcode - SLO ($a5),y
            .hex 77 f0         ; $ccdd: 77 f0     Invalid Opcode - RRA $f0,x
            ASL $7ba5          ; $ccdf: 0e a5 7b  
            BNE __ccee         ; $cce2: d0 0a     
            TXA                ; $cce4: 8a        
            .hex 29            ; $cce5: 29        Suspected data
__cce6:     RTI                ; $cce6: 40        

;-------------------------------------------------------------------------------
            BEQ __ccee         ; $cce7: f0 05     
            STA $7b            ; $cce9: 85 7b     
            JSR __c939         ; $cceb: 20 39 c9  
__ccee:     RTS                ; $ccee: 60        

;-------------------------------------------------------------------------------
            LDY $2a            ; $ccef: a4 2a     
            LDA __e2a3,y       ; $ccf1: b9 a3 e2  
            STA $34            ; $ccf4: 85 34     
            LDA __e2b0,y       ; $ccf6: b9 b0 e2  
            STA $35            ; $ccf9: 85 35     
            LDY $28            ; $ccfb: a4 28     
            LDA ($34),y        ; $ccfd: b1 34     
            BNE __ccee         ; $ccff: d0 ed     
            JSR __ce10         ; $cd01: 20 10 ce  
            JSR __ce1f         ; $cd04: 20 1f ce  
            LDX $74            ; $cd07: a6 74     
__cd09:     LDA $03a0,x        ; $cd09: bd a0 03  
            BEQ __cd12         ; $cd0c: f0 04     
            DEX                ; $cd0e: ca        
            BPL __cd09         ; $cd0f: 10 f8     
            RTS                ; $cd11: 60        

;-------------------------------------------------------------------------------
__cd12:     LDA #$03           ; $cd12: a9 03     
            STA ($34),y        ; $cd14: 91 34     
            LDA $28            ; $cd16: a5 28     
            STA $03aa,x        ; $cd18: 9d aa 03  
            LDA $2a            ; $cd1b: a5 2a     
            STA $03b4,x        ; $cd1d: 9d b4 03  
            LDA #$00           ; $cd20: a9 00     
            STA $03d2,x        ; $cd22: 9d d2 03  
            LDA #$00           ; $cd25: a9 00     
            STA $03c8,x        ; $cd27: 9d c8 03  
            LDA #$a0           ; $cd2a: a9 a0     
            STA $03be,x        ; $cd2c: 9d be 03  
            LDA #$01           ; $cd2f: a9 01     
            STA $03a0,x        ; $cd31: 9d a0 03  
            LDA #$03           ; $cd34: a9 03     
            STA $df            ; $cd36: 85 df     
            RTS                ; $cd38: 60        

;-------------------------------------------------------------------------------
            LDA $2b            ; $cd39: a5 2b     
            CMP #$08           ; $cd3b: c9 08     
            BCS __cd44         ; $cd3d: b0 05     
            INC $2b            ; $cd3f: e6 2b     
            JMP __cd69         ; $cd41: 4c 69 cd  

;-------------------------------------------------------------------------------
__cd44:     LDY $2a            ; $cd44: a4 2a     
            INY                ; $cd46: c8        
            LDA __e2a3,y       ; $cd47: b9 a3 e2  
            STA $34            ; $cd4a: 85 34     
            LDA __e2b0,y       ; $cd4c: b9 b0 e2  
            STA $35            ; $cd4f: 85 35     
            LDY $28            ; $cd51: a4 28     
            JSR __cf60         ; $cd53: 20 60 cf  
            BNE __cd69         ; $cd56: d0 11     
            JSR __ce10         ; $cd58: 20 10 ce  
            INC $2b            ; $cd5b: e6 2b     
            LDA $2b            ; $cd5d: a5 2b     
            CMP #$10           ; $cd5f: c9 10     
            BNE __cd69         ; $cd61: d0 06     
            LDA #$00           ; $cd63: a9 00     
            STA $2b            ; $cd65: 85 2b     
            INC $2a            ; $cd67: e6 2a     
__cd69:     LDA #$04           ; $cd69: a9 04     
            LDY #$07           ; $cd6b: a0 07     
            JMP __ce2e         ; $cd6d: 4c 2e ce  

;-------------------------------------------------------------------------------
__cd70:     LDA $2b            ; $cd70: a5 2b     
            CMP #$09           ; $cd72: c9 09     
            BCC __cd7b         ; $cd74: 90 05     
            DEC $2b            ; $cd76: c6 2b     
            JMP __cd9c         ; $cd78: 4c 9c cd  

;-------------------------------------------------------------------------------
__cd7b:     LDY $2a            ; $cd7b: a4 2a     
            DEY                ; $cd7d: 88        
            LDA __e2a3,y       ; $cd7e: b9 a3 e2  
            STA $34            ; $cd81: 85 34     
            LDA __e2b0,y       ; $cd83: b9 b0 e2  
            STA $35            ; $cd86: 85 35     
            LDY $28            ; $cd88: a4 28     
            JSR __cf60         ; $cd8a: 20 60 cf  
            BNE __cd9c         ; $cd8d: d0 0d     
            JSR __ce10         ; $cd8f: 20 10 ce  
            DEC $2b            ; $cd92: c6 2b     
            BPL __cd9c         ; $cd94: 10 06     
            LDA #$0f           ; $cd96: a9 0f     
            .hex 85            ; $cd98: 85        Suspected data
__cd99:     .hex 2b c6         ; $cd99: 2b c6     Invalid Opcode - ANC #$c6
            ROL                ; $cd9b: 2a        
__cd9c:     LDA #$08           ; $cd9c: a9 08     
            LDY #$0b           ; $cd9e: a0 0b     
            JMP __ce2e         ; $cda0: 4c 2e ce  

;-------------------------------------------------------------------------------
__cda3:     LDA $29            ; $cda3: a5 29     
            CMP #$09           ; $cda5: c9 09     
            BCC __cdae         ; $cda7: 90 05     
            DEC $29            ; $cda9: c6 29     
            JMP __cdcf         ; $cdab: 4c cf cd  

;-------------------------------------------------------------------------------
__cdae:     LDY $2a            ; $cdae: a4 2a     
            LDA __e2a3,y       ; $cdb0: b9 a3 e2  
            STA $34            ; $cdb3: 85 34     
            LDA __e2b0,y       ; $cdb5: b9 b0 e2  
            STA $35            ; $cdb8: 85 35     
            LDY $28            ; $cdba: a4 28     
            DEY                ; $cdbc: 88        
            JSR __cf60         ; $cdbd: 20 60 cf  
            BNE __cdcf         ; $cdc0: d0 0d     
            JSR __ce1f         ; $cdc2: 20 1f ce  
            DEC $29            ; $cdc5: c6 29     
            BPL __cdcf         ; $cdc7: 10 06     
            LDA #$0f           ; $cdc9: a9 0f     
            .hex 85            ; $cdcb: 85        Suspected data
__cdcc:     AND #$c6           ; $cdcc: 29 c6     
            PLP                ; $cdce: 28        
__cdcf:     LDA #$00           ; $cdcf: a9 00     
            JMP __ce06         ; $cdd1: 4c 06 ce  

;-------------------------------------------------------------------------------
__cdd4:     LDA $29            ; $cdd4: a5 29     
            CMP #$08           ; $cdd6: c9 08     
            BCS __cddf         ; $cdd8: b0 05     
            INC $29            ; $cdda: e6 29     
            JMP __ce04         ; $cddc: 4c 04 ce  

;-------------------------------------------------------------------------------
__cddf:     LDY $2a            ; $cddf: a4 2a     
            LDA __e2a3,y       ; $cde1: b9 a3 e2  
            STA $34            ; $cde4: 85 34     
__cde6:     LDA __e2b0,y       ; $cde6: b9 b0 e2  
            STA $35            ; $cde9: 85 35     
            LDY $28            ; $cdeb: a4 28     
            INY                ; $cded: c8        
            JSR __cf60         ; $cdee: 20 60 cf  
            BNE __ce04         ; $cdf1: d0 11     
            JSR __ce1f         ; $cdf3: 20 1f ce  
            INC $29            ; $cdf6: e6 29     
            LDA $29            ; $cdf8: a5 29     
            CMP #$10           ; $cdfa: c9 10     
            BNE __ce04         ; $cdfc: d0 06     
            LDA #$00           ; $cdfe: a9 00     
            STA $29            ; $ce00: 85 29     
            INC $28            ; $ce02: e6 28     
__ce04:     LDA #$40           ; $ce04: a9 40     
__ce06:     STA $2d            ; $ce06: 85 2d     
            LDA #$00           ; $ce08: a9 00     
            LDY #$03           ; $ce0a: a0 03     
            JMP __ce2e         ; $ce0c: 4c 2e ce  

;-------------------------------------------------------------------------------
            RTS                ; $ce0f: 60        

;-------------------------------------------------------------------------------
__ce10:     LDA $29            ; $ce10: a5 29     
            CMP #$08           ; $ce12: c9 08     
            BCC __ce1b         ; $ce14: 90 05     
            BEQ __ce1e         ; $ce16: f0 06     
            DEC $29            ; $ce18: c6 29     
            RTS                ; $ce1a: 60        

;-------------------------------------------------------------------------------
__ce1b:     INC $29            ; $ce1b: e6 29     
            RTS                ; $ce1d: 60        

;-------------------------------------------------------------------------------
__ce1e:     RTS                ; $ce1e: 60        

;-------------------------------------------------------------------------------
__ce1f:     LDA $2b            ; $ce1f: a5 2b     
            CMP #$08           ; $ce21: c9 08     
            BCC __ce2a         ; $ce23: 90 05     
            BEQ __ce2d         ; $ce25: f0 06     
            DEC $2b            ; $ce27: c6 2b     
            RTS                ; $ce29: 60        

;-------------------------------------------------------------------------------
__ce2a:     INC $2b            ; $ce2a: e6 2b     
            RTS                ; $ce2c: 60        

;-------------------------------------------------------------------------------
__ce2d:     RTS                ; $ce2d: 60        

;-------------------------------------------------------------------------------
__ce2e:     PHA                ; $ce2e: 48        
            LDA $33            ; $ce2f: a5 33     
            AND #$03           ; $ce31: 29 03     
            CMP #$02           ; $ce33: c9 02     
            BNE __ce59         ; $ce35: d0 22     
            LDA $33            ; $ce37: a5 33     
            PLA                ; $ce39: 68        
            INC $a6            ; $ce3a: e6 a6     
            INC $2c            ; $ce3c: e6 2c     
            CMP $2c            ; $ce3e: c5 2c     
            BCC __ce45         ; $ce40: 90 03     
            STA $2c            ; $ce42: 85 2c     
            RTS                ; $ce44: 60        

;-------------------------------------------------------------------------------
__ce45:     CPY $2c            ; $ce45: c4 2c     
            BCC __ce4a         ; $ce47: 90 01     
            RTS                ; $ce49: 60        

;-------------------------------------------------------------------------------
__ce4a:     STA $2c            ; $ce4a: 85 2c     
            CMP #$04           ; $ce4c: c9 04     
            BCC __ce54         ; $ce4e: 90 04     
            LDA #$02           ; $ce50: a9 02     
            BNE __ce56         ; $ce52: d0 02     
__ce54:     LDA #$01           ; $ce54: a9 01     
__ce56:     STA $df            ; $ce56: 85 df     
            RTS                ; $ce58: 60        

;-------------------------------------------------------------------------------
__ce59:     PLA                ; $ce59: 68        
__ce5a:     RTS                ; $ce5a: 60        

;-------------------------------------------------------------------------------
__ce5b:     LDA $2c            ; $ce5b: a5 2c     
            CMP #$13           ; $ce5d: c9 13     
            BCS __ce5a         ; $ce5f: b0 f9     
            LDA $2d            ; $ce61: a5 2d     
            STA $3d            ; $ce63: 85 3d     
            LDY #$00           ; $ce65: a0 00     
            STY $3c            ; $ce67: 84 3c     
            LDA $28            ; $ce69: a5 28     
            .hex c9            ; $ce6b: c9        Suspected data
__ce6c:     PHP                ; $ce6c: 08        
            BCC __ce80         ; $ce6d: 90 11     
            LDY #$f0           ; $ce6f: a0 f0     
            CMP #$17           ; $ce71: c9 17     
            BCS __ce80         ; $ce73: b0 0b     
            ASL                ; $ce75: 0a        
            ASL                ; $ce76: 0a        
            ASL                ; $ce77: 0a        
            ASL                ; $ce78: 0a        
            CLC                ; $ce79: 18        
            ADC $29            ; $ce7a: 65 29     
            SEC                ; $ce7c: 38        
            SBC #$80           ; $ce7d: e9 80     
            TAY                ; $ce7f: a8        
__ce80:     STY $0e            ; $ce80: 84 0e     
            LDA $28            ; $ce82: a5 28     
            ASL                ; $ce84: 0a        
            ASL                ; $ce85: 0a        
            ASL                ; $ce86: 0a        
            ASL                ; $ce87: 0a        
            CLC                ; $ce88: 18        
            ADC $29            ; $ce89: 65 29     
            SEC                ; $ce8b: 38        
            SBC #$08           ; $ce8c: e9 08     
            SBC $0e            ; $ce8e: e5 0e     
            STA $3a            ; $ce90: 85 3a     
            LDA $2a            ; $ce92: a5 2a     
            ASL                ; $ce94: 0a        
            ASL                ; $ce95: 0a        
            ASL                ; $ce96: 0a        
            ASL                ; $ce97: 0a        
            CLC                ; $ce98: 18        
__ce99:     ADC $2b            ; $ce99: 65 2b     
            ADC #$17           ; $ce9b: 69 17     
            STA $3b            ; $ce9d: 85 3b     
            LDX $2c            ; $ce9f: a6 2c     
            LDA __ced6,x       ; $cea1: bd d6 ce  
            JMP __d5f2         ; $cea4: 4c f2 d5  

;-------------------------------------------------------------------------------
__cea7:     LDA $2d            ; $cea7: a5 2d     
            STA $3d            ; $cea9: 85 3d     
            LDY #$03           ; $ceab: a0 03     
            STY $3c            ; $cead: 84 3c     
            LDA $28            ; $ceaf: a5 28     
            ASL                ; $ceb1: 0a        
            ASL                ; $ceb2: 0a        
            ASL                ; $ceb3: 0a        
            ASL                ; $ceb4: 0a        
            CLC                ; $ceb5: 18        
            ADC $29            ; $ceb6: 65 29     
            SEC                ; $ceb8: 38        
            SBC #$08           ; $ceb9: e9 08     
            STA $3a            ; $cebb: 85 3a     
            LDA $2a            ; $cebd: a5 2a     
            ASL                ; $cebf: 0a        
            ASL                ; $cec0: 0a        
            ASL                ; $cec1: 0a        
            ASL                ; $cec2: 0a        
            CLC                ; $cec3: 18        
            ADC $2b            ; $cec4: 65 2b     
            ADC #$17           ; $cec6: 69 17     
            STA $3b            ; $cec8: 85 3b     
            LDX $2c            ; $ceca: a6 2c     
__cecc:     LDA __ced2,x       ; $cecc: bd d2 ce  
            JMP __d5f2         ; $cecf: 4c f2 d5  

;-------------------------------------------------------------------------------
__ced2:     BPL __cee5         ; $ced2: 10 11     
            .hex 12            ; $ced4: 12        Invalid Opcode - KIL 
            .hex 11            ; $ced5: 11        Suspected data
__ced6:     BRK                ; $ced6: 00        
            ORA ($02,x)        ; $ced7: 01 02     
__ced9:     ORA ($03,x)        ; $ced9: 01 03     
            .hex 04 05         ; $cedb: 04 05     Invalid Opcode - NOP $05
            .hex 04 06         ; $cedd: 04 06     Invalid Opcode - NOP $06
__cedf:     .hex 07 08         ; $cedf: 07 08     Invalid Opcode - SLO $08
            .hex 07 09         ; $cee1: 07 09     Invalid Opcode - SLO $09
            ASL                ; $cee3: 0a        
            .hex 0b            ; $cee4: 0b        Suspected data
__cee5:     .hex 0c 0d 0e      ; $cee5: 0c 0d 0e  Invalid Opcode - NOP $0e0d
            .hex 0f            ; $cee8: 0f        Suspected data
__cee9:     LDA #$04           ; $cee9: a9 04     
            STA $df            ; $ceeb: 85 df     
            LDA #$0a           ; $ceed: a9 0a     
            JSR __dd83         ; $ceef: 20 83 dd  
            LDX $5b            ; $cef2: a6 5b     
            DEX                ; $cef4: ca        
            BEQ __cf0d         ; $cef5: f0 16     
            DEX                ; $cef7: ca        
            BEQ __cf1a         ; $cef8: f0 20     
            DEX                ; $cefa: ca        
            BEQ __cf2a         ; $cefb: f0 2d     
            DEX                ; $cefd: ca        
            BEQ __cf33         ; $cefe: f0 33     
            DEX                ; $cf00: ca        
            BEQ __cf3c         ; $cf01: f0 39     
            DEX                ; $cf03: ca        
            BEQ __cf45         ; $cf04: f0 3f     
            DEX                ; $cf06: ca        
            BEQ __cf4e         ; $cf07: f0 45     
            DEX                ; $cf09: ca        
            BEQ __cf57         ; $cf0a: f0 4b     
            RTS                ; $cf0c: 60        

;-------------------------------------------------------------------------------
__cf0d:     LDA $74            ; $cf0d: a5 74     
            CMP #$09           ; $cf0f: c9 09     
            BEQ __cf15         ; $cf11: f0 02     
            INC $74            ; $cf13: e6 74     
__cf15:     LDA #$04           ; $cf15: a9 04     
            STA $b5            ; $cf17: 85 b5     
            RTS                ; $cf19: 60        

;-------------------------------------------------------------------------------
__cf1a:     LDA $73            ; $cf1a: a5 73     
            CMP #$50           ; $cf1c: c9 50     
            BEQ __cf25         ; $cf1e: f0 05     
            CLC                ; $cf20: 18        
            ADC #$10           ; $cf21: 69 10     
            STA $73            ; $cf23: 85 73     
__cf25:     LDA #$04           ; $cf25: a9 04     
            STA $b5            ; $cf27: 85 b5     
            RTS                ; $cf29: 60        

;-------------------------------------------------------------------------------
__cf2a:     LDA #$01           ; $cf2a: a9 01     
            STA $75            ; $cf2c: 85 75     
            LDA #$04           ; $cf2e: a9 04     
            STA $b5            ; $cf30: 85 b5     
            RTS                ; $cf32: 60        

;-------------------------------------------------------------------------------
__cf33:     LDA #$01           ; $cf33: a9 01     
            STA $76            ; $cf35: 85 76     
            LDA #$04           ; $cf37: a9 04     
            STA $b5            ; $cf39: 85 b5     
            RTS                ; $cf3b: 60        

;-------------------------------------------------------------------------------
__cf3c:     LDA #$01           ; $cf3c: a9 01     
            STA $77            ; $cf3e: 85 77     
            LDA #$04           ; $cf40: a9 04     
            STA $b5            ; $cf42: 85 b5     
            RTS                ; $cf44: 60        

;-------------------------------------------------------------------------------
__cf45:     LDA #$01           ; $cf45: a9 01     
            STA $78            ; $cf47: 85 78     
            LDA #$04           ; $cf49: a9 04     
            STA $b5            ; $cf4b: 85 b5     
            RTS                ; $cf4d: 60        

;-------------------------------------------------------------------------------
__cf4e:     LDA #$01           ; $cf4e: a9 01     
            STA $79            ; $cf50: 85 79     
            LDA #$05           ; $cf52: a9 05     
            STA $b5            ; $cf54: 85 b5     
            RTS                ; $cf56: 60        

;-------------------------------------------------------------------------------
__cf57:     LDA #$ff           ; $cf57: a9 ff     
            STA $7a            ; $cf59: 85 7a     
            LDA #$05           ; $cf5b: a9 05     
            STA $b5            ; $cf5d: 85 b5     
            RTS                ; $cf5f: 60        

;-------------------------------------------------------------------------------
__cf60:     LDA ($34),y        ; $cf60: b1 34     
            BEQ __cf7c         ; $cf62: f0 18     
            CMP #$08           ; $cf64: c9 08     
            BEQ __cf7c         ; $cf66: f0 14     
            CMP #$06           ; $cf68: c9 06     
            BEQ __cf7c         ; $cf6a: f0 10     
            CMP #$02           ; $cf6c: c9 02     
            BEQ __cf7d         ; $cf6e: f0 0d     
            CMP #$04           ; $cf70: c9 04     
            BEQ __cf7d         ; $cf72: f0 09     
            CMP #$05           ; $cf74: c9 05     
            BEQ __cf7d         ; $cf76: f0 05     
            CMP #$03           ; $cf78: c9 03     
            BEQ __cf82         ; $cf7a: f0 06     
__cf7c:     RTS                ; $cf7c: 60        

;-------------------------------------------------------------------------------
__cf7d:     LDA $76            ; $cf7d: a5 76     
            EOR #$01           ; $cf7f: 49 01     
            RTS                ; $cf81: 60        

;-------------------------------------------------------------------------------
__cf82:     LDA $78            ; $cf82: a5 78     
            EOR #$01           ; $cf84: 49 01     
            RTS                ; $cf86: 60        

;-------------------------------------------------------------------------------
__cf87:     LDA $59            ; $cf87: a5 59     
            BEQ __cfa4         ; $cf89: f0 19     
            LDA $af            ; $cf8b: a5 af     
            DEC $ae            ; $cf8d: c6 ae     
            BNE __cfa3         ; $cf8f: d0 12     
            PHA                ; $cf91: 48        
            LDY #$00           ; $cf92: a0 00     
            LDA ($ac),y        ; $cf94: b1 ac     
            STA $ae            ; $cf96: 85 ae     
            JSR __cfa9         ; $cf98: 20 a9 cf  
            LDA ($ac),y        ; $cf9b: b1 ac     
            STA $af            ; $cf9d: 85 af     
            JSR __cfa9         ; $cf9f: 20 a9 cf  
            PLA                ; $cfa2: 68        
__cfa3:     RTS                ; $cfa3: 60        

;-------------------------------------------------------------------------------
__cfa4:     LDA $12            ; $cfa4: a5 12     
            ORA $13            ; $cfa6: 05 13     
            RTS                ; $cfa8: 60        

;-------------------------------------------------------------------------------
__cfa9:     INC $ac            ; $cfa9: e6 ac     
            BNE __cfaf         ; $cfab: d0 02     
            INC $ad            ; $cfad: e6 ad     
__cfaf:     RTS                ; $cfaf: 60        

;-------------------------------------------------------------------------------
__cfb0:     LDA #$00           ; $cfb0: a9 00     
            STA $9c            ; $cfb2: 85 9c     
            LDA #$c0           ; $cfb4: a9 c0     
            STA $6b            ; $cfb6: 85 6b     
            LDX #$09           ; $cfb8: a2 09     
__cfba:     LDA $0576,x        ; $cfba: bd 76 05  
            BEQ __cfe9         ; $cfbd: f0 2a     
            CMP #$09           ; $cfbf: c9 09     
            BCS __cfc5         ; $cfc1: b0 02     
            INC $9c            ; $cfc3: e6 9c     
__cfc5:     LDY $05b2,x        ; $cfc5: bc b2 05  
            BEQ __cfcf         ; $cfc8: f0 05     
            DEC $05b2,x        ; $cfca: de b2 05  
            BNE __cfe9         ; $cfcd: d0 1a     
__cfcf:     ASL                ; $cfcf: 0a        
            TAY                ; $cfd0: a8        
            JSR __d1c8         ; $cfd1: 20 c8 d1  
            LDA #$cf           ; $cfd4: a9 cf     
            PHA                ; $cfd6: 48        
            LDA #$e2           ; $cfd7: a9 e2     
            PHA                ; $cfd9: 48        
            LDA __d245,y       ; $cfda: b9 45 d2  
            PHA                ; $cfdd: 48        
            LDA __d244,y       ; $cfde: b9 44 d2  
            PHA                ; $cfe1: 48        
            RTS                ; $cfe2: 60        

;-------------------------------------------------------------------------------
            JSR __d207         ; $cfe3: 20 07 d2  
            JSR __d006         ; $cfe6: 20 06 d0  
__cfe9:     DEX                ; $cfe9: ca        
            BPL __cfba         ; $cfea: 10 ce     
__cfec:     RTS                ; $cfec: 60        

;-------------------------------------------------------------------------------
__cfed:     LDA $9d            ; $cfed: a5 9d     
            CLC                ; $cfef: 18        
            ADC #$2c           ; $cff0: 69 2c     
            STA $46            ; $cff2: 85 46     
            LDA $aa            ; $cff4: a5 aa     
            STA $42            ; $cff6: 85 42     
            LDA $ab            ; $cff8: a5 ab     
            STA $44            ; $cffa: 85 44     
            LDA #$08           ; $cffc: a9 08     
            STA $43            ; $cffe: 85 43     
            STA $45            ; $d000: 85 45     
            LDA #$00           ; $d002: a9 00     
            BEQ __d010         ; $d004: f0 0a     
__d006:     LDA $41            ; $d006: a5 41     
            BEQ __cfec         ; $d008: f0 e2     
            CMP #$0b           ; $d00a: c9 0b     
            BEQ __d08c         ; $d00c: f0 7e     
            LDA $48            ; $d00e: a5 48     
__d010:     STA $3d            ; $d010: 85 3d     
            LDY #$00           ; $d012: a0 00     
            STY $50            ; $d014: 84 50     
            LDA $42            ; $d016: a5 42     
            ASL                ; $d018: 0a        
            ASL                ; $d019: 0a        
            ASL                ; $d01a: 0a        
            ASL                ; $d01b: 0a        
            ROL $50            ; $d01c: 26 50     
            CLC                ; $d01e: 18        
            ADC $43            ; $d01f: 65 43     
            STA $4f            ; $d021: 85 4f     
            LDA $50            ; $d023: a5 50     
            ADC #$00           ; $d025: 69 00     
            STA $50            ; $d027: 85 50     
            LDA $4f            ; $d029: a5 4f     
            SEC                ; $d02b: 38        
            SBC #$08           ; $d02c: e9 08     
            STA $4f            ; $d02e: 85 4f     
            LDA $50            ; $d030: a5 50     
            SBC #$00           ; $d032: e9 00     
            STA $50            ; $d034: 85 50     
            LDA $4f            ; $d036: a5 4f     
            SEC                ; $d038: 38        
            SBC $0e            ; $d039: e5 0e     
            STA $4f            ; $d03b: 85 4f     
            LDA $50            ; $d03d: a5 50     
            SBC #$00           ; $d03f: e9 00     
            BNE __d08b         ; $d041: d0 48     
            LDA $4f            ; $d043: a5 4f     
            CMP #$f8           ; $d045: c9 f8     
            BCS __d08b         ; $d047: b0 42     
            STA $3a            ; $d049: 85 3a     
            LDA $44            ; $d04b: a5 44     
            ASL                ; $d04d: 0a        
            ASL                ; $d04e: 0a        
            ASL                ; $d04f: 0a        
            ASL                ; $d050: 0a        
            CLC                ; $d051: 18        
            ADC $45            ; $d052: 65 45     
            ADC #$17           ; $d054: 69 17     
            STA $3b            ; $d056: 85 3b     
            LDY $46            ; $d058: a4 46     
            LDA __d186,y       ; $d05a: b9 86 d1  
            STA $3c            ; $d05d: 85 3c     
            LDA __d154,y       ; $d05f: b9 54 d1  
            JSR __d5f2         ; $d062: 20 f2 d5  
            LDA $46            ; $d065: a5 46     
            CMP #$20           ; $d067: c9 20     
            BCS __d08b         ; $d069: b0 20     
            LDA $5c            ; $d06b: a5 5c     
            BNE __d08b         ; $d06d: d0 1c     
            LDA $7a            ; $d06f: a5 7a     
            BNE __d08b         ; $d071: d0 18     
            LDA $42            ; $d073: a5 42     
            CMP $28            ; $d075: c5 28     
            BNE __d08b         ; $d077: d0 12     
            LDA $44            ; $d079: a5 44     
            CMP $2a            ; $d07b: c5 2a     
            BNE __d08b         ; $d07d: d0 0c     
            LDA #$05           ; $d07f: a9 05     
            STA $df            ; $d081: 85 df     
            LDA #$01           ; $d083: a9 01     
            STA $5c            ; $d085: 85 5c     
            LDA #$0c           ; $d087: a9 0c     
            STA $2c            ; $d089: 85 2c     
__d08b:     RTS                ; $d08b: 60        

;-------------------------------------------------------------------------------
__d08c:     TXA                ; $d08c: 8a        
            PHA                ; $d08d: 48        
            LDA #$00           ; $d08e: a9 00     
            STA $3d            ; $d090: 85 3d     
            LDY #$00           ; $d092: a0 00     
            STY $50            ; $d094: 84 50     
            LDA $42            ; $d096: a5 42     
            ASL                ; $d098: 0a        
            ASL                ; $d099: 0a        
            ASL                ; $d09a: 0a        
            ASL                ; $d09b: 0a        
            ROL $50            ; $d09c: 26 50     
            CLC                ; $d09e: 18        
            ADC $43            ; $d09f: 65 43     
            STA $4f            ; $d0a1: 85 4f     
            LDA $50            ; $d0a3: a5 50     
            ADC #$00           ; $d0a5: 69 00     
            STA $50            ; $d0a7: 85 50     
            LDA $4f            ; $d0a9: a5 4f     
            SEC                ; $d0ab: 38        
            SBC #$08           ; $d0ac: e9 08     
            STA $4f            ; $d0ae: 85 4f     
            LDA $50            ; $d0b0: a5 50     
            SBC #$00           ; $d0b2: e9 00     
            STA $50            ; $d0b4: 85 50     
            LDA $4f            ; $d0b6: a5 4f     
            SEC                ; $d0b8: 38        
            SBC $0e            ; $d0b9: e5 0e     
            STA $4f            ; $d0bb: 85 4f     
            LDA $50            ; $d0bd: a5 50     
            SBC #$00           ; $d0bf: e9 00     
            BNE __d0f7         ; $d0c1: d0 34     
            LDA $4f            ; $d0c3: a5 4f     
            CMP #$f8           ; $d0c5: c9 f8     
            BCS __d0f7         ; $d0c7: b0 2e     
            STA $3a            ; $d0c9: 85 3a     
            LDA $44            ; $d0cb: a5 44     
            ASL                ; $d0cd: 0a        
            ASL                ; $d0ce: 0a        
            ASL                ; $d0cf: 0a        
            ASL                ; $d0d0: 0a        
            CLC                ; $d0d1: 18        
            ADC $45            ; $d0d2: 65 45     
            ADC #$1b           ; $d0d4: 69 1b     
            STA $3b            ; $d0d6: 85 3b     
            LDA $4b            ; $d0d8: a5 4b     
            CLC                ; $d0da: 18        
            ADC $4a            ; $d0db: 65 4a     
            CMP #$10           ; $d0dd: c9 10     
            BCC __d0e3         ; $d0df: 90 02     
            LDA #$10           ; $d0e1: a9 10     
__d0e3:     STA $24            ; $d0e3: 85 24     
            ASL                ; $d0e5: 0a        
            CLC                ; $d0e6: 18        
            ADC $24            ; $d0e7: 65 24     
            TAX                ; $d0e9: aa        
            LDY $6b            ; $d0ea: a4 6b     
            JSR __d0fa         ; $d0ec: 20 fa d0  
            JSR __d0fa         ; $d0ef: 20 fa d0  
            JSR __d0fa         ; $d0f2: 20 fa d0  
            STY $6b            ; $d0f5: 84 6b     
__d0f7:     PLA                ; $d0f7: 68        
            TAX                ; $d0f8: aa        
            RTS                ; $d0f9: 60        

;-------------------------------------------------------------------------------
__d0fa:     LDA __d121,x       ; $d0fa: bd 21 d1  
            BEQ __d11c         ; $d0fd: f0 1d     
            PHA                ; $d0ff: 48        
            LDA $3b            ; $d100: a5 3b     
            STA $0700,y        ; $d102: 99 00 07  
            INY                ; $d105: c8        
            PLA                ; $d106: 68        
            STA $0700,y        ; $d107: 99 00 07  
            INY                ; $d10a: c8        
            LDA #$01           ; $d10b: a9 01     
            STA $0700,y        ; $d10d: 99 00 07  
            INY                ; $d110: c8        
            LDA $3a            ; $d111: a5 3a     
            STA $0700,y        ; $d113: 99 00 07  
            INY                ; $d116: c8        
            CLC                ; $d117: 18        
            ADC #$08           ; $d118: 69 08     
            STA $3a            ; $d11a: 85 3a     
__d11c:     INX                ; $d11c: e8        
            INY                ; $d11d: c8        
            DEY                ; $d11e: 88        
            BNE __d123         ; $d11f: d0 02     
__d121:     LDY #$fc           ; $d121: a0 fc     
__d123:     RTS                ; $d123: 60        

;-------------------------------------------------------------------------------
            .hex ec 46 00      ; $d124: ec 46 00  Bad Addr Mode - CPX $0046
            .hex ed 46 00      ; $d127: ed 46 00  Bad Addr Mode - SBC $0046
            .hex ee 46 00      ; $d12a: ee 46 00  Bad Addr Mode - INC $0046
            .hex ef 46 00      ; $d12d: ef 46 00  Bad Addr Mode - ISC $0046
            .hex fc 46 00      ; $d130: fc 46 00  Bad Addr Mode - NOP $0046,x
            .hex fd 46 00      ; $d133: fd 46 00  Bad Addr Mode - SBC $0046,x
            .hex fe 46 00      ; $d136: fe 46 00  Bad Addr Mode - INC $0046,x
            .hex ff 46 00      ; $d139: ff 46 00  Bad Addr Mode - ISC $0046,x
            CPX $4646          ; $d13c: ec 46 46  
            SBC $4646          ; $d13f: ed 46 46  
            INC $4646          ; $d142: ee 46 46  
            .hex ef 46 46      ; $d145: ef 46 46  Invalid Opcode - ISC $4646
            .hex fc 46 46      ; $d148: fc 46 46  Invalid Opcode - NOP $4646,x
            SBC $4646,x        ; $d14b: fd 46 46  
            INC $4646,x        ; $d14e: fe 46 46  
            .hex ff 46 46      ; $d151: ff 46 46  Invalid Opcode - ISC $4646,x
__d154:     CLC                ; $d154: 18        
            ORA $191a,y        ; $d155: 19 1a 19  
            .hex 1c 1d 1e      ; $d158: 1c 1d 1e  Invalid Opcode - NOP $1e1d,x
            ORA $2120,x        ; $d15b: 1d 20 21  
            .hex 22            ; $d15e: 22        Invalid Opcode - KIL 
            AND ($24,x)        ; $d15f: 21 24     
            AND $26            ; $d161: 25 26     
            AND $28            ; $d163: 25 28     
            AND #$2a           ; $d165: 29 2a     
            AND #$2c           ; $d167: 29 2c     
            AND $2d2e          ; $d169: 2d 2e 2d  
            BMI __d19f         ; $d16c: 30 31     
            .hex 32            ; $d16e: 32        Invalid Opcode - KIL 
            AND ($34),y        ; $d16f: 31 34     
            AND $36,x          ; $d171: 35 36     
            AND $1b,x          ; $d173: 35 1b     
            .hex 1f 23 27      ; $d175: 1f 23 27  Invalid Opcode - SLO $2723,x
            .hex 2b 2f         ; $d178: 2b 2f     Invalid Opcode - ANC #$2f
            .hex 33 37         ; $d17a: 33 37     Invalid Opcode - RLA ($37),y
            .hex 14 15         ; $d17c: 14 15     Invalid Opcode - NOP $15,x
            ASL $17,x          ; $d17e: 16 17     
            SEC                ; $d180: 38        
            AND $3b3a,y        ; $d181: 39 3a 3b  
            .hex 3c 3d         ; $d184: 3c 3d     Suspected data
__d186:     ORA ($01,x)        ; $d186: 01 01     
            ORA ($01,x)        ; $d188: 01 01     
            .hex 03 03         ; $d18a: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $d18c: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 02            ; $d18e: 02        Invalid Opcode - KIL 
            .hex 02            ; $d18f: 02        Invalid Opcode - KIL 
            .hex 02            ; $d190: 02        Invalid Opcode - KIL 
            .hex 02            ; $d191: 02        Invalid Opcode - KIL 
            ORA ($01,x)        ; $d192: 01 01     
            ORA ($01,x)        ; $d194: 01 01     
            .hex 03 03         ; $d196: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $d198: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 02            ; $d19a: 02        Invalid Opcode - KIL 
            .hex 02            ; $d19b: 02        Invalid Opcode - KIL 
            .hex 02            ; $d19c: 02        Invalid Opcode - KIL 
            .hex 02            ; $d19d: 02        Invalid Opcode - KIL 
            .hex 01            ; $d19e: 01        Suspected data
__d19f:     ORA ($01,x)        ; $d19f: 01 01     
            ORA ($01,x)        ; $d1a1: 01 01     
            .hex 02            ; $d1a3: 02        Invalid Opcode - KIL 
            ORA ($02,x)        ; $d1a4: 01 02     
            ORA ($03,x)        ; $d1a6: 01 03     
            .hex 02            ; $d1a8: 02        Invalid Opcode - KIL 
            ORA ($03,x)        ; $d1a9: 01 03     
            .hex 02            ; $d1ab: 02        Invalid Opcode - KIL 
            ORA ($01,x)        ; $d1ac: 01 01     
            ORA ($01,x)        ; $d1ae: 01 01     
            ORA ($01,x)        ; $d1b0: 01 01     
            ORA ($00,x)        ; $d1b2: 01 00     
            ORA ($02,x)        ; $d1b4: 01 02     
            .hex 03            ; $d1b6: 03        Suspected data
__d1b7:     ORA ($01,x)        ; $d1b7: 01 01     
            .hex 02            ; $d1b9: 02        Invalid Opcode - KIL 
            .hex 04 08         ; $d1ba: 04 08     Invalid Opcode - NOP $08
            ASL                ; $d1bc: 0a        
            .hex 14 28         ; $d1bd: 14 28     Invalid Opcode - NOP $28,x
            BVC __d225         ; $d1bf: 50 64     
            INY                ; $d1c1: c8        
            .hex 02            ; $d1c2: 02        Invalid Opcode - KIL 
            .hex 04 05         ; $d1c3: 04 05     Invalid Opcode - NOP $05
            ASL                ; $d1c5: 0a        
            .hex 14 28         ; $d1c6: 14 28     Invalid Opcode - NOP $28,x
__d1c8:     STX $4d            ; $d1c8: 86 4d     
            LDA $0576,x        ; $d1ca: bd 76 05  
            STA $41            ; $d1cd: 85 41     
            LDA $0580,x        ; $d1cf: bd 80 05  
            STA $42            ; $d1d2: 85 42     
            LDA $058a,x        ; $d1d4: bd 8a 05  
            STA $43            ; $d1d7: 85 43     
            LDA $0594,x        ; $d1d9: bd 94 05  
            STA $44            ; $d1dc: 85 44     
            LDA $059e,x        ; $d1de: bd 9e 05  
            STA $45            ; $d1e1: 85 45     
            LDA $05a8,x        ; $d1e3: bd a8 05  
            STA $46            ; $d1e6: 85 46     
            LDA $05b2,x        ; $d1e8: bd b2 05  
            STA $47            ; $d1eb: 85 47     
            LDA $05bc,x        ; $d1ed: bd bc 05  
            STA $48            ; $d1f0: 85 48     
            LDA $05c6,x        ; $d1f2: bd c6 05  
            STA $49            ; $d1f5: 85 49     
            LDA $05d0,x        ; $d1f7: bd d0 05  
            STA $4a            ; $d1fa: 85 4a     
            LDA $05da,x        ; $d1fc: bd da 05  
            STA $4b            ; $d1ff: 85 4b     
            LDA $05e4,x        ; $d201: bd e4 05  
            STA $4c            ; $d204: 85 4c     
            RTS                ; $d206: 60        

;-------------------------------------------------------------------------------
__d207:     LDX $4d            ; $d207: a6 4d     
            LDA $41            ; $d209: a5 41     
            STA $0576,x        ; $d20b: 9d 76 05  
            LDA $42            ; $d20e: a5 42     
            STA $0580,x        ; $d210: 9d 80 05  
            LDA $43            ; $d213: a5 43     
            STA $058a,x        ; $d215: 9d 8a 05  
            LDA $44            ; $d218: a5 44     
            STA $0594,x        ; $d21a: 9d 94 05  
            LDA $45            ; $d21d: a5 45     
            STA $059e,x        ; $d21f: 9d 9e 05  
            LDA $46            ; $d222: a5 46     
            .hex 9d            ; $d224: 9d        Suspected data
__d225:     TAY                ; $d225: a8        
            ORA $a5            ; $d226: 05 a5     
            .hex 47 9d         ; $d228: 47 9d     Invalid Opcode - SRE $9d
            .hex b2            ; $d22a: b2        Invalid Opcode - KIL 
            ORA $a5            ; $d22b: 05 a5     
            PHA                ; $d22d: 48        
            STA $05bc,x        ; $d22e: 9d bc 05  
            LDA $49            ; $d231: a5 49     
            STA $05c6,x        ; $d233: 9d c6 05  
            LDA $4a            ; $d236: a5 4a     
            STA $05d0,x        ; $d238: 9d d0 05  
            LDA $4b            ; $d23b: a5 4b     
            STA $05da,x        ; $d23d: 9d da 05  
            LDA $4c            ; $d240: a5 4c     
            .hex 9d e4         ; $d242: 9d e4     Suspected data
__d244:     .hex 05            ; $d244: 05        Suspected data
__d245:     RTS                ; $d245: 60        

;-------------------------------------------------------------------------------
            JSR __e7d3         ; $d246: 20 d3 e7  
            .hex d2            ; $d249: d2        Invalid Opcode - KIL 
            INY                ; $d24a: c8        
            .hex d2            ; $d24b: d2        Invalid Opcode - KIL 
            ORA $d3            ; $d24c: 05 d3     
            LDY $d2,x          ; $d24e: b4 d2     
            ORA $a0d3,y        ; $d250: 19 d3 a0  
            .hex d3 8a         ; $d253: d3 8a     Invalid Opcode - DCP ($8a),y
            .hex d3 a2         ; $d255: d3 a2     Invalid Opcode - DCP ($a2),y
            .hex d2            ; $d257: d2        Invalid Opcode - KIL 
            .hex 64 d2         ; $d258: 64 d2     Invalid Opcode - NOP $d2
            .hex 5b d2 c6      ; $d25a: 5b d2 c6  Invalid Opcode - SRE __c6d2,y
            EOR #$d0           ; $d25d: 49 d0     
            .hex 42            ; $d25f: 42        Invalid Opcode - KIL 
            LDA #$00           ; $d260: a9 00     
            STA $41            ; $d262: 85 41     
            RTS                ; $d264: 60        

;-------------------------------------------------------------------------------
            DEC $49            ; $d265: c6 49     
            BNE __d2a2         ; $d267: d0 39     
            LDA #$0a           ; $d269: a9 0a     
            STA $49            ; $d26b: 85 49     
            INC $46            ; $d26d: e6 46     
            LDA $46            ; $d26f: a5 46     
            CMP #$2c           ; $d271: c9 2c     
            BNE __d2a2         ; $d273: d0 2d     
            LDA $4b            ; $d275: a5 4b     
            CLC                ; $d277: 18        
            ADC $4a            ; $d278: 65 4a     
            TAY                ; $d27a: a8        
            CPY #$0b           ; $d27b: c0 0b     
            BCC __d294         ; $d27d: 90 15     
            CPY #$10           ; $d27f: c0 10     
            BCC __d285         ; $d281: 90 02     
            LDY #$10           ; $d283: a0 10     
__d285:     LDA __d1b7,y       ; $d285: b9 b7 d1  
            TAX                ; $d288: aa        
__d289:     LDA #$c8           ; $d289: a9 c8     
            JSR __dd83         ; $d28b: 20 83 dd  
            DEX                ; $d28e: ca        
            BNE __d289         ; $d28f: d0 f8     
            JMP __d29a         ; $d291: 4c 9a d2  

;-------------------------------------------------------------------------------
__d294:     LDA __d1b7,y       ; $d294: b9 b7 d1  
            JSR __dd83         ; $d297: 20 83 dd  
__d29a:     LDA #$0b           ; $d29a: a9 0b     
            STA $41            ; $d29c: 85 41     
            LDA #$64           ; $d29e: a9 64     
            STA $49            ; $d2a0: 85 49     
__d2a2:     RTS                ; $d2a2: 60        

;-------------------------------------------------------------------------------
            DEC $49            ; $d2a3: c6 49     
            BNE __d2b3         ; $d2a5: d0 0c     
            LDA #$0a           ; $d2a7: a9 0a     
            STA $41            ; $d2a9: 85 41     
            LDA #$28           ; $d2ab: a9 28     
            STA $46            ; $d2ad: 85 46     
            LDA #$14           ; $d2af: a9 14     
            STA $49            ; $d2b1: 85 49     
__d2b3:     RTS                ; $d2b3: 60        

;-------------------------------------------------------------------------------
__d2b4:     RTS                ; $d2b4: 60        

;-------------------------------------------------------------------------------
            LDA #$10           ; $d2b5: a9 10     
            LDY #$13           ; $d2b7: a0 13     
            JSR __d5da         ; $d2b9: 20 da d5  
            JSR __d37e         ; $d2bc: 20 7e d3  
            LDA $33            ; $d2bf: a5 33     
            AND #$03           ; $d2c1: 29 03     
            BNE __d2b4         ; $d2c3: d0 ef     
            JMP __d310         ; $d2c5: 4c 10 d3  

;-------------------------------------------------------------------------------
__d2c8:     RTS                ; $d2c8: 60        

;-------------------------------------------------------------------------------
            LDA #$08           ; $d2c9: a9 08     
            LDY #$0b           ; $d2cb: a0 0b     
            JSR __d5da         ; $d2cd: 20 da d5  
            JSR __d37e         ; $d2d0: 20 7e d3  
            LDA $33            ; $d2d3: a5 33     
            AND #$03           ; $d2d5: 29 03     
            BEQ __d2c8         ; $d2d7: f0 ef     
            DEC $4c            ; $d2d9: c6 4c     
            LDA $4c            ; $d2db: a5 4c     
            CMP #$96           ; $d2dd: c9 96     
            BCS __d2e4         ; $d2df: b0 03     
            JSR __d426         ; $d2e1: 20 26 d4  
__d2e4:     JMP __d33f         ; $d2e4: 4c 3f d3  

;-------------------------------------------------------------------------------
__d2e7:     RTS                ; $d2e7: 60        

;-------------------------------------------------------------------------------
            LDA #$04           ; $d2e8: a9 04     
            LDY #$07           ; $d2ea: a0 07     
            JSR __d5da         ; $d2ec: 20 da d5  
            JSR __d37e         ; $d2ef: 20 7e d3  
            LDA $33            ; $d2f2: a5 33     
            AND #$03           ; $d2f4: 29 03     
            BEQ __d2e7         ; $d2f6: f0 ef     
            DEC $4c            ; $d2f8: c6 4c     
            LDA $4c            ; $d2fa: a5 4c     
            CMP #$96           ; $d2fc: c9 96     
            BCS __d303         ; $d2fe: b0 03     
            JSR __d43d         ; $d300: 20 3d d4  
__d303:     JMP __d33f         ; $d303: 4c 3f d3  

;-------------------------------------------------------------------------------
            LDA #$0c           ; $d306: a9 0c     
            LDY #$0f           ; $d308: a0 0f     
            JSR __d5da         ; $d30a: 20 da d5  
            JSR __d37e         ; $d30d: 20 7e d3  
__d310:     DEC $4c            ; $d310: c6 4c     
            LDA $4c            ; $d312: a5 4c     
            CMP #$c8           ; $d314: c9 c8     
            JMP __d337         ; $d316: 4c 37 d3  

;-------------------------------------------------------------------------------
__d319:     RTS                ; $d319: 60        

;-------------------------------------------------------------------------------
            LDA #$14           ; $d31a: a9 14     
            LDY #$17           ; $d31c: a0 17     
            JMP __d325         ; $d31e: 4c 25 d3  

;-------------------------------------------------------------------------------
            LDA #$00           ; $d321: a9 00     
            LDY #$03           ; $d323: a0 03     
__d325:     JSR __d5da         ; $d325: 20 da d5  
            JSR __d37e         ; $d328: 20 7e d3  
            LDA $33            ; $d32b: a5 33     
            AND #$01           ; $d32d: 29 01     
            BEQ __d319         ; $d32f: f0 e8     
            DEC $4c            ; $d331: c6 4c     
            LDA $4c            ; $d333: a5 4c     
            CMP #$14           ; $d335: c9 14     
__d337:     BCS __d33f         ; $d337: b0 06     
            JSR __d43d         ; $d339: 20 3d d4  
            JSR __d426         ; $d33c: 20 26 d4  
__d33f:     LDA $49            ; $d33f: a5 49     
            BEQ __d365         ; $d341: f0 22     
            DEC $49            ; $d343: c6 49     
            LDA $4a            ; $d345: a5 4a     
            JSR __d4de         ; $d347: 20 de d4  
            BEQ __d364         ; $d34a: f0 18     
            CMP #$03           ; $d34c: c9 03     
            BCC __d360         ; $d34e: 90 10     
            LDY $4a            ; $d350: a4 4a     
            LDA __d412,y       ; $d352: b9 12 d4  
            STA $4a            ; $d355: 85 4a     
            LDA #$00           ; $d357: a9 00     
            STA $4c            ; $d359: 85 4c     
            LDA #$60           ; $d35b: a9 60     
            STA $49            ; $d35d: 85 49     
            RTS                ; $d35f: 60        

;-------------------------------------------------------------------------------
__d360:     LDA #$00           ; $d360: a9 00     
            STA $49            ; $d362: 85 49     
__d364:     RTS                ; $d364: 60        

;-------------------------------------------------------------------------------
__d365:     JSR __d670         ; $d365: 20 70 d6  
            PHA                ; $d368: 48        
            AND #$18           ; $d369: 29 18     
            ASL                ; $d36b: 0a        
            ASL                ; $d36c: 0a        
            CLC                ; $d36d: 18        
            ADC #$20           ; $d36e: 69 20     
            STA $49            ; $d370: 85 49     
            PLA                ; $d372: 68        
            ROL                ; $d373: 2a        
            ROL                ; $d374: 2a        
            ROL                ; $d375: 2a        
            AND #$03           ; $d376: 29 03     
            CLC                ; $d378: 18        
            ADC #$01           ; $d379: 69 01     
            STA $4a            ; $d37b: 85 4a     
            RTS                ; $d37d: 60        

;-------------------------------------------------------------------------------
__d37e:     LDY #$00           ; $d37e: a0 00     
            LDA $4a            ; $d380: a5 4a     
            CMP #$03           ; $d382: c9 03     
            BCC __d388         ; $d384: 90 02     
            LDY #$40           ; $d386: a0 40     
__d388:     STY $48            ; $d388: 84 48     
            RTS                ; $d38a: 60        

;-------------------------------------------------------------------------------
            LDA #$1c           ; $d38b: a9 1c     
            LDY #$1f           ; $d38d: a0 1f     
            JSR __d5da         ; $d38f: 20 da d5  
            LDY #$00           ; $d392: a0 00     
            LDA $46            ; $d394: a5 46     
            CMP #$1d           ; $d396: c9 1d     
__d398:     BNE __d39c         ; $d398: d0 02     
            LDY #$40           ; $d39a: a0 40     
__d39c:     STY $48            ; $d39c: 84 48     
            JMP __d3ab         ; $d39e: 4c ab d3  

;-------------------------------------------------------------------------------
            LDA #$18           ; $d3a1: a9 18     
            LDY #$1b           ; $d3a3: a0 1b     
            JSR __d5da         ; $d3a5: 20 da d5  
            JSR __d37e         ; $d3a8: 20 7e d3  
__d3ab:     LDA $4c            ; $d3ab: a5 4c     
            BEQ __d3b4         ; $d3ad: f0 05     
            DEC $4c            ; $d3af: c6 4c     
            BNE __d3ba         ; $d3b1: d0 07     
            RTS                ; $d3b3: 60        

;-------------------------------------------------------------------------------
__d3b4:     JSR __d43d         ; $d3b4: 20 3d d4  
            JSR __d426         ; $d3b7: 20 26 d4  
__d3ba:     LDA $4a            ; $d3ba: a5 4a     
            ASL                ; $d3bc: 0a        
            ORA $4b            ; $d3bd: 05 4b     
            TAY                ; $d3bf: a8        
            LDA __d417,y       ; $d3c0: b9 17 d4  
            STA $53            ; $d3c3: 85 53     
            TAY                ; $d3c5: a8        
            LDA __d421,y       ; $d3c6: b9 21 d4  
            STA $52            ; $d3c9: 85 52     
            JSR __d454         ; $d3cb: 20 54 d4  
            AND $52            ; $d3ce: 25 52     
            BEQ __d3e0         ; $d3d0: f0 0e     
            LDA $53            ; $d3d2: a5 53     
            STA $4a            ; $d3d4: 85 4a     
            LDA #$01           ; $d3d6: a9 01     
            EOR $4b            ; $d3d8: 45 4b     
            STA $4b            ; $d3da: 85 4b     
            LDA #$00           ; $d3dc: a9 00     
            STA $49            ; $d3de: 85 49     
__d3e0:     INC $49            ; $d3e0: e6 49     
            LDA $49            ; $d3e2: a5 49     
            CMP #$1f           ; $d3e4: c9 1f     
            BCC __d3ee         ; $d3e6: 90 06     
            LDA #$01           ; $d3e8: a9 01     
            EOR $4b            ; $d3ea: 45 4b     
            STA $4b            ; $d3ec: 85 4b     
__d3ee:     LDA $4a            ; $d3ee: a5 4a     
            JSR __d4de         ; $d3f0: 20 de d4  
            BEQ __d405         ; $d3f3: f0 10     
            CMP #$03           ; $d3f5: c9 03     
            BCS __d406         ; $d3f7: b0 0d     
            INC $4a            ; $d3f9: e6 4a     
            LDA $4a            ; $d3fb: a5 4a     
            CMP #$05           ; $d3fd: c9 05     
            BNE __d405         ; $d3ff: d0 04     
            LDA #$01           ; $d401: a9 01     
            STA $4a            ; $d403: 85 4a     
__d405:     RTS                ; $d405: 60        

;-------------------------------------------------------------------------------
__d406:     LDA #$60           ; $d406: a9 60     
            STA $4c            ; $d408: 85 4c     
            LDY $4a            ; $d40a: a4 4a     
            LDA __d412,y       ; $d40c: b9 12 d4  
            STA $4a            ; $d40f: 85 4a     
            RTS                ; $d411: 60        

;-------------------------------------------------------------------------------
__d412:     BRK                ; $d412: 00        
            .hex 03 04         ; $d413: 03 04     Invalid Opcode - SLO ($04,x)
            ORA ($02,x)        ; $d415: 01 02     
__d417:     ORA ($04,x)        ; $d417: 01 04     
            .hex 04 02         ; $d419: 04 02     Invalid Opcode - NOP $02
            ORA ($03,x)        ; $d41b: 01 03     
            .hex 02            ; $d41d: 02        Invalid Opcode - KIL 
            .hex 04 03         ; $d41e: 04 03     Invalid Opcode - NOP $03
            .hex 01            ; $d420: 01        Suspected data
__d421:     BRK                ; $d421: 00        
            ORA ($02,x)        ; $d422: 01 02     
            .hex 04 08         ; $d424: 04 08     Invalid Opcode - NOP $08
__d426:     LDA $5c            ; $d426: a5 5c     
            BNE __d43c         ; $d428: d0 12     
            LDA $44            ; $d42a: a5 44     
            CMP $2a            ; $d42c: c5 2a     
            BNE __d43c         ; $d42e: d0 0c     
            LDA $42            ; $d430: a5 42     
            CMP $28            ; $d432: c5 28     
            LDA #$01           ; $d434: a9 01     
            BCC __d43a         ; $d436: 90 02     
            LDA #$03           ; $d438: a9 03     
__d43a:     STA $4a            ; $d43a: 85 4a     
__d43c:     RTS                ; $d43c: 60        

;-------------------------------------------------------------------------------
__d43d:     LDA $5c            ; $d43d: a5 5c     
            BNE __d43c         ; $d43f: d0 fb     
            LDA $42            ; $d441: a5 42     
            CMP $28            ; $d443: c5 28     
            BNE __d453         ; $d445: d0 0c     
            LDA $44            ; $d447: a5 44     
            CMP $2a            ; $d449: c5 2a     
            LDA #$04           ; $d44b: a9 04     
            BCC __d451         ; $d44d: 90 02     
            LDA #$02           ; $d44f: a9 02     
__d451:     STA $4a            ; $d451: 85 4a     
__d453:     RTS                ; $d453: 60        

;-------------------------------------------------------------------------------
__d454:     LDA #$00           ; $d454: a9 00     
            STA $51            ; $d456: 85 51     
            LDA $43            ; $d458: a5 43     
            CMP #$08           ; $d45a: c9 08     
            BNE __d462         ; $d45c: d0 04     
            LDA $45            ; $d45e: a5 45     
            CMP #$08           ; $d460: c9 08     
__d462:     BNE __d4bd         ; $d462: d0 59     
            LDY $44            ; $d464: a4 44     
            LDA __e2a3,y       ; $d466: b9 a3 e2  
            STA $34            ; $d469: 85 34     
            LDA __e2b0,y       ; $d46b: b9 b0 e2  
            STA $35            ; $d46e: 85 35     
            LDY $42            ; $d470: a4 42     
            INY                ; $d472: c8        
            JSR __d4c0         ; $d473: 20 c0 d4  
            BNE __d47c         ; $d476: d0 04     
            LDA #$01           ; $d478: a9 01     
            STA $51            ; $d47a: 85 51     
__d47c:     DEY                ; $d47c: 88        
            DEY                ; $d47d: 88        
            JSR __d4c0         ; $d47e: 20 c0 d4  
            BNE __d489         ; $d481: d0 06     
            LDA #$04           ; $d483: a9 04     
            ORA $51            ; $d485: 05 51     
            STA $51            ; $d487: 85 51     
__d489:     LDY $44            ; $d489: a4 44     
            DEY                ; $d48b: 88        
            LDA __e2a3,y       ; $d48c: b9 a3 e2  
            STA $34            ; $d48f: 85 34     
            LDA __e2b0,y       ; $d491: b9 b0 e2  
            STA $35            ; $d494: 85 35     
            LDY $42            ; $d496: a4 42     
            JSR __d4c0         ; $d498: 20 c0 d4  
            BNE __d4a3         ; $d49b: d0 06     
            LDA #$02           ; $d49d: a9 02     
            ORA $51            ; $d49f: 05 51     
            STA $51            ; $d4a1: 85 51     
__d4a3:     LDY $44            ; $d4a3: a4 44     
            INY                ; $d4a5: c8        
            LDA __e2a3,y       ; $d4a6: b9 a3 e2  
            STA $34            ; $d4a9: 85 34     
            LDA __e2b0,y       ; $d4ab: b9 b0 e2  
            STA $35            ; $d4ae: 85 35     
            LDY $42            ; $d4b0: a4 42     
            JSR __d4c0         ; $d4b2: 20 c0 d4  
            BNE __d4bd         ; $d4b5: d0 06     
            LDA #$08           ; $d4b7: a9 08     
            ORA $51            ; $d4b9: 05 51     
            STA $51            ; $d4bb: 85 51     
__d4bd:     LDA $51            ; $d4bd: a5 51     
__d4bf:     RTS                ; $d4bf: 60        

;-------------------------------------------------------------------------------
__d4c0:     LDA ($34),y        ; $d4c0: b1 34     
            BEQ __d4bf         ; $d4c2: f0 fb     
            CMP #$08           ; $d4c4: c9 08     
            BEQ __d4bf         ; $d4c6: f0 f7     
            CMP #$06           ; $d4c8: c9 06     
            BEQ __d4bf         ; $d4ca: f0 f3     
            CMP #$02           ; $d4cc: c9 02     
            BEQ __d4d1         ; $d4ce: f0 01     
            RTS                ; $d4d0: 60        

;-------------------------------------------------------------------------------
__d4d1:     LDA $41            ; $d4d1: a5 41     
            CMP #$05           ; $d4d3: c9 05     
            BEQ __d4bf         ; $d4d5: f0 e8     
            CMP #$06           ; $d4d7: c9 06     
            BEQ __d4bf         ; $d4d9: f0 e4     
            CMP #$08           ; $d4db: c9 08     
            RTS                ; $d4dd: 60        

;-------------------------------------------------------------------------------
__d4de:     LDX #$00           ; $d4de: a2 00     
            STX $4e            ; $d4e0: 86 4e     
            TAX                ; $d4e2: aa        
            CMP #$01           ; $d4e3: c9 01     
            BNE __d4ea         ; $d4e5: d0 03     
            JSR __d58d         ; $d4e7: 20 8d d5  
__d4ea:     TXA                ; $d4ea: 8a        
            CMP #$03           ; $d4eb: c9 03     
            BNE __d4f2         ; $d4ed: d0 03     
            JSR __d562         ; $d4ef: 20 62 d5  
__d4f2:     TXA                ; $d4f2: 8a        
            CMP #$02           ; $d4f3: c9 02     
            BNE __d4fa         ; $d4f5: d0 03     
            JSR __d537         ; $d4f7: 20 37 d5  
__d4fa:     TXA                ; $d4fa: 8a        
            CMP #$04           ; $d4fb: c9 04     
            BNE __d502         ; $d4fd: d0 03     
            JSR __d505         ; $d4ff: 20 05 d5  
__d502:     LDA $4e            ; $d502: a5 4e     
            RTS                ; $d504: 60        

;-------------------------------------------------------------------------------
__d505:     LDA $45            ; $d505: a5 45     
            CMP #$08           ; $d507: c9 08     
            BCS __d50e         ; $d509: b0 03     
            INC $45            ; $d50b: e6 45     
            RTS                ; $d50d: 60        

;-------------------------------------------------------------------------------
__d50e:     LDY $44            ; $d50e: a4 44     
            INY                ; $d510: c8        
            LDA __e2a3,y       ; $d511: b9 a3 e2  
            STA $34            ; $d514: 85 34     
            LDA __e2b0,y       ; $d516: b9 b0 e2  
            STA $35            ; $d519: 85 35     
            LDY $42            ; $d51b: a4 42     
            JSR __d4c0         ; $d51d: 20 c0 d4  
            BNE __d534         ; $d520: d0 12     
            JSR __d5bc         ; $d522: 20 bc d5  
            INC $45            ; $d525: e6 45     
            LDA $45            ; $d527: a5 45     
            CMP #$10           ; $d529: c9 10     
            BNE __d533         ; $d52b: d0 06     
            LDA #$00           ; $d52d: a9 00     
            STA $45            ; $d52f: 85 45     
            INC $44            ; $d531: e6 44     
__d533:     RTS                ; $d533: 60        

;-------------------------------------------------------------------------------
__d534:     STA $4e            ; $d534: 85 4e     
            RTS                ; $d536: 60        

;-------------------------------------------------------------------------------
__d537:     LDA $45            ; $d537: a5 45     
            CMP #$09           ; $d539: c9 09     
            BCC __d540         ; $d53b: 90 03     
            DEC $45            ; $d53d: c6 45     
            RTS                ; $d53f: 60        

;-------------------------------------------------------------------------------
__d540:     LDY $44            ; $d540: a4 44     
            DEY                ; $d542: 88        
            LDA __e2a3,y       ; $d543: b9 a3 e2  
            STA $34            ; $d546: 85 34     
            LDA __e2b0,y       ; $d548: b9 b0 e2  
            STA $35            ; $d54b: 85 35     
            LDY $42            ; $d54d: a4 42     
            JSR __d4c0         ; $d54f: 20 c0 d4  
            BNE __d534         ; $d552: d0 e0     
            JSR __d5bc         ; $d554: 20 bc d5  
            DEC $45            ; $d557: c6 45     
            BPL __d561         ; $d559: 10 06     
            LDA #$0f           ; $d55b: a9 0f     
            STA $45            ; $d55d: 85 45     
            DEC $44            ; $d55f: c6 44     
__d561:     RTS                ; $d561: 60        

;-------------------------------------------------------------------------------
__d562:     LDA $43            ; $d562: a5 43     
            CMP #$09           ; $d564: c9 09     
            BCC __d56b         ; $d566: 90 03     
            DEC $43            ; $d568: c6 43     
            RTS                ; $d56a: 60        

;-------------------------------------------------------------------------------
__d56b:     LDY $44            ; $d56b: a4 44     
            LDA __e2a3,y       ; $d56d: b9 a3 e2  
            STA $34            ; $d570: 85 34     
            LDA __e2b0,y       ; $d572: b9 b0 e2  
            STA $35            ; $d575: 85 35     
            LDY $42            ; $d577: a4 42     
            DEY                ; $d579: 88        
            JSR __d4c0         ; $d57a: 20 c0 d4  
            BNE __d534         ; $d57d: d0 b5     
            JSR __d5cb         ; $d57f: 20 cb d5  
            DEC $43            ; $d582: c6 43     
            BPL __d58c         ; $d584: 10 06     
            LDA #$0f           ; $d586: a9 0f     
            STA $43            ; $d588: 85 43     
            DEC $42            ; $d58a: c6 42     
__d58c:     RTS                ; $d58c: 60        

;-------------------------------------------------------------------------------
__d58d:     LDA $43            ; $d58d: a5 43     
            CMP #$08           ; $d58f: c9 08     
            BCS __d596         ; $d591: b0 03     
            INC $43            ; $d593: e6 43     
            RTS                ; $d595: 60        

;-------------------------------------------------------------------------------
__d596:     LDY $44            ; $d596: a4 44     
            LDA __e2a3,y       ; $d598: b9 a3 e2  
            STA $34            ; $d59b: 85 34     
            LDA __e2b0,y       ; $d59d: b9 b0 e2  
            STA $35            ; $d5a0: 85 35     
            LDY $42            ; $d5a2: a4 42     
            INY                ; $d5a4: c8        
            JSR __d4c0         ; $d5a5: 20 c0 d4  
            BNE __d534         ; $d5a8: d0 8a     
            JSR __d5cb         ; $d5aa: 20 cb d5  
            INC $43            ; $d5ad: e6 43     
            LDA $43            ; $d5af: a5 43     
            CMP #$10           ; $d5b1: c9 10     
            BNE __d5bb         ; $d5b3: d0 06     
            LDA #$00           ; $d5b5: a9 00     
            STA $43            ; $d5b7: 85 43     
            INC $42            ; $d5b9: e6 42     
__d5bb:     RTS                ; $d5bb: 60        

;-------------------------------------------------------------------------------
__d5bc:     LDA $43            ; $d5bc: a5 43     
            CMP #$08           ; $d5be: c9 08     
            BCC __d5c7         ; $d5c0: 90 05     
            BEQ __d5ca         ; $d5c2: f0 06     
            DEC $43            ; $d5c4: c6 43     
            RTS                ; $d5c6: 60        

;-------------------------------------------------------------------------------
__d5c7:     INC $43            ; $d5c7: e6 43     
            RTS                ; $d5c9: 60        

;-------------------------------------------------------------------------------
__d5ca:     RTS                ; $d5ca: 60        

;-------------------------------------------------------------------------------
__d5cb:     LDA $45            ; $d5cb: a5 45     
            CMP #$08           ; $d5cd: c9 08     
            BCC __d5d6         ; $d5cf: 90 05     
            BEQ __d5d9         ; $d5d1: f0 06     
            DEC $45            ; $d5d3: c6 45     
            RTS                ; $d5d5: 60        

;-------------------------------------------------------------------------------
__d5d6:     INC $45            ; $d5d6: e6 45     
            RTS                ; $d5d8: 60        

;-------------------------------------------------------------------------------
__d5d9:     RTS                ; $d5d9: 60        

;-------------------------------------------------------------------------------
__d5da:     PHA                ; $d5da: 48        
            LDA $33            ; $d5db: a5 33     
            AND #$07           ; $d5dd: 29 07     
            BNE __d5f0         ; $d5df: d0 0f     
            PLA                ; $d5e1: 68        
            INC $46            ; $d5e2: e6 46     
            CMP $46            ; $d5e4: c5 46     
            BCC __d5eb         ; $d5e6: 90 03     
__d5e8:     STA $46            ; $d5e8: 85 46     
            RTS                ; $d5ea: 60        

;-------------------------------------------------------------------------------
__d5eb:     CPY $46            ; $d5eb: c4 46     
            BCC __d5e8         ; $d5ed: 90 f9     
            RTS                ; $d5ef: 60        

;-------------------------------------------------------------------------------
__d5f0:     PLA                ; $d5f0: 68        
            RTS                ; $d5f1: 60        

;-------------------------------------------------------------------------------
__d5f2:     STX $3f            ; $d5f2: 86 3f     
            STY $40            ; $d5f4: 84 40     
            ASL                ; $d5f6: 0a        
            PHA                ; $d5f7: 48        
            AND #$0e           ; $d5f8: 29 0e     
            STA $3e            ; $d5fa: 85 3e     
            PLA                ; $d5fc: 68        
            ASL                ; $d5fd: 0a        
            AND #$e0           ; $d5fe: 29 e0     
            ORA $3e            ; $d600: 05 3e     
            STA $3e            ; $d602: 85 3e     
            LDA $39            ; $d604: a5 39     
            INC $39            ; $d606: e6 39     
            CLC                ; $d608: 18        
            ADC $db            ; $d609: 65 db     
            CMP #$0c           ; $d60b: c9 0c     
            BCC __d611         ; $d60d: 90 02     
            SBC #$0a           ; $d60f: e9 0a     
__d611:     ASL                ; $d611: 0a        
            ASL                ; $d612: 0a        
            ASL                ; $d613: 0a        
            ASL                ; $d614: 0a        
            TAY                ; $d615: a8        
            LDA $3d            ; $d616: a5 3d     
            BNE __d622         ; $d618: d0 08     
            JSR __d631         ; $d61a: 20 31 d6  
            INC $3e            ; $d61d: e6 3e     
            JMP __d629         ; $d61f: 4c 29 d6  

;-------------------------------------------------------------------------------
__d622:     INC $3e            ; $d622: e6 3e     
            JSR __d631         ; $d624: 20 31 d6  
            DEC $3e            ; $d627: c6 3e     
__d629:     JSR __d631         ; $d629: 20 31 d6  
            LDX $3f            ; $d62c: a6 3f     
            LDY $40            ; $d62e: a4 40     
            RTS                ; $d630: 60        

;-------------------------------------------------------------------------------
__d631:     LDA $3b            ; $d631: a5 3b     
            STA $0700,y        ; $d633: 99 00 07  
            LDA $3e            ; $d636: a5 3e     
            PHA                ; $d638: 48        
            STA $0701,y        ; $d639: 99 01 07  
            LDA $3c            ; $d63c: a5 3c     
            ORA $3d            ; $d63e: 05 3d     
            STA $0702,y        ; $d640: 99 02 07  
            LDA $3a            ; $d643: a5 3a     
            STA $0703,y        ; $d645: 99 03 07  
            LDA $3b            ; $d648: a5 3b     
            CLC                ; $d64a: 18        
            ADC #$08           ; $d64b: 69 08     
            STA $0704,y        ; $d64d: 99 04 07  
            PLA                ; $d650: 68        
            CLC                ; $d651: 18        
            ADC #$10           ; $d652: 69 10     
            STA $0705,y        ; $d654: 99 05 07  
            LDA $3c            ; $d657: a5 3c     
            ORA $3d            ; $d659: 05 3d     
            STA $0706,y        ; $d65b: 99 06 07  
            LDA $3a            ; $d65e: a5 3a     
            STA $0707,y        ; $d660: 99 07 07  
            TYA                ; $d663: 98        
            CLC                ; $d664: 18        
            .hex 69            ; $d665: 69        Suspected data
__d666:     PHP                ; $d666: 08        
            TAY                ; $d667: a8        
            LDA $3a            ; $d668: a5 3a     
            CLC                ; $d66a: 18        
            ADC #$08           ; $d66b: 69 08     
            STA $3a            ; $d66d: 85 3a     
            RTS                ; $d66f: 60        

;-------------------------------------------------------------------------------
__d670:     LDA $54            ; $d670: a5 54     
            ROL                ; $d672: 2a        
            ROL                ; $d673: 2a        
            EOR #$41           ; $d674: 49 41     
            ROL                ; $d676: 2a        
            ROL                ; $d677: 2a        
            EOR #$93           ; $d678: 49 93     
            ADC $55            ; $d67a: 65 55     
            STA $54            ; $d67c: 85 54     
            ROL                ; $d67e: 2a        
            ROL                ; $d67f: 2a        
            EOR #$12           ; $d680: 49 12     
            ROL                ; $d682: 2a        
            ROL                ; $d683: 2a        
            ADC $56            ; $d684: 65 56     
            STA $55            ; $d686: 85 55     
            ADC $54            ; $d688: 65 54     
            INC $56            ; $d68a: e6 56     
            BNE __d697         ; $d68c: d0 09     
            PHA                ; $d68e: 48        
            LDA $57            ; $d68f: a5 57     
            CLC                ; $d691: 18        
            ADC #$1d           ; $d692: 69 1d     
            STA $57            ; $d694: 85 57     
            PLA                ; $d696: 68        
__d697:     EOR $57            ; $d697: 45 57     
            RTS                ; $d699: 60        

;-------------------------------------------------------------------------------
__d69a:     LDA $58            ; $d69a: a5 58     
            CMP #$1a           ; $d69c: c9 1a     
            BCC __d6a8         ; $d69e: 90 08     
            SBC #$19           ; $d6a0: e9 19     
            LDX #$02           ; $d6a2: a2 02     
            LDY #$d8           ; $d6a4: a0 d8     
            BNE __d6ac         ; $d6a6: d0 04     
__d6a8:     LDX #$08           ; $d6a8: a2 08     
            LDY #$d7           ; $d6aa: a0 d7     
__d6ac:     .hex 86            ; $d6ac: 86        Suspected data
__d6ad:     .hex 97 84         ; $d6ad: 97 84     Invalid Opcode - SAX $84,y
            TYA                ; $d6af: 98        
            SEC                ; $d6b0: 38        
            SBC #$01           ; $d6b1: e9 01     
            ASL                ; $d6b3: 0a        
            STA $24            ; $d6b4: 85 24     
            ASL                ; $d6b6: 0a        
            ASL                ; $d6b7: 0a        
            CLC                ; $d6b8: 18        
            ADC $24            ; $d6b9: 65 24     
            TAY                ; $d6bb: a8        
            LDX #$09           ; $d6bc: a2 09     
__d6be:     LDA ($97),y        ; $d6be: b1 97     
            STA $0576,x        ; $d6c0: 9d 76 05  
            BEQ __d703         ; $d6c3: f0 3e     
            SEC                ; $d6c5: 38        
            SBC #$01           ; $d6c6: e9 01     
            ASL                ; $d6c8: 0a        
            ASL                ; $d6c9: 0a        
            .hex 9d a8         ; $d6ca: 9d a8     Suspected data
__d6cc:     ORA $a9            ; $d6cc: 05 a9     
            PHP                ; $d6ce: 08        
            STA $058a,x        ; $d6cf: 9d 8a 05  
            STA $059e,x        ; $d6d2: 9d 9e 05  
            JSR __d670         ; $d6d5: 20 70 d6  
            AND #$03           ; $d6d8: 29 03     
            CLC                ; $d6da: 18        
            ADC #$01           ; $d6db: 69 01     
            STA $05d0,x        ; $d6dd: 9d d0 05  
            STY $5a            ; $d6e0: 84 5a     
__d6e2:     JSR __cacf         ; $d6e2: 20 cf ca  
            LDA $24            ; $d6e5: a5 24     
            CMP #$05           ; $d6e7: c9 05     
            BCC __d6e2         ; $d6e9: 90 f7     
            STA $0580,x        ; $d6eb: 9d 80 05  
            LDA $25            ; $d6ee: a5 25     
            STA $0594,x        ; $d6f0: 9d 94 05  
            LDA #$00           ; $d6f3: a9 00     
            STA $05b2,x        ; $d6f5: 9d b2 05  
            STA $05da,x        ; $d6f8: 9d da 05  
            STA $05c6,x        ; $d6fb: 9d c6 05  
            STA $05e4,x        ; $d6fe: 9d e4 05  
            LDY $5a            ; $d701: a4 5a     
__d703:     INY                ; $d703: c8        
            DEX                ; $d704: ca        
            BPL __d6be         ; $d705: 10 b7     
            RTS                ; $d707: 60        

;-------------------------------------------------------------------------------
            ORA ($01,x)        ; $d708: 01 01     
            ORA ($01,x)        ; $d70a: 01 01     
            ORA ($01,x)        ; $d70c: 01 01     
            BRK                ; $d70e: 00        
            BRK                ; $d70f: 00        
            BRK                ; $d710: 00        
            BRK                ; $d711: 00        
            ORA ($01,x)        ; $d712: 01 01     
            ORA ($02,x)        ; $d714: 01 02     
            .hex 02            ; $d716: 02        Invalid Opcode - KIL 
            .hex 02            ; $d717: 02        Invalid Opcode - KIL 
            BRK                ; $d718: 00        
            BRK                ; $d719: 00        
            BRK                ; $d71a: 00        
            BRK                ; $d71b: 00        
            ORA ($01,x)        ; $d71c: 01 01     
            .hex 02            ; $d71e: 02        Invalid Opcode - KIL 
            .hex 02            ; $d71f: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d720: 03 03     Invalid Opcode - SLO ($03,x)
            BRK                ; $d722: 00        
            BRK                ; $d723: 00        
            BRK                ; $d724: 00        
            BRK                ; $d725: 00        
            ORA ($02,x)        ; $d726: 01 02     
            .hex 03 03         ; $d728: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 04 04         ; $d72a: 04 04     Invalid Opcode - NOP $04
            BRK                ; $d72c: 00        
            BRK                ; $d72d: 00        
            BRK                ; $d72e: 00        
            BRK                ; $d72f: 00        
            .hex 02            ; $d730: 02        Invalid Opcode - KIL 
            .hex 02            ; $d731: 02        Invalid Opcode - KIL 
            .hex 02            ; $d732: 02        Invalid Opcode - KIL 
            .hex 02            ; $d733: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d734: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 00         ; $d736: 03 00     Invalid Opcode - SLO ($00,x)
            BRK                ; $d738: 00        
            BRK                ; $d739: 00        
            .hex 02            ; $d73a: 02        Invalid Opcode - KIL 
            .hex 02            ; $d73b: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d73c: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 04         ; $d73e: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 00         ; $d740: 04 00     Invalid Opcode - NOP $00
            BRK                ; $d742: 00        
            BRK                ; $d743: 00        
            .hex 02            ; $d744: 02        Invalid Opcode - KIL 
            .hex 02            ; $d745: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d746: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 05         ; $d748: 03 05     Invalid Opcode - SLO ($05,x)
            ORA $00            ; $d74a: 05 00     
            BRK                ; $d74c: 00        
            BRK                ; $d74d: 00        
            .hex 02            ; $d74e: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d74f: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 04 04         ; $d751: 04 04     Invalid Opcode - NOP $04
            .hex 04 04         ; $d753: 04 04     Invalid Opcode - NOP $04
            BRK                ; $d755: 00        
            BRK                ; $d756: 00        
            BRK                ; $d757: 00        
            .hex 02            ; $d758: 02        Invalid Opcode - KIL 
            .hex 03 04         ; $d759: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $d75b: 04 04     Invalid Opcode - NOP $04
            .hex 04 06         ; $d75d: 04 06     Invalid Opcode - NOP $06
            BRK                ; $d75f: 00        
            BRK                ; $d760: 00        
            BRK                ; $d761: 00        
            .hex 02            ; $d762: 02        Invalid Opcode - KIL 
            .hex 03 04         ; $d763: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $06            ; $d765: 05 06     
            ASL $06            ; $d767: 06 06     
            BRK                ; $d769: 00        
            BRK                ; $d76a: 00        
            BRK                ; $d76b: 00        
            .hex 02            ; $d76c: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d76d: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 04 04         ; $d76f: 04 04     Invalid Opcode - NOP $04
            .hex 04 05         ; $d771: 04 05     Invalid Opcode - NOP $05
            ASL $00            ; $d773: 06 00     
            BRK                ; $d775: 00        
            .hex 02            ; $d776: 02        Invalid Opcode - KIL 
            .hex 03 04         ; $d777: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $06            ; $d779: 05 06     
            ASL $06            ; $d77b: 06 06     
            ASL $00            ; $d77d: 06 00     
            BRK                ; $d77f: 00        
            .hex 03 03         ; $d780: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 04         ; $d782: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $d784: 04 04     Invalid Opcode - NOP $04
            ASL $06            ; $d786: 06 06     
            BRK                ; $d788: 00        
            BRK                ; $d789: 00        
            ORA $05            ; $d78a: 05 05     
            ORA $05            ; $d78c: 05 05     
            ORA $05            ; $d78e: 05 05     
            ORA $07            ; $d790: 05 07     
            BRK                ; $d792: 00        
            BRK                ; $d793: 00        
            .hex 03 04         ; $d794: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $d796: 04 04     Invalid Opcode - NOP $04
            ASL $06            ; $d798: 06 06     
            ASL $07            ; $d79a: 06 07     
            BRK                ; $d79c: 00        
            BRK                ; $d79d: 00        
            .hex 04 04         ; $d79e: 04 04     Invalid Opcode - NOP $04
            .hex 04 06         ; $d7a0: 04 06     Invalid Opcode - NOP $06
            ASL $06            ; $d7a2: 06 06     
            ASL $07            ; $d7a4: 06 07     
            BRK                ; $d7a6: 00        
            BRK                ; $d7a7: 00        
            .hex 03 03         ; $d7a8: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $d7aa: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 06         ; $d7ac: 03 06     Invalid Opcode - SLO ($06,x)
            ASL $07            ; $d7ae: 06 07     
            BRK                ; $d7b0: 00        
            BRK                ; $d7b1: 00        
            ORA ($01,x)        ; $d7b2: 01 01     
            ORA ($02,x)        ; $d7b4: 01 02     
            .hex 02            ; $d7b6: 02        Invalid Opcode - KIL 
            .hex 02            ; $d7b7: 02        Invalid Opcode - KIL 
            .hex 07 07         ; $d7b8: 07 07     Invalid Opcode - SLO $07
            BRK                ; $d7ba: 00        
            BRK                ; $d7bb: 00        
            ORA ($02,x)        ; $d7bc: 01 02     
            .hex 03 03         ; $d7be: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 05         ; $d7c0: 03 05     Invalid Opcode - SLO ($05,x)
            .hex 07 07         ; $d7c2: 07 07     Invalid Opcode - SLO $07
            BRK                ; $d7c4: 00        
            BRK                ; $d7c5: 00        
            .hex 02            ; $d7c6: 02        Invalid Opcode - KIL 
            .hex 03 04         ; $d7c7: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $06            ; $d7c9: 05 06     
            ASL $07            ; $d7cb: 06 07     
            .hex 07 00         ; $d7cd: 07 00     Invalid Opcode - SLO $00
            BRK                ; $d7cf: 00        
            ORA $05            ; $d7d0: 05 05     
            ORA $06            ; $d7d2: 05 06     
            ASL $06            ; $d7d4: 06 06     
            ASL $07            ; $d7d6: 06 07     
            .hex 07 00         ; $d7d8: 07 00     Invalid Opcode - SLO $00
            .hex 03 03         ; $d7da: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $d7dc: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 04 04         ; $d7de: 04 04     Invalid Opcode - NOP $04
            .hex 04 06         ; $d7e0: 04 06     Invalid Opcode - NOP $06
            .hex 07 00         ; $d7e2: 07 00     Invalid Opcode - SLO $00
            .hex 03 03         ; $d7e4: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 04 04         ; $d7e6: 04 04     Invalid Opcode - NOP $04
            ORA $05            ; $d7e8: 05 05     
            .hex 06            ; $d7ea: 06        Suspected data
__d7eb:     ASL $07            ; $d7eb: 06 07     
            BRK                ; $d7ed: 00        
            .hex 03 04         ; $d7ee: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $06            ; $d7f0: 05 06     
            ASL $05            ; $d7f2: 06 05     
            ASL $06            ; $d7f4: 06 06     
            .hex 07 00         ; $d7f6: 07 00     Invalid Opcode - SLO $00
            .hex 02            ; $d7f8: 02        Invalid Opcode - KIL 
            .hex 02            ; $d7f9: 02        Invalid Opcode - KIL 
            .hex 03 04         ; $d7fa: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $05            ; $d7fc: 05 05     
            ASL $06            ; $d7fe: 06 06     
            .hex 07 00         ; $d800: 07 00     Invalid Opcode - SLO $00
            ORA ($02,x)        ; $d802: 01 02     
            .hex 03 04         ; $d804: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $05            ; $d806: 05 05     
            ASL $06            ; $d808: 06 06     
            .hex 07 00         ; $d80a: 07 00     Invalid Opcode - SLO $00
            ORA ($02,x)        ; $d80c: 01 02     
            ASL $06            ; $d80e: 06 06     
            ASL $05            ; $d810: 06 05     
            ASL $06            ; $d812: 06 06     
            .hex 07 00         ; $d814: 07 00     Invalid Opcode - SLO $00
            .hex 02            ; $d816: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d817: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 04         ; $d819: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $d81b: 04 04     Invalid Opcode - NOP $04
            ASL $07            ; $d81d: 06 07     
            BRK                ; $d81f: 00        
            ORA $05            ; $d820: 05 05     
            ORA $05            ; $d822: 05 05     
            ORA $06            ; $d824: 05 06     
            .hex 07 06         ; $d826: 07 06     Invalid Opcode - SLO $06
            .hex 07 00         ; $d828: 07 00     Invalid Opcode - SLO $00
            .hex 03 03         ; $d82a: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 04         ; $d82c: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 05         ; $d82e: 04 05     Invalid Opcode - NOP $05
            ORA $06            ; $d830: 05 06     
            .hex 07 00         ; $d832: 07 00     Invalid Opcode - SLO $00
            .hex 02            ; $d834: 02        Invalid Opcode - KIL 
            .hex 02            ; $d835: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $d836: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 04 04         ; $d838: 04 04     Invalid Opcode - NOP $04
            ORA $05            ; $d83a: 05 05     
            ASL $06            ; $d83c: 06 06     
            .hex 02            ; $d83e: 02        Invalid Opcode - KIL 
            .hex 03 04         ; $d83f: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $d841: 04 04     Invalid Opcode - NOP $04
            ASL $06            ; $d843: 06 06     
            ASL $06            ; $d845: 06 06     
            .hex 07 03         ; $d847: 07 03     Invalid Opcode - SLO $03
            .hex 03 04         ; $d849: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 05         ; $d84b: 04 05     Invalid Opcode - NOP $05
            ASL $06            ; $d84d: 06 06     
            .hex 07 06         ; $d84f: 07 06     Invalid Opcode - SLO $06
            .hex 07 03         ; $d851: 07 03     Invalid Opcode - SLO $03
            .hex 03 04         ; $d853: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 04         ; $d855: 04 04     Invalid Opcode - NOP $04
            ASL $06            ; $d857: 06 06     
            .hex 07 06         ; $d859: 07 06     Invalid Opcode - SLO $06
            .hex 07 03         ; $d85b: 07 03     Invalid Opcode - SLO $03
            .hex 03 04         ; $d85d: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $00            ; $d85f: 05 00     
            ASL $06            ; $d861: 06 06     
            .hex 07 06         ; $d863: 07 06     Invalid Opcode - SLO $06
            .hex 07 03         ; $d865: 07 03     Invalid Opcode - SLO $03
            .hex 03 04         ; $d867: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 06         ; $d869: 04 06     Invalid Opcode - NOP $06
            ASL $07            ; $d86b: 06 07     
            ASL $07            ; $d86d: 06 07     
            .hex 07 03         ; $d86f: 07 03     Invalid Opcode - SLO $03
            .hex 03 04         ; $d871: 03 04     Invalid Opcode - SLO ($04,x)
            ORA $06            ; $d873: 05 06     
            ASL $07            ; $d875: 06 07     
            ASL $07            ; $d877: 06 07     
            .hex 07 03         ; $d879: 07 03     Invalid Opcode - SLO $03
            .hex 03 04         ; $d87b: 03 04     Invalid Opcode - SLO ($04,x)
            .hex 04 06         ; $d87d: 04 06     Invalid Opcode - NOP $06
            ASL $07            ; $d87f: 06 07     
            ASL $07            ; $d881: 06 07     
            .hex 07 03         ; $d883: 07 03     Invalid Opcode - SLO $03
            .hex 04 05         ; $d885: 04 05     Invalid Opcode - NOP $05
            ORA $06            ; $d887: 05 06     
            .hex 07 06         ; $d889: 07 06     Invalid Opcode - SLO $06
            .hex 07 07         ; $d88b: 07 07     Invalid Opcode - SLO $07
            .hex 07 03         ; $d88d: 07 03     Invalid Opcode - SLO $03
            .hex 04 04         ; $d88f: 04 04     Invalid Opcode - NOP $04
            ASL $06            ; $d891: 06 06     
            .hex 07 06         ; $d893: 07 06     Invalid Opcode - SLO $06
            .hex 07 07         ; $d895: 07 07     Invalid Opcode - SLO $07
            .hex 07 03         ; $d897: 07 03     Invalid Opcode - SLO $03
            .hex 04 05         ; $d899: 04 05     Invalid Opcode - NOP $05
            ASL $06            ; $d89b: 06 06     
            ASL $07            ; $d89d: 06 07     
            .hex 07 07         ; $d89f: 07 07     Invalid Opcode - SLO $07
            .hex 07 04         ; $d8a1: 07 04     Invalid Opcode - SLO $04
            ORA $06            ; $d8a3: 05 06     
            ASL $07            ; $d8a5: 06 07     
            ASL $07            ; $d8a7: 06 07     
            .hex 07 07         ; $d8a9: 07 07     Invalid Opcode - SLO $07
            .hex 07 04         ; $d8ab: 07 04     Invalid Opcode - SLO $04
            ORA $06            ; $d8ad: 05 06     
            .hex 07 06         ; $d8af: 07 06     Invalid Opcode - SLO $06
            .hex 07 07         ; $d8b1: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8b3: 07 07     Invalid Opcode - SLO $07
            .hex 07 04         ; $d8b5: 07 04     Invalid Opcode - SLO $04
            ORA $06            ; $d8b7: 05 06     
            .hex 07 06         ; $d8b9: 07 06     Invalid Opcode - SLO $06
            .hex 07 07         ; $d8bb: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8bd: 07 07     Invalid Opcode - SLO $07
            .hex 07 05         ; $d8bf: 07 05     Invalid Opcode - SLO $05
            ASL $05            ; $d8c1: 06 05     
            ASL $07            ; $d8c3: 06 07     
            .hex 07 07         ; $d8c5: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8c7: 07 07     Invalid Opcode - SLO $07
            .hex 07 05         ; $d8c9: 07 05     Invalid Opcode - SLO $05
            ASL $05            ; $d8cb: 06 05     
            ASL $07            ; $d8cd: 06 07     
            .hex 07 07         ; $d8cf: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8d1: 07 07     Invalid Opcode - SLO $07
            .hex 07 06         ; $d8d3: 07 06     Invalid Opcode - SLO $06
            ORA $05            ; $d8d5: 05 05     
            ASL $07            ; $d8d7: 06 07     
            .hex 07 07         ; $d8d9: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8db: 07 07     Invalid Opcode - SLO $07
            .hex 07 06         ; $d8dd: 07 06     Invalid Opcode - SLO $06
            ORA $06            ; $d8df: 05 06     
            .hex 07 07         ; $d8e1: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8e3: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8e5: 07 07     Invalid Opcode - SLO $07
            PHP                ; $d8e7: 08        
            ORA $05            ; $d8e8: 05 05     
            ASL $07            ; $d8ea: 06 07     
            .hex 07 07         ; $d8ec: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8ee: 07 07     Invalid Opcode - SLO $07
            .hex 07 08         ; $d8f0: 07 08     Invalid Opcode - SLO $08
            ORA $05            ; $d8f2: 05 05     
            ASL $07            ; $d8f4: 06 07     
            .hex 07 07         ; $d8f6: 07 07     Invalid Opcode - SLO $07
            .hex 07 07         ; $d8f8: 07 07     Invalid Opcode - SLO $07
            PHP                ; $d8fa: 08        
            PHP                ; $d8fb: 08        
__d8fc:     STX $24            ; $d8fc: 86 24     
            STY $25            ; $d8fe: 84 25     
            PHA                ; $d900: 48        
__d901:     LDA $14            ; $d901: a5 14     
            SEC                ; $d903: 38        
            SBC $15            ; $d904: e5 15     
            CMP #$08           ; $d906: c9 08     
            BEQ __d901         ; $d908: f0 f7     
            PLA                ; $d90a: 68        
            JSR __d924         ; $d90b: 20 24 d9  
            LDY $15            ; $d90e: a4 15     
            LDX #$00           ; $d910: a2 00     
__d912:     LDA $17,x          ; $d912: b5 17     
            STA $0600,y        ; $d914: 99 00 06  
            INY                ; $d917: c8        
            INX                ; $d918: e8        
            CPX #$08           ; $d919: e0 08     
            BNE __d912         ; $d91b: d0 f5     
            STY $15            ; $d91d: 84 15     
            LDX $24            ; $d91f: a6 24     
            LDY $25            ; $d921: a4 25     
            RTS                ; $d923: 60        

;-------------------------------------------------------------------------------
__d924:     TAY                ; $d924: a8        
            ASL                ; $d925: 0a        
            ASL                ; $d926: 0a        
            STA $1a            ; $d927: 85 1a     
            LDA __d994,y       ; $d929: b9 94 d9  
            STA $1e            ; $d92c: 85 1e     
            LDY #$00           ; $d92e: a0 00     
            LDA $1f            ; $d930: a5 1f     
            CMP #$10           ; $d932: c9 10     
            BCC __d93a         ; $d934: 90 04     
            LDY #$04           ; $d936: a0 04     
            SBC #$10           ; $d938: e9 10     
__d93a:     STY $17            ; $d93a: 84 17     
            ASL                ; $d93c: 0a        
            STA $21            ; $d93d: 85 21     
            LDA $20            ; $d93f: a5 20     
            CLC                ; $d941: 18        
            ADC #$02           ; $d942: 69 02     
            ASL                ; $d944: 0a        
            STA $22            ; $d945: 85 22     
            AND #$fc           ; $d947: 29 fc     
            ASL                ; $d949: 0a        
            STA $1b            ; $d94a: 85 1b     
            LDA $21            ; $d94c: a5 21     
            LSR                ; $d94e: 4a        
            LSR                ; $d94f: 4a        
            CLC                ; $d950: 18        
            ADC $1b            ; $d951: 65 1b     
            CLC                ; $d953: 18        
            ADC #$c0           ; $d954: 69 c0     
            STA $1b            ; $d956: 85 1b     
            LDA #$23           ; $d958: a9 23     
            STA $1c            ; $d95a: 85 1c     
            LDA #$02           ; $d95c: a9 02     
            AND $22            ; $d95e: 25 22     
            STA $23            ; $d960: 85 23     
            LDA $21            ; $d962: a5 21     
            AND #$03           ; $d964: 29 03     
            LSR                ; $d966: 4a        
            CLC                ; $d967: 18        
            ADC $23            ; $d968: 65 23     
            ASL                ; $d96a: 0a        
            PHA                ; $d96b: 48        
            LDA #$fc           ; $d96c: a9 fc     
            STA $1d            ; $d96e: 85 1d     
            PLA                ; $d970: 68        
            TAX                ; $d971: aa        
            BEQ __d97c         ; $d972: f0 08     
__d974:     ASL $1e            ; $d974: 06 1e     
            SEC                ; $d976: 38        
            ROL $1d            ; $d977: 26 1d     
            DEX                ; $d979: ca        
__d97a:     BNE __d974         ; $d97a: d0 f8     
__d97c:     LDA #$01           ; $d97c: a9 01     
            STA $19            ; $d97e: 85 19     
            LDA $22            ; $d980: a5 22     
            LDX #$05           ; $d982: a2 05     
            ASL                ; $d984: 0a        
            ROL $19            ; $d985: 26 19     
            DEX                ; $d987: ca        
            .hex d0            ; $d988: d0        Suspected data
__d989:     .hex fa            ; $d989: fa        Invalid Opcode - NOP 
            CLC                ; $d98a: 18        
            ADC $21            ; $d98b: 65 21     
            STA $18            ; $d98d: 85 18     
            BCC __d993         ; $d98f: 90 02     
            INC $19            ; $d991: e6 19     
__d993:     RTS                ; $d993: 60        

;-------------------------------------------------------------------------------
__d994:     BRK                ; $d994: 00        
            BRK                ; $d995: 00        
            BRK                ; $d996: 00        
            ORA ($01,x)        ; $d997: 01 01     
            ORA ($01,x)        ; $d999: 01 01     
            ORA ($00,x)        ; $d99b: 01 00     
            BRK                ; $d99d: 00        
            BRK                ; $d99e: 00        
            ORA ($01,x)        ; $d99f: 01 01     
            ORA ($01,x)        ; $d9a1: 01 01     
            ORA ($01,x)        ; $d9a3: 01 01     
            ORA ($01,x)        ; $d9a5: 01 01     
            ORA ($01,x)        ; $d9a7: 01 01     
            ORA ($01,x)        ; $d9a9: 01 01     
            ORA ($01,x)        ; $d9ab: 01 01     
            ORA ($01,x)        ; $d9ad: 01 01     
            ORA ($01,x)        ; $d9af: 01 01     
            ORA ($01,x)        ; $d9b1: 01 01     
            ORA ($01,x)        ; $d9b3: 01 01     
            ORA ($01,x)        ; $d9b5: 01 01     
            ORA ($01,x)        ; $d9b7: 01 01     
            ORA ($01,x)        ; $d9b9: 01 01     
            ORA ($03,x)        ; $d9bb: 01 03     
            .hex 02            ; $d9bd: 02        Invalid Opcode - KIL 
            .hex 02            ; $d9be: 02        Invalid Opcode - KIL 
            .hex 02            ; $d9bf: 02        Invalid Opcode - KIL 
            .hex 02            ; $d9c0: 02        Invalid Opcode - KIL 
            .hex 02            ; $d9c1: 02        Invalid Opcode - KIL 
            .hex 02            ; $d9c2: 02        Invalid Opcode - KIL 
            .hex 02            ; $d9c3: 02        Invalid Opcode - KIL 
            .hex 02            ; $d9c4: 02        Invalid Opcode - KIL 
            .hex 03            ; $d9c5: 03        Suspected data
__d9c6:     .hex 5f            ; $d9c6: 5f        Suspected data
__d9c7:     .hex 5f            ; $d9c7: 5f        Suspected data
__d9c8:     .hex 5f            ; $d9c8: 5f        Suspected data
__d9c9:     .hex 5f 64 65      ; $d9c9: 5f 64 65  Invalid Opcode - SRE $6564,x
__d9cc:     ROR $67            ; $d9cc: 66 67     
            PLA                ; $d9ce: 68        
            ADC #$6a           ; $d9cf: 69 6a     
            .hex 6b 6c         ; $d9d1: 6b 6c     Invalid Opcode - ARR #$6c
            ADC $6f6e          ; $d9d3: 6d 6e 6f  
            BVS __da49         ; $d9d6: 70 71     
            .hex 72            ; $d9d8: 72        Invalid Opcode - KIL 
            .hex 73            ; $d9d9: 73        Suspected data
__d9da:     .hex 74 75         ; $d9da: 74 75     Invalid Opcode - NOP $75,x
            .hex 76            ; $d9dc: 76        Suspected data
__d9dd:     .hex 77 78         ; $d9dd: 77 78     Invalid Opcode - RRA $78,x
            ADC $7b7a,y        ; $d9df: 79 7a 7b  
            .hex 7c 7d 7e      ; $d9e2: 7c 7d 7e  Invalid Opcode - NOP $7e7d,x
            .hex 7f 80 81      ; $d9e5: 7f 80 81  Invalid Opcode - RRA $8180,x
            .hex 82 83         ; $d9e8: 82 83     Invalid Opcode - NOP #$83
            STY $85            ; $d9ea: 84 85     
            STX $87            ; $d9ec: 86 87     
            DEY                ; $d9ee: 88        
            .hex 89 8a         ; $d9ef: 89 8a     Invalid Opcode - NOP #$8a
            .hex 8b 8c         ; $d9f1: 8b 8c     Invalid Opcode - XAA #$8c
            STA $8f8e          ; $d9f3: 8d 8e 8f  
            BCC __d989         ; $d9f6: 90 91     
            .hex 92            ; $d9f8: 92        Invalid Opcode - KIL 
            .hex 93 94         ; $d9f9: 93 94     Invalid Opcode - AHX ($94),y
            STA $96,x          ; $d9fb: 95 96     
            .hex 97 98         ; $d9fd: 97 98     Invalid Opcode - SAX $98,y
            STA $9b9a,y        ; $d9ff: 99 9a 9b  
            JSR $2120          ; $da02: 20 20 21  
            AND ($22,x)        ; $da05: 21 22     
            .hex 23 22         ; $da07: 23 22     Invalid Opcode - RLA ($22,x)
            .hex 23 24         ; $da09: 23 24     Invalid Opcode - RLA ($24,x)
            BIT $25            ; $da0b: 24 25     
            AND $26            ; $da0d: 25 26     
            .hex 27 26         ; $da0f: 27 26     Invalid Opcode - RLA $26
            .hex 27 28         ; $da11: 27 28     Invalid Opcode - RLA $28
            PLP                ; $da13: 28        
            AND #$29           ; $da14: 29 29     
            ROL                ; $da16: 2a        
            .hex 2b 2a         ; $da17: 2b 2a     Invalid Opcode - ANC #$2a
            .hex 2b 2c         ; $da19: 2b 2c     Invalid Opcode - ANC #$2c
            BIT $2d2d          ; $da1b: 2c 2d 2d  
            ROL $2e2f          ; $da1e: 2e 2f 2e  
            .hex 2f 20 9d      ; $da21: 2f 20 9d  Invalid Opcode - RLA $9d20
            AND ($9f,x)        ; $da24: 21 9f     
            .hex 9c 9d 22      ; $da26: 9c 9d 22  Invalid Opcode - SHY $229d,x
            .hex 23 9c         ; $da29: 23 9c     Invalid Opcode - RLA ($9c,x)
            JSR $219e          ; $da2b: 20 9e 21  
            .hex 22            ; $da2e: 22        Invalid Opcode - KIL 
            .hex 23 9e         ; $da2f: 23 9e     Invalid Opcode - RLA ($9e,x)
            .hex 9f 24 a1      ; $da31: 9f 24 a1  Invalid Opcode - AHX $a124,y
            AND $a3            ; $da34: 25 a3     
            LDY #$a1           ; $da36: a0 a1     
            ROL $27            ; $da38: 26 27     
            LDY #$24           ; $da3a: a0 24     
            LDX #$25           ; $da3c: a2 25     
            ROL $27            ; $da3e: 26 27     
            LDX #$a3           ; $da40: a2 a3     
            PLP                ; $da42: 28        
            LDA $29            ; $da43: a5 29     
            .hex a7 a4         ; $da45: a7 a4     Invalid Opcode - LAX $a4
            LDA $2a            ; $da47: a5 2a     
__da49:     .hex 2b a4         ; $da49: 2b a4     Invalid Opcode - ANC #$a4
            PLP                ; $da4b: 28        
            LDX $29            ; $da4c: a6 29     
            ROL                ; $da4e: 2a        
            .hex 2b a6         ; $da4f: 2b a6     Invalid Opcode - ANC #$a6
            .hex a7 2c         ; $da51: a7 2c     Invalid Opcode - LAX $2c
            LDA #$2d           ; $da53: a9 2d     
            .hex ab a8         ; $da55: ab a8     Invalid Opcode - LAX #$a8
            LDA #$2e           ; $da57: a9 2e     
            .hex 2f a8 2c      ; $da59: 2f a8 2c  Invalid Opcode - RLA $2ca8
            TAX                ; $da5c: aa        
            AND $2f2e          ; $da5d: 2d 2e 2f  
            TAX                ; $da60: aa        
            .hex ab 68         ; $da61: ab 68     Invalid Opcode - LAX #$68
            ADC #$6a           ; $da63: 69 6a     
            .hex 6b 3c         ; $da65: 6b 3c     Invalid Opcode - ARR #$3c
            AND $3f3e,x        ; $da67: 3d 3e 3f  
            BRK                ; $da6a: 00        
            ORA ($10,x)        ; $da6b: 01 10     
            ORA ($02),y        ; $da6d: 11 02     
            .hex 03 12         ; $da6f: 03 12     Invalid Opcode - SLO ($12,x)
            .hex 13 04         ; $da71: 13 04     Invalid Opcode - SLO ($04),y
            ORA $14            ; $da73: 05 14     
            ORA $06,x          ; $da75: 15 06     
            .hex 07 16         ; $da77: 07 16     Invalid Opcode - SLO $16
            .hex 17 08         ; $da79: 17 08     Invalid Opcode - SLO $08,x
            ORA #$18           ; $da7b: 09 18     
            ORA $0b0a,y        ; $da7d: 19 0a 0b  
            .hex 1a            ; $da80: 1a        Invalid Opcode - NOP 
            .hex 1b 0c 0d      ; $da81: 1b 0c 0d  Invalid Opcode - SLO $0d0c,y
            .hex 1c 1d 0e      ; $da84: 1c 1d 0e  Invalid Opcode - NOP $0e1d,x
            .hex 0f 1e 1f      ; $da87: 0f 1e 1f  Invalid Opcode - SLO $1f1e
            PLA                ; $da8a: 68        
            ADC #$6a           ; $da8b: 69 6a     
            .hex 6b            ; $da8d: 6b        Suspected data
__da8e:     JSR __c257         ; $da8e: 20 57 c2  
            JSR __c2b9         ; $da91: 20 b9 c2  
            JSR __df27         ; $da94: 20 27 df  
            LDA #$00           ; $da97: a9 00     
            STA $60            ; $da99: 85 60     
            STA $72            ; $da9b: 85 72     
            STA $b5            ; $da9d: 85 b5     
            LDY #$9f           ; $da9f: a0 9f     
            LDA #$20           ; $daa1: a9 20     
            LDX #$e7           ; $daa3: a2 e7     
            JSR __dc41         ; $daa5: 20 41 dc  
            JSR __c23b         ; $daa8: 20 3b c2  
            LDA #$06           ; $daab: a9 06     
            STA $1f            ; $daad: 85 1f     
            LDA #$3a           ; $daaf: a9 3a     
            STA $20            ; $dab1: 85 20     
            LDY #$00           ; $dab3: a0 00     
__dab5:     JSR __c28b         ; $dab5: 20 8b c2  
            LDA #$22           ; $dab8: a9 22     
            LDX $1f            ; $daba: a6 1f     
            JSR __c196         ; $dabc: 20 96 c1  
            LDA $20            ; $dabf: a5 20     
            STA $2007          ; $dac1: 8d 07 20  
            JSR __c296         ; $dac4: 20 96 c2  
            LDX #$0a           ; $dac7: a2 0a     
__dac9:     JSR __c28b         ; $dac9: 20 8b c2  
            LDA $12            ; $dacc: a5 12     
            AND #$8f           ; $dace: 29 8f     
            BNE __daf8         ; $dad0: d0 26     
            DEX                ; $dad2: ca        
            BNE __dac9         ; $dad3: d0 f4     
            JSR __c28b         ; $dad5: 20 8b c2  
            LDA #$22           ; $dad8: a9 22     
            LDX $1f            ; $dada: a6 1f     
            JSR __c196         ; $dadc: 20 96 c1  
            LDA #$3b           ; $dadf: a9 3b     
            STA $2007          ; $dae1: 8d 07 20  
            JSR __c296         ; $dae4: 20 96 c2  
            LDX #$0a           ; $dae7: a2 0a     
__dae9:     JSR __c28b         ; $dae9: 20 8b c2  
            LDA $12            ; $daec: a5 12     
            AND #$8f           ; $daee: 29 8f     
            BNE __daf8         ; $daf0: d0 06     
            DEX                ; $daf2: ca        
            BNE __dae9         ; $daf3: d0 f4     
            JMP __dab5         ; $daf5: 4c b5 da  

;-------------------------------------------------------------------------------
__daf8:     BMI __db43         ; $daf8: 30 49     
            PHA                ; $dafa: 48        
            LDA #$12           ; $dafb: a9 12     
            STA $4003          ; $dafd: 8d 03 40  
            PLA                ; $db00: 68        
            CMP #$01           ; $db01: c9 01     
            BEQ __db24         ; $db03: f0 1f     
            LDA $20            ; $db05: a5 20     
            CMP #$3a           ; $db07: c9 3a     
            BNE __db0f         ; $db09: d0 04     
            LDA #$51           ; $db0b: a9 51     
            STA $20            ; $db0d: 85 20     
__db0f:     LDA $20            ; $db0f: a5 20     
            CMP #$41           ; $db11: c9 41     
            BEQ __db1a         ; $db13: f0 05     
            DEC $20            ; $db15: c6 20     
            JMP __db1e         ; $db17: 4c 1e db  

;-------------------------------------------------------------------------------
__db1a:     LDA #$50           ; $db1a: a9 50     
            STA $20            ; $db1c: 85 20     
__db1e:     JSR __c307         ; $db1e: 20 07 c3  
            JMP __dab5         ; $db21: 4c b5 da  

;-------------------------------------------------------------------------------
__db24:     LDA $20            ; $db24: a5 20     
            CMP #$3a           ; $db26: c9 3a     
            BNE __db2e         ; $db28: d0 04     
            LDA #$40           ; $db2a: a9 40     
            STA $20            ; $db2c: 85 20     
__db2e:     LDA $20            ; $db2e: a5 20     
            CMP #$50           ; $db30: c9 50     
            BEQ __db39         ; $db32: f0 05     
            INC $20            ; $db34: e6 20     
            JMP __db3d         ; $db36: 4c 3d db  

;-------------------------------------------------------------------------------
__db39:     LDA #$41           ; $db39: a9 41     
            STA $20            ; $db3b: 85 20     
__db3d:     JSR __c307         ; $db3d: 20 07 c3  
__db40:     JMP __dab5         ; $db40: 4c b5 da  

;-------------------------------------------------------------------------------
__db43:     LDA #$11           ; $db43: a9 11     
            STA $4003          ; $db45: 8d 03 40  
            LDA $20            ; $db48: a5 20     
            CMP #$3a           ; $db4a: c9 3a     
            BEQ __db40         ; $db4c: f0 f2     
            AND #$0f           ; $db4e: 29 0f     
            TAX                ; $db50: aa        
            LDA __dfa0,x       ; $db51: bd a0 df  
            STA $007f,y        ; $db54: 99 7f 00  
            JSR __c28b         ; $db57: 20 8b c2  
            LDA #$22           ; $db5a: a9 22     
            LDX $1f            ; $db5c: a6 1f     
            JSR __c196         ; $db5e: 20 96 c1  
            LDA $20            ; $db61: a5 20     
            STA $2007          ; $db63: 8d 07 20  
            JSR __c296         ; $db66: 20 96 c2  
            LDA #$3a           ; $db69: a9 3a     
            STA $20            ; $db6b: 85 20     
            INC $1f            ; $db6d: e6 1f     
            INY                ; $db6f: c8        
            CPY #$14           ; $db70: c0 14     
            BEQ __db7a         ; $db72: f0 06     
            JSR __c307         ; $db74: 20 07 c3  
            JMP __dab5         ; $db77: 4c b5 da  

;-------------------------------------------------------------------------------
__db7a:     LDX #$00           ; $db7a: a2 00     
            STX $54            ; $db7c: 86 54     
__db7e:     LDA $7f,x          ; $db7e: b5 7f     
            PHA                ; $db80: 48        
            CLC                ; $db81: 18        
            ADC #$07           ; $db82: 69 07     
            CLC                ; $db84: 18        
            ADC $54            ; $db85: 65 54     
            AND #$0f           ; $db87: 29 0f     
            STA $7f,x          ; $db89: 95 7f     
            PLA                ; $db8b: 68        
            STA $54            ; $db8c: 85 54     
            INX                ; $db8e: e8        
            CPX #$14           ; $db8f: e0 14     
            BNE __db7e         ; $db91: d0 eb     
            LDX #$00           ; $db93: a2 00     
__db95:     LDY #$04           ; $db95: a0 04     
            LDA #$00           ; $db97: a9 00     
__db99:     CLC                ; $db99: 18        
__db9a:     ADC $7f,x          ; $db9a: 75 7f     
            INX                ; $db9c: e8        
            DEY                ; $db9d: 88        
            BNE __db99         ; $db9e: d0 f9     
            AND #$0f           ; $dba0: 29 0f     
            CMP $7f,x          ; $dba2: d5 7f     
            BNE __dbcc         ; $dba4: d0 26     
            INX                ; $dba6: e8        
            CPX #$0f           ; $dba7: e0 0f     
            BNE __db95         ; $dba9: d0 ea     
            LDA $83            ; $dbab: a5 83     
            ASL                ; $dbad: 0a        
            STA $1f            ; $dbae: 85 1f     
            LDA $88            ; $dbb0: a5 88     
            ASL                ; $dbb2: 0a        
            CLC                ; $dbb3: 18        
            ADC $1f            ; $dbb4: 65 1f     
            STA $1f            ; $dbb6: 85 1f     
            LDA $8d            ; $dbb8: a5 8d     
            ASL                ; $dbba: 0a        
            CLC                ; $dbbb: 18        
            ADC $1f            ; $dbbc: 65 1f     
            LDX #$04           ; $dbbe: a2 04     
__dbc0:     CLC                ; $dbc0: 18        
            ADC $8d,x          ; $dbc1: 75 8d     
            DEX                ; $dbc3: ca        
            BNE __dbc0         ; $dbc4: d0 fa     
            AND #$0f           ; $dbc6: 29 0f     
            CMP $92            ; $dbc8: c5 92     
            BEQ __dbcf         ; $dbca: f0 03     
__dbcc:     JMP __da8e         ; $dbcc: 4c 8e da  

;-------------------------------------------------------------------------------
__dbcf:     LDX #$00           ; $dbcf: a2 00     
            LDY #$00           ; $dbd1: a0 00     
__dbd3:     JSR __e353         ; $dbd3: 20 53 e3  
            LDA $007f,y        ; $dbd6: b9 7f 00  
            STY $25            ; $dbd9: 84 25     
            LDY #$00           ; $dbdb: a0 00     
            STA ($34),y        ; $dbdd: 91 34     
            LDY $25            ; $dbdf: a4 25     
            INY                ; $dbe1: c8        
            CPY #$14           ; $dbe2: c0 14     
            BNE __dbd3         ; $dbe4: d0 ed     
            LDA $dc            ; $dbe6: a5 dc     
            ASL                ; $dbe8: 0a        
            ASL                ; $dbe9: 0a        
            ASL                ; $dbea: 0a        
            ASL                ; $dbeb: 0a        
            STA $73            ; $dbec: 85 73     
            LDA $de            ; $dbee: a5 de     
            ASL                ; $dbf0: 0a        
            ASL                ; $dbf1: 0a        
            ASL                ; $dbf2: 0a        
            ASL                ; $dbf3: 0a        
            ORA $dd            ; $dbf4: 05 dd     
            STA $58            ; $dbf6: 85 58     
            RTS                ; $dbf8: 60        

;-------------------------------------------------------------------------------
__dbf9:     JSR __c257         ; $dbf9: 20 57 c2  
            JSR __c2b9         ; $dbfc: 20 b9 c2  
            JSR __df27         ; $dbff: 20 27 df  
            LDA #$06           ; $dc02: a9 06     
            JSR __dd04         ; $dc04: 20 04 dd  
            LDY #$00           ; $dc07: a0 00     
            JSR __dc39         ; $dc09: 20 39 dc  
            JSR __dc39         ; $dc0c: 20 39 dc  
            JSR __dc39         ; $dc0f: 20 39 dc  
            JSR __dc39         ; $dc12: 20 39 dc  
            JSR __dc39         ; $dc15: 20 39 dc  
            JSR __dc39         ; $dc18: 20 39 dc  
            JSR __dc39         ; $dc1b: 20 39 dc  
            LDA #$0a           ; $dc1e: a9 0a     
            STA $20            ; $dc20: 85 20     
            LDA #$00           ; $dc22: a9 00     
            STA $1f            ; $dc24: 85 1f     
__dc26:     LDA #$31           ; $dc26: a9 31     
            JSR __cb4e         ; $dc28: 20 4e cb  
            INC $1f            ; $dc2b: e6 1f     
            LDA $1f            ; $dc2d: a5 1f     
            CMP #$10           ; $dc2f: c9 10     
            BNE __dc26         ; $dc31: d0 f3     
            JSR __c2b0         ; $dc33: 20 b0 c2  
            JMP __c23b         ; $dc36: 4c 3b c2  

;-------------------------------------------------------------------------------
__dc39:     LDA __dc53,y       ; $dc39: b9 53 dc  
            INY                ; $dc3c: c8        
            LDX __dc53,y       ; $dc3d: be 53 dc  
            INY                ; $dc40: c8        
__dc41:     JSR __c196         ; $dc41: 20 96 c1  
__dc44:     LDA __dc53,y       ; $dc44: b9 53 dc  
            INY                ; $dc47: c8        
            CMP #$00           ; $dc48: c9 00     
            BEQ __dc52         ; $dc4a: f0 06     
            STA $2007          ; $dc4c: 8d 07 20  
            JMP __dc44         ; $dc4f: 4c 44 dc  

;-------------------------------------------------------------------------------
__dc52:     RTS                ; $dc52: 60        

;-------------------------------------------------------------------------------
__dc53:     JSR $4388          ; $dc53: 20 88 43  
            .hex 4f 4e 47      ; $dc56: 4f 4e 47  Invalid Opcode - SRE $474e
            .hex 52            ; $dc59: 52        Invalid Opcode - KIL 
            EOR ($54,x)        ; $dc5a: 41 54     
            EOR $4c,x          ; $dc5c: 55 4c     
            EOR ($54,x)        ; $dc5e: 41 54     
            EOR #$4f           ; $dc60: 49 4f     
            .hex 4e 53 00      ; $dc62: 4e 53 00  Bad Addr Mode - LSR $0053
            JSR $59e4          ; $dc65: 20 e4 59  
            .hex 4f 55 3a      ; $dc68: 4f 55 3a  Invalid Opcode - SRE $3a55
            PHA                ; $dc6b: 48        
            EOR ($56,x)        ; $dc6c: 41 56     
            EOR $3a            ; $dc6e: 45 3a     
            .hex 53 55         ; $dc70: 53 55     Invalid Opcode - SRE ($55),y
            .hex 43 43         ; $dc72: 43 43     Invalid Opcode - SRE ($43,x)
            EOR $45            ; $dc74: 45 45     
            .hex 44 45         ; $dc76: 44 45     Invalid Opcode - NOP $45
            .hex 44 3a         ; $dc78: 44 3a     Invalid Opcode - NOP $3a
            EOR #$4e           ; $dc7a: 49 4e     
            BRK                ; $dc7c: 00        
            AND ($22,x)        ; $dc7d: 21 22     
            PHA                ; $dc7f: 48        
            EOR $4c            ; $dc80: 45 4c     
            BVC __dccd         ; $dc82: 50 49     
            LSR $3a47          ; $dc84: 4e 47 3a  
            .hex 42            ; $dc87: 42        Invalid Opcode - KIL 
            .hex 4f 4d 42      ; $dc88: 4f 4d 42  Invalid Opcode - SRE $424d
            EOR $52            ; $dc8b: 45 52     
            EOR $4e41          ; $dc8d: 4d 41 4e  
            .hex 3a            ; $dc90: 3a        Invalid Opcode - NOP 
            .hex 54 4f         ; $dc91: 54 4f     Invalid Opcode - NOP $4f,x
            .hex 3a            ; $dc93: 3a        Invalid Opcode - NOP 
            .hex 42            ; $dc94: 42        Invalid Opcode - KIL 
            EOR $43            ; $dc95: 45 43     
            .hex 4f 4d 45      ; $dc97: 4f 4d 45  Invalid Opcode - SRE $454d
            BRK                ; $dc9a: 00        
            AND ($62,x)        ; $dc9b: 21 62     
            EOR ($3a,x)        ; $dc9d: 41 3a     
            PHA                ; $dc9f: 48        
            EOR $4d,x          ; $dca0: 55 4d     
            EOR ($4e,x)        ; $dca2: 41 4e     
            .hex 3a            ; $dca4: 3a        Invalid Opcode - NOP 
            .hex 42            ; $dca5: 42        Invalid Opcode - KIL 
            EOR $49            ; $dca6: 45 49     
            .hex 4e 47 00      ; $dca8: 4e 47 00  Bad Addr Mode - LSR $0047
            AND ($a4,x)        ; $dcab: 21 a4     
            EOR $5941          ; $dcad: 4d 41 59  
            .hex 42            ; $dcb0: 42        Invalid Opcode - KIL 
            EOR $3a            ; $dcb1: 45 3a     
            EOR $554f,y        ; $dcb3: 59 4f 55  
            .hex 3a            ; $dcb6: 3a        Invalid Opcode - NOP 
            .hex 43 41         ; $dcb7: 43 41     Invalid Opcode - SRE ($41,x)
            LSR $523a          ; $dcb9: 4e 3a 52  
            EOR $43            ; $dcbc: 45 43     
            .hex 4f 47 4e      ; $dcbe: 4f 47 4e  Invalid Opcode - SRE $4e47
            EOR #$5a           ; $dcc1: 49 5a     
            EOR $3a            ; $dcc3: 45 3a     
            PHA                ; $dcc5: 48        
            EOR #$4d           ; $dcc6: 49 4d     
            BRK                ; $dcc8: 00        
            AND ($e2,x)        ; $dcc9: 21 e2     
            EOR #$4e           ; $dccb: 49 4e     
__dccd:     .hex 3a            ; $dccd: 3a        Invalid Opcode - NOP 
            EOR ($4e,x)        ; $dcce: 41 4e     
            .hex 4f 54 48      ; $dcd0: 4f 54 48  Invalid Opcode - SRE $4854
            EOR $52            ; $dcd3: 45 52     
            .hex 3a            ; $dcd5: 3a        Invalid Opcode - NOP 
            PHA                ; $dcd6: 48        
            EOR $44,x          ; $dcd7: 55 44     
            .hex 53 4f         ; $dcd9: 53 4f     Invalid Opcode - SRE ($4f),y
            LSR $533a          ; $dcdb: 4e 3a 53  
            .hex 4f 46 54      ; $dcde: 4f 46 54  Invalid Opcode - SRE $5446
            .hex 3a            ; $dce1: 3a        Invalid Opcode - NOP 
            .hex 47 41         ; $dce2: 47 41     Invalid Opcode - SRE $41
            .hex 4d 45 00      ; $dce4: 4d 45 00  Bad Addr Mode - EOR $0045
            .hex 22            ; $dce7: 22        Invalid Opcode - KIL 
            .hex 4b 47         ; $dce8: 4b 47     Invalid Opcode - ALR #$47
            .hex 4f 4f 44      ; $dcea: 4f 4f 44  Invalid Opcode - SRE $444f
            .hex 3a            ; $dced: 3a        Invalid Opcode - NOP 
            .hex 42            ; $dcee: 42        Invalid Opcode - KIL 
            EOR $0045,y        ; $dcef: 59 45 00  
            EOR $4e            ; $dcf2: 45 4e     
            .hex 54 45         ; $dcf4: 54 45     Invalid Opcode - NOP $45,x
            .hex 52            ; $dcf6: 52        Invalid Opcode - KIL 
            .hex 3a            ; $dcf7: 3a        Invalid Opcode - NOP 
            .hex 53 45         ; $dcf8: 53 45     Invalid Opcode - SRE ($45),y
            .hex 43 52         ; $dcfa: 43 52     Invalid Opcode - SRE ($52,x)
            EOR $54            ; $dcfc: 45 54     
            .hex 3a            ; $dcfe: 3a        Invalid Opcode - NOP 
            .hex 43 4f         ; $dcff: 43 4f     Invalid Opcode - SRE ($4f,x)
            .hex 44 45         ; $dd01: 44 45     Invalid Opcode - NOP $45
            BRK                ; $dd03: 00        
__dd04:     PHA                ; $dd04: 48        
            JSR __c28b         ; $dd05: 20 8b c2  
            LDA #$3f           ; $dd08: a9 3f     
            LDX #$1c           ; $dd0a: a2 1c     
            JSR __c196         ; $dd0c: 20 96 c1  
            PLA                ; $dd0f: 68        
            ASL                ; $dd10: 0a        
            ASL                ; $dd11: 0a        
            TAX                ; $dd12: aa        
            LDY #$04           ; $dd13: a0 04     
__dd15:     LDA __dd22,x       ; $dd15: bd 22 dd  
            STA $2007          ; $dd18: 8d 07 20  
            INX                ; $dd1b: e8        
            DEY                ; $dd1c: 88        
            BNE __dd15         ; $dd1d: d0 f6     
            JMP __c2d6         ; $dd1f: 4c d6 c2  

;-------------------------------------------------------------------------------
__dd22:     .hex 0f 00 00      ; $dd22: 0f 00 00  Bad Addr Mode - SLO $0000
            BRK                ; $dd25: 00        
            .hex 0f 00 00      ; $dd26: 0f 00 00  Bad Addr Mode - SLO $0000
            BRK                ; $dd29: 00        
            .hex 0f 00 00      ; $dd2a: 0f 00 00  Bad Addr Mode - SLO $0000
            BRK                ; $dd2d: 00        
            .hex 0f 00 00      ; $dd2e: 0f 00 00  Bad Addr Mode - SLO $0000
            BRK                ; $dd31: 00        
            .hex 0f 00 00      ; $dd32: 0f 00 00  Bad Addr Mode - SLO $0000
            BRK                ; $dd35: 00        
            .hex 0f 00 00      ; $dd36: 0f 00 00  Bad Addr Mode - SLO $0000
            BRK                ; $dd39: 00        
            .hex 0f 15 36      ; $dd3a: 0f 15 36  Invalid Opcode - SLO $3615
            .hex 21            ; $dd3d: 21        Suspected data
__dd3e:     JSR __c257         ; $dd3e: 20 57 c2  
            JSR __c2b9         ; $dd41: 20 b9 c2  
            JSR __df27         ; $dd44: 20 27 df  
            LDA #$21           ; $dd47: a9 21     
            LDX #$ea           ; $dd49: a2 ea     
            JSR __c196         ; $dd4b: 20 96 c1  
            LDX #$08           ; $dd4e: a2 08     
__dd50:     LDA __dd62,x       ; $dd50: bd 62 dd  
            STA $2007          ; $dd53: 8d 07 20  
            DEX                ; $dd56: ca        
            BPL __dd50         ; $dd57: 10 f7     
            JSR __e2bd         ; $dd59: 20 bd e2  
            JSR __c2b0         ; $dd5c: 20 b0 c2  
            JMP __c23b         ; $dd5f: 4c 3b c2  

;-------------------------------------------------------------------------------
__dd62:     .hex 52            ; $dd62: 52        Invalid Opcode - KIL 
            EOR $56            ; $dd63: 45 56     
            .hex 4f 3a 45      ; $dd65: 4f 3a 45  Invalid Opcode - SRE $453a
            EOR $4741          ; $dd68: 4d 41 47  
__dd6b:     STX $24            ; $dd6b: 86 24     
            STY $25            ; $dd6d: 84 25     
            LDX $59            ; $dd6f: a6 59     
            BNE __ddc2         ; $dd71: d0 4f     
            LDX #$03           ; $dd73: a2 03     
            BNE __dd8d         ; $dd75: d0 16     
__dd77:     STX $24            ; $dd77: 86 24     
            STY $25            ; $dd79: 84 25     
            LDX $59            ; $dd7b: a6 59     
            BNE __ddc2         ; $dd7d: d0 43     
            LDX #$04           ; $dd7f: a2 04     
            BNE __dd8d         ; $dd81: d0 0a     
__dd83:     STX $24            ; $dd83: 86 24     
            STY $25            ; $dd85: 84 25     
            LDX $59            ; $dd87: a6 59     
            BNE __ddc2         ; $dd89: d0 37     
            LDX #$06           ; $dd8b: a2 06     
__dd8d:     LDY #$00           ; $dd8d: a0 00     
            CLC                ; $dd8f: 18        
            ADC $61,x          ; $dd90: 75 61     
__dd92:     STA $61,x          ; $dd92: 95 61     
            LDA $61,x          ; $dd94: b5 61     
            SEC                ; $dd96: 38        
            SBC #$0a           ; $dd97: e9 0a     
            BCC __dd9e         ; $dd99: 90 03     
            INY                ; $dd9b: c8        
            BNE __dd92         ; $dd9c: d0 f4     
__dd9e:     CPY #$00           ; $dd9e: c0 00     
            BEQ __ddaa         ; $dda0: f0 08     
            TYA                ; $dda2: 98        
            DEX                ; $dda3: ca        
            BPL __dd8d         ; $dda4: 10 e7     
            LDA #$09           ; $dda6: a9 09     
            STA $61            ; $dda8: 85 61     
__ddaa:     LDX #$00           ; $ddaa: a2 00     
__ddac:     LDA $61,x          ; $ddac: b5 61     
            CMP $01,x          ; $ddae: d5 01     
            BCC __ddc2         ; $ddb0: 90 10     
            BNE __ddb9         ; $ddb2: d0 05     
            INX                ; $ddb4: e8        
            CPX #$08           ; $ddb5: e0 08     
            BNE __ddac         ; $ddb7: d0 f3     
__ddb9:     LDX #$06           ; $ddb9: a2 06     
__ddbb:     LDA $61,x          ; $ddbb: b5 61     
            STA $01,x          ; $ddbd: 95 01     
            DEX                ; $ddbf: ca        
            BPL __ddbb         ; $ddc0: 10 f9     
__ddc2:     LDX $24            ; $ddc2: a6 24     
            LDY $25            ; $ddc4: a4 25     
            RTS                ; $ddc6: 60        

;-------------------------------------------------------------------------------
__ddc7:     LDA #$20           ; $ddc7: a9 20     
            LDX #$00           ; $ddc9: a2 00     
            JSR __c196         ; $ddcb: 20 96 c1  
            LDX #$80           ; $ddce: a2 80     
            LDA #$3a           ; $ddd0: a9 3a     
__ddd2:     STA $2007          ; $ddd2: 8d 07 20  
            DEX                ; $ddd5: ca        
            BNE __ddd2         ; $ddd6: d0 fa     
            LDA #$20           ; $ddd8: a9 20     
            LDX #$41           ; $ddda: a2 41     
            JSR __c196         ; $dddc: 20 96 c1  
            LDX #$03           ; $dddf: a2 03     
__dde1:     LDA __de15,x       ; $dde1: bd 15 de  
            STA $2007          ; $dde4: 8d 07 20  
            DEX                ; $dde7: ca        
            BPL __dde1         ; $dde8: 10 f7     
            LDA #$3a           ; $ddea: a9 3a     
            STA $2007          ; $ddec: 8d 07 20  
            LDA #$20           ; $ddef: a9 20     
            LDX #$52           ; $ddf1: a2 52     
            JSR __c196         ; $ddf3: 20 96 c1  
            LDA #$30           ; $ddf6: a9 30     
            STA $2007          ; $ddf8: 8d 07 20  
            STA $2007          ; $ddfb: 8d 07 20  
            LDA #$20           ; $ddfe: a9 20     
            LDX #$58           ; $de00: a2 58     
            JSR __c196         ; $de02: 20 96 c1  
            LDX #$03           ; $de05: a2 03     
__de07:     LDA __de19,x       ; $de07: bd 19 de  
            STA $2007          ; $de0a: 8d 07 20  
            DEX                ; $de0d: ca        
            BPL __de07         ; $de0e: 10 f7     
            LDA $68            ; $de10: a5 68     
            JMP __df5d         ; $de12: 4c 5d df  

;-------------------------------------------------------------------------------
__de15:     EOR $4d            ; $de15: 45 4d     
            EOR #$54           ; $de17: 49 54     
__de19:     .hex 54 46         ; $de19: 54 46     Invalid Opcode - NOP $46,x
            EOR $4c            ; $de1b: 45 4c     
__de1d:     JSR __c257         ; $de1d: 20 57 c2  
            JSR __c2b9         ; $de20: 20 b9 c2  
            LDA #$00           ; $de23: a9 00     
            STA $0e            ; $de25: 85 0e     
            JSR __df27         ; $de27: 20 27 df  
            LDA #$21           ; $de2a: a9 21     
            LDX #$ea           ; $de2c: a2 ea     
            JSR __c196         ; $de2e: 20 96 c1  
            LDX #$04           ; $de31: a2 04     
__de33:     LDA __de4e,x       ; $de33: bd 4e de  
            STA $2007          ; $de36: 8d 07 20  
            DEX                ; $de39: ca        
            BPL __de33         ; $de3a: 10 f7     
            LDA #$21           ; $de3c: a9 21     
            LDX #$f0           ; $de3e: a2 f0     
            JSR __c196         ; $de40: 20 96 c1  
            LDA $58            ; $de43: a5 58     
            JSR __df5d         ; $de45: 20 5d df  
            JSR __c2b0         ; $de48: 20 b0 c2  
            JMP __c23b         ; $de4b: 4c 3b c2  

;-------------------------------------------------------------------------------
__de4e:     EOR $47            ; $de4e: 45 47     
            EOR ($54,x)        ; $de50: 41 54     
            .hex 53            ; $de52: 53        Suspected data
__de53:     JSR __c257         ; $de53: 20 57 c2  
            JSR __c2b9         ; $de56: 20 b9 c2  
            LDA #$00           ; $de59: a9 00     
            STA $0e            ; $de5b: 85 0e     
            JSR __df27         ; $de5d: 20 27 df  
            LDA #$21           ; $de60: a9 21     
            LDX #$ea           ; $de62: a2 ea     
            JSR __c196         ; $de64: 20 96 c1  
            LDX #$0a           ; $de67: a2 0a     
__de69:     LDA __de78,x       ; $de69: bd 78 de  
            STA $2007          ; $de6c: 8d 07 20  
            DEX                ; $de6f: ca        
            BPL __de69         ; $de70: 10 f7     
            JSR __c2b0         ; $de72: 20 b0 c2  
            JMP __c23b         ; $de75: 4c 3b c2  

;-------------------------------------------------------------------------------
__de78:     EOR $47            ; $de78: 45 47     
            EOR ($54,x)        ; $de7a: 41 54     
            .hex 53 3a         ; $de7c: 53 3a     Invalid Opcode - SRE ($3a),y
            .hex 53 55         ; $de7e: 53 55     Invalid Opcode - SRE ($55),y
            LSR $424f          ; $de80: 4e 4f 42  
__de83:     JSR __c257         ; $de83: 20 57 c2  
            JSR __c215         ; $de86: 20 15 c2  
            JSR __c28b         ; $de89: 20 8b c2  
            LDA #$3f           ; $de8c: a9 3f     
            LDX #$00           ; $de8e: a2 00     
            JSR __c196         ; $de90: 20 96 c1  
            LDX #$00           ; $de93: a2 00     
__de95:     LDA __df90,x       ; $de95: bd 90 df  
            STA $2007          ; $de98: 8d 07 20  
            INX                ; $de9b: e8        
            CPX #$10           ; $de9c: e0 10     
            BNE __de95         ; $de9e: d0 f5     
            JSR __c2d6         ; $dea0: 20 d6 c2  
            JSR __e1c0         ; $dea3: 20 c0 e1  
            LDA #$20           ; $dea6: a9 20     
            LDX #$00           ; $dea8: a2 00     
            JSR __c196         ; $deaa: 20 96 c1  
            LDX #$40           ; $dead: a2 40     
            LDA #$b0           ; $deaf: a9 b0     
__deb1:     STA $2007          ; $deb1: 8d 07 20  
            DEX                ; $deb4: ca        
            BNE __deb1         ; $deb5: d0 fa     
            LDX #$00           ; $deb7: a2 00     
__deb9:     LDA __dfb0,x       ; $deb9: bd b0 df  
            STA $2007          ; $debc: 8d 07 20  
            INX                ; $debf: e8        
            BNE __deb9         ; $dec0: d0 f7     
__dec2:     LDA __e0b0,x       ; $dec2: bd b0 e0  
            STA $2007          ; $dec5: 8d 07 20  
            INX                ; $dec8: e8        
            BNE __dec2         ; $dec9: d0 f7     
            LDA #$22           ; $decb: a9 22     
            LDX #$ae           ; $decd: a2 ae     
            JSR __c196         ; $decf: 20 96 c1  
            LDX #$00           ; $ded2: a2 00     
__ded4:     LDA $01,x          ; $ded4: b5 01     
            BNE __dee4         ; $ded6: d0 0c     
            LDA #$3a           ; $ded8: a9 3a     
            STA $2007          ; $deda: 8d 07 20  
            INX                ; $dedd: e8        
            CPX #$07           ; $dede: e0 07     
            BNE __ded4         ; $dee0: d0 f2     
            BEQ __def1         ; $dee2: f0 0d     
__dee4:     LDA $01,x          ; $dee4: b5 01     
            CLC                ; $dee6: 18        
            ADC #$30           ; $dee7: 69 30     
            STA $2007          ; $dee9: 8d 07 20  
            INX                ; $deec: e8        
            CPX #$07           ; $deed: e0 07     
            BNE __dee4         ; $deef: d0 f3     
__def1:     LDA #$30           ; $def1: a9 30     
            STA $2007          ; $def3: 8d 07 20  
            STA $2007          ; $def6: 8d 07 20  
            LDA #$23           ; $def9: a9 23     
            LDX #$c0           ; $defb: a2 c0     
            JSR __c196         ; $defd: 20 96 c1  
            LDX #$20           ; $df00: a2 20     
            LDA #$00           ; $df02: a9 00     
__df04:     STA $2007          ; $df04: 8d 07 20  
            DEX                ; $df07: ca        
            BNE __df04         ; $df08: d0 fa     
            LDX #$08           ; $df0a: a2 08     
            LDA #$50           ; $df0c: a9 50     
__df0e:     STA $2007          ; $df0e: 8d 07 20  
            DEX                ; $df11: ca        
            BNE __df0e         ; $df12: d0 fa     
            LDX #$18           ; $df14: a2 18     
            LDA #$55           ; $df16: a9 55     
__df18:     STA $2007          ; $df18: 8d 07 20  
            DEX                ; $df1b: ca        
            BNE __df18         ; $df1c: d0 fa     
            JSR __c296         ; $df1e: 20 96 c2  
            JSR __c2b0         ; $df21: 20 b0 c2  
            JMP __c23b         ; $df24: 4c 3b c2  

;-------------------------------------------------------------------------------
__df27:     LDA #$00           ; $df27: a9 00     
            STA $0e            ; $df29: 85 0e     
            JSR __c28b         ; $df2b: 20 8b c2  
            LDA #$3f           ; $df2e: a9 3f     
            LDX #$00           ; $df30: a2 00     
            JSR __c196         ; $df32: 20 96 c1  
            LDX #$00           ; $df35: a2 00     
__df37:     LDA __df8c,x       ; $df37: bd 8c df  
            STA $2007          ; $df3a: 8d 07 20  
            INX                ; $df3d: e8        
            CPX #$10           ; $df3e: e0 10     
            BNE __df37         ; $df40: d0 f5     
            JSR __c2d6         ; $df42: 20 d6 c2  
            JMP __c215         ; $df45: 4c 15 c2  

;-------------------------------------------------------------------------------
__df48:     LDY #$30           ; $df48: a0 30     
            SEC                ; $df4a: 38        
__df4b:     SBC #$64           ; $df4b: e9 64     
            BCC __df52         ; $df4d: 90 03     
            INY                ; $df4f: c8        
            BNE __df4b         ; $df50: d0 f9     
__df52:     ADC #$64           ; $df52: 69 64     
            CPY #$30           ; $df54: c0 30     
            BNE __df76         ; $df56: d0 1e     
            LDY #$3a           ; $df58: a0 3a     
            STY $2007          ; $df5a: 8c 07 20  
__df5d:     LDY #$30           ; $df5d: a0 30     
            SEC                ; $df5f: 38        
__df60:     SBC #$0a           ; $df60: e9 0a     
__df62:     BCC __df67         ; $df62: 90 03     
            INY                ; $df64: c8        
            BNE __df60         ; $df65: d0 f9     
__df67:     ADC #$3a           ; $df67: 69 3a     
            CPY #$30           ; $df69: c0 30     
            BNE __df6f         ; $df6b: d0 02     
            LDY #$3a           ; $df6d: a0 3a     
__df6f:     STY $2007          ; $df6f: 8c 07 20  
            STA $2007          ; $df72: 8d 07 20  
            RTS                ; $df75: 60        

;-------------------------------------------------------------------------------
__df76:     STY $2007          ; $df76: 8c 07 20  
            LDY #$30           ; $df79: a0 30     
            SEC                ; $df7b: 38        
__df7c:     SBC #$0a           ; $df7c: e9 0a     
            BCC __df83         ; $df7e: 90 03     
            INY                ; $df80: c8        
__df81:     BNE __df7c         ; $df81: d0 f9     
__df83:     ADC #$3a           ; $df83: 69 3a     
            STY $2007          ; $df85: 8c 07 20  
            STA $2007          ; $df88: 8d 07 20  
            RTS                ; $df8b: 60        

;-------------------------------------------------------------------------------
__df8c:     .hex 0f 00 0f      ; $df8c: 0f 00 0f  Invalid Opcode - SLO $0f00
            .hex 30            ; $df8f: 30        Suspected data
__df90:     .hex 0f 05 30      ; $df90: 0f 05 30  Invalid Opcode - SLO $3005
            PLP                ; $df93: 28        
            .hex 0f 00 0f      ; $df94: 0f 00 0f  Invalid Opcode - SLO $0f00
            BMI __dfa8         ; $df97: 30 0f     
            ASL $26            ; $df99: 06 26     
            .hex 37 0f         ; $df9b: 37 0f     Invalid Opcode - RLA $0f,x
            .hex 0f 0f 0f      ; $df9d: 0f 0f 0f  Invalid Opcode - SLO $0f0f
__dfa0:     ORA $00            ; $dfa0: 05 00     
__dfa2:     ORA #$04           ; $dfa2: 09 04     
            ORA $0207          ; $dfa4: 0d 07 02  
            .hex 06            ; $dfa7: 06        Suspected data
__dfa8:     ASL                ; $dfa8: 0a        
            .hex 0f 0c 03      ; $dfa9: 0f 0c 03  Invalid Opcode - SLO $030c
            PHP                ; $dfac: 08        
            .hex 0b 0e         ; $dfad: 0b 0e     Invalid Opcode - ANC #$0e
            .hex 01            ; $dfaf: 01        Suspected data
__dfb0:     BCS __df62         ; $dfb0: b0 b0     
__dfb2:     .hex df c0 c1      ; $dfb2: df c0 c1  Invalid Opcode - DCP __c1c0,x
            CMP ($c2,x)        ; $dfb5: c1 c2     
            CPY #$c1           ; $dfb7: c0 c1     
            CMP ($c1,x)        ; $dfb9: c1 c1     
            .hex c2            ; $dfbb: c2        Suspected data
__dfbc:     CPY #$b6           ; $dfbc: c0 b6     
            SBC #$b8           ; $dfbe: e9 b8     
            .hex c2            ; $dfc0: c2        Suspected data
__dfc1:     CPY #$c1           ; $dfc1: c0 c1     
            CMP ($c2,x)        ; $dfc3: c1 c2     
            CPY #$c1           ; $dfc5: c0 c1     
            CMP ($c2,x)        ; $dfc7: c1 c2     
            CPY #$c1           ; $dfc9: c0 c1     
            CMP ($c2,x)        ; $dfcb: c1 c2     
            SBC #$f8           ; $dfcd: e9 f8     
            BCS __df81         ; $dfcf: b0 b0     
            BCS __dfb2         ; $dfd1: b0 df     
            CMP ($d9,x)        ; $dfd3: c1 d9     
            .hex d3 b3         ; $dfd5: d3 b3     Invalid Opcode - DCP ($b3),y
            CMP ($d9,x)        ; $dfd7: c1 d9     
            .hex cb d3         ; $dfd9: cb d3     Invalid Opcode - AXS #$d3
            .hex b3 c1         ; $dfdb: b3 c1     Invalid Opcode - LAX ($c1),y
__dfdd:     CMP $c6            ; $dfdd: c5 c6     
            CMP ($b3,x)        ; $dfdf: c1 b3     
            .hex c1            ; $dfe1: c1        Suspected data
__dfe2:     CMP $b3d3,y        ; $dfe2: d9 d3 b3  
            CMP ($d9,x)        ; $dfe5: c1 d9     
            .hex cb cb         ; $dfe7: cb cb     Invalid Opcode - AXS #$cb
            CMP ($d9,x)        ; $dfe9: c1 d9     
            .hex d3 b3         ; $dfeb: d3 b3     Invalid Opcode - DCP ($b3),y
            INC $b0f8          ; $dfed: ee f8 b0  
            BCS __dfa2         ; $dff0: b0 b0     
__dff2:     .hex df c1 d0      ; $dff2: df c1 d0  Invalid Opcode - DCP __d0c1,x
            CMP ($d2),y        ; $dff5: d1 d2     
            CMP ($cf,x)        ; $dff7: c1 cf     
            SBC #$c4           ; $dff9: e9 c4     
            .hex b3 c1         ; $dffb: b3 c1     Invalid Opcode - LAX ($c1),y
            CMP $d6,x          ; $dffd: d5 d6     
            .hex d7 b3         ; $dfff: d7 b3     Invalid Opcode - DCP $b3,x
__e001:     CMP ($d0,x)        ; $e001: c1 d0     
            CMP ($d2),y        ; $e003: d1 d2     
            CMP ($d0,x)        ; $e005: c1 d0     
            .hex dc e9 c1      ; $e007: dc e9 c1  Invalid Opcode - NOP __c1e9,x
            BNE __dfdd         ; $e00a: d0 d1     
            .hex d2            ; $e00c: d2        Invalid Opcode - KIL 
            .hex eb f8         ; $e00d: eb f8     Invalid Opcode - SBC #$f8
            BCS __dfc1         ; $e00f: b0 b0     
            BCS __dff2         ; $e011: b0 df     
            CMP ($e0,x)        ; $e013: c1 e0     
            SBC ($e2,x)        ; $e015: e1 e2     
            CMP ($cf,x)        ; $e017: c1 cf     
            SBC #$c4           ; $e019: e9 c4     
            .hex b3 c1         ; $e01b: b3 c1     Invalid Opcode - LAX ($c1),y
            .hex b7 e6         ; $e01d: b7 e6     Invalid Opcode - LAX $e6,y
            .hex e7 b3         ; $e01f: e7 b3     Invalid Opcode - ISC $b3
__e021:     CMP ($e0,x)        ; $e021: c1 e0     
            SBC ($e2,x)        ; $e023: e1 e2     
            CMP ($e0,x)        ; $e025: c1 e0     
            SBC $ec,x          ; $e027: f5 ec     
            CMP ($e0,x)        ; $e029: c1 e0     
            SBC ($e2,x)        ; $e02b: e1 e2     
            .hex ef f8 b0      ; $e02d: ef f8 b0  Invalid Opcode - ISC $b0f8
            BCS __dfe2         ; $e030: b0 b0     
__e032:     .hex df c1 e8      ; $e032: df c1 e8  Invalid Opcode - DCP __e8c1,x
            .hex da            ; $e035: da        Invalid Opcode - NOP 
            .hex b3 c1         ; $e036: b3 c1     Invalid Opcode - LAX ($c1),y
            .hex cf e9 c4      ; $e038: cf e9 c4  Invalid Opcode - DCP __c4e9
            .hex b3 c1         ; $e03b: b3 c1     Invalid Opcode - LAX ($c1),y
            .hex cf e5 f0      ; $e03d: cf e5 f0  Invalid Opcode - DCP __f0e5
            .hex b3            ; $e040: b3        Suspected data
__e041:     CMP ($e8,x)        ; $e041: c1 e8     
            .hex da            ; $e043: da        Invalid Opcode - NOP 
            .hex b3 c1         ; $e044: b3 c1     Invalid Opcode - LAX ($c1),y
            INX                ; $e046: e8        
            .hex db ed c1      ; $e047: db ed c1  Invalid Opcode - DCP __c1ed,y
            INX                ; $e04a: e8        
            .hex da            ; $e04b: da        Invalid Opcode - NOP 
            .hex b3 eb         ; $e04c: b3 eb     Invalid Opcode - LAX ($eb),y
            SED                ; $e04e: f8        
            BCS __e001         ; $e04f: b0 b0     
            BCS __e032         ; $e051: b0 df     
            CMP ($b5,x)        ; $e053: c1 b5     
            .hex e3 b3         ; $e055: e3 b3     Invalid Opcode - ISC ($b3,x)
            CMP ($b5,x)        ; $e057: c1 b5     
            SBC #$e3           ; $e059: e9 e3     
            .hex b3 c1         ; $e05b: b3 c1     Invalid Opcode - LAX ($c1),y
            .hex cf e9 c4      ; $e05d: cf e9 c4  Invalid Opcode - DCP __c4e9
            .hex b3 c1         ; $e060: b3 c1     Invalid Opcode - LAX ($c1),y
__e062:     LDA $e3,x          ; $e062: b5 e3     
            .hex b3 c1         ; $e064: b3 c1     Invalid Opcode - LAX ($c1),y
            LDA $e9,x          ; $e066: b5 e9     
            SBC #$c1           ; $e068: e9 c1     
            .hex cf c4 b3      ; $e06a: cf c4 b3  Invalid Opcode - DCP $b3c4
            .hex eb f8         ; $e06d: eb f8     Invalid Opcode - SBC #$f8
            BCS __e021         ; $e06f: b0 b0     
            .hex b0            ; $e071: b0        Suspected data
__e072:     .hex df b1 c1      ; $e072: df b1 c1  Invalid Opcode - DCP __c1b1,x
            SBC ($c3),y        ; $e075: f1 c3     
            .hex c7 c1         ; $e077: c7 c1     Invalid Opcode - DCP $c1
            CMP ($f1,x)        ; $e079: c1 f1     
            .hex c3 b4         ; $e07b: c3 b4     Invalid Opcode - DCP ($b4,x)
            .hex cf e9 b2      ; $e07d: cf e9 b2  Invalid Opcode - DCP $b2e9
            .hex c3            ; $e080: c3        Suspected data
__e081:     .hex c7 c1         ; $e081: c7 c1     Invalid Opcode - DCP $c1
            SBC ($c3),y        ; $e083: f1 c3     
            .hex c7 c1         ; $e085: c7 c1     Invalid Opcode - DCP $c1
            CMP ($c3,x)        ; $e087: c1 c3     
            LDY $cf,x          ; $e089: b4 cf     
            .hex b2            ; $e08b: b2        Invalid Opcode - KIL 
            .hex c3 eb         ; $e08c: c3 eb     Invalid Opcode - DCP ($eb,x)
            SED                ; $e08e: f8        
            BCS __e041         ; $e08f: b0 b0     
            BCS __e072         ; $e091: b0 df     
            DEX                ; $e093: ca        
            .hex cb cb         ; $e094: cb cb     Invalid Opcode - AXS #$cb
            .hex cb ce         ; $e096: cb ce     Invalid Opcode - AXS #$ce
            .hex cb cb         ; $e098: cb cb     Invalid Opcode - AXS #$cb
            .hex cb cb         ; $e09a: cb cb     Invalid Opcode - AXS #$cb
            DEC __e9d8         ; $e09c: ce d8 e9  
            SBC #$ea           ; $e09f: e9 ea     
__e0a1:     DEC __cbcb         ; $e0a1: ce cb cb  
            .hex cb ce         ; $e0a4: cb ce     Invalid Opcode - AXS #$ce
            .hex cb cb         ; $e0a6: cb cb     Invalid Opcode - AXS #$cb
            .hex cb ce         ; $e0a8: cb ce     Invalid Opcode - AXS #$ce
            CLD                ; $e0aa: d8        
            SBC #$ea           ; $e0ab: e9 ea     
            CMP $b0f8          ; $e0ad: cd f8 b0  
__e0b0:     BCS __e062         ; $e0b0: b0 b0     
__e0b2:     .hex df e9 e9      ; $e0b2: df e9 e9  Invalid Opcode - DCP __e9e9,x
            SBC #$e9           ; $e0b5: e9 e9     
            SBC #$e9           ; $e0b7: e9 e9     
            SBC #$c0           ; $e0b9: e9 c0     
            LDX $e9,y          ; $e0bb: b6 e9     
            CLV                ; $e0bd: b8        
            .hex c2 c0         ; $e0be: c2 c0     Invalid Opcode - NOP #$c0
            .hex c1            ; $e0c0: c1        Suspected data
__e0c1:     CMP ($c2,x)        ; $e0c1: c1 c2     
            CPY #$bc           ; $e0c3: c0 bc     
            CPX $c2            ; $e0c5: e4 c2     
            SBC #$e9           ; $e0c7: e9 e9     
            SBC #$e9           ; $e0c9: e9 e9     
            SBC #$e9           ; $e0cb: e9 e9     
            SBC #$f8           ; $e0cd: e9 f8     
            BCS __e081         ; $e0cf: b0 b0     
            .hex b0            ; $e0d1: b0        Suspected data
__e0d2:     .hex df e9 e9      ; $e0d2: df e9 e9  Invalid Opcode - DCP __e9e9,x
            SBC #$e9           ; $e0d5: e9 e9     
            SBC #$e9           ; $e0d7: e9 e9     
            SBC #$c1           ; $e0d9: e9 c1     
            CMP $c6            ; $e0db: c5 c6     
            CMP ($b3,x)        ; $e0dd: c1 b3     
            CMP ($d9,x)        ; $e0df: c1 d9     
__e0e1:     .hex d3 b3         ; $e0e1: d3 b3     Invalid Opcode - DCP ($b3),y
            CMP ($bd,x)        ; $e0e3: c1 bd     
            CPY $b3            ; $e0e5: c4 b3     
            INC __fcfb         ; $e0e7: ee fb fc  
            SBC #$e9           ; $e0ea: e9 e9     
            SBC #$e9           ; $e0ec: e9 e9     
            SED                ; $e0ee: f8        
            BCS __e0a1         ; $e0ef: b0 b0     
            .hex b0            ; $e0f1: b0        Suspected data
__e0f2:     .hex df e9 e9      ; $e0f2: df e9 e9  Invalid Opcode - DCP __e9e9,x
            SBC #$e9           ; $e0f5: e9 e9     
            SBC #$e9           ; $e0f7: e9 e9     
            SBC #$c1           ; $e0f9: e9 c1     
            CMP $d6,x          ; $e0fb: d5 d6     
            .hex d7 b3         ; $e0fd: d7 b3     Invalid Opcode - DCP $b3,x
            .hex c1            ; $e0ff: c1        Suspected data
__e100:     .hex d0            ; $e100: d0        Suspected data
__e101:     CMP ($b3),y        ; $e101: d1 b3     
            CMP ($be,x)        ; $e103: c1 be     
            .hex f2            ; $e105: f2        Invalid Opcode - KIL 
            .hex b3 eb         ; $e106: b3 eb     Invalid Opcode - LAX ($eb),y
            SBC #$e9           ; $e108: e9 e9     
            SBC #$e9           ; $e10a: e9 e9     
            SBC #$e9           ; $e10c: e9 e9     
            SED                ; $e10e: f8        
            BCS __e0c1         ; $e10f: b0 b0     
            .hex b0            ; $e111: b0        Suspected data
__e112:     .hex df e9 e9      ; $e112: df e9 e9  Invalid Opcode - DCP __e9e9,x
            SBC #$e9           ; $e115: e9 e9     
            SBC #$e9           ; $e117: e9 e9     
            SBC #$c1           ; $e119: e9 c1     
            .hex b7 e6         ; $e11b: b7 e6     Invalid Opcode - LAX $e6,y
            .hex e7 b3         ; $e11d: e7 b3     Invalid Opcode - ISC $b3
            CMP ($e0,x)        ; $e11f: c1 e0     
__e121:     SBC ($b3,x)        ; $e121: e1 b3     
            CMP ($b9,x)        ; $e123: c1 b9     
            .hex bf b3 eb      ; $e125: bf b3 eb  Invalid Opcode - LAX __ebb3,y
            SBC #$e9           ; $e128: e9 e9     
            SBC #$e9           ; $e12a: e9 e9     
            SBC #$e9           ; $e12c: e9 e9     
            SED                ; $e12e: f8        
            BCS __e0e1         ; $e12f: b0 b0     
            .hex b0            ; $e131: b0        Suspected data
__e132:     .hex df e9 e9      ; $e132: df e9 e9  Invalid Opcode - DCP __e9e9,x
            SBC #$e9           ; $e135: e9 e9     
            SBC #$e9           ; $e137: e9 e9     
            SBC #$c1           ; $e139: e9 c1     
            .hex cf e5 f0      ; $e13b: cf e5 f0  Invalid Opcode - DCP __f0e5
            .hex b3 c1         ; $e13e: b3 c1     Invalid Opcode - LAX ($c1),y
            INX                ; $e140: e8        
__e141:     .hex da            ; $e141: da        Invalid Opcode - NOP 
            .hex b3 c1         ; $e142: b3 c1     Invalid Opcode - LAX ($c1),y
            .hex bb c8 b3      ; $e144: bb c8 b3  Invalid Opcode - LAS $b3c8,y
            .hex eb e9         ; $e147: eb e9     Invalid Opcode - SBC #$e9
            SBC #$e9           ; $e149: e9 e9     
            SBC #$e9           ; $e14b: e9 e9     
            SBC #$f8           ; $e14d: e9 f8     
            BCS __e101         ; $e14f: b0 b0     
            BCS __e132         ; $e151: b0 df     
            SBC #$e9           ; $e153: e9 e9     
            SBC #$e9           ; $e155: e9 e9     
            SBC #$e9           ; $e157: e9 e9     
            SBC #$c1           ; $e159: e9 c1     
            .hex cf e9 c4      ; $e15b: cf e9 c4  Invalid Opcode - DCP __c4e9
            .hex b3 c1         ; $e15e: b3 c1     Invalid Opcode - LAX ($c1),y
            .hex cf            ; $e160: cf        Suspected data
__e161:     CPY $b3            ; $e161: c4 b3     
            CMP ($c9,x)        ; $e163: c1 c9     
            CMP ($b3,x)        ; $e165: c1 b3     
            .hex eb e9         ; $e167: eb e9     Invalid Opcode - SBC #$e9
            SBC #$e9           ; $e169: e9 e9     
            SBC #$e9           ; $e16b: e9 e9     
            SBC #$f8           ; $e16d: e9 f8     
            BCS __e121         ; $e16f: b0 b0     
            .hex b0            ; $e171: b0        Suspected data
__e172:     .hex df e9 e9      ; $e172: df e9 e9  Invalid Opcode - DCP __e9e9,x
            SBC #$e9           ; $e175: e9 e9     
            SBC #$e9           ; $e177: e9 e9     
            SBC #$d4           ; $e179: e9 d4     
            .hex cf e9 b2      ; $e17b: cf e9 b2  Invalid Opcode - DCP $b2e9
            .hex c3 b4         ; $e17e: c3 b4     Invalid Opcode - DCP ($b4,x)
            .hex cf b2 c3      ; $e180: cf b2 c3  Invalid Opcode - DCP __c3b2
            LDY $cf,x          ; $e183: b4 cf     
            TSX                ; $e185: ba        
            .hex c3 eb         ; $e186: c3 eb     Invalid Opcode - DCP ($eb,x)
            SBC #$e9           ; $e188: e9 e9     
            SBC #$e9           ; $e18a: e9 e9     
            SBC #$e9           ; $e18c: e9 e9     
            SED                ; $e18e: f8        
            BCS __e141         ; $e18f: b0 b0     
            BCS __e172         ; $e191: b0 df     
            SBC #$e9           ; $e193: e9 e9     
            SBC #$e9           ; $e195: e9 e9     
            SBC #$e9           ; $e197: e9 e9     
            SBC #$ca           ; $e199: e9 ca     
            CLD                ; $e19b: d8        
            SBC #$e9           ; $e19c: e9 e9     
            NOP                ; $e19e: ea        
__e19f:     DEC __e9d8         ; $e19f: ce d8 e9  
            NOP                ; $e1a2: ea        
            DEC __f3d8         ; $e1a3: ce d8 f3  
            .hex cb            ; $e1a6: cb        Suspected data
__e1a7:     CMP __e9e9         ; $e1a7: cd e9 e9  
            SBC #$e9           ; $e1aa: e9 e9     
            SBC #$e9           ; $e1ac: e9 e9     
            SED                ; $e1ae: f8        
            BCS __e161         ; $e1af: b0 b0     
            BCS __e1a7         ; $e1b1: b0 f4     
            SBC __f9f9,y       ; $e1b3: f9 f9 f9  
            SBC __f9f9,y       ; $e1b6: f9 f9 f9  
            SBC __f9f9,y       ; $e1b9: f9 f9 f9  
            SBC __f9f9,y       ; $e1bc: f9 f9 f9  
            .hex f9            ; $e1bf: f9        Suspected data
__e1c0:     LDY #$00           ; $e1c0: a0 00     
            LDX #$05           ; $e1c2: a2 05     
__e1c4:     JSR __e1e0         ; $e1c4: 20 e0 e1  
            STA $2006          ; $e1c7: 8d 06 20  
            JSR __e1e0         ; $e1ca: 20 e0 e1  
            STA $2006          ; $e1cd: 8d 06 20  
__e1d0:     JSR __e1e0         ; $e1d0: 20 e0 e1  
            CMP #$ff           ; $e1d3: c9 ff     
            BEQ __e1dc         ; $e1d5: f0 05     
            STA $2007          ; $e1d7: 8d 07 20  
            BNE __e1d0         ; $e1da: d0 f4     
__e1dc:     DEX                ; $e1dc: ca        
            BNE __e1c4         ; $e1dd: d0 e5     
            RTS                ; $e1df: 60        

;-------------------------------------------------------------------------------
__e1e0:     LDA __e1e5,y       ; $e1e0: b9 e5 e1  
            INY                ; $e1e3: c8        
            RTS                ; $e1e4: 60        

;-------------------------------------------------------------------------------
__e1e5:     .hex 22            ; $e1e5: 22        Invalid Opcode - KIL 
            ADC #$53           ; $e1e6: 69 53     
            .hex 54 41         ; $e1e8: 54 41     Invalid Opcode - NOP $41,x
            .hex 52            ; $e1ea: 52        Invalid Opcode - KIL 
            .hex 54 b0         ; $e1eb: 54 b0     Invalid Opcode - NOP $b0,x
            BCS __e19f         ; $e1ed: b0 b0     
            .hex 43 4f         ; $e1ef: 43 4f     Invalid Opcode - SRE ($4f,x)
            LSR $4954          ; $e1f1: 4e 54 49  
            LSR $4555          ; $e1f4: 4e 55 45  
            .hex ff 22 aa      ; $e1f7: ff 22 aa  Invalid Opcode - ISC $aa22,x
            .hex 54 4f         ; $e1fa: 54 4f     Invalid Opcode - NOP $4f,x
            .hex 50 ff         ; $e1fc: 50 ff     Illegal Branch - BVC #$ff
            .hex 22            ; $e1fe: 22        Invalid Opcode - KIL 
            .hex e3 54         ; $e1ff: e3 54     Invalid Opcode - ISC ($54,x)
            EOR $41b0          ; $e201: 4d b0 41  
            LSR $b044          ; $e204: 4e 44 b0  
            INC $31b0,x        ; $e207: fe b0 31  
            AND $3738,y        ; $e20a: 39 38 37  
            BCS __e257         ; $e20d: b0 48     
            EOR $44,x          ; $e20f: 55 44     
            .hex 53 4f         ; $e211: 53 4f     Invalid Opcode - SRE ($4f),y
            LSR $53b0          ; $e213: 4e b0 53  
            .hex 4f 46 54      ; $e216: 4f 46 54  Invalid Opcode - SRE $5446
            .hex ff 23 2a      ; $e219: ff 23 2a  Invalid Opcode - ISC $2a23,x
            JMP $4349          ; $e21c: 4c 49 43  

;-------------------------------------------------------------------------------
            EOR $4e            ; $e21f: 45 4e     
            .hex 53 45         ; $e221: 53 45     Invalid Opcode - SRE ($45),y
            .hex 44 b0         ; $e223: 44 b0     Invalid Opcode - NOP $b0
            .hex 42            ; $e225: 42        Invalid Opcode - KIL 
            EOR $23ff,y        ; $e226: 59 ff 23  
            .hex 64 4e         ; $e229: 64 4e     Invalid Opcode - NOP $4e
            EOR #$4e           ; $e22b: 49 4e     
            .hex 54 45         ; $e22d: 54 45     Invalid Opcode - NOP $45,x
            LSR $4f44          ; $e22f: 4e 44 4f  
            BCS __e283         ; $e232: b0 4f     
            LSR $b0            ; $e234: 46 b0     
            EOR ($4d,x)        ; $e236: 41 4d     
            EOR $52            ; $e238: 45 52     
            EOR #$43           ; $e23a: 49 43     
            EOR ($b0,x)        ; $e23c: 41 b0     
            EOR #$4e           ; $e23e: 49 4e     
            .hex 43 fd         ; $e240: 43 fd     Invalid Opcode - SRE ($fd,x)
            .hex ff            ; $e242: ff        Suspected data
__e243:     ORA ($01,x)        ; $e243: 01 01     
            ORA ($01,x)        ; $e245: 01 01     
            ORA ($01,x)        ; $e247: 01 01     
            ORA ($01,x)        ; $e249: 01 01     
            ORA ($01,x)        ; $e24b: 01 01     
            ORA ($01,x)        ; $e24d: 01 01     
            ORA ($01,x)        ; $e24f: 01 01     
            ORA ($01,x)        ; $e251: 01 01     
            ORA ($01,x)        ; $e253: 01 01     
            ORA ($01,x)        ; $e255: 01 01     
__e257:     ORA ($01,x)        ; $e257: 01 01     
            ORA ($01,x)        ; $e259: 01 01     
            ORA ($01,x)        ; $e25b: 01 01     
            ORA ($01,x)        ; $e25d: 01 01     
            ORA ($01,x)        ; $e25f: 01 01     
            ORA ($01,x)        ; $e261: 01 01     
            ORA ($00,x)        ; $e263: 01 00     
            BRK                ; $e265: 00        
            BRK                ; $e266: 00        
            BRK                ; $e267: 00        
            BRK                ; $e268: 00        
            BRK                ; $e269: 00        
            BRK                ; $e26a: 00        
            BRK                ; $e26b: 00        
            BRK                ; $e26c: 00        
            BRK                ; $e26d: 00        
            BRK                ; $e26e: 00        
            BRK                ; $e26f: 00        
            BRK                ; $e270: 00        
            BRK                ; $e271: 00        
            BRK                ; $e272: 00        
            BRK                ; $e273: 00        
            BRK                ; $e274: 00        
            BRK                ; $e275: 00        
            BRK                ; $e276: 00        
            BRK                ; $e277: 00        
            BRK                ; $e278: 00        
            BRK                ; $e279: 00        
            BRK                ; $e27a: 00        
            BRK                ; $e27b: 00        
            BRK                ; $e27c: 00        
            BRK                ; $e27d: 00        
            BRK                ; $e27e: 00        
            BRK                ; $e27f: 00        
            BRK                ; $e280: 00        
            ORA ($01,x)        ; $e281: 01 01     
__e283:     ORA ($00,x)        ; $e283: 01 00     
            ORA ($00,x)        ; $e285: 01 00     
            ORA ($00,x)        ; $e287: 01 00     
            ORA ($00,x)        ; $e289: 01 00     
            ORA ($00,x)        ; $e28b: 01 00     
            ORA ($00,x)        ; $e28d: 01 00     
            ORA ($00,x)        ; $e28f: 01 00     
            ORA ($00,x)        ; $e291: 01 00     
            ORA ($00,x)        ; $e293: 01 00     
            ORA ($00,x)        ; $e295: 01 00     
            ORA ($00,x)        ; $e297: 01 00     
            ORA ($00,x)        ; $e299: 01 00     
            ORA ($00,x)        ; $e29b: 01 00     
            ORA ($00,x)        ; $e29d: 01 00     
            ORA ($00,x)        ; $e29f: 01 00     
            ORA ($01,x)        ; $e2a1: 01 01     
__e2a3:     BRK                ; $e2a3: 00        
            JSR $6040          ; $e2a4: 20 40 60  
            .hex 80 a0         ; $e2a7: 80 a0     Invalid Opcode - NOP #$a0
            CPY #$e0           ; $e2a9: c0 e0     
            BRK                ; $e2ab: 00        
            JSR $6040          ; $e2ac: 20 40 60  
            .hex 80            ; $e2af: 80        Suspected data
__e2b0:     .hex 02            ; $e2b0: 02        Invalid Opcode - KIL 
            .hex 02            ; $e2b1: 02        Invalid Opcode - KIL 
            .hex 02            ; $e2b2: 02        Invalid Opcode - KIL 
            .hex 02            ; $e2b3: 02        Invalid Opcode - KIL 
            .hex 02            ; $e2b4: 02        Invalid Opcode - KIL 
            .hex 02            ; $e2b5: 02        Invalid Opcode - KIL 
            .hex 02            ; $e2b6: 02        Invalid Opcode - KIL 
            .hex 02            ; $e2b7: 02        Invalid Opcode - KIL 
            .hex 03 03         ; $e2b8: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03 03         ; $e2ba: 03 03     Invalid Opcode - SLO ($03,x)
            .hex 03            ; $e2bc: 03        Suspected data
__e2bd:     LDA $73            ; $e2bd: a5 73     
            LSR                ; $e2bf: 4a        
            LSR                ; $e2c0: 4a        
            LSR                ; $e2c1: 4a        
            LSR                ; $e2c2: 4a        
            STA $dc            ; $e2c3: 85 dc     
            LDA $58            ; $e2c5: a5 58     
            AND #$0f           ; $e2c7: 29 0f     
            STA $dd            ; $e2c9: 85 dd     
            LDA $58            ; $e2cb: a5 58     
            LSR                ; $e2cd: 4a        
            LSR                ; $e2ce: 4a        
            LSR                ; $e2cf: 4a        
            LSR                ; $e2d0: 4a        
            STA $de            ; $e2d1: 85 de     
            LDY #$00           ; $e2d3: a0 00     
            LDX #$00           ; $e2d5: a2 00     
            LDA #$03           ; $e2d7: a9 03     
            STA $1f            ; $e2d9: 85 1f     
__e2db:     JSR __e33c         ; $e2db: 20 3c e3  
            JSR __e353         ; $e2de: 20 53 e3  
            LDA $24            ; $e2e1: a5 24     
            STA ($34),y        ; $e2e3: 91 34     
            DEC $1f            ; $e2e5: c6 1f     
            BNE __e2db         ; $e2e7: d0 f2     
            JSR __e33c         ; $e2e9: 20 3c e3  
            LDA $99            ; $e2ec: a5 99     
            ASL                ; $e2ee: 0a        
            CLC                ; $e2ef: 18        
            ADC $24            ; $e2f0: 65 24     
            STA $24            ; $e2f2: 85 24     
            LDA $9a            ; $e2f4: a5 9a     
            ASL                ; $e2f6: 0a        
            CLC                ; $e2f7: 18        
            ADC $24            ; $e2f8: 65 24     
            STA $24            ; $e2fa: 85 24     
            LDA $9b            ; $e2fc: a5 9b     
            ASL                ; $e2fe: 0a        
            CLC                ; $e2ff: 18        
            ADC $24            ; $e300: 65 24     
            STA $95            ; $e302: 85 95     
            LDY #$00           ; $e304: a0 00     
            STY $54            ; $e306: 84 54     
            LDX #$00           ; $e308: a2 00     
__e30a:     JSR __e353         ; $e30a: 20 53 e3  
            LDA ($34),y        ; $e30d: b1 34     
            AND #$0f           ; $e30f: 29 0f     
            SEC                ; $e311: 38        
            SBC $54            ; $e312: e5 54     
            SEC                ; $e314: 38        
            SBC #$07           ; $e315: e9 07     
            AND #$0f           ; $e317: 29 0f     
            STA $0180,x        ; $e319: 9d 80 01  
            STA $54            ; $e31c: 85 54     
            CPX #$28           ; $e31e: e0 28     
            BNE __e30a         ; $e320: d0 e8     
            LDA #$23           ; $e322: a9 23     
            LDX #$06           ; $e324: a2 06     
            JSR __c196         ; $e326: 20 96 c1  
            LDX #$02           ; $e329: a2 02     
__e32b:     LDA $0180,x        ; $e32b: bd 80 01  
            TAY                ; $e32e: a8        
            LDA __e388,y       ; $e32f: b9 88 e3  
            STA $2007          ; $e332: 8d 07 20  
            INX                ; $e335: e8        
            INX                ; $e336: e8        
            CPX #$2a           ; $e337: e0 2a     
            BNE __e32b         ; $e339: d0 f0     
            RTS                ; $e33b: 60        

;-------------------------------------------------------------------------------
__e33c:     LDA #$04           ; $e33c: a9 04     
            STA $20            ; $e33e: 85 20     
            LDA #$00           ; $e340: a9 00     
            STA $24            ; $e342: 85 24     
__e344:     JSR __e353         ; $e344: 20 53 e3  
            LDA ($34),y        ; $e347: b1 34     
            CLC                ; $e349: 18        
            ADC $24            ; $e34a: 65 24     
            STA $24            ; $e34c: 85 24     
            DEC $20            ; $e34e: c6 20     
            BNE __e344         ; $e350: d0 f2     
            RTS                ; $e352: 60        

;-------------------------------------------------------------------------------
__e353:     LDA __e360,x       ; $e353: bd 60 e3  
            STA $34            ; $e356: 85 34     
            INX                ; $e358: e8        
            LDA __e360,x       ; $e359: bd 60 e3  
            STA $35            ; $e35c: 85 35     
            INX                ; $e35e: e8        
            RTS                ; $e35f: 60        

;-------------------------------------------------------------------------------
__e360:     .hex 67 00         ; $e360: 67 00     Invalid Opcode - RRA $00
            .hex 77 00         ; $e362: 77 00     Invalid Opcode - RRA $00,x
            CMP $6100,x        ; $e364: dd 00 61  
            BRK                ; $e367: 00        
            STA $6600,y        ; $e368: 99 00 66  
            BRK                ; $e36b: 00        
            .hex dc 00 64      ; $e36c: dc 00 64  Invalid Opcode - NOP $6400,x
            BRK                ; $e36f: 00        
            ADC $9a00,y        ; $e370: 79 00 9a  
            BRK                ; $e373: 00        
            .hex 74 00         ; $e374: 74 00     Invalid Opcode - NOP $00,x
            .hex 63 00         ; $e376: 63 00     Invalid Opcode - RRA ($00,x)
            ADC $00,x          ; $e378: 75 00     
            .hex 62            ; $e37a: 62        Invalid Opcode - KIL 
            BRK                ; $e37b: 00        
            .hex 9b            ; $e37c: 9b        Invalid Opcode - TAS 
            BRK                ; $e37d: 00        
            ADC $00            ; $e37e: 65 00     
            STY $00,x          ; $e380: 94 00     
            DEC $7600,x        ; $e382: de 00 76  
            BRK                ; $e385: 00        
            STA $00,x          ; $e386: 95 00     
__e388:     EOR ($4f,x)        ; $e388: 41 4f     
            LSR $4b            ; $e38a: 46 4b     
            .hex 43 50         ; $e38c: 43 50     Invalid Opcode - SRE ($50,x)
            .hex 47 45         ; $e38e: 47 45     Invalid Opcode - SRE $45
            JMP $4842          ; $e390: 4c 42 48  

;-------------------------------------------------------------------------------
            EOR $444a          ; $e393: 4d 4a 44  
            .hex 4e 49         ; $e396: 4e 49     Suspected data
__e398:     RTS                ; $e398: 60        

;-------------------------------------------------------------------------------
__e399:     LDA $9c            ; $e399: a5 9c     
            BNE __e3a7         ; $e39b: d0 0a     
            LDA $b1            ; $e39d: a5 b1     
            BNE __e3a7         ; $e39f: d0 06     
            INC $b1            ; $e3a1: e6 b1     
            LDA #$06           ; $e3a3: a9 06     
            STA $df            ; $e3a5: 85 df     
__e3a7:     LDA $a8            ; $e3a7: a5 a8     
            BEQ __e3e7         ; $e3a9: f0 3c     
            CMP #$02           ; $e3ab: c9 02     
            BEQ __e398         ; $e3ad: f0 e9     
            LDA $33            ; $e3af: a5 33     
            AND #$01           ; $e3b1: 29 01     
            BNE __e3bd         ; $e3b3: d0 08     
            DEC $a9            ; $e3b5: c6 a9     
            BNE __e3bd         ; $e3b7: d0 04     
            LDA #$02           ; $e3b9: a9 02     
            STA $a8            ; $e3bb: 85 a8     
__e3bd:     JSR __cfed         ; $e3bd: 20 ed cf  
            LDA $aa            ; $e3c0: a5 aa     
            CMP $28            ; $e3c2: c5 28     
            BNE __e3e6         ; $e3c4: d0 20     
            LDA $2a            ; $e3c6: a5 2a     
            CMP $ab            ; $e3c8: c5 ab     
            BNE __e3e6         ; $e3ca: d0 1a     
            LDA #$04           ; $e3cc: a9 04     
            STA $df            ; $e3ce: 85 df     
            LDX $9d            ; $e3d0: a6 9d     
            LDA __e4bc,x       ; $e3d2: bd bc e4  
            CMP #$64           ; $e3d5: c9 64     
            BCC __e3df         ; $e3d7: 90 06     
            JSR __dd6b         ; $e3d9: 20 6b dd  
            JMP __e3e2         ; $e3dc: 4c e2 e3  

;-------------------------------------------------------------------------------
__e3df:     JSR __dd77         ; $e3df: 20 77 dd  
__e3e2:     LDA #$02           ; $e3e2: a9 02     
            STA $a8            ; $e3e4: 85 a8     
__e3e6:     RTS                ; $e3e6: 60        

;-------------------------------------------------------------------------------
__e3e7:     LDA $28            ; $e3e7: a5 28     
            CMP #$01           ; $e3e9: c9 01     
            BNE __e401         ; $e3eb: d0 14     
            LDA $2a            ; $e3ed: a5 2a     
            CMP #$01           ; $e3ef: c9 01     
            BNE __e3f8         ; $e3f1: d0 05     
            INC $a0            ; $e3f3: e6 a0     
            JMP __e416         ; $e3f5: 4c 16 e4  

;-------------------------------------------------------------------------------
__e3f8:     CMP #$0b           ; $e3f8: c9 0b     
            BNE __e401         ; $e3fa: d0 05     
            INC $a2            ; $e3fc: e6 a2     
            JMP __e416         ; $e3fe: 4c 16 e4  

;-------------------------------------------------------------------------------
__e401:     CMP #$1d           ; $e401: c9 1d     
            BNE __e416         ; $e403: d0 11     
            LDA $2a            ; $e405: a5 2a     
            CMP #$01           ; $e407: c9 01     
            BNE __e410         ; $e409: d0 05     
            INC $a1            ; $e40b: e6 a1     
            JMP __e416         ; $e40d: 4c 16 e4  

;-------------------------------------------------------------------------------
__e410:     CMP #$0b           ; $e410: c9 0b     
            BNE __e416         ; $e412: d0 02     
            INC $a3            ; $e414: e6 a3     
__e416:     LDA $28            ; $e416: a5 28     
            CMP #$01           ; $e418: c9 01     
            BEQ __e434         ; $e41a: f0 18     
            CMP #$1d           ; $e41c: c9 1d     
            BEQ __e434         ; $e41e: f0 14     
            LDA $2a            ; $e420: a5 2a     
            CMP #$01           ; $e422: c9 01     
            BEQ __e434         ; $e424: f0 0e     
            CMP #$0b           ; $e426: c9 0b     
            BEQ __e434         ; $e428: f0 0a     
            LDA #$00           ; $e42a: a9 00     
            STA $a0            ; $e42c: 85 a0     
            STA $a1            ; $e42e: 85 a1     
            STA $a2            ; $e430: 85 a2     
            STA $a3            ; $e432: 85 a3     
__e434:     LDX $9d            ; $e434: a6 9d     
            BEQ __e448         ; $e436: f0 10     
            DEX                ; $e438: ca        
            BEQ __e468         ; $e439: f0 2d     
            DEX                ; $e43b: ca        
            BEQ __e47d         ; $e43c: f0 3f     
            DEX                ; $e43e: ca        
            BEQ __e486         ; $e43f: f0 45     
            DEX                ; $e441: ca        
            BEQ __e48d         ; $e442: f0 49     
            DEX                ; $e444: ca        
            BEQ __e498         ; $e445: f0 51     
            RTS                ; $e447: 60        

;-------------------------------------------------------------------------------
__e448:     LDA $9e            ; $e448: a5 9e     
            BNE __e467         ; $e44a: d0 1b     
            LDA $9f            ; $e44c: a5 9f     
            BEQ __e467         ; $e44e: f0 17     
__e450:     LDA $a8            ; $e450: a5 a8     
            BNE __e467         ; $e452: d0 13     
            LDA #$01           ; $e454: a9 01     
            STA $a8            ; $e456: 85 a8     
            LDA #$00           ; $e458: a9 00     
            STA $a9            ; $e45a: 85 a9     
            JSR __cacf         ; $e45c: 20 cf ca  
            LDA $24            ; $e45f: a5 24     
            STA $aa            ; $e461: 85 aa     
            LDA $25            ; $e463: a5 25     
            STA $ab            ; $e465: 85 ab     
__e467:     RTS                ; $e467: 60        

;-------------------------------------------------------------------------------
__e468:     LDA $9c            ; $e468: a5 9c     
            BNE __e467         ; $e46a: d0 fb     
            LDA $a0            ; $e46c: a5 a0     
            BEQ __e467         ; $e46e: f0 f7     
            LDA $a1            ; $e470: a5 a1     
            BEQ __e467         ; $e472: f0 f3     
            LDA $a2            ; $e474: a5 a2     
            BEQ __e467         ; $e476: f0 ef     
            LDA $a3            ; $e478: a5 a3     
            BNE __e450         ; $e47a: d0 d4     
            RTS                ; $e47c: 60        

;-------------------------------------------------------------------------------
__e47d:     LDA $9c            ; $e47d: a5 9c     
            BNE __e467         ; $e47f: d0 e6     
            LDA $a4            ; $e481: a5 a4     
            BEQ __e450         ; $e483: f0 cb     
            RTS                ; $e485: 60        

;-------------------------------------------------------------------------------
__e486:     LDA $a5            ; $e486: a5 a5     
            CMP #$f8           ; $e488: c9 f8     
            BCS __e450         ; $e48a: b0 c4     
            RTS                ; $e48c: 60        

;-------------------------------------------------------------------------------
__e48d:     LDA $9f            ; $e48d: a5 9f     
            BEQ __e467         ; $e48f: f0 d6     
            LDA $a6            ; $e491: a5 a6     
            CMP #$f8           ; $e493: c9 f8     
            BCS __e450         ; $e495: b0 b9     
            RTS                ; $e497: 60        

;-------------------------------------------------------------------------------
__e498:     LDA $9e            ; $e498: a5 9e     
            BNE __e467         ; $e49a: d0 cb     
            LDA $58            ; $e49c: a5 58     
            ASL                ; $e49e: 0a        
            CLC                ; $e49f: 18        
            ADC #$32           ; $e4a0: 69 32     
            CMP $a4            ; $e4a2: c5 a4     
            .hex f0            ; $e4a4: f0        Suspected data
__e4a5:     .hex 02            ; $e4a5: 02        Invalid Opcode - KIL 
            BCS __e467         ; $e4a6: b0 bf     
__e4a8:     LDA $a7            ; $e4a8: a5 a7     
            CMP #$03           ; $e4aa: c9 03     
            BEQ __e450         ; $e4ac: f0 a2     
            RTS                ; $e4ae: 60        

;-------------------------------------------------------------------------------
__e4af:     LDA $58            ; $e4af: a5 58     
            AND #$07           ; $e4b1: 29 07     
            CMP #$06           ; $e4b3: c9 06     
            BCC __e4b9         ; $e4b5: 90 02     
            AND #$01           ; $e4b7: 29 01     
__e4b9:     STA $9d            ; $e4b9: 85 9d     
            RTS                ; $e4bb: 60        

;-------------------------------------------------------------------------------
__e4bc:     ORA ($02,x)        ; $e4bc: 01 02     
            .hex 64 32         ; $e4be: 64 32     Invalid Opcode - NOP $32
            .hex 03 c8         ; $e4c0: 03 c8     Invalid Opcode - SLO ($c8,x)
__e4c2:     LDA #$00           ; $e4c2: a9 00     
            STA $b5            ; $e4c4: 85 b5     
__e4c6:     RTS                ; $e4c6: 60        

;-------------------------------------------------------------------------------
__e4c7:     LDA $b2            ; $e4c7: a5 b2     
            BNE __e4c6         ; $e4c9: d0 fb     
            LDA $b5            ; $e4cb: a5 b5     
            BEQ __e4c6         ; $e4cd: f0 f7     
            BMI __e52a         ; $e4cf: 30 59     
            CMP #$0b           ; $e4d1: c9 0b     
            BCS __e4c2         ; $e4d3: b0 ed     
            STA $b4            ; $e4d5: 85 b4     
            ORA #$80           ; $e4d7: 09 80     
            STA $b5            ; $e4d9: 85 b5     
            DEC $b4            ; $e4db: c6 b4     
            LDA $b4            ; $e4dd: a5 b4     
            ASL                ; $e4df: 0a        
            ASL                ; $e4e0: 0a        
            ASL                ; $e4e1: 0a        
            TAY                ; $e4e2: a8        
            LDX #$00           ; $e4e3: a2 00     
__e4e5:     LDA __e87c,y       ; $e4e5: b9 7c e8  
            STA $bc,x          ; $e4e8: 95 bc     
            INY                ; $e4ea: c8        
            INX                ; $e4eb: e8        
            CPX #$06           ; $e4ec: e0 06     
            BNE __e4e5         ; $e4ee: d0 f5     
            LDA __e87c,y       ; $e4f0: b9 7c e8  
            STA $d3            ; $e4f3: 85 d3     
            LDA __e87d,y       ; $e4f5: b9 7d e8  
            STA $d4            ; $e4f8: 85 d4     
            LDA #$00           ; $e4fa: a9 00     
            STA $c4            ; $e4fc: 85 c4     
            STA $c5            ; $e4fe: 85 c5     
            STA $c6            ; $e500: 85 c6     
            STA $d5            ; $e502: 85 d5     
            STA $cd            ; $e504: 85 cd     
            STA $ce            ; $e506: 85 ce     
            STA $cf            ; $e508: 85 cf     
            STA $d0            ; $e50a: 85 d0     
            STA $d1            ; $e50c: 85 d1     
            STA $d2            ; $e50e: 85 d2     
            LDA #$01           ; $e510: a9 01     
            STA $b6            ; $e512: 85 b6     
            STA $b7            ; $e514: 85 b7     
            STA $b8            ; $e516: 85 b8     
            STA $b9            ; $e518: 85 b9     
            STA $ba            ; $e51a: 85 ba     
            STA $bb            ; $e51c: 85 bb     
            STA $d6            ; $e51e: 85 d6     
            STA $d7            ; $e520: 85 d7     
            STA $d8            ; $e522: 85 d8     
            LDA #$08           ; $e524: a9 08     
            STA $d9            ; $e526: 85 d9     
            STA $da            ; $e528: 85 da     
__e52a:     LDA #$02           ; $e52a: a9 02     
            STA $b3            ; $e52c: 85 b3     
__e52e:     LDX $b3            ; $e52e: a6 b3     
            DEC $b6,x          ; $e530: d6 b6     
            BEQ __e539         ; $e532: f0 05     
__e534:     DEC $b3            ; $e534: c6 b3     
            BPL __e52e         ; $e536: 10 f6     
            RTS                ; $e538: 60        

;-------------------------------------------------------------------------------
__e539:     TXA                ; $e539: 8a        
            ASL                ; $e53a: 0a        
            TAX                ; $e53b: aa        
            LDA $bc,x          ; $e53c: b5 bc     
            STA $c2            ; $e53e: 85 c2     
            LDA $bd,x          ; $e540: b5 bd     
            STA $c3            ; $e542: 85 c3     
            ORA $c2            ; $e544: 05 c2     
            BEQ __e534         ; $e546: f0 ec     
            JSR __e54e         ; $e548: 20 4e e5  
            JMP __e534         ; $e54b: 4c 34 e5  

;-------------------------------------------------------------------------------
__e54e:     LDX $b3            ; $e54e: a6 b3     
            LDY $c4,x          ; $e550: b4 c4     
            LDA ($c2),y        ; $e552: b1 c2     
            STA $b4            ; $e554: 85 b4     
            INC $c4,x          ; $e556: f6 c4     
            LDA $b4            ; $e558: a5 b4     
            BMI __e5c7         ; $e55a: 30 6b     
            LDA $b9,x          ; $e55c: b5 b9     
            STA $b6,x          ; $e55e: 95 b6     
            CPX #$02           ; $e560: e0 02     
            BEQ __e56e         ; $e562: f0 0a     
            LSR                ; $e564: 4a        
            LSR                ; $e565: 4a        
            CMP #$10           ; $e566: c9 10     
            BCC __e573         ; $e568: 90 09     
            LDA #$0f           ; $e56a: a9 0f     
            BNE __e573         ; $e56c: d0 05     
__e56e:     ASL                ; $e56e: 0a        
            BPL __e573         ; $e56f: 10 02     
            LDA #$7f           ; $e571: a9 7f     
__e573:     STA $d6,x          ; $e573: 95 d6     
            LDA $d0,x          ; $e575: b5 d0     
            BEQ __e57b         ; $e577: f0 02     
            LSR $d6,x          ; $e579: 56 d6     
__e57b:     LDY $e1,x          ; $e57b: b4 e1     
            BNE __e5c6         ; $e57d: d0 47     
            LDA $b4            ; $e57f: a5 b4     
            CMP #$00           ; $e581: c9 00     
            BEQ __e5c6         ; $e583: f0 41     
            TXA                ; $e585: 8a        
            ASL                ; $e586: 0a        
            ASL                ; $e587: 0a        
            TAY                ; $e588: a8        
            LDA $cd,x          ; $e589: b5 cd     
            BEQ __e59d         ; $e58b: f0 10     
            BPL __e593         ; $e58d: 10 04     
            INC $cd,x          ; $e58f: f6 cd     
            BEQ __e59d         ; $e591: f0 0a     
__e593:     LDA #$9f           ; $e593: a9 9f     
            CPX #$02           ; $e595: e0 02     
            BNE __e5a1         ; $e597: d0 08     
            LDA #$7f           ; $e599: a9 7f     
            BNE __e5a1         ; $e59b: d0 04     
__e59d:     LDA $d6,x          ; $e59d: b5 d6     
            ORA $d3,x          ; $e59f: 15 d3     
__e5a1:     STA $4000,y        ; $e5a1: 99 00 40  
            LDA $cd,x          ; $e5a4: b5 cd     
            CMP #$02           ; $e5a6: c9 02     
            BNE __e5ab         ; $e5a8: d0 01     
            RTS                ; $e5aa: 60        

;-------------------------------------------------------------------------------
__e5ab:     CPX #$02           ; $e5ab: e0 02     
            BCS __e5b4         ; $e5ad: b0 05     
            LDA $d9,x          ; $e5af: b5 d9     
            STA $4001,y        ; $e5b1: 99 01 40  
__e5b4:     LDA $b4            ; $e5b4: a5 b4     
            ASL                ; $e5b6: 0a        
            TAX                ; $e5b7: aa        
            LDA __e7e2,x       ; $e5b8: bd e2 e7  
            STA $4002,y        ; $e5bb: 99 02 40  
            LDA __e7e3,x       ; $e5be: bd e3 e7  
            ORA #$08           ; $e5c1: 09 08     
            STA $4003,y        ; $e5c3: 99 03 40  
__e5c6:     RTS                ; $e5c6: 60        

;-------------------------------------------------------------------------------
__e5c7:     AND #$f0           ; $e5c7: 29 f0     
            CMP #$f0           ; $e5c9: c9 f0     
            BEQ __e5d6         ; $e5cb: f0 09     
            LDA $b4            ; $e5cd: a5 b4     
            AND #$7f           ; $e5cf: 29 7f     
            STA $b9,x          ; $e5d1: 95 b9     
            JMP __e54e         ; $e5d3: 4c 4e e5  

;-------------------------------------------------------------------------------
__e5d6:     SEC                ; $e5d6: 38        
            LDA #$ff           ; $e5d7: a9 ff     
            SBC $b4            ; $e5d9: e5 b4     
            ASL                ; $e5db: 0a        
            TAY                ; $e5dc: a8        
            LDA __e5e7,y       ; $e5dd: b9 e7 e5  
            PHA                ; $e5e0: 48        
            LDA __e5e6,y       ; $e5e1: b9 e6 e5  
            PHA                ; $e5e4: 48        
            RTS                ; $e5e5: 60        

;-------------------------------------------------------------------------------
__e5e6:     .hex f5            ; $e5e6: f5        Suspected data
__e5e7:     SBC $fa            ; $e5e7: e5 fa     
            SBC $01            ; $e5e9: e5 01     
            INC $0f            ; $e5eb: e6 0f     
            INC $1a            ; $e5ed: e6 1a     
            INC $2c            ; $e5ef: e6 2c     
            INC $33            ; $e5f1: e6 33     
            INC $3a            ; $e5f3: e6 3a     
            INC $a9            ; $e5f5: e6 a9     
            BRK                ; $e5f7: 00        
            STA $b5            ; $e5f8: 85 b5     
            RTS                ; $e5fa: 60        

;-------------------------------------------------------------------------------
            LDA #$00           ; $e5fb: a9 00     
            STA $c4,x          ; $e5fd: 95 c4     
            JMP __e54e         ; $e5ff: 4c 4e e5  

;-------------------------------------------------------------------------------
            LDY $c4,x          ; $e602: b4 c4     
            LDA ($c2),y        ; $e604: b1 c2     
            STA $ca,x          ; $e606: 95 ca     
            INY                ; $e608: c8        
            STY $c4,x          ; $e609: 94 c4     
            STY $c7,x          ; $e60b: 94 c7     
            JMP __e54e         ; $e60d: 4c 4e e5  

;-------------------------------------------------------------------------------
            DEC $ca,x          ; $e610: d6 ca     
            BEQ __e618         ; $e612: f0 04     
            LDA $c7,x          ; $e614: b5 c7     
            STA $c4,x          ; $e616: 95 c4     
__e618:     JMP __e54e         ; $e618: 4c 4e e5  

;-------------------------------------------------------------------------------
            LDA $cd,x          ; $e61b: b5 cd     
            BEQ __e626         ; $e61d: f0 07     
            LDA #$02           ; $e61f: a9 02     
            STA $cd,x          ; $e621: 95 cd     
            JMP __e54e         ; $e623: 4c 4e e5  

;-------------------------------------------------------------------------------
__e626:     LDA #$01           ; $e626: a9 01     
            STA $cd,x          ; $e628: 95 cd     
            JMP __e54e         ; $e62a: 4c 4e e5  

;-------------------------------------------------------------------------------
            LDA #$ff           ; $e62d: a9 ff     
            STA $cd,x          ; $e62f: 95 cd     
            JMP __e54e         ; $e631: 4c 4e e5  

;-------------------------------------------------------------------------------
            LDA #$ff           ; $e634: a9 ff     
            STA $d0,x          ; $e636: 95 d0     
            JMP __e54e         ; $e638: 4c 4e e5  

;-------------------------------------------------------------------------------
            LDA #$00           ; $e63b: a9 00     
            STA $d0,x          ; $e63d: 95 d0     
            JMP __e54e         ; $e63f: 4c 4e e5  

;-------------------------------------------------------------------------------
__e642:     LDA #$00           ; $e642: a9 00     
            STA $4011          ; $e644: 8d 11 40  
            STA $e1            ; $e647: 85 e1     
            STA $e2            ; $e649: 85 e2     
            STA $e3            ; $e64b: 85 e3     
            STA $4000          ; $e64d: 8d 00 40  
            STA $4004          ; $e650: 8d 04 40  
            STA $4008          ; $e653: 8d 08 40  
            STA $400c          ; $e656: 8d 0c 40  
            LDA #$0f           ; $e659: a9 0f     
            STA $4015          ; $e65b: 8d 15 40  
            RTS                ; $e65e: 60        

;-------------------------------------------------------------------------------
__e65f:     LDX #$02           ; $e65f: a2 02     
__e661:     LDA $e1,x          ; $e661: b5 e1     
            BEQ __e667         ; $e663: f0 02     
            DEC $e1,x          ; $e665: d6 e1     
__e667:     DEX                ; $e667: ca        
            BPL __e661         ; $e668: 10 f7     
            LDA $df            ; $e66a: a5 df     
            BMI __e69c         ; $e66c: 30 2e     
            CMP #$07           ; $e66e: c9 07     
            BCS __e6ac         ; $e670: b0 3a     
            CMP #$03           ; $e672: c9 03     
            BCS __e681         ; $e674: b0 0b     
            LDX $e0            ; $e676: a6 e0     
            BEQ __e681         ; $e678: f0 07     
            TXA                ; $e67a: 8a        
            ORA #$80           ; $e67b: 09 80     
            STA $df            ; $e67d: 85 df     
            BNE __e69c         ; $e67f: d0 1b     
__e681:     STA $e0            ; $e681: 85 e0     
            ORA #$80           ; $e683: 09 80     
            STA $df            ; $e685: 85 df     
            LDA #$00           ; $e687: a9 00     
            STA $e1            ; $e689: 85 e1     
            STA $e2            ; $e68b: 85 e2     
            STA $e3            ; $e68d: 85 e3     
            LDA $e0            ; $e68f: a5 e0     
            ASL                ; $e691: 0a        
            TAX                ; $e692: aa        
            LDA __e6ae,x       ; $e693: bd ae e6  
            PHA                ; $e696: 48        
            LDA __e6ad,x       ; $e697: bd ad e6  
__e69a:     PHA                ; $e69a: 48        
            RTS                ; $e69b: 60        

;-------------------------------------------------------------------------------
__e69c:     LDA $e0            ; $e69c: a5 e0     
            CMP #$07           ; $e69e: c9 07     
            BCS __e6ac         ; $e6a0: b0 0a     
            ASL                ; $e6a2: 0a        
            TAX                ; $e6a3: aa        
            LDA __e6bc,x       ; $e6a4: bd bc e6  
            PHA                ; $e6a7: 48        
            LDA __e6bb,x       ; $e6a8: bd bb e6  
            PHA                ; $e6ab: 48        
__e6ac:     RTS                ; $e6ac: 60        

;-------------------------------------------------------------------------------
__e6ad:     .hex 41            ; $e6ad: 41        Suspected data
__e6ae:     INC $c8            ; $e6ae: e6 c8     
            INC $cc            ; $e6b0: e6 cc     
            INC $de            ; $e6b2: e6 de     
            INC $27            ; $e6b4: e6 27     
            .hex e7 66         ; $e6b6: e7 66     Invalid Opcode - ISC $66
            .hex e7 92         ; $e6b8: e7 92     Invalid Opcode - ISC $92
            .hex e7            ; $e6ba: e7        Suspected data
__e6bb:     .hex ab            ; $e6bb: ab        Suspected data
__e6bc:     INC $ab            ; $e6bc: e6 ab     
            INC $ab            ; $e6be: e6 ab     
            INC $0a            ; $e6c0: e6 0a     
            .hex e7 33         ; $e6c2: e7 33     Invalid Opcode - ISC $33
            .hex e7 ab         ; $e6c4: e7 ab     Invalid Opcode - ISC $ab
            INC $9e            ; $e6c6: e6 9e     
            .hex e7 a9         ; $e6c8: e7 a9     Invalid Opcode - ISC $a9
            .hex 04 d0         ; $e6ca: 04 d0     Invalid Opcode - NOP $d0
__e6cc:     .hex 02            ; $e6cc: 02        Invalid Opcode - KIL 
            LDA #$0c           ; $e6cd: a9 0c     
            STA $400e          ; $e6cf: 8d 0e 40  
            LDA #$00           ; $e6d2: a9 00     
            STA $e0            ; $e6d4: 85 e0     
            STA $400c          ; $e6d6: 8d 0c 40  
            LDA #$10           ; $e6d9: a9 10     
            STA $400f          ; $e6db: 8d 0f 40  
            RTS                ; $e6de: 60        

;-------------------------------------------------------------------------------
            LDA #$10           ; $e6df: a9 10     
            STA $e2            ; $e6e1: 85 e2     
            LDA #$01           ; $e6e3: a9 01     
            STA $400c          ; $e6e5: 8d 0c 40  
            LDA #$0f           ; $e6e8: a9 0f     
            STA $400e          ; $e6ea: 8d 0e 40  
            LDA #$10           ; $e6ed: a9 10     
            STA $400f          ; $e6ef: 8d 0f 40  
            LDA #$ff           ; $e6f2: a9 ff     
            STA $4004          ; $e6f4: 8d 04 40  
            LDA #$84           ; $e6f7: a9 84     
            STA $4005          ; $e6f9: 8d 05 40  
            LDA #$00           ; $e6fc: a9 00     
            STA $4006          ; $e6fe: 8d 06 40  
            LDA #$02           ; $e701: a9 02     
            STA $4007          ; $e703: 8d 07 40  
            LDA #$04           ; $e706: a9 04     
            STA $e4            ; $e708: 85 e4     
            RTS                ; $e70a: 60        

;-------------------------------------------------------------------------------
            DEC $e4            ; $e70b: c6 e4     
            BNE __e727         ; $e70d: d0 18     
            LDA #$df           ; $e70f: a9 df     
            STA $4004          ; $e711: 8d 04 40  
            LDA #$84           ; $e714: a9 84     
            STA $4005          ; $e716: 8d 05 40  
            LDA #$00           ; $e719: a9 00     
            STA $4006          ; $e71b: 8d 06 40  
            LDA #$81           ; $e71e: a9 81     
            STA $4007          ; $e720: 8d 07 40  
            LDA #$00           ; $e723: a9 00     
            STA $e0            ; $e725: 85 e0     
__e727:     RTS                ; $e727: 60        

;-------------------------------------------------------------------------------
            LDA #$ff           ; $e728: a9 ff     
            STA $e2            ; $e72a: 85 e2     
            LDA #$00           ; $e72c: a9 00     
            STA $e4            ; $e72e: 85 e4     
            LDA #$04           ; $e730: a9 04     
            STA $e5            ; $e732: 85 e5     
            LDA $e4            ; $e734: a5 e4     
            BNE __e760         ; $e736: d0 28     
            LDA $e5            ; $e738: a5 e5     
            BNE __e743         ; $e73a: d0 07     
            LDA #$00           ; $e73c: a9 00     
            STA $e0            ; $e73e: 85 e0     
            STA $e2            ; $e740: 85 e2     
            RTS                ; $e742: 60        

;-------------------------------------------------------------------------------
__e743:     DEC $e5            ; $e743: c6 e5     
            LDA #$84           ; $e745: a9 84     
            STA $4004          ; $e747: 8d 04 40  
            LDA #$8b           ; $e74a: a9 8b     
            STA $4005          ; $e74c: 8d 05 40  
            LDX $e5            ; $e74f: a6 e5     
            LDA __e763,x       ; $e751: bd 63 e7  
            STA $4006          ; $e754: 8d 06 40  
            LDA #$10           ; $e757: a9 10     
            STA $4007          ; $e759: 8d 07 40  
            LDA #$04           ; $e75c: a9 04     
            STA $e4            ; $e75e: 85 e4     
__e760:     DEC $e4            ; $e760: c6 e4     
            RTS                ; $e762: 60        

;-------------------------------------------------------------------------------
__e763:     ADC $87            ; $e763: 65 87     
            LDY $f0,x          ; $e765: b4 f0     
            LDA #$30           ; $e767: a9 30     
            STA $e2            ; $e769: 85 e2     
            LDA #$09           ; $e76b: a9 09     
            STA $400c          ; $e76d: 8d 0c 40  
            LDA #$07           ; $e770: a9 07     
            STA $400e          ; $e772: 8d 0e 40  
            LDA #$30           ; $e775: a9 30     
            STA $400f          ; $e777: 8d 0f 40  
            LDA #$1f           ; $e77a: a9 1f     
            STA $4004          ; $e77c: 8d 04 40  
            LDA #$8f           ; $e77f: a9 8f     
            STA $4005          ; $e781: 8d 05 40  
            LDA #$00           ; $e784: a9 00     
            STA $4006          ; $e786: 8d 06 40  
            LDA #$33           ; $e789: a9 33     
            STA $4007          ; $e78b: 8d 07 40  
            LDA #$00           ; $e78e: a9 00     
            STA $e0            ; $e790: 85 e0     
            RTS                ; $e792: 60        

;-------------------------------------------------------------------------------
            LDA #$1d           ; $e793: a9 1d     
            STA $e4            ; $e795: 85 e4     
            LDA #$ff           ; $e797: a9 ff     
            STA $e1            ; $e799: 85 e1     
            .hex 85            ; $e79b: 85        Suspected data
__e79c:     .hex e2 85         ; $e79c: e2 85     Invalid Opcode - NOP #$85
            .hex e3 c6         ; $e79e: e3 c6     Invalid Opcode - ISC ($c6,x)
            CPX $f0            ; $e7a0: e4 f0     
            ROL __e4a5         ; $e7a2: 2e a5 e4  
            AND #$03           ; $e7a5: 29 03     
            BNE __e7d0         ; $e7a7: d0 27     
            LDA $e4            ; $e7a9: a5 e4     
            LSR                ; $e7ab: 4a        
            LSR                ; $e7ac: 4a        
            AND #$01           ; $e7ad: 29 01     
            TAX                ; $e7af: aa        
            LDA __e7de,x       ; $e7b0: bd de e7  
            STA $4002          ; $e7b3: 8d 02 40  
            LDA __e7e0,x       ; $e7b6: bd e0 e7  
            STA $4006          ; $e7b9: 8d 06 40  
            LDA #$08           ; $e7bc: a9 08     
            STA $4000          ; $e7be: 8d 00 40  
            STA $4004          ; $e7c1: 8d 04 40  
            STA $4001          ; $e7c4: 8d 01 40  
            STA $4005          ; $e7c7: 8d 05 40  
            STA $4003          ; $e7ca: 8d 03 40  
            STA $4007          ; $e7cd: 8d 07 40  
__e7d0:     RTS                ; $e7d0: 60        

;-------------------------------------------------------------------------------
            LDA #$20           ; $e7d1: a9 20     
__e7d3:     STA $e1            ; $e7d3: 85 e1     
            STA $e2            ; $e7d5: 85 e2     
            STA $e3            ; $e7d7: 85 e3     
            LDA #$00           ; $e7d9: a9 00     
            STA $e0            ; $e7db: 85 e0     
            RTS                ; $e7dd: 60        

;-------------------------------------------------------------------------------
__e7de:     LDA #$a0           ; $e7de: a9 a0     
__e7e0:     ROR                ; $e7e0: 6a        
            .hex 64            ; $e7e1: 64        Suspected data
__e7e2:     BRK                ; $e7e2: 00        
__e7e3:     BRK                ; $e7e3: 00        
            BEQ __e7ed         ; $e7e4: f0 07     
            ROR $1207,x        ; $e7e6: 7e 07 12  
            .hex 07 ae         ; $e7e9: 07 ae     Invalid Opcode - SLO $ae
            ASL $4e            ; $e7eb: 06 4e     
__e7ed:     .hex 06            ; $e7ed: 06        Suspected data
__e7ee:     .hex f3 05         ; $e7ee: f3 05     Invalid Opcode - ISC ($05),y
            .hex 9f 05 4d      ; $e7f0: 9f 05 4d  Invalid Opcode - AHX $4d05,y
            ORA $01            ; $e7f3: 05 01     
            ORA $b9            ; $e7f5: 05 b9     
            .hex 04 75         ; $e7f7: 04 75     Invalid Opcode - NOP $75
            .hex 04 35         ; $e7f9: 04 35     Invalid Opcode - NOP $35
            .hex 04 f8         ; $e7fb: 04 f8     Invalid Opcode - NOP $f8
            .hex 03 bf         ; $e7fd: 03 bf     Invalid Opcode - SLO ($bf,x)
            .hex 03 89         ; $e7ff: 03 89     Invalid Opcode - SLO ($89,x)
            .hex 03 57         ; $e801: 03 57     Invalid Opcode - SLO ($57,x)
            .hex 03 27         ; $e803: 03 27     Invalid Opcode - SLO ($27,x)
            .hex 03 f9         ; $e805: 03 f9     Invalid Opcode - SLO ($f9,x)
            .hex 02            ; $e807: 02        Invalid Opcode - KIL 
            .hex cf 02 a6      ; $e808: cf 02 a6  Invalid Opcode - DCP $a602
            .hex 02            ; $e80b: 02        Invalid Opcode - KIL 
            .hex 80 02         ; $e80c: 80 02     Invalid Opcode - NOP #$02
            .hex 5c 02 3a      ; $e80e: 5c 02 3a  Invalid Opcode - NOP $3a02,x
            .hex 02            ; $e811: 02        Invalid Opcode - KIL 
            .hex 1a            ; $e812: 1a        Invalid Opcode - NOP 
            .hex 02            ; $e813: 02        Invalid Opcode - KIL 
            .hex fc 01 df      ; $e814: fc 01 df  Invalid Opcode - NOP __df01,x
            ORA ($c4,x)        ; $e817: 01 c4     
            ORA ($ab,x)        ; $e819: 01 ab     
            ORA ($93,x)        ; $e81b: 01 93     
            ORA ($7c,x)        ; $e81d: 01 7c     
            ORA ($67,x)        ; $e81f: 01 67     
            ORA ($52,x)        ; $e821: 01 52     
            ORA ($3f,x)        ; $e823: 01 3f     
            ORA ($2d,x)        ; $e825: 01 2d     
            ORA ($1c,x)        ; $e827: 01 1c     
            ORA ($0c,x)        ; $e829: 01 0c     
            ORA ($fd,x)        ; $e82b: 01 fd     
            BRK                ; $e82d: 00        
            INC __e100         ; $e82e: ee 00 e1  
            BRK                ; $e831: 00        
            .hex d4 00         ; $e832: d4 00     Invalid Opcode - NOP $00,x
            INY                ; $e834: c8        
            BRK                ; $e835: 00        
            LDA $b200,x        ; $e836: bd 00 b2  
            BRK                ; $e839: 00        
            TAY                ; $e83a: a8        
            BRK                ; $e83b: 00        
            .hex 9f 00 96      ; $e83c: 9f 00 96  Invalid Opcode - AHX $9600,y
            BRK                ; $e83f: 00        
            STA $8500          ; $e840: 8d 00 85  
            BRK                ; $e843: 00        
            ROR $7600,x        ; $e844: 7e 00 76  
            BRK                ; $e847: 00        
            BVS __e84a         ; $e848: 70 00     
__e84a:     ADC #$00           ; $e84a: 69 00     
            .hex 63 00         ; $e84c: 63 00     Invalid Opcode - RRA ($00,x)
            LSR $5800,x        ; $e84e: 5e 00 58  
            BRK                ; $e851: 00        
            .hex 53 00         ; $e852: 53 00     Invalid Opcode - SRE ($00),y
            .hex 4f 00 4a      ; $e854: 4f 00 4a  Invalid Opcode - SRE $4a00
            BRK                ; $e857: 00        
            LSR $00            ; $e858: 46 00     
            .hex 42            ; $e85a: 42        Invalid Opcode - KIL 
__e85b:     BRK                ; $e85b: 00        
            ROL $3a00,x        ; $e85c: 3e 00 3a  
            BRK                ; $e85f: 00        
            .hex 37 00         ; $e860: 37 00     Invalid Opcode - RLA $00,x
            .hex 34 00         ; $e862: 34 00     Invalid Opcode - NOP $00,x
            AND ($00),y        ; $e864: 31 00     
            ROL $2b00          ; $e866: 2e 00 2b  
            BRK                ; $e869: 00        
            AND #$00           ; $e86a: 29 00     
            .hex 27 00         ; $e86c: 27 00     Invalid Opcode - RLA $00
            BIT $00            ; $e86e: 24 00     
            .hex 22            ; $e870: 22        Invalid Opcode - KIL 
            BRK                ; $e871: 00        
            JSR $1e00          ; $e872: 20 00 1e  
            BRK                ; $e875: 00        
            .hex 1c 00 1b      ; $e876: 1c 00 1b  Invalid Opcode - NOP $1b00,x
            BRK                ; $e879: 00        
            .hex 1a            ; $e87a: 1a        Invalid Opcode - NOP 
            BRK                ; $e87b: 00        
__e87c:     .hex 17            ; $e87c: 17        Suspected data
__e87d:     .hex eb 85         ; $e87d: eb 85     Invalid Opcode - SBC #$85
            .hex eb ea         ; $e87f: eb ea     Invalid Opcode - SBC #$ea
            .hex eb 80         ; $e881: eb 80     Invalid Opcode - SBC #$80
            .hex 80 bc         ; $e883: 80 bc     Invalid Opcode - NOP #$bc
            CPX __ecdc         ; $e885: ec dc ec  
            .hex fc ec         ; $e888: fc ec     Suspected data
__e88a:     RTI                ; $e88a: 40        

;-------------------------------------------------------------------------------
            RTI                ; $e88b: 40        

;-------------------------------------------------------------------------------
            BRK                ; $e88c: 00        
            BRK                ; $e88d: 00        
            BRK                ; $e88e: 00        
            BRK                ; $e88f: 00        
            .hex 9c ed 80      ; $e890: 9c ed 80  Invalid Opcode - SHY $80ed,x
            .hex 80 4d         ; $e893: 80 4d     Invalid Opcode - NOP #$4d
            SBC __ed7b         ; $e895: ed 7b ed  
            CLC                ; $e898: 18        
            SBC $8080          ; $e899: ed 80 80  
            BVC __e88a         ; $e89c: 50 ec     
            ROR $acec,x        ; $e89e: 7e ec ac  
            CPX $8080          ; $e8a1: ec 80 80  
            .hex 27 ea         ; $e8a4: 27 ea     Invalid Opcode - RLA $ea
            .hex 63 ea         ; $e8a6: 63 ea     Invalid Opcode - RRA ($ea,x)
            .hex 9f ea 80      ; $e8a8: 9f ea 80  Invalid Opcode - AHX $80ea,y
            .hex 80 cc         ; $e8ab: 80 cc     Invalid Opcode - NOP #$cc
            INX                ; $e8ad: e8        
            .hex 1c e9 70      ; $e8ae: 1c e9 70  Invalid Opcode - NOP $70e9,x
            SBC #$40           ; $e8b1: e9 40     
            BRK                ; $e8b3: 00        
            SBC ($ea,x)        ; $e8b4: e1 ea     
            .hex ff ea 00      ; $e8b6: ff ea 00  Bad Addr Mode - ISC $00ea,x
            BRK                ; $e8b9: 00        
            .hex 80 80         ; $e8ba: 80 80     Invalid Opcode - NOP #$80
            LDX #$e9           ; $e8bc: a2 e9     
            CMP $e9,x          ; $e8be: d5 e9     
            .hex ff e9 80      ; $e8c0: ff e9 80  Invalid Opcode - ISC $80e9,x
            .hex 80 03         ; $e8c3: 80 03     Invalid Opcode - NOP #$03
            SBC #$57           ; $e8c5: e9 57     
            SBC #$88           ; $e8c7: e9 88     
            SBC #$40           ; $e8c9: e9 40     
            BRK                ; $e8cb: 00        
            BCS __e8f7         ; $e8cc: b0 29     
            TAX                ; $e8ce: aa        
            AND #$86           ; $e8cf: 29 86     
            AND #$a4           ; $e8d1: 29 a4     
            BMI __e85b         ; $e8d3: 30 86     
            BMI __e90c         ; $e8d5: 30 35     
            SBC $2e8c,y        ; $e8d7: f9 8c 2e  
            SED                ; $e8da: f8        
            TYA                ; $e8db: 98        
            AND $2d86          ; $e8dc: 2d 86 2d  
            ROL $2d8c          ; $e8df: 2e 8c 2d  
            INY                ; $e8e2: c8        
            .hex 2b 86         ; $e8e3: 2b 86     Invalid Opcode - ANC #$86
            .hex 32            ; $e8e5: 32        Invalid Opcode - KIL 
            .hex 33 8c         ; $e8e6: 33 8c     Invalid Opcode - RLA ($8c),y
            .hex 32            ; $e8e8: 32        Invalid Opcode - KIL 
            BCS __e91b         ; $e8e9: b0 30     
            STY $2600          ; $e8eb: 8c 00 26  
            PLP                ; $e8ee: 28        
            BCS __e91a         ; $e8ef: b0 29     
            TAX                ; $e8f1: aa        
            AND #$86           ; $e8f2: 29 86     
            AND #$a4           ; $e8f4: 29 a4     
            .hex 30            ; $e8f6: 30        Suspected data
__e8f7:     STX $30            ; $e8f7: 86 30     
            AND $f9,x          ; $e8f9: 35 f9     
            STY __f82e         ; $e8fb: 8c 2e f8  
            TYA                ; $e8fe: 98        
            AND $2d86          ; $e8ff: 2d 86 2d  
            ROL $2d8c          ; $e902: 2e 8c 2d  
            .hex 2b 32         ; $e905: 2b 32     Invalid Opcode - ANC #$32
            .hex 33 30         ; $e907: 33 30     Invalid Opcode - RLA ($30),y
            BRK                ; $e909: 00        
            .hex 92            ; $e90a: 92        Invalid Opcode - KIL 
            .hex 30            ; $e90b: 30        Suspected data
__e90c:     .hex 83 32         ; $e90c: 83 32     Invalid Opcode - SAX ($32,x)
            .hex 34 8c         ; $e90e: 34 8c     Invalid Opcode - NOP $8c,x
            AND $00,x          ; $e910: 35 00     
            ORA $1d86,x        ; $e912: 1d 86 1d  
            ORA $1d8c,x        ; $e915: 1d 8c 1d  
            BRK                ; $e918: 00        
            TYA                ; $e919: 98        
__e91a:     BRK                ; $e91a: 00        
__e91b:     .hex ff b0 21      ; $e91b: ff b0 21  Invalid Opcode - ISC $21b0,x
            TAX                ; $e91e: aa        
            AND ($86,x)        ; $e91f: 21 86     
__e921:     AND ($a4,x)        ; $e921: 21 a4     
            AND $2d86          ; $e923: 2d 86 2d  
            BMI __e921         ; $e926: 30 f9     
            STY __f829         ; $e928: 8c 29 f8  
            TYA                ; $e92b: 98        
            AND #$86           ; $e92c: 29 86     
            BIT $29            ; $e92e: 24 29     
            STY __c824         ; $e930: 8c 24 c8  
            .hex 27 86         ; $e933: 27 86     Invalid Opcode - RLA $86
            ROL $8c2b          ; $e935: 2e 2b 8c  
            ROL $9228          ; $e938: 2e 28 92  
            BIT $86            ; $e93b: 24 86     
            BIT $8c            ; $e93d: 24 8c     
            BIT $24            ; $e93f: 24 24     
            BIT $24            ; $e941: 24 24     
            BCS __e966         ; $e943: b0 21     
            TAX                ; $e945: aa        
            AND ($86,x)        ; $e946: 21 86     
__e948:     AND ($a4,x)        ; $e948: 21 a4     
            AND $2d86          ; $e94a: 2d 86 2d  
            BMI __e948         ; $e94d: 30 f9     
            STY __f829         ; $e94f: 8c 29 f8  
            TYA                ; $e952: 98        
            AND #$86           ; $e953: 29 86     
            BIT $29            ; $e955: 24 29     
            STY $2629          ; $e957: 8c 29 26  
            .hex 2b 2e         ; $e95a: 2b 2e     Invalid Opcode - ANC #$2e
            PLP                ; $e95c: 28        
            BRK                ; $e95d: 00        
            .hex 92            ; $e95e: 92        Invalid Opcode - KIL 
            PLP                ; $e95f: 28        
            .hex 83 29         ; $e960: 83 29     Invalid Opcode - SAX ($29,x)
            .hex 2b 8c         ; $e962: 2b 8c     Invalid Opcode - ANC #$8c
            .hex 2d 00         ; $e964: 2d 00     Suspected data
__e966:     ORA ($86),y        ; $e966: 11 86     
            ORA ($11),y        ; $e968: 11 11     
            .hex 8c 11 00      ; $e96a: 8c 11 00  Bad Addr Mode - STY $0011
            TYA                ; $e96d: 98        
            BRK                ; $e96e: 00        
            .hex ff f9 fd      ; $e96f: ff f9 fd  Invalid Opcode - ISC __fdf9,x
            .hex 02            ; $e972: 02        Invalid Opcode - KIL 
            TYA                ; $e973: 98        
            ORA $1a1c,x        ; $e974: 1d 1c 1a  
            CLC                ; $e977: 18        
            .hex fc 1b 1a      ; $e978: fc 1b 1a  Invalid Opcode - NOP $1a1b,x
            CLC                ; $e97b: 18        
            ASL $18,x          ; $e97c: 16 18     
            CLC                ; $e97e: 18        
            .hex 1a            ; $e97f: 1a        Invalid Opcode - NOP 
            .hex 1c fd 02      ; $e980: 1c fd 02  Invalid Opcode - NOP $02fd,x
            ORA $1a1c,x        ; $e983: 1d 1c 1a  
            CLC                ; $e986: 18        
            .hex fc f8 8c      ; $e987: fc f8 8c  Invalid Opcode - NOP $8cf8,x
            .hex 1f 1d 1b      ; $e98a: 1f 1d 1b  Invalid Opcode - SLO $1b1d,x
            .hex 2b 18         ; $e98d: 2b 18     Invalid Opcode - ANC #$18
            BRK                ; $e98f: 00        
            .hex 92            ; $e990: 92        Invalid Opcode - KIL 
            CLC                ; $e991: 18        
            .hex 83 18         ; $e992: 83 18     Invalid Opcode - SAX ($18,x)
            CLC                ; $e994: 18        
            .hex 8c 29 00      ; $e995: 8c 29 00  Bad Addr Mode - STY $0029
            ORA ($86),y        ; $e998: 11 86     
            ORA ($11),y        ; $e99a: 11 11     
            .hex 8c 11 00      ; $e99c: 8c 11 00  Bad Addr Mode - STY $0011
            TYA                ; $e99f: 98        
            BRK                ; $e9a0: 00        
            .hex ff 98 28      ; $e9a1: ff 98 28  Invalid Opcode - ISC $2898,x
            .hex 92            ; $e9a4: 92        Invalid Opcode - KIL 
            BIT $86            ; $e9a5: 24 86     
            BIT $98            ; $e9a7: 24 98     
            .hex 27 92         ; $e9a9: 27 92     Invalid Opcode - RLA $92
            BIT $86            ; $e9ab: 24 86     
            BIT $28            ; $e9ad: 24 28     
            AND #$2a           ; $e9af: 29 2a     
            .hex 2b f9         ; $e9b1: 2b f9     Invalid Opcode - ANC #$f9
            STY $2428          ; $e9b3: 8c 28 24  
            SED                ; $e9b6: f8        
            TYA                ; $e9b7: 98        
            .hex 22            ; $e9b8: 22        Invalid Opcode - KIL 
            AND #$28           ; $e9b9: 29 28     
            .hex 92            ; $e9bb: 92        Invalid Opcode - KIL 
            BIT $86            ; $e9bc: 24 86     
            BIT $98            ; $e9be: 24 98     
            .hex 27 92         ; $e9c0: 27 92     Invalid Opcode - RLA $92
            BIT $86            ; $e9c2: 24 86     
            BIT $8c            ; $e9c4: 24 8c     
            .hex 22            ; $e9c6: 22        Invalid Opcode - KIL 
            STY $21            ; $e9c7: 84 21     
            JSR __f91f         ; $e9c9: 20 1f f9  
            STY $2322          ; $e9cc: 8c 22 23  
            SED                ; $e9cf: f8        
            BIT $00            ; $e9d0: 24 00     
            TYA                ; $e9d2: 98        
            BRK                ; $e9d3: 00        
            .hex ff e0 00      ; $e9d4: ff e0 00  Bad Addr Mode - ISC $00e0,x
            .hex 86            ; $e9d7: 86        Suspected data
__e9d8:     .hex 1f 21 22      ; $e9d8: 1f 21 22  Invalid Opcode - SLO $2221,x
            .hex 23 f9         ; $e9db: 23 f9     Invalid Opcode - RLA ($f9,x)
            STY $1c1f          ; $e9dd: 8c 1f 1c  
            SED                ; $e9e0: f8        
            TYA                ; $e9e1: 98        
            ORA $1f22,x        ; $e9e2: 1d 22 1f  
            .hex 92            ; $e9e5: 92        Invalid Opcode - KIL 
            .hex 1c 86 1c      ; $e9e6: 1c 86 1c  Invalid Opcode - NOP $1c86,x
__e9e9:     TYA                ; $e9e9: 98        
            ASL $1b92,x        ; $e9ea: 1e 92 1b  
            STX $1e            ; $e9ed: 86 1e     
            STY $8416          ; $e9ef: 8c 16 84  
            ORA $14,x          ; $e9f2: 15 14     
            .hex 13 f9         ; $e9f4: 13 f9     Invalid Opcode - SLO ($f9),y
            STY $1716          ; $e9f6: 8c 16 17  
            SED                ; $e9f9: f8        
            CLC                ; $e9fa: 18        
            BRK                ; $e9fb: 00        
            .hex 0c 00 ff      ; $e9fc: 0c 00 ff  Invalid Opcode - NOP __ff00
            STY $1f18          ; $e9ff: 8c 18 1f  
            BRK                ; $ea02: 00        
            .hex 1f 18 1f      ; $ea03: 1f 18 1f  Invalid Opcode - SLO $1f18,x
            BRK                ; $ea06: 00        
            .hex 1f 18 1f      ; $ea07: 1f 18 1f  Invalid Opcode - SLO $1f18,x
            BRK                ; $ea0a: 00        
            .hex 1f 14 1b      ; $ea0b: 1f 14 1b  Invalid Opcode - SLO $1b14,x
            BRK                ; $ea0e: 00        
            .hex 1b 18 1f      ; $ea0f: 1b 18 1f  Invalid Opcode - SLO $1f18,y
            BRK                ; $ea12: 00        
            .hex 1f 14 1b      ; $ea13: 1f 14 1b  Invalid Opcode - SLO $1b14,x
            BRK                ; $ea16: 00        
            .hex 1b 16 84      ; $ea17: 1b 16 84  Invalid Opcode - SLO $8416,y
            ORA $14,x          ; $ea1a: 15 14     
            .hex 13 f9         ; $ea1c: 13 f9     Invalid Opcode - SLO ($f9),y
            STY $1716          ; $ea1e: 8c 16 17  
            SED                ; $ea21: f8        
            CLC                ; $ea22: 18        
            BRK                ; $ea23: 00        
            .hex 0c 00 ff      ; $ea24: 0c 00 ff  Invalid Opcode - NOP __ff00
            STY $00,x          ; $ea27: 94 00     
            STA $2c            ; $ea29: 85 2c     
            BIT $3333          ; $ea2b: 2c 33 33  
            TXA                ; $ea2e: 8a        
            .hex 33 00         ; $ea2f: 33 00     Invalid Opcode - RLA ($00),y
            STA $2c            ; $ea31: 85 2c     
            BIT $3333          ; $ea33: 2c 33 33  
            .hex 32            ; $ea36: 32        Invalid Opcode - KIL 
            .hex 32            ; $ea37: 32        Invalid Opcode - KIL 
            BMI __ea6a         ; $ea38: 30 30     
            ROL $292e          ; $ea3a: 2e 2e 29  
            AND #$26           ; $ea3d: 29 26     
            ROL $24            ; $ea3f: 26 24     
            BIT $94            ; $ea41: 24 94     
            .hex 22            ; $ea43: 22        Invalid Opcode - KIL 
            BRK                ; $ea44: 00        
            STA $31            ; $ea45: 85 31     
            AND ($36),y        ; $ea47: 31 36     
            ROL $8a,x          ; $ea49: 36 8a     
            ROL $00,x          ; $ea4b: 36 00     
            STA $31            ; $ea4d: 85 31     
            AND ($3a),y        ; $ea4f: 31 3a     
            .hex 3a            ; $ea51: 3a        Invalid Opcode - NOP 
            .hex 37 37         ; $ea52: 37 37     Invalid Opcode - RLA $37,x
            AND $35,x          ; $ea54: 35 35     
            .hex 33 33         ; $ea56: 33 33     Invalid Opcode - RLA ($33),y
            AND ($31),y        ; $ea58: 31 31     
            BMI __ea8c         ; $ea5a: 30 30     
            ROL $2c2e          ; $ea5c: 2e 2e 2c  
            BIT $2b2b          ; $ea5f: 2c 2b 2b  
            .hex fe 94 00      ; $ea62: fe 94 00  Bad Addr Mode - INC $0094,x
            STA $24            ; $ea65: 85 24     
            BIT $30            ; $ea67: 24 30     
            .hex 30            ; $ea69: 30        Suspected data
__ea6a:     TXA                ; $ea6a: 8a        
            BMI __ea6d         ; $ea6b: 30 00     
__ea6d:     STA $24            ; $ea6d: 85 24     
            BIT $30            ; $ea6f: 24 30     
            BMI __eaa1         ; $ea71: 30 2e     
            ROL $2d2d          ; $ea73: 2e 2d 2d  
            AND #$29           ; $ea76: 29 29     
            ROL $26            ; $ea78: 26 26     
            .hex 22            ; $ea7a: 22        Invalid Opcode - KIL 
            .hex 22            ; $ea7b: 22        Invalid Opcode - KIL 
            ORA $941d,x        ; $ea7c: 1d 1d 94  
            .hex 1a            ; $ea7f: 1a        Invalid Opcode - NOP 
            BRK                ; $ea80: 00        
            STA $2e            ; $ea81: 85 2e     
            ROL $3131          ; $ea83: 2e 31 31  
            TXA                ; $ea86: 8a        
            AND ($00),y        ; $ea87: 31 00     
            STA $2e            ; $ea89: 85 2e     
            .hex 2e            ; $ea8b: 2e        Suspected data
__ea8c:     AND ($31),y        ; $ea8c: 31 31     
            .hex 33 33         ; $ea8e: 33 33     Invalid Opcode - RLA ($33),y
            AND ($31),y        ; $ea90: 31 31     
            BMI __eac4         ; $ea92: 30 30     
            ROL $2c2e          ; $ea94: 2e 2e 2c  
            BIT $2b2b          ; $ea97: 2c 2b 2b  
            BIT $24            ; $ea9a: 24 24     
            .hex 22            ; $ea9c: 22        Invalid Opcode - KIL 
            .hex 22            ; $ea9d: 22        Invalid Opcode - KIL 
            INC $1485,x        ; $ea9e: fe 85 14  
__eaa1:     .hex 14 20         ; $eaa1: 14 20     Invalid Opcode - NOP $20,x
            JSR $2c2c          ; $eaa3: 20 2c 2c  
            JSR $1420          ; $eaa6: 20 20 14  
            .hex 14 20         ; $eaa9: 14 20     Invalid Opcode - NOP $20,x
            JSR $2c2c          ; $eaab: 20 2c 2c  
            JSR $1620          ; $eaae: 20 20 16  
            ASL $22,x          ; $eab1: 16 22     
            .hex 22            ; $eab3: 22        Invalid Opcode - KIL 
            ROL $222e          ; $eab4: 2e 2e 22  
            .hex 22            ; $eab7: 22        Invalid Opcode - KIL 
            ASL $16,x          ; $eab8: 16 16     
            .hex 22            ; $eaba: 22        Invalid Opcode - KIL 
            .hex 22            ; $eabb: 22        Invalid Opcode - KIL 
            ASL $16,x          ; $eabc: 16 16     
            .hex 22            ; $eabe: 22        Invalid Opcode - KIL 
            .hex 22            ; $eabf: 22        Invalid Opcode - KIL 
            .hex 12            ; $eac0: 12        Invalid Opcode - KIL 
            .hex 12            ; $eac1: 12        Invalid Opcode - KIL 
            .hex 1e 1e         ; $eac2: 1e 1e     Suspected data
__eac4:     ROL                ; $eac4: 2a        
            ROL                ; $eac5: 2a        
            ASL $121e,x        ; $eac6: 1e 1e 12  
            .hex 12            ; $eac9: 12        Invalid Opcode - KIL 
            ASL $2a1e,x        ; $eaca: 1e 1e 2a  
            ROL                ; $eacd: 2a        
            ASL $0f1e,x        ; $eace: 1e 1e 0f  
            .hex 0f 1b 1b      ; $ead1: 0f 1b 1b  Invalid Opcode - SLO $1b1b
            .hex 27 27         ; $ead4: 27 27     Invalid Opcode - RLA $27
            .hex 1b 1b 0f      ; $ead6: 1b 1b 0f  Invalid Opcode - SLO $0f1b,y
            .hex 0f 1b 1b      ; $ead9: 0f 1b 1b  Invalid Opcode - SLO $1b1b
            .hex 27 27         ; $eadc: 27 27     Invalid Opcode - RLA $27
            AND $25            ; $eade: 25 25     
            INC $3083,x        ; $eae0: fe 83 30  
            .hex 2b 24         ; $eae3: 2b 24     Invalid Opcode - ANC #$24
            .hex 1f 18 13      ; $eae5: 1f 18 13  Invalid Opcode - SLO $1318,x
            .hex 0c 07 18      ; $eae8: 0c 07 18  Invalid Opcode - NOP $1807
            .hex 17 16         ; $eaeb: 17 16     Invalid Opcode - SLO $16,x
            ORA $14,x          ; $eaed: 15 14     
            ORA $16,x          ; $eaef: 15 16     
            .hex 17 92         ; $eaf1: 17 92     Invalid Opcode - SLO $92,x
            CLC                ; $eaf3: 18        
            STX $18            ; $eaf4: 86 18     
            SBC $1b8c,y        ; $eaf6: f9 8c 1b  
            .hex 1b f8 98      ; $eaf9: 1b f8 98  Invalid Opcode - SLO $98f8,y
            CLC                ; $eafc: 18        
            BRK                ; $eafd: 00        
            .hex ff            ; $eafe: ff        Suspected data
__eaff:     TYA                ; $eaff: 98        
            BRK                ; $eb00: 00        
            .hex 83 0c         ; $eb01: 83 0c     Invalid Opcode - SAX ($0c,x)
            .hex 0b 0a         ; $eb03: 0b 0a     Invalid Opcode - ANC #$0a
            ORA #$08           ; $eb05: 09 08     
            ORA #$0a           ; $eb07: 09 0a     
            .hex 0b 92         ; $eb09: 0b 92     Invalid Opcode - ANC #$92
            .hex 0c 86 0c      ; $eb0b: 0c 86 0c  Invalid Opcode - NOP $0c86
            SBC $0f8c,y        ; $eb0e: f9 8c 0f  
            .hex 0f f8 98      ; $eb11: 0f f8 98  Invalid Opcode - SLO $98f8
            .hex 0c 00 ff      ; $eb14: 0c 00 ff  Invalid Opcode - NOP __ff00
            .hex 87 27         ; $eb17: 87 27     Invalid Opcode - SAX $27
            .hex 33 3f         ; $eb19: 33 3f     Invalid Opcode - RLA ($3f),y
            .hex 33 36         ; $eb1b: 33 36     Invalid Opcode - RLA ($36),y
            .hex 37 33         ; $eb1d: 37 33     Invalid Opcode - RLA $33,x
            AND ($27),y        ; $eb1f: 31 27     
            .hex 33 3f         ; $eb21: 33 3f     Invalid Opcode - RLA ($3f),y
            .hex 33 36         ; $eb23: 33 36     Invalid Opcode - RLA ($36),y
            .hex 37 33         ; $eb25: 37 33     Invalid Opcode - RLA $33,x
            AND ($16),y        ; $eb27: 31 16     
            ASL $f9,x          ; $eb29: 16 f9     
            STX __f816         ; $eb2b: 8e 16 f8  
            .hex 87 22         ; $eb2e: 87 22     Invalid Opcode - SAX $22
            .hex 22            ; $eb30: 22        Invalid Opcode - KIL 
            SBC $2e8e,y        ; $eb31: f9 8e 2e  
            ORA __f80f         ; $eb34: 0d 0f f8  
            .hex 87 38         ; $eb37: 87 38     Invalid Opcode - SAX $38
            ROL $3833          ; $eb39: 2e 33 38  
            SBC __f903,x       ; $eb3c: fd 03 f9  
            STX $3337          ; $eb3f: 8e 37 33  
            .hex 32            ; $eb42: 32        Invalid Opcode - KIL 
            .hex 33 f8         ; $eb43: 33 f8     Invalid Opcode - RLA ($f8),y
            .hex 9c 2e 87      ; $eb45: 9c 2e 87  Invalid Opcode - SHY $872e,x
            BIT $2a2e          ; $eb48: 2c 2e 2a  
            .hex 2b 8e         ; $eb4b: 2b 8e     Invalid Opcode - ANC #$8e
            BRK                ; $eb4d: 00        
            .hex 3a            ; $eb4e: 3a        Invalid Opcode - NOP 
            BRK                ; $eb4f: 00        
            .hex 3a            ; $eb50: 3a        Invalid Opcode - NOP 
            .hex 87 33         ; $eb51: 87 33     Invalid Opcode - SAX $33
            .hex 33 f9         ; $eb53: 33 f9     Invalid Opcode - RLA ($f9),y
            STX __f833         ; $eb55: 8e 33 f8  
            .hex 87 38         ; $eb58: 87 38     Invalid Opcode - SAX $38
            ROL $3833          ; $eb5a: 2e 33 38  
            .hex fc f9 8e      ; $eb5d: fc f9 8e  Invalid Opcode - NOP $8ef9,x
            .hex 37 f8         ; $eb60: 37 f8     Invalid Opcode - RLA $f8,x
            .hex 87 32         ; $eb62: 87 32     Invalid Opcode - SAX $32
            .hex 33 2c         ; $eb64: 33 2c     Invalid Opcode - RLA ($2c),y
            ROL $8ef9          ; $eb66: 2e f9 8e  
            .hex 2b f8         ; $eb69: 2b f8     Invalid Opcode - ANC #$f8
            .hex 87 2c         ; $eb6b: 87 2c     Invalid Opcode - SAX $2c
            BIT $8ef9          ; $eb6d: 2c f9 8e  
            BIT $87f8          ; $eb70: 2c f8 87  
            .hex 2b 2b         ; $eb73: 2b 2b     Invalid Opcode - ANC #$2b
            SBC $2b8e,y        ; $eb75: f9 8e 2b  
            .hex 27 27         ; $eb78: 27 27     Invalid Opcode - RLA $27
            BRK                ; $eb7a: 00        
            SED                ; $eb7b: f8        
            .hex 87 25         ; $eb7c: 87 25     Invalid Opcode - SAX $25
            ROL $8e            ; $eb7e: 26 8e     
            .hex 27 00         ; $eb80: 27 00     Invalid Opcode - RLA $00
            .hex 9c 00 ff      ; $eb82: 9c 00 ff  Invalid Opcode - SHY __ff00,x
            .hex 87 1b         ; $eb85: 87 1b     Invalid Opcode - SAX $1b
            .hex 27 33         ; $eb87: 27 33     Invalid Opcode - RLA $33
            .hex 27 2a         ; $eb89: 27 2a     Invalid Opcode - RLA $2a
            .hex 2b 27         ; $eb8b: 2b 27     Invalid Opcode - ANC #$27
            AND $1b            ; $eb8d: 25 1b     
            .hex 27 33         ; $eb8f: 27 33     Invalid Opcode - RLA $33
            .hex 27 2a         ; $eb91: 27 2a     Invalid Opcode - RLA $2a
            .hex 2b 27         ; $eb93: 2b 27     Invalid Opcode - ANC #$27
            AND $13            ; $eb95: 25 13     
            .hex 13 f9         ; $eb97: 13 f9     Invalid Opcode - SLO ($f9),y
            STX __f813         ; $eb99: 8e 13 f8  
            .hex 87 1f         ; $eb9c: 87 1f     Invalid Opcode - SAX $1f
            .hex 1f f9 8e      ; $eb9e: 1f f9 8e  Invalid Opcode - SLO $8ef9,x
            .hex 2b 01         ; $eba1: 2b 01     Invalid Opcode - ANC #$01
            .hex 02            ; $eba3: 02        Invalid Opcode - KIL 
            SED                ; $eba4: f8        
            .hex 87 2c         ; $eba5: 87 2c     Invalid Opcode - SAX $2c
            .hex 22            ; $eba7: 22        Invalid Opcode - KIL 
            .hex 27 2c         ; $eba8: 27 2c     Invalid Opcode - RLA $2c
            SBC __f903,x       ; $ebaa: fd 03 f9  
            STX $2e31          ; $ebad: 8e 31 2e  
            ROL                ; $ebb0: 2a        
            .hex 2b f8         ; $ebb1: 2b f8     Invalid Opcode - ANC #$f8
            .hex 9c 25 00      ; $ebb3: 9c 25 00  Bad Addr Mode - SHY $0025,x
            STX $2227          ; $ebb6: 8e 27 22  
            AND $2c            ; $ebb9: 25 2c     
            .hex 9c 2b 87      ; $ebbb: 9c 2b 87  Invalid Opcode - SHY $872b,x
            AND $22,x          ; $ebbe: 35 22     
            BMI __ebf5         ; $ebc0: 30 33     
            .hex fc f9 8e      ; $ebc2: fc f9 8e  Invalid Opcode - NOP $8ef9,x
            .hex 33 f8         ; $ebc5: 33 f8     Invalid Opcode - RLA ($f8),y
            .hex 87 2a         ; $ebc7: 87 2a     Invalid Opcode - SAX $2a
            .hex 2b 26         ; $ebc9: 2b 26     Invalid Opcode - ANC #$26
            .hex 27 f9         ; $ebcb: 27 f9     Invalid Opcode - RLA $f9
            STX __f822         ; $ebcd: 8e 22 f8  
            .hex 87 27         ; $ebd0: 87 27     Invalid Opcode - SAX $27
            .hex 27 f9         ; $ebd2: 27 f9     Invalid Opcode - RLA $f9
            .hex 8e 27         ; $ebd4: 8e 27     Suspected data
__ebd6:     SED                ; $ebd6: f8        
            .hex 87 27         ; $ebd7: 87 27     Invalid Opcode - SAX $27
            .hex 27 f9         ; $ebd9: 27 f9     Invalid Opcode - RLA $f9
            STX $1f27          ; $ebdb: 8e 27 1f  
            .hex 1f 00 f8      ; $ebde: 1f 00 f8  Invalid Opcode - SLO __f800,x
            .hex 87 19         ; $ebe1: 87 19     Invalid Opcode - SAX $19
            .hex 1a            ; $ebe3: 1a        Invalid Opcode - NOP 
            .hex 8e 1b 00      ; $ebe4: 8e 1b 00  Bad Addr Mode - STX $001b
            .hex 9c 00 ff      ; $ebe7: 9c 00 ff  Invalid Opcode - SHY __ff00,x
            .hex 87 1b         ; $ebea: 87 1b     Invalid Opcode - SAX $1b
            .hex 1b 1b 1b      ; $ebec: 1b 1b 1b  Invalid Opcode - SLO $1b1b,y
            .hex 9c 00 87      ; $ebef: 9c 00 87  Invalid Opcode - SHY $8700,x
            .hex 1b 1b 1b      ; $ebf2: 1b 1b 1b  Invalid Opcode - SLO $1b1b,y
__ebf5:     .hex 1b 9c 00      ; $ebf5: 1b 9c 00  Invalid Opcode - SLO $009c,y
            .hex 87 19         ; $ebf8: 87 19     Invalid Opcode - SAX $19
            .hex 19            ; $ebfa: 19        Suspected data
__ebfb:     SBC $198e,y        ; $ebfb: f9 8e 19  
            SED                ; $ebfe: f8        
            .hex 87 25         ; $ebff: 87 25     Invalid Opcode - SAX $25
            AND $f9            ; $ec01: 25 f9     
            STX __f832         ; $ec03: 8e 32 f8  
            CLV                ; $ec06: b8        
            BRK                ; $ec07: 00        
            SBC $8703,x        ; $ec08: fd 03 87  
            .hex 1b 1b f9      ; $ec0b: 1b 1b f9  Invalid Opcode - SLO __f91b,y
            STX $1e1b          ; $ec0e: 8e 1b 1e  
            SED                ; $ec11: f8        
            .hex 87 1f         ; $ec12: 87 1f     Invalid Opcode - SAX $1f
            .hex 22            ; $ec14: 22        Invalid Opcode - KIL 
            .hex 27 1b         ; $ec15: 27 1b     Invalid Opcode - RLA $1b
            .hex 1b 1b 1e      ; $ec17: 1b 1b 1e  Invalid Opcode - SLO $1e1b,y
            SBC $1f8e,y        ; $ec1a: f9 8e 1f  
            SED                ; $ec1d: f8        
            .hex 87 18         ; $ec1e: 87 18     Invalid Opcode - SAX $18
            ORA $1919,y        ; $ec20: 19 19 19  
            AND $18            ; $ec23: 25 18     
            .hex 1a            ; $ec25: 1a        Invalid Opcode - NOP 
            STX $8716          ; $ec26: 8e 16 87  
            AND $19            ; $ec29: 25 19     
            ORA $9c19,y        ; $ec2b: 19 19 9c  
            BRK                ; $ec2e: 00        
            .hex fc f9 8e      ; $ec2f: fc f9 8e  Invalid Opcode - NOP $8ef9,x
            ROL $87f8          ; $ec32: 2e f8 87  
            AND $2a2e          ; $ec35: 2d 2e 2a  
            .hex 2b 27         ; $ec38: 2b 27     Invalid Opcode - ANC #$27
            .hex 22            ; $ec3a: 22        Invalid Opcode - KIL 
            .hex 9c 00 87      ; $ec3b: 9c 00 87  Invalid Opcode - SHY $8700,x
            .hex 23 23         ; $ec3e: 23 23     Invalid Opcode - RLA ($23,x)
            SBC $238e,y        ; $ec40: f9 8e 23  
            .hex 22            ; $ec43: 22        Invalid Opcode - KIL 
            .hex 22            ; $ec44: 22        Invalid Opcode - KIL 
            SED                ; $ec45: f8        
            BRK                ; $ec46: 00        
            .hex 87 19         ; $ec47: 87 19     Invalid Opcode - SAX $19
            .hex 1a            ; $ec49: 1a        Invalid Opcode - NOP 
            .hex 8e 1b 00      ; $ec4a: 8e 1b 00  Bad Addr Mode - STX $001b
            .hex 9c 00 ff      ; $ec4d: 9c 00 ff  Invalid Opcode - SHY __ff00,x
            SBC $9002,x        ; $ec50: fd 02 90  
            AND $88            ; $ec53: 25 88     
            .hex 27 29         ; $ec55: 27 29     Invalid Opcode - RLA $29
            BRK                ; $ec57: 00        
            AND #$2b           ; $ec58: 29 2b     
            BRK                ; $ec5a: 00        
            .hex fc c0 00      ; $ec5b: fc c0 00  Bad Addr Mode - NOP $00c0,x
            DEY                ; $ec5e: 88        
            .hex 22            ; $ec5f: 22        Invalid Opcode - KIL 
            ORA $2022,y        ; $ec60: 19 22 20  
            .hex 1f 19 1f      ; $ec63: 1f 19 1f  Invalid Opcode - SLO $1f19,x
            JSR $02fd          ; $ec66: 20 fd 02  
            .hex 27 29         ; $ec69: 27 29     Invalid Opcode - RLA $29
            .hex 27 2a         ; $ec6b: 27 2a     Invalid Opcode - RLA $2a
            BRK                ; $ec6d: 00        
            AND #$27           ; $ec6e: 29 27     
            BRK                ; $ec70: 00        
            .hex fc c0 00      ; $ec71: fc c0 00  Bad Addr Mode - NOP $00c0,x
            DEY                ; $ec74: 88        
            JSR $2017          ; $ec75: 20 17 20  
            ASL $171d,x        ; $ec78: 1e 1d 17  
            ORA __fe1f,x       ; $ec7b: 1d 1f fe  
            SBC $9002,x        ; $ec7e: fd 02 90  
            .hex 22            ; $ec81: 22        Invalid Opcode - KIL 
            DEY                ; $ec82: 88        
            BIT $26            ; $ec83: 24 26     
            BRK                ; $ec85: 00        
            ROL $27            ; $ec86: 26 27     
            BRK                ; $ec88: 00        
            .hex fc fd 02      ; $ec89: fc fd 02  Invalid Opcode - NOP $02fd,x
            .hex 1b 13 1b      ; $ec8c: 1b 13 1b  Invalid Opcode - SLO $1b13,y
            ORA $1318,y        ; $ec8f: 19 18 13  
            CLC                ; $ec92: 18        
            ORA __fdfc,y       ; $ec93: 19 fc fd  
            .hex 02            ; $ec96: 02        Invalid Opcode - KIL 
            .hex 23 25         ; $ec97: 23 25     Invalid Opcode - RLA ($25,x)
            .hex 23 27         ; $ec99: 23 27     Invalid Opcode - RLA ($27,x)
            BRK                ; $ec9b: 00        
            AND $23            ; $ec9c: 25 23     
            BRK                ; $ec9e: 00        
            .hex fc fd 02      ; $ec9f: fc fd 02  Invalid Opcode - NOP $02fd,x
            ORA $1911,y        ; $eca2: 19 11 19  
            .hex 17 16         ; $eca5: 17 16     Invalid Opcode - SLO $16,x
            ORA ($16),y        ; $eca7: 11 16     
            ORA __fefc,y       ; $eca9: 19 fc fe  
            SBC $9004,x        ; $ecac: fd 04 90  
            .hex 1b 1b 1b      ; $ecaf: 1b 1b 1b  Invalid Opcode - SLO $1b1b,y
            .hex 1b fc fd      ; $ecb2: 1b fc fd  Invalid Opcode - SLO __fdfc,y
            .hex 04 19         ; $ecb5: 04 19     Invalid Opcode - NOP $19
            ORA $1919,y        ; $ecb7: 19 19 19  
            .hex fc fe 85      ; $ecba: fc fe 85  Invalid Opcode - NOP $85fe,x
            .hex 33 00         ; $ecbd: 33 00     Invalid Opcode - RLA ($00),y
            .hex 32            ; $ecbf: 32        Invalid Opcode - KIL 
            .hex 33 32         ; $ecc0: 33 32     Invalid Opcode - RLA ($32),y
            .hex 33 32         ; $ecc2: 33 32     Invalid Opcode - RLA ($32),y
            .hex 33 2e         ; $ecc4: 33 2e     Invalid Opcode - RLA ($2e),y
            BRK                ; $ecc6: 00        
            AND $2d2e          ; $ecc7: 2d 2e 2d  
            ROL $2e2d          ; $ecca: 2e 2d 2e  
            .hex 2b 2c         ; $eccd: 2b 2c     Invalid Opcode - ANC #$2c
            AND $2b2e          ; $eccf: 2d 2e 2b  
            BIT $2e2d          ; $ecd2: 2c 2d 2e  
            .hex 2b 00         ; $ecd5: 2b 00     Invalid Opcode - ANC #$00
            .hex 27 00         ; $ecd7: 27 00     Invalid Opcode - RLA $00
            STY $25,x          ; $ecd9: 94 25     
            .hex ff            ; $ecdb: ff        Suspected data
__ecdc:     STA $2b            ; $ecdc: 85 2b     
            BRK                ; $ecde: 00        
            ROL                ; $ecdf: 2a        
            .hex 2b 2a         ; $ece0: 2b 2a     Invalid Opcode - ANC #$2a
            .hex 2b 2a         ; $ece2: 2b 2a     Invalid Opcode - ANC #$2a
            .hex 2b 27         ; $ece4: 2b 27     Invalid Opcode - ANC #$27
            BRK                ; $ece6: 00        
            ROL $27            ; $ece7: 26 27     
            ROL $27            ; $ece9: 26 27     
            ROL $27            ; $eceb: 26 27     
            .hex 27 29         ; $eced: 27 29     Invalid Opcode - RLA $29
            ROL                ; $ecef: 2a        
            .hex 2b 27         ; $ecf0: 2b 27     Invalid Opcode - ANC #$27
            AND #$2a           ; $ecf2: 29 2a     
            .hex 2b 27         ; $ecf4: 2b 27     Invalid Opcode - ANC #$27
            BRK                ; $ecf6: 00        
            .hex 1f 00 94      ; $ecf7: 1f 00 94  Invalid Opcode - SLO $9400,x
            .hex 22            ; $ecfa: 22        Invalid Opcode - KIL 
            .hex ff f9 8a      ; $ecfb: ff f9 8a  Invalid Opcode - ISC $8af9,x
            .hex 1b 1b 1f      ; $ecfe: 1b 1b 1f  Invalid Opcode - SLO $1f1b,y
            .hex 22            ; $ed01: 22        Invalid Opcode - KIL 
            .hex 1b 1b 1f      ; $ed02: 1b 1b 1f  Invalid Opcode - SLO $1f1b,y
            .hex 22            ; $ed05: 22        Invalid Opcode - KIL 
            SED                ; $ed06: f8        
            STA $22            ; $ed07: 85 22     
            BIT $26            ; $ed09: 24 26     
            .hex 27 22         ; $ed0b: 27 22     Invalid Opcode - RLA $22
            BIT $26            ; $ed0d: 24 26     
            .hex 27 f9         ; $ed0f: 27 f9     Invalid Opcode - RLA $f9
            TXA                ; $ed11: 8a        
            .hex 22            ; $ed12: 22        Invalid Opcode - KIL 
            .hex 1b f8 94      ; $ed13: 1b f8 94  Invalid Opcode - SLO $94f8,y
            ASL $ff,x          ; $ed16: 16 ff     
            SBC $8702,x        ; $ed18: fd 02 87  
            .hex 27 27         ; $ed1b: 27 27     Invalid Opcode - RLA $27
            SBC $308e,y        ; $ed1d: f9 8e 30  
            AND ($f8),y        ; $ed20: 31 f8     
            .hex 87 22         ; $ed22: 87 22     Invalid Opcode - SAX $22
            .hex 22            ; $ed24: 22        Invalid Opcode - KIL 
            .hex f9 8e         ; $ed25: f9 8e     Suspected data
__ed27:     ROL __f830         ; $ed27: 2e 30 f8  
            .hex 87 31         ; $ed2a: 87 31     Invalid Opcode - SAX $31
            BMI __ed27         ; $ed2c: 30 f9     
            STX __f82e         ; $ed2e: 8e 2e f8  
            .hex fc fd 02      ; $ed31: fc fd 02  Invalid Opcode - NOP $02fd,x
            .hex 87 25         ; $ed34: 87 25     Invalid Opcode - SAX $25
            AND $f9            ; $ed36: 25 f9     
            STX $2f2e          ; $ed38: 8e 2e 2f  
            SED                ; $ed3b: f8        
            .hex 87 20         ; $ed3c: 87 20     Invalid Opcode - SAX $20
            JSR $8ef9          ; $ed3e: 20 f9 8e  
            BIT __f82e         ; $ed41: 2c 2e f8  
            .hex 87 2f         ; $ed44: 87 2f     Invalid Opcode - SAX $2f
            ROL $8ef9          ; $ed46: 2e f9 8e  
            BIT __fcf8         ; $ed49: 2c f8 fc  
            .hex fe 9c 00      ; $ed4c: fe 9c 00  Bad Addr Mode - INC $009c,x
            .hex 87 25         ; $ed4f: 87 25     Invalid Opcode - SAX $25
            STA $00,x          ; $ed51: 95 00     
            CLV                ; $ed53: b8        
            BRK                ; $ed54: 00        
            .hex 9c 00 95      ; $ed55: 9c 00 95  Invalid Opcode - SHY $9500,x
            .hex 27 87         ; $ed58: 27 87     Invalid Opcode - RLA $87
            .hex 27 f9         ; $ed5a: 27 f9     Invalid Opcode - RLA $f9
            STX $2b2c          ; $ed5c: 8e 2c 2b  
            SED                ; $ed5f: f8        
            .hex 27 00         ; $ed60: 27 00     Invalid Opcode - RLA $00
            .hex 9c 00 87      ; $ed62: 9c 00 87  Invalid Opcode - SHY $8700,x
            .hex 23 95         ; $ed65: 23 95     Invalid Opcode - RLA ($95,x)
            BRK                ; $ed67: 00        
            CLV                ; $ed68: b8        
            BRK                ; $ed69: 00        
            .hex 9c 00 95      ; $ed6a: 9c 00 95  Invalid Opcode - SHY $9500,x
            AND $87            ; $ed6d: 25 87     
            AND $f9            ; $ed6f: 25 f9     
            STX __f82a         ; $ed71: 8e 2a f8  
            .hex 87 29         ; $ed74: 87 29     Invalid Opcode - SAX $29
            ROL                ; $ed76: 2a        
            .hex 8e 25 00      ; $ed77: 8e 25 00  Bad Addr Mode - STX $0025
            .hex fe            ; $ed7a: fe        Suspected data
__ed7b:     .hex 9c 00 87      ; $ed7b: 9c 00 87  Invalid Opcode - SHY $8700,x
            .hex 1d 95 00      ; $ed7e: 1d 95 00  Bad Addr Mode - ORA $0095,x
            CLV                ; $ed81: b8        
            BRK                ; $ed82: 00        
            .hex 9c 00 87      ; $ed83: 9c 00 87  Invalid Opcode - SHY $8700,x
            .hex 1d 95 00      ; $ed86: 1d 95 00  Bad Addr Mode - ORA $0095,x
            CLV                ; $ed89: b8        
            BRK                ; $ed8a: 00        
            .hex 9c 00 87      ; $ed8b: 9c 00 87  Invalid Opcode - SHY $8700,x
            .hex 1b 95 00      ; $ed8e: 1b 95 00  Invalid Opcode - SLO $0095,y
            CLV                ; $ed91: b8        
            BRK                ; $ed92: 00        
            .hex 9c 00 87      ; $ed93: 9c 00 87  Invalid Opcode - SHY $8700,x
            .hex 1b 95 00      ; $ed96: 1b 95 00  Invalid Opcode - SLO $0095,y
            CLV                ; $ed99: b8        
            BRK                ; $ed9a: 00        
            INC $2787,x        ; $ed9b: fe 87 27  
            .hex 27 33         ; $ed9e: 27 33     Invalid Opcode - RLA $33
            .hex 27 f9         ; $eda0: 27 f9     Invalid Opcode - RLA $f9
__eda2:     STX __f82a         ; $eda2: 8e 2a f8  
            .hex 87 2e         ; $eda5: 87 2e     Invalid Opcode - SAX $2e
            BMI __eda2         ; $eda7: 30 f9     
            STX $3131          ; $eda9: 8e 31 31  
            SED                ; $edac: f8        
            BMI __edaf         ; $edad: 30 00     
__edaf:     .hex 87 25         ; $edaf: 87 25     Invalid Opcode - SAX $25
            AND $31            ; $edb1: 25 31     
            AND $f9            ; $edb3: 25 f9     
            STX __f829         ; $edb5: 8e 29 f8  
            .hex 87 2c         ; $edb8: 87 2c     Invalid Opcode - SAX $2c
            ROL $8ef9          ; $edba: 2e f9 8e  
            .hex 2f f8 87      ; $edbd: 2f f8 87  Invalid Opcode - RLA $87f8
            ROL $252f          ; $edc0: 2e 2f 25  
            BIT $f9            ; $edc3: 24 f9     
            STX __f825         ; $edc5: 8e 25 f8  
            .hex 87 22         ; $edc8: 87 22     Invalid Opcode - SAX $22
            .hex 22            ; $edca: 22        Invalid Opcode - KIL 
            ROL __f922         ; $edcb: 2e 22 f9  
            STX __f82c         ; $edce: 8e 2c f8  
            .hex 87 2b         ; $edd1: 87 2b     Invalid Opcode - SAX $2b
            BIT $8ef9          ; $edd3: 2c f9 8e  
            .hex 22            ; $edd6: 22        Invalid Opcode - KIL 
            ROL $22f8          ; $edd7: 2e f8 22  
            BRK                ; $edda: 00        
            .hex 87 22         ; $eddb: 87 22     Invalid Opcode - SAX $22
            .hex 22            ; $eddd: 22        Invalid Opcode - KIL 
            ROL __f922         ; $edde: 2e 22 f9  
            STX __f82c         ; $ede1: 8e 2c f8  
            .hex 87 2b         ; $ede4: 87 2b     Invalid Opcode - SAX $2b
            BIT $8ef9          ; $ede6: 2c f9 8e  
            .hex 22            ; $ede9: 22        Invalid Opcode - KIL 
            ROL $87f8          ; $edea: 2e f8 87  
            .hex 22            ; $eded: 22        Invalid Opcode - KIL 
            .hex 22            ; $edee: 22        Invalid Opcode - KIL 
            BIT $26            ; $edef: 24 26     
            .hex fe            ; $edf1: fe        Suspected data
__edf2:     .hex 3d            ; $edf2: 3d        Suspected data
__edf3:     ORA ($03,x)        ; $edf3: 01 03     
            STA ($03,x)        ; $edf5: 81 03     
            .hex 80 1b         ; $edf7: 80 1b     Invalid Opcode - NOP #$1b
            .hex 04 06         ; $edf9: 04 06     Invalid Opcode - NOP $06
            STY $1b            ; $edfb: 84 1b     
            .hex 04 02         ; $edfd: 04 02     Invalid Opcode - NOP $02
            ORA $34            ; $edff: 05 34     
            ORA ($08,x)        ; $ee01: 01 08     
            EOR ($13,x)        ; $ee03: 41 13     
            ORA ($01,x)        ; $ee05: 01 01     
            BRK                ; $ee07: 00        
            ASL $01            ; $ee08: 06 01     
            ORA ($00,x)        ; $ee0a: 01 00     
            .hex 0f 01 01      ; $ee0c: 0f 01 01  Invalid Opcode - SLO $0101
            BRK                ; $ee0f: 00        
            .hex 03 01         ; $ee10: 03 01     Invalid Opcode - SLO ($01,x)
            ORA ($00,x)        ; $ee12: 01 00     
            ORA ($01),y        ; $ee14: 11 01     
            ASL $81            ; $ee16: 06 81     
            .hex 1b 01 03      ; $ee18: 1b 01 03  Invalid Opcode - SLO $0301,y
            STA ($0e,x)        ; $ee1b: 81 0e     
            ORA ($1a,x)        ; $ee1d: 01 1a     
            BRK                ; $ee1f: 00        
            ORA ($01),y        ; $ee20: 11 01     
            ORA $81            ; $ee22: 05 81     
            ASL $01,x          ; $ee24: 16 01     
            .hex 02            ; $ee26: 02        Invalid Opcode - KIL 
            BRK                ; $ee27: 00        
            ORA ($01,x)        ; $ee28: 01 01     
            ORA ($04),y        ; $ee2a: 11 04     
            BPL __ee2e         ; $ee2c: 10 00     
__ee2e:     BPL __ee70         ; $ee2e: 10 40     
            BPL __ee32         ; $ee30: 10 00     
__ee32:     .hex 02            ; $ee32: 02        Invalid Opcode - KIL 
            .hex 04 01         ; $ee33: 04 01     Invalid Opcode - NOP $01
            BRK                ; $ee35: 00        
            ORA ($04,x)        ; $ee36: 01 04     
            ORA ($00,x)        ; $ee38: 01 00     
            ASL $0104          ; $ee3a: 0e 04 01  
            BRK                ; $ee3d: 00        
            .hex 02            ; $ee3e: 02        Invalid Opcode - KIL 
            .hex 04 01         ; $ee3f: 04 01     Invalid Opcode - NOP $01
            BRK                ; $ee41: 00        
            ORA ($04,x)        ; $ee42: 01 04     
            SEC                ; $ee44: 38        
            BRK                ; $ee45: 00        
            .hex 1a            ; $ee46: 1a        Invalid Opcode - NOP 
            .hex 04 03         ; $ee47: 04 03     Invalid Opcode - NOP $03
            BRK                ; $ee49: 00        
            .hex 04 02         ; $ee4a: 04 02     Invalid Opcode - NOP $02
            ORA ($00,x)        ; $ee4c: 01 00     
            .hex 04 80         ; $ee4e: 04 80     Invalid Opcode - NOP $80
            ORA #$00           ; $ee50: 09 00     
            ASL $02,x          ; $ee52: 16 02     
            .hex 02            ; $ee54: 02        Invalid Opcode - KIL 
            BRK                ; $ee55: 00        
            .hex 02            ; $ee56: 02        Invalid Opcode - KIL 
            .hex 04 05         ; $ee57: 04 05     Invalid Opcode - NOP $05
            .hex 02            ; $ee59: 02        Invalid Opcode - KIL 
            ORA ($00,x)        ; $ee5a: 01 00     
            ORA $04,x          ; $ee5c: 15 04     
            .hex 3a            ; $ee5e: 3a        Invalid Opcode - NOP 
            BRK                ; $ee5f: 00        
            ASL                ; $ee60: 0a        
            RTI                ; $ee61: 40        

;-------------------------------------------------------------------------------
            .hex 17 00         ; $ee62: 17 00     Invalid Opcode - SLO $00,x
            ORA $0204          ; $ee64: 0d 04 02  
            BRK                ; $ee67: 00        
            ASL $80            ; $ee68: 06 80     
            ASL $00            ; $ee6a: 06 00     
            ORA $0108,x        ; $ee6c: 1d 08 01  
            BRK                ; $ee6f: 00        
__ee70:     .hex 0c 01 02      ; $ee70: 0c 01 02  Invalid Opcode - NOP $0201
            BRK                ; $ee73: 00        
            ORA #$40           ; $ee74: 09 40     
            ASL                ; $ee76: 0a        
            BRK                ; $ee77: 00        
            PLP                ; $ee78: 28        
            .hex 02            ; $ee79: 02        Invalid Opcode - KIL 
            ORA ($00,x)        ; $ee7a: 01 00     
            JSR $1e02          ; $ee7c: 20 02 1e  
            .hex 04 02         ; $ee7f: 04 02     Invalid Opcode - NOP $02
            STY $05            ; $ee81: 84 05     
            .hex 80 5d         ; $ee83: 80 5d     Invalid Opcode - NOP #$5d
            ORA ($06,x)        ; $ee85: 01 06     
            BRK                ; $ee87: 00        
            ORA $2102,x        ; $ee88: 1d 02 21  
            PHP                ; $ee8b: 08        
            .hex 04 00         ; $ee8c: 04 00     Invalid Opcode - NOP $00
            ASL $80            ; $ee8e: 06 80     
            .hex 03 00         ; $ee90: 03 00     Invalid Opcode - SLO ($00,x)
            .hex 1a            ; $ee92: 1a        Invalid Opcode - NOP 
            .hex 02            ; $ee93: 02        Invalid Opcode - KIL 
            .hex 02            ; $ee94: 02        Invalid Opcode - KIL 
            BRK                ; $ee95: 00        
            .hex 0f 08 02      ; $ee96: 0f 08 02  Invalid Opcode - SLO $0208
            BRK                ; $ee99: 00        
            ORA #$40           ; $ee9a: 09 40     
__ee9c:     PHP                ; $ee9c: 08        
            BRK                ; $ee9d: 00        
            PHP                ; $ee9e: 08        
            RTI                ; $ee9f: 40        

;-------------------------------------------------------------------------------
            .hex 14 00         ; $eea0: 14 00     Invalid Opcode - NOP $00,x
            .hex 0f 08 01      ; $eea2: 0f 08 01  Invalid Opcode - SLO $0108
            BRK                ; $eea5: 00        
            ORA $0108          ; $eea6: 0d 08 01  
            BRK                ; $eea9: 00        
            ORA ($08,x)        ; $eeaa: 01 08     
            ORA ($00,x)        ; $eeac: 01 00     
            ORA ($08),y        ; $eeae: 11 08     
            .hex 02            ; $eeb0: 02        Invalid Opcode - KIL 
            BRK                ; $eeb1: 00        
            ASL $0601,x        ; $eeb2: 1e 01 06  
            STA ($15,x)        ; $eeb5: 81 15     
            ORA ($05,x)        ; $eeb7: 01 05     
            STA ($19,x)        ; $eeb9: 81 19     
            ORA ($06,x)        ; $eebb: 01 06     
            STA ($06,x)        ; $eebd: 81 06     
            BRK                ; $eebf: 00        
            .hex 1c 04 06      ; $eec0: 1c 04 06  Invalid Opcode - NOP $0604,x
            STY $01            ; $eec3: 84 01     
            STA ($01,x)        ; $eec5: 81 01     
            ORA ($03,x)        ; $eec7: 01 03     
            BRK                ; $eec9: 00        
            .hex 1b 01 01      ; $eeca: 1b 01 01  Invalid Opcode - SLO $0101,y
            BRK                ; $eecd: 00        
            ASL $0108          ; $eece: 0e 08 01  
            PHA                ; $eed1: 48        
            PHP                ; $eed2: 08        
            RTI                ; $eed3: 40        

;-------------------------------------------------------------------------------
            .hex 17 00         ; $eed4: 17 00     Invalid Opcode - SLO $00,x
            ORA $0104          ; $eed6: 0d 04 01  
            STY $06            ; $eed9: 84 06     
            .hex 80 02         ; $eedb: 80 02     Invalid Opcode - NOP #$02
            BRK                ; $eedd: 00        
            ASL $0402,x        ; $eede: 1e 02 04  
            .hex 82 01         ; $eee1: 82 01     Invalid Opcode - NOP #$01
            .hex 80 01         ; $eee3: 80 01     Invalid Opcode - NOP #$01
            BRK                ; $eee5: 00        
            .hex 1f 04 05      ; $eee6: 1f 04 05  Invalid Opcode - SLO $0504,x
            STY $1e            ; $eee9: 84 1e     
            .hex 04 04         ; $eeeb: 04 04     Invalid Opcode - NOP $04
            STY $02            ; $eeed: 84 02     
            .hex 80 1c         ; $eeef: 80 1c     Invalid Opcode - NOP #$1c
            .hex 02            ; $eef1: 02        Invalid Opcode - KIL 
            .hex 02            ; $eef2: 02        Invalid Opcode - KIL 
            BRK                ; $eef3: 00        
            .hex 0f 08 01      ; $eef4: 0f 08 01  Invalid Opcode - SLO $0108
            BRK                ; $eef7: 00        
            ORA #$40           ; $eef8: 09 40     
            ORA ($00),y        ; $eefa: 11 00     
            .hex 0f 04 01      ; $eefc: 0f 04 01  Invalid Opcode - SLO $0104
            ORA $01            ; $eeff: 05 01     
            BRK                ; $ef01: 00        
            .hex 04 01         ; $ef02: 04 01     Invalid Opcode - NOP $01
            ORA #$81           ; $ef04: 09 81     
            .hex 14 01         ; $ef06: 14 01     Invalid Opcode - NOP $01,x
            ASL $81            ; $ef08: 06 81     
            ORA $0101,y        ; $ef0a: 19 01 01  
            BRK                ; $ef0d: 00        
            ASL $0308          ; $ef0e: 0e 08 03  
            PHA                ; $ef11: 48        
            ORA ($00,x)        ; $ef12: 01 00     
            ASL $40            ; $ef14: 06 40     
            .hex 14 00         ; $ef16: 14 00     Invalid Opcode - NOP $00,x
            ASL $80            ; $ef18: 06 80     
            .hex 02            ; $ef1a: 02        Invalid Opcode - KIL 
            DEY                ; $ef1b: 88        
            .hex 04 08         ; $ef1c: 04 08     Invalid Opcode - NOP $08
            ORA ($00,x)        ; $ef1e: 01 00     
            PHP                ; $ef20: 08        
            PHP                ; $ef21: 08        
            ORA ($00,x)        ; $ef22: 01 00     
            .hex 03 08         ; $ef24: 03 08     Invalid Opcode - SLO ($08,x)
            .hex 02            ; $ef26: 02        Invalid Opcode - KIL 
            DEY                ; $ef27: 88        
            ORA ($00,x)        ; $ef28: 01 00     
            .hex 02            ; $ef2a: 02        Invalid Opcode - KIL 
            DEY                ; $ef2b: 88        
            ORA ($00,x)        ; $ef2c: 01 00     
            .hex 14 08         ; $ef2e: 14 08     Invalid Opcode - NOP $08,x
            ORA $88            ; $ef30: 05 88     
            .hex 04 08         ; $ef32: 04 08     Invalid Opcode - NOP $08
            .hex 02            ; $ef34: 02        Invalid Opcode - KIL 
            BRK                ; $ef35: 00        
            .hex 1b 01 07      ; $ef36: 1b 01 07  Invalid Opcode - SLO $0701,y
            STA ($18,x)        ; $ef39: 81 18     
            ORA ($06,x)        ; $ef3b: 01 06     
            STA ($15,x)        ; $ef3d: 81 15     
            ORA ($02,x)        ; $ef3f: 01 02     
            ORA #$10           ; $ef41: 09 10     
            PHP                ; $ef43: 08        
            ASL                ; $ef44: 0a        
            RTI                ; $ef45: 40        

;-------------------------------------------------------------------------------
            .hex 1a            ; $ef46: 1a        Invalid Opcode - NOP 
            BRK                ; $ef47: 00        
            ASL                ; $ef48: 0a        
            .hex 04 01         ; $ef49: 04 01     Invalid Opcode - NOP $01
            BRK                ; $ef4b: 00        
            ASL $04            ; $ef4c: 06 04     
            ORA ($00,x)        ; $ef4e: 01 00     
            ASL $0602,x        ; $ef50: 1e 02 06  
            BRK                ; $ef53: 00        
            BPL __ef5e         ; $ef54: 10 08     
            .hex 03 84         ; $ef56: 03 84     Invalid Opcode - SLO ($84,x)
            .hex ff ff ff      ; $ef58: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef5b: ff ff ff  Invalid Opcode - ISC $ffff,x
__ef5e:     .hex ff ff ff      ; $ef5e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef61: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef64: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef67: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef6a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef6d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef70: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef73: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef76: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef79: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef7c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef7f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef82: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef85: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef88: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef8b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef8e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef91: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef94: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef97: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef9a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $ef9d: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efa9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efac: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efaf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efb2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efb5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efb8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efbb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efbe: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efc1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efc4: ff ff ff  Invalid Opcode - ISC $ffff,x
__efc7:     .hex ff ff ff      ; $efc7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efca: ff ff ff  Invalid Opcode - ISC $ffff,x
__efcd:     .hex ff ff ff      ; $efcd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efd9: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efdc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efdf: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efe2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efe5: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efe8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efeb: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $efee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eff1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eff4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $eff7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $effa: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $effd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f000: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f003: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f006: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fc 00 00      ; $f009: fc 00 00  Bad Addr Mode - NOP $0000,x
            .hex 1f f0 00      ; $f00c: 1f f0 00  Bad Addr Mode - SLO $00f0,x
            .hex 1f fe 00      ; $f00f: 1f fe 00  Bad Addr Mode - SLO $00fe,x
            BRK                ; $f012: 00        
            .hex 07 ff         ; $f013: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff 30      ; $f015: ff ff 30  Invalid Opcode - ISC $30ff,x
            BRK                ; $f018: 00        
            BRK                ; $f019: 00        
            .hex 3f ff e0      ; $f01a: 3f ff e0  Invalid Opcode - RLA __e0ff,x
            .hex 07 f0         ; $f01d: 07 f0     Invalid Opcode - SLO $f0
            .hex 3f f8 1f      ; $f01f: 3f f8 1f  Invalid Opcode - RLA $1ff8,x
            BEQ __f043         ; $f022: f0 1f     
            .hex ff ff c0      ; $f024: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f027: 00        
            .hex 03 ff         ; $f028: 03 ff     Invalid Opcode - SLO ($ff,x)
            CPY #$ff           ; $f02a: c0 ff     
            .hex ff c0 7f      ; $f02c: ff c0 7f  Invalid Opcode - ISC $7fc0,x
            .hex c7 ff         ; $f02f: c7 ff     Invalid Opcode - DCP $ff
            BRK                ; $f031: 00        
            BRK                ; $f032: 00        
            BRK                ; $f033: 00        
            .hex ff f0 00      ; $f034: ff f0 00  Bad Addr Mode - ISC $00f0,x
            .hex 1f ff fe      ; $f037: 1f ff fe  Invalid Opcode - SLO __feff,x
            BRK                ; $f03a: 00        
            BRK                ; $f03b: 00        
            BRK                ; $f03c: 00        
            BRK                ; $f03d: 00        
            BRK                ; $f03e: 00        
            BRK                ; $f03f: 00        
            BRK                ; $f040: 00        
            .hex 7f f0         ; $f041: 7f f0     Suspected data
__f043:     BRK                ; $f043: 00        
            .hex 07 ff         ; $f044: 07 ff     Invalid Opcode - SLO $ff
            .hex ff c0 01      ; $f046: ff c0 01  Invalid Opcode - ISC $01c0,x
            .hex 80 ff         ; $f049: 80 ff     Invalid Opcode - NOP #$ff
            BRK                ; $f04b: 00        
            .hex 02            ; $f04c: 02        Invalid Opcode - KIL 
            .hex 80 3f         ; $f04d: 80 3f     Invalid Opcode - NOP #$3f
            .hex ff f8 00      ; $f04f: ff f8 00  Bad Addr Mode - ISC $00f8,x
            .hex 03 ff         ; $f052: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff fe      ; $f054: ff ff fe  Invalid Opcode - ISC __feff,x
            BRK                ; $f057: 00        
            BRK                ; $f058: 00        
            .hex 1f ff ff      ; $f059: 1f ff ff  Invalid Opcode - SLO $ffff,x
            BEQ __f05f         ; $f05c: f0 01     
            .hex ff            ; $f05e: ff        Suspected data
__f05f:     .hex ff f0 00      ; $f05f: ff f0 00  Bad Addr Mode - ISC $00f0,x
            .hex 0f ff ff      ; $f062: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff 00 07      ; $f065: ff 00 07  Invalid Opcode - ISC $0700,x
            .hex ff f0 00      ; $f068: ff f0 00  Bad Addr Mode - ISC $00f0,x
            .hex fb ff f8      ; $f06b: fb ff f8  Invalid Opcode - ISC __f8ff,y
            .hex ff ff 00      ; $f06e: ff ff 00  Bad Addr Mode - ISC $00ff,x
            BRK                ; $f071: 00        
            BRK                ; $f072: 00        
            ORA ($ff,x)        ; $f073: 01 ff     
            .hex ff ff c0      ; $f075: ff ff c0  Invalid Opcode - ISC __c0ff,x
            .hex 3f f8 00      ; $f078: 3f f8 00  Bad Addr Mode - RLA $00f8,x
            BRK                ; $f07b: 00        
            BRK                ; $f07c: 00        
            BRK                ; $f07d: 00        
            .hex 7f ff ff      ; $f07e: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex ff ff ff      ; $f081: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fe 00 00      ; $f084: fe 00 00  Bad Addr Mode - INC $0000,x
            BRK                ; $f087: 00        
            BRK                ; $f088: 00        
            .hex 0f ff f0      ; $f089: 0f ff f0  Invalid Opcode - SLO __f0ff
            BRK                ; $f08c: 00        
            .hex 03 ff         ; $f08d: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff e0      ; $f08f: ff ff e0  Invalid Opcode - ISC __e0ff,x
            BRK                ; $f092: 00        
            BRK                ; $f093: 00        
            .hex 03 ff         ; $f094: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff f8 00      ; $f096: ff f8 00  Bad Addr Mode - ISC $00f8,x
            BRK                ; $f099: 00        
            BRK                ; $f09a: 00        
            .hex ff ff ff      ; $f09b: ff ff ff  Invalid Opcode - ISC $ffff,x
            BRK                ; $f09e: 00        
            BRK                ; $f09f: 00        
            BRK                ; $f0a0: 00        
            BRK                ; $f0a1: 00        
            .hex 1f e0 00      ; $f0a2: 1f e0 00  Bad Addr Mode - SLO $00e0,x
            BRK                ; $f0a5: 00        
            .hex 07 ff         ; $f0a6: 07 ff     Invalid Opcode - SLO $ff
            .hex ff fe 00      ; $f0a8: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f0ab: 00        
            ORA ($ff,x)        ; $f0ac: 01 ff     
            .hex fe 00 00      ; $f0ae: fe 00 00  Bad Addr Mode - INC $0000,x
            .hex 07 ff         ; $f0b1: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff f8      ; $f0b3: ff ff f8  Invalid Opcode - ISC __f8ff,x
            BRK                ; $f0b6: 00        
            BRK                ; $f0b7: 00        
            BRK                ; $f0b8: 00        
            .hex 1f ff ff      ; $f0b9: 1f ff ff  Invalid Opcode - SLO $ffff,x
            CPX #$00           ; $f0bc: e0 00     
            BRK                ; $f0be: 00        
            ORA ($ff,x)        ; $f0bf: 01 ff     
            .hex ff ff ff      ; $f0c1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff c0 00      ; $f0c4: ff c0 00  Bad Addr Mode - ISC $00c0,x
            BRK                ; $f0c7: 00        
            BRK                ; $f0c8: 00        
            BRK                ; $f0c9: 00        
            .hex 0f ff ff      ; $f0ca: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff fe 00      ; $f0cd: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f0d0: 00        
            .hex 07 e0         ; $f0d1: 07 e0     Invalid Opcode - SLO $e0
            BRK                ; $f0d3: 00        
            BRK                ; $f0d4: 00        
            BRK                ; $f0d5: 00        
            BRK                ; $f0d6: 00        
            .hex 7f ff ef      ; $f0d7: 7f ff ef  Invalid Opcode - RRA __efff,x
            .hex ff ff ff      ; $f0da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff 80      ; $f0dd: ff ff 80  Invalid Opcode - ISC $80ff,x
            BRK                ; $f0e0: 00        
            BRK                ; $f0e1: 00        
            .hex 3f ff c0      ; $f0e2: 3f ff c0  Invalid Opcode - RLA __c0ff,x
            BRK                ; $f0e5: 00        
            BRK                ; $f0e6: 00        
            BRK                ; $f0e7: 00        
            .hex 0f ff ff      ; $f0e8: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex fc 00 ff      ; $f0eb: fc 00 ff  Invalid Opcode - NOP __ff00,x
            .hex ff fe 00      ; $f0ee: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f0f1: 00        
            BRK                ; $f0f2: 00        
            .hex 7f ff ff      ; $f0f3: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex ff c0 00      ; $f0f6: ff c0 00  Bad Addr Mode - ISC $00c0,x
            BRK                ; $f0f9: 00        
            BRK                ; $f0fa: 00        
            .hex 03 ff         ; $f0fb: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff c0      ; $f0fd: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f100: 00        
            BRK                ; $f101: 00        
            BRK                ; $f102: 00        
            .hex 1f ff ff      ; $f103: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff fe      ; $f106: ff ff fe  Invalid Opcode - ISC __feff,x
            BRK                ; $f109: 00        
            .hex 07 ff         ; $f10a: 07 ff     Invalid Opcode - SLO $ff
            BRK                ; $f10c: 00        
            BRK                ; $f10d: 00        
            .hex 0f ff ff      ; $f10e: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex fc 00 00      ; $f111: fc 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $f114: 00        
            BRK                ; $f115: 00        
            .hex 3f ff ff      ; $f116: 3f ff ff  Invalid Opcode - RLA $ffff,x
            BEQ __f11b         ; $f119: f0 00     
__f11b:     BRK                ; $f11b: 00        
            BRK                ; $f11c: 00        
            .hex 0f fe 00      ; $f11d: 0f fe 00  Bad Addr Mode - SLO $00fe
            BRK                ; $f120: 00        
            .hex 03 ff         ; $f121: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff c0 00      ; $f123: ff c0 00  Bad Addr Mode - ISC $00c0,x
            BRK                ; $f126: 00        
            BRK                ; $f127: 00        
            BRK                ; $f128: 00        
            .hex ff ff ff      ; $f129: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff 80      ; $f12c: ff ff 80  Invalid Opcode - ISC $80ff,x
            BRK                ; $f12f: 00        
            ORA ($ff,x)        ; $f130: 01 ff     
            .hex ff ff f0      ; $f132: ff ff f0  Invalid Opcode - ISC __f0ff,x
            BRK                ; $f135: 00        
            BRK                ; $f136: 00        
            BRK                ; $f137: 00        
            BRK                ; $f138: 00        
            .hex 7f ff ff      ; $f139: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex da            ; $f13c: da        Invalid Opcode - NOP 
            .hex 2e 00 00      ; $f13d: 2e 00 00  Bad Addr Mode - ROL $0000
            BRK                ; $f140: 00        
            .hex 7f ff ff      ; $f141: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex ff fe 00      ; $f144: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f147: 00        
            .hex ff 80 ff      ; $f148: ff 80 ff  Invalid Opcode - ISC __ff80,x
            .hex fc 00 00      ; $f14b: fc 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $f14e: 00        
            BRK                ; $f14f: 00        
            .hex 03 ff         ; $f150: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f152: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 80 00      ; $f155: ff 80 00  Bad Addr Mode - ISC $0080,x
            BRK                ; $f158: 00        
            .hex 0f ff ff      ; $f159: 0f ff ff  Invalid Opcode - SLO $ffff
            SED                ; $f15c: f8        
            BRK                ; $f15d: 00        
            BRK                ; $f15e: 00        
            BRK                ; $f15f: 00        
            .hex 03 ff         ; $f160: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff c0      ; $f162: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f165: 00        
            BRK                ; $f166: 00        
            BRK                ; $f167: 00        
            .hex 07 ff         ; $f168: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f16a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 80 00         ; $f16d: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f16f: 00        
            ORA ($ff,x)        ; $f170: 01 ff     
            .hex ff 00 00      ; $f172: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f175: 00        
            ORA ($ff,x)        ; $f176: 01 ff     
            .hex ff ff ff      ; $f178: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff 00      ; $f17b: ff ff 00  Bad Addr Mode - ISC $00ff,x
            .hex 3f ff f0      ; $f17e: 3f ff f0  Invalid Opcode - RLA __f0ff,x
            BRK                ; $f181: 00        
            BRK                ; $f182: 00        
            BRK                ; $f183: 00        
            .hex 07 ff         ; $f184: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff fe      ; $f186: ff ff fe  Invalid Opcode - ISC __feff,x
            BRK                ; $f189: 00        
            .hex 03 ff         ; $f18a: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex fe 00 00      ; $f18c: fe 00 00  Bad Addr Mode - INC $0000,x
            .hex 07 ff         ; $f18f: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff c0      ; $f191: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f194: 00        
            BRK                ; $f195: 00        
            BRK                ; $f196: 00        
            BRK                ; $f197: 00        
            .hex 7f ff e0      ; $f198: 7f ff e0  Invalid Opcode - RRA __e0ff,x
            BRK                ; $f19b: 00        
            BRK                ; $f19c: 00        
            BRK                ; $f19d: 00        
            .hex 03 ff         ; $f19e: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f1a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $f1a3: ff 00 00  Bad Addr Mode - ISC $0000,x
            .hex 7c 00 00      ; $f1a6: 7c 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $f1a9: 00        
            .hex 0f ff ff      ; $f1aa: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff ff ff      ; $f1ad: ff ff ff  Invalid Opcode - ISC $ffff,x
            SED                ; $f1b0: f8        
            BRK                ; $f1b1: 00        
            BRK                ; $f1b2: 00        
            BRK                ; $f1b3: 00        
            .hex 3f ff ff      ; $f1b4: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff c0 00      ; $f1b7: ff c0 00  Bad Addr Mode - ISC $00c0,x
            BRK                ; $f1ba: 00        
            .hex 07 ff         ; $f1bb: 07 ff     Invalid Opcode - SLO $ff
            BEQ __f1bf         ; $f1bd: f0 00     
__f1bf:     BRK                ; $f1bf: 00        
            .hex 7f ff 80      ; $f1c0: 7f ff 80  Invalid Opcode - RRA $80ff,x
            BRK                ; $f1c3: 00        
            .hex 07 fc         ; $f1c4: 07 fc     Invalid Opcode - SLO $fc
            BRK                ; $f1c6: 00        
            .hex ff ff ff      ; $f1c7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $f1ca: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f1cd: 00        
            .hex 0f ff ff      ; $f1ce: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff fe 00      ; $f1d1: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f1d4: 00        
            BRK                ; $f1d5: 00        
            .hex 3f ff ff      ; $f1d6: 3f ff ff  Invalid Opcode - RLA $ffff,x
            SED                ; $f1d9: f8        
            BRK                ; $f1da: 00        
            BRK                ; $f1db: 00        
            BRK                ; $f1dc: 00        
            BRK                ; $f1dd: 00        
            .hex 3f ff c0      ; $f1de: 3f ff c0  Invalid Opcode - RLA __c0ff,x
            BRK                ; $f1e1: 00        
            BRK                ; $f1e2: 00        
            .hex ff ff ff      ; $f1e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            CPX #$00           ; $f1e6: e0 00     
            BRK                ; $f1e8: 00        
            BRK                ; $f1e9: 00        
            .hex 1f ff ff      ; $f1ea: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff fc 00      ; $f1ed: ff fc 00  Bad Addr Mode - ISC $00fc,x
            BRK                ; $f1f0: 00        
            .hex 7f ff ff      ; $f1f1: 7f ff ff  Invalid Opcode - RRA $ffff,x
            SED                ; $f1f4: f8        
            BRK                ; $f1f5: 00        
            BRK                ; $f1f6: 00        
            BRK                ; $f1f7: 00        
            .hex 3f ff ff      ; $f1f8: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff 00 00      ; $f1fb: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f1fe: 00        
            BRK                ; $f1ff: 00        
            BRK                ; $f200: 00        
            .hex ff ff fe      ; $f201: ff ff fe  Invalid Opcode - ISC __feff,x
            ORA ($b0),y        ; $f204: 11 b0     
            .hex 3f ff e0      ; $f206: 3f ff e0  Invalid Opcode - RLA __e0ff,x
            BRK                ; $f209: 00        
            BRK                ; $f20a: 00        
            BRK                ; $f20b: 00        
            BRK                ; $f20c: 00        
            .hex 07 ff         ; $f20d: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f20f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f212: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff f8 00      ; $f215: ff f8 00  Bad Addr Mode - ISC $00f8,x
            BRK                ; $f218: 00        
            BRK                ; $f219: 00        
            BRK                ; $f21a: 00        
            BRK                ; $f21b: 00        
            BRK                ; $f21c: 00        
            BRK                ; $f21d: 00        
            .hex 0f ff ff      ; $f21e: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff ff ff      ; $f221: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 80 00         ; $f224: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f226: 00        
            BRK                ; $f227: 00        
            .hex 03 ff         ; $f228: 03 ff     Invalid Opcode - SLO ($ff,x)
            INC $0f00,x        ; $f22a: fe 00 0f  
            .hex ff ff 80      ; $f22d: ff ff 80  Invalid Opcode - ISC $80ff,x
            BRK                ; $f230: 00        
            BRK                ; $f231: 00        
            BRK                ; $f232: 00        
            .hex ff ff ff      ; $f233: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fc 00 00      ; $f236: fc 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $f239: 00        
            BRK                ; $f23a: 00        
            .hex ff ff fe      ; $f23b: ff ff fe  Invalid Opcode - ISC __feff,x
            BRK                ; $f23e: 00        
            .hex 07 ff         ; $f23f: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f241: ff ff ff  Invalid Opcode - ISC $ffff,x
            CPX #$00           ; $f244: e0 00     
            BRK                ; $f246: 00        
            BRK                ; $f247: 00        
            BRK                ; $f248: 00        
            .hex 0f ff a0      ; $f249: 0f ff a0  Invalid Opcode - SLO $a0ff
            .hex bf ff ff      ; $f24c: bf ff ff  Invalid Opcode - LAX $ffff,y
            .hex fe 00 00      ; $f24f: fe 00 00  Bad Addr Mode - INC $0000,x
            .hex 7f fc 00      ; $f252: 7f fc 00  Bad Addr Mode - RRA $00fc,x
            BRK                ; $f255: 00        
            BRK                ; $f256: 00        
            .hex 7f ff ff      ; $f257: 7f ff ff  Invalid Opcode - RRA $ffff,x
            CPX #$00           ; $f25a: e0 00     
            BRK                ; $f25c: 00        
            BRK                ; $f25d: 00        
            .hex 3f ff ff      ; $f25e: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff ff      ; $f261: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff 80      ; $f264: ff ff 80  Invalid Opcode - ISC $80ff,x
            BRK                ; $f267: 00        
            BRK                ; $f268: 00        
            BRK                ; $f269: 00        
            .hex 07 f8         ; $f26a: 07 f8     Invalid Opcode - SLO $f8
            BRK                ; $f26c: 00        
            BRK                ; $f26d: 00        
            BRK                ; $f26e: 00        
            BRK                ; $f26f: 00        
            .hex 03 ff         ; $f270: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f272: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $f275: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f278: 00        
            BRK                ; $f279: 00        
            BRK                ; $f27a: 00        
            ORA ($ff,x)        ; $f27b: 01 ff     
            .hex ff ff f0      ; $f27d: ff ff f0  Invalid Opcode - ISC __f0ff,x
            BRK                ; $f280: 00        
            .hex 07 ff         ; $f281: 07 ff     Invalid Opcode - SLO $ff
            .hex ff fc 00      ; $f283: ff fc 00  Bad Addr Mode - ISC $00fc,x
            BRK                ; $f286: 00        
            BRK                ; $f287: 00        
            BRK                ; $f288: 00        
            .hex 3f ff ff      ; $f289: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff 0f      ; $f28c: ff ff 0f  Invalid Opcode - ISC $0fff,x
            .hex ff ff fe      ; $f28f: ff ff fe  Invalid Opcode - ISC __feff,x
            BRK                ; $f292: 00        
            BRK                ; $f293: 00        
            BRK                ; $f294: 00        
            BRK                ; $f295: 00        
            BRK                ; $f296: 00        
            .hex ff ff ff      ; $f297: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff f8 00      ; $f29a: ff f8 00  Bad Addr Mode - ISC $00f8,x
            ORA ($ff,x)        ; $f29d: 01 ff     
            .hex fc 00 00      ; $f29f: fc 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $f2a2: 00        
            BRK                ; $f2a3: 00        
            .hex ff ff ff      ; $f2a4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff c0 00      ; $f2a7: ff c0 00  Bad Addr Mode - ISC $00c0,x
            BRK                ; $f2aa: 00        
            BRK                ; $f2ab: 00        
            BRK                ; $f2ac: 00        
            .hex 03 ff         ; $f2ad: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff 80 00      ; $f2af: ff 80 00  Bad Addr Mode - ISC $0080,x
            BRK                ; $f2b2: 00        
            BRK                ; $f2b3: 00        
            BRK                ; $f2b4: 00        
            .hex 3f ff ff      ; $f2b5: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff ff      ; $f2b8: ff ff ff  Invalid Opcode - ISC $ffff,x
            CPY #$00           ; $f2bb: c0 00     
            .hex 3f ff ff      ; $f2bd: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff f8 00      ; $f2c0: ff f8 00  Bad Addr Mode - ISC $00f8,x
            BRK                ; $f2c3: 00        
            .hex 02            ; $f2c4: 02        Invalid Opcode - KIL 
            BRK                ; $f2c5: 00        
            BRK                ; $f2c6: 00        
            BRK                ; $f2c7: 00        
            BRK                ; $f2c8: 00        
            BRK                ; $f2c9: 00        
            .hex 07 ff         ; $f2ca: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f2cc: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f2cf: ff ff ff  Invalid Opcode - ISC $ffff,x
            CPX #$b8           ; $f2d2: e0 b8     
            BRK                ; $f2d4: 00        
            BRK                ; $f2d5: 00        
            BRK                ; $f2d6: 00        
            BRK                ; $f2d7: 00        
            BRK                ; $f2d8: 00        
            BRK                ; $f2d9: 00        
            .hex 3f ff ff      ; $f2da: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff ff      ; $f2dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            SED                ; $f2e0: f8        
            BRK                ; $f2e1: 00        
            BRK                ; $f2e2: 00        
            BRK                ; $f2e3: 00        
            BRK                ; $f2e4: 00        
            .hex 1f ff ff      ; $f2e5: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff 80      ; $f2e8: ff ff 80  Invalid Opcode - ISC $80ff,x
            BRK                ; $f2eb: 00        
            BRK                ; $f2ec: 00        
            BRK                ; $f2ed: 00        
            BRK                ; $f2ee: 00        
            .hex 0f ff ff      ; $f2ef: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff df ff      ; $f2f2: ff df ff  Invalid Opcode - ISC __ffdf,x
            BRK                ; $f2f5: 00        
            BRK                ; $f2f6: 00        
            .hex 0f ff ff      ; $f2f7: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex 80 00         ; $f2fa: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f2fc: 00        
            BRK                ; $f2fd: 00        
            .hex 03 ff         ; $f2fe: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f300: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff c0      ; $f303: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f306: 00        
            BRK                ; $f307: 00        
            BRK                ; $f308: 00        
            ORA ($ff,x)        ; $f309: 01 ff     
            .hex ff ff 00      ; $f30b: ff ff 00  Bad Addr Mode - ISC $00ff,x
            BRK                ; $f30e: 00        
            BRK                ; $f30f: 00        
            BRK                ; $f310: 00        
            .hex 1f ff ff      ; $f311: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff ff      ; $f314: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff e0 00      ; $f317: ff e0 00  Bad Addr Mode - ISC $00e0,x
            .hex ff 00 00      ; $f31a: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f31d: 00        
            BRK                ; $f31e: 00        
            BRK                ; $f31f: 00        
            BRK                ; $f320: 00        
            ORA ($ff,x)        ; $f321: 01 ff     
            .hex ff ff c0      ; $f323: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f326: 00        
            BRK                ; $f327: 00        
            .hex 03 ff         ; $f328: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f32a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff f0 00      ; $f32d: ff f0 00  Bad Addr Mode - ISC $00f0,x
            BRK                ; $f330: 00        
            BRK                ; $f331: 00        
            BRK                ; $f332: 00        
            BRK                ; $f333: 00        
            .hex 07 ff         ; $f334: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f336: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 80 00      ; $f339: ff 80 00  Bad Addr Mode - ISC $0080,x
            BRK                ; $f33c: 00        
            BRK                ; $f33d: 00        
            BRK                ; $f33e: 00        
            .hex 0f ff ff      ; $f33f: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff f0 00      ; $f342: ff f0 00  Bad Addr Mode - ISC $00f0,x
            .hex 3f ff ff      ; $f345: 3f ff ff  Invalid Opcode - RLA $ffff,x
            BRK                ; $f348: 00        
            BRK                ; $f349: 00        
            .hex 17 fb         ; $f34a: 17 fb     Invalid Opcode - SLO $fb,x
            INY                ; $f34c: c8        
            STY $e5            ; $f34d: 84 e5     
            .hex 3f ff 20      ; $f34f: 3f ff 20  Invalid Opcode - RLA $20ff,x
            BRK                ; $f352: 00        
            .hex 14 19         ; $f353: 14 19     Invalid Opcode - NOP $19,x
            CMP __f69f,y       ; $f355: d9 9f f6  
            BRK                ; $f358: 00        
            BRK                ; $f359: 00        
            .hex 17 ff         ; $f35a: 17 ff     Invalid Opcode - SLO $ff,x
            .hex ff ff ff      ; $f35c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fe 00 00      ; $f35f: fe 00 00  Bad Addr Mode - INC $0000,x
            BRK                ; $f362: 00        
            BRK                ; $f363: 00        
            BRK                ; $f364: 00        
            .hex 03 ff         ; $f365: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f367: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f36a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fe 00 00      ; $f36d: fe 00 00  Bad Addr Mode - INC $0000,x
            BRK                ; $f370: 00        
            BRK                ; $f371: 00        
            BRK                ; $f372: 00        
            BRK                ; $f373: 00        
            BRK                ; $f374: 00        
            BRK                ; $f375: 00        
            .hex ff ff ff      ; $f376: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex dc 80 00      ; $f379: dc 80 00  Bad Addr Mode - NOP $0080,x
            ROL $fe            ; $f37c: 26 fe     
            .hex 57 ff         ; $f37e: 57 ff     Invalid Opcode - SRE $ff,x
            .hex ff 80 00      ; $f380: ff 80 00  Bad Addr Mode - ISC $0080,x
            BRK                ; $f383: 00        
            .hex 07 fc         ; $f384: 07 fc     Invalid Opcode - SLO $fc
            CPY #$3f           ; $f386: c0 3f     
            .hex ff ff 7f      ; $f388: ff ff 7f  Invalid Opcode - ISC $7fff,x
            LDA $61c4,x        ; $f38b: bd c4 61  
            LSR $67ee          ; $f38e: 4e ee 67  
            JSR $6446          ; $f391: 20 46 64  
            .hex ef e6 00      ; $f394: ef e6 00  Bad Addr Mode - ISC $00e6
            BRK                ; $f397: 00        
            .hex fd a0 00      ; $f398: fd a0 00  Bad Addr Mode - SBC $00a0,x
            BRK                ; $f39b: 00        
            BRK                ; $f39c: 00        
            BRK                ; $f39d: 00        
            .hex 07 ff         ; $f39e: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f3a0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff f0 00      ; $f3a3: ff f0 00  Bad Addr Mode - ISC $00f0,x
            BRK                ; $f3a6: 00        
            BRK                ; $f3a7: 00        
            BRK                ; $f3a8: 00        
            BRK                ; $f3a9: 00        
            .hex 7f ff ff      ; $f3aa: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex ff ff c0      ; $f3ad: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f3b0: 00        
            BRK                ; $f3b1: 00        
            BRK                ; $f3b2: 00        
            BRK                ; $f3b3: 00        
            .hex 0f 7f f8      ; $f3b4: 0f 7f f8  Invalid Opcode - SLO __f87f
            .hex df ff ff      ; $f3b7: df ff ff  Invalid Opcode - DCP $ffff,x
            CPY #$03           ; $f3ba: c0 03     
            .hex fb 9f af      ; $f3bc: fb 9f af  Invalid Opcode - ISC $af9f,y
            .hex ff ff 80      ; $f3bf: ff ff 80  Invalid Opcode - ISC $80ff,x
            BRK                ; $f3c2: 00        
            BRK                ; $f3c3: 00        
            .hex 02            ; $f3c4: 02        Invalid Opcode - KIL 
            INC $a5,x          ; $f3c5: f6 a5     
            .hex 6f ff ff      ; $f3c7: 6f ff ff  Invalid Opcode - RRA $ffff
            .hex fc 00 3f      ; $f3ca: fc 00 3f  Invalid Opcode - NOP $3f00,x
            .hex ff c0 00      ; $f3cd: ff c0 00  Bad Addr Mode - ISC $00c0,x
            BRK                ; $f3d0: 00        
            BRK                ; $f3d1: 00        
            BRK                ; $f3d2: 00        
            BRK                ; $f3d3: 00        
            .hex 1f ff ff      ; $f3d4: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff            ; $f3d7: ff        Suspected data
__f3d8:     .hex ff ff 82      ; $f3d8: ff ff 82  Invalid Opcode - ISC $82ff,x
            BRK                ; $f3db: 00        
            BRK                ; $f3dc: 00        
            BRK                ; $f3dd: 00        
            BRK                ; $f3de: 00        
            BRK                ; $f3df: 00        
            BRK                ; $f3e0: 00        
            .hex 03 ff         ; $f3e1: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f3e3: ff ff ff  Invalid Opcode - ISC $ffff,x
            CPY #$00           ; $f3e6: c0 00     
            BRK                ; $f3e8: 00        
            BRK                ; $f3e9: 00        
            BRK                ; $f3ea: 00        
            .hex 7f ff ff      ; $f3eb: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex ff fe 00      ; $f3ee: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f3f1: 00        
            BRK                ; $f3f2: 00        
            BRK                ; $f3f3: 00        
            ASL __ff7b,x       ; $f3f4: 1e 7b ff  
            .hex ff ff ff      ; $f3f7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff f8 00      ; $f3fa: ff f8 00  Bad Addr Mode - ISC $00f8,x
            .hex bf ff ff      ; $f3fd: bf ff ff  Invalid Opcode - LAX $ffff,y
            CPY #$00           ; $f400: c0 00     
            BRK                ; $f402: 00        
            BRK                ; $f403: 00        
            BRK                ; $f404: 00        
            .hex 07 ff         ; $f405: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f407: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff fe 00      ; $f40a: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f40d: 00        
            BRK                ; $f40e: 00        
            BRK                ; $f40f: 00        
            BRK                ; $f410: 00        
            BRK                ; $f411: 00        
            ORA ($ff,x)        ; $f412: 01 ff     
            .hex ff ff 88      ; $f414: ff ff 88  Invalid Opcode - ISC $88ff,x
            JSR __ff0d         ; $f417: 20 0d ff  
            BEQ __f41c         ; $f41a: f0 00     
__f41c:     BRK                ; $f41c: 00        
            BRK                ; $f41d: 00        
            .hex 03 ff         ; $f41e: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f420: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff f8      ; $f423: ff ff f8  Invalid Opcode - ISC __f8ff,x
            BRK                ; $f426: 00        
            BRK                ; $f427: 00        
            BRK                ; $f428: 00        
            BRK                ; $f429: 00        
            BRK                ; $f42a: 00        
            BRK                ; $f42b: 00        
            .hex ff ff ff      ; $f42c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff f8      ; $f42f: ff ff f8  Invalid Opcode - ISC __f8ff,x
            BRK                ; $f432: 00        
            BRK                ; $f433: 00        
            .hex 3f ff ff      ; $f434: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex 80 00         ; $f437: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f439: 00        
            BRK                ; $f43a: 00        
            BRK                ; $f43b: 00        
            BRK                ; $f43c: 00        
            ORA ($ff,x)        ; $f43d: 01 ff     
            .hex ff ff ff      ; $f43f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff fe 00      ; $f442: ff fe 00  Bad Addr Mode - ISC $00fe,x
            BRK                ; $f445: 00        
            BRK                ; $f446: 00        
            .hex 07 ff         ; $f447: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f449: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $f44c: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f44f: 00        
            BRK                ; $f450: 00        
            BRK                ; $f451: 00        
            BRK                ; $f452: 00        
            ORA ($ff,x)        ; $f453: 01 ff     
            .hex ff ff ff      ; $f455: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff         ; $f458: ff ff     Suspected data
__f45a:     BRK                ; $f45a: 00        
            BRK                ; $f45b: 00        
            BRK                ; $f45c: 00        
            BRK                ; $f45d: 00        
            BRK                ; $f45e: 00        
            BRK                ; $f45f: 00        
            .hex 07 ff         ; $f460: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f462: ff ff ff  Invalid Opcode - ISC $ffff,x
            INC $6f,x          ; $f465: f6 6f     
            .hex ff e0 00      ; $f467: ff e0 00  Bad Addr Mode - ISC $00e0,x
            BRK                ; $f46a: 00        
            BRK                ; $f46b: 00        
            BRK                ; $f46c: 00        
            .hex 7f ff ff      ; $f46d: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex fe 00 00      ; $f470: fe 00 00  Bad Addr Mode - INC $0000,x
            BRK                ; $f473: 00        
            BRK                ; $f474: 00        
            .hex 1f ff ff      ; $f475: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff fe      ; $f478: ff ff fe  Invalid Opcode - ISC __feff,x
            BRK                ; $f47b: 00        
            BRK                ; $f47c: 00        
            BRK                ; $f47d: 00        
            BRK                ; $f47e: 00        
            BRK                ; $f47f: 00        
            ASL $69            ; $f480: 06 69     
            .hex 43 1a         ; $f482: 43 1a     Invalid Opcode - SRE ($1a,x)
            SBC __ffbf         ; $f484: ed bf ff  
            .hex ff f0 00      ; $f487: ff f0 00  Bad Addr Mode - ISC $00f0,x
            BRK                ; $f48a: 00        
            BRK                ; $f48b: 00        
            BRK                ; $f48c: 00        
            BRK                ; $f48d: 00        
            .hex ff ff ff      ; $f48e: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f491: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff f0 00      ; $f494: ff f0 00  Bad Addr Mode - ISC $00f0,x
            BRK                ; $f497: 00        
            BRK                ; $f498: 00        
            BRK                ; $f499: 00        
            .hex 1f ff ff      ; $f49a: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff c0      ; $f49d: ff ff c0  Invalid Opcode - ISC __c0ff,x
            BRK                ; $f4a0: 00        
            BRK                ; $f4a1: 00        
            BRK                ; $f4a2: 00        
            BRK                ; $f4a3: 00        
            BRK                ; $f4a4: 00        
            BRK                ; $f4a5: 00        
            .hex 17 ff         ; $f4a6: 17 ff     Invalid Opcode - SLO $ff,x
            .hex ff ff ff      ; $f4a8: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 02            ; $f4ab: 02        Invalid Opcode - KIL 
            AND #$99           ; $f4ac: 29 99     
            .hex df fe a4      ; $f4ae: df fe a4  Invalid Opcode - DCP $a4fe,x
            ROL $75            ; $f4b1: 26 75     
            LDY $af61          ; $f4b3: ac 61 af  
            ADC $4484          ; $f4b6: 6d 84 44  
            BVC __f45a         ; $f4b9: 50 9f     
            .hex bb 79 d9      ; $f4bb: bb 79 d9  Invalid Opcode - LAS __d979,y
            .hex 9b            ; $f4be: 9b        Invalid Opcode - TAS 
            CPX $27db          ; $f4bf: ec db 27  
            .hex fe 00 00      ; $f4c2: fe 00 00  Bad Addr Mode - INC $0000,x
            BRK                ; $f4c5: 00        
            BRK                ; $f4c6: 00        
            .hex 07 ff         ; $f4c7: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff fc      ; $f4c9: ff ff fc  Invalid Opcode - ISC __fcff,x
            BRK                ; $f4cc: 00        
            BRK                ; $f4cd: 00        
            BRK                ; $f4ce: 00        
            BRK                ; $f4cf: 00        
            .hex 1f ff ff      ; $f4d0: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff 80 00      ; $f4d3: ff 80 00  Bad Addr Mode - ISC $0080,x
            .hex 0f ff ff      ; $f4d6: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff 00 00      ; $f4d9: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f4dc: 00        
            BRK                ; $f4dd: 00        
            .hex 1f ff ff      ; $f4de: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex 80 00         ; $f4e1: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f4e3: 00        
            .hex 03 dc         ; $f4e4: 03 dc     Invalid Opcode - SLO ($dc,x)
            .hex da            ; $f4e6: da        Invalid Opcode - NOP 
            .hex ff ff ff      ; $f4e7: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $f4ea: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f4ed: 00        
            BRK                ; $f4ee: 00        
            BRK                ; $f4ef: 00        
            BRK                ; $f4f0: 00        
            .hex 3f ff ff      ; $f4f1: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff ff      ; $f4f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            BEQ __f4f9         ; $f4f7: f0 00     
__f4f9:     BRK                ; $f4f9: 00        
            BRK                ; $f4fa: 00        
            .hex 1f ff ff      ; $f4fb: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff f8      ; $f4fe: ff ff f8  Invalid Opcode - ISC __f8ff,x
            BRK                ; $f501: 00        
            BRK                ; $f502: 00        
            BRK                ; $f503: 00        
            BRK                ; $f504: 00        
            BRK                ; $f505: 00        
            BRK                ; $f506: 00        
            LSR __ebfb,x       ; $f507: 5e fb eb  
            LDY __efc7         ; $f50a: ac c7 ef  
            .hex bb 79 bf      ; $f50d: bb 79 bf  Invalid Opcode - LAS $bf79,y
            .hex ff e0 00      ; $f510: ff e0 00  Bad Addr Mode - ISC $00e0,x
            .hex 0f f8 00      ; $f513: 0f f8 00  Bad Addr Mode - SLO $00f8
            BRK                ; $f516: 00        
            BRK                ; $f517: 00        
            .hex ff ff ff      ; $f518: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f51b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fc 00 00      ; $f51e: fc 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $f521: 00        
            BRK                ; $f522: 00        
            BRK                ; $f523: 00        
            BRK                ; $f524: 00        
            .hex 3f ff ff      ; $f525: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex f7 ff         ; $f528: f7 ff     Invalid Opcode - ISC $ff,x
            .hex ff ff fa      ; $f52a: ff ff fa  Invalid Opcode - ISC __faff,x
            BPL __f52f         ; $f52d: 10 00     
__f52f:     BRK                ; $f52f: 00        
            BRK                ; $f530: 00        
            BRK                ; $f531: 00        
            BRK                ; $f532: 00        
            BRK                ; $f533: 00        
            BRK                ; $f534: 00        
            BRK                ; $f535: 00        
            .hex 0f fc fb      ; $f536: 0f fc fb  Invalid Opcode - SLO __fbfc
            INC __eaff         ; $f539: ee ff ea  
            CMP __cedf,y       ; $f53c: d9 df ce  
            .hex 7f ff ff      ; $f53f: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex 80 00         ; $f542: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f544: 00        
            BRK                ; $f545: 00        
            BRK                ; $f546: 00        
            BRK                ; $f547: 00        
            .hex 1f ff ff      ; $f548: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff ff      ; $f54b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff e0 00      ; $f54e: ff e0 00  Bad Addr Mode - ISC $00e0,x
            BRK                ; $f551: 00        
            BRK                ; $f552: 00        
            BRK                ; $f553: 00        
            BRK                ; $f554: 00        
            .hex 7f ff ff      ; $f555: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex ff f8 00      ; $f558: ff f8 00  Bad Addr Mode - ISC $00f8,x
            BRK                ; $f55b: 00        
            BRK                ; $f55c: 00        
            BRK                ; $f55d: 00        
            BRK                ; $f55e: 00        
            BRK                ; $f55f: 00        
            .hex 0f ff ff      ; $f560: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff ff ff      ; $f563: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff fc 00      ; $f566: ff fc 00  Bad Addr Mode - ISC $00fc,x
            BRK                ; $f569: 00        
            BRK                ; $f56a: 00        
            BRK                ; $f56b: 00        
            BRK                ; $f56c: 00        
            BRK                ; $f56d: 00        
            BRK                ; $f56e: 00        
            .hex 3f ff ff      ; $f56f: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff d3      ; $f572: ff ff d3  Invalid Opcode - ISC __d3ff,x
            BIT $25            ; $f575: 24 25     
            .hex 33 cc         ; $f577: 33 cc     Invalid Opcode - RLA ($cc),y
            CMP #$20           ; $f579: c9 20     
            .hex 7f ff f0      ; $f57b: 7f ff f0  Invalid Opcode - RRA __f0ff,x
            BRK                ; $f57e: 00        
            BRK                ; $f57f: 00        
            BRK                ; $f580: 00        
            .hex 07 ff         ; $f581: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f583: ff ff ff  Invalid Opcode - ISC $ffff,x
            BRK                ; $f586: 00        
            BRK                ; $f587: 00        
            BRK                ; $f588: 00        
            BRK                ; $f589: 00        
            .hex 0f ff ff      ; $f58a: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff ff ff      ; $f58d: ff ff ff  Invalid Opcode - ISC $ffff,x
            DEC $30            ; $f590: c6 30     
            RTI                ; $f592: 40        

;-------------------------------------------------------------------------------
            .hex 04 20         ; $f593: 04 20     Invalid Opcode - NOP $20
            PHP                ; $f595: 08        
            ADC ($00,x)        ; $f596: 61 00     
            BRK                ; $f598: 00        
            BRK                ; $f599: 00        
            .hex 07 ff         ; $f59a: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f59c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff fc 00      ; $f59f: ff fc 00  Bad Addr Mode - ISC $00fc,x
            BRK                ; $f5a2: 00        
            BRK                ; $f5a3: 00        
            BRK                ; $f5a4: 00        
            BRK                ; $f5a5: 00        
            BRK                ; $f5a6: 00        
            BRK                ; $f5a7: 00        
            BRK                ; $f5a8: 00        
            ORA ($ff,x)        ; $f5a9: 01 ff     
            .hex ff ff ff      ; $f5ab: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5ae: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5b1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 62            ; $f5b4: 62        Invalid Opcode - KIL 
            ORA ($00,x)        ; $f5b5: 01 00     
            BRK                ; $f5b7: 00        
            .hex 80 00         ; $f5b8: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f5ba: 00        
            .hex 77 5f         ; $f5bb: 77 5f     Invalid Opcode - RRA $5f,x
            .hex ff fd 76      ; $f5bd: ff fd 76  Invalid Opcode - ISC $76fd,x
            .hex eb 5b         ; $f5c0: eb 5b     Invalid Opcode - SBC #$5b
            .hex 7f ff fc      ; $f5c2: 7f ff fc  Invalid Opcode - RRA __fcff,x
            BRK                ; $f5c5: 00        
            BRK                ; $f5c6: 00        
            BRK                ; $f5c7: 00        
            BRK                ; $f5c8: 00        
            BRK                ; $f5c9: 00        
            BRK                ; $f5ca: 00        
            .hex 3f ff ff      ; $f5cb: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff ff      ; $f5ce: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5d1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $f5d4: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f5d7: 00        
            BRK                ; $f5d8: 00        
            BRK                ; $f5d9: 00        
            BRK                ; $f5da: 00        
            BRK                ; $f5db: 00        
            BRK                ; $f5dc: 00        
            .hex ff ff ff      ; $f5dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f5e0: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 80 00         ; $f5e3: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f5e5: 00        
            BRK                ; $f5e6: 00        
            BRK                ; $f5e7: 00        
            BRK                ; $f5e8: 00        
            BRK                ; $f5e9: 00        
            .hex 1f ff ff      ; $f5ea: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff 00      ; $f5ed: ff ff 00  Bad Addr Mode - ISC $00ff,x
            .hex 80 00         ; $f5f0: 80 00     Invalid Opcode - NOP #$00
            STA $11            ; $f5f2: 85 11     
            .hex 9e cc cd      ; $f5f4: 9e cc cd  Invalid Opcode - SHX __cdcc,y
            .hex db df f6      ; $f5f7: db df f6  Invalid Opcode - DCP __f6df,y
            .hex df ff ff      ; $f5fa: df ff ff  Invalid Opcode - DCP $ffff,x
            CPY #$00           ; $f5fd: c0 00     
            BRK                ; $f5ff: 00        
            BRK                ; $f600: 00        
            BRK                ; $f601: 00        
            BRK                ; $f602: 00        
            .hex 0f ff ff      ; $f603: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff ff ff      ; $f606: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f609: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 80 00         ; $f60c: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f60e: 00        
            BRK                ; $f60f: 00        
            BRK                ; $f610: 00        
            BRK                ; $f611: 00        
            BRK                ; $f612: 00        
            BRK                ; $f613: 00        
            .hex 07 ff         ; $f614: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f616: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff f0      ; $f619: ff ff f0  Invalid Opcode - ISC __f0ff,x
            BRK                ; $f61c: 00        
            BRK                ; $f61d: 00        
            BRK                ; $f61e: 00        
            BRK                ; $f61f: 00        
            BRK                ; $f620: 00        
            BRK                ; $f621: 00        
            BRK                ; $f622: 00        
            BRK                ; $f623: 00        
            .hex 1f ff ff      ; $f624: 1f ff ff  Invalid Opcode - SLO $ffff,x
            CPY #$00           ; $f627: c0 00     
            .hex 07 ff         ; $f629: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff ff      ; $f62b: ff ff ff  Invalid Opcode - ISC $ffff,x
            BEQ __f636         ; $f62e: f0 06     
            AND ($66),y        ; $f630: 31 66     
            .hex 6b fd         ; $f632: 6b fd     Invalid Opcode - ARR #$fd
            .hex fe d9         ; $f634: fe d9     Suspected data
__f636:     RTI                ; $f636: 40        

;-------------------------------------------------------------------------------
            BRK                ; $f637: 00        
            .hex 03 ff         ; $f638: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f63a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 80 00      ; $f63d: ff 80 00  Bad Addr Mode - ISC $0080,x
            BRK                ; $f640: 00        
            BRK                ; $f641: 00        
            BRK                ; $f642: 00        
            BRK                ; $f643: 00        
            BRK                ; $f644: 00        
            BRK                ; $f645: 00        
            .hex 07 ff         ; $f646: 07 ff     Invalid Opcode - SLO $ff
            .hex ff ff fd      ; $f648: ff ff fd  Invalid Opcode - ISC __fdff,x
            SBC $4488,y        ; $f64b: f9 88 44  
            LSR                ; $f64e: 4a        
            ADC ($4c,x)        ; $f64f: 61 4c     
            .hex cf 6c e6      ; $f651: cf 6c e6  Invalid Opcode - DCP __e66c
            ROR $69ee,x        ; $f654: 7e ee 69  
            TYA                ; $f657: 98        
            LSR                ; $f658: 4a        
            DEC $61b2          ; $f659: ce b2 61  
            .hex 04 66         ; $f65c: 04 66     Invalid Opcode - NOP $66
            .hex 64 ce         ; $f65e: 64 ce     Invalid Opcode - NOP $ce
            ADC $ffff          ; $f660: 6d ff ff  
            .hex fe 00 00      ; $f663: fe 00 00  Bad Addr Mode - INC $0000,x
            BRK                ; $f666: 00        
            BRK                ; $f667: 00        
            BRK                ; $f668: 00        
            ORA ($ff,x)        ; $f669: 01 ff     
            .hex ff ff ff      ; $f66b: ff ff ff  Invalid Opcode - ISC $ffff,x
            INC __ffef,x       ; $f66e: fe ef ff  
            .hex ff e6 20      ; $f671: ff e6 20  Invalid Opcode - ISC $20e6,x
            .hex 80 00         ; $f674: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f676: 00        
            BRK                ; $f677: 00        
            BRK                ; $f678: 00        
            BRK                ; $f679: 00        
            BRK                ; $f67a: 00        
            BRK                ; $f67b: 00        
            ORA ($db,x)        ; $f67c: 01 db     
            .hex ef ff ff      ; $f67e: ef ff ff  Invalid Opcode - ISC $ffff
            .hex ff ff f9      ; $f681: ff ff f9  Invalid Opcode - ISC __f9ff,x
            TXA                ; $f684: 8a        
            STA $4c8a,y        ; $f685: 99 8a 4c  
            STA $399b,y        ; $f688: 99 9b 39  
            .hex bf ff c0      ; $f68b: bf ff c0  Invalid Opcode - LAX __c0ff,y
            BRK                ; $f68e: 00        
            BRK                ; $f68f: 00        
            BRK                ; $f690: 00        
            BRK                ; $f691: 00        
            BRK                ; $f692: 00        
            .hex 03 ff         ; $f693: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f695: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f698: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fc 00 00      ; $f69b: fc 00 00  Bad Addr Mode - NOP $0000,x
            BRK                ; $f69e: 00        
__f69f:     BRK                ; $f69f: 00        
            BRK                ; $f6a0: 00        
            BRK                ; $f6a1: 00        
            BRK                ; $f6a2: 00        
            .hex 2f ff df      ; $f6a3: 2f ff df  Invalid Opcode - RLA __dfff
            .hex ff ff ff      ; $f6a6: ff ff ff  Invalid Opcode - ISC $ffff,x
            BEQ __f6ab         ; $f6a9: f0 00     
__f6ab:     BRK                ; $f6ab: 00        
            BRK                ; $f6ac: 00        
            BRK                ; $f6ad: 00        
            BRK                ; $f6ae: 00        
            .hex 7f ff ff      ; $f6af: 7f ff ff  Invalid Opcode - RRA $ffff,x
            .hex ff ff ff      ; $f6b2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff 00 00      ; $f6b5: ff 00 00  Bad Addr Mode - ISC $0000,x
            BRK                ; $f6b8: 00        
            BRK                ; $f6b9: 00        
            BRK                ; $f6ba: 00        
            .hex 3c            ; $f6bb: 3c        Suspected data
__f6bc:     LDY #$00           ; $f6bc: a0 00     
            BRK                ; $f6be: 00        
            BRK                ; $f6bf: 00        
            .hex 1b 7f ff      ; $f6c0: 1b 7f ff  Invalid Opcode - SLO __ff7f,y
            .hex ff ff ff      ; $f6c3: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6c6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fc a0 00      ; $f6c9: fc a0 00  Bad Addr Mode - NOP $00a0,x
            BRK                ; $f6cc: 00        
            BRK                ; $f6cd: 00        
            .hex ff ff fe      ; $f6ce: ff ff fe  Invalid Opcode - ISC __feff,x
            ADC ($00,x)        ; $f6d1: 61 00     
            BRK                ; $f6d3: 00        
            BRK                ; $f6d4: 00        
            BRK                ; $f6d5: 00        
            BRK                ; $f6d6: 00        
            BRK                ; $f6d7: 00        
            BRK                ; $f6d8: 00        
            .hex 3f ff ff      ; $f6d9: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff fb      ; $f6dc: ff ff fb  Invalid Opcode - ISC __fbff,x
            .hex df ff ff      ; $f6df: df ff ff  Invalid Opcode - DCP $ffff,x
            .hex ff cc 00      ; $f6e2: ff cc 00  Bad Addr Mode - ISC $00cc,x
            BRK                ; $f6e5: 00        
            BRK                ; $f6e6: 00        
            BRK                ; $f6e7: 00        
            BRK                ; $f6e8: 00        
            BRK                ; $f6e9: 00        
            BRK                ; $f6ea: 00        
            BRK                ; $f6eb: 00        
            BRK                ; $f6ec: 00        
            BRK                ; $f6ed: 00        
            .hex ff ff ff      ; $f6ee: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6f1: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f6f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            SED                ; $f6f7: f8        
            BRK                ; $f6f8: 00        
            BRK                ; $f6f9: 00        
            BRK                ; $f6fa: 00        
            BRK                ; $f6fb: 00        
            BRK                ; $f6fc: 00        
            BRK                ; $f6fd: 00        
            EOR ($ad,x)        ; $f6fe: 41 ad     
            ROL $ef            ; $f700: 26 ef     
            .hex ff ff ff      ; $f702: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff e0      ; $f705: ff ff e0  Invalid Opcode - ISC __e0ff,x
            BRK                ; $f708: 00        
            BRK                ; $f709: 00        
            BRK                ; $f70a: 00        
            BRK                ; $f70b: 00        
            BRK                ; $f70c: 00        
            BRK                ; $f70d: 00        
            ORA ($5a,x)        ; $f70e: 01 5a     
            .hex ff ff 6f      ; $f710: ff ff 6f  Invalid Opcode - ISC $6fff,x
            .hex ff ff ff      ; $f713: ff ff ff  Invalid Opcode - ISC $ffff,x
            BRK                ; $f716: 00        
            BRK                ; $f717: 00        
            BRK                ; $f718: 00        
            ORA $ff            ; $f719: 05 ff     
            .hex ff ff ff      ; $f71b: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff fa 28      ; $f71e: ff fa 28  Invalid Opcode - ISC $28fa,x
            DEY                ; $f721: 88        
            BPL __f764         ; $f722: 10 40     
            BRK                ; $f724: 00        
            .hex 02            ; $f725: 02        Invalid Opcode - KIL 
            BPL __f6bc         ; $f726: 10 94     
            ROR $73            ; $f728: 66 73     
            ROL $f7,x          ; $f72a: 36 f7     
            .hex ff ff fc      ; $f72c: ff ff fc  Invalid Opcode - ISC __fcff,x
            BRK                ; $f72f: 00        
            BRK                ; $f730: 00        
            BRK                ; $f731: 00        
            BRK                ; $f732: 00        
            .hex ff ff ff      ; $f733: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff f8      ; $f736: ff ff f8  Invalid Opcode - ISC __f8ff,x
            BRK                ; $f739: 00        
            BRK                ; $f73a: 00        
            BRK                ; $f73b: 00        
            .hex 0f b1 44      ; $f73c: 0f b1 44  Invalid Opcode - SLO $44b1
            BPL __f741         ; $f73f: 10 00     
__f741:     BRK                ; $f741: 00        
            ADC $33            ; $f742: 65 33     
            .hex df ff ff      ; $f744: df ff ff  Invalid Opcode - DCP $ffff,x
            SBC __ff9e,y       ; $f747: f9 9e ff  
            .hex ff ff ff      ; $f74a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fa            ; $f74d: fa        Invalid Opcode - NOP 
            CPX $00            ; $f74e: e4 00     
            BRK                ; $f750: 00        
            BRK                ; $f751: 00        
            BRK                ; $f752: 00        
            BRK                ; $f753: 00        
            BRK                ; $f754: 00        
            BRK                ; $f755: 00        
            BRK                ; $f756: 00        
            ORA ($ff,x)        ; $f757: 01 ff     
            .hex ff ff ff      ; $f759: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f75c: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex 80 00         ; $f75f: 80 00     Invalid Opcode - NOP #$00
            BRK                ; $f761: 00        
            BRK                ; $f762: 00        
            .hex 02            ; $f763: 02        Invalid Opcode - KIL 
__f764:     .hex fb dd b6      ; $f764: fb dd b6  Invalid Opcode - ISC $b6dd,y
            .hex b7 77         ; $f767: b7 77     Invalid Opcode - LAX $77,y
            .hex da            ; $f769: da        Invalid Opcode - NOP 
            PLP                ; $f76a: 28        
            STA $bf4a,y        ; $f76b: 99 4a bf  
            .hex ff c8 00      ; $f76e: ff c8 00  Bad Addr Mode - ISC $00c8,x
            BRK                ; $f771: 00        
            BRK                ; $f772: 00        
            BRK                ; $f773: 00        
            BRK                ; $f774: 00        
            .hex 1f ff ff      ; $f775: 1f ff ff  Invalid Opcode - SLO $ffff,x
            .hex ff ff ff      ; $f778: ff ff ff  Invalid Opcode - ISC $ffff,x
__f77b:     .hex ff ff 00      ; $f77b: ff ff 00  Bad Addr Mode - ISC $00ff,x
            BRK                ; $f77e: 00        
            BRK                ; $f77f: 00        
            BRK                ; $f780: 00        
            BRK                ; $f781: 00        
            BRK                ; $f782: 00        
            BRK                ; $f783: 00        
            .hex 0f ff ff      ; $f784: 0f ff ff  Invalid Opcode - SLO $ffff
            .hex ff ff ff      ; $f787: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff c0 00      ; $f78a: ff c0 00  Bad Addr Mode - ISC $00c0,x
            BRK                ; $f78d: 00        
            BRK                ; $f78e: 00        
            BRK                ; $f78f: 00        
            BRK                ; $f790: 00        
            BRK                ; $f791: 00        
            BRK                ; $f792: 00        
            JSR $6d45          ; $f793: 20 45 6d  
            .hex ff ff ff      ; $f796: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f799: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff f4      ; $f79c: ff ff f4  Invalid Opcode - ISC __f4ff,x
            BRK                ; $f79f: 00        
            BRK                ; $f7a0: 00        
            .hex 07 bd         ; $f7a1: 07 bd     Invalid Opcode - SLO $bd
            .hex ff bc c4      ; $f7a3: ff bc c4  Invalid Opcode - ISC __c4bc,x
            .hex 80 40         ; $f7a6: 80 40     Invalid Opcode - NOP #$40
            BRK                ; $f7a8: 00        
            BRK                ; $f7a9: 00        
            BRK                ; $f7aa: 00        
            BRK                ; $f7ab: 00        
            ASL $32            ; $f7ac: 06 32     
            INC $b6ce          ; $f7ae: ee ce b6  
            .hex df 7b bf      ; $f7b1: df 7b bf  Invalid Opcode - DCP $bf7b,x
            .hex bf f7 dc      ; $f7b4: bf f7 dc  Invalid Opcode - LAX __dcf7,y
            .hex ef ff f2      ; $f7b7: ef ff f2  Invalid Opcode - ISC __f2ff
            BRK                ; $f7ba: 00        
            BRK                ; $f7bb: 00        
            BRK                ; $f7bc: 00        
            BRK                ; $f7bd: 00        
            BRK                ; $f7be: 00        
            BRK                ; $f7bf: 00        
            .hex 0b ff         ; $f7c0: 0b ff     Invalid Opcode - ANC #$ff
            .hex ff ff ff      ; $f7c2: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff fc 00      ; $f7c5: ff fc 00  Bad Addr Mode - ISC $00fc,x
            .hex 8f 7f 76      ; $f7c8: 8f 7f 76  Invalid Opcode - SAX $767f
            DEC $9052          ; $f7cb: ce 52 90  
            BRK                ; $f7ce: 00        
            BRK                ; $f7cf: 00        
            BRK                ; $f7d0: 00        
            .hex 7b 62 00      ; $f7d1: 7b 62 00  Invalid Opcode - RRA $0062,y
            BRK                ; $f7d4: 00        
            BRK                ; $f7d5: 00        
            BRK                ; $f7d6: 00        
            .hex 32            ; $f7d7: 32        Invalid Opcode - KIL 
            .hex 23 7f         ; $f7d8: 23 7f     Invalid Opcode - RLA ($7f,x)
__f7da:     .hex ff ff ff      ; $f7da: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff ff      ; $f7dd: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff 00      ; $f7e0: ff ff 00  Bad Addr Mode - ISC $00ff,x
            BRK                ; $f7e3: 00        
            BRK                ; $f7e4: 00        
            BRK                ; $f7e5: 00        
            BRK                ; $f7e6: 00        
            BRK                ; $f7e7: 00        
            .hex 02            ; $f7e8: 02        Invalid Opcode - KIL 
            .hex 6f ff fe      ; $f7e9: 6f ff fe  Invalid Opcode - RRA __feff
            .hex ef 32 98      ; $f7ec: ef 32 98  Invalid Opcode - ISC $9832
            STY $3325          ; $f7ef: 8c 25 33  
            LSR $bff7,x        ; $f7f2: 5e f7 bf  
            SBC $99,x          ; $f7f5: f5 99     
            .hex df ff fe      ; $f7f7: df ff fe  Invalid Opcode - DCP __feff,x
            ASL $6c            ; $f7fa: 06 6c     
            PHA                ; $f7fc: 48        
            CPY $89            ; $f7fd: c4 89     
            ORA ($04),y        ; $f7ff: 11 04     
            EOR $14            ; $f801: 45 14     
            .hex 33 bc         ; $f803: 33 bc     Invalid Opcode - RLA ($bc),y
            DEY                ; $f805: 88        
            BRK                ; $f806: 00        
            BRK                ; $f807: 00        
            BRK                ; $f808: 00        
            BRK                ; $f809: 00        
            ROL $6b            ; $f80a: 26 6b     
            EOR $ffff,x        ; $f80c: 5d ff ff  
__f80f:     .hex ff ff ff      ; $f80f: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff            ; $f812: ff        Suspected data
__f813:     .hex ff f0 04      ; $f813: ff f0 04  Invalid Opcode - ISC $04f0,x
__f816:     BRK                ; $f816: 00        
            BRK                ; $f817: 00        
            BRK                ; $f818: 00        
            PHP                ; $f819: 08        
            DEY                ; $f81a: 88        
            DEC $66            ; $f81b: c6 66     
            DEC $dd,x          ; $f81d: d6 dd     
            .hex bb 33 67      ; $f81f: bb 33 67  Invalid Opcode - LAS $6733,y
__f822:     .hex 3b bb ff      ; $f822: 3b bb ff  Invalid Opcode - RLA __ffbb,y
__f825:     SBC $640a,x        ; $f825: fd 0a 64  
            .hex 90            ; $f828: 90        Suspected data
__f829:     .hex 01            ; $f829: 01        Suspected data
__f82a:     BRK                ; $f82a: 00        
            BRK                ; $f82b: 00        
__f82c:     .hex 8c ab         ; $f82c: 8c ab     Suspected data
__f82e:     .hex bb ff         ; $f82e: bb ff     Suspected data
__f830:     .hex ff fb         ; $f830: ff fb     Suspected data
__f832:     .hex ff            ; $f832: ff        Suspected data
__f833:     EOR __cacc,x       ; $f833: 5d cc ca  
            .hex 53 33         ; $f836: 53 33     Invalid Opcode - SRE ($33),y
            .hex 14 21         ; $f838: 14 21     Invalid Opcode - NOP $21,x
            PHP                ; $f83a: 08        
            STY $11            ; $f83b: 84 11     
            ORA #$14           ; $f83d: 09 14     
            EOR $22            ; $f83f: 45 22     
            JMP $6b66          ; $f841: 4c 66 6b  

;-------------------------------------------------------------------------------
            .hex 32            ; $f844: 32        Invalid Opcode - KIL 
            BPL __f7da         ; $f845: 10 93     
            .hex bf ff ff      ; $f847: bf ff ff  Invalid Opcode - LAX $ffff,y
            .hex ff ff ff      ; $f84a: ff ff ff  Invalid Opcode - ISC $ffff,x
            CPY #$00           ; $f84d: c0 00     
            BRK                ; $f84f: 00        
            BRK                ; $f850: 00        
            BRK                ; $f851: 00        
            BRK                ; $f852: 00        
            .hex bf fb f7      ; $f853: bf fb f7  Invalid Opcode - LAX __f7fb,y
            .hex 77 ff         ; $f856: 77 ff     Invalid Opcode - RRA $ff,x
            CPX $20            ; $f858: e4 20     
            .hex 42            ; $f85a: 42        Invalid Opcode - KIL 
            JMP $67cd          ; $f85b: 4c cd 67  

;-------------------------------------------------------------------------------
            ADC $ee,x          ; $f85e: 75 ee     
            DEC __d97a         ; $f860: ce 7a d9  
            STA $31b3,x        ; $f863: 9d b3 31  
            STY $82            ; $f866: 84 82     
            .hex 44 8a         ; $f868: 44 8a     Invalid Opcode - NOP $8a
            ADC $55            ; $f86a: 65 55     
            STA $33b3,x        ; $f86c: 9d b3 33  
            .hex 5f b6 dc      ; $f86f: 5f b6 dc  Invalid Opcode - SRE __dcb6,x
            LDY #$00           ; $f872: a0 00     
            BRK                ; $f874: 00        
            BRK                ; $f875: 00        
            BRK                ; $f876: 00        
            .hex 03 ff         ; $f877: 03 ff     Invalid Opcode - SLO ($ff,x)
            .hex ff ff ff      ; $f879: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff f9      ; $f87c: ff ff f9  Invalid Opcode - ISC __f9ff,x
            .hex 02            ; $f87f: 02        Invalid Opcode - KIL 
            BRK                ; $f880: 00        
            BRK                ; $f881: 00        
            BRK                ; $f882: 00        
            .hex 32            ; $f883: 32        Invalid Opcode - KIL 
            DEY                ; $f884: 88        
            BRK                ; $f885: 00        
            .hex 12            ; $f886: 12        Invalid Opcode - KIL 
            STA __ee9c,y       ; $f887: 99 9c ee  
            .hex f7 ff         ; $f88a: f7 ff     Invalid Opcode - ISC $ff,x
            .hex ff ff 84      ; $f88c: ff ff 84  Invalid Opcode - ISC $84ff,x
            BRK                ; $f88f: 00        
            BRK                ; $f890: 00        
            .hex 04 50         ; $f891: 04 50     Invalid Opcode - NOP $50
            TXA                ; $f893: 8a        
            .hex ff ff ff      ; $f894: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff fc 00      ; $f897: ff fc 00  Bad Addr Mode - ISC $00fc,x
            STX $7f            ; $f89a: 86 7f     
            .hex ff ff e0      ; $f89c: ff ff e0  Invalid Opcode - ISC __e0ff,x
            BRK                ; $f89f: 00        
            BRK                ; $f8a0: 00        
            BRK                ; $f8a1: 00        
            BRK                ; $f8a2: 00        
            .hex 3f bf fb      ; $f8a3: 3f bf fb  Invalid Opcode - RLA __fbbf,x
            LDX $99d9          ; $f8a6: ae d9 99  
            .hex d7 28         ; $f8a9: d7 28     Invalid Opcode - DCP $28,x
            BRK                ; $f8ab: 00        
            BRK                ; $f8ac: 00        
            BRK                ; $f8ad: 00        
            BRK                ; $f8ae: 00        
            BRK                ; $f8af: 00        
            BRK                ; $f8b0: 00        
            ADC $ffff,x        ; $f8b1: 7d ff ff  
            .hex ff ff ff      ; $f8b4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff e8 48      ; $f8b7: ff e8 48  Invalid Opcode - ISC $48e8,x
            LDY $c6            ; $f8ba: a4 c6     
            EOR $8862          ; $f8bc: 4d 62 88  
            .hex 45            ; $f8bf: 45        Suspected data
__f8c0:     .hex 5f 6c 80      ; $f8c0: 5f 6c 80  Invalid Opcode - SRE $806c,x
            BRK                ; $f8c3: 00        
            BRK                ; $f8c4: 00        
            ORA ($19,x)        ; $f8c5: 01 19     
            TXS                ; $f8c7: 9a        
            .hex db bf ff      ; $f8c8: db bf ff  Invalid Opcode - DCP __ffbf,y
            INC $33fb,x        ; $f8cb: fe fb 33  
            LSR $bfff,x        ; $f8ce: 5e ff bf  
            ROR $da,x          ; $f8d1: 76 da     
            INC $64            ; $f8d3: e6 64     
            DEC $00,x          ; $f8d5: d6 00     
            BRK                ; $f8d7: 00        
            BRK                ; $f8d8: 00        
            BRK                ; $f8d9: 00        
            BRK                ; $f8da: 00        
            BRK                ; $f8db: 00        
            .hex db 33 14      ; $f8dc: db 33 14  Invalid Opcode - DCP $1433,y
            .hex 22            ; $f8df: 22        Invalid Opcode - KIL 
            STY $1844          ; $f8e0: 8c 44 18  
            .hex ef ff ff      ; $f8e3: ef ff ff  Invalid Opcode - ISC $ffff
            .hex ff ff ff      ; $f8e6: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff f0      ; $f8e9: ff ff f0  Invalid Opcode - ISC __f0ff,x
            BRK                ; $f8ec: 00        
            BRK                ; $f8ed: 00        
            BRK                ; $f8ee: 00        
            BRK                ; $f8ef: 00        
            BRK                ; $f8f0: 00        
            DEC $9d75          ; $f8f1: ce 75 9d  
            .hex 9c e7 99      ; $f8f4: 9c e7 99  Invalid Opcode - SHY $99e7,x
            STA $6a9a,y        ; $f8f7: 99 9a 6a  
            .hex 64 cc         ; $f8fa: 64 cc     Invalid Opcode - NOP $cc
            CPY __cdcc         ; $f8fc: cc cc cd  
            .hex 6b 2a         ; $f8ff: 6b 2a     Invalid Opcode - ARR #$2a
            .hex 67 35         ; $f901: 67 35     Invalid Opcode - RRA $35
__f903:     .hex 9b            ; $f903: 9b        Invalid Opcode - TAS 
            .hex 33 19         ; $f904: 33 19     Invalid Opcode - RLA ($19),y
            STY __cccc         ; $f906: 8c cc cc  
            DEX                ; $f909: ca        
            .hex 67 7f         ; $f90a: 67 7f     Invalid Opcode - RRA $7f
            .hex f2            ; $f90c: f2        Invalid Opcode - KIL 
            BRK                ; $f90d: 00        
            .hex 02            ; $f90e: 02        Invalid Opcode - KIL 
            ORA $b7db,y        ; $f90f: 19 db b7  
            EOR $ffff,x        ; $f912: 5d ff ff  
            .hex fc 20 00      ; $f915: fc 20 00  Bad Addr Mode - NOP $0020,x
            BRK                ; $f918: 00        
            BRK                ; $f919: 00        
            BRK                ; $f91a: 00        
            .hex 17 f6         ; $f91b: 17 f6     Invalid Opcode - SLO $f6,x
            .hex 33 3e         ; $f91d: 33 3e     Invalid Opcode - RLA ($3e),y
__f91f:     .hex ff ff ff      ; $f91f: ff ff ff  Invalid Opcode - ISC $ffff,x
__f922:     INC $8df5,x        ; $f922: fe f5 8d  
            .hex 9f 4c 00      ; $f925: 9f 4c 00  Invalid Opcode - AHX $004c,y
            BRK                ; $f928: 00        
            BRK                ; $f929: 00        
            BRK                ; $f92a: 00        
            BRK                ; $f92b: 00        
            BRK                ; $f92c: 00        
            BRK                ; $f92d: 00        
            .hex 3f ff ff      ; $f92e: 3f ff ff  Invalid Opcode - RLA $ffff,x
            .hex ff ff ff      ; $f931: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff f4 80      ; $f934: ff f4 80  Invalid Opcode - ISC $80f4,x
            BRK                ; $f937: 00        
            BRK                ; $f938: 00        
            BRK                ; $f939: 00        
            BRK                ; $f93a: 00        
            .hex 7f ff e6      ; $f93b: 7f ff e6  Invalid Opcode - RRA __e6ff,x
            BVC __f8c0         ; $f93e: 50 80     
            BRK                ; $f940: 00        
            ORA $ffff,y        ; $f941: 19 ff ff  
            .hex ff ff ff      ; $f944: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex eb 33         ; $f947: eb 33     Invalid Opcode - SBC #$33
            .hex 12            ; $f949: 12        Invalid Opcode - KIL 
            BRK                ; $f94a: 00        
            BRK                ; $f94b: 00        
            STA ($10,x)        ; $f94c: 81 10     
            .hex 22            ; $f94e: 22        Invalid Opcode - KIL 
            .hex 33 b5         ; $f94f: 33 b5     Invalid Opcode - RLA ($b5),y
            .hex 22            ; $f951: 22        Invalid Opcode - KIL 
            .hex 12            ; $f952: 12        Invalid Opcode - KIL 
            .hex 53 5b         ; $f953: 53 5b     Invalid Opcode - SRE ($5b),y
            EOR __f77b,x       ; $f955: 5d 7b f7  
            INC __ccba         ; $f958: ee ba cc  
            CPY $99cd          ; $f95b: cc cd 99  
            TYA                ; $f95e: 98        
            DEC $66            ; $f95f: c6 66     
            ADC ($98),y        ; $f961: 71 98     
            DEY                ; $f963: 88        
            STA ($8c),y        ; $f964: 91 8c     
            JMP $52fb          ; $f966: 4c fb 52  

;-------------------------------------------------------------------------------
            .hex 42            ; $f969: 42        Invalid Opcode - KIL 
            .hex 52            ; $f96a: 52        Invalid Opcode - KIL 
            STA __d9dd,y       ; $f96b: 99 dd d9  
            STA $bfbf,x        ; $f96e: 9d bf bf  
            CPY $0144          ; $f971: cc 44 01  
            ORA ($00,x)        ; $f974: 01 00     
            BRK                ; $f976: 00        
            .hex 14 ee         ; $f977: 14 ee     Invalid Opcode - NOP $ee,x
            .hex ff ff         ; $f979: ff ff     Suspected data
__f97b:     .hex ff ff fd      ; $f97b: ff ff fd  Invalid Opcode - ISC __fdff,x
            .hex 77 7e         ; $f97e: 77 7e     Invalid Opcode - RRA $7e,x
            .hex 42            ; $f980: 42        Invalid Opcode - KIL 
            BRK                ; $f981: 00        
            RTI                ; $f982: 40        

;-------------------------------------------------------------------------------
            BRK                ; $f983: 00        
            BRK                ; $f984: 00        
            BRK                ; $f985: 00        
            BRK                ; $f986: 00        
            ASL                ; $f987: 0a        
            .hex 33 3d         ; $f988: 33 3d     Invalid Opcode - RLA ($3d),y
            .hex ff ff ff      ; $f98a: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex ff ff fe      ; $f98d: ff ff fe  Invalid Opcode - ISC __feff,x
            ROR $62            ; $f990: 66 62     
            .hex 22            ; $f992: 22        Invalid Opcode - KIL 
            PHP                ; $f993: 08        
            EOR ($02,x)        ; $f994: 41 02     
            .hex 13 31         ; $f996: 13 31     Invalid Opcode - SLO ($31),y
            STY $10            ; $f998: 84 10     
            ORA #$af           ; $f99a: 09 af     
            .hex 7b 5c cc      ; $f99c: 7b 5c cc  Invalid Opcode - RRA __cc5c,y
            DEC $73,x          ; $f99f: d6 73     
            AND $b394,y        ; $f9a1: 39 94 b3  
            .hex bf ff ff      ; $f9a4: bf ff ff  Invalid Opcode - LAX $ffff,y
            .hex ff ee d6      ; $f9a7: ff ee d6  Invalid Opcode - ISC __d6ee,x
            ROR $28            ; $f9aa: 66 28     
            LDX #$08           ; $f9ac: a2 08     
            RTI                ; $f9ae: 40        

;-------------------------------------------------------------------------------
            BPL __f97b         ; $f9af: 10 ca     
            RTI                ; $f9b1: 40        

;-------------------------------------------------------------------------------
            BRK                ; $f9b2: 00        
            BRK                ; $f9b3: 00        
            BPL __fa06         ; $f9b4: 10 50     
            CPY $bbcd          ; $f9b6: cc cd bb  
            .hex f7 f7         ; $f9b9: f7 f7     Invalid Opcode - ISC $f7,x
            SBC $7eff,x        ; $f9bb: fd ff 7e  
            .hex fa            ; $f9be: fa        Invalid Opcode - NOP 
            CMP $98,x          ; $f9bf: d5 98     
            CMP $33            ; $f9c1: c5 33     
            .hex 67 ae         ; $f9c3: 67 ae     Invalid Opcode - RRA $ae
            ADC $99,x          ; $f9c5: 75 99     
            LSR                ; $f9c7: 4a        
            BPL __fa0a         ; $f9c8: 10 40     
            STA ($01,x)        ; $f9ca: 81 01     
            BRK                ; $f9cc: 00        
            BCC __fa20         ; $f9cd: 90 51     
            STY __efcd         ; $f9cf: 8c cd ef  
            SBC $a9,x          ; $f9d2: f5 a9     
            EOR $12            ; $f9d4: 45 12     
            STY $cc,x          ; $f9d6: 94 cc     
            CMP #$9e           ; $f9d8: c9 9e     
            .hex f7 ff         ; $f9da: f7 ff     Invalid Opcode - ISC $ff,x
            .hex ff ff ff      ; $f9dc: ff ff ff  Invalid Opcode - ISC $ffff,x
            ADC __ccd9,y       ; $f9df: 79 d9 cc  
            SBC $48            ; $f9e2: e5 48     
            DEY                ; $f9e4: 88        
            STY $04            ; $f9e5: 84 04     
            PHP                ; $f9e7: 08        
            AND ($11,x)        ; $f9e8: 21 11     
            .hex 14 e3         ; $f9ea: 14 e3     Invalid Opcode - NOP $e3,x
            .hex 1c d3 35      ; $f9ec: 1c d3 35  Invalid Opcode - NOP $35d3,x
            STA $0091,y        ; $f9ef: 99 91 00  
            ORA #$36           ; $f9f2: 09 36     
            .hex ff ff ff      ; $f9f4: ff ff ff  Invalid Opcode - ISC $ffff,x
            .hex fd 6b         ; $f9f7: fd 6b     Suspected data
__f9f9:     .hex 32            ; $f9f9: 32        Invalid Opcode - KIL 
            PLP                ; $f9fa: 28        
            BRK                ; $f9fb: 00        
            STA ($29,x)        ; $f9fc: 81 29     
            .hex b7 7b         ; $f9fe: b7 7b     Invalid Opcode - LAX $7b,y
            .hex f7 eb         ; $fa00: f7 eb     Invalid Opcode - ISC $eb,x
            LDA $9b,x          ; $fa02: b5 9b     
            .hex 19 4a         ; $fa04: 19 4a     Suspected data
__fa06:     BIT $44            ; $fa06: 24 44     
            .hex 42            ; $fa08: 42        Invalid Opcode - KIL 
            .hex 25            ; $fa09: 25        Suspected data
__fa0a:     EOR $8198,y        ; $fa0a: 59 98 81  
            JSR $4624          ; $fa0d: 20 24 46  
            .hex 33 33         ; $fa10: 33 33     Invalid Opcode - RLA ($33),y
            .hex 9e ee fb      ; $fa12: 9e ee fb  Invalid Opcode - SHX __fbee,y
            .hex f7 ff         ; $fa15: f7 ff     Invalid Opcode - ISC $ff,x
            LDX $9cd9,y        ; $fa17: be d9 9c  
            .hex ef 75 ed      ; $fa1a: ef 75 ed  Invalid Opcode - ISC __ed75
            INC $84d9          ; $fa1d: ee d9 84  
__fa20:     EOR ($04,x)        ; $fa20: 41 04     
            BRK                ; $fa22: 00        
            STA ($01,x)        ; $fa23: 81 01     
            ORA #$11           ; $fa25: 09 11     
            .hex 14 4c         ; $fa27: 14 4c     Invalid Opcode - NOP $4c,x
            ROR                ; $fa29: 6a        
            .hex 6b 39         ; $fa2a: 6b 39     Invalid Opcode - ARR #$39
            .hex cf ba e6      ; $fa2c: cf ba e6  Invalid Opcode - DCP __e6ba
            .hex b7 7f         ; $fa2f: b7 7f     Invalid Opcode - LAX $7f,y
            .hex df 66 22      ; $fa31: df 66 22  Invalid Opcode - DCP $2266,x
            BRK                ; $fa34: 00        
            .hex 04 65         ; $fa35: 04 65     Invalid Opcode - NOP $65
            .hex d7 bf         ; $fa37: d7 bf     Invalid Opcode - DCP $bf,x
            LDX $bdff,y        ; $fa39: be ff bd  
            DEC $6266          ; $fa3c: ce 66 62  
            STY $91,x          ; $fa3f: 94 91     
            .hex 42            ; $fa41: 42        Invalid Opcode - KIL 
            .hex 93 ac         ; $fa42: 93 ac     Invalid Opcode - AHX ($ac),y
            CPY $00            ; $fa44: c4 00     
            RTI                ; $fa46: 40        

;-------------------------------------------------------------------------------
            JSR $0804          ; $fa47: 20 04 08  
            CMP __ff7f         ; $fa4a: cd 7f ff  
            .hex ff f7 fb      ; $fa4d: ff f7 fb  Invalid Opcode - ISC __fbf7,x
            .hex ef 76 a4      ; $fa50: ef 76 a4  Invalid Opcode - ISC $a476
            DEY                ; $fa53: 88        
            STY $11            ; $fa54: 84 11     
            .hex 23 18         ; $fa56: 23 18     Invalid Opcode - RLA ($18,x)
            DEC $62            ; $fa58: c6 62     
            EOR $18            ; $fa5a: 45 18     
            LDY $cc            ; $fa5c: a4 cc     
            DEC $77,x          ; $fa5e: d6 77     
            .hex be            ; $fa60: be        Suspected data
__fa61:     CMP $2189,y        ; $fa61: d9 89 21  
            PHP                ; $fa64: 08        
            LDX #$98           ; $fa65: a2 98     
            .hex da            ; $fa67: da        Invalid Opcode - NOP 
            .hex eb db         ; $fa68: eb db     Invalid Opcode - SBC #$db
            .hex bb ef de      ; $fa6a: bb ef de  Invalid Opcode - LAS __deef,y
            SBC $8a99          ; $fa6d: ed 99 8a  
            .hex 6b 5b         ; $fa70: 6b 5b     Invalid Opcode - ARR #$5b
            EOR __ccd6,x       ; $fa72: 5d d6 cc  
            CPY $28e7          ; $fa75: cc e7 28  
            BRK                ; $fa78: 00        
            BRK                ; $fa79: 00        
            BRK                ; $fa7a: 00        
            BRK                ; $fa7b: 00        
            BRK                ; $fa7c: 00        
            STA $1c33,y        ; $fa7d: 99 33 1c  
            .hex db de f7      ; $fa80: db de f7  Invalid Opcode - DCP __f7de,y
            .hex 7f bf ce      ; $fa83: 7f bf ce  Invalid Opcode - RRA __cebf,x
            ADC $9a,x          ; $fa86: 75 9a     
            CMP $0893          ; $fa88: cd 93 08  
            LDX $67            ; $fa8b: a6 67     
            ROL $b6,x          ; $fa8d: 36 b6     
            LDX $b3,y          ; $fa8f: b6 b3     
            .hex 9c d9 9b      ; $fa91: 9c d9 9b  Invalid Opcode - SHY $9bd9,x
            BIT $10            ; $fa94: 24 10     
            AND ($02,x)        ; $fa96: 21 02     
            ORA ($46),y        ; $fa98: 11 46     
            JMP $9ccd          ; $fa9a: 4c cd 9c  

;-------------------------------------------------------------------------------
            CMP __ced9,y       ; $fa9d: d9 d9 ce  
            LDA $b9fb,x        ; $faa0: bd fb b9  
            STY $24,x          ; $faa3: 94 24     
            .hex 22            ; $faa5: 22        Invalid Opcode - KIL 
            LSR $32            ; $faa6: 46 32     
            ROR $6d            ; $faa8: 66 6d     
            ADC $ed,x          ; $faaa: 75 ed     
            .hex f7 76         ; $faac: f7 76     Invalid Opcode - ISC $76,x
            CMP $33b3          ; $faae: cd b3 33  
            TXS                ; $fab1: 9a        
            .hex db 5a cd      ; $fab2: db 5a cd  Invalid Opcode - DCP __cd5a,y
            .hex 67 30         ; $fab5: 67 30     Invalid Opcode - RRA $30
            STY $21            ; $fab7: 84 21     
            ORA ($04),y        ; $fab9: 11 04     
            .hex 22            ; $fabb: 22        Invalid Opcode - KIL 
            BPL __fa61         ; $fabc: 10 a3     
            CLC                ; $fabe: 18        
            CPY __d9da         ; $fabf: cc da d9  
            .hex 92            ; $fac2: 92        Invalid Opcode - KIL 
            ROL $67            ; $fac3: 26 67     
            ROR $67            ; $fac5: 66 67     
            AND __ebd6,y       ; $fac7: 39 d6 eb  
            .hex d7 bb         ; $faca: d7 bb     Invalid Opcode - DCP $bb,x
            .hex bb 9d 99      ; $facc: bb 9d 99  Invalid Opcode - LAS $999d,y
            STA $9b99,y        ; $facf: 99 99 9b  
            .hex 32            ; $fad2: 32        Invalid Opcode - KIL 
            ADC ($49,x)        ; $fad3: 61 49     
            STA $8cb3,x        ; $fad5: 9d b3 8c  
            AND ($11,x)        ; $fad8: 21 11     
            BPL __fb2d         ; $fada: 10 51     
            .hex 43 1b         ; $fadc: 43 1b     Invalid Opcode - SRE ($1b,x)
            AND __fefb,x       ; $fade: 3d fb fe  
            SBC __e7ee,x       ; $fae1: fd ee e7  
            ROR $66            ; $fae4: 66 66     
            AND #$46           ; $fae6: 29 46     
            .hex 22            ; $fae8: 22        Invalid Opcode - KIL 
            .hex 89 14         ; $fae9: 89 14     Invalid Opcode - NOP #$14
            PLP                ; $faeb: 28        
            LSR                ; $faec: 4a        
            .hex 14 a6         ; $faed: 14 a6     Invalid Opcode - NOP $a6,x
            .hex 53 3b         ; $faef: 53 3b     Invalid Opcode - SRE ($3b),y
            JMP ($44cc)        ; $faf1: 6c cc 44  

;-------------------------------------------------------------------------------
            PHP                ; $faf4: 08        
            LSR $67            ; $faf5: 46 67     
            .hex 5f bf df      ; $faf7: 5f bf df  Invalid Opcode - SRE __dfbf,x
            .hex 77 be         ; $fafa: 77 be     Invalid Opcode - RRA $be,x
            INC $62e6,x        ; $fafc: fe e6 62  
            PLP                ; $faff: 28        
            ORA ($08),y        ; $fb00: 11 08     
            STY $82            ; $fb02: 84 82     
            ROL $6b            ; $fb04: 26 6b     
            .hex af 7d fe      ; $fb06: af 7d fe  Invalid Opcode - LAX __fe7d
            CMP $6666,x        ; $fb09: dd 66 66  
            .hex 33 18         ; $fb0c: 33 18     Invalid Opcode - RLA ($18),y
            CMP $28            ; $fb0e: c5 28     
            CMP $31            ; $fb10: c5 31     
            JMP $2565          ; $fb12: 4c 65 25  

;-------------------------------------------------------------------------------
            .hex 32            ; $fb15: 32        Invalid Opcode - KIL 
            LDA #$99           ; $fb16: a9 99     
            .hex 32            ; $fb18: 32        Invalid Opcode - KIL 
            ROR $66            ; $fb19: 66 66     
            ROR $b3            ; $fb1b: 66 b3     
            DEC $cc,x          ; $fb1d: d6 cc     
            .hex e7 6e         ; $fb1f: e7 6e     Invalid Opcode - ISC $6e
            EOR ($22),y        ; $fb21: 51 22     
            .hex 53 67         ; $fb23: 53 67     Invalid Opcode - SRE ($67),y
            .hex 77 7d         ; $fb25: 77 7d     Invalid Opcode - RRA $7d,x
            .hex 73 4a         ; $fb27: 73 4a     Invalid Opcode - RRA ($4a),y
            .hex 22            ; $fb29: 22        Invalid Opcode - KIL 
            STX $6c,y          ; $fb2a: 96 6c     
            .hex cc            ; $fb2c: cc        Suspected data
__fb2d:     DEX                ; $fb2d: ca        
            ROR $33            ; $fb2e: 66 33     
            BIT __cccc         ; $fb30: 2c cc cc  
            INC $6b            ; $fb33: e6 6b     
            AND $99,x          ; $fb35: 35 99     
            TXS                ; $fb37: 9a        
            .hex cb 33         ; $fb38: cb 33     Invalid Opcode - AXS #$33
            .hex 32            ; $fb3a: 32        Invalid Opcode - KIL 
            EOR ($24),y        ; $fb3b: 51 24     
            .hex cb 39         ; $fb3d: cb 39     Invalid Opcode - AXS #$39
            .hex d7 39         ; $fb3f: d7 39     Invalid Opcode - DCP $39,x
            CPY __c6cc         ; $fb41: cc cc c6  
            .hex 63 0a         ; $fb44: 63 0a     Invalid Opcode - RRA ($0a,x)
            PHA                ; $fb46: 48        
            DEY                ; $fb47: 88        
            .hex 93 18         ; $fb48: 93 18     Invalid Opcode - AHX ($18),y
            .hex 93 18         ; $fb4a: 93 18     Invalid Opcode - AHX ($18),y
            CPY $73ce          ; $fb4c: cc ce 73  
            .hex 9b            ; $fb4f: 9b        Invalid Opcode - TAS 
            EOR $75cd,y        ; $fb50: 59 cd 75  
            CMP $b3ee,x        ; $fb53: dd ee b3  
            ORA $7366,y        ; $fb56: 19 66 73  
            .hex 6b 67         ; $fb59: 6b 67     Invalid Opcode - ARR #$67
            EOR $66ce,y        ; $fb5b: 59 ce 66  
            ROR $e7            ; $fb5e: 66 e7     
            TXS                ; $fb60: 9a        
            .hex 62            ; $fb61: 62        Invalid Opcode - KIL 
            BPL __fb65         ; $fb62: 10 01     
            .hex 04            ; $fb64: 04        Suspected data
__fb65:     .hex 67 6d         ; $fb65: 67 6d     Invalid Opcode - RRA $6d
            STA $3333,y        ; $fb67: 99 33 33  
            STA $76ae,x        ; $fb6a: 9d ae 76  
            LDX $ac,y          ; $fb6d: b6 ac     
            CPY $6cce          ; $fb6f: cc ce 6c  
            DEX                ; $fb72: ca        
            .hex 22            ; $fb73: 22        Invalid Opcode - KIL 
            PHP                ; $fb74: 08        
            BPL __fbbb         ; $fb75: 10 44     
            EOR #$12           ; $fb77: 49 12     
            .hex 93 3a         ; $fb79: 93 3a     Invalid Opcode - AHX ($3a),y
            .hex ff 7f ad      ; $fb7b: ff 7f ad  Invalid Opcode - ISC $ad7f,x
            .hex 5a            ; $fb7e: 5a        Invalid Opcode - NOP 
            .hex da            ; $fb7f: da        Invalid Opcode - NOP 
            .hex eb 6b         ; $fb80: eb 6b     Invalid Opcode - SBC #$6b
            AND __d9cc,y       ; $fb82: 39 cc d9  
            STA $2693,y        ; $fb85: 99 93 26  
            AND #$29           ; $fb88: 29 29     
            AND ($46),y        ; $fb8a: 31 46     
            AND ($94),y        ; $fb8c: 31 94     
            CPY __c6cc         ; $fb8e: cc cc c6  
            .hex 53 99         ; $fb91: 53 99     Invalid Opcode - SRE ($99),y
            STA $35ab,y        ; $fb93: 99 ab 35  
            JMP ($66ce)        ; $fb96: 6c ce 66  

;-------------------------------------------------------------------------------
            CMP __e69a         ; $fb99: cd 9a e6  
            CMP __cd99         ; $fb9c: cd 99 cd  
            STA $b2b2,y        ; $fb9f: 99 b2 b2  
            STA $664c,y        ; $fba2: 99 4c 66  
            AND ($98),y        ; $fba5: 31 98     
            CPY __cdcc         ; $fba7: cc cc cd  
            STA __d398,y       ; $fbaa: 99 98 d3  
            CLI                ; $fbad: 58        
            DEX                ; $fbae: ca        
            STA __db9a,y       ; $fbaf: 99 9a db  
            AND #$49           ; $fbb2: 29 49     
            .hex 14 45         ; $fbb4: 14 45     Invalid Opcode - NOP $45,x
            ROL $33            ; $fbb6: 26 33     
            AND $9b,x          ; $fbb8: 35 9b     
            .hex 39            ; $fbba: 39        Suspected data
__fbbb:     LDA $da,x          ; $fbbb: b5 da     
            .hex da            ; $fbbd: da        Invalid Opcode - NOP 
            CPX __cde6         ; $fbbe: ec e6 cd  
            ROR $cc            ; $fbc1: 66 cc     
            CPY $99c9          ; $fbc3: cc c9 99  
            STY $9399          ; $fbc6: 8c 99 93  
            CLC                ; $fbc9: 18        
            CMP #$8a           ; $fbca: c9 8a     
            .hex 22            ; $fbcc: 22        Invalid Opcode - KIL 
            STY $cd,x          ; $fbcd: 94 cd     
            ADC $ef,x          ; $fbcf: 75 ef     
            ADC $9a,x          ; $fbd1: 75 9a     
            EOR ($14),y        ; $fbd3: 51 14     
            .hex 44 89         ; $fbd5: 44 89     Invalid Opcode - NOP $89
            AND $29            ; $fbd7: 25 29     
            LDY __ccd9         ; $fbd9: ac d9 cc  
            INC $d6            ; $fbdc: e6 d6     
            LDA $5cdb,y        ; $fbde: b9 db 5c  
            .hex eb 33         ; $fbe1: eb 33     Invalid Opcode - SBC #$33
            .hex 33 39         ; $fbe3: 33 39     Invalid Opcode - RLA ($39),y
            .hex d7 6b         ; $fbe5: d7 6b     Invalid Opcode - DCP $6b,x
            STA __e69c,x       ; $fbe7: 9d 9c e6  
            ROR $31            ; $fbea: 66 31     
            TXA                ; $fbec: 8a        
            LSR $14            ; $fbed: 46 14     
            PHA                ; $fbef: 48        
            LDX #$8c           ; $fbf0: a2 8c     
            .hex 62            ; $fbf2: 62        Invalid Opcode - KIL 
            .hex 63 26         ; $fbf3: 63 26     Invalid Opcode - RRA ($26,x)
            ROR $66            ; $fbf5: 66 66     
            .hex d7 66         ; $fbf7: d7 66     Invalid Opcode - DCP $66,x
            .hex 32            ; $fbf9: 32        Invalid Opcode - KIL 
            .hex 64 cc         ; $fbfa: 64 cc     Invalid Opcode - NOP $cc
            .hex cf 39 ce      ; $fbfc: cf 39 ce  Invalid Opcode - DCP __ce39
            ROR $73,x          ; $fbff: 76 73     
            LDA $396b          ; $fc01: ad 6b 39  
            .hex b3 33         ; $fc04: b3 33     Invalid Opcode - LAX ($33),y
            .hex 32            ; $fc06: 32        Invalid Opcode - KIL 
            ROR $4c            ; $fc07: 66 4c     
            CMP #$98           ; $fc09: c9 98     
            DEX                ; $fc0b: ca        
            .hex 63 18         ; $fc0c: 63 18     Invalid Opcode - RRA ($18,x)
            DEX                ; $fc0e: ca        
            ROR $53            ; $fc0f: 66 53     
            .hex 33 31         ; $fc11: 33 31     Invalid Opcode - RLA ($31),y
            STA __cc8c,y       ; $fc13: 99 8c cc  
            CPY $66d6          ; $fc16: cc d6 66  
            .hex b3 33         ; $fc19: b3 33     Invalid Opcode - LAX ($33),y
            .hex 33 39         ; $fc1b: 33 39     Invalid Opcode - RLA ($39),y
            .hex b3 99         ; $fc1d: b3 99     Invalid Opcode - LAX ($99),y
            .hex b3 94         ; $fc1f: b3 94     Invalid Opcode - LAX ($94),y
            STA $6632,y        ; $fc21: 99 32 66  
            AND #$8c           ; $fc24: 29 8c     
            .hex 67 5b         ; $fc26: 67 5b     Invalid Opcode - RRA $5b
            .hex 5c cc cc      ; $fc28: 5c cc cc  Invalid Opcode - NOP __cccc,x
            .hex da            ; $fc2b: da        Invalid Opcode - NOP 
            .hex e7 5a         ; $fc2c: e7 5a     Invalid Opcode - ISC $5a
            CPY $66d6          ; $fc2e: cc d6 66  
            .hex 63 26         ; $fc31: 63 26     Invalid Opcode - RRA ($26,x)
            AND ($26),y        ; $fc33: 31 26     
            LSR $67,x          ; $fc35: 56 67     
            .hex 3a            ; $fc37: 3a        Invalid Opcode - NOP 
            .hex da            ; $fc38: da        Invalid Opcode - NOP 
            DEC $6666          ; $fc39: ce 66 66  
            JMP $1863          ; $fc3c: 4c 63 18  

;-------------------------------------------------------------------------------
            DEC $29            ; $fc3f: c6 29     
            LSR $66            ; $fc41: 46 66     
            .hex 33 31         ; $fc43: 33 31     Invalid Opcode - RLA ($31),y
            STA __ce99,y       ; $fc45: 99 99 ce  
            .hex 73 31         ; $fc48: 73 31     Invalid Opcode - RRA ($31),y
            STA $14            ; $fc4a: 85 14     
            CPY __ebd6         ; $fc4c: cc d6 eb  
            LDX __d7eb         ; $fc4f: ae eb d7  
            ADC $366b          ; $fc52: 6d 6b 36  
            .hex 6b 59         ; $fc55: 6b 59     Invalid Opcode - ARR #$59
            .hex 89 44         ; $fc57: 89 44     Invalid Opcode - NOP #$44
            .hex 93 18         ; $fc59: 93 18     Invalid Opcode - AHX ($18),y
            DEX                ; $fc5b: ca        
            .hex 52            ; $fc5c: 52        Invalid Opcode - KIL 
            STA ($93),y        ; $fc5d: 91 93     
            .hex 32            ; $fc5f: 32        Invalid Opcode - KIL 
            DEC $69            ; $fc60: c6 69     
            TXS                ; $fc62: 9a        
            CPY $9ad9          ; $fc63: cc d9 9a  
            CPY $99d9          ; $fc66: cc d9 99  
            ROR $73            ; $fc69: 66 73     
            LDA $b96e          ; $fc6b: ad 6e b9  
            CPY $24c6          ; $fc6e: cc c6 24  
            .hex 44 44         ; $fc71: 44 44     Invalid Opcode - NOP $44
            .hex 89 28         ; $fc73: 89 28     Invalid Opcode - NOP #$28
            .hex a3 13         ; $fc75: a3 13     Invalid Opcode - LAX ($13,x)
            .hex 33 5b         ; $fc77: 33 5b     Invalid Opcode - RLA ($5b),y
            LDX $b5ee          ; $fc79: ae ee b5  
            DEC $9b75          ; $fc7c: ce 75 9b  
            .hex 33 8c         ; $fc7f: 33 8c     Invalid Opcode - RLA ($8c),y
            CPY $8cb1          ; $fc81: cc b1 8c  
            CPY $4c66          ; $fc84: cc 66 4c  
            DEX                ; $fc87: ca        
            STA $9699,y        ; $fc88: 99 99 96  
            ROR $66            ; $fc8b: 66 66     
            ROR $6c            ; $fc8d: 66 6c     
            .hex 9c cc cc      ; $fc8f: 9c cc cc  Invalid Opcode - SHY __cccc,x
            INC $ce            ; $fc92: e6 ce     
            .hex 73 32         ; $fc94: 73 32     Invalid Opcode - RRA ($32),y
            .hex 52            ; $fc96: 52        Invalid Opcode - KIL 
            .hex 63 4e         ; $fc97: 63 4e     Invalid Opcode - RRA ($4e,x)
            ROR $b3            ; $fc99: 66 b3     
            .hex b7 5c         ; $fc9b: b7 5c     Invalid Opcode - LAX $5c,y
            CPY $18c6          ; $fc9d: cc c6 18  
            LDX #$52           ; $fca0: a2 52     
            STA $5acd,y        ; $fca2: 99 cd 5a  
            .hex e7 6d         ; $fca5: e7 6d     Invalid Opcode - ISC $6d
            TYA                ; $fca7: 98        
            CMP #$93           ; $fca8: c9 93     
            ROL $6b            ; $fcaa: 26 6b     
            ROL $63,x          ; $fcac: 36 63     
            CLC                ; $fcae: 18        
            .hex 92            ; $fcaf: 92        Invalid Opcode - KIL 
            PLP                ; $fcb0: 28        
            TXA                ; $fcb1: 8a        
            ROR $4c            ; $fcb2: 66 4c     
            DEX                ; $fcb4: ca        
            .hex 73 39         ; $fcb5: 73 39     Invalid Opcode - RRA ($39),y
            .hex d7 3d         ; $fcb7: d7 3d     Invalid Opcode - DCP $3d,x
            ADC $b6,x          ; $fcb9: 75 b6     
            .hex 73 33         ; $fcbb: 73 33     Invalid Opcode - RRA ($33),y
            ROL $32,x          ; $fcbd: 36 32     
            TYA                ; $fcbf: 98        
            CPY $6666          ; $fcc0: cc 66 66  
            ADC $33            ; $fcc3: 65 33     
            .hex 32            ; $fcc5: 32        Invalid Opcode - KIL 
            STA $3333,y        ; $fcc6: 99 33 33  
            .hex 33 33         ; $fcc9: 33 33     Invalid Opcode - RLA ($33),y
            STA __cc9c,y       ; $fccb: 99 9c cc  
            CMP __d666,y       ; $fcce: d9 66 d6  
            CPY $8cc9          ; $fcd1: cc c9 8c  
            LDX $66            ; $fcd4: a6 66     
            .hex 6b 35         ; $fcd6: 6b 35     Invalid Opcode - ARR #$35
            .hex 9b            ; $fcd8: 9b        Invalid Opcode - TAS 
            AND $9d,x          ; $fcd9: 35 9d     
            .hex 63 32         ; $fcdb: 63 32     Invalid Opcode - RRA ($32,x)
            STA $33,x          ; $fcdd: 95 33     
            .hex 33 33         ; $fcdf: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 32         ; $fce1: 33 32     Invalid Opcode - RLA ($32),y
            ROR $53            ; $fce3: 66 53     
            JMP $99a9          ; $fce5: 4c a9 99  

;-------------------------------------------------------------------------------
            STA $8c99,y        ; $fce8: 99 99 8c  
            LSR                ; $fceb: 4a        
            .hex 63 35         ; $fcec: 63 35     Invalid Opcode - RRA ($35,x)
            .hex 9b            ; $fcee: 9b        Invalid Opcode - TAS 
            AND __c6cc,y       ; $fcef: 39 cc c6  
            .hex 63 32         ; $fcf2: 63 32     Invalid Opcode - RRA ($32,x)
            ROR $66            ; $fcf4: 66 66     
            .hex 59 99         ; $fcf6: 59 99     Suspected data
__fcf8:     TXS                ; $fcf8: 9a        
            .hex 73 9d         ; $fcf9: 73 9d     Invalid Opcode - RRA ($9d),y
__fcfb:     ROR $67            ; $fcfb: 66 67     
            AND $73ce,y        ; $fcfd: 39 ce 73  
            .hex 32            ; $fd00: 32        Invalid Opcode - KIL 
            .hex 63 19         ; $fd01: 63 19     Invalid Opcode - RRA ($19,x)
            STA $359b,y        ; $fd03: 99 9b 35  
            TXS                ; $fd06: 9a        
            CMP __c6cc,y       ; $fd07: d9 cc c6  
            .hex 14 8a         ; $fd0a: 14 8a     Invalid Opcode - NOP $8a,x
            PLP                ; $fd0c: 28        
            CMP $26            ; $fd0d: c5 26     
            .hex 33 19         ; $fd0f: 33 19     Invalid Opcode - RLA ($19),y
            STA $339b,y        ; $fd11: 99 9b 33  
            EOR $acb3,y        ; $fd14: 59 b3 ac  
            INC $ce            ; $fd17: e6 ce     
            .hex 67 33         ; $fd19: 67 33     Invalid Opcode - RRA $33
            STA $39b3,y        ; $fd1b: 99 b3 39  
            STA $9999,y        ; $fd1e: 99 99 99  
            STA __c594,y       ; $fd21: 99 94 c5  
            AND ($ac),y        ; $fd24: 31 ac     
            DEC __ce6c         ; $fd26: ce 6c ce  
            ROR $33            ; $fd29: 66 33     
            ORA __c994,y       ; $fd2b: 19 94 c9  
            STY $2965          ; $fd2e: 8c 65 29  
            STY $66c6          ; $fd31: 8c c6 66  
            .hex 73 66         ; $fd34: 73 66     Invalid Opcode - RRA ($66),y
            ADC $25            ; $fd36: 65 25     
            .hex 33 33         ; $fd38: 33 33     Invalid Opcode - RLA ($33),y
            AND __d6ad,y       ; $fd3a: 39 ad d6  
            DEC $b3,x          ; $fd3d: d6 b3     
            EOR $9999,y        ; $fd3f: 59 99 99  
            .hex 9b            ; $fd42: 9b        Invalid Opcode - TAS 
            .hex 33 33         ; $fd43: 33 33     Invalid Opcode - RLA ($33),y
            AND __e69c,y       ; $fd45: 39 9c e6  
            CMP #$9a           ; $fd48: c9 9a     
            ROR $66            ; $fd4a: 66 66     
            ROL $32            ; $fd4c: 26 32     
            .hex b2            ; $fd4e: b2        Invalid Opcode - KIL 
            ROR $9c            ; $fd4f: 66 9c     
            CPY __cccc         ; $fd51: cc cc cc  
            CMP #$93           ; $fd54: c9 93     
            AND #$8c           ; $fd56: 29 8c     
            LDX $66            ; $fd58: a6 66     
            .hex 62            ; $fd5a: 62        Invalid Opcode - KIL 
            EOR ($84),y        ; $fd5b: 51 84     
            STY $a6,x          ; $fd5d: 94 a6     
            ROR $ce            ; $fd5f: 66 ce     
            ADC $b3,x          ; $fd61: 75 b3     
            .hex 9e 73 9c      ; $fd63: 9e 73 9c  Invalid Opcode - SHX $9c73,y
            .hex e7 33         ; $fd66: e7 33     Invalid Opcode - ISC $33
            STA __cbac,y       ; $fd68: 99 ac cb  
            .hex 33 33         ; $fd6b: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 33         ; $fd6d: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 33         ; $fd6f: 33 33     Invalid Opcode - RLA ($33),y
            ROL $66            ; $fd71: 26 66     
            EOR $8c99,y        ; $fd73: 59 99 8c  
            CPY $99c9          ; $fd76: cc c9 99  
            STA $9999,y        ; $fd79: 99 99 99  
            STA $9a99,y        ; $fd7c: 99 99 9a  
            .hex b3 33         ; $fd7f: b3 33     Invalid Opcode - LAX ($33),y
            .hex 33 33         ; $fd81: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 33         ; $fd83: 33 33     Invalid Opcode - RLA ($33),y
            ROR $66            ; $fd85: 66 66     
            .hex 64 a6         ; $fd87: 64 a6     Invalid Opcode - NOP $a6
            .hex 33 33         ; $fd89: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 26         ; $fd8b: 33 26     Invalid Opcode - RLA ($26),y
            EOR $33,x          ; $fd8d: 55 33     
            .hex 33 9c         ; $fd8f: 33 9c     Invalid Opcode - RLA ($9c),y
            INC $b3            ; $fd91: e6 b3     
            TXS                ; $fd93: 9a        
            LDY __c6cc         ; $fd94: ac cc c6  
            ROR $66            ; $fd97: 66 66     
            ADC #$99           ; $fd99: 69 99     
            STA $9899,y        ; $fd9b: 99 99 98  
            CPY $63c6          ; $fd9e: cc c6 63  
            ORA $9999,y        ; $fda1: 19 99 99  
            JMP __cacc         ; $fda4: 4c cc ca  

;-------------------------------------------------------------------------------
            STA $9c99,y        ; $fda7: 99 99 9c  
            CMP __cc54         ; $fdaa: cd 54 cc  
            CPY __e6cc         ; $fdad: cc cc e6  
            .hex 73 39         ; $fdb0: 73 39     Invalid Opcode - RRA ($39),y
            LDY $66e6          ; $fdb2: ac e6 66  
            ROR $53            ; $fdb5: 66 53     
            AND #$99           ; $fdb7: 29 99     
            JMP __cccc         ; $fdb9: 4c cc cc  

;-------------------------------------------------------------------------------
            DEC $7366          ; $fdbc: ce 66 73  
            AND $99,x          ; $fdbf: 35 99     
            CPY __cecc         ; $fdc1: cc cc ce  
            .hex 67 33         ; $fdc4: 67 33     Invalid Opcode - RRA $33
            ORA $a492,y        ; $fdc6: 19 92 a4  
            CPY __ce6c         ; $fdc9: cc 6c ce  
            .hex 73 59         ; $fdcc: 73 59     Invalid Opcode - RRA ($59),y
            AND ($88),y        ; $fdce: 31 88     
            LDY $65            ; $fdd0: a4 65     
            .hex 33 35         ; $fdd2: 33 35     Invalid Opcode - RLA ($35),y
            .hex 9b            ; $fdd4: 9b        Invalid Opcode - TAS 
            .hex 33 32         ; $fdd5: 33 32     Invalid Opcode - RLA ($32),y
            .hex 6b 33         ; $fdd7: 6b 33     Invalid Opcode - ARR #$33
            AND ($93),y        ; $fdd9: 31 93     
            ROL $b3            ; $fddb: 26 b3     
            ROL $67,x          ; $fddd: 36 67     
            .hex 3b 35 99      ; $fddf: 3b 35 99  Invalid Opcode - RLA $9935,y
            TYA                ; $fde2: 98        
            CPY $55a6          ; $fde3: cc a6 55  
            STA $6bcd,y        ; $fde6: 99 cd 6b  
            EOR __cdcc,y       ; $fde9: 59 cc cd  
            LSR $6366          ; $fdec: 4e 66 63  
            AND ($99),y        ; $fdef: 31 99     
            LDY __e6cc         ; $fdf1: ac cc e6  
            ROR $73            ; $fdf4: 66 73     
            .hex 33 31         ; $fdf6: 33 31     Invalid Opcode - RLA ($31),y
            STA $a64c,y        ; $fdf8: 99 4c a6  
            .hex 32            ; $fdfb: 32        Invalid Opcode - KIL 
__fdfc:     STA $994c,y        ; $fdfc: 99 4c 99  
            STY $4ce5          ; $fdff: 8c e5 4c  
            CMP #$8c           ; $fe02: c9 8c     
            CPY $59cd          ; $fe04: cc cd 59  
            STA $9999,y        ; $fe07: 99 99 99  
            CPY $73e6          ; $fe0a: cc e6 73  
            AND __e79c,y       ; $fe0d: 39 9c e7  
            .hex 33 99         ; $fe10: 33 99     Invalid Opcode - RLA ($99),y
            JMP $9899          ; $fe12: 4c 99 98  

;-------------------------------------------------------------------------------
            CPY $3399          ; $fe15: cc 99 33  
            .hex 33 56         ; $fe18: 33 56     Invalid Opcode - RLA ($56),y
            .hex 67 33         ; $fe1a: 67 33     Invalid Opcode - RRA $33
            EOR $319b,y        ; $fe1c: 59 9b 31  
__fe1f:     LDA #$99           ; $fe1f: a9 99     
            STY $cc,x          ; $fe21: 94 cc     
            CPY $6666          ; $fe23: cc 66 66  
            .hex 53 2a         ; $fe26: 53 2a     Invalid Opcode - SRE ($2a),y
            ROR $4d            ; $fe28: 66 4d     
            .hex 33 35         ; $fe2a: 33 35     Invalid Opcode - RLA ($35),y
            EOR __cc4c,y       ; $fe2c: 59 4c cc  
            CPY $99d9          ; $fe2f: cc d9 99  
            TXS                ; $fe32: 9a        
            .hex 67 36         ; $fe33: 67 36     Invalid Opcode - RRA $36
            JMP (__cccc)       ; $fe35: 6c cc cc  

;-------------------------------------------------------------------------------
            DEX                ; $fe38: ca        
            ADC $4c            ; $fe39: 65 4c     
            CPY __cccc         ; $fe3b: cc cc cc  
            CMP $ac99          ; $fe3e: cd 99 ac  
            CMP $339b,y        ; $fe41: d9 9b 33  
            AND $9b99,y        ; $fe44: 39 99 9b  
            ROL                ; $fe47: 2a        
            ROR $54            ; $fe48: 66 54     
            CPY $67c6          ; $fe4a: cc c6 67  
            .hex 33 33         ; $fe4d: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 33         ; $fe4f: 33 33     Invalid Opcode - RLA ($33),y
            ORA $994c,y        ; $fe51: 19 4c 99  
            JMP __c694         ; $fe54: 4c 94 c6  

;-------------------------------------------------------------------------------
            .hex 64 cc         ; $fe57: 64 cc     Invalid Opcode - NOP $cc
            ROR $66            ; $fe59: 66 66     
            EOR $66,x          ; $fe5b: 55 66     
            AND $99,x          ; $fe5d: 35 99     
            TXS                ; $fe5f: 9a        
            CPY $36e7          ; $fe60: cc e7 36  
            .hex 67 35         ; $fe63: 67 35     Invalid Opcode - RRA $35
            ROR $6b            ; $fe65: 66 6b     
            .hex 33 66         ; $fe67: 33 66     Invalid Opcode - RLA ($66),y
            .hex 73 5a         ; $fe69: 73 5a     Invalid Opcode - RRA ($5a),y
            .hex 72            ; $fe6b: 72        Invalid Opcode - KIL 
            ROR $59            ; $fe6c: 66 59     
            STA __e69c,y       ; $fe6e: 99 9c e6  
            .hex 63 31         ; $fe71: 63 31     Invalid Opcode - RRA ($31,x)
            STY $33c6          ; $fe73: 8c c6 33  
            AND #$99           ; $fe76: 29 99     
            STA __cc54,y       ; $fe78: 99 54 cc  
            CPY $99d9          ; $fe7b: cc d9 99  
            STA $9999,y        ; $fe7e: 99 99 99  
            TXS                ; $fe81: 9a        
            .hex 72            ; $fe82: 72        Invalid Opcode - KIL 
            CPY __cccc         ; $fe83: cc cc cc  
            LDA #$9b           ; $fe86: a9 9b     
            ROL $63            ; $fe88: 26 63     
            .hex 14 c6         ; $fe8a: 14 c6     Invalid Opcode - NOP $c6,x
            .hex 63 33         ; $fe8c: 63 33     Invalid Opcode - RRA ($33,x)
            .hex 33 33         ; $fe8e: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 99         ; $fe90: 33 99     Invalid Opcode - RLA ($99),y
            .hex 9c d3 33      ; $fe92: 9c d3 33  Invalid Opcode - SHY $33d3,x
            ORA $9a93,y        ; $fe95: 19 93 9a  
            .hex b3 59         ; $fe98: b3 59     Invalid Opcode - LAX ($59),y
            STA $9c99,y        ; $fe9a: 99 99 9c  
            DEC $6766          ; $fe9d: ce 66 67  
            .hex 33 59         ; $fea0: 33 59     Invalid Opcode - RLA ($59),y
            .hex 9c cc ce      ; $fea2: 9c cc ce  Invalid Opcode - SHY __cecc,x
            ROR $66            ; $fea5: 66 66     
            .hex 6b 33         ; $fea7: 6b 33     Invalid Opcode - ARR #$33
            AND #$94           ; $fea9: 29 94     
            CPY __d6cc         ; $feab: cc cc d6  
            ROR $66            ; $feae: 66 66     
            ROR $63            ; $feb0: 66 63     
            .hex 33 19         ; $feb2: 33 19     Invalid Opcode - RLA ($19),y
            .hex 32            ; $feb4: 32        Invalid Opcode - KIL 
            STA $664c,y        ; $feb5: 99 4c 66  
            .hex 32            ; $feb8: 32        Invalid Opcode - KIL 
            STA $8c99,y        ; $feb9: 99 99 8c  
            CPY __cccc         ; $febc: cc cc cc  
            CPY $99cd          ; $febf: cc cd 99  
            LDY __cce6         ; $fec2: ac e6 cc  
            CPY __ccaa         ; $fec5: cc aa cc  
            INC $6c            ; $fec8: e6 6c     
            DEC $3467          ; $feca: ce 67 34  
            SBC $99            ; $fecd: e5 99     
            STA $9999,y        ; $fecf: 99 99 99  
            STA $9399,y        ; $fed2: 99 99 93  
            .hex 33 33         ; $fed5: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 26         ; $fed7: 33 26     Invalid Opcode - RLA ($26),y
            AND ($8c),y        ; $fed9: 31 8c     
            DEC $66            ; $fedb: c6 66     
            ROR $73            ; $fedd: 66 73     
            .hex 33 33         ; $fedf: 33 33     Invalid Opcode - RLA ($33),y
            AND #$99           ; $fee1: 29 99     
            STA __cb99,y       ; $fee3: 99 99 cb  
            .hex 33 33         ; $fee6: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 66         ; $fee8: 33 66     Invalid Opcode - RLA ($66),y
            ROR $65            ; $feea: 66 65     
            AND #$96           ; $feec: 29 96     
            .hex 33 99         ; $feee: 33 99     Invalid Opcode - RLA ($99),y
            STA __cc9c,y       ; $fef0: 99 9c cc  
            INC $66            ; $fef3: e6 66     
            ROR $66            ; $fef5: 66 66     
            ROR $66            ; $fef7: 66 66     
            .hex cc cc         ; $fef9: cc cc     Suspected data
__fefb:     .hex cc            ; $fefb: cc        Suspected data
__fefc:     ROR $4c            ; $fefc: 66 4c     
            CMP #$99           ; $fefe: c9 99     
            STA $6666,y        ; $ff00: 99 66 66  
            .hex 67 33         ; $ff03: 67 33     Invalid Opcode - RRA $33
            ROR $66            ; $ff05: 66 66     
            CPY __e6cc         ; $ff07: cc cc e6  
            ROR $71            ; $ff0a: 66 71     
            TAX                ; $ff0c: aa        
__ff0d:     ROR $65            ; $ff0d: 66 65     
            STX $3367          ; $ff0f: 8e 67 33  
            STY $cc,x          ; $ff12: 94 cc     
            ROR $65            ; $ff14: 66 65     
            STA __cc4c,y       ; $ff16: 99 4c cc  
            LDX $65            ; $ff19: a6 65     
            JMP __cccc         ; $ff1b: 4c cc cc  

;-------------------------------------------------------------------------------
            CPY __c698         ; $ff1e: cc 98 c6  
            JMP $95d3          ; $ff21: 4c d3 95  

;-------------------------------------------------------------------------------
            STA $9c99,y        ; $ff24: 99 99 9c  
            CMP $ac59          ; $ff27: cd 59 ac  
            CMP $9999          ; $ff2a: cd 99 99  
            .hex b3 39         ; $ff2d: b3 39     Invalid Opcode - LAX ($39),y
            .hex ab 32         ; $ff2f: ab 32     Invalid Opcode - LAX #$32
            ROR $33            ; $ff31: 66 33     
            ORA $73a6,y        ; $ff33: 19 a6 73  
            BIT __cecc         ; $ff36: 2c cc ce  
            ROR $66            ; $ff39: 66 66     
            .hex 67 33         ; $ff3b: 67 33     Invalid Opcode - RRA $33
            .hex 33 33         ; $ff3d: 33 33     Invalid Opcode - RLA ($33),y
            ROL $53            ; $ff3f: 26 53     
            CLC                ; $ff41: 18        
            CMP #$99           ; $ff42: c9 99     
            STA $33b3,y        ; $ff44: 99 b3 33  
            .hex 33 33         ; $ff47: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 33         ; $ff49: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 2a         ; $ff4b: 33 2a     Invalid Opcode - RLA ($2a),y
            CPY __cccc         ; $ff4d: cc cc cc  
            CPY $99d9          ; $ff50: cc d9 99  
            STA $3565,y        ; $ff53: 99 65 35  
            STA __ccac,y       ; $ff56: 99 ac cc  
            INC $66            ; $ff59: e6 66     
            STA $9999,y        ; $ff5b: 99 99 99  
            TYA                ; $ff5e: 98        
            CMP #$98           ; $ff5f: c9 98     
            DEX                ; $ff61: ca        
            ROR $66            ; $ff62: 66 66     
            .hex 53 53         ; $ff64: 53 53     Invalid Opcode - SRE ($53),y
            ROL $55,x          ; $ff66: 36 55     
            STA $b399,y        ; $ff68: 99 99 b3  
            .hex 33 33         ; $ff6b: 33 33     Invalid Opcode - RLA ($33),y
            .hex 1a            ; $ff6d: 1a        Invalid Opcode - NOP 
            ROR $66            ; $ff6e: 66 66     
            ROR $66            ; $ff70: 66 66     
            ROR $6b            ; $ff72: 66 6b     
            AND $9b,x          ; $ff74: 35 9b     
            .hex 33 39         ; $ff76: 33 39     Invalid Opcode - RLA ($39),y
            STA $59b3,y        ; $ff78: 99 b3 59  
__ff7b:     STA __cc9a,y       ; $ff7b: 99 9a cc  
            .hex a9            ; $ff7e: a9        Suspected data
__ff7f:     CPY $6466          ; $ff7f: cc 66 64  
            CPY $65a6          ; $ff82: cc a6 65  
            .hex 33 26         ; $ff85: 33 26     Invalid Opcode - RLA ($26),y
            ROR $4c            ; $ff87: 66 4c     
            DEC $66            ; $ff89: c6 66     
            .hex 64 cc         ; $ff8b: 64 cc     Invalid Opcode - NOP $cc
            CPY __cccc         ; $ff8d: cc cc cc  
            CPY __cccc         ; $ff90: cc cc cc  
            CMP $9999          ; $ff93: cd 99 99  
            STA $33b3,y        ; $ff96: 99 b3 33  
            .hex 33 39         ; $ff99: 33 39     Invalid Opcode - RLA ($39),y
            STA $b399,y        ; $ff9b: 99 99 b3  
__ff9e:     .hex 33 33         ; $ff9e: 33 33     Invalid Opcode - RLA ($33),y
            AND $9a99,y        ; $ffa0: 39 99 9a  
            ROR $53            ; $ffa3: 66 53     
            AND ($99),y        ; $ffa5: 31 99     
            STA $9839,y        ; $ffa7: 99 39 98  
            CPY __cccc         ; $ffaa: cc cc cc  
            CPY $66ce          ; $ffad: cc ce 66  
            .hex 67 35         ; $ffb0: 67 35     Invalid Opcode - RRA $35
            STA $3293,y        ; $ffb2: 99 93 32  
            STA $9999,y        ; $ffb5: 99 99 99  
            TXS                ; $ffb8: 9a        
            CPY __cccc         ; $ffb9: cc cc cc  
            CPY __cccc         ; $ffbc: cc cc cc  
__ffbf:     LDA ($98),y        ; $ffbf: b1 98     
            CPY $66cc          ; $ffc1: cc cc 66  
            ROR $66            ; $ffc4: 66 66     
            ROR $66            ; $ffc6: 66 66     
            ROR $66            ; $ffc8: 66 66     
            ROR $66            ; $ffca: 66 66     
            ADC #$a7           ; $ffcc: 69 a7     
            .hex 33 33         ; $ffce: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 39         ; $ffd0: 33 39     Invalid Opcode - RLA ($39),y
            STA __cc99,y       ; $ffd2: 99 99 cc  
            CPY $54d3          ; $ffd5: cc d3 54  
            CPY $19cb          ; $ffd8: cc cb 19  
            STA $9999,y        ; $ffdb: 99 99 99  
            STA $ab99,y        ; $ffde: 99 99 ab  
            .hex 33 33         ; $ffe1: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 33         ; $ffe3: 33 33     Invalid Opcode - RLA ($33),y
            .hex 33 39         ; $ffe5: 33 39     Invalid Opcode - RLA ($39),y
            STA $0000,y        ; $ffe7: 99 00 00  
            BRK                ; $ffea: 00        
            BRK                ; $ffeb: 00        
            BRK                ; $ffec: 00        
            BRK                ; $ffed: 00        
            BRK                ; $ffee: 00        
__ffef:     BRK                ; $ffef: 00        
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
vectors:    .dw nmi                        ; $fffa: 1a c0     Vector table
            .dw reset                      ; $fffc: 00 c0     Vector table
            .dw irq                        ; $fffe: f9 ff     Vector table
