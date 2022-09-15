f9dasm: M6800/1/2/3/8/9 / H6309 Binary/OS9/FLEX9 Disassembler V1.80
Loaded binary file typeset.bin

;****************************************************
;* Used Labels                                      *
;****************************************************

SCREEN  EQU     $0E00
FONT    EQU     $7C00

;****************************************************
;* Program Code / Data Areas                        *
;****************************************************

        ORG     $7B8D

; Calculate screen offset (ROW x 256)+COL ?? Seems wrong
        LDB     COL                      ;7B8D: F6 7B FB       '.{.'
        LDA     ROW                      ;7B90: B6 7B FA       '.{.'
        TFR     D,Y                      ;7B93: 1F 02          '..'
; Calculate offset in Font Table
        LDB     CHAR                     ;7B95: F6 7B FC       '.{.'
        LDA     #$08                     ;7B98: 86 08          '..'
        MUL                              ;7B9A: 3D             '='
        TFR     D,X                      ;7B9B: 1F 01          '..'
; Font is 8x8
        LDB     #$08                     ;7B9D: C6 08          '..'
        STB     COUNT                    ;7B9F: F7 7B FD       '.{.'
LOOP    LDA     FONT,X                   ;7BA2: A6 89 7C 00    '..|.'
        STA     SCREEN,Y                 ;7BA6: A7 A9 0E 00    '....'
        INX                              ;7BAA: 30 01          '0.'
; Move to next screen line
        LEAY    $20,Y                    ;7BAC: 31 A8 20       '1. '
        DEC     COUNT                    ;7BAF: 7A 7B FD       'z{.'
        BNE     LOOP                     ;7BB2: 26 EE          '&.'
        RTS                              ;7BB4: 39             '9'

        ORG     $7BFA 

ROW     RMB     $0001                    ;7BFA: 
COL     RMB     $0001                    ;7BFB: 
CHAR    RMB     $0001                    ;7BFC: 
COUNT   RMB     $0001                    ;7BFD: 

        END
