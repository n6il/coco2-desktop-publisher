f9dasm: M6800/1/2/3/8/9 / H6309 Binary/OS9/FLEX9 Disassembler V1.80
Loaded binary file page.dmp

;****************************************************
;* Used Labels                                      *
;****************************************************

DEVNUM  EQU     $006F
CHROUT  EQU     $A002

;****************************************************
;* Program Code / Data Areas                        *
;****************************************************

        ORG     $7000

        LDA     #254                     ;7000: 86 FE          '..'
        STA     DEVNUM                   ;7002: 97 6F          '.o'
        LDX     #BITTBL                  ;7004: 8E 70 7B       '.p{'
        LDY     #INBUF                   ;7007: 10 8E 70 85    '..p.'
        LDB     #$08                     ;700B: C6 08          '..'
LOOP    CLR     DATA                     ;700D: 7F 70 7A       '.pz'
        LDA     $00,Y                    ;7010: A6 20          '. '
BIT1    BITA    B,X                      ;7012: A5 85          '..'
        BEQ     BIT2                     ;7014: 27 03          ''.'
        INC     DATA                     ;7016: 7C 70 7A       '|pz'
BIT2    LDA     $01,Y                    ;7019: A6 21          '.!'
        BITA    B,X                      ;701B: A5 85          '..'
        BEQ     BIT3                     ;701D: 27 08          ''.'
        LDA     DATA                     ;701F: B6 70 7A       '.pz'
        ADDA    #$02                     ;7022: 8B 02          '..'
        STA     DATA                     ;7024: B7 70 7A       '.pz'
BIT3    LDA     $02,Y                    ;7027: A6 22          '."'
        BITA    B,X                      ;7029: A5 85          '..'
        BEQ     BIT4                     ;702B: 27 08          ''.'
        LDA     DATA                     ;702D: B6 70 7A       '.pz'
        ADDA    #$04                     ;7030: 8B 04          '..'
        STA     DATA                     ;7032: B7 70 7A       '.pz'
BIT4    LDA     $03,Y                    ;7035: A6 23          '.#'
        BITA    B,X                      ;7037: A5 85          '..'
        BEQ     BIT5                     ;7039: 27 08          ''.'
        LDA     DATA                     ;703B: B6 70 7A       '.pz'
        ADDA    #$08                     ;703E: 8B 08          '..'
        STA     DATA                     ;7040: B7 70 7A       '.pz'
BIT5    LDA     $04,Y                    ;7043: A6 24          '.$'
        BITA    B,X                      ;7045: A5 85          '..'
        BEQ     BIT6                     ;7047: 27 08          ''.'
        LDA     DATA                     ;7049: B6 70 7A       '.pz'
        ADDA    #$10                     ;704C: 8B 10          '..'
        STA     DATA                     ;704E: B7 70 7A       '.pz'
BIT6    LDA     $05,Y                    ;7051: A6 25          '.%'
        BITA    B,X                      ;7053: A5 85          '..'
        BEQ     BIT7                     ;7055: 27 08          ''.'
        LDA     DATA                     ;7057: B6 70 7A       '.pz'
        ADDA    #$20                     ;705A: 8B 20          '. '
        STA     DATA                     ;705C: B7 70 7A       '.pz'
BIT7    LDA     $06,Y                    ;705F: A6 26          '.&'
        BITA    B,X                      ;7061: A5 85          '..'
        BEQ     PRINT                    ;7063: 27 08          ''.'
        LDA     DATA                     ;7065: B6 70 7A       '.pz'
        ADDA    #$40                     ;7068: 8B 40          '.@'
        STA     DATA                     ;706A: B7 70 7A       '.pz'
PRINT   LDA     DATA                     ;706D: B6 70 7A       '.pz'
        ADDA    #$80                     ;7070: 8B 80          '..'
        JSR     [CHROUT]                 ;7072: AD 9F A0 02    '....'
        DECB                             ;7076: 5A             'Z'
        BNE     LOOP                     ;7077: 26 94          '&.'
        RTS                              ;7079: 39             '9'
DATA    RMB     $0001                    ;707A: 
BITTBL  FCB     $00,$01,$02,$04,$08,$10  ;707B: 00 01 02 04 08 10 '......'
        FCC     " @"                     ;7081: 20 40          ' @'
        FCB     $80,$00                  ;7083: 80 00          '..'
INBUF   RMB     $0007                    ;7085: 

        END
