      PROGRAM MERGEPLOT
C     MERGES TWO PLOT FILES INTO ONE
C     READS FROM UNITS 1 AND 2 AND WRITES TO UNIT 70
      COMMON /BUFF1/BUFFER1(512),NBUFF1 
      COMMON /BUFF2/BUFFER2(512),NBUFF2 
      COMMON /BUFF/BUFFER(512),NBUFF 
      REAL*8 BUFFER1,BUFFER2,BUFFER
      REAL*8 PLOTOUT,USERID(2),FILENAME(2)
      READ(2)BUFFER2
      PLOTOUT=BUFFER2(1)
      IF(PLOTOUT.NE.8HPLOTFILE)STOP 'FOR002 NOT A VAXPLOT FILE'
      READ(1)BUFFER1
      PLOTOUT=BUFFER1(1)
      IF(PLOTOUT.NE.8HPLOTFILE)STOP 'FOR001 NOT A VAXPLOT FILE'
      OPEN(UNIT=70,NAME='PLOT',STATUS='NEW',FORM='UNFORMATTED')
      USERID(1)=BUFFER1(2)
      USERID(2)=BUFFER1(3)
      FILENAME(1)=BUFFER1(4)
      FILENAME(2)=BUFFER1(5)
      BUFFER(1)=PLOTOUT
      BUFFER(2)=USERID(1)
      BUFFER(3)=USERID(2)
      BUFFER(4)=FILENAME(1)
      BUFFER(5)=FILENAME(2)
      NBUFF=5
      NBUFF1=5
      NBUFF2=5
      IX1=0
      IX2=0
      DO 5 IFRAME=1,10000
      DO 1 IVECT=1,10000000
      CALL READBUF1(IX,IY,IDX,IY2)
	IF(IX.LT.0)TYPE*,IFRAME,IVEC,IX,IY,IDX,IY2
      IF(IX.EQ.-1)GO TO 2
      IF(IX.EQ.-2)GO TO 2
C      IF(IX.EQ.-3)GO TO 2
    1 CALL BUFPLT(IX,IY,IDX,IY2)    
    2 IX1=IX 
      DO 3 IVECT=1,10000000
      CALL READBUF2(IX,IY,IDX,IY2)
      IF(IX.EQ.-1)GO TO 4
      IF(IX.EQ.-2)GO TO 4
C      IF(IX.EQ.-3)GO TO 4
      IF(IFRAME.EQ.1)GO TO 3
      CALL BUFPLT(IX,IY,IDX,IY2)
    3 CONTINUE
    4 IX2=IX
      IF(IX2.EQ.-2.AND.IX1.EQ.-2)GO TO 9
      CALL BUFPLT(-1,0,0,0)
    5 CONTINUE
    9 CALL BUFPLT(-2,0,0,0)
      IF(NBUFF.GT.0)WRITE(70)BUFFER 
      CALL EXIT
      END
      SUBROUTINE READBUF1(I,J,K,L)
      COMMON /BUFF1/BUFFER1(4,512),NBUFF1
      INTEGER*2 BUFFER1                     
      NBUFF1=NBUFF1+1                                                           
      I=BUFFER1(1,NBUFF1)                                                      
      J=BUFFER1(2,NBUFF1)                                                      
      K=BUFFER1(3,NBUFF1)                                                      
      L=BUFFER1(4,NBUFF1)                                                      
      IF(I.EQ.-2)NBUFF1=NBUFF1-1
      IF(NBUFF1.LT.512)RETURN                                                   
      READ(1)BUFFER1                                                           
      NBUFF1=0                                                                  
      RETURN                                                                    
      END                                                                       
      SUBROUTINE READBUF2(I,J,K,L)
      COMMON /BUFF2/BUFFER2(4,512),NBUFF2
      INTEGER*2 BUFFER2                     
      NBUFF2=NBUFF2+1                                                           
      I=BUFFER2(1,NBUFF2)                                                      
      J=BUFFER2(2,NBUFF2)                                                      
      K=BUFFER2(3,NBUFF2)                                                      
      L=BUFFER2(4,NBUFF2)                                                      
      IF(I.EQ.-2)NBUFF2=NBUFF2-1
      IF(NBUFF2.LT.512)RETURN                                                   
      READ(2)BUFFER2                                                           
      NBUFF2=0                                                                  
      RETURN                                                                    
      END                                                                       
      SUBROUTINE BUFPLT(I,J,K,L)                                                  
      COMMON /BUFF/BUFFER(4,512),NBUFF                              
      INTEGER*2 BUFFER
      NBUFF=NBUFF+1                                                             
      BUFFER(1,NBUFF)=I                                                       
      BUFFER(2,NBUFF)=J                                                       
      BUFFER(3,NBUFF)=K                                                       
      BUFFER(4,NBUFF)=L                                                       
      IF(NBUFF.LT.512)RETURN                                                    
      WRITE(70)BUFFER                                                       
      NBUFF=0                                                                   
      RETURN                                                                    
      END                                                                       
