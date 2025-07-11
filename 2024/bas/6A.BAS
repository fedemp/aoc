10 OPEN "i", #1, "input.txt"
20 ME$ = "^" : DOT$ = "." : HASH$ = "#" : SIDE = 129 : TOTAL = 1
30 DIM DS(4,2) : D = 0 ' How it will move in [x,y] axis. D is index for UP
40 DS(0,0) = 0: DS(0,1) = -1 ' UP
50 DS(1,0) = 1: DS(1,1) = 0 ' RIGHT
60 DS(2,0) = 0: DS(2,1) = 1 ' DOWN
70 DS(3,0) = -1: DS(3,1) = 0 ' RIGHT
80 DIM ME(2) : DIM MAZE%(SIDE + 1,SIDE + 1)
90 FOR Y = 0 TO SIDE
100 LINE INPUT #1, LN$ : PRINT LN$
110 FOR X = 0 TO SIDE
120 C$ = MID$(LN$, X+1, 1)
130 IF C$ <> HASH$ THEN MAZE%(X,Y) = 0 ELSE MAZE%(X,Y) = 1
140 IF C$ = ME$ THEN ME(0) = X : ME(1) = Y
150 NEXT X: NEXT Y
160 MAZE%(ME(0), ME(1)) = 2
170 REM START MOVING
180 NEXTX = ME(0) + DS(D,0) : NEXTY = ME(1) + DS(D,1)
190 NPOS = MAZE%( NEXTX , NEXTY ) ' Next position
200 IF NPOS=1 THEN D=(D+1) MOD 4 : GOTO 170 ELSE GOTO 210 ' Change direction
210 IF NPOS = 0 THEN TOTAL = TOTAL + 1
220 ME(0) = NEXTX : ME(1) = NEXTY
230 MAZE%(ME(0), ME(1)) = 2
240 IF ME(0)=0 OR ME(0)=SIDE OR ME(1)=0 OR ME(1)=SIDE GOTO 250 ELSE GOTO 170
250 PRINT TOTAL: END
