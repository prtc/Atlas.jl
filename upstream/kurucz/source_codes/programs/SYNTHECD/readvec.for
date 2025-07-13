      PROGRAM READVEC
C     READS A PLOT FILE AND PRINTS THE VECTORS
C
C     THIS PROGRAM CAN BE THE BASIS FOR CONVERTING KURUCZ PLOT FILES
C     TO YOUR SYSTEM.  PAGES ARE MARKED BY X = -1.  INITIALIZE YOUR
C     PLOT PROGRAM.  READ VECTORS AND PLOT THEM WITH YOUR ROUTINES.  
C     WHEN YOU COME TO A -1 FOR X START A NEW PAGE.PAGE 0 IS A HEADER
C     THAT CAN BE SKIPPED.    THE X COORDINATE CAN RUN FROM 0 TO LARGE
C     INTEGERS, BUT IT CAN EASILY BE KEPT BELOW A LIMIT SUCH AS 32000.
C     THE Y COORDINATE RUNS FROM 0 TO 2111. 
C
C
C     IMPLICIT INTEGER*4 (A-Z)
C     MAXIMUM FOR DEFAULT QUOTA
      PARAMETER (MAXVECTORS=370000)
C
C     MAXIMUM FOR 16MB QUOTA
C     PARAMETER (MAXVECTORS=1300000)
      REAL*8 PLOTOUT,USERID(2),FILENAME(2)
      COMMON /BUFF/BUFFER(512),NBUFF 
      REAL*8 BUFFER
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
      DO 500 PAGE=0,1111
      PRINT 66,PAGE
   66 FORMAT(5H1PAGE,I4)
      DO 100 IVECT=1,MAXVECTORS
      CALL READBUF(X,Y,DX,Y2)
C     X = -1 MARKS END OF PAGE
C     Y = -2 MARKS END OF PLOT
      IF(X.EQ.-1)GO TO 500
      IF(X.EQ.-2)GO TO 600
      PRINT 77,IVECT,X,Y,DX,Y2
   77 FORMAT(5I10)
  100 CONTINUE
  500 CONTINUE
  600 CALL EXIT
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
