      SUBROUTINE OBSERV                                                         
C     HARVARD ROCKET SPECTRA  KOHL,PARKINSON,KURUCZ                             
      REAL*8 WBEGIN,WEND,W1,W2
      COMMON /PARAMS/IFLABL,IFABSO,IFCONT,IFGRID,IFDLIN,IFLOG,XSCALE,           
     1               RMIN,WEAK,TOP,PANEL,CYCLES,WBEGIN,WEND,W1,W2,YTOP,         
     2               HMAX,HMIN,IFMU,IFCALC,YSCALE,OFFSET                        
      DIMENSION Q(2)                                                            
      REWIND 55                                                                 
C     THERE ARE 357707 DATA POINTS
C     CALL BUFREA(357707,2,1,55)                                                
      ISTART=0                                                                  
      CALL WEIGHT(2)                                                            
      IF(IFMU.GE.2)GO TO 30                                                     
C     CENTER
C     SCAN 1A                                                                   
      DO 14 I=1,30047                                                           
C     Q(1).LT.0 IMPLIES POINT WAS USED TO FIX WAVELENGTH SCALE
C     Q(2).LT.0 IMPLIES POINT IS NOISE
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 14                                                       
      IF(W.GT.W2)GO TO 14                                                       
      IF(W.GT.255.)GO TO 14                                                     
      X=(W-W1)*XSCALE*10.                                                       
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   14 CONTINUE                                                                  
      ISTART=0                                                                  
C     SCAN 1B                                                                   
      DO 16 I=1,61500                                                           
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 16                                                       
      IF(W.GT.W2)GO TO 16                                                       
      IF(W.LT.255.)GO TO 16                                                     
      X=(W-W1)*XSCALE*10.                                                       
C     IF(Q(2).LT.0.)ISTART=0                                                    
C     IF(Q(2).LT.0.)GO TO 16                                                    
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   16 CONTINUE                                                                  
      ISTART=0                                                                  
C     SCAN 2A                                                                   
      DO 24 I=1,29172                                                           
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 24                                                       
      IF(W.GT.W2)GO TO 24                                                       
      IF(W.GT.255.)GO TO 24                                                     
      X=(W-W1)*XSCALE*10.                                                       
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   24 CONTINUE                                                                  
      ISTART=0                                                                  
C     SCAN 2B                                                                   
      DO 26 I=1,60572                                                           
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 26                                                       
      IF(W.GT.W2)GO TO 26                                                       
      IF(W.LT.255.)GO TO 26                                                     
      X=(W-W1)*XSCALE*10.                                                       
C     IF(Q(2).LT.0.)ISTART=0                                                    
C     IF(Q(2).LT.0.)GO TO 26                                                    
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   26 CONTINUE                                                                  
      CALL WEIGHT(1)                                                            
      RETURN                                                                    
C     LIMB
C     SKIP CENTER
   30 DO 31 I=1,181291
   31 READ(55)
C  30 CALL BUFREA(30047,2,3,55)                                                 
C     CALL BUFREA(61500,2,3,55)                                                 
C     CALL BUFREA(29172,2,3,55)                                                 
C     CALL BUFREA(60572,2,3,55)                                                 
      ISTART=0                                                                  
C     SCAN 3A                                                                   
      DO 34 I=1,28687                                                           
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 34                                                       
      IF(W.GT.W2)GO TO 34                                                       
      IF(W.GT.255.)GO TO 34                                                     
      X=(W-W1)*XSCALE*10.                                                       
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   34 CONTINUE                                                                  
      ISTART=0                                                                  
C     SCAN 3B                                                                   
      DO 36 I=1,58100                                                           
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 36                                                       
      IF(W.GT.W2)GO TO 36                                                       
      IF(W.LT.255.)GO TO 36                                                     
      IF(W.GT.306.2)GO TO 36                                                    
      X=(W-W1)*XSCALE*10.                                                       
C     IF(Q(2).LT.0.)ISTART=0                                                    
C     IF(Q(2).LT.0.)GO TO 36                                                    
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   36 CONTINUE                                                                  
      ISTART=0                                                                  
C     SCAN 4A                                                                   
      DO 44 I=1,29112                                                           
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 44                                                       
      IF(W.GT.W2)GO TO 44                                                       
      IF(W.GT.255.)GO TO 44                                                     
      X=(W-W1)*XSCALE*10.                                                       
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   44 CONTINUE                                                                  
      ISTART=0                                                                  
C     SCAN 4B                                                                   
      DO 46 I=1,58517                                                           
      READ(55)Q
C     CALL BUFREA(Q,2,2,55)                                                     
      W=ABS(Q(1))                                                               
      IF(W.LT.W1)GO TO 46                                                       
      IF(W.GT.W2)GO TO 46                                                       
      IF(W.LT.255.)GO TO 46                                                     
      IF(W.GT.312.0)GO TO 46                                                    
      X=(W-W1)*XSCALE*10.                                                       
C     IF(Q(2).LT.0.)ISTART=0                                                    
C     IF(Q(2).LT.0.)GO TO 46                                                    
      S=ABS(Q(2))                                                               
      Y=S/HMAX*3.125*YSCALE                                                     
      IF(ISTART.EQ.0)CALL JUMP TO (X,Y)                                         
      ISTART=1                                                                  
      CALL LINE TO (X,Y)                                                        
   46 CONTINUE                                                                  
      CALL WEIGHT(1)                                                            
      RETURN                                                                    
      END                                                                       
