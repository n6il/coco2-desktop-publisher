5 FILES 10,10000
6 VERIFYON
7 DEFUSR=&HA42D
10 CLS:INPUT"INSERT NEWSPAPER DISK IN        DRIVE 0";A$
20 INPUT "INSERT DISK WITH PAGECONT.TXT INDRIVE 1";A$
30 INPUT "INSERT NWSPER.INTM DISK  -------IN DRIVE 2";A$
40 OPEN "I",#1,"PAGECONT.TXT:1"
50 OPEN "O",#2,"PAGE.IN2:2"
51 F=1
52 VERIFYON
60 FOR N=1 TO 4
70 INPUT #1,A$,B$,C$
75 CLS:PRINT@0,A$,B$
77 F=F+2
78 PRINT@256,F
80 C=VAL(C$):GOSUB 100
90 NEXT N
95 CLOSE:STOP
100 OPEN"D",F,A$,1:OPEN"D",(F+1),B$,1:S=1
110 FIELD F, 1 AS AA$:FIELD (F+1), 1 AS BB$
120 FOR X=1 TO 5
130 GET #F,S:GET#(F+1),S
140 S=S+1:NEXT X
150 FOR X=1 TO C:O$="":O1$=""
160 FOR Y=1 TO 32
170 GET#F,S:GET#(F+1),S
175 PRINT@32,"R="S,ASC(AA$)" "ASC(BB$)
180 S=S+1:O$=O$+AA$:O1$=O1$+BB$
190 NEXT Y
200 O$=O$+O1$
205 PRINT@96,LEN(O$)
210 PRINT#2,O$;
215 PRINT@64,"W="X
220 NEXT X:RETURN
 