      SUBROUTINE INITPLT(ITAPE)
C     THIS IS A QUICK CONVERSION FROM THE 6400
C     USE AT YOUR OWN RISK
C     IF YOU HAVE PROBLEMS WITH BCDX THE SYSTEM MAY NOT BE PASSING
C         THE ARGUMENTS CORRECTLY THROUGH SEVERAL NESTED SUBROUTINES
C         USE ENCODE AND SYMBOL DIRECTLY
C     TO COMPILE USE FOR/LIS/CONT=99 PLOTPACK
C
C     THE OUTPUT FILE IS PLOT.VEC
C
      COMMON /PLTBUF/BUFFER(512),NBUFF,NVECT,PLTTAP
     
      INTEGER PLTTAP
      REAL*8 BUFFER
      COMMON /MAXLEN/MAXLEN
      COMMON /PLTDAT/XORG,YORG,XMIN,YMIN,XLIM,YLIM,XMAX,XOLD,YOLD,
     1              SCALE,LINEWT,RESOLU,DXMAX,DXDYMX
C     DIMENSION IDATE(3),ITIME(2),JOBID(2),INHEAD(2),USERID(2),
C    1FILENAME(2)
      COMMON /HEADERDATA/IDATE(3),ITIME(2),JOBID(2),USERID(2),
     1FILENAME(2)
      DIMENSION INHEAD(2)
      REAL*8 USERID,PLOTOUT,FILENAME
      CHARACTER WHOLEFILENAME*40,EQUIVALENCE_NAME*63
      DATA PLOTOUT/8HPLOTFILE/
      DATA JOBID/4H    ,4H    /
      DATA SCALE,LINEWT/1.,1/
C     DATA RESOLU,DXMAX/200.,20./
C     RESOLUTION 200 PTS/INCH
C     MAXIMUM DELTA X IS 3 INCHES FOR RASTERIZATION PROGRAM
      DATA RESOLU,DXMAX/200.,3./
      DATA DXDYMX/.4/
C     DATA DXDYMX/1.5/
C     DATA XORG,YORG,XMIN,YMIN,XLIM,YLIM/0.,0.,0.,0.,1200.,10.555/
     
C
C     IN THIS IMPLEMENTATION WE STILL PRETEND THERE ARE 200 DOTS/IN AND THAT
C     THE PLOTTING AREA IS 16.5 INCHES HIGH.  THE  PLOTS CAN STILL BE RUN ON
C     ON A 200 DOTS/IN  VERSATEC OR ON A 300 DOTS/IN LASER PRINTER
C     THE RANGE IN Y IS O TO 3300.   THIS MAY NOT BE THE ACTUAL NUMBER BITS
C     AVAILABLE ON THE PHYSICAL DEVICE.  X IS LIMITED ONLY BY MAXLENGTH.
C     DATA XORG,YORG,XMIN,YMIN,XLIM,YLIM/0.,0.,0.,0.,1200.,16.5/
C
C     YLIM IS NOW LIMITED ONLY TO THE NUMBER OF BITS THAT WILL FIT IN INTEGER*2
C     SO THAT IT IS POSSIBLE TO MAKE WALLPAPER.  THERE MAY NOT BE A LIMIT ON X.
      DATA XORG,YORG,XMIN,YMIN,XLIM,YLIM/0.,0.,0.,0.,1200.,163.5/
      DATA XMAX,XOLD,YOLD/0.,0.,0./
C     DATA MAXLEN/430/
      DATA MAXLEN/10/
      PLTTAP=ITAPE
      CALL TRANSLATE_LOGICAL('PLOT',EQUIVALENCE_NAME,
     1L_EQUIVALENCE_NAME)
      LOC_BRACKET=INDEX(EQUIVALENCE_NAME(1:L_EQUIVALENCE_NAME),']')
      LOC_PERIOD=INDEX(EQUIVALENCE_NAME(LOC_BRACKET:L_EQUIVALENCE_NAME),
     +'.')
      IF(LOC_PERIOD.EQ.0)THEN
      NEW_LEN=L_EQUIVALENCE_NAME+4
      EQUIVALENCE_NAME(1:NEW_LEN)=
     +EQUIVALENCE_NAME(1:L_EQUIVALENCE_NAME)//'.VEC'
      ELSE
      NEW_LEN=L_EQUIVALENCE_NAME
      ENDIF
      OPEN(UNIT=PLTTAP,FILE=EQUIVALENCE_NAME(1:NEW_LEN),TYPE='NEW',
     +FORM='UNFORMATTED')
      INQUIRE(UNIT=PLTTAP,NAME=WHOLEFILENAME)
      PRINT 6666,WHOLEFILENAME
 6666 FORMAT(16H0VECTOR FILE IS ,A40)
      IPAGE=0
      NBUFF=0
      NVECT=0
      CALL DATE(IDATE)
      CALL TIME(ITIME)
      CALL USERNAME(USERID)
      CALL NAMEFILE(FILENAME)
C     THE FIRST RECORD IDENTIFIES THE FILE AS A PLOT FILE
C      CALL BUFPLT(PLOTOUT)
C      CALL BUFPLT(USERID)
C      CALL BUFPLT(USERID(2))
C      CALL BUFPLT(FILENAME)
C      CALL BUFPLT(FILENAME(2))
      BUFFER(1)=PLOTOUT
      BUFFER(2)=USERID(1)
      BUFFER(3)=USERID(2)
      BUFFER(4)=FILENAME(1)
      BUFFER(5)=FILENAME(2)
      NVECT=5
      NBUFF=5
C     CREATE HEADER
      CALL JUMP TO (1.,0.)
      CALL LINE TO (2.5,0.)
      CALL LINE TO (2.5,10.555)
     
      CALL LINE TO (1.,10.555)
     
      CALL LINE TO (1.,0.)
      CALL JUMP TO (5.5,0.)
      CALL LINE TO (7.0,0.)
      CALL LINE TO (7.,10.555)
     
      CALL LINE TO (5.5,10.555)
     
      CALL LINE TO (5.5,0.)
      CALL SYMBOL(2.,.5,.5,USERID,90.,9)
      CALL SYMBOL(6.5,.5,.5,USERID,90.,9)
      CALL SYMBOL(2.,4.9,.5,JOBID,90.,8)
      CALL SYMBOL(6.5,4.9,.5,JOBID,90.,8)
      CALL SYMBOL(1.6,8.58,.2,ITIME,90.,8)
      CALL SYMBOL(6.1,8.58,.2,ITIME,90.,8)
      CALL SYMBOL(1.875,8.5,.2,IDATE,90.,9)
      CALL SYMBOL(6.375,8.5,.2,IDATE,90.,9)
      CALL SYMBOL(2.15,8.5,.2,FILENAME,90.,9)
      CALL SYMBOL(6.65,8.5,.2,FILENAME,90.,9)
      PRINT 1,MAXLEN,USERID,JOBID,ITIME,IDATE,FILENAME
    1 FORMAT(42H0BEGINNING PLOT     MAXIMUM PAGE LENGTH = ,I3,5H FEET/
     1 1H0,A8,A1,5X,A4,A4,5X,A4,A4,5X,A4,A4,A1,5X,A8,A1)
C
      ENTRY PAGE
      CALL BUFPLT(-1,0,0,0)
      NVECT=NVECT-1
      FEET=XMAX/12.
      PRINT 2,IPAGE,NVECT,FEET
    2 FORMAT(12H0PAGE NUMBER,I4,I12,8H VECTORS,
     1 10H    LENGTH,F8.3,5H FEET)
      IPAGE=IPAGE+1
      XORG=0.
      YORG=0.
      XMIN=0.
      YMIN=0.
      XMAX=0.
      XOLD=0.
      YOLD=0.
      NVECT=0
      RETURN
C
      ENTRY HEADER(INHEAD)
C     CALL HEADER(8HTESTPLOT)
      JOBID(1)=INHEAD(1)
      JOBID(2)=INHEAD(2)
      RETURN
C
      ENTRY MAXLENGTH(IFEET)
      MAXLEN=IFEET
      RETURN
C
      ENTRY FIN(ITAPE)
     
      CALL BUFPLT(-1,0,0,0)
      CALL BUFPLT(-2,0,0,0)
      NVECT=NVECT-2
      FEET=XMAX/12.
      PRINT 2,IPAGE,NVECT,FEET
      XORG=0.
      YORG=0.
      XMIN=0.
      YMIN=0.
      XMAX=0.
      XOLD=0.
      YOLD=0.
      CALL FACTOR(1.)
      CALL WEIGHT(1)
      IF(NBUFF.NE.0)WRITE(PLTTAP)BUFFER
      CLOSE(UNIT=PLTTAP)
      RETURN
      END
      SUBROUTINE BUFPLT(I,J,K,L)
     
      COMMON /PLTBUF/BUFFER(4,512),NBUFF,NVECT,PLTTAP
     
      INTEGER PLTTAP
      INTEGER*2 BUFFER
      NVECT=NVECT+1
     
      NBUFF=NBUFF+1
      I30000=I/30000
      BUFFER(1,NBUFF)=I-I30000*30000
     
      BUFFER(2,NBUFF)=J
      BUFFER(3,NBUFF)=K+I30000*1000
     
      BUFFER(4,NBUFF)=L
      IF(NBUFF.LT.512)RETURN
      WRITE(PLTTAP)BUFFER
      NBUFF=0
      RETURN
      END
      SUBROUTINE PLOT(X,Y,MODE)
      COMMON /PLTDAT/XORG,YORG,XMIN,YMIN,XLIM,YLIM,XMAX,XOLD,YOLD,
     1              SCALE,LINEWT,RESOLU,DXMAX,DXDYMX
      MMMM=MODE
      IMODE=IABS(MODE)
      IF(IMODE.EQ.2)GO TO 10
      IF(IMODE.EQ.3)GO TO 5
C
      ENTRY START AT (X,Y)
     
C     CALL START AT (X,Y)
C     REDEFINE ORIGIN AND JUMP TO IT
      XNEW=AMAX1(X*SCALE+XORG,XMIN)
      YNEW=Y*SCALE+YORG
      XOLD=XNEW
      YOLD=YNEW
    1 XORG=XNEW
      YORG=YNEW
      RETURN
C
      ENTRY JUMP TO (X,Y)
     
C     CALL JUMP TO (X,Y)
      MMMM=3
    5 XNEW=AMAX1(X*SCALE+XORG,XMIN)
      YNEW=Y*SCALE+YORG
      XOLD=XNEW
      YOLD=YNEW
      IF(MMMM.LT.0)GO TO 1
      RETURN
C
      ENTRY LINE TO (X,Y)
     
C     CALL LINE TO (X,Y)
      MMMM=2
   10 XNEW=AMAX1(X*SCALE+XORG,XMIN)
      YNEW=Y*SCALE+YORG
      XI=XOLD
      YI=YOLD
      XN=XNEW
      YN=YNEW
      XOLD=XNEW
      YOLD=YNEW
C     ORIENT SEGMENT TOWARD INCREASING X
      IF(XI.LT.XN)GO TO 50
      IF(XI.EQ.XN.AND.YI.LE.YN)GO TO 50
      T=XI
      XI=XN
      XN=T
      T=YI
      YI=YN
      YN=T
C     TRUNCATE LINES RUNNING OFF PLOT
   50 IF(YI.LE.YLIM)GO TO 70
      IF(YN.GT.YLIM)RETURN
      XI=XN+(XI-XN)*(YLIM-YN)/(YI-YN)
      YI=YLIM
      GO TO 80
   70 IF(YN.LE.YLIM)GO TO 80
      XN=XI+(XN-XI)*(YLIM-YI)/(YN-YI)
      YN=YLIM
   80 IF(YI.GE.YMIN)GO TO 90
      IF(YN.LT.YMIN)RETURN
      XI=XN+(XI-XN)*(YMIN-YN)/(YI-YN)
      YI=YMIN
      GO TO 100
   90 IF(YN.GE.YMIN)GO TO 100
      XN=XI+(XN-XI)*(YMIN-YI)/(YN-YI)
      YN=YMIN
C     BREAK LINES INTO SEGMENTS SHORTER THAN DXMAX
  100 DX=XN-XI
      MORE=0
      IF(DX.LT.DXMAX)GO TO 500
      DY=YN-YI
      MORE=1
      YSAVE=YN
      XSAVE=XN
      XN=XI+DXMAX
      YN=YI+DY/DX*DXMAX
  500 IX1=XI*RESOLU+.5
      IY1=YI*RESOLU+.5
      IX2=XN*RESOLU+.5
      IY2=YN*RESOLU+.5
      XMAX=AMAX1(XMAX,XN)
      IDX=IX2-IX1
C     EMERGENCY PATCH FOR NEGATIVE NUMBERS
      IF(IDX.LT.0)IDX=0
      IF(IDX.GT.0)GO TO 501
      IF(IY1.LE.IY2)GO TO 501
      IT=IY1
      IY1=IY2
      IY2=IT
  501 IF(LINEWT.NE.1.AND.LINEWT.NE.12)GO TO 600
     
C     PLOT SINGLE WEIGHT LINE
      CALL BUFPLT(IX1,IY1,IDX,IY2)
      IF(LINEWT.EQ.1)GO TO 1000
C     PLOT DOUBLE WEIGHT LINE
  600 IDY=IY2-IY1
      IF(LINEWT.EQ.3)GO TO 700
      IF(IDX.LT.IDY)GO TO 610
      IF(IDX.LT.-IDY)GO TO 620
      CALL BUFPLT(IX1,MAX0(IY1-1,0),IDX,MAX0(IY2-1,0))
      CALL BUFPLT(IX1,IY1+1,IDX,IY2+1)
      IF(LINEWT.EQ.23)GO TO 700
      GO TO 1000
  610 CALL BUFPLT(MAX0(IX1-1,0),IY1,IDX,IY2)
     
      CALL BUFPLT(IX1+1,IY1,IDX,IY2)
      IF(LINEWT.EQ.23)GO TO 700
      GO TO 1000
  620 CALL BUFPLT(MAX0(IX1-1,0),IY1,IDX,IY2)
     
      CALL BUFPLT(IX1+1,IY1,IDX,IY2)
      IF(LINEWT.EQ.23)GO TO 700
      GO TO 1000
C     PLOT TRIPLE WEIGHT LINE
  700 IF(IDY.GT.IDX+IDX)GO TO 710
      IF(-IDY.GT.IDX+IDX)GO TO 720
      IF(IDY+IDY.GT.IDX)GO TO 730
      IF(-IDY-IDY.GT.IDX)GO TO 740
      CALL BUFPLT(IX1,MAX0(IY1-2,0),IDX,MAX0(IY2-2,0))
      CALL BUFPLT(IX1,IY1,IDX,IY2)
      CALL BUFPLT(IX1,IY1+2,IDX,IY2+2)
      GO TO 1000
  710 CALL BUFPLT(MAX0(IX1-2,0),IY1,IDX,IY2)
     
      CALL BUFPLT(IX1,IY1,IDX,IY2)
      CALL BUFPLT(IX1+2,IY1,IDX,IY2)
      GO TO 1000
  720 CALL BUFPLT(MAX0(IX1-2,0),IY1,IDX,IY2)
     
      CALL BUFPLT(IX1,IY1,IDX,IY2)
      CALL BUFPLT(IX1+2,IY1,IDX,IY2)
      GO TO 1000
  730 CALL BUFPLT(MAX0(IX1-1,0),IY1+1,IDX,IY2+1)
     
      CALL BUFPLT(IX1,IY1,IDX,IY2)
      CALL BUFPLT(IX1+1,MAX0(IY1-1,0),IDX,MAX0(IY2-1,0))
      GO TO 1000
  740 CALL BUFPLT(MAX0(IX1-1,0),MAX0(IY1-1,0),IDX,MAX0(IY2-1,0))
     
      CALL BUFPLT(IX1,IY1,IDX,IY2)
      CALL BUFPLT(IX1+1,IY1+1,IDX,IY2+1)
 1000 IF(MORE.GT.0)GO TO 1001
      IF(MMMM.LT.0)GO TO 1
      RETURN
 1001 XI=XN
      YI=YN
      XN=XSAVE
      YN=YSAVE
      GO TO 100
C
      ENTRY WHERE(X,Y,XSCALE)
C     CALL WHERE(X,Y,SCALE)
C     RETURNS CURRENT POSITION AND SCALE FACTOR
      X=XOLD-XMIN
      Y=YOLD-YMIN
      XSCALE=SCALE
      RETURN
C
      ENTRY FACTOR(X)
C     CALL FACTOR(SCALE)
C     CHANGES SCALE FACTOR
      SCALE=X
      RETURN
C
      ENTRY WEIGHT(ILINEWT)
C     CALL WEIGHT(LINEWT)
C     LINEWT=1 SINGLE LINES
C     LINEWT=2 DOUBLE LINES
C     LINEWT=3 TRIPLE LINES
C     LINEWT=12 SOLID DOUBLE LINES
C     LINEWT=23 SOLID TRIPLE LINES
      LINEWT=ILINEWT
      RETURN
      END
      SUBROUTINE BCDX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS,  0.,NCHARS)
      RETURN
      END
      SUBROUTINE BCDY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS, 90.,NCHARS)
      RETURN
      END
      SUBROUTINE BCDMX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS,180.,NCHARS)
      RETURN
      END
      SUBROUTINE BCDMY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS,270.,NCHARS)
      RETURN
      END
      SUBROUTINE IBCDX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS,  0.,NCHARS)
      RETURN
      END
      SUBROUTINE IBCDY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS, 90.,NCHARS)
      RETURN
      END
      SUBROUTINE IBCDMX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS,180.,NCHARS)
      RETURN
      END
      SUBROUTINE IBCDMY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL SYMBOL(X,Y,6./7.*HEIGHT,CHARS,270.,NCHARS)
      RETURN
      END
      SUBROUTINE ASCIIX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
     
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS,  0.,NCHARS)
     
      RETURN
      END
      SUBROUTINE ASCIIY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
     
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS, 90.,NCHARS)
     
      RETURN
      END
      SUBROUTINE ASCIIMX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS,180.,NCHARS)
     
      RETURN
      END
      SUBROUTINE ASCIIMY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS,270.,NCHARS)
     
      RETURN
      END
      SUBROUTINE IASCIIX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS,  0.,NCHARS)
     
      RETURN
      END
      SUBROUTINE IASCIIY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS, 90.,NCHARS)
     
      RETURN
      END
      SUBROUTINE IASCIIMX(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS,180.,NCHARS)
     
      RETURN
      END
      SUBROUTINE IASCIIMY(NWORDS,WORDS,NCHARS,FORM,HEIGHT,X,Y)
C     HEIGHT IS THE ROW TO ROW SPACING
C     CHARACTER HEIGHT IS 6./7.*HEIGHT
      DIMENSION WORDS(9),FORM(9),CHARS(34)
      INTEGER*4 WORDS
      ENCODE(NCHARS,FORM,CHARS)(WORDS(I),I=1,NWORDS)
      CALL VERSYMBOL(X,Y,6./7.*HEIGHT,CHARS,270.,NCHARS)
     
      RETURN
      END
      SUBROUTINE SYMB AT (X,Y)
      DATA SCALE/.05/
C
      ENTRY SIZE OF (X)
     
C     CALL SIZE OF (X)
      SCALE=X
      RETURN
C
      ENTRY X AT (X,Y)
     
      CALL JUMP TO (X+SCALE,Y-SCALE)
      CALL LINE TO (X-SCALE,Y+SCALE)
      CALL JUMP TO (X-SCALE,Y-SCALE)
      CALL LINE TO (X+SCALE,Y+SCALE)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY BOX AT (X,Y)
     
      CALL JUMP TO (X+SCALE,Y+SCALE)
      CALL LINE TO (X+SCALE,Y-SCALE)
      CALL LINE TO (X-SCALE,Y-SCALE)
      CALL LINE TO (X-SCALE,Y+SCALE)
      CALL LINE TO (X+SCALE,Y+SCALE)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY CIRC AT (X,Y)
     
C     ACTUALLY A NONAGON
      CALL JUMP TO (X+SCALE,Y)
      CALL LINE TO (X+.766*SCALE,Y+.643*SCALE)
      CALL LINE TO (X+.174*SCALE,Y+.985*SCALE)
      CALL LINE TO (X-.5*SCALE,Y+.866*SCALE)
      CALL LINE TO (X-.940*SCALE,Y+.342*SCALE)
      CALL LINE TO (X-.940*SCALE,Y-.342*SCALE)
      CALL LINE TO (X-.5*SCALE,Y-.866*SCALE)
      CALL LINE TO (X+.174*SCALE,Y-.985*SCALE)
      CALL LINE TO (X+.766*SCALE,Y-.643*SCALE)
      CALL LINE TO (X+SCALE,Y)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY POINT AT (X,Y)
     
C     ACTUALLY A HALF SIZE PENTAGON
      CALL JUMP TO (X+.5*SCALE,Y)
      CALL LINE TO (X+.154*SCALE,Y+.476*SCALE)
      CALL LINE TO (X-.404*SCALE,Y+.294*SCALE)
      CALL LINE TO (X-.404*SCALE,Y-.294*SCALE)
      CALL LINE TO (X+.154*SCALE,Y-.476*SCALE)
      CALL LINE TO (X+.5*SCALE,Y)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY TRI AT (X,Y)
     
      CALL JUMP TO (X,Y+SCALE)
      CALL LINE TO (X-.866*SCALE,Y-.5*SCALE)
      CALL LINE TO (X+.866*SCALE,Y-.5*SCALE)
      CALL LINE TO (X,Y+SCALE)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY PLUS AT (X,Y)
     
      CALL JUMP TO (X-SCALE,Y)
      CALL LINE TO (X+SCALE,Y)
      CALL JUMP TO (X,Y+SCALE)
      CALL LINE TO (X,Y-SCALE)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY DIME AT (X,Y)
     
      CALL JUMP TO (X+SCALE,Y)
      CALL LINE TO (X,Y-SCALE)
      CALL LINE TO( X-SCALE,Y)
      CALL LINE TO (X,Y+SCALE)
      CALL LINE TO (X+SCALE,Y)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY DEL AT (X,Y)
     
      CALL JUMP TO (X,Y-SCALE)
      CALL LINE TO (X+.866*SCALE,Y+.5*SCALE)
      CALL LINE TO (X-.866*SCALE,Y+.5*SCALE)
      CALL LINE TO (X,Y-SCALE)
      CALL JUMP TO (X,Y)
      RETURN
C
      ENTRY DOT AT (X,Y)
      CALL JUMP TO (X,Y)
      CALL LINE TO (X,Y)
      RETURN
      END
      SUBROUTINE SYMBOL (X1,Y1,HEIGHT,BCD,THETA,NCHAR)                  PLTPK461
      DIMENSION KCT(90),KOC(90)
      DIMENSION IXY(16),ASCDPC(128)
      INTEGER ASCDPC,BCD
      DIMENSION BCD(1),FPC(8),INCHAR(4),IX(8),IY(8),ITAB2(123)          PLTPK467
      CHARACTER*16 ITAB2,ITEMP
      CHARACTER IXY
      CHARACTER*132 STRING
      DATA KCT/
     1 9,13,7,10,8,8,10,7,10,7,17,18,6,5,12,
     2 2,2,5,5,8,5,14,6,3,8,8,11,9,13,8,7,8,7,13,8,
     3 8,6,8,3,5,4,10,7,12,10,13,5,7,3,5,
     4 5,6,7,9,6,9,14,4,9,12,5,16,12,5,2,
     5 11,2,4,4,13,5,0,6,5,8,4,4,14,8,6,
     6 3,3,5,5,3,3,6,6,3,12/
      DATA KOC/
     1 1,3,5,6,8,9,10,12,13,15,16,19,22,23,24,
     2 26,27,28,29,30,31,32,34,35,36,37,97,40,42,44,115,116,117,118,120,
     3 45,46,47,48,49,50,51,53,54,56,58,60,61,62,63,
     4 64,65,66,67,69,70,72,74,81,75,77,78,82,84,85,
     5 86,88,89,90,91,93,94,94,95,30,103,108,32,36,31,
     6 121,35,29,28,104,99,122,34,123,109/
      DATA ITAB2/
     +'2224040040442470','2200000000000000','2224140301103041',
     +'4334247022000000','2224014124702200','7020247022700242',
     +'7022000000000000','7000447004407022','2224022042247022',
     +'2202244222702420','7022000000000000','7000440440702200',
     +'7004440040701232','7022000000000000','7004224470202200',
     +'7040311100701113','0470133344703133','2200000000000000',
     +'7020247022700242','7022700044700440','7022000000000000',
     +'2204440040220000','7020247022000000','2224014124702003',
     +'4320702200000000','0040000000000000','0004000000000000',
     +'2031112027000000','2027163627000000','0040700343700646',
     +'4332344303000000','4030314140704700','7006071716060000',
     +'4101700244060000','1123310000000000','1035700444700141',
     +'0141700444702226','0343701214702224','7032340000000000',
     +'0006173746407043','0300000000000000','4130000737464534',
     +'0470344341000000','4130100106173746','3010702027701737',
     +'0201103041470000','0700700347702540','4000070000000000',
     +'4047240700000000','0007404700000000','3546413010010617',
     +'3746000000000000','0007374645340400','4641301001061737',
     +'4670224000000000','0007374645340470','2440000000000000',
     +'0201103041433414','0506173746000000','2027700747000000',
     +'0702011030414700','0720470000000000','4740240007000000',
     +'0047700740000000','0724477024200000','0747004070143400',
     +'4641301001061737','4600000000000000','3010702027160000',
     +'0506173746450100','4000000000000000','0617374645341470',
     +'3443413010010000','3037024200000000','0434434130100102',
     +'0617374600000000','0607474620000000','1405061737464534',
     +'4341301001031434','0000000000000000','4707043443413010',
     +'0110304146371706','0413334400000000','2125700343000000',
     +'0343000000000000','2125700343700145','7005410000000000',
     +'0047000000000000','2011162700000000','2031362700000000',
     +'2027704536160504','4342311102000000','0444700141000000',
     +'3121223231200000','3121223231000000','2527000000000000',
     +'2524343525703121','2232310000000000','0244067001310000',
     +'4727201201000000','0506173746453424','2270103021100000',
     +'3010173700000000','4604420000000000','2027701131701535',
     +'7013330000000000','1030211070222700','1737301000000000',
     +'2524343525703121','2232312000000000','0141250100000000',
     +'2027701131701535','0617263746702620','0740000000000000',
     +'4641300007374600','4707043470040040','4707043470040000',
     +'5333704341301001','0617374645000000','0007700444704740',
     +'1321330000000000','4604427001410000','0242400000000000'/
      DATA ASCDPC/
     1 45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,
     2 45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,
     3 45,50,52,48,43,51,55,49,41,42,39,37,46,38,47,40,
     4 27,28,29,30,31,32,33,34,35,36,00,63,60,44,59,57,
     5 56,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,
     6 16,17,18,19,20,21,22,23,24,25,26,58,61,54,62,53,
     7 45,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,
     8 16,17,18,19,20,21,22,23,24,25,26,45,45,45,45,45/
      H=HEIGHT                                                          PLTPK528
      NC=NCHAR                                                          PLTPK529
      IF(NC.EQ.0)RETURN
      SI=0.
      CO=1.
      IF(THETA.EQ.0.)GO TO 21
      SI=1.
      CO=0.
      IF(THETA.EQ.90.)GO TO 21
      SI=0.
      CO=-1.
      IF(THETA.EQ.180.)GO TO 21
      SI=-1.
      CO=0.
      IF(THETA.EQ.270.)GO TO 21
      TH=THETA*0.017453
      SI=SIN(TH)                                                        +PLOT341
      CO=COS(TH)                                                        +PLOT342
   21 CONTINUE
      X=X1                                                              PLTPK536
      Y=Y1                                                              PLTPK537
      IC=3                                                              PLTPK538
      IF(NC.GE.1)GO TO 50
      FACT=H/4.0                                                        PLTPK540
      IF(NCHAR.EQ.-2)CALLPLOT(X,Y,2)                                    PLTPK541
C     IF (NCHAR.LT.-1) 40,60                                            PLTPK542
C 40  IC=2                                                              PLTPK543
      X=X-2.0*FACT*(CO-SI)                                              PLTPK544
      Y=Y-2.0*FACT*(CO+SI)                                              PLTPK545
      NC=1                                                              PLTPK546
      ITSUB=BCD(1)+1
      GO TO 70                                                          PLTPK549
50    FACT=H/7.0                                                        PLTPK550
      IS=1                                                              PLTPK551
      ICON=26                                                           PLTPK552
      N=(NCHAR+3)/4
      N4=N*4
      ENCODE(N4,51,STRING)(BCD(I),I=1,N)
   51 FORMAT(33A4)
C 60  IC=3                                                              PLTPK553
70    XA=FACT*CO                                                        PLTPK554
      YA=FACT*SI                                                        PLTPK555
      XT=XA*6.0                                                         PLTPK556
      YT=YA*6.0                                                         PLTPK557
      ISFIRST=1                                                         PLTPK558
      IDEL=1                                                            PLTPK559
      J=1                                                               PLTPK560
      DO 230 K=1,NC
      IF(NCHAR.LT.1)GO TO 121
      ITEMP=STRING(K:K)
      IASCII=ICHAR(ITEMP)
C     PATCH TO GET RID OF CROSSED Os.  NOW O AND ZERO ARE SAME.
      IF(IASCII.EQ.79)IASCII=48
C
      ITSUB=ASCDPC(IASCII+1)+27
  121 CONTINUE
      ICT=KCT(ITSUB)                                                    PLTPK567
      LOC=KOC(ITSUB)                                                    PLTPK568
130   CONTINUE                                                          PLTPK569
      ITEMP=ITAB2(LOC)                                                  PLTPK570
      DO 131   ILOOP=1,16                                               PLTPK571
      IXY(ILOOP)=ITEMP(ILOOP:ILOOP)
131   CONTINUE                                                          PLTPK574
      DO103LOOP=1,8                                                     PLTPK576
      IX(LOOP)=ICHAR(IXY(LOOP+LOOP-1))-48
      IY(LOOP)=ICHAR(IXY(LOOP+LOOP))-48
  103 CONTINUE                                                          PLTPK580
      I=1                                                               PLTPK581
  140 IF(IX(I).NE.7)GO TO 160
      IC=3                                                              PLTPK583
      GO TO 170                                                         PLTPK584
  160 XN=X+XA*FLOAT(IX(I))-YA*FLOAT(IY(I))
      YN=Y+YA*FLOAT(IX(I))+XA*FLOAT(IY(I))
      CALL PLOT (XN,YN,IC)                                              PLTPK589
      IC=2                                                              PLTPK590
170   ICT=ICT-1                                                         PLTPK591
      IF(ICT.LE.0)GO TO 200
      I=I+1                                                             PLTPK593
      IF(I.LE.8)GO TO 140
      LOC=LOC+1                                                         PLTPK595
      GO TO 130                                                         PLTPK596
C     END OF SINGLE CHARACTER ***                                       PLTPK597
200   X=X+XT                                                            PLTPK598
      Y=Y+YT                                                            PLTPK599
      IC=3                                                              PLTPK603
  230 CONTINUE
      RETURN
      END                                                               PLTPK611
      SUBROUTINE NUMBER (X,Y,HGHT,FPN,THETA,N)                          PLTPK231
      DIMENSION HOLL(10)
      INTEGER HOLL
      DATA HOLL/1H0,1H1,1H2,1H3,1H4,1H5,1H6,1H7,1H8,1H9/
C     DIMENSIONL(2)                                                     PLTPK232
C     TFPN =ABSF(FPN)+.0001                                             PLTPK233
      TFPN=ABS(FPN)+10.**(-IABS(N)-1)                                   PLTPK234
      TH = THETA * 0.017455                                             PLTPK235
      CTH = HGHT * 6.0 / 7.0                                            PLTPK236
      STH=CTH*SIN(TH)                                                   PLTPK237
      CTH=CTH*COS(TH)                                                   PLTPK238
      XT = X                                                            PLTPK239
      YT = Y                                                            PLTPK240
      IF (FPN) 10,90,20                                                 PLTPK241
   10 CALL SYMBOL (XT,YT,HGHT,1H-,THETA,1)                              PLTPK242
      XT = XT + CTH                                                     PLTPK243
      YT = YT + STH                                                     PLTPK244
   20 I=0.4343*ALOG(TFPN)+1.0                                           +PLOT269
      IF (I) 50,50,30                                                   PLTPK246
   30 DO 40 J = 1,I                                                     PLTPK247
        JK = 0                                                          PLTPK248
      K=TFPN*10.0**(J-I)                                                PLTPK249
C     L=K+27                                                            PLTPK250
C     L=ILSHFT(L,54)                                                    PLTPK251
      L=HOLL(K+1)
      CALL SYMBOL (XT,YT,HGHT,L,THETA,1)                                PLTPK252
      TFPN=TFPN-FLOAT(K*10**(I-J))                                      +PLOT270
        XT = XT + CTH                                                   PLTPK254
   40   YT = YT + STH                                                   PLTPK255
      IF (N+1) 80,80,50                                                 PLTPK256
   50 CALL SYMBOL (XT,YT,HGHT,1H.,THETA,1)                              PLTPK257
      IF(N)60,80,60                                                     PLTPK258
   60 DO 70 I = 1,N                                                     PLTPK259
        XT = XT + CTH                                                   PLTPK260
        YT = YT + STH                                                   PLTPK261
        JK = 0                                                          PLTPK262
        K = TFPN * 10.0                                                 PLTPK263
C     L=K+27                                                            PLTPK264
C     L=ILSHFT(L,54)                                                    PLTPK265
      L=HOLL(K+1)
62    CALL SYMBOL (XT,YT,HGHT,L,THETA,1)                                PLTPK266
   70 TFPN=TFPN*10.0-FLOAT(K)                                           +PLOT271
   80 RETURN                                                            PLTPK268
   90 CALL SYMBOL (XT,YT,HGHT,13H0.0000000000 ,THETA,2+N)               PLTPK269
      RETURN                                                            PLTPK270
      END                                                               PLTPK271
      SUBROUTINE AXIS(X,Y,BCD,N,SIZE,THETA,XMIN,DX)                     PLTPK272
C           SIZE  IS THE LENGTH OF THE AXIS TO BE DRAWN. SIZE IS        PLTPK273
C                 FLOATING POINT AND SHOULD BE MULTIPLY OF (10.0/DIV).  PLTPK274
C           THETA IS THE ANGLE OF THE AXIS MEASURED COUNTER-CLOCKWISE   PLTPK275
C                 VARIABLE ALONG AXIS. DX IS FLOATING POINT. (SEE NOTE) PLTPK276
C           BCD   IS THE LOCATION OF ALPHA INFORMATION FOR AXIS TITLE.  PLTPK277
C                 USUALLY VARIABLE NAME. (NORMALLY SET UP WITH LITERAL) PLTPK278
C           N     IS THE NUMBER OF CHARACTERS IN BCD TITLE. A NEGATIVE  PLTPK279
C                 N PLACES THE ANNOTATION ON THE CLOCKWISE SIDE OF AXIS PLTPK280
C                 LINE AND VICE-VERSA.                                  PLTPK281
C                                                                       PLTPK282
C   NOTE- THE SECOND VERSION OF SCALE PLACES XMIN IN VARIABLE(J*K+1)AND PLTPK283
C         DX IN VARIABLE(J*K+K+1). WHERE J IS NUMBER OF ELEMENTS IN     PLTPK284
C         ARRAY AND K IS THE REPEAT CYCLE OF MIXED ARRAY.               PLTPK285
C                                                                       PLTPK286
      L=IABS(N)                                                         +PLOT272
      TH = THETA * 0.0174533                                            PLTPK288
      CTH=COS(TH)                                                       PLTPK289
      STH=SIN(TH)                                                       PLTPK290
      RN = N                                                            /PLOT108
     
     
     
     
     
     
     
     
     
      DYB = -.05 + .5*SIGN(.3,RN)                                       /PLOT109
      DXB=-.1                                                           PLTPK292
      DYC = -.075 + .5*SIGN(.65,RN)                                     /PLOT110
      DXC = SIZE / 2.0 - .12*FLOAT((L+7)/2)                             PLTPK294
      NOTE=SIZE +1.0                                                    PLTPK295
      XN   = X + DXB * CTH - DYB * STH                                  PLTPK296
      YN   = Y + DYB * CTH + DXB * STH                                  PLTPK297
      ADY=ABS(DX)                                                       PLTPK298
      EX   = 0.0                                                        PLTPK299
      IF (ADY) 3,7,3                                                    PLTPK300
    3 IF (ADY - 100.0) 6,4,4                                            PLTPK301
    4 ADY  = ADY / 10.0                                                 PLTPK302
      EX   = EX + 1.0                                                   PLTPK303
      GO TO 3                                                           PLTPK304
    5 ADY  = ADY * 10.0                                                 PLTPK305
      EX   = EX - 1.0                                                   PLTPK306
    6 IF (ADY - 0.01) 5,7,7                                             PLTPK307
    7 IEX = EX                                                          PLTPK308
      ABSV = XMIN/10.0**IEX                                             PLTPK309
      ADY=SIGN(ADY,DX)                                                  PLTPK310
      NT=SQRT(DXC**2+DYC**2)                                            +PLOT273
      DO 10  I = 1,NOTE                                                 PLTPK312
      CALL NUMBER(XN,YN,.1,ABSV,THETA,2)                                PLTPK313
        ABSV = ABSV + ADY                                               PLTPK314
        XN   = XN + CTH                                                 PLTPK315
        YN   = YN + STH                                                 PLTPK316
        IF (NT) 10,8,10                                                 PLTPK317
    8   XT = X + DXC * CTH - DYC * STH                                  PLTPK318
        YT = Y + DYC * CTH + DXC * STH                                  PLTPK319
      CALL SYMBOL(XT,YT,.14,BCD,THETA,L)                                PLTPK320
        IF (EX      ) 9,10,9                                            PLTPK321
    9 XT=XT+FLOAT(L)*CTH*.12                                            +PLOT274
      YT=YT+FLOAT(L)*STH*.12                                            +PLOT275
      CALL SYMBOL(XT,YT,.14,7H(X10  ),THETA,7)                          PLTPK324
C     XT=XT+.96*STH-.12*CTH                                             PLTPK325
      XT=XT+.48*CTH-.12*STH                                             PLTPK326
      YT=YT+.12*CTH+.48*STH                                             PLTPK327
C     YT=YT+.12*CTH+.96*STH                                             PLTPK328
      CALL NUMBER(XT,YT,.1,EX,THETA,-1)                                 PLTPK329
   10   NT = NT - 1                                                     PLTPK330
      NTIC=SIZE +1.0                                                    PLTPK331
      XN   = X + CTH * SIZE                                             PLTPK332
      YN   = Y + STH * SIZE                                             PLTPK333
      CALL PLOT (XN,YN,3)                                               PLTPK334
      XN = FLOAT(NTIC-1) * CTH + X                                      PLTPK335
      YN = FLOAT(NTIC-1) * STH + Y                                      PLTPK336
      DO 11 I = 1,NTIC                                                  PLTPK337
      CALL SYMBOL(XN,YN,.1,13,THETA,-2)                                 PLTPK338
        XN = XN - CTH                                                   PLTPK339
   11   YN = YN - STH                                                   PLTPK340
      RETURN                                                            PLTPK341
      END                                                               PLTPK342
      SUBROUTINE SCALE(X,S,N,K)                                         PLTPK343
C                                                                       PLTPK344
C             AND MINIMUM VALUES. AN ADJUSTED MINIMUM VALUE WILL BE     PLTPK345
C             STORED IN X(N*K+1). AN ADJUSTED DX(MAX.-MIN.) WILL BE     PLTPK346
C             STORED IN X(N*K+K+1).                                     PLTPK347
C          S  IS THE LENGTH OVER WHICH THIS DATA IS TO BE PLOTTED.      PLTPK348
C          N  IS THE NUMBER OF DATA POINTS IN THE ARRAY X.              PLTPK349
C          K  IS THE REPEAT CYCLE OF A MIXED ARRAY.(NORMALLY 1)         PLTPK350
C                                                                       PLTPK351
      DIMENSION X(2)                                                    PLTPK352
      NP = N * K                                                        PLTPK353
      L = NP + 1                                                        PLTPK354
      J = NP +K + 1                                                     PLTPK355
      XMAX = X(1)                                                       PLTPK356
      X(L) = X(1)                                                       PLTPK357
      DO 10 I = 1,NP,K                                                  PLTPK358
      IF (XMAX-X(I)) 5,6,6                                              PLTPK359
    5 XMAX = X(I)                                                       PLTPK360
    6 IF (X(L)-X(I))10,10,7                                             PLTPK361
    7 X(L) = X(I)                                                       PLTPK362
   10 CONTINUE                                                          PLTPK363
      DX=(XMAX-X(L))/S                                                  PLTPK364
      IF (DX) 31,31,30                                                  PLTPK365
   31 X(J) = 1.0                                                        PLTPK366
      X(L) = X(L) - 0.5                                                 PLTPK367
      RETURN                                                            PLTPK368
   30 IDX=ALOG10(DX)                                                    PLTPK369
      IXMN = X(L) * 10.0 ** (-IDX)                                      PLTPK370
      IF (X(L))32,33,34                                                 PLTPK371
   32 IXMN = X(L) * 10.0 ** (-IDX) - 0.99                               PLTPK372
   34 X(L) = IXMN                                                       PLTPK373
      X(L) = X(L) * 10.0 ** IDX                                         PLTPK374
   33 DX=ALOG10((XMAX-X(L))/S)                                          PLTPK375
      IDX = DX                                                          PLTPK376
      XMAX = IDX                                                        PLTPK377
      DX=10.0**(DX-XMAX)                                                PLTPK378
      XMAX = 1.0                                                        PLTPK379
   41 IF (DX-1.0) 40,20,11                                              PLTPK380
   40 DX = DX * 10.0                                                    PLTPK381
      IDX = IDX - 1                                                     PLTPK382
      GO TO 41                                                          PLTPK383
   11 XMAX=2.0                                                          PLTPK384
      IF(DX-2.0) 20,20,12                                               PLTPK385
   12 XMAX = 4.0                                                        PLTPK386
      IF (DX-4.0) 20,20,13                                              PLTPK387
   13 XMAX=5.0                                                          PLTPK388
      IF(DX-5.0) 20,20,14                                               PLTPK389
   14 XMAX=8.0                                                          PLTPK390
      IF (DX-8.0) 20,20,15                                              PLTPK391
   15 XMAX=10.0                                                         PLTPK392
   20 X(J)=XMAX*10.0**IDX                                               PLTPK393
      RETURN                                                            PLTPK394
      END                                                               PLTPK395
      SUBROUTINE LINE (X,Y,N,K,J,L)                                     PLTPK396
      DIMENSION X(1), Y(1)                                              PLTPK397
C       X IS THE NAME OF THE ARRAY OF UNSCALED ORDINATE VALUES.         PLTPK398
C       Y IS THE NAME OF THE ARRAY OF UNSCALED ABCISSA VALUES.          PLTPK399
C       N IS THE NUMBER OF POINTS IN THE ARRAY                          PLTPK400
C       K IS THE REPEAT CYCLE OF A MIXED ARRAY (NORMALLY=1)             PLTPK401
C       J IS THE ALTERNATE NUMBER OF DATA POINT TO PLOT A SYMBOL.       PLTPK402
C         J =1 FOR POINT FOR EVERY DATA POINT,2 FOR EVERY OTHER         PLTPK403
C         J WILL = 0 FOR LINE PLOT,NEGATIVE FOR POINT PLOT,             PLTPK404
C       L IS AN INTEGER DESCRIBING SYMBOL TO BE USED, SEE SYMBOL        PLTPK405
C         ROUTINE FOR LIST                                              PLTPK406
C     NOTE THIS ROUTINE EXPECTS XMIN,DX,YMIN AND DY TO BE STORED IN     PLTPK407
C       X(N*K+1),X(N*K+1+K),Y(N*K+1,AND Y(N*K+1+K) RESPECTIVELY.        PLTPK408
C     MODIFIED 11/13/69  SL GARREN    SAO                               (PLT1  1
C     IF L.LT.0 USE CORNER REFERENCED CHARACTER SET,CENTER REFERENCED   (PLT1  2
C     ENTRY POINT SIZE(SZ) SETS SIZE OF CHARACTERS TO SZ INCHES         (PLT1  3
C                                                                       PLTPK409
      DIMENSION DPCASC(64)
      INTEGER DPCASC
      DATA DPCASC/
     1 1H:,1HA,1HB,1HC,1HD,1HE,1HF,1HG,
     2 1HH,1HI,1HJ,1HK,1HL,1HM,1HN,1HO,
     3 1HP,1HQ,1HR,1HS,1HT,1HU,1HV,1HW,
     4 1HX,1HY,1HZ,1H0,1H1,1H2,1H3,1H4,
     5 1H5,1H6,1H7,1H8,1H9,1H+,1H-,1H*,
     6 1H/,1H(,1H),1H$,1H=,1H ,1H,,1H.,
     7 1H#,1H',1H!,1H%,1H",1H_,1H],1H&,
     8 1H@,1H?,1H[,1H>,1H<,1H\,1H^,1H;/
      DATA SIZ,XI,YI/.08,.022857,.044571428  /                          (PLT1  4
      L1=L                                                              (PLT1  5
      LL = L                                                            /PLT2  1
      IF(LL.LT.0)LL=DPCASC(-LL+1)
C     IF(LL .LT. 0) LL = ILSHFT(-LL,54)                                 /PLT2  2
      NP=N*K+1                                                          PLTPK410
      NQ=NP+K                                                           PLTPK411
      NO = N*K-K+1                                                      /PLT3  1
      XMIN=X(NP)                                                        PLTPK413
      DX=X(NQ)                                                          PLTPK414
      YMIN=Y(NP)                                                        PLTPK415
      DY=Y(NQ)                                                          PLTPK416
      I3=3                                                              PLTPK417
      CALL WHERE (XN,YN,IC)                                             PLTPK418
      I2=-1                                                             PLTPK419
      XN=XN*DX+XMIN                                                     PLTPK420
      YN=YN*DY+YMIN                                                     PLTPK421
      DX1=ABS(X(1)-XN)                                                  +PLOT276
      DY1=ABS(Y(1)-YN)                                                  +PLOT277
      DX2=ABS(X(NO)-XN)                                                 +PLOT278
      DY2=ABS(Y(NO)-YN)                                                 +PLOT279
      DX1=MAX1(DX1,DY1)                                                 +PLOT280
      DX2=MAX1(DX2,DY2)                                                 +PLOT281
      KK=K                                                              PLTPK428
      NA=0                                                              PLTPK429
      NT=J                                                              PLTPK430
      IF (NT) 10,30,20                                                  PLTPK431
10    NT=-NT                                                            PLTPK432
20    NA=(N-1)/NT                                                       PLTPK433
30    NA=NA*NT+NT+1-N                                                   PLTPK434
      IF (DX1-DX2) 40,40,50                                             PLTPK435
40    NO=1                                                              PLTPK436
      KK=-KK                                                            PLTPK437
      NA=NT                                                             PLTPK438
50    NV=2                                                              PLTPK439
      NW=-2                                                             PLTPK440
      KL=2                                                              PLTPK441
      IF (J) 60,70,80                                                   PLTPK442
60    NV=3                                                              PLTPK443
      NW=-1                                                             PLTPK444
      KL=1                                                              PLTPK445
      GO TO 80                                                          PLTPK446
70    NA=NP                                                             PLTPK447
80    DO 140 I=1,N                                                      PLTPK448
      IF (NA-NT) 100,90,110                                             PLTPK449
90    DX1=(X(NO)-XMIN)/DX                                               (PLT1  7
      DY1=(Y(NO)-YMIN)/DY                                               (PLT1  8
      IF(L1.GT.0) GO TO 91                                              (PLT1  9
      IF(I2.NE.-2) GO TO 92                                             (PLT1 10
      CALL PLOT(DX1,DY1,2)                                              (PLT1 11
92    I2=1                                                              (PLT1 12
      DX1=DX1-XI                                                        (PLT1 13
      DY1=DY1-YI                                                        (PLT1 14
91    CALL SYMBOL(DX1, DY1, SIZ, LL, 0., I2)                            /PLT2  3
      CALL PLOT(DX1,DY1,3)
      IF(L1.LT.1) CALL PLOT(DX1+XI,DY1+YI,3)                            (PLT1 16
      NA=1                                                              PLTPK451
      GO TO 130                                                         PLTPK452
100   GO TO (120,110), KL                                               PLTPK453
110   CALL PLOT ((X(NO)-XMIN)/DX,(Y(NO)-YMIN)/DY,I3)                    PLTPK454
120   NA=NA+1                                                           PLTPK455
130   I3=NV                                                             PLTPK456
      I2=NW                                                             PLTPK457
140   NO=NO-KK                                                          PLTPK458
      RETURN                                                            PLTPK459
      ENTRY SIZE                                                        (PLT1 17
      SIZ=X(1)                                                          (PLT1 18
      XI=.2857142*SIZ                                                   (PLT1 19
      YI=.571428*SIZ                                                    (PLT1 20
      RETURN                                                            (PLT1 21
      END                                                               PLTPK460
      SUBROUTINE VERSYMBOL(XZ,YZ,HGT,ITEXT,ANGLE,NZ)
C     SUBROUTINE SYMBOL(XZ,YZ,HGT,ITEXT,ANGLE,NZ)
C
C        CALL SYMBOL(X,Y,HGT,ITEXT,ANGLE,NC)
C
C             X,Y   IS THE STARTING COORDINATE OF THE TEXT GENERATION.
C             HGT   IS THE CHARACTER HEIGHT SPECIFICATION (IN INCHES).
C             ITEXT IS THE ALPHANUMERIC TEXT TO BE GENERATED.
C             ANGLE IS THE ANGLE AT WHICH THE CHARACTER LINE IS PLOTTED
C             NC    IS THE NUMBER OF CHARACTERS TO BE PLOTTED.
C
C                 NC>0   ALPHA TEXT, NUMBER OF CHARACTER TO BE PLOTTED.
C                 NC=0   PLOT SINGLE CHARACTER,RIGHT-JUSTIFIED IN ITEXT
C                 NC=-1  MOVE TO X,Y WITH 'PEN' UP;PLOT SYMBOL # ITEXT.
C                 NC<-1  MOVE TO X,Y 'PEN' DOWN;PLOT SYMBOL # 'ITEXT'.
C
C     VERSATEC ROUTINE WITH ALL THE SHIFTING AND MASKING STRIPPED OUT
      DIMENSION XA(14),YA(14),ASIN(5),ACOS(5)
      DIMENSION ITEXT(1)
      CHARACTER*1 ITEMP
      CHARACTER*132 STRING
      DIMENSION IXYS(2,936),NNODES(128),INODE(128)
C
      DATA  RADCO/0.01745329/,FNN/999.0/,FCTR/0.7/,FACC/0.0/,THETA/0.0/
      DATA  ANCC/1.0/,ANCS/0.0/,XC/0.0/,YC/0.0/,XT/0.0/
      DATA YT/0.0/,XO/0.0/,YO/0.0/
      DATA XA,YA/14*0.,14*0./
      DATA EPSIL/0.0000277/
      DATA ASIN(1)/0./,ASIN(2)/1./,ASIN(3)/0./,ASIN(4)/-1./,ASIN(5)/0./
      DATA ACOS(1)/1./,ACOS(2)/0./,ACOS(3)/-1./,ACOS(4)/0./,ACOS(5)/1./
      DATA IXYS/
     1  2, 2, 2, 4, 0, 4, 0, 0, 4, 0, 4, 4, 2, 4, 2, 2, 2, 2, 2, 4,
     2  1, 4, 0, 3, 0, 1, 1, 0, 3, 0, 4, 1, 4, 3, 3, 4, 2, 4, 2, 2,
     3  2, 2, 2, 4, 0, 1, 4, 1, 2, 4, 2, 2, 2, 2, 4, 2,15, 0, 2, 4,
     4  2, 0,15, 0, 0, 2, 2, 2, 2, 2, 4, 4,15, 0, 0, 4, 4, 0,15, 0,
     5  0, 0, 2, 2, 2, 2, 2, 4, 0, 2, 2, 0, 4, 2, 2, 4, 2, 2, 2, 2,
     6  2, 0, 2, 4, 0, 2, 4, 2, 2, 4, 2, 2, 2, 2, 0, 0, 4, 4, 0, 4,
     7  4, 0, 2, 2, 2, 2, 4, 4, 0, 4, 4, 4, 0, 0, 4, 0, 0, 0, 2, 2,
     8  2, 2, 4, 4,15, 0, 0, 4, 2, 2,15, 0, 2, 0, 2, 2, 2, 2, 4, 4,
     9 15, 0, 3, 3, 3, 1, 4, 0,15, 0, 0, 0, 1, 1, 1, 3, 0, 4,15, 0,
     A  1, 1, 3, 1,15, 0, 1, 3, 3, 3, 2, 2, 2, 2, 4, 2,15, 0, 2, 4,
     1  2, 0,15, 0, 0, 2, 2, 2, 4, 4,15, 0, 0, 4, 4, 0,15, 0, 0, 0,
     2  2, 2, 2, 2, 4, 4, 0, 4, 4, 0, 0, 0, 2, 2, 2, 2, 2, 4, 2, 0,
     3  2, 2, 3, 2, 5, 8, 7, 2, 2, 6, 8, 6, 3, 2, 2, 2, 6, 2, 2, 2,
     4  2, 6,15, 4, 2, 1, 3, 1, 4, 2, 4, 5, 5, 6, 4, 7, 4,10, 3,11,
     5  2,11, 2, 7, 6, 7,15, 0, 6, 5, 2, 5,15, 0, 2, 3, 6, 3, 1, 5,
     6  7, 5, 5, 6, 5, 4, 7, 5,15, 3, 2, 4, 6, 4,15, 0, 6, 6, 2, 6,
     7 15, 0, 3, 3, 5, 7, 2, 3, 6, 3,15, 0, 4, 4, 4, 8,15, 0, 2, 6,
     8  6, 6, 6, 1, 5, 1, 4, 2, 4, 5, 3, 6, 4, 7, 4,10, 5,11, 6,11,
     9 15, 5, 1,10, 8,10, 1, 2, 2, 1, 3, 1, 4, 2, 4, 9, 5,10, 6,10,
     A  7, 9, 2, 4, 5, 4, 6, 5, 6, 6, 5, 7, 2, 7, 2, 6, 4, 2, 6, 6,
     1  1, 4, 2, 5, 3, 5, 5, 3, 6, 3, 7, 4, 1, 4, 2, 5, 3, 5, 5, 3,
     2  6, 3, 7, 4,15, 0, 7, 6, 6, 5, 5, 5, 3, 7, 2, 7, 1, 6,15, 0,
     3  4, 9, 4, 4,15, 0, 3, 2, 4, 3, 5, 2, 3, 2, 5, 7, 4, 9, 5, 9,
     4  5, 7,15, 0, 3, 7, 2, 9, 3, 9, 3, 7, 2, 4, 6, 4, 5, 4, 5, 3,
     5  5, 7, 5, 6, 6, 6, 2, 6, 3, 6, 3, 7, 3, 3, 4, 9, 4, 2,15, 0,
     6  2, 3, 5, 3, 6, 4, 6, 5, 5, 6, 3, 6, 2, 7, 3, 8, 6, 8, 3, 8,
     7  2, 8, 2, 9, 3, 9, 3, 8,15, 0, 6, 9, 2, 2,15, 0, 5, 3, 6, 3,
     8  6, 2, 5, 2, 5, 3, 6, 2, 3, 7, 3, 8, 4, 9, 5, 8, 2, 5, 2, 4,
     9  3, 3, 4, 3, 6, 4, 5, 7, 4, 9, 5, 9, 5, 7, 6, 9, 5, 8, 5, 3,
     A  6, 2, 2, 9, 3, 8, 3, 3, 2, 2, 2, 5, 6, 5,15, 0, 2, 3, 6, 7,
     1 15, 0, 2, 7, 6, 3, 4, 4, 4, 8,15, 0, 2, 6, 6, 6, 4, 2, 3, 2,
     2  3, 3, 4, 3, 4, 2, 3, 1, 2, 5, 6, 5, 4, 2, 3, 2, 3, 3, 4, 3,
     3  4, 2, 2, 2, 6, 9, 6, 8, 5, 9, 3, 9, 2, 8, 2, 3, 3, 2, 5, 2,
     4  6, 3, 6, 8, 3, 8, 4, 9, 4, 2,15, 0, 3, 2, 5, 2, 2, 8, 3, 9,
     5  5, 9, 6, 8, 6, 6, 2, 4, 2, 2, 6, 2, 2, 8, 3, 9, 5, 9, 6, 8,
     6  6, 7, 5, 6, 3, 6, 5, 6, 6, 5, 6, 3, 5, 2, 3, 2, 2, 3, 2, 4,
     7  6, 4,15, 0, 5, 9, 5, 2,15, 0, 2, 9, 2, 4,15, 0, 4, 2, 6, 2,
     8  2, 3, 3, 2, 5, 2, 6, 3, 6, 5, 5, 6, 2, 6, 2, 9, 6, 9, 3, 6,
     9  5, 6, 6, 5, 6, 3, 5, 2, 3, 2, 2, 3, 2, 8, 3, 9, 5, 9, 6, 8,
     A  2, 9, 6, 9, 6, 8, 4, 3, 4, 2, 5, 6, 6, 7, 6, 8, 5, 9, 3, 9,
     1  2, 8, 2, 7, 3, 6, 5, 6, 6, 5, 6, 3, 5, 2, 3, 2, 2, 3, 2, 5,
     2  3, 6, 2, 3, 3, 2, 5, 2, 6, 3, 6, 8, 5, 9, 3, 9, 2, 8, 2, 6,
     3  3, 5, 5, 5, 6, 6, 3, 5, 3, 6, 4, 6, 4, 5, 3, 5,15, 0, 4, 2,
     4  3, 2, 3, 3, 4, 3, 4, 2, 3, 5, 3, 6, 4, 6, 4, 5, 3, 5,15, 0,
     5  4, 2, 3, 2, 3, 3, 4, 3, 4, 2, 3, 1, 6, 8, 2, 6, 6, 4, 2, 4,
     6  6, 4,15, 0, 6, 6, 2, 6, 2, 4, 6, 6, 2, 8, 3, 2, 4, 3, 5, 2,
     7  3, 2,15, 0, 4, 4, 4, 6, 5, 6, 6, 7, 6, 8, 5, 9, 3, 9, 2, 8,
     8  6, 6, 5, 7, 4, 7, 3, 6, 3, 5, 4, 4, 5, 4, 6, 5, 6, 7, 5, 8,
     9  3, 8, 2, 7, 2, 4, 3, 3, 5, 3, 6, 4, 2, 2, 2, 5, 6, 5,15, 0,
     A  2, 5, 2, 8, 3, 9, 5, 9, 6, 8, 6, 2, 6, 3, 6, 5, 5, 6, 2, 6,
     1  5, 6, 6, 7, 6, 8, 5, 9, 2, 9, 2, 2, 5, 2, 6, 3, 6, 8, 5, 9,
     2  3, 9, 2, 8, 2, 3, 3, 2, 5, 2, 6, 3, 6, 8, 5, 9, 2, 9, 2, 2,
     3  5, 2, 6, 3, 6, 8, 6, 9, 2, 9, 2, 6, 5, 6,15, 0, 2, 6, 2, 2,
     4  6, 2, 6, 9, 2, 9, 2, 6, 5, 6,15, 0, 2, 6, 2, 2, 6, 8, 5, 9,
     5  3, 9, 2, 8, 2, 3, 3, 2, 5, 2, 6, 3, 6, 5, 5, 5, 2, 2, 2, 9,
     6 15, 0, 2, 6, 6, 6,15, 0, 6, 9, 6, 2, 3, 2, 5, 2,15, 0, 4, 2,
     7  4, 9,15, 0, 3, 9, 5, 9, 2, 3, 3, 2, 5, 2, 6, 3, 6, 9, 2, 9,
     8  2, 2,15, 0, 2, 5, 6, 9,15, 0, 4, 7, 6, 2, 2, 9, 2, 2, 6, 2,
     9  2, 2, 2, 9, 4, 5, 6, 9, 6, 2, 6, 9, 6, 2, 2, 9, 2, 2, 4, 7,
     A  6, 9,15, 0, 6, 8, 5, 9, 3, 9, 2, 8, 2, 3, 3, 2, 5, 2, 6, 3,
     1  6, 8, 2, 2, 2, 9, 5, 9, 6, 8, 6, 7, 5, 6, 2, 6, 6, 8, 5, 9,
     2  3, 9, 2, 8, 2, 3, 3, 2, 5, 2, 6, 3, 6, 8,15, 0, 4, 4, 6, 2,
     3  2, 2, 2, 9, 5, 9, 6, 8, 6, 7, 5, 6, 2, 6, 5, 6, 6, 5, 6, 2,
     4  6, 8, 5, 9, 3, 9, 2, 8, 2, 7, 3, 6, 5, 6, 6, 5, 6, 3, 5, 2,
     5  3, 2, 2, 3, 2, 9, 6, 9,15, 0, 4, 9, 4, 2, 2, 9, 2, 3, 3, 2,
     6  5, 2, 6, 3, 6, 9, 2, 9, 4, 2, 6, 9, 2, 9, 2, 2, 4, 6, 6, 2,
     7  6, 9, 2, 9, 6, 2,15, 0, 2, 2, 6, 9, 2, 9, 4, 7, 4, 2,15, 0,
     8  4, 7, 6, 9, 2, 9, 6, 9, 2, 2, 6, 2,15, 0, 3, 6, 5, 6, 6, 9,
     9  2, 9, 2, 2, 6, 2, 2, 9, 6, 2, 2, 2, 6, 2, 6, 9, 2, 9, 2, 2,
     A  4, 6, 6, 2, 1, 1, 8, 1, 6, 7, 5, 7, 4, 6, 3, 7, 2, 7, 1, 6,
     1  1, 5, 2, 4, 3, 4, 4, 5, 4, 6, 4, 5, 5, 4, 6, 4, 7, 5, 7, 6,
     2  6, 7, 2, 5, 7, 5, 7, 4, 2, 2, 3, 7, 3, 4, 4, 3, 5, 3, 6, 4,
     3  6, 7, 6, 4, 7, 3, 3, 3, 3, 7,15, 0, 2, 7, 6, 7,15, 0, 5, 7,
     4  5, 3, 4, 2, 4, 8,15, 0, 3, 7, 2, 6, 2, 4, 3, 3, 5, 3, 6, 4,
     5  6, 6, 5, 7, 3, 7, 3, 7, 2, 6, 2, 4, 3, 3, 5, 3, 6, 4, 6, 6,
     6  5, 7, 3, 7,15, 0, 1, 5, 7, 5, 2, 6, 3, 6, 3, 4, 4, 3, 5, 4,
     7  5, 6, 6, 6,15, 0, 4, 2, 4, 8, 2, 3, 6, 6,15, 0, 2, 6, 3, 6,
     8  5, 3, 6, 3, 2, 7, 2, 4, 3, 3, 4, 4, 4, 7, 4, 4, 5, 3, 6, 4,
     9  6, 7, 2, 8, 3, 7, 4, 5, 6, 3,15, 0, 2, 2, 4, 5, 6, 7, 5, 7,
     A  4, 6, 3, 7, 2, 7, 1, 6, 1, 5, 2, 4, 3, 4, 4, 5, 4, 6, 4, 5,
     1  5, 4, 6, 4, 5, 8, 4, 8, 3, 7, 4, 6, 5, 6, 6, 5, 6, 4, 5, 3,
     2  4, 3, 3, 4, 3, 5, 4, 6, 6, 7, 4, 7, 3, 6, 3, 4, 4, 3, 6, 3,
     3 15, 0, 6, 5, 2, 6, 2, 6, 3, 7, 4, 6, 3, 4, 4, 6, 5, 7, 6, 6,
     4  5, 2,15, 1,15, 2, 7, 1, 2, 1, 5, 6, 2,10, 7,10, 1, 5, 6, 5,
     5 15, 0, 3, 3, 3, 4, 4, 4, 4, 3, 3, 3,15, 0, 3, 6, 3, 7, 4, 7,
     6  4, 6, 3, 6, 6, 8, 2, 6, 6, 4,15, 0, 6, 3, 2, 3, 6, 3, 2, 3,
     7 15, 0, 2, 4, 6, 6, 2, 8, 1, 2, 4, 7, 7, 2, 1, 2, 6, 6, 5, 7,
     8  3, 7, 2, 6, 2, 4, 3, 3, 5, 3, 6, 4,15, 0, 4, 2, 4, 8, 1, 5,
     9  7, 5, 2, 1, 2,10, 2, 8, 3, 9, 4, 8, 4, 2,15, 0, 4, 8, 5, 9,
     A  6, 8, 2, 3, 3, 4, 4, 2, 4,10, 7,10, 4, 2, 4, 9,15, 0, 3, 4,
     1  5, 4,15, 0, 3, 8, 5, 8, 4, 2, 4, 9,15, 0, 3, 4, 5, 4,15, 0,
     2  3, 8, 5, 8,15, 0, 3, 6, 5, 6, 1, 5, 3, 6, 3, 4, 1, 5, 7, 5,
     3  2, 3, 6, 7,15, 0, 2, 7, 6, 3, 4, 2, 4, 9, 3, 7, 5, 7, 4, 9,
     4  4, 2, 3, 4, 5, 4, 4, 2, 4, 9, 0, 0/
      DATA INODE/
     1   0,  8, 20, 26, 34, 42, 49, 56, 62, 70, 78, 96,111,117,121,127,
     2 129,131,132,141,149,154,155,163,171,180,181,183,191,197,200,206,
     3 219,220,227,236,247,259,273,283,287,291,295,303,308,314,316,321,
     4 323,332,338,346,359,370,379,390,395,411,423,434,446,449,454,457,
     5 470,486,496,508,516,523,531,538,548,556,564,569,577,580,585,589,
     6 601,608,620,630,642,647,653,656,661,666,672,679,683,685,689,692,
     7 694,711,714,723,731,743,755,765,772,781,788,802,814,823,831,832,
     8 833,838,852,858,864,868,879,881,883,891,896,904,915,920,925,930/
      DATA NNODES/
     1   7, 11,  5,  7,  7,  6,  6,  5,  7,  7, 17, 14,  5,  3,  5,  1,
     2   1,  0,  8,  7,  4,  0,  7,  7,  8,  0,  1,  7,  5,  2,  5, 12,
     3   0,  6,  8, 10, 11, 13,  9,  3,  3,  3,  7,  4,  5,  1,  4,  1,
     4   8,  5,  7, 12, 10,  8, 10,  4, 15, 11, 10, 11,  2,  4,  2, 12,
     5  15,  9, 11,  7,  6,  7,  6,  9,  7,  7,  4,  7,  2,  4,  3, 11,
     6   6, 11,  9, 11,  4,  5,  2,  4,  4,  5,  6,  3,  1,  3,  2,  1,
     7  16,  2,  8,  7, 11, 11,  9,  6,  8,  6, 13, 11,  8,  7,  0,  0,
     8   4, 13,  5,  5,  3, 10,  1,  1,  7,  4,  7, 10,  4,  4,  4,  4/
C
      Y = YZ
      X = XZ
      NC = NZ
      IC = 3
      DIV = 7.0
      NSTRING=NC
      IF(NSTRING.LE.0)NSTRING=1
      NSTRING=IABS(NSTRING)
      N=(NSTRING+3)/4
      N4=N*4
      ENCODE(N4,3333,STRING)(ITEXT(I),I=1,N)
 3333 FORMAT(33A4)
      IASCII=ICHAR(STRING(1:1))
C
C...  CENTERED SYMBOL,RIGHT JUSTIFIED SYMBOL,LEFT JUSTIFIED SYMBOL TEXT?
C
C              CS, RS, LS
      IF (NC) 100,110,110
C
C...  SYMBOL PLOT (CENTERED)
  100 IF (IASCII.LE.13) DIV = 4.0
      IF (NC.LT.-1) IC = 2
C
C...  INPUT INTEGER/SYMBOL RIGHT JUSTIFIED.
  110 CONTINUE
C
C...  CHARACTER TEXT OUTPUT
C
C...  SHOULD CURRENT HEIGHT AND ANGLE BE USED?
  120 IF (HGT.LE.0.0) GO TO 150
      ISTAT = 1
      FCT = HGT/DIV
C
C...  NEW ANGLE IN THIS 'SYMBOL' CALL?
      IF (ANGLE.EQ.THETA) GO TO 140
C
C...  CALCULATE A NEW THETA
      FACC = FCT
      THETA = ANGLE
      ANG = AMOD(ANGLE,360.0)
      IF (ANG.LT.0) ANG = 360.0 - ANG
      I = (ANG + EPSIL)/90.0
      A = I*90.0
      IF (ABS(ANG-A).GT.EPSIL) GO TO 132
      ANCS = ASIN(I+1)
      ANCC = ACOS(I+1)
      Z = FACC*ANCC
      W = FACC*ANCS
      XI = Z
      YI = W
      DO 131 L=2,14
      XA(L) = Z
      YA(L) = W
      Z = Z+XI
  131 W = W+YI
      GO TO 150
  132 ANCC = THETA*RADCO
      ANCS = SIN(ANCC)
      ANCC = COS(ANCC)
      Z = FACC*ANCC
      W = FACC*ANCS
      XI = Z
      YI = W
      DO 133 L=2,14
      XA(L) = Z
      YA(L) = W
      Z = Z+XI
  133 W = W+YI
      GO TO 150
C
C...  IS CALCULATION OF NEW OFFSETS UNNECCESSARY?
  140 IF (FCT.EQ.FACC) GO TO 150
      FACC = FCT
C...  CALCULATE OFFSETS FOR NEW 'FACC' AND/OR 'ANGLE'.
      Z = FACC*ANCC
      W = FACC*ANCS
      XI = Z
      YI = W
      DO 141 L=2,14
      XA(L) = Z
      YA(L) = W
      Z = Z+XI
  141 W = W+YI
C
C...  IF X OR Y = 999.0; THEN USE THE PREVIOUS VALUE(S) OF X AND/OR Y.
  150 IF (X.EQ.999.0) GO TO 160
      X = X-XA(3)+YA(3)
      XO = X
      XC = X
  160 IF (Y.EQ.999.0) GO TO 170
      Y = Y-XA(3)-YA(3)
      YO = Y
      YC = Y
  170 X = XC
      Y = YC
      K = 0
      DO 900 ISTRING=1,NSTRING
      IASCII=ICHAR(STRING(ISTRING:ISTRING))
      INDEX = INODE(IASCII+1)
      NDKNT = NNODES(IASCII+1)+1
      DO 888 JNODE=INDEX+1,INDEX+NDKNT
      NODEX = IXYS(1,JNODE)
      NODEY = IXYS(2,JNODE)
C...  CHECK FOR SPECIAL CONTROL FUNCTIONS. (NODEX = 15)
      IF(NODEX.NE.15)GO TO 240
C...  DECODE SPECIAL FUNCTION (Y-OFFSET)
      IFUNCT = NODEY + 1
C
C...  BLANK,SUPERSCRIPT,SUBSCRIPT,CARRIAGE RETURN,BACK SPACE,NULL CHAR?
C
C            BLK,SUP,SUB,RTN,BSP,NUL
      GO TO (300,310,320,330,340,260),IFUNCT
C
C...  BLANK CHARACTER.
  300 IC = 3
      GO TO 888
C
C...  SUPERSCRIPT SET/RESET CODE: (FIRST TEST EXISTING STATE)
  310 IS = ISTAT-1
      IF (IS) 311,312,260
C
C...  IF(ISTAT.EQ.0) RETURN TO NORMAL STATE=1
  311 ISTAT = 1
      FACC = FACC/FCTR
      Z = FACC*ANCC
      W = FACC*ANCS
      XI = Z
      YI = W
      DO 314 L=2,14
      XA(L) = Z
      YA(L) = W
      Z = Z+XI
  314 W = W+YI
  313 X = X-YA(2)
      Y = Y+XA(2)
      GO TO 260
C
C...  IF(ISTAT.EQ.1) SET SUPERSCRIPT MODE,ISTAT=2
  312 ISTAT = 2
      X = X-YA(5)
      Y = Y+XA(5)
      FACC = FACC*FCTR
      Z = FACC*ANCC
      W = FACC*ANCS
      XI = Z
      YI = W
      DO 315 L=2,14
      XA(L) = Z
      YA(L) = W
      Z = Z+XI
  315 W = W+YI
      GO TO 260
C
C...  IF(ISTAT.EQ.2) GO TO 260  (BRANCH TO NEXT CHARACTER)
C
C... SUBSCRIPT SET/RESET CODE: (FIRST TEST EXISTING STATE)
  320 IS = ISTAT-1
      IF (IS) 260,322,323
C
C...  IF(ISTAT.EQ.0) GO TO 260  (BRANCH TO NEXT CHARACTER)
C
C...  IF(ISTAT.EQ.1); SET SUBSCRIPT MODE,ISTAT=0
  322 ISTAT = 0
      X = X+YA(2)
      Y = Y-XA(2)
      FACC = FACC*FCTR
      Z = FACC*ANCC
      W = FACC*ANCS
      XI = Z
      YI = W
      DO 410 L=2,14
      XA(L) = Z
      YA(L) = W
      Z = Z+XI
  410 W = W+YI
      GO TO 260
C
C...  CARRIAGE RETURN
  330 X = XO + YA(13)
      Y = YO - XA(13)
      XO = X
      YO = Y
      GO TO 260
C
C...  BACKSPACE
C  340 X = X - XA(8)
C      Y = Y - YA(8)
C     CHANGE WIDTH TO 6/7 FOR COMPATIBILITY WITH OLD CALCOMP
  340 X = X - XA(7)
      Y = Y - YA(7)
      GO TO 260
C
C...  IF(ISTAT.EQ.2); RETURN TO NORMAL MODE,ISTAT=1
  323 ISTAT = 1
      FACC = FACC/FCTR
      Z = FACC*ANCC
      W = FACC*ANCS
      XI = Z
      YI = W
      DO 510 L=2,14
      XA(L) = Z
      YA(L) = W
      Z = Z+XI
  510 W = W+YI
      X = X+YA(5)
      Y = Y-XA(5)
      GO TO 260
C
C...  PROCESS MOVE TO NODE
  240 NODEX = NODEX + 1
      NODEY = NODEY + 1
      YT = Y + YA(NODEX) + XA(NODEY)
      XT = X + XA(NODEX) - YA(NODEY)
      CALL PLOT(XT,YT,IC)
      IC = 2
      X = XC
      Y = YC
  888 CONTINUE
C  250 X = X + XA(8)
C      Y = Y + YA(8)
C     CHANGE WIDTH TO 6/7 FOR COMPATIBILITY WITH OLD CALCOMP
  250 X = X + XA(7)
      Y = Y + YA(7)
C
C...  DECREMENT AND TEST SYMBOL COUNT.
  260 XC = X
      YC = Y
      IC = 3
  900 CONTINUE
      RETURN
      END
      SUBROUTINE USERNAME(NAME)
      COMMON /USERLST/USERNAME_LEN,JPI_USERNAME_ID,USERNAME_ADR,ZERO
      BYTE NAME(12)
      INTEGER*4 USERNAME_ADR,SYS$GETJPI,ZERO(2),JPI$_USERNAME
      INTEGER*2 USERNAME_LEN,JPI_USERNAME_ID
      DATA JPI$_USERNAME/'202'X/
      DATA USERNAME_LEN,ZERO/12,0,0/
      JPI_USERNAME_ID=JPI$_USERNAME
      USERNAME_ADR=%LOC(NAME)
      IF(SYS$GETJPI(,,,USERNAME_LEN,,,).NE.1)STOP 'USERNAME ERROR'
      RETURN
      END
      SUBROUTINE NAMEFILE(FILENAME)
      REAL*8 FILENAME(2)
      CHARACTER UNIQUE_FILE_NAME*9,A*9
      A=UNIQUE_FILE_NAME()
      DECODE(9,1,A)FILENAME
    1 FORMAT(A8,A1)
      RETURN
      END
      SUBROUTINE EFRAME(XMIN,XMAX,XLEN,MODX,XCTIT,
     *                  YMIN,YMAX,YLEN,MODY,YCTIT)
C
      BYTE XBTIT(80),YBTIT(80)
      CHARACTER*80 XCTIT,YCTIT,XLAB,YLAB
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY,RLEN,SLEN
      COMMON/PLTDAT/DUM1(10),IWTCUR
      COMMON/FR_DRAW/MODE/FR_HTS/HTL,HTN/FR_WTS/IWT(4)/FR_ROTN/IROT
      COMMON/FR_SYMB/ISYM/FR_TIKS/TIKS(3),TIKL/FR_INT/IFRAME
      COMMON/FONTC1/DUM2(5),RMAX,RMIN,SMAX,SMIN/FR_CONF/SCENT,ICONF
      EQUIVALENCE (XBTIT(1),XLAB),(YBTIT(1),YLAB)
C
C
C      DRAW FRAME FOR PLOT WITH TICK MARKS, NUMERICAL LABELS, AND
C      TITLES, USING EXTENDED FONT SET.
C
C
C      INPUT: ( Y IS SIMILAR TO X)
C      ------
C
C       XMIN PLOT VALUE AT LEFT HAND SIDE
C       XMAX PLOT VALUE AT RIGHT HAND SIDE
C       XLEN LENGTH OF X AXIS IN INCHES
C       MODX = 1 LINEAR PLOT LIMITS CORRESPOND TO XMIN XMAX
C       MODX = 2 LINEAR PLOT LIMITS ADJUSTED TO CONTAIN TO XMIN XMAX
C       MODX =-1 LOG PLOT LIMITS CORRESPOND TO XMIN XMAX
C       MODX =-2 LOG PLOT LIMITS ADJUSTED TO CONTAIN TO XMIN XMAX
C       XCTIT(CHARACTER*80) CONTAINS X TITLE
C      *** FOR LOG PLOT ENTER ACTUAL VARIABLE, I.E. .01 NOT -2
C
C
C      OUTPUT:
C      -------
C
C       XL ACTUAL VALUE OF LEFT LIMIT
C       XR ACTUAL VALUE OF RIGHT LIMIT
C       DINCHX INCHES PER PLOT UNIT, I.E. XLEN/(XR-XL)
C       YBOT ACTUAL VALUE OF BOTTOM LIMIT
C       YTOP ACTUAL VALUE OF TOP LIMIT
C       DINCHY INCHES PER PLOT UNIT, I.E. YLEN/(YTOP-YBOT)
C      *** FOR LOG PLOTS LIMIT IS LOG10 OF VARIABLE
C
C
C       SWITCHES:
C       ---------
C
C       THE FOLLOWING COMMON BLOCKS EACH MAY CONTAIN ONE INTEGER*4
C       VARIABLE (MODE, SAY), WHOSE EFFECT IS AS DESCRIBED.
C
C       (i)  /FR_DRAW/  IF MODE IS NONZERO, ONLY SCALING INFORMATION IS
C                       RETURNED -- NOTHING IS DRAWN,
C       (ii) /FR_BNDS/  FOR NONZERO MODE, ONLY THAT PART OF THE
C                       GRAPH (PRODUCED BY M(D)LINE) LYING WITHIN THE
C                       "FRAME"-DEFINED BOX IS ACTUALLY PLOTTED,
C       (iii)/FR_LABX/  THE X-AXIS IS NUMBERED ONLY FOR MODE=0,
C       (iv) /FR_LABY/  THE Y-AXIS IS NUMBERED ONLY FOR MODE=0.
C       (v)  /FR_ROTN/  AN ATTEMPT WILL BE MADE TO KEEP ALL Y-AXIS
C                       LABELS HORIZONTAL IF MODE IS ZERO. NUMERICAL LABELS
C                       LONGER THAN SIX CHARACTERS AND TEXT LABELS WITH
C                       LENGTH GREATER THAN  MAX( 1.2 INCHES, 7.5*HTL )
C                       WILL STILL BE PLOTTED VERTICALLY.
C                       *** NOTE: THIS IS ONLY RELEVANT TO EFRAME. S/R FRAME
C                       WILL STILL DRAW ALL Y-LABELS VERTICALLY.
C
C
C       THESE SWITCHES MAY BE SET WITH "CALL SETMOD(IM1,IM2,IM3,IM4,IM5)".
C
C       THUS, IF NO SWITCH IS SET, ENTIRE GRAPHS WILL BE DRAWN AND BOTH
C       AXES WILL BE NUMBERED (WITH HORIZONTAL LABELS, IF POSSIBLE).
C
C
C       OTHER VARIABLE PARAMETERS:
C       --------------------------
C
C       (vi) HTL, HTN, IN COMMON BLOCK /FR_HTS/, GIVE THE SIZES OF THE
C       TITLES AND NUMERICAL LABELS, RESPECTIVELY. DEFAULTS ARE .15, .15.
C       THE SIZES OF ALL TICK MARKS ALONG THE AXES SCALE WITH HTN.
C
C       SET HEIGHTS WITH "CALL SETHTS(HT1,HT2)".
C
C       (vii) THE WEIGHTS OF VARIOUS COMPONENTS OF THE FRAME MAY BE SET
C       INDIVIDUALLY VIA THE INTEGER*4 ARRAY IWT IN COMMON /FR_WTS/:
C
C               IWT(1):   BOX AND TICK MARKS.
C               IWT(2):   NUMERICAL LABELS (EXCLUDING EXPONENTS, IF ANY).
C               IWT(3):   EXPONENTS (DEFAULT = IWT(2)).
C               IWT(4):   TEXT LABELS.
C
C       S/R WEIGHT IS CALLED WITH ARGUMENT IWT(.), WHEN NECESSARY.
C       DEFAULTS ARE 1,1,1,1.
C
C       SET WEIGHTS WITH "CALL SETWTS(IW1,IW2,IW3,IW4)".
C
      IFRAME=1
      ISYM=-1
      DMIN=AMIN1(XLEN,YLEN)
      IF(DMIN.GT.2.)THEN
        IF(HTL.EQ.0.)HTL=.15
        IF(HTN.EQ.0.)HTN=.15
      ELSE
        IF(HTL.EQ.0.)HTL=.075*DMIN
        IF(HTN.EQ.0.)HTN=HTL
      END IF
      TIKS(1)=.2*HTN
      TIKS(2)=2.5*TIKS(1)
      TIKS(3)=4.*TIKS(1)
      TIKL=.3*HTN
C
      MODEX=MODX
      MODEY=MODY
      X1=XMIN
      X2=XMAX
      Y1=YMIN
      Y2=YMAX
      RLEN=XLEN
      SLEN=YLEN
      ICONF=0
      SCENT=.5*SLEN
C
C      SET AXES TICK, LABEL INFO
C
      IF(MODEX.GT.0)
     * CALL FR_LINSET(X1,X2,XLEN,MODEX,DXS,DXM,DXL,LABXSP,LABXDP,LPOWX)
      IF(MODEX.LT.0)
     * CALL FR_LOGSET(X1,X2,XLEN,MODEX,DXS,DXM,DXL)
      XL=X1
      XR=X2
      DINCHX=XLEN/(XR-XL)
      IF(MODEY.GT.0)
     * CALL FR_LINSET(Y1,Y2,YLEN,MODEY,DYS,DYM,DYL,LABYSP,LABYDP,LPOWY)
      IF(MODEY.LT.0)
     * CALL FR_LOGSET(Y1,Y2,YLEN,MODEY,DYS,DYM,DYL)
      YBOT=Y1
      YTOP=Y2
      DINCHY=YLEN/(YTOP-YBOT)
      IF(MODE.NE.0)RETURN
C
C      DRAW AXES
C
      IF(MODEX.LT.0) GO TO 1
      CALL FR_LINDRX(Y1,X1,X2,DXS,DXM,DXL,1,1,LABXSP,LABXDP)
      CALL FR_LINDRX(Y2,X1,X2,DXS,DXM,DXL,2,0,LABXSP,LABXDP)
      GO TO 2
    1 CALL FR_LOGDRX(Y1,X1,X2,DXS,DXM,DXL,1,1)
      CALL FR_LOGDRX(Y2,X1,X2,DXS,DXM,DXL,2,0)
C
    2 IF(MODEY.LT.0) GO TO 3
      CALL FR_LINDRY(X1,Y1,Y2,DYS,DYM,DYL,1,1,LABYSP,LABYDP)
      CALL FR_LINDRY(X2,Y1,Y2,DYS,DYM,DYL,2,0,LABYSP,LABYDP)
      GO TO 4
    3 CALL FR_LOGDRY(X1,Y1,Y2,DYS,DYM,DYL,1,1)
      CALL FR_LOGDRY(X2,Y1,Y2,DYS,DYM,DYL,2,0)
C
C      LABEL AXES WITH EXTENDED FONT SET
C
    4 XLAB=XCTIT
      YLAB=YCTIT
      IF(IWT(4).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(4)   ! EQUIVALENT TO "CALL WEIGHT(IWT(4))"
      END IF
      SYMOFF=-(HTL+2.*HTN+.1)
      CALL SIMBOL(.5*XLEN,SYMOFF,HTL,XBTIT,0.,-80)
      CALL SIMBOL(0.,0.,-HTL,YBTIT,0.,80)
      WIDTHR=RMAX-RMIN
      WIDTHS=SMAX-SMIN
      IF(IROT.EQ.0)THEN
          IF(MODEY.LT.0)THEN
              SYMOFF=-3.5*HTN
          ELSE IF(MODEY.GT.0.AND.LABYSP.LE.5)THEN
              SYMOFF=-(LABYSP+1.5)*HTN
          END IF
      ELSE
          SYMOFF=-HTN-.15
      END IF
      IF((WIDTHR.LT.7.5*HTL.OR.WIDTHR.LT.1.2).AND.IROT.EQ.0)THEN
          TH=0.
          R=SYMOFF-WIDTHR
          IF(ICONF.EQ.0)THEN
              IF(WIDTHR.GT.3.*HTL)THEN
                  R=R+2.*HTN
              ELSE                      ! Move Y-label right if no conflict.
                  R=R+HTN
              END IF
          END IF
          S=.5*(YLEN-WIDTHS)
      ELSE
          TH=90.
          R=SYMOFF-WIDTHS-HTN
          S=.5*(YLEN-WIDTHR)
      END IF
      CALL SIMBOL(R,S,HTL,YBTIT,TH,80)
      IF(IWT(4).NE.0)IWTCUR=JWT
      IFRAME=0
      RETURN
      END
        SUBROUTINE SIMBOL(XI,YI,HITE,CHARS,THETA,NUMCH)
C
C       EXTENDED-FONT VERSION OF SYMBOL
C       POSITIONING INFO IS RETURNED IN COMMON/FONTC1/...
C       NUMCH.LT.0  : STRING CENTERED ON (XI,YI)
C       NUMCH.GE.0  : STRING STARTS WITH (XI,YI) AT LOWER LH CORNER
C       HITE.LE.0.  : ONLY POSITIONING INFO RETURNED: NOTHING DRAWN
C
        BYTE CHARS(1)
C       INTEGER*2 N,M,NUM,JL,JR,IDIC,LONG
        INTEGER N,M,NUM,JL,JR,IDIC,LONG
        INTEGER*4 NUMCH,NCH
        REAL*4 LASTINC
        COMMON/FONTC1/OFFX,OFFY,LASTINC,XP,YP,XMAX,XMIN,YMAX,YMIN
C       COMMON/SIM_FC2/N,M,NUM(288),JL(288),JR(288),IDIC(288),LONG(15610)
        COMMON/SIM_ANG/SINT,COST/SIM_LEN/NCH,HEIGHT
10      HEIGHT=ABS(HITE)
        XMAX=XI
        YMAX=YI
        XMIN=XI
        YMIN=YI
        SINT=SIN(THETA*.0174533)
        COST=COS(THETA*.0174533)
        NCH=IABS(NUMCH)
        IF(NCH.GT.1000)STOP ' ERROR: >1000 CHARACTERS SENT TO SIMBOL.'
        IF(NCH.EQ.0)NCH=100
        IF(NUMCH.LT.0)THEN
            CALL SIM_DRAW(XI,YI,CHARS,0,1)
            DX2=.5*(XMAX+XMIN)-XI
            XMAX=XMAX-DX2
            XMIN=XMIN-DX2
            DY2=.5*(YMAX+YMIN)-YI
            YMAX=YMAX-DY2
            YMIN=YMIN-DY2
            XP=XP-DX2
            YP=YP-DY2
            IF(HITE.LE.0.)RETURN
            CALL SIM_DRAW(XI-DX2,YI-DY2,CHARS,1,0)
        ELSE
            DISP=.433*HEIGHT
       IF(HITE.LE.0.)CALL SIM_DRAW(XI-DISP*SINT,YI+DISP*COST,CHARS,0,1)
       IF(HITE.GT.0.)CALL SIM_DRAW(XI-DISP*SINT,YI+DISP*COST,CHARS,1,1)
        END IF
        RETURN
        END
        SUBROUTINE SIMST(R,S,H,STRING,T,N)
C      ! "SIMBOL" WITH CHARACTER*(*) INPUT STRING.
        CHARACTER*(*) STRING
        INTEGER*4 N
        CALL SIMBOL(R,S,H,%REF(STRING),T,N)
        RETURN
        END
        SUBROUTINE SIM_DRAW(XLHE,YLHE,CHARS,LETTS,BOUNDS)
        BYTE CHARS(1)
        INTEGER BOUNDS,BACKS
        REAL*4 LASTINC
        COMMON/FONTC1/OFFX,OFFY,LASTINC,XP,YP,XMAX,XMIN,YMAX,YMIN
        COMMON/SIM_ANG/SINT,COST/SIM_LEN/NCH,HEIGHT
      CHARACTER*60 FONTS(261)
      CHARACTER*60 FONT01(10),FONT02(10),FONT03(10),FONT04(10)
      CHARACTER*60 FONT05(10),FONT06(10),FONT07(10),FONT08(10)
      CHARACTER*60 FONT09(10),FONT10(10),FONT11(10),FONT12(10)
      CHARACTER*60 FONT13(10),FONT14(10),FONT15(10),FONT16(10)
      CHARACTER*60 FONT17(10),FONT18(10),FONT19(10),FONT20(10)
      CHARACTER*60 FONT21(10),FONT22(10),FONT23(10),FONT24(10)
      CHARACTER*60 FONT25(10),FONT26(10),FONT27(1)
      EQUIVALENCE (FONT01(1),FONTS(  1)),(FONT02(1),FONTS( 11))
      EQUIVALENCE (FONT03(1),FONTS( 21)),(FONT04(1),FONTS( 31))
      EQUIVALENCE (FONT05(1),FONTS( 41)),(FONT06(1),FONTS( 51))
      EQUIVALENCE (FONT07(1),FONTS( 61)),(FONT08(1),FONTS( 71))
      EQUIVALENCE (FONT09(1),FONTS( 81)),(FONT10(1),FONTS( 91))
      EQUIVALENCE (FONT11(1),FONTS(101)),(FONT12(1),FONTS(111))
      EQUIVALENCE (FONT13(1),FONTS(121)),(FONT14(1),FONTS(131))
      EQUIVALENCE (FONT15(1),FONTS(141)),(FONT16(1),FONTS(151))
      EQUIVALENCE (FONT17(1),FONTS(161)),(FONT18(1),FONTS(171))
      EQUIVALENCE (FONT19(1),FONTS(181)),(FONT20(1),FONTS(191))
      EQUIVALENCE (FONT21(1),FONTS(201)),(FONT22(1),FONTS(211))
      EQUIVALENCE (FONT23(1),FONTS(221)),(FONT24(1),FONTS(231))
      EQUIVALENCE (FONT25(1),FONTS(241)),(FONT26(1),FONTS(251))
      EQUIVALENCE (FONT27(1),FONTS(261))
      INTEGER INDEX(4,288)
      INTEGER INDEX1(120),INDEX2(120),INDEX3(120),INDEX4(120)
      INTEGER INDEX5(120),INDEX6(120),INDEX7(120),INDEX8(120)
      INTEGER INDEX9(120),INDEX10(72)
      EQUIVALENCE (INDEX1(1),INDEX(1,  1)),(INDEX2(1),INDEX(1, 31))
      EQUIVALENCE (INDEX3(1),INDEX(1, 61)),(INDEX4(1),INDEX(1, 91))
      EQUIVALENCE (INDEX5(1),INDEX(1,121)),(INDEX6(1),INDEX(1,151))
      EQUIVALENCE (INDEX7(1),INDEX(1,181)),(INDEX8(1),INDEX(1,211))
      EQUIVALENCE (INDEX9(1),INDEX(1,241)),(INDEX10(1),INDEX(1,271))
      DATA INDEX1/
     1   0, -9,  9,    1,  28, -4,  4,    1,  22, -7,  7,   29,
     2  10,-12, 12,   51,  82,-10, 10,   61,   0,  0,  0,  143,
     3  96,-12, 13,  143,  10, -4,  4,  239,  38, -7,  7,  249,
     4  38, -7,  7,  287,  16, -8,  8,  325,  10,-12, 12,  341,
     5  14, -4,  4,  351,   4,-12, 12,  365,  10, -4,  4,  369,
     6   4,-11, 11,  379,  78,-10, 10,  383,  20,-10, 10,  461,
     7  88,-10, 10,  481,  90,-10, 10,  569,  24,-10, 10,  659,
     8  76,-10, 10,  683,  94,-10, 10,  759,  60,-10, 10,  853,
     9 124,-10, 10,  913,  94,-10, 10, 1037,  22, -4,  4, 1131,
     A  26, -4,  4, 1153,   6,-11, 11, 1179,  10,-12, 12, 1185/
      DATA INDEX2/
     1   6,-11, 11, 1195,  62, -9,  9, 1201,   0,  0,  0, 1263,
     2  34,-10, 10, 1263,  88,-11, 11, 1297,  62,-11, 10, 1385,
     3  58,-11, 11, 1447,  42,-11, 10, 1505,  38,-11,  9, 1547,
     4  78,-11, 11, 1585,  52,-12, 12, 1663,  22, -5,  6, 1715,
     5  38, -8,  8, 1737,  52,-12, 11, 1775,  26,-10,  9, 1827,
     6  58,-12, 13, 1853,  40,-11, 12, 1911,  86,-11, 11, 1951,
     7  56,-11, 11, 2037, 106,-11, 11, 2093,  76,-11, 11, 2199,
     8  66,-10, 10, 2275,  30, -9, 10, 2341,  44,-12, 12, 2371,
     9  28,-11, 11, 2415,  46,-12, 12, 2443,  40,-11, 11, 2489,
     A  38,-11, 12, 2529,  30,-10, 10, 2567,  22, -7,  7, 2597/
      DATA INDEX3/
     1   0,  0,  0, 2619,  22, -7,  7, 2619,   0,  0,  0, 2641,
     2  20,-12, 12, 2641,  26, -7,  7, 2661,  76, -9, 11, 2687,
     3  64,-11, 10, 2763,  54,-10,  9, 2827,  70,-10, 11, 2881,
     4  60,-10,  9, 2951,  42, -7,  5, 3011, 118,-10, 10, 3053,
     5  54,-11, 11, 3171,  34, -5,  6, 3225,  48, -5,  6, 3259,
     6  52,-11, 11, 3307,  22, -5,  6, 3359,  86,-16, 17, 3381,
     7  54,-11, 11, 3467,  70,-10, 10, 3521,  70,-11, 10, 3591,
     8  64,-10, 11, 3661,  44, -9,  8, 3725,  58, -8,  9, 3769,
     9  30, -7,  8, 3827,  54,-11, 11, 3857,  28,-10, 10, 3911,
     A  46,-13, 13, 3939,  40,-11, 11, 3985,  42,-10, 10, 4025/
      DATA INDEX4/
     1  30, -9,  9, 4067,  54, -7,  7, 4097,   4, -4,  4, 4151,
     2  54, -7,  7, 4155,   0,  0,  0, 4209,   0,  0,  0, 4209,
     3   0,  9, -9, 4209,  44,-12, 12, 4209,  44,-12, 12, 4253,
     4  86,-12, 12, 4297, 118,-12, 12, 4383,   0,  0,  0, 4501,
     5  90, -8,  8, 4501,  10, -4,  4, 4591,  54,-12, 12, 4601,
     6  50,-12, 12, 4655,  10,-10, 10, 4705,  16,-11, 11, 4715,
     7  40,-11, 12, 4731,  16,-11, 11, 4771,  10,-12, 12, 4787,
     8  28,-12, 12, 4797,  34,-10, 10, 4825,   8,-10, 10, 4859,
     9  28,-10, 10, 4867,  30,-10, 10, 4895,  12,-10, 10, 4925,
     A  34,-10, 10, 4937,  46,-10, 10, 4971,  10,-10, 10, 5017/
      DATA INDEX5/
     1  58,-10, 10, 5027,  46,-10, 10, 5085,  62,-12, 12, 5131,
     2  98,-12, 12, 5193,  18,-11, 11, 5291,  16,-12, 12, 5309,
     3  18,-11, 11, 5325,  16,-12, 12, 5343,   0,  0,  0, 5359,
     4 110,-13, 14, 5359,  50,-12, 13, 5469,  60,-11, 11, 5519,
     5  28,-10, 10, 5579,  30,-11, 11, 5607,  94,-10, 11, 5637,
     6  26,-10,  9, 5731,  22,-10, 11, 5757,  10, -5,  5, 5779,
     7  28,-10, 10, 5789,  54,-12, 12, 5817,  28,-10, 10, 5871,
     8  20, -8,  8, 5899,  20, -8,  8, 5919,  42,-12, 12, 5939,
     9  40,-12, 12, 5981, 110,-11, 11, 6021,  62,-12, 12, 6131,
     A  36,-10, 10, 6193,  10,-12, 12, 6229,  44, -9, 10, 6239/
      DATA INDEX6/
     1  50,-10, 10, 6283,  84,-11, 11, 6333,  70,-11, 11, 6417,
     2  80,-11, 12, 6487,  60,-11, 11, 6567,  58, -9,  9, 6627,
     3   0,  0,  0, 6685, 110, -9,  9, 6685,   0,  0,  0, 6795,
     4  46,-12, 12, 6795,  14,-17, 16, 6841,  78,-11, 12, 6855,
     5 112,-11, 10, 6933,  40,-11, 10, 7045,  74, -9, 10, 7085,
     6  48, -9,  8, 7159,  82,-11, 11, 7207,  56, -9, 11, 7289,
     7  60,-11, 11, 7345,  26, -6,  6, 7405,  88, -9, 10, 7431,
     8  50,-10, 10, 7519,  40, -9, 11, 7569,  52,-11, 11, 7609,
     9  46,-10, 11, 7661,  62, -9,  9, 7707,  42,-11, 11, 7769,
     A  84, -9, 10, 7811,  60,-10,  9, 7895,  68,-10, 12, 7955/
      DATA INDEX7/
     1  30,-10, 10, 8023,  48,-11, 10, 8053,  54, -8, 10, 8101,
     2  82,-12, 11, 8155,  88, -9,  8, 8237,  66,-13, 12, 8325,
     3  62, -9,  8, 8391,   6, -7,  7, 8453,  10, -7,  7, 8459,
     4   6, -7,  7, 8469,  20,-12, 12, 8475,   0,  0,  0, 8495,
     5   0,  0,  0, 8495, 118,-12, 14, 8495, 218,-12, 15, 8613,
     6 136,-13, 13, 8831, 142,-11, 14, 8967, 186,-11, 13, 9109,
     7 180,-12, 13, 9295, 172,-13, 14, 9475, 222,-12, 14, 9647,
     8 132,-11, 12, 9869, 120,-10, 12,10001, 228,-12, 14,10121,
     9 168,-11, 13,10349, 212,-14, 16,10517, 166,-12, 14,10729,
     A 156,-13, 15,10895, 138,-10, 14,11051, 196,-13, 15,11189/
      DATA INDEX8/
     1 214,-12, 15,11385, 186,-11, 14,11599, 140,-13, 13,11785,
     2 176,-12, 14,11925, 142,-11, 14,12101, 188,-14, 16,12243,
     3 128,-11, 13,12431, 170,-11, 14,12559, 112,-11, 13,12729,
     4   4,  0,-12,12841, 186,-11, 13, 9109,   0,  0,  0,12845,
     5   0,  0,  0,12845,   0,  0,  0,12845,   0,  0,  0,12845,
     6  58,-13, 11,12845,  92,-13, 14,12903,  64,-12, 13,12995,
     7  68,-13, 13,13059,  66,-10, 12,13127,  62,-12, 12,13193,
     8  70,-11, 14,13255,  74,-12, 15,13325,  48, -9, 11,13399,
     9  50, -9, 11,13447,  74,-12, 15,13497,  64,-11, 12,13571,
     A  64,-15, 16,13635,  64,-12, 15,13699,  50,-11, 13,13763/
      DATA INDEX9/
     1  72,-13, 13,13813,  64,-10, 12,13885,  84,-13, 14,13949,
     2  66,-11, 12,14033,  46,-10, 12,14099,  50,-12, 14,14145,
     3  56,-12, 14,14195,  66,-14, 15,14251,  90,-12, 14,14317,
     4  56,-11, 13,14407,  56,-10, 13,14463,   0,  0,  0,14519,
     5   0,  0,  0,14519,   0,  0,  0,14519,   0,  0,  0,14519,
     6   0,  0,  0,14519,   0,  0,  0,14519,  44, -6, 11,14519,
     7  44, -5, 11,14563,  26, -5,  8,14607,  44, -6, 11,14633,
     8  32, -5,  8,14677,  46, -3,  7,14709,  54, -6, 11,14755,
     9  56, -5, 12,14809,  30, -2,  7,14865,  38, -2,  7,14895,
     A  64, -5, 11,14933,  34, -3,  7,14997,  64,-13, 14,15031/
      DATA INDEX10/
     1  44, -8, 12,15095,  44, -6, 10,15139,  46, -7, 10,15183,
     2  52, -6, 11,15229,  28, -5, 10,15281,  30, -4,  9,15309,
     3  30, -3,  8,15339,  36, -6, 11,15369,  32, -6, 11,15405,
     4  48, -9, 14,15437,  38, -8, 10,15485,  44, -6, 11,15523,
     5  44, -6, 10,15567,  20,-12, 12, 8475,   0,  0,  0,15611,
     6   0,  0,  0,15611,   0,  0,  0,15611,   0,  0,  0,15611/
      DATA FONT01/
     1'@L?J@>AJ@L__@J@D__@9?8@7A8@9=L<E__>L<E__CLBE__DLBE6J66J6JJ6J',
     2'>P>3__BPB3__FIEHFGGHGIEKBL>L;K9I9G:E;D=CCAE@G>__9G;E=DCBEAF@',
     3'G>G:E8B7>7;89:9;:<;;::IDHCIBJCJDIEHEGDFBD<C:A8?7;7887:7=8?>C',
     4'@EAGAI@K>L<K;I;G<D>AC:E8H7I7J8J9__;7988:8=9?;A__;G<ED:F8H7@L',
     5'?E__AL?EDPBN@K>G=B=>>9@5B2D0__BN@J?G>B>>?9@6B2<P>N@KBGCBC>B9',
     6'@5>2<0__>N@JAGBBB>A9@6>2@L@@__;IEC__EI;C@I@7__7@I@@7?8@9A8A6',
     7'@4?37@I@@9?8@7A8@9IP70?L<K:H9C9@:;<8?7A7D8F;G@GCFHDKAL?L__?L',
     8'=K<J;H:C:@;;<9=8?7__A7C8D9E;F@FCEHDJCKAL<H>IALA7__@K@7__<7E7',
     9':H;G:F9G9H:J;K>LBLEKFJGHGFFDCB>@<?:=9:97__BLDKEJFHFFEDBB>@__',
     A'99::<:A8D8F9G:__<:A7E7F8G:G<:I;H:G9H9I;K>LBLEKFIFFEDBC?C__BL'/
      DATA FONT02/
     1'DKEIEFDDBC__BCDBF@G>G;F9E8B7>7;8:99;9<:=;<:;__EAF>F;E9D8B7BJ',
     2'B7__CLC7__CL8=H=__?7F7;L9B__9B;C>DADDCFAG>G=F:D8A7>7;8:99;9<',
     3':=;<:;__ADCCEAF>F=E:C8A7__;LEL__;K@KELEIDHEGFHFIEKCL@L=K;I:G',
     4'9C9=::<8?7A7D8F:G=G>FADCAD@D=C;A:>__@L>K<I;G:C:=;:=8?7__A7C8',
     5'E:F=F>EACCAD9L9F__9H:J<L>LCIEIFJGL__:J<K>KCI__GLGIFFBAA?@<@7',
     6'__FFAA@??<?7>L;K:I:F;D>CBCEDFFFIEKBL>L__>L<K;I;F<D>C__BCDDEF',
     7'EIDKBL__>C;B:A9?9;:9;8>7B7E8F9G;G?FAEBBC__>C<B;A:?:;;9<8>7__',
     8'B7D8E9F;F?EADBBCFEEBC@@???<@:B9E9F:I<K?LALDKFIGFG@F<E:C8@7=7',
     9';8:::;;<<;;:__??=@;B:E:F;I=K?L__ALCKEIFFF@E<D:B8@7@E?D@CAD@E',
     A'__@9?8@7A8@9@E?D@CAD@E__@7?8@9A8A6@4?3HI8@H77CIC__7=I=8IH@87'/
      DATA FONT03/
     1';H<G;F:G:H;J<K>LALDKEJFHFFEDDC@A@>__ALCKDJEHEFDDBB__@9?8@7A8',
     2'@9@L97__@LG7__@IF7__;<E<__67<7__C7J7:L:7__;L;7__7LCLFKGJHHHF',
     3'GDFCCB__CLEKFJGHGFFDECCB__;BCBFAG@H>H;G9F8C777__CBEAF@G>G;F9',
     4'E8C7FIGGGLFIDKAL?L<K:I9G8D8?9<::<8?7A7D8F:G<__?L=K;I:G9D9?:<',
     5';:=8?7:L:7__;L;7__7LALDKFIGGHDH?G<F:D8A777__ALCKEIFGGDG?F<E:',
     6'C8A7:L:7__;L;7__AFA>__7LGLGGFL__;BAB__77G7G<F7:L:7__;L;7__AF',
     7'A>__7LGLGGFL__;BAB__77>7FIGGGLFIDKAL?L<K:I9G8D8?9<::<8?7A7D8',
     8'F:__?L=K;I:G9D9?:<;:=8?7__F?F7__G?G7__C?I?9L97__:L:7__FLF7__',
     9'GLG7__6L=L__CLJL__:BFB__67=7__C7J7@L@7__ALA7__=LDL__=7D7CLC;',
     A'B8@7>7<8;:;<<==<<;__BLB;A8@7__?LFL9L97__:L:7__GL:?__?CG7__>C'/
      DATA FONT04/
     1'F7__6L=L__DLJL__67=7__C7J7;L;7__<L<7__8L?L__87G7G<F79L97__:L',
     2'@:__9L@7__GL@7__GLG7__HLH7__6L:L__GLKL__67<7__D7K7:L:7__;LG9',
     3'__;JG7__GLG7__7L;L__DLJL__77=7?L<K:I9G8C8@9<::<8?7A7D8F:G<H@',
     4'HCGGFIDKAL?L__?L=K;I:G9C9@:<;:=8?7__A7C8E:F<G@GCFGEICKAL:L:7',
     5'__;L;7__7LCLFKGJHHHEGCFBCA;A__CLEKFJGHGEFCEBCA__77>7?L<K:I9G',
     6'8C8@9<::<8?7A7D8F:G<H@HCGGFIDKAL?L__?L=K;I:G9C9@:<;:=8?7__A7',
     7'C8E:F<G@GCFGEICKAL__;:=<?<A;B9C5D4E4F5:L:7__;L;7__7LCLFKGJHH',
     8'HFGDFCCB;B__CLEKFJGHGFFDECCB__77>7__ABE9G7I7J9__ABC@G7FJGLGH',
     9'FJEKBL>L;K9I9G:E;D=CCAE@G>__9G;E=DCBEAF@G>G:E8B7>7;8:99;97:9',
     A'@L@7__ALA7__:L9G9LHLHGGL__=7D79L9=::<8?7A7D8F:G=GL__:L:=;:=8'/
      DATA FONT05/
     1'?7__6L=L__DLJL9L@7__:L@:__GL@7__6L=L__DLJL8L<7__9L<<__@L<7__',
     2'@LD7__ALD<__HLD7__5L<L__ELKL9LF7__:LG7__GL97__6L=L__DLJL__67',
     3'<7__C7J79L@A@7__:LAAA7__HLAA__6L=L__ELKL__=7D7FL97__GL:7__:L',
     4'9G9LGL__97G7G<F7=P=0__>P>0__=PDP__=0D0BPB0__CPC0__<PCP__<0C0',
     5'FBI@F>__CEH@C;__7@H@?L=K<I<G=E?DADCEDGDICKAL?L<C<B;B;C<D>EBE',
     6'DDECFAF:G8H7__ECE:F8H7I7__EAD@>?;>:<::;8>7A7C8E:__>?<>;<;:<8',
     7'>7:L:7__;L;7__;B=D?EAEDDFBG?G=F:D8A7?7=8;:__AECDEBF?F=E:C8A7',
     8'__7L;LEBDAE@FAFBDDBE?E<D:B9?9=::<8?7A7D8F:__?E=D;B:?:=;:=8?7',
     9'ELE7__FLF7__EBCDAE?E<D:B9?9=::<8?7A7C8E:__?E=D;B:?:=;:=8?7__',
     A'BLFL__E7I7:?F?FAECDDBE?E<D:B9?9=::<8?7A7D8F:__E?EBDD__?E=D;B'/
      DATA FONT06/
     1':?:=;:=8?7CKBJCIDJDKCLAL?K>I>7__AL@K?I?7__;EBE__;7B7?E=D<C;A',
     2';?<==<?;A;C<D=E?EADCCDAE?E__=D<B<>=<__C<D>DBCD__DCEDGEGDED__',
     3'<=;<:::9;7>6C6F5G4__:9;8>7C7F6G4G3F1C0=0:19394:6=7:L:7__;L;7',
     4'__;B=D@EBEEDFBF7__BEDDEBE7__7L;L__77>7__B7I7@L?K@JAK@L__@E@7',
     5'__AEA7__=EAE__=7D7AL@KAJBKAL__BEB3A1?0=0<1<2=3>2=1__AEA3@1?0',
     6'__>EBE:L:7__;L;7__EE;;__@?F7__??E7__7L;L__BEHE__77>7__B7I7@L',
     7'@7__ALA7__=LAL__=7D75E57__6E67__6B8D;E=E@DABA7__=E?D@B@7__AB',
     8'CDFEHEKDLBL7__HEJDKBK7__2E6E__2797__=7D7__H7O7:E:7__;E;7__;B',
     9'=D@EBEEDFBF7__BEDDEBE7__7E;E__77>7__B7I7?E<D:B9?9=::<8?7A7D8',
     A'F:G=G?FBDDAE?E__?E=D;B:?:=;:=8?7__A7C8E:F=F?EBCDAE:E:0__;E;0'/
      DATA FONT07/
     1'__;B=D?EAEDDFBG?G=F:D8A7?7=8;:__AECDEBF?F=E:C8A7__7E;E__70>0',
     2'EEE0__FEF0__EBCDAE?E<D:B9?9=::<8?7A7C8E:__?E=D;B:?:=;:=8?7__',
     3'B0I0<E<7__=E=7__=?>B@DBEEEFDFCEBDCED__9E=E__97@7EDFEFBEDBE?E',
     4'<D;C;B<@>?C=E<F;__;B<A>@C>E=F;F9E8B7?7<8;:;7<8>L>;?8A7C7E8F:',
     5'__?L?;@8A7__;ECE:E::;8>7@7C8E:__;E;:<8>7__EEE7__FEF7__7E;E__',
     6'BEFE__E7I7:E@7__;E@9__FE@7__7E>E__CEIE8E<7__9E<:__@E<7__@ED7',
     7'__AED:__HED7__5E<E__EEKE:EE7__;EF7__FE:7__7E>E__CEIE__77=7__',
     8'B7I7:E@7__;E@9__FE@7>3<1:0908192:1__7E>E__CEIEEE:7__FE;7__;E',
     9':B:EFE__:7F7F:E7BP?M>J>H?EBB__@N?K?G@D__BB?@B>__B>?;>8>6?3B0',
     A'__@<?9?5@2@P@0>PAMBJBHAE>B__@NAKAG@D__>BA@>>__>>A;B8B6A3>0__'/
      DATA FONT08/
     1'@<A9A5@2@@6JJJ@@?AAA=CCC;EEE9GGG7III8HHH:FFF<DDD>BBB@@66J6@@',
     2'??A?==C=;;E;99G977I788H8::F:<<D<>>B>6J66J6JJ6JJH6HJF6FJD6DJB',
     3'6BJ@6@J>6>J<6<J:6:J868J767J969J;6;J=6=J?6?JA6AJC6CJE6EJG6GJI',
     4'6I@J<7:H8F7D6@7<8::8<7@6D7F8H:I<J@IDHFFHDI@JDI<IFH:HGG9GHF8F',
     5'HE8EID7DIC7CIB7BIA7AJ@6@I?7?I>7>I=7=I<7<H;8;H:8:G999F8:8D7<7',
     6'CIBHCGDHDICKAL?L=K<I<G=E?CD@__=EBBD@E>E<D:B8__>D<B;@;><<>:C7',
     7'__<<A9C7D5D3C1A0?0=1<3<4=5>4=3@A?@@?A@@A@A?@@?A@@A__@J<I:H8F',
     8'7D6@7<8::8<7@6D7F8H:I<J@IDHFFHDI@J6@J@__@6@J<I:H8F7D6@7<8::8',
     9'<7@6D7F8H:I<J@IDHFFHDI@J9GG9__GG99@H@7__8@H@__87H7I;G;E<C>@B',
     A'?C=D;D9C8A8?9=;<=<?=@>CBEDGEIE@H@7__8HHH__8@H@@J6@@6J@@J@I?H'/
      DATA FONT09/
     1'@GAH@I__7@I@__@9?8@7A8@9?L<K:H9C9@:;<8?7A7D8F;G@GCFHDKAL?L<H',
     2'>IALA7:G:H;J<K>LBLDKEJFHFFEDCA97G7;LFL@DCDECFBG?G=F:D8A7>7;8',
     3':99;CL9>H>__CLC7EL;L:C;D>EAEDDFBG?G=F:D8A7>7;8:99;FIEKBL@L=K',
     4';H:C:>;:=8@7A7D8F:G=G>FADCAD@D=C;A:>GL=7__9LGL>L;K:I:G;E>DCC',
     5'EBFAG?G<F:D8A7?7<8::9<9?:A;B=CBDEEFGFIEKBL>LFEEBC@@???<@:B9E',
     6'9F:I<K?L@LCKEIFEF@E;C8@7>7;8::IOHNIMJNJOIPGPEOCMBKAH@D>8=4<2',
     7'__DNCLBH@<?8>5=3;190706162738271IOHNIMJNJOIPGPEOCMBKAH@D>8=4',
     8'<2__DNCLBH@<?8>5=3;190706162738271__?G<F:D9A9?:<<:?9A9D:F<G?',
     9'GAFDDFAG?GHL8EH>__8<H<__87H77EIE__7@I@__7;I;8LHE8>__8<H<__87',
     A'H7GI97__7CIC__7=I=EDDFBG?G=F<E;B;?<=><A<C=D?__?G=E<B<?==><__'/
      DATA FONT10/
     1'EGD?D=F<H<J>KAKCJFIHGJEKBL?L<K:J8H7F6C6@7=8;:9<8?7B7E8G9H:__',
     2'FGE?E=F<J?I=G<E<C=B>?B>C<D:D8C7A7?8=:<<<>=?>BBCCEDGDICJAJ?ED',
     3'DCEBFCFDDFBG?G<F:D9A9?:<<:?9A9D:F<__?G=F;D:A:?;<=:?9__IP70@L',
     4'87__@LH7__@JG7__98G8__87H7HHAH=G;F9D8A8?9<;:=9A8H8__8@D@@L@7',
     5'__ALA7__>G;F:E9C9@:>;=><C<F=G>H@HCGEFFCG>G__>G<F;E:C:@;><=><',
     6'__C<E=F>G@GCFEEFCG__=LDL__=7D7;L;7__<L<7__8LGLGGFL__87?7AL:0',
     7'__GL@0__:AHA__9;G;>J>7__BJB78L@7__9L@9__HL@7__8LHL__9KGKGG99',
     8'__G99G__@J<I:H8F7D6@7<8::8<7@6D7F8H:I<J@IDHFFHDI@J@L97__@LG7',
     9'__@IF7__67<7__C7J7>F@IBF__;C@HEC__@H@7>:@7B:__;=@8E=__@I@8@J',
     A'<I:H8F7D6@7<8::8<7@6D7F8H:I<J@IDHFFHDI@J9L97__:L:7__FLF7__GL'/
      DATA FONT11/
     1'G7__6LJL__67=7__C7J7?L<K:I9G8C8@9<::<8?7A7D8F:G<H@HCGGFIDKAL',
     2'?L__?L=K;I:G9C9@:<;:=8?7__A7C8E:F<G@GCFGEICKAL__=E=>__CEC>__',
     3'=BCB__=ACAIL77__<L>J>H=F;E9E7G7I8K:L<L>KAJDJGKIL__E>C=B;B9D7',
     4'F7H8I:I<G>E>9L@B87__8L?B__8LFLGHEL__98F8__87F7G;77I7__@7@J9G',
     5'9I:K;L=L>K?I@E@7__HGHIGKFLDLCKBIAEA7__=7D797@LBMCOCPBR@S>R=P',
     6'=O>M@LG7__@IF7__;<E<__67<7__C7J78:97=7;;9>8B8F9I;K>LBLEKGIHF',
     7'HBG>E;C7G7H:__;;:>9B9F:I<K>L__BLDKFIGFGBF>E;__98<8__D8G89M8H',
     8'__HMGH__=D<?__DDC?__9;86__H;G6__9KGK__9JGJ__=BCB__=ACA__99G9',
     9'__98G8@L@7__ALA7__7E8F:E;A<?=>?=__8F9E:A;?<>?=B=E>F?GAHEIF__',
     A'B=D>E?FAGEIFJE__=LDL__=7D7:L:7__;L;7__;@=B@CBCEBF@F7__BCDBE@'/
      DATA FONT12/
     1'E7__7L;L__7GEG__77>7__B7I7@L?J@HAJ@L__@L@0__@A?>@0A>@A__:E<D',
     2'>E<F:E__:EFE__BEDDFEDFBE@L?J@HAJ@L__@L@>__@B?@@<@:?<A@@B__@>',
     3'@0__@4?2@0A2@4__:E<D>E<F:E__:EFE__BEDDFEDFBE__:7<6>7<8:7__:7',
     4'F7__B7A6F7D8B77=7?8B:C<C>BB?D>F>H?IA__7?8A:B<B>AB>D=F=H>IAIC',
     5'2@7@@4__6?@2PS?E<D:B9@8=8:98<7>7@8C;E>GBHE__?E=D;B:@9=9::8<7',
     6'__?EAEDDEAF;G8H7__AECDDAE;F8H7I7BL?K=I;E:B9>8870__BL@K>I<E;B',
     7':>9880__BLDLFKGJGGFEEDBC?C__DLFJFGEEDDBC__?CBBDAE@F>F;E9D8A7',
     8'>7<8;9:<__BBD@E>E;D9C8A77E9E;D<CC2E0__9E;CB2C1E0G0__HEGCD?:6',
     9'7260DDBE@E=D;A:>:;;9<8>7@7C8E;F>FAECAG@I@KALCLEKGI__@E>D<A;>',
     A';:<8__@7B8D;E>EBDDEDCE@E=D;B:?:<;9<8?7B7D8__@E>D<B;?;<<9=8?7'/
      DATA FONT13/
     1'__;>C>CL=0__DL<0__?E;D9B8?8<9:;8>7A7E8G:H=H@GBEDBE?E__?E<D:B',
     2'9?9<::<8>7__A7D8F:G=G@FBDDBE8B:D<E=E?D@CA@A<@7>0__9C;D>D@C__',
     3'IEHBE>B:@7>3=0__HEGBE?B:7A9D;E=D=B<>:7__;E<D<B;>97__<>>B@DBE',
     4'DEFDGCG@F;C0__DEFCF@E;B0@E>>=:=8?7A8C;__AE?>>:>8?7F@ECDDBE@E',
     5'=D;A:>:;;9<8>7@7C8E:F=GBGGFJEKCL@L>K<I<H=H=I>K__@E>D<A;>;:<8',
     6'__@7B8D:E=FBFGEJCL<E87__=E97__GDFEEECD?@=?;?__=??>B8C7__=?>>',
     7'A8C7E8G;:L<L>K?JAEG8H7__<L>J@EF8H7I7__@E97__@E:7;E50__<E60__',
     8';A:<:9<7>7@8B:D>__FEC:C8E7G8I;__GED:D8E7<E:7__=E<?;::7__GEFA',
     9'D=__HEGBF@D=B;?9=8:7__9E=E@E=D;A:>:;;9<8>7@7C8E;F>FAECDDBE@E',
     A'__@E>D<A;>;:<8__@7B8D;E>EBDD>D:7__>D;7__DDD7__DDE7__7B9D<EIE'/
      DATA FONT14/
     1'__7B9C<DIDBL?K=H<F;C:>::;8=7?7B8D;E=F@GEGIFKDLBL__BL@K>H=F<C',
     2';>;:<8=7__?7A8C;D=E@FEFIEKDL__<BEB:<;9<8>7@7C8E;F>FAECDDBE@E',
     3'=D;A:>60__@7B8D;E>EBDD__@E>D<A;>70JE?E<D:A9>9;:9;8=7?7B8D;E>',
     4'EADCCDAE__?E=D;A:>::;8__?7A8C;D>DBCD__CDJDAD>7__AD?7__8B:D=E',
     5'HE__8B:C=DHD7A9D;E=D=B;<;9=7__;E<D<B:<:9;8=7?7B8D:F=GAGEFEGC',
     6'<7>9B?CBDECHBJ@L?K>I=F>B??@<B:D7F:__B?CCCGBJAK?K>G>C??:D<D<E',
     7':D8A7>7;8897;7=8?;@>__7;8998;8=9?;__?>?;@8A7C7E8G;H>HAGDFEFD',
     8'GD__?;@9A8C8E9G;BL@K?J?I@HCGFG__CG?F=E<C<A>?A>D>__CG@F>E=C=A',
     9'??A>__A>==;<:::8<6A4B3B1@0>0__A>>=<<;:;8=6A4CL=0__DL<0__5A7D',
     A'9E;D;B:=:;;9=8@8B9E;__9E:D:B9=9;:9;8=7?7B8E;G>IBJEBL@K?J?I@H'/
      DATA FONT15/
     1'CGHGHHEGAE>C;@:=:;;9>7A5B3B1A0?0>2__EGBE?C<@;=;;<9>7CP<@C0=P',
     2'=0__CPC0=PD@=0:B7@:>__=E8@=;__8@I@:I<K>L@LAKH;I:K:__?K@JG:H8',
     3'I9G:__<K>K?JF:G8H7I7K:__:E;F=G>G?F__>F>E__;F=F>D__57799:<:>9',
     4'__89<9=8__5788;8<7>9__@H::__<?D?6J8L;L=K?L__9K<K__6J8K:J=J?L',
     5'__;G:F9D9C7C6B6@7A9A9;__:E:=__7B:B__;G;>:<9;__@I?H>F>=__?G??',
     6'__@I@@?>>=__@IFLHKIIIGGECC__FKHIHG__DKFJGIGFED__EDHBI@I:__GB',
     7'H@H;__EDFCGAG:__87;9>:B:E9__:8=9B9D8__87<8A8C7E9G:I:__CCC:__',
     8'C@G@__C=G=<K:J8H7F6C6?7<8:;8>7A7D8F9H;I=__8G7D7?9;<9?8B8E9__',
     9'<K:I9G8D8@9=<:?9B9E:G;I=__>H><__?H?>__@I@??=><__>H@ICLEKGKHL',
     A'__BKDJFJ__AJCIEIGJHL__EIE:7LELGKHIH:__9KEKGIG;__7L8K:JEJFIF:'/
      DATA FONT16/
     1'__=G<F;D;C9C8B8@9A;A;<__<E<>__9B<B__=G=?<=;<__77:9=:A:D9__98',
     2'<9A9C8__77;8@8B7D9F:H:__@J@:__@EBDDDFE__@?B@D@F?7J9L;L=K?L__',
     3':K<K__7J9K;J=J?L__<G;F:D:C8C7B7@8A:A:;__;E;=__8B;B__<G<>;<:;',
     4'__?E@HAJBKDLFLIK__BJDKFKHJ__@HAICJEJGIIK__?=@@ABBCDCFB__BBDB',
     5'EA__@@AACAD@FB__97<9@:E:I9__;8>9E9H8__97=8D8G7I9__?E?:8J:L=L',
     6'?KAL__;K>K__8J:K<J?JAL__>G=F<D<C:C9B9@:A<A<<__=E=>__:B=B__>G',
     7'>?==<<__AHA9@8?8;:9:7957__BHB:__BBFB__>8=8;989__CICCFC__FACA',
     8'C;B9>7<7:88857__AHCIFLHKJKKL__EKGJIJ__DJFIHIJJKL__FIF;<K:J8H',
     9'7F6C6@7=8;:9<8?7C7F8H:I<I?HAGBECCC__8G7D7?8<__<K:I9G8D8?9<::',
     A'<8__G:H;H?GA__C7E8F9G;G?FAEBCC__>H>;__?H?=__@I@>?<>;__>H@ICL'/
      DATA FONT17/
     1'EKGKHL__BKDJFJ__AJCIEIGJHL__GJCCC7__C?G?__C<G<6J8L;L=K?L__9K',
     2'<K__6J8K:J=J?L__;G:F9D9C7C6B6@7A9A9;__:E:=__7B:B__;G;>:<9;__',
     3'87;9>:A:C9__:8=9@9B8__87<8?8A7C9__@I?H>F>=__?G??__@I@@?>>=__',
     4'@IBKDLFLHK__EKFKGJ__BKDKFIHK__CCEDGFHEIBI>H:F7__FEGDHBH=G:__',
     5'EDFDGBG=F7__CCC9__C@G@__C=G=:J<L?LBKDL__=KAK__:J<K?JBJDL__AG',
     6'@F?D?C=C<B<@=A?A?<__@E@>__=B@B__AGA?@=?<__GJEHDED:C8A8=:;:99',
     7'77__EGE;__@8?8=9:9__GJFHF<E:C8A7>7<89877:J<L?LBKDL__=KAK__:J',
     8'<K?JBJDL__AG@F?D?C=C<B<@=A?A?<__@E@>__=B@B__AGA?@=?<__GJEHDE',
     9'D:C8__EGE;__GJFHF<E:C8@7=7:8998;8<9=:<9;6J8L;L=K?L__9K<K__6J',
     A'8K:J=J?L__;G:F9D9C7C6B6@7A9A9;__:E:=__7B:B__;G;>:<9;__87;9>:'/
      DATA FONT18/
     1'A:C9__:8<9@9B8__87<8?8A7C9__@I?H>F>=__?G??__@I@@?>>=__@IBKDL',
     2'FLHK__EKFKGJ__BKDKFIHK__CCFFGEID__EEGDID__IDGAE?C=__E?G>H:I8',
     3'J8__G<H8__E?F>G8H7I7J8__CCC97J9L<L>K@L__:K=K__7J9K;J>J@L__<G',
     4';F:D:C8C7B7@8A:A:;__;E;=__8B;B__<G<>;<:;__97<9@:E:I9__;8>9E9',
     5'H8__97=8D8G7I9__AI@H?F?=__@G@?__AIA@@>?=__AICKELGLIK__FKGKHJ',
     6'__CKEKGIIK__EKE::H9G8E8C6C5B5@6A8A8=__9F9?__6B9B__:H:@9>8=__',
     7'37597:9:;9<9=:__6999;8__375888:7;7<8=:__:H>LBHB;C9D9__>KAHA:',
     8'@9A8B9A:__>BAB__<J=J@G@C=C__=A@A@:?9A7D9E:__BHFLJHJ;K9L9__FK',
     9'IHI:K8__FBIB__DJEJHGHCEC__EAHAH9J7L9__=J=:__EJE:5I7K9L;L=K?H',
     A'D=F:G9__;K=I>GD;G8__7K9K;J=GB<D9E8G7__DJFIHIJJKL__EKGJIJ__DJ'/
      DATA FONT19/
     1'FLHKJKKL__9C7C6B6@7A9A__7B9B__57799:<:>9__89;9=8__5788;8<7>9',
     2'__9K9:__GIG7__@FAECDEDGE__9>;???A><L:K8I7G6D6@7=8;:9<8?7A7D8',
     3'F9H;I=J@JDIGHIFKDLCK@I=H__8H7E7?8<__<L:J9H8E8?9<::<8__H<I?IE',
     4'GIFJ__D8F:G<H?HEGGEJCK__=H=;__>H>=__?H?>><=;__CKC8__CEEDFDHE',
     5'__C?E@F@H?9L:K;I;C9C8B8@9A;A;987;8;0=2__;J<H<2__9B<B__9L;K<J',
     6'=H=2__=G@IDLHHH:__DKGHG:__BJCJFGF9__@:C:F9__A9C9E8__@8B8D7F9',
     7'H:__@I@3__@EBDDDFE__@?B@D@F?<L:K8I7G6D6@7=8;:9<8>7B7D8F9H;I=',
     8'J@JDIGHIFKDLCK@I=H__8H7E7?8<__<L:J9H8E8?9<::<8__H<I?IEGIFJ__',
     9'D8F:G<H?HEGGEJCK__=H=;__>H>=__?H?>><=;__CKC8__CEEDFDHE__C?E@',
     A'F@H?__>7?8@8B7F2H1I1__B6D3F1G1__@8A7D1F0H0I16J8L;L=K?L__9K<K'/
      DATA FONT20/
     1'__6J8K:J=J?L__;G:F9D9C7C6B6@7A9A9;__:E:=__7B:B__;G;>:<9;__87',
     2';9>:@:C9__:8<9@9B8__87<8?8A7C9__@I?H>F>=__?G??__@I@@?>>=__@I',
     3'CKELGKHIHFGDFCBA@@__EKFKGIGEFD__CKEJFHFEECBA__BAD@E?H:I9J9__',
     4'E>G:I8__BAD?F9H7J9CIBJ@K=L__DJBK__EKAL=L:K9J8H9F:E=DEDGCHBH@',
     5'G=__9G:F=EFEHDICIAH?__9J9H:G=FGFIEJCJAG=C7__7C8B:ACAD@D?C=__',
     6'8A:@B@C?__7C7B8@:?A?C>C=__77:9>:A:D9__98<9@9C8__77;8@8C7__EK',
     7'CIAF__@D>A__=?;=9<8<8=9<8H7F6C6?7<99;8>7A7D8F9H;I=__7?8<::<9',
     8'?8B8E9__8H7E7A8>:;<:?9B9E:G;I=__6I7K9L=LCKGKIL__>KBJFJ__6I7J',
     9'9K<KBIEIGJIL__AI@H>G><__?G?>__@H@??=><__EIE:6J8L:L=K?L__9K<K',
     A'__6J8K;J=J?L__9H8F7C7?8<9:;8>7A7D8F9H7J9__8?9<<9?8B8__9H8D8A'/
      DATA FONT21/
     1'9>:<<:?9C9F:__CI?H>F><__?G?>__@H@??=><__CIEJGLHKJJHIH;I9J9__',
     2'GIHJGKFJGIG:I8__EJFIF:__CIC9__CDFD__C@F@8L9K:I:C8C7B7@8A:A::',
     3'89__:J;H;:__8B;B__<9?9A8__8L:K;J<H<:@:C9__89;9>8@7C9F:H:__@H',
     4'CIEJGLHKJJHIH:__GIHJGKFJGIG;__EJFIF:__@H@:__@EBDDDFE__@?B@D@',
     5'F?6L7K8I8C6C5B5@6A8A8:69__8J9H9:__6B9B__:9<9>8__6L8K9J:H::=:',
     6'?9__6999<8=7?9B:D9E7G9J:__=J@LBJB:E:G9__@KAJA:__=J?J@I@:?9__',
     7'E9F8__EJHLJJJ:__HKIJI:__EJGJHIH:G9__=J=:__EJE:__=D@D__=@@@__',
     8'EDHD__E@H@6I8K:L<L=KE9F8H8__;K<JD9E8__8K:K;JC8D7F7H8J:__ELGK',
     9'IKJL__EKFJHJ__DJEIGIIJJL__67799:;:<9__89:9;8__677898;7__ELAC',
     A'__?@;7__:B>B__ABFB8L9K:I:C8C7B7@8A:A::89__:J;H;:__8B;B__<9?9'/
      DATA FONT22/
     1'A8__8L:K;J<H<:@:C9__89;9>8@7C9F:__@HCIEJGLHKJJHIH4G2E0C1?2:2',
     2'__GIHJGKFJGIG9__EJFIF:H7__F1D2A2__G2D3>3:2__@H@:__@EBDDDFE__',
     3'@?B@D@F?GKFI@C<>:;77__DF<=__ILFHDE@@::98__7J9L<KCKIL__8K<JAJ',
     4'FK__7J;I@IEJGK__98;9@:E:I9__:8?9D9H8__77=8D8G7I9__:B?B__BBFB',
     5'@D4DFL<>9:785737282:3;4;5:__FLB7__B8A<@>>@<A:A9@9>:;=8@7C7E8',
     6'F9CKBJAH?C==<;:88767585:6;7;8:__=F<D;C9C8D8F9H;J=K@LFLHKIIIG',
     7'HEFDCC?C__CCEBFAG?G<F9E8C7@7?8?:@<9J8H8F9D<C?CCDEEHGIIIKHLFL',
     8'CK@I>G<D;B:?:<;9<8>7@7C8E:F<F>E@C@A?@=CKBJAH?C==<;:88767585:',
     9'6;8;::<8>7A7C8E:G>HCHFGIEKCL>L;K9I8G8E9D;D<E=GEIDHDFEEGEHGHI',
     A'GKELBL@K?J>H>F?DAC?C<B:@9>9;:9;8=7@7C8E:F<F>E@C@A?@=?F>D<C:C'/
      DATA FONT23/
     1'9E9G:I<K@LHLFIEGCAA<@:>8;787686:7;8;9:__=?>@@AEAGBHDF>:I9G9E',
     2':C<B>BACCDFGGJGKFLELCKAI@G?D?A@?B>D>F?HAICG=E:B8?7<798898;9<',
     3':<;;;F:G:I<K?LAL=@;;987757484:5;6;7:__8>9?;@DCFDIFKHLJLKKLJL',
     4'HJFFD@C<C9D7E7G8I:HFFDCC@C>D=F=H>J@KCLHLFJDGBB@<?:=8;787787:',
     5'8;9;::HFFDCC@C>D=F=H>J@KCLHLFJDGBB@<?9=5<4:39496:8<:B>D@;F:G',
     6':I<K?LAL=@;;987757484:5;6;7:__KHLILKKLIKHIFFEECD@C>C__@CABB@',
     7'C9D7E7G8I:;I:G:E;C=B@BCCEDHGIJIKHLGLEKDJBG@A><=:;89777686:7;',
     8'9;;:>8@7C7E8F9@L<C9=7:583717080:1;2;3:__@L>C=;=7__HLDCB??:=7',
     9'__HLFCE;E9F7G7I8K:@L?H=B;=:;886747383:4;5;6:__@L@FB=B7__LIMH',
     A'NHOIOKNLLLJKHHGFEAC;B7AL?K=I;F:D9@9<:9;8=7?7B8D:F=G?HCHGGJFK'/
      DATA FONT24/
     1'EKCJAH?D>?><CKBJAH?C==<;:88767585:6;7;8:__=F<D;C9C8D8F9H;J=K',
     2'@LELGKHJIHIEHCGBEACAAB@CCHCFBDAC?B=B<D<F=I?KBLELGKHIHEGBE?A;',
     3'>9<89777686:7;9;;:>8@7C7E8F9CKBJAH?C==<;:88767585:6;7;8:__=F',
     4'<D;C9C8D8F9H;J=K@LFLHKIIIGHEGDDC?C__@CBBC@D9E7F7H8J:=I<G<E=C',
     5'?BBBECGDIFJHJKILHLGKFIEED?C<B:@8=7:7887:7<8>9?;@=@>?>==;<:AF',
     6'@D>C<C;E;G<I>KBLJLHIGGEAC<B:@8=7:7888:9;:;;:7H9K;L<L=J=G<C;@',
     7':<:9;7=7?8B;D>FC__ILE@D<D9E7F7H8J:7H9K;L<L=J=G<C;@:<:9;7=7?8',
     8'B;D>FBGEHIHKGLFLEKDIDFEDGBIAKA7F6F5G5I6K8L<L;J:E:=97__DLBJAH',
     9'?C==;997__DLCJBEB=A7__LLJJIHGCE=C9A7=G<F:F9G9I:K<L>L@KAIAF@B',
     A'>=<::88767585:6;7;8:__HIIHJHKIKKJLHLFKDIBF@B?=?:@8B7D7F8G:G<'/
      DATA FONT25/
     1'F=D=C<9H;K=L>L?K?I=C=@>>@>C?EAGDHF__JLHFE=C:A8>7;7887:7<8=9=',
     2':<BFAD?C=C<E<G=I?KCLKLIIGED>B;@9>8:777686:7;9;;:>8@7C7E8F9C=',
     3'B?@@>@<?;>:<::;8=7?7A8B:__D@B:B8C7D7F8G9I<;<=?@DAFBIBKAL?K>I',
     4'=E<><8=7>7@8B:C=C@D<E;G;I<B>B?A@?@=?<>;<;:<8>7A7D9F<C=B?@@>@',
     5'<?;>:<::;8=7?7A8B:__HLB:B8C7D7F8G9I<=9?:@;A=A?@@?@=?<=<:=8?7',
     6'A7C8D9F<=<AACDDFEIEKDLBKAI?A<8918.8,9+;,</=8>7@7B8C9E<C=B?@@',
     7'>@<?;>:<::;8=7?7A8B9__D@B9>.=,;+:,:.;1>4A6C7F9I<;<=?@DAFBIBK',
     8'AL?K>I=E<?;7__;7<:=<??A@C@D?D=C:C8D7E7G8H9J<AEADBDBEAE__><@@',
     9'>:>8?7@7B8C9E<AEADBDBEAE__><@@:.9,7+6,6.71:4=6?7B9E<;<=?@DAF',
     A'BIBKAL?K>I=E<?;7__;7<:=<??A@C@D?D=B<?<__?<A;B8C7D7F8G9I<=<??'/
      DATA FONT26/
     1'BDCFDIDKCLAK@I?E>>>8?7@7B8C9E<3<5?7@8?8>7:67__7:8<:?<@>@???>',
     2'>:=7__>:?<A?C@E@F?F=E:E8F7G7I8J9L<8<:?<@=?=><:;7__<:=<??A@C@',
     3'D?D=C:C8D7E7G8H9J<@@>@<?;>:<::;8=7?7A8B9C;C=B?@@???=@;B:E:G;',
     4'H<9<;?<A;=5+__;=<?>@@@B?C=C;B9A8?7__;8=7@7C8E9H<C=B?@@>@<?;>',
     5':<::;8=7?7A8__D@C=A8>1=.=,>+@,A/A6C7F9I<;<=?>A>?A?B>B<A9A8B7',
     6'C7E8F9H<<<>??A??A<B:B8@7__<8>7B7D8E9G<=<??AC__DL>:>8?7A7C8D9',
     7'F<__>DED:<<@:::8;7=7?8A:C=__D@B:B8C7D7F8G9I<:<<@;;;8<7=7@8B:',
     8'C=C@__C@D<E;G;I<:@8>7;7987:7<8>:__@@>:>8?7A7C8E:F=F@__F@G<H;',
     9'J;L<8<:?<@>@???8@7C7F9H<__E?D@B@A?=8<7:798:<<@:::8;7=7?8A:C=',
     A'__D@>.=,;+:,:.;1>4A6C7F9I<:<<?>@@@B>B<A:?8<7>6?4?1>.=,;+:,:.'/
      DATA FONT27/
     1';1>4A6E9H<                                                  '/
        JOFF=0
        BACKS=0
        TALIC=1.
        ! Initially, italics are ON.            !
        OFFX=0.
        OFFY=0.
        SUBS=1.
C
C       ***** LOOP OVER CHARACTERS TO BE PLOTTED *****
C
        DO 10 J10=1,NCH
        KCUR=CHARS(J10)
        IF(KCUR.LT.32)KCUR=32
        IF(KCUR.EQ.64)THEN
            IF(JOFF.EQ.192)THEN
                SUBS=SUBS*0.6
         ! %@ = decrease size                   !
                JOFF=-96
            END IF
            JOFF=JOFF+96
         ! @ = second font                      !
            IF(JOFF-192)10,1,11
         ! @@ = backspace                       !
1           BACKS=1
            JOFF=0
        ELSE IF (KCUR.EQ.37) THEN
            IF(JOFF.EQ.96)THEN
                SUBS=SUBS/0.6
         ! @% = increase size                   !
                JOFF=-192
            END IF
            JOFF=JOFF+192
         ! % = third font                       !
            IF(JOFF.GT.192)GO TO 11
         ! %% = end                             !
        ELSE IF (KCUR.EQ.94) THEN
            SUBS=SUBS*0.6
         ! ^ = superscript                      !
            OFFY=OFFY+21.*SUBS
        ELSE IF (KCUR.EQ.92) THEN
            SUBS=SUBS*0.6
         ! \ = subscript                        !
            OFFY=OFFY-12.*SUBS
        ELSE IF (KCUR.EQ.126)THEN
            TALIC=1.-TALIC
         ! ~ = italics off/on                   !
        ELSE
            J=KCUR-31+JOFF
            LEFTE=INDEX(2,J)
         ! LH offset of letter within box
            IF(BACKS.EQ.1.AND.NBACK.EQ.0)OLDINC=LASTINC
            LASTINC=(INDEX(3,J)-INDEX(2,J))*SUBS
         ! width of (letter+RH edge)            !
            IF(BACKS.EQ.1)THEN
                DIFF=.5*(OLDINC-LASTINC)
                OFFX=OFFX-OLDINC+DIFF
                LASTINC=LASTINC+DIFF
            END IF
            NP=INDEX(1,J)/2
        ! # of pen strokes                      !
            IF(NP.EQ.0)GO TO 6
            INDX=INDEX(4,J)
         ! where to start                       !
            KC=J+31
            TAL=0.
            IF(KC.GE.65.AND.KC.LE.90)TAL=TALIC
         ! only italicise                       !
            IF(KC.GE.97.AND.KC.LE.122)TAL=TALIC
         !    letters                           !
            UP=1.
C
C       ***** LOOP OVER PEN STROKES *****
C
            DO 5 L=1,NP
      J60=(INDX+59)/60
      I60=INDX+60-J60*60
      IX=ICHAR(FONTS(J60)(I60:I60))-64
      IY=ICHAR(FONTS(J60)(I60+1:I60+1))-64
            INDX=INDX+2
            IF(IX.EQ.31)THEN
                UP=1.
                GO TO 5
            ELSE
         !  OFF is the                          !
                XL=OFFX+SUBS*(IX-LEFTE+0.20*TAL*(IY+9))
         ! current offset                       !
                YL=OFFY+SUBS*(IY)
         !  relative to                         !
                XP=XLHE+0.0476*HEIGHT*(XL*COST-YL*SINT)
         ! the start of                         !
                YP=YLHE+0.0476*HEIGHT*(YL*COST+XL*SINT)
         !  the string                          !
            ENDIF
         ! (i.e. the LH edge)                   !
            IF(UP.EQ.1.)THEN
                IF(LETTS.EQ.1)CALL JUMP TO (XP,YP)
                UP=0.
            ELSE
                IF(LETTS.EQ.1)CALL LINE TO (XP,YP)
            ENDIF
            IF(BOUNDS.EQ.1)THEN
                IF(XP.GT.XMAX)XMAX=XP
                IF(YP.GT.YMAX)YMAX=YP
                IF(XP.LT.XMIN)XMIN=XP
                IF(YP.LT.YMIN)YMIN=YP
            END IF
5           CONTINUE
6           JOFF=0
            NBACK=0
            IF(BACKS.EQ.1)NBACK=1
            BACKS=0
            SUBS=1.
            OFFY=0.
            OFFX=OFFX+LASTINC
        ENDIF
10      CONTINUE
11      CONTINUE
        XP=XLHE+.0476*HEIGHT*(OFFX*COST)
        YP=YLHE+.0476*HEIGHT*(OFFX*SINT)
        RETURN
        END
        SUBROUTINE FR_NUMBR(R,S,H,X,T,N)
        COMMON/FR_SYMB/ISYM
        INTEGER*4 N
        IF(ISYM.EQ.-1)THEN
                CALL NOMBER(R,S,H,X,T,N)
        ELSE
                CALL NUMBER(R,S,H,X,T,N)
        END IF
        RETURN
        END
        SUBROUTINE NOMBER (X,Y,HT,F,AN,IC)
C       SIMILIAR TO CALCOMP NUMBER (CALLING SEQUENCE IDENTICAL), BUT USES
C       SIMBOL;  CREATED  20.JUN.80  PLH;   MODIFIED  5.MAR.82, 5.21.82  SMCM.
        IMPLICIT REAL*8 D
        REAL*8 SPACC
        REAL*4 X,Y,HT,F,AN,DUM
        INTEGER*4 I,IC,J,M,N,NCHAR
        LOGICAL*1 A(80),IAS
        CHARACTER*1 DOT,NEG,PCT,AA(10)
        COMMON/FR_INT/IFRAME
        COMMON/FONTC1/DUM(5),XMAX,XMIN,YMAX,YMIN
        DATA DOT/'.'/,NEG/'-'/,PCT/'%'/,
     +       AA/'0','1','2','3','4','5','6','7','8','9'/
     +       SPACC/1.00000001/
        DEX(DPF)=10.**DPF
        IAS(I)=ICHAR(AA(I+1))          ! Integer digit to ascii conversion.
        DPF=DBLE(F)
        NCHAR=0
        IF(IFRAME.EQ.1)NCHAR=-999      ! Ensure numerical labels are centered.
        N=0
        IF (DPF.NE.0.) THEN
            N=DLOG10(DABS(DPF))+1.              ! Digits to left of decimal.
        END IF
        IF (N.LE.0) N=1
        M=N+1+IC                                ! Total characters plotted.
        DPG=DABS(DPF)                           ! For discounting.
        IF (IC) 100,200,200
100     DO I=1,M                                ! IC < 0
            DPH=DEX(DFLOAT(N-I))
            J=DPG/DPH*SPACC                     ! Discounted digit.
            A(I)=IAS(J)
            DPG=DPG-J*DPH                       ! Discount DPG for next digit.
        END DO
        GO TO 500
200     DO I=1,N                                ! For IC >,= 0
            DPH=DEX(DFLOAT(N-I))
            J=DPG/DPH*SPACC                     ! Discounted digit.
            A(I)=IAS(J)
            DPG=DPG-J*DPH                       ! Discount DPG for next digit.
        END DO
        A(N+1)=ICHAR(DOT)                       ! Insert decimal point.
        IF (IC.EQ.0) GO TO 500
        DO I=1,IC                               ! Add decimal digits.
            J=10*DPG*SPACC                      ! Discounted digit.
            A(N+1+I)=IAS(J)
            DPG=10.*DPG-J                       ! Continue discounting DPG.
        END DO
     
500     J=10*DPG*SPACC
        IF(J.LT.5)GO TO 501                     ! Round off last digit(s).
        IF(IC.GT.0)THEN
            DO I=M,N+2,-1                       ! Start at right edge of string.
                IF(A(I).LE.56)THEN
                    A(I)=A(I)+1
                    GO TO 501
                END IF
                A(I)=48
            END DO
        END IF
        DO I=N,1,-1                          ! Then adjust left, if necessary.
C           IF(A(I).LT.56)THEN     BUG FOUND BY RYBICK 04FEB86
            IF(A(I).LE.56)THEN
                A(I)=A(I)+1
                GO TO 501
            END IF
            A(I)=48
        END DO
        DO I=M,1,-1
            A(I+1)=A(I)
        END DO
        A(1)=IAS(1)
501     A(M+1)=ICHAR(PCT)                       ! Add %% for SIMBOL.
        A(M+2)=A(M+1)
        IF (F.LT.0.) THEN                       ! Put "-" up front if necessary.
            DO I=1,M+2
                A(M+4-I)=A(M+3-I)
            END DO
            A(1)=ICHAR(NEG)
            M=M+1
            IF(NCHAR.LT.0)THEN
                M=M+1                        ! Extra blank for better centering
                A(M+2)=A(M+1)                   ! of negative numbers.
                A(M+1)=A(M)
                A(M)=' '
            END IF
        END IF
        IF(IFRAME.GE.0)THEN
            CALL SIMBOL (X,Y,HT,A,AN,NCHAR)     ! Call SIMBOL as usual.
        ELSE
            CALL SIMBOL (X,Y,-HT,A,AN,NCHAR)
            R=X+(XMIN-XMAX)                     ! N.B. This is specific to a
            S=Y+.5*(YMIN-YMAX)                  ! horizontal string, as written.
            CALL SIMBOL (R,S,HT,A,AN,NCHAR)
        END IF
        RETURN
        END
      SUBROUTINE FRAME(XMIN,XMAX,XLEN,MODX,XTIT,   ! SEE COMMENTS
     *                 YMIN,YMAX,YLEN,MODY,YTIT)   !  FOR EFRAME
      CHARACTER*80 XTIT,YTIT
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY,RLEN,SLEN
      COMMON/PLTDAT/DUM(10),IWTCUR
      COMMON/FR_DRAW/MODE/FR_HTS/HTL,HTN/FR_WTS/IWT(4)/FR_ROTN/IROT
      COMMON/FR_SYMB/ISYM/FR_TIKS/TIKS(3),TIKL/FR_INT/IFRAME
C
      IFRAME=1
      ISYM=1
      JROT=IROT
      IF(IROT.EQ.0)IROT=1
      DMIN=AMIN1(XLEN,YLEN)
      IF(DMIN.GT.2.)THEN
        IF(HTL.EQ.0.)HTL=.15
        IF(HTN.EQ.0.)HTN=.15
      ELSE
        IF(HTL.EQ.0.)HTL=.075*DMIN
        IF(HTN.EQ.0.)HTN=HTL
      END IF
      TIKS(1)=.2*HTN
      TIKS(2)=2.5*TIKS(1)
      TIKS(3)=4.*TIKS(1)
      TIKL=.3*HTN
C
      MODEX=MODX
      MODEY=MODY
      X1=XMIN
      X2=XMAX
      Y1=YMIN
      Y2=YMAX
C
      RLEN=XLEN
      SLEN=YLEN
C
C      SET AXES TICK, LABEL INFO
C
      IF(MODEX.GT.0)
     * CALL FR_LINSET(X1,X2,XLEN,MODEX,DXS,DXM,DXL,LABXSP,LABXDP,LPOWX)
      IF(MODEX.LT.0)
     * CALL FR_LOGSET(X1,X2,XLEN,MODEX,DXS,DXM,DXL)
      XL=X1
      XR=X2
      DINCHX=XLEN/(XR-XL)
      IF(MODEY.GT.0)
     * CALL FR_LINSET(Y1,Y2,YLEN,MODEY,DYS,DYM,DYL,LABYSP,LABYDP,LPOWY)
      IF(MODEY.LT.0)
     * CALL FR_LOGSET(Y1,Y2,YLEN,MODEY,DYS,DYM,DYL)
      YBOT=Y1
      YTOP=Y2
      DINCHY=YLEN/(YTOP-YBOT)
      IF(MODE.NE.0)GO TO 10
C
C      DRAW AXES
C
      IF(MODEX.LT.0) GO TO 1
      CALL FR_LINDRX(Y1,X1,X2,DXS,DXM,DXL,1,1,LABXSP,LABXDP)
      CALL FR_LINDRX(Y2,X1,X2,DXS,DXM,DXL,2,0,LABXSP,LABXDP)
      GO TO 2
    1 CALL FR_LOGDRX(Y1,X1,X2,DXS,DXM,DXL,1,1)
      CALL FR_LOGDRX(Y2,X1,X2,DXS,DXM,DXL,2,0)
    2 IF(MODEY.LT.0) GO TO 3
      CALL FR_LINDRY(X1,Y1,Y2,DYS,DYM,DYL,1,1,LABYSP,LABYDP)
      CALL FR_LINDRY(X2,Y1,Y2,DYS,DYM,DYL,2,0,LABYSP,LABYDP)
      GO TO 4
    3 CALL FR_LOGDRY(X1,Y1,Y2,DYS,DYM,DYL,1,1)
      CALL FR_LOGDRY(X2,Y1,Y2,DYS,DYM,DYL,2,0)
C
C      LABEL AXES
C
    4 CALL FR_SPACES(XTIT,NTIT)
      IF(IWT(4).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(4)
      END IF
      IF(NTIT.EQ.0) GO TO 5
      R=.5*(XLEN-.857*HTL*NTIT)
      S=-(HTL+3.*HTN)
      CALL SYMBOL(R,S,HTL,%REF(XTIT),0.,NTIT)
    5 CALL FR_SPACES(YTIT,NTIT)
      IF(NTIT.EQ.0) GO TO 6
      R=-3.*HTL
      IF(MODEY.LT.0.AND.IROT.EQ.0)R=R-1.5*HTN
      S=.5*(YLEN-.857*HTL*NTIT)
      CALL SYMBOL(R,S,HTL,%REF(YTIT),90.,NTIT)
    6 IF(IWT(4).NE.0)IWTCUR=JWT
      IFRAME=0
   10 IROT=JROT
      RETURN
      END
      SUBROUTINE FR_LINSET(X1,X2,XLEN,MODE,DXS,DXM,DXL,LABSP,
     +                     LABDP,LABPOW)
C
C       DETERMINES INCREMENTS FOR SMALL, MAJOR AND NUMBERED TICKS
C       FOR A LINEAR PLOT
C
      CALL FR_LINDIV(X1,X2,XLEN,DXS,DXM,DXL)
      CALL FR_LINFNC(X1,X2,DXM,MODE,FIRSTL,NL)
      CALL FR_LINFNC(X1,X2,DXL,1,FIRSTL,NL)
      CALL FR_LABFRM(FIRSTL,DXL,NL,LABSP,LABDP,LABPOW)
      RETURN
      END
      SUBROUTINE FR_LOGSET(X1,X2,XLEN,MODE,DEXPS,DEXPM,DEXPL)
C
C      FINDS INCREMENTS FOR SMALL, MAJOR AND LABELED TICKS FOR LOG PLOT
C
      X1=ALOG10(ABS(X1))
      X2=ALOG10(ABS(X2))
      CALL FR_LINDIV(X1,X2,XLEN,DEXPS,DEXPM,DEXPL)
      IF(ABS(DEXPS).LT.1.) DEXPS=0.
      IF(ABS(DEXPM).LT.1.) DEXPM=DEXPM/ABS(DEXPM)
      IF(ABS(DEXPL).LT.1.) DEXPL=DEXPM
      IF(MODE.NE.-2) RETURN
      DFNC=DEXPM
      IF(DEXPS.NE.0.) DFNC=DEXPS
      CALL FR_LINFNC(X1,X2,DFNC,2,FEXP,NEXP)
      RETURN
      END
      SUBROUTINE FR_LINDIV(X1,X2,XLEN,DXS,DXM,DXL)
C
C       FIGURES OUT "SUITABLE" TICK SPACINGS (NEITHER TOO MANY NOR
C       TOO FEW NUMBERS OR MAJOR TICKS)
C
      DIMENSION SUBT(4),SUBL(3)
      DATA SUBT/.1,.2,.25,.5/,SUBL/1.,2.,5./,THS,THL/.1,1./
      DXINCH=(X2-X1)/XLEN
      CALL COMPOZ(DXINCH,DXPI,LPOW)
      FAC=10.**(LPOW)
      IF(X2.LT.X1) FAC=-FAC
      SCALE=1.
      DIPX=1./ABS(DXPI)
    1 DO 2 I=1,4
      J=I
      IF(SUBT(J)*DIPX .GT. THS) GO TO 3
    2 CONTINUE
      DIPX=DIPX*10.
      SCALE=SCALE*10.
      GO TO 1
    3 XX=SCALE*FAC
      DXS=SUBT(J)*XX
      DXM=XX
      IF(J.EQ.1) DXM=.5*XX
    4 DO 5 I=1,3
      J=I
      IF(SUBL(J)*DIPX .GE. THL) GO TO 6
    5 CONTINUE
      SCALE=SCALE*10.
      DIPX=DIPX*10.
      GO TO 4
    6 DXL=SUBL(J)*SCALE*FAC
      RETURN
      END
      SUBROUTINE FR_LINFNC(X1,X2,DX,MODE,FIRST,NPOST)
      DATA EPS/.01/
C
C      MODE=1 ESTABLISH FENCEPOSTS BETWEEN X1-X2, AT INTERVAL DX
C      MODE=2 MOVE POSTS OUT TO CONTAIN X1,X2
C
      IF(X2.LT.X1) GO TO 1
      SMALL=X1
      BIG=X2
      GO TO 2
    1 SMALL=X2
      BIG=X1
    2 DXG=ABS(DX)
      FS=SMALL/DXG
      NS=FS
      IF(ABS(FS-NS).LE.EPS) GO TO 3
      IF(SMALL.GT.0.) NS=NS+1
      IF(MODE.EQ.2) NS=NS-1
    3 FB=BIG/DXG
      NB=FB
      IF(ABS(FB-NB).LE.EPS) GO TO 4
      IF(BIG.LT.0.) NB=NB-1
      IF(MODE.EQ.2) NB=NB+1
    4 IF(X2.GT.X1) GO TO 5
      I=NB
      NB=NS
      NS=I
    5 FIRST=NS*DXG
      NPOST=ABS(NB-NS)+1
      IF(MODE.NE.2) RETURN
      X1=FIRST
      X2=NB*DXG
      RETURN
      END
      SUBROUTINE FR_LABFRM(FIRST,DX,NX,NLAB,NDEC,NPOW)
C
C      GIVEN THE (NX) VALUES FROM (FIRST) IN INCREMENTS OF (DX)
C      TO BE WRITTEN, FIND FORMAT
C           NDEC=-1   : INTEGER FORMAT
C           NDEC.GT.0 : NUMBER OF PLACES RIGHT OF DEC POINT
C           NPOW.NE.0 : E FORMAT
C           NLAB      = NUMBER OF SPACES FOR LABEL
C
      DATA NMAX /8/
C
      NPOW=0
      CALL COMPOZ(DX,F,LDX)
      FINAL= FIRST+(NX-1)*DX
      BIG=FIRST
      IF(ABS(FIRST).LT.ABS(FINAL)) BIG=FINAL
      CALL COMPOZ(BIG,F,LBIG)
      NSIN=0
      IF(FIRST.LT.0. .OR. FINAL.LT.0.) NSIN=1
C      *** IS INTEGER FORMAT OK ***
      IF(LDX.LT.0) GO TO 1
      NLAB=NSIN+1+LBIG
      IF(NLAB.GT.NMAX) GO TO 2
      NDEC=-1
      RETURN
C      *** INCREMENT LT 1, IS F FORMAT OK ***
    1 NDEC=ABS(LDX)
      NLAB=NSIN+1+NDEC
      IF(LBIG.GE.0) NLAB=NLAB+LBIG+1
      IF(NLAB.LE.NMAX) RETURN
C      *** RESORT TO E FORMAT ***
    2 NLAB=NSIN+5
      NPOW=LBIG
      IF(ABS(NPOW).GE.10) NEX=NEX+1
      IF(NPOW.LT.0) NLAB=NLAB+1
      NDEC=NPOW-LDX
      IF(NDEC.LT.1) NDEC=1
      NLAB=NLAB+NDEC
      RETURN
      END
      SUBROUTINE FR_LINDRX(Y,X1,X2,DXS,DXM,DXL,IAX,ILAB,NLAB,NDEC)
C
C       DRAWS X-AXIS, TICK MARKS AND NUMBERS FOR LINEAR CASE.
C       NO NUMBERS ARE DRAWN FOR NONZERO LMODE.
C
      DIMENSION DX(3)
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY/PLTDAT/DUM(10),IWTCUR
      COMMON/FR_LABX/LMODE/FR_HTS/HTL,HTN/FR_WTS/IWT(4)
      COMMON/FR_TIKS/TIKS(3),TIKL/FR_SYMB/ISYM
      DATA MODE/1/,THETA/0./
C
      CINCH(XA,XS,DI)=(XA-XS)*DI
      DX(1)=DXS
      DX(2)=DXM
      DX(3)=DXL
      SAX=CINCH(Y,YBOT,DINCHY)
      R1=CINCH(X1,XL,DINCHX)
      R2=CINCH(X2,XL,DINCHX)
      IF(IWT(1).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(1)
      END IF
      CALL PLOT(R1,SAX,3)
      CALL PLOT(R2,SAX,2)
      DS=1.
      IF(IAX.EQ.2) DS=-1.
      DO 2 J=1,3
      IF(DX(J).EQ.0) GO TO 2
      STIK=SAX+DS*TIKS(J)
      CALL FR_LINFNC(X1,X2,DX(J),MODE,FIRSTX,NX)
      DR=DX(J)*DINCHX
      R=CINCH(FIRSTX,XL,DINCHX)
      DO 1 I=1,NX
      CALL PLOT(R,SAX,3)
      CALL PLOT(R,STIK,2)
    1 R=R+DR
    2 CONTINUE
      IF(IWT(1).NE.0)IWTCUR=JWT
      IF(ILAB.EQ.0.OR.LMODE.NE.0) RETURN
      X=FIRSTX
      R=CINCH(FIRSTX,XL,DINCHX)
      IF(ISYM.EQ.-1.AND.NDEC.NE.0)THEN
        IF(IAX.EQ.1)S=SAX-HTN
        IF(IAX.EQ.2)S=SAX+HTN
      ELSE
        R=R-.5*HTN*NLAB
        IF(IAX.EQ.1)S=SAX-1.5*HTN
        IF(IAX.EQ.2)S=SAX+.5*HTN
      END IF
      IF(IWT(2).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(2)
      END IF
      DO 3 I=1,NX
      IF(NDEC.EQ.0) CALL LOGNUM(R,S,HTN,X,THETA,-1)
      IF(NDEC.NE.0) CALL FR_NUMBR(R,S,HTN,X,THETA,NDEC)
      R=R+DR
    3 X=X+DXL
      IF(IWT(2).NE.0)IWTCUR=JWT
      RETURN
      END
      SUBROUTINE FR_LINDRY(X,Y1,Y2,DYS,DYM,DYL,IAX,ILAB,NLAB,NDEC)
C
C       AS FOR LINDRX, BUT FOR THE Y-AXIS
C
      DIMENSION DY(3)
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY/PLTDAT/DUM(10),IWTCUR
      COMMON/FR_LABY/LMODE/FR_HTS/HTL,HTN/FR_WTS/IWT(4)/FR_ROTN/IROT
      COMMON/FR_TIKS/TIKS(3),TIKL/FR_SYMB/ISYM/FR_INT/IFRAME
      COMMON/FR_CONF/SCENT,ICONF
      DATA MODE/1/,THETA/90./THETAL/0./
C
      CINCH(XA,XS,DI)=(XA-XS)*DI
      DY(1)=DYS
      DY(2)=DYM
      DY(3)=DYL
      RAX=CINCH(X,XL,DINCHX)
      S1=CINCH(Y1,YBOT,DINCHY)
      S2=CINCH(Y2,YBOT,DINCHY)
      IF(IWT(1).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(1)
      END IF
      CALL PLOT(RAX,S1,3)
      CALL PLOT(RAX,S2,2)
      DR=1.
      IF(IAX.EQ.2) DR=-1.
      DO 2 J=1,3
      IF(DY(J).EQ.0.) GO TO 2
      RTIK=RAX+DR*TIKS(J)
      CALL FR_LINFNC(Y1,Y2,DY(J),MODE,FIRSTY,NY)
      DS=DY(J)*DINCHY
      S=CINCH(FIRSTY,YBOT,DINCHY)
      DO 1 I=1,NY
      CALL PLOT(RAX,S,3)
      CALL PLOT(RTIK,S,2)
    1 S=S+DS
    2 CONTINUE
      IF(IWT(1).NE.0)IWTCUR=JWT
      IF(ILAB.EQ.0.OR.LMODE.NE.0) RETURN
      Y=FIRSTY
      S1=CINCH(FIRSTY,YBOT,DINCHY)
      HALF=.5*HTN
      IF(NLAB.LE.5.AND.IROT.EQ.0)THEN
        TH=THETAL
        IF(ISYM.EQ.-1.AND.IAX.EQ.1.AND.NDEC.NE.0)THEN
            IFRAME=-1
            R=RAX-HALF
            S=S1
        ELSE
            IF(NDEC.NE.0)IFRAME=0
            IF(IAX.EQ.1)R=RAX-HTN*(.5+NLAB)
            IF(IAX.EQ.2)R=RAX+HALF
            S=S1-HALF
        END IF
      ELSE
        TH=THETA
        IF(ISYM.EQ.-1)THEN
            IF(IAX.EQ.1)R=RAX-HTN
            IF(IAX.EQ.2)R=RAX+HTN
            S=S1
        ELSE
            IF(IAX.EQ.1)R=RAX-HALF
            IF(IAX.EQ.2)R=RAX+3.*HALF
            S=S1-NLAB*HALF
        END IF
      END IF
      SMIN=HALF                                 ! Only offset first Y-axis
      IF(TH.EQ.THETA)SMIN=NLAB*HALF             ! label if it really would
      IF(S1.LT.SMIN)S=S+SMIN                    ! extend below the X-axis.
      IF(IWT(2).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(2)
      END IF
      IF(NDEC.EQ.0) CALL LOGNUM(R,S,HTN,Y,TH,-1)
      IF(NDEC.NE.0) CALL FR_NUMBR(R,S,HTN,Y,TH,NDEC)
      IF(ABS(S-SCENT).LE.HTN+HTL)THEN
          ICONF=1                 ! ICONF is nonzero if a conflict exists.
          IF(S.LT.SCENT)ICONF=-1
      END IF
      IF(S1.LT.SMIN)S=S-SMIN
      IF(NY.LE.1)GO TO 4
      DO 3 I=2,NY
      S=S+DS
      Y=Y+DYL
      IF(NDEC.EQ.0) CALL LOGNUM(R,S,HTN,Y,TH,-1)
      IF(NDEC.NE.0) CALL FR_NUMBR(R,S,HTN,Y,TH,NDEC)
      IF(ABS(S-SCENT).LE.HTN+HTL)THEN
          ICONF=1
          IF(S.LT.SCENT)ICONF=-1
      END IF
    3 CONTINUE
    4 IF(IWT(2).NE.0)IWTCUR=JWT
      IFRAME=1
      RETURN
      END
      SUBROUTINE FR_LOGDRX(Y,X1,X2,DEXPS,DEXPM,DEXPL,IAX,ILAB)
C
C       DRAWS X-AXIS, TICK MARKS AND NUMBERS FOR A LOG PLOT
C
      DIMENSION TIKS(8)
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY/PLTDAT/DUM(10),IWTCUR
      COMMON/FR_HTS/HTL,HTN/FR_WTS/IWT(4)/FR_TIKS/TIKK(3),TIKL
      DATA NTIK,TIKS/8,.301003,.4771213,.60206,.69897,.7781513,
     *                 .845098,.90309,.9542425/
C
      CINCH(DUMX,DOR,DINCH)=(DUMX-DOR)*DINCH
      NLAB=2
      NDEC=0
      CALL FR_LINDRX(Y,X1,X2,DEXPS,DEXPM,DEXPL,IAX,ILAB,NLAB,NDEC)
      IF(ABS(DEXPM).NE.1.) RETURN
      IF(ABS(DINCHX).LE..5) RETURN
C
C      ADD MARKERS FOR INTEGERS
C
      DS=1.
      IF(IAX.EQ.2) DS=-DS
      SAX=CINCH(Y,YBOT,DINCHY)
      STIK=SAX+DS*TIKL
      XA=X1
      XB=X2
      IF(XB.GT.XA) GO TO 1
      XA=X2
      XB=X1
    1 CALL FR_LINFNC(XA,XB,1.,1,FEXP,NEXP)
      FEXP=FEXP-1.
      NEXP=NEXP+1
      IF(IWT(1).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(1)
      END IF
      DO 3 I=1,NEXP
      DO 2 J=1,NTIK
      EXP=FEXP+TIKS(J)
      IF(EXP.LT.XA) GO TO 2
      IF(EXP.GT.XB) GO TO 4
      R=CINCH(EXP,XL,DINCHX)
      CALL PLOT(R,SAX,3)
      CALL PLOT(R,STIK,2)
    2 CONTINUE
    3 FEXP=FEXP+1.
    4 CONTINUE
      IF(IWT(1).NE.0)IWTCUR=JWT
      RETURN
      END
      SUBROUTINE FR_LOGDRY(X,Y1,Y2,DEXPS,DEXPM,DEXPL,IAX,ILAB)
C
C       AS FOR LOGDRX, BUT FOR THE Y-AXIS
C
      DIMENSION TIKS(8)
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY/PLTDAT/DUM(10),IWTCUR
      COMMON/FR_HTS/HTL,HTN/FR_WTS/IWT(4)/FR_TIKS/TIKK(3),TIKL
      DATA NTIK,TIKS/8,.301003,.4771213,.60206,.69897,.7781513,
     *                 .845098,.90309,.9542425/
C
      CINCH(DUMX,DOR,DINCH)=(DUMX-DOR)*DINCH
      NLAB=3
      NDEC=0
      CALL FR_LINDRY(X,Y1,Y2,DEXPS,DEXPM,DEXPL,IAX,ILAB,NLAB,NDEC)
      IF(ABS(DEXPM).NE.1.) RETURN
      IF(ABS(DINCHY).LE..5) RETURN
C
C      ADD MARKERS FOR INTEGERS
C
      DR=1.
      IF(IAX.EQ.2) DR=-DR
      RAX=CINCH(X,XL,DINCHX)
      RTIK=RAX+DR*TIKL
      YA=Y1
      YB=Y2
      IF(YB.GT.YA) GO TO 1
      YA=Y2
      YB=Y1
    1 CALL FR_LINFNC(YA,YB,1.,1,FEXP,NEXP)
      FEXP=FEXP-1.
      NEXP=NEXP+1
      IF(IWT(1).NE.0)THEN
        JWT=IWTCUR
        IWTCUR=IWT(1)
      END IF
      DO 3 I=1,NEXP
      DO 2 J=1,NTIK
      EXP=FEXP+TIKS(J)
      IF(EXP.LT.YA) GO TO 2
      IF(EXP.GT.YB) GO TO 4
      S=CINCH(EXP,YBOT,DINCHY)
      CALL PLOT(RAX,S,3)
      CALL PLOT(RTIK,S,2)
    2 CONTINUE
    3 FEXP=FEXP+1.
    4 CONTINUE
      IF(IWT(1).NE.0)IWTCUR=JWT
      RETURN
      END
      SUBROUTINE ENUMBR(XI,YI,HT,FPN,THETA,LL)
C
C     LEAVES XI AND YI UNCHANGED.
C     PLOTS A NUMBER OF THE FORM 7.23(-6).
C
      COMMON/FR_SYMB/ISYM
C
      THETR=0.01745329*THETA
      XINC=COS(THETR)*HT
      YINC=SIN(THETR)*HT
      IF(ISYM.NE.-1)THEN
          XINC=.8571429*XINC
          YINC=.8571429*YINC
      END IF
C
      CALL COMPOZ(FPN,FPNRED,LPOW)
      CALL FR_NUMBR(XI,YI,HT,FPNRED,THETA,LL)
      NSP=LL+2
      IF(FPNRED.LT.0) NSP=NSP+1
      XN=XI+NSP*XINC
      YN=YI+NSP*YINC
      IF(ISYM.EQ.-1)THEN
        CALL SIMBOL(XN,YN,HT,1H(,THETA,1)
      ELSE
        CALL SYMBOL(XN,YN,HT,1H(,THETA,1)
      END IF
      XN=XN+XINC
      YN=YN+YINC
      RLOG=LPOW
      CALL FR_NUMBR(XN,YN,HT,RLOG,THETA,-1)
      NSP=1
      IF(LPOW.LT.0) NSP=NSP+1
      IF(ABS(LPOW).GE.10) NSP=NSP+1
      XN=XN+NSP*XINC
      YN=YN+NSP*YINC
      IF(ISYM.EQ.-1)THEN
        CALL SIMBOL(XN,YN,HT,1H),THETA,1)
      ELSE
        CALL SYMBOL(XN,YN,HT,1H),THETA,1)
      END IF
      RETURN
      END
      SUBROUTINE LOGNUM(XI,YI,HT1,EXP,THETA,LL)
C
C     PLOTS THE NUMBER 10**(EXP)
C     LEAVES XI,YI UNCHANGED.
C     FOR INTEGER VALUES OF THE EXPONENT, SET LL = -1
C
      COMMON/PLTDAT/DUM(10),IWTCUR
      COMMON/FR_SYMB/ISYM/FR_INT/IFRAME/FR_WTS/IWT(4)
C
      IF(ISYM.EQ.-1)THEN
        CALL SIMBOL(XI,YI,HT1,2H10,THETA,2)
        XWIDTH=1.8642857
      ELSE
        CALL SYMBOL(XI,YI,HT1,2H10,THETA,2)
        XWIDTH=1.7142857
      END IF
      HT2=0.53333333*HT1
      THETR=0.01745329*THETA
      SINTH=SIN(THETR)
      COSTH=COS(THETR)
      XE=XI + (XWIDTH*COSTH - 0.7142857*SINTH)*HT1
      YE=YI + (0.7142857*COSTH + XWIDTH*SINTH)*HT1
      IF(IWT(3).NE.0.AND.IFRAME.EQ.1)THEN
        JWT=IWTCUR
        IWTCUR=IWT(3)
      END IF
      JFRAME=IFRAME
      IFRAME=0  ! Don't want centered symbol.
      CALL FR_NUMBR(XE,YE,HT2,EXP,THETA,LL)
      IFRAME=JFRAME
      IF(IWT(3).NE.0.AND.IFRAME.EQ.1)IWTCUR=JWT
      RETURN
      END
      SUBROUTINE PLOTIN(R,S,IPEN)
      COMMON/SCALES/X1,X2,DIX,Y1,Y2,DIY,RLEN,SLEN
      DATA IUP,IDN/3,2/
C
C      MOVES PEN FROM LAST POINT TO NEW POINT, CONNECTING
C      ONLY THAT SEGMENT OF LINE LYING WITHIN BOUNDARIES.
C
      IN=0
      I=2
      J=2
      IF(R.LT.0.)   I=1
      IF(R.GT.RLEN) I=3
      IF(S.LT.0.)   J=1
      IF(S.GT.SLEN) J=3
      K=I+3*(J-1)
      IF(K.EQ.5) IN=1
      IF(IPEN.EQ.IUP) GO TO 99
      RP=R
      SP=S
C      *** BOTH IN ***
      IF(IN+INL.EQ.2) GO TO 98
C      *** BOTH OUT ***
      IF(IN+INL.EQ.0) GO TO 20
C
C      *** 1 IN 1 OUT ***
      IF(IN.EQ.1) GO TO 3
C
C      LAST POINT IN
C
      RIN=RL
      SIN=SL
    2 ROUT=R
      SOUT=S
      IOUT=I
      KOUT=K
      GO TO 5
C
C      CURRENT POINT IN
C
    3 RIN=R
      SIN=S
    4 ROUT=RL
      SOUT=SL
      IOUT=IL
      KOUT=KL
C
C      MOVE FROM RIN,SIN TO ROUT,SOUT
C
    5 CALL PLOT(RIN,SIN,IUP)
      IF(KOUT.EQ.2) GO TO 11
      IF(KOUT.EQ.8) GO TO 12
      IF(KOUT.EQ.6) GO TO 14
      IF(KOUT.EQ.4) GO TO 15
C
C      EXIT THROUGH CORNER SQUARE FIND EXIT SIDE
C
      RP=0.
      IF(IOUT.EQ.3) RP=RLEN
      SP=SIN+(RP-RIN)*(SOUT-SIN)/(ROUT-RIN)
      IF(SP.LT.0.) GO TO 11
      IF(SP.GT.SLEN) GO TO 12
      GO TO 98
C
C     EXIT SIDE KNOWN
C
C      THROUGH BOTTOM
C
   11 SP=0.
      GO TO 13
C
C      THROUGH TOP
C
   12 SP=SLEN
   13 RP=RIN+(SP-SIN)*(ROUT-RIN)/(SOUT-SIN)
      GO TO 98
C
C      THROUGH RIGHT
C
   14 RP=RLEN
      GO TO 16
C
C      THROUGH LEFT
C
   15 RP=0.
   16 SP=SIN+(RP-RIN)*(SOUT-SIN)/(ROUT-RIN)
      GO TO 98
C
C      BOTH POINTS OUT, LOOK FOR INTERSECTION WITH FRAME
C
C      FIRST DISPOSE OF SAME SQUARE, OR SAME OUTSIDE ROW OR COL
C
   20 IF(K.EQ.KL) GO TO 99
      IF(J+JL.EQ.2) GO TO 99
      IF(J+JL.EQ.6) GO TO 99
      IF(I+IL.EQ.2) GO TO 99
      IF(I+IL.EQ.6) GO TO 99
C
C      IS ANY SQUARE ON SIDE
C
      KOUT=KL
      IF(K.EQ.2) GO TO 21
      IF(K.EQ.8) GO TO 22
      IF(K.EQ.6) GO TO 24
      IF(K.EQ.4) GO TO 25
      KOUT=K
      IF(KL.EQ.2) GO TO 21
      IF(KL.EQ.8) GO TO 22
      IF(KL.EQ.6) GO TO 24
      IF(KL.EQ.4) GO TO 25
      GO TO 27
C
C      THROUGH BOTTOM
C
   21 SIN=0.
      GO TO 23
C
C      THROUGH TOP
C
   22 SIN=SLEN
   23 RIN=R+(SIN-S)*(RL-R)/(SL-S)
      IF(RIN.LE.0.) GO TO 99
      IF(RIN.GE.RLEN) GO TO 99
      IF(KOUT.EQ.KL) GO TO 4
      GO TO 2
C
C      THROUGH RIGHT SIDE
C
   24 RIN=RLEN
      GO TO 26
   25 RIN=0.
   26 SIN=S+(RIN-R)*(SL-S)/(RL-R)
      IF(SIN.LE.0.) GO TO 99
      IF(SIN.GE.SLEN) GO TO 99
      IF(KOUT.EQ.KL) GO TO 4
      GO TO 2
C
C      CONNECTS DIAGONAL CORNERS
C
   27 IP=3
      SIN=0.
      RIN=R+(SIN-S)*(RL-R)/(SL-S)
      IF(RIN.GT.RLEN) GO TO 28
      IF(RIN.LT.0.) GO TO 28
      CALL PLOT(RIN,SIN,IP)
      IP=2
   28 SIN=SLEN
      RIN=R+(SIN-S)*(RL-R)/(SL-S)
      IF(RIN.GT.RLEN) GO TO 29
      IF(RIN.LT.0.) GO TO 29
      CALL PLOT(RIN,SIN,IP)
      IF(IP.EQ.2) GO TO 99
      IP=2
   29 RIN=0.
      SIN=S+(RIN-R)*(SL-S)/(RL-R)
      IF(SIN.GT.SLEN) GO TO 30
      IF(SIN.LT.0.) GO TO 30
      CALL PLOT(RIN,SIN,IP)
      IF(IP.EQ.2) GO TO 99
      IP=2
   30 RIN=RLEN
      SIN=S+(RIN-R)*(SL-S)/(RL-R)
      IF(SIN.GT.SLEN) GO TO 99
      IF(SIN.LT.0.) GO TO 99
      CALL PLOT(RIN,SIN,IP)
      GO TO 99
C
C      PLOT TO FINAL SEGMENT THEN TERMINATE ON LAST POINT
C
   98 CALL PLOT(RP,SP,IDN)
   99 CALL PLOT(R,S,IUP)
      RL=R
      SL=S
      IL=I
      JL=J
      KL=K
      INL=IN
      RETURN
      END
      SUBROUTINE DPLOT(R,S,IPEN)
C
C       DRAWS A SETPAT-DEFINED DASHED LINE TO (R,S).
C
      COMMON/DASH/DPATRN(10),DPAT,NPATRN,IPAT,LPEN
      COMMON/FR_BNDS/MODE
      DATA TOL/0.002/
      ENTRY DPLOTIN(R,S,IPEN)
      IF(ABS(IPEN).EQ.3)THEN
          CALL PLOT(R,S,IPEN)
          RETURN
      END IF
      IF(KOUNT.EQ.0)THEN
          KOUNT=1
          IF(DPAT.EQ.0.)CALL SETPAT(0,0,0,0)
      END IF
      CALL LASTP(RL,SL)
      DR=R-RL
      DS=S-SL
      TRAVL=SQRT(DR**2+DS**2)
      IF(TRAVL.GT.1.E6*DPAT)STOP ' WARNING: (D)LINE LENGTH >1.E6*DPAT.'
      IF(TRAVL.EQ.0.)THEN
        DRDL=0.
        DSDL=0.
        GO TO 1
      END IF
      DRDL=DR/TRAVL
      DSDL=DS/TRAVL
    1 DO 2 I=IPAT,NPATRN
      IPLAST=I
      STEP=MIN(TRAVL,DPAT)
      RL=RL+STEP*DRDL
      SL=SL+STEP*DSDL
      IF(MODE.EQ.0)THEN
        CALL PLOT(RL,SL,LPEN)
      ELSE
        CALL PLOTIN(RL,SL,LPEN)
      END IF
      TRAVL=TRAVL-STEP
      IF(TRAVL.LE.TOL) GO TO 4
      DPAT=DPATRN(I+1)
    2 LPEN=5-LPEN
    3 DPAT=DPATRN(1)
      IPAT=1
      LPEN=2
      IF(TRAVL.GT.TOL) GO TO 1
      RETURN
    4 IPAT=IPLAST
      DPAT=DPAT-STEP
      IF(DPAT.GT.TOL) RETURN
      IPAT=IPAT+1
      IF(IPAT.GT.NPATRN) GO TO 3
      DPAT=DPATRN(IPAT)
      LPEN=5-LPEN
      RETURN
      END
      SUBROUTINE LASTP(RL,SL)
C
C      *** ESTABLISH OFFSET OF LAST POINT WRT CURRENT ORIGIN ***
C
      COMMON/FR_BNDS/MODE
      CALL WHERE(RL,SL,SCALE)
      IF(MODE.EQ.0)THEN
          CALL PLOT(0.,0.,3)
      ELSE
          CALL PLOTIN(0.,0.,3)
      END IF
      CALL WHERE(R0,S0,SCALE)
      RL=RL-R0
      SL=SL-S0
      IF(MODE.EQ.0)THEN
          CALL PLOT(RL,SL,3)
      ELSE
          CALL PLOTIN(RL,SL,3)
      END IF
      RETURN
      END
      SUBROUTINE SETPAT(NT1,NB1,NT2,NB2)
C
C       SETS PATTERN OF DASHES FOR DPLOT
C
      COMMON/DASH/DPATRN(10),DPAT,NPATRN,IPAT,LPEN
      DATA BLANK,BLANK0/0.05,.025/
      LPEN=2
      IPAT=1
      NPATRN=4
      DPATRN(1)=NT1*BLANK
      DPATRN(2)=NB1*BLANK
      DPATRN(3)=NT2*BLANK
      DPATRN(4)=NB2*BLANK
      DO 1 I=1,NPATRN
1     IF(DPATRN(I).EQ.0.)DPATRN(I)=BLANK0
      DPAT=DPATRN(1)
      END
      SUBROUTINE SETPATTERN(SOLID1,BLANK1,SOLID2,BLANK2)
C
C       SETS PATTERN OF DASHES FOR DPLOT
C
      DATA BLANK0/.025/
      COMMON/DASH/DPATRN(10),DPAT,NPATRN,IPAT,LPEN
      LPEN=2
      IPAT=1
      NPATRN=4
      DPATRN(1)=SOLID1
      DPATRN(2)=BLANK1
      DPATRN(3)=SOLID2
      DPATRN(4)=BLANK2
      DO 1 I=1,NPATRN
1     IF(DPATRN(I).EQ.0.)DPATRN(I)=BLANK0
      DPAT=DPATRN(1)
      END
      SUBROUTINE SETMOD(I1,I2,I3,I4,I5)
      COMMON/FR_DRAW/MD/FR_BNDS/MB/FR_LABX/MX/FR_LABY/MY/FR_ROTN/MR
      MD=I1
      MB=I2
      MX=I3
      MY=I4
      MR=I5
      END
      SUBROUTINE SETHTS(HT1,HT2)
      COMMON/FR_HTS/HTL,HTN
      HTL=HT1
      HTN=HT2
      END
      SUBROUTINE SETWTS(I1,I2,I3,I4)
      COMMON/FR_WTS/IWT(4)
      IWT(1)=I1
      IWT(2)=I2
      IWT(3)=I3
      IWT(4)=I4
      RETURN
      END
      SUBROUTINE MLINE(XARRAY,YARRAY,N,JTH,JSYMBL,HTSYM)
C
C       PLOTS THE N POINTS YARRAY(XARRAY), WITH IDENTIFYING
C       SYMBOLS, OF HEIGHT |HTSYM|, AT EVERY |JTH|-TH POINT
C       FOR NONZERO JTH.
C       IF JTH = 0, THE POINTS ARE JOINED BY SOLID LINES ONLY.
C       IF JTH > 0, BOTH LINES AND SYMBOLS ARE DRAWN.
C       IF JTH < 0, ONLY THE SYMBOLS ARE DRAWN.
C
C       IF JSYMBL >0 OR =0, THE SYMBOL IS DRAWN BY SUBROUTINE
C       "SYMBOL", REFERENCED BY |JSYMBL|.
C       IF JSYMBL < 0, THE SYMBOL IS A CENTERED "SIMBOL" SYMBOL.
C       DEFINING IASCII = |JSYMBL|, THE FIRST FONT IS OBTAINED
C       FOR IASCII.LE.127, THE SECOND FOR 128.LE.IASCII.LE.223
C       AND THE THIRD FOR IASCII.GE.224, SO, FOR EXAMPLE, 58
C       BECOMES A COLON (":"), 58+96=154 IS AN INTEGRAL SIGN ("@:")
C       AND 58+192=250 IS A GOTHIC "Z" ("%:").
C
C       NO LINES ARE DRAWN OUTSIDE THE BOX PRODUCED BY "FRAME"
C       IF MODE IS NONZERO.
C       IF HTSYM < 0., THE "SIMBOL" SYMBOLS WILL NOT BE CENTERED:
C       THE SYMBOL WILL BE DRAWN WITH THE ARRAY POINT AT THE
C       BOTTOM LEFT-HAND CORNER.
C
      DIMENSION XARRAY(1),YARRAY(1)
      CHARACTER SIM*3
      COMMON/SCALES/ XMINIM,XMAX,DXINCH,YMINIM,YMAX,DYINCH,RLEN,SLEN
      COMMON/FR_BNDS/MODE
      CINCH(X,X0,DXI)=(X-X0)*DXI
      IF(JTH.EQ.0) GO TO 2
      HITE=ABS(HTSYM)
      IF(JSYMBL.LT.0)THEN
        IASCII=-JSYMBL
        IF(IASCII.LE.127)THEN
                NSYM=-2
                SIM='~'//CHAR(IASCII)
        ELSE IF(IASCII.LE.223)THEN
                NSYM=-3
                SIM='~@'//CHAR(IASCII-96)
        ELSE
                NSYM=-3
                SIM='~%'//CHAR(IASCII-192)
        END IF
        IF(HTSYM.LT.0.)NSYM=-NSYM
      END IF
C
C     *** PLOT SYMBOLS ***
C
      INT=ABS(JTH)
      DO 1 I=1,N,INT
      X1=CINCH(XARRAY(I),XMINIM,DXINCH)
      Y1=CINCH(YARRAY(I),YMINIM,DYINCH)
      IF(MODE.NE.0.AND.
     +(X1.LT.0..OR.X1.GT.RLEN.OR.Y1.LT.0..OR.Y1.GT.SLEN))GO TO 1
      IF(JSYMBL.GE.0)THEN
        CALL SYMBOL(X1,Y1,HITE,JSYMBL,0.,-1)
      ELSE
        CALL SIMBOL(X1,Y1,HITE,%REF(SIM),0.,NSYM)
      END IF
1     CONTINUE
      IF(JTH.LT.0) RETURN
C
C      *** PLOT LINE ***
C
    2 X1=CINCH(XARRAY(1),XMINIM,DXINCH)
      Y1=CINCH(YARRAY(1),YMINIM,DYINCH)
      IF(MODE.EQ.0)THEN
        CALL PLOT(X1,Y1,3)
      ELSE
        CALL PLOTIN(X1,Y1,3)
      END IF
      DO 3 I=2,N
      X1=CINCH(XARRAY(I),XMINIM,DXINCH)
      Y1=CINCH(YARRAY(I),YMINIM,DYINCH)
      IF(MODE.EQ.0)THEN
        CALL PLOT(X1,Y1,2)
      ELSE
        CALL PLOTIN(X1,Y1,2)
      END IF
    3 CONTINUE
      RETURN
      END
      SUBROUTINE DLINE(XARRAY,YARRAY,N,JTH,JSYMBL,HTSYM)
C
C       LIKE MLINE, BUT DRAWS A DASHED LINE
C
      DIMENSION XARRAY(1),YARRAY(1)
      CHARACTER SIM*3
      COMMON/SCALES/ XMINIM,XMAX,DXINCH,YMINIM,YMAX,DYINCH,RLEN,SLEN
      COMMON/DASH/DPATRN(10),DPAT,NPATRN,IPAT,LPEN
      COMMON/FR_BNDS/MODE
      CINCH(X,X0,DXI)=(X-X0)*DXI
      IF(JTH.EQ.0) GO TO 2
      HITE=ABS(HTSYM)
      IF(JSYMBL.LT.0)THEN
        IASCII=-JSYMBL
        IF(IASCII.LE.127)THEN
                NSYM=-2
                SIM='~'//CHAR(IASCII)
        ELSE IF(IASCII.LE.223)THEN
                NSYM=-3
                SIM='~@'//CHAR(IASCII-96)
        ELSE
                NSYM=-3
                SIM='~%'//CHAR(IASCII-192)
        END IF
        IF(HTSYM.LT.0.)NSYM=-NSYM
      END IF
C
C     *** PLOT SYMBOLS ***
C
      INT=ABS(JTH)
      DO 1 I=1,N,INT
      X1=CINCH(XARRAY(I),XMINIM,DXINCH)
      Y1=CINCH(YARRAY(I),YMINIM,DYINCH)
      IF(MODE.NE.0.AND.
     +(X1.LT.0..OR.X1.GT.RLEN.OR.Y1.LT.0..OR.Y1.GT.SLEN))GO TO 1
      IF(JSYMBL.GE.0)THEN
        CALL SYMBOL(X1,Y1,HITE,JSYMBL,0.,-1)
      ELSE
        CALL SIMBOL(X1,Y1,HITE,%REF(SIM),0.,NSYM)
      END IF
1     CONTINUE
      IF(JTH.LT.0) RETURN
C
C      *** PLOT LINE ***
C
    2 X1=CINCH(XARRAY(1),XMINIM,DXINCH)
      Y1=CINCH(YARRAY(1),YMINIM,DYINCH)
      IF(MODE.EQ.0)THEN
        CALL PLOT(X1,Y1,3)
      ELSE
        CALL PLOTIN(X1,Y1,3)
      END IF
      DO 3 I=2,N
      X1=CINCH(XARRAY(I),XMINIM,DXINCH)
      Y1=CINCH(YARRAY(I),YMINIM,DYINCH)
    3 CALL DPLOT(X1,Y1,2)
      RETURN
      END
      SUBROUTINE COMPOZ(FPN,FGE1,LPOW)
C
C      DECOMPOSES A FLOATING POINT NUMBER FPN INTO
C      FGE1*10**(LPOW) WHERE: ABS(FGE1) IS .GE. 1
C
      IF(FPN.EQ.0.) GO TO 1
      FABS=ABS(FPN)
      LPOW=ALOG10(FABS)
      FGE1=FPN*10.**(-LPOW)
      IF(ABS(FGE1).GE.1) RETURN
      FGE1=FGE1*10.
      LPOW=LPOW-1
      RETURN
    1 FGE1=0.
      LPOW=0
      END
      SUBROUTINE FR_SPACES(ZTIT,NZTIT)
C
C     CALCULATES THE TRUE LENGTH, NZTIT, OF A CHARACTER STRING, ZTIT.
C     THE LENGTH OF THE STRING IS THE POSITION OF THE CHARACTER BEFORE
C     FIVE BLANKS ARE ENCOUNTERED.
C
      CHARACTER*(*) ZTIT
      CHARACTER*5 SPACE
      SPACE='     '
      NZTIT=INDEX(ZTIT,SPACE)-1
      RETURN
      END
      SUBROUTINE FR_INCHES(X,Y,R,S)
C
C       USER UNITS (X,Y) TO INCHES (R,S)
C
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY
      R=(X-XL)*DINCHX
      S=(Y-YBOT)*DINCHY
      RETURN
      END
      SUBROUTINE FR_USERS(R,S,X,Y)
C
C       INCHES (R,S) TO USER UNITS (X,Y)
C
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY
      X=XL+R/DINCHX
      Y=YBOT+S/DINCHY
      RETURN
      END
      SUBROUTINE ARROW(XTAIL,YTAIL,XHEAD,YHEAD,MODE)
C
C       DRAWS ARROW FROM (X,Y)-TAIL TO (X,Y)-HEAD
C       IF MODE = 0, X AND Y ARE USER UNITS
C       IF MODE = 1, X AND Y ARE IN INCHES
C
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY
      DATA OPEN,PI/.5236,3.141593/
      IF(MODE.EQ.0)THEN
                RTAIL=(XTAIL-XL)*DINCHX
                STAIL=(YTAIL-YBOT)*DINCHY
                DR=(XHEAD-XTAIL)*DINCHX
                DS=(YHEAD-YTAIL)*DINCHY
      ELSE
                RTAIL=XTAIL
                STAIL=YTAIL
                DR=XHEAD-XTAIL
                DS=YHEAD-YTAIL
      END IF
      THETA=ATAN2(DS,DR)
      CALL PLOT(RTAIL,STAIL,3)
      RHD=RTAIL+DR
      SHD=STAIL+DS
      CALL PLOT(RHD,SHD,2)
      ALPHA=THETA+PI-OPEN
      SHAFT=SQRT(DR*DR+DS*DS)
      POINT=.1
      IF(SHAFT.GT.1.)POINT=.15*SHAFT
      IF(SHAFT.LT..5)POINT=AMAX1(.05,.2*SHAFT)
      R=RHD+POINT*COS(ALPHA)
      S=SHD+POINT*SIN(ALPHA)
      CALL PLOT(R,S,2)
      CALL PLOT(RHD,SHD,3)
      ALPHA=ALPHA+2.*OPEN
      R=RHD+POINT*COS(ALPHA)
      S=SHD+POINT*SIN(ALPHA)
      CALL PLOT(R,S,2)
      RETURN
      END
      SUBROUTINE ERRBARS(XC,YC,DX,DY)
C
C       DRAWS ERROR BARS CENTERED ON (XC,YC), OF LENGTH(S)
C       DX AND/OR DY, ALL MEASURED IN USER UNITS
C
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY
      DATA CAP/.07/
      IBOTH=1
      GO TO 10
      ENTRY XERR(XC,YC,DX)
      IBOTH=-1
10    RC=(XC-XL)*DINCHX
      SC=(YC-YBOT)*DINCHY
      DR=DX*DINCHX
C      *** HORIZONTAL BAR ***
      CALL PLOT(RC-DR,SC,3)
      CALL PLOT(RC+DR,SC,2)
      R=RC-DR
      CALL PLOT(R,SC-CAP,3)
      CALL PLOT(R,SC+CAP,2)
      R=RC+DR
      CALL PLOT(R,SC-CAP,3)
      CALL PLOT(R,SC+CAP,2)
      IF(IBOTH.LT.0)RETURN
      GO TO 20
      ENTRY YERR(XC,YC,DY)
      RC=(XC-XL)*DINCHX
      SC=(YC-YBOT)*DINCHY
20    DS=DY*DINCHY
C      *** VERTICAL BARS ***
      CALL PLOT(RC,SC-DS,3)
      CALL PLOT(RC,SC+DS,2)
      S=SC-DS
      CALL PLOT(RC-CAP,S,3)
      CALL PLOT(RC+CAP,S,2)
      S=SC+DS
      CALL PLOT(RC-CAP,S,3)
      CALL PLOT(RC+CAP,S,2)
      RETURN
      END
      SUBROUTINE AXES(YAX,XAX,ID)
C
C     THIS ROUTINE DRAWS THE X-AXIS (Y=YAX) AND/OR THE Y-AXIS (X=XAX).
C     IT WILL NOT DRAW EITHER AXIS OUTSIDE THE BOUNDARIES DEFINED BY
C     'FRAME'.  AXIS IS DASHED FOR -VE ID.
C
      DIMENSION XA(2),YA(2)
      COMMON/SCALES/XL,XR,DINCHX,YBOT,YTOP,DINCHY
      IBOTH=1
      GO TO 10
      ENTRY XAXIS(YAX,ID)
      IBOTH=-1
10    IF(SIGN(1.,(YBOT-YAX)).EQ.SIGN(1.,(YTOP-YAX)))GO TO 20
      XA(1)=XL
      YA(1)=YAX
      XA(2)=XR
      YA(2)=YAX
      IF(ID.GE.0)CALL MLINE(XA,YA,2,0,0,0.)
      IF(ID.LT.0)CALL DLINE(XA,YA,2,0,0,0.)
20    IF(IBOTH.LT.0)RETURN
      GO TO 25
      ENTRY YAXIS(XAX,ID)
25    IF(SIGN(1.,(XL-XAX)).EQ.SIGN(1.,(XR-XAX)))GO TO 30
      XA(1)=XAX
      YA(1)=YBOT
      XA(2)=XAX
      YA(2)=YTOP
      IF(ID.GE.0)CALL MLINE(XA,YA,2,0,0,0.)
      IF(ID.LT.0)CALL DLINE(XA,YA,2,0,0,0.)
30    RETURN
      END
      SUBROUTINE SMLINE(X,Y,N,JTH,JSYMBOL,HTSYM,RES)
C*****   DRAWS A CURVE THROUGH THE POINTS DEFINED BY
C*****   THE ARRAYS X(I) AND Y(I), I=1,N, MUCH IN
C*****   THE SAME FASHION AS THE MACPAK ROUTINE MLINE (OR DLINE
C*****   IF THE ENTRY SDLINE IS USED).  THE DIFFERENCE IS THAT,
C*****   FOR N.GT.2, INSTEAD OF STRAIGHT LINES BETWEEN THE GIVEN POINTS,
C*****   A PARABOLIC FIT (N.EQ.2) OR A CUBIC SPLINE FIT (N.GE.3)
C*****   IS USED TO OBTAIN A FINER GRID OF POINTS SEPARATED BY A
C*****   "RESOLUTION" SCALE RES (IN INCHES), AND STRAIGHT LINES ARE
C*****   DRAWN BETWEEN THESE.  FOR RES SUFFICIENTLY SMALL THE
C*****   APPEARANCE OF THE CURVE IS MUCH SMOOTHER.  (IN EACH
C*****   INTERVAL THE VALUE OF RES IS ALTERED SLIGHTLY TO
C*****   MAKE THE SUBDIVISIONS EQUAL.)  THE DIMENSION
C*****   OF THE ARRAYS YPP AND H MUST BE AT LEAST AS LARGE AS N.
C*****   WRITTEN BY G. RYBICKI 28 JUNE 1983.
      LOGICAL IDOT,IIN
      DIMENSION X(N),Y(N)
      DIMENSION YPP(1000),H(1000)
      COMMON /SCALES/ XL,XR,DINCHX,YBOT,YTOP,DINCHY,RLEN,SLEN
      COMMON /FR_BNDS/ MODE
      COMMON /G_PLT/ IDOT,IIN
C*****   SET IDOT ACCORDING TO ENTRY POINT, SMLINE OR SDLINE
      IDOT=.FALSE.
      GO TO 10
      ENTRY SDLINE(X,Y,N,JTH,JSYMBOL,HTSYM,RES)
      IDOT=.TRUE.
10    CONTINUE
C*****   IF REQUIRED, PLOT SYMBOLS USING MLINE
      IF(JTH.NE.0)THEN
         CALL MLINE(X,Y,N,-1,JSYMBOL,HTSYM)
         IF(JTH.LT.0)RETURN
      END IF
      IIN=MODE.NE.0
      DELX=RES/DINCHX
C*****   SET PEN AT FIRST POINT
      CALL GPLOT(X(1),Y(1),+3)
C*****   FOR N.EQ.1 PLOT SINGLE POINT
      IF(N.EQ.1)THEN
         CALL GPLOT(X(1),Y(1),+2)
         RETURN
      END IF
C*****   FOR N.EQ.2 FIT WITH STRAIGHT LINE
      IF(N.EQ.2)THEN
         CALL GPLOT(X(2),Y(2),+2)
         RETURN
      END IF
C*****   FOR N.EQ.3 FIT WITH PARABOLA
      IF(N.EQ.3)THEN
         M=(X(3)-X(1))/DELX+1. !AN ADJUSTED DELTA-X IS DEFINED TO GIVE
         DX=(X(3)-X(1))/M      !EQUAL SPACING ACROSS INTERVAL
         XX=X(1)
         DO J=1,M
            XX=XX+DX
            YY=POLY(3,XX,X,Y)
            CALL GPLOT(XX,YY,+2)
         END DO
         RETURN
      END IF
C*****   FOR N.GE.4 FIT WITH CUBIC SPLINE
      N3=N-3
C*****   THE FOLLOWING TWO CALLS SET THE SECOND DERIVATIVES OF
C*****   THE SPLINE REPRESENTATION AT THE ENDPOINTS BY MEANS OF
C*****   A CUBIC FIT OF THE FIRST (LAST) FOUR POINTS.
      YPP(1)=DERTWO(X(1),X(1),Y(1))
      YPP(N)=DERTWO(X(N),X(N3),Y(N3))
C*****   THE OTHER SECOND DERIVATIVES OF THE SPLINE ARE NOW COMPUTED
      CALL SPLINE(N,X,Y,YPP,H)
      DO I=2,N
         M=H(I)/DELX+1.   ! AN ADJUSTED DELTA-X IS DEFINED TO GIVE
         DX=H(I)/M        ! EQUAL SPACING ACROSS EACH INTERVAL
         XX=X(I-1)
         XI=X(I)
         HI=H(I)
         HI2=HI*HI/6.
         Y1=Y(I-1)
         Y2=Y(I)
         YPP1=YPP(I-1)
         YPP2=YPP(I)
         DO J=1,M
            XX=XX+DX
            A=(XI-XX)/HI
            B=1.-A
            C=A*(A**2-1.)*HI2
            D=B*(B**2-1.)*HI2
            YY=A*Y1+B*Y2+C*YPP1+D*YPP2
            CALL GPLOT(XX,YY,+2)
         END DO
      END DO
      RETURN
      END
      FUNCTION DERTWO(XX,X,Y)
C*****   FITS A CUBIC POLYNOMIAL TO THE DATA POINTS Y(I) AT ABSCISSAS
C*****   X(I), I=1,4, AND RETURNS THE VALUE OF THE SECOND DERIVATIVE
C*****   AT ABSCISSA XX.
C*****   WRITTEN BY G. RYBICKI 24 JUNE 1983.
      DIMENSION X(4),Y(4)
      DERTWO=0.
      DO I=1,4
         PROD=1.
         SUM=0.
         DO J=1,4
            IF(J.NE.I)THEN
               PROD=PROD*(X(I)-X(J))
               SUM=SUM+(XX-X(J))
            END IF
         END DO
         DERTWO=DERTWO+2.*Y(I)*SUM/PROD
      END DO
      RETURN
      END
      SUBROUTINE SPLINE(N,X,Y,YPP,H)
C     A CUBIC SPLINE APPROXIMATION TO THE FUNCTION Y(XX) IS DETERMINED
C     BY THE VALUES Y(I) AT THE GRID POINTS X(I), I=1,N, AND THE
C     VALUES OF THE SECOND DERIVATIVES AT THE ENDPOINTS YPP(1) AND YPP(N).
C     (HERE  YPP(I)=Y''(I).)  THE SEQUENCE OF GRID POINTS
C     X(I) MUST BE STRICTLY MONOTONIC.  THIS ROUTINE RETURNS
C     THE SECOND DERIVATIVES YPP(I) AT THE GRID POINTS I=2,N-1.
C     IT ALSO RETURNS THE VALUES OF THE GRID DIFFERENCES
C     H(I)=X(I)-X(I-1), I=2,N.  FROM THE VALUES OF Y AND YPP AT
C     EACH END OF AN INTERVAL (X(I-1),X(I)) THE CUBIC REPRESENTATION OF
C     Y(XX) ON THE INTERVAL CAN BE DETERMINED BY MEANS OF THE FORMULA
C
C          Y(XX)=A*Y(I-1)+B*Y(I)+C*YPP(I-1)+D*YPP(I)
C
C     WHERE
C
C          A=(X(I)-XX)/H(I)
C          B=1.-A
C          C=A*(A**2-1.)*H(I)**2/6.
C          D=B*(B**2-1.)*H(I)**2/6.
C
C     WRITTEN BY G. RYBICKI 27 JUNE 1983.
      DIMENSION X(N),Y(N),YPP(N),H(N)
      N1=N-1
      H(1)=0.
      DO I=2,N1
         SIG=(X(I)-X(I-1))/(X(I+1)-X(I-1))
         P=SIG*H(I-1)+2.
         H(I)=(SIG-1.)/P
         YPP(I)=(6.*((Y(I+1)-Y(I))/(X(I+1)-X(I))-(Y(I)-Y(I-1))
     &         /(X(I)-X(I-1)))/(X(I+1)-X(I-1))-SIG*YPP(I-1))/P
      END DO
      DO I=N1,2,-1
         YPP(I)=H(I)*YPP(I+1)+YPP(I)
      END DO
      DO I=2,N
         H(I)=X(I)-X(I-1)
      END DO
      RETURN
      END
      FUNCTION POLY(N,XX,X,Y)
C*****   FITS AN (N-1)TH ORDER POLYNOMIAL TO THE DATA POINTS Y(I) AT
C*****   ABSCISSAS X(I), I=1,N, AND RETURNS THE VALUE OF THE
C*****   POLYNOMIAL AT ABSCISSA XX.
C*****   WRITTEN BY G. RYBICKI 24 JUNE 1983.
      DIMENSION X(N),Y(N)
      POLY=0.
      DO I=1,N
         PROD=1.
         DO J=1,N
            IF(J.NE.I)THEN
               PROD=PROD*(XX-X(J))/(X(I)-X(J))
            END IF
         END DO
         POLY=POLY+Y(I)*PROD
      END DO
      RETURN
      END
      SUBROUTINE GPLOT(X,Y,IPEN)
C*****   GENERAL PLOT ROUTINE THAT USES THE ROUTINES
C*****
C*****         PLOT, PLOTIN, DPLOT, OR DPLOTIN
C*****
C*****   ACCORDING TO THE MODE SWITCHES IIN AND IDOT, TRANSFERED
C*****   THROUGH THE COMMON /G_PLT/.  X AND Y ARE GIVEN IN
C*****   USER UNITS, WITH SCALING INFORMATION TRANSFERED THROUGH
C*****   THE COMMON /SCALES/.
C*****   WRITTEN BY G. RYBICKI 29 JUNE 1983.
      LOGICAL IDOT,IIN
      COMMON /G_PLT/ IDOT,IIN
      COMMON /SCALES/ XL,XR,DINCHX,YBOT,YTOP,DINCHY,RLEN,SLEN
      R=(X-XL)*DINCHX
      S=(Y-YBOT)*DINCHY
      IF(IDOT)THEN       !USE DOTTED-LINE PLOTTING ROUTINES
         IF(IIN)THEN
            CALL DPLOTIN(R,S,IPEN)    ! HERE AND BELOW USE -IN
         ELSE                         ! ROUTINES IF IIN IS .TRUE.
            CALL DPLOT(R,S,IPEN)
         END IF
      ELSE               !USE SOLID-LINE PLOTTING ROUTINES
         IF(IIN)THEN
            CALL PLOTIN(R,S,IPEN)
         ELSE
            CALL PLOT(R,S,IPEN)
         END IF
      END IF
      RETURN
      END
        SUBROUTINE CONTOR (A,M,N,V,IV,XMIN,XMAX,YMIN,YMAX)
        REAL V(IV),A(M,N)
        MM=M-1
        NN=N-1
        DELTX=(XMAX-XMIN)/FLOAT(MM)
        DELTY=(YMAX-YMIN)/FLOAT(NN)
        Y=YMIN
        DO 1 J=1,NN
        X=XMIN
        DO 2 I=1,MM
        V1=A(I,J)
        V2=A(I+1,J)
        V3=A(I,J+1)
        V4=A(I+1,J+1)
        DO 3 K=1,IV
        VAL=V(K)
        IF (VAL.LT.-1.E10) GO TO 3
        ICASE=1
        IF (VAL.GT.V1) ICASE=ICASE+1
        IF (VAL.GT.V2) ICASE=ICASE+2
        IF (VAL.GT.V3) ICASE=ICASE+4
        IF (VAL.GT.V4) ICASE=9-ICASE
        GO TO (3,4,5,6,7,8,9,10),ICASE
4       X0=X+DELTX*(VAL-V1)/(V2-V1)
        Y0=Y
        X1=X
        Y1=Y+DELTY*(VAL-V1)/(V3-V1)
        GO TO 11
5       X0=X+DELTX*(VAL-V1)/(V2-V1)
        Y0=Y
        X1=X+DELTX
        Y1=Y+DELTY*(VAL-V2)/(V4-V2)
        GO TO 11
6       X0=X
        Y0=Y+DELTY*(VAL-V1)/(V3-V1)
        X1=X+DELTX
        Y1=Y+DELTY*(VAL-V2)/(V4-V2)
        GO TO 11
7       X0=X
        Y0=Y+DELTY*(VAL-V1)/(V3-V1)
        X1=X+DELTX*(VAL-V3)/(V4-V3)
        Y1=Y+DELTY
        GO TO 11
8       X0=X+DELTX*(VAL-V1)/(V2-V1)
        Y0=Y
        X1=X+DELTX*(VAL-V3)/(V4-V3)
        Y1=Y+DELTY
        GO TO 11
9       X0=X+DELTX*(VAL-V1)/(V2-V1)
        Y0=Y
        X1=X
        Y1=Y+DELTY*(VAL-V1)/(V3-V1)
        CALL JUMP TO (X0,Y0)
        CALL LINE TO (X1,Y1)
10      X0=X+DELTX*(VAL-V3)/(V4-V3)
        Y0=Y+DELTY
        X1=X+DELTX
        Y1=Y+DELTY*(VAL-V2)/(V4-V2)
11      CALL JUMP TO (X0,Y0)
        CALL LINE TO (X1,Y1)
3       CONTINUE
        X=X+DELTX
2       CONTINUE
        Y=Y+DELTY
1       CONTINUE
        RETURN
        END
        SUBROUTINE PLT3D(A,M,N,X,Y,L,ALT,AZ,XLEN,XOFF,YLEN,YOFF,
     +          ZFAC,ZOFF,IER)
C---    3D PLOT ROUTINE, ADAPTED FROM SAS-3 ROUTINE OF SAME NAME
C
C       A       - REAL DATA ARRAY, REPRESENTS HEIGHT OF SURFACE AS
C                 FUNCTION OF LOCATION IN PLANE
C       M,N     - DIMENSIONS OF DATA ARRAY A
C       X,Y     - REAL WORK ARRAYS
C       L       - LENGTH OF WORK ARRAYS, .GE. 2*MIN(M,N)
C       ALT,AZ  - ALTITUDE,AZIMUTH VIEWING ANGLES IN DEGREES
C       XLEN,YLEN - LENGTH OF UNPROJECTED X,Y AXES IN INCHES
C       XOFF,YOFF - OFFSET OF ORIGIN IN INCHES
C       ZFAC   - SCALING OF Z-AXIS FROM DATA UNITS TO UNPROJECTED INCHES
C       ZOFF    - OFFSET OF Z-ORIGIN IN INCHES
C       IER     - RETURNS 0 FOR NO ERROR
        COMMON /PLT3B/ A1,A2,A3,B1,B2,B3,B4
        DIMENSION A(M,N),X(L),Y(L)
        LMAX=2*MIN0(M,N)
        IF(L .LT. LMAX) GO TO 500
        TAZ=AZ*0.0174532925
        TALT=ALT*0.0174532925
        SAZ=SIN(TAZ)
        CAZ=COS(TAZ)
        SAL=SIN(TALT)
        CAL=COS(TALT)
        XSC=XLEN/FLOAT(N-1)
        YSC=YLEN/FLOAT(M-1)
        A1=CAZ*XSC
        A2=-SAZ*YSC
        A3=XOFF-0.5*(A1*FLOAT(N+1)+A2*FLOAT(M+1))
        B1=SAZ*SAL*XSC
        B2=CAZ*SAL*YSC
        B3=ZFAC*CAL
        B4=B3*ZOFF+YOFF-0.5*(B1*FLOAT(N+1)+B2*FLOAT(M+1))
        IAZ=1
        IF(A1 .LE. 0.0) IAZ=IAZ+1
        IF(A2 .LE. 0.0) IAZ=IAZ+2
        GO TO (10,20,10,20),IAZ
 10     IFIRST=1
        ISTEP=1
        ILAST=M
        GO TO 30
 20     IFIRST=M
        ISTEP=-1
        ILAST=1
 30     GO TO (50,50,40,40),IAZ
 40     JFIRST=1
        JSTEP=1
        JLAST=N
        GO TO 60
 50     JFIRST=N
        JSTEP=-1
        JLAST=1
 60     GO TO (64,62,62,64),IAZ
 62     LLI=1
        GO TO 66
 64     LLI=-1
 66     IC=0
        IBEG=IFIRST+ISTEP
 70     LNTH=MIN0(2*IABS(IBEG-IFIRST)+1,LMAX)
        IF(LLI .EQ. -1) GO TO 72
        LL=0
        GO TO 74
 72     LL=LNTH+1
 74     I=IBEG
        J=JFIRST
        XX=FLOAT(J)
        YY=FLOAT(I)
        LL=LL+LLI
        X(LL)=A1*XX+A2*YY+A3
        Y(LL)=B1*XX+B2*YY+B3*(A(I,J)+ZOFF)+B4
 80     I=I-ISTEP
        YY=FLOAT(I)
        LL=LL+LLI
        X(LL)=A1*XX+A2*YY+A3
        Y(LL)=B1*XX+B2*YY+B3*(A(I,J)+ZOFF)+B4
        IF(J .EQ. JLAST) GO TO 85
        J=J+JSTEP
        XX=FLOAT(J)
        LL=LL+LLI
        X(LL)=A1*XX+A2*YY+A3
        Y(LL)=B1*XX+B2*YY+B3*(A(I,J)+ZOFF)+B4
        IF(I .NE. IFIRST) GO TO 80
 85     CALL NXTVU(IC,X,Y,LNTH,IER)
        IF(IER .NE. 0) RETURN
        IC=1
        IF(IBEG .EQ. ILAST) GO TO 90
        IBEG=IBEG+ISTEP
        GO TO 70
 90     JBEG=JFIRST
 100    LNTH=MIN0(2*IABS(JBEG-JLAST)+1,LMAX)
        IF (LLI.EQ.-1) GO TO 102
        LL=0
        GO TO 104
 102    LL=LNTH+1
 104    I=ILAST
        J=JBEG
        XX=FLOAT(J)
        YY=FLOAT(I)
        LL=LL+LLI
        X(LL)=A1*XX+A2*YY+A3
        Y(LL)=B1*XX+B2*YY+B3*(A(I,J)+ZOFF)+B4
 110    J=J+JSTEP
        XX=FLOAT(J)
        LL=LL+LLI
        X(LL)=A1*XX+A2*YY+A3
        Y(LL)=B1*XX+B2*YY+B3*(A(I,J)+ZOFF)+B4
        IF(I .EQ. IFIRST) GO TO 120
        I=I-ISTEP
        YY=FLOAT(I)
        LL=LL+LLI
        X(LL)=A1*XX+A2*YY+A3
        Y(LL)=B1*XX+B2*YY+B3*(A(I,J)+ZOFF)+B4
        IF(J .NE. JLAST) GO TO 110
 120    CALL NXTVU(1,X,Y,LNTH,IER)
        IF(IER .NE. 0) RETURN
        JBEG=JBEG+JSTEP
        IF (JBEG.EQ.JLAST) RETURN
        GO TO 100
 500    IER=2
        RETURN
        END
        SUBROUTINE NXTVU(IC,X,Y,N,IER)
C       PATCH 28MAY88 TO GET PROGRAM TO RUN   DO NO KNOW CORRECT VALUE
C       PARAMETER NN=2000
        PARAMETER NN=10000
        DIMENSION X(N),Y(N)
        COMMON /NXTV1/XX(NN),YY(NN),KK,LL
        IF (IC .NE. 0) GO TO 20
        IF(N .GT. NN) GO TO 500
        LL=NN-N+1
        I=LL
        XX(I)=X(1)
        YY(I)=Y(1)
        CALL PLOT(XX(LL),YY(LL),3)
        DO 10 J=2,N
        I=I+1
        XX(I)=X(J)
        YY(I)=Y(J)
        CALL PLOT(XX(I),YY(I),2)
 10     CONTINUE
        IER=0
        RETURN
 20     IF(IER .NE. 0) RETURN
        II=1
        JJ=LL
        KK=0
        YA0=Y(1)
        YB0=YY(LL)
        IF(X(1)-XX(LL)) 30,30,70
 30     CALL PLOT(X(1),YA0,3)
 40     CALL OUTP(X(II),Y(II),IER)
        IF (II.EQ.N) GO TO 360
        II=II+1
        YA0=Y(II)
        IF(X(II) .GT. XX(LL)) GO TO 50
        CALL PLOT(X(II),YA0,2)
        GO TO 40
 50     II=II-1
        XL=X(II)
        YL=Y(II)
        YA0=ALIN(X(II),X(II+1),Y(II),Y(II+1),XX(LL))
        X0=XX(LL)
        IF(YA0 .GT. YB0) GO TO 90
        CALL PLOT(X0,YA0,2)
        CALL OUTP(X0,YA0)
        CALL OUTP(X0,YB0)
        GO TO 100
 70     CALL OUTP(XX(JJ),YY(JJ),IER)
        IF(JJ .EQ. NN) GO TO 380
        JJ=JJ+1
        YB0=YY(JJ)
        IF(X(1)-XX(JJ)) 80,70,70
 80     JJ=JJ-1
        YB0=ALIN(XX(JJ),XX(JJ+1),YY(JJ),YY(JJ+1),X(1))
        X0=X(1)
        IF(YA0 .LE. YB0) GO TO 100
        CALL OUTP (X0,YB0,IER)
        CALL OUTP(X0,YA0,IER)
        XL=X0
        YL=YA0
 90     IOV0=1
        GO TO 120
 100    IOV0=0
 120    IF(II .EQ. N) GO TO 300
        IF(JJ .EQ. NN) GO TO 310
        IF(X(II+1) .GT. XX(JJ+1)) GO TO 130
        ISW=+1
        II=II+1
        X1=X(II)
        YA1=Y(II)
        YB1=ALIN(XX(JJ),XX(JJ+1),YY(JJ),YY(JJ+1),X1)
        GO TO 140
 130    IF(XX(JJ+1) .GE. X(N)) GO TO 340
        ISW=-1
        JJ=JJ+1
        X1=XX(JJ)
        YA1=ALIN(X(II),X(II+1),Y(II),Y(II+1),X1)
        YB1=YY(JJ)
 140    IF(YA1 .LE. YB1) GO TO 160
        IOV1=1
        IF(IOV0 .EQ. 0) GO TO 170
 150    IF(ISW .EQ. -1) GO TO 200
        CALL OUTP (X1,YA1,IER)
        CALL PLOT(XL,YL,3)
        CALL PLOT(X1,YA1,2)
        XL=X1
        YL=YA1
        GO TO 200
 160    IOV1=0
        IF(IOV0 .EQ. 0) GO TO 190
 170    FRAC=(YB0-YA0)/(YA1-YB1+YB0-YA0)
        XI=(X1-X0)*FRAC+X0
        YI=(YA1-YA0)*FRAC+YA0
        CALL OUTP(XI,YI,IER)
        IF(IOV0 .EQ. 0) GO TO 180
        CALL PLOT(XL,YL,3)
        CALL PLOT(XI,YI,2)
        XL=XI
        YL=YI
        GO TO 190
 180    XL=XI
        YL=YI
        GO TO 150
 190    IF(ISW .EQ. +1) GO TO 200
        CALL OUTP(XX(JJ),YY(JJ),IER)
 200    IF(IER .NE. 0) RETURN
        X0=X1
        YA0=YA1
        YB0=YB1
        IOV0=IOV1
        GO TO 120
 310    X1=XX(NN)
        YA1=ALIN(X(II),X(II+1),Y(II),Y(II+1),X1)
        YB1=YY(NN)
        IF(YA1 .GT. YB1) GO TO 320
        CALL OUTP(X1,YB1,IER)
        CALL OUTP(X1,YA1,IER)
        CALL PLOT(X1,YA1,3)
        GO TO 330
 380    II=1
 320    CALL PLOT(X(II),Y(II),3)
 330    IF(II .EQ. N) GO TO 400
        II=II+1
        CALL OUTP(X(II),Y(II),IER)
        CALL PLOT(X(II),Y(II),2)
        GO TO 330
 300    IF(JJ .EQ. NN) GO TO 400
 340    X1=X(N)
        YA1=Y(N)
        YB1=ALIN(XX(JJ),XX(JJ+1),YY(JJ),YY(JJ+1),X1)
        IF(YA1 .LE. YB1) GO TO 350
        CALL OUTP(X1,YA1,IER)
        CALL OUTP(X1,YB1,IER)
        CALL PLOT(XL,YL,3)
        CALL PLOT (X1,YA1,2)
350     IF (JJ.EQ.NN) GO TO 400
        JJ=JJ+1
        CALL OUTP(XX(JJ),YY(JJ),IER)
        GO TO 350
 360    JJ=0
        GO TO 350
 400    LL=NN-KK+1
        I=LL
        DO 410 J=1,KK
        XX(I)=XX(J)
        YY(I)=YY(J)
        I=I+1
 410    CONTINUE
        RETURN
 500    IER=1
        RETURN
        END
        SUBROUTINE OUTP(X,Y,IER)
C       PATCH 28MAY88 TO GET PROGRAM TO RUN   DO NO KNOW CORRECT VALUE
C       PARAMETER NN=2000,EPS=.001
        PARAMETER NN=10000,EPS=.001
        COMMON /NXTV1/XX(NN),YY(NN),KK,LL
        IF(KK .EQ. 0) GO TO 10
        IF(KK .EQ. LL-1) GO TO 20
        IF(ABS(XX(KK)-X)+ABS(YY(KK)-Y) .LT. EPS) RETURN
10      KK=KK+1
        XX(KK)=X
        YY(KK)=Y
        RETURN
20      IER=1
        RETURN
        END
        FUNCTION ALIN(X0,X1,Y0,Y1,X)
        IF(X0 .EQ. X1) GO TO 10
        ALIN=(X-X0)*(Y1-Y0)/(X1-X0)+Y0
        RETURN
10      IF(Y1 .GT. Y0) GO TO 20
        ALIN=Y0
        RETURN
20      ALIN=Y1
        RETURN
        END
        SUBROUTINE DIGITAL (A,M,N,ISC,X0,X1,Y0,Y1,MSIZ,NSIZ)
C---    CREATES A DIGITAL MAP OF AN ARRAY
C---    CREATED  12.AUG.80
C                27.MAR.81  FOR PAULPLOT
C---    PARAMETERS
C       A       - DATA ARRAY
C       M,N     - DIMENSIONS OF A TO PLOT
C       ISC     - ICODE FOR NOMBER
C       X0,X1,Y0,Y1 - DELIMETERS OF PLOT
C       MSIZ,NSIZ - DIMENSIONS OF ARRAY A
        REAL*4 A(MSIZ,NSIZ)
        COMMON/FONTC1/OFFX,OFFY,LASTINC,XP,YP,XMAX,XMIN,YMAX,YMIN
        DX=(X1-X0)/M
        DY=(Y1-Y0)/N
        HT=DY/2.
        DO 10 J=1,N
        DO 10 I=1,M
        IL=ALOG10(ABS(A(I,J)))+ISC+1
        IF (A(I,J).LT.0.) IL=IL+1
        H1=.5*DX/IL
        HT=MIN(H1,HT)
10      CONTINUE
        DO 20 J=1,N
        DO 20 I=1,M
        CALL NOMBER (0.,0.,-HT,A(I,J),0.,ISC)
        CALL NOMBER (X0+(I-.5)*DX-.5*(XMAX-XMIN),
     +          Y0+(J-.5)*DY-.5*(YMAX-YMIN)+.05,
     +          HT,A(I,J),0.,ISC)
20      CONTINUE
        RETURN
        END
        SUBROUTINE HEART (X0,Y0,R,T)
        PI=3.1415926
        CT=COS(PI*T/180.)
        ST=SIN(PI*T/180.)
        AX=(180.+28.072487)*PI/180.
C---    RIGHT HUMP
        CALL JUMP TO (X0,Y0)
        DO 5 I=1,100
        A=I*.01*AX
        X=.25*R*(1.-COS(A))
        Y=.25*R*SIN(A)
        XX=X0+X*CT+Y*ST
        YY=Y0+Y*CT-X*ST
5       CALL LINE TO (XX,YY)
        CALL LINE TO (X0-R*ST,Y0-R*CT)
C---    LEFT HUMP
        CALL JUMP TO (X0,Y0)
        DO 10 I=1,100
        A=I*.01*AX
        X=.25*R*(COS(A)-1.)
        Y=.25*R*SIN(A)
        XX=X0+X*CT+Y*ST
        YY=Y0+Y*CT-X*ST
10      CALL LINE TO (XX,YY)
        CALL LINE TO (X0-R*ST,Y0-R*CT)
        RETURN
        END
        SUBROUTINE SPIRAL (R,A,T,I,X,Y)
C---    DRAWS LOGARYTHMIC SPIRALS
C               R       RADIUS OF SPIRAL IN INCHES
C               A       NUMBER OF SPIRALS PER INCH
C               T       ANGLE OF STARTING CURVE (DEGREES CC FROM X-AXIS)
C               I       DIRECTION OF SPIRAL (+1 = CCL, -1 = CL)
C               X,Y     LOCATION OF CENTER
        PI=3.1415926
        C1=.02*PI
        C2=2.*PI*A
        C3=2.*PI*T/360.
        CALL JUMP TO (X,Y)
        DO 10 J=1,100*A*R
        TH=C1*J
        RA=TH/C2
        TH=C3+I*TH
        X1=X+RA*COS(TH)
        Y1=Y+RA*SIN(TH)
10      CALL LINE TO (X1,Y1)
        RETURN
        END
        SUBROUTINE SQUARE (X1,X2,Y1,Y2)
C---    DRAWS BOXES
        CALL JUMP TO (X1,Y1)
        CALL LINE TO (X1,Y2)
        CALL LINE TO (X2,Y2)
        CALL LINE TO (X2,Y1)
        CALL LINE TO (X1,Y1)
        RETURN
        END
        SUBROUTINE SHADE (A,M,N,SC,XMIN,XMAX,YMIN,YMAX,MSIZ,NSIZ)
C---    CREATES COMPLETE CROSS-HATCH DENSITY MAP
C       NOTE:  NEGATIVE CROSS HATCHES ARE CIRCLES
C---    CREATED  11.AUG.80
C---    A       REAL ARRAY OF DATA
C       M,N     SUBSET OF A TO BE PLOTTED
C       SC      SCALE PARAMETER -
C               SC < 0  THEN K = -SC*LN(A)
C               SC = 0  THEN K =  SC*A
C       XMIN,XMAX,YMIN,YMAX    DELINEATES PLOTTING AREA
C       MSIZ,NSIZ   DIMENSIONS OF A
        REAL*4 A(MSIZ,NSIZ)
        DA=0.3490658504
        DX=(XMAX-XMIN)/M
        DY=(YMAX-YMIN)/N
        IF (SC) 10,30,20
10      SCX=ABS(SC)
        Y=YMIN-DY/2.
        YP=YMIN
        YM=YMIN-DY
        DO 19 J=1,N
        Y=Y+DY
        YP=YP+DY
        YM=YM+DY
        X=XMIN-DX/2.
        XP=XMIN
        XM=XMIN-DX
        DO 19 I=1,M
        X=X+DX
        XP=XP+DX
        XM=XM+DX
        K=NINT(SCX*ALOG(A(I,J)))
        IF (K) 15,19,11
11      DDX=DX/(K+1.)
        DDY=DY/(K+1.)
        DO 14 KK=1,K
        XX=XM+KK*DDX
        YY=YM+KK*DDY
        CALL JUMP TO (XM,YY)
        CALL LINE TO (XP,YY)
        CALL JUMP TO (XX,YM)
14      CALL LINE TO (XX,YP)
        GO TO 19
15      DDX=.5*DX/(-K+1.)
        DDY=.5*DY/(-K+1.)
        DO 17 KK=1,-K
        CALL JUMP TO (X,Y+KK*DDY)
        DO 17 KKK=1,18
        XX=X+KK*DDX*SIN(KKK*DA)
        YY=Y+KK*DDY*COS(KKK*DA)
17      CALL LINE TO (XX,YY)
19      CONTINUE
        GO TO 30
20      Y=YMIN-DY/2.
        YP=YMIN
        YM=YMIN-DY
        DO 29 J=1,N
        Y=Y+DY
        YP=YP+DY
        YM=YM+DY
        X=XMIN-DX/2.
        XP=XMIN
        XM=XMIN-DX
        DO 29 I=1,M
        X=X+DX
        XP=XP+DX
        XM=XM+DX
        K=NINT(SC*A(I,J))
        IF (K) 25,29,21
21      DDX=DX/(K+1.)
        DDY=DY/(K+1.)
        DO 24 KK=1,K
        XX=XM+KK*DDX
        YY=YM+KK*DDY
        CALL JUMP TO (XM,YY)
        CALL LINE TO (XP,YY)
        CALL JUMP TO (XX,YM)
24      CALL LINE TO (XX,YP)
        GO TO 29
25      DDX=.5*DX/(-K+1.)
        DDY=.5*DY/(-K+1.)
        DO 27 KK=1,-K
        CALL JUMP TO (X,Y+KK*DDY)
        DO 27 KKK=1,18
        XX=X+KK*DDX*SIN(KKK*DA)
        YY=Y+KK*DDY*COS(KKK*DA)
27      CALL LINE TO (XX,YY)
29      CONTINUE
30      RETURN
        END
      SUBROUTINE SOLID(X,Y)
      DATA SCALE/.05/
      ENTRY SOLID SIZE OF (R)
      SCALE=R
      RETURN
C
      ENTRY SOLID BOX AT (X,Y)
      NSOLID=SCALE/.005+.5
      S=SCALE-.005*NSOLID
      DO 1 ISCALE=1,NSOLID
      S=S+.005
      CALL SIZE OF (S)
    1 CALL BOX AT (X,Y)
      CALL DOT AT (X,Y)
      RETURN
C
      ENTRY SOLID DEL AT (X,Y)
      NSOLID=SCALE/.005+.5
      S=SCALE-.005*NSOLID
      DO 2 ISCALE=1,NSOLID
      S=S+.005
      CALL SIZE OF (S)
    2 CALL DEL AT (X,Y)
      CALL DOT AT (X,Y)
      RETURN
C
      ENTRY SOLID TRI AT (X,Y)
      NSOLID=SCALE/.005+.5
      S=SCALE-.005*NSOLID
      DO 3 ISCALE=1,NSOLID
      S=S+.005
      CALL SIZE OF (S)
    3 CALL TRI AT (X,Y)
      CALL DOT AT (X,Y)
      RETURN
C
      ENTRY SOLID CIRC AT (X,Y)
      NSOLID=SCALE/.005+.5
      S=SCALE-.005*NSOLID
      DO 4 ISCALE=1,NSOLID
      S=S+.005
      CALL SIZE OF (S)
    4 CALL CIRC AT (X,Y)
      CALL DOT AT (X,Y)
      RETURN
C
      ENTRY SOLID POINT AT (X,Y)
      NSOLID=SCALE/.005+.5
      S=SCALE-.005*NSOLID
      DO 5 ISCALE=1,NSOLID
      S=S+.005
      CALL SIZE OF (S)
    5 CALL POINT AT (X,Y)
      CALL DOT AT (X,Y)
      RETURN
C
      ENTRY SOLID DIME AT (X,Y)
      NSOLID=SCALE/.005+.5
      S=SCALE-.005*NSOLID
      DO 6 ISCALE=1,NSOLID
      S=S+.005
      CALL SIZE OF (S)
    6 CALL DIME AT (X,Y)
      CALL DOT AT (X,Y)
      RETURN
      END
      SUBROUTINE DOTLINE(X1,Y1,X2,Y2,MASK)
C     PRODUCES VECTORS FOR A DOTTED OR DASHED LINE USING A 16 BIT MASK.
C     IN THE X OR Y DIRECTION THE PATTERN IS EXACT, BUT ON A DIAGONAL YOU
C     MUST EXPERIMENT BECAUSE OF THE VARIABLE BIT SPACING.  SEE WRITEUP
C     FOR SUBROUTINE GRID IN THE VERSAPLOT MANUAL FOR SAMPLE MASKS.
C
      DIAG=SQRT((X2-X1)**2+(Y2-Y1)**2)
      DELTAX=.005*(X2-X1)/DIAG
      DELTAY=.005*(Y2-Y1)/DIAG
      CALL JUMP TO (X1,Y1)
      X=X1-DELTAX
      Y=Y1-DELTAY
      IBITOLD=0
      DO 1 J=1,1000000
      DO 1 I=1,16
      X=X+DELTAX
      Y=Y+DELTAY
      IF(DELTAX.LT.0)X=AMAX1(X,X2)
      IF(DELTAX.GT.0)X=AMIN1(X,X2)
      IF(DELTAY.LT.0)Y=AMAX1(Y,Y2)
      IF(DELTAY.GT.0)Y=AMIN1(Y,Y2)
      IBIT=IBITS(MASK,16-I,1)
      IF(IBIT.EQ.IBITOLD)GO TO 1
      IBITOLD=IBIT
      IF(IBIT.EQ.1)CALL JUMP TO (X,Y)
      IF(IBIT.EQ.0)CALL LINE TO (X,Y)
      IF(X.EQ.X2.AND.Y.EQ.Y2)RETURN
    1 CONTINUE
      CALL FATAL
      END
      SUBROUTINE TRANSLATE_LOGICAL(LOGICAL_NAME,EQUIVALENCE_NAME,
     1 LEN_EQUIVALENCE_NAME_OUT)
C
      IMPLICIT INTEGER*4 (A-Z)
      INTEGER*2 SCR_LEN(2)
      CHARACTER*(*) LOGICAL_NAME,EQUIVALENCE_NAME
      CHARACTER*63  SCRATCH(2)
      PARAMETER (SS$_NORMAL     ='0001'X)
      PARAMETER (SS$_NOTRAN     ='0629'X)
C
      LEN_LOGICAL_NAME=LEN(LOGICAL_NAME)
      IF(LEN_LOGICAL_NAME.GT.63)CALL FATAL
      LEN_EQUIVALENCE_NAME_IN=LEN(EQUIVALENCE_NAME)
      IF(LEN_EQUIVALENCE_NAME_IN.LT.63)CALL FATAL
      SCRATCH(1)=LOGICAL_NAME
      SCR_LEN(1)=N_CHARS(LOGICAL_NAME)
      DO I=1,11
      IN=MOD(I-1,2)+1
      OUT=MOD(I,2)+1
      SCRATCH(OUT)(1:1)=' '
      K=SYS$TRNLOG(SCRATCH(IN)(1:SCR_LEN(IN)),
     1 LEN_EQUIVALENCE_NAME_OUT,SCRATCH(OUT),,,)
      IF(K.EQ.SS$_NOTRAN.OR.SCRATCH(OUT)(1:2).EQ.'__')THEN
      EQUIVALENCE_NAME=SCRATCH(OUT)(1:LEN_EQUIVALENCE_NAME_OUT)
      RETURN
      ENDIF
      IF(K.NE.SS$_NORMAL)CALL FATAL
      KK=LEN_EQUIVALENCE_NAME_OUT
      IF(SCRATCH(OUT)(KK:KK).EQ.':'.AND.
     1 SCRATCH(OUT)(KK-1:KK-1).NE.':')LEN_EQUIVALENCE_NAME_OUT=KK-1
      SCR_LEN(OUT)=LEN_EQUIVALENCE_NAME_OUT
      ENDDO
      CALL FATAL
      END        ! TRANSLATE_LOGICAL
      CHARACTER*9 FUNCTION UNIQUE_FILE_NAME()
      IMPLICIT INTEGER*4 (A-Z)
      CHARACTER FILE_NAME*9
      INTEGER*4 SYS_TIME_LONG(2)
      REAL*8 CODE_QUAD,SCRATCH_1,SCRATCH_2,SYS_TIME_LOW,SYS_TIME_HIGH
      PARAMETER (SS$_NORMAL     ='0001'X)
C
      IF(SYS$GETTIM(SYS_TIME_LONG).NE.SS$_NORMAL)CALL FATAL
      SYS_TIME_LOW =DBLE(ISHFT(SYS_TIME_LONG(1),-16).AND.'0000FFFF'X)
      SYS_TIME_HIGH=DBLE(      SYS_TIME_LONG(2)     .AND.'003FFFFF'X)
      CODE_QUAD=DBLE(GET_PID().AND.'FF'X)
      CODE_QUAD=CODE_QUAD+2.D0**08*SYS_TIME_LOW
      CODE_QUAD=CODE_QUAD+2.D0**24*SYS_TIME_HIGH
      SCRATCH_1=CODE_QUAD
      DO I=9,1,-1
      SCRATCH_2=DINT(SCRATCH_1/36.D0)
      J=INT(SCRATCH_1-36.D0*SCRATCH_2)
      IF(J.LT.0.OR.J.GT.35)CALL FATAL
      IF(J.LT.10)THEN
      UNIQUE_FILE_NAME(I:I)=CHAR(ICHAR('0')+J)
      ELSE
      UNIQUE_FILE_NAME(I:I)=CHAR(ICHAR('A')+J-10)
      ENDIF
      SCRATCH_1=SCRATCH_2
      ENDDO
      CALL HIBER(0.01)  ! assure uniqueness if called again immediately
      END               ! UNIQUE_FILE_NAME
      FUNCTION N_CHARS(STRING)
      CHARACTER*(*) STRING
      DO 1 N_CHARS=LEN(STRING),1,-1
      ICH=ICHAR(STRING(N_CHARS:N_CHARS))
      IF(ICH.NE.ICHAR(' ').AND.ICH.NE.0)RETURN
    1 CONTINUE
      N_CHARS=0
      RETURN
      END       ! N_CHARS
      SUBROUTINE FATAL
      PARAMETER (SS$_ABORT='002C'X)
      ENTRY ABORT
      CALL LIB$STOP(%VAL(SS$_ABORT))
      END       ! FATAL
      INTEGER*4 FUNCTION GET_PID()
      IMPLICIT INTEGER*4 (A-Z)
      INTEGER*4 LIST_LONG(4)
      INTEGER*2 LIST_WORD(8)
      EQUIVALENCE (LIST_LONG,LIST_WORD)
      LIST_WORD(1)=4
      LIST_WORD(2)='319'X
      LIST_LONG(2)=%LOC(GET_PID)
      LIST_LONG(3)=0
      LIST_LONG(4)=0
      K=SYS$GETJPI(,,,LIST_LONG,,,)
      RETURN
      END    ! GET_PID
      SUBROUTINE HIBER(SECONDS)
      REAL*8 TIMADR
      CHARACTER*16 TIMBUF
      ICSECS=100.*SECONDS+0.5
      IF(ICSECS.LT.1)RETURN
      IDAYS=ICSECS/8640000
      ICSECS=ICSECS-8640000*IDAYS
      IHOURS=ICSECS/360000
      ICSECS=ICSECS-360000*IHOURS
      IMINS=ICSECS/6000
      ICSECS=ICSECS-6000*IMINS
      ISECS=ICSECS/100
      ICSECS=ICSECS-100*ISECS
      WRITE(TIMBUF,1)IDAYS,IHOURS,IMINS,ISECS,ICSECS
    1 FORMAT(I4,I3.2,2(':',I2.2),'.',I2.2)
      CALL SYS$BINTIM(TIMBUF,TIMADR)
      CALL SYS$SCHDWK(,,TIMADR,)
      CALL SYS$HIBER
      RETURN
      END     ! HIBER
      SUBROUTINE STRINGX(STRING,XX,YY)
C     CALLS TO STRINGY PRINT IN THE Y DIRECTION
C     CALLS TO STRINGXi OR STRINGYi PRODUCE STRINGS THAT ARE i TIMES LARGER
C     THAN THE MINIMUM
C     CALLS TO STRINGXN OR STRINGYN PRODUCE STRINGS THAT ARE NSIZE TIMES
C     LARGER THAN THE MINIMUM WHERE NSIZE IS PASSED THROUGH COMMON /STRINGXY/
C     THE CAPITALS ARE 9 X 17 BITS*N.  THE CHARACTER SPACING VARIES WITH
C     NSIZE AND IS GIVEN IN ARRAY NWIDTHN.
C
C     AN @ IN THE STRING SWITCHES THE NEXT CHARACTER TO THE ALTERNATE FONT
C     AN ^ SUPERSCRIPTS THE NEXT CHARACTER
C     AN \ SUBSCRIPTS THE NEXT CHARACTER
C     SUBSCRIPTS AND SUPERSCRIPTS ARE HALF SIZE OR THE NEXT MULTIPLE ABOVE
C     @@ IS @    @^ IS ^   @\ IS \   @` IS '
C     ^@ IS SUPER ALTERNATE
C     \@ IS SUB ALTERNATE
C
C            ORIGIN IS Ff
C        A B C D E F G H I J K L M N O P Q R
C     z  . . . . . . . . . . . . . . . . . . z
C     y  . . . . . . . . . . . . . . . . . . y
C     x  . . . . . . . . . . . . . . . . . . x
C     w  . . . . . . . . . . . . . . . . . . w
C     v  . . . . . 0 . . . . . . . 0 . . . . v
C     u  . . . . . 0 . . . . . . . 0 . . . . u
C     t  . . . . . . 0 . . . . . 0 . . . . . t
C     s  . . . . . . 0 . . . . . 0 . . . . . s
C     r  . . . . . . . 0 . . . 0 . . . . . . r
C     q  . . . . . . . 0 . . . 0 . . . . . . q
C     p  . . . . . . . . 0 . 0 . . . . . . . p
C     o  . . . . . . . . 0 . 0 . . . . . . . o
C     n  . . . . . . . . . 0 . . . . . . . . n
C     m  . . . . . . . . 0 . 0 . . . . . . . m
C     l  . . . . . . . . 0 . 0 . . . . . . . l
C     k  . . . . . . . 0 . . . 0 . . . . . . k
C     j  . . . . . . . 0 . . . 0 . . . . . . j
C     i  . . . . . . 0 . . . . . 0 . . . . . i
C     h  . . . . . . 0 . . . . . 0 . . . . . h
C     g  . . . . . 0 . . . . . . . 0 . . . . g
C     f  . . . . . 0 . . . . . . . 0 . . . . f
C     e  . . . . . . . . . . . . . . . . . . e
C     d  . . . . . . . . . . . . . . . . . . d
C     c  . . . . . . . . . . . . . . . . . . c
C     b  . . . . . . . . . . . . . . . . . . b
C     a  . . . . . . . . . . . . . . . . . . a
C        A B C D E F G H I J K L M N O P Q R
C
C      BYTE STRING(1)
      CHARACTER*(*) STRING
C     XCORNER AND YCORNER RETURN AS THE POSITION OF THE END OF THE STRING
C     OR THE POSITION WHERE ANOTHER STRING WOULD BE ADDED TO CONTINUE
      COMMON /STRINGXY/XCORNER,YCORNER,NSIZE
      DIMENSION NSUBN(20),NWIDTHN(20)
      CHARACTER*1 XVECT,STRINGI
      CHARACTER*60 FONT(95),AFONT(95),FONTS(95,2)
      EQUIVALENCE (FONTS(1,1),FONT(1)),(FONTS(1,2),AFONT(1))
      DATA NSUBN/1,1,2,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10/
      DATA NWIDTHN/15,14,13,13,12,12,11,11,11,11,11,11,11,
     1 11,11,11,11,11,11,11/
C     SET THIS FOR YOUR OUTPUT DEVICE AND PLOTTING SOFTWARE
      DATA BITS_PER_INCH /200./
      DATA FONT/
     2'                                                      blank',
     3'KgJhIgJfKg++JhJh++JjKvIvJj                                 !',
     4'HsHvIvHs++KsKvLvKs                                         "',
     5'GfIv++KfMv++FlNl++FpNp                                     #',
     6'FjGiIhKhMiNjNlMmGoFpFrGsItKtMsNr++JfJv                     $',
     7'FfNvHtHvFvFtHt++NfNhLhLfNf                                 %',
     8'NfHrHtIvKvLtLsKqGmFkFiGgHfIfNk                             &',
     9'JsJvKvJs                                               quote',
     A'LfIhHkHqItLv                                               (',
     1'HfKhLkLqKtHv                                               )',
     2'FkNq++FqNk++JiJs                                           *',
     3'FnNn++JjJr                                                 +',
     4'IdJeJhIhJf                                                 ,',
     5'FnNn                                                       -',
     6'JfJgIgIfJf                                                 .',
     7'FfNv                                                       /',
     8'FkFqGtHuIvKvLuMtNqNkMhLgKfIfHgGhFk                         0',
     9'GfMf++JfJvHt                                               1',
     A'FtGuIvKvMuNsNrMpGjFhFfNf                                   2',
     1'FhGgIfKfMgNiNlMnLoMpNrNsMuKvIvGuFt++HoLo                   3',
     2'LfLvFkNk                                                   4',
     3'FhGgIfKfMgNiNlMnKoFoFvNv                                   5',
     4'FmGnIoKoMnNlNiMgKfIfGgFiFsGuIvKvMuNt                       6',
     5'FtFvNvJf                                                   7',
     6'FiFlGnHoLoMpNrNsMuKvIvGuFsFrGpHo++LoMnNlNiMgKfIfGgFi       8',
     7'FhGgIfKfMgNiNsMuKvIvGuFsFpGnImKmMnNo                       9',
     8'JiJjIjIiJi++JoJpIpIoJo                                     :',
     9'IdJeJgIgJf++JmJnInImJm                                     ;',
     A'NjFnNr                                                     <',
     1'FlNl++FpNp                                                 =',
     2'FjNnFr                                                     >',
     3'JfKgJhIgJf++JgJg++JjJmLnMoNqNsMuKvIvGuFt                   ?',
     4'NfIfGgFiFrGtIvKvMuNsNjMiLjKiIiHjHoIqKrLrLj                 @',
     5'FfFpGsHuIvKvLuMsNpNf++NmFm                                 A',
     6'FfFvKvMuNsNrMpLoMnNlNiMgKfFf++FoLo                         B',
     7'NhMgKfIfGgFiFsGuIvKvMuNt                                   C',
     8'FfFvKvMuNsNiMgKfFf                                         D',
     9'NfFfFvNv++FoLo                                             E',
     A'FfFvNv++FoLo                                               F',
     1'NtMuKvIvGuFsFiGgIfKfMgNiNlKl++NlNf                         G',
     2'FfFv++NfNv++FoNo                                           H',
     3'JfJv++GfMf++GvMv                                           I',
     4'FhGgIfKfMgNiNv                                             J',
     5'FfFv++FlNv++IoNf                                           K',
     6'FvFfNf                                                     L',
     7'FfFvJnNvNf                                                 M',
     8'FfFvNfNv                                                   N',
     9'FiFsGuIvKvMuNsNiMgKfIfGgFi                                 O',
     A'FfFvKvMuNsNrMpKoFo                                         P',
     1'FiFsGuIvKvMuNsNjMhLgJfIfGgFi++JjNf                         Q',
     2'FfFvKvMuNsNrMpKoFo++JoNf                                   R',
     3'FhGgIfKfMgNiNlMnKoIoGpFrFsGuIvKvMuNt                       S',
     4'JfJv++FvNv                                                 T',
     5'FvFiGgIfKfMgNiNv                                           U',
     6'FvJfNv                                                     V',
     7'FvFfJnNfNv                                                 W',
     8'FfNv++FvNf                                                 X',
     9'FvJoJf++JoNv                                               Y',
     A'FvNvFfNf                                                   Z',
     1'LfHfHvLv                                                   [',
     2'FvNf                                                       \',
     3'HfLfLvHv                                                   ]',
     4'FjJrNj                                                     ^',
     5'FdRd                                                       _',
     6'JsIvHvJs                                                   `',
     7'FmGnIoKoMnNmNhMgKfIfGgFhFiHkNl++NhNf                       a',
     8'FfFv++FmGnIoKoMnNlNiMgKfIfGgFh                             b',
     9'NhMgKfIfGgFiFlGnIoKoMnNm                                   c',
     A'NfNv++NmMnKoIoGnFlFiGgIfKfMgNh                             d',
     1'NhMgKfIfGgFiFlGnIoKoMnNmNkFj                               e',
     2'HfHsIuKvMuNt++FoKo                                         f',
     3'FcGbIaKaMbNdNlMnKoIoGnFlFiGgIfKfMgNh                       g',
     4'FfFv++FmGnIoKoMnNlNf                                       h',
     5'JfJoIo++JsJtItIsJs                                         i',
     6'FcGbIaKbLdLoKo++LsKsKtLtLs                                 j',
     7'FfFv++FjNo++JlNf                                           k',
     8'JfJv                                                       l',
     9'FfFo++FmHoIoJmJf++JmLoMoNmNf                               m',
     A'FfFo++FlGnIoKoMnNlNf                                       n',
     1'FiFlGnIoKoMnNlNiMgKfIfGgFi                                 o',
     2'FaFo++FmGnIoKoMnNlNiMgKfIfGgFi                             p',
     3'NaNo++NmMnKoIoGnFlFiGgIfKfMgNh                             q',
     4'FfFo++FmGnIoKoMnNm                                         r',
     5'FhGgIfKfMgNhNiMjKkHkFlFmGnIoKoMnNm                         s',
     6'JfJt++GoMo                                                 t',
     7'FoFiGgIfKfMgNiNo                                           u',
     8'FoJfNo                                                     v',
     9'FoFfJjNfNo                                                 w',
     A'FfNo++FoNf                                                 x',
     1'FoFiGgIfKfMgNh++NoNdMbKaIaGbFc                             y',
     2'FoNoFfNf                                                   z',
     3'LfJgIiIkJmHnJoIqIsJuLv                                     {',
     4'JfJz                                                       |',
     5'HfJgKiKkJmLnJoKqKsJuHv                                     }',
     6'FtGvIvKrMrNt                                               ~'/
C
C     ALTERNATE FONT
      DATA AFONT/
     2'                        1 bit kern, move backward 1 bit   @ ',
     3'JrJj++HlJjLl                                 down arrow   @!',
     4'IsHvIvIs++LsKvLvLs                    left double quote   @"',
     5'FfNfNnFnFf                                          box   @#',
     6'JfJv++HjLj++HrLr                          double dagger   @$',
     7'FfNvHtHvFvFtHt++NfNhLhLfNf++JhJfHfHhJh          per mil   @%',
     8'HgIfKfLgLiHmHoJq++JkLmLoHsHuIvKvLu              article   @&',
     9'JsJvKvJs                                               quote',
     1'FiFkGmInKnMmNkNiMgKfIfGgFi++GgMm++GmMg          circleX   @(',
     1'FiFkGmInKnMmNkNiMgKfIfGgFi++JfJn++FjNj          circle+   @)',
     2'FrNj++FjNr                                        times   @*',
     3'FnNn++JjJr++FjNj                              plusminus   @+',
     4'GnHpJqLpMnLlJkHlGn                        hollow bullit    @,',
     5'FnNn++FrNr++JjJr                              minusplus   @-',
     6'FtFuGvHvIuItHsGsFt                               degree   @.',
     7'FnNn++JpIqJrKqJp++JjIkJlKkJj                     divide   @/',
     8'FhFjGlIlJjJhIfGfFh                                 tiny   @0',
     9'GkHlHf++GfIf                                       tiny   @1',
     A'FkGlIlJkJjFfJf                                     tiny   @2',
     1'FfIfJgJhIiJjJkIlFl++GiIi                           tiny   @3',
     2'IfIlFhJh                                           tiny   @4',
     3'FfIfJgJhIiFiFlJl                                   tiny   @5',
     4'FhGiIiJhJgIfGfFgFkGlIlJk                           tiny   @6',
     5'FkFlJlHf                                           tiny   @7',
     6'FgFhGiFjFkGlIlJkJjIiJhJgIfGfFg++GiIi               tiny   @8',
     7'FgGfIfJgJkIlGlFkFjGiIiJj                           tiny   @9',
     8'FpNpKs++NlFlIi                             double arrow   @:',
     9'JjJr++HpJrLp                                   up arrow   @;',
     A'FnNn++HlFnHp                                 left arrow   @<',
     1'FjNj++FnNn++FrNr                               identity   @=',
     2'FnNn++LlNnLp                                right arrow   @>',
     3'FlNl++FpNp++HhLt                                  not =   @?',
     4'NfIfGgFiFrGtIvKvMuNsNjMiLjKiIiHjHoIqKrLrLj            @   @@',
     5'FfFpGsHuIvJuKvLuMsNpNf++NmFm++KvLwJyHwIv       Angstrom   @A',
     6'EmEoGqHqLkMkOmOoMqLqHkGkEm                     infinity   @B',
     7'NkMkJpIqHqFoFmHkIkJlMqNq                proportionality   @C',
     8'FfJvNfFf                                          Delta   @D',
     9'MnLoJoHnGmGlJkHjGiGhHgJfLfMg++JkKk       script epsilon   @E',
     A'FlFpGrIsKsMrNpNlMjKiIiGjFl++JfJv++HfLf++HvLv        Phi   @F',
     1'FfFvNv                                            Gamma   @G',
     2'HfHv++FrNu++HmJoKoMnNlNf                           hbar   @H',
     3'HfHv++LfLv                              double vertical   @I',
     4'FvNvJfFv                                            del   @J',
     5'FjNr++FvIvJuJtIsJrJqIpFp++GsIs++NhIhMlMf            3/4   @K',
     6'FfJvNf                                           Lambda   @L',
     7'FjNr++GuHvHp++GpIp++JkKlMlNkNjJfNf                  1/2   @M',
     8'FjNr++GuHvHp++GpIp++NhIhMlMf                        1/4   @N',
     9'FiFkGmInKnMmNkNiMgKfIfGgFi++Jj++JiKjJkIjJi   circle-dot   @O',
     A'GfGv++MfMv++EvOv                                     Pi   @P',
     1'FiFsGuIvKvMuNsNiMgKfIfGgFi++HlHp++HnLn++LlLp      Theta   @Q',
     2'FmGmJfNu                                        radical   @R',
     3'NfFfKoFvNv                                        Sigma   @S',
     4'JfJo++FfNf                                perpendicular   @T',
     5'FrGvHvIuJpKuLvMvNr++JfJp++HfLf                  Upsilon   @U',
     6'JfJr++HoLo                                       dagger   @V',
     7'FfHfHgFlFsGuIvKvMuNsNlLgLfNf                      Omega   @W',
     8'FfNf++HoLo++FvNv                                     Xi   @X',
     9'FsGsGmHkIjKjLkMmMsNs++JfJv++HfLf++HvLv              Psi   @Y',
     A'FgGfIgKuMvNvNu                                 integral   @Z',
     1'FjNj++NnFnNr                         less than or equal   @[',
     2'FvNf                                                  \   @\',
     3'FjNj++FnNnFr                      greater than or equal   @]',
     4'FjJrNj                                                ^   @^',
     5'FfRf                                             y line   @_',
     6'JsJvKvJs                             single right quote   @`',
     7'NfLgKnJoIoGnFkFiGgIfJfLhNk                        alpha   @a',
     8'FdIqJsLsNqNpMnLmNjNiMgKfJfHgGh++ImLm               beta   @b',
     9'FdHgMlNo++FoGoHnLeMdNd                              chi   @c',
     A'LoInGmFkFiGgIfKfMgNiNlMnLoJpIqIrJsLt              delta   @d',
     1'MoKoHnGlGiHgKfMf++GkLk                          epsilon   @e',
     2'FiFlGnIoKoMnNlNiMgKfIfGgFi++GcMr                    phi   @f',
     3'FmHoIoJnKlJdJfNo                                  gamma   @g',
     4'FfFjGlInKoLoMnMdNc++FoFj                            eta   @h',
     5'JoJgKfLfLg                                         iota   @i',
     6'NmMnKoIoGnFlFiGgIfKfMgNiNsMuKvIvGuFs       script delta   @j',
     7'FfHo++GjNo++HkLfMfNg                              kappa   @k',
     8'FfJp++FvHvNf                                     lambda   @l',
     9'FoFhGgIfJfLgMiMo++FhFc++NfMgMi                       mu   @m',
     A'FoGoGfIgKhMjNmNo                                     nu   @n',
     9'FiFkGmInKnMmNkNiMgKfIfGgFi                       circle   @o',
     2'FnGoNo++GfHo++LoMf                                   pi   @p',
     3'FkFqGtHuJvLuMtNqNkMhLgJfHgGhFk++FnNn              theta   @q',
     4'GhIfLfMgNiNlMnLoKoInHlFdFb                          rho   @r',
     5'LoMmMiLgJfIfGgFiFkGmHnJoOo                        sigma   @s',
     6'FmHoNo++JfKo                                        tau   @t',
     7'FnGoHoInIlHhHgIfKfMgNjNnMo                      upsilon   @u',
     8'HfJjLqLsKuJvIuHsHqJjKgLfMfNg                script lc L   @v',
     9'HoGnFlFiGgHfIfJhKfLfMgNiNlMnLo++JhJj              omega   @w',
     A'KtJsKrIqHoImGkFiFgHfLeLdKc++NrKr++MmIm               xi   @x',
     1'FnGnHmHhJgLhNo++IcLs                                psi   @y',
     2'IsJrLr++NrLrFkFiHgMeMdKb                           zeta   @z',
     3'LfHnLv                               left angle bracket   @{',
     4'FfFz                                             x line   @|',
     5'HfLnHv                              right angle bracket   @}',
     6'FnGpIpKlMlNn                                    twiddle   @~'/
      ENTRY STRINGX1(STRING,XX,YY)
      NSIZE=1
      GO TO 2
      ENTRY STRINGX2(STRING,XX,YY)
      NSIZE=2
      GO TO 2
      ENTRY STRINGX3(STRING,XX,YY)
      NSIZE=3
      GO TO 2
      ENTRY STRINGX4(STRING,XX,YY)
      NSIZE=4
      GO TO 2
      ENTRY STRINGX5(STRING,XX,YY)
      NSIZE=5
      GO TO 2
      ENTRY STRINGX6(STRING,XX,YY)
      NSIZE=6
      GO TO 2
      ENTRY STRINGX7(STRING,XX,YY)
      NSIZE=7
      GO TO 2
      ENTRY STRINGX8(STRING,XX,YY)
      NSIZE=8
      GO TO 2
      ENTRY STRINGX9(STRING,XX,YY)
      NSIZE=9
      NSUB=4
      GO TO 2
      ENTRY STRINGX10(STRING,XX,YY)
      NSIZE=10
      GO TO 2
      ENTRY STRINGXN(STRING,XX,YY)
C     NSIZE COMES THROUGH COMMON STRINGXY
      GO TO 2
      ENTRY STRINGY(STRING,XX,YY)
      ENTRY STRINGY1(STRING,XX,YY)
      NSIZE=1
      GO TO 12
      ENTRY STRINGY2(STRING,XX,YY)
      NSIZE=2
      GO TO 12
      ENTRY STRINGY3(STRING,XX,YY)
      NSIZE=3
      GO TO 12
      ENTRY STRINGY4(STRING,XX,YY)
      NSIZE=4
      GO TO 12
      ENTRY STRINGY5(STRING,XX,YY)
      NSIZE=5
      GO TO 12
      ENTRY STRINGY6(STRING,XX,YY)
      NSIZE=6
      GO TO 12
      ENTRY STRINGY7(STRING,XX,YY)
      NSIZE=7
      GO TO 12
      ENTRY STRINGY8(STRING,XX,YY)
      NSIZE=8
      GO TO 12
      ENTRY STRINGY9(STRING,XX,YY)
      NSIZE=9
      GO TO 12
      ENTRY STRINGY10(STRING,XX,YY)
      NSIZE=10
      GO TO 12
      ENTRY STRINGYN(STRING,XX,YY)
C     NSIZE COMES THROUGH COMMON STRINGXY
      GO TO 12
   12 ROTXX=0.
      ROTXY=-1.
      ROTYX=1.
      ROTYY=0.
      IFY=1
      GO TO 100
    2 ROTXX=1.
      ROTXY=0.
      ROTYX=0.
      ROTYY=1.
      IFY=0
  100 NBYTES=LEN(STRING)
      IF(NBYTES.EQ.0)RETURN
      XCORNER=XX
      YCORNER=YY
      SIZE=FLOAT(NSIZE)/BITS_PER_INCH
      NSUB=NSUBN(NSIZE)
      WIDTH=NWIDTHN(NSIZE)
      IFONT=1
      IFSUPER=0
      IFSUB=0
      DO 5 I=1,NBYTES
      STRINGI=STRING(I:I)
      IF(IFONT.EQ.2)GO TO 200
      IF(STRINGI.EQ.'@')THEN
      IFONT=2
      GO TO 5
      ENDIF
      IF(STRINGI.EQ.'^')THEN
      IFSUPER=1
      GO TO 5
      ENDIF
      IF(STRINGI.EQ.'\')THEN
      IFSUB=1
      GO TO 5
      ENDIF
  200 N=ICHAR(STRINGI)-31
      IF(N.GT.95.OR.N.LT.1)N=1
      SIZE=FLOAT(NSIZE)/BITS_PER_INCH
      YC=YCORNER
      XC=XCORNER
      IF(IFSUPER.EQ.1)THEN
      SIZE=FLOAT(NSUB)/BITS_PER_INCH
      WIDTH=NWIDTHN(NSUB)
      DEL=FLOAT(20*NSIZE-16*NSUB)/BITS_PER_INCH
      IF(IFY.EQ.0)YC=YCORNER+DEL
      IF(IFY.EQ.1)XC=XCORNER-DEL
      ENDIF
      IF(IFSUB.EQ.1)THEN
      DEL=4.*SIZE
      IF(IFY.EQ.0)YC=YCORNER-DEL
      IF(IFY.EQ.1)XC=XCORNER+DEL
      SIZE=FLOAT(NSUB)/BITS_PER_INCH
      WIDTH=NWIDTHN(NSUB)
      ENDIF
      IF(IFONT.EQ.2.AND.STRINGI.EQ.' ')WIDTH=-1.
      IFJUMP=1
      DO 3 IVECT=1,30
      XVECT=FONTS(N,IFONT)(IVECT*2-1:IVECT*2-1)
      IF(XVECT.EQ.' ')GO TO 4
      IF(XVECT.EQ.'+')THEN
      IFJUMP=1
      GO TO 3
      ENDIF
      IX=ICHAR(XVECT)-70
      IY=ICHAR(FONTS(N,IFONT)(IVECT*2:IVECT*2))-102
      X=XC+(ROTXX*FLOAT(IX)+ROTXY*FLOAT(IY))*SIZE
      Y=YC+(ROTYX*FLOAT(IX)+ROTYY*FLOAT(IY))*SIZE
      IF(IFJUMP.EQ.1)CALL JUMP TO (X,Y)
      IFJUMP=0
      CALL LINE TO (X,Y)
    3 CONTINUE
    4 XCORNER=XCORNER+WIDTH*SIZE*ROTXX
      YCORNER=YCORNER+WIDTH*SIZE*ROTYX
      WIDTH=NWIDTHN(NSIZE)
      IFONT=1
      IFSUPER=0
      IFSUB=0
    5 CONTINUE
      RETURN
C
      END
