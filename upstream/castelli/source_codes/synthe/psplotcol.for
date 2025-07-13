      PROGRAM PSPLOT
C     CONVERTS KURUCZ PLOT FILES TO POSTSCRIPT PLOT FILES
      COMMON /BUFF/BUFFER(512),NBUFF 
      INTEGER*4 X,Y,DX,Y2,PAGE
      REAL*8 PLOTOUT,USERID(2),FILENAME(2),BUFFER
      READ(1)BUFFER
      PLOTOUT=BUFFER(1)
      IF(PLOTOUT.NE.8HPLOTFILE)STOP 'NOT A VAXPLOT FILE'
      USERID(1)=BUFFER(2)
      USERID(2)=BUFFER(3)
      FILENAME(1)=BUFFER(4)
      FILENAME(2)=BUFFER(5)
      PRINT 44,USERID,FILENAME
   44 FORMAT(1H0,A8,A1,A8,A1)
      NBUFF=5
      OPEN(UNIT=2,STATUS='NEW',CARRIAGECONTROL='LIST')
      WRITE(2,'(A)')'%!PS-Adobe'
c      WRITE(2,'(A)')'<< /Pagesize [792 1224] >> setpagedevice'
      WRITE(2,'(A)')'/M /moveto load def'
      WRITE(2,'(A)')'/L /lineto load def'
      WRITE(2,'(A)')'/S /stroke load def'
      WRITE(2,'(A)')'/F {gsave eofill grestore stroke} def'
      WRITE(2,'(A)')'/C /closepath load def'      
      WRITE(2,'(A)')'/G /setgray load def'
      WRITE(2,'(A)')'/W /setlinewidth load def'
c      WRITE(2,'(A)')'.24 .24 scale'
c	0.24*1.5=0.36	 
      WRITE(2,'(A)')'.36 .36 scale' 
c      WRITE(2,'(A)')'.5 W'
c      WRITE(2,'(A)')'4. W'
      WRITE(2,'(A)')'2. W'
      DO 500 PAGE=0,1111
      DO 100 IVECT=1,10000000
      CALL READBUF(X,Y,DX,Y2)
	if(x.lt.0)type*,page,ivect,x,y,dy,y2
C     X = -1 MARKS END OF PAGE
C     X = -2 MARKS END OF PLOT
C     X = -3 MARKS CHANGE OF COLOR
      IF(X.EQ.-1)GO TO 400
      IF(X.EQ.-2)GO TO 600
      IF(X.EQ.-3)THEN
      WRITE(2,80)Y/100.,DX/100.,Y2/100.
80    FORMAT(F5.2,F5.2,F5.2,' setrgbcolor')
      GO TO 100
      ENDIF
      IF(PAGE.EQ.0)GO TO 100
c      WRITE(2,90)X,Y,X+DX,Y2
c      WRITE(2,90)Y,1150+2550-X,Y2,1150+2550-X-DX
c      WRITE(2,90)Y, 3200-X,Y2,3200-X-DX
       WRITE(2,90)Y, 2300-X,Y2,2300-X-DX
   90 FORMAT(2I6,' M',2I6,' L S')
  100 CONTINUE
  400 IF(PAGE.EQ.0)GO TO 500
      WRITE(2,401)
  401 FORMAT('showpage')
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
      READ(1)BUFFER                                                           
      NBUFF=0                                                                  
      RETURN                                                                    
      END                                                                       

