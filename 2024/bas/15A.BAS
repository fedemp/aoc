10 D=10: DIM B%(D,D): S=ASC("."): B=ASC("O"): W=ASC("#") 'Space, barrel, wall
20 DIM M%(4,2): M%(0,0)=0: M%(0,1)=-1: M%(1,0)=1: M%(1,1)=0
30 M%(2,0)=0: M%(2,1)=1: M%(3,0)=-1: M%(3,1)=0
40 OPEN "I", #1, "input15.txt"
50 FOR Y=0 TO D-1: LINE INPUT #1, LN$
60 FOR X=0 TO D-1: CH$ = MID$(LN$,X+1,1)
70 IF CH$ = "@" THEN RX=X: RY=Y: B%(X,Y)=S ELSE B%(X,Y) = ASC(CH$)
80 NEXT X: NEXT Y: LINE INPUT #1, LN$: MV = 0
100 WHILE NOT EOF(1): CH$ = INPUT$(1, #1): MX=0: MY=0
110 IF CH$="^" THEN MX=M%(0,0): MY=M%(0,1): GOTO 150
120 IF CH$=">" THEN MX=M%(1,0): MY=M%(1,1): GOTO 150
130 IF CH$="v" THEN MX=M%(2,0): MY=M%(2,1): GOTO 150
140 IF CH$="<" THEN MX=M%(3,0): MY=M%(3,1): GOTO 150
145 GOTO 220 'Ignore carriage return
150 NX=RX+MX: NY=RY+MY 'Future robot movement
160 IF B%(NX,NY) = S THEN RX=NX: RY=NY: GOTO 220 'Move to free space
170 IF B%(NX,NY) = W THEN GOTO 220 'A wall
180 SX=NX: SY=NY: WHILE B%(SX,SY)=B: SX=SX+MX: SY=SY+MY: WEND 'Line of barrels
190 IF B%(SX,SY) <> S GOTO 220 'Not enough space to move barrels
200 B%(NX,NY)=S: B%(SX,SY)=B 'Swap whitespace and barrel
210 RX=NX: RY=NY 'Finally move robot
220 WEND: TOTAL#=0: FOR Y=0 TO D-1: FOR X=0 TO D-1
240 IF B%(X,Y) = B THEN TOTAL# = TOTAL# + 100 * Y + X
250 NEXT X: NEXT Y: PRINT TOTAL#: END
