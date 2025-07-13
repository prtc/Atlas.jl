      PROGRAM LAPLOT
C     CONVERTS KURUCZ PLOT FILES TO LOS ALAMOS CGS PLOT FILES
      COMMON /PLBUFF/IBUFF(1024)
      COMMON /PLVSCB/IVSCB(300)
      COMMON /BUFF/BUFFER(512),NBUFF 
      INTEGER*4 X,Y,DX,Y2,PAGE
      REAL*8 PLOTOUT,USERID(2),FILENAME(2),BUFFER
      CALL BEGTIME
      READ(70)BUFFER
      PLOTOUT=BUFFER(1)
      IF(PLOTOUT.NE.8HPLOTFILE)STOP 'NOT A VAXPLOT FILE'
      USERID(1)=BUFFER(2)
      USERID(2)=BUFFER(3)
      FILENAME(1)=BUFFER(4)
      FILENAME(2)=BUFFER(5)
      PRINT 44,USERID,FILENAME
   44 FORMAT(1H0,A8,A1,A8,A1)
      NBUFF=5
C     CALL GPLOT(1Hu,11HKURUCZ ESS5,11)
      CALL GSTART
      CALL GPLBEG(IVSCB,IBUFF,1024)
      CALL GFSIZE(IVSCB,'5000000'O)
      CALL GCLASS(IVSCB,1HU)
C      CALL GCLASS(IVSCB,1Hu)
      CALL GTITLE(IVSCB,11HKURUCZ ESS5,11)
      CALL GPLEND(IVSCB)
      CALL GWIND2(0.,32767.,0.,2111.)
      CALL GSCRN2(0.,32767.,0.,2111.)
      DO 500 PAGE=0,1111
      DO 100 IVECT=1,10000000
      CALL READBUF(X,Y,DX,Y2)
C     X = -1 MARKS END OF PAGE
C     Y = -2 MARKS END OF PLOT
      IF(X.EQ.-1)GO TO 400
      IF(X.EQ.-2)GO TO 600
      IF(PAGE.EQ.0)GO TO 100
      CALL GMOVA2(FLOAT(X),FLOAT(Y))
      CALL GLINA2(FLOAT(X+DX),FLOAT(Y2))
  100 CONTINUE
  400 IF(PAGE.GT.0)CALL GPAGE
  500 CONTINUE
  600 CALL GDONE
      CALL ENDTIME
      CALL EXIT
      END
      SUBROUTINE READBUF(I,J,K,L)
      COMMON /BUFF/BUFFER(4,512),NBUFF
      INTEGER*2 BUFFER                     
      NBUFF=NBUFF+1                                                           
      I=BUFFER(1,NBUFF)                                                      
      J=BUFFER(2,NBUFF)                                                      
      K=BUFFER(3,NBUFF)                                                      
      L=BUFFER(4,NBUFF)                                                      
      I30000=K/1000
      K=K-I30000*1000
      I=I+I30000*30000
      IF(NBUFF.LT.512)RETURN                                                   
      READ(70)BUFFER                                                           
      NBUFF=0                                                                  
      RETURN                                                                    
      END                                                                       
