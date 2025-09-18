10 REM CRAMER'S RULE. THX REDDIT
20 OPEN "I", #1, "input13.txt": TOTAL# = 0
30 WHILE NOT EOF(1): LINE INPUT #1, LN$
40 AX# = VAL(MID$(LN$, 13, INSTR(LN$,",")-1))
50 AY# = VAL(MID$(LN$, INSTR(LN$,",")+4))
60 LINE INPUT #1, LN$
70 BX# = VAL(MID$(LN$, 13, INSTR(LN$,",")-1))
80 BY# = VAL(MID$(LN$, INSTR(LN$,",")+4))
90 LINE INPUT #1, LN$
100 GX# = VAL(MID$(LN$,10, INSTR(LN$, ",")-1)) + 10000000000000#
110 GY# = VAL(MID$(LN$, INSTR(LN$, ",")+4)) + 10000000000000#
120 LINE INPUT #1, LN$ 'Ignore line
130 D# = (AX# * BY#) - (AY# * BX#)
140 DA# = GX# * BY# - GY# * BX#
150 DB# = AX# * GY# - AY# * GX#
160 A# = DA# / D# : B# = DB# / D#
170 IF A# <> INT(A#) OR B# <> INT(B#) GOTO 190
180 TOTAL# = TOTAL# + A# * 3 + B#
190 WEND
200 PRINT "TOTAL:" TOTAL#
