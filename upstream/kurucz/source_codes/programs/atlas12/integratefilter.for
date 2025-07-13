      PROGRAM INTEGRATEFILTER
C     INTEGRATES A FILTER BANDPASS OVER A COMPUTED SPECTRUM FILE
C     READS A ONE LINE HEADER AND WAVELENGTH FILTER PAIRS ON TAPE 5 UNTIL WL=0. 
C     REPEATS UNTIL EOJ
      REAL*4 WLFILTER(100),FILTER(100)
      REAL*4 WLINTERP(300000),FILTERINTERP(300000)
      REAL*8 TEFF,GLOG,TITLE(74),WBEGIN,RESOLU,RATIO,RATIOLG,W1,W2,WEND
      REAL*8 Q2(40)
      REAL*4 SUMQ2FILTER(40),SUMFILTER,FILTERNORM(40),MAG(40)
      READ(7)TEFF,GLOG,TITLE,WBEGIN,RESOLU,NWL,IFSURF,NMU
      RATIO=1+1./RESOLU
      RATIOLG=DLOG(RATIO)
      MU=1
      NMU2=NMU+NMU
      DO 29 IFILTER=1,100
      READ(5,2,END=30)HEADER
    2 FORMAT(A80)
      DO 3 IWL=1,300
      READ(5,*)WLFILTER(IWL),FILTER(IWL)
      IF(WLFILTER(IWL).EQ.0.)GO TO 4
    3 CONTINUE
    4 NFILTER=IWL-1
      W1=WLFILTER(1)
      W2=WLFILTER(NFILTER)
      REWIND 7
      READ(7)
      SUM=0.
      SUMCONT=0.
      W1=DMAX1(W1,WBEGIN)
      N1=DLOG(W1/WBEGIN)/RATIOLG+1.5
      WEND=WBEGIN*RATIO**(NWL-1)
      IF(W2.EQ.0.)W2=1000000.
      N2=DLOG(W2/WBEGIN)/RATIOLG+1.5
      N2=MIN0(NWL,N2)
      NINTERP=N2-N1+1
      PRINT *,W1,N1,W2,N2
      DO 8 IWL=N1,N2
    8 WLINTERP(IWL-N1+1)=WBEGIN*RATIO**(IWL-1)
      CALL PINTER(WLFILTER,FILTER,NFILTER,WLINTERP,FILTERINTERP,NINTERP)
      DO 23 IWL=1,N2
      IF(IWL.LT.N1)THEN
      READ(7)
      GO TO 23
      ENDIF
      READ(7)(Q2(I),I=1,NMU2)
      WAVE=WBEGIN*RATIO**(IWL-1)
      FREQ=2.99792458E17/WAVE
      DLAM=WAVE/RESOLU
      F=MAX(FILTERINTERP(IWL-N1+1),0.)
      DO 19 I=1,NMU2
      HLAM=Q2(I)*FREQ/WAVE
   19 SUMQ2FILTER(I)=SUMQ2FILTER(I)+HLAM*DLAM*F
      SUMFILTER=SUMFILTER+F*DLAM
   23 CONTINUE
   24 DO 25 I=1,NMU2
   25 FILTERNORM(I)=SUMQ2FILTER(I)/SUMFILTER 
      DO 27 I=1,NMU      
      MAG(I)=-2.5*LOG10(FILTERNORM(I))
      MAG(I+NMU)=-2.5*LOG10(FILTERNORM(I+NMU))
   27 WRITE(6,28)FILTERNORM(I),MAG(I),FILTERNORM(I+NMU),MAG(I+NMU)
   28 FORMAT(//' FILTER',1PE12.4,0PF10.4,'   CONT',1PE12.4,0PF10.4//)
   29 CONTINUE
   30 CALL EXIT
      END
      SUBROUTINE LINTER(XOLD,YOLD,NOLD,XNEW,YNEW,NNEW)                          
      DIMENSION XOLD(1),YOLD(1),XNEW(1),YNEW(1)                                 
C     XOLD AND XNEW INCREASING                                                  
      IOLD=2                                                                    
      DO 2 INEW=1,NNEW                                                          
    1 IF(XNEW(INEW).LT.XOLD(IOLD))GO TO 2                                       
      IF(IOLD.EQ.NOLD)GO TO 2                                                   
      IOLD=IOLD+1                                                               
      GO TO 1                                                                   
    2 YNEW(INEW)=YOLD(IOLD-1)+(YOLD(IOLD)-YOLD(IOLD-1))/                        
     1(XOLD(IOLD)-XOLD(IOLD-1))*(XNEW(INEW)-XOLD(IOLD-1))                       
      RETURN                                                                    
      END                                                                       
      SUBROUTINE PINTER(XOLD,FOLD,NOLD,XNEW,FNEW,NNEW)                          
      DIMENSION XOLD(1),FOLD(1),XNEW(1),FNEW(1)                                 
      L=2                                                                       
      LL=0                                                                      
      DO 50 K=1,NNEW                                                            
   10 IF(XNEW(K).LT.XOLD(L))GO TO 20                                            
      L=L+1                                                                     
      IF(L.GT.NOLD)GO TO 30                                                     
      GO TO 10                                                                  
   20 IF(L.EQ.LL)GO TO 50                                                       
      IF(L.EQ.2)GO TO 30                                                        
      L1=L-1                                                                    
      IF(L.GT.LL+1.OR.L.EQ.3)GO TO 21                                           
      CBAC=CFOR                                                                 
      BBAC=BFOR                                                                 
      ABAC=AFOR                                                                 
      IF(L.EQ.NOLD)GO TO 22                                                     
      GO TO 25                                                                  
   21 L2=L-2                                                                    
      D=(FOLD(L1)-FOLD(L2))/(XOLD(L1)-XOLD(L2))                                 
      CBAC=FOLD(L)/((XOLD(L)-XOLD(L1))*(XOLD(L)-XOLD(L2)))+                     
     1(FOLD(L2)/(XOLD(L)-XOLD(L2))-FOLD(L1)/(XOLD(L)-XOLD(L1)))/                
     2(XOLD(L1)-XOLD(L2))                                                       
      BBAC=D-(XOLD(L1)+XOLD(L2))*CBAC                                           
      ABAC=FOLD(L2)-XOLD(L2)*D+XOLD(L1)*XOLD(L2)*CBAC                           
      IF(L.LT.NOLD)GO TO 25                                                     
   22 C=CBAC                                                                    
      B=BBAC                                                                    
      A=ABAC                                                                    
      LL=L                                                                      
      GO TO 50                                                                  
   25 D=(FOLD(L)-FOLD(L1))/(XOLD(L)-XOLD(L1))                                   
      CFOR=FOLD(L+1)/((XOLD(L+1)-XOLD(L))*(XOLD(L+1)-XOLD(L1)))+                
     1(FOLD(L1)/(XOLD(L+1)-XOLD(L1))-FOLD(L)/(XOLD(L+1)-XOLD(L)))/              
     2(XOLD(L)-XOLD(L1))                                                        
      BFOR=D-(XOLD(L)+XOLD(L1))*CFOR                                            
      AFOR=FOLD(L1)-XOLD(L1)*D+XOLD(L)*XOLD(L1)*CFOR                            
      WT=0.                                                                     
      IF(ABS(CFOR).NE.0.)WT=ABS(CFOR)/(ABS(CFOR)+ABS(CBAC))                     
      A=AFOR+WT*(ABAC-AFOR)                                                     
      B=BFOR+WT*(BBAC-BFOR)                                                     
      C=CFOR+WT*(CBAC-CFOR)                                                     
      LL=L                                                                      
      GO TO 50                                                                  
   30 IF(L.EQ.LL)GO TO 50                                                       
      L=AMIN0(NOLD,L)                                                           
      C=0.                                                                      
      B=(FOLD(L)-FOLD(L-1))/(XOLD(L)-XOLD(L-1))                                 
      A=FOLD(L)-XOLD(L)*B                                                       
      LL=L                                                                      
   50 FNEW(K)=A+(B+C*XNEW(K))*XNEW(K)                                           
      MAP1=LL-1                                                                 
      RETURN                                                                    
      END                                                                       
      SUBROUTINE SAMPLEFILTER
C VAS FROM UBVBUSER
C 475.  0.
C 480. .030
C 485. .084
C 490. .163
C 495. .301
C 500. .458
C 505. .630
C 510. .780
C 515. .895
C 520. .967
C 525. .997
C 530. 1.
C 535. .988
C 540. .958
C 545. .919
C 550. .877
C 555. .819
C 560. .765
C 565. .711
C 570. .657
C 575. .602
C 580. .545
C 585. .488
C 590. .434
C 595. .386
C 600. .331
C 605. .289
C 610. .250
C 615. .214
C 620. .181
C 625. .151
C 630. .120
C 635. .093
C 640. .069
C 645. .051
C 650. .036
C 655. .027
C 660. .021
C 665. .018
C 670. .016
C 675. .014
C 680. .012
C 685. .011
C 690. .010
C 695. .009
C 700. .008
C 705. .007
C 710. .006
C 715. .005
C 720. .004
C 725. .003
C 730. .002
C 735. .001
C 740. .000
C 0.
      RETURN
      END
