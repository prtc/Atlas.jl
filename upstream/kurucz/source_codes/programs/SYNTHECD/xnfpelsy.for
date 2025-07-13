      PROGRAM XNFPELSYN
c     revised 30apr93
C     PRODUCES XNFPEL AND DOPPLE FOR SYNTHE                               
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)                                
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)                                   
      COMMON /BAL/BAL1(kw,9),AAL1(kw),SAL1(kw),XNFPAL(kw,2),BAL2(kw,1)    
      COMMON /BB/BB1(kw,7),XNFPB(kw,1)                                    
      COMMON /BC/BC1(kw,14),AC1(kw),SC1(kw),XNFPC(kw,2),BC2(kw,6)         
      COMMON /BCA/BCA1(kw,8),BCA2(kw,5),XNFPCA(kw,2)                      
      COMMON /BFE/BFE1(kw,15),AFE1(kw),SFE1(kw),XNFPFE(kw,1)                
      COMMON /BHE/BHE1(kw,29),AHE1(kw),SHE1(kw),BHE2(kw,6),AHE2(kw),      
     1            SHE2(kw),AHEMIN(kw),SIGHE(kw),XNFPHE(kw,3),XNFHE(kw,2)  
      COMMON /BHYD/BHYD(kw,8),AHYD(kw),SHYD(kw),AH2P(kw),BMIN(kw),        
     1             AHMIN(kw),SHMIN(kw),SIGH(kw),SIGH2(kw),AHLINE(kw),     
     2             SHLINE(kw),XNFPH(kw,2),XNFH(kw)                        
      COMMON /BK/BK1(kw,8),XNFPK(kw,1)                                 
      COMMON /BMG/BMG1(kw,11),AMG1(kw),SMG1(kw),XNFPMG(kw,2),BMG2(kw,6)   
      COMMON /BNA/BNA1(kw,8),XNFPNA(kw,1)                                 
      COMMON /BO/BO1(kw,13),XNFPO(kw,1)                                   
      COMMON /BSI/BSI1(kw,11),ASI1(kw),SSI1(kw),XNFPSI(kw,2),BSI2(kw,6)   
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),           
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,     
     2             IFCONV                                                 
      REAL*8 MIXLTH
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99),XABUND(99),WTMOLE        
      COMMON /FLUX/FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)                  
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw),WAVENO          
      COMMON /FRESET/FRESET(500),RCOSET(500),NULO,NUHI,NUMNU,IFWAVE,      
     1               WBEGIN,DELTAW                                        
      COMMON /HEIGHT/HEIGHT(kw)                                           
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,IFMOL,NLTEON,IFOP(20)        
      COMMON /ITER/ITER,IFPRNT(15),IFPNCH(15),NUMITS                      
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE                        
      COMMON /MUS/ANGLE(20),SURFI(20),NMU                                 
      COMMON /OPS/ACOOL(kw),ALUKE(kw),AHOT(kw),SIGEL(kw),ALINES(kw),      
     1            SIGLIN(kw),AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),    
     2            SXLINE(kw),SXCONT(kw)                                   
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),   
     1              SIGMAL(kw)                                            
      COMMON /PUT/PUT,IPUT                                                
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),EDENS(kw)  
      REAL*8 KNU
      COMMON /RAD/ACCRAD(kw),PRAD(kw)                                     
      COMMON /RHOX/RHOX(kw),NRHOX                                         
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw),PTOTAL(kw)           
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)          
      REAL*8 JNU,JMINS
      COMMON /TEFF/TEFF,GRAV,GLOG                                         
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),ITEMP,HCKT(kw)  
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,     
     1               IFTURB                                               
      REAL*8 IDMOL(60),MOMASS(60)                                      
      DIMENSION                    XNFH2(kw),IFOUT(kw)                    
C     DIMENSION XNFH(kw),XNFHE(kw),XNFH2(kw),IFOUT(kw)                    
      DIMENSION XNFP(kw,6),XNFPEL(6,99),DOPPLE(6,99)                      
      DIMENSION ABLOG(kw)
      DIMENSION WLEDGE(300),CMEDGE(300),FRQEDG(300)                       
      DIMENSION A(300)                                                    
      COMMON /FREE/WORD(6),NUMCOL,LETCOL,LAST,MORE,IFFAIL,MAXPOW          
      COMMON /XNMOL/NUMMOL,CODE(160),XNMOL(kw,160)                               
      DIMENSION CARD(81)                                                  
      DATA CARD/81*1H /                                                   
      DATA IDMOL/                                                         
     1   101.,  106.,  107.,  108.,  606.,  607.,  608.,  707.,  708.,    
     2   808.,  112.,  113.,  114.,  812.,  813.,  814.,  116.,  120.,    
     3   816.,  820.,  821.,  822.,  823.,  103.,  104.,  105.,  109.,    
     4   115.,  117.,  121.,  122.,  123.,  124.,  125.,  126.,106.01,    
     5 107.01,108.01,112.01,113.01,114.01,120.01,  408.,  508.,  815.,    
     6   817.,  824.,  825.,  826.,10108.,60808.,10106.,60606.,  127.,    
     7   128.,  129.,  827.,  828.,  829.,608.01/                         
      DATA MOMASS/                                                        
     1     2.,   13.,   15.,   17.,   24.,   26.,   28.,   28.,   30.,    
     2    32.,   25.,   28.,   29.,   40.,   43.,   44.,   33.,   41.,    
     3    48.,   56.,   61.,   64.,   67.,    8.,   10.,   12.,   20.,    
     4    32.,   36.,   46.,   49.,   52.,   53.,   56.,   57.,   13.,    
     5    15.,   17.,   25.,   28.,   29.,   41.,   25.,   27.,   47.,    
     6    51.,   68.,   71.,   72.,   18.,   44.,   14.,   36.,   60.,    
     7    59.,   64.,   75.,   74.,   79.,   28./                         
      OPEN(UNIT=17,TYPE='OLD',READONLY,SHARED)
   10 CALL READIN(20)                                                     
      READ(17,1)IFOUT
    1 FORMAT(132I1)                                                        
      IFOP(14)=0
      IFOP(15)=0
      IFOP(16)=0
      IFOP(17)=0
      MORE=1
      MAXPOW=99                                                           
      LAST=81                                                             
      NUMCOL=1                                                            
      ITEMP=0                                                             
      IFPRES=1                                                            
      IFPRES=0                                                            
      ITER=1                                                              
      NUMITS=1
      NT=NRHOX                                                            
      REWIND 10                                                           
      WRITE(10)NT,TEFF,GLOG,TITLE                                         
      IN=0                                                                
   11 EDGE=XFREEF(CARD)                                                   
      PRINT 15,IN,EDGE
      IF(EDGE.EQ.0.)GO TO 14                                              
      IN=IN+1                                                             
      IF(ABS(EDGE).LT.1.D6)GO TO 12                                       
      IF(ABS(EDGE).LT.1.D25)GO TO 13                                      
C     WAVENUMBERS MUST BE MULTIPLIED BY 1.E25                             
      CMEDGE(IN)=EDGE/1.D25                                               
      WLEDGE(IN)=1.D7/CMEDGE(IN)                                          
      FRQEDG(IN)=2.997925D17/WLEDGE(IN)                                   
      A(IN)=ABS(FRQEDG(IN))                                               
      GO TO 1111                                                          
   12 WLEDGE(IN)=EDGE                                                     
      CMEDGE(IN)=1.D7/EDGE                                                
      FRQEDG(IN)=2.997925D17/WLEDGE(IN)                                   
      A(IN)=ABS(FRQEDG(IN))                                               
      GO TO 1111                                                          
   13 FRQEDG(IN)=EDGE                                                     
      WLEDGE(IN)=2.997925D17/EDGE                                         
      CMEDGE(IN)=1.D7/WLEDGE(IN)                                          
      A(IN)=ABS(FRQEDG(IN))                                               
 1111 WRITE(6,15)IN,FRQEDG(IN),WLEDGE(IN),CMEDGE(IN)                      
   15 FORMAT(I5,1PE25.15,0PF20.7,F20.7)                                   
      GO TO 11                                                            
   14 DO 17 LAST=2,IN                                                     
      LAST1=IN-LAST+2                                                     
      DO 16 I=2,LAST1                                                     
      IF(A(I).GE.A(I-1))GO TO 16                                          
      SAVE=A(I-1)                                                         
      A(I-1)=A(I)                                                         
      A(I)=SAVE                                                           
      SAVE=FRQEDG(I-1)                                                    
      FRQEDG(I-1)=FRQEDG(I)                                               
      FRQEDG(I)=SAVE                                                      
      SAVE=WLEDGE(I-1)                                                    
      WLEDGE(I-1)=WLEDGE(I)                                               
      WLEDGE(I)=SAVE                                                      
      SAVE=CMEDGE(I-1)                                                    
      CMEDGE(I-1)=CMEDGE(I)                                               
      CMEDGE(I)=SAVE                                                      
   16 CONTINUE                                                            
   17 CONTINUE                                                            
      WRITE(6,15)(I,FRQEDG(I),WLEDGE(I),CMEDGE(I),I=1,IN)                 
      WRITE(10)IN,(FRQEDG(I),WLEDGE(I),CMEDGE(I),I=1,IN),IDMOL,MOMASS     
      NUMNU=IN                                                            
      FRESET(1)=A(1)/2.                                                   
      DO 18 NU=2,NUMNU                                                    
   18 FRESET(NU)=(A(NU)+A(NU-1))/2.                                       
      NUMNU=NUMNU+1                                                       
      FRESET(NUMNU)=A(NUMNU-1)*1.01                                       
      WRITE(10)NUMNU,(FRESET(NU),NU=1,NUMNU)                              
      ITEMP=ITEMP+1                                                       
      CALL POPS(1.00D0,12,XNFH)                                             
      CALL POPS(2.01D0,12,XNFHE)                                            
      CALL POPS(1.01D0,11,XNFPH)                                            
      CALL POPS(2.02D0,11,XNFPHE)                                           
      CALL POPS(5.00D0,11,XNFPB)                                            
      CALL POPS(6.01D0,11,XNFPC)                                            
      CALL POPS(8.00D0,11,XNFPO)                                            
      CALL POPS(11.00D0,11,XNFPNA)                                          
      CALL POPS(12.01D0,11,XNFPMG)                                          
      CALL POPS(13.01D0,11,XNFPAL)                                          
      CALL POPS(14.01D0,11,XNFPSI)                                          
      CALL POPS(19.00D0,11,XNFPK)                                          
      CALL POPS(20.01D0,11,XNFPCA)                                          
      CALL POPS(26.00D0,11,XNFPFE)                                          
      IF(IFMOL.EQ.0.)GO TO 445                                            
C     PATCH TO GET NUMBER DENSITIES BY MULTIPLYING BY PARTITION FUNCTION  
      DO 444 J=1,NRHOX                                                    
      CALL PFSAHA(J,1,1,3,XNFH)                                           
      XNFH(J)=XNFPH(J,1)*XNFH(J)                                            
      CALL PFSAHA(J,2,2,13,XNFHE)                                         
      XNFHE(J,1)=XNFPHE(J,1)*XNFHE(J,1)                                   
      XNFHE(J,2)=XNFPHE(J,2)*XNFHE(J,2)                                   
      XNFH2(J)=0.                                                         
      IF(T(J).LT.10000.)XNFH2(J)=XNFH(J)**2*EXP(4.477/TKEV(J)-4.6628E1+   
     1(1.8031E-3+(-5.0239E-7+(8.1424E-11-5.0501E-15*T(J))*T(J))*T(J))*    
     2T(J)-1.5*TLOG(J))                                                   
  444 CONTINUE                                                            
  445 CONTINUE                                                            
      DO 125 NU=1,NUMNU                                                   
      FREQ=FRESET(NU)                                                     
      FREQ15=FREQ/1.E15
      RCO=RCOSET(NU)                                                      
      FREQLG= LOG(FREQ)                                                   
      DO 120 J=1,NRHOX                                                    
      EHVKT(J)=EXP(-FREQ*HKT(J))                                          
      STIM(J)=1.-EHVKT(J)                                                 
  120 BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)                         
      N=1                                                                 
      WAVE=2.997925E17/FREQ                                               
      WAVENO=1.E7/WAVE                                                    
      CALL KAPP(N,NSTEPS,STEPWT)                                          
      WRITE(6,15)NU,FREQ,WAVE,WAVENO                                      
      DO 129 J=1,NRHOX                                                    
      ABTOT(J)=ACONT(J)+ALINE(J)+SIGMAC(J)+SIGMAL(J)                      
  129 ABLOG(J)= LOG10(ABTOT(J))                                           
      WRITE(6,105)(ABLOG(J),J=1,NRHOX)                                    
  105 FORMAT(1X,20F5.2)                                                   
      WRITE(10)ABLOG                                                      
  125 CONTINUE                                                            
C                                                                         
      WRITE(10)T,TKEV,TK,HKT,TLOG,HCKT,P,XNE,XNATOM,RHO,RHOX,VTURB,
     1XNFH,XNFHE,XNFH2
C                                                                         
      DO 30 I=1,6                                                         
      DO 30 J=1,NRHOX                                                     
   30 XNFP(J,I)=0.                                                        
      CALL POPS(1.01D0,11,XNFP)                                             
      WRITE(9)XNFP                                                        
      CALL POPS(2.02D0,11,XNFP)                                             
      WRITE(9)XNFP                                                        
      CALL POPS(3.03D0,11,XNFP)                                             
      WRITE(9)XNFP                                                        
      CALL POPS(4.03D0,11,XNFP)                                             
      WRITE(9)XNFP                                                        
      CALL POPS(5.03D0,11,XNFP)                                             
      WRITE(9)XNFP                                                        
      DO 26 NELEM=6,16                                                    
      CALL POPS(FLOAT(NELEM)+.05D0,11,XNFP)                                 
   26 WRITE(9)XNFP                                                        
      DO 31 I=1,6                                                         
      DO 31 J=1,NRHOX                                                     
   31 XNFP(J,I)=0.                                                        
      DO 27 NELEM=17,28                                                   
      CALL POPS(FLOAT(NELEM)+.04D0,11,XNFP)                                 
   27 WRITE(9)XNFP                                                        
      DO 32 I=1,6                                                         
      DO 32 J=1,NRHOX                                                     
   32 XNFP(J,I)=0.                                                        
      DO 28 NELEM=29,99                                                   
      CALL POPS(FLOAT(NELEM)+.02D0,11,XNFP)                                 
   28 WRITE(9)XNFP                                                        
      IF(IFMOL.EQ.0)GO TO 210                                             
      DO 201 NELEM=40,99                                                  
      CALL POPS(IDMOL(NELEM-39),1,XNFP)                                   
  201 WRITE(9)XNFP                                                        
  210 CONTINUE                                                            
      DO 300 J=1,NRHOX                                                    
      REWIND 9                                                            
      DO 250 NELEM=1,99                                                   
      READ(9)XNFP                                                         
      DO 260 ION=1,6                                                      
  260 XNFPEL(ION,NELEM)=XNFP(J,ION)                                       
  250 CONTINUE                                                            
      DO 20 NELEM=1,99                                                    
      DOPPLE(1,NELEM)=SQRT(2.*TK(J)/ATMASS(NELEM)/1.660E-24+              
     1VTURB(J)**2)/2.997925E10                                            
      DOPPLE(2,NELEM)=DOPPLE(1,NELEM)                                     
      DOPPLE(3,NELEM)=DOPPLE(1,NELEM)                                     
      DOPPLE(4,NELEM)=DOPPLE(1,NELEM)                                     
      DOPPLE(5,NELEM)=DOPPLE(1,NELEM)                                     
   20 DOPPLE(6,NELEM)=DOPPLE(1,NELEM)                                     
      IF(IFMOL.EQ.0)GO TO 270                                             
      DO 265 NELEM=40,99                                                  
      DOPPLE(6,NELEM)=SQRT(2.*TK(J)/MOMASS(NELEM-39)/1.660E-24+           
     1VTURB(J)**2)/2.997925E10                                            
      READ(9)XNFP                                                         
  265 XNFPEL(6,NELEM)=XNFP(J,1)                                           
  270 CONTINUE                                                            
      WRITE(10)XNFPEL,DOPPLE
C     IF(IFOUT(J).NE.1)GO TO 300                                          
      WRITE(6,280)J                                                       
  280 FORMAT(18H0XNFPEL.....DOPPLE,I10)                                   
      DO 29 NELEM=1,39                                                    
   29 WRITE(6,290)NELEM,(XNFPEL(ION,NELEM),ION=1,6),DOPPLE(1,NELEM)       
  290 FORMAT(I5,1P6E12.4,5X,2E12.4,0PF10.2,I5)                            
      DO 33 NELEM=40,99                                                   
      NELEM6=NELEM*6                                                      
   33 WRITE(6,290)NELEM,(XNFPEL(ION,NELEM),ION=1,6),DOPPLE(1,NELEM),      
     1DOPPLE(6,NELEM),IDMOL(NELEM-39),NELEM6                              
      WRITE(6,333)T(J),TK(J),HKT(J),TKEV(J),TLOG(J),RHOX(J),P(J),         
     1XNE(J),RHO(J),XNFH(J),XNFHE(J,1),XNFH2(J)                             
  333 FORMAT(10H0   T     ,1PE12.4,10H    TK    ,E12.4,10H    HKT   ,     
     1E12.4,10H    TKEV  ,E12.4,10H    TLOG  ,E12.4/10H0   RHOX  ,        
     2E12.4,10H    P     ,E12.4,10H    XNE   ,E12.4,10H    RHO   ,E12.4/  
     3 10H0   XNFH  ,E12.4,10H    XNFHE ,E12.4,10H    XNFH2 ,E12.4)       
  300 CONTINUE                                                            
      CLOSE(UNIT=9,STATUS='DELETE')
      CALL EXIT                                                           
      END                                                                 
      SUBROUTINE ATLAS7
      END
      FUNCTION XFREEF(CARD)
      IMPLICIT REAL*8 (A-H,O-Z)
      COMMON /FREE/WORD(6),NUMCOL,LETCOL,LAST,MORE,IFFAIL,MAXPOW
      DIMENSION CARD(81)
      MORE=1
      XFREEF=FREEFF(CARD)
      IF(IFFAIL.EQ.0)RETURN
      L=LAST-1
      READ(17,1)(CARD(I),I=1,L)
    1 FORMAT(80A1)
      NUMCOL=1
      XFREEF=FREEFF(CARD)
      RETURN
      END
