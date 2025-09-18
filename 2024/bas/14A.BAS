10 OPEN "I", #1, "input14.txt": TOTAL# = 1
20 BX = 101: BY = 103: DIM B%(BX, BY)
30 WHILE NOT EOF(1): LINE INPUT #1, LN$
40 PX = VAL(MID$(LN$, INSTR(LN$, "=")+1, INSTR(LN$, ",") -1))
50 PY = VAL(MID$(LN$, INSTR(LN$, ",")+1, INSTR(LN$, " ") -1))
60 LN$ = MID$(LN$, INSTR(LN$, " ") + 1)
70 VX = VAL(MID$(LN$, INSTR(LN$, "=")+1, INSTR(LN$, ",") -1))
80 VY = VAL(MID$(LN$, INSTR(LN$, ",")+1))
90 PX = (((PX + VX * 100) MOD BX) + BX) MOD BX
100 PY = (((PY + VY * 100) MOD BY) + BY) MOD BY
110 B%(PX,PY) = B%(PX,PY) + 1: WEND
120 DIM Q%(4,4)
130 Q%(0,0) = 0: Q%(0,1) = 0: Q%(0,2) = INT(BX/2)-1: Q%(0,3) = INT(BY/2)-1
140 Q%(1,0) = INT(BX/2)+1: Q%(1,1) = 0: Q%(1,2) = BX-1: Q%(1,3) = INT(BY/2)-1
150 Q%(2,0) = 0: Q%(2,1) = INT(BY/2)+1: Q%(2,2) = INT(BX/2)-1: Q%(2,3) = BY-1
160 Q%(3,0) = INT(BX/2)+1: Q%(3,1) = INT(BY/2)+1: Q%(3,2) = BX-1: Q%(3,3) = BY-1
170 FOR I=0 TO 3: QT# = 0
180 FOR X=Q%(I,0) TO Q%(I,2): FOR Y=Q%(I,1) TO Q%(I,3)
190 QT# = QT# + B%(X,Y): NEXT Y: NEXT X
200 TOTAL# = TOTAL# * QT#: NEXT I: PRINT "TOTAL:" TOTAL#
