10 OPEN "i", #1, "input.txt"
20 TOTAL# = 0
30 IF EOF(1) THEN PRINT TOTAL#: END
40 CH$ = INPUT$(1, #1)
50 IF CH$ <> "m" GOTO 30
60 CH$ = INPUT$(1, #1)
70 IF CH$ <> "u" GOTO 30
80 CH$ = INPUT$(1, #1)
90 IF CH$ <> "l" GOTO 30
100 CH$ = INPUT$(1, #1)
110 IF CH$ <> "(" GOTO 30
120 REM START GETTING NUMBERS
130 FR$ = "": SN$ = "": CUR$ = "" ' first and second
140 IF EOF(1) GOTO 30
150 CH$ = INPUT$(1, #1)
160 GOSUB 280
170 IF CUR$ <> "" THEN FR$ = FR$ + CUR$: GOTO 140
180 IF CH$ = "," AND FR$ <> "" THEN PRINT FR$: GOTO 210
190 GOTO 30 ' No "," or number
200 IF EOF(1) GOTO 30
210 PRINT FR$: CH$ = INPUT$(1, #1)
220 GOSUB 280
230 IF CUR$ <> "" THEN SN$ = SN$ + CUR$: GOTO 200
240 IF CH$ = ")" AND SN$ <> "" THEN PRINT SN$: GOTO 260
250 GOTO 30 ' No ")" or number
260 TOTAL# = TOTAL# + (VAL(FR$) * VAL(SN$))
270 GOTO 30
280 REM SET CURRENT NUMBER
290 IF ASC(CH$) < 48 OR ASC(CH$) > 57 THEN CUR$ = "" ELSE CUR$ = CH$
300 RETURN
