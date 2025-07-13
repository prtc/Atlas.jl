      SUBROUTINE PUTOUT(MODE)                                                   
C     PUTOUT MODIFIED TO PLOT A SPECTRUM                                        
C     REQUIRES A PRINT 2                                                        
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /FRESET/FRESET(1563),RCOSET(1563),NULO,NUHI,NUMNU
      COMMON /HEIGHT/HEIGHT(kw)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /IFOP/IFOP(20)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
      COMMON /MUS/ANGLE(20),SURFI(20),NMU
      COMMON /OPS/AHYD(kw),AH2P(kw),AHMIN(kw),SIGH(kw),AHE1(kw),
     1       AHE2(kw),AHEMIN(kw),SIGHE(kw),ACOOL(kw),ALUKE(kw),AHOT(kw),
     2            SIGEL(kw),SIGH2(kw),AHLINE(kw),ALINES(kw),SIGLIN(kw),
     3            AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),SHYD(kw),
     4            SHMIN(kw),SHLINE(kw),SXLINE(kw),SXCONT(kw)
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),
     1              SIGMAL(kw)
      COMMON /PTOTAL/PTOTAL(kw)
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /PUT/PUT,IPUT
      COMMON /RAD/ ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /WAVEY/WBEGIN,DELTAW,IFWAVE
      COMMON /XABUND/XABUND(99),WTMOLE
      COMMON /RR/RJMINSNU(kw),RDIAGJNU(kw)
      DIMENSION SURFIN(20),F(20),DUMMY(kw,25),ABLOG(20)
      EQUIVALENCE (DUMMY(1,1),AHYD(1)),(F(1),STIM(1))
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
      DIMENSION ARRAY(101)                                                      
      DATA ARRAY/101*1H /                                                       
      DATA CHARX/1HX/                                                           
      DATA BLANK/1H /                                                           
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
      DATA ON,OFF/3HON ,3HOFF/
C                                                                               
      GO TO(100,200,300,400,500),MODE                                           
C                                                                               
C     HEADINGS                                                                  
  100 IF(IFPRNT(ITER).EQ.0)RETURN                                               
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
      HMAX=0.                                                                   
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
      IFHEAD=0                                                                  
      NU=NULO-1                                                                 
      RETURN                                                                    
C                                                                               
C     INITIALIZE SUMS OVER PICKETS                                              
  200 HSURF=0.                                                                  
      HNU(1)=0.                                                                 
      WAVE=2.997925E17/FREQ                                                     
      NU=NU+1                                                                   
      DO 201 MU=1,NMU                                                           
  201 SURFIN(MU)=0.                                                             
      N=0                                                                       
      RETURN                                                                    
C                                                                               
C     SUM OVER PICKETS AND PICKET DEPENDENT QUANTITIES                          
  300 N=N+1                                                                     
      NUMPIK=IPUT                                                               
      PIKWT=PUT                                                                 
      HSURF=HSURF+HNU(1)*PIKWT                                                  
      DO 301 MU=1,NMU                                                           
  301 SURFIN(MU)=SURFIN(MU)+SURFI(MU)*PIKWT                                     
      IF(IFPRNT(ITER).EQ.0)RETURN                                               
      IF(NUMPIK.EQ.1)GO TO 310                                                  
      IF(IFHEAD.EQ.0)WRITE(6,101)                                               
      IFHEAD=1                                                                  
      IF(N.EQ.1)WRITE(6,303)                                                    
  303 FORMAT(1H0)                                                               
      HNULG=LOG10(HNU(1))                                                      
      IDUM=MAP1(TAUNU,RHOX,NRHOX,1.D0,RHOX1,1)                                    
      RHOX1=LOG10(RHOX1)                                                       
      TAUEND=LOG10(TAUNU(NRHOX))                                               
      WRITE(6,305)PIKWT,HNU(1),HNULG,RHOX1,TAUEND                               
  305 FORMAT(61X,F10.8,1PE13.4,0PF12.5,19X,2F6.2)                               
C 305 FORMAT(61X,F10.8,0PE13.4,0PF12.5,19X,2F6.2)                               
  310 IF(IFPRNT(ITER).EQ.4)GO TO 320                                            
      IF(IFPRNT(ITER).NE.3)RETURN                                               
      WRITE(6,312)WAVE,FREQ,(J,RHOX(J),TAUNU(J),ABTOT(J),                       
     1ALPHA(J),BNU(J),SNU(J),JNU(J),JMINS(J),HNU(J),J=1,NRHOX)                  
  312 FORMAT(1H1//6X10HWAVELENGTHF9.3,3X9HFREQUENCY1PE13.6/                     
C 312 FORMAT(1H1//6X10HWAVELENGTHF9.3,3X9HFREQUENCY0PE13.6/                     
     1/12X4HRHOX,7X5HTAUNU,6X5HABTOT,5X5HALPHA,8X3HBNU,8X3HSNU,                 
     28X3HJNU,7X5HJMINS,7X3HHNU/(6XI2,1P9E11.3))                                
C    28X3HJNU,7X5HJMINS,7X3HHNU/(6XI2,0P9E11.3))                                
      RETURN                                                                    
  320 WRITE(6,321)                                                              
  321 FORMAT( 126H1       AHYD  AH2P AHMIN  SIGH  AHE1 AHE2 AHEMIN SIGHE        
     1 ACOOL ALUKE AHOT SIGEL SIGH2 AHLINEALINESSIGLINAXLINE SIGXLAXCONT        
     2  SIGX)                                                                   
      DO 325 J=1,NRHOX                                                          
      DO 322 I=1,20                                                             
      ABLOG(I)=0.                                                               
      IF(DUMMY(J,I).GT.0.)ABLOG(I)=LOG10(DUMMY(J,I))                           
  322 CONTINUE                                                                  
  325 WRITE(6,326)J,ABLOG,J                                                     
  326 FORMAT(I4,2X20F6.2,1XI3)                                                  
      RETURN                                                                    
C                                                                               
C     PRINT SUMS OVER PICKETS                                                   
  400 IF(IFPRNT(ITER).EQ.0)RETURN                                               
      IDUM=MAP1(TAUNU,RHOX,NRHOX,1.,RHOX1,1)                                    
      RHOX1=LOG10(RHOX1)                                                       
      TAUEND=LOG10(TAUNU(NRHOX))                                               
      IF(NUMPIK.GT.1)RHOX1=0.                                                   
      IF(NUMPIK.GT.1)TAUEND=0.                                                  
      IF(IFSURF.NE.0.AND.IFSURF.NE.1)GO TO 405                                  
      IF(IFHEAD.EQ.0)WRITE(6,101)                                               
  101 FORMAT(1H1/////10X4HWAVE,7X7HHLAMBDA,7X5HLOG H,7X3HMAG,                   
     110X9HFREQUENCY,8X3HHNU,10X5HLOG H,7X3HMAG,10X6HTAUONE,6H TAUNU)           
      IFHEAD=1                                                                  
      IF(HSURF.LE.0.)HSURF=1.E-30                                               
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
      HMAX=MAX(HMAX,HSURF)                                                    
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
      HLAM=HSURF*FREQ/WAVE                                                      
      HNULG=LOG10(HSURF)                                                       
      HLAMLG=LOG10(HLAM)                                                       
      HLAMMG=-2.5*HLAMLG                                                        
      HNUMG=-2.5*HNULG                                                          
      WRITE (6,401)NU,WAVE,HLAM,HLAMLG,HLAMMG,FREQ,HSURF,HNULG,HNUMG,           
     1RHOX1,TAUEND,NU                                                           
  401 FORMAT(I5,F11.3,1PE13.4,0PF12.5,F10.3,1PE20.6,E13.4,0PF12.5,F10.3,        
C 401 FORMAT(I5,F11.3,0PE13.4,0PF12.5,F10.3,0PE20.6,E13.4,0PF12.5,F10.3,        
     1 9X2F6.2,I5)                                                              
  405 IF(IFSURF.NE.2)GO TO 410                                                  
      IF(IFHEAD.EQ.0)WRITE(6,102)                                               
  102 FORMAT(1H1/////10X4HWAVE,5X9HFREQUENCY,3X12HTAUONE TAUNU,                 
     15(17H   MU  INTENSITY ))                                                  
      IFHEAD=1                                                                  
      WRITE(6,406)NU,WAVE,FREQ,RHOX1,TAUEND,                                    
     1(ANGLE(MU),SURFIN(MU),MU=1,NMU)                                           
  406 FORMAT(I5,F10.3,1PE15.6,0P2F6.2,(5(0PF6.3,1PE11.3)))                      
C 406 FORMAT(I5,F10.3,0PE15.6,0P2F6.2,(5(0PF6.3,0PE11.3)))                      
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
      HMAX=MAX(HMAX,SURFIN(1))                                                
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
  410 IF(IFPNCH(ITER).LT.2)RETURN                                               
      IF(IFSURF.GT.2)RETURN                                                     
      IF(IFSURF.EQ.2)GO TO 415                                                  
      WRITE(7,411)FREQ,HSURF                                                    
  411 FORMAT(4HFLUX,1PE20.6,E13.4)                                              
C 411 FORMAT(4HFLUX,0PE20.6,E13.4)                                              
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
C     RETURN                                                                    
      GO TO 420                                                                 
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
  415 WRITE(7,416)FREQ,(SURFIN(MU),MU=1,NMU)                                    
  416 FORMAT(9HINTENSITY,1PE20.6,4E13.4/(5E13.4))                               
C 416 FORMAT(9HINTENSITY,0PE20.6,4E13.4/(5E13.4))                               
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
C     RETURN                                                                    
  420 IF(NU.LT.NUMNU)RETURN                                                     
      REWIND 7                                                                  
      WRITE(6,700)                                                              
  700 FORMAT(1H1)                                                               
      DO 720 NU=1,NUMNU                                                         
      IF(IFSURF.EQ.1)READ(7,701)FREQ,H                                          
  701 FORMAT(4XE20.6,E13.4)                                                     
      IF(IFSURF.EQ.2)READ(7,702)FREQ,H                                          
      WAVE=2.997925E17/FREQ                                                     
  702 FORMAT(9XE20.6,E13.4)                                                     
      I=H/HMAX*100.+1.5                                                         
      IF(I.LT.1)I=1                                                             
      ARRAY(I)=CHARX                                                            
      I1=I-1                                                                    
      WRITE(6,707)NU,WAVE,H,I1,ARRAY                                            
  707 FORMAT(1HH,I5,F10.3,1PE11.3,I4,101A1)                                     
  720 ARRAY(I)=BLANK                                                            
      REWIND 7                                                                  
      WRITE(7,700)                                                              
      RETURN                                                                    
CXXXXXXXXXXXXXXXXXXXXXXXXXXXXX                                                  
C                                                                               
C     SUMMARIES                                                                 
  500 IF(IFPRNT(ITER).EQ.0)GO TO 550                                            
      IF(IFPRNT(ITER).EQ.1)GO TO 540                                            
      WRITE(6,501)(J,RHOX(J),PTOTAL(J),PTURB(J),GRDADB(J),DLTDLP(J),            
     1VELSND(J),DLRDLT(J),HEATCP(J),HSCALE(J),VCONV(J),FLXCNV(J),               
     2J=1,NRHOX)                                                                
  501 FORMAT(1H1/////132H       RHOX       PTOTAL     PTURB      GRDADB         
     1    DLTDLP     VELSND     DLRDLT     HEATCP     HSCALE     VCONV          
     2    FLXCNV            /(I3,1P11E11.3))                                    
C    2    FLXCNV            /(I3,0P11E11.3))                                    
      WRITE(6,502)FLUX                                                          
  502 FORMAT(1H0108X4HFLUXE12.4)                                                
      WRITE(6,503)(J,XNATOM(J),TKEV(J),TLOG(J),BNU(J),ACCRAD(J),                
     1PRAD(J),XNFPH(J,1),XNFPH(J,2),XNFPHE(J,1),XNFPHE(J,2),XNFPHE(J,3),        
     2J=1,NRHOX)                                                                
  503 FORMAT(1H1/////132H      XNATOM      TKEV       TLOG       BNU            
     1   ACCRAD      PRAD      XNFPH1     XNFPH2     XNFPHE1    XNFPHE2         
     2   XNFPHE3            /(I3,1P11E11.3))                                    
C    2   XNFPHE3            /(I3,0P11E11.3))                                    
      DO 539 J=1,NRHOX                                                          
      IF(IFCORR.EQ.0)FLXRAD(J)=FLUX-FLXCNV(J)                                   
  539 FLXCNV(J)=FLXCNV(J)/(FLXCNV(J)+FLXRAD(J))                                 
  540 WRITE(6,541) TEFF,GLOG,TITLE,ITER                                         
  541 FORMAT(1H1//////5H TEFF,F8.0,8H   LOG G,F7.3,10X74A1,2X,                  
     19HITERATION,I3)                                                           
      WRITE(6,542)(J,RHOX(J),T(J),P(J),XNE(J),RHO(J),ABROSS(J),                 
     1HEIGHT(J),TAUROS(J),FLXCNV(J),VTURB(J),FLXERR(J),FLXDRV(J),               
     2J=1,NRHOX)                                                                
  542 FORMAT(132H0                                   ELECTRON                   
     1  ROSSELAND    HEIGHT   ROSSELAND   FRACTION                    PE        
     2R CENT FLUX/132H       RHOX      TEMP    PRESSURE    NUMBER    DEN        
     4SITY      MEAN       (KM)      DEPTH    CONV FLUX    VTURB                
     5   ERROR   DERIV/(I3,1PE10.3,0PF9.1,1P8E11.3,0PF14.3,F8.3))               
C    5   ERROR   DERIV/(I3,0PE10.3,0PF9.1,0P8E11.3,0PF14.3,F8.3))               
  550 IF(IFPNCH(ITER).EQ.0)RETURN                                               
C                                                                               
C     PUNCHOUT                                                                  
      A=OFF                                                                     
      IF(IFCONV.EQ.1)A=ON                                                       
      B=OFF                                                                     
      IF(IFTURB.EQ.1)B=ON                                                       
      WRITE(7,552) TEFF,GLOG,WLTE,TITLE,IFOP,A,MIXLTH,B,TRBFDG,                 
     1TRBPOW,TRBSND,TRBCON,XSCALE,(IZ,ABUND(IZ),IZ=1,99)                        
  552 FORMAT(5HTEFF F7.0,9H GRAVITY F5.3,1XA4/6HTITLE 74A1                      
     1/13H OPACITY IFOP20I2/12H CONVECTION A3,F6.2,12H TURBULENCE A3,           
     24F6.2/16HABUNDANCE SCALE F7.3,17H ABUNDANCE CHANGE2(I2,F6.3)/             
     3(17H ABUNDANCE CHANGE6(I3,F7.2)))                                         
      WRITE(7,554)NRHOX,(RHOX(J),T(J),P(J),XNE(J),ABROSS(J),PRAD(J),            
     1VTURB(J),J=1,NRHOX)                                                       
  554 FORMAT(9HREAD DECKI3,31H RHOX,T,P,XNE,ABROSS,PRAD,VTURB/                  
     1(1PE15.8,0PF9.1,1P5E10.3))                                                
C    1(0PE15.8,0PF9.1,0P5E10.3))                                                
      IF(NLTEON.EQ.0)GO TO 560                                                  
      WRITE(7,556)NRHOX,(RHOX(J),(BHYD(J,I),I=1,6),BMIN(J),J=1,NRHOX)           
  556 FORMAT(27HREAD DEPARTURE COEFFICIENTSI3,21H TAUS  BHYD 1-6  BMIN/         
     1(1PE11.4,0PF9.4))                                                         
C    1(0PE11.4,0PF9.4))                                                         
  560 IF(IFWAVE.EQ.1)GO TO 570                                                  
      WRITE(7,562)NUMNU,NULO,NUHI,FREQID,(NU,FRESET(NU),RCOSET(NU),             
     1NU=1,NUMNU)                                                               
  562 FORMAT(16HREAD FREQUENCIES3I4,3X6A1/(I5,1P2E17.8,I5,2E17.8))              
C 562 FORMAT(16HREAD FREQUENCIES3I4,3X6A1/(I5,0P2E17.8,I5,2E17.8))              
  570 WRITE(7,571)ITER                                                          
  571 FORMAT(5HBEGIN,20X10HITERATION I3,10H COMPLETED )                         
      RETURN                                                                    
      END                                                                       
      SUBROUTINE XLINOP                                                         
C     LINE OPACITY FOR SMALL REGIONS OF SPECTRUM                                
C     DIMENSIONS ARE FOR 100 LINES MAXIMUM                                      
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)                                
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/AHYD(kw),AH2P(kw),AHMIN(kw),SIGH(kw),AHE1(kw),
     1       AHE2(kw),AHEMIN(kw),SIGHE(kw),ACOOL(kw),ALUKE(kw),AHOT(kw),
     2            SIGEL(kw),SIGH2(kw),AHLINE(kw),ALINES(kw),SIGLIN(kw),
     3            AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),SHYD(kw),
     4            SHMIN(kw),SHLINE(kw),SXLINE(kw),SXCONT(kw)
      COMMON /RHOX/RHOX(kw),NRHOX                                               
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /XABUND/XABUND(99),WTMOLE                                          
      DIMENSION CODEL(100),FREQL(100),EXPOTL(100),GFL(100)
      DIMENSION GAMMRL(100),GAMMSL(100),GAMMWL(100)
      DIMENSION LINE(kw,100),ADAMP(kw,100),DOPNU(kw,100)                        
      REAL*8 LINE                                                                 
      DIMENSION MULT(2),SLABEL(2)                                               
      DIMENSION XCODE(8)                                                        
      DIMENSION TXNXN(kw),XNFP(kw)                                    
      COMMON/LINDAT/WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL(3),LABELP(3),NELION,       
     1               GAMMAR,GAMMAS,GAMMAW,REF,NBLO,NBUP,ISO1,X1,ISO2,           
     2               X2,OTHER1(3),OTHER2(3),ELO,GF                              
      REAL*8 WL,E,EP                                                            
      DIMENSION VELSHIFT(kw)
      DIMENSION POTION(594)                                                     
      DIMENSION POTA(114),POTB(114),POTC(114),POTD(114),POTE(114)               
      DIMENSION POTF(24)                                                        
      EQUIVALENCE (POTION(1),POTA(1)),(POTION(115),POTB(1))                     
      EQUIVALENCE (POTION(229),POTC(1)),(POTION(343),POTD(1))                   
      EQUIVALENCE (POTION(457),POTE(1)),(POTION(571),POTF(1))                   
      DATA POTA/                                                                
     1   13.598,   0.   ,   0.   ,   0.   ,   0.   ,   0.   ,                  1
     2   24.587,  54.416,   0.   ,   0.   ,   0.   ,   0.   ,                  2
     3    5.392,  75.638, 122.451,   0.   ,   0.   ,   0.   ,                  3
     4    9.322,  18.211, 153.893, 217.713,   0.   ,   0.   ,                  4
     5    8.298,  25.154,  37.930, 259.368, 340.217,   0.   ,                  5
     6   11.260,  24.383,  47.887,  64.492, 392.077, 489.981,                  6
     7   14.534,  29.601,  47.448,  77.472,  97.888, 552.057,                  7
     8   13.618,  35.116,  54.934,  77.412, 113.896, 138.116,                  8
     9   17.422,  34.970,  62.707,  87.138, 114.240, 157.161,                  9
     T   21.564,  40.962,  63.45 ,  97.11 , 126.21 , 157.93 ,                 10
     1    5.139,  47.286,  71.64 ,  98.91 , 138.39 , 172.15 ,                 11
     2    7.646,  15.035,  80.143, 109.24 , 141.26 , 186.50 ,                 12
     3    5.986,  18.828,  28.447, 119.99 , 153.71 , 190.47 ,                 13
     4    8.151,  16.345,  33.492,  45.141, 166.77 , 205.05 ,                 14
     5   10.486,  19.725,  30.18 ,  51.37 ,  65.023, 220.43 ,                 15
     6   10.36 ,  23.33 ,  34.83 ,  47.30 ,  72.68 ,  88.049,                 16
     7   12.967,  23.81 ,  39.61 ,  53.46 ,  67.80 ,  97.03 ,                 17
     8   15.759,  27.629,  40.74 ,  59.81 ,  75.02 ,  91.007,                 18
     9    4.341,  31.625,  45.72 ,  60.91 ,  82.66 , 100.0  /                 19
      DATA POTB/                                                                
     1    6.113,  11.871,  50.908,  67.10 ,  84.41 , 108.78 ,                 20
     2    6.54 ,  12.80 ,  24.76 ,  73.47 ,  91.66 , 111.1  ,                 21
     3    6.82 ,  13.58 ,  27.491,  43.266,  99.22 , 119.36 ,                 22
     4    6.74 ,  14.65 ,  29.310,  46.707,  65.23 , 128.12 ,                 23
     5    6.766,  16.50 ,  30.96 ,  49.1  ,  69.3  ,  90.56 ,                 24
     6    7.435,  15.640,  33.667,  51.2  ,  72.4  ,  95.   ,                 25
     7    7.870,  16.18 ,  30.651,  54.8  ,  75.0  ,  99.0  ,                 26
     8    7.86 ,  17.06 ,  33.50 ,  51.3  ,  79.5  , 102.0  ,                 27
     9    7.635,  18.168,  35.17 ,  54.9  ,  75.5  , 108.0  ,                 28
     T    7.726,  20.292,  36.83 ,  55.2  ,  79.9  , 103.0  ,                 29
     1    9.394,  17.964,  39.722,  59.4  ,  82.6  , 108.0  ,                 30
     2    5.999,  20.51 ,  30.71 ,  64.0  ,   0.   ,   0.   ,                 31
     3    7.899,  15.934,  34.22 ,  45.71 ,  93.5  ,   0.   ,                 32
     4    9.81 ,  18.633,  28.351,  50.13 ,  62.63 , 127.6  ,                 33
     5    9.752,  21.19 ,  30.820,  42.944,  68.3  ,  81.70 ,                 34
     6   11.814,  21.8  ,  36.   ,  47.3  ,  59.7  ,  88.6  ,                 35
     7   13.999,  24.359,  36.95 ,  52.5  ,  64.7  ,  78.5  ,                 36
     8    4.177,  27.28 ,  40.0  ,  52.6  ,  71.0  ,  84.4  ,                 37
     9    5.695,  11.030,  43.6  ,  57.0  ,  71.6  ,  90.8  /                 38
      DATA POTC/                                                                
     1    6.38 ,  12.24 ,  20.52 ,  61.8  ,  77.0  ,  93.0  ,                 39
     2    6.84 ,  13.13 ,  22.99 ,  34.34 ,  81.50 ,   0.   ,                 40
     3    6.88 ,  14.32 ,  25.04 ,  38.3  ,  50.55 , 102.6  ,                 41
     4    7.099,  16.15 ,  27.16 ,  46.4  ,  61.2  ,  68.0  ,                 42
     5    7.28 ,  15.26 ,  29.54 ,   0.   ,   0.   ,   0.   ,                 43
     6    7.37 ,  16.76 ,  28.47 ,   0.   ,   0.   ,   0.   ,                 44
     7    7.46 ,  18.08 ,  31.06 ,   0.   ,   0.   ,   0.   ,                 45
     8    8.34 ,  19.43 ,  32.93 ,   0.   ,   0.   ,   0.   ,                 46
     9    7.576,  21.49 ,  34.83 ,   0.   ,   0.   ,   0.   ,                 47
     T    8.993,  16.908,  34.48 ,   0.   ,   0.   ,   0.   ,                 48
     1    5.786,  18.869,  28.03 ,  54.0  ,   0.   ,   0.   ,                 49
     2    7.344,  14.632,  30.502,  40.734,  72.28 ,   0.   ,                 50
     3    8.641,  16.53 ,  25.3  ,  44.2  ,  56.0  , 108.0  ,                 51
     4    9.009,  18.6  ,  27.96 ,  37.41 ,  58.75 ,  70.7  ,                 52
     5   10.451,  19.131,  33.0  ,   0.   ,   0.   ,   0.   ,                 53
     6   12.130,  21.21 ,  32.1  ,   0.   ,   0.   ,   0.   ,                 54
     7    3.894,  25.1  ,  35.0  ,   0.   ,   0.   ,   0.   ,                 55
     8    5.212,  10.004,  37.000,   0.   ,   0.   ,   0.   ,                 56
     9    5.577,  11.06 ,  19.177,  49.954,   0.   ,   0.   /                 57
      DATA POTD/                                                                
     1    5.47 ,  10.85 ,  20.197,  36.758,   0.   ,   0.   ,                 58
     2    5.42 ,  10.55 ,  21.624,  38.981,   0.   ,   0.   ,                 59
     3    5.49 ,  10.72 ,  22.14 ,  40.42 ,   0.   ,   0.   ,                 60
     4    5.55 ,  10.90 ,  22.42 ,  41.09 ,   0.   ,   0.   ,                 61
     5    5.63 ,  11.07 ,  23.45 ,  41.47 ,   0.   ,   0.   ,                 62
     6    5.67 ,  11.25 ,  24.71 ,  42.65 ,   0.   ,   0.   ,                 63
     7    6.14 ,  12.1  ,  20.38 ,  44.03 ,   0.   ,   0.   ,                 64
     8    5.85 ,  11.52 ,  21.98 ,  39.84 ,   0.   ,   0.   ,                 65
     9    5.93 ,  11.67 ,  22.83 ,  41.56 ,   0.   ,   0.   ,                 66
     T    6.02 ,  11.80 ,  22.84 ,  42.51 ,   0.   ,   0.   ,                 67
     1    6.10 ,  11.93 ,  22.74 ,  42.66 ,   0.   ,   0.   ,                 68
     2    6.18 ,  12.05 ,  23.68 ,  42.69 ,   0.   ,   0.   ,                 69
     3    6.254,  12.17 ,  25.03 ,  43.74 ,   0.   ,   0.   ,                 70
     4    5.426,  13.9  ,  20.960,  45.193,   0.   ,   0.   ,                 71
     5    7.0  ,  14.9  ,  23.3  ,  33.319,   0.   ,   0.   ,                 72
     6    7.89 ,  16.200,  24.0  ,   0.   ,   0.   ,   0.   ,                 73
     7    7.98 ,  17.70 ,  25.0  ,   0.   ,   0.   ,   0.   ,                 74
     8    7.88 ,  16.6  ,  26.0  ,   0.   ,   0.   ,   0.   ,                 75
     9    8.7  ,  17.0  ,  27.0  ,   0.   ,   0.   ,   0.   /                 76
      DATA POTE/                                                                
     1    9.1  ,  20.0  ,  28.0  ,   0.   ,   0.   ,   0.   ,                 77
     2    9.0  ,  18.563,  29.0  ,   0.   ,   0.   ,   0.   ,                 78
     3    9.225,  20.5  ,  30.0  ,   0.   ,   0.   ,   0.   ,                 79
     4   10.437,  18.756,  34.2  ,   0.   ,   0.   ,   0.   ,                 80
     5    6.108,  20.428,  29.83 ,   0.   ,   0.   ,   0.   ,                 81
     6    7.416,  15.032,  31.937,  42.32 ,  68.8  ,   0.   ,                 82
     7    7.289,  16.69 ,  25.56 ,  45.3  ,  56.0  ,  88.3  ,                 83
     8    8.42 ,  19.0  ,  27.0  ,   0.   ,   0.   ,   0.   ,                 84
     9    9.3  ,  20.0  ,  30.   ,   0.   ,   0.   ,   0.   ,                 85
     T   10.748,  20.0  ,  30.0  ,   0.   ,   0.   ,   0.   ,                 86
     1    4.0  ,  22.0  ,  33.0  ,   0.   ,   0.   ,   0.   ,                 87
     2    5.279,  10.147,  34.0  ,   0.   ,   0.   ,   0.   ,                 88
     3    6.9  ,  12.1  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 89
     4    6.0  ,  11.5  ,  20.0  ,  28.8  ,   0.   ,   0.   ,                 90
     5    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 91
     6    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 92
     7    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 93
     8    5.800,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 94
     9    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   /                 95
      DATA POTF/                                                                
     1    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 96
     2    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 97
     3    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   ,                 98
     4    6.0  ,  12.0  ,  20.0  ,   0.   ,   0.   ,   0.   /                 99
      DATA XCODE/1.E14,1.E12,1.E10,1.E8,1.E6,1.E4,1.E2,1.E0/                    
      DATA ITEMP1/0/                                                            
      DATA IREAD/0/                                                             
      IF(IREAD.EQ.1)GO TO 20                                                    
      IREAD=1                                                                   
      READ(5,8)NREAD,VT                                                               
    8 FORMAT(I2,F10.2)                                                             
      WRITE(6,9)VT                                                             
    9 FORMAT(6H0VTURBF10.2)                                                     
      VT2=(VT*1.E5)**2                                                          
      IF(NREAD.GT.0)THEN
      DO 333 I=1,NREAD
C     VELSHIFT IN KM/S
      READ(5,332)J,VELSHIFT(J)
  332 FORMAT(I5,F10.5)
  333 WRITE(6,332)J,VELSHIFT(J)
      ENDIF
      DO 15 L=1,101                                                             
      READ(5,444)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP                        
  444 FORMAT(F10.4,F7.3,F5.1,F12.3,F5.1,F12.3,F9.2,2A4,A2,2A4,A2)               
      IF(WL.EQ.0.)GO TO 17
      READ(5,445)                                       WL,NELION,             
     1GAMMAR,GAMMAS,GAMMAW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2          
  445 FORMAT(                                                                   
     1F10.4,I4,F6.2,F6.2,F6.2,A4,I2,I2,I3,F7.3,I3,F7.3,2A4,A2,2A4,A2)           
      WRITE(6,1400)                                                             
 1400 FORMAT(//)                                                                
      WRITE(6,140)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,WL,NELION,             
     1GAMMAR,GAMMAS,GAMMAW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2          
  140 FORMAT(F10.4,F7.3,F5.1,F12.3,F5.1,F12.3,F9.2,2A4,A2,2A4,A2/               
     1F10.4,I4,F6.2,F6.2,F6.2,A4,I2,I2,I3,F7.3,I3,F7.3,2A4,A2,2A4,A2)           
      GFLOG=GFLOG+X1+X2                                                         
      GF=EXP(GFLOG*2.30258509299405E0)                                          
      ELO= MIN (E,EP)                                                           
      EXPOT=ELO*1.23981E-4                                                      
      GAMMAR=EXP(GAMMAR*2.30258509299405E0)                                     
      GAMMAS=EXP(GAMMAS*2.30258509299405E0)                                     
      GAMMAW=EXP(GAMMAW*2.30258509299405E0)                                     
C     CLASSICAL DAMPING CONSTANT                                                
      IF(GAMMAR.EQ.1.)GAMMAR=2.223E13/WL**2                                     
      IF(GAMMAS.NE.1..AND.GAMMAW.NE.1.)GO TO 141                                
      IF(GAMMAS.NE.1.)GO TO 138                                                 
      IF(CODE.GE.100.)GO TO 137                                                 
      EPUP= MAX (E,EP)*1.23981E-4                                               
      ZEFF=(CODE-FLOAT(INT(CODE)))*100.+1.                                     
      EFFNSQ=25.                                                                
      DEPUP=POTION(NELION)-EPUP                                                 
      IF(DEPUP.GT.0.)EFFNSQ=13.595*ZEFF**2/DEPUP                                
      GAMMAS=1.0E-8*EFFNSQ**2*SQRT(EFFNSQ)                                      
      GO TO 138                                                                 
  137 GAMMAS=1.0E-5                                                             
  138 IF(GAMMAW.NE.1.)GO TO 141                                                 
      IF(CODE.GE.100.)GO TO 139                                                 
      EPUP= MAX (E,EP)*1.23981E-4                                               
      ZEFF=(CODE-FLOAT(INT(CODE)))*100.+1.                                     
      EFFNSQ=25.                                                                
      DEPUP=POTION(NELION)-EPUP                                                 
      IF(DEPUP.GT.0.)EFFNSQ=13.595*ZEFF**2/DEPUP                                
      RSQ=2.5*(EFFNSQ/ZEFF)**2                                                  
      NSEQ=CODE-ZEFF+1.                                                         
      IF(NSEQ.GT.20.AND.NSEQ.LT.29)RSQ=(45.-FLOAT(NSEQ))/ZEFF                   
      GAMMAW=4.5E-9*RSQ**.4                                                     
      GO TO 141                                                                 
  139 GAMMAW=1.E-7/ZEFF                                                         
  141 GLOGR=LOG10(GAMMAR)                                                      
      GLOGS=LOG10(GAMMAS)                                                      
      GLOGW=LOG10(GAMMAW)                                                      
   13 CODEL(L)=CODE                                                            
      FREQL(L)=2.997925E17/WL                                               
      GFL(L)=GF                                                        
      EXPOTL(L)=EXPOT                                                                
      GAMMRL(L)=GAMMAR
      GAMMSL(L)=GAMMAS
      GAMMWL(L)=GAMMAW                                                                  
   15 CONTINUE                                                                  
      WRITE(6,16)                                                               
   16 FORMAT(15H1TOO MANY LINES)                                                
   17 NLINES=L-1                                                                
   20 IF(ITEMP.EQ.ITEMP1)GO TO 80                                               
      ITEMP1=ITEMP                                                              
      DO 21 J=1,NRHOX                                                           
C     NUMBER DENSITIES FOR VAN DER WAALS BROADENING                             
      XNFH2=0.
   21 TXNXN(J)=(XNFPH(J,1)*2.+.42*XNFPHE(J,1)*1.+.85*XNFH2)*                    
     1(T(J)/10000.)**.3                                                         
      SAVE=0.                                                                   
      DO 50 L=1,NLINES                                                          
      IF(CODEL(L).EQ.SAVE)GO TO 40                                               
      AMASS=0.                                                                  
      C=CODEL(L)                                                                 
      DO 31 II=1,8                                                              
      IF(C.GT.XCODE(II))GO TO 32                                                
   31 CONTINUE                                                                  
      CALL EXIT                                                                 
   32 DO 33 I=II,8                                                              
      ID=C/XCODE(I)                                                             
      AMASS=AMASS+ATMASS(ID)                                                    
   33 C=C-FLOAT(ID)*XCODE(I)                                                    
      SAVE=CODEL(L)                                                              
      CALL POPS(CODEL(L),1,XNFP)                                                 
      TWOMAS=2./AMASS/1.660E-24                                                 
   40 DO 35 J=1,NRHOX                                                           
      DOPNU(J,L)=SQRT(TWOMAS*TK(J)+VT2+VTURB(J)**2)/
     1 2.99792458E10*FREQL(L)                    
      ADAMP(J,L)=(GAMMRL(L)+GAMMSL(L)*XNE(J)+GAMMWL(L)*TXNXN(J))/
     1 12.5664/DOPNU(J,L)                                                                
   35 LINE(J,L)=.026538/1.77245*GFL(L)*EXP(-EXPOTL(L)/TKEV(J))*STIM(J)*            
     1XNFP(J)/RHO(J)/DOPNU(J,L)                                                 
   50 CONTINUE                                                                  
   80 DO 85 J=1,NRHOX                                                           
      AXLINE(J)=0.                                                              
C     REDSHIFT IS POSITIVE VELOCITY
      DO 83 L=1,NLINES                                                          
      V=ABS(FREQ-FREQL(L)*(1.-VELSHIFT(J)/299792.458))/DOPNU(J,L)                                           
   83 AXLINE(J)=AXLINE(J)+LINE(J,L)*VOIGT(V,ADAMP(J,L))                         
   85 SXLINE(J)=BNU(J)                                                          
      RETURN                                                                    
      END                                                                       
      FUNCTION VOIGT(V,A)                                                       
C     FUNCTION H(A,V)                                                           
C     FROM ERIC PEYTREMANN                                                      
      IMPLICIT REAL*8 (A-H,O-Z)
      LOGICAL Q                                                                 
      VV=V*V                                                                    
      Q=A.LT.0.2                                                                
      IF(Q.AND.V.GT.5.)GOTO 1                                                   
      IF(.NOT.Q.AND.(A.GT.1.4.OR.A+V.GT.3.2))GOTO 2                             
      HO=EXP(-VV)                                                               
      H2=(1.-2.*VV)*HO                                                          
      IF(V.GT.2.4)GOTO 3                                                        
      IF(V.GT.1.3)GOTO 4                                                        
      H1=(.42139*VV-2.34358*V+3.28868)*VV-.15517*V-1.1247                       
    5 IF(Q)GOTO 6                                                               
      HH1=H1+HO*1.12838                                                         
      HH2=H2+HH1*1.12838-HO                                                     
      HH3=(1.-H2)*.37613-HH1*.66667*VV+HH2*1.12838                              
      HH4=(3.*HH3-HH1)*.37613+HO*.66667*VV*VV                                   
C     H=((((HH4*A+HH3)*A+HH2)*A+HH1)*A+HO)*(((-.122727278*A+.532770573)*        
      VOIGT=                                                                    
     A  ((((HH4*A+HH3)*A+HH2)*A+HH1)*A+HO)*(((-.122727278*A+.532770573)*        
     1A-.96284325)*A+.979895032)                                                
      RETURN                                                                    
    1 VOIGT=((2.12/VV+.8463)/VV+.5642)*A/VV                                     
C   1 H=((2.12/VV+.8463)/VV+.5642)*A/VV                                         
      RETURN                                                                    
    2 AA=A*A                                                                    
      U=(AA+VV)*1.4142                                                          
      UU=U*U                                                                    
C     H=((((AA-10.*VV)*AA*3.+15.*VV*VV)/UU+3.*VV-AA)/UU+1.)*A*.79788/U          
      VOIGT=                                                                    
     A  ((((AA-10.*VV)*AA*3.+15.*VV*VV)/UU+3.*VV-AA)/UU+1.)*A*.79788/U          
      RETURN                                                                    
    3 H1=((-.0032783*VV+.0429913*V-.188326)*VV+.278712*V+.55415)/(VV-1.5        
     1)                                                                         
      GOTO 5                                                                    
    4 H1=(-.220416*VV+1.989196*V-6.61487)*VV+9.39456*V-4.4848                   
      GOTO 5                                                                    
    6 VOIGT=(H2*A+H1)*A+HO                                                      
C   6 H=(H2*A+H1)*A+HO                                                          
      RETURN                                                                    
      END                                                                       
      PROGRAM ATLAS9
c     revised 12feb99
C     TAPE1 ROSSELAND OPACITY TABLES TO BE READ IF ABUNDANCE NOT 1X SOLAR
C     TAPE2 MOLECULAR EQUILIBRIUM CONSTANTS
C     TAPE5 INPUT
C     TAPE6 OUTPUT
C     TAPE7 MODEL AND OR FLUX OUTPUT
C     TAPE9 LINE DISTRIBUTION FUNCTION INPUT
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
C     COMMON /BIGLIT/WAVELIT(1213),WAVEBIG(329)
      COMMON /BIGLIT/WAVEDF(1213,2)
      COMMON /CONT/ABTOTC(kw),ALPHAC(kw),TAUNUC(kw),SNUC(kw),HNUC(kw),
     1             JNUC(kw),JMINSC(kw),RESIDC(kw)
      REAL*8 JNUC,JMINSC
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
      COMMON /EDENS/EDENS(kw),IFEDNS
      COMMON /FILENAME/FILENAME
      CHARACTER*60 FILENAME
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /FRESET/FRESET(1563),RCOSET(1563),NULO,NUHI,NUMNU
      COMMON /HEIGHT/HEIGHT(kw)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /IFOP/IFOP(20)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
      COMMON /MUS/ANGLE(20),SURFI(20),NMU
      COMMON /OPS/AHYD(kw),AH2P(kw),AHMIN(kw),SIGH(kw),AHE1(kw),
     1       AHE2(kw),AHEMIN(kw),SIGHE(kw),ACOOL(kw),ALUKE(kw),AHOT(kw),
     2            SIGEL(kw),SIGH2(kw),AHLINE(kw),ALINES(kw),SIGLIN(kw),
     3            AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),SHYD(kw),
     4            SHMIN(kw),SHLINE(kw),SXLINE(kw),SXCONT(kw)
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),
     1              SIGMAL(kw)
      COMMON /PTOTAL/PTOTAL(kw)
      COMMON /PUT/PUT,IPUT
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /RAD/ ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      COMMON /STEPLG/STEPLG,TAU1LG,KRHOX
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /WAVEY/WBEGIN,DELTAW,IFWAVE
      COMMON /XABUND/XABUND(99),WTMOLE
      COMMON /XNF/XNFC(kw,6),XNFN(kw,6),XNFO(kw,6),XNFNE(kw,6),
     1            XNFMG(kw,6),XNFSI(kw,6),XNFS(kw,6),XNFFE(kw,5)
      COMMON /XNFP/XNFPC(kw,4),XNFPN(kw,5),XNFPO(kw,6),XNFPNE(kw,6),
     1             XNFPAL(kw,1),XNFPMG(kw,2),XNFPSI(kw,2),XNFPCA(kw,2),
     2             XNFPFE(kw,1),XNFPCH(kw),XNFPOH(kw)
      DIMENSION PART(kw,6)
C     K=1.38054E-16
C     H=6.6256E-27
C     C=2.997925E10
C     E=1.60210E-19
C     ATMASS=1.660E-24
C
C
C     INPUT SECTION
C     PREFIX P  PRESSURE
C     PREFIX T  TEMPERATURE
C     PREFIX X  ABUNDANCE FRACTION
C     PREFIX F  IONIZATION FRACTION
C     PREFIX R  FREQUENCY INTEGRAL OR INTEGRATION COEFFICIENT
C     PREFIX A OR AB  MASS ABSORPTION COEFFICIENT
C     PREFIX XNFP  NUMBER DENSITY OVER PARTITION FUNCTION
C     ALPHA IS THE FRACTION OF OPACITY CAUSED BY SCATTERING
C     NLTEON=0 LTE
C     NLTEON=1 NLTE
C     BHYD  STATISTICAL EQUILIBRIUM FACTOR FOR HYDROGEN
C     BMIN  STATISTICAL EQUILIBRIUM FACTOR FOR HMINUS
C     ABUND CONTAINS THE NORMALLY ASSUMED ABUNDANCES
C     ELEM CONTAINS THE LETTER CODES FOR ELEMENTS
C     RCOSET HAS INTEGRATION COEFFICIENTS FOR THE FREQUENCIES IN FRESET
C     NUMNU  NUMBER OF FREQUENCIES IN THE FREQUENCY SET
C     NULO  NUMBER OF THE FREQUENCY AT WHICH INTEGRATION STARTS
C     NUHI  NUMBER OF THE FREQUENCY AT WHICH INTEGRATION STOPS
C     IFCORR  TEMPERATURE CORRECTION ON OR OFF
C     IFPRES PRESSURE INTEGRATION ON OR OFF
C     IFSURF=0  CALCULATE FLUX FOR EVERY DEPTH
C     IFSURF=1  CALCULATE FLUX AT SURFACE ONLY
C     IFSURF=2  CALCULATE INTENSITY AT SURFACE
C     IFSCAT=0 NO SCATTERING IN SOURCE FUNCTION  SNU=BNU
C     IFSCAT=1 SCATTERING IN SOURCE FUNCTION  SOLVE MATRIX EQUATION
C     IFMOL=1 SET UP EQUILIBRIUM EQUATIONS FOR NUMBER DENSITIES
C     IFMOL=0  ASSUME NO MOLECULES AND ITERATE FOR NUMBER DENSITIES
C     NUMITS  NUMBER OF ITERATIONS
C     FREQID IS A LABEL FOR THE FREQUENCY SET
C     XSCALE IS A SCALING FACTOR FOR METAL ABUNDANCES
C     IFPRNT(I)=0 DO NOT PRINT ANYTHING FOR ITERATION I
C     IFPRNT(I)=1 PRINT MINIMAL SUMMARY TABLE AT END OF ITERATION
C     IFPRNT(I)=2 PRINT ALL FREQUENCY INDEPENDENT DATA
C     IFPRNT(I)=3 PRINT SNU,TAUNU,JNU,ETC.
C     IFPRNT(I)=4 PRINT OPACITIES
C     IFPNCH(I)=0 DO NOT PUNCH FOR ITERATION I
C     IFPNCH(I)=1 PUNCH STRUCTURE
C     IFPNCH(I)=2 PUNCH STRUCTURE AND SURFACE FLUX OR INTENSITY
C     IFPNCH(I)=5 PUNCH 2 AND MOLECULAR NUMBER DENSITIES/PART FNS
C     FOR IFSURF=2 HAVE NMU ANGLES
C     IFWAVE=1 STEP NUMNU WAVELENGTHS STARTING AT WBEGIN BY WSTEP
C     XABUND ARE THE ABUNDANCES USED IN THE MODEL
      ITEMP=0
C     BDFXXXBIG OR BDFXXXLIT
C     OPEN(UNIT=9,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED)
C     BDFXXXBIG0,1,2,4,8 OR BDFXXXLIT0,1,2,4,8
C     OPEN(UNIT=20,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED)
C     OPEN(UNIT=21,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED)
C     OPEN(UNIT=22,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED)
C     OPEN(UNIT=24,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED)
C     OPEN(UNIT=28,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED)
C
C     FILES BLOCKED FOR CDROM
C     BDFXXXBIG OR BDFXXXLIT
C     OPEN(UNIT=9,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED,
C    1 RECORDTYPE='FIXED',RECL=7056)
C     BDFXXXBIG0,1,2,4,8 OR BDFXXXLIT0,1,2,4,8
C     OPEN(UNIT=20,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED,
C    1 RECORDTYPE='FIXED',RECL=7056)
C     OPEN(UNIT=21,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED,
C    1 RECORDTYPE='FIXED',RECL=7056)
C     OPEN(UNIT=22,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED,
C    1 RECORDTYPE='FIXED',RECL=7056)
C     OPEN(UNIT=24,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED,
C    1 RECORDTYPE='FIXED',RECL=7056)
C     OPEN(UNIT=28,FORM='UNFORMATTED',STATUS='OLD',READONLY,SHARED,
C    1 RECORDTYPE='FIXED',RECL=7056)
    1 CALL READIN(1)
C     CALL READMOL
C
C     ITERATION SECTION
      DO 100 ITERAT=1,NUMITS
      ITER=ITERAT
C     CHANGING ITEMP TELLS THE SUBROUTINES THEY HAVE A NEW TEMPERATURE
      ITEMP=ITEMP+ITER
C
      IF(IFPRES.EQ.0)GO TO 12
C     INTEGRATE EQUATION OF HYDROSTATIC EQUILIBRIUM
      PZERO=PCON+PRADK0+PTURB0
      DO 11 J=1,NRHOX
C     PTOTAL(J)=GRAV*RHOX(J)
      PTOTAL(J)=GRAV*RHOX(J)+PZERO
      P(J)=GRAV*RHOX(J)-PRAD(J)-PTURB(J)-PCON
      IF(P(J).GT.0.)GO TO 11
      CALL W(6HJ     ,DFLOAT(J),1)
      CALL W(6HP     ,P,J)
      CALL W(6HPZERO ,PZERO,1)
      CALL W(6HACCRAD,ACCRAD,NRHOX)
      CALL W(6HPRAD  ,PRAD,NRHOX)
      CALL EXIT
   11 CONTINUE
  111 CONTINUE
C  11 P(J)=PTOTAL(J)-PRAD(J)-PTURB(J)
      IFEDNS=0
      CALL POPS(0.D0,1,XNE)
   12 CONTINUE
      CALL POPS(1.01D0,11,XNFPH)
      CALL POPS(2.02D0,11,XNFPHE)
      CALL POPS(6.03D0,11,XNFPC)
      CALL POPS(7.04D0,11,XNFPN)
      CALL POPS(8.05D0,11,XNFPO)
      CALL POPS(10.05D0,11,XNFPNE)
      CALL POPS(12.01D0,11,XNFPMG)
      CALL POPS(13.00D0,11,XNFPAL)
      CALL POPS(14.01D0,11,XNFPSI)
      CALL POPS(20.01D0,11,XNFPCA)
      CALL POPS(26.00D0,11,XNFPFE)
      IF(IFMOL.EQ.0)THEN
      CALL POPS(1.01D0,12,XNFH)
      CALL POPS(2.02D0,12,XNFHE)
      CALL POPS(6.05D0,12,XNFC)
      CALL POPS(7.05D0,12,XNFN)
      CALL POPS(8.05D0,12,XNFO)
      CALL POPS(10.05D0,12,XNFNE)
      CALL POPS(12.05D0,12,XNFMG)
      CALL POPS(14.05D0,12,XNFSI)
      CALL POPS(16.05D0,12,XNFS)
      CALL POPS(26.04D0,12,XNFFE)
      ENDIF
      IF(IFMOL.EQ.1)THEN
      CALL POPS(106.00D0,11,XNFPCH)
      CALL POPS(108.00D0,11,XNFPOH)
C     CALL W(6HXNFPCH,XNFPCH,NRHOX)
C     CALL W(6HXNFPOH,XNFPOH,NRHOX)
C     THE POPS WILL NOT RETURN NUMBER DENSITIES WHEN MOLECULES ARE ON
C     SO WE COMPUTE NUMBER DENSITIES/PART FUNCTIONS  AND PART FUNCTIONS
      CALL POPS(6.05D0,11,XNFC)
      CALL POPS(7.05D0,11,XNFN)
      CALL POPS(8.05D0,11,XNFO)
      CALL POPS(10.05D0,11,XNFNE)
      CALL POPS(12.05D0,11,XNFMG)
      CALL POPS(14.05D0,11,XNFSI)
      CALL POPS(16.05D0,11,XNFS)
      CALL POPS(26.04D0,11,XNFFE)
      DO 444 J=1,NRHOX
      CALL PFSAHA(J,1,1,3,PART)
      XNFH(J,1)=XNFPH(J,1)*PART(J,1)
      XNFH(J,2)=XNFPH(J,2)
      CALL PFSAHA(J,2,2,13,PART)
      XNFHE(J,1)=XNFPHE(J,1)*PART(J,1)
      XNFHE(J,2)=XNFPHE(J,2)*PART(J,2)
      XNFHE(J,3)=XNFPHE(J,3)
      CALL PFSAHA(J,6,6,13,PART)
      XNFC(J,1)=XNFC(J,1)*PART(J,1)
      XNFC(J,2)=XNFC(J,2)*PART(J,2)
      XNFC(J,3)=XNFC(J,3)*PART(J,3)
      XNFC(J,4)=XNFC(J,4)*PART(J,4)
      XNFC(J,5)=XNFC(J,5)*PART(J,5)
      XNFC(J,6)=XNFC(J,6)*PART(J,6)
      CALL PFSAHA(J,7,6,13,PART)
      XNFN(J,1)=XNFN(J,1)*PART(J,1)
      XNFN(J,2)=XNFN(J,2)*PART(J,2)
      XNFN(J,3)=XNFN(J,3)*PART(J,3)
      XNFN(J,4)=XNFN(J,4)*PART(J,4)
      XNFN(J,5)=XNFN(J,5)*PART(J,5)
      XNFN(J,6)=XNFN(J,6)*PART(J,6)
      CALL PFSAHA(J,8,6,13,PART)
      XNFO(J,1)=XNFO(J,1)*PART(J,1)
      XNFO(J,2)=XNFO(J,2)*PART(J,2)
      XNFO(J,3)=XNFO(J,3)*PART(J,3)
      XNFO(J,4)=XNFO(J,4)*PART(J,4)
      XNFO(J,5)=XNFO(J,5)*PART(J,5)
      XNFO(J,6)=XNFO(J,6)*PART(J,6)
      CALL PFSAHA(J,10,6,13,PART)
      XNFNE(J,1)=XNFNE(J,1)*PART(J,1)
      XNFNE(J,2)=XNFNE(J,2)*PART(J,2)
      XNFNE(J,3)=XNFNE(J,3)*PART(J,3)
      XNFNE(J,4)=XNFNE(J,4)*PART(J,4)
      XNFNE(J,5)=XNFNE(J,5)*PART(J,5)
      XNFNE(J,6)=XNFNE(J,6)*PART(J,6)
      CALL PFSAHA(J,12,6,13,PART)
      XNFMG(J,1)=XNFMG(J,1)*PART(J,1)
      XNFMG(J,2)=XNFMG(J,2)*PART(J,2)
      XNFMG(J,3)=XNFMG(J,3)*PART(J,3)
      XNFMG(J,4)=XNFMG(J,4)*PART(J,4)
      XNFMG(J,5)=XNFMG(J,5)*PART(J,5)
      XNFMG(J,6)=XNFMG(J,6)*PART(J,6)
      CALL PFSAHA(J,14,6,13,PART)
      XNFSI(J,1)=XNFSI(J,1)*PART(J,1)
      XNFSI(J,2)=XNFSI(J,2)*PART(J,2)
      XNFSI(J,3)=XNFSI(J,3)*PART(J,3)
      XNFSI(J,4)=XNFSI(J,4)*PART(J,4)
      XNFSI(J,5)=XNFSI(J,5)*PART(J,5)
      XNFSI(J,6)=XNFSI(J,6)*PART(J,6)
      CALL PFSAHA(J,16,6,13,PART)
      XNFS(J,1)=XNFS(J,1)*PART(J,1)
      XNFS(J,2)=XNFS(J,2)*PART(J,2)
      XNFS(J,3)=XNFS(J,3)*PART(J,3)
      XNFS(J,4)=XNFS(J,4)*PART(J,4)
      XNFS(J,5)=XNFS(J,5)*PART(J,5)
      XNFS(J,6)=XNFS(J,6)*PART(J,6)
      CALL PFSAHA(J,26,5,13,PART)
      XNFFE(J,1)=XNFFE(J,1)*PART(J,1)
      XNFFE(J,2)=XNFFE(J,2)*PART(J,2)
      XNFFE(J,3)=XNFFE(J,3)*PART(J,3)
      XNFFE(J,4)=XNFFE(J,4)*PART(J,4)
      XNFFE(J,5)=XNFFE(J,5)*PART(J,5)
  444 CONTINUE
      ENDIF
C
      CALL PUTOUT(1)
C
C     ERASE FREQUENCY INTEGRALS
      IF(IFCORR.EQ.1)CALL TCORR(1,0)
      CALL ROSS(1,0)
      CALL RADIAP(1,0)
      IF(NLTEON.EQ.1)CALL STATEQ(1,0)
C
C     FREQUENCY INTEGRATION SECTION
      DO 25 NU=NULO,NUHI
      IF(IFWAVE.EQ.0)GO TO 21
      IF(WBEGIN.GT.1.E10)GO TO 210
      WAVE=WBEGIN+DFLOAT(NU-NULO)*DELTAW
      FREQ=2.997925E17/WAVE
      RCO=ABS(DELTAW/WAVE*FREQ)
      GO TO 22
C     EQUALLY SPACED FREQUENCIES
  210 FREQ=WBEGIN+DFLOAT(NU-NULO)*DELTAW
      RCO=DELTAW
      GO TO 22
   21 FREQ=FRESET(NU)
      RCO=RCOSET(NU)
   22 FREQLG=DLOG(FREQ)
      DO 20 J=1,NRHOX
      EHVKT(J)=EXP(-FREQ*HKT(J))
      STIM(J)=1.-EHVKT(J)
C  20 BNU(J)=1.47439E-47*FREQ**3*EHVKT(J)/STIM(J)
C     FOR UNDERFLOW ON UNIVAC
      FREQ15=FREQ/1.E15
   20 BNU(J)=1.47439E-2*FREQ15**3*EHVKT(J)/STIM(J)
      IF(IFOP(15).EQ.1)GO TO 60
      IF(IFOP(16).EQ.1)GO TO 60
      CALL PUTOUT(2)
      N=1
      CALL KAPP(N,NSTEPS,STEPWT)
      CALL JOSH(IFSCAT,IFSURF)
C
      DO 7654 J=1,NRHOX
      IF(SNU(J).LT.0.)CALL ABORT
      IF(JNU(J).LT.0.)CALL ABORT
      IF(HNU(J).LT.0.)CALL ABORT
 7654 CONTINUE
C
      RCOWT=RCO*STEPWT
      IF(IFSURF.GT.0)GO TO 53
      IF(IFCORR.EQ.1)CALL TCORR(2,RCOWT)
      CALL RADIAP(2,RCOWT)
      CALL ROSS(2,RCOWT)
      IF(NLTEON.EQ.1)CALL STATEQ(2,RCOWT)
C     THIS PASSES VALUE OF STEPWT TO PUTOUT
   53 PUT=STEPWT
      IPUT=NSTEPS
      CALL PUTOUT(3)
      CALL PUTOUT(4)
      GO TO 25
C
   60 N=0
      CALL KAPP(N,NSTEPS,STEPWT)
      CALL JOSH(IFSCAT,IFSURF)
      IF(IFSURF.EQ.2)HNU(1)=SURFI(1)
      IF(IFSURF.EQ.2)CONTIN=SURFI(1)
      IF(IFSURF.LT.2)CONTIN=HNU(1)
      PUT=CONTIN
      CALL PUTOUT(2)
      IF(IFSURF.GT.0)GO TO 700
      DO 70 J=1,NRHOX
      ABTOTC(J)=ABTOT(J)
      ALPHAC(J)=ALPHA(J)
      TAUNUC(J)=TAUNU(J)
      SNUC(J)=SNU(J)
      HNUC(J)=HNU(J)
      JNUC(J)=JNU(J)
      JMINSC(J)=JMINS(J)
   70 RESIDC(J)=0.
  700 SUMWT=0.
      RESIDC(1)=0.
C
      N=1
      GO TO 72
C
   24 N=N+1
C     if(n.gt.1)go to 72
      IF(RESIDC(1).GT..9995)GO TO 79
      IF(RESIDC(1).GT..998.AND.IFSURF.GT.0)GO TO 79
      IF(IFSURF.GT.0)GO TO 72
      DO 71 J=1,NRHOX
      IF(RESIDC(J).LT..998 )GO TO 72
C     IF(RESIDC(J).LT..999 )GO TO 72
   71 CONTINUE
   79 STEPWT=1.-SUMWT
      N=N+1
      IF(STEPWT.LT..0001)STEPWT=0.
      N=NSTEPS+1
      RESIDC(1)=1.
      IF(IFSURF.EQ.1)HNU(1)=CONTIN
      IF(IFSURF.EQ.2)SURFI(1)=CONTIN
      IF(IFSURF.GT.0)GO TO 770
      DO 75 J=1,NRHOX
      ABTOT(J)=ABTOTC(J)
      ALPHA(J)=ALPHAC(J)
      TAUNU(J)=TAUNUC(J)
      SNU(J)=SNUC(J)
      HNU(J)=HNUC(J)
      JNU(J)=JNUC(J)
   75 JMINS(J)=JMINSC(J)
      GO TO 76
   72 CALL LINOP(N,NSTEPS,STEPWT)
      DO 73 J=1,NRHOX
   73 ALINE(J)=ALINES(J)
      CALL JOSH(IFSCAT,IFSURF)
      IF(IFSURF.EQ.2)HNU(1)=SURFI(1)
      RESIDC(1)=1.
      IF(IFSURF.EQ.1.AND.CONTIN.GT.0.)RESIDC(1)=HNU(1)/CONTIN
      IF(IFSURF.EQ.2.AND.CONTIN.GT.0.)RESIDC(1)=SURFI(1)/CONTIN
      IF(IFSURF.GT.0)GO TO 770
   76 DO 77 J=1,NRHOX
      RESIDC(J)=1.
      IF(HNUC(J).GT.0.)RESIDC(J)=HNU(J)/HNUC(J)
   77 CONTINUE
  770 SUMWT=SUMWT+STEPWT
   78 RCOWT=RCO*STEPWT
C
      IF(STEPWT.EQ.0.)GO TO 23
      IF(IFSURF.GT.0)GO TO 23
      IF(IFCORR.EQ.1)CALL TCORR(2,RCOWT)
      CALL RADIAP(2,RCOWT)
      CALL ROSS(2,RCOWT)
      IF(NLTEON.EQ.1)CALL STATEQ(2,RCOWT)
C     THIS PASSES VALUE OF STEPWT TO PUTOUT
   23 PUT=STEPWT
      IPUT=NSTEPS
      CALL PUTOUT(3)
      IF(N.LT.NSTEPS)GO TO 24
      IF(N.EQ.NSTEPS)GO TO 79
      CALL PUTOUT(4)
   25 CONTINUE
      IF(IFSURF.GT.0)GO TO 1
C
C     FINISH ITERATION
      CALL ROSS(3,0)
      CALL HIGH
      CALL RADIAP(3,0)
      IF(IFPRES.EQ.1.AND.IFCONV.EQ.1)CALL CONVEC
      IF(IFCORR.EQ.1)CALL TCORR(3,0)
      IF(NLTEON.EQ.1)CALL STATEQ(3,0)
      IF(IFTURB.EQ.1)CALL TURB
      CALL PUTOUT(5)
C
  100 CONTINUE
      GO TO 1
      END
      SUBROUTINE PUTOUT(MODE)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /FRESET/FRESET(1563),RCOSET(1563),NULO,NUHI,NUMNU
      COMMON /HEIGHT/HEIGHT(kw)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /IFOP/IFOP(20)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
      COMMON /MUS/ANGLE(20),SURFI(20),NMU
      COMMON /OPS/AHYD(kw),AH2P(kw),AHMIN(kw),SIGH(kw),AHE1(kw),
     1       AHE2(kw),AHEMIN(kw),SIGHE(kw),ACOOL(kw),ALUKE(kw),AHOT(kw),
     2            SIGEL(kw),SIGH2(kw),AHLINE(kw),ALINES(kw),SIGLIN(kw),
     3            AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),SHYD(kw),
     4            SHMIN(kw),SHLINE(kw),SXLINE(kw),SXCONT(kw)
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),
     1              SIGMAL(kw)
      COMMON /PTOTAL/PTOTAL(kw)
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /PUT/PUT,IPUT
      COMMON /RAD/ ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /WAVEY/WBEGIN,DELTAW,IFWAVE
      COMMON /XABUND/XABUND(99),WTMOLE
      COMMON /RR/RJMINSNU(kw),RDIAGJNU(kw)
      DIMENSION SURFIN(20),F(20),DUMMY(kw,25),ABLOG(20)
      EQUIVALENCE (DUMMY(1,1),AHYD(1)),(F(1),STIM(1))
      DATA ON,OFF/3HON ,3HOFF/
C
      GO TO(100,200,300,400,500),MODE
C
C     HEADINGS
  100 IF(IFPRNT(ITER).EQ.0)RETURN
      IFHEAD=0
      NU=NULO-1
      IF(IFPNCH(ITER).LT.2)RETURN
      WRITE(7,111)TEFF,GLOG,WLTE,TITLE
  111 FORMAT(5HTEFF ,F7.0,9H  GRAVITY,F8.5,1X,A4/6HTITLE ,74A1)
      IF(IFSURF.NE.2)RETURN
      WRITE(7,112)NMU,(ANGLE(MU),MU=1,NMU)
  112 FORMAT(I3,' ANGLES',10F7.4/10X,10F7.4)
      RETURN
C
C     INITIALIZE SUMS OVER STEPS
  200 HSURF=0.
C     HNU(1)=0.
      WAVE=2.997925E17/FREQ
      NU=NU+1
      DO 201 MU=1,NMU
  201 SURFIN(MU)=0.
      N=0
      CONTIN=PUT
      RETURN
C
C     SUM OVER STEPS AND STEP DEPENDENT QUANTITIES
  300 N=N+1
      NSTEPS=IPUT
      STEPWT=PUT
      HSURF=HSURF+HNU(1)*STEPWT
      DO 301 MU=1,NMU
  301 SURFIN(MU)=SURFIN(MU)+SURFI(MU)*STEPWT
      IF(IFPRNT(ITER).EQ.0)RETURN
      IF(NSTEPS.EQ.1)GO TO 310
      IF(IFHEAD.EQ.0)WRITE(6,101)
      IFHEAD=1
C     IF(N.EQ.1)WRITE(6,303)
      IF(N.EQ.1.AND.IFPRNT(ITER).GT.1)WRITE(6,303)
  303 FORMAT(1H0)
      RESID=1.
      IF(CONTIN.GT.0.)RESID=HNU(1)/CONTIN
      HNULG=DLOG10(DMAX1(HNU(1),1.D-50))
C     HNULG=DLOG10(DMAX1(HNU(1),1.D-30))
C     HNULG=DLOG10(HNU(1))
      HNUMG=-2.5*HNULG
      DO 340 JTAU1=1,NRHOX
      IF(TAUNU(JTAU1).GT.1.)GO TO 341
  340 CONTINUE
  341 CONTINUE
C     RHOX1=DLOG10(RHOX1)
C     IDUM=MAP1(TAUNU,RHOX,NRHOX,1.D0,RHOX1,1)
      TAUEND=DLOG10(TAUNU(NRHOX))
      IF(IFPRNT(ITER).GT.1)
     1WRITE(6,305)STEPWT,HNU(1),HNULG,HNUMG,RESID,JTAU1,TAUEND
  305 FORMAT(61X,F10.8,1PE13.4,0PF12.5,F10.3,F9.5,I6,F6.2)
  310 IF(IFPRNT(ITER).EQ.4)GO TO 320
      IF(IFPRNT(ITER).NE.3)RETURN
      WRITE(6,312)WAVE,FREQ,(J,RHOX(J),TAUNU(J),ABTOT(J),
     1ALPHA(J),BNU(J),SNU(J),JNU(J),JMINS(J),HNU(J),
     2RJMINSNU(J),RDIAGJNU(J),J=1,NRHOX)
C     1ALPHA(J),BNU(J),SNU(J),JNU(J),JMINS(J),HNU(J),J=1,NRHOX)
  312 FORMAT(1H1//6X,10HWAVELENGTH,F9.3,3X,9HFREQUENCY,1PE13.6/
     1/12X,4HRHOX,7X,5HTAUNU,6X,5HABTOT,5X,5HALPHA,8X,3HBNU,8X,3HSNU,
     2 8X,3HJNU,7X,5HJMINS,7X,3HHNU/(5X,I3,1P11E11.3))
C     2 8X,3HJNU,7X,5HJMINS,7X,3HHNU/(6X,I2,1P9E11.3))
      RETURN
  320 WRITE(6,321)
  321 FORMAT( 126H1       AHYD  AH2P AHMIN  SIGH  AHE1 AHE2 AHEMIN SIGHE
     1 ACOOL ALUKE AHOT SIGEL SIGH2 AHLINEALINESSIGLINAXLINE SIGXLAXCONT
     2  SIGX)
      DO 325 J=1,NRHOX
      DO 322 I=1,20
      ABLOG(I)=0.
      IF(DUMMY(J,I).GT.1.E-99)ABLOG(I)=DLOG10(DUMMY(J,I))
  322 CONTINUE
  325 WRITE(6,326)J,ABLOG,J
  326 FORMAT(I4,2X,20F6.2,1X,I3)
      RETURN
C
C     PRINT SUMS OVER STEPS
C 400 IF(IFPRNT(ITER).EQ.0)RETURN
  400 IF(NSTEPS.EQ.1)CONTIN=HSURF
      IF(CONTIN.GT.0.)RESID=HSURF/CONTIN
      IF(HSURF.LE.0.)HSURF=1.D-50
C      IF(HSURF.LE.0.)HSURF=1.E-30
      IF(IFPRNT(ITER).LE.1)GO TO 410
      DO 440 JTAU1=1,NRHOX
      IF(TAUNU(JTAU1).GT.1.)GO TO 441
  440 CONTINUE
  441 CONTINUE
C     IDUM=MAP1(TAUNU,RHOX,NRHOX,1.D0,RHOX1,1)
C     RHOX1=DLOG10(RHOX1)
      TAUEND=DLOG10(TAUNU(NRHOX))
      IF(NSTEPS.GT.1)JTAU1=0
      IF(NSTEPS.GT.1)TAUEND=0.
      IF(IFSURF.NE.0.AND.IFSURF.NE.1)GO TO 405
      IF(IFHEAD.EQ.0)WRITE(6,101)
  101 FORMAT(1H1/////10X,4HWAVE,7X,7HHLAMBDA,7X,5HLOG H,7X,3HMAG,
     1 10X,9HFREQUENCY,8X,3HHNU,10X,5HLOG H,7X,3HMAG,10X,6HTAUONE,
     2 6H TAUNU)
      IFHEAD=1
      HLAM=HSURF*FREQ/WAVE
      HNULG=DLOG10(HSURF)
      HLAMLG=DLOG10(HLAM)
      HLAMMG=-2.5*HLAMLG
      HNUMG=-2.5*HNULG
      WRITE(6,1401)
 1401 FORMAT(1H )
      WRITE (6,401)NU,WAVE,HLAM,HLAMLG,HLAMMG,FREQ,HSURF,HNULG,HNUMG,
     1RESID,JTAU1,TAUEND,NU
  401 FORMAT(I6,F10.3,1PE13.4,0PF12.5,F10.3,1PE20.6,E13.4,0PF12.5,F10.3,
     1F9.5,I6,F6.2,I5)
  405 IF(IFSURF.NE.2)GO TO 410
      IF(IFHEAD.EQ.0)WRITE(6,102)
  102 FORMAT(1H1/////10X,4HWAVE,5X,9HFREQUENCY,3X,12HTAUONE TAUNU,
     15(17H   MU  INTENSITY ))
      IFHEAD=1
      WRITE(6,406)NU,WAVE,FREQ,JTAU1,TAUEND,
     1(ANGLE(MU),SURFIN(MU),MU=1,NMU)
  406 FORMAT(I6,F9.3,1PE15.6,I6,0PF6.2,5(0PF7.4,1PE10.3)/
     1(42X,5(0PF7.4,1PE10.3)))
  410 IF(IFPNCH(ITER).LT.2)RETURN
      IF(IFSURF.GT.2)RETURN
      IF(IFSURF.EQ.2)GO TO 415
      WRITE(7,411)NU,WAVE,FREQ,HSURF,CONTIN,RESID
  411 FORMAT(4HFLUX,I5,F9.2,1PE20.6,E13.4,E13.4,0PF10.5)
      IF(NU.EQ.NUHI)WRITE(7,411)
      RETURN
C  415 WRITE(7,416)FREQ,(ANGLE(MU),SURFIN(MU),MU=1,NMU)
C  416 FORMAT(9HINTENSITY,1PE15.6,1X,3(0PF6.4,1PE10.3)/
C     1(5(0PF6.4,1PE10.3)))
  415 WRITE(7,416)NU,WAVE,FREQ,(SURFIN(MU),MU=1,NMU)
  416 FORMAT(9HINTENSITY,I5,F9.2,1PE15.6/(1P8E10.3))
      IF(NU.EQ.NUHI)WRITE(7,416)
      RETURN
C
C     SUMMARIES
  500 IF(IFPRNT(ITER).EQ.0)GO TO 550
C      IF(IFPRNT(ITER).EQ.1)GO TO 540
      WRITE(6,501)(J,RHOX(J),PTOTAL(J),PTURB(J),GRDADB(J),DLTDLP(J),
     1VELSND(J),DLRDLT(J),HEATCP(J),HSCALE(J),VCONV(J),FLXCNV(J),
     2J=1,NRHOX)
  501 FORMAT(1H1/////132H        RHOX       PTOTAL     PTURB      GRDADB+
     1     DLTDLP     VELSND     DLRDLT     HEATCP     HSCALE     VCONV +
     2     FLXCNV            /(I4,1P11E11.3))
      WRITE(6,502)FLUX
  502 FORMAT(1H0,108X,4HFLUX,1PE12.4)
      WRITE(6,503)(J,XNATOM(J),RADEN(J),PRADK(J),XNFPH(J,1),XNFPH(J,2),
     1XNFPHE(J,1),XNFPHE(J,2),XNFPHE(J,3),VTURB(J),
     2FLXCNV0(J),FLXCNV1(J),J=1,NRHOX)
  503 FORMAT(1H1/////132H       XNATOM      RADEN      PRADK     XNFPH1 +
     1    XNFPH2     XNFPHE1    XNFPHE2    XNFPHE3     VTURB            +
     2                       /(I4,1P11E11.3))
      CALL W(6HPRADK0,PRADK0,1)
  540 WRITE(6,541)TEFF,GLOG,TITLE,ITER
  541 FORMAT(1H1//////5H TEFF,F8.0,8H   LOG G,F9.5,10X,74A1,2X,
     1 9HITERATION,I3)
      DO 539 J=1,NRHOX
      IF(IFCORR.EQ.0)FLXRAD(J)=FLUX-FLXCNV(J)
  539 FLXCNV(J)=FLXCNV(J)/(FLXCNV(J)+FLXRAD(J))
      WRITE(6,542)(J,RHOX(J),T(J),P(J),XNE(J),RHO(J),ABROSS(J),
     1HEIGHT(J),TAUROS(J),FLXCNV(J),ACCRAD(J),FLXERR(J),FLXDRV(J),
     2J=1,NRHOX)
  542 FORMAT(132H0                                    ELECTRON          +
     1   ROSSELAND    HEIGHT   ROSSELAND   FRACTION  RADIATIVE        PE
     2R CENT FLUX /132H        RHOX      TEMP    PRESSURE    NUMBER    D
     3ENSITY      MEAN       (KM)      DEPTH    CONV FLUX  ACCELERATION +
     4   ERROR    DERIV/(I4,1PE10.3,0PF9.1,1P8E11.3,0PF12.3,F9.3))
  550 IF(IFPNCH(ITER).EQ.0)RETURN
C
C     PUNCHOUT
      A=OFF
      IF(IFCONV.EQ.1)A=ON
      B=OFF
      IF(IFTURB.EQ.1)B=ON
      WRITE(7,552) TEFF,GLOG,WLTE,TITLE,IFOP,A,MIXLTH,B,TRBFDG,
     1TRBPOW,TRBSND,TRBCON,XSCALE,(IZ,ABUND(IZ),IZ=1,99)
C    1TRBPOW,TRBSND,TRBCON,XSCALE,(IZ,ABUND(IZ),IZ=1,2)
  552 FORMAT(5HTEFF ,F7.0,9H  GRAVITY,F8.5,1X,A4/6HTITLE ,74A1
     1/13H OPACITY IFOP20I2/12H CONVECTION A3,F6.2,12H TURBULENCE A3,
     24F6.2/16HABUNDANCE SCALE ,F9.5,17H ABUNDANCE CHANGE,2(I2,F8.5)/
     3(17H ABUNDANCE CHANGE,6(I3,F7.2)))
      WRITE(7,554)NRHOX,(RHOX(J),T(J),P(J),XNE(J),ABROSS(J),ACCRAD(J),
     1VTURB(J),FLXCNV(J),VCONV(J),VELSND(J),J=1,NRHOX)
  554 FORMAT('READ DECK6',I3,' RHOX,T,P,XNE,ABROSS,ACCRAD,VTURB,
     1 FLXCNV,VCOMV,VELSND'/(1PE15.8,0PF9.1,1P8E10.3))
      WRITE(7,555)PRADK0
  555 FORMAT(5HPRADK,1PE11.4)
      IF(NLTEON.EQ.0)GO TO 560
      WRITE(7,556)NRHOX,(RHOX(J),(BHYD(J,I),I=1,6),BMIN(J),J=1,NRHOX)
  556 FORMAT(27HREAD DEPARTURE COEFFICIENTSI3,21H RHOX  BHYD 1-6  BMIN/
     1(1PE11.4,0P7F9.4))
  560 IF(IFWAVE.EQ.1)GO TO 570
C     WRITE(7,562)NUMNU,NULO,NUHI,FREQID,(NU,FRESET(NU),RCOSET(NU),
C    1NU=1,NUMNU)
C 562 FORMAT(16HREAD FREQUENCIES3I4,3X6A1/(I5,1P2E17.8,I5,2E17.8))
  570 WRITE(7,571)ITER
  571 FORMAT(5HBEGIN,20X,10HITERATION I3,10H COMPLETED )
      CLOSE(UNIT=7)
      RETURN
      END
      SUBROUTINE TCORR(MODE,RCOWT)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /FRESET/FRESET(1563),RCOSET(1563),NULO,NUHI,NUMNU
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /PTOTAL/PTOTAL(kw)
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /RAD/ ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /STEPLG/STEPLG,TAU1LG,KRHOX
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /RR/RJMINSNU(kw),RDIAGJNU(kw)
      DIMENSION RJMINS(kw),RDABH(kw),RDIAGJ(kw),OLDT1(kw)
      DIMENSION DABTOT(kw),DTDRHX(kw),HRATIO(kw),CODRHX(kw),G(kw),
     1GFLUX(kw),DDLT(kw),DTAU(kw),DTFLUX(kw),DTLAMB(kw),DUM(kw),
     2TINTEG(kw),DTSURF(kw),T1(kw),CNVFLX(kw),GRDEFF(kw),RHOXL(kw)
      DIMENSION DABROS(kw)
      DIMENSION TAUSTD(kw),TPLUS(kw),TNEW1(kw),TNEW2(kw)
      DIMENSION AB1(kw),PTOT1(kw),P1(kw),AB2(kw),PTOT2(kw),P2(kw)
      DIMENSION PPP(kw),RRR(kw),DRHOX(kw)
      DIMENSION PRDNEW(kw)
      DIMENSION DDEL(kw)
      DIMENSION DUM1(kw),DUM2(kw),DUM3(kw),DUM4(kw),DUM5(kw)
      DIMENSION DUM6(kw),DUM7(kw),DUM8(kw)
      DIMENSION CCCCCC(kw)
C))))))))))))))))))))))))
      GO TO (10,20,30),MODE
C     ERASE FREQUENCY INTEGRALS
   10 DO 11 J=1,NRHOX
      RJMINS(J)=0.
      RDABH(J)=0.
      RDIAGJ(J)=0.
   11 FLXRAD(J)=0.
      RETURN
C
C     FREQUENCY INTEGRATION
C((((((((((((((((((((((((
C  20 DO 21 J=1,NRHOX
   20 CALL DERIV(RHOX,ABTOT,DABTOT,NRHOX)
      DO 21 J=1,NRHOX
      RDABH(J)=RDABH(J)+DABTOT(J)/ABTOT(J)*HNU(J)*RCOWT
C))))))))))))))))))))))))
C      RJMINS(J)=RJMINS(J)+ABTOT(J)*JMINS(J)*RCOWT
      RJMINSNU(J)=ABTOT(J)*JMINS(J)*RCOWT
      RJMINS(J)=RJMINS(J)+RJMINSNU(J)
   21 FLXRAD(J)=FLXRAD(J)+HNU(J)*RCOWT
      TERM2=0.
      DO 24 J=1,NRHOX
      TERM1=TERM2
      IF(J.NE.NRHOX)D=TAUNU(J+1)-TAUNU(J)
      D=MAX(1.D-10,D)
      IF(D.LE..01)GO TO 23
      EX=0.
      IF(D.LT.10.)EX=EXPI(3,D)
      TERM2=.5*(D+EX-.5)/D
      GO TO 22
   23 TERM2=(.922784335098467-DLOG(D))*D/4.+D**2/12.-D**3/96.+D**4/720.
C   23 TERM2=(.922784335098467-DLOG(D))*D*(.25+D*(8.33333333333333E-2+D*
C     1(1.04166666666667E-2+D*1.38888888888889E-3)))
   22 DIAGJ=TERM1+TERM2
      DBDT=BNU(J)*FREQ*HKT(J)/T(J)/STIM(J)
      IF(NUMNU.EQ.1)DBDT=FLUX*16./T(J)
C   24 RDIAGJ(J)=RDIAGJ(J)+ABTOT(J)*(DIAGJ-1.)/(1.-ALPHA(J)*DIAGJ)*
C     1(1.-ALPHA(J))*DBDT*RCOWT
      RDIAGJNU(J)=ABTOT(J)*(DIAGJ-1.)/(1.-ALPHA(J)*DIAGJ)*
     1(1.-ALPHA(J))*DBDT*RCOWT
   24 RDIAGJ(J)=RDIAGJ(J)+RDIAGJNU(J)
      RETURN
C
C     AVRETT-KROOK TAU CORRECTION MODIFIED FOR CONVECTION
   30 CALL DERIV(RHOX,T,DTDRHX,NRHOX)
      CALL DERIV(RHOX,DLTDLP,DDLT,NRHOX)
C((((((((((((((((((((((((
      CALL DERIV(RHOX,ABROSS,DABROS,NRHOX)
      DO 3100 J=1,NRHOX
      CNVFLX(J)=0.
      IF(IFCONV.EQ.1)CNVFLX(J)=FLXCNV(J)
      IF(J.LT.3)CNVFLX(J)=0.
 3100 CONTINUE
      DO 3101 J=2,NRHOX-1
 3101 CCCCCC(J)=.25*CNVFLX(J-1)+.5*CNVFLX(J)+.25*CNVFLX(J+1)
      DO 3102 J=2,NRHOX-1
 3102 CNVFLX(J)=CCCCCC(J)
      DO 31 J=1,NRHOX
      RDABH(J)=RDABH(J)-FLXRAD(J)*DABROS(J)/ABROSS(J)
C))))))))))))))))))))))))
      DEL=1.
      D=0.
      IF(CNVFLX(J).GT.0..AND.FLXCNV0(J).GT.0.)THEN
      DEL=DLTDLP(J)-GRDADB(J)
      VCO=.5*MIXLTH*SQRT(MAX(-.5*PTOTAL(J)/RHO(J)*DLRDLT(J),0.D0))
      FLUXCO=.5*RHO(J)*HEATCP(J)*T(J)*MIXLTH/12.5664
      IF(MIXLTH.GT.0.AND.VCO.GT.0.)D=8.*5.6697E-5*T(J)**4/
     1(ABROSS(J)*HSCALE(J)*RHO(J))/(FLUXCO*12.5664)/VCO
      D=D**2/2.
      DDEL(J)=(1.+D/(D+DEL))/DEL
      ENDIF
      CNVFL=0.
      IF(CNVFLX(J)/FLXRAD(J).GT.1.E-3.AND.FLXCNV0(J)/FLXRAD(J).GT.1.E-3)
     1CNVFL=CNVFLX(J)
C  31 CODRHX(J)=(RDABH(J)+CNVFLX(J)*(DTDRHX(J)/T(J)*(1.-9.*D/(D+DEL))+
   31 CODRHX(J)=(RDABH(J)+CNVFL    *(DTDRHX(J)/T(J)*(1.-9.*D/(D+DEL))+
     1 1.5*DDLT(J)/DEL*(1.+D/(D+DEL))))/(FLXRAD(J)+CNVFLX(J)*
     2 1.5*DLTDLP(J)/DEL*(1.+D/(D+DEL)))
      CODRHX(1)=0.
      CODRHX(2)=0.
C     CALL INTEG(RHOX,CODRHX,G,NRHOX)
      CALL INTEG(RHOX,CODRHX,G,NRHOX,0.D0)
      DO 32 J=1,NRHOX
      G(J)=EXP(G(J))
   32 GFLUX(J)=G(J)*(FLXRAD(J)+CNVFLX(J)-FLUX)/(FLXRAD(J)+CNVFLX(J)*
     1 1.5*DLTDLP(J)*DDEL(J))
C     BUG
C    1 1.5*DLTDLP(J)/DEL*(1.+D/(D+DEL)))
C((((((((((((((((((((((((
C     CALL INTEG(RHOX,GFLUX,DRHOX,NRHOX)
C     CALL INTEG(TAUROS,GFLUX,DTAU,NRHOX)
      CALL INTEG(TAUROS,GFLUX,DTAU,NRHOX,0.D0)
      DO 33 J=1,NRHOX
C     DRHOX(J)=DRHOX(J)/G(J)
C     DRHOX(J)=DMAX1(-TAUROS(J)/ABROSS(J)/2.,DMIN1(TAUROS(J)/ABROSS(J),
C    1DRHOX(J)))
C  33 DTFLUX(J)=-DRHOX(J)*DTDRHX(J)
      DTAU(J)=DTAU(J)/G(J)
      DTAU(J)=DMAX1(-TAUROS(J)/2.,DMIN1(TAUROS(J)/2.,DTAU(J)))
   33 DTFLUX(J)=-DTAU(J)*DTDRHX(J)/ABROSS(J)
c      DO 3301 J=1,NRHOX
c      IF(TAUROS(J).GE..03)GO TO 3302
c      DO 3300 I=1,J
c 3300 DTFLUX(I)=DTFLUX(I)*.5
c 3301 CONTINUE
c 3302 CONTINUE
C))))))))))))))))))))))))
      DTFLUX(1)=0.
      DTFLUX(2)=0.
C
      DO 41 J=1,NRHOX
   41 FLXERR(J)=(FLXRAD(J)+CNVFLX(J)-FLUX)/FLUX*100.
      CALL DERIV(TAUROS,FLXERR,FLXDRV,NRHOX)
      TEFF25=TEFF/25.
      DO 43 J=1,NRHOX
      IF(CNVFLX(J)/FLXRAD(J).LT.1.E-5)FLXDRV(J)=RJMINS(J)/ABROSS(J)/
     1FLUX*100.
C     IF(TAUROS(J).LT.1.)FLXDRV(J)=RJMINS(J)/ABROSS(J)/
C     IF(CNVFLX(J)/FLXRAD(J).LT.1.E-3)FLXDRV(J)=RJMINS(J)/ABROSS(J)/
C    1FLUX*100.
      DTLAMB(J)=-FLXDRV(J)*FLUX/100./RDIAGJ(J)*ABROSS(J)
      IF(CNVFLX(J)/FLXRAD(J).LT.1.E-5.AND.TAUROS(J).LT.1.)GO TO 42
C      IF(TAUROS(J).LT.0.3)GO TO 42
      DTLAMB(J)=0.
      DTLAMB(J-1)=DTLAMB(J-1)/2.
      DTLAMB(J-2)=DTLAMB(J-2)/2.
      DTLAMB(J-3)=DTLAMB(J-3)/2.
      DTLAMB(J-4)=DTLAMB(J-4)/2.
      DTLAMB(J-5)=DTLAMB(J-5)/2.
C     FUDGE TO AVOID VERY LARGE TEMPERATURE CORRECTIONS
   42 DTLAMB(J)=DMAX1(-TEFF25,DMIN1(TEFF25,DTLAMB(J)))
   43 CONTINUE
C
      DTSUR=(FLUX-FLXRAD(1))/FLUX*.25*T(1)
      DTSUR=DMAX1(-TEFF25,DMIN1(TEFF25,DTSUR))
      DO 45 J=1,NRHOX
   45 DUM(J)=DTFLUX(J)+DTLAMB(J)
C     CALL INTEG(TAUROS,DUM,TINTEG,NRHOX)
      CALL INTEG(TAUROS,DUM,TINTEG,NRHOX,0.D0)
      IDUM=MAP1(TAUROS,TINTEG,NRHOX,.1D0,TONE,1)
      IDUM=MAP1(TAUROS,TINTEG,NRHOX,2.D0,TTWO,1)
      TAV=(TTWO-TONE)/2.
      IF(DTSUR*TAV.LE.0.)TAV=0.
      IF(ABS(TAV).GT.ABS(DTSUR))TAV=DTSUR
      DTSUR=DTSUR-TAV
      DO 5050 J=1,NRHOX
 5050 HRATIO(J)=CNVFLX(J)/(CNVFLX(J)+FLXRAD(J))
      IDUM=MAP1(TAUROS,HRATIO,NRHOX,1.D0,HRATIO1,1)
      DO 49 J=1,NRHOX
   49 DTSURF(J)=DTSUR*(1.-HRATIO1)
C
      DO 50 J=1,NRHOX
C      HRATIO(J)=CNVFLX(J)/(CNVFLX(J)+FLXRAD(J))
C
C     REDUCE SURFACE CORRECTION TO THE FRACTION OF RADIATIVE FLUX
      DTSURF(J)=DTSURF(J)*(1.-HRATIO(J))
C
   50 T1(J)=DTFLUX(J)+DTLAMB(J)+DTSURF(J)
C     IF(IFPRNT(ITER).LE.1)GO TO 60
      IF(IFPRNT(ITER).EQ.0)GO TO 60
      WRITE(6,100) (J,RHOX(J),T(J),DTLAMB(J),DTSURF(J),DTFLUX(J),T1(J),
     1HRATIO(J),FLXERR(J),FLXDRV(J),J=1,NRHOX)
  100 FORMAT(1H1///95H0         RHOX        T      DTLAMB   DTSURF   DTF
     1LUX      T1   CONV/TOTAL      ERROR     DERIV/
     2(I4,1PE12.4,0PF10.1,4F9.1,1X,1PE11.3,1X,0P2F10.3))
C
   60 DO 61 J=1,NRHOX
      IF(IFCONV.EQ.1.AND.HRATIO(J).GT.0.)GO TO 62
      IF(IFCONV.EQ.1.AND.J.GE.NRHOX/2)GO TO 62
      IF(ITER.EQ.1)GO TO 62
      IF(OLDT1(J)*T1(J).GT.0..AND.ABS(OLDT1(J)).GT.ABS(T1(J)))
     1 T1(J)=T1(J)*1.25
      IF(OLDT1(J)*T1(J).LT.0.)T1(J)=T1(J)*.5
   62 OLDT1(J)=T1(J)
C  61 T(J)=T(J)+T1(J)
   61 CONTINUE
C
C((((((((((((((((((((((((
C
C     DETERMINE RHOX CORRECTION TO MAINTAIN CONSTANT TAUROS
      DO 501 J=1,NRHOX
      TPLUS(J)=T(J)+T1(J)
  501 TAUSTD(J)=10.**(TAU1LG+DFLOAT(J-1)*STEPLG)
      IF(TAUROS(1).GT.TAUSTD(1))THEN
      TAUROS(1)=TAUSTD(1)
      RHOXSTD=MIN(TAUSTD(1)/ABROSS(1),RHOX(1))
      P(1)=RHOXSTD/RHOX(1)*P(1)
      PRAD(1)=RHOXSTD/RHOX(1)*PRAD(1)
      XNE(1)=RHOXSTD/RHOX(1)*XNE(1)
      RHOX(1)=RHOXSTD
      ENDIF
      IDUM=MAP1(TAUROS,T,NRHOX,TAUSTD,TNEW1,NRHOX)
      IDUM=MAP1(TAUROS,PRAD,NRHOX,TAUSTD,PRDNEW,NRHOX)
      CALL TTAUP(TNEW1,TAUSTD,AB1,PTOT1,P1,PRDNEW,PTURB,
     1VTURB,GRAV,NRHOX)
      IDUM=MAP1(TAUROS,TPLUS,NRHOX,TAUSTD,TNEW2,NRHOX)
      CALL TTAUP(TNEW2,TAUSTD,AB2,PTOT2,P2,PRDNEW,PTURB,
     1VTURB,GRAV,NRHOX)
      DO 503 J=1,NRHOX
C     PPP=(RHOX2-RHOX1)/RHOX1
  503 PPP(J)=(PTOT2(J)-PTOT1(J))/PTOT1(J)
      IDUM=MAP1(TAUSTD,PPP,NRHOX,TAUROS,RRR,NRHOX)
      DO 505 J=1,NRHOX
  505 DRHOX(J)=RRR(J)*RHOX(J)
      DRHOX(1)=0.
      DRHOX(2)=0.
      DRHOX(3)=0.
      DRHOX(4)=DRHOX(4)/16.
      DRHOX(5)=DRHOX(5)/8.
      DRHOX(6)=DRHOX(6)/4.
      DRHOX(7)=DRHOX(7)/2.
C))))))))))))))))))))))))
C
      DO 65 J=1,NRHOX
   65 T(J)=T(J)+T1(J)
C     FORCE MONOTONICITY
      DO 6050 I=2,NRHOX
      J=NRHOX+1-I
      T(J)=MIN(T(J),T(J+1)-1.)
 6050 CONTINUE
C     MINIMUM TEMPERATURE
      DO 6051 J=1,NRHOX
      T(J)=MAX(T(J),2089.0D0)
 6051 CONTINUE
C
CC     FUDGES TO MAKE UP FOR BAD STARTING GUESSES
CC((((((((((((((((((((((((
      IFUDGE=0
CC))))))))))))))))))))))))
C      IF(IFCONV.EQ.1)GO TO 71
C      IF(ITER.GT.1)GO TO 80
C      IF(FLXERR(NRHOX).LT.90..AND.FLXERR(NRHOX).GT.-50.)GO TO 80
C      DO 70 J=1,NRHOX
C   70 T(J)=TEFF*(.75*(.710+TAUROS(J)-.1331*EXP(-3.4488*TAUROS(J))))**.25
CC((((((((((((((((((((((((
C      IFUDGE=1
CC))))))))))))))))))))))))
C      GO TO 80
C   71 DO 72 J=1,NRHOX
C      IF(FLXERR(J).GT.1000.)GO TO 73
C   72 CONTINUE
C      GO TO 80
C   73 DO 74 J=1,NRHOX
C      GRDEFF(J)=(FLXRAD(J)*DLTDLP(J)+FLXCNV(J)*GRDADB(J))/(FLXRAD(J)+
C     1FLXCNV(J))
C      IF(FLXCNV(J).GT.0.)GRDEFF(J)=DMAX1(GRDEFF(J),(1.+DLTDLP(J))/3.)
C   74 RHOXL(J)=DLOG(RHOX(J))
CC     CALL INTEG(RHOXL,GRDEFF,TLOG,NRHOX)
C      CALL INTEG(RHOXL,GRDEFF,TLOG,NRHOX,0.D0)
C      DO 75 JSTART=1,NRHOX
C      IF(FLXCNV(JSTART).GT.0.)GO TO 76
C   75 CONTINUE
C      GO TO 80
C   76 DO 77 J=JSTART,NRHOX
C   77 T(J)=T(J-1)*EXP(TLOG(J)-TLOG(J-1))
CC((((((((((((((((((((((((
C      IFUDGE=1
CC))))))))))))))))))))))))
   80 DO 81 J=1,NRHOX
      TK(J)=1.38054E-16*T(J)
      HKT(J)=6.6256E-27/TK(J)
      TKEV(J)=8.6171E-5*T(J)
   81 TLOG(J)=DLOG(T(J))
C((((((((((((((((((((((((
      IF(IFUDGE.EQ.1)RETURN
C     CHANGE RHOX TO MAINTAIN CONSTANT TAUROS
      DO 91 J=1,NRHOX
   91 RHOX(J)=RHOX(J)+DRHOX(J)
C))))))))))))))))))))))))
      IDUM=MAP1(TAUROS,RHOX,NRHOX,TAUSTD,DUM1,NRHOX)
      IDUM=MAP1(TAUROS,T,NRHOX,TAUSTD,DUM2,NRHOX)
      IDUM=MAP1(TAUROS,P,NRHOX,TAUSTD,DUM3,NRHOX)
      IDUM=MAP1(TAUROS,XNE,NRHOX,TAUSTD,DUM4,NRHOX)
      IDUM=MAP1(TAUROS,ABROSS,NRHOX,TAUSTD,DUM5,NRHOX)
      IDUM=MAP1(TAUROS,PRAD,NRHOX,TAUSTD,DUM6,NRHOX)
      IDUM=MAP1(TAUROS,VTURB,NRHOX,TAUSTD,DUM7,NRHOX)
      IDUM=MAP1(TAUROS,BMIN,NRHOX,TAUSTD,DUM8,NRHOX)
      DO 2702 J=1,NRHOX
      RHOX(J)=DUM1(J)
      T(J)=DUM2(J)
      TK(J)=1.38054E-16*T(J)
      HKT(J)=6.6256E-27/TK(J)
      TKEV(J)=8.6171E-5*T(J)
      TLOG(J)=DLOG(T(J))
      P(J)=DUM3(J)
      XNE(J)=DUM4(J)
      ABROSS(J)=DUM5(J)
      PRAD(J)=DUM6(J)
      PRADK(J)=PRAD(J)+PRADK0
      VTURB(J)=DUM7(J)
 2702 BMIN(J)=DUM8(J)
      DO 2704 I=1,6
      IDUM=MAP1(TAUROS,BHYD(1,I),NRHOX,TAUSTD,DUM1,NRHOX)
      DO 2703 J=1,NRHOX
 2703 BHYD(J,I)=DUM1(J)
 2704 CONTINUE
      DO 2705 J=1,NRHOX
 2705 TAUROS(J)=TAUSTD(J)
      RETURN
      END
      SUBROUTINE STATEQ(MODE,RCOWT)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     THE BOUND-BOUND COLLISION RATES WERE DERIVED FROM AN ANALYTIC FIT
C     TO THE CROSS SECTION CALCULATIONS OF BURKE,ORMONDE AND WHITAKER,
C     PROC. PHYS. SOC., 1968, VOL 92, 319
C
C     THE CROSS SECTION USED (IN UNITS OF PI*A0**2) IS
C
C     QIJ = 4*FIJ*(EH/E0)**2*(LOG(E/E0)/(E/E0)+.148 /(E/E0)**6)
C
C     FIJ = OSCILLATOR STRENGTH
C     EH = GROUND STATE BINDING ENERGY
C     E0 = THRESHOLD ENERGY
C                                                  D M PETERSON MAY 1968
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION QRADIK(kw,6),QRADKI(kw,6),QRDHMK(kw),QRDKHM(kw)
      DIMENSION DQRAD(kw,6),DQRD(kw),TOLD(kw)
      DIMENSION HCONT(6),DUMMY(6)
      DIMENSION A(6,6),RIGHT(6),QCOLL(8,8)
      EQUIVALENCE (A(1,1),TAUNU(1)),(QCOLL(1,1),HNU(1))
      EQUIVALENCE (HCONT(1),DUMMY(1))
      DIMENSION F(8,8)
      DATA F/8*0.,.4162,7*0.,.07910,.6408,6*0.,.02899,.1193,.8420,5*0.,
     1.01394,.04467,.1506,1.038,4*0.,.007800,.02209,.05585,.1794,1.231,
     23*0.,.004814,.01271,.02768,.06551,.2070,1.425,2*0.,.003184,.008037
     3,.01604,.03229,.07455,.2340,1.615,0./
      GO TO(10,20,30),MODE
C     ERASE FREQUENCY INTEGRALS
   10 DO 11 I=1,6
      DO 11 J=1,NRHOX
      TOLD(J)=T(J)
      QRDHMK(J)=0.
      QRDKHM(J)=0.
      DQRD(J)=0.
      DQRAD(J,I)=0.
      QRADKI(J,I)=0.
   11 QRADIK(J,I)=0.
      RETURN
C     FREQUENCY INTEGRALS
   20 RFRWT=12.5664/6.6256E-27*RCOWT/FREQ
      HVC=2.*6.6256E-27*FREQ*(FREQ/2.997925E10)**2
      DO 21 N=2,6
   21 HCONT(N)=COULX(N,FREQ,1.D0)
      HMINBF=0.
      IF(FREQ.GT.1.8259E14.AND.FREQ.LT.2.111E14)HMINBF=
     1 3.695E-16+(-1.251E-1+1.052E13/FREQ)/FREQ
      IF(FREQ.GE.2.111E14)HMINBF=6.801E-20+(5.358E-3+(1.481E13+
     1(-5.519E27+4.808E41/FREQ)/FREQ)/FREQ)/FREQ
      DO 25 J=1,NRHOX
      RJ=RFRWT*JNU(J)
      RJE=RFRWT*EHVKT(J)*(JNU(J)+HVC)
      RJEDT=RJE*HKT(J)*FREQ/T(J)
      DO 26 I=2,6
      QRADIK(J,I)=QRADIK(J,I)+HCONT(I)*RJ
      DQRAD(J,I)=DQRAD(J,I)+HCONT(I)*RJEDT
   26 QRADKI(J,I)=QRADKI(J,I)+HCONT(I)*RJE
      QRDHMK(J)=QRDHMK(J)+HMINBF*RJ
      DQRD(J)=DQRD(J)+HMINBF*RJEDT
   25 QRDKHM(J)=QRDKHM(J)+HMINBF*RJE
      RETURN
C
   30 IF(IFPRNT(ITER).GT.0)WRITE(6,201)
  201 FORMAT(1H1/////36X30HHMINUS STATISTICAL EQUILIBRIUM/10X4HRHOX,
     1 7X6HQELECT,6X6HQASSOC,6X6HQCHARG,6X6HQRDKHM,6X6HQRDHMK,7X4HBMIN)
      DO 210 J=1,NRHOX
      DT=T(J)-TOLD(J)
      THETA=5040./T(J)
      QELECT=10.**(-8.7)*THETA**(1.5)*XNE(J)
      QASSOC=10.**(-8.7)*2.*BHYD(J,1)*XNFPH(J,1)
      QCHARG=10.**(-7.4)*THETA**.333333*XNFPH(J,2)
      QRDKHM(J)=QRDKHM(J)+DQRD(J)*DT
      BMIN(J)=(QRDKHM(J)+QELECT+QASSOC+QCHARG)/
     1(QRDHMK(J)+QELECT+QASSOC+QCHARG)
  210 WRITE(6,211)J,RHOX(J),QELECT,QASSOC,QCHARG,QRDKHM(J),
     1QRDHMK(J),BMIN(J)
  211 FORMAT(I5,1P6E12.3,0PF10.4)
C
      IF(IFPRNT(ITER).GT.0)WRITE(6,31)
   31 FORMAT(1H1/////30X83HSTATISTICAL EQUILIBRIUM RATES    RATE=SIGN(AL
     1OG10(DMAX1(ABS(RATE*1.E20),1.)),RATE) /
     2132H0 RAD   1-K   K-1   2-K   K-2   3-K   K-3   4-K   K-4   5-K   +
     3K-5   6-K   K-6   COLL  1-K   2-K   3-K   4-K   5-K   6-K   5-8   +
     46-8  /
     5132H  COLL  1-2   1-3   1-4   1-5   1-6   1-7   2-3   2-4   2-5   +
     62-6   2-7   3-4   3-5   3-6   3-7   4-5   4-6   4-7   5-6   5-7   +
     76-7  )
C
      DO 120 J=1,NRHOX
      DT=T(J)-TOLD(J)
      TH=13.595/TKEV(J)
      DO 50 I=1,8
      Y=I
      QCOLL(I,I)=2.2E-8*Y**3/SQRT(TH)*EXP(-TH/Y**2)*XNE(J)
C     QCOLL(I,I) IS THE BOUND FREE RATE
      IF (I.EQ.8) GO TO 50
      I1=I+1
      DO 40 K=I1,8
      Z=K
      GIK=1./Y**2-1./Z**2
      X0=TH*GIK
      Q=2.186E-10*F(I,K)/GIK**2*X0*SQRT(T(J))*(EXPI(1,X0)+.148*X0*
     2EXPI(5,X0))
      QCOLL(I,K)=Q*XNE(J)
      QCOLL(K,I)=QCOLL(I,K)*(Y/Z)**2*EXP(X0)
   40 CONTINUE
   50 CONTINUE
      DO 65 I=1,6
      A(I,I)=QRADIK(J,I)
      QRADKI(J,I)=QRADKI(J,I)+DQRAD(J,I)*DT
      RIGHT(I)=QRADKI(J,I)+QCOLL(I,I)+QCOLL(I,7)+QCOLL(I,8)
      DO 55 K=1,8
   55 A(I,I)=A(I,I)+QCOLL(I,K)
      IF (I.EQ.6) GO TO 65
      I1=I+1
      DO 60 K=I1,6
      A(I,K)=-QCOLL(I,K)
   60 A(K,I)=-QCOLL(K,I)
   65 CONTINUE
C
      CALL SOLVIT(A,6,RIGHT,DUMMY)
      DO 80 L=1,6
   80 BHYD(J,L)=RIGHT(L)
      IF (IFPRNT(ITER).LE.1) GO TO 120
      DO 90 I=1,6
      QRADKI(J,I)=SIGN(DLOG10(DMAX1(ABS(QRADKI(J,I)*1.D20),1.D0)),
     1QRADKI(J,I))
   90 QRADIK(J,I)=SIGN(DLOG10(DMAX1(ABS(QRADIK(J,I)*1.D20),1.D0)),
     1QRADIK(J,I))
      DO 95 I=1,8
      DO 95 K=1,8
   95 QCOLL(I,K)=SIGN(DLOG10(DMAX1(ABS(QCOLL(I,K)*1.D20),1.D0)),
     1QCOLL(I,K))
      WRITE (6,100) J,(QRADIK(J,I),QRADKI(J,I),I=1,6),
     1(QCOLL(I,I),I=1,6),QCOLL(5,8),QCOLL(6,8)
  100 FORMAT (1H0I5,12F6.2,6X8F6.2)
      WRITE (6,110)   (QCOLL(1,K),K=2,7),(QCOLL(2,K),K=3,7),(QCOLL(3,K),
     1K=4,7),(QCOLL(4,K),K=5,7),(QCOLL(5,K),K=6,7),QCOLL(6,7)
  110 FORMAT (6X21F6.2)
  120 CONTINUE
C
  160 WRITE (6,170)(J,RHOX(J),(BHYD(J,I),I=1,6),J=1,NRHOX)
  170 FORMAT(1H1/////30X36HSTATISTICAL EQUILIBRIUM FOR HYDROGEN/
     1 15X4HRHOX,10X2HB1,8X2HB2,8X2HB3,8X2HB4,8X2HB5,8X2HB6/
     2(8XI2,1PE11.4,1X0P6F10.4))
C    2(8XI2,0PE11.4,1X0P6F10.4))
C
      RETURN
      END
      SUBROUTINE RADIAP(MODE,RCOWT)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /RAD/ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      DIMENSION H(kw)
      GO TO (10,20,30),MODE
   10 DO 11 J=1,NRHOX
      H(J)=0.
      RADEN(J)=0.
   11 ACCRAD(J)=0.
      PRADK0=0.
      RETURN
   20 DO 21 J=1,NRHOX
      RADEN(J)=RADEN(J)+JNU(J)*RCOWT
      H(J)=H(J)+HNU(J)*RCOWT
   21 ACCRAD(J)=ACCRAD(J)+ABTOT(J)*HNU(J)*RCOWT
      PRADK0=PRADK0+KNU(1)*RCOWT
      RETURN
   30 DO 31 J=1,NRHOX
      RADEN(J)=RADEN(J)*12.5664/2.997925E10
      ACCRAD(J)=ACCRAD(J)*12.5664/2.997925E10
C     FUDGE TO KEEP MODEL FROM BLOWING UP WITH LARGE FLUX ERRORS
      IF(H(J)/FLUX.GT.1.)ACCRAD(J)=ACCRAD(J)*FLUX/H(J)
   31 CONTINUE
      PRADK0=PRADK0*12.5664/2.997925E10
      IF(H(1)/FLUX.GT.1.)PRADK0=PRADK0*FLUX/H(1)
C     CALL INTEG(RHOX,ACCRAD,PRAD,NRHOX)
      CALL INTEG(RHOX,ACCRAD,PRAD,NRHOX,ACCRAD(1)*RHOX(1))
      DO 32 J=1,NRHOX
   32 PRADK(J)=PRAD(J)+PRADK0
      RETURN
      END
      SUBROUTINE ROSS(MODE,RCOWT)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /FRESET/FRESET(1563),RCOSET(1563),NULO,NUHI,NUMNU
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      GO TO(10,20,30),MODE
   10 DO 11 J=1,NRHOX
   11 ABROSS(J)=0.
      RETURN
   20 DO 21 J=1,NRHOX
      DBDT=BNU(J)*FREQ*HKT(J)/T(J)/STIM(J)
      IF(NUMNU.EQ.1)DBDT=(4.*5.6697E-5/3.14159)*T(J)**3
   21 ABROSS(J)=ABROSS(J)+DBDT/ABTOT(J)*RCOWT
      RETURN
   30 DO 31 J=1,NRHOX
   31 ABROSS(J)=(4.*5.6697E-5/3.14159)*T(J)**3/ABROSS(J)
      CALL INTEG(RHOX,ABROSS,TAUROS,NRHOX,ABROSS(1)*RHOX(1))
      RETURN
      END
      SUBROUTINE DERIV(X,F,DFDX,N)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     ASSUMES THAT ANY ZERO IN X OCCURS AT A ENDPOINT
      DIMENSION X(1),F(1),DFDX(1)
      DFDX(1)=(F(2)-F(1))/(X(2)-X(1))
      N1=N-1
      DFDX(N)=(F(N)-F(N1))/(X(N)-X(N1))
      IF(N.EQ.2)RETURN
      S=ABS(X(2)-X(1))/(X(2)-X(1))
      DO 1 J=2,N1
      SCALE=DMAX1(ABS(F(J-1)),ABS(F(J)),ABS(F(J+1)))/ABS(X(J))
      IF(SCALE.EQ.0.)SCALE=1.
      D1=(F(J+1)-F(J))/(X(J+1)-X(J))/SCALE
      D=(F(J)-F(J-1))/(X(J)-X(J-1))/SCALE
      TAN1=D1/(S*SQRT(1.+D1**2)+1.)
      TAN=D/(S*SQRT(1.+D**2)+1.)
    1 DFDX(J)=(TAN1+TAN)/(1.-TAN1*TAN)*SCALE
      RETURN
      END
      SUBROUTINE INTEG(X,F,FINT,N,START)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     SUBROUTINE INTEG(X,F,FINT,N)
      DIMENSION X(1),F(1),FINT(1)
      DIMENSION A(kw),B(kw),C(kw)
      CALL PARCOE(F,X,A,B,C,N)
      FINT(1)=START
C     FINT(1)=(A(1)+(B(1)/2.+C(1)/3.*X(1))*X(1))*X(1)
C     FINT(2)=(A(1)+(B(1)/2.+C(1)/3.*X(2))*X(2))*X(2)
C     IF(N.EQ.2)RETURN
      N1=N-1
C     DO 10 I=2,N1
      DO 10 I=1,N1
   10 FINT(I+1)=FINT(I)+(A(I)+B(I)/2.*(X(I+1)+X(I))+
     1C(I)/3.*((X(I+1)+X(I))*X(I+1)+X(I)*X(I)))*(X(I+1)-X(I))
      RETURN
      END
      SUBROUTINE PARCOE(F,X,A,B,C,N)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION F(1),X(1),A(1),B(1),C(1)
      C(1)=0.
      B(1)=(F(2)-F(1))/(X(2)-X(1))
      A(1)=F(1)-X(1)*B(1)
      N1=N-1
      C(N)=0.
      B(N)=(F(N)-F(N1))/(X(N)-X(N1))
      A(N)=F(N)-X(N)*B(N)
      IF(N.EQ.2)RETURN
      DO 1 J=2,N1
      J1=J-1
      D=(F(J)-F(J1))/(X(J)-X(J1))
      C(J)=F(J+1)/((X(J+1)-X(J))*(X(J+1)-X(J1)))-F(J)/((X(J)-X(J1))*
     1(X(J+1)-X(J)))+F(J1)/((X(J)-X(J1))*(X(J+1)-X(J1)))
      B(J)=D-(X(J)+X(J1))*C(J)
    1 A(J)=F(J1)-X(J1)*D+X(J)*X(J1)*C(J)
      C(2)=0.
      B(2)=(F(3)-F(2))/(X(3)-X(2))
      A(2)=F(2)-X(2)*B(2)
      C(3)=0.
      B(3)=(F(4)-F(3))/(X(4)-X(3))
      A(3)=F(3)-X(3)*B(3)
      DO 2 J=2,N1
      IF(C(J).EQ.0.)GO TO 2
      J1=J+1
      WT=ABS(C(J1))/(ABS(C(J1))+ABS(C(J)))
      A(J)=A(J1)+WT*(A(J)-A(J1))
      B(J)=B(J1)+WT*(B(J)-B(J1))
      C(J)=C(J1)+WT*(C(J)-C(J1))
    2 CONTINUE
      A(N1)=A(N)
      B(N1)=B(N)
      C(N1)=C(N)
      RETURN
      END
      FUNCTION MAP1(XOLD,FOLD,NOLD,XNEW,FNEW,NNEW)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
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
      IF(L.EQ.3)GO TO 30
      L1=L-1
      IF(L.GT.LL+1.OR.L.EQ.3)GO TO 21
      IF(L.GT.LL+1.OR.L.EQ.4)GO TO 21
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
      L=MIN0(NOLD,L)
      C=0.
      B=(FOLD(L)-FOLD(L-1))/(XOLD(L)-XOLD(L-1))
      A=FOLD(L)-XOLD(L)*B
      LL=L
   50 FNEW(K)=A+(B+C*XNEW(K))*XNEW(K)
      MAP1=LL-1
      RETURN
      END
      SUBROUTINE SOLVIT(A,N,B,IPIVOT)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     SOLVES LINEAR EQUATIONS
C     A IS A COMPLETELY FILLED N BY N ARRAY THAT IS DESTROYED
C     B IS THE RIGHT SIDE VECTOR OF LENGTH N AND RETURNS AS THE SOLUTION
C     IPIVOT IS A SCRATCH AREA OF LENGTH N
      DIMENSION A(N,N),B(N),IPIVOT(N)
      EQUIVALENCE (T,PIVOT,C)
      N1=N-1
      DO 70 I=1,N1
      M=I
      I1=I+1
      DO 20 K=I1,N
   20 IF(ABS(A(K,I)).GT.ABS(A(M,I)))M=K
      IPIVOT(I)=M
      IF(M.EQ.I)GO TO 40
      DO 30 K=I1,N
      T=A(I,K)
      A(I,K)=A(M,K)
   30 A(M,K)=T
   40 PIVOT=1./A(M,I)
      A(M,I)=A(I,I)
      A(I,I)=PIVOT
      DO 50 K=I1,N
   50 A(K,I)=A(K,I)*PIVOT
      DO 70 J=I1,N
      C=A(I,J)
      IF(C.EQ.0.)GO TO 70
      DO 60 K=I1,N
   60 A(K,J)=A(K,J)-A(K,I)*C
   70 CONTINUE
      A(N,N)=1./A(N,N)
      DO 140 I=1,N1
      M=IPIVOT(I)
      IF(M.EQ.I)GO TO 120
      T=B(M)
      B(M)=B(I)
      B(I)=T
  120 C=B(I)
C     IF(C.EQ.0.)GO TO 140
      I1=I+1
      DO 130 K=I1,N
  130 B(K)=B(K)-A(K,I)*C
  140 CONTINUE
      J1=N
      DO 160 I=1,N1
      J=J1
      J1=J1-1
      B(J)=B(J)*A(J,J)
      C=B(J)
C     IF(C.EQ.0.)GO TO 160
      DO 150 K=1,J1
  150 B(K)=B(K)-A(K,J)*C
  160 CONTINUE
      B(1)=B(1)*A(1,1)
      RETURN
      END
      FUNCTION EXPI(N,X)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     EXPONENTIAL INTEGRAL FOR POSITIVE ARGUMENTS AFTER CODY AND
C     THACHER, MATH. OF COMP.,22,641(1968)
      DATA X1/-1.E20/
      DATA A0,A1,A2,A3,A4,A5,B0,B1,B2,B3,B4/
     1-44178.5471728217,57721.7247139444,9938.31388962037,
     2 1842.11088668000,101.093806161906,5.03416184097568,
     3 76537.3323337614,32597.1881290275,6106.10794245759,
     4 635.419418378382,37.2298352833327/
      DATA C0,C1,C2,C3,C4,C5,C6,D1,D2,D3,D4,D5,D6/
     1 4.65627107975096E-7,
     2 .999979577051595,9.04161556946329,24.3784088791317,
     3 23.0192559391333,6.90522522784444,.430967839469389,
     4 10.0411643829054,32.4264210695138,41.2807841891424,
     5 20.4494785013794,3.31909213593302,.103400130404874/
      DATA E0,E1,E2,E3,E4,E5,E6,F1,F2,F3,F4,F5,F6/
     1-.999999999998447,-26.6271060431811,-241.055827097015,
     2-895.927957772937,-1298.85688746484,-545.374158883133,
     3-5.66575206533869, 28.6271060422192, 292.310039388533,
     4 1332.78537748257, 2777.61949509163, 2404.01713225909,
     5 631.657483280800/
      IF(X.EQ.X1)GO TO 40
      EX=EXP(-X)
      X1=X
      IF(X.GT.4.)GO TO 10
      IF(X.GT.1.)GO TO 20
      IF(X.GT.0.)GO TO 30
      EX1=0.
      GO TO 40
   10 EX1=(EX+EX*(E0+(E1+(E2+(E3+(E4+(E5+E6/X)/X)/X)/X)/X)/X)/
     1            (X+ F1+(F2+(F3+(F4+(F5+F6/X)/X)/X)/X)/X))/X
      GO TO 40
   20 EX1=EX*(C6+(C5+(C4+(C3+(C2+(C1+C0*X)*X)*X)*X)*X)*X)/
     1       (D6+(D5+(D4+(D3+(D2+(D1+X)*X)*X)*X)*X)*X)
      GO TO 40
   30 EX1=(A0+(A1+(A2+(A3+(A4+A5*X)*X)*X)*X)*X)/
     1    (B0+(B1+(B2+(B3+(B4+X)*X)*X)*X)*X)-DLOG(X)
   40 EXPI=EX1
      IF(N.EQ.1)RETURN
      N1=N-1
      DO 41 I=1,N1
   41 EXPI=(EX-X*EXPI)/DFLOAT(I)
      RETURN
      END
      SUBROUTINE W(A,B,N)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION B(1)
      WRITE(6,100)A,(B(I),I=1,N)
  100 FORMAT(1H0,A6,1P10E12.4/(7X,10E12.4))
      RETURN
      END
      FUNCTION ROSSTAB(T,P,V)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     ROSSELAND OPACITY FOR SDSC 1X DISTRIBUTION FUNCTIONS
      COMMON/TABTP/TABT(56),TABP(38),TABKAP(56,38,5),PKAP(38),
     1TABV(5),PKAPV(5,38),IFTABK,KTAB(56,38,5),NT,NP
      DIMENSION K0TAB01(56),K0TAB02(56),K0TAB03(56),K0TAB04(56)
      DIMENSION K0TAB05(56),K0TAB06(56),K0TAB07(56),K0TAB08(56)
      DIMENSION K0TAB09(56),K0TAB10(56),K0TAB11(56),K0TAB12(56)
      DIMENSION K0TAB13(56),K0TAB14(56),K0TAB15(56),K0TAB16(56)
      DIMENSION K0TAB17(56),K0TAB18(56),K0TAB19(56),K0TAB20(56)
      DIMENSION K0TAB21(56),K0TAB22(56),K0TAB23(56),K0TAB24(56)
      DIMENSION K0TAB25(56),K0TAB26(56),K0TAB27(56),K0TAB28(56)
      DIMENSION K0TAB29(56),K0TAB30(56),K0TAB31(56),K0TAB32(56)
      DIMENSION K0TAB33(56),K0TAB34(56),K0TAB35(56),K0TAB36(56)
      DIMENSION K0TAB37(56),K0TAB38(56)
      DIMENSION K1TAB01(56),K1TAB02(56),K1TAB03(56),K1TAB04(56)
      DIMENSION K1TAB05(56),K1TAB06(56),K1TAB07(56),K1TAB08(56)
      DIMENSION K1TAB09(56),K1TAB10(56),K1TAB11(56),K1TAB12(56)
      DIMENSION K1TAB13(56),K1TAB14(56),K1TAB15(56),K1TAB16(56)
      DIMENSION K1TAB17(56),K1TAB18(56),K1TAB19(56),K1TAB20(56)
      DIMENSION K1TAB21(56),K1TAB22(56),K1TAB23(56),K1TAB24(56)
      DIMENSION K1TAB25(56),K1TAB26(56),K1TAB27(56),K1TAB28(56)
      DIMENSION K1TAB29(56),K1TAB30(56),K1TAB31(56),K1TAB32(56)
      DIMENSION K1TAB33(56),K1TAB34(56),K1TAB35(56),K1TAB36(56)
      DIMENSION K1TAB37(56),K1TAB38(56)
      DIMENSION K2TAB01(56),K2TAB02(56),K2TAB03(56),K2TAB04(56)
      DIMENSION K2TAB05(56),K2TAB06(56),K2TAB07(56),K2TAB08(56)
      DIMENSION K2TAB09(56),K2TAB10(56),K2TAB11(56),K2TAB12(56)
      DIMENSION K2TAB13(56),K2TAB14(56),K2TAB15(56),K2TAB16(56)
      DIMENSION K2TAB17(56),K2TAB18(56),K2TAB19(56),K2TAB20(56)
      DIMENSION K2TAB21(56),K2TAB22(56),K2TAB23(56),K2TAB24(56)
      DIMENSION K2TAB25(56),K2TAB26(56),K2TAB27(56),K2TAB28(56)
      DIMENSION K2TAB29(56),K2TAB30(56),K2TAB31(56),K2TAB32(56)
      DIMENSION K2TAB33(56),K2TAB34(56),K2TAB35(56),K2TAB36(56)
      DIMENSION K2TAB37(56),K2TAB38(56)
      DIMENSION K4TAB01(56),K4TAB02(56),K4TAB03(56),K4TAB04(56)
      DIMENSION K4TAB05(56),K4TAB06(56),K4TAB07(56),K4TAB08(56)
      DIMENSION K4TAB09(56),K4TAB10(56),K4TAB11(56),K4TAB12(56)
      DIMENSION K4TAB13(56),K4TAB14(56),K4TAB15(56),K4TAB16(56)
      DIMENSION K4TAB17(56),K4TAB18(56),K4TAB19(56),K4TAB20(56)
      DIMENSION K4TAB21(56),K4TAB22(56),K4TAB23(56),K4TAB24(56)
      DIMENSION K4TAB25(56),K4TAB26(56),K4TAB27(56),K4TAB28(56)
      DIMENSION K4TAB29(56),K4TAB30(56),K4TAB31(56),K4TAB32(56)
      DIMENSION K4TAB33(56),K4TAB34(56),K4TAB35(56),K4TAB36(56)
      DIMENSION K4TAB37(56),K4TAB38(56)
      DIMENSION K8TAB01(56),K8TAB02(56),K8TAB03(56),K8TAB04(56)
      DIMENSION K8TAB05(56),K8TAB06(56),K8TAB07(56),K8TAB08(56)
      DIMENSION K8TAB09(56),K8TAB10(56),K8TAB11(56),K8TAB12(56)
      DIMENSION K8TAB13(56),K8TAB14(56),K8TAB15(56),K8TAB16(56)
      DIMENSION K8TAB17(56),K8TAB18(56),K8TAB19(56),K8TAB20(56)
      DIMENSION K8TAB21(56),K8TAB22(56),K8TAB23(56),K8TAB24(56)
      DIMENSION K8TAB25(56),K8TAB26(56),K8TAB27(56),K8TAB28(56)
      DIMENSION K8TAB29(56),K8TAB30(56),K8TAB31(56),K8TAB32(56)
      DIMENSION K8TAB33(56),K8TAB34(56),K8TAB35(56),K8TAB36(56)
      DIMENSION K8TAB37(56),K8TAB38(56)
C      EQUIVALENCE (KTAB(001),KTAB01(1)),(KTAB(057),KTAB02(1))
C      EQUIVALENCE (KTAB(113),KTAB03(1)),(KTAB(169),KTAB04(1))
C      EQUIVALENCE (KTAB(225),KTAB05(1)),(KTAB(281),KTAB06(1))
C      EQUIVALENCE (KTAB(337),KTAB07(1)),(KTAB(393),KTAB08(1))
C      EQUIVALENCE (KTAB(449),KTAB09(1)),(KTAB(505),KTAB10(1))
C      EQUIVALENCE (KTAB(561),KTAB11(1)),(KTAB(617),KTAB12(1))
C      EQUIVALENCE (KTAB(673),KTAB13(1)),(KTAB(729),KTAB14(1))
C      EQUIVALENCE (KTAB(785),KTAB15(1)),(KTAB(841),KTAB16(1))
C      EQUIVALENCE (KTAB(897),KTAB17(1)),(KTAB(953),KTAB18(1))
C      EQUIVALENCE (KTAB(1009),KTAB19(1)),(KTAB(1065),KTAB20(1))
C      EQUIVALENCE (KTAB(1121),KTAB21(1)),(KTAB(1177),KTAB22(1))
C      EQUIVALENCE (KTAB(1233),KTAB23(1)),(KTAB(1289),KTAB24(1))
C      EQUIVALENCE (KTAB(1345),KTAB25(1)),(KTAB(1401),KTAB26(1))
C      EQUIVALENCE (KTAB(1457),KTAB27(1)),(KTAB(1513),KTAB28(1))
C      EQUIVALENCE (KTAB(1569),KTAB29(1)),(KTAB(1625),KTAB30(1))
C      EQUIVALENCE (KTAB(1681),KTAB31(1)),(KTAB(1737),KTAB32(1))
C      EQUIVALENCE (KTAB(1793),KTAB33(1)),(KTAB(1849),KTAB34(1))
C      EQUIVALENCE (KTAB(1905),KTAB35(1)),(KTAB(1961),KTAB36(1))
C      EQUIVALENCE (KTAB(2017),KTAB37(1)),(KTAB(2073),KTAB38(1))
      EQUIVALENCE (KTAB(1, 1,1),K0TAB01(1)),(KTAB(1, 2,1),K0TAB02(1))
      EQUIVALENCE (KTAB(1, 3,1),K0TAB03(1)),(KTAB(1, 4,1),K0TAB04(1))
      EQUIVALENCE (KTAB(1, 5,1),K0TAB05(1)),(KTAB(1, 6,1),K0TAB06(1))
      EQUIVALENCE (KTAB(1, 7,1),K0TAB07(1)),(KTAB(1, 8,1),K0TAB08(1))
      EQUIVALENCE (KTAB(1, 9,1),K0TAB09(1)),(KTAB(1,10,1),K0TAB10(1))
      EQUIVALENCE (KTAB(1,11,1),K0TAB11(1)),(KTAB(1,12,1),K0TAB12(1))
      EQUIVALENCE (KTAB(1,13,1),K0TAB13(1)),(KTAB(1,14,1),K0TAB14(1))
      EQUIVALENCE (KTAB(1,15,1),K0TAB15(1)),(KTAB(1,16,1),K0TAB16(1))
      EQUIVALENCE (KTAB(1,17,1),K0TAB17(1)),(KTAB(1,18,1),K0TAB18(1))
      EQUIVALENCE (KTAB(1,19,1),K0TAB19(1)),(KTAB(1,20,1),K0TAB20(1))
      EQUIVALENCE (KTAB(1,21,1),K0TAB21(1)),(KTAB(1,22,1),K0TAB22(1))
      EQUIVALENCE (KTAB(1,23,1),K0TAB23(1)),(KTAB(1,24,1),K0TAB24(1))
      EQUIVALENCE (KTAB(1,25,1),K0TAB25(1)),(KTAB(1,26,1),K0TAB26(1))
      EQUIVALENCE (KTAB(1,27,1),K0TAB27(1)),(KTAB(1,28,1),K0TAB28(1))
      EQUIVALENCE (KTAB(1,29,1),K0TAB29(1)),(KTAB(1,30,1),K0TAB30(1))
      EQUIVALENCE (KTAB(1,31,1),K0TAB31(1)),(KTAB(1,32,1),K0TAB32(1))
      EQUIVALENCE (KTAB(1,33,1),K0TAB33(1)),(KTAB(1,34,1),K0TAB34(1))
      EQUIVALENCE (KTAB(1,35,1),K0TAB35(1)),(KTAB(1,36,1),K0TAB36(1))
      EQUIVALENCE (KTAB(1,37,1),K0TAB37(1)),(KTAB(1,38,1),K0TAB38(1))
      EQUIVALENCE (KTAB(1, 1,2),K1TAB01(1)),(KTAB(1, 2,2),K1TAB02(1))
      EQUIVALENCE (KTAB(1, 3,2),K1TAB03(1)),(KTAB(1, 4,2),K1TAB04(1))
      EQUIVALENCE (KTAB(1, 5,2),K1TAB05(1)),(KTAB(1, 6,2),K1TAB06(1))
      EQUIVALENCE (KTAB(1, 7,2),K1TAB07(1)),(KTAB(1, 8,2),K1TAB08(1))
      EQUIVALENCE (KTAB(1, 9,2),K1TAB09(1)),(KTAB(1,10,2),K1TAB10(1))
      EQUIVALENCE (KTAB(1,11,2),K1TAB11(1)),(KTAB(1,12,2),K1TAB12(1))
      EQUIVALENCE (KTAB(1,13,2),K1TAB13(1)),(KTAB(1,14,2),K1TAB14(1))
      EQUIVALENCE (KTAB(1,15,2),K1TAB15(1)),(KTAB(1,16,2),K1TAB16(1))
      EQUIVALENCE (KTAB(1,17,2),K1TAB17(1)),(KTAB(1,18,2),K1TAB18(1))
      EQUIVALENCE (KTAB(1,19,2),K1TAB19(1)),(KTAB(1,20,2),K1TAB20(1))
      EQUIVALENCE (KTAB(1,21,2),K1TAB21(1)),(KTAB(1,22,2),K1TAB22(1))
      EQUIVALENCE (KTAB(1,23,2),K1TAB23(1)),(KTAB(1,24,2),K1TAB24(1))
      EQUIVALENCE (KTAB(1,25,2),K1TAB25(1)),(KTAB(1,26,2),K1TAB26(1))
      EQUIVALENCE (KTAB(1,27,2),K1TAB27(1)),(KTAB(1,28,2),K1TAB28(1))
      EQUIVALENCE (KTAB(1,29,2),K1TAB29(1)),(KTAB(1,30,2),K1TAB30(1))
      EQUIVALENCE (KTAB(1,31,2),K1TAB31(1)),(KTAB(1,32,2),K1TAB32(1))
      EQUIVALENCE (KTAB(1,33,2),K1TAB33(1)),(KTAB(1,34,2),K1TAB34(1))
      EQUIVALENCE (KTAB(1,35,2),K1TAB35(1)),(KTAB(1,36,2),K1TAB36(1))
      EQUIVALENCE (KTAB(1,37,2),K1TAB37(1)),(KTAB(1,38,2),K1TAB38(1))
      EQUIVALENCE (KTAB(1, 1,3),K2TAB01(1)),(KTAB(1, 2,3),K2TAB02(1))
      EQUIVALENCE (KTAB(1, 3,3),K2TAB03(1)),(KTAB(1, 4,3),K2TAB04(1))
      EQUIVALENCE (KTAB(1, 5,3),K2TAB05(1)),(KTAB(1, 6,3),K2TAB06(1))
      EQUIVALENCE (KTAB(1, 7,3),K2TAB07(1)),(KTAB(1, 8,3),K2TAB08(1))
      EQUIVALENCE (KTAB(1, 9,3),K2TAB09(1)),(KTAB(1,10,3),K2TAB10(1))
      EQUIVALENCE (KTAB(1,11,3),K2TAB11(1)),(KTAB(1,12,3),K2TAB12(1))
      EQUIVALENCE (KTAB(1,13,3),K2TAB13(1)),(KTAB(1,14,3),K2TAB14(1))
      EQUIVALENCE (KTAB(1,15,3),K2TAB15(1)),(KTAB(1,16,3),K2TAB16(1))
      EQUIVALENCE (KTAB(1,17,3),K2TAB17(1)),(KTAB(1,18,3),K2TAB18(1))
      EQUIVALENCE (KTAB(1,19,3),K2TAB19(1)),(KTAB(1,20,3),K2TAB20(1))
      EQUIVALENCE (KTAB(1,21,3),K2TAB21(1)),(KTAB(1,22,3),K2TAB22(1))
      EQUIVALENCE (KTAB(1,23,3),K2TAB23(1)),(KTAB(1,24,3),K2TAB24(1))
      EQUIVALENCE (KTAB(1,25,3),K2TAB25(1)),(KTAB(1,26,3),K2TAB26(1))
      EQUIVALENCE (KTAB(1,27,3),K2TAB27(1)),(KTAB(1,28,3),K2TAB28(1))
      EQUIVALENCE (KTAB(1,29,3),K2TAB29(1)),(KTAB(1,30,3),K2TAB30(1))
      EQUIVALENCE (KTAB(1,31,3),K2TAB31(1)),(KTAB(1,32,3),K2TAB32(1))
      EQUIVALENCE (KTAB(1,33,3),K2TAB33(1)),(KTAB(1,34,3),K2TAB34(1))
      EQUIVALENCE (KTAB(1,35,3),K2TAB35(1)),(KTAB(1,36,3),K2TAB36(1))
      EQUIVALENCE (KTAB(1,37,3),K2TAB37(1)),(KTAB(1,38,3),K2TAB38(1))
      EQUIVALENCE (KTAB(1, 1,4),K4TAB01(1)),(KTAB(1, 2,4),K4TAB02(1))
      EQUIVALENCE (KTAB(1, 3,4),K4TAB03(1)),(KTAB(1, 4,4),K4TAB04(1))
      EQUIVALENCE (KTAB(1, 5,4),K4TAB05(1)),(KTAB(1, 6,4),K4TAB06(1))
      EQUIVALENCE (KTAB(1, 7,4),K4TAB07(1)),(KTAB(1, 8,4),K4TAB08(1))
      EQUIVALENCE (KTAB(1, 9,4),K4TAB09(1)),(KTAB(1,10,4),K4TAB10(1))
      EQUIVALENCE (KTAB(1,11,4),K4TAB11(1)),(KTAB(1,12,4),K4TAB12(1))
      EQUIVALENCE (KTAB(1,13,4),K4TAB13(1)),(KTAB(1,14,4),K4TAB14(1))
      EQUIVALENCE (KTAB(1,15,4),K4TAB15(1)),(KTAB(1,16,4),K4TAB16(1))
      EQUIVALENCE (KTAB(1,17,4),K4TAB17(1)),(KTAB(1,18,4),K4TAB18(1))
      EQUIVALENCE (KTAB(1,19,4),K4TAB19(1)),(KTAB(1,20,4),K4TAB20(1))
      EQUIVALENCE (KTAB(1,21,4),K4TAB21(1)),(KTAB(1,22,4),K4TAB22(1))
      EQUIVALENCE (KTAB(1,23,4),K4TAB23(1)),(KTAB(1,24,4),K4TAB24(1))
      EQUIVALENCE (KTAB(1,25,4),K4TAB25(1)),(KTAB(1,26,4),K4TAB26(1))
      EQUIVALENCE (KTAB(1,27,4),K4TAB27(1)),(KTAB(1,28,4),K4TAB28(1))
      EQUIVALENCE (KTAB(1,29,4),K4TAB29(1)),(KTAB(1,30,4),K4TAB30(1))
      EQUIVALENCE (KTAB(1,31,4),K4TAB31(1)),(KTAB(1,32,4),K4TAB32(1))
      EQUIVALENCE (KTAB(1,33,4),K4TAB33(1)),(KTAB(1,34,4),K4TAB34(1))
      EQUIVALENCE (KTAB(1,35,4),K4TAB35(1)),(KTAB(1,36,4),K4TAB36(1))
      EQUIVALENCE (KTAB(1,37,4),K4TAB37(1)),(KTAB(1,38,4),K4TAB38(1))
      EQUIVALENCE (KTAB(1, 1,5),K8TAB01(1)),(KTAB(1, 2,5),K8TAB02(1))
      EQUIVALENCE (KTAB(1, 3,5),K8TAB03(1)),(KTAB(1, 4,5),K8TAB04(1))
      EQUIVALENCE (KTAB(1, 5,5),K8TAB05(1)),(KTAB(1, 6,5),K8TAB06(1))
      EQUIVALENCE (KTAB(1, 7,5),K8TAB07(1)),(KTAB(1, 8,5),K8TAB08(1))
      EQUIVALENCE (KTAB(1, 9,5),K8TAB09(1)),(KTAB(1,10,5),K8TAB10(1))
      EQUIVALENCE (KTAB(1,11,5),K8TAB11(1)),(KTAB(1,12,5),K8TAB12(1))
      EQUIVALENCE (KTAB(1,13,5),K8TAB13(1)),(KTAB(1,14,5),K8TAB14(1))
      EQUIVALENCE (KTAB(1,15,5),K8TAB15(1)),(KTAB(1,16,5),K8TAB16(1))
      EQUIVALENCE (KTAB(1,17,5),K8TAB17(1)),(KTAB(1,18,5),K8TAB18(1))
      EQUIVALENCE (KTAB(1,19,5),K8TAB19(1)),(KTAB(1,20,5),K8TAB20(1))
      EQUIVALENCE (KTAB(1,21,5),K8TAB21(1)),(KTAB(1,22,5),K8TAB22(1))
      EQUIVALENCE (KTAB(1,23,5),K8TAB23(1)),(KTAB(1,24,5),K8TAB24(1))
      EQUIVALENCE (KTAB(1,25,5),K8TAB25(1)),(KTAB(1,26,5),K8TAB26(1))
      EQUIVALENCE (KTAB(1,27,5),K8TAB27(1)),(KTAB(1,28,5),K8TAB28(1))
      EQUIVALENCE (KTAB(1,29,5),K8TAB29(1)),(KTAB(1,30,5),K8TAB30(1))
      EQUIVALENCE (KTAB(1,31,5),K8TAB31(1)),(KTAB(1,32,5),K8TAB32(1))
      EQUIVALENCE (KTAB(1,33,5),K8TAB33(1)),(KTAB(1,34,5),K8TAB34(1))
      EQUIVALENCE (KTAB(1,35,5),K8TAB35(1)),(KTAB(1,36,5),K8TAB36(1))
      EQUIVALENCE (KTAB(1,37,5),K8TAB37(1)),(KTAB(1,38,5),K8TAB38(1))
      DATA NT,NP,NV/56,38,5/
      DATA TABV/0.D5,1.D5,2.D5,4.D5,8.D5/
      DATA TABT/
     1 3.320,3.340,3.360,3.380,3.400,3.420,3.440,3.460,3.480,3.500,
     2 3.520,3.540,3.560,3.580,3.600,3.620,3.640,3.660,3.680,3.700,
     3 3.730,3.760,3.790,3.820,3.850,3.880,3.910,3.940,3.970,4.000,
     4 4.050,4.100,4.150,4.200,4.250,4.300,4.350,4.400,4.450,4.500,
     5 4.550,4.600,4.650,4.700,4.750,4.800,4.850,4.900,4.950,5.000,
     6 5.050,5.100,5.150,5.200,5.250,5.300/
      DATA TABP/    -2.000,-1.500,-1.000, -.500, 0.000,  .500, 1.000,
     1 1.250, 1.500, 1.750, 2.000, 2.250, 2.500, 2.750, 3.000, 3.200,
     2 3.400, 3.600, 3.800, 4.000, 4.200, 4.400, 4.600, 4.800, 5.000,
     3 5.200, 5.400, 5.600, 5.800, 6.000, 6.250, 6.500, 6.750, 7.000,
     4 7.250, 7.500, 7.750, 8.000/
      DATA K0TAB01/                                                     -2.000
     1-5201,-5133,-5045,-4888,-4694,-4508,-4360,-4257,-4197,-4170,      -2.000
     2-4154,-4122,-4029,-3840,-3576,-3270,-2942,-2604,-2265,-1932,      -2.000
     3-1450,-1011, -685, -549, -519, -520, -526, -531, -527, -513,      -2.000
     4 -492, -482, -482, -487, -482, -472, -448, -440, -435, -434,      -2.000
     5 -435, -431, -428, -428, -429, -428, -428, -430, -433, -434,      -2.000
     6 -432, -427, -418, -405, -386, -360/                              -2.000
      DATA K0TAB02/                                                     -1.500
     1-5234,-5146,-5078,-4967,-4796,-4606,-4433,-4302,-4213,-4164,      -1.500
     2-4144,-4125,-4076,-3947,-3728,-3450,-3142,-2818,-2490,-2162,      -1.500
     3-1681,-1227, -834, -592, -515, -504, -511, -520, -525, -518,      -1.500
     4 -490, -478, -473, -480, -479, -470, -451, -437, -432, -429,      -1.500
     5 -432, -429, -426, -425, -427, -427, -425, -427, -432, -433,      -1.500
     6 -432, -427, -418, -405, -386, -360/                              -1.500
      DATA K0TAB03/                                                     -1.000
     1-5278,-5167,-5089,-5010,-4878,-4701,-4517,-4358,-4241,-4164,      -1.000
     2-4127,-4111,-4087,-4014,-3851,-3611,-3326,-3020,-2703,-2383,      -1.000
     3-1907,-1446,-1019, -682, -517, -479, -483, -497, -509, -513,      -1.000
     4 -489, -474, -463, -469, -473, -467, -453, -433, -429, -424,      -1.000
     5 -427, -427, -424, -422, -424, -425, -423, -424, -430, -433,      -1.000
     6 -432, -427, -418, -405, -386, -360/                              -1.000
      DATA K0TAB04/                                                     -0.500
     1-5322,-5193,-5093,-5019,-4924,-4775,-4594,-4417,-4271,-4167,      -0.500
     2-4104,-4078,-4065,-4032,-3931,-3740,-3487,-3201,-2899,-2589,      -0.500
     3-2121,-1658,-1212, -815, -542, -439, -429, -449, -472, -489,      -0.500
     4 -485, -466, -453, -453, -463, -460, -449, -430, -424, -419,      -0.500
     5 -421, -423, -422, -419, -420, -422, -422, -421, -426, -431,      -0.500
     6 -431, -426, -418, -405, -386, -360/                              -0.500
      DATA K0TAB05/                                                      0.000
     1-5347,-5214,-5093,-5002,-4923,-4808,-4644,-4459,-4288,-4154,       0.000
     2-4063,-4015,-4002,-3993,-3947,-3818,-3606,-3347,-3063,-2767,       0.000
     3-2311,-1850,-1394, -960, -599, -392, -339, -356, -393, -429,       0.000
     4 -461, -449, -440, -433, -444, -448, -440, -425, -416, -413,       0.000
     5 -413, -418, -418, -416, -415, -419, -419, -417, -421, -428,       0.000
     6 -430, -426, -418, -405, -386, -360/                               0.000
      DATA K0TAB06/                                                      0.500
     1-5350,-5206,-5071,-4959,-4872,-4779,-4641,-4462,-4274,-4108,       0.500
     2-3985,-3908,-3878,-3879,-3872,-3808,-3654,-3430,-3170,-2892,       0.500
     3-2455,-2002,-1542,-1086, -667, -352, -210, -200, -244, -303,       0.500
     4 -388, -408, -412, -406, -416, -426, -424, -413, -404, -403,       0.500
     5 -402, -409, -413, -412, -409, -413, -416, -414, -415, -424,       0.500
     6 -428, -426, -418, -405, -386, -360/                               0.500
      DATA K0TAB07/                                                      1.000
     1-5342,-5161,-5008,-4874,-4767,-4677,-4564,-4403,-4212,-4021,       1.000
     2-3862,-3748,-3686,-3673,-3684,-3674,-3590,-3415,-3184,-2926,       1.000
     3-2515,-2080,-1628,-1167, -716, -323,  -63,   18,  -11,  -84,       1.000
     4 -228, -313, -346, -360, -372, -392, -395, -389, -382, -387,       1.000
     5 -388, -396, -405, -407, -405, -406, -411, -410, -409, -418,       1.000
     6 -425, -424, -417, -405, -386, -360/                               1.000
      DATA K0TAB08/                                                      1.250
     1-5336,-5130,-4960,-4812,-4692,-4595,-4491,-4343,-4156,-3959,       1.250
     2-3784,-3651,-3569,-3540,-3549,-3555,-3505,-3361,-3148,-2902,       1.250
     3-2504,-2083,-1640,-1182, -726, -307,    4,  142,  134,   61,       1.250
     4 -106, -232, -289, -322, -341, -366, -374, -371, -366, -373,       1.250
     5 -378, -387, -398, -403, -402, -402, -408, -408, -406, -414,       1.250
     6 -423, -423, -417, -405, -386, -360/                               1.250
      DATA K0TAB09/                                                      1.500
     1-5330,-5098,-4903,-4739,-4602,-4495,-4394,-4259,-4080,-3882,       1.500
     2-3694,-3543,-3440,-3391,-3390,-3406,-3385,-3276,-3085,-2851,       1.500
     3-2467,-2059,-1628,-1179, -722, -288,   66,  266,  296,  230,       1.500
     4   44, -124, -211, -268, -297, -333, -349, -347, -344, -354,       1.500
     5 -365, -376, -391, -398, -398, -397, -404, -406, -403, -409,       1.500
     6 -420, -422, -417, -405, -386, -360/                               1.500
      DATA K0TAB10/                                                      1.750
     1-5319,-5067,-4843,-4657,-4501,-4379,-4274,-4149,-3983,-3787,       1.750
     2-3592,-3425,-3304,-3234,-3217,-3232,-3232,-3158,-2995,-2776,       1.750
     3-2406,-2011,-1594,-1157, -706, -264,  121,  379,  461,  415,       1.750
     4  222,   15, -109, -193, -241, -288, -316, -318, -316, -327,       1.750
     5 -347, -362, -380, -391, -394, -392, -398, -403, -400, -404,       1.750
     6 -416, -420, -416, -405, -386, -360/                               1.750
      DATA K0TAB11/                                                      2.000
     1-5305,-5039,-4785,-4571,-4392,-4249,-4137,-4018,-3865,-3677,       2.000
     2-3478,-3299,-3160,-3070,-3034,-3040,-3052,-3012,-2880,-2680,       2.000
     3-2326,-1943,-1541,-1117, -676, -233,  172,  479,  621,  609,       2.000
     4  423,  183,   15,  -96, -168, -228, -273, -283, -280, -291,       2.000
     5 -321, -342, -366, -382, -388, -386, -392, -399, -397, -398,       2.000
     6 -412, -418, -415, -404, -386, -360/                               2.000
      DATA K0TAB12/                                                      2.250
     1-5286,-5010,-4731,-4484,-4281,-4115,-3987,-3868,-3727,-3550,       2.250
     2-3354,-3167,-3013,-2905,-2848,-2840,-2854,-2840,-2743,-2566,       2.250
     3-2229,-1859,-1470,-1062, -634, -196,  219,  562,  764,  799,       2.250
     4  636,  379,  168,   27,  -75, -151, -214, -237, -237, -246,       2.250
     5 -283, -315, -346, -369, -380, -381, -384, -393, -393, -393,       2.250
     6 -406, -415, -414, -404, -386, -360/                               2.250
      DATA K0TAB13/                                                      2.500
     1-5261,-4981,-4682,-4404,-4171,-3980,-3831,-3707,-3574,-3410,       2.500
     2-3221,-3030,-2864,-2738,-2662,-2636,-2644,-2647,-2585,-2436,       2.500
     3-2121,-1764,-1388, -994, -580, -152,  266,  633,  887,  980,       2.500
     4  857,  595,  344,  173,   39,  -55, -140, -180, -186, -191,       2.500
     5 -233, -278, -319, -352, -369, -373, -375, -386, -388, -387,       2.500
     6 -399, -412, -412, -403, -385, -360/                               2.500
      DATA K0TAB14/                                                      2.750
     1-5229,-4950,-4637,-4331,-4068,-3851,-3678,-3540,-3409,-3258,       2.750
     2-3079,-2889,-2714,-2574,-2480,-2435,-2431,-2440,-2407,-2291,       2.750
     3-2003,-1659,-1295, -915, -517, -101,  313,  694,  987, 1138,       2.750
     4 1076,  824,  546,  344,  179,   60,  -43, -106, -123, -127,       2.750
     5 -166, -226, -281, -326, -353, -363, -365, -377, -382, -381,       2.750
     6 -391, -407, -410, -402, -385, -360/                               2.750
      DATA K0TAB15/                                                      3.000
     1-5190,-4915,-4594,-4268,-3974,-3729,-3530,-3373,-3238,-3096,       3.000
     2-2931,-2746,-2566,-2413,-2302,-2237,-2218,-2225,-2214,-2131,       3.000
     3-1876,-1548,-1196, -829, -445,  -44,  363,  750, 1071, 1275,       3.000
     4 1289, 1059,  765,  532,  342,  197,   73,  -14,  -47,  -53,       3.000
     5  -84, -158, -228, -291, -331, -350, -353, -365, -375, -374,       3.000
     6 -382, -400, -407, -401, -384, -359/                               3.000
      DATA K0TAB16/                                                      3.200
     1-5152,-4882,-4559,-4221,-3907,-3640,-3420,-3245,-3101,-2962,       3.200
     2-2806,-2627,-2447,-2287,-2163,-2085,-2051,-2051,-2049,-1992,       3.200
     3-1767,-1454,-1111, -754, -382,    6,  406,  792, 1128, 1364,       3.200
     4 1447, 1246,  952,  697,  493,  324,  185,   77,   27,   14,       3.200
     5   -9,  -88, -173, -251, -305, -334, -341, -353, -366, -367,       3.200
     6 -374, -394, -403, -399, -384, -359/                               3.200
      DATA K0TAB17/                                                      3.400
     1-5109,-4844,-4523,-4178,-3847,-3559,-3318,-3122,-2965,-2825,       3.400
     2-2677,-2507,-2328,-2163,-2028,-1936,-1888,-1877,-1879,-1844,       3.400
     3-1653,-1357,-1024, -677, -315,   61,  451,  834, 1178, 1441,       3.400
     4 1595, 1431, 1145,  870,  653,  465,  311,  184,  115,   92,       3.400
     5   74,   -6, -104, -200, -271, -313, -327, -338, -356, -360,       3.400
     6 -365, -386, -399, -397, -383, -359/                               3.400
      DATA K0TAB18/                                                      3.600
     1-5060,-4802,-4483,-4136,-3794,-3486,-3224,-3008,-2835,-2689,       3.600
     2-2545,-2384,-2208,-2040,-1897,-1791,-1729,-1707,-1707,-1688,       3.600
     3-1533,-1256, -934, -596, -245,  120,  498,  876, 1224, 1507,       3.600
     4 1726, 1611, 1339, 1053,  825,  621,  452,  308,  218,  182,       3.600
     5  165,   90,  -21, -135, -227, -284, -309, -321, -342, -350,       3.600
     6 -355, -376, -393, -394, -381, -358/                               3.600
      DATA K0TAB19/                                                      3.800
     1-5005,-4753,-4440,-4093,-3744,-3420,-3139,-2903,-2711,-2554,       3.800
     2-2412,-2258,-2088,-1918,-1768,-1651,-1575,-1540,-1533,-1524,       3.800
     3-1404,-1151, -842, -513, -172,  182,  549,  919, 1268, 1563,       3.800
     4 1840, 1784, 1535, 1243, 1004,  790,  608,  450,  339,  286,       3.800
     5  265,  200,   76,  -53, -168, -245, -285, -301, -324, -338,       3.800
     6 -343, -364, -386, -390, -380, -357/                               3.800
      DATA K0TAB20/                                                      4.000
     1-4943,-4700,-4392,-4050,-3698,-3362,-3063,-2808,-2596,-2425,       4.000
     2-2279,-2130,-1966,-1798,-1642,-1515,-1426,-1377,-1362,-1356,       4.000
     3-1270,-1042, -746, -427,  -95,  247,  603,  964, 1310, 1614,       4.000
     4 1939, 1946, 1726, 1437, 1187,  967,  774,  605,  475,  404,       4.000
     5  376,  320,  190,   43,  -95, -196, -253, -276, -303, -323,       4.000
     6 -330, -350, -377, -386, -377, -356/                               4.000
      DATA K0TAB21/                                                      4.200
     1-4886,-4650,-4348,-4011,-3658,-3313,-2999,-2726,-2495,-2306,       4.200
     2-2150,-2003,-1844,-1677,-1519,-1384,-1282,-1220,-1193,-1185,       4.200
     3-1125, -927, -647, -338,  -16,  316,  661, 1011, 1352, 1659,       4.200
     4 2021, 2094, 1913, 1635, 1377, 1155,  953,  776,  632,  542,       4.200
     5  500,  452,  320,  157,   -3, -130, -209, -245, -275, -302,       4.200
     6 -314, -334, -365, -379, -373, -354/                               4.200
      DATA K0TAB22/                                                      4.400
     1-4822,-4596,-4299,-3969,-3619,-3269,-2942,-2652,-2403,-2195,       4.400
     2-2026,-1877,-1722,-1558,-1397,-1255,-1143,-1067,-1028,-1015,       4.400
     3 -974, -807, -545, -247,   65,  387,  721, 1061, 1395, 1702,       4.400
     4 2092, 2227, 2094, 1834, 1569, 1346, 1138,  956,  800,  693,       4.400
     5  637,  593,  464,  288,  105,  -49, -153, -206, -241, -276,       4.400
     6 -294, -314, -350, -371, -369, -351/                               4.400
      DATA K0TAB23/                                                      4.600
     1-4753,-4539,-4247,-3925,-3580,-3229,-2893,-2588,-2321,-2096,       4.600
     2-1911,-1754,-1601,-1439,-1278,-1130,-1009, -920, -868, -846,       4.600
     3 -816, -680, -438, -152,  149,  462,  784, 1113, 1440, 1744,       4.600
     4 2152, 2343, 2267, 2031, 1766, 1541, 1331, 1145,  980,  860,       4.600
     5  788,  741,  622,  435,  232,   50,  -82, -156, -200, -243,       4.600
     6 -268, -290, -331, -359, -362, -347/                               4.600
      DATA K0TAB24/                                                      4.800
     1-4679,-4481,-4193,-3879,-3541,-3192,-2850,-2532,-2250,-2007,       4.800
     2-1805,-1637,-1481,-1321,-1159,-1008, -878, -779, -713, -680,       4.800
     3 -652, -546, -327,  -55,  237,  539,  850, 1168, 1486, 1786,       4.800
     4 2205, 2443, 2428, 2225, 1967, 1739, 1530, 1340, 1171, 1039,       4.800
     5  953,  898,  790,  596,  377,  169,    6,  -93, -150, -201,       4.800
     6 -236, -262, -306, -344, -353, -342/                               4.800
      DATA K0TAB25/                                                      5.000
     1-4596,-4421,-4135,-3828,-3498,-3154,-2810,-2483,-2187,-1928,       5.000
     2-1709,-1526,-1365,-1205,-1043, -889, -752, -642, -564, -519,       5.000
     3 -487, -406, -212,   45,  327,  619,  919, 1226, 1535, 1828,       5.000
     4 2254, 2529, 2575, 2413, 2168, 1937, 1730, 1539, 1367, 1224,       5.000
     5 1126, 1061,  964,  767,  536,  304,  112,  -17,  -90, -150,       5.000
     6 -197, -228, -275, -324, -341, -335/                               5.000
      DATA K0TAB26/                                                      5.200
     1-4505,-4358,-4074,-3774,-3452,-3114,-2771,-2439,-2132,-1859,       5.200
     2-1624,-1426,-1255,-1092, -929, -772, -630, -511, -421, -364,       5.200
     3 -323, -258,  -90,  151,  421,  703,  992, 1288, 1586, 1872,       5.200
     4 2299, 2601, 2705, 2594, 2371, 2140, 1937, 1745, 1572, 1424,       5.200
     5 1312, 1234, 1142,  950,  708,  459,  240,   79,  -16,  -88,       5.200
     6 -146, -186, -237, -295, -324, -324/                               5.200
      DATA K0TAB27/                                                      5.400
     1-4403,-4293,-4011,-3715,-3403,-3072,-2733,-2399,-2083,-1798,       5.400
     2-1548,-1334,-1151, -983, -818, -658, -511, -384, -284, -214,       5.400
     3 -159, -105,   36,  259,  518,  789, 1068, 1353, 1641, 1918,       5.400
     4 2342, 2664, 2819, 2764, 2569, 2344, 2143, 1952, 1778, 1625,       5.400
     5 1503, 1412, 1322, 1138,  889,  626,  383,  193,   70,  -14,       5.400
     6  -85, -135, -190, -260, -301, -309/                               5.400
      DATA K0TAB28/                                                      5.600
     1-4287,-4226,-3945,-3654,-3349,-3027,-2694,-2360,-2039,-1743,       5.600
     2-1480,-1252,-1056, -880, -712, -549, -397, -264, -154,  -72,       5.600
     3   -2,   48,  168,  372,  617,  878, 1146, 1421, 1698, 1967,       5.600
     4 2385, 2721, 2917, 2920, 2762, 2549, 2349, 2162, 1988, 1832,       5.600
     5 1701, 1598, 1503, 1330, 1076,  804,  542,  326,  174,   73,       5.600
     6  -11,  -74, -134, -213, -270, -289/                               5.600
      DATA K0TAB29/                                                      5.800
     1-4156,-4157,-3878,-3590,-3291,-2978,-2652,-2321,-1998,-1695,       5.800
     2-1421,-1180, -970, -785, -612, -445, -289, -149,  -31,   61,       5.800
     3  147,  202,  303,  488,  720,  970, 1228, 1492, 1759, 2019,       5.800
     4 2429, 2772, 3001, 3060, 2948, 2754, 2557, 2373, 2200, 2043,       5.800
     5 1906, 1791, 1686, 1523, 1269,  990,  716,  477,  297,  175,       5.800
     6   76,    0,  -68, -155, -229, -262/                               5.800
      DATA K0TAB30/                                                      6.000
     1-4006,-4087,-3809,-3524,-3231,-2926,-2607,-2282,-1959,-1652,       6.000
     2-1369,-1116, -893, -698, -518, -347, -186,  -39,   86,  189,       6.000
     3  293,  355,  442,  607,  826, 1065, 1314, 1567, 1824, 2073,       6.000
     4 2474, 2821, 3075, 3185, 3123, 2954, 2763, 2584, 2412, 2255,       6.000
     5 2111, 1986, 1871, 1715, 1465, 1183,  898,  641,  435,  292,       6.000
     6  178,   85,    9,  -85, -177, -227/                               6.000
      DATA K0TAB31/                                                      6.250
     1-3785,-3999,-3721,-3439,-3151,-2855,-2547,-2230,-1911,-1602,       6.250
     2-1311,-1046, -810, -601, -412, -234,  -66,   87,  222,  336,       6.250
     3  459,  534,  611,  753,  955, 1182, 1420, 1662, 1907, 2145,       6.250
     4 2533, 2880, 3155, 3315, 3321, 3196, 3025, 2852, 2684, 2524,       6.250
     5 2378, 2242, 2111, 1956, 1713, 1425, 1135,  865,  636,  464,       6.250
     6  330,  217,  123,   20,  -90, -166/                               6.250
      DATA K0TAB32/                                                      6.500
     1-3518,-3908,-3631,-3351,-3068,-2779,-2481,-2174,-1862,-1554,       6.500
     2-1259, -986, -738, -516, -316, -132,   41,  203,  348,  472,       6.500
     3  614,  707,  782,  904, 1087, 1303, 1531, 1762, 1995, 2222,       6.500
     4 2595, 2939, 3227, 3428, 3496, 3426, 3279, 3117, 2954, 2793,       6.500
     5 2643, 2499, 2355, 2195, 1962, 1671, 1377, 1100,  853,  655,       6.500
     6  503,  370,  259,  148,   19,  -84/                               6.500
      DATA K0TAB33/                                                      6.750
     1-3195,-3818,-3541,-3263,-2983,-2700,-2410,-2113,-1810,-1506,       6.750
     2-1212, -933, -676, -443, -233,  -41,  138,  308,  462,  597,       6.750
     3  757,  868,  949, 1056, 1221, 1423, 1640, 1861, 2084, 2300,       6.750
     4 2659, 2999, 3295, 3522, 3643, 3633, 3525, 3384, 3230, 3071,       6.750
     5 2915, 2761, 2604, 2436, 2210, 1919, 1619, 1334, 1075,  867,       6.750
     6  699,  552,  420,  296,  155,   24/                               6.750
      DATA K0TAB34/                                                      7.000
     1-2989,-3727,-3450,-3174,-2897,-2618,-2336,-2048,-1754,-1457,       7.000
     2-1166, -885, -622, -380, -160,   39,  225,  400,  563,  708,       7.000
     3  887, 1018, 1111, 1211, 1358, 1546, 1752, 1964, 2176, 2384,       7.000
     4 2729, 3061, 3361, 3607, 3771, 3820, 3758, 3640, 3501, 3349,       7.000
     5 3191, 3028, 2857, 2666, 2447, 2168, 1867, 1581, 1315, 1085,       7.000
     6  899,  746,  602,  466,  315,  159/                               7.000
      DATA K0TAB35/                                                      7.250
     1-2880,-3636,-3360,-3084,-2810,-2535,-2258,-1978,-1693,-1406,       7.250
     2-1119, -840, -574, -326,  -98,  109,  300,  480,  650,  805,       7.250
     3 1002, 1152, 1262, 1362, 1497, 1673, 1868, 2071, 2274, 2472,       7.250
     4 2803, 3128, 3428, 3686, 3880, 3978, 3969, 3885, 3770, 3629,       7.250
     5 3472, 3303, 3120, 2914, 2688, 2411, 2108, 1821, 1556, 1320,       7.250
     6 1124,  959,  799,  647,  494,  322/                               7.250
      DATA K0TAB36/                                                      7.500
     1-2775,-3545,-3270,-2995,-2722,-2451,-2179,-1906,-1629,-1351,       7.500
     2-1072, -796, -531, -279,  -45,  169,  367,  551,  725,  887,       7.500
     3 1100, 1272, 1401, 1509, 1636, 1801, 1987, 2181, 2375, 2565,       7.500
     4 2884, 3200, 3498, 3764, 3979, 4120, 4162, 4117, 4025, 3902,       7.500
     5 3751, 3578, 3383, 3163, 2929, 2658, 2354, 2066, 1800, 1561,       7.500
     6 1356, 1186, 1017,  853,  688,  502/                               7.500
      DATA K0TAB37/                                                      7.750
     1-2674,-3454,-3180,-2907,-2636,-2367,-2099,-1831,-1563,-1292,       7.750
     2-1021, -752, -489, -236,    1,  221,  423,  612,  789,  955,       7.750
     3 1181, 1371, 1521, 1643, 1770, 1928, 2107, 2294, 2481, 2664,       7.750
     4 2971, 3277, 3571, 3841, 4071, 4240, 4327, 4326, 4265, 4166,       7.750
     5 4027, 3853, 3650, 3416, 3169, 2898, 2596, 2305, 2040, 1801,       7.750
     6 1592, 1416, 1244, 1071,  897,  704/                               7.750
      DATA K0TAB38/                                                      8.000
     1-2576,-3364,-3092,-2820,-2550,-2283,-2019,-1756,-1494,-1232,       8.000
     2 -969, -706, -448, -197,   41,  265,  472,  664,  844, 1013,       8.000
     3 1247, 1453, 1624, 1764, 1898, 2053, 2228, 2410, 2589, 2766,       8.000
     4 3063, 3361, 3650, 3920, 4160, 4353, 4478, 4520, 4492, 4415,       8.000
     5 4293, 4124, 3914, 3669, 3410, 3136, 2840, 2548, 2282, 2043,       8.000
     6 1831, 1650, 1476, 1297, 1116,  920/                               8.000
      DATA K1TAB01/                                                     -2.000
     1-5189,-5123,-5036,-4880,-4687,-4501,-4354,-4252,-4192,-4166,      -2.000
     2-4151,-4120,-4027,-3838,-3574,-3268,-2940,-2602,-2264,-1930,      -2.000
     3-1449,-1009, -684, -547, -517, -518, -525, -530, -526, -512,      -2.000
     4 -491, -480, -481, -486, -482, -472, -448, -440, -435, -434,      -2.000
     5 -434, -431, -428, -428, -429, -428, -427, -430, -433, -434,      -2.000
     6 -432, -427, -418, -405, -386, -360/                              -2.000
      DATA K1TAB02/                                                     -1.500
     1-5220,-5134,-5068,-4957,-4788,-4598,-4426,-4295,-4207,-4159,      -1.500
     2-4139,-4122,-4074,-3946,-3726,-3448,-3140,-2816,-2487,-2160,      -1.500
     3-1680,-1225, -832, -590, -512, -502, -509, -518, -523, -517,      -1.500
     4 -489, -477, -471, -479, -479, -470, -451, -437, -432, -429,      -1.500
     5 -432, -429, -426, -425, -427, -427, -425, -427, -432, -433,      -1.500
     6 -432, -427, -418, -405, -386, -360/                              -1.500
      DATA K1TAB03/                                                     -1.000
     1-5263,-5152,-5076,-5000,-4869,-4693,-4509,-4350,-4233,-4158,      -1.000
     2-4121,-4107,-4084,-4012,-3849,-3609,-3324,-3017,-2700,-2380,      -1.000
     3-1905,-1444,-1017, -680, -515, -476, -480, -495, -507, -511,      -1.000
     4 -488, -473, -461, -468, -473, -466, -452, -433, -429, -424,      -1.000
     5 -427, -427, -424, -421, -424, -425, -423, -424, -429, -432,      -1.000
     6 -431, -426, -418, -405, -386, -360/                              -1.000
      DATA K1TAB04/                                                     -0.500
     1-5306,-5177,-5079,-5007,-4914,-4765,-4585,-4408,-4262,-4159,      -0.500
     2-4096,-4072,-4061,-4029,-3928,-3738,-3484,-3198,-2895,-2586,      -0.500
     3-2118,-1656,-1210, -813, -540, -437, -427, -446, -470, -487,      -0.500
     4 -483, -465, -451, -452, -462, -459, -448, -429, -423, -419,      -0.500
     5 -421, -423, -422, -419, -420, -422, -421, -421, -426, -431,      -0.500
     6 -431, -426, -418, -405, -386, -360/                              -0.500
      DATA K1TAB05/                                                      0.000
     1-5332,-5197,-5076,-4988,-4910,-4796,-4633,-4449,-4278,-4144,       0.000
     2-4053,-4007,-3996,-3988,-3943,-3815,-3603,-3344,-3060,-2763,       0.000
     3-2308,-1847,-1392, -958, -597, -390, -336, -352, -389, -426,       0.000
     4 -459, -447, -438, -431, -443, -447, -439, -424, -415, -412,       0.000
     5 -412, -418, -418, -416, -414, -418, -419, -417, -421, -428,       0.000
     6 -430, -426, -418, -405, -386, -360/                               0.000
      DATA K1TAB06/                                                      0.500
     1-5335,-5189,-5053,-4942,-4857,-4766,-4628,-4450,-4262,-4097,       0.500
     2-3974,-3897,-3869,-3872,-3866,-3804,-3651,-3426,-3166,-2887,       0.500
     3-2450,-1998,-1539,-1084, -665, -350, -208, -197, -240, -299,       0.500
     4 -385, -406, -409, -403, -414, -425, -423, -412, -403, -403,       0.500
     5 -402, -409, -413, -412, -409, -413, -416, -414, -415, -424,       0.500
     6 -428, -425, -418, -405, -386, -360/                               0.500
      DATA K1TAB07/                                                      1.000
     1-5327,-5144,-4990,-4855,-4750,-4662,-4550,-4390,-4199,-4009,       1.000
     2-3849,-3736,-3674,-3663,-3677,-3669,-3585,-3410,-3179,-2921,       1.000
     3-2509,-2076,-1624,-1163, -714, -320,  -61,   21,   -8,  -80,       1.000
     4 -225, -310, -343, -357, -370, -390, -394, -388, -381, -386,       1.000
     5 -388, -396, -404, -407, -404, -406, -411, -410, -409, -418,       1.000
     6 -425, -424, -417, -405, -386, -360/                               1.000
      DATA K1TAB08/                                                      1.250
     1-5321,-5113,-4941,-4793,-4674,-4580,-4476,-4328,-4142,-3946,       1.250
     2-3771,-3639,-3557,-3530,-3540,-3549,-3500,-3356,-3143,-2897,       1.250
     3-2498,-2077,-1636,-1179, -723, -305,    6,  144,  138,   65,       1.250
     4 -102, -228, -286, -319, -338, -364, -373, -369, -365, -372,       1.250
     5 -378, -387, -398, -402, -401, -401, -407, -408, -406, -414,       1.250
     6 -423, -423, -417, -405, -386, -360/                               1.250
      DATA K1TAB09/                                                      1.500
     1-5315,-5081,-4885,-4719,-4583,-4479,-4379,-4245,-4066,-3868,       1.500
     2-3681,-3530,-3428,-3380,-3381,-3399,-3379,-3270,-3080,-2845,       1.500
     3-2461,-2053,-1624,-1175, -719, -285,   68,  268,  299,  234,       1.500
     4   48, -120, -208, -264, -294, -331, -348, -346, -342, -353,       1.500
     5 -365, -375, -390, -397, -398, -396, -403, -406, -403, -409,       1.500
     6 -420, -422, -417, -405, -386, -360/                               1.500
      DATA K1TAB10/                                                      1.750
     1-5304,-5050,-4825,-4638,-4482,-4363,-4259,-4135,-3969,-3774,       1.750
     2-3579,-3412,-3292,-3223,-3208,-3224,-3225,-3153,-2989,-2770,       1.750
     3-2400,-2005,-1589,-1153, -703, -261,  123,  381,  464,  418,       1.750
     4  226,   19, -105, -189, -238, -285, -314, -316, -314, -326,       1.750
     5 -346, -361, -379, -390, -394, -392, -398, -402, -400, -404,       1.750
     6 -416, -420, -416, -405, -386, -360/                               1.750
      DATA K1TAB11/                                                      2.000
     1-5291,-5022,-4767,-4551,-4372,-4233,-4122,-4005,-3851,-3664,       2.000
     2-3466,-3287,-3148,-3059,-3024,-3032,-3046,-3006,-2874,-2674,       2.000
     3-2319,-1937,-1535,-1113, -673, -230,  174,  481,  624,  612,       2.000
     4  427,  187,   19,  -92, -163, -225, -271, -281, -278, -290,       2.000
     5 -320, -341, -365, -382, -388, -386, -392, -398, -396, -398,       2.000
     6 -412, -418, -415, -404, -386, -360/                               2.000
      DATA K1TAB12/                                                      2.250
     1-5272,-4994,-4713,-4466,-4263,-4099,-3973,-3856,-3714,-3538,       2.250
     2-3343,-3156,-3001,-2894,-2839,-2831,-2847,-2833,-2736,-2559,       2.250
     3-2223,-1853,-1465,-1058, -630, -194,  221,  564,  766,  802,       2.250
     4  640,  383,  172,   31,  -70, -148, -212, -235, -235, -244,       2.250
     5 -282, -314, -345, -369, -380, -380, -384, -393, -392, -393,       2.250
     6 -406, -415, -413, -404, -385, -360/                               2.250
      DATA K1TAB13/                                                      2.500
     1-5248,-4965,-4665,-4386,-4154,-3964,-3818,-3695,-3562,-3399,       2.500
     2-3211,-3020,-2853,-2728,-2653,-2627,-2637,-2641,-2578,-2430,       2.500
     3-2114,-1757,-1382, -990, -577, -149,  268,  635,  889,  982,       2.500
     4  861,  599,  348,  177,   43,  -50, -137, -178, -183, -189,       2.500
     5 -231, -277, -318, -351, -369, -373, -375, -386, -388, -387,       2.500
     6 -399, -412, -412, -403, -385, -360/                               2.500
      DATA K1TAB14/                                                      2.750
     1-5216,-4934,-4620,-4315,-4052,-3837,-3666,-3529,-3399,-3248,       2.750
     2-3070,-2880,-2705,-2565,-2471,-2427,-2423,-2433,-2400,-2284,       2.750
     3-1996,-1653,-1290, -911, -513,  -98,  316,  696,  990, 1141,       2.750
     4 1079,  828,  550,  348,  184,   64,  -40, -103, -120, -125,       2.750
     5 -164, -225, -280, -326, -353, -363, -365, -376, -382, -380,       2.750
     6 -391, -406, -409, -402, -385, -360/                               2.750
      DATA K1TAB15/                                                      3.000
     1-5178,-4900,-4579,-4253,-3960,-3717,-3519,-3364,-3229,-3088,       3.000
     2-2922,-2738,-2558,-2405,-2294,-2229,-2210,-2218,-2207,-2125,       3.000
     3-1869,-1541,-1190, -824, -441,  -41,  366,  752, 1074, 1277,       3.000
     4 1292, 1063,  769,  535,  347,  201,   77,  -11,  -44,  -50,       3.000
     5  -82, -157, -227, -290, -330, -349, -352, -365, -375, -373,       3.000
     6 -381, -400, -406, -400, -384, -359/                               3.000
      DATA K1TAB16/                                                      3.200
     1-5141,-4868,-4545,-4207,-3895,-3630,-3411,-3236,-3093,-2954,       3.200
     2-2798,-2620,-2440,-2280,-2156,-2078,-2044,-2044,-2042,-1985,       3.200
     3-1760,-1448,-1106, -750, -378,    9,  408,  794, 1130, 1366,       3.200
     4 1450, 1250,  956,  701,  497,  328,  188,   80,   30,   17,       3.200
     5   -7,  -87, -171, -250, -304, -333, -341, -352, -366, -367,       3.200
     6 -373, -393, -403, -399, -384, -359/                               3.200
      DATA K1TAB17/                                                      3.400
     1-5099,-4832,-4510,-4166,-3837,-3550,-3310,-3115,-2959,-2818,       3.400
     2-2670,-2501,-2322,-2156,-2022,-1929,-1881,-1871,-1873,-1837,       3.400
     3-1646,-1351,-1019, -672, -311,   64,  453,  836, 1180, 1443,       3.400
     4 1597, 1434, 1148,  874,  657,  468,  315,  187,  117,   95,       3.400
     5   76,   -4, -103, -199, -271, -312, -327, -338, -355, -359,       3.400
     6 -364, -385, -399, -397, -383, -359/                               3.400
      DATA K1TAB18/                                                      3.600
     1-5050,-4791,-4472,-4125,-3784,-3477,-3217,-3002,-2829,-2683,       3.600
     2-2539,-2378,-2203,-2034,-1891,-1785,-1723,-1700,-1700,-1681,       3.600
     3-1526,-1250, -929, -591, -241,  123,  501,  878, 1226, 1509,       3.600
     4 1728, 1614, 1343, 1056,  828,  624,  456,  311,  221,  185,       3.600
     5  167,   92,  -20, -133, -226, -284, -308, -321, -342, -350,       3.600
     6 -354, -376, -393, -394, -381, -358/                               3.600
      DATA K1TAB19/                                                      3.800
     1-4996,-4744,-4430,-4084,-3736,-3413,-3133,-2898,-2706,-2550,       3.800
     2-2407,-2253,-2083,-1913,-1763,-1646,-1570,-1534,-1527,-1518,       3.800
     3-1398,-1145, -836, -508, -167,  185,  552,  921, 1270, 1565,       3.800
     4 1842, 1786, 1538, 1246, 1007,  793,  611,  453,  342,  289,       3.800
     5  267,  201,   78,  -52, -167, -245, -284, -300, -324, -338,       3.800
     6 -343, -364, -386, -390, -379, -357/                               3.800
      DATA K1TAB20/                                                      4.000
     1-4937,-4692,-4384,-4042,-3691,-3356,-3058,-2804,-2592,-2421,       4.000
     2-2274,-2126,-1962,-1793,-1638,-1511,-1421,-1372,-1356,-1350,       4.000
     3-1263,-1036, -741, -422,  -91,  251,  606,  967, 1312, 1616,       4.000
     4 1941, 1948, 1728, 1439, 1189,  969,  777,  607,  477,  407,       4.000
     5  378,  322,  191,   44,  -94, -195, -252, -275, -302, -322,       4.000
     6 -329, -350, -377, -386, -377, -356/                               4.000
      DATA K1TAB21/                                                      4.200
     1-4879,-4642,-4340,-4004,-3652,-3309,-2995,-2722,-2492,-2303,       4.200
     2-2147,-2000,-1841,-1673,-1515,-1379,-1277,-1214,-1187,-1179,       4.200
     3-1119, -921, -641, -333,  -12,  320,  663, 1014, 1355, 1661,       4.200
     4 2023, 2096, 1915, 1638, 1379, 1157,  955,  778,  634,  545,       4.200
     5  502,  454,  322,  159,   -2, -129, -208, -244, -274, -301,       4.200
     6 -313, -333, -365, -379, -373, -354/                               4.200
      DATA K1TAB22/                                                      4.400
     1-4815,-4589,-4292,-3962,-3613,-3265,-2939,-2649,-2401,-2193,       4.400
     2-2024,-1874,-1718,-1554,-1393,-1250,-1138,-1061,-1022,-1008,       4.400
     3 -967, -801, -539, -242,   69,  391,  724, 1063, 1397, 1704,       4.400
     4 2093, 2229, 2096, 1836, 1571, 1348, 1140,  958,  801,  695,       4.400
     5  639,  594,  466,  290,  106,  -48, -153, -205, -241, -275,       4.400
     6 -293, -314, -350, -371, -369, -351/                               4.400
      DATA K1TAB23/                                                      4.600
     1-4747,-4533,-4240,-3919,-3575,-3226,-2890,-2586,-2320,-2094,       4.600
     2-1909,-1752,-1597,-1435,-1274,-1126,-1004, -915, -863, -840,       4.600
     3 -809, -674, -433, -148,  153,  465,  787, 1116, 1442, 1746,       4.600
     4 2154, 2345, 2268, 2033, 1768, 1543, 1333, 1146,  982,  861,       4.600
     5  790,  743,  624,  437,  234,   51,  -81, -156, -200, -242,       4.600
     6 -268, -290, -331, -359, -362, -347/                               4.600
      DATA K1TAB24/                                                      4.800
     1-4672,-4475,-4186,-3873,-3536,-3188,-2847,-2530,-2249,-2006,       4.800
     2-1804,-1635,-1479,-1319,-1157,-1005, -875, -775, -709, -676,       4.800
     3 -648, -541, -322,  -50,  241,  543,  853, 1171, 1488, 1787,       4.800
     4 2207, 2444, 2429, 2226, 1968, 1741, 1532, 1341, 1173, 1040,       4.800
     5  955,  899,  792,  597,  378,  170,    7,  -93, -150, -200,       4.800
     6 -236, -262, -306, -343, -353, -342/                               4.800
      DATA K1TAB25/                                                      5.000
     1-4590,-4414,-4129,-3822,-3494,-3150,-2807,-2481,-2185,-1927,       5.000
     2-1707,-1524,-1363,-1203,-1041, -886, -750, -639, -561, -515,       5.000
     3 -484, -401, -207,   49,  331,  623,  922, 1229, 1537, 1830,       5.000
     4 2255, 2530, 2576, 2414, 2169, 1938, 1732, 1540, 1368, 1225,       5.000
     5 1127, 1063,  965,  768,  537,  305,  113,  -17,  -90, -150,       5.000
     6 -196, -227, -275, -323, -341, -335/                               5.000
      DATA K1TAB26/                                                      5.200
     1-4499,-4351,-4069,-3768,-3448,-3111,-2769,-2437,-2130,-1857,       5.200
     2-1622,-1424,-1253,-1090, -927, -770, -628, -509, -419, -361,       5.200
     3 -319, -254,  -86,  154,  424,  706,  995, 1290, 1588, 1874,       5.200
     4 2300, 2602, 2706, 2595, 2372, 2141, 1938, 1746, 1573, 1424,       5.200
     5 1313, 1235, 1143,  951,  709,  460,  240,   80,  -16,  -87,       5.200
     6 -145, -185, -237, -295, -324, -324/                               5.200
      DATA K1TAB27/                                                      5.400
     1-4397,-4287,-4005,-3711,-3398,-3069,-2731,-2397,-2081,-1796,       5.400
     2-1546,-1332,-1150, -982, -817, -657, -509, -382, -282, -211,       5.400
     3 -157, -102,   40,  263,  521,  792, 1070, 1355, 1643, 1920,       5.400
     4 2343, 2665, 2820, 2765, 2570, 2345, 2143, 1953, 1779, 1626,       5.400
     5 1504, 1413, 1323, 1139,  890,  627,  383,  194,   70,  -13,       5.400
     6  -85, -135, -189, -259, -301, -309/                               5.400
      DATA K1TAB28/                                                      5.600
     1-4282,-4220,-3940,-3650,-3345,-3024,-2691,-2358,-2037,-1742,       5.600
     2-1479,-1251,-1055, -879, -711, -548, -396, -262, -152,  -70,       5.600
     3    0,   50,  170,  375,  620,  881, 1149, 1423, 1700, 1969,       5.600
     4 2386, 2721, 2918, 2921, 2763, 2550, 2350, 2162, 1989, 1832,       5.600
     5 1702, 1599, 1503, 1331, 1077,  805,  543,  326,  175,   73,       5.600
     6  -11,  -73, -133, -213, -270, -289/                               5.600
      DATA K1TAB29/                                                      5.800
     1-4151,-4152,-3873,-3586,-3288,-2975,-2650,-2319,-1996,-1694,       5.800
     2-1420,-1179, -969, -784, -611, -444, -287, -147,  -29,   63,       5.800
     3  149,  204,  306,  491,  723,  973, 1231, 1494, 1761, 2020,       5.800
     4 2430, 2773, 3002, 3061, 2948, 2754, 2557, 2374, 2200, 2044,       5.800
     5 1906, 1791, 1686, 1524, 1270,  991,  716,  478,  298,  176,       5.800
     6   76,    0,  -67, -155, -229, -262/                               5.800
      DATA K1TAB30/                                                      6.000
     1-4002,-4082,-3804,-3520,-3227,-2923,-2605,-2280,-1958,-1650,       6.000
     2-1367,-1114, -892, -696, -517, -346, -184,  -38,   88,  190,       6.000
     3  295,  357,  444,  610,  828, 1068, 1316, 1569, 1825, 2075,       6.000
     4 2475, 2822, 3076, 3186, 3124, 2954, 2764, 2584, 2412, 2255,       6.000
     5 2112, 1987, 1871, 1716, 1465, 1183,  899,  642,  435,  293,       6.000
     6  178,   85,   10,  -84, -176, -227/                               6.000
      DATA K1TAB31/                                                      6.250
     1-3782,-3993,-3716,-3435,-3148,-2852,-2545,-2228,-1910,-1600,       6.250
     2-1310,-1045, -809, -600, -411, -233,  -65,   88,  224,  337,       6.250
     3  460,  536,  613,  756,  957, 1185, 1422, 1664, 1909, 2147,       6.250
     4 2534, 2881, 3155, 3316, 3321, 3197, 3025, 2853, 2684, 2525,       6.250
     5 2378, 2243, 2112, 1956, 1713, 1426, 1136,  866,  636,  464,       6.250
     6  330,  217,  124,   21,  -90, -166/                               6.250
      DATA K1TAB32/                                                      6.500
     1-3516,-3904,-3627,-3348,-3066,-2777,-2479,-2172,-1860,-1553,       6.500
     2-1258, -985, -737, -515, -315, -131,   42,  205,  350,  474,       6.500
     3  616,  709,  784,  906, 1089, 1305, 1532, 1764, 1997, 2223,       6.500
     4 2596, 2940, 3228, 3428, 3496, 3426, 3279, 3117, 2954, 2793,       6.500
     5 2643, 2499, 2355, 2195, 1963, 1672, 1378, 1101,  853,  655,       6.500
     6  504,  371,  259,  149,   19,  -84/                               6.500
      DATA K1TAB33/                                                      6.750
     1-3193,-3813,-3537,-3260,-2981,-2698,-2409,-2111,-1808,-1505,       6.750
     2-1211, -932, -675, -442, -232,  -40,  139,  309,  463,  599,       6.750
     3  759,  870,  951, 1059, 1223, 1425, 1642, 1863, 2085, 2302,       6.750
     4 2660, 2999, 3295, 3522, 3643, 3633, 3525, 3384, 3230, 3071,       6.750
     5 2915, 2761, 2605, 2436, 2210, 1919, 1620, 1335, 1076,  867,       6.750
     6  700,  552,  421,  297,  155,   24/                               6.750
      DATA K1TAB34/                                                      7.000
     1-2988,-3722,-3447,-3171,-2894,-2616,-2334,-2046,-1752,-1456,       7.000
     2-1165, -884, -621, -379, -159,   40,  226,  401,  564,  710,       7.000
     3  889, 1020, 1113, 1213, 1360, 1549, 1754, 1966, 2178, 2385,       7.000
     4 2729, 3062, 3361, 3608, 3771, 3820, 3758, 3640, 3502, 3349,       7.000
     5 3191, 3029, 2857, 2666, 2447, 2168, 1867, 1581, 1316, 1085,       7.000
     6  900,  746,  602,  466,  315,  159/                               7.000
      DATA K1TAB35/                                                      7.250
     1-2878,-3632,-3357,-3082,-2807,-2533,-2257,-1977,-1692,-1404,       7.250
     2-1118, -839, -573, -325,  -97,  110,  302,  482,  651,  806,       7.250
     3 1003, 1154, 1264, 1364, 1499, 1675, 1870, 2073, 2275, 2473,       7.250
     4 2804, 3129, 3428, 3687, 3880, 3978, 3969, 3885, 3770, 3629,       7.250
     5 3472, 3303, 3120, 2914, 2688, 2411, 2108, 1822, 1556, 1321,       7.250
     6 1124,  960,  799,  647,  494,  323/                               7.250
      DATA K1TAB36/                                                      7.500
     1-2773,-3541,-3267,-2993,-2720,-2449,-2177,-1904,-1628,-1349,       7.500
     2-1070, -795, -529, -278,  -44,  170,  368,  552,  726,  888,       7.500
     3 1102, 1273, 1403, 1511, 1638, 1803, 1989, 2183, 2377, 2567,       7.500
     4 2885, 3200, 3498, 3764, 3980, 4120, 4162, 4117, 4025, 3902,       7.500
     5 3751, 3578, 3383, 3163, 2929, 2658, 2355, 2066, 1800, 1561,       7.500
     6 1357, 1187, 1017,  853,  688,  503/                               7.500
      DATA K1TAB37/                                                      7.750
     1-2672,-3450,-3177,-2904,-2634,-2365,-2097,-1830,-1561,-1291,       7.750
     2-1020, -751, -488, -235,    2,  222,  425,  613,  790,  957,       7.750
     3 1183, 1373, 1523, 1645, 1772, 1930, 2109, 2296, 2482, 2665,       7.750
     4 2972, 3278, 3572, 3841, 4071, 4241, 4327, 4327, 4265, 4166,       7.750
     5 4027, 3853, 3650, 3416, 3169, 2898, 2596, 2305, 2040, 1801,       7.750
     6 1592, 1416, 1244, 1071,  897,  705/                               7.750
      DATA K1TAB38/                                                      8.000
     1-2574,-3360,-3089,-2817,-2548,-2282,-2017,-1755,-1493,-1230,       8.000
     2 -968, -705, -447, -196,   42,  266,  473,  665,  845, 1015,       8.000
     3 1249, 1455, 1626, 1766, 1900, 2055, 2230, 2411, 2591, 2768,       8.000
     4 3064, 3361, 3650, 3920, 4160, 4353, 4478, 4520, 4492, 4415,       8.000
     5 4293, 4124, 3914, 3669, 3410, 3136, 2840, 2548, 2282, 2043,       8.000
     6 1831, 1650, 1476, 1297, 1116,  920/                               8.000
      DATA K2TAB01/                                                     -2.000
     1-5171,-5106,-5020,-4865,-4673,-4489,-4342,-4241,-4182,-4158,      -2.000
     2-4146,-4116,-4025,-3836,-3572,-3266,-2937,-2599,-2261,-1927,      -2.000
     3-1446,-1006, -680, -543, -513, -514, -522, -527, -524, -510,      -2.000
     4 -489, -478, -479, -485, -481, -471, -447, -439, -434, -433,      -2.000
     5 -434, -430, -428, -428, -429, -428, -427, -430, -433, -434,      -2.000
     6 -432, -426, -418, -405, -386, -360/                              -2.000
      DATA K2TAB02/                                                     -1.500
     1-5200,-5115,-5050,-4941,-4773,-4584,-4413,-4283,-4195,-4149,      -1.500
     2-4132,-4117,-4070,-3943,-3724,-3446,-3137,-2813,-2484,-2156,      -1.500
     3-1676,-1222, -829, -586, -508, -497, -505, -515, -520, -514,      -1.500
     4 -487, -474, -468, -477, -478, -469, -449, -436, -431, -428,      -1.500
     5 -431, -429, -426, -424, -426, -426, -425, -427, -432, -433,      -1.500
     6 -431, -426, -418, -405, -386, -360/                              -1.500
      DATA K2TAB03/                                                     -1.000
     1-5242,-5131,-5057,-4981,-4852,-4677,-4494,-4337,-4220,-4145,      -1.000
     2-4111,-4099,-4079,-4008,-3846,-3605,-3320,-3013,-2696,-2376,      -1.000
     3-1901,-1440,-1013, -677, -510, -471, -475, -490, -503, -508,      -1.000
     4 -485, -469, -457, -465, -471, -464, -450, -432, -428, -423,      -1.000
     5 -426, -426, -423, -421, -423, -425, -423, -424, -429, -432,      -1.000
     6 -431, -426, -418, -405, -386, -360/                              -1.000
      DATA K2TAB04/                                                     -0.500
     1-5285,-5154,-5057,-4986,-4894,-4747,-4569,-4392,-4247,-4144,      -0.500
     2-4082,-4061,-4053,-4023,-3924,-3734,-3480,-3193,-2890,-2581,      -0.500
     3-2113,-1651,-1206, -809, -536, -431, -421, -440, -464, -482,      -0.500
     4 -479, -461, -447, -448, -459, -458, -446, -427, -422, -418,      -0.500
     5 -420, -422, -421, -418, -419, -422, -421, -420, -425, -431,      -0.500
     6 -431, -426, -418, -405, -386, -360/                              -0.500
      DATA K2TAB05/                                                      0.000
     1-5311,-5173,-5052,-4964,-4889,-4776,-4614,-4431,-4260,-4127,       0.000
     2-4037,-3992,-3984,-3980,-3937,-3809,-3598,-3338,-3054,-2757,       0.000
     3-2302,-1842,-1387, -954, -592, -385, -330, -346, -383, -420,       0.000
     4 -454, -443, -432, -425, -440, -445, -437, -422, -414, -411,       0.000
     5 -411, -417, -418, -415, -414, -418, -419, -416, -420, -428,       0.000
     6 -430, -426, -418, -405, -386, -360/                               0.000
      DATA K2TAB06/                                                      0.500
     1-5313,-5165,-5027,-4916,-4833,-4743,-4606,-4429,-4241,-4076,       0.500
     2-3954,-3879,-3853,-3859,-3857,-3798,-3644,-3420,-3159,-2880,       0.500
     3-2443,-1992,-1533,-1079, -661, -346, -202, -191, -233, -292,       0.500
     4 -379, -400, -403, -397, -410, -422, -420, -410, -401, -401,       0.500
     5 -401, -408, -412, -411, -408, -412, -415, -413, -415, -424,       0.500
     6 -428, -425, -418, -405, -386, -360/                               0.500
      DATA K2TAB07/                                                      1.000
     1-5305,-5120,-4963,-4827,-4724,-4637,-4525,-4366,-4175,-3986,       1.000
     2-3827,-3715,-3654,-3646,-3664,-3659,-3577,-3403,-3171,-2912,       1.000
     3-2500,-2067,-1617,-1157, -709, -316,  -57,   27,    0,  -72,       1.000
     4 -217, -303, -336, -349, -363, -386, -391, -384, -378, -384,       1.000
     5 -386, -395, -403, -406, -403, -405, -410, -409, -408, -417,       1.000
     6 -425, -424, -417, -405, -386, -360/                               1.000
      DATA K2TAB08/                                                      1.250
     1-5300,-5088,-4915,-4765,-4647,-4555,-4451,-4303,-4118,-3922,       1.250
     2-3748,-3616,-3536,-3511,-3526,-3538,-3491,-3348,-3135,-2887,       1.250
     3-2489,-2068,-1628,-1172, -718, -300,   11,  150,  145,   73,       1.250
     4  -94, -221, -278, -310, -330, -359, -369, -366, -362, -370,       1.250
     5 -376, -385, -397, -402, -401, -400, -407, -407, -405, -413,       1.250
     6 -422, -423, -417, -405, -386, -360/                               1.250
      DATA K2TAB09/                                                      1.500
     1-5294,-5057,-4859,-4691,-4555,-4454,-4355,-4219,-4042,-3844,       1.500
     2-3658,-3507,-3406,-3360,-3365,-3386,-3369,-3261,-3070,-2836,       1.500
     3-2451,-2043,-1615,-1168, -713, -280,   73,  273,  305,  242,       1.500
     4   57, -112, -200, -256, -285, -325, -344, -342, -339, -350,       1.500
     5 -362, -374, -389, -396, -397, -395, -403, -405, -402, -408,       1.500
     6 -420, -422, -416, -405, -386, -360/                               1.500
      DATA K2TAB10/                                                      1.750
     1-5284,-5027,-4799,-4610,-4455,-4337,-4235,-4111,-3944,-3750,       1.750
     2-3556,-3390,-3270,-3203,-3191,-3210,-3214,-3143,-2979,-2760,       1.750
     3-2389,-1994,-1580,-1145, -696, -256,  128,  386,  470,  426,       1.750
     4  236,   28,  -97, -180, -228, -278, -309, -312, -310, -323,       1.750
     5 -343, -359, -378, -389, -393, -391, -397, -402, -399, -403,       1.750
     6 -416, -420, -416, -404, -386, -360/                               1.750
      DATA K2TAB11/                                                      2.000
     1-5271,-4999,-4742,-4525,-4345,-4207,-4099,-3982,-3828,-3641,       2.000
     2-3444,-3266,-3127,-3039,-3006,-3017,-3034,-2996,-2864,-2663,       2.000
     3-2308,-1926,-1526,-1105, -666, -225,  179,  485,  629,  619,       2.000
     4  436,  197,   28,  -82, -153, -216, -265, -276, -273, -286,       2.000
     5 -317, -339, -364, -380, -387, -385, -391, -398, -395, -397,       2.000
     6 -411, -418, -415, -404, -385, -360/                               2.000
      DATA K2TAB12/                                                      2.250
     1-5253,-4972,-4689,-4441,-4237,-4075,-3950,-3834,-3692,-3517,       2.250
     2-3322,-3136,-2982,-2875,-2822,-2817,-2834,-2822,-2725,-2548,       2.250
     3-2211,-1842,-1455,-1049, -623, -188,  226,  568,  771,  809,       2.250
     4  649,  393,  181,   41,  -60, -138, -206, -230, -230, -240,       2.250
     5 -279, -311, -343, -367, -379, -379, -383, -392, -391, -392,       2.250
     6 -405, -415, -413, -404, -385, -360/                               2.250
      DATA K2TAB13/                                                      2.500
     1-5229,-4944,-4642,-4363,-4130,-3941,-3797,-3675,-3542,-3380,       2.500
     2-3192,-3002,-2835,-2710,-2636,-2612,-2624,-2629,-2567,-2418,       2.500
     3-2103,-1746,-1372, -981, -570, -144,  273,  640,  894,  989,       2.500
     4  869,  608,  358,  186,   54,  -40, -129, -173, -178, -184,       2.500
     5 -228, -274, -316, -350, -368, -372, -374, -385, -387, -386,       2.500
     6 -398, -411, -412, -403, -385, -360/                               2.500
      DATA K2TAB14/                                                      2.750
     1-5199,-4914,-4599,-4293,-4031,-3816,-3647,-3512,-3381,-3230,       2.750
     2-3053,-2864,-2689,-2549,-2456,-2412,-2411,-2421,-2389,-2272,       2.750
     3-1984,-1641,-1279, -902, -506,  -92,  321,  701,  994, 1146,       2.750
     4 1087,  837,  559,  357,  194,   75,  -32,  -97, -114, -120,       2.750
     5 -160, -222, -277, -324, -351, -362, -364, -375, -381, -379,       2.750
     6 -390, -406, -409, -402, -385, -359/                               2.750
      DATA K2TAB15/                                                      3.000
     1-5162,-4881,-4558,-4232,-3941,-3699,-3502,-3348,-3214,-3072,       3.000
     2-2907,-2723,-2543,-2391,-2279,-2216,-2198,-2206,-2195,-2113,       3.000
     3-1857,-1530,-1180, -815, -434,  -34,  371,  757, 1078, 1282,       3.000
     4 1299, 1072,  778,  544,  356,  212,   86,   -5,  -38,  -44,       3.000
     5  -78, -153, -223, -288, -329, -348, -351, -364, -373, -372,       3.000
     6 -381, -400, -406, -400, -384, -359/                               3.000
      DATA K2TAB16/                                                      3.200
     1-5126,-4850,-4525,-4189,-3877,-3613,-3396,-3223,-3079,-2940,       3.200
     2-2785,-2607,-2427,-2267,-2143,-2065,-2032,-2032,-2031,-1973,       3.200
     3-1748,-1436,-1095, -741, -371,   16,  414,  799, 1134, 1371,       3.200
     4 1457, 1257,  964,  709,  506,  338,  198,   87,   36,   23,       3.200
     5   -2,  -83, -168, -247, -303, -332, -340, -351, -365, -366,       3.200
     6 -373, -393, -402, -399, -383, -359/                               3.200
      DATA K2TAB17/                                                      3.400
     1-5084,-4816,-4492,-4148,-3821,-3535,-3297,-3103,-2947,-2806,       3.400
     2-2659,-2489,-2310,-2145,-2010,-1917,-1869,-1859,-1861,-1826,       3.400
     3-1634,-1339,-1008, -663, -304,   71,  459,  841, 1185, 1448,       3.400
     4 1603, 1442, 1156,  881,  665,  478,  324,  194,  124,  101,       3.400
     5   81,    0,  -99, -196, -269, -311, -325, -337, -354, -358,       3.400
     6 -363, -385, -398, -397, -383, -359/                               3.400
      DATA K2TAB18/                                                      3.600
     1-5037,-4776,-4456,-4110,-3770,-3465,-3206,-2992,-2819,-2673,       3.600
     2-2529,-2368,-2193,-2024,-1880,-1774,-1712,-1689,-1689,-1669,       3.600
     3-1514,-1238, -918, -582, -233,  130,  507,  883, 1231, 1513,       3.600
     4 1734, 1621, 1350, 1063,  835,  633,  465,  318,  227,  192,       3.600
     5  173,   96,  -16, -130, -223, -282, -307, -320, -340, -349,       3.600
     6 -353, -375, -393, -394, -381, -358/                               3.600
      DATA K2TAB19/                                                      3.800
     1-4985,-4731,-4416,-4070,-3724,-3402,-3124,-2890,-2698,-2541,       3.800
     2-2398,-2245,-2074,-1904,-1754,-1636,-1559,-1523,-1516,-1506,       3.800
     3-1386,-1133, -825, -498, -159,  192,  558,  926, 1274, 1569,       3.800
     4 1847, 1792, 1544, 1252, 1013,  800,  619,  459,  348,  296,       3.800
     5  273,  206,   82,  -49, -164, -243, -282, -299, -322, -336,       3.800
     6 -342, -363, -385, -390, -379, -357/                               3.800
      DATA K2TAB20/                                                      4.000
     1-4926,-4680,-4372,-4031,-3681,-3347,-3050,-2796,-2585,-2414,       4.000
     2-2267,-2119,-1955,-1786,-1630,-1502,-1411,-1362,-1345,-1339,       4.000
     3-1252,-1024, -730, -412,  -83,  258,  612,  972, 1317, 1620,       4.000
     4 1945, 1953, 1734, 1445, 1195,  976,  784,  614,  483,  413,       4.000
     5  384,  327,  196,   48,  -91, -193, -251, -274, -301, -321,       4.000
     6 -328, -349, -377, -385, -377, -356/                               4.000
      DATA K2TAB21/                                                      4.200
     1-4869,-4631,-4329,-3993,-3643,-3300,-2988,-2716,-2485,-2297,       4.200
     2-2141,-1994,-1835,-1667,-1508,-1372,-1269,-1206,-1178,-1169,       4.200
     3-1108, -910, -631, -323,   -3,  327,  670, 1019, 1359, 1665,       4.200
     4 2027, 2101, 1920, 1643, 1384, 1163,  962,  784,  639,  550,       4.200
     5  508,  459,  326,  163,    0, -126, -207, -243, -273, -300,       4.200
     6 -312, -332, -364, -379, -373, -354/                               4.200
      DATA K2TAB22/                                                      4.400
     1-4805,-4578,-4281,-3952,-3605,-3258,-2932,-2643,-2395,-2187,       4.400
     2-2019,-1869,-1714,-1549,-1388,-1245,-1132,-1055,-1014,-1000,       4.400
     3 -958, -790, -529, -232,   77,  398,  730, 1069, 1402, 1708,       4.400
     4 2097, 2233, 2101, 1841, 1575, 1353, 1146,  964,  806,  700,       4.400
     5  645,  599,  470,  294,  110,  -45, -151, -204, -239, -274,       4.400
     6 -292, -312, -349, -370, -368, -351/                               4.400
      DATA K2TAB23/                                                      4.600
     1-4737,-4522,-4230,-3909,-3567,-3219,-2884,-2580,-2315,-2089,       4.600
     2-1904,-1748,-1594,-1432,-1270,-1122, -999, -909, -856, -833,       4.600
     3 -801, -664, -423, -138,  162,  473,  793, 1121, 1447, 1750,       4.600
     4 2157, 2348, 2272, 2037, 1772, 1547, 1338, 1151,  986,  866,       4.600
     5  795,  747,  627,  440,  237,   54,  -79, -154, -198, -241,       4.600
     6 -267, -289, -330, -359, -362, -347/                               4.600
      DATA K2TAB24/                                                      4.800
     1-4663,-4465,-4177,-3864,-3528,-3182,-2842,-2525,-2244,-2002,       4.800
     2-1800,-1631,-1476,-1315,-1153,-1001, -870, -769, -703, -669,       4.800
     3 -639, -531, -313,  -41,  249,  550,  860, 1176, 1493, 1792,       4.800
     4 2210, 2447, 2432, 2230, 1972, 1744, 1536, 1346, 1177, 1044,       4.800
     5  959,  903,  795,  601,  382,  173,   10,  -91, -148, -199,       4.800
     6 -234, -261, -305, -343, -353, -342/                               4.800
      DATA K2TAB25/                                                      5.000
     1-4581,-4404,-4119,-3814,-3486,-3144,-2802,-2477,-2182,-1923,       5.000
     2-1704,-1521,-1360,-1200,-1037, -882, -745, -634, -555, -509,       5.000
     3 -476, -393, -199,   58,  339,  630,  929, 1234, 1542, 1834,       5.000
     4 2258, 2533, 2579, 2417, 2172, 1941, 1735, 1543, 1371, 1228,       5.000
     5 1130, 1066,  968,  771,  540,  308,  115,  -15,  -88, -148,       5.000
     6 -195, -226, -274, -323, -341, -335/                               5.000
      DATA K2TAB26/                                                      5.200
     1-4490,-4342,-4059,-3760,-3441,-3105,-2764,-2433,-2127,-1854,       5.200
     2-1619,-1421,-1251,-1087, -924, -766, -624, -504, -414, -355,       5.200
     3 -312, -246,  -78,  162,  432,  713, 1001, 1296, 1593, 1878,       5.200
     4 2303, 2604, 2708, 2597, 2375, 2144, 1941, 1748, 1575, 1427,       5.200
     5 1316, 1238, 1146,  954,  712,  463,  243,   82,  -14,  -86,       5.200
     6 -144, -184, -236, -295, -323, -323/                               5.200
      DATA K2TAB27/                                                      5.400
     1-4388,-4277,-3997,-3703,-3392,-3063,-2726,-2393,-2078,-1793,       5.400
     2-1543,-1330,-1147, -979, -814, -653, -506, -379, -277, -207,       5.400
     3 -151,  -96,   47,  270,  528,  799, 1076, 1360, 1647, 1924,       5.400
     4 2346, 2667, 2822, 2767, 2572, 2346, 2145, 1955, 1782, 1628,       5.400
     5 1506, 1415, 1325, 1141,  893,  630,  386,  196,   72,  -12,       5.400
     6  -83, -133, -188, -258, -300, -309/                               5.400
      DATA K2TAB28/                                                      5.600
     1-4274,-4211,-3932,-3642,-3338,-3019,-2687,-2354,-2034,-1739,       5.600
     2-1476,-1248,-1052, -877, -708, -545, -393, -259, -148,  -66,       5.600
     3    4,   56,  177,  381,  627,  887, 1155, 1428, 1705, 1972,       5.600
     4 2389, 2723, 2919, 2922, 2764, 2551, 2351, 2164, 1990, 1834,       5.600
     5 1703, 1601, 1505, 1333, 1080,  808,  545,  329,  177,   75,       5.600
     6   -9,  -72, -132, -212, -269, -289/                               5.600
      DATA K2TAB29/                                                      5.800
     1-4144,-4143,-3865,-3579,-3282,-2970,-2645,-2316,-1993,-1691,       5.800
     2-1417,-1176, -967, -782, -609, -441, -285, -144,  -26,   66,       5.800
     3  154,  209,  311,  496,  729,  979, 1236, 1499, 1765, 2024,       5.800
     4 2433, 2775, 3003, 3062, 2950, 2756, 2559, 2375, 2202, 2045,       5.800
     5 1908, 1793, 1688, 1526, 1272,  994,  719,  480,  300,  177,       5.800
     6   78,    1,  -66, -154, -228, -262/                               5.800
      DATA K2TAB30/                                                      6.000
     1-3995,-4074,-3796,-3513,-3222,-2918,-2601,-2277,-1955,-1648,       6.000
     2-1365,-1112, -890, -694, -515, -343, -182,  -35,   91,  194,       6.000
     3  299,  362,  449,  615,  833, 1073, 1321, 1573, 1829, 2078,       6.000
     4 2478, 2824, 3077, 3187, 3125, 2955, 2764, 2585, 2414, 2256,       6.000
     5 2113, 1988, 1873, 1718, 1468, 1186,  901,  643,  437,  294,       6.000
     6  180,   87,   11,  -83, -176, -226/                               6.000
      DATA K2TAB31/                                                      6.250
     1-3776,-3986,-3709,-3429,-3143,-2848,-2541,-2225,-1907,-1598,       6.250
     2-1307,-1043, -807, -597, -408, -231,  -63,   91,  227,  341,       6.250
     3  464,  540,  618,  761,  962, 1190, 1427, 1669, 1912, 2150,       6.250
     4 2536, 2882, 3156, 3317, 3322, 3197, 3026, 2853, 2685, 2526,       6.250
     5 2379, 2243, 2113, 1957, 1715, 1428, 1138,  868,  638,  466,       6.250
     6  331,  218,  125,   22,  -89, -165/                               6.250
      DATA K2TAB32/                                                      6.500
     1-3511,-3896,-3621,-3342,-3061,-2773,-2475,-2169,-1858,-1550,       6.500
     2-1256, -983, -735, -513, -313, -129,   45,  207,  353,  477,       6.500
     3  620,  713,  789,  911, 1094, 1310, 1537, 1768, 2000, 2226,       6.500
     4 2598, 2941, 3229, 3429, 3497, 3427, 3280, 3118, 2955, 2794,       6.500
     5 2643, 2500, 2356, 2196, 1964, 1673, 1379, 1102,  855,  657,       6.500
     6  505,  372,  260,  150,   20,  -83/                               6.500
      DATA K2TAB33/                                                      6.750
     1-3189,-3806,-3531,-3255,-2976,-2694,-2405,-2108,-1806,-1503,       6.750
     2-1208, -930, -673, -440, -230,  -38,  142,  311,  466,  602,       6.750
     3  763,  874,  956, 1064, 1228, 1430, 1646, 1867, 2089, 2305,       6.750
     4 2662, 3001, 3296, 3523, 3644, 3634, 3525, 3384, 3230, 3072,       6.750
     5 2916, 2761, 2605, 2437, 2211, 1921, 1621, 1336, 1077,  868,       6.750
     6  701,  553,  422,  298,  156,   25/                               6.750
      DATA K2TAB34/                                                      7.000
     1-2985,-3716,-3441,-3166,-2890,-2613,-2331,-2043,-1750,-1454,       7.000
     2-1162, -882, -619, -377, -157,   42,  228,  404,  567,  713,       7.000
     3  893, 1024, 1118, 1218, 1365, 1553, 1759, 1970, 2182, 2388,       7.000
     4 2731, 3063, 3362, 3608, 3772, 3820, 3758, 3640, 3502, 3349,       7.000
     5 3191, 3029, 2857, 2667, 2448, 2169, 1869, 1583, 1317, 1086,       7.000
     6  901,  747,  603,  467,  316,  160/                               7.000
      DATA K2TAB35/                                                      7.250
     1-2876,-3625,-3351,-3077,-2804,-2530,-2254,-1974,-1690,-1402,       7.250
     2-1116, -837, -571, -323,  -95,  112,  304,  484,  654,  809,       7.250
     3 1007, 1158, 1269, 1369, 1504, 1679, 1875, 2077, 2279, 2476,       7.250
     4 2806, 3130, 3429, 3687, 3880, 3979, 3969, 3885, 3770, 3629,       7.250
     5 3472, 3303, 3120, 2914, 2688, 2412, 2110, 1823, 1557, 1322,       7.250
     6 1125,  960,  800,  648,  495,  323/                               7.250
      DATA K2TAB36/                                                      7.500
     1-2771,-3535,-3262,-2989,-2717,-2446,-2175,-1902,-1626,-1347,       7.500
     2-1068, -793, -527, -276,  -41,  173,  370,  555,  729,  892,       7.500
     3 1106, 1277, 1407, 1516, 1643, 1807, 1993, 2187, 2381, 2570,       7.500
     4 2887, 3202, 3499, 3764, 3980, 4120, 4162, 4117, 4025, 3902,       7.500
     5 3751, 3578, 3383, 3164, 2929, 2659, 2356, 2068, 1802, 1562,       7.500
     6 1357, 1187, 1018,  854,  689,  503/                               7.500
      DATA K2TAB37/                                                      7.750
     1-2670,-3445,-3172,-2900,-2630,-2362,-2095,-1828,-1559,-1289,       7.750
     2-1018, -749, -486, -233,    4,  224,  427,  616,  793,  960,       7.750
     3 1186, 1377, 1528, 1650, 1777, 1935, 2113, 2300, 2486, 2668,       7.750
     4 2973, 3279, 3573, 3841, 4071, 4241, 4327, 4327, 4265, 4167,       7.750
     5 4027, 3854, 3650, 3417, 3169, 2898, 2597, 2306, 2041, 1802,       7.750
     6 1592, 1417, 1244, 1072,  897,  705/                               7.750
      DATA K2TAB38/                                                      8.000
     1-2572,-3355,-3084,-2813,-2545,-2279,-2015,-1753,-1491,-1228,       8.000
     2 -965, -703, -445, -193,   45,  268,  476,  668,  848, 1018,       8.000
     3 1253, 1459, 1630, 1770, 1905, 2060, 2234, 2415, 2594, 2771,       8.000
     4 3066, 3362, 3651, 3921, 4160, 4353, 4478, 4520, 4492, 4415,       8.000
     5 4293, 4124, 3914, 3669, 3410, 3137, 2841, 2549, 2283, 2044,       8.000
     6 1831, 1651, 1477, 1297, 1116,  920/                               8.000
      DATA K4TAB01/                                                     -2.000
     1-5141,-5078,-4993,-4840,-4650,-4468,-4323,-4223,-4165,-4145,      -2.000
     2-4137,-4110,-4021,-3833,-3568,-3261,-2932,-2594,-2255,-1921,      -2.000
     3-1439,-1000, -673, -535, -505, -506, -515, -522, -520, -507,      -2.000
     4 -484, -471, -473, -482, -478, -468, -444, -437, -432, -431,      -2.000
     5 -432, -429, -426, -426, -427, -426, -425, -428, -432, -433,      -2.000
     6 -431, -426, -417, -404, -385, -359/                              -2.000
      DATA K4TAB02/                                                     -1.500
     1-5168,-5084,-5021,-4913,-4747,-4561,-4391,-4262,-4175,-4131,      -1.500
     2-4118,-4108,-4064,-3938,-3719,-3441,-3131,-2807,-2477,-2149,      -1.500
     3-1669,-1215, -821, -578, -498, -487, -496, -507, -514, -509,      -1.500
     4 -482, -467, -461, -473, -475, -465, -446, -434, -429, -426,      -1.500
     5 -429, -427, -424, -422, -425, -425, -423, -425, -431, -432,      -1.500
     6 -431, -426, -417, -405, -385, -359/                              -1.500
      DATA K4TAB03/                                                     -1.000
     1-5209,-5097,-5024,-4951,-4823,-4650,-4469,-4313,-4197,-4123,      -1.000
     2-4092,-4086,-4070,-4002,-3841,-3600,-3314,-3006,-2688,-2368,      -1.000
     3-1893,-1433,-1006, -668, -501, -460, -463, -480, -494, -501,      -1.000
     4 -479, -461, -448, -459, -467, -460, -446, -429, -425, -421,      -1.000
     5 -424, -424, -422, -419, -421, -423, -421, -422, -428, -431,      -1.000
     6 -431, -426, -417, -404, -385, -359/                              -1.000
      DATA K4TAB04/                                                     -0.500
     1-5252,-5119,-5021,-4952,-4862,-4716,-4540,-4365,-4220,-4118,      -0.500
     2-4058,-4041,-4039,-4014,-3917,-3727,-3473,-3185,-2882,-2572,      -0.500
     3-2104,-1643,-1198, -801, -527, -420, -408, -427, -453, -472,      -0.500
     4 -471, -452, -435, -438, -454, -453, -441, -423, -419, -415,      -0.500
     5 -417, -420, -419, -416, -417, -420, -419, -418, -424, -430,      -0.500
     6 -430, -426, -417, -405, -385, -359/                              -0.500
      DATA K4TAB05/                                                      0.000
     1-5278,-5137,-5014,-4926,-4852,-4740,-4580,-4398,-4228,-4096,       0.000
     2-4007,-3965,-3963,-3965,-3927,-3801,-3590,-3329,-3044,-2746,       0.000
     3-2291,-1832,-1378, -945, -584, -375, -318, -331, -368, -407,       0.000
     4 -443, -433, -420, -413, -432, -439, -431, -416, -410, -407,       0.000
     5 -408, -414, -415, -413, -411, -416, -417, -414, -419, -427,       0.000
     6 -429, -425, -417, -404, -385, -359/                               0.000
      DATA K4TAB06/                                                      0.500
     1-5280,-5129,-4988,-4876,-4793,-4704,-4567,-4391,-4205,-4041,       0.500
     2-3919,-3845,-3824,-3838,-3842,-3785,-3633,-3409,-3147,-2867,       0.500
     3-2429,-1979,-1522,-1070, -652, -337, -191, -177, -217, -276,       0.500
     4 -365, -388, -389, -381, -398, -415, -413, -402, -395, -397,       0.500
     5 -397, -405, -409, -409, -406, -410, -413, -411, -413, -422,       0.500
     6 -427, -425, -417, -404, -385, -359/                               0.500
      DATA K4TAB07/                                                      1.000
     1-5272,-5083,-4924,-4785,-4681,-4595,-4483,-4323,-4134,-3945,       1.000
     2-3787,-3676,-3619,-3617,-3642,-3642,-3563,-3389,-3157,-2897,       1.000
     3-2484,-2052,-1603,-1146, -699, -307,  -47,   39,   14,  -55,       1.000
     4 -199, -287, -320, -331, -347, -376, -382, -375, -371, -378,       1.000
     5 -381, -390, -400, -403, -401, -402, -408, -407, -406, -415,       1.000
     6 -424, -423, -417, -404, -385, -359/                               1.000
      DATA K4TAB08/                                                      1.250
     1-5267,-5053,-4876,-4724,-4605,-4512,-4407,-4259,-4074,-3880,       1.250
     2-3707,-3577,-3499,-3479,-3500,-3518,-3475,-3333,-3119,-2871,       1.250
     3-2472,-2051,-1613,-1159, -707, -291,   20,  161,  159,   90,       1.250
     4  -75, -203, -261, -291, -312, -347, -360, -356, -353, -363,       1.250
     5 -370, -381, -393, -399, -398, -398, -404, -405, -403, -411,       1.250
     6 -421, -422, -416, -404, -385, -359/                               1.250
      DATA K4TAB09/                                                      1.500
     1-5261,-5022,-4820,-4650,-4513,-4411,-4311,-4175,-3998,-3802,       1.500
     2-3616,-3467,-3367,-3325,-3337,-3364,-3351,-3245,-3054,-2819,       1.500
     3-2432,-2025,-1599,-1154, -702, -270,   82,  284,  319,  259,       1.500
     4   77,  -92, -181, -235, -264, -310, -333, -331, -329, -343,       1.500
     5 -356, -368, -385, -393, -394, -392, -400, -402, -399, -406,       1.500
     6 -418, -421, -416, -404, -385, -359/                               1.500
      DATA K4TAB10/                                                      1.750
     1-5253,-4993,-4762,-4571,-4413,-4295,-4192,-4067,-3901,-3708,       1.750
     2-3515,-3350,-3232,-3168,-3161,-3187,-3195,-3125,-2962,-2742,       1.750
     3-2370,-1975,-1563,-1130, -684, -246,  137,  396,  483,  442,       1.750
     4  256,   49,  -77, -158, -205, -260, -297, -301, -299, -314,       1.750
     5 -336, -353, -373, -386, -389, -387, -394, -399, -396, -401,       1.750
     6 -414, -419, -415, -404, -385, -359/                               1.750
      DATA K4TAB11/                                                      2.000
     1-5241,-4966,-4706,-4486,-4305,-4167,-4058,-3940,-3786,-3601,       2.000
     2-3405,-3227,-3090,-3004,-2975,-2992,-3013,-2977,-2846,-2644,       2.000
     3-2288,-1906,-1508,-1089, -653, -214,  188,  495,  641,  635,       2.000
     4  457,  219,   49,  -59, -128, -195, -251, -264, -261, -276,       2.000
     5 -309, -332, -358, -376, -384, -381, -388, -395, -392, -395,       2.000
     6 -410, -417, -414, -404, -385, -359/                               2.000
      DATA K4TAB12/                                                      2.250
     1-5224,-4940,-4654,-4404,-4199,-4036,-3912,-3795,-3653,-3478,       2.250
     2-3285,-3100,-2947,-2842,-2791,-2791,-2812,-2802,-2706,-2529,       2.250
     3-2191,-1822,-1437,-1033, -610, -177,  236,  578,  783,  823,       2.250
     4  669,  415,  203,   64,  -33, -114, -189, -216, -216, -229,       2.250
     5 -269, -303, -337, -362, -375, -375, -380, -389, -388, -389,       2.250
     6 -403, -414, -413, -403, -385, -359/                               2.250
      DATA K4TAB13/                                                      2.500
     1-5203,-4914,-4609,-4328,-4094,-3905,-3762,-3640,-3507,-3345,       2.500
     2-3158,-2969,-2803,-2679,-2606,-2586,-2602,-2609,-2548,-2398,       2.500
     3-2082,-1726,-1353, -964, -555, -132,  283,  649,  905, 1002,       2.500
     4  888,  630,  379,  210,   81,  -13, -110, -158, -162, -171,       2.500
     5 -217, -265, -309, -344, -364, -368, -370, -382, -384, -382,       2.500
     6 -396, -410, -411, -402, -385, -359/                               2.500
      DATA K4TAB14/                                                      2.750
     1-5174,-4886,-4567,-4260,-3998,-3783,-3615,-3480,-3349,-3199,       2.750
     2-3022,-2834,-2660,-2521,-2429,-2387,-2388,-2400,-2369,-2252,       2.750
     3-1963,-1621,-1260, -885, -491,  -80,  331,  710, 1005, 1159,       2.750
     4 1104,  858,  581,  380,  220,  102,  -10,  -81,  -98, -105,       2.750
     5 -148, -211, -269, -317, -347, -358, -360, -372, -378, -376,       2.750
     6 -388, -404, -408, -401, -384, -359/                               2.750
      DATA K4TAB15/                                                      3.000
     1-5138,-4854,-4529,-4202,-3911,-3669,-3474,-3321,-3186,-3044,       3.000
     2-2880,-2697,-2518,-2365,-2254,-2191,-2175,-2185,-2175,-2092,       3.000
     3-1836,-1509,-1160, -798, -419,  -22,  382,  766, 1088, 1293,       3.000
     4 1315, 1091,  798,  565,  381,  240,  109,   12,  -21,  -27,       3.000
     5  -65, -142, -214, -280, -323, -344, -347, -360, -370, -369,       3.000
     6 -378, -398, -405, -400, -384, -359/                               3.000
      DATA K4TAB16/                                                      3.200
     1-5103,-4825,-4498,-4160,-3849,-3586,-3371,-3198,-3055,-2916,       3.200
     2-2761,-2584,-2404,-2244,-2120,-2042,-2010,-2011,-2010,-1953,       3.200
     3-1727,-1415,-1076, -723, -355,   29,  424,  809, 1144, 1382,       3.200
     4 1471, 1276,  984,  729,  528,  365,  222,  106,   54,   41,       3.200
     5   12,  -70, -157, -239, -297, -327, -335, -347, -361, -362,       3.200
     6 -369, -391, -401, -398, -383, -358/                               3.200
      DATA K4TAB17/                                                      3.400
     1-5063,-4792,-4466,-4122,-3795,-3511,-3274,-3081,-2925,-2785,       3.400
     2-2637,-2468,-2290,-2124,-1989,-1896,-1848,-1839,-1841,-1805,       3.400
     3-1613,-1318, -988, -645, -288,   84,  470,  851, 1195, 1459,       3.400
     4 1616, 1458, 1174,  900,  686,  503,  348,  213,  141,  120,       3.400
     5   97,   12,  -87, -187, -262, -306, -321, -333, -350, -354,       3.400
     6 -360, -382, -397, -396, -382, -358/                               3.400
      DATA K4TAB18/                                                      3.600
     1-5018,-4753,-4431,-4085,-3747,-3443,-3186,-2973,-2801,-2654,       3.600
     2-2511,-2350,-2175,-2005,-1861,-1754,-1692,-1669,-1669,-1649,       3.600
     3-1492,-1217, -898, -564, -217,  144,  519,  893, 1241, 1524,       3.600
     4 1746, 1636, 1366, 1080,  854,  655,  488,  337,  245,  211,       3.600
     5  190,  110,   -3, -120, -216, -276, -302, -315, -336, -345,       3.600
     6 -349, -372, -391, -393, -381, -357/                               3.600
      DATA K4TAB19/                                                      3.800
     1-4967,-4710,-4393,-4048,-3703,-3383,-3107,-2874,-2683,-2526,       3.800
     2-2383,-2229,-2058,-1888,-1737,-1618,-1541,-1504,-1497,-1486,       3.800
     3-1365,-1112, -805, -480, -143,  206,  570,  937, 1284, 1579,       3.800
     4 1858, 1805, 1559, 1268, 1030,  820,  640,  478,  365,  314,       3.800
     5  291,  220,   95,  -38, -156, -237, -277, -294, -318, -332,       3.800
     6 -338, -360, -384, -389, -379, -356/                               3.800
      DATA K4TAB20/                                                      4.000
     1-4910,-4662,-4352,-4011,-3662,-3331,-3035,-2783,-2572,-2401,       4.000
     2-2254,-2106,-1942,-1772,-1615,-1485,-1394,-1343,-1327,-1320,       4.000
     3-1231,-1003, -710, -394,  -66,  272,  625,  983, 1327, 1630,       4.000
     4 1956, 1965, 1748, 1459, 1209,  993,  804,  631,  498,  430,       4.000
     5  402,  341,  209,   60,  -82, -186, -245, -269, -296, -317,       4.000
     6 -324, -345, -375, -384, -376, -355/                               4.000
      DATA K4TAB21/                                                      4.200
     1-4853,-4613,-4310,-3974,-3625,-3285,-2974,-2704,-2474,-2286,       4.200
     2-2130,-1983,-1823,-1655,-1495,-1357,-1254,-1189,-1160,-1151,       4.200
     3-1088, -889, -610, -304,   13,  342,  683, 1030, 1369, 1675,       4.200
     4 2037, 2111, 1932, 1655, 1397, 1178,  979,  800,  653,  566,       4.200
     5  525,  473,  339,  175,   11, -119, -201, -237, -268, -296,       4.200
     6 -308, -329, -362, -377, -372, -353/                               4.200
      DATA K4TAB22/                                                      4.400
     1-4790,-4561,-4263,-3935,-3588,-3244,-2920,-2633,-2385,-2178,       4.400
     2-2009,-1860,-1704,-1539,-1377,-1232,-1118,-1039, -998, -982,       4.400
     3 -938, -770, -509, -213,   95,  413,  743, 1080, 1412, 1718,       4.400
     4 2106, 2242, 2111, 1852, 1587, 1365, 1160,  978,  819,  714,       4.400
     5  660,  613,  483,  307,  121,  -36, -144, -198, -234, -270,       4.400
     6 -287, -308, -347, -369, -368, -351/                               4.400
      DATA K4TAB23/                                                      4.600
     1-4722,-4505,-4213,-3892,-3552,-3206,-2873,-2571,-2306,-2081,       4.600
     2-1896,-1739,-1586,-1423,-1260,-1110, -986, -895, -841, -816,       4.600
     3 -783, -645, -403, -120,  179,  488,  807, 1133, 1457, 1759,       4.600
     4 2166, 2357, 2281, 2047, 1782, 1557, 1350, 1164,  997,  877,       4.600
     5  809,  760,  639,  453,  249,   63,  -72, -148, -193, -236,       4.600
     6 -262, -284, -327, -357, -361, -347/                               4.600
      DATA K4TAB24/                                                      4.800
     1-4647,-4448,-4159,-3847,-3513,-3169,-2831,-2516,-2236,-1994,       4.800
     2-1792,-1624,-1468,-1307,-1144, -991, -859, -757, -689, -654,       4.800
     3 -622, -513, -294,  -23,  266,  566,  873, 1188, 1503, 1801,       4.800
     4 2218, 2455, 2440, 2238, 1980, 1753, 1546, 1357, 1187, 1054,       4.800
     5  970,  915,  806,  612,  393,  183,   17,  -85, -142, -194,       4.800
     6 -230, -256, -302, -341, -352, -341/                               4.800
      DATA K4TAB25/                                                      5.000
     1-4565,-4388,-4103,-3798,-3472,-3132,-2792,-2468,-2174,-1916,       5.000
     2-1697,-1515,-1354,-1193,-1030, -874, -735, -623, -543, -495,       5.000
     3 -461, -376, -181,   75,  355,  645,  942, 1246, 1552, 1843,       5.000
     4 2266, 2540, 2586, 2424, 2179, 1948, 1743, 1552, 1380, 1236,       5.000
     5 1139, 1076,  978,  782,  552,  318,  124,   -8,  -82, -143,       5.000
     6 -190, -221, -270, -321, -340, -334/                               5.000
      DATA K4TAB26/                                                      5.200
     1-4475,-4326,-4043,-3745,-3427,-3093,-2754,-2425,-2120,-1848,       5.200
     2-1613,-1416,-1245,-1081, -917, -759, -615, -495, -403, -343,       5.200
     3 -299, -231,  -61,  179,  448,  728, 1015, 1308, 1604, 1887,       5.200
     4 2310, 2611, 2714, 2603, 2381, 2150, 1947, 1756, 1583, 1434,       5.200
     5 1324, 1247, 1154,  963,  723,  473,  252,   89,   -8,  -80,       5.200
     6 -139, -179, -232, -292, -322, -323/                               5.200
      DATA K4TAB27/                                                      5.400
     1-4374,-4261,-3981,-3688,-3379,-3052,-2716,-2385,-2071,-1787,       5.400
     2-1538,-1325,-1142, -974, -808, -647, -499, -370, -268, -196,       5.400
     3 -139,  -82,   62,  286,  543,  813, 1090, 1372, 1658, 1933,       5.400
     4 2353, 2673, 2827, 2772, 2577, 2351, 2151, 1961, 1788, 1634,       5.400
     5 1512, 1422, 1332, 1150,  903,  640,  395,  203,   79,   -6,       5.400
     6  -78, -128, -184, -256, -299, -308/                               5.400
      DATA K4TAB28/                                                      5.600
     1-4260,-4195,-3917,-3628,-3326,-3008,-2678,-2346,-2028,-1733,       5.600
     2-1471,-1243,-1048, -872, -703, -539, -386, -251, -140,  -57,       5.600
     3   15,   69,  190,  396,  641,  901, 1168, 1440, 1715, 1981,       5.600
     4 2396, 2729, 2924, 2926, 2768, 2555, 2355, 2169, 1995, 1839,       5.600
     5 1708, 1606, 1511, 1340, 1089,  818,  554,  336,  183,   81,       5.600
     6   -5,  -67, -128, -209, -268, -288/                               5.600
      DATA K4TAB29/                                                      5.800
     1-4131,-4128,-3851,-3566,-3270,-2960,-2637,-2308,-1987,-1686,       5.800
     2-1413,-1172, -963, -777, -604, -436, -279, -138,  -18,   75,       5.800
     3  164,  220,  324,  510,  742,  992, 1249, 1510, 1775, 2032,       5.800
     4 2439, 2779, 3007, 3065, 2953, 2759, 2562, 2379, 2206, 2049,       5.800
     5 1912, 1798, 1693, 1532, 1280, 1003,  727,  487,  306,  183,       5.800
     6   83,    6,  -61, -151, -226, -261/                               5.800
      DATA K4TAB30/                                                      6.000
     1-3983,-4059,-3783,-3501,-3210,-2908,-2593,-2270,-1949,-1642,       6.000
     2-1360,-1108, -886, -690, -510, -339, -176,  -29,   98,  201,       6.000
     3  307,  372,  460,  627,  845, 1085, 1332, 1584, 1839, 2086,       6.000
     4 2484, 2828, 3080, 3189, 3127, 2957, 2767, 2588, 2416, 2259,       6.000
     5 2116, 1991, 1877, 1723, 1475, 1194,  909,  650,  443,  300,       6.000
     6  184,   91,   15,  -80, -173, -225/                               6.000
      DATA K4TAB31/                                                      6.250
     1-3766,-3972,-3696,-3417,-3132,-2838,-2533,-2218,-1901,-1593,       6.250
     2-1303,-1039, -803, -593, -404, -226,  -57,   97,  233,  348,       6.250
     3  473,  550,  629,  772,  974, 1201, 1438, 1679, 1922, 2158,       6.250
     4 2542, 2886, 3159, 3319, 3324, 3199, 3028, 2855, 2687, 2528,       6.250
     5 2381, 2246, 2116, 1961, 1721, 1435, 1145,  874,  644,  471,       6.250
     6  336,  222,  129,   26,  -87, -164/                               6.250
      DATA K4TAB32/                                                      6.500
     1-3502,-3883,-3608,-3331,-3051,-2764,-2468,-2163,-1852,-1545,       6.500
     2-1251, -979, -731, -509, -309, -124,   50,  213,  359,  484,       6.500
     3  628,  723,  800,  922, 1106, 1321, 1548, 1778, 2009, 2234,       6.500
     4 2603, 2945, 3231, 3431, 3499, 3428, 3281, 3119, 2956, 2795,       6.500
     5 2645, 2501, 2358, 2199, 1968, 1680, 1386, 1108,  860,  662,       6.500
     6  510,  375,  264,  154,   23,  -81/                               6.500
      DATA K4TAB33/                                                      6.750
     1-3182,-3793,-3520,-3244,-2967,-2686,-2398,-2103,-1800,-1498,       6.750
     2-1204, -926, -669, -436, -226,  -33,  147,  317,  472,  609,       6.750
     3  771,  883,  967, 1075, 1240, 1441, 1657, 1877, 2098, 2312,       6.750
     4 2668, 3004, 3298, 3524, 3645, 3635, 3526, 3385, 3232, 3073,       6.750
     5 2917, 2763, 2607, 2439, 2214, 1926, 1627, 1342, 1082,  873,       6.750
     6  705,  557,  425,  301,  159,   27/                               6.750
      DATA K4TAB34/                                                      7.000
     1-2979,-3704,-3430,-3157,-2882,-2605,-2325,-2038,-1745,-1449,       7.000
     2-1158, -878, -615, -373, -153,   46,  233,  409,  573,  720,       7.000
     3  901, 1033, 1129, 1229, 1377, 1565, 1770, 1980, 2191, 2396,       7.000
     4 2737, 3067, 3364, 3610, 3773, 3821, 3759, 3641, 3502, 3350,       7.000
     5 3192, 3030, 2858, 2669, 2450, 2173, 1874, 1587, 1321, 1090,       7.000
     6  905,  750,  606,  471,  319,  162/                               7.000
      DATA K4TAB35/                                                      7.250
     1-2870,-3614,-3341,-3068,-2796,-2523,-2248,-1969,-1685,-1398,       7.250
     2-1112, -833, -568, -319,  -91,  116,  309,  490,  660,  816,       7.250
     3 1015, 1167, 1279, 1380, 1516, 1691, 1886, 2087, 2288, 2484,       7.250
     4 2811, 3134, 3432, 3689, 3881, 3979, 3970, 3885, 3770, 3629,       7.250
     5 3473, 3304, 3121, 2916, 2690, 2415, 2114, 1827, 1561, 1325,       7.250
     6 1128,  963,  802,  651,  497,  325/                               7.250
      DATA K4TAB36/                                                      7.500
     1-2766,-3524,-3252,-2981,-2710,-2440,-2169,-1897,-1621,-1343,       7.500
     2-1064, -789, -524, -272,  -37,  177,  375,  560,  735,  898,       7.500
     3 1113, 1287, 1418, 1527, 1655, 1818, 2004, 2197, 2389, 2577,       7.500
     4 2892, 3205, 3501, 3766, 3981, 4121, 4162, 4117, 4025, 3903,       7.500
     5 3751, 3579, 3384, 3164, 2930, 2661, 2359, 2071, 1805, 1565,       7.500
     6 1360, 1190, 1020,  856,  691,  505/                               7.500
      DATA K4TAB37/                                                      7.750
     1-2666,-3434,-3164,-2893,-2624,-2357,-2090,-1823,-1555,-1285,       7.750
     2-1014, -745, -482, -229,    8,  229,  432,  621,  799,  967,       7.750
     3 1194, 1386, 1538, 1660, 1788, 1945, 2124, 2309, 2494, 2675,       7.750
     4 2978, 3282, 3575, 3843, 4072, 4241, 4328, 4327, 4265, 4167,       7.750
     5 4027, 3854, 3650, 3417, 3170, 2900, 2600, 2309, 2044, 1804,       7.750
     6 1595, 1419, 1246, 1074,  899,  707/                               7.750
      DATA K4TAB38/                                                      8.000
     1-2568,-3345,-3076,-2807,-2539,-2274,-2010,-1748,-1486,-1224,       8.000
     2 -961, -699, -440, -189,   49,  273,  481,  674,  855, 1025,       8.000
     3 1261, 1468, 1640, 1781, 1916, 2071, 2244, 2425, 2602, 2777,       8.000
     4 3071, 3365, 3653, 3922, 4161, 4354, 4478, 4521, 4492, 4415,       8.000
     5 4293, 4124, 3914, 3670, 3411, 3138, 2843, 2551, 2286, 2046,       8.000
     6 1833, 1652, 1479, 1299, 1118,  922/                               8.000
      DATA K8TAB01/                                                     -2.000
     1-5105,-5043,-4959,-4808,-4620,-4441,-4297,-4198,-4143,-4128,      -2.000
     2-4125,-4102,-4015,-3828,-3563,-3255,-2926,-2586,-2247,-1912,      -2.000
     3-1430, -990, -662, -522, -491, -493, -503, -513, -513, -500,      -2.000
     4 -477, -460, -464, -477, -474, -462, -440, -434, -429, -428,      -2.000
     5 -429, -425, -422, -421, -422, -422, -421, -425, -430, -431,      -2.000
     6 -429, -424, -416, -403, -384, -358/                              -2.000
      DATA K8TAB02/                                                     -1.500
     1-5132,-5046,-4984,-4877,-4713,-4529,-4362,-4234,-4149,-4108,      -1.500
     2-4102,-4097,-4056,-3932,-3713,-3434,-3124,-2798,-2468,-2139,      -1.500
     3-1659,-1204, -810, -565, -483, -471, -481, -494, -504, -501,      -1.500
     4 -473, -455, -448, -466, -469, -459, -440, -429, -425, -422,      -1.500
     5 -425, -423, -419, -418, -420, -420, -418, -421, -427, -430,      -1.500
     6 -429, -424, -416, -403, -384, -358/                              -1.500
      DATA K8TAB03/                                                     -1.000
     1-5172,-5058,-4984,-4912,-4785,-4614,-4435,-4280,-4166,-4095,      -1.000
     2-4068,-4069,-4058,-3993,-3833,-3592,-3305,-2997,-2678,-2357,      -1.000
     3-1881,-1421, -994, -655, -485, -442, -445, -463, -480, -489,      -1.000
     4 -468, -448, -432, -448, -460, -453, -438, -423, -420, -416,      -1.000
     5 -420, -420, -417, -414, -416, -418, -416, -417, -424, -429,      -1.000
     6 -429, -424, -416, -403, -384, -358/                              -1.000
      DATA K8TAB04/                                                     -0.500
     1-5215,-5079,-4978,-4909,-4820,-4676,-4501,-4327,-4184,-4083,      -0.500
     2-4027,-4016,-4021,-4001,-3906,-3717,-3462,-3174,-2869,-2558,      -0.500
     3-2091,-1629,-1185, -788, -512, -403, -388, -406, -434, -456,      -0.500
     4 -458, -438, -417, -423, -444, -444, -431, -415, -413, -409,      -0.500
     5 -412, -415, -414, -410, -412, -414, -413, -413, -420, -427,      -0.500
     6 -428, -424, -416, -403, -384, -358/                              -0.500
      DATA K8TAB05/                                                      0.000
     1-5240,-5096,-4970,-4880,-4806,-4695,-4536,-4355,-4186,-4054,       0.000
     2-3968,-3930,-3936,-3946,-3912,-3788,-3577,-3315,-3029,-2731,       0.000
     3-2275,-1817,-1364, -932, -571, -360, -299, -309, -345, -385,       0.000
     4 -425, -415, -399, -391, -418, -428, -419, -406, -402, -400,       0.000
     5 -401, -408, -410, -407, -405, -410, -411, -408, -414, -423,       0.000
     6 -427, -424, -416, -403, -384, -358/                               0.000
      DATA K8TAB06/                                                      0.500
     1-5243,-5087,-4943,-4828,-4743,-4653,-4517,-4341,-4155,-3992,       0.500
     2-3872,-3801,-3786,-3808,-3820,-3768,-3617,-3393,-3130,-2848,       0.500
     3-2410,-1961,-1505,-1054, -638, -322, -174, -155, -192, -250,       0.500
     4 -341, -366, -366, -354, -378, -401, -399, -388, -385, -387,       0.500
     5 -388, -398, -403, -403, -399, -404, -407, -404, -407, -418,       0.500
     6 -424, -423, -415, -403, -384, -358/                               0.500
      DATA K8TAB07/                                                      1.000
     1-5235,-5042,-4878,-4737,-4630,-4540,-4427,-4267,-4078,-3891,       1.000
     2-3734,-3625,-3571,-3577,-3611,-3619,-3543,-3370,-3137,-2876,       1.000
     3-2461,-2030,-1583,-1128, -683, -292,  -31,   58,   38,  -27,       1.000
     4 -170, -260, -293, -299, -318, -357, -366, -358, -356, -366,       1.000
     5 -370, -381, -392, -396, -393, -395, -401, -400, -399, -410,       1.000
     6 -421, -421, -415, -403, -384, -358/                               1.000
      DATA K8TAB08/                                                      1.250
     1-5230,-5012,-4831,-4676,-4553,-4457,-4350,-4201,-4016,-3823,       1.250
     2-3651,-3523,-3449,-3435,-3466,-3492,-3452,-3312,-3098,-2848,       1.250
     3-2447,-2027,-1590,-1139, -690, -276,   35,  179,  182,  118,       1.250
     4  -44, -173, -231, -257, -279, -325, -343, -337, -336, -350,       1.250
     5 -358, -371, -385, -391, -390, -390, -397, -398, -395, -405,       1.250
     6 -418, -420, -415, -403, -384, -358/                               1.250
      DATA K8TAB09/                                                      1.500
     1-5225,-4982,-4776,-4603,-4462,-4357,-4253,-4115,-3939,-3744,       1.500
     2-3559,-3412,-3315,-3279,-3299,-3335,-3326,-3222,-3031,-2794,       1.500
     3-2407,-2000,-1575,-1133, -684, -255,   97,  301,  341,  286,       1.500
     4  109,  -60, -149, -198, -226, -284, -314, -311, -309, -327,       1.500
     5 -342, -357, -375, -385, -386, -384, -392, -395, -391, -400,       1.500
     6 -414, -419, -414, -403, -384, -358/                               1.500
      DATA K8TAB10/                                                      1.750
     1-5217,-4954,-4720,-4525,-4364,-4242,-4136,-4008,-3842,-3651,       1.750
     2-3459,-3296,-3180,-3121,-3121,-3154,-3168,-3100,-2937,-2716,       1.750
     3-2343,-1949,-1538,-1108, -665, -229,  152,  412,  503,  468,       1.750
     4  289,   83,  -42, -119, -163, -229, -275, -279, -277, -296,       1.750
     5 -321, -339, -363, -377, -381, -378, -386, -391, -388, -394,       1.750
     6 -410, -416, -413, -402, -384, -358/                               1.750
      DATA K8TAB11/                                                      2.000
     1-5206,-4928,-4665,-4442,-4258,-4116,-4005,-3883,-3729,-3545,       2.000
     2-3351,-3175,-3039,-2956,-2934,-2958,-2984,-2951,-2821,-2618,       2.000
     3-2260,-1879,-1482,-1066, -633, -197,  203,  511,  660,  659,       2.000
     4  490,  254,   85,  -19,  -83, -158, -226, -241, -236, -256,       2.000
     5 -292, -316, -346, -366, -375, -372, -379, -387, -383, -387,       2.000
     6 -404, -414, -412, -402, -384, -358/                               2.000
      DATA K8TAB12/                                                      2.250
     1-5191,-4903,-4615,-4362,-4154,-3989,-3862,-3742,-3599,-3426,       2.250
     2-3234,-3051,-2899,-2797,-2750,-2756,-2782,-2775,-2680,-2502,       2.250
     3-2163,-1794,-1410,-1009, -589, -159,  251,  593,  800,  846,       2.250
     4  701,  451,  240,  105,   13,  -71, -159, -191, -190, -206,       2.250
     5 -250, -286, -323, -351, -365, -365, -370, -380, -379, -380,       2.250
     6 -397, -410, -410, -401, -384, -358/                               2.250
      DATA K8TAB13/                                                      2.500
     1-5170,-4879,-4571,-4287,-4051,-3861,-3716,-3592,-3457,-3296,       2.500
     2-3111,-2923,-2759,-2636,-2567,-2551,-2571,-2581,-2521,-2371,       2.500
     3-2053,-1697,-1326, -940, -534, -114,  299,  664,  922, 1023,       2.500
     4  919,  666,  417,  250,  129,   33,  -76, -130, -134, -145,       2.500
     5 -196, -245, -292, -331, -353, -357, -360, -373, -374, -373,       2.500
     6 -389, -406, -409, -401, -383, -358/                               2.500
      DATA K8TAB14/                                                      2.750
     1-5143,-4852,-4531,-4221,-3958,-3743,-3573,-3437,-3305,-3155,       2.750
     2-2980,-2793,-2620,-2482,-2392,-2353,-2357,-2372,-2341,-2224,       2.750
     3-1934,-1592,-1233, -860, -470,  -62,  347,  725, 1021, 1178,       2.750
     4 1133,  892,  617,  418,  267,  152,   28,  -50,  -67,  -76,       2.750
     5 -124, -189, -250, -303, -335, -346, -349, -362, -368, -366,       2.750
     6 -380, -400, -406, -399, -383, -358/                               2.750
      DATA K8TAB15/                                                      3.000
     1-5109,-4822,-4494,-4165,-3873,-3632,-3436,-3283,-3148,-3006,       3.000
     2-2843,-2660,-2482,-2330,-2219,-2159,-2145,-2156,-2147,-2064,       3.000
     3-1806,-1480,-1132, -773, -397,   -3,  398,  782, 1104, 1312,       3.000
     4 1341, 1124,  833,  602,  424,  290,  152,   45,   10,    5,       3.000
     5  -38, -117, -193, -264, -310, -332, -335, -349, -360, -358,       3.000
     6 -369, -392, -402, -398, -382, -357/                               3.000
      DATA K8TAB16/                                                      3.200
     1-5076,-4794,-4464,-4125,-3814,-3552,-3337,-3164,-3021,-2881,       3.200
     2-2727,-2551,-2371,-2211,-2088,-2011,-1981,-1983,-1982,-1924,       3.200
     3-1697,-1385,-1048, -698, -333,   48,  441,  824, 1160, 1400,       3.200
     4 1495, 1306, 1017,  764,  569,  412,  265,  140,   87,   76,       3.200
     5   40,  -44, -134, -221, -282, -315, -323, -336, -351, -351,       3.200
     6 -360, -385, -398, -396, -381, -357/                               3.200
      DATA K8TAB17/                                                      3.400
     1-5037,-4762,-4434,-4088,-3762,-3479,-3244,-3051,-2896,-2755,       3.400
     2-2608,-2439,-2261,-2095,-1959,-1866,-1820,-1811,-1813,-1777,       3.400
     3-1583,-1288, -960, -619, -265,  104,  488,  867, 1210, 1476,       3.400
     4 1638, 1487, 1205,  932,  723,  547,  392,  249,  175,  156,       3.400
     5  128,   40,  -62, -166, -245, -292, -307, -321, -340, -343,       3.400
     6 -349, -376, -393, -393, -380, -357/                               3.400
      DATA K8TAB18/                                                      3.600
     1-4993,-4726,-4401,-4054,-3716,-3414,-3159,-2947,-2775,-2629,       3.600
     2-2485,-2324,-2149,-1979,-1834,-1727,-1664,-1642,-1642,-1621,       3.600
     3-1463,-1187, -869, -537, -194,  164,  537,  910, 1257, 1540,       3.600
     4 1766, 1662, 1395, 1110,  887,  696,  531,  373,  277,  247,       3.600
     5  222,  138,   23,  -97, -197, -262, -288, -302, -325, -333,       3.600
     6 -338, -365, -387, -390, -379, -356/                               3.600
      DATA K8TAB19/                                                      3.800
     1-4943,-4684,-4365,-4019,-3674,-3357,-3082,-2851,-2660,-2504,       3.800
     2-2361,-2207,-2036,-1865,-1712,-1593,-1515,-1478,-1470,-1459,       3.800
     3-1336,-1082, -776, -453, -119,  228,  589,  954, 1300, 1596,       3.800
     4 1877, 1829, 1585, 1295, 1060,  856,  680,  513,  396,  350,       3.800
     5  325,  249,  123,  -13, -136, -221, -263, -280, -306, -320,       3.800
     6 -326, -352, -379, -386, -377, -355/                               3.800
      DATA K8TAB20/                                                      4.000
     1-4888,-4638,-4326,-3984,-3636,-3307,-3014,-2763,-2553,-2383,       4.000
     2-2236,-2087,-1922,-1751,-1593,-1462,-1369,-1318,-1300,-1293,       4.000
     3-1202, -973, -680, -367,  -42,  294,  644, 1000, 1343, 1646,       4.000
     4 1973, 1987, 1772, 1483, 1235, 1024,  840,  665,  528,  464,       4.000
     5  437,  370,  238,   87,  -59, -168, -230, -254, -284, -305,       4.000
     6 -311, -336, -369, -381, -374, -354/                               4.000
      DATA K8TAB21/                                                      4.200
     1-4831,-4590,-4284,-3948,-3600,-3263,-2954,-2686,-2458,-2270,       4.200
     2-2114,-1966,-1806,-1637,-1475,-1336,-1231,-1166,-1136,-1125,       4.200
     3-1059, -859, -581, -277,   38,  364,  702, 1048, 1386, 1691,       4.200
     4 2053, 2130, 1954, 1678, 1420, 1204, 1011,  831,  681,  597,       4.200
     5  559,  502,  368,  203,   35,  -99, -184, -222, -255, -283,       4.200
     6 -295, -318, -356, -374, -370, -352/                               4.200
      DATA K8TAB22/                                                      4.400
     1-4768,-4537,-4238,-3910,-3565,-3223,-2902,-2617,-2371,-2165,       4.400
     2-1996,-1846,-1689,-1523,-1359,-1214,-1097,-1017, -975, -957,       4.400
     3 -911, -741, -480, -186,  120,  436,  764, 1098, 1429, 1734,       4.400
     4 2122, 2259, 2130, 1872, 1607, 1388, 1188, 1006,  844,  741,       4.400
     5  691,  641,  510,  335,  147,  -15, -127, -182, -220, -257,       4.400
     6 -274, -297, -339, -364, -365, -349/                               4.400
      DATA K8TAB23/                                                      4.600
     1-4700,-4482,-4189,-3868,-3529,-3186,-2856,-2556,-2293,-2069,       4.600
     2-1885,-1727,-1573,-1409,-1244,-1094, -968, -875, -819, -793,       4.600
     3 -756, -617, -375,  -92,  205,  512,  828, 1152, 1474, 1776,       4.600
     4 2181, 2372, 2298, 2064, 1799, 1576, 1373, 1189, 1020,  901,       4.600
     5  837,  787,  665,  481,  276,   87,  -53, -131, -178, -223,       4.600
     6 -248, -272, -319, -352, -358, -345/                               4.600
      DATA K8TAB24/                                                      4.800
     1-4626,-4425,-4136,-3824,-3491,-3150,-2814,-2502,-2224,-1983,       4.800
     2-1782,-1613,-1457,-1295,-1130, -976, -842, -739, -669, -632,       4.800
     3 -598, -486, -266,    4,  292,  589,  895, 1207, 1521, 1817,       4.800
     4 2233, 2468, 2455, 2253, 1996, 1769, 1565, 1378, 1207, 1074,       4.800
     5  994,  939,  830,  639,  421,  208,   37,  -67, -126, -181,       4.800
     6 -216, -243, -292, -335, -348, -339/                               4.800
      DATA K8TAB25/                                                      5.000
     1-4544,-4365,-4079,-3775,-3451,-3113,-2776,-2455,-2163,-1906,       5.000
     2-1688,-1505,-1343,-1182,-1018, -861, -721, -607, -524, -475,       5.000
     3 -437, -350, -154,  102,  381,  669,  964, 1266, 1570, 1859,       5.000
     4 2280, 2552, 2598, 2437, 2193, 1962, 1758, 1570, 1398, 1253,       5.000
     5 1158, 1097,  998,  807,  579,  344,  145,    9,  -64, -129,       5.000
     6 -177, -207, -260, -314, -336, -332/                               5.000
      DATA K8TAB26/                                                      5.200
     1-4453,-4303,-4020,-3723,-3407,-3075,-2739,-2412,-2109,-1839,       5.200
     2-1604,-1407,-1236,-1072, -907, -747, -602, -480, -387, -325,       5.200
     3 -278, -207,  -35,  205,  473,  752, 1037, 1328, 1621, 1903,       5.200
     4 2324, 2622, 2725, 2614, 2392, 2161, 1960, 1771, 1598, 1448,       5.200
     5 1340, 1265, 1173,  986,  749,  499,  274,  108,    9,  -65,       5.200
     6 -126, -165, -220, -285, -318, -320/                               5.200
      DATA K8TAB27/                                                      5.400
     1-4353,-4239,-3959,-3667,-3359,-3035,-2702,-2373,-2061,-1778,       5.400
     2-1530,-1317,-1134, -965, -799, -637, -487, -357, -254, -180,       5.400
     3 -120,  -60,   86,  310,  568,  836, 1112, 1392, 1676, 1949,       5.400
     4 2366, 2684, 2836, 2781, 2586, 2361, 2161, 1973, 1801, 1646,       5.400
     5 1524, 1438, 1348, 1169,  927,  666,  418,  222,   97,    9,       5.400
     6  -65, -114, -171, -247, -294, -305/                               5.400
      DATA K8TAB28/                                                      5.600
     1-4239,-4173,-3895,-3607,-3307,-2991,-2664,-2335,-2018,-1725,       5.600
     2-1463,-1236,-1040, -864, -695, -530, -376, -240, -127,  -42,       5.600
     3   32,   89,  213,  419,  665,  924, 1189, 1459, 1733, 1997,       5.600
     4 2408, 2738, 2932, 2934, 2776, 2563, 2363, 2178, 2006, 1849,       5.600
     5 1718, 1619, 1525, 1356, 1111,  842,  577,  355,  202,   97,       5.600
     6    8,  -53, -114, -200, -262, -285/                               5.600
      DATA K8TAB29/                                                      5.800
     1-4111,-4106,-3829,-3546,-3252,-2944,-2623,-2297,-1978,-1677,       5.800
     2-1405,-1165, -956, -770, -596, -428, -269, -127,   -6,   88,       5.800
     3  180,  239,  344,  531,  764, 1014, 1270, 1530, 1793, 2048,       5.800
     4 2451, 2789, 3014, 3072, 2959, 2765, 2568, 2386, 2215, 2058,       5.800
     5 1920, 1808, 1705, 1546, 1300, 1026,  750,  506,  324,  200,       5.800
     6   97,   19,  -48, -141, -220, -257/                               5.800
      DATA K8TAB30/                                                      6.000
     1-3965,-4038,-3762,-3482,-3193,-2893,-2580,-2259,-1940,-1634,       6.000
     2-1353,-1101, -879, -683, -503, -331, -168,  -19,  109,  214,       6.000
     3  322,  389,  479,  647,  866, 1105, 1352, 1603, 1856, 2101,       6.000
     4 2495, 2836, 3087, 3194, 3132, 2962, 2771, 2593, 2423, 2266,       6.000
     5 2122, 1999, 1887, 1734, 1491, 1215,  930,  669,  460,  317,       6.000
     6  198,  104,   29,  -69, -166, -221/                               6.000
      DATA K8TAB31/                                                      6.250
     1-3750,-3951,-3677,-3399,-3116,-2824,-2521,-2208,-1892,-1585,       6.250
     2-1296,-1032, -797, -587, -398, -219,  -49,  106,  244,  360,       6.250
     3  487,  567,  648,  792,  994, 1222, 1458, 1697, 1938, 2172,       6.250
     4 2552, 2894, 3165, 3323, 3328, 3203, 3032, 2859, 2692, 2534,       6.250
     5 2386, 2252, 2123, 1970, 1735, 1453, 1165,  892,  660,  487,       6.250
     6  350,  235,  142,   37,  -79, -159/                               6.250
      DATA K8TAB32/                                                      6.500
     1-3489,-3863,-3590,-3315,-3036,-2751,-2457,-2153,-1844,-1538,       6.500
     2-1245, -972, -725, -503, -303, -117,   58,  222,  369,  496,       6.500
     3  642,  739,  818,  942, 1126, 1341, 1567, 1795, 2025, 2248,       6.500
     4 2613, 2952, 3237, 3434, 3502, 3431, 3283, 3122, 2959, 2799,       6.500
     5 2649, 2506, 2363, 2206, 1979, 1695, 1404, 1125,  875,  676,       6.500
     6  523,  387,  276,  165,   31,  -76/                               6.500
      DATA K8TAB33/                                                      6.750
     1-3172,-3775,-3502,-3229,-2953,-2674,-2388,-2093,-1792,-1491,       6.750
     2-1198, -920, -663, -430, -220,  -26,  154,  325,  482,  620,       6.750
     3  784,  899,  984, 1094, 1260, 1461, 1676, 1895, 2114, 2326,       6.750
     4 2678, 3012, 3304, 3528, 3648, 3637, 3529, 3387, 3234, 3076,       6.750
     5 2920, 2766, 2611, 2444, 2223, 1938, 1643, 1357, 1096,  886,       6.750
     6  718,  567,  436,  313,  168,   33/                               6.750
      DATA K8TAB34/                                                      7.000
     1-2971,-3686,-3414,-3142,-2869,-2594,-2315,-2029,-1737,-1442,       7.000
     2-1152, -872, -610, -368, -147,   53,  240,  417,  582,  731,       7.000
     3  914, 1049, 1146, 1248, 1397, 1585, 1789, 1998, 2207, 2410,       7.000
     4 2747, 3074, 3370, 3613, 3775, 3823, 3761, 3642, 3504, 3352,       7.000
     5 3194, 3032, 2861, 2673, 2457, 2183, 1887, 1601, 1334, 1101,       7.000
     6  916,  760,  615,  481,  328,  168/                               7.000
      DATA K8TAB35/                                                      7.250
     1-2863,-3597,-3326,-3055,-2785,-2513,-2239,-1961,-1678,-1391,       7.250
     2-1106, -827, -562, -313,  -85,  123,  316,  498,  669,  827,       7.250
     3 1028, 1183, 1296, 1399, 1535, 1711, 1905, 2105, 2304, 2498,       7.250
     4 2821, 3141, 3436, 3692, 3883, 3981, 3971, 3887, 3772, 3631,       7.250
     5 3474, 3306, 3123, 2919, 2695, 2424, 2125, 1839, 1573, 1335,       7.250
     6 1138,  972,  810,  660,  506,  332/                               7.250
      DATA K8TAB36/                                                      7.500
     1-2760,-3508,-3239,-2969,-2700,-2431,-2161,-1890,-1615,-1336,       7.500
     2-1058, -783, -518, -266,  -31,  184,  383,  569,  745,  909,       7.500
     3 1126, 1301, 1435, 1545, 1674, 1838, 2023, 2214, 2405, 2591,       7.500
     4 2901, 3212, 3506, 3769, 3983, 4122, 4163, 4118, 4026, 3904,       7.500
     5 3753, 3580, 3386, 3167, 2934, 2667, 2368, 2081, 1815, 1574,       7.500
     6 1368, 1197, 1026,  864,  699,  512/                               7.500
      DATA K8TAB37/                                                      7.750
     1-2660,-3420,-3151,-2882,-2615,-2348,-2083,-1816,-1548,-1279,       7.750
     2-1008, -739, -476, -223,   14,  236,  440,  630,  809,  978,       7.750
     3 1207, 1401, 1555, 1679, 1807, 1964, 2142, 2326, 2510, 2688,       7.750
     4 2987, 3289, 3579, 3846, 4073, 4242, 4328, 4328, 4266, 4168,       7.750
     5 4028, 3855, 3652, 3419, 3173, 2905, 2607, 2318, 2052, 1812,       7.750
     6 1602, 1425, 1252, 1080,  906,  713/                               7.750
      DATA K8TAB38/                                                      8.000
     1-2563,-3332,-3064,-2797,-2531,-2267,-2004,-1742,-1480,-1218,       8.000
     2 -955, -693, -434, -183,   56,  280,  489,  683,  864, 1036,       8.000
     3 1274, 1483, 1657, 1799, 1934, 2089, 2262, 2441, 2617, 2790,       8.000
     4 3079, 3371, 3657, 3925, 4163, 4355, 4479, 4521, 4492, 4415,       8.000
     5 4294, 4125, 3915, 3671, 3413, 3141, 2848, 2558, 2293, 2053,       8.000
     6 1839, 1658, 1483, 1303, 1123,  927/                               8.000
      DATA IFTABK,TSAVE,VSAVE/0,0.,-1./
      EXP10(X)=EXP(X*2.30258509299405E0)
      IF(IFTABK.EQ.1)GO TO 20
      IFTABK=1
      DO 13 IV=1,NV
      DO 13 IP=1,NP
      DO 13 IT=1,NT
   13 TABKAP(IT,IP,IV)=DFLOAT(KTAB(IT,IP,IV))/1000.
   20 IF(T.EQ.TSAVE.AND.V.EQ.VSAVE)GO TO 30
      TSAVE=T
      VSAVE=V
      TLOG=DLOG10(T)
      TLOG=MAX(TLOG,TABT(1))
      DO 25 IP=1,NP
      DO 24 IV=1,NV
      IDUM=MAP1(TABT,TABKAP(1,IP,IV),NT,TLOG,PKAPV(IV,IP),1)
   24 CONTINUE
      IDUM=MAP1(TABV,PKAPV(1,IP),NV,V,PKAP(IP),1)
   25 CONTINUE
   30 PLOG=DLOG10(P)
      PLOG=MAX(PLOG,TABP(1))
      IDUM=MAP1(TABP,PKAP,NP,PLOG,ABLOG,1)
      ROSSTAB=EXP10(ABLOG)
      RETURN
      END
      SUBROUTINE TTAUP(T,TAU,ABSTD,PTOTAL,P,PRAD,PTURB,VTURB,
     1GRAV,NUMTAU)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     TAUS MUST HAVE LOG SPACING
C     ASSUMES PTOTAL=PRAD=PTURB=0 WHEN RHOX=0
      DIMENSION T(1),TAU(1),ABSTD(1),PTOTAL(1),P(1),PRAD(1),PTURB(1)
      DIMENSION VTURB(1)
      DLGTAU=DLOG(TAU(2)/TAU(1))
      PLOG3=0.
      PLOG2=0.
      PLOG1=0.
      DPLOG2=0.
      DPLOG1=0.
C     ASSUME CONSTANT OPACITY NEAR SURFACE.  FIRST GUESS=.1
      ABSTD(1)=.1
      IF(PRAD(1).GT.0.)ABSTD(1)=DMIN1(.1D0,GRAV*TAU(1)/PRAD(1)/2.)
C     TO FIX PROBLEM WITH TEMPERATURE DROP AT FIRST POINT
C     T1=T(1)
C     T(1)=T(2)
      DO 22 J=1,NUMTAU
      IF(J.EQ.1)PLOG=DLOG(GRAV/ABSTD(1)*TAU(1))
      IF(J.GT.1.AND.J.LE.4)PLOG=PLOG1+DPLOG1
      IF(J.GT.4)PLOG=(3.*PLOG4+8.*DPLOG1-4.*DPLOG2+8.*DPLOG3)/3.
      ERROR=1.
      N=1
      GO TO 21
   20 IF(J.EQ.1)PNEW=DLOG(GRAV/ABSTD(1)*TAU(1))
      IF(J.GT.1.AND.J.LE.4)PNEW=(PLOG+2.*PLOG1+DPLOG+DPLOG1)/3.
      IF(J.GT.4)PNEW=(126.*PLOG1-14.*PLOG3+9.*PLOG4+42.*DPLOG+
     1 108.*DPLOG1-54.*DPLOG2+24.*DPLOG3)/121.
      ERROR=ABS(PNEW-PLOG)
      PLOG=(PNEW+PLOG)/2.
   21 PTOTAL(J)=EXP(PLOG)
C     P(J)=PTOTAL(J)-PRAD(J)-PTURB(J)
      P(J)=PTOTAL(J)+(PRAD(1)-PRAD(J))-PTURB(J)
      IF(P(J).LE.0.)GO TO 25
      ABSTD(J)=ROSSTAB(T(J),P(J),VTURB(J))
      DPLOG=GRAV/ABSTD(J)*TAU(J)/PTOTAL(J)*DLGTAU
      N=N+1
      IF(N.GT.1000)GO TO 25
      IF(ERROR.GT..00005)GO TO 20
      PLOG4=PLOG3
      PLOG3=PLOG2
      PLOG2=PLOG1
      PLOG1=PLOG
      DPLOG3=DPLOG2
      DPLOG2=DPLOG1
      DPLOG1=DPLOG
   22 CONTINUE
C     T(1)=T1
      RETURN
   25 CONTINUE
      CALL W(6HJ     ,DFLOAT(J),1)
      CALL W(6HP     ,P,J)
      CALL W(6HPTOTAL,PTOTAL,J)
      CALL W(6HPRAD  ,PRAD,J)
      CALL W(6HPTURB ,PTURB,J)
      CALL W(6HABSTD ,ABSTD,J)
      CALL W(6HERROR ,ERROR,1)
      CALL EXIT
      END
      SUBROUTINE BLOCKE
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
C      Grevesse,N. and Anders, E. 1988.  presented at the workshop
C      on the "Solar Interior and Atmosphere", Tucson, Nov 15-18.
C      Anders, E. and Grevesse, N. 1989 Geochimica et Cosmochimica Acta,
C      vol. 53, pp. 197-214.
C     H has been defined to be -.04 instead of 12
C                   1H    2HE
      DATA ABUND/ 0.911,0.089,
C        3LI    4BE    5B     6C     7N     8O     9F    10NE
     1-10.88,-10.89, -9.44, -3.48, -3.99, -3.11, -7.48, -3.95,
C       11NA   12MG   13AL   14SI   15P    16S    17CL   18AR
     2 -5.71, -4.46, -5.57, -4.49, -6.59, -4.83, -6.54, -5.48,
C       19K    20CA   21SC   22TI   23V    24CR   25MN   26FE
     3 -6.92, -5.68, -8.94, -7.05, -8.04, -6.37, -6.65, -4.37,
C       27CO   28NI   29CU   30ZN   31GA   33GE   33AS   34SE
     4 -7.12, -5.79, -7.83, -7.44, -9.16, -8.63, -9.67, -8.69,
C       35BR   36KR   37RB   38SR   39Y    40ZR   41NB   42MO
     5 -9.41, -8.81, -9.44, -9.14, -9.80, -9.44,-10.62,-10.12,
C       43TC   44RU   45RH   46PD   47AG   48CD   49IN   50SN
     6-20.00,-10.20,-10.92,-10.35,-11.10,-10.18,-10.38,-10.04,
C       51SB   52TE   53I    54XE   55CS   56BA   57LA   58CE
     7-11.04, -9.80,-10.53, -9.81,-10.92, -9.91,-10.82,-10.49,
C       59PR   60ND   61PM   62SM   63EU   64GD   65TB   66DY
     8-11.33,-10.54,-20.00,-11.04,-11.53,-10.92,-12.14,-10.94,
C       67HO   68ER   69TM   70YB   71LU   72HF   73TA   74W
     9-11.78,-11.11,-12.04,-10.96,-11.28,-11.16,-11.91,-10.93,
C       75RE   76OS   77IR   78PT   79AU   80HG   81TL   82PB
     T-11.77,-10.59,-10.69,-10.24,-11.03,-10.95,-11.14,-10.19,
C       83BI   84PO   85AT   86RN   87FR   88RA   89AC   90TH
     1-11.33,-20.00,-20.00,-20.00,-20.00,-20.00,-20.00,-11.92,
C       91PA   92U    93NP   94PU   95AM   96CM   97BK   98CF  99ES
     2-20.00,-12.51,-20.00,-20.00,-20.00,-20.00,-20.00,-20.00,-20.00/
      DATA ATMASS/ 1.008,4.003,
     1 6.939,9.013,10.81,12.01,14.01,16.00,19.00,20.18,22.99,24.31,
     2 26.98,28.09,30.98,32.07,35.45,39.95,39.10,40.08,44.96,47.90,
     3 50.94,52.00,54.94,55.85,58.94,58.71,63.55,65.37,69.72,72.60,
     4 74.92,78.96,79.91,83.80,85.48,87.63,88.91,91.22,92.91,95.95,
     5 99.00,101.1,102.9,106.4,107.9,112.4,114.8,118.7,121.8,127.6,
     6 126.9,131.3,132.9,137.4,138.9,140.1,140.9,144.3,147.0,150.4,
     7 152.0,157.3,158.9,162.5,164.9,167.3,168.9,173.0,175.0,178.5,
     8 181.0,183.9,186.3,190.2,192.2,195.1,197.0,200.6,204.4,207.2,
     9 209.0,210.0,211.0,222.0,223.0,226.1,227.1,232.0,231.0,238.0,
     T 237.0,244.0,243.0,247.0,247.0,251.0,254.0/
      DATA ELEM/   2HH , 2HHE,
     1 2HLI, 2HBE, 2HB , 2HC , 2HN , 2HO , 2HF , 2HNE, 2HNA, 2HMG,
     2 2HAL, 2HSI, 2HP , 2HS , 2HCL, 2HAR, 2HK , 2HCA, 2HSC, 2HTI,
     3 2HV , 2HCR, 2HMN, 2HFE, 2HCO, 2HNI, 2HCU, 2HZN, 2HGA, 2HGE,
     4 2HAS, 2HSE, 2HBR, 2HKR, 2HRB, 2HSR, 2HY , 2HZR, 2HNB, 2HMO,
     5 2HTC, 2HRU, 2HRH, 2HPD, 2HAG, 2HCD, 2HIN, 2HSN, 2HSB, 2HTE,
     6 2HI , 2HXE, 2HCS, 2HBA, 2HLA, 2HCE, 2HPR, 2HND, 2HPM, 2HSM,
     7 2HEU, 2HGD, 2HTB, 2HDY, 2HHO, 2HER, 2HTM, 2HYB, 2HLU, 2HHF,
     8 2HTA, 2HW , 2HRE, 2HOS, 2HIR, 2HPT, 2HAU, 2HHG, 2HTL, 2HPB,
     9 2HBI, 2HPO, 2HAT, 2HRN, 2HFR, 2HRA, 2HAC, 2HTH, 2HPA, 2HU ,
     T 2HNP, 2HPU, 2HAM, 2HCM, 2HBK, 2HCF, 2HES/
      RETURN
      END
      SUBROUTINE BLOCKR
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /FRESET/FRESET(1563),RCOSET(1563),NULO,NUHI,NUMNU
C     DIMENSION WBIG(331)
      DIMENSION WBIG(337)
      DIMENSION WBIG1(152),WBIG2(152),WBIG3(33)
      EQUIVALENCE (WBIG(1),WBIG1(1)),(WBIG(153),WBIG2(1))
      EQUIVALENCE (WBIG(305),WBIG3(1))
C      DIMENSION WLIT(1215)
      DIMENSION WLIT(1221)
      DIMENSION WLIT1(152),WLIT2(152),WLIT3(154),WLIT4(152),WLIT5(152)
C      DIMENSION WLIT6(152),WLIT7(152),WLIT8(149)
      DIMENSION WLIT6(152),WLIT7(152),WLIT8(155)
      EQUIVALENCE (WLIT(1),WLIT1(1)),(WLIT(153),WLIT2(1))
      EQUIVALENCE (WLIT(305),WLIT3(1)),(WLIT(459),WLIT4(1))
      EQUIVALENCE (WLIT(611),WLIT5(1)),(WLIT(763),WLIT6(1))
      EQUIVALENCE (WLIT(915),WLIT7(1)),(WLIT(1067),WLIT8(1))
      EQUIVALENCE (FRESET(6),WBIG(1)),(FRESET(343),WLIT(1))
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /IFOP/IFOP(20)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
      COMMON /MUS/ANGLE(20),SURFI(20),NMU
      COMMON /RAD/ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STEPLG/STEPLG,TAU1LG,KRHOX
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /WAVEY/WBEGIN,DELTAW,IFWAVE
      DATA DLTDLP,HEATCP,DLRDLT,VELSND,GRDADB,HSCALE,FLXCNV,VCONV/
     1 kw*0.,kw*0.,kw*0.,kw*0.,kw*0.,kw*0.,kw*0.,kw*0./
      DATA IFCONV,MIXLTH,OVERWT/0,1.,1./
      DATA BHYD,BMIN/kw*1.,kw*1.,kw*1.,kw*1.,kw*1.,kw*1.,kw*1./
      DATA NLTEON/0/
      DATA FLUX/0./
      DATA FLXERR,FLXDRV/kw*0.,kw*0./
      DATA NUMNU/0/
      DATA WBIG1/
     1   9.09,   9.35,   9.61,   9.77,   9.96,  10.20,  10.38,  10.56,
     2  10.77,  11.04,  11.40,  11.78,  12.13,  12.48,  12.71,  12.84,
     3  13.05,  13.24,  13.39,  13.66,  13.98,  14.33,  14.72,  15.10,
     4  15.52,  15.88,  16.20,  16.60,  17.03,  17.34,  17.68,  18.02,
     5  18.17,  18.61,  19.10,  19.39,  19.84,  20.18,  20.50,  21.05,
     6  21.62,  21.98,  22.30,  22.68,  23.00,  23.40,  24.00,  24.65,
     7  25.24,  25.68,  26.00,  26.40,  26.85,  27.35,  27.85,  28.40,
     8   29.0,   29.6,   30.1,   30.8,   31.8,   32.8,   33.8,   34.8,
     9   35.7,   36.6,   37.5,   38.5,   39.5,   40.5,   41.4,   42.2,
     A   43.0,   44.1,   45.1,   46.0,   47.0,   48.0,   49.0,   50.0,
     1   50.6,   51.4,   53.0,   55.0,   56.7,   58.5,   60.5,   62.5,
     2   64.5,   66.3,   68.0,   70.0,   71.6,   73.0,   75.0,   77.0,
     3   79.0,   81.0,   83.0,   85.0,   87.0,   89.0,   90.6,   92.6,
     4   96.0,  100.0,  104.0,  108.0,  111.5,  114.5,  118.0,  122.0,
     5  126.0,  130.0,  134.0,  138.0,  142.0,  146.0,  150.0,  154.0,
     6  160.0,  165.0,  169.0,  173.0,  177.5,  182.0,  186.0,  190.5,
     7  195.0,  200.0,  204.5,  208.5,  212.5,  217.5,  222.5,  227.5,
     8  232.5,  237.5,  242.5,  248.0,  253.0,  257.5,  262.5,  267.5,
     9  272.5,  277.5,  282.5,  287.5,  295.0,  305.0,  315.0,  325.0/
      DATA WBIG2/
     1  335.0,  345.0,  355.0,  362.0,  367.0,  375.0,  385.0,  395.0,
     2  405.0,  415.0,  425.0,  435.0,  455.0,  465.0,  475.0,  485.0,
     3  495.0,  505.0,  515.0,  525.0,  535.0,  545.0,  555.0,  565.0,
     4  575.0,  585.0,  595.0,  605.0,  615.0,  625.0,  635.0,  645.0,
     5  655.0,  665.0,  675.0,  685.0,  695.0,  705.0,  715.0,  725.0,
     6  735.0,  745.0,  755.0,  765.0,  775.0,  785.0,  795.0,  805.0,
     7  815.0,  825.0,  835.0,  845.0,  855.0,  865.0,  875.0,  885.0,
     8  895.0,  905.0,  915.0,  925.0,  935.0,  945.0,  955.0,  965.0,
     9  975.0,  985.0,  995.0, 1012.5, 1037.5, 1062.5, 1087.5, 1112.5,
     A 1137.5, 1162.5, 1187.5, 1212.5, 1237.5, 1262.5, 1287.5, 1312.5,
     1 1337.5, 1362.5, 1387.5, 1412.5, 1442.0, 1467.0, 1487.5, 1512.5,
     2 1537.5, 1562.5, 1587.5, 1620.0, 1660.0, 1700.0, 1740.0, 1780.0,
     3  1820.,  1860.,  1900.,  1940.,  1980.,  2025.,  2075.,  2125.,
     4  2175.,  2225.,  2265.,  2290.,  2325.,  2375.,  2425.,  2475.,
     5  2525.,  2575.,  2625.,  2675.,  2725.,  2775.,  2825.,  2875.,
     6  2925.,  2975.,  3025.,  3075.,  3125.,  3175.,  3240.,  3340.,
     7  3450.,  3550.,  3650.,  3750.,  3850.,  3950.,  4050.,  4150.,
     8  4250.,  4350.,  4450.,  4550.,  4650.,  4750.,  4850.,  4950.,
     9  5050.,  5150.,  5250.,  5350.,  5450.,  5550.,  5650.,  5750./
      DATA WBIG3/
     1  5850.,  5950.,  6050.,  6150.,  6250.,  6350.,  6500.,  6700.,
     2  6900.,  7100.,  7300.,  7500.,  7700.,  7900.,  8100.,  8300.,
     3  8500.,  8700.,  8900.,  9100.,  9300.,  9500.,  9700.,  9900.,
     4 10000., 20000., 40000.,
     5 60000., 80000.,100000.,120000.,140000.,160000./
      DATA WLIT1/
     1   9.09,   9.35,   9.61,   9.77,   9.96,  10.20,  10.38,  10.56,
     2  10.77,  11.04,  11.40,  11.78,  12.13,  12.48,  12.71,  12.84,
     3  13.05,  13.24,  13.39,  13.66,  13.98,  14.33,  14.72,  15.10,
     4  15.52,  15.88,  16.20,  16.60,  17.03,  17.34,  17.68,  18.02,
     5  18.17,  18.61,  19.10,  19.39,  19.84,  20.18,  20.50,  21.05,
     6  21.62,  21.98,  22.30,  22.68,  23.00,  23.40,  24.00,  24.65,
     7  25.24,  25.68,  26.00,  26.40,  26.85,  27.35,  27.85,  28.40,
     8   29.0,   29.6,   30.1,   30.8,   31.8,   32.8,   33.8,   34.8,
     9   35.7,   36.6,   37.5,   38.5,   39.5,   40.5,   41.4,   42.2,
     A   43.0,   44.1,   45.1,   46.0,   47.0,   48.0,   49.0,   50.0,
     1   50.6,   51.2,   52.0,   53.0,   54.0,   55.0,   56.0,   57.0,
     2   58.0,   59.0,   60.0,   61.0,   62.0,   63.0,   64.0,   65.0,
     3   65.8,   66.5,   67.5,   68.5,   69.5,   70.5,   71.6,   72.6,
     4   73.5,   74.5,   75.5,   76.5,   77.5,   78.5,   79.5,   80.5,
     5   81.5,   82.5,   83.5,   84.5,   85.5,   86.5,   87.5,   88.5,
     6   89.5,   90.5,   91.5,   92.5,   93.5,   94.5,   95.5,   96.5,
     7   97.5,   98.5,   99.5,  100.5,  101.5,  102.5,  103.5,  104.5,
     8  105.5,  106.5,  107.5,  108.5,  109.5,  110.5,  111.5,  112.5,
     9  113.5,  114.5,  115.5,  116.5,  117.5,  118.5,  119.5,  120.5/
      DATA WLIT2/
     1  121.5,  122.5,  123.5,  124.5,  125.5,  126.5,  127.5,  128.5,
     2  129.5,  130.5,  131.5,  132.5,  133.5,  134.5,  135.5,  136.5,
     3  137.5,  138.5,  139.5,  140.5,  141.5,  142.5,  143.5,  144.2,
     4  144.7,  145.5,  146.5,  147.5,  148.5,  149.5,  150.5,  151.2,
     5  151.7,  152.5,  153.5,  154.5,  155.5,  156.5,  157.5,  158.5,
     6  159.5,  160.5,  161.5,  162.5,  163.5,  164.5,  165.5,  166.5,
     7  167.2,  167.7,  168.5,  169.5,  170.5,  171.5,  172.5,  173.5,
     8  174.5,  175.5,  176.5,  177.5,  178.5,  179.5,  180.5,  181.5,
     9  182.5,  183.5,  184.5,  185.5,  186.5,  187.5,  188.5,  189.5,
     A  190.5,  191.5,  192.5,  193.5,  194.5,  195.5,  196.7,  197.6,
     1  198.4,  199.5,  200.5,  201.5,  202.5,  203.5,  204.5,  205.5,
     2  206.5,  207.4,  207.8,  208.5,  209.5,  210.5,  211.5,  212.5,
     3  213.5,  214.5,  215.5,  216.5,  217.5,  218.5,  219.5,  220.5,
     4  221.5,  222.5,  223.5,  224.5,  225.5,  226.5,  227.5,  228.5,
     5  229.5,  230.5,  231.5,  232.5,  233.5,  234.5,  235.5,  236.5,
     6  237.5,  238.5,  239.5,  240.5,  241.5,  242.5,  243.5,  244.5,
     7  245.5,  246.5,  247.5,  248.5,  249.5,  250.5,  251.3,  251.8,
     8  252.5,  253.5,  254.5,  255.5,  256.5,  257.5,  258.5,  259.5,
     9  260.5,  261.5,  262.5,  263.5,  264.5,  265.5,  266.5,  267.5/
      DATA WLIT3/
     1  268.5,  269.5,  270.5,  271.5,  272.5,  273.5,  274.5,  275.5,
     2  276.5,  277.5,  278.5,  279.5,  280.5,  281.5,  282.5,  283.5,
     3  284.5,  285.5,  286.5,  287.5,  288.5,  289.5,  291.0,  293.0,
     4  295.0,  297.0,  299.0,  301.0,  303.0,  305.0,  307.0,  309.0,
     5  311.0,  313.0,  315.0,  317.0,  319.0,  321.0,  323.0,  325.0,
     6  327.0,  329.0,  331.0,  333.0,  335.0,  337.0,  339.0,  341.0,
     7  343.0,  345.0,  347.0,  349.0,  351.0,  353.0,  355.0,  357.0,
     8  359.0,  361.0,  363.0,  364.0,  365.,367.,369., 371.0,  373.0,
     9  375.0,  377.,379.,381., 383.0,  385.0,  387.0,  389.0,  391.0,
     A  393.0,  395.0,  397.0,  399.0,  401.0,  403.0,  405.0,  407.0,
     1  409.0,  411.0,  413.0,  415.0,  417.0,  419.0,  421.0,  423.0,
     2  425.0,  427.0,  429.0,  431.0,  433.0,  435.0,  437.0,  439.0,
     3  441.0,  443.0,  445.0,  447.0,  449.0,  451.0,  453.0,  455.0,
     4  457.0,  459.0,  461.0,  463.0,  465.0,  467.0,  469.0,  471.0,
     5  473.0,  475.0,  477.0,  479.0,  481.0,  483.0,  485.0,  487.0,
     6  489.0,  491.0,  493.0,  495.0,  497.0,  499.0,  501.0,  503.0,
     7  505.0,  507.0,  509.0,  511.0,  513.0,  515.0,  517.0,  519.0,
     8  521.0,  523.0,  525.0,  527.0,  529.0,  531.0,  533.0,  535.0,
     9  537.0,  539.0,  541.0,  543.0,  545.0,  547.0,  549.0,  551.0/
      DATA WLIT4/
     1  553.0,  555.0,  557.0,  559.0,  561.0,  563.0,  565.0,  567.0,
     2  569.0,  571.0,  573.0,  575.0,  577.0,  579.0,  581.0,  583.0,
     3  585.0,  587.0,  589.0,  591.0,  593.0,  595.0,  597.0,  599.0,
     4  601.0,  603.0,  605.0,  607.0,  609.0,  611.0,  613.0,  615.0,
     5  617.0,  619.0,  621.0,  623.0,  625.0,  627.0,  629.0,  631.0,
     6  633.0,  635.0,  637.0,  639.0,  641.0,  643.0,  645.0,  647.0,
     7  649.0,  651.0,  653.0,  655.0,  657.0,  659.0,  661.0,  663.0,
     8  665.0,  667.0,  669.0,  671.0,  673.0,  675.0,  677.0,  679.0,
     9  681.0,  683.0,  685.0,  687.0,  689.0,  691.0,  693.0,  695.0,
     A  697.0,  699.0,  701.0,  703.0,  705.0,  707.0,  709.0,  711.0,
     1  713.0,  715.0,  717.0,  719.0,  721.0,  723.0,  725.0,  727.0,
     2  729.0,  731.0,  733.0,  735.0,  737.0,  739.0,  741.0,  743.0,
     3  745.0,  747.0,  749.0,  751.0,  753.0,  755.0,  757.0,  759.0,
     4  761.0,  763.0,  765.0,  767.0,  769.0,  771.0,  773.0,  775.0,
     5  777.0,  779.0,  781.0,  783.0,  785.0,  787.0,  789.0,  791.0,
     6  793.0,  795.0,  797.0,  799.0,  801.0,  803.0,  805.0,  807.0,
     7  809.0,  811.0,  813.0,  815.0,  817.0,  819.0,  821.0,  823.0,
     8  825.0,  827.0,  829.0,  831.0,  833.0,  835.0,  837.0,  839.0,
     9  841.0,  843.0,  845.0,  847.0,  849.0,  851.0,  853.0,  855.0/
      DATA WLIT5/
     1  857.0,  859.0,  861.0,  863.0,  865.0,  867.0,  869.0,  871.0,
     2  873.0,  875.0,  877.0,  879.0,  881.0,  883.0,  885.0,  887.0,
     3  889.0,  891.0,  893.0,  895.0,  897.0,  899.0,  901.0,  903.0,
     4  905.0,  907.0,  909.0,  911.0,  913.0,  915.0,  917.0,  919.0,
     5  921.0,  923.0,  925.0,  927.0,  929.0,  931.0,  933.0,  935.0,
     6  937.0,  939.0,  941.0,  943.0,  945.0,  947.0,  949.0,  951.0,
     7  953.0,  955.0,  957.0,  959.0,  961.0,  963.0,  965.0,  967.0,
     8  969.0,  971.0,  973.0,  975.0,  977.0,  979.0,  981.0,  983.0,
     9  985.0,  987.0,  989.0,  991.0,  993.0,  995.0,  997.0,  999.0,
     A 1002.5, 1007.5, 1012.5, 1017.5, 1022.5, 1027.5, 1032.5, 1037.5,
     1 1042.5, 1047.5, 1052.5, 1057.5, 1062.5, 1067.5, 1072.5, 1077.5,
     2 1082.5, 1087.5, 1092.5, 1097.5, 1102.5, 1107.5, 1112.5, 1117.5,
     3 1122.5, 1127.5, 1132.5, 1137.5, 1142.5, 1147.5, 1152.5, 1157.5,
     4 1162.5, 1167.5, 1172.5, 1177.5, 1182.5, 1187.5, 1192.5, 1197.5,
     5 1202.5, 1207.5, 1212.5, 1217.5, 1222.5, 1227.5, 1232.5, 1237.5,
     6 1242.5, 1247.5, 1252.5, 1257.5, 1262.5, 1267.5, 1272.5, 1277.5,
     7 1282.5, 1287.5, 1292.5, 1297.5, 1302.5, 1307.5, 1312.5, 1317.5,
     8 1322.5, 1327.5, 1332.5, 1337.5, 1342.5, 1347.5, 1352.5, 1357.5,
     9 1362.5, 1367.5, 1372.5, 1377.5, 1382.5, 1387.5, 1392.5, 1397.5/
      DATA WLIT6/
     1 1402.5, 1407.5, 1412.5, 1417.5, 1422.5, 1427.5, 1432.5, 1437.5,
     2 1442.5, 1447.5, 1452.5, 1457.0, 1462.0, 1467.5, 1472.5, 1477.5,
     3 1482.5, 1487.5, 1492.5, 1497.5, 1502.5, 1507.5, 1512.5, 1517.5,
     4 1522.5, 1527.5, 1532.5, 1537.5, 1542.5, 1547.5, 1552.5, 1557.5,
     5 1562.5, 1567.5, 1572.5, 1577.5, 1582.5, 1587.5, 1592.5, 1597.5,
     6  1605.,  1615.,  1625.,  1635.,  1645.,  1655.,  1665.,  1675.,
     7  1685.,  1695.,  1705.,  1715.,  1725.,  1735.,  1745.,  1755.,
     8  1765.,  1775.,  1785.,  1795.,  1805.,  1815.,  1825.,  1835.,
     9  1845.,  1855.,  1865.,  1875.,  1885.,  1895.,  1905.,  1915.,
     A  1925.,  1935.,  1945.,  1955.,  1965.,  1975.,  1985.,  1995.,
     1  2005.,  2015.,  2025.,  2035.,  2045.,  2055.,  2065.,  2075.,
     2  2085.,  2095.,  2105.,  2115.,  2125.,  2135.,  2145.,  2155.,
     3  2165.,  2175.,  2185.,  2195.,  2205.,  2215.,  2225.,  2235.,
     4  2245.,  2255.,  2265.,  2275.,  2285.,  2295.,  2305.,  2315.,
     5  2325.,  2335.,  2345.,  2355.,  2365.,  2375.,  2385.,  2395.,
     6  2405.,  2415.,  2425.,  2435.,  2445.,  2455.,  2465.,  2475.,
     7  2485.,  2495.,  2505.,  2515.,  2525.,  2535.,  2545.,  2555.,
     8  2565.,  2575.,  2585.,  2595.,  2605.,  2615.,  2625.,  2635.,
     9  2645.,  2655.,  2665.,  2675.,  2685.,  2695.,  2705.,  2715./
      DATA WLIT7/
     1  2725.,  2735.,  2745.,  2755.,  2765.,  2775.,  2785.,  2795.,
     2  2805.,  2815.,  2825.,  2835.,  2845.,  2855.,  2865.,  2875.,
     3  2885.,  2895.,  2905.,  2915.,  2925.,  2935.,  2945.,  2955.,
     4  2965.,  2975.,  2985.,  2995.,  3005.,  3015.,  3025.,  3035.,
     5  3045.,  3055.,  3065.,  3075.,  3085.,  3095.,  3105.,  3115.,
     6  3125.,  3135.,  3145.,  3155.,  3165.,  3175.,  3185.,  3195.,
     7  3210.,  3230.,  3250.,  3270.,  3290.,  3310.,  3330.,  3350.,
     8  3370.,  3390.,  3410.,  3430.,  3450.,  3470.,  3490.,  3510.,
     9  3530.,  3550.,  3570.,  3590.,  3610.,  3630.,  3650.,  3670.,
     A  3690.,  3710.,  3730.,  3750.,  3770.,  3790.,  3810.,  3830.,
     1  3850.,  3870.,  3890.,  3910.,  3930.,  3950.,  3970.,  3990.,
     2  4010.,  4030.,  4050.,  4070.,  4090.,  4110.,  4130.,  4150.,
     3  4170.,  4190.,  4210.,  4230.,  4250.,  4270.,  4290.,  4310.,
     4  4330.,  4350.,  4370.,  4390.,  4410.,  4430.,  4450.,  4470.,
     5  4490.,  4510.,  4530.,  4550.,  4570.,  4590.,  4610.,  4630.,
     6  4650.,  4670.,  4690.,  4710.,  4730.,  4750.,  4770.,  4790.,
     7  4810.,  4830.,  4850.,  4870.,  4890.,  4910.,  4930.,  4950.,
     8  4970.,  4990.,  5010.,  5030.,  5050.,  5070.,  5090.,  5110.,
     9  5130.,  5150.,  5170.,  5190.,  5210.,  5230.,  5250.,  5270./
      DATA WLIT8/
     1  5290.,  5310.,  5330.,  5350.,  5370.,  5390.,  5410.,  5430.,
     2  5450.,  5470.,  5490.,  5510.,  5530.,  5550.,  5570.,  5590.,
     3  5610.,  5630.,  5650.,  5670.,  5690.,  5710.,  5730.,  5750.,
     4  5770.,  5790.,  5810.,  5830.,  5850.,  5870.,  5890.,  5910.,
     5  5930.,  5950.,  5970.,  5990.,  6010.,  6030.,  6050.,  6070.,
     6  6090.,  6110.,  6130.,  6150.,  6170.,  6190.,  6210.,  6230.,
     7  6250.,  6270.,  6290.,  6310.,  6330.,  6350.,  6370.,  6390.,
     8  6420.,  6460.,  6500.,  6540.,  6580.,  6620.,  6660.,  6700.,
     9  6740.,  6780.,  6820.,  6860.,  6900.,  6940.,  6980.,  7020.,
     A  7060.,  7100.,  7140.,  7180.,  7220.,  7260.,  7300.,  7340.,
     1  7380.,  7420.,  7460.,  7500.,  7540.,  7580.,  7620.,  7660.,
     2  7700.,  7740.,  7780.,  7820.,  7860.,  7900.,  7940.,  7980.,
     3  8020.,  8060.,  8100.,  8140.,  8180.,  8220.,  8260.,  8300.,
     4  8340.,  8380.,  8420.,  8460.,  8500.,  8540.,  8580.,  8620.,
     5  8660.,  8700.,  8740.,  8780.,  8820.,  8860.,  8900.,  8940.,
     6  8980.,  9020.,  9060.,  9100.,  9140.,  9180.,  9220.,  9260.,
     7  9300.,  9340.,  9380.,  9420.,  9460.,9500.,9540.,9580.,9620.,
     8  9660., 9700.,9740.,9780.,9820.,9860.,9900.,9940.,9980.,10020.,
     9 20000., 40000., 60000., 80000.,100000.,120000.,140000.,160000./
C     7  9300.,  9340.,  9380.,  9420.,  9460.,  9500.,  9540.,  9580.,
C     8  9620.,  9660.,  9700.,  9740.,  9780.,  9820.,  9860.,  9900.,
C     9  9940.,  9980., 10020. ,20000., 40000./
      DATA IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL/1,1,0,1,0.,0/
      DATA IFOP/1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,0,0/
      DATA XNFPH,XNFPHE/kw*0.,kw*0.,kw*0.,kw*0.,kw*0./
      DATA IFPRNT/2,2,2,2,2,2,2,2,2,2,2,2,2,2,2/
      DATA IFPNCH/0,0,0,0,0,0,0,0,0,0,0,0,0,0,0/
      DATA NUMITS/0/
C      DATA TITLE/74*1H /
      DATA TITLE/74*8H        /
      DATA WLTE/4HLTE /
      DATA XSCALE/1./
      DATA SURFI/20*0./,NMU/1/
      DATA ACCRAD/kw*0./,PRAD/kw*0./
      DATA STEPLG/.125/
      DATA TAU1LG/-5.875/
      DATA KRHOX/0/
      DATA NRHOX/0/
      DATA TEFF/0./
      DATA GRAV/0./
      DATA VTURB/kw*0./
      DATA PTURB/kw*0./
      DATA IFTURB,TRBFDG,TRBPOW,TRBSND,TRBCON/0,0.,0.,0.,0./
      DATA IFWAVE/0/
      END
      SUBROUTINE READIN(MODE)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     MODE=1 COMPUTE A MODEL
C     MODE=2 READ A PREVIOUSLY CALCULATED MODEL FOR SOME APPLICATION
C     MODE=20 SAME AS 2 BUT ON ENCOUNTERING END RETURN WITH NRHOX=0
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
      COMMON /FILENAME/FILENAME
      CHARACTER*60 FILENAME
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /FREE/WORD(6),NUMCOL,LETCOL,LAST,MORE,IFFAIL,MAXPOW
      REAL*4 WORD
      COMMON /FRESET/FRESET(1563),RCOSET(1563),NULO,NUHI,NUMNU
      COMMON /HEIGHT/HEIGHT(kw)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /IFOP/IFOP(20)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
      INTEGER*4 ITITLE(148)
      EQUIVALENCE (ITITLE(1),TITLE(1))
      REAL*4 FREQID4(12)
      EQUIVALENCE (FREQID(1),FREQID4(1))
      COMMON /MUS/ANGLE(20),SURFI(20),NMU
      COMMON /PTOTAL/PTOTAL(kw)
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /RAD/ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /STEPLG/STEPLG,TAU1LG,KRHOX
      COMMON/TABTP/TABT(56),TABP(38),TABKAP(56,38,5),PKAP(38),
     1TABV(5),PKAPV(5,38),IFTABK,KTAB(56,38,5),NT,NP
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /WAVEY/WBEGIN,DELTAW,IFWAVE
      COMMON /XABUND/XABUND(99),WTMOLE
      INTEGER CARD(80),CARD81,CCCC(81)
      EQUIVALENCE (CARD(1),CCCC(1)),(CARD81,CCCC(81))
      DIMENSION RHOXA(kw),DUM1(kw),DUM2(kw),DUM3(kw),DUM4(kw),DUM5(kw)
      DIMENSION DUM6(kw),DUM7(kw),DUM8(kw),TAUSTD(kw),TSMOOTH(kw)
C      EQUIVALENCE (DUM1(1),DLTDLP(1)),(DUM2(1),HEATCP(1))
C      EQUIVALENCE (DUM3(1),DLRDLT(1)),(DUM4(1),VELSND(1))
C      EQUIVALENCE (DUM5(1),GRDADB(1)),(DUM6(1),HSCALE(1))
C      EQUIVALENCE (DUM7(1),FLXCNV(1)),(RHOXA(1),VCONV(1),DUM8(1))
C      EQUIVALENCE (TAUSTD(1),XNATOM(1))
      DIMENSION IFOP1(20)
C     H1,H2PLUS,HMINUS,HRAY,HE1,HE2,HEMINUS,HERAY,COOL,LUKE,
C     HOT,ELECTRON,H2RAY,HLINES,LINES,LINESCAT,XLINES,XLSCAT,XCONT,XSCAT
      DATA IFOP1/324,609929997,579591588,429928,11165,11166,564793810,
     1 15271257,173061,636997,11527,369467847,16486929,577716835,
     2 22965179,849711626,1687220147,1687711471,45152896,45946435/
      DATA WWLTE,WWNLTE/4HLTE ,4HNLTE/
      DATA BLANK/1H /
      EXP10(X)=EXP(X*2.30258509299405E0)
C      CARD81=BLANK
      CARD81=(1H )
      LAST=81
      MAXPOW=38
   98 MORE=0
      LETCOL=1
   99 READ(5,1) CARD
    1 FORMAT(80A1)
C     (M)ACHINE (I)NDEPENDENT (A)LPHAMERIC (C)ODE
C     BASE 37    A=1, Z=26, 0=27, 9=36
      MIAC=IWORDF(CARD)
      NUMCOL=LETCOL
C     TEFF
    3 IF(MIAC.EQ.1020133)GO TO 100
C     GRAVITY
      IF(MIAC.EQ.519223721)GO TO 200
C     OPACITY
      IF(MIAC.EQ.1070201044)GO TO 300
C     KAPPA
      IF(MIAC.EQ.20688921)GO TO 400
C     ITERATIONS
      IF(MIAC.EQ.661856797)GO TO 500
C     MOLECULES
      IF(MIAC.EQ.930198669)GO TO 600
C     CALCULATE
      IF(MIAC.EQ.210518764)GO TO 700
C     ABUNDANCE
      IF(MIAC.EQ.74175307)GO TO 800
C     PRINT
      IF(MIAC.EQ.30911189)GO TO 900
C     PUNCH
      IF(MIAC.EQ.31069574)GO TO 1000
C     READ
      IF(MIAC.EQ.918640)GO TO 1100
C     LTE
      IF(MIAC.EQ.17173)GO TO 1200
C     NLTE
      IF(MIAC.EQ.726315)GO TO 1300
C     BEGIN
      IF(MIAC.EQ.4011517)GO TO 1500
C     SCATTERING
      IF(MIAC.EQ.1323236444)GO TO 1600
C     END
      IF(MIAC.EQ.7367)GO TO 1700
C     TITLE
      IF(MIAC.EQ.37966926)GO TO 1800
C     CONVECTION
      IF(MIAC.EQ.236883734)GO TO 1900
C     TURBULENCE
      IF(MIAC.EQ.1427151802)GO TO 2000
C     CHANGE RHOX
      IF(MIAC.EQ.223095242)GO TO 2100
C     FREQUENCIES
      IF(MIAC.EQ.450075960)GO TO 2200
C     SURFACE
      IF(MIAC.EQ.1357812572)GO TO 2300
C     PRESSURE
      IF(MIAC.EQ.1143518210)GO TO 2400
C     CORRECTION
      IF(MIAC.EQ.237080870)GO TO 2500
C     WAVELENGTH
      IF(MIAC.EQ.1597906832)GO TO 2600
C     SCALE MODEL
      IF(MIAC.EQ.35762836)GO TO 2700
C     CALL
      IF(MIAC.EQ.153784)GO TO 2800
C     VTURB
      IF(MIAC.EQ.42274019)GO TO 2900
C     SMOOTH
      IF(MIAC.EQ.1342680354)GO TO 3000
C
 9000 WRITE(6,2) CARD
    2 FORMAT(21H I DO NOT UNDERSTAND 80A1)
      CALL EXIT
   97 LETCOL=MAX0(LETCOL,NUMCOL)
      MORE=1
      MIAC=IWORDF(CARD)
      IF(IFFAIL.EQ.1)GO TO 98
      MORE=0
      GO TO 3
C************
  100 TEFF=FREEFF(CARD)
      FLUX=5.6697E-5/12.5664*TEFF**4
      GO TO 97
C************
  200 GRAV=FREEFF(CARD)
      IF(GRAV.LT.10.)GRAV=EXP10(GRAV)
      GLOG=DLOG10(GRAV)
      GO TO 97
C************
  300 MIAC=IWORDF(CARD)
C     ON
      IF(MIAC.EQ.569)GO TO 380
C     OFF
      IF(MIAC.EQ.20763)GO TO 390
C     IFOP
      IF(MIAC.EQ.464662)GO TO 370
      GO TO 9000
  370 NUMCOL=LETCOL
      DO 371 I=1,20
  371 IFOP(I)=FREEFF(CARD)
      GO TO 98
C     ON
  380 ISWCH=1
      GO TO 391
C     OFF
  390 ISWCH=0
  391 MORE=1
  395 MIAC=IWORDF(CARD)
      IF(IFFAIL.EQ.1)GO TO 97
      DO 392 I=1,20
      II=I
      IF(MIAC.EQ.IFOP1(I))GO TO 393
  392 CONTINUE
      GO TO 9000
  393 IFOP(II)=ISWCH
      GO TO 395
C************
  400 GO TO 9000
C************
  500 NUMITS=FREEFF(CARD)
      DO 501 I=1,15
  501 IFPNCH(I)=0
      IFPNCH(NUMITS)=1
      GO TO 97
C************
  600 MIAC=IWORDF(CARD)
C     ON
      IF(MIAC.EQ.569)GO TO 610
C     OFF
      IF(MIAC.EQ.20763)GO TO 620
      GO TO 9000
  610 IFMOL=1
      GO TO 97
  620 IFMOL=0
      GO TO 97
C************
  700 NRHOX=FREEFF(CARD)
      TAU1LG=FREEFF(CARD)
      STEPLG=FREEFF(CARD)
      DO 701 J=1,NRHOX
      TAUROS(J)=EXP10(TAU1LG+DFLOAT(J-1)*STEPLG)
  701 T(J)=TEFF*(.75*(.710+TAUROS(J)-.1331*EXP(-3.4488*TAUROS(J))))**.25
  702 DO 703 J=1,NRHOX
      XNE(J)=0.
      PRADK(J)=2.521E-15*DMAX1(T(J)**4,TEFF**4/2.)
      VTURB(J)=0.
  703 PTURB(J)=0.
      PRADK0=PRADK(1)
      PCON=0.
      PTURB0=0.
      PZERO=PRADK0
      DO 704 J=1,NRHOX
  704 PRAD(J)=PRADK(J)-PRADK0
      CALL TTAUP(T,TAUROS,ABROSS,PTOTAL,P,PRAD,PTURB,
     1VTURB,GRAV,NRHOX)
      DO 705 J=1,NRHOX
      RHOX(J)=PTOTAL(J)/GRAV
  705 PTOTAL(J)=PTOTAL(J)+PZERO
      GO TO 97
C************
  800 MIAC=IWORDF(CARD)
C     SCALE
      IF(MIAC.EQ.35762836)GO TO 810
C     CHANGE  (SOLAR ABUNDANCE BEFORE SCALING)
      IF(MIAC.EQ.223095242)GO TO 820
C     ABSOLUTE (FINAL ABUNDANCE AFTER SCALING)
      IF(MIAC.EQ.74075686)GO TO 830
      GO TO 9000
  810 NUMCOL=LETCOL
      XSCALE=FREEFF(CARD)
      GO TO 97
  820 MORE=1
  821 IZ=FREEFF(CARD)
      IF(IFFAIL.EQ.1)GO TO 98
      ABUND(IZ)=FREEFF(CARD)
      GO TO 821
  830 MORE=1
  831 IZ=FREEFF(CARD)
      IF(IFFAIL.EQ.1)GO TO 98
      ABUND(IZ)=FREEFF(CARD)
      IF(IZ.GT.2)ABUND(IZ)=ABUND(IZ)/XSCALE
      GO TO 831
C************
  900 DO 901 I=1,NUMITS
  901 IFPRNT(I)=FREEFF(CARD)
      GO TO 97
C************
 1000 DO 1001 I=1,NUMITS
 1001 IFPNCH(I)=FREEFF(CARD)
      GO TO 97
C************
 1100 MIAC=IWORDF(CARD)
      NUMCOL=LETCOL
C     FREQUENCIES
      IF(MIAC.EQ.450075960)GO TO 1110
C     DEPARTURE COEFFICIENTS
      IF(MIAC.EQ.287559136)GO TO 1120
C     STARTING T-TAU
      IF(MIAC.EQ.1355094447)GO TO 1130
C     DECK
      IF(MIAC.EQ.209579)GO TO 1140
C     DECK6
      IF(MIAC.EQ.7754456)GO TO 1140
C     KAPPA
      IF(MIAC.EQ.20688921)GO TO 1150
C     MOLECULES
      IF(MIAC.EQ.930198669)GO TO 1160
C     PUNCH
      IF(MIAC.EQ.31069574)GO TO 1170
      GO TO 9000
C     FREQUENCIES
 1110 NUM=FREEFF(CARD)
      NULO=FREEFF(CARD)
      NUHI=FREEFF(CARD)
      NUMNU=NUM
      LETCOL=NUMCOL
      NDUMMY=IWORDF(CARD)
      DO 1111 I=1,6
 1111 FREQID4(2*I-1)=WORD(I)
      NUMCOL=LETCOL
      DO 1112 I=1,NUMNU
      NU=FREEFR(CARD)
      FRESET(NU)=FREEFF(CARD)
C     PROVISION FOR READING WAVELENGTHS
      IF(FRESET(NU).LT.1.E7)FRESET(NU)=2.997925E17/FRESET(NU)
C     PROVISION FOR READING WAVENUMBERS SCALED BY 1.E25
      IF(FRESET(NU).GT.1.E20)FRESET(NU)=FRESET(NU)*(2.997925E10/1.E25)
 1112 RCOSET(NU)=FREEFF(CARD)
      GO TO 98
C     DEPARTURE COEFFICIENTS
 1120 NRHOX=FREEFF(CARD)
      DO 1122 J=1,NRHOX
      NUMCOL=1
      READ(5,1)CARD
      DUMMY=FREEFF(CARD)
      DO 1121 I=1,6
 1121 BHYD(J,I)=FREEFF(CARD)
 1122 BMIN(J)=FREEFF(CARD)
      WLTE=WWNLTE
      NLTEON=1
      GO TO 98
 1130 NRHOX=FREEFF(CARD)
      DO 1131 J=1,NRHOX
      NUMCOL=1
      READ(5,1)CARD
      TAUROS(J)=FREEFF(CARD)
 1131 T(J)=FREEFF(CARD)
      IF(TAUROS(1).GT.0.)GO TO 702
      DO 1132 J=1,NRHOX
 1132 TAUROS(J)=EXP10(TAUROS(J))
      GO TO 702
 1140 NRHOX=FREEFF(CARD)
      DO 1141 J=1,NRHOX
      NUMCOL=1
      READ(5,1)CARD
      RHOX(J)=FREEFF(CARD)
      T(J)=FREEFF(CARD)
      MORE=1
      P(J)=FREEFF(CARD)
      XNE(J)=FREEFF(CARD)
      ABROSS(J)=FREEFF(CARD)
      PRAD(J)=FREEFF(CARD)
      VTURB(J)=FREEFF(CARD)
 1141 MORE=0
      IF(RHOX(1).GE.0.)GO TO 1143
      DO 1142 J=1,NRHOX
 1142 RHOX(J)=EXP10(RHOX(J))
 1143 PRADK0=0.
      PTURB0=PTURB(1)
      PCON=0.
      PZER0=PCON+PRADK0+PTURB0
      CALL INTEG(RHOX,ABROSS,TAUROS,NRHOX,ABROSS(1)*RHOX(1))
      IF(MIAC.NE.7754456)GO TO 98
      READ(5,1)CARD
      NUMCOL=1
      PRADK0=FREEFF(CARD)
      DO 1144 J=1,NRHOX
 1144 ACCRAD(J)=PRAD(J)
      CALL INTEG(RHOX,ACCRAD,PRAD,NRHOX,ACCRAD(1)*RHOX(1))
      DO 1145 J=1,NRHOX
 1145 PRADK(J)=PRAD(J)+PRADK0
      GO TO 98
 1150 OPEN(UNIT=1,SHARED,TYPE='OLD',READONLY)
      READ(1,1)CARD
      WRITE(6,1151)CARD
 1151 FORMAT(80A1)
      READ(1,1)
      DO 1154 IT=1,56
      DO 1154 IP=1,38
      READ(1,1152)(TABKAP(IT,IP,IV),IV=1,5)
 1152 FORMAT(5X,5X,5F7.3)
 1154 CONTINUE
      IFTABK=1
      CLOSE(UNIT=1)
      GO TO 98
 1160 CALL READMOL
      GO TO 98
C     READS A FILE THAT HAS BEEN PUNCHED PREVIOUSLY EXCEPT FOR THE BEGIN CARD
 1170 WRITE(FILENAME,'(60A1)')(CARD(I),I=LETCOL,70)
      IF(INDEX(FILENAME,'.').EQ.0)THEN
      OPEN(UNIT=3,STATUS='OLD',SHARED,READONLY)
      ELSE
      DO 1178 I=1,60
      IF(FILENAME(I:I).NE.' ')GO TO 1179
 1178 CONTINUE
 1179 OPEN(UNIT=3,NAME=FILENAME(I:60),STATUS='OLD',SHARED,READONLY)
      ENDIF
      READ(3,1171) TEFF,GLOG,WLTE,TITLE,IFOP,A,MIXLTH,B,TRBFDG,
     1TRBPOW,TRBSND,TRBCON,XSCALE,(IZ,ABUND(IZ),IZ=1,99)
 1171 FORMAT(5HTEFF ,F7.0,9H  GRAVITY,F8.5,1X,A4/6HTITLE ,74A1/
     1 13H OPACITY IFOP,20I2/
     2 12H CONVECTION ,A3,F6.2,12H TURBULENCE, A3,4F6.2/
     3 16HABUNDANCE SCALE ,F9.5,17H ABUNDANCE CHANGE,2(I2,F8.5)/
     4(17H ABUNDANCE CHANGE,6(I3,F7.2)))
      GRAV=10.**GLOG
      FLUX=5.6697E-5/12.5664*TEFF**4
      IF(WLTE.EQ.4HLTE )NLTEON=0
      IF(WLTE.EQ.4HNLTE)NLTEON=1
      IF(A.EQ.3HOFF)IFCONV=0
      IF(A.EQ.3HON )IFCONV=1
      IF(B.EQ.3HOFF)IFTURB=0
      IF(B.EQ.3HON )IFTURB=1
      READ(3,1172)NRHOX,(RHOX(J),T(J),P(J),XNE(J),ABROSS(J),ACCRAD(J),
     1VTURB(J),J=1,NRHOX)
 1172 FORMAT(10HREAD DECK6,I3,33H RHOX,T,P,XNE,ABROSS,ACCRAD,VTURB/
     1(1PE15.8,0PF9.1,1P5E10.3))
      READ(3,1173)PRADK0
 1173 FORMAT(5HPRADK,1PE11.4)
      CALL INTEG(RHOX,ACCRAD,PRAD,NRHOX,ACCRAD(1)*RHOX(1))
      DO 1177 J=1,NRHOX
 1177 PRADK(J)=PRAD(J)+PRADK0
      CALL INTEG(RHOX,ABROSS,TAUROS,NRHOX,ABROSS(1)*RHOX(1))
      IF(NLTEON.EQ.1)THEN
      READ(3,1174)NRHOX,(RHOX(J),(BHYD(J,I),I=1,6),BMIN(J),J=1,NRHOX)
 1174 FORMAT(27HREAD DEPARTURE COEFFICIENTSI3,21H RHOX  BHYD 1-6  BMIN/
     1(1PE11.4,0P7F9.4))
      ENDIF
      READ(3,1175)ITERPUN
 1175 FORMAT(5HBEGIN,20X,10HITERATION I3,10H COMPLETED )
      INQUIRE(3,NAME=FILENAME)
      FILENAME=FILENAME(INDEX(FILENAME,']')+1:60)
      FILENAME=FILENAME(1:INDEX(FILENAME,'.')-1)
      CLOSE(UNIT=3)
      GO TO 98
C************
 1200 NLTEON=0
      WLTE=WWLTE
      DO 1202 J=1,kw
      DO 1201 I=1,6
 1201 BHYD(J,I)=1.
 1202 BMIN(J)=1.
      GO TO 97
C************
 1300 NLTEON=1
      WLTE=WWNLTE
      GO TO 97
C************
 1500 IF(MODE.NE.1)GO TO 1510
      IF(NUMITS.EQ.0)WRITE(6,1501)
      IF(NRHOX.EQ.0)WRITE(6,1502)
      IF(NUMNU.EQ.0)WRITE(6,1503)
      IF(TEFF.EQ.0.)WRITE(6,1504)
      IF(GRAV.EQ.0.)WRITE(6,1505)
 1501 FORMAT(20H HOW MANY ITERATIONS)
 1502 FORMAT(14H HOW MANY RHOX)
 1503 FORMAT(21H HOW MANY FREQUENCIES)
 1504 FORMAT(10H WHAT TEFF)
 1505 FORMAT(13H WHAT GRAVITY)
      IF(NUMITS.EQ.0)CALL EXIT
      IF(NRHOX.EQ.0)CALL EXIT
      IF(NUMNU.EQ.0)CALL EXIT
      IF(TEFF.EQ.0.)CALL EXIT
      IF(GRAV.EQ.0.)CALL EXIT
 1510 CONTINUE
      IF(ABUND(1).LT.0.)ABUND(1)=EXP10(ABUND(1))
      IF(ABUND(2).LT.0.)ABUND(2)=EXP10(ABUND(2))
      DO 1511 IZ=3,99
      IF(ABUND(IZ).GT.0.)ABUND(IZ)=DLOG10(ABUND(IZ))
 1511 CONTINUE
      WRITE(6,1512)TEFF,GLOG,WLTE,TITLE,XSCALE,
     1(ELEM(IZ),ABUND(IZ),IZ=1,99)
 1512 FORMAT(1H1/////5H TEFF,F7.0,8H   LOG G,F8.4,3X,A4/
     17H0TITLE ,74A1/7H0XSCALE,F10.6,2(3X,A2,F8.5)/(10(1X,A2,F6.2)))
      DO 1513 IZ=3,99
 1513 XABUND(IZ)=EXP10(ABUND(IZ))*XSCALE
      XABUND(1)=ABUND(1)
      XABUND(2)=ABUND(2)
      WTMOLE=0.
      DO 1514 IZ=1,99
 1514 WTMOLE=WTMOLE+XABUND(IZ)*ATMASS(IZ)
      DO 1516 J=1,NRHOX
      TK(J)=1.38054E-16*T(J)
      HKT(J)=6.6256E-27/TK(J)
      HCKT(J)=HKT(J)*2.99792458E10
      TKEV(J)=8.6171E-5*T(J)
      TLOG(J)=DLOG(T(J))
      XNATOM(J)=P(J)/TK(J)-XNE(J)
      RHO(J)=XNATOM(J)*WTMOLE*1.660E-24
      IF(IFTURB.GT.0)PTURB(J)=.5*RHO(J)*VTURB(J)**2
 1516 CONTINUE
      WRITE(6,1517)IFOP
 1517 FORMAT(3H0H1I2,7H H2PLUSI2,7H HMINUSI2,5H HRAYI2,4H HE1I2,
     1 4H HE2I2,8H HEMINUSI2,6H HERAYI2,5H COOLI2,5H LUKEI2/
     2 4H HOTI2,9H ELECTRONI2,6H H2RAYI2,7H HLINESI2,6H LINESI2,
     3 9H LINESCATI2,7H XLINESI2,7H XLSCATI2,6H XCONTI2,6H XSCATI2)
      WRITE(6,1518)IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFCONV,MIXLTH,
     1IFMOL,IFTURB,TRBFDG,TRBPOW,TRBSND,TRBCON
 1518 FORMAT(7H0IFCORR,I2,8H  IFPRES,I2,8H  IFSURF,I2,8H  IFSCAT,I2,
     1 9H  TAUSCAT,1PE10.2,
     2 8H  IFCONV,I2,8H  MIXLTH,0PF6.2,7H  IFMOL,I2/7H IFTURB,I2,
     3 8H  TRBFDG,F6.2,8H  TRBPOW,F6.2,8H  TRBSND,F6.2,8H  TRBCON,F6.2)
      IF(MODE.NE.1)GO TO 1575
      WRITE(6,1521)NUMITS,IFPRNT,IFPNCH
 1521 FORMAT(7H NUMITS,I3,8H  IFPRNT,15I2,8H  IFPNCH,15I2)
      IF(IFWAVE.EQ.0)GO TO 1560
      WRITE(6,1536)WBEGIN,DELTAW,NUMNU
 1536 FORMAT(7H0WBEGIN,F11.4,9H   DELTAW,F7.4,8H   NUMNU,I5)
      GO TO 1575
 1560 WRITE(6,1561)FREQID,NUMNU,NULO,NUHI
 1561 FORMAT(8H0FREQID ,6A1,8H   NUMNU,I4,7H   NULO,I4,7H   NUHI,I4)
      NN=(NUMNU+3)/4
      NNN=NUMNU-NN*3
      IF(NNN.LT.1)NN=1
      IF(NNN.LT.1)NNN=1
      WRITE(6,1563)((NU,FRESET(NU),RCOSET(NU),NU=I,NUMNU,NN),I=1,NNN)
 1563 FORMAT((4(I6,1P2E13.6)))
      IF(NN.EQ.NNN)GO TO 1575
      NNN=NNN+1
      WRITE(6,1564)((NU,FRESET(NU),RCOSET(NU),NU=I,NUMNU,NN),I=NNN,NN)
 1564 FORMAT((3(I6,1P2E13.6)))
      SUM=0.
      DO 9500 NU=NULO,NUHI
 9500 SUM=SUM+RCOSET(NU)
      PRINT 9501,SUM
 9501 FORMAT(1PE13.6)
C
 1575 CONTINUE
      WRITE(6,1576)(J,RHOX(J),T(J),P(J),XNE(J),ABROSS(J),PRAD(J),
     1VTURB(J),(BHYD(J,I),I=1,6),BMIN(J),J=1,NRHOX)
 1576 FORMAT(1H1/////9X,4HRHOX,9X,1HT,8X,1HP,8X,3HXNE,6X,6HABROSS,
     1 5X,4HPRAD,6X,5HVTURB,23X,4HBHYD,25X,4HBMIN/
     2(I4,1PE13.6,0PF9.1,1P5E10.3,0P7F8.4))
C
      RETURN
C************
 1600 MIAC=IWORDF(CARD)
C     ON
      IF(MIAC.EQ.569)GO TO 1610
C     OFF
      IF(MIAC.EQ.20763)GO TO 1620
C     LINES
      IF(MIAC.EQ.22965179)GO TO 1630
      GO TO 9000
 1610 IFSCAT=1
      GO TO 97
 1620 IFSCAT=0
      GO TO 97
 1630 IFSCAT=1
      NUMCOL=LETCOL
      TAUSCAT=FREEFF(CARD)
      GO TO 97
C************
 1700 IF(MODE.NE.20)CALL EXIT
      NRHOX=0
      RETURN
C************
 1800 DO 1801 I=1,74
      III=CARD(I+6)
      ITITLE(2*I)=(1H )
 1801 ITITLE(2*I-1)=III
C 1801 TITLE(I)=CARD(I+6)
      GO TO 98
C************
 1900 MIAC=IWORDF(CARD)
C     ON
      IF(MIAC.EQ.569)GO TO 1910
C     OFF
      IF(MIAC.EQ.20763)GO TO 1920
C     OVER
      IF(MIAC.EQ.790116)GO TO 1930
      GO TO 9000
 1910 IFCONV=1
      NUMCOL=LETCOL
      MIXLTH=FREEFF(CARD)
      GO TO 97
 1920 IFCONV=0
      MIXLTH=1.
      DO 1921 J=1,NRHOX
      DLTDLP(J)=0.
      HEATCP(J)=0.
      DLRDLT(J)=0.
      VELSND(J)=0.
      GRDADB(J)=0.
      HSCALE(J)=0.
      FLXCNV(J)=0.
 1921 VCONV(J)=0.
      GO TO 97
 1930 IFCONV=1
      NUMCOL=LETCOL
      MIXLTH=FREEFF(CARD)
      OVERWT=FREEFF(CARD)
      GO TO 97
C************
 2000 MIAC=IWORDF(CARD)
C     ON
      IF(MIAC.EQ.569)GO TO 2010
C     OFF
      IF(MIAC.EQ.20763)GO TO 2020
      GO TO 9000
 2010 IFTURB=1
      NUMCOL=LETCOL
      TRBFDG=FREEFF(CARD)
      TRBPOW=FREEFF(CARD)
      TRBSND=FREEFF(CARD)
      TRBCON=FREEFF(CARD)
      GO TO 97
 2020 IFTURB=0
      TRBFDG=0.
      TRBPOW=0.
      TRBSND=0.
      TRBCON=0.
      GO TO 97
C************
 2100 NNEW=FREEFF(CARD)
      DO 2101 J=1,NNEW
 2101 RHOXA(J)=FREEFR(CARD)
      IDUM=MAP1(RHOX,T,NRHOX,RHOXA,DUM1,NNEW)
      IDUM=MAP1(RHOX,P,NRHOX,RHOXA,DUM2,NNEW)
      IDUM=MAP1(RHOX,XNE,NRHOX,RHOXA,DUM3,NNEW)
      IDUM=MAP1(RHOX,ABROSS,NRHOX,RHOXA,DUM4,NNEW)
      IDUM=MAP1(RHOX,VTURB,NRHOX,RHOXA,DUM5,NNEW)
      IDUM=MAP1(RHOX,PRAD,NRHOX,RHOXA,DUM6,NNEW)
      IDUM=MAP1(RHOX,BMIN,NRHOX,RHOXA,DUM7,NNEW)
      DO 2102 J=1,NNEW
      T(J)=DUM1(J)
      P(J)=DUM2(J)
      XNE(J)=DUM3(J)
      ABROSS(J)=DUM4(J)
      VTURB(J)=DUM5(J)
      PRAD(J)=DUM6(J)
      PRADK(J)=PRAD(J)+PRADK0
 2102 BMIN(J)=DUM7(J)
      DO 2105 I=1,6
      IDUM=MAP1(RHOX,BHYD(1,I),NRHOX,RHOXA,DUM1,NNEW)
      DO 2104 J=1,NNEW
 2104 BHYD(J,I)=DUM1(J)
 2105 CONTINUE
      NRHOX=NNEW
      DO 2106 J=1,NRHOX
 2106 RHOX(J)=RHOXA(J)
      GO TO 97
C************
 2200 NUM=FREEFF(CARD)
      NULO=FREEFF(CARD)
      NUHI=FREEFF(CARD)
      LETCOL=NUMCOL
      MIAC=IWORDF(CARD)
      NUMNU=NUM
      DO 2201 I=1,6
 2201 FREQID4(2*I-1)=WORD(I)
C     BIG
      IF(MIAC.EQ.3078)GO TO 2210
C     LITTLE
      IF(MIAC.EQ.850035822)GO TO 2220
      GO TO 9000
C     FREQUENCY SET BIG
C     NUMNU=337 IS CURRENT, NUMNU=331 IS OLD AND WILL WORK
 2210 DO 2211 NU=1,NUMNU
 2211 FRESET(NU)=2.997925E17/FRESET(NU+5)
      DO 2212 NU=2,NUMNU-1
 2212 RCOSET(NU)=(FRESET(NU-1)-FRESET(NU+1))/2.
      RCOSET(1)=(2.997925E17/8.97666-FRESET(2))/2.
      RCOSET(NUMNU)=FRESET(NUMNU-1)/2.
      GO TO 98
C     FREQUENCY SET LITTLE
C     NUMNU=1221 IS CURRENT, NUMNU=1215 IS OLD AND WILL WORK
 2220 DO 2221 NU=1,NUMNU
 2221 FRESET(NU)=2.997925E17/FRESET(NU+342)
      DO 2222 NU=2,NUMNU-1
 2222 RCOSET(NU)=(FRESET(NU-1)-FRESET(NU+1))/2.
      RCOSET(1)=(2.997925E17/8.97666-FRESET(2))/2.
      RCOSET(NUMNU)=FRESET(NUMNU-1)/2.
      GO TO 98
C************
 2300 MIAC=IWORDF(CARD)
C     INTENSITY
      IF(MIAC.EQ.651354309)GO TO 2310
C     FLUX
      IF(MIAC.EQ.321147)GO TO 2320
C     OFF
      IF(MIAC.EQ.20763)GO TO 2330
      GO TO 9000
 2310 NMU=FREEFF(CARD)
      DO 2311 MU=1,NMU
 2311 ANGLE(MU)=FREEFR(CARD)
      IFSURF=2
      GO TO 97
 2320 IFSURF=1
      GO TO 97
 2330 IFSURF=0
      GO TO 97
C************
 2400 MIAC=IWORDF(CARD)
C     ON
      IF(MIAC.EQ.569)GO TO 2410
C     OFF
      IF(MIAC.EQ.20763)GO TO 2420
      GO TO 9000
 2410 IFPRES=1
      GO TO 97
 2420 IFPRES=0
      GO TO 97
C************
 2500 MIAC=IWORDF(CARD)
C     ON
      IF(MIAC.EQ.569)GO TO 2510
C     OFF
      IF(MIAC.EQ.20763)GO TO 2520
      GO TO 9000
 2510 IFCORR=1
      GO TO 97
 2520 IFCORR=0
      DO 2521 J=1,kw
      FLXERR(J)=0.
 2521 FLXDRV(J)=0.
      GO TO 97
C************
 2600 WBEGIN=FREEFF(CARD)
      DELTAW=FREEFF(CARD)
      WEND=FREEFF(CARD)
      IFWAVE=1
      NULO=1
      NUHI= INT(ABS(WEND-WBEGIN)/ABS(DELTAW)+.5)+1
      NUMNU=NUHI
      IF(WBEGIN.LT.1.E7)GO TO 97
      IF(WBEGIN.GT.1.E20)GO TO 2610
C     FREQUENCY STEPS
      WBEGIN=2.997925E17/WBEGIN
      DELTAW=2.997925E17/DELTAW
      WEND=2.997925E17/WEND
      GO TO 97
C     WAVENUMBER STEPS SCALE BY 1.E25
 2610 WBEGIN=1.E7/(WBEGIN/1.E25)
      DELTAW=1.E7/(DELTAW/1.E25)
      WEND=1.E7/(WEND/1.E25)
      GO TO 97
C************
C     SCALING MODELS OR CHANGING RHOX SPACING TO BE UNIFORM IN TAUROS
 2700 KRHOX=FREEFF(CARD)
      TAU1LG=FREEFF(CARD)
      STEPLG=FREEFF(CARD)
      MORE=1
      TEFF1=FREEFF(CARD)
      GNEW=FREEFF(CARD)
      IF(GNEW.LT.10.)GNEW=EXP10(GNEW)
      MORE=0
      DO 2701 J=1,KRHOX
 2701 TAUSTD(J)=EXP10(TAU1LG+DFLOAT(J-1)*STEPLG)
      CALL INTEG(RHOX,ABROSS,TAUROS,NRHOX,ABROSS(1)*RHOX(1))
      TAUROS(1)=MIN(TAUROS(1),TAUSTD(1))
      IDUM=MAP1(TAUROS,RHOX,NRHOX,TAUSTD,DUM1,KRHOX)
      IDUM=MAP1(TAUROS,T,NRHOX,TAUSTD,DUM2,KRHOX)
      IDUM=MAP1(TAUROS,P,NRHOX,TAUSTD,DUM3,KRHOX)
      IDUM=MAP1(TAUROS,XNE,NRHOX,TAUSTD,DUM4,KRHOX)
      IDUM=MAP1(TAUROS,ABROSS,NRHOX,TAUSTD,DUM5,KRHOX)
      IDUM=MAP1(TAUROS,PRAD,NRHOX,TAUSTD,DUM6,KRHOX)
      IDUM=MAP1(TAUROS,VTURB,NRHOX,TAUSTD,DUM7,KRHOX)
      IDUM=MAP1(TAUROS,BMIN,NRHOX,TAUSTD,DUM8,KRHOX)
      DO 2702 J=1,KRHOX
      RHOX(J)=DUM1(J)
      T(J)=DUM2(J)
      P(J)=DUM3(J)
      XNE(J)=DUM4(J)
      ABROSS(J)=DUM5(J)
      PRAD(J)=DUM6(J)
      PRADK(J)=PRAD(J)+PRADK0
      VTURB(J)=DUM7(J)
 2702 BMIN(J)=DUM8(J)
      DO 2704 I=1,6
      IDUM=MAP1(TAUROS,BHYD(1,I),NRHOX,TAUSTD,DUM1,KRHOX)
      DO 2703 J=1,KRHOX
 2703 BHYD(J,I)=DUM1(J)
 2704 CONTINUE
      NRHOX=KRHOX
      IF(TEFF1.EQ.0.)GO TO 97
      IF(TEFF1.EQ.TEFF.AND.GNEW.EQ.GRAV)GO TO 97
      IF(TEFF1.LT.TEFF+1.AND.TEFF1.GT.TEFF-1..AND.
     1GNEW.LT.GRAV*1.001.AND.GNEW.GT.GRAV*.999)GO TO 97
      DO 2710 J=1,NRHOX
      TAUROS(J)=TAUSTD(J)
      T(J)=T(J)*TEFF1/TEFF
      PTURB(J)=0.
      PRADK(J)=PRADK(J)*(TEFF1/TEFF)**4
 2710 PRAD(J)=PRAD(J)*(TEFF1/TEFF)**4
      PRADK0=PRADK0*(TEFF1/TEFF)**4
      PZERO=PCON+PRADK0+PTURB0
      TEFF=TEFF1
      FLUX=5.6697E-5/12.5664*TEFF**4
      GRAV=GNEW
      GLOG=DLOG10(GRAV)
      CALL TTAUP(T,TAUROS,ABROSS,PTOTAL,P,PRAD,PTURB,
     1VTURB,GRAV,NRHOX)
      DO 2711 J=1,NRHOX
      RHOX(J)=PTOTAL(J)/GRAV
 2711 PTOTAL(J)=PTOTAL(J)+PZERO
C2711 RHOX(J)=PTOTAL(J)/GRAV
      GO TO 97
C************
 2800 CALL DUMMYR
      GO TO 97
C************
 2900 VNEW=FREEFF(CARD)
C     VTURB IN CM/S
      DO 2901 J=1,NRHOX
 2901 VTURB(J)=VNEW
      GO TO 97
C************
C     SMOOTH TEMPERTURE DISTRIBUTION
 3000 J1=FREEFF(CARD)
      J2=FREEFF(CARD)
      WTJM1=FREEFF(CARD)
      WTJ=FREEFF(CARD)
      WTJP1=FREEFF(CARD)
      DO 3001 J=J1,J2
 3001 TSMOOTH(J)=WTJM1*T(J-1)+WTJ*T(J)+WTJP1*T(J+1)
      DO 3002 J=J1,J2
 3002 T(J)=TSMOOTH(J)
      GO TO 97
      END
      SUBROUTINE DUMMYR
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     DUMMY INPUT ROUTINE FOR MODIFYING READIN
C
C
      RETURN
      END
      FUNCTION FREEFR(CARD)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREE/WORD(6),NUMCOL,LETCOL,LAST,MORE,IFFAIL,MAXPOW
      INTEGER CARD(1),WORD
      MORE=1
      FREEFR=FREEFF(CARD)
      IF(IFFAIL.EQ.0)RETURN
      L=LAST-1
      READ(5,1)(CARD(I),I=1,L)
    1 FORMAT(80A1)
      NUMCOL=1
      FREEFR=FREEFF(CARD)
      RETURN
      END
      FUNCTION FREEFF(CARD)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREE/WORD(6),NUMCOL,LETCOL,LAST,MORE,IFFAIL,MAXPOW
      DIMENSION CARD(1)
      DIMENSION A(10)
      INTEGER CARD,A,C,QPT,QCM,QMI,QE,QPL,QBL,WORD
      DATA A/1H0,1H1,1H2,1H3,1H4,1H5,1H6,1H7,1H8,1H9/
      DATA QPT/1H./,QCM/1H,/,QMI/1H-/,QE/1HE/,QPL/1H+/,QBL/1H /
      IFFAIL=0
      IF(NUMCOL.GT.LAST)GO TO 3002
      ANSWER=0.
      ASIGN=1.
      ISIGN=1
      NPT=0
      IF0=0
      N=0
      ASSIGN 100 TO NSWCH
      DO 1000 NCOL=NUMCOL,LAST
      C=CARD(NCOL)
      GO TO NSWCH,(100,200,300,400)
  100 IF(C.EQ.QBL)GO TO 104
      DO 101 I=1,10
      IF(C.EQ.A(I))GO TO 102
  101 CONTINUE
      IF(C.EQ.QPT)GO TO 103
      IF(C.EQ.QCM)GO TO 104
      IF(C.EQ.QMI)GO TO 105
  999 ASIGN=1.
      ANSWER=0.
      NPT=0
      IF0=0
      N=0
      ASSIGN 100 TO NSWCH
      GO TO 1000
  102 N=N+1
      ANSWER=10.*ANSWER+DFLOAT(I-1)
      GO TO 1000
  103 ASSIGN 200 TO NSWCH
      GO TO 1000
  104 IF(N.EQ.0)GO TO 999
      FREEFF=ANSWER*ASIGN
      GO TO 998
  105 IF(N.EQ.0)GO TO 106
      GO TO 999
  106 ASIGN=-1.
      GO TO 1000
  200 DO 201 I=1,10
      IF(C.EQ.A(I))GO TO 202
  201 CONTINUE
      IF(C.EQ.QE )GO TO 203
      IF(C.EQ.QMI)GO TO 304
      IF(C.EQ.QPL)GO TO 303
      IF(C.EQ.QBL)GO TO 204
      IF(C.EQ.QCM)GO TO 204
      GO TO 999
  202 N=N+1
      NPT=NPT+1
      ANSWER=10.*ANSWER+DFLOAT(I-1)
      GO TO 1000
  203 ASSIGN 300 TO NSWCH
      GO TO 1000
  204 IF(N.EQ.0)GO TO 999
      FREEFF=ANSWER*ASIGN/10.**NPT
      GO TO 998
  300 DO 301 I=1,10
      IF(C.EQ.A(I))GO TO 302
  301 CONTINUE
      IF(C.EQ.QBL)GO TO 303
      IF(C.EQ.QMI)GO TO 304
      IF(C.EQ.QPL)GO TO 303
      GO TO 999
  302 NPOWER=I-1
      IF0=1
  310 ASSIGN 400 TO NSWCH
      GO TO 1000
  303 NPOWER=0
      GO TO 310
  304 ISIGN=-1
      NPOWER=0
      GO TO 310
  400 DO 401 I=1,10
      IF(C.EQ.A(I))GO TO 402
  401 CONTINUE
      IF(C.EQ.QCM)GO TO 403
      IF(C.EQ.QBL)GO TO 403
      GO TO 999
  402 NPOWER=10*NPOWER+I-1
      IF0=1
      IF(NPOWER.GE.MAXPOW)GO TO 999
      GO TO 1000
  403 IF(IF0.EQ.0)GO TO 999
      FREEFF=ANSWER*ASIGN*10.**(ISIGN*NPOWER-NPT)
      GO TO 998
 1000 CONTINUE
      NUMCOL=LAST+1
 3002 IFFAIL=1
      IF(MORE.GT.0)GO TO 3000
      WRITE(6,3001)(CARD(I),I=1,LAST)
 3001 FORMAT(28H1FREEFF HAS READ OFF THE END/(1X80A1))
      CALL EXIT
 3000 FREEFF=0.
      RETURN
  998 NUMCOL=NCOL+1
      RETURN
      END
      FUNCTION IWORDF(CARD)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREE/WORD(6),NUMCOL,LETCOL,LAST,MORE,IFFAIL,MAXPOW
      DIMENSION CARD(1)
      DIMENSION A(36)
      EQUIVALENCE (QE,A(5))
      INTEGER CARD,A,C,WORD,QPT,QCM,QEQ,QBL,QE
      DATA A/1HA,1HB,1HC,1HD,1HE,1HF,1HG,1HH,1HI,1HJ,1HK,1HL,1HM,1HN,
     11HO,1HP,1HQ,1HR,1HS,1HT,1HU,1HV,1HW,1HX,1HY,1HZ,1H0,1H1,1H2,1H3,
     21H4,1H5,1H6,1H7,1H8,1H9/
      DATA QPT/1H./,QCM/1H,/,QEQ/1H=/,QBL/1H /
      DO 1 I=1,6
    1 WORD(I)=QBL
      IFFAIL=0
      IF(LETCOL.GT.LAST)GO TO 4002
      N=0
C     (M)ACHINE (I)NDEPENDENT (A)LPHAMERIC (C)ODE
      MIAC=0
      ASSIGN 500 TO NSWCH
      DO 2000 NCOL=LETCOL,LAST
      C=CARD(NCOL)
      GO TO NSWCH,(500,600)
  500 IF(C.EQ.QBL)GO TO 1999
      DO 501 II=1,26
      IF(C.EQ.A(II))GO TO 502
  501 CONTINUE
 1999 MIAC=0
      N=0
      ASSIGN 500 TO NSWCH
      GO TO 2000
  502 IF(C.NE.QE )GO TO 506
      IF(NCOL.EQ.1)GO TO 506
      C=CARD(NCOL-1)
      DO 503 I=27,36
      IF(C.EQ.A(I))GO TO 504
  503 CONTINUE
      IF(C.NE.QPT)GO TO 506
  504 C=CARD(NCOL+1)
      DO 505 I=27,36
      IF(C.EQ.A(I))GO TO 1999
  505 CONTINUE
      IF(C.EQ.QBL)GO TO 1999
  506 N=N+1
      MIAC=II
      WORD(1)=A(II)
      ASSIGN 600 TO NSWCH
      GO TO 2000
  600 IF(C.EQ.QBL)GO TO 603
      IF(C.EQ.QEQ)GO TO 603
      IF(C.EQ.QCM)GO TO 603
      DO 601 II=1,36
      IF(C.EQ.A(II))GO TO 602
  601 CONTINUE
      GO TO 1999
  602 N=N+1
      IF(N.GT.6)GO TO 604
      MIAC=37*MIAC+II
      WORD(N)=A(II)
  604 GO TO 2000
  603 IWORDF=MIAC
      GO TO 998
 2000 CONTINUE
      LETCOL=LAST+1
 4002 IFFAIL=1
      IF(MORE.GT.0)GO TO 4000
      WRITE(6,4001)(CARD(I),I=1,LAST)
 4001 FORMAT(28H1IWORDF HAS READ OFF THE END/(1X80A1))
      CALL EXIT
 4000 IWORDF=0
      RETURN
  998 LETCOL=NCOL+1
      RETURN
      END
      SUBROUTINE READMOL
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION XCODE(8)
C     COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /IFEQUA/IFEQUA(101),KCOMPS(450),LOCJ(161),CODE(160),
     1               EQUIL(6,160),IDEQUA(25),NEQUA,NUMMOL,NLOC
C     COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DATA MAXMOL,MAX1,MAXEQ,MAXLOC/160,161,25,450/
C     EQUILJ(MAXMOL),LOCJ(MAX1),KCOMPS(MAXLOC)
C     XNZ(40,MAXEQ)
C     EQUIL(6,MAXMOL)
C     EQ(MAXEQ),XN(MAXEQ),XAB(MAXEQ),DTERM(MAXEQ),DEQ(MAXEQ,MAXEQ)
C     EQOLD(MAXEQ)
C     IDEQUA(MAXEQ)
C     CODE(MAXMOL),XNMOL(40,MAXMOL)
      DATA XCODE/1.E14,1.E12,1.E10,1.E8,1.E6,1.E4,1.E2,1.E0/
C     MAKE TABLE OF ALL COMPONENTS OF ALL MOLECULES
C     SAMPLE CODES FOR ATOMS AND MOLECULES
C                     EXTERNAL CODE    INTERNAL COMPONENTS
C     CARBON DIOXIDE    60808.         6,8,8
C     HMINUS            100.           1,100
C     NEUTRAL IRON      26.            26
C     H2PLUS            101.01         1,1,101
C     HYDROGEN ION      1.01           1,101
C     SILICON 3+        14.03          14,101,101,101
C      IF(ITEMP.GT.0)RETURN
C      IF(IFMOL.EQ.0)RETURN
C      IF(IFPRES.EQ.0)RETURN
      OPEN(UNIT=2,STATUS='OLD',SHARED,READONLY)
      WRITE(6,10)
   10 FORMAT(16H1MOLECULES INPUT)
      DO 11 I=1,101
   11 IFEQUA(I)=0
C     IF IFEQUA=1 AN EQUATION MUST BE SET UP FOR ELEMENT I
      KLOC=1
      LOCJ(1)=1
      DO 20 JMOL=1,MAX1
      IF(KLOC.GT.MAXLOC)WRITE(6,199)
      READ(2,13)C,E1,E2,E3,E4,E5,E6
   13 FORMAT(F18.2,F7.3,5E11.4)
      IF(C.EQ.0.)GO TO 23
      WRITE(6,14)JMOL,C,E1,E2,E3,E4,E5,E6
   14 FORMAT(I5,F18.2,F7.3,1P5E11.4)
      DO 15 II=1,8
      IF(C.GE.XCODE(II))GO TO 16
   15 CONTINUE
      CLOSE(UNIT=2)
      CALL EXIT
   16 X=C
      DO 17 I=II,8
      ID=X/XCODE(I)+.5
      X=X-DFLOAT(ID)*XCODE(I)
      IF(ID.EQ.0)ID=100
      IFEQUA(ID)=1
      KCOMPS(KLOC)=ID
   17 KLOC=KLOC+1
      ION=X*100.+.5
      IF(ION.LT.1)GO TO 19
      IFEQUA(100)=1
      IFEQUA(101)=1
      DO 18 I=1,ION
      KCOMPS(KLOC)=101
   18 KLOC=KLOC+1
   19 LOCJ(JMOL+1)=KLOC
      CODE(JMOL)=C
      EQUIL(1,JMOL)=E1
      EQUIL(2,JMOL)=E2
      EQUIL(3,JMOL)=E3
      EQUIL(4,JMOL)=E4
      EQUIL(5,JMOL)=E5
   20 EQUIL(6,JMOL)=E6
      WRITE(6,199)
  199 FORMAT(19H1TOO MANY MOLECULES)
   23 NUMMOL=JMOL-1
      NLOC=KLOC-1
C     ASSIGN AN EQUATION NUMBER TO EACH COMPONENT
C     THE FIRST EQUATION IS FOR THE TOTAL NUMBER OF PARTICLES
C     THE FIRST VARIABLE IS XNATOM
C     IF ANY COMPONENT IS 100 OR 101 VARIABLE NEQUA IS XNE
C         AND EQUATION NEQUA IS CHARGE CONSERVATION
C     FOR  PROGRAMMING CONVENIENCE VARIABLE NEQUA1 IS INVERSE XNE
C     DIMENSIONS ARE SET FOR A MAXIMUM 25 EQUATIONS
      IEQUA=1
      DO 25 I=1,100
      IF(IFEQUA(I).EQ.0)GO TO 25
      IEQUA=IEQUA+1
      IFEQUA(I)=IEQUA
      IDEQUA(IEQUA)=I
   25 CONTINUE
      NEQUA=IEQUA
      NEQUA1=NEQUA+1
      IFEQUA(101)=NEQUA1
      NEQNEQ=NEQUA**2
      DO 28 KLOC=1,NLOC
      ID=KCOMPS(KLOC)
   28 KCOMPS(KLOC)=IFEQUA(ID)
      WRITE(6,29) NUMMOL,MAXMOL,NLOC,MAXLOC,NEQUA,MAXEQ
   29 FORMAT(16H MOLECULES  USED,I4,5H  MAX,I4/
     1       16H COMPONENTS USED,I4,5H  MAX,I4/
     2       16H EQUATIONS  USED,I4,5H  MAX,I4)
      CLOSE(UNIT=2)
      RETURN
      END
      SUBROUTINE POPS(CODE,MODE,NUMBER)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION NUMBER(kw,1)
      REAL*8 NUMBER
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /XABUND/XABUND(99),WTMOLE
      DATA ITEMP1/0/
      IF(IFMOL.EQ.1)GO TO 200
      IF(IFPRES.EQ.1.AND.ITEMP.NE.ITEMP1)CALL NELECT
      ITEMP1=ITEMP
      IF(CODE.EQ.0.)RETURN
      IF(CODE.LT.100.)GO TO 110
      WRITE(6,106)
  106 FORMAT(14H1MOLECULES OFF)
      CALL EXIT
  110 IZ=CODE
      NION=(CODE-DFLOAT(IZ))*100.+1.5
      DO 115 J=1,NRHOX
      CALL PFSAHA(J,IZ,NION,MODE,NUMBER)
C     PFSAHA RETURNS IONIZATION FRACTIONS OR IONIZATION FRACTIONS/
C        PARTITION FUNCTIONS SO CONVERT TO NUMBER DENSITIES
      NNNN=NION
      IF(MODE.LT.10)NNNN=1
      DO 115 ION=1,NNNN
  115 NUMBER(J,ION)=NUMBER(J,ION)*XNATOM(J)*XABUND(IZ)
      RETURN
  200 IF(IFPRES.EQ.1.AND.ITEMP.NE.ITEMP1)CALL NMOLEC(MODE)
      ITEMP1=ITEMP
      IF(CODE.EQ.0.)RETURN
      CALL MOLEC(CODE,MODE,NUMBER)
      RETURN
      END
      SUBROUTINE NELECT
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /EDENS/EDENS(kw),IFEDNS
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /XABUND/XABUND(99),WTMOLE
      DIMENSION ELEC(kw),E(10),X(10),MASK(10),NELEMZ(10),NIONZ(10)
      DIMENSION XNUMB(kw,3),PFPLUS(13),PFMIN(13),EION(7)
      EQUIVALENCE (ELEC(1),XNUMB(1,1)),(PFPLUS(7),EION(1))
      DATA NELEMZ/1,2,6,11,12,13,14,19,20,26/
      DATA NIONZ/2,3,2,2,2,2,2,2,2,2/,NZ/10/
      IF(ITER.LT.NUMITS)GO TO 406
      IF(IFEDNS.EQ.1)GO TO 407
      DO 401 I=1,NZ
      NELEM=NELEMZ(I)
  401 E(I)=ELEM(NELEM)
      WRITE(6,402)(E(I),I=1,NZ),(E(I),I=1,NZ)
  402 FORMAT(1H1////50X,22HELECTRON CONTRIBUTIONS/3X,20(4X,A2))
  406 XNE(1)=P(1)/TK(1)/2.
  407 DO 500 J=1,NRHOX
      IF(J.GT.1.AND.IFEDNS.EQ.0)XNE(J)=XNE(J-1)*P(J)/P(J-1)
      XNTOT=P(J)/TK(J)
      XNATOM(J)=XNTOT-XNE(J)
      DO 1 I=1,NZ
    1 MASK(I)=1
      DO 20 L=1,200
      XNENEW=0.
      DO 11 I=1,NZ
      IF(MASK(I).EQ.0)GO TO 11
      IZ=NELEMZ(I)
      NION=NIONZ(I)
      CALL PFSAHA(J,IZ,NION,4,ELEC)
      E(I)=ELEC(J)
      X(I)=ELEC(J)*XNATOM(J)*XABUND(IZ)
      XNENEW=XNENEW+X(I)
   11 CONTINUE
      XNENEW=(XNENEW+XNE(J))/2.
      ERROR=ABS((XNE(J)-XNENEW)/XNENEW)
      XNE(J)=XNENEW
      XNATOM(J)=XNTOT-XNE(J)
      IF(ERROR.LT..0005)GO TO 400
      IF(J.EQ.1)GO TO 20
      X1=.00001*XNE(J)
      IF(ERROR.LT..05)X1=X1*10.
      DO 12 I=1,NZ
      IF(X(I).LT.X1)MASK(I)=0
   12 CONTINUE
   20 CONTINUE
      WRITE(6,250)
  250 FORMAT(22H XNE DOES NOT CONVERGE)
      CALL EXIT
  400 RHO(J)=XNATOM(J)*WTMOLE*1.660E-24
      IF(IFEDNS.EQ.0)GO TO 33
      EDENS(J)=1.5*XNTOT*TK(J)
      DO 411 I=1,NZ
      IZ=NELEMZ(I)
      NION=NIONZ(I)
      T(J)=T(J)*1.001
      TK(J)=TK(J)*1.001
      TKEV(J)=TKEV(J)*1.001
      CALL PFSAHA(J,IZ,NION,5,PFPLUS)
      T(J)=T(J)/1.001*.999
      TK(J)=TK(J)/1.001*.999
      TKEV(J)=TKEV(J)/1.001*.999
      CALL PFSAHA(J,IZ,NION,5,PFMIN)
      T(J)=T(J)/.999
      TK(J)=TK(J)/.999
      TKEV(J)=TKEV(J)/.999
      CALL PFSAHA(J,IZ,NION,12,XNUMB)
      DO 410 ION=1,NION
      XNUMB(J,ION)=XNUMB(J,ION)*XNATOM(J)*XABUND(IZ)
  410 EDENS(J)=EDENS(J)+XNUMB(J,ION)*TK(J)*(EION(ION)/TKEV(J)+
     1(PFPLUS(ION)-PFMIN(ION))/(PFPLUS(ION)+PFMIN(ION))*2.*500.)
  411 CONTINUE
      EDENS(J)=EDENS(J)/RHO(J)
      GO TO 500
   33 IF(ITER.LT.NUMITS)GO TO 500
      DO 403 I=1,NZ
  403 X(I)=X(I)/XNE(J)
      WRITE(6,404)J,(X(I),I=1,NZ),(E(I),I=1,NZ)
  404 FORMAT(I4,20F6.3)
  500 CONTINUE
      RETURN
      END
      SUBROUTINE PFSAHA(J,IZ,NION,MODE,ANSWER)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     MODE 1 RETURNS IONIZATION FRACTION /PARTITION FUNCTION
C     MODE 2 RETURNS IONIZATION FRACTION
C     MODE 3 RETURNS PARTITION FUNCTION
C     MODE 4 RETURNS NUMBER OF ELECTRONS PRODUCED
C     MODE 5 RETURNS ANSWER(ION)=PF   ANSWER(ION+7)=IP
C     MODE + 10 RETURN ALL IONS TO NION.   MODE ALONE RETURN NION ONLY.
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /POTION/POTION(999)
      DIMENSION ANSWER(kw,31),F(31),IP(31),PART(31),POTLO(31),fsave(31)
      dimension LOCZ(29)
      REAL*8 IP
      DIMENSION SCALE(4)
      DIMENSION EHYD(6),EHE1(29),EHE2(6),EC1(14),EMG1(11),EAL1(9),
     1ESI1(11),EC2(6),EMG2(6),EAL2(1),ESI2(6),ECA1(8),ECA2(5),ENA1(8),
     2EO1(13),EB1(7),EK1(8)
      DIMENSION GHYD(6),GHE1(29),GHE2(6),GC1(14),GMG1(11),GAL1(9),
     1GSI1(11),GC2(6),GMG2(6),GAL2(1),GSI2(6),GCA1(8),GCA2(5),GNA1(8),
     2GO1(13),GB1(7),GK1(8)
      DIMENSION NNN(6,374)
      DIMENSION NNN01(54),NNN02(54),NNN03(54),NNN04(54),NNN05(54)
      DIMENSION NNN06(54),NNN07(54),NNN08(54),NNN09(54),NNN10(54)
      DIMENSION NNN11(54),NNN12(54),NNN13(54),NNN14(54),NNN15(54)
      DIMENSION NNN16(54),NNN17(54),NNN18(54),NNN19(54),NNN20(54)
      DIMENSION NNN21(54),NNN22(54),NNN23(54),NNN24(54),NNN25(54)
      DIMENSION NNN26(54),NNN27(54),NNN28(54),NNN29(54),NNN30(54)
      DIMENSION NNN31(54),NNN32(54),NNN33(54),NNN34(54),NNN35(54)
      DIMENSION NNN36(54),NNN37(54),NNN38(54),NNN39(54),NNN40(12)
      EQUIVALENCE (NNN(   1),NNN01(1)),(NNN(  55),NNN02(1))
      EQUIVALENCE (NNN( 109),NNN03(1)),(NNN( 163),NNN04(1))
      EQUIVALENCE (NNN( 217),NNN05(1)),(NNN( 271),NNN06(1))
      EQUIVALENCE (NNN( 325),NNN07(1)),(NNN( 379),NNN08(1))
      EQUIVALENCE (NNN( 433),NNN09(1)),(NNN( 487),NNN10(1))
      EQUIVALENCE (NNN( 541),NNN11(1)),(NNN( 595),NNN12(1))
      EQUIVALENCE (NNN( 649),NNN13(1)),(NNN( 703),NNN14(1))
      EQUIVALENCE (NNN( 757),NNN15(1)),(NNN( 811),NNN16(1))
      EQUIVALENCE (NNN( 865),NNN17(1)),(NNN( 919),NNN18(1))
      EQUIVALENCE (NNN( 973),NNN19(1)),(NNN(1027),NNN20(1))
      EQUIVALENCE (NNN(1081),NNN21(1)),(NNN(1135),NNN22(1))
      EQUIVALENCE (NNN(1189),NNN23(1)),(NNN(1243),NNN24(1))
      EQUIVALENCE (NNN(1297),NNN25(1)),(NNN(1351),NNN26(1))
      EQUIVALENCE (NNN(1405),NNN27(1)),(NNN(1459),NNN28(1))
      EQUIVALENCE (NNN(1513),NNN29(1)),(NNN(1567),NNN30(1))
      EQUIVALENCE (NNN(1621),NNN31(1)),(NNN(1675),NNN32(1))
      EQUIVALENCE (NNN(1729),NNN33(1)),(NNN(1783),NNN34(1))
      EQUIVALENCE (NNN(1837),NNN35(1)),(NNN(1891),NNN36(1))
      EQUIVALENCE (NNN(1945),NNN37(1)),(NNN(1999),NNN38(1))
      EQUIVALENCE (NNN(2053),NNN39(1)),(NNN(2107),NNN40(1))
      DIMENSION NNN67(78),NNN88(48)
      EQUIVALENCE (NNN(2119),NNN67(1)),(NNN(2197),NNN88(1))
C      ( 1)( 2)   ( 3)( 4)   ( 5)( 6)   ( 7)( 8)   ( 9)(10)   ( IP ) G  REF
      DATA NNN01/
     1 200020001, 200020011, 201620881, 231228281, 378953411,  1359502, D+F 1.00
     2 100010001, 100010001, 100010001, 100010001, 100010001,  1359500, G   1.01
     3 100010001, 100010011, 102111241, 145022061, 363059451,  2458104, D+F 2.00
     4 200020001, 200020071, 208524971, 382669341, 128222452,  5440302, D+F 2.01
     5 100010001, 100010001, 100010001, 100010001, 100010001,  5440300, G   2.02
     6 200020011, 201220481, 212922881, 258731081, 394251691,   538901, D+F 3.00
     7 100010001, 100010201, 126225521,  67216512, 351165562,  7561907, D+F 3.01
     8 200020001, 200020211, 227936571,  69610342, 137217102, 12241800, D+F 3.02
     9 100010001, 100010001, 100010001, 100010001, 100010001, 12241800/ G   3.03
      DATA NNN02/
     1 100010051, 104311441, 131615641, 190623681, 298037691,   931900, AEL 4.00
     2 200120231, 211422771, 249627631, 309034911, 398545051,  1820600, AEL 4.01
     3 100010001, 100010201, 126225521,  67216512, 351165562, 15385000, AEL 4.02
     4 200020001, 200020011, 201220661, 223426161, 332644691, 21765700, AEL 4.03
     5 600060001, 600560281, 608761991, 637466191, 693973361,   829500, AEL 5.00
     6 100310831, 132016901, 214226411, 315736741, 419147071,  2514900, AEL 5.01
     7 200721061, 233526401, 297533311, 369040481, 440747651,  3792000, AEL 5.02
     8 100010001, 100010001, 100010001, 100010001, 100010001, 25929800, G   5.03
     9 893292271,  96110042, 105311262, 126315202, 196126432,  1125508/ D+F 6.00
      DATA NNN03/
     1 595060251, 620865751, 713280191,  95712292, 167623542,  2437501, D+F 6.01
     2 105513201, 180324851, 341851341,  88416332, 296550722,  4787101, D+F 6.02
     3 204922771, 262630421, 350941931, 494556971, 644872001,  6447600, D+F 6.03
     4 403141851, 457051681, 594071181,  92913362, 203331152,  1452915, D+F 7.00
     5 919899541, 107211512, 124914302, 182526232, 403762662,  2959202, D+F 7.01
     6 596862721, 684177081,  88110342, 128317062, 239334312,  4742501, D+F 7.02
     7 112816481, 240733751, 462068491, 116419932, 283736822,  7744900, D+F 7.03
     8 210124681, 293634211, 391145791, 539862151, 703178471,  9786200, D+F 7.04
     9 874789691, 924795711,  99410492, 115213492, 169022242,  1361307/ D+F 8.00
      DATA NNN04/
     1 424151091, 622874781,  91312832, 221842502,  79914013,  3510711, D+F 8.01
     2  95610702, 118113032, 149619922, 329761642, 101914173,  5488500, D+F 8.02
     3 603567171, 775391141, 106612482, 143716252, 181420032,  7739300, D+F 8.03
     4 124420321, 306943181, 606281181, 101712232, 142916342, 11387300, D+F 8.04
     5 215026541, 323137551, 421546491, 508255151, 594863811, 13807900, AEL 8.05
     6 575958511, 589859231, 595860671, 636470031, 815199581,  1741802, D+F 9.00
     7 900296401, 102610802, 113912542, 152921152, 318348952,  3498003, D+F 9.01
     8 469162651, 791295541, 121419552, 402686872, 154822203,  6264500, D+F 9.02
     9  99511422, 129214572, 170523002, 320140922, 498458762,  8713900/ D+F 9.03
      DATA NNN05/
     1 615472711,  87710602, 127215002, 172919582, 218624152, 11421300, D+F 9.04
     2 135324181, 377252001, 661580261,  94410852, 122613672, 15711700, AEL 9.05
     3 100010001, 100010051, 105313051, 210239461,  74013022,  2155808, D+F10.00
     4 580158751, 591759741, 642687101, 159332652,  64111533,  4106907, D+F10.01
     5  93510272, 110411662, 127116062, 257647882,  75110223,  6350000, D+F10.02
     6 529774371,  94611322, 135816202, 188221442, 240626682,  9701900, D+F10.03
     7 103312152, 140616092, 181320182, 222224262, 263128352, 12630000, AEL10.04
     8 629178711,  98311802, 136715512, 173619202, 210422892, 15790900, AEL10.05
     9 200020001, 200320211, 207322131, 253031421, 417657451,   513802/ D+F11.00
      DATA NNN06/
     1 100010001, 100010161, 119621261,  50711872, 246445382,  4728901, D+F11.01
     2 580158751, 591860351,  71813142, 321968812, 106014333,  7165000, D+F11.02
     3  96910772, 116012242, 130714232, 153916552, 177118872,  9888000, D+F11.03
     4 601386081, 108812932, 148916832, 187820722, 226624612, 13836900, AEL11.04
     5 105712442, 144616652, 189221182, 234425702, 279630222, 17209000, AEL11.05
     6 100010011, 101410621, 118414581, 204831781, 509479731,   764404, D+F12.00
     7 200120051, 202921001, 226926901, 368457091,  92814872,  1503101, D+F12.01
     8 100010001, 100110611, 177455431, 176546012,  99718753,  8011905, D+F12.02
     9 579758751, 591459501, 600560591, 611461681, 622362781, 10928900/ AEL12.03
      DATA NNN07/
     1 100611232, 120612752, 134214102, 147815462, 161416822, 14122900, AEL12.04
     2 674896701, 121814462, 167018942, 211723412, 256527892, 18648900, AEL12.05
     3 558857701, 583558761, 593260591, 635969541, 796790971,   598400, D+F13.00
     4 100310211, 110313021, 172828201,  55311252, 215637942,  1882203, D+F13.01
     5 200320201, 208622331, 250530971, 410251081, 611571211,  2844000, D+F13.02
     6 100010001, 100210881, 207436531, 523168101, 838999681, 11996000, D+F13.03
     7 577758651, 591259631, 604461351, 622563161, 640764981, 15377000, AEL13.04
     8 103511582, 124713242, 140014772, 155316292, 170517812, 19042000, AEL13.05
     9 825189211,  95210052, 106211532, 134317202, 237934082,   814913/ D+F14.00
      DATA NNN08/
     1 563057761, 588160311, 631768671, 791097651, 127817282,  1634000, D+F14.01
     2 101110771, 126716471, 232438081,  71914052, 262045302,  3346001, D+F14.02
     3 200720521, 217224081, 284439171, 551370951,  86810262,  4513000, D+F14.03
     4 100010001, 100210881, 207436531, 523168101, 838999681, 16672900, FAK14.04
     5 575458521, 591459851, 610063201, 672674071, 843698661, 20510900, AEL14.05
     6 402643441, 496757481, 658274401, 833492941, 103511532,  1048300, AEL15.00
     7 874497931, 106011282, 119812802, 138415142, 164717802,  1972000, AEL15.01
     8 564058061, 604164611, 709579551,  90410172, 112912422,  3015500, AEL15.02
     9 100811411, 149720221, 280936121, 441552181, 602168241,  5135400/ AEL15.03
      DATA NNN09/
     1 200420781, 227025361, 281430911, 336936471, 392542021,  6500700, AEL15.04
     2 100010001, 100010001, 100010001, 100010001, 100010001, 22041300, G  15.05
     3 822887891, 930697831, 102610932, 121614492, 185124742,  1035708, D+F16.00
     4 443056011, 694982961,  96911522, 144218572, 227326892,  2339900, D+F16.01
     5  91610392, 113512242, 136416942, 233429882, 364242962,  3500000, D+F16.02
     6 560058861, 633871081,  82410062, 123314602, 168619132,  4728900, D+F16.03
     7 104512901, 177025421, 375163021, 122420462, 286036742,  7250000, D+F16.04
     8 202321571, 241428261, 358355061,  78310152, 124814802,  8802800, D+F16.05
     9 538155931, 571657911, 598067191,  89013782, 227737172,  1300916/ D+F17.00
      DATA NNN10/
     1 873396771, 104411072, 118513532, 175525872, 406763932,  2379903, D+F17.01
     2 506569571,  87610522, 134421682, 439092662, 182132573,  3990006, D+F17.02
     3  95110872, 120013232, 154921252, 345149322, 641378942,  5350000, D+F17.03
     4 558960371, 677779341,  95311692, 138816082, 182720472,  6780000, D+F17.04
     5 100010001, 100010051, 106913911, 240147261,  90716112,  1575411, D+F18.00
     6 550256831, 578158781, 636585461, 151530162,  58010303,  2762007, D+F18.01
     7  92110362, 112412002, 133216772, 254443722,  76512833,  4090003, D+F18.02
     8 582082081, 103112292, 149920212, 309750502, 720793642,  5978900, D+F18.03
     9  97111072, 123213982, 172625622, 463976582, 106413633,  7500000/ D+F18.04
      DATA NNN11/
     1 200020011, 200720361, 211923291, 280137141, 525575741,   433803, D+F19.00
     2 100010001, 100110341, 135929551,  79119282, 405274892,  3180905, D+F19.01
     3 554657081, 581260301,  73012702, 285363872, 129023363,  4600005, D+F19.02
     4  96010862, 118413212, 180836632,  90321023, 416863253,  6090000, D+F19.03
     5 657793361, 119515082, 195826322, 352944302, 533162332,  8259900, D+F19.04
     6 100110061, 104311741, 145919971, 294345051,  69010322,   611003, D+F20.00
     7 205822781, 279234761, 427553061, 688994901, 136319772,  1186701, D+F20.01
     8 100010001, 100510821, 168744821, 130232522,  69012813,  5121003, D+F20.02
     9 555157161, 585662471,  82816862,  42510013, 168423663,  6700000/ D+F20.03
      DATA NNN12/
     1  99411262, 123814062, 182930402, 484766392,  84310223,  8438900, D+F20.04
     2 924696691, 105212282, 151219062, 240530032, 368944512,   653900, AEL21.00
     3 190424662, 297634542, 391743752, 482952832, 573761912,  1280000, AEL21.01
     4 976799291, 101110322, 105810882, 111911502, 118112122,  2475000, AEL21.02
     5 100010001, 100510821, 168744821, 130232522,  69012813,  7390000, FAK21.03
     6 555157161, 585662471,  82816862,  42510013, 168423663,  9200000, FAK21.04
     7 181021172, 260333222, 430155582, 710089242, 110213293,   681900, D+F22.00
     8 474659872, 721284672,  98211413, 134515623, 177919963,  1356900, D+F22.01
     9 228327012, 308134272, 381143862, 534563472, 734983512,  2747000/ D+F22.02
      DATA NNN13/
     1 971498311,  99210032, 102610572, 108711172, 114711782,  4324000, D+F22.03
     2 100010001, 100510821, 168744821, 130232522,  69012813,  9980000, FAK22.04
     3 272835172, 425851532, 632278322,  97212013, 146817723,   674000, AEL23.00
     4 373954132, 743597002, 121414713, 173920143, 229225713,  1464900, AEL23.01
     5 323142642, 519660272, 679975352, 824789522,  96610363,  2930900, AEL23.02
     6 248329302, 324234952, 373439752, 421744582, 469949412,  4800000, AEL23.03
     7 970698231, 990699881, 100710152, 102410322, 104010482,  6500000, AEL23.04
     8 717277611,  92911652, 152620872, 295141952, 550468122,   676400, D+F24.00
     9  71611552, 205635512, 558281952, 115315823, 205625293,  1649000/ D+F24.01
      DATA NNN14/
     1 280639822, 538369722,  87610823, 129115003, 170919183,  3095000, D+F24.02
     2 377150952, 616070292, 791788382,  97610683, 116012523,  5000000, D+F24.03
     3 264730962, 341436462, 394042872, 463549832, 533056782,  7300000, D+F24.04
     4 600060321, 629270891,  86911302, 151020222, 267534752,   743100, AEL25.00
     5 739594821, 139921212, 309342852, 567372412,  97112553,  1563600, AEL25.01
     6  98417472, 265535782, 454754842, 641973532, 828792212,  3369000, AEL25.02
     7 328847052, 586668342, 771785912,  94710343, 112112093,  5300000, AEL25.03
     8 422055132, 636770792, 779285062, 921999322, 106411363,  7600000, AEL25.04
     9 197023222, 274433302, 416753952, 723799822, 139419053,   787038/ D+F26.00
      DATA NNN15/
     1 409453722, 686687452, 110213823, 174322233, 286437043,  1617902, D+F26.01
     2 262136422, 501167232,  87911303, 138916483, 190721673,  3064300, D+F26.02
     3  98723522, 420363072,  87011423, 145117913, 215925463,  5700000, AEL26.03
     4 388854482, 666275742, 846693572, 102511143, 120312923,  7900000, D+F26.04
     5 199427202, 335740022, 474957182, 708090462, 118315403,   786000, D+F27.00
     6 279739202, 490858232, 684582472, 104713233, 159818733,  1704900, D+F27.01
     7 279836622, 461857562, 720693022, 124915873, 192522633,  3349000, D+F27.02
     8 262136422, 501167232,  87911303, 138916483, 190821673,  5300000, FAK27.03
     9  98723522, 420363072,  87011423, 145117913, 215925463,  8300000/ FAK27.04
      DATA NNN16/
     1 227027622, 306233052, 356839222, 446052912, 652382292,   763314, D+F28.00
     2 108416342, 222428472, 353944332, 577378932, 110314303,  1814900, D+F28.01
     3 198724282, 293236452, 468362702,  86511123, 136016073,  3516000, D+F28.02
     4 279836622, 461857562, 720693022, 124915873, 192522633,  5600000, FAK28.03
     5 262136422, 501167232,  87911303, 138916483, 190721673,  7900000, FAK28.04
     6 201620781, 231026761, 314737361, 450555381, 692386911,   772301, D+F29.00
     7 109415761, 247938311,  58910042, 190937022,  68311693,  2028903, D+F29.01
     8 897195961, 107212972, 165021182, 260230862, 356940532,  3682900, D+F29.02
     9 100010001, 100410231, 108712611, 167124841, 388460411,   939102/ D+F30.00
      DATA NNN17/
     1 200020021, 201620761, 223726341, 351352061,  80812472,  1796001, D+F30.01
     2 100610471, 122617301, 300566361, 149924112, 332342352,  3970000, D+F30.02
     3 403245601, 493151431, 529654331, 559358091, 611065171,   600000, AEL31.00
     4  99710051, 104511541, 135016501, 208226431, 321837921,  2050900, AEL31.01
     5 199820071, 204521391, 229124761, 266028451, 302932131,  3070000, AEL31.02
     6 502665261, 755183501, 901496201, 102410942, 117912812,   787900, AEL32.00
     7 422848161, 512153401, 557458941, 636270361, 794489061,  1593000, AEL32.01
     8 100010261, 114613921, 175221251, 249828711, 324436181,  3421000, AEL32.02
     9 403143241, 491856701, 649173781, 840396751, 113013392,   981000/ AEL33.00
      DATA NNN18/
     1 593676641, 884697521, 105911572, 129515012, 180322212,  1858700, AEL33.01
     2 484470541,  91510972, 125614082, 157017612, 199722912,  2829900, AEL33.02
     3 630172361, 799686381, 919797221, 102810942, 117712832,   975000, AEL34.00
     4 438055511, 691582151,  94510732, 121413672, 152016732,  2150000, AEL34.01
     5 651982921,  94610382, 113212492, 139515462, 169718482,  3200000, AEL34.02
     6 437347431, 498951671, 538559501,  74710812, 169126672,  1183910, D+F35.00
     7 705183611,  93510092, 111614162, 222932532, 427652992,  2160000, D+F35.01
     8 510869921,  87410312, 123116552, 236530712, 377744832,  3590000, D+F35.02
     9 100010001, 100010051, 105012781, 198535971,  65911422,  1399507/ D+F36.00
      DATA NNN19/
     1 461049811, 522254261, 609088131, 168935052,  68612253,  2455908, D+F36.01
     2 759990901, 101911142, 129017782, 302856642,  99414333,  3690000, D+F36.02
     3 200020011, 200720361, 211523021, 269434141, 459163351,   417502, D+F37.00
     4 100010001, 100110321, 129524961,  61014202, 291753192,  2750004, D+F37.01
     5 473650891, 533156051,  66810932, 232950852,  99915303,  4000000, D+F37.02
     6 100110041, 104111741, 146019721, 281941411, 607785251,   569202, D+F38.00
     7 202621931, 255331271, 384347931, 624085761, 122417632,  1102600, D+F38.01
     8 100010001, 100110321, 129524961,  61014202, 291753192,  4300000, FAK38.02
     9 791587851, 100012192, 155119942, 254031782, 389946932,   637900/ AEL39.00
      DATA NNN20/
     1 118217102, 220827002, 319036792, 416646512, 513256072,  1223000, AEL39.01
     2  92510012, 104710862, 112311612, 120212472, 132814282,  2050000, AEL39.02
     3 141320802, 291439702, 531170262,  92712273, 162521053,   684000, D+F40.00
     4 354454352, 724689652, 107212643, 148517093, 193321573,  1312900, D+F40.01
     5 209727032, 324537052, 415446282, 510255752, 604965222,  2298000, D+F40.02
     6 256636022, 465759302, 749693962, 116514243, 171520333,   687900, AEL41.00
     7 335157222,  84511463, 147718363, 221826083, 299933893,  1431900, AEL41.01
     8 223725352, 280830972, 340937362, 406844002, 473150632,  2503900, AEL41.02
     9 703972941,  82610822, 154822682, 327244912, 571469372,   709900/ D+F42.00
      DATA NNN21/
     1  75714552, 274347322, 718897632, 123414913, 174920063,  1614900, D+F42.01
     2 267645462, 669890262, 115514323, 173620673, 242528083,  2714900, AEL42.02
     3  90613732, 184823562, 291735332, 419949102, 565764332,   728000, AEL43.00
     4 131318312, 227126932, 311735452, 397644072, 483852692,  1525900, AEL43.01
     5 204721673, 234725733, 284031463, 348738613, 426546943,  3000000, AEL43.02
     6 176824122, 318941082, 515263202, 761790472, 106112303,   736400, AEL44.00
     7 221934642, 501968372,  88911173, 136316243, 189221613,  1675900, AEL44.01
     8 210622722, 241025422, 267928262, 297731272, 327834282,  2846000, AEL44.02
     9 148520202, 255230902, 364942462, 489656082, 638872352,   746000/ AEL45.00
      DATA NNN22/
     1 153421292, 288137912, 484660322, 720187062, 101011483,  1807000, AEL45.01
     2 254537212, 492362292, 770592182, 107312243, 137615273,  3104900, AEL45.02
     3 115919651, 320746011, 607576761,  95011642, 141817172,   832900, AEL46.00
     4 755087211, 105913442, 173122222, 282034722, 412247732,  1941900, AEL46.01
     5 180223462, 289735212, 414247632, 538460052, 662672472,  3292000, AEL46.02
     6 200020001, 200220141, 206422141, 257633021, 455164681,   757403, D+F47.00
     7 100810581, 125817401, 260641031,  66210072, 135316982,  2148000, D+F47.01
     8 795887491,  97711762, 156620252, 248329422, 340038582,  3481900, D+F47.02
     9 100010001, 100410241, 109212891, 176827421, 444268771,   899003/ D+F48.00
      DATA NNN23/
     1 200020021, 201720921, 233329881, 451475371, 127520782,  1690301, D+F48.01
     2 100310281, 114815371, 246138311, 519265531, 791492761,  3747000, D+F48.02
     3 252431921, 368440461, 433746521, 512259221, 723389021,   578400, D+F49.00
     4 100110071, 104611651, 146118581, 225426511, 304734431,  1886000, D+F49.01
     5 200120111, 205021611, 243628031, 317035371, 390442701,  2802900, D+F49.02
     6 232637101, 488058571, 669074381, 816189091,  97210632,   734200, AEL50.00
     7 286335941, 408144471, 479351961, 571862901, 686274341,  1462700, AEL50.01
     8 100010251, 114013811, 175321601, 256829751, 338337901,  3049000, AEL50.02
     9 404043481, 494656811, 646772781, 813490751, 101411372,   863900/ AEL51.00
      DATA NNN24/
     1 303147981, 618472951, 827392621, 103711702, 131214532,  1650000, AEL51.01
     2 313037601, 429347901, 536260591, 689477591, 862494881,  2529900, AEL51.02
     3 526258801, 657372351, 784284071, 897095741, 102711082,   900900, AEL52.00
     4 440855541, 686481251,  93810792, 125414792, 176321132,  1860000, AEL52.01
     5 349054751, 699883081,  96611302, 134216202, 197724212,  2800000, AEL52.02
     6 405342041, 438645621, 475751071, 587974491, 102214572,  1045404, D+F53.00
     7 568567471, 773485861,  94510362, 112712182, 130914002,  1909000, D+F53.01
     8 514269581,  86910562, 130716652, 215327742, 351843662,  3200000, AEL53.02
     9 100010001, 100010091, 109515351, 291060661, 119621482,  1212716/ D+F54.00
      DATA NNN25/
     1 414844131, 465649111, 538464651,  87112232, 158019362,  2120000, D+F54.01
     2 615475101, 867797531, 112213462, 157618062, 203622662,  3209900, D+F54.02
     3 200020001, 201020501, 215623871, 283536181, 462756261,   389300, D+F55.00
     4 100010001, 100310371, 119016501, 269146361,  77912412,  2510000, D+F55.01
     5 424445601, 481750061, 516953311, 549356551, 581759791,  3500000, D+F55.02
     6 101210791, 135119351, 282340571, 574580391, 111015062,   521002, D+F56.00
     7 262638611, 504160621, 698579371,  91010692, 129115952,  1000000, D+F56.01
     8 100010001, 100310351, 118416321, 264945521,  76512182,  3700000, FAK56.02
     9  71111992, 172323592, 312540402, 510763182, 765791012,   558000/ AEL57.00
      DATA NNN26/
     1 204529582, 383647882, 582469262, 807992692, 104911723,  1106000, AEL57.01
     2  94712552, 148416582, 179819212, 203621522, 227424042,  1916900, AEL57.02
     3 295959132, 103515693, 215527593, 335939413, 449650223,   565000, AEL58.00
     4  79718153, 289639443, 495159253, 686877533, 863794813,  1085000, AEL58.01
     5 298640242, 475053692, 596965912, 725379692, 872094692,  2008000, AEL58.02
     6 460693672, 158523823, 327242303, 519661563, 709379783,   541900, FAK59.00
     7 455480232, 114014653, 178521013, 240927073, 299232633,  1055000, AEL59.01
     8  46410533, 183826893, 354443773, 518459633, 674375243,  2320000, AEL59.02
     9 139623042, 364860002,  96114603, 209828633, 373446973,   549000/ AEL60.00
      DATA NNN27/
     1 460493692, 158523823, 327142303, 519661563, 709279783,  1073000, AEL60.01
     2 455480232, 114014653, 178521013, 240927073, 299232633,  2000000, FAK60.02
     3 131720482, 280535692, 441254492, 676583972, 103412583,   555000, AEL61.00
     4 139623042, 364860002,  96114603, 209828633, 373446973,  1089900, FAK61.01
     5 460493682, 158523823, 327142303, 519661563, 709279783,  2000000, FAK61.02
     6  92915672, 222431062, 444763802,  89612173, 159520253,   562900, AEL62.00
     7 315059662,  97114563, 204627093, 342541693, 490556383,  1106900, AEL62.01
     8 269037812, 520270372,  91111273, 133915483, 172719093,  2000000, AEL62.02
     9 800080571, 851699301, 127617362, 240433032, 444958442,   568000/ AEL63.00
      DATA NNN28/
     1 125416052, 211828182, 375549622, 644381732, 101112213,  1125000, AEL63.01
     2 800080571, 851699301, 127617362, 240433032, 444958442,  2000000, FAK63.02
     3 240432982, 427555202, 708489962, 112613853, 167319843,   615900, AEL64.00
     4 534793262, 139219123, 247730843, 371043333, 495055893,  1210000, AEL64.01
     5 364145232, 514756362, 604864112, 673870372, 732276072,  2000000, AEL64.02
     6 480767202,  89011393, 144118243, 230028753, 354142883,   584900, AEL65.00
     7 480767192,  89011393, 144118243, 230028753, 354142883,  1151900, FAK65.01
     8 480767202,  89011393, 144118243, 230028753, 354142883,  2000000, FAK65.02
     9 343147532, 645887152, 115314793, 183322063, 257729373,   593000/ FAK66.00
      DATA NNN29/
     1 343147532, 645887142, 115314793, 183322063, 257729373,  1167000, AEL66.01
     2 343147532, 645887142, 115314793, 183322063, 257729373,  2000000, FAK66.02
     3 222635002, 542276772, 100312353, 145716713, 187020703,   602000, FAK67.00
     4 222635002, 542276772, 100312353, 145716713, 187020703,  1180000, FAK67.01
     5 222635002, 542276772, 100312353, 145716713, 187020703,  2000000, AEL67.02
     6 133715382, 209130152, 429859382,  79410293, 129815983,   609900, AEL68.00
     7 265934782, 497877532, 120517733, 245032063, 400448073,  1193000, AEL68.01
     8 265934782, 497877532, 120517733, 245032063, 400448073,  2000000, FAK68.02
     9 800381111,  87510702, 147621462, 310343462, 585475982,   618000/ AEL69.00
      DATA NNN30/
     1 156718872, 279244452, 678196342, 128316243, 197823443,  1205000, AEL69.01
     2  93517192, 364666132, 103414613, 192624193, 293334613,  2370000, AEL69.02
     3 100010011, 101310651, 118613951, 169120661, 250629971,   625000, AEL70.00
     4 200120901, 270345231,  81714042, 223533112, 461959862,  1217000, AEL70.01
     5 100312561, 250851931,  91914182, 198626022, 323638692,  2000000, AEL70.02
     6 514664441, 759086851,  99211442, 133315612, 182721252,   609900, AEL71.00
     7 125924831, 438667801,  98714112, 199727872, 380850742,  1389900, AEL71.01
     8 323948621, 661297271, 158626482, 426865032,  93712843,  1900000, AEL71.02
     9 659294081, 128016962, 222528952, 372047062, 585171462,   700000/ AEL72.00
      DATA NNN31/
     1  99117882, 274638812, 520867322,  84410313, 123314453,  1489900, AEL72.01
     2 187427702, 343739872, 448049452, 539358282, 625266642,  2329900, AEL72.02
     3  65210892, 171325762, 373552252, 705192012, 116414343,   787900, AEL73.00
     4 192837842, 600784802, 111113823, 165419233, 218524383,  1620000, AEL73.01
     5  99117872, 274638812, 520867312,  84410313, 123314453,  2400000, FAK73.02
     6 398981651, 130019172, 273438022, 516168382,  88411163,   797900, AEL74.00
     7 131429482, 523279952, 111414623, 183422233, 262130233,  1770000, AEL74.01
     8 192837842, 600784792, 111113823, 165419233, 218524383,  2500000, FAK74.02
     9 600963001,  75910412, 150121572, 301940972, 539168952,   787000/ AEL75.00
      DATA NNN32/
     1  73710852, 190731262, 464964142,  83810503, 127315053,  1660000, AEL75.01
     2 131429482, 523279952, 111414623, 183422233, 262130233,  2600000, FAK75.02
     3 110815502, 216829732, 398752322, 672484682, 104612673,   850000, AEL76.00
     4 168225972, 362046562, 566766422, 757484612,  93010103,  1700000, AEL76.01
     5  73710852, 190731262, 464964142,  83810503, 127315053,  2700000, FAK76.02
     6 129117892, 239430882, 388748292, 596173252,  89510843,   910000, AEL77.00
     7 110815502, 216829732, 398752322, 672484682, 104612673,  2000000, FAK77.01
     8 168225972, 362046562, 566766422, 757484612,  93010103,  2800000, FAK77.02
     9 158918512, 207523002, 254328242, 316335762, 407246582,   900000/ AEL78.00
      DATA NNN33/
     1  98115462, 224930742, 401150612, 623475412,  89910583,  1855900, AEL78.01
     2 110815502, 216829732, 398752322, 672484682, 104612673,  2900000, FAK78.02
     3 203222611, 265731251, 364042301, 494958601, 702084731,   922000, AEL79.00
     4 120521331, 357753801,  75310062, 130516572, 206925452,  2050000, AEL79.01
     5 651780821, 108814772, 195925252, 316338622, 460853882,  3000000, AEL79.02
     6 100010001, 100110111, 105211851, 152122101, 341552811,  1043002, D+F80.00
     7 200320211, 210023021, 268834231, 480472341, 111416912,  1875000, D+F80.01
     8 104012871, 186129471, 458664151,  82410072, 119013732,  3420000, D+F80.02
     9 200420711, 222424271, 265429161, 325637371, 442853911,   610500/ AEL81.00
      DATA NNN34/
     1 100010021, 101910801, 121414641, 189525811, 358949721,  2041900, AEL81.01
     2 200020311, 216624611, 296337451, 489064791,  85711212,  2979900, AEL81.02
     3 103411711, 147819101, 244331781, 434862751,  93113762,   741404, D+F82.00
     4 204122231, 248227841, 311535621, 429153941, 651976431,  1502800, D+F82.01
     5 100210131, 106812201, 154522671, 381665951,  95512512,  3192900, D+F82.02
     6 400140351, 416944121, 474851591, 564362181, 690477231,   728700, AEL83.00
     7 106814451, 204427341, 350744811, 586879131, 108314772,  1667900, AEL83.01
     8 205523051, 264830231, 345439921, 469156001, 675281671,  2555900, AEL83.02
     9 500950661, 518153561, 559058941, 628968071, 748483501,   843000/ AEL84.00
      DATA NNN35/
     1 443756241, 696282451,  95411012, 128615262, 182922012,  1900000, FAK84.01
     2 336953201, 682481011,  93810882, 127915272, 184622442,  2700000, FAK84.02
     3 402841621, 431544771, 463148311, 520059491, 734896851,   930000, FAK85.00
     4 576168741, 788387631,  96910642, 116012552, 135014462,  2000000, FAK85.01
     5 490265341, 812797201, 116614322, 179622692, 285035302,  2900000, FAK85.02
     6 100010001, 100010031, 102311051, 133018071, 264539391,  1074500, AEL86.00
     7 402841621, 431544771, 463148311, 520059491, 734996851,  2000000, FAK86.01
     8 576168741, 788387631,  96910642, 116012552, 135014462,  3000000, FAK86.02
     9 200020011, 201220591, 218124481, 296538611, 488859141,   400000/ FAK87.00
      DATA NNN36/
     1 100010001, 100010031, 102311051, 133018071, 264539401,  2200000, FAK87.01
     2 421645151, 477449611, 511852711, 542455761, 572958821,  3300000, FAK87.02
     3 100010041, 105212131, 153220271, 270435641, 460258111,   527600, AEL88.00
     4 201221791, 258131471, 381645781, 546365131, 777592781,  1014400, AEL88.01
     5 100010001, 100010031, 102311051, 133018071, 264539391,  3400000, FAK88.02
     6 510064491,  82710872, 142718412, 232328712, 348341572,   690000, AEL89.00
     7 228951571,  88513232, 183324132, 305537492, 448152402,  1210000, AEL89.01
     8 723989131, 103511752, 130814352, 155416652, 177018682,  2000000, AEL89.02
     9 620099241, 162725772, 391457072,  80110833, 141818023,   600000/ AEL90.00
      DATA NNN37/
     1 620099241, 162725772, 391457072,  80110833, 141818023,  1200000, FAK90.01
     2 620099251, 162725772, 391457072,  80110833, 141818023,  2000000, FAK90.02
     3 347877992, 129318323, 240730533, 380546863, 570368573,   600000, AEL91.00
     4 347877992, 129318323, 240730533, 380546863, 570368573,  1200000, FAK91.01
     5 347777992, 129318323, 240730533, 380546863, 570368573,  2000000, FAK91.02
     6 209530092, 450866762,  96613623, 186524763, 318839893,   600000, AEL92.00
     7 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK92.01
     8 209530092, 450866762,  96613623, 186524763, 318839893,  2000000, FAK92.02
     9 209530092, 450866762,  96613623, 186524763, 318839893,   600000/ FAK93.00
      DATA NNN38/
     1 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK93.01
     2 209530092, 450866762,  96613623, 186524763, 318839893,  2000000, FAK93.02
     3 209530092, 450866762,  96613623, 186524763, 318839893,   600000, FAK94.00
     4 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK94.01
     5 209530092, 450866762,  96613623, 186524763, 318839893,  2000000, FAK94.02
     6 209530092, 450866762,  96613623, 186524763, 318839893,   600000, FAK95.00
     7 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK95.01
     8 209530092, 450866762,  96613623, 186524763, 318839893,  2000000, FAK95.02
     9 209530092, 450866762,  96613623, 186524763, 318839893,   600000/ FAK96.00
      DATA NNN39/
     1 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK96.01
     2 209530092, 450866762,  96613623, 186524763, 318839893,  2000000, FAK96.02
     3 209530092, 450866762,  96613623, 186524763, 318839893,   600000, FAK97.00
     4 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK97.01
     5 209530092, 450866762,  96613623, 186524763, 318839893,  2000000, FAK97.02
     6 209530092, 450866762,  96613623, 186524763, 318839893,   600000, FAK98.00
     7 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK98.01
     8 209530092, 450866762,  96613623, 186524763, 318839893,  2000000, FAK98.02
     9 209530092, 450866762,  96613623, 186524763, 318839893,   600000/ FAK99.00
      DATA NNN40/
     1 209530092, 450866762,  96613623, 186524763, 318839893,  1200000, FAK99.01
     2 209530092, 450866762,  96613623, 186524763, 318839893,  2000000/ FAK99.02
      DATA NNN67/
     1 893292271,  96110042, 105311262, 126315202, 196126432,  1125508, D+F 6.00
     2 595060251, 620865751, 713280191,  95712292, 167623542,  2437501, D+F 6.01
     3 105513201, 180324851, 341851341,  88416332, 296550722,  4787101, D+F 6.02
     4 204922771, 262630421, 350941931, 494556971, 644872001,  6447600, D+F 6.03
     5 100010001, 100010001, 100010001, 100010001, 100010001, 39207700, G   6.04
     6 200020001, 200020001, 200020001, 200020001, 200020001, 48998100, G   6.05
     7 403141851, 457051681, 594071181,  92913362, 203331152,  1452915, D+F 7.00
     8 919899541, 107211512, 124914302, 182526232, 403762662,  2959202, D+F 7.01
     9 596862721, 684177081,  88110342, 128317062, 239334312,  4742501, D+F 7.02
     T 112816481, 240733751, 462068491, 116419932, 283736822,  7744900, D+F 7.03
     1 210124681, 293634211, 391145791, 539862151, 703178471,  9786200, D+F 7.04
     2 100010001, 100010001, 100010001, 100010001, 100010001, 55205700, G   7.05
     3 200020001, 200020001, 200020001, 200020001, 200020001, 66702900/ G   7.06
      DATA NNN88/
     1 874789691, 924795711,  99410492, 115213492, 169022242,  1361307, D+F 8.00
     2 424151091, 622874781,  91312832, 221842502,  79914013,  3510711, D+F 8.01
     3  95610702, 118113032, 149619922, 329761642, 101914173,  5488500, D+F 8.02
     4 603567171, 775391141, 106612482, 143716252, 181420032,  7739300, D+F 8.03
     5 124420321, 306943181, 606281181, 101712232, 142916342, 11387300, D+F 8.04
     6 215026541, 323137551, 421546491, 508255151, 594863811, 13807900, AEL 8.05
     7 100010001, 100010001, 100010001, 100010001, 100010001, 73927400, G   8.06
     8 200020001, 200020001, 200020001, 200020001, 200020001, 87138700/ G   8.07
      DATA EHYD/0.,82259.105,97492.302,102823.893,105291.651,106632.160/
      DATA GHYD/2.,8.,18.,32.,50.,72./
      DATA EHE1/0.,159856.069,166277.546,169087.007,171135.000,
     1 183236.892,184864.936,185564.694,186101.654,186105.065,
     2 186209.471,190298.210,190940.331,191217.14,191444.588,
     3 191446.559,191451.80,191452.08,191492.817,
     4 193347.089,193663.627,193800.78,193917.245,193918.391,
     5 193921.31,193921.37,193922.5,193922.5,193942.57/
      DATA GHE1/1.,3.,1.,9.,3.,3.,1.,9.,15.,5.,3.,3.,1.,9.,15.,5.,21.,
     1 7.,3.,3.,1.,9.,15.,5.,21.,7.,27.,9.,3./
      DATA EHE2/0.,329182.321,390142.359,411477.925,421353.135,
     1 426717.413/
      DATA GHE2/2.,8.,18.,32.,50.,72./
      DATA EB1/10.17,28810.,40039.65,47856.99,48613.01,54767.74,
     1 55010.08/
      DATA GB1/6.,12.,2.,10.,6.,10.,2./
      DATA EC1/29.60,10192.66,21648.02,33735.20,60373.00,61981.82,
     1 64088.85,68856.33,69722.00,70743.95,71374.90,72610.72,73975.91,
     2 75254.93/
      DATA GC1/9.,5.,1.,5.,9.,3.,15.,3.,15.,3.,9.,5.,1.,9./
      DATA EC2/42.48,43035.8,74931.11,96493.74,110652.10,116537.65/
      DATA GC2/6.,12.,10.,2.,6.,2./
      DATA EO1/77.975,15867.862,33792.583,73768.200,76794.978,86629.089,
     1 88630.977,95476.728,96225.049,97420.748,97488.476,99094.065,
     2 99681.051/
      DATA GO1/9.,5.,1.,5.,3.,15.,9.,5.,3.,25.,15.,15.,9./
      DATA ENA1/0.,16956.172,16973.368,25739.991,29172.889,29172.839,
     1 30266.99,30272.58/
      DATA GNA1/2.,2.,4.,2.,6.,4.,2.,4./
      DATA EMG1/0.,21890.854,35051.264,41197.403,43503.333,
     1 46403.065,47847.797,47957.034,49346.729,51872.526,52556.206/
      DATA GMG1/1.,9.,3.,3.,1.,5.,9.,15.,3.,3.,1./
      DATA EMG2/0.,35730.36,69804.95,71490.54,80639.85,92790.51/
      DATA GMG2/2.,6.,2.,10.,6.,2./
      DATA EAL1/74.707,25347.756,29097.11,32436.241,32960.363,
     1 37689.413,38932.139,40275.903,41319.377/
      DATA GAL1/6.,2.,12.,10.,6.,2.,10.,6.,14./
      DATA ESI1/149.681,6298.850,15394.370,33326.053,39859.920,
     1 40991.884,45303.310,47284.061,47351.554,48161.459,49128.131/
      DATA GSI1/9.,5.,1.,5.,9.,3.,15.,3.,5.,15.,9./
      DATA ESI2/191.55,43002.27,55319.11,65500.73,76665.61,79348.67/
      DATA GSI2/6.,12.,10.,2.,2.,10./
      DATA EK1/0.,12985.170,13042.876,21026.551,21534.680,21536.988,
     1 24701.382,24720.139/
      DATA GK1/2.,2.,4.,2.,6.,4.,2.,4./
      DATA ECA1/0.,15263.089,20356.265,21849.634,23652.304,31539.495,
     1 33317.264,35831.203/
      DATA GCA1/1.,9.,15.,5.,3.,3.,1.,21./
      DATA ECA2/0.,13686.60,25340.10,52166.93,56850.78/
      DATA GCA2/2.,10.,6.,2.,10./
      DATA LOCZ/1,3,6,10,14,18,22,27,33,39,45,51,57,63,69,75,81,86,91,
     196,101,106,111,116,121,126,131,136,141/
      DATA SCALE/.001,.01,.1,1./
C
      MODE1=MODE
      IF(MODE1.GT.10)MODE1=MODE1-10
C     LOWERING OF THE IONIZATION POTENTIAL IN VOLTS FOR UNIT ZEFF
      CHARGE=XNE(J)*2.
      EXCESS=2.*XNE(J)-P(J)/TK(J)
C     ALLOWANCE FOR DOUBLY IONIZED HELIUM
      IF(EXCESS.GT.0.)CHARGE=CHARGE+2.*EXCESS
	if(charge.eq.0)charge=1.
      DEBYE=SQRT(TK(J)/2.8965E-18/CHARGE)
C     DEBYE=SQRT(TK(J)/12.5664/4.801E-10**2/CHARGE)
      POTLOW=DMIN1(1.D0,1.44E-7/DEBYE)
      TV=TKEV(J)
      IF(IZ.LE.28)N=LOCZ(IZ)
      IF(IZ.GT.28)N=3*IZ+54
      IF(IZ.LE.28)NIONS=LOCZ(IZ+1)-N
      IF(IZ.GT.28)NIONS=3
      IF(IZ.EQ.6)N=354
      IF(IZ.EQ.6)NIONS=6
      IF(IZ.EQ.7)N=360
c      IF(IZ.EQ.7)NIONS=6
      IF(IZ.EQ.7)NIONS=7
	if(iz.eq.8)n=367
	if(iz.eq.8)nions=8
	if(iz.ge.20.and.iz.lt.29)nions=10
      NION2=MIN0(NION+2,NIONS)
      N=N-1
C
      DO 18 ION=1,NION2
      Z=ION
      POTLO(ION)=POTLOW*Z
      IF(IZ.LE.30)INDEX=IZ*(IZ+1)/2+ION-1
      IF(IZ.GT.30)INDEX=IZ*5+341+ION-1
      IP(ION)=POTION(INDEX)/8065.479
      IF(IP(ION).EQ.0)IP(ION)=POTION(INDEX-1)/8065.479
C
      IF(IZ.GE.20.AND.IZ.LT.29)THEN
      CALL PFIRON(IZ,ION,TLOG(J)/2.30258509299405,
     1POTLO(ION)*8065.479,PART(ION))
      GO TO 18
      ENDIF
C
      N=N+1
      NNN100=NNN(6,N)/100
c      IP(ION)=DFLOAT(NNN100)/1000.
      G=NNN(6,N)-NNN100*100
c      IF(N.EQ.1)GO TO 16
      IF(N.EQ.1)GO TO 1100
      IF(N.EQ.3)GO TO 1110
      IF(N.EQ.4)GO TO 1120
      IF(N.EQ.354)GO TO 1130
      IF(N.EQ.51)GO TO 1140
      IF(N.EQ.57)GO TO 1150
      IF(N.EQ.63)GO TO 1160
      IF(N.EQ.355)GO TO 1132
      IF(N.EQ.52)GO TO 1142
      IF(N.EQ.64)GO TO 1162
      IF(N.EQ.96)GO TO 1170
      IF(N.EQ.97)GO TO 1172
      IF(N.EQ.27)GO TO 1180
      IF(N.EQ.45)GO TO 1190
      IF(N.EQ.14)GO TO 1200
      IF(N.EQ.91)GO TO 1210
c
      T2000=IP(ION)*2000./11.
      IT=MAX0(1,MIN0(9, INT(T(J)/T2000-.5)))
      DT=T(J)/T2000-DBLE(IT)-.5
      PMIN=1.
      I=(IT+1)/2
      K1=NNN(I,N)/100000
      K2=NNN(I,N)-K1*100000
      K3=K2/10
      KSCALE=K2-K3*10
      IF(MOD(IT,2).EQ.0)GO TO 12
      P1=DBLE(K1)*SCALE(KSCALE)
      P2=DBLE(K3)*SCALE(KSCALE)
      IF(DT.GE.0.)GO TO 13
      IF(KSCALE.GT.1)GO TO 13
      KP1=P1
      IF(KP1.NE. INT(P2+.5))GO TO 13
      PMIN=KP1
      GO TO 13
   12 P1=DBLE(K3)*SCALE(KSCALE)
      K1=NNN(I+1,N)/100000
      KSCALE=MOD(NNN(I+1,N),10)
      P2=DBLE(K1)*SCALE(KSCALE)
   13 PART(ION)=MAX(PMIN,P1+(P2-P1)*DT)
CCCCCCCCCC
      IF(T(J).LT.T2000*1.5)THEN
      NELION=(IZ-1)*6+ION
      IF(PFGROUND(NELION,T(J)).GT.1)PART(ION)=PFGROUND(NELION,T(J))
      GO TO 18
      ENDIF
CCCCCCCCCC
      IF(G.EQ.0..OR.POTLO(ION).LT..1.OR.T(J).LT.T2000*4.)GO TO 18
      IF(T(J).GT.(T2000*11.))TV=(T2000*11.)*8.6171E-5
      D1=.1/TV
   14 D2=POTLO(ION)/TV
      PART(ION)=PART(ION)+G*EXP(-IP(ION)/TV)*(SQRT(13.595*Z*Z/TV/D2)**3*
     1(1./3.+(1.-(.5+(1./18.+D2/120.)*D2)*D2)*D2)-
     2SQRT(13.595*Z*Z/TV/D1)**3*
     3(1./3.+(1.-(.5+(1./18.+D1/120.)*D1)*D1)*D1))
      TV=TKEV(J)
      GO TO 18
c   16 PART(1)=2.*BHYD(J,1)
C      IF(T(J).LT.9000.)GO TO 18
c      PART(1)=PART(1)+8.*BHYD(J,2)*EXP(-10.196/TV)+18.*BHYD(J,3)*
c     1EXP(-12.084/TV)+32.*BHYD(J,4)*EXP(-12.745/TV)+50.*BHYD(J,5)*
c     2EXP(-13.051/TV)+72.*BHYD(J,6)*EXP(-13.217/TV)
c      D1=13.595/6.5/6.5/TV
c      D2=POTLO(1)/TV
c      GO TO 14
 1100 B=BHYD(J,1)
      IF(NLTEON.EQ.-1)B=1.
      PART(1)=2.*B
      IF(T(J).LT.9000.)GO TO 18
      DO 1101 I=2,6
      B=BHYD(J,I)
      IF(NLTEON.EQ.-1)B=1.
 1101 PART(1)=PART(1)+GHYD(I)*B        *EXP(-EHYD(I)*HCKT(J))
      D1=109677.576/6.5/6.5*HCKT(J)
      GO TO 14
c 1110 B=BHE1(J,1)
 1110 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B
      IF(T(J).LT.15000.)GO TO 18
      DO 1111 I=2,29
c      B=BHE1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1111 PART(1)=PART(1)+GHE1(I)*B        *EXP(-EHE1(I)*HCKT(J))
      D1=109677.576/5.5/5.5*HCKT(J)
      GO TO 14
c 1120 B=BHE2(J,1)
 1120 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(2)=2.*B
      IF(T(J).LT.30000.)GO TO 18
      DO 1121 I=2,6
c      B=BHE2(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1121 PART(2)=PART(2)+GHE2(I)*B        *EXP(-EHE2(I)*HCKT(J))
      D1=4.*109722.267/6.5/6.5*HCKT(J)
      GO TO 14
c 1130 B=BC1(J,1)
 1130 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B       *(1.+3.*EXP(-16.42*HCKT(J))+
     1 5.*EXP(-43.42*HCKT(J)))
      DO 1131 I=2,14
c      B=BC1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1131 PART(1)=PART(1)+GC1(I)*B       *EXP(-EC1(I)*HCKT(J))
      PART(1)=PART(1)+108.*EXP(-80000.*HCKT(J))+
     1 189*EXP(-84000.*HCKT(J))+247.*EXP(-87000.*HCKT(J))+
     2 231.*EXP(-88000.*HCKT(J))+190.*EXP(-89000.*HCKT(J))+
     3 300.*EXP(-90000.*HCKT(J))
      GO TO 18
c 1132 B=BC2(J,1)
 1132 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(2)=B*(2.+4.*EXP(-63.42*HCKT(J)))
      DO 1133 I=2,6
c      B=BC2(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1133 PART(2)=PART(2)+GC2(I)*B*EXP(-EC2(I)*HCKT(J))
      PART(2)=PART(2)+6.*EXP(-131731.80*HCKT(J))+
     1 4.*EXP(-142027.1*HCKT(J))+10.*EXP(-145550.13*HCKT(J))+
     2 10.*EXP(-150463.62*HCKT(J))+2.*EXP(-157234.07*HCKT(J))+
     3 6.*EXP(-162500.*HCKT(J))+42.*EXP(-168000.*HCKT(J))+
     4 56.*EXP(-178000.*HCKT(J))+102.*EXP(-183000.*HCKT(J))+
     5 400.*EXP(-188000.*HCKT(J))
      GO TO 18
c 1140 B=BMG1(J,1)
 1140 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B
      DO 1141 I=2,11
c      B=BMG1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1141 PART(1)=PART(1)+GMG1(I)*B        *EXP(-EMG1(I)*HCKT(J))
      PART(1)=PART(1)+5.*EXP(-53134.*HCKT(J))+15.*EXP(-54192.*HCKT(J))+
     1 28.*EXP(-54676.*HCKT(J))+9.*EXP(-57853.*HCKT(J))
      G=4.
      D1=109734.83/4.5/4.5*HCKT(J)
      GO TO 14
c 1142 B=BMG2(J,1)
 1142 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(2)=B*2.
      DO 1143 I=2,6
c      B=BMG2(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1143 PART(2)=PART(2)+GMG2(I)*B        *EXP(-EMG2(I)*HCKT(J))
      PART(2)=PART(2)+10.*EXP(-93310.80*HCKT(J))+
     1 14.*EXP(-93799.70*HCKT(J))+6.*EXP(-97464.32*HCKT(J))+
     2 10.*EXP(-103419.82*HCKT(J))+14.*EXP(-103689.89*HCKT(J))+
     3 18.*EXP(-103705.66*HCKT(J))
      G=2.
      D1=4.*109734.83/5.5/5.5*HCKT(J)
      GO TO 14
c 1150 B=BAL1(J,1)
 1150 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B        *(2.+4.*EXP(-112.061*HCKT(J)))
      DO 1151 I=2,9
c      B=BAL1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1151 PART(1)=PART(1)+GAL1(I)*B        *EXP(-EAL1(I)*HCKT(J))
      PART(1)=PART(1)+10.*EXP(-42235.*HCKT(J))+14.*EXP(-43831.*HCKT(J))
      G=2.
      D1=109735.08/5.5/5.5*HCKT(J)
      GO TO 14
c 1160 B=BSI1(J,1)
 1160 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B        *(1.+3.*EXP(-77.115*HCKT(J))+
     1 5.*EXP(-223.157*HCKT(J)))
      DO 1161 I=2,11
c      B=BSI1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1161 PART(1)=PART(1)+GSI1(I)*B        *EXP(-ESI1(I)*HCKT(J))
      PART(1)=PART(1)+76.*EXP(-53000.*HCKT(J))+71.*EXP(-57000.*HCKT(J))+
     1 191.*EXP(-60000.*HCKT(J))+240.*EXP(-62000.*HCKT(J))+
     2 251.*EXP(-63000.*HCKT(J))+300.*EXP(-65000.*HCKT(J))
      GO TO 18
c 1162 B=BSI2(J,1)
 1162 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(2)=B*(2.+4.*EXP(-287.32*HCKT(J)))
      DO 1163 I=2,6
c      B=BSI2(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1163 PART(2)=PART(2)+GSI2(I)*B        *EXP(-ESI2(I)*HCKT(J))
      PART(2)=PART(2)+6.*EXP(-81231.59*HCKT(J))+
     1 6.*EXP(-83937.08*HCKT(J))+10.*EXP(-101024.09*HCKT(J))+
     2 14.*EXP(-103556.35*HCKT(J))+10.*EXP(-108800.*HCKT(J))+
     3 42.*EXP(-115000.*HCKT(J))+6.*EXP(-121000.*HCKT(J))+
     4 38.*EXP(-125000.*HCKT(J))+34.*EXP(-132000.*HCKT(J))
      G=2.
      D1=4.*109734.83/4.5/4.5*HCKT(J)
      GO TO 14
c 1170 B=BCA1(J,1)
 1170 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B
      DO 1171 I=2,8
c      B=BCA1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1171 PART(1)=PART(1)+GCA1(I)*B        *EXP(-ECA1(I)*HCKT(J))
      PART(1)=PART(1)+28.*EXP(-37000.*HCKT(J))+67.*EXP(-40000.*HCKT(J))+
     1 21.*EXP(-43000.*HCKT(J))+34.*EXP(-48000.*HCKT(J))
      G=4.
      D1=109734.82/4.5/4.5*HCKT(J)
      GO TO 14
c 1172 B=BCA2(J,1)
 1172 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(2)=B*2.
      DO 1173 I=2,5
c      B=BCA2(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1173 PART(2)=PART(2)+GCA2(I)*B        *EXP(-ECA2(I)*HCKT(J))
      PART(2)=PART(2)+12.*EXP(-68000.*HCKT(J))
      G=2.
      D1=109734.83/4.5/4.5*HCKT(J)
      GO TO 14
c 1180 B=BO1(J,1)
 1180 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B*(5.+3.*EXP(-158.265*HCKT(J))+EXP(-226.977*HCKT(J)))
      DO 1181 I=2,13
c      B=BO1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1181 PART(1)=PART(1)+GO1(I)*B*EXP(-EO1(I)*HCKT(J))
      PART(1)=PART(1)+15.*EXP(-101140.*HCKT(J))+
     1 131.*EXP(-103000.*HCKT(J))+128.*EXP(-105000.*HCKT(J))+
     2 600.*EXP(-107000.*HCKT(J))
      GO TO 18
c 1190 B=BNA1(J,1)
 1190 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B*2.
      DO 1191 I=2,8
c      B=BNA1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1191 PART(1)=PART(1)+GNA1(I)*B*EXP(-ENA1(I)*HCKT(J))
      PART(1)=PART(1)+10.*EXP(-34548.745*HCKT(J))+
     1 14.*EXP(-34586.96*HCKT(J))
      G=2.
      D1=109734.83/4.5/4.5*HCKT(J)
      GO TO 14
c 1200 B=BB1(J,1)
 1200 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B*(2.+4.*EXP(-15.25*HCKT(J)))
      DO 1201 I=2,7
c      B=BB1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1201 PART(1)=PART(1)+GB1(I)*B*EXP(-EB1(I)*HCKT(J))
      PART(1)=PART(1)+6.*EXP(-57786.80*HCKT(J))+
     1 10.*EXP(-59989.*HCKT(J))+14.*EXP(-60031.03*HCKT(J))+
     2 2.*EXP(-63561.*HCKT(J))
      G=2.
      D1=109734.83/4.5/4.5*HCKT(J)
      GO TO 14
c 1210 B=BK1(J,1)
 1210 B=1.
c      IF(NLTEON.EQ.-1)B=1.
      PART(1)=B*2.
      DO 1211 I=2,8
c      B=BK1(J,I)
      B=1.
c      IF(NLTEON.EQ.-1)B=1.
 1211 PART(1)=PART(1)+GK1(I)*B*EXP(-EK1(I)*HCKT(J))
      PART(1)=PART(1)+10.*EXP(-27397.077*HCKT(J))+
     1 14.*EXP(-28127.85*HCKT(J))
      G=2.
      D1=109734.83/5.5/5.5*HCKT(J)
      GO TO 14
   18 CONTINUE
C
C
   19 IF(MODE1.EQ.3)GO TO 35
      IF(MODE1.EQ.5)GO TO 50
C
      N=N-NION2
      CF=2.*2.4148E15*T(J)*SQRT(T(J))/XNE(J)
      DO 20 ION=2,NION2
      N=N+1
C     THE AMIN IS FOR ANY UNFORTUNATE WHO HAS A 360
   20 F(ION)=CF*PART(ION)/PART(ION-1)*
     1EXP(-DMIN1((IP(ION-1)-POTLO(ION-1))/TV,100.D0))
      F(1)=1.
      L=NION2+1
      DO 21 ION=2,NION2
      L=L-1
   21 F(1)=1.+F(L)*F(1)
      F(1)=1./F(1)
      DO 22 ION=2,NION2
   22 F(ION)=F(ION-1)*F(ION)
C
   35 IF(MODE.LT.10)GO TO 40
      GO TO(23,25,27,29),MODE1
   23 DO 24 ION=1,NION
   24 ANSWER(J,ION)=F(ION)/PART(ION)
      RETURN
   25 DO 26 ION=1,NION
   26 ANSWER(J,ION)=F(ION)
      RETURN
   27 DO 28 ION=1,NION
   28 ANSWER(J,ION)=PART(ION)
      RETURN
   29 ANSWER(J,1)=0.
      DO 30 ION=2,NION2
   30 ANSWER(J,1)=ANSWER(J,1)+F(ION)*Dble(ION-1)
      RETURN
   40 GO TO(41,42,43,29),MODE1
   41 ANSWER(J,1)=F(NION)/PART(NION)
      RETURN
   42 ANSWER(J,1)=F(NION)
      RETURN
   43 ANSWER(J,1)=PART(NION)
      RETURN
   50 ANSWER(7,1)=0.
      DO 51 ION=1,NION
      ANSWER(ION,1)=PART(ION)
   51 ANSWER(ION+7,1)=IP(ION)+ANSWER(ION+6,1)
      RETURN
      END
      SUBROUTINE IONPOTS
C
C     Moore, C.E., NSRDS-NBS 34,1970,22pp.
C     Sugar, J. and Corliss, C. JPCRD, 14, Supp.2, 1985.  K-Ni
C     Sugar, J. and Musgrove, A., JPCRD, 19,527-616,1990. Cu
C     Kaufman, V., Sugar, J., and Joshi, Y.N. JOSAB, 5, 619-622, 1988.  I V
C     AEL, rare-earth elements, 1978,NSRDS-NBS 60,411pp.
C     Kelley,R.L. and Harrison, D.E, Atomic Data 3,177-193,1971.  Ga V
C     Martin,W.C. et al. ,JPCRDa,3,771-780,1974.  Ac I-Es I
C     Guess 55.02 56.02 73.01 73.02 74.01 74.02 75.01 75.02 76.01 76.01
C     Guess 77.01 77.02 78.02 79.02 84.01 84.02 85.00 85.01 85.02 86.01 86.02
C     Guess 87.00 87.01 87.02 88.02 89.02 91.01 91.02 92.01 92.02 93.01 93.02
C     Guess 94.01 94.02 95.01 95.02 96.01 96.02 97.01 97.02 98.01 98.02
C     Guess 99.01 99.02
C
      IMPLICIT REAL*8 (A-H,O-Z)
      COMMON /POTION/POTION(999)
      DIMENSION POTH ( 2),POTHe( 3),POTLi( 4),POTBe( 5),POTB ( 6)
      DIMENSION POTC ( 7),POTN ( 8),POTO ( 9),POTF( 10),POTNe(11)
      DIMENSION POTNa(12),POTMg(13),POTAl(14),POTSi(15),POTP (16)
      DIMENSION POTS (17),POTCl(18),POTAr(19),POTK (20),POTCa(21)
      DIMENSION POTSc(22),POTTi(23),POTV (24),POTCr(25),POTMn(26)
      DIMENSION POTFe(27),POTCo(28),POTNi(29),POTCu(30),POTZn(31)
      DIMENSION POTGa(5),POTGe(5),POTAs(5),POTSe(5),POTBr(5)
      DIMENSION POTKr(5),POTRb(5),POTSr(5),POTY (5),POTZr(5)
      DIMENSION POTNb(5),POTMo(5),POTTc(5),POTRu(5),POTRh(5)
      DIMENSION POTPd(5),POTAg(5),POTCd(5),POTIn(5),POTSn(5)
      DIMENSION POTSb(5),POTTe(5),POTI (5),POTXe(5),POTCs(5)
      DIMENSION POTBa(5),POTLa(5),POTCe(5),POTPr(5),POTNd(5)
      DIMENSION POTPm(5),POTSm(5),POTEu(5),POTGd(5),POTTb(5)
      DIMENSION POTDy(5),POTHo(5),POTEr(5),POTTm(5),POTYb(5)
      DIMENSION POTLu(5),POTHf(5),POTTa(5),POTW (5),POTRe(5)
      DIMENSION POTOs(5),POTIr(5),POTPt(5),POTAu(5),POTHg(5)
      DIMENSION POTTl(5),POTPb(5),POTBi(5),POTPo(5),POTAt(5)
      DIMENSION POTRn(5),POTFr(5),POTRa(5),POTAc(5),POTTh(5)
      DIMENSION POTPa(5),POTU (5),POTNp(5),POTPu(5),POTAm(5)
      DIMENSION POTCm(5),POTBk(5),POTCf(5),POTEs(5)
      EQUIVALENCE (POTION(  1),POTH (1))
      EQUIVALENCE (POTION(  3),POTHe(1))
      EQUIVALENCE (POTION(  6),POTLi(1))
      EQUIVALENCE (POTION( 10),POTBe(1))
      EQUIVALENCE (POTION( 15),POTB (1))
      EQUIVALENCE (POTION( 21),POTC (1))
      EQUIVALENCE (POTION( 28),POTN (1))
      EQUIVALENCE (POTION( 36),POTO (1))
      EQUIVALENCE (POTION( 45),POTF (1))
      EQUIVALENCE (POTION( 55),POTNe(1))
      EQUIVALENCE (POTION( 66),POTNa(1))
      EQUIVALENCE (POTION( 78),POTMg(1))
      EQUIVALENCE (POTION( 91),POTAl(1))
      EQUIVALENCE (POTION(105),POTSi(1))
      EQUIVALENCE (POTION(120),POTP (1))
      EQUIVALENCE (POTION(136),POTS (1))
      EQUIVALENCE (POTION(153),POTCl(1))
      EQUIVALENCE (POTION(171),POTAr(1))
      EQUIVALENCE (POTION(190),POTK (1))
      EQUIVALENCE (POTION(210),POTCa(1))
      EQUIVALENCE (POTION(231),POTSc(1))
      EQUIVALENCE (POTION(253),POTTi(1))
      EQUIVALENCE (POTION(276),POTV (1))
      EQUIVALENCE (POTION(300),POTCr(1))
      EQUIVALENCE (POTION(325),POTMn(1))
      EQUIVALENCE (POTION(351),POTFe(1))
      EQUIVALENCE (POTION(378),POTCo(1))
      EQUIVALENCE (POTION(406),POTNi(1))
      EQUIVALENCE (POTION(435),POTCu(1))
      EQUIVALENCE (POTION(465),POTZn(1))
      EQUIVALENCE (POTION(496),POTGa(1))
      EQUIVALENCE (POTION(501),POTGe(1))
      EQUIVALENCE (POTION(506),POTAs(1))
      EQUIVALENCE (POTION(511),POTSe(1))
      EQUIVALENCE (POTION(516),POTBr(1))
      EQUIVALENCE (POTION(521),POTKr(1))
      EQUIVALENCE (POTION(526),POTRb(1))
      EQUIVALENCE (POTION(531),POTSr(1))
      EQUIVALENCE (POTION(536),POTY (1))
      EQUIVALENCE (POTION(541),POTZr(1))
      EQUIVALENCE (POTION(546),POTNb(1))
      EQUIVALENCE (POTION(551),POTMo(1))
      EQUIVALENCE (POTION(556),POTTc(1))
      EQUIVALENCE (POTION(561),POTRu(1))
      EQUIVALENCE (POTION(566),POTRh(1))
      EQUIVALENCE (POTION(571),POTPd(1))
      EQUIVALENCE (POTION(576),POTAg(1))
      EQUIVALENCE (POTION(581),POTCd(1))
      EQUIVALENCE (POTION(586),POTIn(1))
      EQUIVALENCE (POTION(591),POTSn(1))
      EQUIVALENCE (POTION(596),POTSb(1))
      EQUIVALENCE (POTION(601),POTTe(1))
      EQUIVALENCE (POTION(606),POTI (1))
      EQUIVALENCE (POTION(611),POTXe(1))
      EQUIVALENCE (POTION(616),POTCs(1))
      EQUIVALENCE (POTION(621),POTBa(1))
      EQUIVALENCE (POTION(626),POTLa(1))
      EQUIVALENCE (POTION(631),POTCe(1))
      EQUIVALENCE (POTION(636),POTPr(1))
      EQUIVALENCE (POTION(641),POTNd(1))
      EQUIVALENCE (POTION(646),POTPm(1))
      EQUIVALENCE (POTION(651),POTSm(1))
      EQUIVALENCE (POTION(656),POTEu(1))
      EQUIVALENCE (POTION(661),POTGd(1))
      EQUIVALENCE (POTION(666),POTTb(1))
      EQUIVALENCE (POTION(671),POTDy(1))
      EQUIVALENCE (POTION(676),POTHo(1))
      EQUIVALENCE (POTION(681),POTEr(1))
      EQUIVALENCE (POTION(686),POTTm(1))
      EQUIVALENCE (POTION(691),POTYb(1))
      EQUIVALENCE (POTION(696),POTLu(1))
      EQUIVALENCE (POTION(701),POTHf(1))
      EQUIVALENCE (POTION(706),POTTa(1))
      EQUIVALENCE (POTION(711),POTW (1))
      EQUIVALENCE (POTION(716),POTRe(1))
      EQUIVALENCE (POTION(721),POTOs(1))
      EQUIVALENCE (POTION(726),POTIr(1))
      EQUIVALENCE (POTION(731),POTPt(1))
      EQUIVALENCE (POTION(736),POTAu(1))
      EQUIVALENCE (POTION(741),POTHg(1))
      EQUIVALENCE (POTION(746),POTTl(1))
      EQUIVALENCE (POTION(751),POTPb(1))
      EQUIVALENCE (POTION(756),POTBi(1))
      EQUIVALENCE (POTION(761),POTPo(1))
      EQUIVALENCE (POTION(766),POTAt(1))
      EQUIVALENCE (POTION(771),POTRn(1))
      EQUIVALENCE (POTION(776),POTFr(1))
      EQUIVALENCE (POTION(781),POTRa(1))
      EQUIVALENCE (POTION(786),POTAc(1))
      EQUIVALENCE (POTION(791),POTTh(1))
      EQUIVALENCE (POTION(796),POTPa(1))
      EQUIVALENCE (POTION(801),POTU (1))
      EQUIVALENCE (POTION(806),POTNp(1))
      EQUIVALENCE (POTION(811),POTPu(1))
      EQUIVALENCE (POTION(816),POTAm(1))
      EQUIVALENCE (POTION(821),POTCm(1))
      EQUIVALENCE (POTION(826),POTBk(1))
      EQUIVALENCE (POTION(831),POTCf(1))
      EQUIVALENCE (POTION(836),POTEs(1))
      DATA POTH / 109678.764,0./
      DATA POTHe/ 198310.76 , 438908.85 ,0./
      DATA POTLi/  43487.150, 610079.0  , 987660.1 ,0./
      DATA POTBe/  75192.07 , 146882.86 ,1241259.4 , 1756018.7, 0./
      DATA POTB /  66928.10 , 202887.4  , 305931.1 ,2092001.4,2744105.1,
     1                    0./
      DATA POTC /  90820.42 , 196664.7  , 386241.0 , 520178.4,3162395. ,
     1             3952061.4, 0./
      DATA POTN / 117225.4  , 238750.5  , 382704.  , 624866. , 789537.2,
     1             4452758. ,5380089., 0./
      DATA POTO / 109837.02 , 283240.   , 443086.  , 624383.8, 918657. ,
     1             1114008. ,5963135.,7028393., 0./
      DATA POTF / 140524.5  , 282058.6  , 505777.  , 702830. , 921430. ,
     1             1267622. ,1493629.,7693810.,8897240., 0./
      DATA POTNe/ 173929.70 , 330391.0  , 511800.  , 783300. ,1018000. ,
     1             1273800. ,1671792.,1928462.,9645005.,10986876.,0./
      DATA POTNa/  41449.44 , 381395.   , 577800.  , 797800. ,1116200. ,
     1             1388500. ,1681500.,   2130800.,  2418700.,11817061.,
     2             13297676.,0./
      DATA POTMg/  61671.02 , 121267.61 , 646410.  , 881100. ,1139400. ,
     1             1504300. , 1814300.  , 2144700. , 2645200., 2964400.,
     2             14210261., 15829951. , 0./
      DATA POTAl/  48278.37 , 151860.4  , 229445.71, 967800. ,1239800. ,
     1             1536300. , 1947300.  , 2295400. , 2663400., 3214800.,
     2             3565600. , 16825022. , 18584138., 0./
      DATA POTSi/  65747.5  , 131838.4  , 270139.3 , 364093.1,1345100. ,
     1             1653900. , 1988400.  , 2445300. , 2831900., 3237800.,
     2             3839800. , 4222400.  , 19661693., 21560630., 0./
      DATA POTP /  84580.   , 159100.   , 243400.  , 414312.4, 524460. ,
     1             1777900. , 2123100.  , 2495600. , 2998300., 3423900.,
     2             3868100. , 4520100.  , 4935000., 22720766.,24759942.,
     3             0./
      DATA POTS /  83558.0  , 188200.   , 280900.  , 381541.4, 586200. ,
     1              710184. , 2265900.  , 2647400. , 3057700., 3606100.,
     2             4071400. , 4554300.  , 5255900. , 5703600.,26002663.,
     3             28182535., 0./
      DATA POTCl/ 104591.0  , 192070.   , 319500.  , 431226. , 547000. ,
     1              782600. , 921051.   , 2809100. , 3226700., 3674900.,
     2             4268900. , 4774700.  , 5296700. , 6047200., 6528300.,
     3             29507950., 31829012. , 0./
      DATA POTAr/ 127109.9  , 222848.2  , 328600.  , 482400. , 605100. ,
     1              734040. , 1002730.  , 1157080. , 3407300., 3860900.,
     2             4347000. , 4986600.  , 5533800. , 6095500., 6894200.,
     3             7404400. , 33237173. , 35699936., 0./
      DATA POTK /  35009.814, 255100.   , 369450.  , 491300. , 666700. ,
     1              802000. , 948200.   , 1249200. , 1418063., 4063000.,
     2              4555000., 5077000.  , 5764000. , 6345000., 6945000.,
     3              7810000., 8344200.  , 37188200.,39795750., 0./
      DATA POTCa/  49305.95 ,  95751.87 , 410642.  , 542600. , 681600. ,
     1              877400. , 1026000.  , 1187600. , 1520640., 1704047.,
     2             4774000. , 5301000.  , 5861000. , 6595000., 7215000.,
     3             7860000. , 8770000.  , 9338000. ,41366000.,44117410.,
     4             0./
      DATA POTSc/  52922.0  , 103237.1  , 199677.37, 592732. , 741000. ,
     1             892700.  , 1113000.  , 1275000. , 1452000., 1816200.,
     2             2015060. , 5543900.  , 6103000. , 6701000., 7481000.,
     3             8140000. , 8820000.  , 9780000. ,10388200.,45770000.,
     4             48665520., 0./
      DATA POTTi/  55010.   , 109494.   , 221735.6 , 348973.3, 800900. ,
     1              964100. , 1136000.  , 1374000. , 1549000.,1741500. ,
     2             2137900. , 2351080.  , 6354300. , 6961000.,7597000. ,
     3             8420000. , 9120000.  , 9850000. ,10860000.,11497000.,
     4             50401000., 53440800. , 0./
      DATA POTV /  54360.   , 118200.   , 236410.  , 376730. , 526532. ,
     1             1033400. , 1215000.  , 1399000. , 1660000., 1859000.,
     2             2062000. , 2485000.  , 2712250. , 7227000., 7870000.,
     3             8549000. , 9420000.  , 10160000.,10930000.,11990000.,
     4             12660000., 55259000. , 58443900., 0./
      DATA POTCr/  54575.6  , 132966.   , 249700.  , 396500. , 560200. ,
     1             731020.  , 1291900.  , 1490000. , 1688000., 1971000.,
     2             2184000. , 2404000.  , 2862000. , 3098520., 8151000.,
     3             8850000. , 9560000.  , 10480000.,11260000.,12070000.,
     4             13180000.,13882000.  , 60344000.,63675900., 0./
      DATA POTMn/  59959.4  , 126145.0  , 271550.  , 413000. , 584000. ,
     1             771100.  , 961440.   , 1569000. , 1789000., 2003000.,
     2             2307000. , 2536000.  , 2771000. , 3250000., 3509820.,
     3             9152000. , 9872000.  , 10620000.,11590000.,12410000.,
     4             13260000.,14420000.  , 15162000.,65660000.,69137400.,
     5             0./
      DATA POTFe/  63737.   , 130563.   , 247220.  , 442000. , 605000. ,
     1             799000.  , 1008000.  , 1218380. , 1884000., 2114000.,
     2             2341000. , 2668000.  , 2912000. , 3163000., 3686000.,
     3             3946280. , 10180000. , 10985000.,11850000.,12708000.,
     4             13620000., 14510000. , 15797000.,16500000.,71203000.,
     5             74829600., 0./
      DATA POTCo/  63400.   , 137795.   , 270200.  , 413500. , 641000. ,
     1             823000.  , 1040000.  , 1273000. , 1501300., 2221000.,
     2             2460000. , 2710000.  , 3057000. , 3315000., 3580000.,
     3             4129200. , 4408500.  , 11269000.,12135000.,12930000.,
     4             13990000., 14890000. , 15820000.,17090000.,17897000.,
     5             76979000., 80753200. , 0./
      DATA POTNi/  61600.   , 146541.56 , 283800.  , 443000. , 613500. ,
     1             870000.  , 1070000.  , 1310000. , 1560000., 1812000.,
     2             2589000. , 2840000.  , 3100000. , 3470000., 3740000.,
     3             4020000. , 2606000.  , 4896200. ,12430000.,13290000.,
     4             14160000., 15280000. , 16220000.,17190000.,18510000.,
     5             19351000., 82984000. , 86909400., 0./
      DATA POTCu/  62317.44 , 163669.2  , 297140.  , 462800. , 644000. ,
     1             831000.  , 1120000.  , 1340000. , 1605000., 1870000.,
     2             2140000. , 2975000.  , 3234000. , 3508000., 3903000.,
     3             4194000. , 4493000.  , 5105000. , 5408660.,13630000.,
     4             14550000., 15450000. , 16620000.,17600000.,18620000.,
     5             19986000., 20870000. , 89224060.,93299090., 0./
      DATA POTZn/  75768.10 , 144892.6  , 320390.  , 479100. , 666000. ,
     1             871000.  , 1081000.  , 1403000. , 1637000., 1920000.,
     2             2210000. , 2507000.  , 3385000. , 3662000., 3952000.,
     3             4372000. , 4670000.  , 4993000. , 5630000., 5952000.,
     4             14969000., 16000000. , 17000000.,18000000.,19000000.,
     5             20000000., 21000000. , 22000000.,93000000.,99000000.,
     6             0./
      DATA POTGa/  48387.63 , 165458.   , 247700.  , 517600. , 726000. /
      DATA POTGe/  63715.   , 128521.3  , 276036.  , 368701. , 753800. /
      DATA POTAs/  79165.   , 150290.   , 228670.  , 404369. , 505136. /
      DATA POTSe/  78658.22 , 170900.   , 248583.  , 346375. , 551000. /
      DATA POTBr/  95284.8  , 175870.   , 289529.  , 381600. , 481600. /
      DATA POTKr/ 112914.5  , 196474.8  , 298020.  , 423600. , 522000. /
      DATA POTRb/  33690.81 , 220048.   , 320000.  , 424400. , 572800. /
      DATA POTSr/  45932.0  ,  88964.0  , 351800.  , 460000. , 577700. /
      DATA POTY /  51447.   ,  98690.   , 165500.  , 498600. , 621200. /
      DATA POTZr/  55145.   , 105900.   , 185400.  , 276970. , 657600. /
      DATA POTNb/  55511.   , 115500.   , 202000.  , 308600. , 407700. /
      DATA POTMo/  57260.   , 130300.   , 219100.  , 374180. , 493360. /
      DATA POTTc/  58700.   , 123100.   , 238300.  ,      0. ,      0. /
      DATA POTRu/  59410.   , 135200.   , 229600.  ,      0. ,      0. /
      DATA POTRh/  60197.   , 145800.   , 250500.  ,      0. ,      0. /
      DATA POTPd/  67236.   , 156700.   , 265600.  ,      0. ,      0. /
      DATA POTAg/  61106.50 , 173300.   , 280900.  ,      0. ,      0. /
      DATA POTCd/  72538.8  , 136374.74 , 302300.  ,      0. ,      0. /
      DATA POTIn/  46670.11 , 152195.   , 226100.  , 439000. ,      0. /
      DATA POTSn/  59231.8  , 118017.0  , 246020.0 , 328550. , 583000. /
      DATA POTSb/  69700.   , 133327.5  , 204248.  , 356156. , 449300. /
      DATA POTTe/  72667.   , 150000.   , 225500.  , 301776. , 473900. /
      DATA POTI /  84295.1  , 154304.   , 266000.  ,      0. , 415510. /
      DATA POTXe/  97834.0  , 171068.4  , 259089.  ,      0. ,      0. /
      DATA POTCs/  31406.432, 202263.   , 280000.  ,      0. ,      0. /
      DATA POTBa/  42035.14 ,  80686.87 , 300000.  ,      0. ,      0. /
      DATA POTLa/  44981.   ,  89200.   , 154675.  , 402900. , 497000. /
      DATA POTCe/  44672.   ,  87500.   , 162903.  , 296470. , 528700. /
      DATA POTPr/  44070.   ,  85100.   , 174407.  , 314400. , 464000. /
      DATA POTNd/  44562.   ,  86500.   , 178600.  , 326000. ,      0. /
      DATA POTPm/  44800.   ,  87900.   , 180000.  , 331000. ,      0. /
      DATA POTSm/  45519.   ,  89300.   , 189000.  , 334000. ,      0. /
      DATA POTEu/  45734.9  ,  90665.   , 201000.  , 344000. ,      0. /
      DATA POTGd/  49603.   ,  97500.   , 166400.  , 355000. ,      0. /
      DATA POTTb/  47295.   ,  92900.   , 176700.  , 317500. ,      0. /
      DATA POTDy/  47900.   ,  94100.   , 183800.  , 334000. ,      0. /
      DATA POTHo/  48567.   ,  95200.   , 184200.  , 343000. ,      0. /
      DATA POTEr/  49262.   ,  96200.   , 183400.  , 344000. ,      0. /
      DATA POTTm/  49879.8  ,  97200.   , 191000.  , 344000. ,      0. /
      DATA POTYb/  50441.0  ,  98269.   , 202070.  , 351300. ,      0. /
      DATA POTLu/  43762.39 , 112000.   , 169049.  , 364960. , 538700. /
      DATA POTHf/  56600.   , 120000.   , 187800.  , 268500. ,      0. /
      DATA POTTa/  63600.   , 131000.   , 194000.  ,      0. ,      0. /
      DATA POTW /  64400.   , 143000.   , 202000.  ,      0. ,      0. /
      DATA POTRe/  63530.   , 134000.   , 210000.  ,      0. ,      0. /
      DATA POTOs/  70450.   , 137000.   , 218000.  ,      0. ,      0. /
      DATA POTIr/  73000.   , 161000.   , 226000.  ,      0. ,      0. /
      DATA POTPt/  72300.   , 149723.   , 234000.  ,      0. ,      0. /
      DATA POTAu/  74410.   , 165000.   , 242000.  ,      0. ,      0. /
      DATA POTHg/  84184.1  , 151280.   , 276000.  ,      0. ,      0. /
      DATA POTTl/  49266.7  , 164765.   , 240600.  ,      0. ,      0. /
      DATA POTPb/  59819.4  , 121243.   , 257592.  , 341350. , 555000. /
      DATA POTBi/  58790.   , 134600.   , 206180.  , 365500. , 451700. /
      DATA POTPo/  67885.3  , 153000.   , 218000.  ,      0. ,      0. /
      DATA POTAt/  75000.   , 161000.   , 242000.  ,      0. ,      0. /
      DATA POTRn/  86692.5  , 161000.   , 242000.  ,      0. ,      0. /
      DATA POTFr/  32000.   , 177000.   , 266000.  ,      0. ,      0. /
      DATA POTRa/  42577.35 , 81842.31  , 274000.  ,      0. ,      0. /
      DATA POTAc/  41700.   , 97300.    , 161000.  ,      0. ,      0. /
      DATA POTTh/  49000.   , 93000.    , 161000.  , 231900. ,      0. /
      DATA POTPa/  47500.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTU /  48800.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTNp/  49900.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTPu/  48900.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTAm/  48300.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTCm/  48600.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTBk/  50200.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTCf/  50800.   , 95000.    , 161000.  ,      0. ,      0. /
      DATA POTEs/  51800.   , 95000.    , 161000.  ,      0. ,      0. /
      RETURN
      END
      FUNCTION PFGROUND(NELION,T)
	implicit real*8 (A-H,O-Z)
C     FOR H-K, CU-BA
      PARAMETER (HCK=6.6256E-27*2.99792458E10/1.38054E-16)
      IF(NELION.LT.114)THEN
      GO TO (1,2,2,2,2,2,7,8,9,9,9,9,13,14,15,16,16,16,19,20,21,22,
     1 23,23,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,
     2 43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,
     3 63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,
     4 83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,
     5 103,104,105,106,107,108,109,110,111,112,113,114), NELION
C     1.00
    1 PFGROUND=2.
      RETURN
C     1.01
    2 PFGROUND=1.
      RETURN
C     2.00
    7 PFGROUND=1.
      RETURN
C     2.01
    8 PFGROUND=2.
      RETURN
C     2.02
    9 PFGROUND=1.
      RETURN
C     3.00
   13 PFGROUND=2.
      RETURN
C     3.01
   14 PFGROUND=1.
      RETURN
C     3.02
   15 PFGROUND=2.
      RETURN
C     3.03
   16 PFGROUND=1.
      RETURN
C     4.00
   19 PFGROUND=1.
      RETURN
C     4.01
   20 PFGROUND=2.
      RETURN
C     4.02
   21 PFGROUND=1.
      RETURN
C     4.03
   22 PFGROUND=2.
      RETURN
C     4.04
   23 PFGROUND=1.
C     5.00
   25 PFGROUND=2.+4.*EXP(-HCK/T*15.254)
      RETURN
C     5.01
   26 PFGROUND=1.
      RETURN
C     5.02
   27 PFGROUND=2.
      RETURN
C     5.03
   28 PFGROUND=1.
      RETURN
C     5.04
   29 PFGROUND=2.
      RETURN
C     5.05
   30 PFGROUND=1.
      RETURN
C     6.00
   31 PFGROUND=1.+3.*EXP(-HCK/T*16.40)+5.*EXP(-HCK/T*43.40)
      RETURN
C     6.01
   32 PFGROUND=2.+4.*EXP(-HCK/T*63.42)
      RETURN
C     6.02
   33 PFGROUND=1.
      RETURN
C     6.03
   34 PFGROUND=2.
      RETURN
C     6.04
   35 PFGROUND=1.
      RETURN
C     6.05
   36 PFGROUND=2.
      RETURN
C     7.00
   37 PFGROUND=4.
      RETURN
C     7.01
   38 PFGROUND=1.+3.*EXP(-HCK/T*48.7)+5.*EXP(-HCK/T*130.8)
      RETURN
C     7.02
   39 PFGROUND=2.+4.*EXP(-HCK/T*174.4)
      RETURN
C     7.03
   40 PFGROUND=1.
      RETURN
C     7.04
   41 PFGROUND=2.
      RETURN
C     7.05
   42 PFGROUND=1.
      RETURN
C     8.00
   43 PFGROUND=5.+3.*EXP(-HCK/T*158.265)+EXP(-HCK/T*226.977)
      RETURN
C     8.01
   44 PFGROUND=4.
      RETURN
C     8.02
   45 PFGROUND=1.+3.*EXP(-HCK/T*113.178)+5.*EXP(-HCK/T*306.174)
      RETURN
C     8.03
   46 PFGROUND=2.+4.*EXP(-HCK/T*385.9)
      RETURN
C     8.04
   47 PFGROUND=1.
      RETURN
C     8.05
   48 PFGROUND=2.
      RETURN
C     9.00
   49 PFGROUND=4.+2.*EXP(-HCK/T*404.1)
      RETURN
C     9.01
   50 PFGROUND=5.+3.*EXP(-HCK/T*341.0)+EXP(-HCK/T*489.9)
      RETURN
C     9.02
   51 PFGROUND=4.
      RETURN
C     9.03
   52 PFGROUND=1.+3.*EXP(-HCK/T*225.2)+5.*EXP(-HCK/T*612.2)
      RETURN
C     9.04
   53 PFGROUND=2.+4.*EXP(-HCK/T*744.5)
      RETURN
C     9.05
   54 PFGROUND=1.
      RETURN
C     10.00
   55 PFGROUND=1.
      RETURN
C     10.01
   56 PFGROUND=4.+2.*EXP(-HCK/T*780.45)
      RETURN
C     10.02
   57 PFGROUND=5.+3.*EXP(-HCK/T*642.9)+EXP(-HCK/T*920.4)
      RETURN
C     10.03
   58 PFGROUND=4.
      RETURN
C     10.04
   59 PFGROUND=1.+3.*EXP(-HCK/T*414.)+5.*EXP(-HCK/T*1112.)
      RETURN
C     10.05
   60 PFGROUND=2.+4.*EXP(-HCK/T*1310.)
      RETURN
C     11.00
   61 PFGROUND=2.
      RETURN
C     11.01
   62 PFGROUND=1.
      RETURN
C     11.02
   63 PFGROUND=4.+2.*EXP(-HCK/T*780.45)
      RETURN
C     11.03
   64 PFGROUND=5.+3.*EXP(-HCK/T*642.9)+EXP(-HCK/T*920.4)
      RETURN
C     11.04
   65 PFGROUND=4.
      RETURN
C     11.05
   66 PFGROUND=1.+3.*EXP(-HCK/T*414.)+5.*EXP(-HCK/T*1112.)
      RETURN
C     12.00
   67 PFGROUND=1.
      RETURN
C     12.01
   68 PFGROUND=2.
      RETURN
C     12.02
   69 PFGROUND=1.
      RETURN
C     12.03
   70 PFGROUND=4.+2.*EXP(-HCK/T*2238.)
      RETURN
C     12.04
   71 PFGROUND=5.+3.*EXP(-HCK/T*1782.1)+EXP(-HCK/T*2521.8)
      RETURN
C     12.05
   72 PFGROUND=4.
      RETURN
C     13.00
   73 PFGROUND=2.+4.*EXP(-HCK/T*112.061)
      RETURN
C     13.01
   74 PFGROUND=1.
      RETURN
C     13.02
   75 PFGROUND=2.
      RETURN
C     13.03
   76 PFGROUND=1.
      RETURN
C     13.04
   77 PFGROUND=4.+2.*EXP(-HCK/T*3442.)
      RETURN
C     13.05
   78 PFGROUND=5.+3.*EXP(-HCK/T*2732.)+EXP(-HCK/T*3829.)
      RETURN
C     14.00
   79 PFGROUND=1.+3.*EXP(-HCK/T*77.115)+5.*EXP(-HCK/T*223.157)
      RETURN
C     14.01
   80 PFGROUND=2.+4.*EXP(-HCK/T*287.32)
      RETURN
C     14.02
   81 PFGROUND=1.
      RETURN
C     14.03
   82 PFGROUND=2.
      RETURN
C     14.04
   83 PFGROUND=1.
      RETURN
C     14.05
   84 PFGROUND=4.+2.*EXP(-HCK/T*5090.)
      RETURN
C     15.00
   85 PFGROUND=4.
      RETURN
C     15.01
   86 PFGROUND=1.+3.*EXP(-HCK/T*164.90)+5.*EXP(-HCK/T*469.12)
      RETURN
C     15.02
   87 PFGROUND=2.+4.*EXP(-HCK/T*559.14)
      RETURN
C     15.03
   88 PFGROUND=1.
      RETURN
C     15.04
   89 PFGROUND=2.
      RETURN
C     15.05
   90 PFGROUND=1.
      RETURN
C     16.00
   91 PFGROUND=5.+3.*EXP(-HCK/T*396.055)+EXP(-HCK/T*573.640)
      RETURN
C     16.01
   92 PFGROUND=4.
      RETURN
C     16.02
   93 PFGROUND=1.+3.*EXP(-HCK/T*298.69)+5.*EXP(-HCK/T*833.08)
      RETURN
C     16.03
   94 PFGROUND=2.+4.*EXP(-HCK/T*951.43)
      RETURN
C     16.04
   95 PFGROUND=1.
      RETURN
C     16.05
   96 PFGROUND=2.
      RETURN
C     17.00
   97 PFGROUND=4.+2.*EXP(-HCK/T*882.36)
      RETURN
C     17.01
   98 PFGROUND=5.+3.*EXP(-HCK/T*696.1)+EXP(-HCK/T*996.4)
      RETURN
C     17.02
   99 PFGROUND=4.
      RETURN
C     17.03
  100 PFGROUND=1.+3.*EXP(-HCK/T*491.)+5.*EXP(-HCK/T*1341.)
      RETURN
C     17.04
  101 PFGROUND=2.+4.*EXP(-HCK/T*1492.)
      RETURN
C     17.05
  102 PFGROUND=1.
      RETURN
C     18.00
  103 PFGROUND=1.
      RETURN
C     18.01
  104 PFGROUND=4.+2.*EXP(-HCK/T*1431.41)
      RETURN
C     18.02
  105 PFGROUND=5.+3.*EXP(-HCK/T*1112.1)+EXP(-HCK/T*1570.2)
      RETURN
C     18.03
  106 PFGROUND=4.
      RETURN
C     18.04
  107 PFGROUND=1.+3.*EXP(-HCK/T*765.)+5.*EXP(-HCK/T*2030.)
      RETURN
C     18.05
  108 PFGROUND=2.+4.*EXP(-HCK/T*2208.)
      RETURN
C     19.00
  109 PFGROUND=2.
      RETURN
C     19.01
  110 PFGROUND=1.
      RETURN
C     19.02
  111 PFGROUND=4.+2.*EXP(-HCK/T*2166.)
      RETURN
C     19.03
  112 PFGROUND=5.+3.*EXP(-HCK/T*1673.)+EXP(-HCK/T*2325.)
      RETURN
C     19.04
  113 PFGROUND=4.
      RETURN
C     19.05
  114 PFGROUND=1.+3.*EXP(-HCK/T*1132.)+5.*EXP(-HCK/T*2924.)
      RETURN
      ENDIF
      IF(NELION.GT.114.AND.NELION.LT.169)THEN
C     THESE ARE IRON GROUP ELEMENTS TO BE READ FROM PFIRON
      PFGROUND=1.
      RETURN
      ENDIF
      IF(NELION.GT.168.AND.NELION.LT.337)THEN
      GO TO (169,170,171,2,2,2,175,176,177,2,2,2,181,182,183,2,2,2,
     1       187,188,189,2,2,2,193,194,195,2,2,2,199,200,201,2,2,2,
     2       205,206,207,2,2,2,211,212,213,2,2,2,217,218,219,2,2,2,
     3       223,224,225,2,2,2,229,230,231,2,2,2,235,236,237,2,2,2,
     4       241,242,243,2,2,2,247,248,249,2,2,2,253,254,255,2,2,2,
     5       259,260,261,2,2,2,265,266,267,2,2,2,271,272,273,2,2,2,
     6       277,278,279,2,2,2,283,284,285,2,2,2,289,290,291,2,2,2,
     7       295,296,297,2,2,2,301,302,303,2,2,2,307,308,309,2,2,2,
     8       313,314,315,2,2,2,319,320,321,2,2,2,325,326,327,2,2,2,
     9       331,332,333,2,2,2),NELION-168
C     29.00
  169 PFGROUND=2.
      RETURN
C     29.01
  170 PFGROUND=1.
      RETURN
C     29.02
  171 PFGROUND=6.+4.*EXP(-HCK/T*2071.8)
      RETURN
C     30.00
  175 PFGROUND=1.
      RETURN
C     30.01
  176 PFGROUND=2.
      RETURN
C     30.02
  177 PFGROUND=1.
      RETURN
C     31.00
  181 PFGROUND=2.+4.*EXP(-HCK/T*826.19)
      RETURN
C     31.01
  182 PFGROUND=1.
      RETURN
C     31.02
  183 PFGROUND=2.
      RETURN
C     32.00
  187 PFGROUND=1.+3.*EXP(-HCK/T*557.134)+5.*EXP(-HCK/T*1409.961)
      RETURN
C     32.01
  188 PFGROUND=2.+4.*EXP(-HCK/T*1767.356)
      RETURN
C     32.02
  189 PFGROUND=1.
      RETURN
C     33.00
  193 PFGROUND=4.
      RETURN
C     33.01
  194 PFGROUND=1.+3.*EXP(-HCK/T*1061.)+5.*EXP(-HCK/T*2538.)
      RETURN
C     33.02
  195 PFGROUND=2.+4.*EXP(-HCK/T*2940.)
      RETURN
C     34.00
  199 PFGROUND=5.+3.*EXP(-HCK/T*1989.49)+EXP(-HCK/T*2534.35)
      RETURN
C     34.01
  200 PFGROUND=4.
      RETURN
C     34.02
  201 PFGROUND=1.+3.*EXP(-HCK/T*1741.)+5.*EXP(-HCK/T*3937.)
      RETURN
C     35.00
  205 PFGROUND=4.+2.*EXP(-HCK/T*3685.24)
      RETURN
C     35.01
  206 PFGROUND=5.+3.*EXP(-HCK/T*3136.4)+EXP(-HCK/T*3837.5)
      RETURN
C     35.02
  207 PFGROUND=4.
      RETURN
C     36.00
  211 PFGROUND=1.
      RETURN
C     36.01
  212 PFGROUND=4.+2.*EXP(-HCK/T*5371.)
      RETURN
C     36.02
  213 PFGROUND=5.+3.*EXP(-HCK/T*3136.4)+EXP(-HCK/T*3837.5)
      RETURN
C     37.00
  217 PFGROUND=2.
      RETURN
C     37.01
  218 PFGROUND=1.
      RETURN
C     37.02
  219 PFGROUND=4.+2.*EXP(-HCK/T*7380.)
      RETURN
C     38.00
  223 PFGROUND=1.
      RETURN
C     38.01
  224 PFGROUND=2.
      RETURN
C     38.02
  225 PFGROUND=1.
      RETURN
C     39.00
  229 PFGROUND=4.+6.*EXP(-HCK/T*530.36)
      RETURN
C     39.01
  230 PFGROUND=1.
      RETURN
C     39.02
  231 PFGROUND=2.
      RETURN
C     40.00
  235 PFGROUND=5.+7.*EXP(-HCK/T*570.41)+9.*EXP(-HCK/T*1240.84)
      RETURN
C     40.01
  236 PFGROUND=4.+6.*EXP(-HCK/T*314.67)+8.*EXP(-HCK/T*763.44)+
     1         10.*EXP(-HCK/T*1322.91)
      RETURN
C     40.02
  237 PFGROUND=5.+7.*EXP(-HCK/T*680.5)+9.*EXP(-HCK/T*1485.7)
      RETURN
C     41.00
  241 PFGROUND=2.+4.*EXP(-HCK/T*154.19)+6.*EXP(-HCK/T*391.99)+
     1         8.*EXP(-HCK/T*695.25)+10.*EXP(-HCK/T*1050.26)
      RETURN
C     41.01
  242 PFGROUND=1.+3.*EXP(-HCK/T*158.99)+5.*EXP(-HCK/T*438.38)+
     1         7.*EXP(-HCK/T*801.38)+9.*EXP(-HCK/T*1224.87)
      RETURN
C     41.02
  243 PFGROUND=4.+6.*EXP(-HCK/T*515.8)+8.*EXP(-HCK/T*1176.6)+
     1         10.*EXP(-HCK/T*1939.0)
      RETURN
C     42.00
  247 PFGROUND=7.
      RETURN
C     42.01
  248 PFGROUND=6.
      RETURN
C     42.02
  249 PFGROUND=1.+3.*EXP(-HCK/T*243.10)+5.*EXP(-HCK/T*669.60)+
     1         7.*EXP(-HCK/T*1225.20)+9.*EXP(-HCK/T*1873.80)
      RETURN
C     43.00
  253 PFGROUND=6.
      RETURN
C     43.01
  254 PFGROUND=7.
      RETURN
C     43.02
  255 PFGROUND=6.
      RETURN
C     44.00
  259 PFGROUND=11.+9.*EXP(-HCK/T*1190.64)+7.*EXP(-HCK/T*2091.54)+
     1         5.*EXP(-HCK/T*2713.24)+3.*EXP(-HCK/T*3105.49)
      RETURN
C     44.01
  260 PFGROUND=10.+8.*EXP(-HCK/T*1523.1)+6.*EXP(-HCK/T*2493.9)+
     1         4.*EXP(HCK/T*3104.2)
C     44.02
  261 PFGROUND=9.+7.*EXP(-HCK/T*1158.8)+5.*EXP(-HCK/T*1826.3)+
     1         3.*EXP(-HCK/T*2266.3)+EXP(-HCK/T*2476.0)
C     45.00
  265 PFGROUND=10.+8.*EXP(-HCK/T*1529.97)+6.*EXP(-HCK/T*2598.03)+
     1         4.*EXP(-HCK/T*3472.68)
      RETURN
C     45.01
  266 PFGROUND=9.+7.*EXP(-HCK/T*2401.3)+5.*EXP(-HCK/T*3580.7)
      RETURN
C     45.02
  267 PFGROUND=10.+8.*EXP(-HCK/T*2147.8)+6.*EXP(-HCK/T*3485.7)+
     1         4.*EXP(-HCK/T*4322.0)
      RETURN
C     46.00
  271 PFGROUND=1.
      RETURN
C     46.01
  272 PFGROUND=6.+4.*EXP(-HCK/T*3539.)
      RETURN
C     46.02
  273 PFGROUND=9.+7.*EXP(-HCK/T*3229.3)+5.*EXP(-HCK/T*4687.5)
      RETURN
C     47.00
  277 PFGROUND=2.
      RETURN
C     47.01
  278 PFGROUND=1.
      RETURN
C     47.02
  279 PFGROUND=6.+4.*EXP(-HCK/T*4607.)
      RETURN
C     48.00
  283 PFGROUND=1.
      RETURN
C     48.01
  284 PFGROUND=2.
      RETURN
C     48.02
  285 PFGROUND=1.
      RETURN
C     49.00
  289 PFGROUND=2.+4.*EXP(-HCK/T*2212.598)
      RETURN
C     49.01
  290 PFGROUND=1.
      RETURN
C     49.02
  291 PFGROUND=2.
      RETURN
C     50.00
  295 PFGROUND=1.+3.*EXP(-HCK/T*1691.8)+5.*EXP(-HCK/T*3427.7)
      RETURN
C     50.01
  296 PFGROUND=2.+4.*EXP(-HCK/T*4251.4)
      RETURN
C     50.02
  297 PFGROUND=1.
      RETURN
C     51.00
  301 PFGROUND=4.
      RETURN
C     51.01
  302 PFGROUND=1.+3.*EXP(-HCK/T*3055.0)+5.*EXP(-HCK/T*5659.0)
      RETURN
C     51.03
  303 PFGROUND=2.+4.*EXP(-HCK/T*6576.)
      RETURN
C     52.00
  307 PFGROUND=5.+3.*EXP(-HCK/T*4751.)+EXP(-HCK/T*4707.)
      RETURN
C     52.01
  308 PFGROUND=4.
      RETURN
C     52.02
  309 PFGROUND=1.+3.*EXP(-HCK/T*4756.5)+5.*EXP(-HCK/T*8166.9)
      RETURN
C     53.00
  313 PFGROUND=4.+2.*EXP(-HCK/T*7063.15)
      RETURN
C     53.01
  314 PFGROUND=5.+3.*EXP(-HCK/T*7087.0)+EXP(-HCK/T*6447.9)
      RETURN
C     53.02
  315 PFGROUND=4.
      RETURN
C     54.00
  319 PFGROUND=1.
      RETURN
C     54.01
  320 PFGROUND=4.+2.*EXP(-HCK/T*10537.01)
      RETURN
C     54.02
  321 PFGROUND=5.+3.*EXP(-HCK/T*9794.6)+EXP(-HCK/T*8131.)
      RETURN
C     55.00
  325 PFGROUND=2.
      RETURN
C     55.01
  326 PFGROUND=1.
      RETURN
C     55.02
  327 PFGROUND=4.+2.*EXP(-HCK/T*13884.)
      RETURN
C     56.00
  331 PFGROUND=1.
      RETURN
C     56.01
  332 PFGROUND=2.
      RETURN
C     56.02
  333 PFGROUND=1.
      RETURN
      ENDIF
C      IF(NELION.GT.336)THEN
C     THESE CAN HAVE LOW EXCITED LEVELS
      PFGROUND=1.
      RETURN
      END
      SUBROUTINE PFIRON(NELEM,ION,TLOG8,POTLOW8,PF)
      REAL*8 TLOG8,POTLOW8,PF
      DIMENSION PFTAB(7,56,10,9)
      DIMENSION POTLO(7),POTLOLOG(7)
      DATA POTLO/500.,1000.,2000.,4000.,8000.,16000.,32000./
      DATA POTLOLOG/2.69897,3.,3.30103,3.60206,3.90309,4.20412,4.50515/
      IF(PFTAB(1,1,1,1).EQ.0.)THEN
      OPEN(UNIT=4,FILE='KU2A:[KURUCZ.SYNTHE]PFIRON.DAT',
     1STATUS='OLD',SHARED,READONLY)
      READ(4,1)PFTAB
    1 FORMAT(26X,7F10.3)
      ENDIF
C123456789012345678901234567890
C 20.09        56   199526.     4.211     4.211     4.211     4.211     4.211     4.211     4.211
      TLOG=TLOG8
      POTLOW=POTLOW8
      IF(TLOG.GT.4.)GO TO 20
      IF(TLOG.LT.3.7)GO TO 10
      IT=(TLOG-3.7)/.03+21.
      F=(TLOG-(IT-21)*.03-3.7)/.03
      GO TO 30
   10 IT=(TLOG-3.32)/.02+2.
      IT=MAX(IT,2)
      F=(TLOG-(IT-2)*.02-3.32)/.02
      GO TO 30
   20 IT=(TLOG-4.0)/.05+31.
      IT=MIN(IT,56)
      F=(TLOG-(IT-31)*.05-4.)/.05
   30 LOW=1
      IF(POTLOW.LT.POTLO(LOW))GO TO 32
      DO 31 LOW=2,7
      IF(POTLOW.LT.POTLO(LOW))GO TO 35
   31 CONTINUE
      LOW=7
   32 PF=F*PFTAB(LOW,IT,ION,NELEM-19)+
     1   (1.-F)*PFTAB(LOW,IT-1,ION,NELEM-19)
      RETURN
   35 P=(LOG10(POTLOW)-POTLOLOG(LOW-1))/.30103
      PF=P*(F*PFTAB(LOW,IT,ION,NELEM-19)+
     1   (1.-F)*PFTAB(LOW,IT-1,ION,NELEM-19))+
     2   (1.-P)*(F*PFTAB(LOW-1,IT,ION,NELEM-19)+
     3   (1.-F)*PFTAB(LOW-1,IT-1,ION,NELEM-19))
      RETURN
      END
      SUBROUTINE MOLEC(CODOUT,MODE,NUMBER)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION NUMBER(kw,1)
      REAL*8 NUMBER
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /XABUND/XABUND(99),WTMOLE
      COMMON /XNMOL/XNMOL(kw,160)
      COMMON /IFEQUA/IFEQUA(101),KCOMPS(450),LOCJ(161),CODE(160),
     1               EQUIL(6,160),IDEQUA(25),NEQUA,NUMMOL,NLOC
      COMMON /IFPOP/IFPOP
      DATA IREAD/0/
      IF(IFPOP.EQ.2)GO TO 200
      IF(IREAD.EQ.1)GO TO 200
      IF(IFPRES.EQ.1)GO TO 200
      READ(5,151)NUMMOL
  151 FORMAT(I5)
      DO 155 JMOL=1,NUMMOL
      READ(5,152)CODE(JMOL)
  152 FORMAT(F20.2)
      READ(5,153)(XNMOL(J,JMOL),J=1,NRHOX)
  153 FORMAT(1P8E10.3)
      WRITE(6,154)CODE(JMOL),(XNMOL(J,JMOL),J=1,NRHOX)
  154 FORMAT(F20.2/(1P8E10.3))
  155 CONTINUE
      READ(5,158)
      READ(5,158)(XNATOM(J),RHO(J),J=1,NRHOX)
      WRITE(6,158)(XNATOM(J),RHO(J),J=1,NRHOX)
  158 FORMAT(1P8E10.3)
      READ(5,158)
      READ(5,158)(XNE(J),J=1,NRHOX)
      WRITE(6,158)(XNE(J),J=1,NRHOX)
      IREAD=1
  200 IF(CODOUT.LT.100.)GO TO 300
      DO 201 JMOL=1,NUMMOL
      IF(CODE(JMOL).EQ.CODOUT)GO TO 203
  201 CONTINUE
      WRITE(6,202)CODOUT
  202 FORMAT(22H1BETTER LUCK NEXT TIMEF20.2)
      CALL EXIT
  203 DO 204 J=1,NRHOX
C 204 NUMBER(J,ION)=XNMOL(J,JMOL)
  204 NUMBER(J,1)=XNMOL(J,JMOL)
      RETURN
  300 C=CODOUT
      NN=1
      IF(MODE.EQ.11)NN=(C-DFLOAT( INT(C)))*100.+1.5
      DO 321 I=1,NN
      DO 301 JMOL=1,NUMMOL
      ION=NN-I+1
      IF(CODE(JMOL)+.001.GT.C.AND.CODE(JMOL)-.001.LT.C)GO TO 303
  301 CONTINUE
      GO TO 305
  303 DO 304 J=1,NRHOX
  304 NUMBER(J,ION)=XNMOL(J,JMOL)
      GO TO 321
  305 ID=CODOUT
      DO 311 JMOL=1,NUMMOL
      IF( INT(CODE(JMOL)).EQ.ID)GO TO 313
  311 CONTINUE
      GO TO 400
  313 DO 314 J=1,NRHOX
  314 NUMBER(J,ION)=0.
  321 C=C-.01
      RETURN
  400 ION=(CODOUT-DFLOAT(ID))*100.+1.5
      NN=ION
      IF(MODE.EQ.1)NN=1
      DO 401 J=1,NRHOX
      CALL PFSAHA(J,ID,ION,MODE,NUMBER)
      DO 401 I=1,NN
  401 NUMBER(J,I)=NUMBER(J,I)*XNATOM(J)*XABUND(ID)
      RETURN
      END
      SUBROUTINE NMOLEC(MODE)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /EDENS/EDENS(kw),IFEDNS
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99)
      COMMON /ITER/ ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /XABUND/XABUND(99),WTMOLE
      COMMON /XNSAVE/XNSAVE(kw,25)
      DIMENSION PFP(13),PFM(13),EION(7),PFPLUS(kw),PFMIN(kw)
      EQUIVALENCE (PFP(7),EION(1))
      DIMENSION EQUILJ(160)
      DIMENSION XNZ(kw,25)
      DIMENSION EQ(25),XN(25),XAB(25),DTERM(25),DEQ(625)
      DIMENSION FRAC(kw,6)
      EQUIVALENCE (FRAC(1,1),DEQ(1))
      DIMENSION EQOLD(25)
      COMMON /XNMOL/XNMOL(kw,160)
      COMMON /IFEQUA/IFEQUA(101),KCOMPS(450),LOCJ(161),CODE(160),
     1               EQUIL(6,160),IDEQUA(25),NEQUA,NUMMOL,NLOC
      NEQUA1=NEQUA+1
      NEQNEQ=NEQUA**2
C
   30 DO 31 K=2,NEQUA
      ID=IDEQUA(K)
      IF(ID.LT.100)XAB(K)=DMAX1(XABUND(ID),1.D-20)
   31 CONTINUE
      IF(ID.EQ.100)XAB(NEQUA)=0.
      XNTOT=P(1)/TK(1)
      XN(1)=XNTOT/2.
      IF(T(1).LT.4000.)XN(1)=XNTOT
      X=XN(1)/10.
      DO 32 K=2,NEQUA
   32 XN(K)=X*XAB(K)
      IF(ID.EQ.100)XN(NEQUA)=X
      XNE(1)=X
      DO 110 J=1,NRHOX
      XNTOT=P(J)/TK(J)
      IF(J.EQ.1)GO TO 34
      RATIO=P(J)/P(J-1)
      XNE(J)=XNE(J-1)*RATIO
      DO 33 K=1,NEQUA
   33 XN(K)=XN(K)*RATIO
   34 IF(IFEDNS.EQ.0)GO TO 3334
      DO 3333 K=1,NEQUA
 3333 XN(K)=XNSAVE(J,K)
 3334 CONTINUE
      DO 37 JMOL=1,NUMMOL
      NCOMP=LOCJ(JMOL+1)-LOCJ(JMOL)
      IF(EQUIL(1,JMOL).EQ.0.)GO TO 35
      ION=(CODE(JMOL)-DFLOAT( INT(CODE(JMOL))))*100.+.5
      EQUILJ(JMOL)=0.
      IF(T(J).GT.10000.)GO TO 37
      IF(CODE(JMOL).EQ.101.)THEN
C     FOR 1000 < T < 9000
C     Kurucz, R.L. 1985, A comment on molecular partition functions.
C     Rejected by ApJ Lett.  Center for Astrophysics preprint no. 2162.
C      T10000=T(J)/10000.
C      EQUILJ(JMOL)=EXP(EQUIL(1,JMOL)/TKEV(J)-46.4584+16.3660*T10000-
C     1 49.3992*T10000**2+111.822*T10000**3-149.567*T10000**4+
C     2 106.206*T10000**5-30.8720*T10000**6-1.5*TLOG(J))
      EQUILJ(JMOL)=EXP(EQUIL(1,JMOL)/TKEV(J)-46.4584+(16.3660E-4+
     1 (-49.3992E-8+(111.822E-12+(-149.567E-16+(106.206E-20-30.8720E-24*
     2 T(J))*T(J))*T(J))*T(J))*T(J))*T(J)-1.5*TLOG(J))
      GO TO 37
      ENDIF
      EQUILJ(JMOL)=EXP(EQUIL(1,JMOL)/TKEV(J)-EQUIL(2,JMOL)+
     1(EQUIL(3,JMOL)+(-EQUIL(4,JMOL)+(EQUIL(5,JMOL)-EQUIL(6,JMOL)*
     2T(J))*T(J))*T(J))*T(J)-1.5*(DFLOAT(NCOMP-ION-ION-1))*TLOG(J))
      GO TO 37
   35 IF(NCOMP.GT.1)GO TO 36
      EQUILJ(JMOL)=1.
      GO TO 37
   36 ID=CODE(JMOL)
      ION=NCOMP-1
      CALL PFSAHA(J,ID,NCOMP,12,FRAC)
      EQUILJ(JMOL)=FRAC(J,NCOMP)/FRAC(J,1)*XNE(J)**ION
   37 CONTINUE
      DO 48 K=1,NEQUA
   48 EQOLD(K)=0.
C
C     SET UP 1ST ORDER EQUATIONS FOR THE CHANGE IN NUMBER DENSITY OF
C        EACH ELEMENT.
   50 DO 60 KL=1,NEQNEQ
   60 DEQ(KL)=0.
      EQ(1)=-XNTOT
      K1=1
      KK=1
      DO 61 K=2,NEQUA
      EQ(1)=EQ(1)+XN(K)
      K1=K1+NEQUA
C     K1 IS ACTUALLY 1K
      DEQ(K1)=1.
      EQ(K)=XN(K)-XAB(K)*XN(1)
      KK=KK+NEQUA1
      DEQ(KK)=1.
   61 DEQ(K)=-XAB(K)
      IF(IDEQUA(NEQUA).LT.100)GO TO 62
      EQ(NEQUA)=-XN(NEQUA)
      DEQ(NEQNEQ)=-1.
   62 CONTINUE
      DO 99 JMOL=1,NUMMOL
      NCOMP=LOCJ(JMOL+1)-LOCJ(JMOL)
      IF(NCOMP.EQ.1)GO TO 99
      TERM=EQUILJ(JMOL)
      LOCJ1=LOCJ(JMOL)
      LOCJ2=LOCJ(JMOL+1)-1
      DO 80 LOCK=LOCJ1,LOCJ2
      K=KCOMPS(LOCK)
      IF(K.EQ.NEQUA1)GO TO 79
      TERM=TERM*XN(K)
      GO TO 80
   79 TERM=TERM/XN(NEQUA)
   80 CONTINUE
      EQ(1)=EQ(1)+TERM
      DO 85 LOCK=LOCJ1,LOCJ2
      K=KCOMPS(LOCK)
      IF(K.LT.NEQUA1)GO TO 81
      K=NEQUA
      D=-TERM/XN(K)
      GO TO 82
   81 D=TERM/XN(K)
   82 EQ(K)=EQ(K)+TERM
      NEQUAK=NEQUA*K-NEQUA
      K1=NEQUAK+1
      DEQ(K1)=DEQ(K1)+D
      DO 83 LOCM=LOCJ1,LOCJ2
      M=KCOMPS(LOCM)
      IF(M.EQ.NEQUA1)M=NEQUA
      MK=M+NEQUAK
   83 DEQ(MK)=DEQ(MK)+D
   85 CONTINUE
C
C     CORRECTION TO CHARGE EQUATION FOR NEGATIVE IONS
      K=KCOMPS(LOCJ2)
      IF(IDEQUA(K).NE.100)GO TO 99
      DO 95 LOCK=LOCJ1,LOCJ2
      K=KCOMPS(LOCK)
      D=TERM/XN(K)
      IF(K.EQ.NEQUA)EQ(K)=EQ(K)-TERM-TERM
      NEQUAK=NEQUA*K-NEQUA
      DO 93 LOCM=LOCJ1,LOCJ2
      M=KCOMPS(LOCM)
      IF(M.NE.NEQUA)GO TO 93
      MK=M+NEQUAK
      DEQ(MK)=DEQ(MK)-D-D
   93 CONTINUE
   95 CONTINUE
C
   99 CONTINUE
C
      CALL SOLVIT(DEQ,NEQUA,EQ,DTERM)
      IFERR=0
      SCALE=100.
      DO 105 K=1,NEQUA
      RATIO=ABS(EQ(K)/XN(K))
C     IF(RATIO.GT..001)IFERR=1
      IF(RATIO.GT..0001)IFERR=1
      IF(EQOLD(K)*EQ(K).LT.0.)EQ(K)=EQ(K)*.69
      XNEQ=XN(K)-EQ(K)
      XN100=XN(K)/100.
      IF(XNEQ.LT.XN100)GO TO 101
      XN100=XN(K)*100.
C     IF(XNEQ.GT.XN100)GO TO 102
      XN(K)=XNEQ
      GO TO 105
  101 XN(K)=XN(K)/SCALE
      IF(EQOLD(K)*EQ(K).LT.0.)SCALE=SQRT(SCALE)
      GO TO 105
C 102 XN(K)=XN100
  105 EQOLD(K)=EQ(K)
      IF(IFERR.EQ.1)GO TO 50
C
      DO 107 K=1,NEQUA
  107 XNZ(J,K)=XN(K)
      XNATOM(J)=XN(1)
      RHO(J)=XNATOM(J)*WTMOLE*1.660E-24
      IF(IDEQUA(NEQUA).EQ.100)XNE(J)=XN(NEQUA)
      DO 109 JMOL=1,NUMMOL
      NCOMP=LOCJ(JMOL+1)-LOCJ(JMOL)
      XNMOL(J,JMOL)=EQUILJ(JMOL)
      LOCJ1=LOCJ(JMOL)
      LOCJ2=LOCJ(JMOL+1)-1
      DO 109 LOCK=LOCJ1,LOCJ2
      K=KCOMPS(LOCK)
      IF(K.EQ.NEQUA1)GO TO 108
      XNMOL(J,JMOL)=XNMOL(J,JMOL)*XN(K)
      GO TO 109
  108 XNMOL(J,JMOL)=XNMOL(J,JMOL)/XN(NEQUA)
  109 CONTINUE
  110 CONTINUE
      IF(IFEDNS.EQ.1)GO TO 160
      DO 1111 K=1,NEQUA
      DO 1111 J=1,NRHOX
 1111 XNSAVE(J,K)=XNZ(J,K)
      IF(ITER.LT.NUMITS)GO TO 120
      WRITE(6,112)(J,RHOX(J),T(J),P(J),XNE(J),XNATOM(J),RHO(J),
     1J=1,NRHOX)
  112 FORMAT(1H1,10X,4HRHOX,9X,1HT,11X,1HP,10X,3HXNE,8X,6HXNATOM,
     1 8X,3HRHO/(I5,1P6E12.3))
      NN=(NUMMOL/10)*10
      IF(NN.LT.NUMMOL)NN=NN+10
      DO 111 JMOL1=1,NN,10
      JMOL10=JMOL1+9
  111 WRITE(6,113)(CODE(JMOL),JMOL=JMOL1,JMOL10),(J,(XNMOL(J,JMOL),
     1JMOL=JMOL1,JMOL10),J=1,NRHOX)
  113 FORMAT(1H1,49X,26HMOLECULAR NUMBER DENSITIES/5X,10F12.2/
     1(I5,1P10E12.3))
  120 IF(MODE.EQ.2.OR.MODE.EQ.12)GO TO 149
      DO 125 K=2,NEQUA
      ID=IDEQUA(K)
      IF(ID.EQ.100)GO TO 122
      DO 121 J=1,NRHOX
C     CALCULATE PARTITION FUNCTIONS
      CALL PFSAHA(J,ID,1,3,FRAC)
  121 XNZ(J,K)=XNZ(J,K)/FRAC(J,1)/1.8786E20/SQRT((ATMASS(ID)*T(J))**3)
      GO TO 125
  122 DO 123 J=1,NRHOX
  123 XNZ(J,K)=XNZ(J,K)/2./2.4148E15/T(J)/SQRT(T(J))
  125 CONTINUE
      DO 140 JMOL=1,NUMMOL
      NCOMP=LOCJ(JMOL+1)-LOCJ(JMOL)
      IF(EQUIL(1,JMOL).EQ.0.)GO TO 135
      DO 126 J=1,NRHOX
C 126 XNMOL(J,JMOL)=EXP(EQUIL(1,JMOL)/T(J))
  126 XNMOL(J,JMOL)=EXP(EQUIL(1,JMOL)/TKEV(J))
      AMASS=0.
      LOCJ1=LOCJ(JMOL)
      LOCJ2=LOCJ(JMOL+1)-1
      DO 130 LOCK=LOCJ1,LOCJ2
      K=KCOMPS(LOCK)
      IF(K.EQ.NEQUA1)GO TO 128
      ID=IDEQUA(K)
      IF(ID.LT.100)AMASS=AMASS+ATMASS(ID)
      DO 127 J=1,NRHOX
  127 XNMOL(J,JMOL)=XNMOL(J,JMOL)*XNZ(J,K)
      GO TO 130
  128 DO 129 J=1,NRHOX
  129 XNMOL(J,JMOL)=XNMOL(J,JMOL)/XNZ(J,NEQUA)
  130 CONTINUE
      DO 131 J=1,NRHOX
  131 XNMOL(J,JMOL)=XNMOL(J,JMOL)*1.8786E20*SQRT((AMASS*T(J))**3)
      GO TO 140
  135 ID=CODE(JMOL)
      DO 136 J=1,NRHOX
      CALL PFSAHA(J,ID,NCOMP,3,FRAC)
  136 XNMOL(J,JMOL)=XNMOL(J,JMOL)/FRAC(J,1)
  140 CONTINUE
  149 IF(IFPNCH(ITER).NE.5)RETURN
      WRITE(6,150)
  150 FORMAT(1H1,20X,38HNUMBER DENSITIES / PARTITION FUNCTIONS)
      WRITE(6,151)NUMMOL
      WRITE(7,151)NUMMOL
  151 FORMAT(I5,10H MOLECULES)
      DO 155 JMOL=1,NUMMOL
      WRITE(6,152)CODE(JMOL),(XNMOL(J,JMOL),J=1,NRHOX)
      WRITE(7,152)CODE(JMOL),(XNMOL(J,JMOL),J=1,NRHOX)
  152 FORMAT(F20.2/(1P8E10.3))
  155 CONTINUE
      WRITE(6,158)(XNATOM(J),RHO(J),J=1,NRHOX)
      WRITE(7,158)(XNATOM(J),RHO(J),J=1,NRHOX)
  158 FORMAT(11H XNATOM,RHO/(1P8E10.3))
      RETURN
  160 DO 161 J=1,NRHOX
      XNTOT=P(J)/TK(J)
  161 EDENS(J)=1.5*XNTOT*TK(J)
      DO 180 JMOL=1,NUMMOL
      NCOMP=LOCJ(JMOL+1)-LOCJ(JMOL)
      IF(EQUIL(1,JMOL).EQ.0.)GO TO 175
      DO 166 J=1,NRHOX
      TPLUS=T(J)*1.001
      TMINUS=T(J)*.999
      PFPLUS(J)=EXP(-EQUIL(2,JMOL)+
     1(EQUIL(3,JMOL)+(-EQUIL(4,JMOL)+(EQUIL(5,JMOL)-EQUIL(6,JMOL)*
     2TPLUS)*TPLUS)*TPLUS)*TPLUS)+1.E-30
      PFMIN(J)=EXP(-EQUIL(2,JMOL)+
     1(EQUIL(3,JMOL)+(-EQUIL(4,JMOL)+(EQUIL(5,JMOL)-EQUIL(6,JMOL)*
     2TMINUS)*TMINUS)*TMINUS)*TMINUS)+1.E-30
      IF(CODE(JMOL).NE.101.)GO TO 166
C     FOR 1000 < T < 9000
C     Kurucz, R.L. 1985, A comment on molecular partition functions.
C     Rejected by ApJ Lett.  Center for Astrophysics preprint no. 2162.
      PFMIN(J)=EXP(0.582145+(16.3760+(-49.4684+(112.049+(-149.953+
     1 (106.531-30.9791*TMINUS)*TMINUS)*TMINUS)*TMINUS)*TMINUS)*TMINUS)
     2+1.E-30
      PFPLUS(J)=EXP(0.582145+(16.3760+(-49.4684+(112.049+(-149.953+
     1 (106.531-30.9791*TPLUS)*TPLUS)*TPLUS)*TPLUS)*TPLUS)*TPLUS)
     2+1.E-30
C      PFMIN(J)=EXP(0.582145+16.3760*TMINUS-49.4684*TMINUS**2+112.049*
C     1TMINUS**3-149.953*TMINUS**4+106.531*TMINUS**5-30.9791*TMINUS**6)
C     2+1.E-30
C      PFPLUS(J)=EXP(0.582145+16.3760*TPLUS-49.4684*TPLUS**2+112.049*
C     1TPLUS**3-149.953*TPLUS**4+106.531*TPLUS**5-30.9791*TPLUS**6)
C     2+1.E-30
  166 CONTINUE
      LOCJ1=LOCJ(JMOL)
      LOCJ2=LOCJ(JMOL+1)-1
      DO 170 LOCK=LOCJ1,LOCJ2
      K=KCOMPS(LOCK)
      IF(K.EQ.NEQUA)GO TO 168
      IF(K.GT.NEQUA)GO TO 180
      ID=IDEQUA(K)
      DO 167 J=1,NRHOX
      T(J)=T(J)*1.001
      TK(J)=TK(J)*1.001
      TKEV(J)=TKEV(J)*1.001
      CALL PFSAHA(J,ID,1,3,FRAC)
      PFPLUS(J)=PFPLUS(J)*FRAC(J,1)
      T(J)=T(J)/1.001*.999
      TK(J)=TK(J)/1.001*.999
      TKEV(J)=TKEV(J)/1.001*.999
      CALL PFSAHA(J,ID,1,3,FRAC)
      PFMIN(J)=PFMIN(J)*FRAC(J,1)
      T(J)=T(J)/.999
      TK(J)=TK(J)/.999
  167 TKEV(J)=TKEV(J)/.999
      GO TO 170
  168 CONTINUE
  170 CONTINUE
      DO 171 J=1,NRHOX
  171 EDENS(J)=EDENS(J)+XNMOL(J,JMOL)*TK(J)*
     1(-EQUIL(1,JMOL)/TKEV(J)+(PFPLUS(J)-PFMIN(J))/(PFPLUS(J)+
     2PFMIN(J))*2.*500.)
      GO TO 180
  175 ID=CODE(JMOL)
      DO 177 J=1,NRHOX
      T(J)=T(J)*1.001
      TK(J)=TK(J)*1.001
      TKEV(J)=TKEV(J)*1.001
      CALL PFSAHA(J,ID,NCOMP,5,PFP)
      T(J)=T(J)/1.001*.999
      TK(J)=TK(J)/1.001*.999
      TKEV(J)=TKEV(J)/1.001*.999
      CALL PFSAHA(J,ID,NCOMP,5,PFM)
      T(J)=T(J)/.999
      TK(J)=TK(J)/.999
      TKEV(J)=TKEV(J)/.999
      ION=NCOMP
      PFP(ION)=MAX(PFP(ION),PFM(ION))
      EDENS(J)=EDENS(J)+XNMOL(J,JMOL)*TK(J)*
     1(EION(ION)/TKEV(J)+(PFP(ION)-PFM(ION))/(PFP(ION)+PFM(ION))*
     22.*500.)
  177 CONTINUE
  180 CONTINUE
      DO 181 J=1,NRHOX
  181 EDENS(J)=EDENS(J)/RHO(J)
      RETURN
      END
      SUBROUTINE CONVEC
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /EDENS/EDENS(kw),IFEDNS
      COMMON /FLUX/ FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /HEIGHT/HEIGHT(kw)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/EDENS1(kw),EDENS2(kw),EDENS3(kw),EDENS4(kw),RHO1(kw),
     1            RHO2(kw),RHO3(kw),RHO4(kw),SAVXNE(kw),SAVXNA(kw),
     2            SAVRHO(kw),DILUT(kw),DUMMY(kw,13)
      COMMON /PTOTAL/PTOTAL(kw)
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /RAD/ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      COMMON /XABUND/XABUND(99),WTMOLE
      DIMENSION DTDRHX(kw),ABCONV(kw),DELTAT(kw),ROSST(kw)
      EQUIVALENCE (DTDRHX(1),DLTDLP(1))
      DIMENSION CNVINT(kw),DELHGT(kw)
      CALL DERIV(RHOX,T,DTDRHX,NRHOX)
C     CALCULATE DERIVATIVES BY EVALUATING FUNCTIONS AT + AND - .001
      IFEDNS=1
      DO 10 J=1,NRHOX
      DILUT(J)=1.-EXP(-TAUROS(J))
C     DILUT(J)=PRAD(J)/PRADK(J)
      SAVXNE(J)=XNE(J)
      SAVXNA(J)=XNATOM(J)
      SAVRHO(J)=RHO(J)
      TLOG(J)=TLOG(J)+.0009995003
      T(J)=T(J)*1.001
      TK(J)=TK(J)*1.001
   10 TKEV(J)=TKEV(J)*1.001
      ITEMP=ITEMP+1
      CALL POPS(0.D0,1,XNE)
      DO 11 J=1,NRHOX
C     3.*PRADK IS APPROXIMATELY RADEN THE RADIATION DENSITY
C     PRADK IS USED BECAUSE IT CAN BE RECONSTRUCTED FROM MODEL DECKS
C        WHEREAS RADEN CANNOT
C     RIGOROUSLY THE RADIATION FIELD SHOULD BE RECALCULATED
      EDENS1(J)=EDENS(J)+3.*PRADK(J)/RHO(J)*(1.+DILUT(J)*(1.001**4-1.))
C      WRITE(6,6666)J,EDENS(J),EDENS1(J),PRADK(J),RHO(J),DILUT(J)
      RHO1(J)=RHO(J)
      TLOG(J)=TLOG(J)-.0009995003-.0010005003
      T(J)=T(J)/1.001*.999
      TK(J)=TK(J)/1.001*.999
   11 TKEV(J)=TKEV(J)/1.001*.999
      ITEMP=ITEMP+1
      CALL POPS(0.D0,1,XNE)
      DO 12 J=1,NRHOX
      EDENS2(J)=EDENS(J)+3.*PRADK(J)/RHO(J)*(1.+DILUT(J)*(.999**4-1.))
C      WRITE(6,6666)J,EDENS(J),EDENS2(J),PRADK(J),RHO(J),DILUT(J)
      RHO2(J)=RHO(J)
      TLOG(J)=TLOG(J)+.0010005003
      T(J)=T(J)/.999
      TK(J)=TK(J)/.999
      TKEV(J)=TKEV(J)/.999
   12 P(J)=P(J)*1.001
      ITEMP=ITEMP+1
      CALL POPS(0.D0,1,XNE)
      DO 13 J=1,NRHOX
      EDENS3(J)=EDENS(J)+3.*PRADK(J)/RHO(J)
      RHO3(J)=RHO(J)
   13 P(J)=P(J)/1.001*.999
      ITEMP=ITEMP+1
      CALL POPS(0.D0,1,XNE)
      DO 14 J=1,NRHOX
      EDENS4(J)=EDENS(J)+3.*PRADK(J)/RHO(J)
      RHO4(J)=RHO(J)
      XNE(J)=SAVXNE(J)
      XNATOM(J)=SAVXNA(J)
      RHO(J)=SAVRHO(J)
   14 P(J)=P(J)/.999
      DO 30 J=1,NRHOX
      DEDT=(EDENS1(J)-EDENS2(J))/T(J)*500.
      DRDT=(RHO1(J)-RHO2(J))/T(J)*500.
      DEDPG=(EDENS3(J)-EDENS4(J))/P(J)*500.
      DRDPG=(RHO3(J)-RHO4(J))/P(J)*500.
C
C     CALCULATE THERMODYNAMIC QUANTITIES AND CONVECTIVE FLUX
C     IGNORING PTURB AND ASSUMING PRAD PROPORTIONAL TO T**4
      DPDPG=1.
      DPDT=4.*PRADK(J)/T(J)*DILUT(J)
C     DPDT=4.*PRAD(J)/T(J)
C      WRITE(6,6666)J,DEDT,DEDPG,DRDT,DRDPG,DPDT,DPDPG
C 6666 FORMAT(I10,1P6E12.3)
      DLTDLP(J)=PTOTAL(J)/T(J)/GRAV*DTDRHX(J)
      HEATCV=DEDT-DEDPG*DRDT/DRDPG
      HEATCP(J)=DEDT-DEDPG*DPDT/DPDPG-PTOTAL(J)/RHO(J)**2*(DRDT-
     1DRDPG*DPDT/DPDPG)
      VELSND(J)=SQRT(HEATCP(J)/HEATCV*DPDPG/DRDPG)
      DLRDLT(J)=T(J)/RHO(J)*(DRDT-DRDPG*DPDT/DPDPG)
      GRDADB(J)=-PTOTAL(J)/RHO(J)/T(J)*DLRDLT(J)/HEATCP(J)
      HSCALE(J)=PTOTAL(J)/RHO(J)/GRAV
      VCONV(J)=0.
      FLXCNV(J)=0.
      ABCONV(J)=ABROSS(J)
      DELTAT(J)=0.
      ROSST(J)=0.
      IF(MIXLTH.EQ.0.)GO TO 30
      IF(J.LT.4)GO TO 30
      DEL=DLTDLP(J)-GRDADB(J)
      IF(DEL.LT.0.)GO TO 30
      VCO=.5*MIXLTH*SQRT(MAX(-.5*PTOTAL(J)/RHO(J)*DLRDLT(J),0.D0))
      IF(VCO.EQ.0.)GO TO 30
      FLUXCO=.5*RHO(J)*HEATCP(J)*T(J)*MIXLTH/12.5664
      ROSST(J)=ROSSTAB(T(J),P(J),VTURB(J))
      OLDDELT=0.
C     ITERATE ON THE OPACITY
      ITS30=30
      IF(IFCONV.EQ.0)ITS30=1
      DO 29 IDELTAT=1,ITS30
      DPLUS=ROSSTAB(T(J)+DELTAT(J),P(J),VTURB(J))/ROSST(J)
      DMINUS=ROSSTAB(T(J)-DELTAT(J),P(J),VTURB(J))/ROSST(J)
      ABCONV(J)=2./(1./DPLUS+1./DMINUS)*ABROSS(J)
C      PRINT 5555,J,IDELTAT,T(J),DELTAT(J),DPLUS,ROSST(J),DMINUS,
C     1ABCONV(J),ABROSS(J)
 5555 FORMAT(2I5,1P7E12.3)
      D=8.*5.6697E-5*T(J)**4/(ABCONV(J)*HSCALE(J)*RHO(J))/
     1(FLUXCO*12.5664)/VCO
C     CORRECTION FOR OPTICALLY THIN BUBBLES AFTER MIHALAS
      TAUB=ABCONV(J)*RHO(J)*MIXLTH*HSCALE(J)
      D=D*TAUB**2/(2.+TAUB**2)
C
      D=D**2/2.
      DDD=(DEL/(D+DEL))**2
      IF(DDD.LT..5)GO TO 24
      DELTA=(1.-SQRT(1.-DDD))/DDD
      GO TO 26
   24 DELTA=.5
      TERM=.5
      UP=-1.
      DOWN=2.
   25 UP=UP+2.
      DOWN=DOWN+2.
      TERM=UP/DOWN*DDD*TERM
      DELTA=DELTA+TERM
      IF(TERM.GT.1.E-6)GO TO 25
   26 DELTA=DELTA*DEL**2/(D+DEL)
      VCONV(J)=VCO*SQRT(DELTA)
      FLXCNV(J)=FLUXCO*VCONV(J)*DELTA
      FLXCNV(J)=MAX(FLXCNV(J),0.D0)
      DELTAT(J)=T(J)*MIXLTH*DELTA
      DELTAT(J)=DMIN1(DELTAT(J),T(J)*.15)
      DELTAT(J)=DELTAT(J)*.7+OLDDELT*.3
      IF(DELTAT(J).LT.OLDDELT+.5.AND.DELTAT(J).GT.OLDDELT-.5)GO TO 30
      OLDDELT=DELTAT(J)
   29 CONTINUE
   30 CONTINUE
C
C
C     ELIMINATE ARTIFACTUAL CONVECTION ABOVE THE MAIN CONVECTION ZONE
C     REWRITE CODE IF THERE ARE TWO CONVECTION ZONES
      DO 730 J=3,NRHOX
      K=NRHOX+1-J
      IF(FLXCNV(K).GT.0.)GO TO 731
  730 CONTINUE
      RETURN
  731 DO 732 J=1,K
      L=K+1-J
      IF(FLXCNV(L).EQ.0.)GO TO 733
  732 CONTINUE
  733 DO 734 J=1,L
      VCONV(J)=0.
  734 FLXCNV(J)=0.
CC     PATCH TO REMOVE NUMERICAL ARTIFACTS INCLUDING SINGLE POINT DROPOUTS
C      DO 7735 J=1,NRHOX/2
C 7735 FLXCNV(J)=0.
C      DO 7736 J=1,NRHOX
C 7736 FLXCNV0(J)=FLXCNV(J)
C      DO 7737 J=2,NRHOX-1
C 7737 FLXCNV(J)=.3*FLXCNV0(J-1)+.4*FLXCNV0(J)+.3*FLXCNV0(J+1)
      DO 735 J=1,NRHOX
  735 FLXCNV0(J)=FLXCNV(J)
C
C
C     SMOOTH OVER A SCALE HEIGHT
C     ASSUME OVERSHOOTING BY 0.5 HSCALE IF CONVECTION IS STRONG
C     BUT NONE IF CONVECTION IS WEAK
C     SETTING OVERWT=0. COMPLETE TURNS OFF OVERSHOOTING
      IF(OVERWT.GT.0.)THEN
C     WTCNV=MIN(FLXCNV(NRHOX)/FLUX,1.D0)*OVERWT
C     CORRECTION FROM FIORELLA CASTELLI
      WTCNV=0.
      DO 774 J=1,NRHOX
  774 WTCNV=MAX(WTCNV,FLXCNV(J)/FLUX)
      WTCNV=MIN(WTCNV,1.D0)*OVERWT
      DO 776 J=1,NRHOX
C      DELHGT(J)=MIN(HSCALE(J)*MIXLTH*.5D-5,HEIGHT(NRHOX)-HEIGHT(J),
      DELHGT(J)=MIN(HSCALE(J)*.5D-5*WTCNV,HEIGHT(NRHOX)-HEIGHT(J),
     1HEIGHT(J)-HEIGHT(1))
C      WRITE(6,775)J,HEIGHT(J),DELHGT(J),CNVINT(J)
      FLXCNV0(J)=FLXCNV(J)
  776 FLXCNV1(J)=0.
      CALL INTEG(HEIGHT,FLXCNV,CNVINT,NRHOX,0.D0)
      DO 777 J=NRHOX/2,NRHOX-1
      IF(DELHGT(J).EQ.0.)GO TO 777
C      WRITE(6,775)J,HEIGHT(J),DELHGT(J),CNVINT(J)
  775 FORMAT(I5,1P3E12.3)
      M=MAP1(HEIGHT,CNVINT,NRHOX,HEIGHT(J)-DELHGT(J),CNV1,1)
      M=MAP1(HEIGHT,CNVINT,NRHOX,HEIGHT(J)+DELHGT(J),CNV2,1)
      FLXCNV1(J)=FLXCNV1(J)+(CNV2-CNV1)/DELHGT(J)/2.
  777 CONTINUE
      DO 779 J=1,NRHOX
      FLXCNV1(J)=MAX(FLXCNV1(J),0.D0)
      FLXCNV0(J)=MAX(FLXCNV0(J),0.D0)
  779 FLXCNV(J)=MAX(FLXCNV0(J),FLXCNV1(J))
      ENDIF
C     PATCH TO REMOVE NUMERICAL ARTIFACTS
      DO 7779 J=1,NRHOX/2
 7779 FLXCNV(J)=0.
C
C
      RETURN
      END
      SUBROUTINE HIGH
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /HEIGHT/HEIGHT(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      DIMENSION RHOINV(kw)
C     EQUIVALENCE (RHOINV(1),ABTOT(1))
      DO 1 J=1,NRHOX
    1 RHOINV(J)=1.E-5/RHO(J)
      CALL INTEG(RHOX,RHOINV,HEIGHT,NRHOX,0.D0)
C     CALL INTEG(RHOX,RHOINV,HEIGHT,NRHOX)
      RETURN
      END
      SUBROUTINE TURB
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             OVERWT,FLXCNV0(kw),FLXCNV1(kw),IFCONV
      REAL*8 MIXLTH
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      DO 10 J=1,NRHOX
      VTURB(J)=(TRBFDG*RHO(J)**TRBPOW+TRBSND*VELSND(J)/1.E5+TRBCON)*1.E5
   10 PTURB(J)=RHO(J)*VTURB(J)**2*0.5
      RETURN
      END
      SUBROUTINE KAPP(N,NSTEPS,STEPWT)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IFOP/IFOP(20)
      COMMON /OPS/AHYD(kw),AH2P(kw),AHMIN(kw),SIGH(kw),AHE1(kw),
     1       AHE2(kw),AHEMIN(kw),SIGHE(kw),ACOOL(kw),ALUKE(kw),AHOT(kw),
     2            SIGEL(kw),SIGH2(kw),AHLINE(kw),ALINES(kw),SIGLIN(kw),
     3            AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),SHYD(kw),
     4            SHMIN(kw),SHLINE(kw),SXLINE(kw),SXCONT(kw)
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),
     1              SIGMAL(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      DIMENSION DUMMY(kw,25)
      EQUIVALENCE (AHYD(1),DUMMY(1,1))
      STEPWT=1.
      NSTEPS=1
      IF(N.GT.1)GO TO 200
      DO 91 J=1,NRHOX
      DO 91 I=1,25
   91 DUMMY(J,I)=0.
      IF(IFOP(1).EQ.1)CALL HOP
      IF(IFOP(2).EQ.1)CALL H2PLOP
      IF(IFOP(3).EQ.1)CALL HMINOP
      IF(IFOP(4).EQ.1)CALL HRAYOP
      IF(IFOP(5).EQ.1)CALL HE1OP
      IF(IFOP(6).EQ.1)CALL HE2OP
      IF(IFOP(7).EQ.1)CALL HEMIOP
      IF(IFOP(8).EQ.1)CALL HERAOP
      IF(IFOP(9).EQ.1)CALL COOLOP
      IF(IFOP(10).EQ.1)CALL LUKEOP
      IF(IFOP(11).EQ.1)CALL HOTOP
      IF(IFOP(12).EQ.1)CALL ELECOP
      IF(IFOP(13).EQ.1)CALL H2RAOP
      IF(IFOP(14).EQ.1.AND.N.GT.0)CALL HLINOP
      IF(IFOP(15).EQ.1.AND.N.GT.0)CALL LINOP(N,NSTEPS,STEPWT)
      IF(IFOP(16).EQ.1.AND.N.GT.0)CALL LINSOP(N,NSTEPS,STEPWT)
      IF(IFOP(17).EQ.1.AND.N.GT.0)CALL XLINOP
      IF(IFOP(18).EQ.1.AND.N.GT.0)CALL XLISOP
      IF(IFOP(19).EQ.1)CALL XCONOP
      IF(IFOP(20).EQ.1)CALL XSOP
      DO 100 J=1,NRHOX
      A=AH2P(J)+AHE1(J)+AHE2(J)+AHEMIN(J)+ACOOL(J)+ALUKE(J)+AHOT(J)
      ACONT(J)=A+AHYD(J)+AHMIN(J)+AXCONT(J)
      SCONT(J)=BNU(J)
      IF(ACONT(J).GT.0.)SCONT(J)=(A*BNU(J)+AHYD(J)*SHYD(J)+AHMIN(J)*
     1SHMIN(J)+AXCONT(J)*SXCONT(J))/ACONT(J)
      ALINE(J)=AHLINE(J)+ALINES(J)+AXLINE(J)
      SLINE(J)=BNU(J)
      IF(ALINE(J).GT.0.)SLINE(J)=(AHLINE(J)*SHLINE(J)+ALINES(J)*BNU(J)+
     1AXLINE(J)*SXLINE(J))/ALINE(J)
      SIGMAC(J)=SIGH(J)+SIGHE(J)+SIGEL(J)+SIGH2(J)+SIGX(J)
  100 SIGMAL(J)=SIGLIN(J)+SIGXL(J)
      RETURN
  200 IF(IFOP(15).EQ.1)CALL LINOP(N,NSTEPS,STEPWT)
      IF(IFOP(16).EQ.1)CALL LINSOP(N,NSTEPS,STEPWT)
      DO 201 J=1,NRHOX
      ALINE(J)=AHLINE(J)+ALINES(J)+AXLINE(J)
      IF(ALINE(J).GT.0.)SLINE(J)=(AHLINE(J)*SHLINE(J)+ALINES(J)*BNU(J)+
     1AXLINE(J)*SXLINE(J))/ALINE(J)
  201 SIGMAL(J)=SIGLIN(J)+SIGXL(J)
      RETURN
      END
      SUBROUTINE HOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     REQUIRES FUNCTIONS COULX AND COULFF
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/AHYD(kw),D1(kw,19),SHYD(kw),D2(kw,4)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION CONT(8),BOLT(kw,8),EXLIM(kw),FREET(kw),BOLTEX(kw)
      DATA ITEMP1/0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 15 J=1,NRHOX
      DO 11 N=1,8
   11 BOLT(J,N)=EXP(-(13.595-13.595/DFLOAT(N*N))/TKEV(J))*2.*
     1DFLOAT(N*N)*XNFPH(J,1)/RHO(J)
      DO 12 N=1,6
   12 BOLT(J,N)=BOLT(J,N)*BHYD(J,N)
      FREET(J)=XNE(J)*XNFH(J,2)/RHO(J)/SQRT(T(J))
      XR=XNFPH(J,1)*(2./2./13.595)*TKEV(J)/RHO(J)
      BOLTEX(J)=EXP(-13.427/TKEV(J))*XR
   15 EXLIM(J)=EXP(-13.595/TKEV(J))*XR
   20 DO 21 N=1,8
C   21 CONT(N)=COULX(N,FREQ,1.D0)
   21 CONT(N)=XKARSAS(FREQ,1.D0,N,N)
      FREQ3=FREQ**3
      CFREE=3.6919E8/FREQ3
      C=2.815E29/FREQ3
      DO 32 J=1,NRHOX
      EX=BOLTEX(J)
      IF(FREQ.LT.4.05933E13)EX=EXLIM(J)/EHVKT(J)
      H=(CONT(7)*BOLT(J,7)+CONT(8)*BOLT(J,8)+(EX-EXLIM(J))*C+
     1COULFF(J,1)*FREET(J)*CFREE)*STIM(J)
      S=H*BNU(J)
      DO 31 N=1,6
      H=H+CONT(N)*BOLT(J,N)*(1.-EHVKT(J)/BHYD(J,N))
   31 S=S+CONT(N)*BOLT(J,N)*BNU(J)*STIM(J)/BHYD(J,N)
      AHYD(J)=H
   32 SHYD(J)=S/H
      RETURN
      END
      FUNCTION XKARSAS(FREQ,ZEFF2,N,L)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION FREQ1(29),FREQ2(29),FREQ3(29),FREQ4(29),FREQ5(29)
      DIMENSION FREQ6(29),FREQ7(29),FREQ8(29),FREQ9(29),FREQ10(29)
      DIMENSION FREQ11(29),FREQ12(29),FREQ13(29),FREQ14(29),FREQ15(29)
      DIMENSION X1(29),X2(29),X3(29),X4(29),X5(29)
      DIMENSION X6(29),X7(29),X8(29),X9(29),X10(29)
      DIMENSION X11(29),X12(29),X13(29),X14(29),X15(29)
      DIMENSION X1s(29),X2s(29),X3s(29),X4s(29),X5s(29),X6s(29)
      DIMENSION X2p(29),X3p(29),X4p(29),X5p(29),X6p(29)
      DIMENSION X3d(29),X4d(29),X5d(29),X6d(29)
      DIMENSION X4f(29),X5f(29),X6f(29),X5g(29),X6g(29),X6h(29)
      DIMENSION FREQN(29,15),XN(29,15),XL(29,6,6),FREQN15(29)
      DIMENSION EKARSAS(29)
      EQUIVALENCE (XN(1,1),X1(1)),(FREQN(1,1),FREQ1(1))
      EQUIVALENCE (XN(1,2),X2(1)),(FREQN(1,2),FREQ2(1))
      EQUIVALENCE (XN(1,3),X3(1)),(FREQN(1,3),FREQ3(1))
      EQUIVALENCE (XN(1,4),X4(1)),(FREQN(1,4),FREQ4(1))
      EQUIVALENCE (XN(1,5),X5(1)),(FREQN(1,5),FREQ5(1))
      EQUIVALENCE (XN(1,6),X6(1)),(FREQN(1,6),FREQ6(1))
      EQUIVALENCE (XN(1,7),X7(1)),(FREQN(1,7),FREQ7(1))
      EQUIVALENCE (XN(1,8),X8(1)),(FREQN(1,8),FREQ8(1))
      EQUIVALENCE (XN(1,9),X9(1)),(FREQN(1,9),FREQ9(1))
      EQUIVALENCE (XN(1,10),X10(1)),(FREQN(1,10),FREQ10(1))
      EQUIVALENCE (XN(1,11),X11(1)),(FREQN(1,11),FREQ11(1))
      EQUIVALENCE (XN(1,12),X12(1)),(FREQN(1,12),FREQ12(1))
      EQUIVALENCE (XN(1,13),X13(1)),(FREQN(1,13),FREQ13(1))
      EQUIVALENCE (XN(1,14),X14(1)),(FREQN(1,14),FREQ14(1))
      EQUIVALENCE (XN(1,15),X15(1)),(FREQN(1,15),FREQ15(1))
      EQUIVALENCE (XL(1,1,1),X1s(1)),(XL(1,1,2),X2s(1))
      EQUIVALENCE (XL(1,1,3),X3s(1)),(XL(1,1,4),X4s(1))
      EQUIVALENCE (XL(1,1,5),X5s(1)),(XL(1,1,6),X6s(1))
      EQUIVALENCE (XL(1,2,2),X2p(1)),(XL(1,2,3),X3p(1))
      EQUIVALENCE (XL(1,2,4),X4p(1)),(XL(1,2,5),X5p(1))
      EQUIVALENCE (XL(1,2,6),X6p(1))
      EQUIVALENCE (XL(1,3,3),X3d(1)),(XL(1,3,4),X4d(1))
      EQUIVALENCE (XL(1,3,5),X5d(1)),(XL(1,3,6),X6d(1))
      EQUIVALENCE (XL(1,4,4),X4f(1)),(XL(1,4,5),X5f(1))
      EQUIVALENCE (XL(1,4,6),X6f(1))
      EQUIVALENCE (XL(1,5,5),X5g(1)),(XL(1,5,6),X6g(1))
      EQUIVALENCE (XL(1,6,6),X6h(1))
      DATA FREQ1/
     1    19.516982,   19.164810,   18.915052,   18.563043,   18.120083,
     2    17.828904,   17.521260,   17.174377,   16.931912,   16.747387,
     3    16.600083,   16.377277,   16.215909,   16.094200,   15.999955,
     4    15.925518,   15.866216,   15.817969,   15.745954,   15.676626,
     5    15.613849,   15.562692,   15.533972,   15.525713,   15.521260,
     6    15.518864,   15.518023,   15.517421,   15.516939/
      DATA X1/
     1   -30.274422,  -29.048572,  -28.181067,  -26.962272,  -25.437868,
     2   -24.444170,  -23.404269,  -22.248421,  -21.454163,  -20.858944,
     3   -20.390346,  -19.694283,  -19.200905,  -18.835387,  -18.556686,
     4   -18.339364,  -18.168213,  -18.030238,  -17.826632,  -17.633456,
     5   -17.461067,  -17.322353,  -17.245241,  -17.223162,  -17.211266,
     6   -17.204840,  -17.202587,  -17.200999,  -17.199715/
      DATA X1s/
     1   -30.274422,  -29.048572,  -28.181067,  -26.962272,  -25.437868,
     2   -24.444170,  -23.404269,  -22.248421,  -21.454163,  -20.858944,
     3   -20.390346,  -19.694283,  -19.200905,  -18.835387,  -18.556686,
     4   -18.339364,  -18.168213,  -18.030238,  -17.826632,  -17.633456,
     5   -17.461067,  -17.322353,  -17.245241,  -17.223162,  -17.211266,
     6   -17.204840,  -17.202587,  -17.200999,  -17.199715/
      DATA FREQ2/
     1    19.516949,   19.164737,   18.914922,   18.562750,   18.119270,
     2    17.827313,   17.518023,   17.167149,   16.919200,   16.727792,
     3    16.572317,   16.329852,   16.145327,   15.998094,   15.876964,
     4    15.775097,   15.688665,   15.613849,   15.492095,   15.358548,
     5    15.215909,   15.074566,   14.979337,   14.948961,   14.931912,
     6    14.922531,   14.919200,   14.916804,   14.914879/
      DATA X2/
     1   -31.779474,  -30.553459,  -29.685827,  -28.466543,  -26.940432,
     2   -25.943993,  -24.898608,  -23.729491,  -22.917021,  -22.298979,
     3   -21.803393,  -21.042629,  -20.473370,  -20.025469,  -19.660029,
     4   -19.355246,  -19.098003,  -18.876442,  -18.517855,  -18.127425,
     5   -17.714170,  -17.308930,  -17.038908,  -16.953361,  -16.905447,
     6   -16.879127,  -16.869826,  -16.863085,  -16.857754/
      DATA X2s/
     1   -31.177414,  -29.951530,  -29.083850,  -27.864712,  -26.339031,
     2   -25.343652,  -24.299685,  -23.134693,  -22.327692,  -21.716473,
     3   -21.228927,  -20.487480,  -19.941059,  -19.517455,  -19.178033,
     4   -18.899376,  -18.668043,  -18.471683,  -18.160149,  -17.830286,
     5   -17.492277,  -17.172499,  -16.965517,  -16.901255,  -16.865263,
     6   -16.845632,  -16.838714,  -16.833696,  -16.829681/
      DATA X2p/
     1   -35.779538,  -34.184208,  -33.083933,  -31.512708,  -29.543604,
     2   -28.256123,  -26.903279,  -25.387738,  -24.333408,  -23.531477,
     3   -22.889415,  -21.907557,  -21.178842,  -20.610306,  -20.152156,
     4   -19.774043,  -19.458248,  -19.189136,  -18.759267,  -18.299831,
     5   -17.823327,  -17.365980,  -17.066362,  -16.972218,  -16.919695,
     6   -16.890892,  -16.880696,  -16.873357,  -16.867478/
      DATA FREQ3/
     1    19.516943,   19.164723,   18.914898,   18.562696,   18.119119,
     2    17.827018,   17.517421,   17.165797,   16.916804,   16.724064,
     3    16.566974,   16.320472,   16.130898,   15.977703,   15.849803,
     4    15.740463,   15.646019,   15.562696,   15.423010,   15.261631,
     5    15.074579,   14.863704,   14.696235,   14.635934,   14.600123,
     6    14.579728,   14.572359,   14.567017,   14.562696/
      DATA X3/
     1   -32.659912,  -31.433874,  -30.566210,  -29.346836,  -27.820290,
     2   -26.823453,  -25.777089,  -24.605440,  -23.789519,  -23.167057,
     3   -22.666147,  -21.891933,  -21.306393,  -20.839041,  -20.451712,
     4   -20.122889,  -19.840361,  -19.591597,  -19.176587,  -18.699419,
     5   -18.149566,  -17.533628,  -17.049033,  -16.875774,  -16.773227,
     6   -16.714935,  -16.693926,  -16.678663,  -16.666369/
      DATA X3s/
     1   -31.705705,  -30.479739,  -29.612265,  -28.392746,  -26.866974,
     2   -25.871133,  -24.826672,  -23.659806,  -22.850344,  -22.235989,
     3   -21.744734,  -20.993964,  -20.435725,  -19.998364,  -19.643303,
     4   -19.347420,  -19.097776,  -18.881962,  -18.529746,  -18.137370,
     5   -17.701228,  -17.231454,  -16.873769,  -16.748412,  -16.674666,
     6   -16.633129,  -16.617776,  -16.606984,  -16.598091/
      DATA X3p/
     1   -36.234105,  -34.655854,  -33.538432,  -31.967064,  -29.997698,
     2   -28.709867,  -27.356451,  -25.839127,  -24.782259,  -23.977343,
     3   -23.331485,  -22.340276,  -21.599900,  -21.017917,  -20.544424,
     4   -20.149344,  -19.815760,  -19.527654,  -19.058410,  -18.538322,
     5   -17.967020,  -17.364676,  -16.918642,  -16.765111,  -16.675798,
     6   -16.625318,  -16.607492,  -16.594210,  -16.583614/
      DATA X3d/
     1   -41.364414,  -39.434006,  -38.066663,  -36.143204,  -33.730242,
     2   -32.150245,  -30.487089,  -28.617809,  -27.311427,  -26.313205,
     3   -25.509946,  -24.270587,  -23.339149,  -22.602299,  -21.924436,
     4   -21.493723,  -21.063954,  -20.691590,  -20.080654,  -19.397357,
     5   -18.637161,  -17.823176,  -17.209853,  -16.996234,  -16.871214,
     6   -16.800539,  -16.775144,  -16.756765,  -16.741919/
      DATA FREQ4/
     1    19.516941,   19.164719,   18.914889,   18.562677,   18.119066,
     2    17.826915,   17.517210,   17.165323,   16.915963,   16.722752,
     3    16.565089,   16.317140,   16.125732,   15.970333,   15.839881,
     4    15.727658,   15.630046,   15.543267,   15.395977,   15.221861,
     5    15.011789,   14.756488,   14.527662,   14.435545,   14.377277,
     6    14.342650,   14.329852,   14.320471,   14.312819/
      DATA X4/
     1   -33.284599,  -32.058554,  -31.190879,  -29.971473,  -28.444826,
     2   -27.447836,  -26.401066,  -25.228582,  -24.411413,  -23.787317,
     3   -23.284581,  -22.505775,  -21.914353,  -21.439606,  -21.044235,
     4   -20.705972,  -20.413135,  -20.153596,  -19.714525,  -19.197426,
     5   -18.576241,  -17.824248,  -17.155428,  -16.887819,  -16.719154,
     6   -16.619216,  -16.582315,  -16.555295,  -16.533276/
      DATA X4s/
     1   -32.080641,  -30.854674,  -29.986801,  -28.767697,  -27.241693,
     2   -26.245685,  -25.200974,  -24.033538,  -23.223063,  -22.607845,
     3   -22.115266,  -21.360872,  -20.798453,  -20.355878,  -19.995174,
     4   -19.692644,  -19.435600,  -19.211713,  -18.841933,  -18.420428,
     5   -17.932110,  -17.363567,  -16.873130,  -16.680219,  -16.559751,
     6   -16.488746,  -16.462241,  -16.443053,  -16.427763/
      DATA X4p/
     1   -36.585694,  -35.007703,  -33.890016,  -32.318668,  -30.349350,
     2   -29.061334,  -27.707618,  -26.189677,  -25.132040,  -24.325956,
     3   -23.678826,  -22.684226,  -21.939671,  -21.352566,  -20.873369,
     4   -20.471723,  -20.130813,  -19.835172,  -19.348733,  -18.800381,
     5   -18.178384,  -17.480038,  -16.904760,  -16.685329,  -16.550262,
     6   -16.471169,  -16.442151,  -16.420831,  -16.403759/
      DATA X4d/
     1   -41.585694,  -39.655304,  -38.288039,  -36.364454,  -33.951410,
     2   -32.371226,  -30.707789,  -28.837992,  -27.530994,  -26.531796,
     3   -25.727043,  -24.484484,  -23.549206,  -22.807462,  -22.198909,
     4   -21.686891,  -21.250382,  -20.870478,  -20.243060,  -19.532238,
     5   -18.722925,  -17.815346,  -17.075994,  -16.798160,  -16.628568,
     6   -16.529588,  -16.493472,  -16.467238,  -16.445815/
      DATA X4f/
     1   -47.062815,  -44.780358,  -43.163100,  -40.887314,  -38.030685,
     2   -36.158301,  -34.185235,  -31.963719,  -30.407089,  -29.214529,
     3   -28.252197,  -26.761810,  -25.634821,  -24.737662,  -23.998757,
     4   -23.374580,  -22.839980,  -22.373323,  -21.598611,  -20.713453,
     5   -19.693804,  -18.530997,  -17.563112,  -17.193424,  -16.965517,
     6   -16.832288,  -16.783370,  -16.747717,  -16.718672/
      DATA FREQ5/
     1    19.516940,   19.164717,   18.914886,   18.562668,   18.119042,
     2    17.826867,   17.517112,   17.165103,   16.915573,   16.722143,
     3    16.564213,   16.315589,   16.123320,   15.966880,   15.835211,
     4    15.721601,   15.622449,   15.533972,   15.382871,   15.202143,
     5    14.979337,   14.696203,   14.420029,   14.298047,   14.215909,
     6    14.164752,   14.145327,   14.130897,   14.118999/
      DATA X5/
     1   -33.769146,  -32.543097,  -31.675417,  -30.455996,  -28.929303,
     2   -27.932243,  -26.885239,  -25.712408,  -24.894628,  -24.269941,
     3   -23.766226,  -22.985245,  -22.390846,  -21.912586,  -21.513577,
     4   -21.170761,  -20.873304,  -20.608270,  -20.156957,  -19.619181,
     5   -18.958075,  -18.121143,  -17.308727,  -16.951892,  -16.712503,
     6   -16.563827,  -16.507488,  -16.465627,  -16.431184/
      DATA X5s/
     1   -32.371142,  -31.145245,  -30.277611,  -29.058332,  -27.532386,
     2   -26.536299,  -25.491539,  -24.323724,  -23.512880,  -22.897091,
     3   -22.403960,  -21.648140,  -21.083702,  -20.638728,  -20.275002,
     4   -19.969127,  -19.708598,  -19.480857,  -19.102318,  -18.665521,
     5   -18.148008,  -17.516456,  -16.921283,  -16.663742,  -16.492247,
     6   -16.386117,  -16.345903,  -16.316173,  -16.291778/
      DATA X5p/
     1   -36.866137,  -35.287883,  -34.170413,  -32.599199,  -30.629663,
     2   -29.341564,  -27.987755,  -26.469536,  -25.411517,  -24.604882,
     3   -23.957191,  -22.961135,  -22.214481,  -21.625034,  -21.142933,
     4   -20.738297,  -20.393941,  -20.094254,  -19.599261,  -19.036165,
     5   -18.385686,  -17.626125,  -16.948476,  -16.665818,  -16.480643,
     6   -16.367024,  -16.324502,  -16.292865,  -16.266917/
      DATA X5d/
     1   -41.816885,  -39.886598,  -38.519116,  -36.595706,  -34.182651,
     2   -32.602365,  -30.938792,  -29.068803,  -27.761491,  -26.761551,
     3   -25.956256,  -24.712472,  -23.775049,  -23.031086,  -22.420027,
     4   -21.905038,  -21.464940,  -21.081321,  -20.445565,  -19.720393,
     5   -18.883701,  -17.916497,  -17.077571,  -16.738117,  -16.519620,
     6   -16.387033,  -16.337715,  -16.301341,  -16.271391/
      DATA X5f/
     1   -47.128880,  -44.846322,  -43.229046,  -40.953347,  -38.096716,
     2   -36.224291,  -34.250943,  -32.029199,  -30.472360,  -29.279276,
     3   -28.316408,  -26.824527,  -25.695751,  -24.796176,  -24.054627,
     4   -23.427631,  -22.889877,  -22.419401,  -21.636478,  -20.737351,
     5   -19.690904,  -18.469715,  -17.404053,  -16.973748,  -16.697901,
     6   -16.531879,  -16.469784,  -16.423961,  -16.386588/
      DATA X5g/
     1   -52.894711,  -50.260082,  -48.392958,  -45.765034,  -42.464679,
     2   -40.300146,  -38.017153,  -35.443424,  -33.636754,  -32.250427,
     3   -31.129593,  -29.389103,  -28.068001,  -27.012118,  -26.138711,
     4   -25.398332,  -24.761042,  -24.202462,  -23.268415,  -22.188504,
     5   -20.919298,  -19.415147,  -18.073478,  -17.521544,  -17.163795,
     6   -16.946562,  -16.865194,  -16.805098,  -16.755865/
      DATA FREQ6/
     1    19.516940,   19.164715,   18.914883,   18.562663,   18.119029,
     2    17.826841,   17.517059,   17.164984,   16.915361,   16.721812,
     3    16.563737,   16.314744,   16.122004,   15.964992,   15.832652,
     4    15.718275,   15.618265,   15.528838,   15.375583,   15.191044,
     5    14.960636,   14.659571,   14.348026,   14.199875,   14.094175,
     6    14.025088,   13.998063,   13.977668,   13.960636/
      DATA X6/
     1   -34.165051,  -32.939000,  -32.071317,  -30.851888,  -29.325169,
     2   -28.328071,  -27.280986,  -26.107892,  -25.289843,  -24.664705,
     3   -24.160564,  -23.378190,  -22.782394,  -22.302428,  -21.901012,
     4   -21.555896,  -21.255472,  -20.987585,  -20.529803,  -19.979782,
     5   -19.295022,  -18.402541,  -17.482757,  -17.047424,  -16.737838,
     6   -16.536084,  -16.457331,  -16.397931,  -16.348398/
      DATA X6s/
     1   -32.608820,  -31.382756,  -30.515126,  -29.295866,  -27.769793,
     2   -26.773814,  -25.728819,  -24.560932,  -23.750086,  -23.133811,
     3   -22.640288,  -21.883631,  -21.318035,  -20.871913,  -20.506426,
     4   -20.198858,  -19.936428,  -19.706400,  -19.322760,  -18.877373,
     5   -18.342274,  -17.669792,  -16.995256,  -16.680122,  -16.457336,
     6   -16.312694,  -16.256489,  -16.214113,  -16.178612/
      DATA X6p/
     1   -37.098169,  -35.519950,  -34.402525,  -32.831070,  -30.861699,
     2   -29.573885,  -28.219694,  -26.701459,  -25.643044,  -24.836230,
     3   -24.188105,  -23.191275,  -22.443490,  -21.852666,  -21.369042,
     4   -20.962634,  -20.616374,  -20.314553,  -19.814673,  -19.242970,
     5   -18.575541,  -17.775947,  -17.020568,  -16.681448,  -16.445735,
     6   -16.294606,  -16.235710,  -16.191866,  -16.154983/
      DATA X6d/
     1   -42.024362,  -40.094064,  -38.726686,  -36.803137,  -34.390124,
     2   -32.809866,  -31.146180,  -29.276029,  -27.968300,  -26.968324,
     3   -26.162701,  -24.918051,  -23.979662,  -23.234506,  -22.621799,
     4   -22.105162,  -21.663212,  -21.277514,  -20.637026,  -19.903484,
     5   -19.050185,  -18.044511,  -17.129904,  -16.735338,  -16.467566,
     6   -16.298269,  -16.232977,  -16.184230,  -16.143922/
      DATA X6f/
     1   -47.267412,  -44.984913,  -43.367636,  -41.091842,  -38.235239,
     2   -36.362731,  -34.389528,  -32.167518,  -30.610443,  -29.417223,
     3   -28.453971,  -26.961283,  -25.831491,  -24.930907,  -24.187725,
     4   -23.559075,  -23.019383,  -22.547066,  -21.759545,  -20.852145,
     5   -19.789541,  -18.530522,  -17.390884,  -16.906727,  -16.582667,
     6   -16.380139,  -16.302886,  -16.245236,  -16.197380/
      DATA X6g/
     1   -52.845039,  -50.210247,  -48.343069,  -45.715131,  -42.414728,
     2   -40.250164,  -37.967149,  -35.393156,  -33.586496,  -32.199833,
     3   -31.078643,  -29.337458,  -27.969702,  -26.958401,  -26.083595,
     4   -25.341555,  -24.702345,  -24.141808,  -23.203287,  -22.115356,
     5   -20.830007,  -19.288694,  -17.874057,  -17.268729,  -16.863465,
     6   -16.610369,  -16.513883,  -16.442010,  -16.382570/
      DATA X6h/
     1   -58.850334,  -55.863542,  -53.746437,  -50.766409,  -47.022317,
     2   -44.565391,  -41.972509,  -39.046704,  -36.990356,  -35.410261,
     3   -34.131188,  -32.140740,  -30.626018,  -29.411767,  -28.404701,
     4   -27.548439,  -26.808936,  -26.159088,  -25.067378,  -23.795088,
     5   -22.279431,  -20.436907,  -18.711058,  -17.957760,  -17.446882,
     6   -17.124901,  -17.001376,  -16.909196,  -16.832806/
      DATA FREQ7/
     1    19.516939,   19.164715,   18.914882,   18.562661,   18.119021,
     2    17.826825,   17.517027,   17.164912,   16.915233,   16.721612,
     3    16.563450,   16.314234,   16.121209,   15.963850,   15.831103,
     4    15.716257,   15.615723,   15.525712,   15.371128,   15.184212,
     5    14.948958,   14.635891,   14.298034,   14.127792,   13.999929,
     6    13.912303,   13.876929,   13.849764,   13.826742/
      DATA X7/
     1   -34.499784,  -33.273731,  -32.406047,  -31.186614,  -29.659879,
     2   -28.662758,  -27.615624,  -26.442410,  -25.624138,  -24.998790,
     3   -24.494343,  -23.711394,  -23.114332,  -22.633333,  -22.230699,
     4   -21.884181,  -21.582185,  -21.312152,  -20.849982,  -20.292819,
     5   -19.593097,  -18.663739,  -17.663648,  -17.161477,  -16.785637,
     6   -16.528798,  -16.425342,  -16.345983,  -16.278790/
      DATA FREQ8/
     1    19.516939,   19.164714,   18.914881,   18.562659,   18.119016,
     2    17.826815,   17.517006,   17.164865,   16.915150,   16.721482,
     3    16.563263,   16.313903,   16.120692,   15.963107,   15.830094,
     4    15.714942,   15.614066,   15.523672,   15.368212,   15.179720,
     5    14.941207,   14.619801,   14.262209,   14.073663,   13.925602,
     6    13.819464,   13.775217,   13.740590,   13.710759/
      DATA X8/
     1   -34.789743,  -33.563690,  -32.696004,  -31.476568,  -29.949823,
     2   -28.952576,  -27.905521,  -26.732230,  -25.913849,  -25.288312,
     3   -24.783697,  -24.000359,  -23.402741,  -22.921064,  -22.517235,
     4   -22.169801,  -21.866776,  -21.595595,  -21.130798,  -20.568503,
     5   -19.858590,  -18.903358,  -17.843146,  -17.285660,  -16.849210,
     6   -16.537235,  -16.407454,  -16.306014,  -16.218699/
      DATA FREQ9/
     1    19.516939,   19.164714,   18.914881,   18.562657,   18.119012,
     2    17.826808,   17.516992,   17.164833,   16.915093,   16.721394,
     3    16.563135,   16.313676,   16.120337,   15.962597,   15.829401,
     4    15.714039,   15.612925,   15.522267,   15.366202,   15.176613,
     5    14.935812,   14.608414,   14.235819,   14.032225,   13.866132,
     6    13.741981,   13.688539,   13.645876,   13.608454/
      DATA X9/
     1   -35.045505,  -33.819451,  -32.951765,  -31.732326,  -30.205575,
     2   -29.208318,  -28.161241,  -26.987832,  -26.169441,  -25.543807,
     3   -25.039029,  -24.255440,  -23.657439,  -23.175297,  -22.770919,
     4   -22.422852,  -22.118723,  -21.846749,  -21.380133,  -20.814545,
     5   -20.097359,  -19.123314,  -18.017622,  -17.414518,  -16.923750,
     6   -16.558183,  -16.401026,  -16.275647,  -16.165911/
      DATA FREQ10/
     1    19.516939,   19.164714,   18.914880,   18.562657,   18.119009,
     2    17.826803,   17.516982,   17.164810,   16.915052,   16.721330,
     3    16.563043,   16.313513,   16.120083,   15.962231,   15.828904,
     4    15.713391,   15.612108,   15.521260,   15.364758,   15.174377,
     5    14.931912,   14.600083,   14.215909,   13.999955,   13.817969,
     6    13.676626,   13.613849,   13.562692,   13.516939/
      DATA X10/
     1   -35.274293,  -34.048238,  -33.180551,  -31.961111,  -30.434355,
     2   -29.437090,  -28.389998,  -27.216550,  -26.398051,  -25.772354,
     3   -25.267495,  -24.483312,  -23.885464,  -23.402587,  -22.997820,
     4   -22.649302,  -22.344664,  -22.072514,  -21.604193,  -21.035827,
     5   -20.313639,  -19.326284,  -18.184568,  -17.544349,  -17.005732,
     6   -16.588554,  -16.403642,  -16.253350,  -16.118795/
      DATA FREQ11/
     1    19.516939,   19.164713,   18.914880,   18.562656,   18.119008,
     2    17.826799,   17.516974,   17.164793,   16.915022,   16.721283,
     3    16.562976,   16.313392,   16.119895,   15.961961,   15.828537,
     4    15.712911,   15.611502,   15.520513,   15.363687,   15.172715,
     5    14.929003,   14.593814,   14.200566,   13.974434,   13.778545,
     6    13.621032,   13.548931,   13.488931,   13.434153/
      DATA X11/
     1   -35.481256,  -34.255201,  -33.387514,  -32.168073,  -30.641313,
     2   -29.644043,  -28.596939,  -27.423463,  -26.604924,  -25.979176,
     3   -25.474255,  -24.689915,  -24.091864,  -23.608739,  -23.203681,
     4   -22.854826,  -22.549810,  -22.276842,  -21.807547,  -21.237407,
     5   -20.511071,  -19.513620,  -18.342150,  -17.667949,  -17.093121,
     6   -16.627232,  -16.414294,  -16.237373,  -16.076228/
      DATA FREQ12/
     1    19.516939,   19.164713,   18.914880,   18.562655,   18.119006,
     2    17.826796,   17.516969,   17.164780,   16.914999,   16.721247,
     3    16.562924,   16.313301,   16.119752,   15.961755,   15.828257,
     4    15.712546,   15.611041,   15.519944,   15.362870,   15.171447,
     5    14.926778,   14.588984,   14.188523,   13.953966,   13.745966,
     6    13.573403,   13.492115,   13.423028,   13.358576/
      DATA X12/
     1   -35.670198,  -34.444144,  -33.576456,  -32.357014,  -30.830251,
     2   -29.832977,  -28.785864,  -27.612367,  -26.793798,  -26.168012,
     3   -25.663043,  -24.878583,  -24.280378,  -23.797065,  -23.391784,
     4   -23.042673,  -22.737368,  -22.464078,  -21.994040,  -21.422148,
     5   -20.692935,  -19.687256,  -18.494545,  -17.795069,  -17.183891,
     6   -16.673156,  -16.431990,  -16.227310,  -16.037494/
      DATA FREQ13/
     1    19.516939,   19.164713,   18.914880,   18.562655,   18.119005,
     2    17.826794,   17.516964,   17.164770,   16.914981,   16.721219,
     3    16.562884,   16.313230,   16.119641,   15.961595,   15.828039,
     4    15.712262,   15.610681,   15.519501,   15.362233,   15.170457,
     5    14.925038,   14.585188,   14.178914,   13.937343,   13.718804,
     6    13.532347,   13.442104,   13.363780,   13.289052/
      DATA X13/
     1   -35.844009,  -34.617954,  -33.750266,  -32.530823,  -31.004058,
     2   -30.006781,  -28.959661,  -27.786148,  -26.967555,  -26.341739,
     3   -25.836687,  -25.051753,  -24.453445,  -23.969994,  -23.564544,
     4   -23.215236,  -22.909707,  -22.636559,  -22.165546,  -21.592592,
     5   -20.861125,  -19.849269,  -18.639111,  -17.918166,  -17.276217,
     6   -16.722786,  -16.454970,  -16.222218,  -16.001878/
      DATA FREQ14/
     1    19.516939,   19.164713,   18.914879,   18.562655,   18.119004,
     2    17.826792,   17.516961,   17.164762,   16.914967,   16.721197,
     3    16.562852,   16.313173,   16.119552,   15.961468,   15.827866,
     4    15.712036,   15.610396,   15.519149,   15.361728,   15.169670,
     5    14.923652,   14.582152,   14.171135,   13.923684,   13.695974,
     6    13.496762,   13.397869,   13.310243,   13.224682/
      DATA X14/
     1   -36.004932,  -34.778877,  -33.911189,  -32.691746,  -31.164979,
     2   -30.167699,  -29.120574,  -27.947047,  -27.128436,  -26.502596,
     3   -25.997515,  -25.212506,  -24.614103,  -24.130536,  -23.724949,
     4   -23.375482,  -23.069774,  -22.796032,  -22.324557,  -21.750758,
     5   -21.017491,  -20.000677,  -18.776282,  -18.037692,  -17.368650,
     6   -16.776515,  -16.482568,  -16.221551,  -15.968930/
      DATA FREQ15/
     1    19.516939,   19.164713,   18.914879,   18.562654,   18.119003,
     2    17.826791,   17.516958,   17.164756,   16.914956,   16.721179,
     3    16.562826,   16.313127,   16.119481,   15.961365,   15.827726,
     4    15.711854,   15.610166,   15.518864,   15.361319,   15.169034,
     5    14.922532,   14.579688,   14.164756,   13.912343,   13.676639,
     6    13.465764,   13.358576,   13.261657,   13.164756/
      DATA X15/
     1   -36.154748,  -34.928693,  -34.061005,  -32.841561,  -31.314793,
     2   -30.317511,  -29.270382,  -28.096844,  -27.278218,  -26.652358,
     3   -26.147254,  -25.362186,  -24.763705,  -24.280044,  -23.874346,
     4   -23.524751,  -23.218899,  -22.944996,  -22.473148,  -21.898667,
     5   -21.163944,  -20.143099,  -18.906962,  -18.152646,  -17.460462,
     6   -16.832855,  -16.513888,  -16.224591,  -15.938340/
       DATA EKARSAS/10000.,4444.,2500.,1111.,400.,204.1,100.,44.44,
     1 25.,16.,11.11,6.25,4.,2.778,2.041,1.562,1.235,1.,0.6944,0.4444,
     2 0.25,0.1111,0.04,0.02041,0.01,0.004444,0.0025,0.001111,0./
      FREQLG=LOG10(FREQ/ZEFF2)
      XKARSAS=0.
      IF(L.GE.N.OR.N.GT.6)THEN
      IF(N.GT.15)GO TO 5
      IF(FREQLG.LT.FREQN(29,N))RETURN
      DO 1 I=2,29
      IF(FREQLG.GT.FREQN(I,N))GO TO 2
    1 CONTINUE
    2 X=(FREQLG-FREQN(I,N))/(FREQN(I-1,N)-FREQN(I,N))*
     1(XN(I-1,N)-XN(I,N))+XN(I,N)
      XKARSAS=EXP(X*2.30258509299405E0)/ZEFF2
      RETURN
      ENDIF
      IF(FREQLG.LT.FREQN(29,N))RETURN
      DO 3 I=2,29
      IF(FREQLG.GT.FREQN(I,N))GO TO 4
    3 CONTINUE
    4 X=(FREQLG-FREQN(I,N))/(FREQN(I-1,N)-FREQN(I,N))*
     1(XL(I-1,L+1,N)-XL(I,L+1,N))+XL(I,L+1,N)
      XKARSAS=EXP(X*2.30258509299405E0)/ZEFF2
      RETURN
    5 FREQN15(29)=LOG10(109677.576*2.99792458E10/N**2)
      IF(FREQLG.LT.FREQN15(29))RETURN
      DO 6 I=2,28
      FREQN15(I)=LOG10((EKARSAS(I)+1./N**2)*109677.576*2.99792458E10)
      IF(FREQLG.GT.FREQN15(I))GO TO 7
    6 CONTINUE
      I=29
    7 X=(FREQLG-FREQN15(I))/(FREQN15(I-1)-FREQN15(I))*
     1(XN(I-1,15)-XN(I,15))+XN(I,15)
      XKARSAS=EXP(X*2.30258509299405E0)/ZEFF2
      RETURN
      END
      FUNCTION COULX(N,FREQ,Z)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION A(6),B(6),C(6)
      DATA A/.9916,1.105,1.101,1.101,1.102,1.0986/
      DATA B/2.719E13,-2.375E14,-9.863E13,-5.765E13,-3.909E13,-2.704E13/
      DATA C/-2.268E30,4.077E28,1.035E28,4.593E27,2.371E27,1.229E27/
      IF(FREQ.LT.Z*Z*3.28805E15/DFLOAT(N*N))GO TO 1
      COULX=2.815E29/FREQ/FREQ/FREQ/DFLOAT(N**5)*Z**4
      IF(N.GT.6)RETURN
      IF(N.EQ.1)THEN
      COULX=COULX*COULBF1S(FREQ,Z)
      RETURN
      ENDIF
      COULX=COULX*(A(N)+(B(N)+C(N)*(Z*Z/FREQ))*(Z*Z/FREQ))
      RETURN
    1 COULX=0.
      RETURN
      END
      FUNCTION COULBF1S(FREQ,Z)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION GAUNT1S(151)
      DATA GAUNT1S/
     1 0.7973,0.8094,0.8212,0.8328,0.8439,0.8548,0.8653,0.8754,0.8852,
     2 0.8946,0.9035,0.9120,0.9201,0.9278,0.9351,0.9420,0.9484,0.9544,
     3 0.9601,0.9653,0.9702,0.9745,0.9785,0.9820,0.9852,0.9879,0.9903,
     4 0.9922,0.9938,0.9949,0.9957,0.9960,0.9960,0.9957,0.9949,0.9938,
     5 0.9923,0.9905,0.9884,0.9859,0.9832,0.9801,0.9767,0.9730,0.9688,
     6 0.9645,0.9598,0.9550,0.9499,0.9445,0.9389,0.9330,0.9269,0.9206,
     7 0.9140,0.9071,0.9001,0.8930,0.8856,0.8781,0.8705,0.8627,0.8546,
     8 0.8464,0.8381,0.8298,0.8213,0.8128,0.8042,0.7954,0.7866,0.7777,
     9 0.7685,0.7593,0.7502,0.7410,0.7318,0.7226,0.7134,0.7042,0.6951,
     A 0.6859,0.6767,0.6675,0.6584,0.6492,0.6401,0.6310,0.6219,0.6129,
     1 0.6039,0.5948,0.5859,0.5769,0.5680,0.5590,0.5502,0.5413,0.5324,
     2 0.5236,0.5148,0.5063,0.4979,0.4896,0.4814,0.4733,0.4652,0.4572,
     3 0.4493,0.4415,0.4337,0.4261,0.4185,0.4110,0.4035,0.3962,0.3889,
     4 0.3818,0.3749,0.3680,0.3611,0.3544,0.3478,0.3413,0.3348,0.3285,
     5 0.3222,0.3160,0.3099,0.3039,0.2980,0.2923,0.2866,0.2810,0.2755,
     6 0.2701,0.2648,0.2595,0.2544,0.2493,0.2443,0.2394,0.2345,0.2298,
     7 0.2251,0.2205,0.2160,0.2115,0.2072,0.2029,0.1987/
      COULBF1S=0.
      IF(FREQ/Z**2.LT.3.28805E15)RETURN
      ELOG=LOG10(FREQ/Z**2/3.28805E15)
      I=ELOG/.02
      I=MAX(MIN(I+1,150),1)
      COULBF1S=GAUNT1S(I)+
     1(GAUNT1S(I+1)-GAUNT1S(I))/.02*(ELOG-(I-1)*.02)
      RETURN
      END
      FUNCTION COULFF(J,NZ)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION Z4LOG(6),A(11,12)
      DATA Z4LOG/0.,1.20412,1.90849,2.40824,2.79588,3.11261/
      DATA A/
     15.53,5.49,5.46,5.43,5.40,5.25,5.00,4.69,4.48,4.16,3.85,
     24.91,4.87,4.84,4.80,4.77,4.63,4.40,4.13,3.87,3.52,3.27,
     34.29,4.25,4.22,4.18,4.15,4.02,3.80,3.57,3.27,2.98,2.70,
     43.64,3.61,3.59,3.56,3.54,3.41,3.22,2.97,2.70,2.45,2.20,
     53.00,2.98,2.97,2.95,2.94,2.81,2.65,2.44,2.21,2.01,1.81,
     62.41,2.41,2.41,2.41,2.41,2.32,2.19,2.02,1.84,1.67,1.50,
     71.87,1.89,1.91,1.93,1.95,1.90,1.80,1.68,1.52,1.41,1.30,
     81.33,1.39,1.44,1.49,1.55,1.56,1.51,1.42,1.33,1.25,1.17,
     90.90,0.95,1.00,1.08,1.17,1.30,1.32,1.30,1.20,1.15,1.11,
     A0.55,0.58,0.62,0.70,0.85,1.01,1.15,1.18,1.15,1.11,1.08,
     B0.33,0.36,0.39,0.46,0.59,0.76,0.97,1.09,1.13,1.10,1.08,
     C0.19,0.21,0.24,0.28,0.38,0.53,0.76,0.96,1.08,1.09,1.09/
C     ERROR CORRECTED 13APR88
C     A0.45,0.48,0.52,0.60,0.75,0.91,1.15,1.18,1.15,1.11,1.08,
C
C     GAMLOG=DLOG10(158000*Z*Z/T)*2
      GAMLOG=10.39638-TLOG(J)/1.15129+Z4LOG(NZ)
      IGAM=MAX0(MIN0( INT(GAMLOG+7.),10),1)
C     HVKTLG=DLOG10(HVKT)*2
      HVKTLG=(FREQLG-TLOG(J))/1.15129-20.63764
      IHVKT=MAX0(MIN0( INT(HVKTLG+9.),11),1)
      P=GAMLOG-DFLOAT(IGAM-7)
      Q=HVKTLG-DFLOAT(IHVKT-9)
      COULFF=(1.-P)*((1.-Q)*A(IGAM,IHVKT)+Q*A(IGAM,IHVKT+1))+
     1P*((1.-Q)*A(IGAM+1,IHVKT)+Q*A(IGAM+1,IHVKT+1))
      RETURN
      END
      SUBROUTINE H2PLOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw),AH2P(kw),D2(kw,23)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      IF(FREQ.GT.3.28805E15)RETURN
      FR=-3.0233E3+(3.7797E2+(-1.82496E1+(3.9207E-1-3.1672E-3*FREQLG)*
     1FREQLG)*FREQLG)*FREQLG
      ES=-7.342E-3+(-2.409E-15+(1.028E-30+(-4.230E-46+(1.224E-61-
     1 1.351E-77*FREQ)*FREQ)*FREQ)*FREQ)*FREQ
      DO 10 J=1,NRHOX
   10 AH2P(J)=EXP(-ES/TKEV(J)+FR)*XNFPH(J,1)*2.*BHYD(J,1)*XNFPH(J,2)/
     1RHO(J)*STIM(J)
      RETURN
      END
      SUBROUTINE HMINOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,2),AHMIN(kw),D2(kw,18),SHMIN(kw),D3(kw,3)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION WBF(85),BF(85),FFLOG(22,11),FF(11,22)
      DIMENSION FFBEG(11,11),FFEND(11,11),FFTT(11),WFFLOG(22)
      DIMENSION THETA(kw),FFTHETA(kw),THETAFF(11),WAVEK(22)
      EQUIVALENCE (FF(1,1),FFBEG(1,1)),(FF(1,12),FFEND(1,1))
C     FROM MATHISEN (1984), AFTER WISHART(1979) AND BROAD AND REINHARDT (1976)
      DATA WBF/  18.00,  19.60,  21.40,  23.60,  26.40,  29.80,  34.30,
     1   40.40,  49.10,  62.60, 111.30, 112.10, 112.67, 112.95, 113.05,
     2  113.10, 113.20, 113.23, 113.50, 114.40, 121.00, 139.00, 164.00,
     3  175.00, 200.00, 225.00, 250.00, 275.00, 300.00, 325.00, 350.00,
     4  375.00, 400.00, 425.00, 450.00, 475.00, 500.00, 525.00, 550.00,
     5  575.00, 600.00, 625.00, 650.00, 675.00, 700.00, 725.00, 750.00,
     6  775.00, 800.00, 825.00, 850.00, 875.00, 900.00, 925.00, 950.00,
     7  975.00,1000.00,1025.00,1050.00,1075.00,1100.00,1125.00,1150.00,
     8 1175.00,1200.00,1225.00,1250.00,1275.00,1300.00,1325.00,1350.00,
     9 1375.00,1400.00,1425.00,1450.00,1475.00,1500.00,1525.00,1550.00,
     A 1575.00,1600.00,1610.00,1620.00,1630.00,1643.91/
      DATA BF/   0.067,  0.088,  0.117,  0.155,  0.206,  0.283,  0.414,
     1   0.703,   1.24,   2.33,  11.60,  13.90,  24.30,  66.70,  95.00,
     2   56.60,  20.00,  14.60,   8.50,   7.10,   5.43,   5.91,   7.29,
     3   7.918,  9.453,  11.08,  12.75,  14.46,  16.19,  17.92,  19.65,
     4   21.35,  23.02,  24.65,  26.24,  27.77,  29.23,  30.62,  31.94,
     5   33.17,  34.32,  35.37,  36.32,  37.17,  37.91,  38.54,  39.07,
     6   39.48,  39.77,  39.95,  40.01,  39.95,  39.77,  39.48,  39.06,
     7   38.53,  37.89,  37.13,  36.25,  35.28,  34.19,  33.01,  31.72,
     8   30.34,  28.87,  27.33,  25.71,  24.02,  22.26,  20.46,  18.62,
     9   16.74,  14.85,  12.95,  11.07,  9.211,  7.407,  5.677,  4.052,
     A   2.575,  1.302, 0.8697, 0.4974, 0.1989,    0. /
C    Bell and Berrington J.Phys.B,vol. 20, 801-806,1987.
      DATA WAVEK/.50,.40,.35,.30,.25,.20,.18,.16,.14,.12,.10,.09,.08,
     1 .07,.06,.05,.04,.03,.02,.01,.008,.006/
      DATA THETAFF/
     1  0.5,  0.6, 0.8,  1.0,  1.2,  1.4,  1.6,  1.8,  2.0,  2.8,  3.6/
      DATA FFBEG/
     1.0178,.0222,.0308,.0402,.0498,.0596,.0695,.0795,.0896, .131, .172,   1823
     2.0228,.0280,.0388,.0499,.0614,.0732,.0851,.0972, .110, .160, .211,   2278
     3.0277,.0342,.0476,.0615,.0760,.0908, .105, .121, .136, .199, .262,   2604
     4.0364,.0447,.0616,.0789,.0966, .114, .132, .150, .169, .243, .318,   3038
     5.0520,.0633,.0859, .108, .131, .154, .178, .201, .225, .321, .418,   3645
     6.0791,.0959, .129, .161, .194, .227, .260, .293, .327, .463, .602,   4557
     7.0965, .117, .157, .195, .234, .272, .311, .351, .390, .549, .711,   5063
     8 .121, .146, .195, .241, .288, .334, .381, .428, .475, .667, .861,   5696
     9 .154, .188, .249, .309, .367, .424, .482, .539, .597, .830, 1.07,   6510
     A .208, .250, .332, .409, .484, .557, .630, .702, .774, 1.06, 1.36,   7595
     B .293, .354, .468, .576, .677, .777, .874, .969, 1.06, 1.45, 1.83/   9113
      DATA FFEND/
     1 .358, .432, .572, .702, .825, .943, 1.06, 1.17, 1.28, 1.73, 2.17,  10126
     2 .448, .539, .711, .871, 1.02, 1.16, 1.29, 1.43, 1.57, 2.09, 2.60,  11392
     3 .579, .699, .924, 1.13, 1.33, 1.51, 1.69, 1.86, 2.02, 2.67, 3.31,  13019
     4 .781, .940, 1.24, 1.52, 1.78, 2.02, 2.26, 2.48, 2.69, 3.52, 4.31,  15189
     5 1.11, 1.34, 1.77, 2.17, 2.53, 2.87, 3.20, 3.51, 3.80, 4.92, 5.97,  18227
     6 1.73, 2.08, 2.74, 3.37, 3.90, 4.50, 5.01, 5.50, 5.95, 7.59, 9.06,  22784
     7 3.04, 3.65, 4.80, 5.86, 6.86, 7.79, 8.67, 9.50, 10.3, 13.2, 15.6,  30378
     8 6.79, 8.16, 10.7, 13.1, 15.3, 17.4, 19.4, 21.2, 23.0, 29.5, 35.0,  45567
     9 27.0, 32.4, 42.6, 51.9, 60.7, 68.9, 76.8, 84.2, 91.4, 117., 140.,  91134
     A 42.3, 50.6, 66.4, 80.8, 94.5, 107., 120., 131., 142., 183., 219., 113918
     B 75.1, 90.0, 118., 144., 168., 191., 212., 234., 253., 325., 388./ 151890
      DIMENSION XHMIN(kw)
      DATA ITEMP1,ISTART/0,0/
      IF(ISTART.EQ.0)THEN
      ISTART=1
      DO 2 IWAVE=1,22
C     91.134 NUMBER TAKEN FROM BELL AND BERRINGTON
      WFFLOG(IWAVE)=DLOG(91.134D0/WAVEK(IWAVE))
      DO 2 ITHETA=1,11
    2 FFLOG(IWAVE,ITHETA)=DLOG(FF(ITHETA,IWAVE)*1.E-26)
      ENDIF
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 11 J=1,NRHOX
      THETA(J)=5040./T(J)
C     .754209 HOTOP AND LINEBERGER J.PHYS.CHEM.REF.DATA VOL 14,731-752,1985.
   11 XHMIN(J)=EXP(.754209/TKEV(J))/(2.*2.4148E15*T(J)*SQRT(T(J)))*
     1BMIN(J)*BHYD(J,1)*XNFPH(J,1)*XNE(J)
   20 WAVE=2.99792458E17/FREQ
      WAVELOG=DLOG(WAVE)
      DO 21 ITHETA=1,11
      CALL LINTER(WFFLOG,FFLOG(1,ITHETA),22,WAVELOG,FFTLOG,1)
   21 FFTT(ITHETA)=EXP(FFTLOG)/THETAFF(ITHETA)*5040.*1.380658E-16
      HMINBF=0.
      IF(FREQ.GT.1.82365E14)MAXWAVE=MAP1(WBF,BF,85,WAVE,HMINBF,1)
C     MAXT=MAP1(THETAFF,FFTT,11,THETA,FFTHETA,NRHOX)
      DO 31 J=1,NRHOX
      CALL LINTER(THETAFF,FFTT,11,THETA(J),FFTHETA(J),1)
      HMINFF=FFTHETA(J)*XNFPH(J,1)*2.*BHYD(J,1)*XNE(J)/RHO(J)
      H=HMINBF*1.E-18*(1.-EHVKT(J)/BMIN(J))*XHMIN(J)/RHO(J)
      AHMIN(J)=H+HMINFF
   31 SHMIN(J)=(H*BNU(J)*STIM(J)/(BMIN(J)-EHVKT(J))+HMINFF*BNU(J))/
     1AHMIN(J)
      RETURN
      END
      SUBROUTINE LINTER(XOLD,YOLD,NOLD,XNEW,YNEW,NNEW)
      IMPLICIT REAL*8 (A-H,O-Z)
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
      SUBROUTINE HRAYOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,3),SIGH(kw),D2(kw,21)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      WAVE=2.997925E18/DMIN1(FREQ,2.463D15)
      WW=WAVE**2
      SIG=(5.799E-13+1.422E-6/WW+2.784/(WW*WW))/(WW*WW)
      DO 2 J=1,NRHOX
    2 SIGH(J)=SIG*XNFPH(J,1)*2.*BHYD(J,1)/RHO(J)
      RETURN
      END
      SUBROUTINE HE1OP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     REQUIRES FUNCTIONS COULX AND COULFF
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,4),AHE1(kw),D2(kw,20)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION CHI(10),BOLT(kw,10),EXLIM(kw),HEFREQ(10),TRANS(10),G(10)
      DIMENSION TRANS1S(10),TRANSN(27),BOLTN(kw,27)
      DIMENSION BOLTEX(kw),FREET(kw),AHE1FREE(kw),AHE1BOUND(kw)
      DATA G/1.,3.,1.,9.,3.,3.,1.,9.,20.,3./
      DATA HEFREQ/5.945209E15,1.152844E15,.9603331E15,.8761076E15,
     1 .8147104E15,.4519048E15,.4030971E15,.3821191E15,.3660215E15,
     2 .3627891E15/
      DATA CHI/0.,19.819,20.615,20.964,21.217,22.718,22.920,23.006,
     1 23.073,23.086/
      DATA ITEMP1/0/
      IF(ITEMP.EQ.ITEMP1)GO TO 10
      ITEMP1=ITEMP
      RYD=109722.273*2.99792458E10
      DO 5 J=1,NRHOX
      DO 4 N=1,10
    4 BOLT(J,N)=EXP(-CHI(N)/TKEV(J))*G(N)*XNFPHE(J,1)/RHO(J)
      DO 304 N=4,27
  304 BOLTN(J,N)=EXP(-24.587*(1.-1./N**2)/TKEV(J))*4.*N**2*
     1XNFPHE(J,1)/RHO(J)
      FREET(J)=XNE(J)*XNFHE(J,2)/RHO(J)/SQRT(T(J))
      XR=XNFPHE(J,1)*(4./2./13.595)*TKEV(J)/RHO(J)
      BOLTEX(J)=EXP(-23.730/TKEV(J))*XR
    5 EXLIM(J)=EXP(-24.587/TKEV(J))*XR
   10 FREQ3=FREQ**3
      CFREE=3.6919E8/FREQ3
      C=2.815E29/FREQ3
      DO 15 IMIN=1,10
      IF(HEFREQ(IMIN).LE.FREQ)GO TO 16
   15 CONTINUE
      IMIN=0
      GO TO 40
   16 GO TO (21,22,23,24,25,26,27,28,29,30),IMIN
   21 TRANS(1)=CROSSHE(FREQ)
   22 TRANS(2)=HE12s3S(FREQ)
   23 TRANS(3)=HE12s1S(FREQ)
   24 TRANS(4)=HE12p3P(FREQ)
   25 TRANS(5)=HE12p1P(FREQ)
C     1s3s 3S
   26 TRANS(6)=XKARSAS(FREQ,1.236439D0,3,0)
c     1s3s 1S
   27 TRANS(7)=XKARSAS(FREQ,1.102898D0,3,0)
c     1s3p 3P
   28 TRANS(8)=XKARSAS(FREQ,1.045499D0,3,1)
c     1s3d 3D+1D
   29 TRANS(9)=XKARSAS(FREQ,1.001427D0,3,2)
c     1s3p 1P
   30 TRANS(10)=XKARSAS(FREQ,.9926D0,3,1)
c     HeII n=2
   31 ELIM=527490.06
      FREQHE=(ELIM-171135.000)*2.99792458E10
  776 FORMAT(1P10E13.6)
      IF(FREQ.LT.FREQHE)GO TO 32
      ZEFF2=FREQHE/RYD
      TRANS(5)=TRANS(5)+XKARSAS(FREQ,ZEFF2,1,0)
      FREQHE=(ELIM-169087.)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 32
      ZEFF2=FREQHE/RYD
      TRANS(4)=TRANS(4)+XKARSAS(FREQ,ZEFF2,1,0)
      FREQHE=(ELIM-166277.546)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 32
      ZEFF2=FREQHE/RYD
      TRANS(3)=TRANS(3)+XKARSAS(FREQ,ZEFF2,1,0)
      FREQHE=(ELIM-159856.069)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 32
      ZEFF2=FREQHE/RYD
      TRANS(2)=TRANS(2)+XKARSAS(FREQ,ZEFF2,1,0)
C     HeII n=3
   32 ELIM=588451.59
      FREQHE=(ELIM-186209.471)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 40
      ZEFF2=FREQHE/RYD
      TRANS(10)=TRANS(10)+XKARSAS(FREQ,ZEFF2,1,0)
      FREQHE=(ELIM-186101.)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 40
      ZEFF2=FREQHE/RYD
      TRANS(9)=TRANS(9)+XKARSAS(FREQ,ZEFF2,1,0)
      FREQHE=(ELIM-185564.)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 40
      ZEFF2=FREQHE/RYD
      TRANS(8)=TRANS(8)+XKARSAS(FREQ,ZEFF2,1,0)
      FREQHE=(ELIM-184864.)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 40
      ZEFF2=FREQHE/RYD
      TRANS(7)=TRANS(7)+XKARSAS(FREQ,ZEFF2,1,0)
      FREQHE=(ELIM-183236.)*2.99792458E10
      IF(FREQ.LT.FREQHE)GO TO 40
      ZEFF2=FREQHE/RYD
      TRANS(6)=TRANS(6)+XKARSAS(FREQ,ZEFF2,1,0)
      IF(FREQ.LT.1.25408E+16)GO TO 40
      DO 34 N=4,27
      ZEFF2=4.-3./N**2
   34 TRANSN(N)=XKARSAS(FREQ,ZEFF2,1,0)
   40 DO 45 J=1,NRHOX
      EX=BOLTEX(J)
      IF(FREQ.LT.2.055E14)EX=EXLIM(J)/EHVKT(J)
      HE1=(EX-EXLIM(J))*C
      IF(IMIN.EQ.0)GO TO 44
      DO 41 N=IMIN,10
   41 HE1=HE1+TRANS(N)*BOLT(J,N)
      IF(FREQ.LT.1.25408E+16)GO TO 44
      DO 42 N=4,27
   42 HE1=HE1+TRANSN(N)*BOLTN(J,N)
   44 AHE1BOUND(J)=HE1*STIM(J)
      AHE1FREE(J)=(COULFF(J,1)*FREET(J)*CFREE)*STIM(J)
   45 AHE1(J)=(HE1+COULFF(J,1)*FREET(J)*CFREE)*STIM(J)
C      PRINT 777,AHE1BOUND,AHE1FREE
  777 FORMAT(1P10E12.4)
      RETURN
      END
      FUNCTION CROSSHE(FREQ)
C     Marr, G.V. and West, J.B. Atomic Data and Nuclear Data Tables,
c     vol 18, 497-508, 1976.
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION W(kw),X505(92),X50(16),X20(11),X10(21)
      DATA X505/
     1 7.58, 7.46, 7.33, 7.19, 7.06, 6.94, 6.81, 6.68, 6.55, 6.43,
     2 6.30, 6.18, 6.05, 5.93, 5.81, 5.69, 5.57, 5.45, 5.33, 5.21,
     3 5.10, 4.98, 4.87, 4.76, 4.64, 4.53, 4.42, 4.31, 4.20, 4.09,
     4 4.00, 3.88, 3.78, 3.68, 3.57, 3.47, 3.37, 3.27, 3.18, 3.08,
     5 2.98, 2.89, 2.80, 2.70, 2.61, 2.52, 2.44, 2.35, 2.26, 2.18,
     6 2.10, 2.02, 1.94, 1.86, 1.78, 1.70, 1.63, 1.55, 1.48, 1.41,
     7 1.34, 1.28, 1.21, 1.14, 1.08, 1.02, .961, .903, .847, .792,
     8 .738, .687, .637, .588, .542, .497, .454, .412, .373, .335,
     9 .299, .265, .233, .202, .174, .147, .123, .100,.0795,.0609,
     A.0443,.0315/
      DATA X50/.0315,.0282,.0250,.0220,.0193,.0168,.0145,.0124,.0105,
     1.00885,.00736,.00604,.00489,.00389,.00303,.00231/
      DATA X20/.00231,.00199,.00171,.00145,.00122,.00101,.000832,
     1 .000673,.000535,.000417,.000318/
      DATA X10/.000318,.000274,.000235,.000200,.000168,.000139,.000115,
     1 .000093,.000074,.000057,.000044,.000032,.000023,.000016,.000010,
     2.000006,.000003,.000001,.0000006,.0000003,0./
      CROSSHE=0.
      IF(FREQ.LT.5.945209E15)RETURN
      WAVE=2.99792458E18/FREQ
      IF(WAVE.GT.50.)THEN
      I=93.-(WAVE-50.)/5.
      I=MIN(92,MAX(2,I))
      CROSSHE=((WAVE-(92-I)*5-50)/5.*(X505(I-1)-X505(I))+X505(I))*1.E-18
      RETURN
      ENDIF
      IF(WAVE.GT.20.)THEN
      I=17.-(WAVE-20.)/2.
      I=MIN(16,MAX(2,I))
      CROSSHE=((WAVE-(16-I)*2-20)/2.*(X50(I-1)-X50(I))+X50(I))*1.E-18
      RETURN
      ENDIF
      IF(WAVE.GT.10.)THEN
      I=12.-(WAVE-10.)/1.
      I=MIN(11,MAX(2,I))
      CROSSHE=((WAVE-(11-I)*1-10)/1.*(X20(I-1)-X20(I))+X20(I))*1.E-18
      RETURN
      ENDIF
      I=22.-WAVE/.5
      I=MIN(21,MAX(2,I))
      CROSSHE=((WAVE-(21-I)*.5)/.5*(X10(I-1)-X10(I))+X10(I))*1.E-18
      RETURN
      END
      FUNCTION HE111S(FREQ)
C     FOLLOWING MATHISEN
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION W(64),X(64)
      DATA W/
     1 504.3, 501.5, 498.7, 493.3, 488.1, 480.3, 477.8, 454.0, 443.0,
     2 395.0, 356.4, 348.2, 324.6, 302.0, 298.1, 275.6, 260.6, 256.2,
     3 239.4, 224.6,  220.,  215,   210.,  205.,  200.,  195.,  190.,
     4  185.,  180.,  175.,  170.,  165.,  160.,  155.,  150.,  145.,
     5  135.,  130.,  125.,  120.,  115.,  110.,  105.,  100.,   95.,
     6   90.,   85.,   80.,   75.,   70.,   65.,   60.,   55.,   50.,
     7   45.,   40.,   35.,   30.,   25.,   20.,   15.,   10.,  5.,0./
      DATA X/
     1 7.346, 7.317, 7.259, 7.143, 7.030, 6.857, 6.800, 6.284, 6.041,
     2 4.977, 4.138, 3.961, 3.474, 3.025, 2.945, 2.522, 2.259, 2.179,
     3 1.901, 1.684, 1.61 , 1.53 , 1.45 , 1.38 , 1.30 , 1.22 , 1.14 ,
     4 1.08 , 1.02 , 0.961, 0.903, 0.847, 0.792, 0.738, 0.687, 0.637,
     5 0.542, 0.497, 0.454, 0.412, 0.373, 0.335, 0.299, 0.265, 0.233,
     6 0.202, 0.174, 0.147, 0.124, 0.103,0.0840,0.0676,0.0535,0.0414,
     7.0311,.0266,.0158,.0104,.00637,.00349,.00161,.00054,.000083,0./
      HE111S=0.
      IF(FREQ.LT.5.945209E15)RETURN
      WAVE=2.99792458E18/FREQ
      DO 3 I=2,64
      IF(WAVE.GT.W(I))GO TO 4
    3 CONTINUE
    4 HE111S=((WAVE-W(I))/(W(I-1)-W(I))*(X(I-1)-X(I))+X(I))*1.E-18
      RETURN
      END
      FUNCTION HE12S1S(FREQ)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION FREQ1S(16),X1S(16)
      DATA FREQ1S/
     1    15.947182,   15.913654,   15.877320,   15.837666,   15.794025,
     2    15.745503,   15.690869,   15.628361,   15.555317,   15.467455,
     3    15.357189,   15.289399,   15.251073,   15.209035,   15.162487,
     4    14.982421/
      DATA X1S/
     1   -19.635557,  -19.159345,  -18.958474,  -18.809535,  -18.676481,
     2   -18.546006,  -18.410962,  -18.264821,  -18.100205,  -17.909165,
     3   -17.684370,  -17.557867,  -17.490360,  -17.417876,  -17.349386,
     4   -17.084441/
      HE12S1S=0.
      IF(FREQ.LT.32033.214*2.99792458E10)RETURN
      IF(FREQ.GT.2.4*109722.267*2.99792458E10)GO TO 3
      FREQLG=LOG10(FREQ)
      DO 1 I=2,16
      IF(FREQLG.GT.FREQ1S(I))GO TO 2
    1 CONTINUE
    2 X=(FREQLG-FREQ1S(I))/(FREQ1S(I-1)-FREQ1S(I))*
     1(X1S(I-1)-X1S(I))+X1S(I)
      HE12S1S=EXP(X*2.30258509299405E0)
      RETURN
    3 WAVENO=FREQ/2.99792458E10
      EK=(WAVENO-32033.214)/109722.267
      EPS=2.*(EK-2.612316)/.00322
      HE12S1S=.008175*(484940./WAVENO)**2.71*8.067E-18*
     1(EPS+76.21)**2/(1.+EPS**2)
      RETURN
      END
      FUNCTION HE12S3S(FREQ)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION FREQ3S(16),X3S(16)
      DATA FREQ3S/
     1    15.956523,   15.923736,   15.888271,   15.849649,   15.807255,
     2    15.760271,   15.707580,   15.647601,   15.577992,   15.495055,
     3    15.392451,   15.330345,   15.295609,   15.257851,   15.216496,
     4    15.061770/
      DATA X3S/
     1   -18.426022,  -18.610700,  -18.593051,  -18.543304,  -18.465513,
     2   -18.378707,  -18.278574,  -18.164329,  -18.033346,  -17.882435,
     3   -17.705542,  -17.605584,  -17.553459,  -17.500667,  -17.451318,
     4   -17.266686/
      HE12S3S=0.
      IF(FREQ.LT.38454.691*2.99792458E10)RETURN
      IF(FREQ.GT.2.4*109722.267*2.99792458E10)GO TO 3
      FREQLG=LOG10(FREQ)
      DO 1 I=2,16
      IF(FREQLG.GT.FREQ3S(I))GO TO 2
    1 CONTINUE
    2 X=(FREQLG-FREQ3S(I))/(FREQ3S(I-1)-FREQ3S(I))*
     1(X3S(I-1)-X3S(I))+X3S(I)
      HE12S3S=EXP(X*2.30258509299405E0)
      RETURN
    3 WAVENO=FREQ/2.99792458E10
      EK=(WAVENO-38454.691)/109722.267
      EPS=2.*(EK-2.47898)/.000780
      HE12S3S=.01521*(470310./WAVENO)**3.12*8.067E-18*
     1(EPS-122.4)**2/(1.+EPS**2)
      RETURN
      END
      FUNCTION HE12P1P(FREQ)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION FREQ1P(16),X1P(16)
      DATA FREQ1P/
     1    15.939981,   15.905870,   15.868850,   15.828377,   15.783742,
     2    15.733988,   15.677787,   15.613218,   15.537343,   15.445346,
     3    15.328474,   15.255641,   15.214064,   15.168081,   15.116647,
     4    14.911002/
      DATA X1P/
     1   -18.798876,  -19.685922,  -20.011664,  -20.143030,  -20.091354,
     2   -19.908333,  -19.656788,  -19.367745,  -19.043016,  -18.674484,
     3   -18.240861,  -17.989700,  -17.852015,  -17.702677,  -17.525347,
     4   -16.816344/
      HE12P1P=0.
      IF(FREQ.LT.27175.76*2.99792458E10)RETURN
      IF(FREQ.GT.2.4*109722.267*2.99792458E10)GO TO 3
      FREQLG=LOG10(FREQ)
      DO 1 I=2,16
      IF(FREQLG.GT.FREQ1P(I))GO TO 2
    1 CONTINUE
    2 X=(FREQLG-FREQ1P(I))/(FREQ1P(I-1)-FREQ1P(I))*
     1(X1P(I-1)-X1P(I))+X1P(I)
      HE12P1P=EXP(X*2.30258509299405E0)
      RETURN
    3 WAVENO=FREQ/2.99792458E10
      EK=(WAVENO-27175.76)/109722.267
      EPS1S=2.*(EK-2.446534)/.01037
      EPS1D=2.*(EK-2.59427)/.00538
C     bug reported by Y. Takeda 21jan94
C      HE12S1P=.0009487*(466750./WAVENO)**3.69*8.067E-18*
      HE12P1P=.0009487*(466750./WAVENO)**3.69*8.067E-18*
     1((EPS1S-29.30)**2/(1.+EPS1S**2)+(EPS1D+172.4)**2/(1.+EPS1D**2))
      RETURN
      END
      FUNCTION HE12P3P(FREQ)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      DIMENSION FREQ3P(16),X3P(16)
      DATA FREQ3P/
     1    15.943031,   15.909169,   15.872441,   15.832318,   15.788107,
     2    15.738880,   15.683351,   15.619667,   15.545012,   15.454805,
     3    15.340813,   15.270195,   15.230054,   15.185821,   15.136567,
     4    14.942557/
      DATA X3P/
     1   -19.791021,  -19.697886,  -19.591421,  -19.471855,  -19.337053,
     2   -19.183958,  -19.009750,  -18.807990,  -18.570571,  -18.288361,
     3   -17.943476,  -17.738737,  -17.624154,  -17.497163,  -17.403183,
     4   -17.032999/
      HE12P3P=0.
      IF(FREQ.LT.29223.753*2.99792458E10)RETURN
      FREQLG=LOG10(FREQ)
      DO 1 I=2,16
      IF(FREQLG.GT.FREQ3P(I))GO TO 2
    1 CONTINUE
    2 X=(FREQLG-FREQ3P(I))/(FREQ3P(I-1)-FREQ3P(I))*
     1(X3P(I-1)-X3P(I))+X3P(I)
      HE12P3P=EXP(X*2.30258509299405E0)
      RETURN
      END
      SUBROUTINE HE2OP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     REQUIRES FUNCTIONS COULX AND COULFF
C     FREQUENCIES ARE 4X HYDROGEN,CHI ARE FOR ION POT=54.403
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,5),AHE2(kw),D2(kw,19)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION CONT(9),BOLT(kw,9),EXLIM(kw),FREET(kw),BOLTEX(kw)
      DIMENSION AHE2BOUND(kw),AHE2FREE(kw)
      DATA ITEMP1/0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 15 J=1,NRHOX
      DO 14 N=1,9
   14 BOLT(J,N)=EXP(-(54.403-54.403/DFLOAT(N*N))/TKEV(J))*2.*
     1DFLOAT(N*N)*XNFPHE(J,2)/RHO(J)
      FREET(J)=XNE(J)*XNFHE(J,3)/RHO(J)/SQRT(T(J))
      XR=XNFPHE(J,2)*(2./2./13.595)*TKEV(J)/RHO(J)
      BOLTEX(J)=EXP(-53.859/TKEV(J))*XR
   15 EXLIM(J)=EXP(-54.403/TKEV(J))*XR
   20 DO 21 N=1,9
C   21 CONT(N)=COULX(N,FREQ,2.D0)
   21 CONT(N)=XKARSAS(FREQ,4.D0,N,N)
      FREQ3=FREQ**3
      CFREE=3.6919E8/FREQ3*4.
      C=2.815E29*2.*2./FREQ3
      DO 35 J=1,NRHOX
      EX=BOLTEX(J)
      IF(FREQ.LT.1.31522E14)EX=EXLIM(J)/EHVKT(J)
      HE2=(EX-EXLIM(J))*C
      DO 31 N=1,9
   31 HE2=HE2+CONT(N)*BOLT(J,N)
      AHE2BOUND(J)=HE2*STIM(J)
      AHE2FREE(J)=(COULFF(J,2)*CFREE*FREET(J))*STIM(J)
   35 AHE2(J)=(HE2+COULFF(J,2)*CFREE*FREET(J))*STIM(J)
C      PRINT 777,AHE2BOUND,AHE2FREE
  777 FORMAT(1P10E12.4)
      RETURN
      END
      SUBROUTINE HEMIOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,6),AHEMIN(kw),D2(kw,18)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      A=3.397E-46+(-5.216E-31+7.039E-15/FREQ)/FREQ
      B=-4.116E-42+(1.067E-26+8.135E-11/FREQ)/FREQ
      C=5.081E-37+(-8.724E-23-5.659E-8/FREQ)/FREQ
      DO 3 J=1,NRHOX
    3 AHEMIN(J)=(A*T(J)+B+C/T(J))*XNE(J)*XNFPHE(J,1)/RHO(J)
      RETURN
      END
      SUBROUTINE HERAOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,7),SIGHE(kw),D2(kw,17)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      WAVE=2.997925E18/DMIN1(FREQ,5.15D15)
      WW=WAVE**2
      SIG=5.484E-14/WW/WW*(1.+(2.44E5+5.94E10/(WW-2.90E5))/WW)**2
      DO 2 J=1,NRHOX
    2 SIGHE(J)=SIG*XNFPHE(J,1)/RHO(J)
      RETURN
      END
      SUBROUTINE COOLOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     SI1,MG1,AL1,C1,FE1
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /OPS/D1(kw,8),ACOOL(kw),D2(kw,16)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /XNFP/XNFPC(kw,4),XNFPN(kw,5),XNFPO(kw,6),XNFPNE(kw,6),
     1             XNFPAL(kw,1),XNFPMG(kw,2),XNFPSI(kw,2),XNFPCA(kw,2),
     2             XNFPFE(kw,1),XNFPCH(kw),XNFPOH(kw)
      REAL*8 MG1OP
      REAL*8 AH2COLL(kw)
      IF(FREQ.GT.3.28805E15)RETURN
      CALL H2COLLOP(AH2COLL)
      DO 20 J=1,NRHOX
   20 ACOOL(J)=(C1OP(J)*XNFPC(J,1)+MG1OP(J)*XNFPMG(J,1)+
     1AL1OP(J)*XNFPAL(J,1)+SI1OP(J)*XNFPSI(J,1)+FE1OP(J)*XNFPFE(J,1)+
     2CHOP(J)*XNFPCH(J)+OHOP(J)*XNFPOH(J))*STIM(J)/RHO(J)+AH2COLL(J)
      RETURN
      END
      FUNCTION C1OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES THE PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION C1240(kw),C1444(kw)
      RYD=109732.298
      DATA FREQ1,ITEMP1/0.,0/
      IF(ITEMP.EQ.ITEMP1)GO TO 30
      ITEMP1=ITEMP
      DO 20 K=1,NRHOX
      C1240(K)=5.*EXP(-1.264/TKEV(K))
   20 C1444(K)=EXP(-2.683/TKEV(K))
   30 IF(FREQ.EQ.FREQ1)GO TO 40
      RYD=109732.298
      WAVENO=FREQ/2.99792458E10
c      XS=0.
      XS0=0.
      XS1=0.
c      XD=0.
      XD0=0.
      XD1=0.
      XD2=0.
c      XP=0.
      X1444=0.
      X1240=0.
      X1100=0.
      IF(FREQ.GE.2.7254E15)X1100=
C  P2 3P   1
C     LIMIT 2P0.5 90820.42
c      IF(WAVENO.LT.90777.000)GO TO 30
C     Luo, D. and Pradhan, A.K. 1989, J.Phys. B, 22, 3377-3395.
     1 10.**(-16.80-(WAVENO-90777.000)/3./RYD)
c     1SEATON(2.7254D15,1.219D-17,2.D0,3.317D0)
c
      IF(FREQ.GE.2.4196E15)THEN
C  P2 1D   2
C     LIMIT 2P0.5 90820.42
c      IF(WAVENO.LT.80627.760)GO TO 30
C     Luo, D. and Pradhan, A.K. 1989, J.Phys. B, 22, 3377-3395.
      XD0=10.**(-16.80-(WAVENO-80627.760)/3./RYD)
C     Fit to Burke, P.G. and Taylor, K.T. 1979, J. Phys. B, 12, 2971-2984.
      EPS=(WAVENO-93917.)*2./9230.
      A=22.E-18
      B=26.E-18
      XD1=(A*EPS+B)/(EPS**2+1.)
C     Fit to Burke, P.G. and Taylor, K.T. 1979, J. Phys. B, 12, 2971-2984.
      EPS=(WAVENO-111130.)*2./2743.
      A=-10.5E-18
      B=46.E-18
      XD2=(A*EPS+B)/(EPS**2+1.)
      X1240=XD0+XD1+XD2
      ENDIF
c     1SEATON(2.4196D15,1.03D-17,1.5D0,2.789D0)
c
      IF(FREQ.GE.2.0761E15)THEN
C  P2 1S   3
C     LIMIT 2P0.5 90820.42
C      IF(WAVENO.LT.69172.400)GO TO 30
C     Luo, D. and Pradhan, A.K. 1989, J.Phys. B, 22, 3377-3395.
      XS0=10.**(-16.80-(WAVENO-69172.400)/3./RYD)
      EPS=(WAVENO-97700.)*2./2743.
      A=68.E-18
      B=118.E-18
C     Fit to Burke, P.G. and Taylor, K.T. 1979, J. Phys. B, 12, 2971-2984.
      XS1=(A*EPS+B)/(EPS**2+1.)
      X1444=XS0+XS1
      ENDIF
c     1SEATON(2.0761D15,9.59D-18,1.5D0,3.501D0)
c
      FREQ1=FREQ
   40 C1OP=X1100*9.+X1240*C1240(J)+X1444*C1444(J)
c   30 PRINT 1,WAVE,WAVENO,XS,XS0,XS1,XD,XD0,XD1,XD2,XP
c    1 FORMAT(F8.1,F10.1,1P8E11.3)
      RETURN
      END
      FUNCTION SEATON(FREQ0,XSECT,POWER,A)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      SEATON=XSECT*(A+(1.-A)*(FREQ0/FREQ))*
     1SQRT((FREQ0/FREQ)**( INT(2.*POWER+.01)))
      RETURN
      END
      FUNCTION MG1OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES THE PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      REAL*8 MG1OP
      DIMENSION FLOG(9),FREQMG(7),PEACH(7,15),X(7),TLG(7),DT(kw),NT(kw)
      DATA PEACH/
C        4000     5000     6000     7000     8000     9000    10000     WAVE(A)
     1 -42.474, -42.350, -42.109, -41.795, -41.467, -41.159, -40.883,   1500
     2 -41.808, -41.735, -41.582, -41.363, -41.115, -40.866, -40.631,   1550
     3 -41.273, -41.223, -41.114, -40.951, -40.755, -40.549, -40.347,   1621
     4 -45.583, -44.008, -42.957, -42.205, -41.639, -41.198, -40.841,   1622
     5 -44.324, -42.747, -41.694, -40.939, -40.370, -39.925, -39.566,   2513
     6 -50.969, -48.388, -46.630, -45.344, -44.355, -43.568, -42.924,   2514
     7 -50.633, -48.026, -46.220, -44.859, -43.803, -42.957, -42.264,   3756
     8 -53.028, -49.643, -47.367, -45.729, -44.491, -43.520, -42.736,   3757
     9 -51.785, -48.352, -46.050, -44.393, -43.140, -42.157, -41.363,   6549
     T -52.285, -48.797, -46.453, -44.765, -43.486, -42.480, -41.668,   6550
     1 -52.028, -48.540, -46.196, -44.507, -43.227, -42.222, -41.408,   7234
     2 -52.384, -48.876, -46.513, -44.806, -43.509, -42.488, -41.660,   7235
     3 -52.363, -48.856, -46.493, -44.786, -43.489, -42.467, -41.639,   7291
     4 -54.704, -50.772, -48.107, -46.176, -44.707, -43.549, -42.611,   7292
     5 -54.359, -50.349, -47.643, -45.685, -44.198, -43.027, -42.418/   9000
      DATA FREQMG/1.9341452E15,1.8488510E15,1.1925797E15,7.9804046E14,
     1 4.5772110E14,4.1440977E14,4.1113514E14/
      DATA FLOG/35.23123,35.19844,35.15334,34.71490,34.31318,33.75728,
     1 33.65788,33.64994,33.43947/
      DATA TLG/8.29405,8.51719,8.69951,8.85367,8.98720,9.10498,9.21034/
      DATA FREQ1,ITEMP1/0.,0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 11 K=1,NRHOX
      N=MAX0(MIN0(6, INT(T(K)/1000.)-3),1)
      NT(K)=N
   11 DT(K)=(TLOG(K)-TLG(N))/(TLG(N+1)-TLG(N))
      GO TO 21
   20 IF(FREQ.EQ.FREQ1)GO TO 30
   21 FREQ1=FREQ
      DO 22 N=1,7
      IF(FREQ.GT.FREQMG(N))GO TO 23
   22 CONTINUE
      N=8
   23 D=(FREQLG-FLOG(N))/(FLOG(N+1)-FLOG(N))
      IF(N.GT.2)N=2*N-2
      D1=1.-D
      DO 24 IT=1,7
   24 X(IT)=PEACH(IT,N+1)*D+PEACH(IT,N)*D1
   30 N=NT(J)
      MG1OP=EXP(X(N)*(1.-DT(J))+X(N+1)*DT(J))
      RETURN
      END
      FUNCTION AL1OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES THE PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      AL1OP=0.
      IF(FREQ.GE.1.443E15)AL1OP=6.5E-17*(1.443E15/FREQ)**5*6.
      RETURN
      END
      FUNCTION SI1OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES THE PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION FLOG(11),FREQSI(9),X(9),TLG(9),DT(kw),NT(kw)
      DIMENSION PEACH(9,19)
      DATA PEACH/
C       4000   5000   6000   7000   8000   9000   10000  11000  12000   WAVE(A)
     1 38.136,38.138,38.140,38.141,38.143,38.144,38.144,38.145,38.145,  1200
     2 37.834,37.839,37.843,37.847,37.850,37.853,37.855,37.857,37.858,  1400
     3 37.898,37.898,37.897,37.897,37.897,37.896,37.895,37.895,37.894,  1519
     4 40.737,40.319,40.047,39.855,39.714,39.604,39.517,39.445,39.385,  1520
     5 40.581,40.164,39.893,39.702,39.561,39.452,39.366,39.295,39.235,  1676
     6 45.521,44.456,43.753,43.254,42.878,42.580,42.332,42.119,41.930,  1677
     7 45.520,44.455,43.752,43.251,42.871,42.569,42.315,42.094,41.896,  1978
     8 55.068,51.783,49.553,47.942,46.723,45.768,44.997,44.360,43.823,  1979
     9 53.868,50.369,48.031,46.355,45.092,44.104,43.308,42.652,42.100,  5379
     T 54.133,50.597,48.233,46.539,45.261,44.262,43.456,42.790,42.230,  5380
     1 54.051,50.514,48.150,46.454,45.176,44.175,43.368,42.702,42.141,  5624
     2 54.442,50.854,48.455,46.733,45.433,44.415,43.592,42.912,42.340,  5625
     3 54.320,50.722,48.313,46.583,45.277,44.251,43.423,42.738,42.160,  6260
     4 55.691,51.965,49.444,47.615,46.221,45.119,44.223,43.478,42.848,  6261
     5 55.661,51.933,49.412,47.582,46.188,45.085,44.189,43.445,42.813,  6349
     6 55.973,52.193,49.630,47.769,46.349,45.226,44.314,43.555,42.913,  6350
     7 55.922,52.141,49.577,47.715,46.295,45.172,44.259,43.500,42.858,  6491
     8 56.828,52.821,50.110,48.146,46.654,45.477,44.522,43.730,43.061,  6492
     9 56.657,52.653,49.944,47.983,46.491,45.315,44.360,43.569,42.901/  6900
C     3P,1D,1S,1D,3D,3F,1D,3P
      DATA FREQSI/2.1413750E15,1.9723165E15,1.7879689E15,1.5152920E15,
     1 5.5723927E14,5.3295914E14,4.7886458E14,4.7216422E14,4.6185133E14/
      DATA FLOG/35.45438,35.30022,35.21799,35.11986,34.95438,33.95402,
     1 33.90947,33.80244,33.78835,33.76626,33.70518/
      DATA TLG/8.29405,8.51719,8.69951,8.85367,8.98720,9.10498,9.21034,
     1 9.30565,9.39266/
      DATA FREQ1,ITEMP1/0.,0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 11 K=1,NRHOX
      N=MAX0(MIN0(8, INT(T(K)/1000.)-3),1)
      NT(K)=N
   11 DT(K)=(TLOG(K)-TLG(N))/(TLG(N+1)-TLG(N))
      GO TO 21
   20 IF(FREQ.EQ.FREQ1)GO TO 30
   21 FREQ1=FREQ
      DO 22 N=1,9
      IF(FREQ.GT.FREQSI(N))GO TO 23
   22 CONTINUE
      N=10
   23 D=(FREQLG-FLOG(N))/(FLOG(N+1)-FLOG(N))
      IF(N.GT.2)N=2*N-2
      D1=1.-D
      DO 24 IT=1,9
   24 X(IT)=PEACH(IT,N+1)*D+PEACH(IT,N)*D1
   30 N=NT(J)
      SI1OP=EXP(-(X(N)*(1.-DT(J))+X(N+1)*DT(J)))*9.
      RETURN
      END
      FUNCTION FE1OP(J)
C     CROSS-SECTION TIMES PARTITION FUNCTION
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      DIMENSION BOLT(48,kw),G(48),E(48),WNO(48),XSECT(48)
      DATA G/25.,35.,21.,15.,9.,35.,33.,21.,27.,49.,9.,21.,27.,9.,9.,
     1 25.,33.,15.,35.,3.,5.,11.,15.,13.,15.,9.,21.,15.,21.,25.,35.,
     2 9.,5.,45.,27.,21.,15.,21.,15.,25.,21.,35.,5.,15.,45.,35.,55.,25./
      DATA E/500.,7500.,12500.,17500.,19000.,19500.,19500.,21000.,
     1 22000.,23000.,23000.,24000.,24000.,24500.,24500.,26000.,26500.,
     2 26500.,27000.,27500.,28500.,29000.,29500.,29500.,29500.,30000.,
     3 31500.,31500.,33500.,33500.,34000.,34500.,34500.,35000.,35500.,
     4 37000.,37000.,37000.,38500.,40000.,40000.,41000.,41000.,43000.,
     5 43000.,43000.,43000.,44000./
      DATA WNO/63500.,58500.,53500.,59500.,45000.,44500.,44500.,43000.,
     1 58000.,41000.,54000.,40000.,40000.,57500.,55500.,38000.,57500.,
     2 57500.,37000.,54500.,53500.,55000.,34500.,34500.,34500.,34000.,
     3 32500.,32500.,32500.,32500.,32000.,29500.,29500.,31000.,30500.,
     4 29000.,27000.,54000.,27500.,24000.,47000.,23000.,44000.,42000.,
     5 42000.,21000.,42000.,42000./
      DATA ITEMP1/0/,FREQ1/0./
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 10 K=1,NRHOX
      DO 10 I=1,48
   10 BOLT(I,K)=G(I)*EXP(-E(I)*2.99792458E10*HKT(K))
   20 IF(FREQ.EQ.FREQ1)GO TO 30
      FREQ1=FREQ
      WAVENO=FREQ/2.99792458E10
      IF(WAVENO.LT.21000.)GO TO 30
      DO 25 I=1,48
      XSECT(I)=0.
      IF(WNO(I).LT.WAVENO)
     1XSECT(I)= 3.E-18/(1.+((WNO(I)+3000.-WAVENO)/WNO(I)/.1)**4)
   25 CONTINUE
   30 FE1OP=0.
      IF(WAVENO.LT.21000.)RETURN
      DO 35 I=1,48
   35 FE1OP=FE1OP+XSECT(I)*BOLT(I,J)
      RETURN
      END
      FUNCTION CHOP(J)
C     CROSS-SECTION TIMES PARTITION FUNCTION
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      DIMENSION CROSSCH(15,105),PARTCH(41),CROSSCHT(15)
      DIMENSION C1(150),C2(150),C3(150),C4(150),C5(150)
      DIMENSION C6(150),C7(150),C8(150),C9(150),C10(150)
      DIMENSION C11(75)
      EQUIVALENCE (CROSSCH(1, 1),C1(1)),(CROSSCH(1,11),C2(1))
      EQUIVALENCE (CROSSCH(1,21),C3(1)),(CROSSCH(1,31),C4(1))
      EQUIVALENCE (CROSSCH(1,41),C5(1)),(CROSSCH(1,51),C6(1))
      EQUIVALENCE (CROSSCH(1,61),C7(1)),(CROSSCH(1,71),C8(1))
      EQUIVALENCE (CROSSCH(1,81),C9(1)),(CROSSCH(1,91),C10(1))
      EQUIVALENCE (CROSSCH(1,101),C11(1))
      DATA C1/-38.000,-38.000,-38.000,-38.000,-38.000,-38.000,-38.000,   0.1
     1-38.000,-38.000,-38.000,-38.000,-38.000,-38.000,-38.000,-38.000,   0.1
     2        -32.727,-31.151,-30.133,-29.432,-28.925,-28.547,-28.257,   0.2
     2-28.030,-27.848,-27.701,-27.580,-27.479,-27.395,-27.322,-27.261,   0.2
     3        -31.588,-30.011,-28.993,-28.290,-27.784,-27.405,-27.115,   0.3
     3-26.887,-26.705,-26.558,-26.437,-26.336,-26.251,-26.179,-26.117,   0.3
     4        -30.407,-28.830,-27.811,-27.108,-26.601,-26.223,-25.932,   0.4
     4-25.705,-25.523,-25.376,-25.255,-25.154,-25.069,-24.997,-24.935,   0.4
     5        -29.513,-27.937,-26.920,-26.218,-25.712,-25.334,-25.043,   0.5
     5-24.816,-24.635,-24.487,-24.366,-24.266,-24.181,-24.109,-24.047,   0.5
     6        -28.910,-27.341,-26.327,-25.628,-25.123,-24.746,-24.457,   0.6
     6-24.230,-24.049,-23.902,-23.782,-23.681,-23.597,-23.525,-23.464,   0.6
     7        -28.517,-26.961,-25.955,-25.261,-24.760,-24.385,-24.098,   0.7
     7-23.873,-23.694,-23.548,-23.429,-23.329,-23.245,-23.174,-23.113,   0.7
     8        -28.213,-26.675,-25.680,-24.993,-24.497,-24.127,-23.843,   0.8
     8-23.620,-23.443,-23.299,-23.181,-23.082,-22.999,-22.929,-22.869,   0.8
     9        -27.942,-26.427,-25.446,-24.769,-24.280,-23.915,-23.635,   0.9
     9-23.416,-23.241,-23.100,-22.983,-22.887,-22.805,-22.736,-22.677,   0.9
     A        -27.706,-26.210,-25.241,-24.572,-24.088,-23.728,-23.451,   1.0
     A-23.235,-23.063,-22.923,-22.808,-22.713,-22.633,-22.565,-22.507/   1.0
      DATA C2/-27.475,-26.000,-25.043,-24.382,-23.905,-23.548,-23.275,   1.1
     1-23.062,-22.891,-22.753,-22.640,-22.546,-22.467,-22.400,-22.343,   1.1
     2        -27.221,-25.783,-24.844,-24.193,-23.723,-23.372,-23.102,   1.2
     2-22.892,-22.724,-22.588,-22.476,-22.384,-22.306,-22.240,-22.184,   1.2
     3        -26.863,-25.506,-24.607,-23.979,-23.523,-23.182,-22.919,   1.3
     3-22.714,-22.550,-22.417,-22.309,-22.218,-22.142,-22.078,-22.023,   1.3
     4        -26.685,-25.347,-24.457,-23.835,-23.382,-23.044,-22.784,   1.4
     4-22.580,-22.418,-22.286,-22.178,-22.089,-22.014,-21.950,-21.896,   1.4
     5        -26.085,-24.903,-24.105,-23.538,-23.120,-22.805,-22.561,   1.5
     5-22.370,-22.217,-22.093,-21.991,-21.906,-21.835,-21.775,-21.723,   1.5
     6        -25.902,-24.727,-23.936,-23.376,-22.964,-22.654,-22.415,   1.6
     6-22.227,-22.076,-21.955,-21.855,-21.772,-21.702,-21.644,-21.593,   1.6
     7        -25.215,-24.196,-23.510,-23.019,-22.655,-22.378,-22.163,   1.7
     7-21.992,-21.855,-21.744,-21.653,-21.577,-21.513,-21.459,-21.412,   1.7
     8        -24.914,-23.937,-23.284,-22.820,-22.475,-22.212,-22.007,   1.8
     8-21.845,-21.715,-21.609,-21.522,-21.449,-21.388,-21.336,-21.292,   1.8
     9        -24.519,-23.637,-23.039,-22.606,-22.281,-22.030,-21.834,   1.9
     9-21.678,-21.552,-21.450,-21.365,-21.295,-21.236,-21.185,-21.142,   1.9
     A        -24.086,-23.222,-22.650,-22.246,-21.948,-21.722,-21.546,   2.0
     A-21.407,-21.296,-21.205,-21.131,-21.070,-21.018,-20.974,-20.937/   2.0
      DATA C3/-23.850,-23.018,-22.472,-22.088,-21.805,-21.590,-21.422,   2.1
     1-21.289,-21.182,-21.095,-21.024,-20.964,-20.914,-20.872,-20.835,   2.1
     2        -23.136,-22.445,-21.994,-21.676,-21.440,-21.259,-21.117,   2.2
     2-21.004,-20.912,-20.837,-20.775,-20.723,-20.679,-20.642,-20.611,   2.2
     3        -23.199,-22.433,-21.927,-21.573,-21.314,-21.119,-20.969,   2.3
     3-20.851,-20.758,-20.682,-20.621,-20.571,-20.529,-20.493,-20.463,   2.3
     4        -22.696,-22.020,-21.585,-21.286,-21.071,-20.912,-20.791,   2.4
     4-20.697,-20.622,-20.563,-20.514,-20.475,-20.442,-20.414,-20.391,   2.4
     5        -22.119,-21.557,-21.194,-20.943,-20.761,-20.624,-20.518,   2.5
     5-20.434,-20.367,-20.313,-20.268,-20.231,-20.201,-20.175,-20.153,   2.5
     6        -21.855,-21.300,-20.931,-20.673,-20.485,-20.344,-20.235,   2.6
     6-20.151,-20.084,-20.031,-19.988,-19.953,-19.924,-19.900,-19.880,   2.6
     7        -21.126,-20.673,-20.382,-20.184,-20.044,-19.943,-19.868,   2.7
     7-19.811,-19.769,-19.736,-19.710,-19.690,-19.674,-19.662,-19.652,   2.7
     8        -20.502,-20.150,-19.922,-19.766,-19.657,-19.578,-19.520,   2.8
     8-19.478,-19.446,-19.422,-19.404,-19.390,-19.379,-19.371,-19.365,   2.8
     9        -20.030,-19.724,-19.530,-19.399,-19.309,-19.245,-19.199,   2.9
     9-19.166,-19.142,-19.125,-19.112,-19.103,-19.096,-19.091,-19.088,   2.9
     A        -19.640,-19.364,-19.189,-19.074,-18.996,-18.943,-18.906,   3.0
     A-18.881,-18.863,-18.852,-18.844,-18.839,-18.837,-18.836,-18.836/   3.0
      DATA C4/-19.333,-19.092,-18.939,-18.838,-18.770,-18.725,-18.695,   3.1
     1-18.675,-18.662,-18.655,-18.651,-18.649,-18.649,-18.651,-18.653,   3.1
     2        -19.070,-18.880,-18.756,-18.674,-18.621,-18.585,-18.562,   3.2
     2-18.548,-18.540,-18.536,-18.536,-18.537,-18.539,-18.542,-18.546,   3.2
     3        -18.851,-18.708,-18.617,-18.558,-18.521,-18.498,-18.484,   3.3
     3-18.477,-18.475,-18.476,-18.478,-18.482,-18.487,-18.493,-18.498,   3.3
     4        -18.709,-18.599,-18.533,-18.494,-18.471,-18.459,-18.454,   3.4
     4-18.454,-18.457,-18.462,-18.469,-18.476,-18.483,-18.490,-18.498,   3.4
     5        -18.656,-18.572,-18.524,-18.497,-18.485,-18.480,-18.482,   3.5
     5-18.486,-18.493,-18.501,-18.510,-18.519,-18.527,-18.536,-18.544,   3.5
     6        -18.670,-18.613,-18.582,-18.566,-18.561,-18.562,-18.568,   3.6
     6-18.575,-18.583,-18.592,-18.601,-18.610,-18.619,-18.627,-18.635,   3.6
     7        -18.728,-18.700,-18.687,-18.683,-18.685,-18.691,-18.698,   3.7
     7-18.706,-18.715,-18.723,-18.731,-18.739,-18.745,-18.752,-18.758,   3.7
     8        -18.839,-18.835,-18.836,-18.842,-18.849,-18.857,-18.865,   3.8
     8-18.872,-18.878,-18.883,-18.888,-18.892,-18.895,-18.898,-18.900,   3.8
     9        -19.034,-19.041,-19.049,-19.057,-19.064,-19.069,-19.071,   3.9
     9-19.071,-19.070,-19.068,-19.065,-19.061,-19.058,-19.054,-19.051,   3.9
     A        -19.372,-19.378,-19.382,-19.380,-19.372,-19.359,-19.341,   4.0
     A-19.321,-19.300,-19.280,-19.261,-19.243,-19.227,-19.212,-19.199/   4.0
      DATA C5/-19.780,-19.777,-19.763,-19.732,-19.686,-19.631,-19.573,   4.1
     1-19.517,-19.465,-19.419,-19.379,-19.344,-19.314,-19.288,-19.265,   4.1
     2        -20.151,-20.133,-20.087,-20.009,-19.911,-19.810,-19.715,   4.2
     2-19.631,-19.559,-19.497,-19.446,-19.402,-19.365,-19.333,-19.306,   4.2
     3        -20.525,-20.454,-20.312,-20.138,-19.970,-19.825,-19.705,   4.3
     3-19.607,-19.528,-19.464,-19.411,-19.367,-19.330,-19.300,-19.274,   4.3
     4        -20.869,-20.655,-20.366,-20.104,-19.894,-19.731,-19.604,   4.4
     4-19.505,-19.426,-19.363,-19.312,-19.271,-19.236,-19.208,-19.184,   4.4
     5        -21.179,-20.768,-20.380,-20.081,-19.856,-19.686,-19.556,   4.5
     5-19.454,-19.375,-19.311,-19.260,-19.218,-19.184,-19.155,-19.131,   4.5
     6        -21.167,-20.601,-20.206,-19.925,-19.719,-19.565,-19.447,   4.6
     6-19.355,-19.283,-19.226,-19.180,-19.143,-19.112,-19.087,-19.066,   4.6
     7        -20.918,-20.348,-19.976,-19.720,-19.536,-19.401,-19.299,   4.7
     7-19.220,-19.159,-19.112,-19.073,-19.043,-19.018,-18.998,-18.981,   4.7
     8        -20.753,-20.204,-19.847,-19.602,-19.427,-19.299,-19.203,   4.8
     8-19.129,-19.072,-19.028,-18.993,-18.965,-18.942,-18.924,-18.909,   4.8
     9        -20.456,-19.987,-19.677,-19.460,-19.302,-19.186,-19.098,   4.9
     9-19.030,-18.978,-18.937,-18.904,-18.878,-18.857,-18.841,-18.827,   4.9
     A        -20.154,-19.734,-19.461,-19.272,-19.136,-19.035,-18.960,   5.0
     A-18.902,-18.858,-18.824,-18.797,-18.775,-18.759,-18.745,-18.735/   5.0
      DATA C6/-19.941,-19.544,-19.288,-19.114,-18.992,-18.903,-18.837,   5.1
     1-18.788,-18.751,-18.723,-18.701,-18.684,-18.671,-18.661,-18.654,   5.1
     2        -19.657,-19.321,-19.104,-18.956,-18.853,-18.779,-18.724,   5.2
     2-18.684,-18.655,-18.632,-18.615,-18.602,-18.592,-18.585,-18.579,   5.2
     3        -19.388,-19.109,-18.930,-18.810,-18.725,-18.664,-18.620,   5.3
     3-18.586,-18.562,-18.543,-18.529,-18.518,-18.510,-18.503,-18.498,   5.3
     4        -19.201,-18.953,-18.794,-18.686,-18.611,-18.556,-18.515,   5.4
     4-18.485,-18.462,-18.446,-18.433,-18.423,-18.416,-18.410,-18.406,   5.4
     5        -18.923,-18.719,-18.588,-18.500,-18.439,-18.396,-18.365,   5.5
     5-18.344,-18.328,-18.318,-18.311,-18.307,-18.304,-18.303,-18.302,   5.5
     6        -18.614,-18.458,-18.361,-18.298,-18.258,-18.232,-18.216,   5.6
     6-18.206,-18.202,-18.201,-18.202,-18.205,-18.208,-18.213,-18.218,   5.6
     7        -18.419,-18.295,-18.222,-18.178,-18.153,-18.139,-18.132,   5.7
     7-18.131,-18.133,-18.138,-18.143,-18.150,-18.157,-18.164,-18.172,   5.7
     8        -18.296,-18.201,-18.148,-18.118,-18.101,-18.094,-18.091,   5.8
     8-18.093,-18.096,-18.101,-18.107,-18.113,-18.120,-18.126,-18.132,   5.8
     9        -18.021,-17.992,-17.977,-17.970,-17.967,-17.968,-17.970,   5.9
     9-17.974,-17.978,-17.983,-17.989,-17.994,-18.000,-18.005,-18.011,   5.9
     A        -17.694,-17.686,-17.686,-17.691,-17.698,-17.708,-17.718,   6.0
     A-17.729,-17.740,-17.750,-17.761,-17.771,-17.781,-17.790,-17.798/   6.0
      DATA C7/-17.374,-17.384,-17.400,-17.420,-17.440,-17.462,-17.483,   6.1
     1-17.503,-17.523,-17.541,-17.558,-17.575,-17.590,-17.603,-17.616,   6.1
     2        -17.169,-17.199,-17.230,-17.262,-17.293,-17.323,-17.351,   6.2
     2-17.378,-17.404,-17.427,-17.449,-17.469,-17.488,-17.505,-17.520,   6.2
     3        -17.151,-17.184,-17.217,-17.250,-17.282,-17.313,-17.342,   6.3
     3-17.369,-17.395,-17.418,-17.440,-17.461,-17.480,-17.497,-17.513,   6.3
     4        -17.230,-17.260,-17.290,-17.320,-17.348,-17.375,-17.401,   6.4
     4-17.425,-17.448,-17.469,-17.489,-17.508,-17.525,-17.541,-17.556,   6.4
     5        -17.379,-17.403,-17.425,-17.446,-17.467,-17.486,-17.505,   6.5
     5-17.524,-17.541,-17.558,-17.574,-17.588,-17.602,-17.615,-17.627,   6.5
     6        -17.596,-17.604,-17.609,-17.612,-17.616,-17.622,-17.628,   6.6
     6-17.636,-17.644,-17.652,-17.661,-17.670,-17.679,-17.687,-17.695,   6.6
     7        -17.846,-17.823,-17.795,-17.770,-17.750,-17.735,-17.725,   6.7
     7-17.719,-17.716,-17.715,-17.716,-17.719,-17.722,-17.726,-17.730,   6.7
     8        -18.089,-18.015,-17.942,-17.882,-17.836,-17.802,-17.777,   6.8
     8-17.760,-17.748,-17.740,-17.736,-17.734,-17.733,-17.734,-17.736,   6.8
     9        -18.299,-18.156,-18.038,-17.947,-17.881,-17.833,-17.798,   6.9
     9-17.774,-17.757,-17.745,-17.738,-17.733,-17.730,-17.729,-17.729,   6.9
     A        -18.441,-18.243,-18.096,-17.991,-17.915,-17.860,-17.821,   7.0
     A-17.792,-17.772,-17.757,-17.746,-17.738,-17.733,-17.730,-17.728/   7.0
      DATA C8/-18.474,-18.262,-18.111,-18.004,-17.926,-17.869,-17.826,   7.1
     1-17.795,-17.771,-17.753,-17.740,-17.730,-17.722,-17.717,-17.713,   7.1
     2        -18.387,-18.191,-18.053,-17.952,-17.878,-17.823,-17.782,   7.2
     2-17.752,-17.729,-17.711,-17.698,-17.689,-17.681,-17.676,-17.672,   7.2
     3        -18.161,-17.990,-17.874,-17.793,-17.736,-17.696,-17.668,   7.3
     3-17.648,-17.634,-17.625,-17.619,-17.616,-17.614,-17.614,-17.615,   7.3
     4        -17.908,-17.774,-17.690,-17.637,-17.604,-17.583,-17.572,   7.4
     4-17.567,-17.566,-17.568,-17.571,-17.576,-17.581,-17.587,-17.593,   7.4
     5        -17.681,-17.589,-17.540,-17.515,-17.506,-17.505,-17.511,   7.5
     5-17.520,-17.530,-17.542,-17.554,-17.566,-17.578,-17.589,-17.600,   7.5
     6        -17.647,-17.606,-17.584,-17.575,-17.573,-17.576,-17.582,   7.6
     6-17.589,-17.597,-17.605,-17.614,-17.623,-17.631,-17.639,-17.646,   7.6
     7        -17.300,-17.291,-17.291,-17.297,-17.307,-17.319,-17.333,   7.7
     7-17.347,-17.361,-17.375,-17.389,-17.402,-17.415,-17.427,-17.438,   7.7
     8        -16.786,-16.802,-16.825,-16.853,-16.883,-16.914,-16.944,   7.8
     8-16.974,-17.003,-17.030,-17.055,-17.079,-17.101,-17.122,-17.141,   7.8
     9        -16.489,-16.533,-16.579,-16.625,-16.670,-16.713,-16.754,   7.9
     9-16.793,-16.830,-16.864,-16.896,-16.925,-16.952,-16.977,-17.000,   7.9
     A        -16.694,-16.724,-16.756,-16.789,-16.823,-16.856,-16.888,   8.0
     A-16.919,-16.949,-16.976,-17.002,-17.026,-17.048,-17.069,-17.088/   8.0
      DATA C9/-16.935,-16.951,-16.971,-16.993,-17.016,-17.040,-17.064,   8.1
     1-17.088,-17.111,-17.132,-17.153,-17.172,-17.190,-17.206,-17.222,   8.1
     2        -17.200,-17.208,-17.220,-17.235,-17.251,-17.269,-17.286,   8.2
     2-17.304,-17.322,-17.338,-17.354,-17.369,-17.384,-17.397,-17.409,   8.2
     3        -17.597,-17.591,-17.589,-17.590,-17.594,-17.600,-17.608,   8.3
     3-17.617,-17.626,-17.635,-17.645,-17.654,-17.662,-17.671,-17.679,   8.3
     4        -18.166,-18.134,-18.107,-18.085,-18.068,-18.056,-18.047,   8.4
     4-18.041,-18.038,-18.036,-18.035,-18.035,-18.036,-18.038,-18.039,   8.4
     5        -19.000,-18.917,-18.838,-18.770,-18.714,-18.669,-18.632,   8.5
     5-18.603,-18.579,-18.560,-18.545,-18.532,-18.522,-18.514,-18.507,   8.5
     6        -20.313,-19.982,-19.754,-19.592,-19.472,-19.380,-19.309,   8.6
     6-19.253,-19.208,-19.172,-19.143,-19.119,-19.099,-19.083,-19.069,   8.6
     7        -19.751,-19.611,-19.520,-19.461,-19.423,-19.398,-19.382,   8.7
     7-19.372,-19.366,-19.364,-19.363,-19.364,-19.366,-19.368,-19.371,   8.7
     8        -19.581,-19.431,-19.337,-19.277,-19.240,-19.218,-19.207,   8.8
     8-19.202,-19.203,-19.207,-19.212,-19.220,-19.228,-19.236,-19.245,   8.8
     9        -19.685,-19.506,-19.389,-19.311,-19.258,-19.222,-19.199,   8.9
     9-19.184,-19.175,-19.170,-19.168,-19.169,-19.171,-19.174,-19.177,   8.9
     A        -19.977,-19.756,-19.606,-19.501,-19.425,-19.370,-19.330,   9.0
     A-19.300,-19.278,-19.262,-19.250,-19.241,-19.235,-19.230,-19.227/   9.0
      DATAC10/-20.445,-20.158,-19.958,-19.815,-19.711,-19.633,-19.574,   9.1
     1-19.528,-19.493,-19.465,-19.442,-19.425,-19.410,-19.398,-19.389,   9.1
     2        -20.980,-20.625,-20.391,-20.229,-20.110,-20.020,-19.949,   9.2
     2-19.892,-19.846,-19.807,-19.775,-19.748,-19.724,-19.704,-19.687,   9.2
     3        -21.404,-21.023,-20.771,-20.594,-20.461,-20.358,-20.274,   9.3
     3-20.205,-20.148,-20.099,-20.058,-20.022,-19.991,-19.965,-19.942,   9.3
     4        -21.309,-20.970,-20.753,-20.603,-20.495,-20.412,-20.348,   9.4
     4-20.295,-20.252,-20.215,-20.185,-20.158,-20.135,-20.115,-20.098,   9.4
     5        -21.221,-20.906,-20.707,-20.574,-20.480,-20.412,-20.361,   9.5
     5-20.322,-20.292,-20.268,-20.249,-20.233,-20.221,-20.210,-20.201,   9.5
     6        -21.441,-21.097,-20.878,-20.728,-20.623,-20.546,-20.489,   9.6
     6-20.446,-20.413,-20.387,-20.368,-20.352,-20.340,-20.330,-20.322,   9.6
     7        -21.668,-21.305,-21.071,-20.911,-20.797,-20.713,-20.650,   9.7
     7-20.602,-20.565,-20.536,-20.514,-20.496,-20.481,-20.470,-20.460,   9.7
     8        -21.926,-21.556,-21.316,-21.150,-21.031,-20.942,-20.874,   9.8
     8-20.822,-20.782,-20.750,-20.724,-20.704,-20.687,-20.674,-20.663,   9.8
     9        -22.319,-21.937,-21.686,-21.510,-21.380,-21.282,-21.206,   9.9
     9-21.147,-21.099,-21.061,-21.031,-21.006,-20.985,-20.968,-20.954,   9.9
     A        -22.969,-22.561,-22.288,-22.092,-21.945,-21.832,-21.743,  10.0
     A-21.672,-21.616,-21.570,-21.533,-21.503,-21.477,-21.457,-21.439/  10.0
      DATAC11/-24.001,-23.527,-23.199,-22.957,-22.772,-22.629,-22.516,  10.1
     1-22.427,-22.355,-22.297,-22.250,-22.212,-22.180,-22.153,-22.131,  10.1
     2        -24.233,-23.774,-23.477,-23.273,-23.128,-23.022,-22.943,  10.2
     2-22.883,-22.837,-22.802,-22.774,-22.752,-22.735,-22.721,-22.710,  10.2
     3        -24.550,-23.913,-23.521,-23.266,-23.094,-22.976,-22.893,  10.3
     3-22.836,-22.796,-22.768,-22.750,-22.737,-22.730,-22.726,-22.725,  10.3
     4        -24.301,-23.665,-23.274,-23.019,-22.848,-22.730,-22.648,  10.4
     4-22.591,-22.552,-22.525,-22.507,-22.495,-22.489,-22.485,-22.485,  10.4
     5        -24.519,-23.883,-23.491,-23.237,-23.065,-22.948,-22.866,  10.5
     5-22.809,-22.770,-22.743,-22.724,-22.713,-22.706,-22.703,-22.702/  10.5
      DATA PARTCH/
     1     203.741,  249.643,  299.341,  353.477,  412.607,  477.237,
     2     547.817,  624.786,  708.543,  799.463,  897.912, 1004.227,
     3    1118.738, 1241.761, 1373.588, 1514.481, 1664.677, 1824.394,
     4    1993.801, 2173.050, 2362.234, 2561.424, 2770.674, 2989.930,
     5    3219.204, 3458.378, 3707.355, 3966.005, 4234.155, 4511.604,
     6    4798.135, 5093.554, 5397.593, 5709.948, 6030.401, 6358.646,
     7    6694.379, 7037.313, 7387.147, 7743.579, 8106.313/
      DATA FREQ1/0./
   10 CHOP=0.
      IF(FREQ.EQ.FREQ1)GO TO 30
      FREQ1=FREQ
      WAVENO=FREQ/2.99792458E10
      EVOLT=WAVENO/8065.479
      N=EVOLT*10.
      EN=FLOAT(N)*.1
      IF(N.LT.20)RETURN
      IF(N.GE.105)RETURN
      DO 21 IT=1,15
   21 CROSSCHT(IT)=(CROSSCH(IT,N)+(CROSSCH(IT,N+1)-CROSSCH(IT,N))*
     1(EVOLT-EN)/.1)
C      PRINT 26,CROSSCHT
C   26 FORMAT(3H0CH,15F8.3)
   30 IF(T(J).GE.9000.)RETURN
      IF(N.LT.20)RETURN
      IF(N.GE.105)RETURN
      IT=(T(J)-1000.)/200.+1.
      IT=MAX0(IT,1)
      TN=FLOAT(IT)*200.+800.
      PART=PARTCH(IT)+(PARTCH(IT+1)-PARTCH(IT))*(T(J)-TN)/200.
      IT=(T(J)-2000.)/500.+1.
      IT=MAX0(IT,1)
      TN=FLOAT(IT)*500.+1500.
      CHOP=EXP((CROSSCHT(IT)+(CROSSCHT(IT+1)-CROSSCHT(IT))*
     1(T(J)-TN)/500.)*2.30258509299405E0)*PART
      RETURN
      END
      FUNCTION OHOP(J)
C     CROSS-SECTION TIMES PARTITION FUNCTION
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      DIMENSION CROSSOH(15,130),PARTOH(41),CROSSOHT(15)
      DIMENSION C1(150),C2(150),C3(150),C4(150),C5(150)
      DIMENSION C6(150),C7(150),C8(150),C9(150),C10(150)
      DIMENSION C11(150),C12(150),C13(150)
      EQUIVALENCE (CROSSOH(1, 1),C1(1)),(CROSSOH(1,11),C2(1))
      EQUIVALENCE (CROSSOH(1,21),C3(1)),(CROSSOH(1,31),C4(1))
      EQUIVALENCE (CROSSOH(1,41),C5(1)),(CROSSOH(1,51),C6(1))
      EQUIVALENCE (CROSSOH(1,61),C7(1)),(CROSSOH(1,71),C8(1))
      EQUIVALENCE (CROSSOH(1,81),C9(1)),(CROSSOH(1,91),C10(1))
      EQUIVALENCE (CROSSOH(1,101),C11(1))
      EQUIVALENCE (CROSSOH(1,111),C12(1))
      EQUIVALENCE (CROSSOH(1,121),C13(1))
      DATA C1/-30.855,-29.121,-27.976,-27.166,-26.566,-26.106,-25.742,   2.1
     1-25.448,-25.207,-25.006,-24.836,-24.691,-24.566,-24.457,-24.363,   2.1
     2        -30.494,-28.760,-27.615,-26.806,-26.206,-25.745,-25.381,   2.2
     2-25.088,-24.846,-24.645,-24.475,-24.330,-24.205,-24.097,-24.002,   2.2
     3        -30.157,-28.425,-27.280,-26.472,-25.872,-25.411,-25.048,   2.3
     3-24.754,-24.513,-24.312,-24.142,-23.997,-23.872,-23.764,-23.669,   2.3
     4        -29.848,-28.117,-26.974,-26.165,-25.566,-25.105,-24.742,   2.4
     4-24.448,-24.207,-24.006,-23.836,-23.692,-23.567,-23.458,-23.364,   2.4
     5        -29.567,-27.837,-26.693,-25.885,-25.286,-24.826,-24.462,   2.5
     5-24.169,-23.928,-23.727,-23.557,-23.412,-23.287,-23.179,-23.084,   2.5
     6        -29.307,-27.578,-26.436,-25.628,-25.029,-24.569,-24.205,   2.6
     6-23.912,-23.671,-23.470,-23.300,-23.155,-23.031,-22.922,-22.828,   2.6
     7        -29.068,-27.341,-26.199,-25.391,-24.792,-24.332,-23.969,   2.7
     7-23.676,-23.435,-23.234,-23.064,-22.920,-22.795,-22.687,-22.592,   2.7
     8        -28.820,-27.115,-25.978,-25.172,-24.574,-24.115,-23.752,   2.8
     8-23.459,-23.218,-23.017,-22.848,-22.703,-22.579,-22.470,-22.376,   2.8
     9        -28.540,-26.891,-25.768,-24.968,-24.372,-23.914,-23.552,   2.9
     9-23.259,-23.019,-22.818,-22.649,-22.504,-22.380,-22.272,-22.177,   2.9
     A        -28.275,-26.681,-25.574,-24.779,-24.186,-23.729,-23.368,   3.0
     A-23.076,-22.836,-22.636,-22.467,-22.322,-22.198,-22.090,-21.996/   3.0
      DATA C2/-27.993,-26.470,-25.388,-24.602,-24.014,-23.560,-23.200,   3.1
     1-22.909,-22.669,-22.470,-22.301,-22.157,-22.033,-21.925,-21.831,   3.1
     2        -27.698,-26.252,-25.204,-24.433,-23.851,-23.401,-23.043,   3.2
     2-22.754,-22.515,-22.316,-22.148,-22.005,-21.881,-21.773,-21.679,   3.2
     3        -27.398,-26.026,-25.019,-24.267,-23.696,-23.251,-22.896,   3.3
     3-22.609,-22.372,-22.174,-22.007,-21.864,-21.741,-21.634,-21.540,   3.3
     4        -27.100,-25.791,-24.828,-24.102,-23.543,-23.106,-22.756,   3.4
     4-22.472,-22.238,-22.041,-21.875,-21.733,-21.611,-21.504,-21.411,   3.4
     5        -26.807,-25.549,-24.631,-23.933,-23.391,-22.964,-22.621,   3.5
     5-22.341,-22.109,-21.915,-21.751,-21.610,-21.488,-21.383,-21.290,   3.5
     6        -26.531,-25.310,-24.431,-23.761,-23.238,-22.823,-22.488,   3.6
     6-22.214,-21.986,-21.795,-21.633,-21.494,-21.374,-21.269,-21.178,   3.6
     7        -26.239,-25.066,-24.225,-23.585,-23.082,-22.681,-22.356,   3.7
     7-22.089,-21.866,-21.679,-21.520,-21.383,-21.265,-21.162,-21.072,   3.7
     8        -25.945,-24.824,-24.017,-23.405,-22.923,-22.538,-22.223,   3.8
     8-21.964,-21.748,-21.565,-21.410,-21.276,-21.160,-21.059,-20.970,   3.8
     9        -25.663,-24.587,-23.810,-23.222,-22.761,-22.391,-22.088,   3.9
     9-21.838,-21.629,-21.452,-21.300,-21.170,-21.057,-20.958,-20.872,   3.9
     A        -25.372,-24.350,-23.603,-23.038,-22.596,-22.241,-21.950,   4.0
     A-21.710,-21.508,-21.337,-21.190,-21.064,-20.954,-20.858,-20.774/   4.0
      DATA C3/-25.076,-24.111,-23.396,-22.853,-22.429,-22.088,-21.809,   4.1
     1-21.578,-21.384,-21.220,-21.078,-20.957,-20.851,-20.758,-20.676,   4.1
     2        -24.779,-23.870,-23.189,-22.669,-22.261,-21.934,-21.667,   4.2
     2-21.445,-21.259,-21.101,-20.965,-20.848,-20.746,-20.656,-20.578,   4.2
     3        -24.486,-23.629,-22.983,-22.486,-22.095,-21.781,-21.524,   4.3
     3-21.311,-21.132,-20.980,-20.850,-20.737,-20.639,-20.553,-20.478,   4.3
     4        -24.183,-23.382,-22.774,-22.302,-21.928,-21.627,-21.381,   4.4
     4-21.177,-21.005,-20.859,-20.734,-20.625,-20.531,-20.449,-20.376,   4.4
     5        -23.867,-23.127,-22.561,-22.116,-21.761,-21.474,-21.238,   4.5
     5-21.043,-20.878,-20.738,-20.617,-20.513,-20.423,-20.344,-20.274,   4.5
     6        -23.538,-22.862,-22.340,-21.926,-21.592,-21.320,-21.096,   4.6
     6-20.909,-20.751,-20.617,-20.502,-20.402,-20.315,-20.239,-20.172,   4.6
     7        -23.234,-22.604,-22.120,-21.734,-21.422,-21.166,-20.953,   4.7
     7-20.776,-20.625,-20.497,-20.387,-20.291,-20.208,-20.135,-20.071,   4.7
     8        -22.934,-22.347,-21.898,-21.541,-21.250,-21.010,-20.811,   4.8
     8-20.643,-20.500,-20.378,-20.273,-20.182,-20.102,-20.033,-19.971,   4.8
     9        -22.637,-22.092,-21.676,-21.345,-21.075,-20.853,-20.666,   4.9
     9-20.508,-20.374,-20.259,-20.159,-20.073,-19.997,-19.931,-19.872,   4.9
     A        -22.337,-21.835,-21.452,-21.147,-20.899,-20.693,-20.520,   5.0
     A-20.373,-20.247,-20.139,-20.046,-19.964,-19.892,-19.830,-19.774/   5.0
      DATA C4/-22.049,-21.584,-21.230,-20.950,-20.721,-20.531,-20.372,   5.1
     1-20.236,-20.119,-20.019,-19.931,-19.855,-19.788,-19.729,-19.676,   5.1
     2        -21.768,-21.337,-21.011,-20.754,-20.544,-20.370,-20.223,   5.2
     2-20.098,-19.991,-19.898,-19.817,-19.746,-19.683,-19.628,-19.579,   5.2
     3        -21.494,-21.096,-20.796,-20.559,-20.367,-20.208,-20.074,   5.3
     3-19.960,-19.861,-19.776,-19.701,-19.636,-19.578,-19.527,-19.482,   5.3
     4        -21.233,-20.861,-20.585,-20.368,-20.193,-20.048,-19.926,   5.4
     4-19.821,-19.732,-19.654,-19.586,-19.526,-19.473,-19.426,-19.384,   5.4
     5        -20.983,-20.635,-20.380,-20.181,-20.021,-19.889,-19.778,   5.5
     5-19.683,-19.602,-19.531,-19.469,-19.415,-19.367,-19.324,-19.286,   5.5
     6        -20.743,-20.418,-20.182,-19.999,-19.853,-19.733,-19.633,   5.6
     6-19.547,-19.474,-19.410,-19.354,-19.305,-19.261,-19.223,-19.189,   5.6
     7        -20.515,-20.210,-19.991,-19.824,-19.690,-19.581,-19.490,   5.7
     7-19.413,-19.347,-19.290,-19.240,-19.196,-19.157,-19.122,-19.092,   5.7
     8        -20.297,-20.011,-19.808,-19.654,-19.532,-19.434,-19.352,   5.8
     8-19.282,-19.223,-19.172,-19.127,-19.088,-19.054,-19.023,-18.996,   5.8
     9        -20.090,-19.822,-19.633,-19.491,-19.381,-19.291,-19.218,   5.9
     9-19.156,-19.103,-19.057,-19.018,-18.983,-18.952,-18.925,-18.901,   5.9
     A        -19.893,-19.642,-19.467,-19.337,-19.236,-19.155,-19.089,   6.0
     A-19.034,-18.987,-18.946,-18.912,-18.881,-18.854,-18.831,-18.810/   6.0
      DATA C5/-19.705,-19.472,-19.309,-19.190,-19.098,-19.025,-18.966,   6.1
     1-18.917,-18.876,-18.840,-18.810,-18.783,-18.760,-18.739,-18.721,   6.1
     2        -19.527,-19.310,-19.161,-19.051,-18.968,-18.903,-18.851,   6.2
     2-18.807,-18.771,-18.740,-18.713,-18.690,-18.670,-18.653,-18.637,   6.2
     3        -19.357,-19.159,-19.022,-18.922,-18.847,-18.789,-18.743,   6.3
     3-18.704,-18.673,-18.646,-18.623,-18.603,-18.586,-18.571,-18.558,   6.3
     4        -19.195,-19.016,-18.892,-18.803,-18.736,-18.684,-18.643,   6.4
     4-18.610,-18.583,-18.560,-18.540,-18.523,-18.509,-18.496,-18.485,   6.4
     5        -19.042,-18.883,-18.772,-18.693,-18.634,-18.589,-18.553,   6.5
     5-18.525,-18.501,-18.481,-18.465,-18.451,-18.438,-18.428,-18.419,   6.5
     6        -18.894,-18.758,-18.662,-18.593,-18.542,-18.503,-18.473,   6.6
     6-18.448,-18.428,-18.412,-18.398,-18.386,-18.376,-18.367,-18.359,   6.6
     7        -18.752,-18.639,-18.559,-18.501,-18.458,-18.426,-18.400,   6.7
     7-18.380,-18.363,-18.350,-18.338,-18.328,-18.320,-18.313,-18.306,   6.7
     8        -18.611,-18.523,-18.460,-18.415,-18.381,-18.355,-18.334,   6.8
     8-18.318,-18.304,-18.293,-18.284,-18.276,-18.269,-18.263,-18.258,   6.8
     9        -18.471,-18.408,-18.362,-18.329,-18.304,-18.285,-18.269,   6.9
     9-18.257,-18.247,-18.238,-18.231,-18.224,-18.219,-18.214,-18.210,   6.9
     A        -18.330,-18.290,-18.261,-18.239,-18.223,-18.211,-18.201,   7.0
     A-18.192,-18.185,-18.179,-18.174,-18.169,-18.165,-18.162,-18.159/   7.0
      DATA C6/-18.190,-18.168,-18.154,-18.143,-18.135,-18.129,-18.124,   7.1
     1-18.120,-18.116,-18.112,-18.109,-18.106,-18.104,-18.102,-18.100,   7.1
     2        -18.055,-18.047,-18.043,-18.042,-18.040,-18.039,-18.039,   7.2
     2-18.038,-18.037,-18.036,-18.035,-18.034,-18.033,-18.033,-18.032,   7.2
     3        -17.929,-17.931,-17.935,-17.939,-17.943,-17.946,-17.948,   7.3
     3-17.950,-17.952,-17.953,-17.955,-17.956,-17.957,-17.958,-17.959,   7.3
     4        -17.818,-17.826,-17.834,-17.842,-17.849,-17.855,-17.860,   7.4
     4-17.865,-17.869,-17.872,-17.875,-17.878,-17.881,-17.883,-17.886,   7.4
     5        -17.724,-17.736,-17.747,-17.758,-17.767,-17.775,-17.782,   7.5
     5-17.788,-17.793,-17.798,-17.803,-17.807,-17.811,-17.815,-17.819,   7.5
     6        -17.651,-17.665,-17.678,-17.690,-17.701,-17.710,-17.718,   7.6
     6-17.725,-17.732,-17.738,-17.744,-17.749,-17.755,-17.760,-17.765,   7.6
     7        -17.601,-17.615,-17.629,-17.642,-17.653,-17.663,-17.672,   7.7
     7-17.680,-17.688,-17.695,-17.701,-17.708,-17.714,-17.720,-17.726,   7.7
     8        -17.572,-17.587,-17.602,-17.614,-17.626,-17.636,-17.645,   7.8
     8-17.654,-17.662,-17.670,-17.677,-17.684,-17.691,-17.698,-17.704,   7.8
     9        -17.565,-17.581,-17.595,-17.607,-17.619,-17.629,-17.638,   7.9
     9-17.647,-17.656,-17.664,-17.671,-17.679,-17.686,-17.693,-17.700,   7.9
     A        -17.580,-17.594,-17.608,-17.620,-17.630,-17.640,-17.650,   8.0
     A-17.658,-17.667,-17.675,-17.682,-17.690,-17.697,-17.704,-17.711/   8.0
      DATA C7/-17.613,-17.626,-17.639,-17.649,-17.659,-17.669,-17.677,   8.1
     1-17.686,-17.694,-17.701,-17.709,-17.716,-17.723,-17.730,-17.737,   8.1
     2        -17.663,-17.675,-17.685,-17.695,-17.703,-17.711,-17.719,   8.2
     2-17.727,-17.734,-17.741,-17.748,-17.755,-17.761,-17.768,-17.774,   8.2
     3        -17.728,-17.737,-17.745,-17.752,-17.759,-17.766,-17.772,   8.3
     3-17.778,-17.785,-17.791,-17.797,-17.803,-17.808,-17.814,-17.820,   8.3
     4        -17.803,-17.809,-17.814,-17.818,-17.823,-17.828,-17.832,   8.4
     4-17.837,-17.842,-17.847,-17.852,-17.856,-17.861,-17.866,-17.871,   8.4
     5        -17.884,-17.886,-17.888,-17.889,-17.891,-17.893,-17.896,   8.5
     5-17.899,-17.902,-17.905,-17.908,-17.912,-17.915,-17.919,-17.922,   8.5
     6        -17.966,-17.964,-17.961,-17.959,-17.958,-17.958,-17.958,   8.6
     6-17.959,-17.960,-17.961,-17.963,-17.964,-17.966,-17.968,-17.970,   8.6
     7        -18.040,-18.034,-18.028,-18.023,-18.019,-18.016,-18.013,   8.7
     7-18.012,-18.010,-18.010,-18.009,-18.009,-18.009,-18.009,-18.010,   8.7
     8        -18.096,-18.087,-18.078,-18.071,-18.065,-18.059,-18.055,   8.8
     8-18.051,-18.047,-18.045,-18.042,-18.040,-18.039,-18.037,-18.036,   8.8
     9        -18.125,-18.115,-18.105,-18.097,-18.089,-18.082,-18.076,   8.9
     9-18.070,-18.065,-18.061,-18.057,-18.053,-18.051,-18.048,-18.046,   8.9
     A        -18.120,-18.112,-18.103,-18.095,-18.087,-18.079,-18.072,   9.0
     A-18.066,-18.060,-18.055,-18.050,-18.046,-18.042,-18.039,-18.036/   9.0
      DATA C8/-18.083,-18.078,-18.071,-18.064,-18.057,-18.050,-18.044,   9.1
     1-18.037,-18.032,-18.026,-18.022,-18.017,-18.014,-18.010,-18.007,   9.1
     2        -18.025,-18.022,-18.017,-18.012,-18.006,-18.000,-17.994,   9.2
     2-17.989,-17.984,-17.979,-17.975,-17.971,-17.968,-17.965,-17.963,   9.2
     3        -17.957,-17.955,-17.952,-17.948,-17.943,-17.938,-17.934,   9.3
     3-17.929,-17.925,-17.922,-17.918,-17.916,-17.913,-17.911,-17.910,   9.3
     4        -17.890,-17.889,-17.886,-17.882,-17.879,-17.875,-17.871,   9.4
     4-17.867,-17.864,-17.862,-17.860,-17.858,-17.857,-17.856,-17.855,   9.4
     5        -17.831,-17.829,-17.826,-17.822,-17.819,-17.815,-17.812,   9.5
     5-17.810,-17.807,-17.806,-17.804,-17.803,-17.803,-17.803,-17.803,   9.5
     6        -17.786,-17.782,-17.777,-17.773,-17.769,-17.766,-17.763,   9.6
     6-17.761,-17.759,-17.758,-17.757,-17.757,-17.757,-17.758,-17.759,   9.6
     7        -17.753,-17.747,-17.741,-17.735,-17.731,-17.727,-17.724,   9.7
     7-17.722,-17.721,-17.720,-17.720,-17.720,-17.721,-17.722,-17.724,   9.7
     8        -17.733,-17.724,-17.716,-17.709,-17.703,-17.699,-17.696,   9.8
     8-17.694,-17.693,-17.692,-17.692,-17.693,-17.694,-17.695,-17.697,   9.8
     9        -17.723,-17.711,-17.700,-17.691,-17.685,-17.680,-17.676,   9.9
     9-17.674,-17.673,-17.672,-17.673,-17.673,-17.675,-17.676,-17.678,   9.9
     A        -17.718,-17.702,-17.689,-17.679,-17.672,-17.667,-17.663,  10.0
     A-17.660,-17.659,-17.659,-17.659,-17.660,-17.661,-17.663,-17.665/  10.0
      DATA C9/-17.713,-17.695,-17.681,-17.670,-17.662,-17.656,-17.653,  10.1
     1-17.650,-17.649,-17.649,-17.649,-17.650,-17.651,-17.653,-17.655,  10.1
     2        -17.705,-17.686,-17.671,-17.660,-17.652,-17.647,-17.643,  10.2
     2-17.641,-17.640,-17.640,-17.640,-17.641,-17.643,-17.645,-17.647,  10.2
     3        -17.690,-17.671,-17.657,-17.647,-17.640,-17.635,-17.632,  10.3
     3-17.630,-17.630,-17.630,-17.631,-17.632,-17.634,-17.636,-17.639,  10.3
     4        -17.667,-17.649,-17.637,-17.629,-17.623,-17.619,-17.618,  10.4
     4-17.617,-17.617,-17.618,-17.619,-17.621,-17.623,-17.626,-17.628,  10.4
     5        -17.635,-17.621,-17.611,-17.605,-17.601,-17.600,-17.599,  10.5
     5-17.599,-17.601,-17.602,-17.604,-17.607,-17.609,-17.612,-17.615,  10.5
     6        -17.596,-17.585,-17.579,-17.576,-17.575,-17.575,-17.576,  10.6
     6-17.578,-17.580,-17.582,-17.585,-17.588,-17.591,-17.595,-17.598,  10.6
     7        -17.550,-17.544,-17.542,-17.542,-17.544,-17.546,-17.548,  10.7
     7-17.552,-17.555,-17.558,-17.562,-17.566,-17.570,-17.573,-17.577,  10.7
     8        -17.501,-17.500,-17.501,-17.504,-17.508,-17.513,-17.517,  10.8
     8-17.521,-17.526,-17.530,-17.535,-17.539,-17.544,-17.548,-17.553,  10.8
     9        -17.449,-17.452,-17.457,-17.463,-17.470,-17.476,-17.482,  10.9
     9-17.488,-17.493,-17.499,-17.504,-17.509,-17.514,-17.519,-17.524,  10.9
     A        -17.396,-17.403,-17.412,-17.420,-17.429,-17.437,-17.444,  11.0
     A-17.451,-17.458,-17.464,-17.470,-17.476,-17.481,-17.487,-17.492/  11.0
      DATAC10/-17.344,-17.355,-17.366,-17.377,-17.387,-17.396,-17.405,  11.1
     1-17.413,-17.420,-17.427,-17.434,-17.440,-17.446,-17.452,-17.458,  11.1
     2        -17.295,-17.307,-17.321,-17.333,-17.345,-17.355,-17.365,  11.2
     2-17.373,-17.382,-17.389,-17.397,-17.404,-17.410,-17.417,-17.423,  11.2
     3        -17.249,-17.264,-17.278,-17.292,-17.304,-17.316,-17.326,  11.3
     3-17.335,-17.344,-17.352,-17.360,-17.368,-17.375,-17.382,-17.389,  11.3
     4        -17.209,-17.225,-17.241,-17.255,-17.268,-17.280,-17.291,  11.4
     4-17.301,-17.310,-17.319,-17.327,-17.335,-17.343,-17.350,-17.357,  11.4
     5        -17.177,-17.194,-17.210,-17.225,-17.239,-17.251,-17.262,  11.5
     5-17.272,-17.282,-17.291,-17.300,-17.308,-17.316,-17.324,-17.331,  11.5
     6        -17.154,-17.172,-17.189,-17.204,-17.218,-17.230,-17.242,  11.6
     6-17.252,-17.262,-17.272,-17.280,-17.289,-17.298,-17.306,-17.314,  11.6
     7        -17.144,-17.162,-17.179,-17.194,-17.208,-17.220,-17.232,  11.7
     7-17.242,-17.253,-17.262,-17.271,-17.280,-17.289,-17.297,-17.306,  11.7
     8        -17.146,-17.164,-17.181,-17.196,-17.210,-17.222,-17.234,  11.8
     8-17.245,-17.255,-17.265,-17.274,-17.283,-17.292,-17.301,-17.309,  11.8
     9        -17.163,-17.180,-17.197,-17.212,-17.225,-17.237,-17.249,  11.9
     9-17.260,-17.270,-17.280,-17.289,-17.298,-17.307,-17.316,-17.325,  11.9
     A        -17.193,-17.211,-17.227,-17.241,-17.254,-17.266,-17.277,  12.0
     A-17.288,-17.298,-17.308,-17.317,-17.327,-17.336,-17.345,-17.353/  12.0
      DATAC11/-17.239,-17.256,-17.271,-17.284,-17.297,-17.309,-17.320,  12.1
     1-17.330,-17.340,-17.350,-17.359,-17.369,-17.378,-17.387,-17.395,  12.1
     2        -17.299,-17.315,-17.329,-17.342,-17.354,-17.365,-17.376,  12.2
     2-17.386,-17.396,-17.405,-17.415,-17.424,-17.433,-17.442,-17.451,  12.2
     3        -17.373,-17.388,-17.402,-17.414,-17.425,-17.436,-17.446,  12.3
     3-17.456,-17.466,-17.475,-17.484,-17.493,-17.502,-17.511,-17.520,  12.3
     4        -17.462,-17.476,-17.489,-17.500,-17.511,-17.521,-17.531,  12.4
     4-17.541,-17.550,-17.559,-17.569,-17.578,-17.587,-17.595,-17.604,  12.4
     5        -17.567,-17.581,-17.592,-17.603,-17.613,-17.623,-17.632,  12.5
     5-17.641,-17.651,-17.660,-17.669,-17.678,-17.686,-17.695,-17.704,  12.5
     6        -17.689,-17.701,-17.712,-17.722,-17.732,-17.741,-17.750,  12.6
     6-17.759,-17.768,-17.777,-17.786,-17.795,-17.803,-17.812,-17.821,  12.6
     7        -17.829,-17.840,-17.851,-17.860,-17.869,-17.878,-17.887,  12.7
     7-17.896,-17.904,-17.913,-17.922,-17.930,-17.939,-17.948,-17.956,  12.7
     8        -17.988,-18.000,-18.010,-18.019,-18.028,-18.036,-18.045,  12.8
     8-18.053,-18.062,-18.070,-18.079,-18.087,-18.096,-18.104,-18.112,  12.8
     9        -18.171,-18.183,-18.192,-18.201,-18.210,-18.218,-18.227,  12.9
     9-18.235,-18.243,-18.252,-18.260,-18.268,-18.277,-18.285,-18.293,  12.9
     A        -18.381,-18.393,-18.403,-18.413,-18.422,-18.430,-18.438,  13.0
     A-18.447,-18.455,-18.463,-18.471,-18.479,-18.487,-18.495,-18.503/  13.0
      DATAC12/-18.625,-18.638,-18.650,-18.660,-18.669,-18.678,-18.687,  13.1
     1-18.695,-18.703,-18.711,-18.719,-18.726,-18.734,-18.742,-18.750,  13.1
     2        -18.912,-18.929,-18.943,-18.955,-18.966,-18.975,-18.984,  13.2
     2-18.993,-19.001,-19.008,-19.016,-19.023,-19.031,-19.038,-19.045,  13.2
     3        -19.260,-19.283,-19.303,-19.320,-19.333,-19.345,-19.355,  13.3
     3-19.364,-19.372,-19.380,-19.387,-19.394,-19.400,-19.407,-19.413,  13.3
     4        -19.704,-19.740,-19.771,-19.796,-19.816,-19.832,-19.845,  13.4
     4-19.855,-19.863,-19.870,-19.876,-19.882,-19.887,-19.892,-19.897,  13.4
     5        -20.339,-20.386,-20.424,-20.454,-20.476,-20.492,-20.502,  13.5
     5-20.509,-20.513,-20.516,-20.518,-20.520,-20.521,-20.523,-20.524,  13.5
     6        -21.052,-21.075,-21.093,-21.105,-21.114,-21.120,-21.123,  13.6
     6-21.125,-21.126,-21.127,-21.128,-21.130,-21.131,-21.133,-21.135,  13.6
     7        -21.174,-21.203,-21.230,-21.255,-21.278,-21.299,-21.320,  13.7
     7-21.339,-21.357,-21.375,-21.392,-21.408,-21.424,-21.439,-21.454,  13.7
     8        -21.285,-21.317,-21.346,-21.372,-21.395,-21.416,-21.435,  13.8
     8-21.452,-21.468,-21.483,-21.497,-21.511,-21.524,-21.536,-21.548,  13.8
     9        -21.396,-21.429,-21.459,-21.486,-21.511,-21.532,-21.551,  13.9
     9-21.569,-21.585,-21.600,-21.614,-21.627,-21.640,-21.652,-21.663,  13.9
     A        -21.516,-21.549,-21.580,-21.609,-21.635,-21.658,-21.678,  14.0
     A-21.696,-21.713,-21.728,-21.742,-21.755,-21.767,-21.779,-21.790/  14.0
      DATAC13/-21.651,-21.681,-21.711,-21.738,-21.763,-21.785,-21.804,  14.1
     1-21.821,-21.837,-21.851,-21.864,-21.876,-21.887,-21.898,-21.908,  14.1
     2        -21.810,-21.831,-21.853,-21.874,-21.893,-21.910,-21.925,  14.2
     2-21.938,-21.950,-21.961,-21.971,-21.980,-21.989,-21.998,-22.006,  14.2
     3        -22.009,-22.016,-22.026,-22.037,-22.048,-22.058,-22.066,  14.3
     3-22.074,-22.081,-22.088,-22.094,-22.099,-22.105,-22.111,-22.117,  14.3
     4        -22.353,-22.317,-22.296,-22.284,-22.276,-22.270,-22.266,  14.4
     4-22.262,-22.260,-22.258,-22.257,-22.257,-22.257,-22.258,-22.259,  14.4
     5        -22.705,-22.609,-22.552,-22.515,-22.488,-22.468,-22.451,  14.5
     5-22.438,-22.427,-22.418,-22.410,-22.405,-22.400,-22.397,-22.395,  14.5
     6        -22.889,-22.791,-22.731,-22.690,-22.659,-22.634,-22.612,  14.6
     6-22.594,-22.579,-22.566,-22.555,-22.546,-22.539,-22.533,-22.528,  14.6
     7        -23.211,-23.109,-23.041,-22.989,-22.945,-22.906,-22.872,  14.7
     7-22.842,-22.816,-22.793,-22.774,-22.757,-22.743,-22.732,-22.722,  14.7
     8        -25.312,-24.669,-24.250,-23.959,-23.746,-23.587,-23.463,  14.8
     8-23.366,-23.288,-23.225,-23.173,-23.131,-23.095,-23.066,-23.041,  14.8
     9        -25.394,-24.752,-24.333,-24.041,-23.829,-23.669,-23.546,  14.9
     9-23.449,-23.371,-23.308,-23.256,-23.214,-23.178,-23.149,-23.124,  14.9
     A        -25.430,-24.787,-24.369,-24.077,-23.865,-23.705,-23.582,  15.0
     A-23.484,-23.407,-23.344,-23.292,-23.249,-23.214,-23.185,-23.160/  15.0
      DATA PARTOH/
     1   145.979,  178.033,  211.618,  247.053,  284.584,  324.398,
     2   366.639,  411.425,  458.854,  509.012,  561.976,  617.823,
     3   676.626,  738.448,  803.363,  871.437,  942.735, 1017.330,
     4  1095.284, 1176.654, 1261.510, 1349.898, 1441.875, 1537.483,
     5  1636.753, 1739.733, 1846.434, 1956.883, 2071.080, 2189.029,
     6  2310.724, 2436.155, 2565.283, 2698.103, 2834.571, 2974.627,
     7  3118.242, 3265.366, 3415.912, 3569.837, 3727.077/
      DATA FREQ1/0./
   10 OHOP=0.
      IF(FREQ.EQ.FREQ1)GO TO 30
      FREQ1=FREQ
      WAVENO=FREQ/2.99792458E10
      EVOLT=WAVENO/8065.479
      N=EVOLT*10.-20.
      EN=FLOAT(N)*.1+2.
      IF(N.LE.0)RETURN
      IF(N.GE.130)RETURN
      DO 21 IT=1,15
   21 CROSSOHT(IT)=(CROSSOH(IT,N)+(CROSSOH(IT,N+1)-CROSSOH(IT,N))*
     1(EVOLT-EN)/.1)
C      PRINT 26,CROSSOHT
C   26 FORMAT(3H0OH,15F8.3)
   30 IF(T(J).GE.9000.)RETURN
      IF(N.LE.0)RETURN
      IF(N.GE.130)RETURN
      IT=(T(J)-1000.)/200.+1.
      IT=MAX0(IT,1)
      TN=FLOAT(IT)*200.+800.
      PART=PARTOH(IT)+(PARTOH(IT+1)-PARTOH(IT))*(T(J)-TN)/200.
      IT=(T(J)-2000.)/500.+1.
      IT=MAX0(IT,1)
      TN=FLOAT(IT)*500.+1500.
      OHOP=EXP((CROSSOHT(IT)+(CROSSOHT(IT+1)-CROSSOHT(IT))*
     1(T(J)-TN)/500.)*2.30258509299405E0)*PART
      RETURN
      END
      SUBROUTINE H2COLLOP(AH2COLL)
C     H2-H2 and H2-He collision induced dipole
C     Borysow, A., Jorgensen, U.G., and Zheng, C. A&A 324, 185-195, 1997.
C     also www.astro.ku.dk/~aborysow
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION XNH2(kw),AH2COLL(kw)
      DIMENSION H2HE(7,81),H2H2(7,81),H2HENU(7),H2H2NU(7)
      DIMENSION H2HE1(7,9),H2HE2(7,9),H2HE3(7,9),H2HE4(7,9),H2HE5(7,9)
      DIMENSION H2HE6(7,9),H2HE7(7,9),H2HE8(7,9),H2HE9(7,9)
      DIMENSION H2H21(7,9),H2H22(7,9),H2H23(7,9),H2H24(7,9),H2H25(7,9)
      DIMENSION H2H26(7,9),H2H27(7,9),H2H28(7,9),H2H29(7,9)
      EQUIVALENCE (H2HE(1, 1),H2HE1(1,1)),(H2HE(1,10),H2HE2(1,1))
      EQUIVALENCE (H2HE(1,19),H2HE3(1,1)),(H2HE(1,28),H2HE4(1,1))
      EQUIVALENCE (H2HE(1,37),H2HE5(1,1)),(H2HE(1,46),H2HE6(1,1))
      EQUIVALENCE (H2HE(1,55),H2HE7(1,1)),(H2HE(1,64),H2HE8(1,1))
      EQUIVALENCE (H2HE(1,73),H2HE9(1,1))
      EQUIVALENCE (H2H2(1, 1),H2H21(1,1)),(H2H2(1,10),H2H22(1,1))
      EQUIVALENCE (H2H2(1,19),H2H23(1,1)),(H2H2(1,28),H2H24(1,1))
      EQUIVALENCE (H2H2(1,37),H2H25(1,1)),(H2H2(1,46),H2H26(1,1))
      EQUIVALENCE (H2H2(1,55),H2H27(1,1)),(H2H2(1,64),H2H28(1,1))
      EQUIVALENCE (H2H2(1,73),H2H29(1,1))
      DATA H2H21/
     1 -46.000,-46.000,-46.000,-46.000,-46.000,-46.000,-46.000,
     2 -45.350,-45.350,-45.350,-45.350,-45.350,-45.350,-45.350,
     3 -44.850,-44.850,-44.850,-44.850,-44.850,-45.850,-45.850,
     4 -44.375,-44.465,-44.497,-44.504,-44.502,-44.657,-44.656,
     5 -44.161,-44.216,-44.249,-44.255,-44.245,-44.231,-44.227,
     6 -44.160,-44.081,-44.081,-44.076,-44.063,-44.047,-44.042,
     7 -44.249,-44.017,-43.966,-43.940,-43.918,-43.898,-43.891,
     8 -44.450,-44.020,-43.900,-43.844,-43.806,-43.776,-43.764,
     9 -44.712,-44.080,-43.881,-43.785,-43.726,-43.682,-43.662/
      DATA H2H22/
     1 -45.016,-44.186,-43.902,-43.763,-43.677,-43.616,-43.586,
     2 -45.308,-44.319,-43.958,-43.773,-43.659,-43.579,-43.537,
     3 -45.452,-44.442,-44.034,-43.810,-43.669,-43.570,-43.514,
     4 -45.306,-44.500,-44.100,-43.858,-43.697,-43.580,-43.511,
     5 -45.081,-44.452,-44.111,-43.887,-43.724,-43.598,-43.518,
     6 -44.801,-44.302,-44.049,-43.876,-43.734,-43.608,-43.522,
     7 -44.494,-44.104,-43.945,-43.832,-43.720,-43.603,-43.516,
     8 -44.177,-43.936,-43.849,-43.783,-43.704,-43.596,-43.511,
     9 -44.042,-43.865,-43.807,-43.767,-43.712,-43.611,-43.527/
      DATA H2H23/
     1 -44.148,-43.922,-43.846,-43.806,-43.763,-43.662,-43.578,
     2 -44.293,-44.042,-43.936,-43.884,-43.843,-43.742,-43.653,
     3 -44.444,-44.179,-44.052,-43.984,-43.937,-43.832,-43.739,
     4 -44.594,-44.311,-44.173,-44.091,-44.033,-43.924,-43.827,
     5 -44.818,-44.448,-44.292,-44.196,-44.124,-44.012,-43.910,
     6 -45.097,-44.600,-44.414,-44.300,-44.210,-44.095,-43.989,
     7 -45.437,-44.782,-44.548,-44.409,-44.294,-44.177,-44.068,
     8 -45.771,-44.992,-44.702,-44.533,-44.391,-44.269,-44.154,
     9 -46.088,-45.218,-44.873,-44.672,-44.503,-44.374,-44.251/
      DATA H2H24/
     1 -46.371,-45.438,-45.046,-44.813,-44.621,-44.483,-44.351,
     2 -46.554,-45.632,-45.209,-44.949,-44.738,-44.590,-44.448,
     3 -46.593,-45.788,-45.352,-45.074,-44.848,-44.692,-44.542,
     4 -46.513,-45.887,-45.463,-45.181,-44.950,-44.786,-44.627,
     5 -46.391,-45.917,-45.542,-45.271,-45.041,-44.873,-44.707,
     6 -46.197,-45.896,-45.601,-45.350,-45.124,-44.952,-44.781,
     7 -46.086,-45.911,-45.664,-45.423,-45.198,-45.023,-44.848,
     8 -46.127,-45.958,-45.723,-45.487,-45.265,-45.089,-44.913,
     9 -46.077,-45.963,-45.755,-45.534,-45.322,-45.149,-44.973/
      DATA H2H25/
     1 -46.057,-45.947,-45.770,-45.571,-45.371,-45.204,-45.030,
     2 -46.122,-45.959,-45.792,-45.610,-45.422,-45.260,-45.088,
     3 -46.302,-46.023,-45.840,-45.662,-45.480,-45.322,-45.149,
     4 -46.560,-46.146,-45.928,-45.741,-45.557,-45.394,-45.218,
     5 -46.891,-46.327,-46.058,-45.844,-45.648,-45.477,-45.292,
     6 -47.245,-46.558,-46.226,-45.967,-45.753,-45.568,-45.372,
     7 -47.527,-46.793,-46.408,-46.110,-45.871,-45.668,-45.457,
     8 -47.729,-47.001,-46.589,-46.254,-45.992,-45.771,-45.544,
     9 -47.829,-47.161,-46.750,-46.391,-46.111,-45.872,-45.630/
      DATA H2H26/
     1 -47.825,-47.265,-46.879,-46.547,-46.239,-45.980,-45.719,
     2 -47.740,-47.317,-46.979,-46.658,-46.345,-46.075,-45.803,
     3 -47.635,-47.340,-47.055,-46.755,-46.444,-46.166,-45.882,
     4 -47.593,-47.358,-47.122,-46.844,-46.536,-46.252,-45.961,
     5 -47.488,-47.375,-47.178,-46.921,-46.621,-46.334,-46.036,
     6 -47.517,-47.387,-47.213,-46.982,-46.696,-46.412,-46.109,
     7 -47.511,-47.385,-47.234,-47.031,-46.765,-46.485,-46.180,
     8 -47.601,-47.428,-47.274,-47.084,-46.834,-46.558,-46.251,
     9 -47.740,-47.509,-47.339,-47.150,-46.906,-46.632,-46.322/
      DATA H2H27/
     1 -48.007,-47.632,-47.429,-47.233,-46.988,-46.710,-46.395,
     2 -48.371,-47.825,-47.563,-47.341,-47.081,-46.794,-46.469,
     3 -48.778,-48.074,-47.739,-47.476,-47.189,-46.884,-46.547,
     4 -49.170,-48.341,-47.936,-47.625,-47.304,-46.977,-46.625,
     5 -49.531,-48.604,-48.136,-47.780,-47.424,-47.074,-46.704,
     6 -49.869,-48.850,-48.328,-47.932,-47.543,-47.170,-46.784,
     7 -50.189,-49.080,-48.510,-48.078,-47.660,-47.264,-46.863,
     8 -50.496,-49.299,-48.682,-48.218,-47.774,-47.358,-46.940,
     9 -50.797,-49.508,-48.847,-48.353,-47.885,-47.449,-47.018/
      DATA H2H28/
     1 -51.088,-49.711,-49.008,-48.484,-47.993,-47.540,-47.094,
     2 -51.374,-49.907,-49.163,-48.613,-48.100,-47.629,-47.170,
     3 -51.655,-50.102,-49.317,-48.740,-48.205,-47.717,-47.246,
     4 -51.931,-50.293,-49.468,-48.865,-48.309,-47.804,-47.321,
     5 -52.205,-50.481,-49.617,-48.989,-48.413,-47.891,-47.396,
     6 -52.475,-50.670,-49.767,-49.112,-48.516,-47.978,-47.470,
     7 -52.742,-50.855,-49.915,-49.235,-48.619,-48.064,-47.545,
     8 -53.010,-51.038,-50.062,-49.358,-48.721,-48.150,-47.619,
     9 -53.277,-51.221,-50.209,-49.481,-48.824,-48.236,-47.692/
      DATA H2H29/
     1 -53.545,-51.399,-50.353,-49.602,-48.925,-48.321,-47.765,
     2 -53.812,-51.575,-50.496,-49.722,-49.026,-48.405,-47.839,
     3 -54.080,-51.748,-50.634,-49.840,-49.125,-48.489,-47.911,
     4 -54.347,-51.918,-50.769,-49.954,-49.222,-48.571,-47.984,
     5 -54.615,-52.086,-50.900,-50.065,-49.317,-48.653,-48.055,
     6 -54.882,-52.253,-51.029,-50.174,-49.411,-48.733,-48.125,
     7 -55.150,-52.419,-51.158,-50.282,-49.506,-48.813,-48.196,
     8 -55.417,-52.584,-51.288,-50.399,-49.642,-48.903,-48.268,
     9 -55.685,-52.778,-51.420,-50.527,-49.732,-48.981,-48.338/
      DATA H2HE1/
     1 -46.000,-46.000,-46.000,-46.000,-46.000,-46.000,-46.000,
     2 -44.288,-44.288,-44.288,-44.288,-44.288,-44.288,-44.288,
     3 -44.288,-44.142,-44.045,-43.997,-43.949,-44.900,-43.852,
     4 -44.362,-44.090,-43.978,-43.901,-43.833,-43.939,-43.716,
     5 -44.461,-44.114,-43.954,-43.863,-43.786,-43.717,-43.654,
     6 -44.601,-44.195,-43.973,-43.875,-43.791,-43.715,-43.646,
     7 -44.777,-44.292,-44.012,-43.905,-43.813,-43.732,-43.658,
     8 -45.000,-44.402,-44.061,-43.946,-43.844,-43.756,-43.678,
     9 -45.268,-44.530,-44.122,-43.996,-43.883,-43.786,-43.703/
      DATA H2HE2/
     1 -45.562,-44.680,-44.199,-44.059,-43.932,-43.823,-43.733,
     2 -45.841,-44.841,-44.289,-44.128,-43.983,-43.862,-43.766,
     3 -46.012,-44.969,-44.371,-44.182,-44.017,-43.891,-43.789,
     4 -45.931,-44.975,-44.394,-44.173,-43.999,-43.872,-43.779,
     5 -45.621,-44.790,-44.293,-44.062,-43.905,-43.793,-43.726,
     6 -45.151,-44.469,-44.084,-43.871,-43.755,-43.705,-43.666,
     7 -44.620,-44.131,-43.871,-43.715,-43.640,-43.644,-43.628,
     8 -44.166,-43.892,-43.748,-43.674,-43.639,-43.628,-43.625,
     9 -44.023,-43.837,-43.743,-43.710,-43.691,-43.663,-43.660/
      DATA H2HE3/
     1 -44.190,-43.942,-43.830,-43.782,-43.755,-43.735,-43.719,
     2 -44.446,-44.120,-43.967,-43.884,-43.839,-43.807,-43.776,
     3 -44.689,-44.312,-44.120,-44.011,-43.932,-43.872,-43.826,
     4 -44.904,-44.491,-44.269,-44.134,-44.022,-43.941,-43.881,
     5 -45.133,-44.656,-44.407,-44.244,-44.115,-44.016,-43.941,
     6 -45.398,-44.824,-44.543,-44.359,-44.217,-44.098,-44.006,
     7 -45.701,-45.010,-44.686,-44.481,-44.322,-44.186,-44.076,
     8 -46.024,-45.221,-44.843,-44.610,-44.431,-44.275,-44.147,
     9 -46.350,-45.449,-45.015,-44.747,-44.542,-44.366,-44.219/
      DATA H2HE4/
     1 -46.736,-45.674,-45.189,-44.887,-44.657,-44.458,-44.294,
     2 -46.993,-45.865,-45.347,-45.023,-44.771,-44.551,-44.367,
     3 -47.031,-45.981,-45.469,-45.141,-44.878,-44.640,-44.437,
     4 -46.787,-46.008,-45.553,-45.244,-44.979,-44.727,-44.506,
     5 -46.496,-45.969,-45.618,-45.343,-45.085,-44.820,-44.579,
     6 -46.310,-45.953,-45.689,-45.449,-45.198,-44.919,-44.656,
     7 -46.295,-46.001,-45.787,-45.572,-45.321,-45.021,-44.732,
     8 -46.434,-46.122,-45.919,-45.717,-45.453,-45.123,-44.804,
     9 -46.671,-46.306,-46.085,-45.896,-45.588,-45.224,-44.873/
      DATA H2HE5/
     1 -46.964,-46.539,-46.284,-46.068,-45.723,-45.320,-44.937,
     2 -47.295,-46.807,-46.501,-46.241,-45.858,-45.412,-44.998,
     3 -47.662,-47.097,-46.723,-46.415,-45.996,-45.500,-45.056,
     4 -48.050,-47.399,-46.949,-46.583,-46.135,-45.587,-45.111,
     5 -48.416,-47.683,-47.169,-46.749,-46.274,-45.671,-45.165,
     6 -48.678,-47.892,-47.359,-46.907,-46.412,-45.752,-45.215,
     7 -48.720,-47.963,-47.494,-47.044,-46.551,-45.828,-45.263,
     8 -48.583,-47.912,-47.566,-47.160,-46.689,-45.901,-45.309,
     9 -48.380,-47.807,-47.574,-47.236,-46.828,-45.972,-45.354/
      DATA H2HE6/
     1 -48.164,-47.692,-47.543,-47.281,-46.953,-46.041,-45.397,
     2 -47.988,-47.603,-47.513,-47.300,-47.028,-46.106,-45.438,
     3 -47.874,-47.562,-47.506,-47.326,-47.085,-46.171,-45.479,
     4 -47.846,-47.571,-47.518,-47.361,-47.141,-46.235,-45.519,
     5 -47.827,-47.577,-47.536,-47.397,-47.194,-46.298,-45.558,
     6 -47.841,-47.583,-47.548,-47.416,-47.234,-46.357,-45.596,
     7 -47.949,-47.631,-47.550,-47.411,-47.253,-46.412,-45.632,
     8 -48.168,-47.763,-47.580,-47.428,-47.282,-46.467,-45.668,
     9 -48.442,-47.955,-47.682,-47.516,-47.360,-46.528,-45.704/
      DATA H2HE7/
     1 -48.685,-48.145,-47.839,-47.654,-47.473,-46.593,-45.741,
     2 -48.859,-48.310,-47.990,-47.778,-47.575,-46.655,-45.777,
     3 -48.989,-48.445,-48.118,-47.878,-47.660,-46.714,-45.813,
     4 -49.121,-48.560,-48.250,-47.981,-47.749,-46.773,-45.847,
     5 -49.277,-48.667,-48.390,-48.094,-47.842,-46.831,-45.881,
     6 -49.469,-48.778,-48.525,-48.202,-47.933,-46.888,-45.916,
     7 -49.697,-48.907,-48.650,-48.303,-48.019,-46.943,-45.949,
     8 -49.939,-49.059,-48.774,-48.403,-48.104,-46.996,-45.982,
     9 -50.225,-49.227,-48.898,-48.504,-48.190,-47.049,-46.015/
      DATA H2HE8/
     1 -50.537,-49.406,-49.016,-48.603,-48.273,-47.101,-46.048,
     2 -50.831,-49.598,-49.130,-48.697,-48.354,-47.152,-46.080,
     3 -50.981,-49.807,-49.239,-48.791,-48.435,-47.202,-46.112,
     4 -51.106,-50.006,-49.345,-48.882,-48.514,-47.251,-46.145,
     5 -51.231,-50.131,-49.445,-48.972,-48.591,-47.299,-46.176,
     6 -51.356,-50.256,-49.540,-49.060,-48.667,-47.347,-46.208,
     7 -51.481,-50.381,-49.629,-49.143,-48.741,-47.392,-46.239,
     8 -51.606,-50.506,-49.711,-49.225,-48.813,-47.437,-46.271,
     9 -51.731,-50.631,-49.787,-49.303,-48.885,-47.481,-46.302/
      DATA H2HE9/
     1 -51.856,-50.756,-49.858,-49.377,-48.955,-47.523,-46.333,
     2 -51.981,-50.881,-49.929,-49.449,-49.023,-47.566,-46.364,
     3 -52.106,-51.006,-50.000,-49.517,-49.089,-47.607,-46.395,
     4 -52.231,-51.131,-50.069,-49.581,-49.154,-47.647,-46.425,
     5 -52.356,-51.256,-50.133,-49.642,-49.217,-47.687,-46.456,
     6 -52.481,-51.381,-50.204,-49.699,-49.278,-47.726,-46.486,
     7 -52.606,-51.506,-50.275,-49.752,-49.337,-47.765,-46.517,
     8 -52.731,-51.631,-50.347,-49.803,-49.396,-47.802,-46.548,
     9 -52.856,-51.756,-50.418,-49.850,-49.450,-47.839,-46.578/
      DATA ITEMP1/0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 11 J=1,NRHOX
   11 XNH2(J)=(XNFPH(J,1)*2.*BHYD(J,1))**2*EXP(4.477/TKEV(J)-4.6628E1+
     1(1.8031E-3+(-5.0239E-7+(8.1424E-11-5.0501E-15*T(J))*T(J))*T(J))*
     2T(J)-1.5*TLOG(J))
C      PRINT 12,XNH2
   12 FORMAT(1P10E12.3)
   20 WAVENO=FREQ/2.99792458E10
      IF(WAVENO.GT.20000.)THEN
      DO 19 J=1,NRHOX
   19 AH2COLL(J)=0.
      RETURN
      ENDIF
      NU=WAVENO/250.
      NU=MIN(79,NU)
      DELNU=(WAVENO-250.*NU)/250.
C      PRINT 12,WAVENO,DELNU
      DO 21 IT=1,7
      H2H2NU(IT)=H2H2(IT,NU+1)*DELNU+H2H2(IT,NU+2)*(1.-DELNU)
   21 H2HENU(IT)=H2H2(IT,NU+1)*DELNU+H2HE(IT,NU+2)*(1.-DELNU)
      DO 22 J=1,NRHOX
      IT=T(J)/1000.
      IT=MAX(1,MIN(6,IT))
      DELT=(T(J)-1000.*IT)/1000.
      DELT=MAX(0.D0,MIN(1.D0,DELT))
      XH2H2=H2H2NU(IT)*DELT+H2H2NU(IT+1)*(1.-DELT)
      XH2HE=H2HENU(IT)*DELT+H2HENU(IT+1)*(1.-DELT)
C      PRINT 12, XH2H2,XH2HE,XNFHE(J,1),XNH2(J),RHO(J)
   22 AH2COLL(J)=(10.**XH2HE*XNFHE(J,1)+10.**XH2H2*XNH2(J))*XNH2(J)/
     1 RHO(J)*STIM(J)
C      PRINT 12, AH2COLL
      RETURN
      END
      SUBROUTINE LUKEOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     SI2,MG2,CA2,N1,O1
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /OPS/D1(kw,9),ALUKE(kw),D2(kw,15)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /XNFP/XNFPC(kw,4),XNFPN(kw,5),XNFPO(kw,6),XNFPNE(kw,6),
     1             XNFPAL(kw,1),XNFPMG(kw,2),XNFPSI(kw,2),XNFPCA(kw,2),
     2             XNFPFE(kw,1),XNFPCH(kw),XNFPOH(kw)
      REAL*8 N1OP,MG2OP
      DO 11 J=1,NRHOX
   11 ALUKE(J)=(N1OP(J)*XNFPN(J,1)+O1OP(J)*XNFPO(J,1)+MG2OP(J)*
     1XNFPMG(J,2)+SI2OP(J)*XNFPSI(J,2)+CA2OP(J)*XNFPCA(J,2))*
     2STIM(J)/RHO(J)
      RETURN
      END
      FUNCTION N1OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      REAL*8 N1OP
      DIMENSION C1130(kw),C1020(kw)
      DATA FREQ1,ITEMP1/0.,0/
      IF(ITEMP.EQ.ITEMP1)GO TO 30
      ITEMP1=ITEMP
      DO 20 K=1,NRHOX
      C1130(K)=6.*EXP(-3.575/TKEV(K))
   20 C1020(K)=10.*EXP(-2.384/TKEV(K))
   30 IF(FREQ.EQ.FREQ1)GO TO 40
      X1130=0.
      X1020=0.
      X853=0.
      IF(FREQ.GE.3.517915E15)X853=
     1SEATON(3.517915D15,1.142D-17,2.D0,4.29D0)
      IF(FREQ.GE.2.941534E15)X1020=
     1SEATON(2.941534D15,4.41D-18,1.5D0,3.85D0)
      IF(FREQ.GE.2.653317E15)X1130=
     1SEATON(2.653317D15,4.2D-18,1.5D0,4.34D0)
      FREQ1=FREQ
   40 N1OP=X853*4.+X1020*C1020(J)+X1130*C1130(J)
      RETURN
      END
      FUNCTION O1OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     FROM DEANE PETERSON AFTER PEACH
C     CROSS-SECTION TIMES PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      DATA FREQ1/0./
      IF(FREQ.EQ.FREQ1)GO TO 1
      X911=0.
      IF(FREQ.GE.3.28805E15)X911=
     1SEATON(3.28805D15,2.94D-18,1.D0,2.66D0)
      FREQ1=FREQ
    1 O1OP=X911*9.
      RETURN
      END
      FUNCTION MG2OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      REAL MG2OP
      DIMENSION C1169(kw)
      DATA FREQ1,ITEMP1/0.,0/
      IF(ITEMP.EQ.ITEMP1)GO TO 30
      ITEMP1=ITEMP
      DO 20 K=1,NRHOX
   20 C1169(K)=6.*EXP(-4.43/TKEV(K))
   30 IF(FREQ.EQ.FREQ1)GO TO 40
      X1169=0.
      X824=0.
      IF(FREQ.GE.3.635492E15)X824=
     1SEATON(3.635492D15,1.40D-19,4.D0,6.7D0)
      IF(FREQ.GE.2.564306E15)X1169=5.11E-19*(2.564306E15/FREQ)**3
      FREQ1=FREQ
   40 MG2OP=X824*2.+X1169*C1169(J)
      RETURN
      END
      FUNCTION SI2OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES THE PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION FLOG(9),FREQSI(7),PEACH(6,14),X(6),TLG(6),DT(kw),NT(kw)
      DATA PEACH/
C         10000     12000     14000     16000     18000     20000       WAVE(A)
     1  -43.8941, -43.8941, -43.8941, -43.8941, -43.8941, -43.8941,      500
     2  -42.2444, -42.2444, -42.2444, -42.2444, -42.2444, -42.2444,      600
     3  -40.6054, -40.6054, -40.6054, -40.6054, -40.6054, -40.6054,      759
     4  -54.2389, -52.2906, -50.8799, -49.8033, -48.9485, -48.2490,      760
     5  -50.4108, -48.4892, -47.1090, -46.0672, -45.2510, -44.5933,     1905
     6  -52.0936, -50.0741, -48.5999, -47.4676, -46.5649, -45.8246,     1906
     7  -51.9548, -49.9371, -48.4647, -47.3340, -46.4333, -45.6947,     1975
     8  -54.2407, -51.7319, -49.9178, -48.5395, -47.4529, -46.5709,     1976
     9  -52.7355, -50.2218, -48.4059, -47.0267, -45.9402, -45.0592,     3245
     T  -53.5387, -50.9189, -49.0200, -47.5750, -46.4341, -45.5082,     3246
     1  -53.2417, -50.6234, -48.7252, -47.2810, -46.1410, -45.2153,     3576
     2  -53.5097, -50.8535, -48.9263, -47.4586, -46.2994, -45.3581,     3577
     3  -54.0561, -51.2365, -49.1980, -47.6497, -46.4302, -45.4414,     3900
     4  -53.8469, -51.0256, -48.9860, -47.4368, -46.2162, -45.2266/     4200
      DATA FREQSI/4.9965417E15,3.9466738E15,1.5736321E15,1.5171539E15,
     1 9.2378947E14,8.3825004E14,7.6869872E14/
C     2P,2D,2P,2D,2P
      DATA FLOG/36.32984,36.14752,35.91165,34.99216,34.95561,34.45951,
     1 34.36234,34.27572,34.20161/
      DATA TLG/9.21034,9.39266,9.54681,9.68034,9.79813,9.90349/
      DATA FREQ1,ITEMP1/0.,0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 11 K=1,NRHOX
      N=MAX0(MIN0(5, INT(T(K)/2000.)-4),1)
      NT(K)=N
   11 DT(K)=(TLOG(K)-TLG(N))/(TLG(N+1)-TLG(N))
      GO TO 21
   20 IF(FREQ.EQ.FREQ1)GO TO 30
   21 FREQ1=FREQ
      DO 22 N=1,7
      IF(FREQ.GT.FREQSI(N))GO TO 23
   22 CONTINUE
      N=8
   23 D=(FREQLG-FLOG(N))/(FLOG(N+1)-FLOG(N))
      IF(N.GT.2)N=2*N-2
      IF(N.EQ.14)N=13
      D1=1.-D
      DO 24 IT=1,6
   24 X(IT)=PEACH(IT,N+1)*D+PEACH(IT,N)*D1
   30 N=NT(J)
      SI2OP=EXP(X(N)*(1.-DT(J))+X(N+1)*DT(J))*6.
      RETURN
      END
      FUNCTION CA2OP(J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     CROSS-SECTION TIMES THE PARTITION FUNCTION
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION C1218(kw),C1420(kw)
      DATA FREQ1,ITEMP1/0.,0/
      IF(ITEMP.EQ.ITEMP1)GO TO 30
      ITEMP1=ITEMP
      DO 20 K=1,NRHOX
      C1218(K)=10.*EXP(-1.697/TKEV(K))
   20 C1420(K)=6.*EXP(-3.142/TKEV(K))
   30 IF(FREQ.EQ.FREQ1)GO TO 40
      X1420=0.
      X1218=0.
      X1044=0.
      IF(FREQ.GE.2.870454E15)X1044=5.4E-20*(2.870454E15/FREQ)**3
      IF(FREQ.GE.2.460127E15)X1218=1.64E-17*SQRT(2.460127E15/FREQ)
      IF(FREQ.GE.2.110779E15)X1420=
     1SEATON(2.110779D15,4.13D-18,3.D0,.69D0)
      FREQ1=FREQ
   40 CA2OP=X1044*2.+X1218*C1218(J)+X1420*C1420(J)
      RETURN
      END
      SUBROUTINE HOTOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /OPS/D1(kw,10),AHOT(kw),D2(kw,14)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /XNF/XNFC(kw,6),XNFN(kw,6),XNFO(kw,6),XNFNE(kw,6),
     1            XNFMG(kw,6),XNFSI(kw,6),XNFS(kw,6),XNFFE(kw,5)
C     COMMON /XNFP/XNFPC(kw,4),XNFPN(kw,5),XNFPO(kw,6),XNFPNE(kw,6),
      COMMON /XNFP/XNFP(kw,21),
     1             XNFPAL(kw,1),XNFPMG(kw,2),XNFPSI(kw,2),XNFPCA(kw,2),
     2             XNFPFE(kw,1),XNFPCH(kw),XNFPOH(kw)
      DIMENSION AC2OP(kw),AC3OP(kw),AC4OP(kw)
      DIMENSION AN2OP(kw),AN3OP(kw),AN4OP(kw),AN5OP(kw)
      DIMENSION AO2OP(kw),AO3OP(kw),AO4OP(kw),AO5OP(kw),AO6OP(kw)
      DIMENSION A(420)
      DIMENSION A1(63),A2(63),A3(63),A4(63),A5(63),A6(63),A7(42)
      EQUIVALENCE (A(1),A1(1)),(A(64),A2(1)),(A(127),A3(1))
      EQUIVALENCE (A(190),A4(1)),(A(253),A5(1)),(A(316),A6(1))
      EQUIVALENCE (A(379),A7(1))
      DATA A1/
     1 4.149945E15, 6.90E-18, 1.000, 6.,  6.,  13.71,  2.,              6.01
     2 4.574341E15, 2.50E-18, 1.000, 4.,  2.,  11.96,  2.,              6.01
     3 5.220770E15, 1.08E-17, 1.000, 4., 10.,   9.28,  2.,              6.01
     4 5.222307E15, 5.35E-18, 3.769, 2.,  1.,   0.00, 16.,              10.00
     5 5.892577E15, 4.60E-18, 1.950, 6.,  6.,   0.00,  2.,              6.01
     6 6.177022E15, 3.50E-18, 1.000, 4., 12.,   5.33,  2.,              6.01
     7 6.181062E15, 6.75E-18, 3.101, 5.,  1.,   4.05,  6.,              7.01
     8 6.701879E15, 6.65E-18, 2.789, 5.,  5.,   1.90,  6.,              7.01
     9 7.158382E15, 6.65E-18, 2.860, 6.,  9.,   0.00,  6./              7.01
      DATA A2/
     1 7.284488E15, 3.43E-18, 4.174, 5.,  6.,   5.02, 11.,              8.01
     2 7.693612E15, 3.53E-18, 3.808, 5., 10.,   3.33, 11.,              8.01
     3 7.885955E15, 2.32E-18, 3.110, 5.,  6.,   5.02, 11.,              8.01
     4 8.295079E15, 3.97E-18, 3.033, 5., 10.,   3.33, 11.,              8.01
     5 8.497686E15, 7.32E-18, 3.837, 5.,  4.,   0.00, 11.,              8.01
     6 8.509966E15, 2.00E-18, 1.750, 7.,  3.,  12.69,  3.,              6.02
     7 8.572854E15, 1.68E-18, 3.751, 5.,  6.,   5.02, 11.,              8.01
     8 9.906370E15, 4.16E-18, 2.717, 3.,  6.,   0.00, 17.,              10.01
     9 1.000693E16, 2.40E-18, 1.750, 7.,  9.,   6.50,  3./              6.02
      DATA A3/
     1 1.046078E16, 4.80E-18, 1.000, 4., 10.,  12.53,  7.,              7.02
     2 1.067157E16, 2.71E-18, 2.148, 3.,  6.,   0.00, 17.,              10.01
     3 1.146734E16, 2.06E-18, 1.626, 6.,  6.,   0.00,  7.,              7.02
     4 1.156813E16, 5.20E-19, 2.126, 3.,  6.,   0.00, 17.,              10.01
     5 1.157840E16, 9.10E-19, 4.750, 4.,  1.,   0.00,  3.,              6.02
     6 1.177220E16, 5.30E-18, 1.000, 4., 12.,   7.10,  7.,              7.02
     7 1.198813E16, 3.97E-18, 2.780, 6.,  1.,   5.35, 12.,              8.02
     8 1.325920E16, 3.79E-18, 2.777, 6.,  5.,   2.51, 12.,              8.02
     9 1.327649E16, 3.65E-18, 2.014, 6.,  9.,   0.00, 12./              8.02
      DATA A4/
     1 1.361466E16, 7.00E-18, 1.000, 2.,  5.,   7.48, 12.,              8.02
     2 1.365932E16, 9.30E-19, 1.500, 7.,  6.,   8.00,  4.,              6.03
     3 1.481487E16, 1.10E-18, 1.750, 7.,  3.,  16.20,  8.,              7.03
     4 1.490032E16, 5.49E-18, 3.000, 5.,  1.,   6.91, 18.,              10.02
     5 1.533389E16, 1.80E-18, 2.277, 4.,  9.,   0.00, 18.,              10.02
     6 1.559452E16, 8.70E-19, 3.000, 6.,  2.,   0.00,  4.,              6.03
     7 1.579688E16, 4.17E-18, 2.074, 4.,  5.,   3.20, 18.,              10.02
     8 1.643205E16, 1.39E-18, 2.792, 5.,  5.,   3.20, 18.,              10.02
     9 1.656208E16, 2.50E-18, 2.346, 5.,  9.,   0.00, 18./              10.02
      DATA A5/
     1 1.671401E16, 1.30E-18, 1.750, 7.,  9.,   8.35,  8.,              7.03
     2 1.719725E16, 1.48E-18, 2.225, 5.,  9.,   0.00, 18.,              10.02
     3 1.737839E16, 2.70E-18, 1.000, 4., 10.,  15.74, 13.,              8.03
     4 1.871079E16, 1.27E-18,  .831, 6.,  6.,   0.00, 13.,              8.03
     5 1.873298E16, 9.10E-19, 3.000, 4.,  1.,   0.00,  8.,              7.03
     6 1.903597E16, 2.90E-18, 1.000, 4., 12.,   8.88, 13.,              8.03
     7 2.060738E16, 4.60E-18, 1.000, 3., 12.,  22.84, 19.,              10.03
     8 2.125492E16, 5.90E-19, 1.000, 6.,  6.,   9.99,  9.,              7.04
     9 2.162610E16, 1.69E-18, 1.937, 5.,  6.,   7.71, 19./              10.03
      DATA A6/
     1 2.226127E16, 1.69E-18, 1.841, 5., 10.,   5.08, 19.,              10.03
     2 2.251163E16, 9.30E-19, 2.455, 6.,  6.,   7.71, 19.,              10.03
     3 2.278001E16, 7.90E-19, 1.000, 6.,  9.,  10.20, 14.,              8.04
     4 2.317678E16, 1.65E-18, 2.277, 6., 10.,   5.08, 19.,              10.03
     5 2.348946E16, 3.11E-18, 1.963, 6.,  4.,   0.00, 19.,              10.03
     6 2.351911E16, 7.30E-19, 1.486, 5.,  6.,   7.71, 19.,              10.03
     7 2.366973E16, 5.00E-19, 1.000, 4.,  2.,   0.00,  9.,              7.04
     8 2.507544E16, 6.90E-19, 1.000, 6.,  3.,  19.69, 14.,              8.04
     9 2.754065E16, 7.60E-19, 1.000, 2.,  1.,   0.00, 14./              8.04
      DATA A7/
     1 2.864850E16, 1.54E-18, 2.104, 6.,  1.,   7.92, 20.,              10.04
     2 2.965598E16, 1.53E-18, 2.021, 6.,  5.,   3.76, 20.,              10.04
     3 3.054151E16, 1.40E-18, 1.471, 6.,  9.,   0.00, 20.,              10.04
     4 3.085141E16, 2.80E-18, 1.000, 4.,  5.,  11.01, 20.,              10.04
     5 3.339687E16, 3.60E-19, 1.000, 6.,  2.,   0.00, 15.,              8.05
     6 3.818757E16, 4.90E-19, 1.145, 6.,  6.,   0.00, 21./              10.05
      DATA NUM/60/
C      IF(FREQ.LT.A(1))RETURN
C
C     FREE-FREE
      DO 200 J=1,NRHOX
      FREE=COULFF(J,1)*1.**2*(XNFC(J,2)+XNFN(J,2)+XNFO(J,2)+XNFNE(J,2)+
     1                     XNFMG(J,2)+XNFSI(J,2)+XNFS(J,2)+XNFFE(J,2))+
     2     COULFF(J,2)*2.**2*(XNFC(J,3)+XNFN(J,3)+XNFO(J,3)+XNFNE(J,3)+
     3                     XNFMG(J,3)+XNFSI(J,3)+XNFS(J,3)+XNFFE(J,3))+
     4     COULFF(J,3)*3.**2*(XNFC(J,4)+XNFN(J,4)+XNFO(J,4)+XNFNE(J,4)+
     5                     XNFMG(J,4)+XNFSI(J,4)+XNFS(J,4)+XNFFE(J,4))+
     6     COULFF(J,4)*4.**2*(XNFC(J,5)+XNFN(J,5)+XNFO(J,5)+XNFNE(J,5)+
     7                     XNFMG(J,5)+XNFSI(J,5)+XNFS(J,5)+XNFFE(J,5))+
     8     COULFF(J,5)*5.**2*(XNFC(J,6)+XNFN(J,6)+XNFO(J,6)+XNFNE(J,6)+
     9                       XNFMG(J,6)+XNFSI(J,6)+XNFS(J,6)          )
  200 AHOT(J)=FREE*3.6919E8/FREQ**3*XNE(J)/SQRT(T(J))
C
C
      DO 700 J=1,NRHOX
      AC2OP(J)=0.
      AC3OP(J)=0.
      AC4OP(J)=0.
      AN2OP(J)=0.
      AN3OP(J)=0.
      AN4OP(J)=0.
      AN5OP(J)=0.
      AO2OP(J)=0.
      AO3OP(J)=0.
      AO4OP(J)=0.
      AO5OP(J)=0.
      AO6OP(J)=0.
  700 CONTINUE
      CALL C2OP(AC2OP)
      CALL C3OP(AC3OP)
      CALL C4OP(AC4OP)
      CALL N2OP(AN2OP)
      CALL N3OP(AN3OP)
      CALL N4OP(AN4OP)
      CALL N5OP(AN5OP)
      CALL O2OP(AO2OP)
      CALL O3OP(AO3OP)
      CALL O4OP(AO4OP)
      CALL O5OP(AO5OP)
      CALL O6OP(AO6OP)
      DO 701 J=1,NRHOX
  701 AHOT(J)=AHOT(J)+
     1 AC2OP(J)+AC3OP(J)+AC4OP(J)+
     2 AN2OP(J)+AN3OP(J)+AN4OP(J)+AN5OP(J)+
     3 AO2OP(J)+AO3OP(J)+AO4OP(J)+AO5OP(J)+AO6OP(J)
C
C
      L=-6
      DO 20 I=1,NUM
      L=L+7
      IF(FREQ.LT.A(L))GO TO 20
      XSECT=A(L+1)*(A(L+2)+(A(L)/FREQ)-A(L+2)*(A(L)/FREQ))*
     1 SQRT((A(L)/FREQ)** INT(A(L+3)))
      ID=A(L+6)
      DO 10 J=1,NRHOX
      XX=XSECT*XNFP(J,ID)*A(L+4)
      IF(XX.GT.AHOT(J)/100.)AHOT(J)=AHOT(J)+XX/EXP(A(L+5)/TKEV(J))
   10 CONTINUE
   20 CONTINUE
      DO 30 J=1,NRHOX
   30 AHOT(J)=AHOT(J)*STIM(J)/RHO(J)
      RETURN
      END
      SUBROUTINE C2OP(AC2OP)
      RETURN
      END
      SUBROUTINE C3OP(AC3OP)
      RETURN
      END
      SUBROUTINE C4OP(AC4OP)
      RETURN
      END
      SUBROUTINE N2OP(AN2OP)
      RETURN
      END
      SUBROUTINE N3OP(AN3OP)
      RETURN
      END
      SUBROUTINE N4OP(AN4OP)
      RETURN
      END
      SUBROUTINE N5OP(AN5OP)
      RETURN
      END
      SUBROUTINE O2OP(AO2OP)
      RETURN
      END
      SUBROUTINE O3OP(AO3OP)
      RETURN
      END
      SUBROUTINE O4OP(AO4OP)
      RETURN
      END
      SUBROUTINE O5OP(AO5OP)
      RETURN
      END
      SUBROUTINE O6OP(AO6OP)
      RETURN
      END
      SUBROUTINE ELECOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /OPS/D1(kw,11),SIGEL(kw),D2(kw,13)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      DO 1 J=1,NRHOX
    1 SIGEL(J)=.6653E-24*XNE(J)/RHO(J)
      RETURN
      END
      SUBROUTINE H2RAOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,12),SIGH2(kw),D2(kw,12)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION XNH2(kw)
      DATA ITEMP1/0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      DO 11 J=1,NRHOX
   11 XNH2(J)=(XNFPH(J,1)*2.*BHYD(J,1))**2*EXP(4.477/TKEV(J)-4.6628E1+
     1(1.8031E-3+(-5.0239E-7+(8.1424E-11-5.0501E-15*T(J))*T(J))*T(J))*
     2T(J)-1.5*TLOG(J))/RHO(J)
   20 WAVE=2.997925E18/DMIN1(FREQ,2.922D15)
      WW=WAVE**2
      SIG=(8.14E-13+1.28E-6/WW+1.61/(WW*WW))/(WW*WW)
      DO 21 J=1,NRHOX
   21 SIGH2(J)=SIG*XNH2(J)
      RETURN
      END
      SUBROUTINE HLINOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     REQUIRES STARK AND COULX
      COMMON /DEPART/BHYD(kw,6),BMIN(kw),NLTEON
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IONS/XNFPH(kw,2),XNFPHE(kw,3),XNFH(kw,2),XNFHE(kw,3)
      COMMON /OPS/D1(kw,13),AHLINE(kw),D2(kw,8),SHLINE(kw),D3(kw,2)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION BOLT(kw,4),MLAST(kw)
      DATA ITEMP1/0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      DO 10 J=1,NRHOX
      MLAST(J)=1100./XNE(J)**.133333333
      DO 10 N=1,4
   10 BOLT(J,N)=EXP(-(13.595-13.595/DFLOAT(N*N))/TKEV(J))*2.*
     1DFLOAT(N*N)*BHYD(J,N)*XNFPH(J,1)/RHO(J)
      ITEMP1=ITEMP
   20 N=SQRT(3.28805E15/FREQ)
      IF(N.EQ.0.OR.N.GT.4)RETURN
      GO TO (21,22,30,30),N
   21 IF(FREQ.LT.2.E15)RETURN
      GO TO 30
   22 IF(FREQ.LT.4.44E14)RETURN
   30 MFREQ=SQRT(3.28805E15/(3.28805E15/DFLOAT(N*N)-FREQ))
      DO 50 J=1,NRHOX
      M1=MFREQ
      M2=M1+1
      M1=MAX0(M1,N+1)
      H=0.
      S=0.
      IF(M1.LE.6)GO TO 39
      IF(M1.GT.MLAST(J))GO TO 45
      M1=M1-1
      M2=M2+3
      IF(N.LT.4.OR.M1.GT.8)GO TO 39
      H=STARK(3,4,J)*(1.-EHVKT(J)*BHYD(J,4)/BHYD(J,3))*BOLT(J,3)
      S=H*BNU(J)*STIM(J)/(BHYD(J,3)/BHYD(J,4)-EHVKT(J))
   39 DO 40 M=M1,M2
      BHYDJM=1.
      IF(M.LE.6)BHYDJM=BHYD(J,M)
C     ASSUMING FREQ APROXIMATELY FREQNM
      A=STARK(N,M,J)*(1.-EHVKT(J)*BHYDJM/BHYD(J,N))*BOLT(J,N)
      H=H+A
   40 S=S+A*BNU(J)*STIM(J)/(BHYD(J,N)/BHYDJM-EHVKT(J))
      AHLINE(J)=H
      SHLINE(J)=S/H
      GO TO 50
   45 AHLINE(J)=COULX(N,3.28806E15/DFLOAT(N*N),1.D0)*(1.-EHVKT(J)/
     1BHYD(J,N))*BOLT(J,N)
      SHLINE(J)=BNU(J)*STIM(J)/(BHYD(J,N)-EHVKT(J))
   50 CONTINUE
      RETURN
      END
      FUNCTION STARK(N,M,J)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      DIMENSION F0(kw)
      DIMENSION KNMTAB(5,4),FSTARK(10,4)
      REAL*8 NN,MM,IMPACT,KNM,KNMTAB
      DATA KNMTAB/.000356,.000523,.00109,.00149,.00225,.0125,.0177,.028,
     1.0348,.0493,.124,.171,.223,.261,.342,.683,.866,1.02,1.19,1.46/
      DATA FSTARK/.1387,.07910,.02126,.01394,.006462,.004814,.002779,
     1 .002216,.001443,.001201,.3921,.1193,.03766,.02209,.01139,
     2 .008036,.005007,.003850,.002658,.002151,.6103,.1506,.04931,
     3 .02768,.01485,.01023,.006588,.004996,.003542,.002838,.8163,.1788,
     4 .05985,.03189,.01762,.01196,.007825,.005882,.004233,.003375/
C     IF YOUR RYDBERG IS DIFFERENT YOU MAY GET LINES IN STRANGE PLACES
      DATA RYD/3.28805E15/
      DATA ITEMP1/0/
      EXINT(X)=-DLOG(X)-.57516+(.97996-(.21654-(.033572-(.0029222-
     1 1.05439E-4*X)*X)*X)*X)*X
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      DO 10 K=1,NRHOX
   10 F0(K)=1.25E-9*XNE(K)**.6666667
      ITEMP1=ITEMP
   20 XN=N
      XM=M
      X=XN/XM
      XX=X**2
      NN=N*N
      MM=M*M
      MMINN=M-N
      IF(MMINN.GT.5)GO TO 21
      KNM=KNMTAB(MMINN,N)
      GO TO 22
   21 KNM=5.5E-5*(NN*MM)**2/(MM-NN)
   22 IF(MMINN.GT.10)GO TO 23
      FNM=FSTARK(MMINN,N)
      GO TO 30
   23 FNM=FSTARK(10,N)*((20.*XN+100.)/(XN+10.)/XM/(1.-XX))**3
   30 FREQNM=RYD*(1./NN-1./MM)
      DEL=ABS(FREQ-FREQNM)
      DBETA=2.997925E18/FREQNM**2/F0(J)/KNM
      BETA=DBETA*DEL
      Y1=MM*DEL*HKT(J)/2.
      Y2=(3.14159*3.14159/2./.0265384/2.997925E10)*DEL**2/XNE(J)
      QSTAT=1.5+.5*(Y1**2-1.384)/(Y1**2+1.384)
      IMPACT=0.
      IF(Y1.GT.8..OR.Y1.GE.Y2)GO TO 40
      EXY2=0.
      IF(Y2.LE.8.)EXY2=EXINT(Y2)
      IMPACT=1.438*SQRT(Y1*(1.-XX))*(.4*EXP(-Y1)+EXINT(Y1)-.5*EXY2)
   40 IF(BETA.GT.20.)GO TO 45
      PROF=8./(80.+BETA**3)
      RATIO=QSTAT+IMPACT
      GO TO 50
   45 PROF=1.5/BETA/BETA/SQRT(BETA)
      DIOI=6.28*1.48E-25*(2.*MM*RYD/DEL)*XNE(J)*(SQRT(2.*MM*RYD/DEL)*
     1(1.3*QSTAT+.30*IMPACT)-3.9*RYD*HKT(J))
      RATIO=QSTAT*DMIN1(1.+DIOI,1.25D0)+IMPACT
   50 STARK=.0265384*FNM*PROF*DBETA*RATIO
      RETURN
      END
      SUBROUTINE LINOP(N,NSTEPS,STEPWT)
C     READS A BIG DF FILE INTO MEMORY TO MINIMIZE IO
C     ASSUMES THAT VTURB IS CONSTANT AND THAT THE DF FILE IS GIVEN
C     ONLY FOR THAT VTURB
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
C     COMMON /BIGLIT/WAVELIT(1213),WAVEBIG(329)
      COMMON /BIGLIT/WAVEDF(1213,2)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
      COMMON /OPS/D1(kw,14),ALINES(kw),SIGLIN(kw),D2(kw,9)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
C     INTEGER*2 KAP(21,56,12,5)
      INTEGER*2 KAP(21,56,12),KAPWL(21,56,12,328)
CDROM BYTE KAPBYTE(2,21,56,12),ONEBYTE
CDROM EQUIVALENCE (KAPBYTE(1,1,1,1),KAP(1,1,1))
      DIMENSION WLBEG(328),WLEND(328)
      DIMENSION WT(12)
      REAL*4 CO1(kw),CO2(kw),CO3(kw),CO4(kw),CO5(kw),CO6(kw),A
      DIMENSION IPJ(kw),ITJ(kw),IVJ(kw),FSCAT(kw)
      DIMENSION TABT(56),TABP(21),TABV(5)
      DATA TABT/ 3.32,3.34,3.36,3.38,3.40,3.42,3.44,3.46,3.48,3.50,3.52,
     1 3.54,3.56,3.58,3.60,3.62,3.64,3.66,3.68,3.70,3.73,3.76,3.79,3.82,
     2 3.85,3.88,3.91,3.94,3.97,4.00,4.05,4.10,4.15,4.20,4.25,4.30,4.35,
     3 4.40,4.45,4.50,4.55,4.60,4.65,4.70,4.75,4.80,4.85,4.90,4.95,5.00,
     4 5.05,5.10,5.15,5.20,5.25,5.30/
      DATA TABP/-2.,-1.5,-1.,-.5,0.,.5,1.,1.5,2.,2.5,
     1 3.,3.5,4.,4.5,5.,5.5,6.,6.5,7.0,7.5,8.0/
      DATA TABV/0.,1.D5,2.D5,4.D5,8.D5/
      DATA ITEMP1/0/
      DATA IREAD/0/
      DATA TENLOG/2.30258509299405E0/
      IF(ITEMP.EQ.ITEMP1)GO TO 20
      ITEMP1=ITEMP
      IF(IREAD.EQ.0)THEN
      IREAD=1
      DO 5 IWL=1,328
C     READ(9)WLBEG(IWL),WLEND(IWL),KAP
      READ(9)KAP
      WLBEG(IWL)=WAVEDF(IWL,2)
      WLEND(IWL)=WAVEDF(IWL+1,2)
      DO 5 IP=1,21
      DO 5 IT=1,56
      DO 5 ISTEP=1,12
C      SOME COMPUTERS REQUIRE BYTE REVERSAL
C      ONEBYTE=KAPBYTE(1,IP,IT,ISTEP)
C      KAPBYTE(1,IP,IT,ISTEP)=KAPBYTE(2,IP,IT,ISTEP)
C      KAPBYTE(2,IP,IT,ISTEP)=ONEBYTE
      KAPWL(IP,IT,ISTEP,IWL)=KAP(IP,IT,ISTEP)
    5 CONTINUE
      WLEND(328)=1000000.
      CLOSE(UNIT=9)
      ENDIF
    7 DO 19 J=1,NRHOX
      TL=DMIN1(DMAX1(TLOG(J)/TENLOG,3.32D0),5.3D0)
      DO 10 IT=2,56
      IF(TL.LT.TABT(IT))GO TO 11
   10 CONTINUE
      IT=56
   11 PLOG=DMIN1(DMAX1(DLOG10(P(J)),-2.D0),8.0D0)
      DO 12 IP=2,21
      IF(PLOG.LT.TABP(IP))GO TO 13
   12 CONTINUE
      IP=21
   13 CONTINUE
C   13 VTUR=DMIN1(DMAX1(VTURB(J),0.D5),8.0D5)
C      DO 14 IV=2,5
C      IF(VTUR.LT.TABV(IV))GO TO 15
C   14 CONTINUE
C      IV=5
   15 IPJ(J)=IP
      ITJ(J)=IT
C      IVJ(J)=IV
      X=(TL-TABT(IT-1))/(TABT(IT)-TABT(IT-1))
      Y=(PLOG-TABP(IP-1))/(TABP(IP)-TABP(IP-1))
C      Z=(VTUR-TABV(IV-1))/(TABV(IV)-TABV(IV-1))
      CO1(J)=(1.-X)*(1.-Y)*TENLOG*.001
      CO2(J)=(1.-X)*Y*TENLOG*.001
      CO3(J)=X*(1.-Y)*TENLOG*.001
      CO4(J)=X*Y*TENLOG*.001
C      CO5(J)=Z
C      CO6(J)=1.-Z
C     THE STEPS HAVE BEEN SCALED BY 1000
      FSCAT(J)=0.
      IF(TAUSCAT.GT.0.)FSCAT(J)=EXP(-TAUROS(J)/TAUSCAT)
   19 CONTINUE
      WT(1)=1./60.
      WT(2)=2./60.
      WT(3)=3./60.
      WT(4)=6./60.
      WT(5)=6./60.
      WT(6)=6./60.
      WT(7)=6./60.
      WT(8)=6./60.
      WT(9)=6./60.
      WT(10)=6./60.
      WT(11)=6./60.
      WT(12)=6./60.
C      REWIND 9
      IWL=1
C      WLEND=0.
   20 WAVE=2.997925E17/FREQ
   21 IF(WAVE.LT.WLEND(IWL))GO TO 22
C      READ(9)WLBEG,WLEND,KAP
C      IF(WLEND.GT.9999.)WLEND=1000000.
      IWL=IWL+1
      GO TO 21
   22 NSTEPS=12
      N12=13-N
  222 STEPWT=WT(N)
C
      DO 25 J=1,NRHOX
      IT=ITJ(J)
      IP=IPJ(J)
C      IV=IVJ(J)
C      A=EXP((CO1(J)*KAP(IP-1,IT-1,N12,IV  )+
C     1       CO2(J)*KAP(IP  ,IT-1,N12,IV  )+
C     2       CO3(J)*KAP(IP-1,IT  ,N12,IV  )+
C     3       CO4(J)*KAP(IP  ,IT  ,N12,IV  ))*CO5(J)+
C     4      (CO1(J)*KAP(IP-1,IT-1,N12,IV-1)+
C     5       CO2(J)*KAP(IP  ,IT-1,N12,IV-1)+
C     6       CO3(J)*KAP(IP-1,IT  ,N12,IV-1)+
C     7       CO4(J)*KAP(IP  ,IT  ,N12,IV-1))*CO6(J))
C      A=EXP( CO1(J)*KAP(IP-1,IT-1,N12)+
C     1       CO2(J)*KAP(IP  ,IT-1,N12)+
C     2       CO3(J)*KAP(IP-1,IT  ,N12)+
C     3       CO4(J)*KAP(IP  ,IT  ,N12))
      A=EXP( CO1(J)*KAPWL(IP-1,IT-1,N12,IWL)+
     1       CO2(J)*KAPWL(IP  ,IT-1,N12,IWL)+
     2       CO3(J)*KAPWL(IP-1,IT  ,N12,IWL)+
     3       CO4(J)*KAPWL(IP  ,IT  ,N12,IWL))
      SIGLIN(J)=FSCAT(J)*A
   25 ALINES(J)=(1.-FSCAT(J))*A
      RETURN
      END
C      SUBROUTINE LINOP(N,NSTEPS,STEPWT)
CC     READS A BIG OR LIT DF FILE ONE WAVELENGTH AT A TIME
CC     ASSUMES THAT VTURB IS CONSTANT AND THAT THE OPACITY FILE IS GIVEN
CC     ONLY FOR THAT VTURB
C      IMPLICIT REAL*8 (A-H,O-Z)
C      PARAMETER (kw=99)
C      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
CC     COMMON /BIGLIT/WAVELIT(1213),WAVEBIG(329)
C      COMMON /BIGLIT/WAVEDF(1213,2)
C      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
C      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
C      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
C      COMMON /OPS/D1(kw,14),ALINES(kw),SIGLIN(kw),D2(kw,9)
C      COMMON /RHOX/RHOX(kw),NRHOX
C      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
c      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
C      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
C     1               IFTURB
CC     INTEGER*2 KAP(21,56,12,5)
C      INTEGER*2 KAP(21,56,12)
CCDROM BYTE KAPBYTE(2,14112),ONEBYTE
CCDROM EQUIVALENCE (KAPBYTE(1,1),KAP(1,1,1))
C      CHARACTER*3 IDFREQ
C      DIMENSION WT(12)
C      REAL*4 CO1(kw),CO2(kw),CO3(kw),CO4(kw),CO5(kw),CO6(kw),A
C      DIMENSION IPJ(kw),ITJ(kw),IVJ(kw),FSCAT(kw)
C      DIMENSION TABT(56),TABP(21),TABV(5)
C      DATA TABT/ 3.32,3.34,3.36,3.38,3.40,3.42,3.44,3.46,3.48,3.50,3.52,
C     1 3.54,3.56,3.58,3.60,3.62,3.64,3.66,3.68,3.70,3.73,3.76,3.79,3.82,
C     2 3.85,3.88,3.91,3.94,3.97,4.00,4.05,4.10,4.15,4.20,4.25,4.30,4.35,
C     3 4.40,4.45,4.50,4.55,4.60,4.65,4.70,4.75,4.80,4.85,4.90,4.95,5.00,
C     4 5.05,5.10,5.15,5.20,5.25,5.30/
C      DATA TABP/-2.,-1.5,-1.,-.5,0.,.5,1.,1.5,2.,2.5,
C     1 3.,3.5,4.,4.5,5.,5.5,6.,6.5,7.0,7.5,8.0/
C      DATA TABV/0.,1.D5,2.D5,4.D5,8.D5/
C      DATA ITEMP1/0/
C      DATA TENLOG/2.30258509299405E0/
C      IF(ITEMP.EQ.ITEMP1)GO TO 20
C      ITEMP1=ITEMP
C      DO 19 J=1,NRHOX
C      TL=DMIN1(DMAX1(TLOG(J)/TENLOG,3.32D0),5.3D0)
C      DO 10 IT=2,56
C      IF(TL.LT.TABT(IT))GO TO 11
C   10 CONTINUE
C      IT=56
C   11 PLOG=DMIN1(DMAX1(DLOG10(P(J)),-2.D0),8.0D0)
C      DO 12 IP=2,21
C      IF(PLOG.LT.TABP(IP))GO TO 13
C   12 CONTINUE
C      IP=21
C   13 CONTINUE
CC   13 VTUR=DMIN1(DMAX1(VTURB(J),0.D5),8.0D5)
CC      DO 14 IV=2,5
CC      IF(VTUR.LT.TABV(IV))GO TO 15
CC   14 CONTINUE
CC      IV=5
C   15 IPJ(J)=IP
C      ITJ(J)=IT
CC      IVJ(J)=IV
C      X=(TL-TABT(IT-1))/(TABT(IT)-TABT(IT-1))
C      Y=(PLOG-TABP(IP-1))/(TABP(IP)-TABP(IP-1))
CC      Z=(VTUR-TABV(IV-1))/(TABV(IV)-TABV(IV-1))
C      CO1(J)=(1.-X)*(1.-Y)*TENLOG*.001
C      CO2(J)=(1.-X)*Y*TENLOG*.001
C      CO3(J)=X*(1.-Y)*TENLOG*.001
C      CO4(J)=X*Y*TENLOG*.001
CC      CO5(J)=Z
CC      CO6(J)=1.-Z
CC     THE STEPS HAVE BEEN SCALED BY 1000
C      FSCAT(J)=0.
C      IF(TAUSCAT.GT.0.)FSCAT(J)=EXP(-TAUROS(J)/TAUSCAT)
C   19 CONTINUE
C      WT(1)=1./60.
C      WT(2)=2./60.
C      WT(3)=3./60.
C      WT(4)=6./60.
C      WT(5)=6./60.
C      WT(6)=6./60.
C      WT(7)=6./60.
C      WT(8)=6./60.
C      WT(9)=6./60.
C      WT(10)=6./60.
C      WT(11)=6./60.
C      WT(12)=6./60.
C      REWIND 9
C      WRITE(IDFREQ,'(3A1)')FREQID(1),FREQID(2),FREQID(3)
C      IF(IDFREQ.EQ.'BIG')IBIGLIT=2
C      IF(IDFREQ.EQ.'LIT')IBIGLIT=1
C      IWLREAD=0
C      WLEND=0.
C   20 WAVE=2.997925E17/FREQ
C   21 IF(WAVE.LT.WLEND)GO TO 22
CC     READ(9)WLBEG,WLEND,KAP
C      IF(WLEND.GT.9999.)WLEND=1000000.
C      IWLREAD=IWLREAD+1
C      WLBEG=WAVEDF(IWLREAD,IBIGLIT)
C      WLEND=WAVEDF(IWLREAD+1,IBIGLIT)
C      READ(9)KAP
CCC     SOME COMPUTERS REQUIRE BYTE ROTATION
CC      DO 2222 I=1,14112
CC      ONEBYTE=KAPBYTE(1,I)
CC      KAPBYTE(1,I)=KAPBYTE(2,I)
CC 2222 KAPBYTE(2,I)=ONEBYTE
C      GO TO 21
C   22 NSTEPS=12
C      N12=13-N
C  222 STEPWT=WT(N)
CC
C      DO 25 J=1,NRHOX
C      IT=ITJ(J)
C      IP=IPJ(J)
CC      IV=IVJ(J)
CC      A=EXP((CO1(J)*KAP(IP-1,IT-1,N12,IV  )+
CC     1       CO2(J)*KAP(IP  ,IT-1,N12,IV  )+
CC     2       CO3(J)*KAP(IP-1,IT  ,N12,IV  )+
CC     3       CO4(J)*KAP(IP  ,IT  ,N12,IV  ))*CO5(J)+
CC     4      (CO1(J)*KAP(IP-1,IT-1,N12,IV-1)+
CC     5       CO2(J)*KAP(IP  ,IT-1,N12,IV-1)+
CC     6       CO3(J)*KAP(IP-1,IT  ,N12,IV-1)+
CC     7       CO4(J)*KAP(IP  ,IT  ,N12,IV-1))*CO6(J))
C      A=EXP( CO1(J)*KAP(IP-1,IT-1,N12)+
C     1       CO2(J)*KAP(IP  ,IT-1,N12)+
C     2       CO3(J)*KAP(IP-1,IT  ,N12)+
C     3       CO4(J)*KAP(IP  ,IT  ,N12))
C      SIGLIN(J)=FSCAT(J)*A
C   25 ALINES(J)=(1.-FSCAT(J))*A
C      RETURN
C      END
C      SUBROUTINE LINOP(N,NSTEPS,STEPWT)
CC     READS 5 BIG OR LIT DF FILES FOR VTURB 0,1,2,4,8 ONE WAVELENGTH AT A TIME
CC     INTERPOLATES TO AN ARBITRARY VTURB
C      IMPLICIT REAL*8 (A-H,O-Z)
C      PARAMETER (kw=99)
C      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
CC     COMMON /BIGLIT/WAVELIT(1213),WAVEBIG(329)
C      COMMON /BIGLIT/WAVEDF(1213,2)
C      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw)
C      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,TAUSCAT,IFMOL
C      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
C      COMMON /OPS/D1(kw,14),ALINES(kw),SIGLIN(kw),D2(kw,9)
C      COMMON /RHOX/RHOX(kw),NRHOX
C      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
c      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
C      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
C     1               IFTURB
C      INTEGER*2 KAP(21,56,12,5),KAP0(21,56,12),KAP1(21,56,12)
C      INTEGER*2 KAP2(21,56,12),KAP4(21,56,12),KAP8(21,56,12)
C      EQUIVALENCE (KAP(1,1,1,1),KAP0(1,1,1))
C      EQUIVALENCE (KAP(1,1,1,2),KAP1(1,1,1))
C      EQUIVALENCE (KAP(1,1,1,3),KAP2(1,1,1))
C      EQUIVALENCE (KAP(1,1,1,4),KAP4(1,1,1))
C      EQUIVALENCE (KAP(1,1,1,5),KAP8(1,1,1))
CCDROM BYTE KAPBYTE(2,70560),ONEBYTE
CCDROM EQUIVALENCE (KAPBYTE(1,1),KAP(1,1,1,1))
C      CHARACTER*3 IDFREQ
C      DIMENSION WT(12)
C      REAL*4 CO1(kw),CO2(kw),CO3(kw),CO4(kw),CO5(kw),CO6(kw),A
C      DIMENSION IPJ(kw),ITJ(kw),IVJ(kw),FSCAT(kw)
C      DIMENSION TABT(56),TABP(21),TABV(5)
C      DATA TABT/ 3.32,3.34,3.36,3.38,3.40,3.42,3.44,3.46,3.48,3.50,3.52,
C     1 3.54,3.56,3.58,3.60,3.62,3.64,3.66,3.68,3.70,3.73,3.76,3.79,3.82,
C     2 3.85,3.88,3.91,3.94,3.97,4.00,4.05,4.10,4.15,4.20,4.25,4.30,4.35,
C     3 4.40,4.45,4.50,4.55,4.60,4.65,4.70,4.75,4.80,4.85,4.90,4.95,5.00,
C     4 5.05,5.10,5.15,5.20,5.25,5.30/
C      DATA TABP/-2.,-1.5,-1.,-.5,0.,.5,1.,1.5,2.,2.5,
C     1 3.,3.5,4.,4.5,5.,5.5,6.,6.5,7.0,7.5,8.0/
C      DATA TABV/0.,1.D5,2.D5,4.D5,8.D5/
C      DATA ITEMP1/0/
C      DATA TENLOG/2.30258509299405E0/
C      IF(ITEMP.EQ.ITEMP1)GO TO 20
C      ITEMP1=ITEMP
C      DO 19 J=1,NRHOX
C      TL=DMIN1(DMAX1(TLOG(J)/TENLOG,3.32D0),5.3D0)
C      DO 10 IT=2,56
C      IF(TL.LT.TABT(IT))GO TO 11
C   10 CONTINUE
C      IT=56
C   11 PLOG=DMIN1(DMAX1(DLOG10(P(J)),-2.D0),8.0D0)
C      DO 12 IP=2,21
C      IF(PLOG.LT.TABP(IP))GO TO 13
C   12 CONTINUE
C      IP=21
C   13 VTUR=DMIN1(DMAX1(VTURB(J),0.D5),8.0D5)
C      DO 14 IV=2,5
C      IF(VTUR.LT.TABV(IV))GO TO 15
C   14 CONTINUE
C      IV=5
C   15 IPJ(J)=IP
C      ITJ(J)=IT
C      IVJ(J)=IV
C      X=(TL-TABT(IT-1))/(TABT(IT)-TABT(IT-1))
C      Y=(PLOG-TABP(IP-1))/(TABP(IP)-TABP(IP-1))
C      Z=(VTUR-TABV(IV-1))/(TABV(IV)-TABV(IV-1))
C      CO1(J)=(1.-X)*(1.-Y)*TENLOG*.001
C      CO2(J)=(1.-X)*Y*TENLOG*.001
C      CO3(J)=X*(1.-Y)*TENLOG*.001
C      CO4(J)=X*Y*TENLOG*.001
C      CO5(J)=Z
C      CO6(J)=1.-Z
CC     THE STEPS HAVE BEEN SCALED BY 1000
C      FSCAT(J)=0.
C      IF(TAUSCAT.GT.0.)FSCAT(J)=EXP(-TAUROS(J)/TAUSCAT)
C   19 CONTINUE
C      WT(1)=1./60.
C      WT(2)=2./60.
C      WT(3)=3./60.
C      WT(4)=6./60.
C      WT(5)=6./60.
C      WT(6)=6./60.
C      WT(7)=6./60.
C      WT(8)=6./60.
C      WT(9)=6./60.
C      WT(10)=6./60.
C      WT(11)=6./60.
C      WT(12)=6./60.
C      REWIND 20
C      REWIND 21
C      REWIND 22
C      REWIND 24
C      REWIND 28
C      WRITE(IDFREQ,'(3A1)')FREQID(1),FREQID(2),FREQID(3)
C      IF(IDFREQ.EQ.'BIG')IBIGLIT=2
C      IF(IDFREQ.EQ.'LIT')IBIGLIT=1
C      IWLREAD=0
C      WLEND=0.
C   20 WAVE=2.997925E17/FREQ
C   21 IF(WAVE.LT.WLEND)GO TO 22
CC     READ(20)WLBEG,WLEND,KAP0
CC     READ(21)WLBEG,WLEND,KAP1
CC     READ(22)WLBEG,WLEND,KAP2
CC     READ(24)WLBEG,WLEND,KAP4
CC     READ(28)WLBEG,WLEND,KAP8
C      IF(WLEND.GT.9999.)WLEND=1000000.
C      IWLREAD=IWLREAD+1
C      WLBEG=WAVEDF(IWLREAD,IBIGLIT)
C      WLEND=WAVEDF(IWLREAD+1,IBIGLIT)
C      READ(20)KAP0
C      READ(21)KAP1
C      READ(22)KAP2
C      READ(24)KAP4
C      READ(28)KAP8
CCC     IF COMPUTER REQUIRES BYTE ROTATION
CC      DO 2222 I=1,70560
CC      ONEBYTE=KAPBYTE(1,I)
CC      KAPBYTE(1,I)=KAPBYTE(2,I)
CC 2222 KAPBYTE(2,I)=ONEBYTE
C      GO TO 21
C   22 NSTEPS=12
C      N12=13-N
C  222 STEPWT=WT(N)
CC
C      DO 25 J=1,NRHOX
C      IT=ITJ(J)
C      IP=IPJ(J)
C      IV=IVJ(J)
C      A=EXP((CO1(J)*KAP(IP-1,IT-1,N12,IV  )+
C     1       CO2(J)*KAP(IP  ,IT-1,N12,IV  )+
C     2       CO3(J)*KAP(IP-1,IT  ,N12,IV  )+
C     3       CO4(J)*KAP(IP  ,IT  ,N12,IV  ))*CO5(J)+
C     4      (CO1(J)*KAP(IP-1,IT-1,N12,IV-1)+
C     5       CO2(J)*KAP(IP  ,IT-1,N12,IV-1)+
C     6       CO3(J)*KAP(IP-1,IT  ,N12,IV-1)+
C     7       CO4(J)*KAP(IP  ,IT  ,N12,IV-1))*CO6(J))
C      SIGLIN(J)=FSCAT(J)*A
C   25 ALINES(J)=(1.-FSCAT(J))*A
C      RETURN
C      END
      SUBROUTINE BLOCKBIG
      IMPLICIT REAL*8 (A-H,O-Z)
C     COMMON /BIGLIT/WAVELIT(1213),WAVEBIG(329)
      COMMON /BIGLIT/WAVELIT(1213),WAVEBIG(1213)
C     REAL*8 BIGA(95),BIGB(125),BIGC(109)
      REAL*8 BIGA(95),BIGB(125),BIGC(993)
      REAL*8 LITA(95),LITB(190),LITC(190),LITD(190),LITE(190)
      REAL*8 LITF(190),LITG(168)
      EQUIVALENCE (WAVEBIG(1),BIGA(1)),(WAVEBIG(96),BIGB(1))
      EQUIVALENCE (WAVEBIG(221),BIGC(1))
      EQUIVALENCE (WAVELIT(1),LITA(1)),(WAVELIT(96),LITB(1))
      EQUIVALENCE (WAVELIT(286),LITC(1)),(WAVELIT(476),LITD(1))
      EQUIVALENCE (WAVELIT(666),LITE(1)),(WAVELIT(856),LITF(1))
      EQUIVALENCE (WAVELIT(1046),LITG(1))
      DATA BIGA/
     1     8.97666,     9.2,         9.5,         9.71730,     9.81590,
     2    10.10901,    10.3,        10.46451,    10.65,       10.88545,
     3    11.2,        11.6,        11.95562,    12.3,        12.66565,
     4    12.74676,    12.93504,    13.16033,    13.31723,    13.46700,
     5    13.86253,    14.10462,    14.54782,    14.9,        15.3,
     6    15.74874,    16.00346,    16.4,        16.8,        17.25088,
     7    17.43258,    17.93660,    18.10114,    18.24438,    18.97796,
     8    19.22422,    19.55098,    20.11987,    20.23592,    20.8,
     9    21.3,        21.94783,    22.01983,    22.58070,    22.78377,
     A    23.2,        23.65221,    24.3,        25.00744,    25.46614,
     1    25.89239,    26.14316,    26.6,        27.1,        27.6,
     2    28.09263,    28.65871,    29.3,        29.95849,    30.26260,
     3    31.3,        32.3,        33.3,        34.3,        35.27931,
     4    36.14100,    37.,         38.01600,    38.96642,    40.,
     5    41.,         41.87992,    42.5,        43.5,        44.73260,
     6    45.5,        46.5,        47.5,        48.50178,    49.5,
     7    50.42590,    50.87630,    52.,         54.,         56.,
     8    57.40614,    59.5,        61.5,        63.5,        65.53786,
     9    67.,         69.,         71.,         72.24011,    74./
      DATA BIGB/
     1    76.,         78.,         80.,         82.,         84.,
     2    86.,         88.,         90.,         91.17535,    94.,
     3    98.,         102.,       106.,        110.03056,   113.,
     4   116.,         120.,       123.92928,   128.,        132.,
     5   136.,         140.,       144.43391,   148.,        151.43485,
     6   157.,         162.15072,  167.40282,   171.,        175.,
     7   180.,         184.,       188.,        193.,        197.46990,
     8   202.,         207.13210,  210.,        215.,        220.,
     9   225.,         230.,       235.,        240.,        245.,
     A   251.12621,    255.,       260.,        265.,        270.,
     1   275.,         280.,       285.,        290.,        300.,
     2   310.,         320.,       330.,        340.,        350.,
     3   360.,         364.70183,  370.,        380.,        390.,
     4   400.,   410., 420., 430., 450., 460.,  470., 480.,  490., 500.,
     5   510.,   520., 530., 540., 550., 560.,  570., 580.,  590., 600.,
     6   610.,   620., 630., 640., 650., 660.,  670., 680.,  690., 700.,
     7   710.,   720., 730., 740., 750., 760.,  770., 780.,  790., 800.,
     8   810.,820.58271,830.,840., 850., 860.,  870., 880.,  890., 900.,
     9   910.,   920., 930., 940., 950., 960.,  970., 980.,  990.,1000./
      DATA BIGC/
     1 1025.,1050.,1075.,1100.,1125.,1150.,1175.,1200.,1225.,1250.,
     2 1275.,1300.,1325.,1350.,1375.,1400.,1425.,1458.81670,1475.,1500.,
     3 1525.,1550.,1575.,1600.,1640.,1680.,1720.,1760.,1800.,1840.,
     4 1880.,1920.,1960.,2000.,2050.,2100.,2150.,2200.,2250.,2279.40330,
     5 2300.,2350.,2400.,2450.,2500.,2550.,2600.,2650.,2700.,2750.,
     6 2800.,2850.,2900.,2950.,3000.,3050.,3100.,3150.,3200.,3282.34320,
     7 3400.,3500.,3600.,3700.,3800.,3900.,4000.,4100.,4200.,4300.,
     8 4400.,4500.,4600.,4700.,4800.,4900.,5000.,5100.,5200.,5300.,
     9 5400.,5500.,5600.,5700.,5800.,5900.,6000.,6100.,6200.,6300.,
     A 6400.,6600.,6800.,7000.,7200.,7400.,7600.,7800.,8000.,8200.,
     1 8400.,8600.,8800.,9000.,9200.,9400.,9600.,9800.,10000000.,
     2 884*0./
      DATA LITA/
     1     8.97666,     9.2,         9.5,         9.71730,     9.81590,
     2    10.10901,    10.3,        10.46451,    10.65000,    10.88545,
     3    11.2,        11.6,        11.95562,    12.3,        12.66565,
     4    12.74676,    12.93504,    13.16033,    13.31723,    13.46700,
     5    13.86253,    14.10462,    14.54782,    14.9,        15.3,
     6    15.74874,    16.00346,    16.4,        16.8,        17.25088,
     7    17.43258,    17.93660,    18.10114,    18.24438,    18.97796,
     8    19.22422,    19.55098,    20.11987,    20.23592,    20.8,
     9    21.3,        21.94783,    22.01983,    22.58070,    22.78377,
     A    23.2,        23.65221,    24.3,        25.00744,    25.46614,
     1    25.89239,    26.14316,    26.6,        27.1,        27.6,
     2    28.09263,    28.65871,    29.3,        29.95849,    30.26260,
     3    31.3,        32.3,        33.3,        34.3,        35.27931,
     4    36.14100,    37.,         38.01600,    38.96642,    40.,
     5    41.,         41.87992,    42.5,        43.5,        44.73260,
     6    45.5,        46.5,        47.5,        48.50178,    49.5,
     7    50.42590,    50.87630,    51.5,        52.5,        53.5,
     8    54.5,        55.5,        56.5,        57.40614,    58.5,
     9    59.5,        60.5,        61.5,        62.5,        63.5/
      DATA LITB/
     1  64.5, 65.53786, 66., 67., 68., 69., 70., 71., 72.24011, 73.,
     2  74., 75., 76., 77., 78., 79., 80., 81., 82., 83.,
     3  84., 85., 86., 87., 88., 89., 90., 91.17535, 92., 93.,
     4  94., 95., 96., 97., 98., 99., 100., 101., 102., 103.,
     5 104., 105., 106., 107., 108., 109., 110.03056, 111., 112., 113.,
     6 114., 115., 116., 117., 118., 119., 120., 121., 122., 123.,
     7 123.92928, 125., 126., 127., 128., 129., 130., 131., 132., 133.,
     8 134., 135., 136., 137., 138., 139., 140., 141., 142., 143.,
     9 144.,144.43391,145.,146.,147.,148.,149.,150.,151.,151.43485,
     A 152., 153., 154., 155., 156., 157., 158., 159., 160., 161.,
     1 162.15072,163.,164.,165.,166.,167.,167.40282,168.,169.,170.,
     2 171., 172., 173., 174., 175., 176., 177., 178., 179., 180.,
     3 181., 182., 183., 184., 185., 186., 187., 188., 189., 190.,
     4 191.,192.,193.,194.,195.,196.,197.46990,197.81149,199.,200.,
     5 201.,202.,203.,204.,205.,206.,207.13210,207.61400,208.,209.,
     6 210., 211., 212., 213., 214., 215., 216., 217., 218., 219.,
     7 220., 221., 222., 223., 224., 225., 226., 227., 228., 229.,
     8 230., 231., 232., 233., 234., 235., 236., 237., 238., 239.,
     9 240., 241., 242., 243., 244., 245., 246., 247., 248., 249./
      DATA LITC/
     1 250.,251.12621,251.51005,252.,253.,254.,255.,256.,257.,258.,
     2 259., 260., 261., 262., 263., 264., 265., 266., 267., 268.,
     3 269., 270., 271., 272., 273., 274., 275., 276., 277., 278.,
     4 279., 280., 281., 282., 283., 284., 285., 286., 287., 288.,
     5 289., 290., 292., 294., 296., 298., 300., 302., 304., 306.,
     6 308., 310., 312., 314., 316., 318., 320., 322., 324., 326.,
     7 328., 330., 332., 334., 336., 338., 340., 342., 344., 346.,
     8 348., 350., 352., 354., 356., 358., 360., 362., 364., 364.70183,
     9 366., 368., 370., 372., 374., 376., 378., 380., 382., 384.,
     A 386., 388., 390., 392., 394., 396., 398., 400., 402., 404.,
     1 406., 408., 410., 412., 414., 416., 418., 420., 422., 424.,
     2 426., 428., 430., 432., 434., 436., 438., 440., 442., 444.,
     3 446., 448., 450., 452., 454., 456., 458., 460., 462., 464.,
     4 466., 468., 470., 472., 474., 476., 478., 480., 482., 484.,
     5 486., 488., 490., 492., 494., 496., 498., 500., 502., 504.,
     6 506., 508., 510., 512., 514., 516., 518., 520., 522., 524.,
     7 526., 528., 530., 532., 534., 536., 538., 540., 542., 544.,
     8 546., 548., 550., 552., 554., 556., 558., 560., 562., 564.,
     9 566., 568., 570., 572., 574., 576., 578., 580., 582., 584./
      DATA LITD/
     1 586., 588., 590., 592., 594., 596., 598., 600., 602., 604.,
     2 606., 608., 610., 612., 614., 616., 618., 620., 622., 624.,
     3 626., 628., 630., 632., 634., 636., 638., 640., 642., 644.,
     4 646., 648., 650., 652., 654., 656., 658., 660., 662., 664.,
     5 666., 668., 670., 672., 674., 676., 678., 680., 682., 684.,
     6 686., 688., 690., 692., 694., 696., 698., 700., 702., 704.,
     7 706., 708., 710., 712., 714., 716., 718., 720., 722., 724.,
     8 726., 728., 730., 732., 734., 736., 738., 740., 742., 744.,
     9 746., 748., 750., 752., 754., 756., 758., 760., 762., 764.,
     A 766., 768., 770., 772., 774., 776., 778., 780., 782., 784.,
     1 786., 788., 790., 792., 794., 796., 798., 800., 802., 804.,
     2 806., 808., 810., 812., 814., 816., 818., 820.58271, 822., 824.,
     3 826., 828., 830., 832., 834., 836., 838., 840., 842., 844.,
     4 846., 848., 850., 852., 854., 856., 858., 860., 862., 864.,
     5 866., 868., 870., 872., 874., 876., 878., 880., 882., 884.,
     6 886., 888., 890., 892., 894., 896., 898., 900., 902., 904.,
     7 906., 908., 910., 912., 914., 916., 918., 920., 922., 924.,
     8 926., 928., 930., 932., 934., 936., 938., 940., 942., 944.,
     9 946., 948., 950., 952., 954., 956., 958., 960., 962., 964./
      DATA LITE/
     1 966., 968., 970., 972., 974., 976., 978., 980., 982., 984.,
     2 986., 988., 990., 992., 994., 996., 998.,1000.,1005.,1010.,
     3 1015.,1020.,1025.,1030.,1035.,1040.,1045.,1050.,1055.,1060.,
     4 1065.,1070.,1075.,1080.,1085.,1090.,1095.,1100.,1105.,1110.,
     5 1115.,1120.,1125.,1130.,1135.,1140.,1145.,1150.,1155.,1160.,
     6 1165.,1170.,1175.,1180.,1185.,1190.,1195.,1200.,1205.,1210.,
     7 1215.,1220.,1225.,1230.,1235.,1240.,1245.,1250.,1255.,1260.,
     8 1265.,1270.,1275.,1280.,1285.,1290.,1295.,1300.,1305.,1310.,
     9 1315.,1320.,1325.,1330.,1335.,1340.,1345.,1350.,1355.,1360.,
     A 1365.,1370.,1375.,1380.,1385.,1390.,1395.,1400.,1405.,1410.,
     1 1415.,1420.,1425.,1430.,1435.,1440.,1445.,1450.,1455.,1458.81670,
     2 1465.,1470.,1475.,1480.,1485.,1490.,1495.,1500.,1505.,1510.,
     3 1515.,1520.,1525.,1530.,1535.,1540.,1545.,1550.,1555.,1560.,
     4 1565.,1570.,1575.,1580.,1585.,1590.,1595.,1600.,1610.,1620.,
     5 1630.,1640.,1650.,1660.,1670.,1680.,1690.,1700.,1710.,1720.,
     6 1730.,1740.,1750.,1760.,1770.,1780.,1790.,1800.,1810.,1820.,
     7 1830.,1840.,1850.,1860.,1870.,1880.,1890.,1900.,1910.,1920.,
     8 1930.,1940.,1950.,1960.,1970.,1980.,1990.,2000.,2010.,2020.,
     9 2030.,2040.,2050.,2060.,2070.,2080.,2090.,2100.,2110.,2120./
      DATA LITF/
     1 2130.,2140.,2150.,2160.,2170.,2180.,2190.,2200.,2210.,2220.,
     2 2230.,2240.,2250.,2260.,2270.,2279.40330,2290.,2300.,2310.,2320.,
     3 2330.,2340.,2350.,2360.,2370.,2380.,2390.,2400.,2410.,2420.,
     4 2430.,2440.,2450.,2460.,2470.,2480.,2490.,2500.,2510.,2520.,
     5 2530.,2540.,2550.,2560.,2570.,2580.,2590.,2600.,2610.,2620.,
     6 2630.,2640.,2650.,2660.,2670.,2680.,2690.,2700.,2710.,2720.,
     7 2730.,2740.,2750.,2760.,2770.,2780.,2790.,2800.,2810.,2820.,
     8 2830.,2840.,2850.,2860.,2870.,2880.,2890.,2900.,2910.,2920.,
     9 2930.,2940.,2950.,2960.,2970.,2980.,2990.,3000.,3010.,3020.,
     A 3030.,3040.,3050.,3060.,3070.,3080.,3090.,3100.,3110.,3120.,
     1 3130.,3140.,3150.,3160.,3170.,3180.,3190.,3200.,3220.,3240.,
     2 3260.,3282.34820,3300.,3320.,3340.,3360.,3380.,3400.,3420.,3440.,
     3 3460.,3480.,3500.,3520.,3540.,3560.,3580.,3600.,3620.,3640.,
     4 3660.,3680.,3700.,3720.,3740.,3760.,3780.,3800.,3820.,3840.,
     5 3860.,3880.,3900.,3920.,3940.,3960.,3980.,4000.,4020.,4040.,
     6 4060.,4080.,4100.,4120.,4140.,4160.,4180.,4200.,4220.,4240.,
     7 4260.,4280.,4300.,4320.,4340.,4360.,4380.,4400.,4420.,4440.,
     8 4460.,4480.,4500.,4520.,4540.,4560.,4580.,4600.,4620.,4640.,
     9 4660.,4680.,4700.,4720.,4740.,4760.,4780.,4800.,4820.,4840./
      DATA LITG/
     1 4860.,4880.,4900.,4920.,4940.,4960.,4980.,5000.,5020.,5040.,
     2 5060.,5080.,5100.,5120.,5140.,5160.,5180.,5200.,5220.,5240.,
     3 5260.,5280.,5300.,5320.,5340.,5360.,5380.,5400.,5420.,5440.,
     4 5460.,5480.,5500.,5520.,5540.,5560.,5580.,5600.,5620.,5640.,
     5 5660.,5680.,5700.,5720.,5740.,5760.,5780.,5800.,5820.,5840.,
     6 5860.,5880.,5900.,5920.,5940.,5960.,5980.,6000.,6020.,6040.,
     7 6060.,6080.,6100.,6120.,6140.,6160.,6180.,6200.,6220.,6240.,
     8 6260.,6280.,6300.,6320.,6340.,6360.,6380.,6400.,6440.,6480.,
     9 6520.,6560.,6600.,6640.,6680.,6720.,6760.,6800.,6840.,6880.,
     A 6920.,6960.,7000.,7040.,7080.,7120.,7160.,7200.,7240.,7280.,
     1 7320.,7360.,7400.,7440.,7480.,7520.,7560.,7600.,7640.,7680.,
     2 7720.,7760.,7800.,7840.,7880.,7920.,7960.,8000.,8040.,8080.,
     3 8120.,8160.,8200.,8240.,8280.,8320.,8360.,8400.,8440.,8480.,
     4 8520.,8560.,8600.,8640.,8680.,8720.,8760.,8800.,8840.,8880.,
     5 8920.,8960.,9000.,9040.,9080.,9120.,9160.,9200.,9240.,9280.,
     6 9320.,9360.,9400.,9440.,9480.,9520.,9560.,9600.,9640.,9680.,
     7 9720.,9760.,9800.,9840.,9880.,9920.,9960.,10000000./
      RETURN
      END
      SUBROUTINE LINSOP(J,NSTEPS,STEPWT)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /OPS/D1(kw,15),SIGLIN(kw),D2(kw,9)
C     DUMMY FOR LINE ABSORPTION DISTRIBUTION FUNCTIONS    S=J
      RETURN
      END
      SUBROUTINE XLINOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /OPS/D1(kw,16),AXLINE(kw),D2(kw,6),SXLINE(kw),D3(kw)
C     DUMMY LINE OPACITY ROUTINE
      RETURN
      END
      SUBROUTINE XLISOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /OPS/D1(kw,17),SIGXL(kw),D2(kw,7)
C     DUMMY LINE SCATTERING ROUTINE
      RETURN
      END
      SUBROUTINE XCONOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /OPS/D1(kw,18),AXCONT(kw),D2(kw,5),SXCONT(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
      DO 25 J=1,NRHOX
      AXCONT(J)=ROSSTAB(T(J),P(J),VTURB(J))
   25 SXCONT(J)=5.667E-5/12.5664*T(J)**4*4.
      RETURN
      END
      SUBROUTINE XSOP
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /OPS/D1(kw,19),SIGX(kw),D2(kw,5)
C     DUMMY SCATTERING ROUTINE
      RETURN
      END
      SUBROUTINE JOSH(IFSCAT,IFSURF)
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
C     IFSCAT=1  SOLVE INTEGRAL EQUATION FOR SOURCE FUNCTION
C     IFSCAT=0  SET SNU=SBAR
C     IFSURF=0  CALCULATE J AND H
C     IFSURF=1  CALCULATE SURFACE FLUX
C     IFSURF=2  CALCULATE SURFACE SPECIFIC INTENSITY
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /MATX/COEFJ(51,51),COEFH(51,51),XTAU(51),NXTAU
      REAL*4 COEFJ,COEFH,XTAU
      COMMON /MUS/ANGLE(20),SURFI(20),NMU
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),
     1              SIGMAL(kw)
      COMMON /PRD/PRDDOP,PRDPOW,ITPRD,NITPRD,SIGPRD(kw),NUPRD,LINPRD
      COMMON /PZERO/PZERO,PCON,PRAD0,PTURB0,KNU(kw),PRADK(kw),RADEN(kw)
      REAL*8 KNU
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      REAL*4 XS(51),XSBAR(51),XALPHA(51),DIAG(51),XH(51),XJS(51)
      REAL*4 CK(51),CH(51),DELXS,ERRORX,XJ,XBETA(51),XK
      REAL*8 XSBAR8(51),XALPHA8(51),XS8(51),XH8(51),XJS8(51),XTAU8(51)
      REAL*8 XBETA8(51)
      REAL*8 BETA(kw)
      REAL*8 A(kw),B(kw),C(kw),SNUBAR(kw),CTWO(kw),B2CT(kw),B2CT1(kw)
      REAL*8 EXTAU(51,20),NEW
      DATA CH/
     1 7.15528131E-07, 1.49142693E-06, 1.52106577E-06, 2.98150826E-06,
     2 5.33941056E-06, 9.13329677E-06, 1.61715943E-05, 2.97035986E-05,
     3 5.33166603E-05, 9.11154202E-05, 1.61084638E-04, 2.95118050E-04,
     4 5.27450291E-04, 8.67939554E-04, 1.61498412E-03, 2.50720908E-03,
     5 3.20994272E-03, 5.61912498E-03, 8.60872678E-03, 1.04706492E-02,
     6 1.33110350E-02, 1.62635669E-02, 1.90288834E-02, 2.18877215E-02,
     7 2.36015432E-02, 2.10819542E-02, 1.80345085E-02, 1.64786074E-02,
     8 1.49382707E-02, 1.19676525E-02, 9.90213640E-03, 8.17766134E-03,
     8 6.11252524E-03, 4.84035723E-03, 3.06078210E-03, 2.40512565E-03,
     9 2.01712688E-03, 1.33288081E-03, 7.83530239E-04, 4.31428343E-04,
     T 1.76504589E-04, 4.75738016E-05, 1.65963702E-05, 5.41117970E-06,
     1 2.08043571E-06, 7.11612643E-07, 8.08788982E-08, 1.95130507E-08,
     3 4.33638281E-09, 8.87765583E-10, 3.90236420E-11/
      DATA CK/
     1 3.57771910E-07, 7.45730404E-07, 7.60575176E-07, 1.49091113E-06,
     2 2.67016185E-06, 4.56793896E-06, 8.08956065E-06, 1.48632944E-05,
     3 2.66928291E-05, 4.56529851E-05, 8.08134864E-05, 1.48363324E-04,
     4 2.66052346E-04, 4.39771306E-04, 8.25088180E-04, 1.29440730E-03,
     5 1.67680858E-03, 2.98973685E-03, 4.68314718E-03, 5.84855257E-03,
     6 7.64854718E-03, 9.63155832E-03, 1.16419578E-02, 1.38551742E-02,
     7 1.54840983E-02, 1.42877987E-02, 1.25930300E-02, 1.17983138E-02,
     8 1.09717194E-02, 8.98320694E-03, 7.59950886E-03, 6.38808031E-03,
     9 4.86854184E-03, 3.91568616E-03, 2.51398841E-03, 2.00142385E-03,
     T 1.70069211E-03, 1.14058319E-03, 6.80292083E-04, 3.80097074E-04,
     1 1.57705377E-04, 4.31706540E-05, 1.51795348E-05, 4.98576401E-06,
     2 1.92979223E-06, 6.63957223E-07, 7.65236692E-08, 1.84933668E-08,
     3 4.12596224E-09, 8.47334369E-10, 3.81791959E-11/
      DATA XTAU8/0.,.0000032,.0000056,.00001,.000018,.000032,.000056,
     1.0001,.00018,.00032,.00056,.001,.0018,.0032,.0056,.01,.016,.025,
     2.042,.065,.096,.139,.196,.273,.375,.5,.63,.78,.95,1.15,1.35,1.6,
     3 1.85,2.15,2.45,2.75,3.15,3.65,4.25,5.0,6.,7.,8.,9.,10.,11.5,
     4 13.,14.5,16.,18.,20./
      DATA EXTAU/1020*0./
      DO 10 J=1,NRHOX
      ABTOT(J)=ACONT(J)+ALINE(J)+SIGMAC(J)+SIGMAL(J)
      ALPHA(J)=(SIGMAC(J)+SIGMAL(J))/ABTOT(J)
C     ALPHA(J)=(SIGMAC(J)+SIGMAL(J)+SIGPRD(J))/ABTOT(J)
C     BETA(J)=(ACONT(J)+ALINE(J))/ABTOT(J)
   10 SNUBAR(J)=(ACONT(J)*SCONT(J)+ALINE(J)*SLINE(J))/
     1(ACONT(J)+ALINE(J))
      CALL INTEG(RHOX,ABTOT,TAUNU,NRHOX,ABTOT(1)*RHOX(1))
      MAXJ=0
      IF(IFSCAT.EQ.1)GO TO 30
C
      DO 20 J=1,NRHOX
   20 SNU(J)=SNUBAR(J)
      IF(IFSURF.EQ.2)GO TO 70
      MAXJ=MAP1(TAUNU,SNU,NRHOX,XTAU8,XS8,NXTAU)
      DO 22 L=1,NXTAU
   22 XS(L)=XS8(L)
      IF(IFSURF.EQ.1)GO TO 60
      DO 21 J=1,NRHOX
   21 ALPHA(J)=0.
C
   30 IF(TAUNU(1).GT.XTAU8(NXTAU))MAXJ=1
      IF(MAXJ.EQ.1)GO TO 401
      MAXJ=MAP1(TAUNU,SNUBAR,NRHOX,XTAU8,XSBAR8,NXTAU)
      MAXJ=MAP1(TAUNU,ALPHA,NRHOX,XTAU8,XALPHA8,NXTAU)
C     MAXJ=MAP1(TAUNU,BETA,NRHOX,XTAU8,XBETA8,NXTAU)
      DO 31 L=1,NXTAU
C     IN CASE OF BAD INTERPOLATION
      XALPHA(L)=MAX(XALPHA8(L),0.D0)
      XSBAR(L)=MAX(XSBAR8(L),1.D-38)
C     XBETA(L)=MAX(XBETA8(L),0.D0)
      IF(XTAU8(L).LT.TAUNU(1))THEN
      XSBAR(L)=MAX(SNUBAR(1),1.D-38)
      XALPHA(L)=MAX(ALPHA(1),0.D0)
C     XBETA(L)=MAX(BETA(1),0.D0)
      ENDIF
      XS(L)=XSBAR(L)
      DIAG(L)=1.-XALPHA(L)*COEFJ(L,L)
C  31 XSBAR(L)=XBETA(L)*XSBAR(L)
   31 XSBAR(L)=(1.-XALPHA(L))*XSBAR(L)
C     THE LIMIT ON DO 34, THE MAXIMUM NUMBER OF ITERATIONS, IS ARBITRARY
      DO 34 L=1,NXTAU
      IFERR=0
      K=NXTAU+1
      DO 33 KK=1,NXTAU
      K=K-1
      DELXS=0.
      DO 32 M=1,NXTAU
   32 DELXS=DELXS+COEFJ(K,M)*XS(M)
      DELXS=(DELXS*XALPHA(K)+XSBAR(K)-XS(K))/DIAG(K)
      ERRORX=ABS(DELXS/XS(K))
      IF(ERRORX.GT..00001)IFERR=1
   33 XS(K)=MAX(XS(K)+DELXS,1.E-38)
   39 IF(IFERR.EQ.0)GO TO 35
   34 CONTINUE
C
   35 IF(IFSURF.EQ.1)GO TO 60
      DO 305 M=1,NXTAU
  305 XS8(M)=XS(M)
      IF(IFSURF.EQ.2)GO TO 670
      MDUMMY=MAP1(XTAU8,XS8,NXTAU,TAUNU,SNU,MAXJ)
      IF(MAXJ.EQ.NRHOX)GO TO 46
  401 MAXJ1=MAXJ+1
      IF(MAXJ.EQ.1)MAXJ1=1
      DO 40 J=MAXJ1,NRHOX
   40 SNU(J)=SNUBAR(J)
      M=MAX0(MAXJ-1,1)
      NM1=NRHOX-M+1
      NMJ=NRHOX-MAXJ+1
C     THE LIMIT ON DO 45 IS ARBITRARY
      DO 45 L=1,NXTAU
      ERROR=0.
      CALL DERIV(TAUNU(M),SNU(M),HNU(M),NM1)
      DO 41 J=M,NRHOX
   41 HNU(J)=HNU(J)/3.
      CALL DERIV(TAUNU(MAXJ),HNU(MAXJ),JMINS(MAXJ),NMJ)
      DO 43 J=MAXJ1,NRHOX
      JNU(J)=JMINS(J)+SNU(J)
C     SNEW=BETA(J)*SNUBAR(J)+ALPHA(J)*JNU(J)
      SNEW=(1.-ALPHA(J))*SNUBAR(J)+ALPHA(J)*JNU(J)
      if(snew.eq.0)go to 46
      ERROR=ABS(SNEW-SNU(J))/SNEW+ERROR
   43 SNU(J)=SNEW
      IF(ERROR.LT..00001)GO TO 46
   45 CONTINUE
   46 IF(IFSURF.EQ.2)GO TO 70
      IF(MAXJ.EQ.1)THEN
      KNU(1)=JNU(1)/3.
      RETURN
      ENDIF
C
   50 DO 51 L=1,NXTAU
      XJS(L)=-XS(L)
      DO 501 M=1,NXTAU
  501 XJS(L)=XJS(L)+COEFJ(L,M)*XS(M)
      XJS8(L)=XJS(L)
      XH(L)=0.
      DO 502 M=1,NXTAU
  502 XH(L)=XH(L)+COEFH(L,M)*XS(M)
   51 XH8(L)=XH(L)
      MDUMMY=MAP1(XTAU8,XJS8,NXTAU,TAUNU,JMINS,MAXJ)
      MDUMMY=MAP1(XTAU8,XH8,NXTAU,TAUNU,HNU,MAXJ)
      XK=0.
      DO 52 M=1,NXTAU
   52 XK=XK+CK(M)*XS(M)
      KNU(1)=XK
      DO 53 J=1,MAXJ
   53 JNU(J)=JMINS(J)+SNU(J)
      RETURN
C
   60 XH(1)=0.
      DO 61 M=1,NXTAU
   61 XH(1)=XH(1)+CH(M)*XS(M)
      HNU(1)=XH(1)
      RETURN
C
C     ASSUMES REAL*8 AND LARGE EXPONENT RANGE
  670 CALL PARCOE(XS8,XTAU8,A,B,C,NXTAU)
      N1=NXTAU-1
      DO 671 J=1,NXTAU
      CTWO(J)=C(J)*2.
  671 B2CT(J)=B(J)+CTWO(J)*XTAU8(J)
      DO 672 J=1,N1
  672 B2CT1(J)=B(J)+CTWO(J)*XTAU8(J+1)
      IF(EXTAU(1,1).EQ.0.)THEN
      DO 673 MU=1,NMU
      DO 673 J=1,NXTAU
      TANGLE=XTAU8(J)/ANGLE(MU)
      IF(TANGLE.LT.300.)EXTAU(J,MU)=EXP(-TANGLE)
  673 CONTINUE
      ENDIF
      DO 675 MU=1,NMU
      SURFI(MU)=0.
      DO 674 J=1,N1
      IF(EXTAU(J,MU).EQ.0.)GO TO 675
  674 SURFI(MU)=SURFI(MU)+
     1EXTAU(J,MU)*(XS8(J)+(B2CT(J)+CTWO(J)*ANGLE(MU))*ANGLE(MU))-
     2EXTAU(J+1,MU)*(XS8(J+1)+(B2CT1(J)+CTWO(J)*ANGLE(MU))*ANGLE(MU))
      SURFI(MU)=SURFI(MU)+EXTAU(NXTAU,MU)*(XS8(NXTAU)+(B2CT(NXTAU)+
     1CTWO(NXTAU)*ANGLE(MU))*ANGLE(MU))
  675 CONTINUE
      RETURN
C
   70 CALL PARCOE(SNU,TAUNU,A,B,C,NRHOX)
      N1=NRHOX-1
      DO 71 J=1,NRHOX
      CTWO(J)=C(J)*2.
   71 B2CT(J)=B(J)+CTWO(J)*TAUNU(J)
      DO 710 J=1,N1
  710 B2CT1(J)=B(J)+CTWO(J)*TAUNU(J+1)
      DO 75 MU=1,NMU
      OLD=1.
      SUM=0.
      DO 73 J=1,N1
      TANGLE=TAUNU(J+1)/ANGLE(MU)
      NEW=EXP(-TANGLE)
      D=TANGLE-TAUNU(J)/ANGLE(MU)
      IF(D.LE..03)GO TO 72
      SUM=SUM+OLD*(SNU(J)+(B2CT(J)+CTWO(J)*ANGLE(MU))*ANGLE(MU))-
     1     NEW*(SNU(J+1)+(B2CT1(J)+CTWO(J)*ANGLE(MU))*ANGLE(MU))
C     REAL*4
C     IF(TANGLE.LT.50.)GO TO 73
C     REAL*8 G-FLOATING
      IF(TANGLE.LT.300.)GO TO 73
      SURFI(MU)=SUM
      GO TO 75
   72 DDDDD=1.
      IF(D.GT..001)DDDDD=((((D/9.+1.)*D/8.+1.)*D/7.+1.)*D/6.+1.)*D/5.+1.
      SUM=SUM+NEW*(SNU(J)+(SNU(J)+B2CT(J)*ANGLE(MU)+(SNU(J)+(B2CT(J)+
     1CTWO(J)*ANGLE(MU))*ANGLE(MU))*(DDDDD*D/4.+1.)*D/3.)*D/2.)*D
   73 OLD=NEW
      SURFI(MU)=SUM+OLD*(SNU(NRHOX)+(B2CT(NRHOX)+CTWO(NRHOX)*ANGLE(MU))*
     1ANGLE(MU))
   75 CONTINUE
      RETURN
      END
      SUBROUTINE BLOCKJ
      COMMON /MATX/CJ(2601),CH(2601),XTAU(51),NXTAU
      DIMENSION CJ   1(36),CJ   2(36),CJ   3(36),CJ   4(36),CJ   5(36)
      DIMENSION CJ   6(36),CJ   7(36),CJ   8(36),CJ   9(36),CJ  10(36)
      DIMENSION CJ  11(36),CJ  12(36),CJ  13(36),CJ  14(36),CJ  15(36)
      DIMENSION CJ  16(36),CJ  17(36),CJ  18(36),CJ  19(36),CJ  20(36)
      DIMENSION CJ  21(36),CJ  22(36),CJ  23(36),CJ  24(36),CJ  25(36)
      DIMENSION CJ  26(36),CJ  27(36),CJ  28(36),CJ  29(36),CJ  30(36)
      DIMENSION CJ  31(36),CJ  32(36),CJ  33(36),CJ  34(36),CJ  35(36)
      DIMENSION CJ  36(36),CJ  37(36),CJ  38(36),CJ  39(36),CJ  40(36)
      DIMENSION CJ  41(36),CJ  42(36),CJ  43(36),CJ  44(36),CJ  45(36)
      DIMENSION CJ  46(36),CJ  47(36),CJ  48(36),CJ  49(36),CJ  50(36)
      DIMENSION CJ  51(36),CJ  52(36),CJ  53(36),CJ  54(36),CJ  55(36)
      DIMENSION CJ  56(36),CJ  57(36),CJ  58(36),CJ  59(36),CJ  60(36)
      DIMENSION CJ  61(36),CJ  62(36),CJ  63(36),CJ  64(36),CJ  65(36)
      DIMENSION CJ  66(36),CJ  67(36),CJ  68(36),CJ  69(36),CJ  70(36)
      DIMENSION CJ  71(36),CJ  72(36),CJ  73( 9)
      EQUIVALENCE (CJ   1(1),CJ (   1)),(CJ   2(1),CJ (  37))
      EQUIVALENCE (CJ   3(1),CJ (  73)),(CJ   4(1),CJ ( 109))
      EQUIVALENCE (CJ   5(1),CJ ( 145)),(CJ   6(1),CJ ( 181))
      EQUIVALENCE (CJ   7(1),CJ ( 217)),(CJ   8(1),CJ ( 253))
      EQUIVALENCE (CJ   9(1),CJ ( 289)),(CJ  10(1),CJ ( 325))
      EQUIVALENCE (CJ  11(1),CJ ( 361)),(CJ  12(1),CJ ( 397))
      EQUIVALENCE (CJ  13(1),CJ ( 433)),(CJ  14(1),CJ ( 469))
      EQUIVALENCE (CJ  15(1),CJ ( 505)),(CJ  16(1),CJ ( 541))
      EQUIVALENCE (CJ  17(1),CJ ( 577)),(CJ  18(1),CJ ( 613))
      EQUIVALENCE (CJ  19(1),CJ ( 649)),(CJ  20(1),CJ ( 685))
      EQUIVALENCE (CJ  21(1),CJ ( 721)),(CJ  22(1),CJ ( 757))
      EQUIVALENCE (CJ  23(1),CJ ( 793)),(CJ  24(1),CJ ( 829))
      EQUIVALENCE (CJ  25(1),CJ ( 865)),(CJ  26(1),CJ ( 901))
      EQUIVALENCE (CJ  27(1),CJ ( 937)),(CJ  28(1),CJ ( 973))
      EQUIVALENCE (CJ  29(1),CJ (1009)),(CJ  30(1),CJ (1045))
      EQUIVALENCE (CJ  31(1),CJ (1081)),(CJ  32(1),CJ (1117))
      EQUIVALENCE (CJ  33(1),CJ (1153)),(CJ  34(1),CJ (1189))
      EQUIVALENCE (CJ  35(1),CJ (1225)),(CJ  36(1),CJ (1261))
      EQUIVALENCE (CJ  37(1),CJ (1297)),(CJ  38(1),CJ (1333))
      EQUIVALENCE (CJ  39(1),CJ (1369)),(CJ  40(1),CJ (1405))
      EQUIVALENCE (CJ  41(1),CJ (1441)),(CJ  42(1),CJ (1477))
      EQUIVALENCE (CJ  43(1),CJ (1513)),(CJ  44(1),CJ (1549))
      EQUIVALENCE (CJ  45(1),CJ (1585)),(CJ  46(1),CJ (1621))
      EQUIVALENCE (CJ  47(1),CJ (1657)),(CJ  48(1),CJ (1693))
      EQUIVALENCE (CJ  49(1),CJ (1729)),(CJ  50(1),CJ (1765))
      EQUIVALENCE (CJ  51(1),CJ (1801)),(CJ  52(1),CJ (1837))
      EQUIVALENCE (CJ  53(1),CJ (1873)),(CJ  54(1),CJ (1909))
      EQUIVALENCE (CJ  55(1),CJ (1945)),(CJ  56(1),CJ (1981))
      EQUIVALENCE (CJ  57(1),CJ (2017)),(CJ  58(1),CJ (2053))
      EQUIVALENCE (CJ  59(1),CJ (2089)),(CJ  60(1),CJ (2125))
      EQUIVALENCE (CJ  61(1),CJ (2161)),(CJ  62(1),CJ (2197))
      EQUIVALENCE (CJ  63(1),CJ (2233)),(CJ  64(1),CJ (2269))
      EQUIVALENCE (CJ  65(1),CJ (2305)),(CJ  66(1),CJ (2341))
      EQUIVALENCE (CJ  67(1),CJ (2377)),(CJ  68(1),CJ (2413))
      EQUIVALENCE (CJ  69(1),CJ (2449)),(CJ  70(1),CJ (2485))
      EQUIVALENCE (CJ  71(1),CJ (2521)),(CJ  72(1),CJ (2557))
      EQUIVALENCE (CJ  73(1),CJ (2593))
      DATA CJ   1/
     1 9.79744820E-06, 8.96296860E-06, 8.35934549E-06, 7.89335126E-06,
     2 7.44161783E-06, 7.01338932E-06, 6.60406268E-06, 6.18398056E-06,
     3 5.76053476E-06, 5.34734829E-06, 4.94621727E-06, 4.53113519E-06,
     4 4.11083148E-06, 3.69997631E-06, 3.30117385E-06, 2.88937415E-06,
     5 2.55730770E-06, 2.24433006E-06, 1.88506336E-06, 1.58859300E-06,
     6 1.33086897E-06, 1.09505641E-06, 8.86720269E-07, 6.98736456E-07,
     7 5.33933743E-07, 4.00542516E-07, 3.06250782E-07, 2.30467716E-07,
     8 1.70827079E-07, 1.22755304E-07, 8.97411915E-08, 6.17573521E-08,
     9 4.31436590E-08, 2.84810947E-08, 1.90445828E-08, 1.28647073E-08/
      DATA CJ   2/
     1 7.72163607E-09, 4.14498085E-09, 2.00041016E-09, 8.21655030E-10,
     2 2.57654521E-10, 8.26321572E-11, 2.69513765E-11, 8.90661828E-12,
     3 2.97449037E-12, 5.83155356E-13, 1.16051514E-13, 2.33699420E-14,
     4 4.75155459E-15, 5.75016867E-16, 7.03774182E-17, 1.84495605E-05,
     5 2.04340585E-05, 1.83893753E-05, 1.67455934E-05, 1.56681842E-05,
     6 1.47030431E-05, 1.38123877E-05, 1.29157909E-05, 1.20215185E-05,
     7 1.11539807E-05, 1.03144214E-05, 9.44721432E-06, 8.57000031E-06,
     8 7.71299640E-06, 6.88139393E-06, 6.02284144E-06, 5.33058911E-06,
     9 4.67816358E-06, 3.92926961E-06, 3.31128764E-06, 2.77407705E-06/
      DATA CJ   3/
     1 2.28254302E-06, 1.84828352E-06, 1.45644794E-06, 1.11293201E-06,
     2 8.34890799E-07, 6.38348903E-07, 4.80386613E-07, 3.56071674E-07,
     3 2.55870903E-07, 1.87056331E-07, 1.28726866E-07, 8.99285240E-08,
     4 5.93659104E-08, 3.96964700E-08, 2.68151550E-08, 1.60949529E-08,
     5 8.63978399E-09, 4.16964794E-09, 1.71265479E-09, 5.37054134E-10,
     6 1.72238158E-10, 5.61773464E-11, 1.85649208E-11, 6.20001617E-12,
     7 1.21552673E-12, 2.41897316E-13, 4.87122141E-14, 9.90412136E-15,
     8 1.19856284E-15, 1.46694406E-16, 1.73787847E-05, 1.87918674E-05,
     9 2.08999830E-05, 1.83387653E-05, 1.62807705E-05, 1.51671131E-05/
      DATA CJ   4/
     1 1.41811027E-05, 1.32240507E-05, 1.22888417E-05, 1.13916825E-05,
     2 1.05286937E-05, 9.64030881E-06, 8.74342375E-06, 7.86815095E-06,
     3 7.01932516E-06, 6.14328580E-06, 5.43706123E-06, 4.77153058E-06,
     4 4.00764123E-06, 3.37730951E-06, 2.82937491E-06, 2.32803523E-06,
     5 1.88511642E-06, 1.48546973E-06, 1.13510730E-06, 8.51525287E-07,
     6 6.51067057E-07, 4.89957364E-07, 3.63165556E-07, 2.60968439E-07,
     7 1.90782877E-07, 1.31291340E-07, 9.17200485E-08, 6.05485677E-08,
     8 4.04872778E-08, 2.73493468E-08, 1.64155829E-08, 8.81189759E-09,
     9 4.25271133E-09, 1.74677236E-09, 5.47752673E-10, 1.75669266E-10/
      DATA CJ   5/
     1 5.72964369E-11, 1.89347458E-11, 6.32352422E-12, 1.23974071E-12,
     2 2.46716040E-13, 4.96825863E-14, 1.01014163E-14, 1.22243878E-15,
     3 1.49616625E-16, 3.25551939E-05, 3.36923300E-05, 3.51339037E-05,
     4 3.88807453E-05, 3.39978572E-05, 3.01736404E-05, 2.80557516E-05,
     5 2.60587444E-05, 2.41623827E-05, 2.23709199E-05, 2.06616637E-05,
     6 1.89100581E-05, 1.71462550E-05, 1.54274129E-05, 1.37618090E-05,
     7 1.20435652E-05, 1.06587206E-05, 9.35383616E-06, 7.85622517E-06,
     8 6.62051755E-06, 5.54637186E-06, 4.56358554E-06, 3.69533249E-06,
     9 2.91191152E-06, 2.22510520E-06, 1.66920873E-06, 1.27625797E-06/
      DATA CJ   6/
     1 9.60441144E-07, 7.11896566E-07, 5.11564087E-07, 3.73982533E-07,
     2 2.57364048E-07, 1.79794324E-07, 1.18690371E-07, 7.93652009E-08,
     3 5.36115600E-08, 3.21786438E-08, 1.72735185E-08, 8.33637456E-09,
     4 3.42410898E-09, 1.07373157E-09, 3.44355456E-10, 1.12315261E-10,
     5 3.71168073E-11, 1.23956785E-11, 2.43019968E-12, 4.83624689E-13,
     6 9.73902009E-14, 1.98012828E-14, 2.39628331E-15, 2.93285700E-16,
     7 5.51439894E-05, 5.61737699E-05, 5.70971222E-05, 5.97158543E-05,
     8 6.64856520E-05, 5.78678247E-05, 5.11761113E-05, 4.71765037E-05,
     9 4.35390905E-05, 4.02099897E-05, 3.70855896E-05, 3.39125099E-05/
      DATA CJ   7/
     1 3.07335362E-05, 2.76442550E-05, 2.46552200E-05, 2.15743729E-05,
     2 1.90924626E-05, 1.67544242E-05, 1.40714918E-05, 1.18579707E-05,
     3 9.93395930E-06, 8.17364957E-06, 6.61851880E-06, 5.21535125E-06,
     4 3.98524025E-06, 2.98960335E-06, 2.28581302E-06, 1.72017429E-06,
     5 1.27502343E-06, 9.16222511E-07, 6.69810519E-07, 4.60944116E-07,
     6 3.22015062E-07, 2.12576632E-07, 1.42144487E-07, 9.60192338E-08,
     7 5.76324937E-08, 3.09371550E-08, 1.49305800E-08, 6.13263252E-09,
     8 1.92306956E-09, 6.16745755E-10, 2.01158282E-10, 6.64767407E-11,
     9 2.22008383E-11, 4.35252215E-12, 8.66178627E-13, 1.74427211E-13/
      DATA CJ   8/
     1 3.54643725E-14, 4.29177646E-15, 5.25278713E-16, 8.91694801E-05,
     2 9.01232630E-05, 9.09107328E-05, 9.25454757E-05, 9.72160435E-05,
     3 1.08952038E-04, 9.40609395E-05, 8.21386656E-05, 7.52804540E-05,
     4 6.92140241E-05, 6.36798786E-05, 5.81457739E-05, 5.26491551E-05,
     5 4.73328076E-05, 4.22021470E-05, 3.69215245E-05, 3.26707758E-05,
     6 2.86680627E-05, 2.40761116E-05, 2.02882014E-05, 1.69960157E-05,
     7 1.39841085E-05, 1.13233607E-05, 8.92267193E-06, 6.81810177E-06,
     8 5.11470759E-06, 3.91063057E-06, 2.94291447E-06, 2.18133635E-06,
     9 1.56749018E-06, 1.14592288E-06, 7.88590043E-07, 5.50907755E-07/
      DATA CJ   9/
     1 3.63678755E-07, 2.43182435E-07, 1.64270749E-07, 9.85982526E-08,
     2 5.29275745E-08, 2.55433660E-08, 1.04917571E-08, 3.29000168E-09,
     3 1.05513294E-09, 3.44142921E-10, 1.13728830E-10, 3.79813302E-11,
     4 7.44632040E-12, 1.48186329E-12, 2.98411029E-13, 6.06726381E-14,
     5 7.34239348E-15, 8.98649491E-16, 1.48734554E-04, 1.49668443E-04,
     6 1.50406412E-04, 1.51853966E-04, 1.54848007E-04, 1.63105701E-04,
     7 1.83690606E-04, 1.57030317E-04, 1.35729830E-04, 1.23968355E-04,
     8 1.13534508E-04, 1.03387927E-04, 9.34668387E-05, 8.39522065E-05,
     9 7.48117928E-05, 6.54283214E-05, 5.78852350E-05, 5.07874030E-05/
      DATA CJ  10/
     1 4.26485228E-05, 3.59366977E-05, 3.01041834E-05, 2.47687422E-05,
     2 2.00556632E-05, 1.58034172E-05, 1.20757841E-05, 9.05877784E-06,
     3 6.92617657E-06, 5.21222091E-06, 3.86337217E-06, 2.77618035E-06,
     4 2.02953927E-06, 1.39666621E-06, 9.75707553E-07, 6.44107267E-07,
     5 4.30697222E-07, 2.90937554E-07, 1.74625805E-07, 9.37391181E-08,
     6 4.52393852E-08, 1.85817455E-08, 5.82685384E-09, 1.86872322E-09,
     7 6.09503895E-10, 2.01422551E-10, 6.72678568E-11, 1.31880025E-11,
     8 2.62449257E-12, 5.28508532E-13, 1.07455822E-13, 1.30039311E-14,
     9 1.59157564E-15, 2.56079901E-04, 2.57031747E-04, 2.57766555E-04/
      DATA CJ  11/
     1 2.59163661E-04, 2.61888194E-04, 2.67327121E-04, 2.81742190E-04,
     2 3.19354058E-04, 2.70603482E-04, 2.32425980E-04, 2.11306977E-04,
     3 1.91402222E-04, 1.72512615E-04, 1.54685828E-04, 1.37706011E-04,
     4 1.20357383E-04, 1.06446541E-04, 9.33741396E-05, 7.83973100E-05,
     5 6.60530846E-05, 5.53292123E-05, 4.55210463E-05, 3.68579859E-05,
     6 2.90425875E-05, 2.21917680E-05, 1.66471758E-05, 1.27280184E-05,
     7 9.57827123E-06, 7.09951281E-06, 5.10161560E-06, 3.72954698E-06,
     8 2.56655106E-06, 1.79298202E-06, 1.18362336E-06, 7.91455799E-07,
     9 5.34630571E-07, 3.20894151E-07, 1.72255713E-07, 8.31321299E-08/
      DATA CJ  12/
     1 3.41458713E-08, 1.07074315E-08, 3.43396440E-09, 1.12002317E-09,
     2 3.70133495E-10, 1.23611166E-10, 2.42342125E-11, 4.82275355E-12,
     3 9.71184154E-13, 1.97460132E-13, 2.38959340E-14, 2.92466775E-15,
     4 4.28478665E-04, 4.29422059E-04, 4.30140918E-04, 4.31484994E-04,
     5 4.34020658E-04, 4.38774835E-04, 4.48007289E-04, 4.74192413E-04,
     6 5.41887598E-04, 4.55714167E-04, 3.88809223E-04, 3.48834385E-04,
     7 3.12498533E-04, 2.79274664E-04, 2.48145828E-04, 2.16625539E-04,
     8 1.91470492E-04, 1.67889720E-04, 1.40916781E-04, 1.18707073E-04,
     9 9.94231585E-05, 8.17917639E-05, 6.62222043E-05, 5.21781154E-05/
      DATA CJ  13/
     1 3.98685750E-05, 2.99067370E-05, 2.28655892E-05, 1.72069282E-05,
     2 1.27538260E-05, 9.16465428E-06, 6.69979937E-06, 4.61055441E-06,
     3 3.22090046E-06, 2.12624430E-06, 1.42175560E-06, 9.60397422E-07,
     4 5.76444952E-07, 3.09434371E-07, 1.49335410E-07, 6.13382136E-08,
     5 1.92343401E-08, 6.16860678E-09, 2.01195275E-09, 6.64888375E-10,
     6 2.22048435E-10, 4.35329925E-11, 8.66332015E-12, 1.74457896E-12,
     7 3.54705773E-13, 4.29252289E-14, 5.25369629E-15, 6.81346346E-04,
     8 6.82255817E-04, 6.82943987E-04, 6.84219429E-04, 6.86585612E-04,
     9 6.90881586E-04, 6.98754285E-04, 7.15098144E-04, 7.61797141E-04/
      DATA CJ  14/
     1 8.79148726E-04, 7.30251735E-04, 6.11067411E-04, 5.42551059E-04,
     2 4.82001904E-04, 4.26857355E-04, 3.71876578E-04, 3.28350939E-04,
     3 2.87718988E-04, 2.41367155E-04, 2.03264175E-04, 1.70210809E-04,
     4 1.40006824E-04, 1.13344596E-04, 8.93004808E-05, 6.82295010E-05,
     5 5.11791622E-05, 3.91286652E-05, 2.94446879E-05, 2.18241298E-05,
     6 1.56821832E-05, 1.14643071E-05, 7.88923736E-06, 5.51132513E-06,
     7 3.63822025E-06, 2.43275575E-06, 1.64332221E-06, 9.86342258E-07,
     8 5.29464043E-07, 2.55522410E-07, 1.04953205E-07, 3.29109410E-08,
     9 1.05547740E-08, 3.44253802E-09, 1.13765089E-09, 3.79933350E-10/
      DATA CJ  15/
     1 7.44864964E-11, 1.48232305E-11, 2.98503002E-12, 6.06912361E-13,
     2 7.34463078E-14, 8.98921998E-15, 1.11484772E-03, 1.11575700E-03,
     3 1.11644237E-03, 1.11770657E-03, 1.12003104E-03, 1.12418195E-03,
     4 1.13155813E-03, 1.14602725E-03, 1.17595605E-03, 1.25851233E-03,
     5 1.46433575E-03, 1.19777795E-03, 9.84898023E-04, 8.67486801E-04,
     6 7.63496933E-04, 6.62669548E-04, 5.84007289E-04, 5.11122829E-04,
     7 4.28377739E-04, 3.60559179E-04, 3.01823315E-04, 2.48203963E-04,
     8 2.00902454E-04, 1.58263961E-04, 1.20908862E-04, 9.06877167E-05,
     9 6.93314047E-05, 5.21706171E-05, 3.86672514E-05, 2.77844799E-05/
      DATA CJ  16/
     1 2.03112075E-05, 1.39770538E-05, 9.76407481E-06, 6.44553426E-06,
     2 4.30987268E-06, 2.91128982E-06, 1.74737828E-06, 9.37977549E-07,
     3 4.52670223E-07, 1.85928420E-07, 5.83025562E-08, 1.86979588E-08,
     4 6.09849176E-09, 2.01535459E-09, 6.73052396E-10, 1.31952557E-10,
     5 2.62592423E-11, 5.28794933E-12, 1.07513735E-12, 1.30108980E-13,
     6 1.59242422E-14, 1.87645118E-03, 1.87738833E-03, 1.87809318E-03,
     7 1.87938984E-03, 1.88176229E-03, 1.88596108E-03, 1.89330275E-03,
     8 1.90726205E-03, 1.93448596E-03, 1.98883781E-03, 2.13292357E-03,
     9 2.50895650E-03, 2.02160072E-03, 1.64022652E-03, 1.42967764E-03/
      DATA CJ  17/
     1 1.23180309E-03, 1.08166934E-03, 9.44527709E-04, 7.90233024E-04,
     2 6.64466714E-04, 5.55869126E-04, 4.56912546E-04, 3.69718850E-04,
     3 2.91182454E-04, 2.22414806E-04, 1.66800680E-04, 1.27509362E-04,
     4 9.59420089E-05, 7.11054588E-05, 5.10907704E-05, 3.73475053E-05,
     5 2.56997018E-05, 1.79528489E-05, 1.18509126E-05, 7.92410065E-06,
     6 5.35260374E-06, 3.21262703E-06, 1.72448625E-06, 8.32230538E-07,
     7 3.41823776E-07, 1.07186229E-07, 3.43749330E-08, 1.12115909E-08,
     8 3.70504943E-09, 1.23734148E-09, 2.42580742E-10, 4.82746345E-11,
     9 9.72126355E-12, 1.97650655E-12, 2.39188535E-13, 2.92745938E-14/
      DATA CJ  18/
     1 3.05596719E-03, 3.05690144E-03, 3.05760323E-03, 3.05889229E-03,
     2 3.06124422E-03, 3.06538575E-03, 3.07256282E-03, 3.08598245E-03,
     3 3.11130067E-03, 3.15877520E-03, 3.25098448E-03, 3.51262193E-03,
     4 4.18929515E-03, 3.32802567E-03, 2.66019874E-03, 2.26255826E-03,
     5 1.97241133E-03, 1.71470116E-03, 1.42979273E-03, 1.19998887E-03,
     6 1.00267078E-03, 8.23483583E-04, 6.65943148E-04, 5.24251321E-04,
     7 4.00308105E-04, 3.00140478E-04, 2.29403448E-04, 1.72588821E-04,
     8 1.27898063E-04, 9.18898504E-05, 6.71676646E-05, 4.62170248E-05,
     9 3.22840871E-05, 2.13103008E-05, 1.42486670E-05, 9.62450663E-06/
      DATA CJ  19/
     1 5.77646456E-06, 3.10063265E-06, 1.49631817E-06, 6.14572206E-07,
     2 1.92708225E-07, 6.18011032E-08, 2.01565561E-08, 6.66099210E-09,
     3 2.22449327E-09, 4.36107753E-10, 8.67867310E-11, 1.74765026E-11,
     4 3.55326822E-12, 4.29999393E-13, 5.26279611E-14, 4.58905399E-03,
     5 4.58994482E-03, 4.59061355E-03, 4.59184086E-03, 4.59407675E-03,
     6 4.59800330E-03, 4.60477562E-03, 4.61732873E-03, 4.64062203E-03,
     7 4.68292875E-03, 4.76051134E-03, 4.92176307E-03, 5.38442458E-03,
     8 6.54922376E-03, 5.03719066E-03, 3.84919968E-03, 3.34188460E-03,
     9 2.88688751E-03, 2.39518284E-03, 2.00456361E-03, 1.67194936E-03/
      DATA CJ  20/
     1 1.37143155E-03, 1.10808371E-03, 8.71743749E-04, 6.65317431E-04,
     2 4.98659080E-04, 3.81044905E-04, 2.86621113E-04, 2.12371138E-04,
     3 1.52561656E-04, 1.11506092E-04, 7.67190760E-05, 5.35872980E-05,
     4 3.53701589E-05, 2.36483834E-05, 1.59731092E-05, 9.58640571E-06,
     5 5.14549598E-06, 2.48305034E-06, 1.01981189E-06, 3.19766809E-07,
     6 1.02546081E-07, 3.34450069E-08, 1.10521721E-08, 3.69092105E-09,
     7 7.23588135E-10, 1.43994616E-10, 2.89963727E-11, 5.89541038E-12,
     8 7.13428630E-13, 8.73165412E-14, 7.63344239E-03, 7.63436095E-03,
     9 7.63505020E-03, 7.63631460E-03, 7.63861604E-03, 7.64265143E-03/
      DATA CJ  21/
     1 7.64959272E-03, 7.66239614E-03, 7.68593738E-03, 7.72797518E-03,
     2 7.80267307E-03, 7.94918588E-03, 8.25219168E-03, 9.08595967E-03,
     3 1.11718179E-02, 8.50948584E-03, 6.67067668E-03, 5.66624412E-03,
     4 4.63749691E-03, 3.85370081E-03, 3.20032500E-03, 2.61728999E-03,
     5 2.11034644E-03, 1.65770792E-03, 1.26373000E-03, 9.46397409E-04,
     6 7.22788157E-04, 5.43449520E-04, 4.02532513E-04, 2.89087221E-04,
     7 2.11247909E-04, 1.45315957E-04, 1.01486491E-04, 6.69768382E-05,
     8 4.47757942E-05, 3.02408867E-05, 1.81477045E-05, 9.73991532E-06,
     9 4.69979281E-06, 1.93010363E-06, 6.05148839E-07, 1.94054898E-07/
      DATA CJ  22/
     1 6.32876542E-08, 2.09132360E-08, 6.98388223E-09, 1.36911508E-09,
     2 2.72448318E-10, 5.48621737E-11, 1.11541473E-11, 1.34978709E-12,
     3 1.65198131E-13, 1.06716479E-02, 1.06724962E-02, 1.06731327E-02,
     4 1.06743000E-02, 1.06764237E-02, 1.06801444E-02, 1.06865355E-02,
     5 1.06982944E-02, 1.07198145E-02, 1.07579188E-02, 1.08245983E-02,
     6 1.09515714E-02, 1.11999257E-02, 1.16984658E-02, 1.30537716E-02,
     7 1.64947744E-02, 1.24602153E-02, 9.56746194E-03, 7.64827637E-03,
     8 6.27825452E-03, 5.17676322E-03, 4.21361197E-03, 3.38651398E-03,
     9 2.65388823E-03, 2.01962478E-03, 1.51059058E-03, 1.15272726E-03/
      DATA CJ  23/
     1 8.66154710E-04, 6.41233882E-04, 4.60319778E-04, 3.36269473E-04,
     2 2.31249862E-04, 1.61465725E-04, 1.06538851E-04, 7.12127109E-05,
     3 4.80898278E-05, 2.88550145E-05, 1.54845115E-05, 7.47082608E-06,
     4 3.06775966E-06, 9.61734204E-07, 3.08377280E-07, 1.00565701E-07,
     5 3.32300398E-08, 1.10965833E-08, 2.17526303E-09, 4.32852492E-10,
     6 8.71597423E-11, 1.77202052E-11, 2.14430323E-12, 2.62432019E-13,
     7 1.24208536E-02, 1.24215406E-02, 1.24220560E-02, 1.24230012E-02,
     8 1.24247202E-02, 1.24277306E-02, 1.24328975E-02, 1.24423905E-02,
     9 1.24597184E-02, 1.24902550E-02, 1.25432456E-02, 1.26425720E-02/
      DATA CJ  24/
     1 1.28308312E-02, 1.31867664E-02, 1.38836281E-02, 1.61371087E-02,
     2 2.09342998E-02, 1.50640284E-02, 1.04396460E-02, 8.52366488E-03,
     3 6.96923411E-03, 5.63914478E-03, 4.51383247E-03, 3.52682352E-03,
     4 2.67803436E-03, 1.99989867E-03, 1.52453504E-03, 1.14460280E-03,
     5 8.46833440E-04, 6.07587365E-04, 4.43675885E-04, 3.05000337E-04,
     6 2.12901324E-04, 1.40441165E-04, 9.38549059E-05, 6.33698772E-05,
     7 3.80168928E-05, 2.03976823E-05, 9.83979455E-06, 4.03995811E-06,
     8 1.26634031E-06, 4.06007089E-07, 1.32393704E-07, 4.37443103E-08,
     9 1.46069081E-08, 2.86322161E-09, 5.69721947E-10, 1.14715681E-10/
      DATA CJ  25/
     1 2.33218140E-11, 2.82205447E-12, 3.45369833E-13, 1.94810935E-02,
     2 1.94818503E-02, 1.94824179E-02, 1.94834588E-02, 1.94853517E-02,
     3 1.94886657E-02, 1.94943513E-02, 1.95047890E-02, 1.95238140E-02,
     4 1.95572554E-02, 1.96150267E-02, 1.97224258E-02, 1.99228219E-02,
     5 2.02906364E-02, 2.09790973E-02, 2.24766315E-02, 2.59060675E-02,
     6 3.37894606E-02, 2.36650522E-02, 1.67865205E-02, 1.34852146E-02,
     7 1.07554640E-02, 8.52894897E-03, 6.62031125E-03, 5.00327821E-03,
     8 3.72392321E-03, 2.83262704E-03, 2.12313739E-03, 1.56873156E-03,
     9 1.12430016E-03, 8.20332823E-04, 5.63506593E-04, 3.93125304E-04/
      DATA CJ  26/
     1 2.59191151E-04, 1.73143499E-04, 1.16866620E-04, 7.00863842E-05,
     2 3.75917115E-05, 1.81285895E-05, 7.44097441E-06, 2.33174953E-06,
     3 7.47439487E-07, 2.43692177E-07, 8.05085341E-08, 2.68803496E-08,
     4 5.26840946E-09, 1.04820661E-09, 2.11044554E-10, 4.29029307E-11,
     5 5.19111983E-12, 6.35267562E-13, 2.68144794E-02, 2.68152340E-02,
     6 2.68158000E-02, 2.68168377E-02, 2.68187248E-02, 2.68220282E-02,
     7 2.68276939E-02, 2.68380900E-02, 2.68570222E-02, 2.68902478E-02,
     8 2.69474868E-02, 2.70533594E-02, 2.72490323E-02, 2.76017887E-02,
     9 2.82397420E-02, 2.95368461E-02, 3.16415686E-02, 3.66967999E-02/
      DATA CJ  27/
     1 4.98810707E-02, 3.43114781E-02, 2.40016204E-02, 1.87161429E-02,
     2 1.45996143E-02, 1.12081149E-02, 8.40567489E-03, 6.22335553E-03,
     3 4.71782027E-03, 3.52695811E-03, 2.60069160E-03, 1.86076446E-03,
     4 1.35601978E-03, 9.30420718E-04, 6.48541490E-04, 4.27250986E-04,
     5 2.85234445E-04, 1.92429775E-04, 1.15342167E-04, 6.18339132E-05,
     6 2.98055973E-05, 1.22285626E-05, 3.83040581E-06, 1.22745361E-06,
     7 4.00099709E-07, 1.32156222E-07, 4.41179135E-08, 8.64532737E-09,
     8 1.71983935E-09, 3.46231251E-10, 7.03783355E-11, 8.51470572E-12,
     9 1.04191002E-12, 2.93105845E-02, 2.93111926E-02, 2.93116486E-02/
      DATA CJ  28/
     1 2.93124848E-02, 2.93140052E-02, 2.93166665E-02, 2.93212301E-02,
     2 2.93296012E-02, 2.93448369E-02, 2.93715472E-02, 2.94174786E-02,
     3 2.95021568E-02, 2.96577012E-02, 2.99349550E-02, 3.04259264E-02,
     4 3.13820917E-02, 3.28196439E-02, 3.52993354E-02, 4.37293513E-02,
     5 6.16813834E-02, 4.10710605E-02, 2.73272861E-02, 2.08412122E-02,
     6 1.57078159E-02, 1.16349995E-02, 8.54306269E-03, 6.44256291E-03,
     7 4.79727031E-03, 3.52654009E-03, 2.51682379E-03, 1.83075442E-03,
     8 1.25402197E-03, 8.72988704E-04, 5.74439671E-04, 3.83149531E-04,
     9 2.58298944E-04, 1.54704606E-04, 8.28739739E-05, 3.99203092E-05/
      DATA CJ  29/
     1 1.63679751E-05, 5.12384714E-06, 1.64119506E-06, 5.34777682E-07,
     2 1.76593238E-07, 5.89393441E-08, 1.15466876E-08, 2.29654360E-09,
     3 4.62254965E-10, 9.39497631E-11, 1.13648268E-11, 1.39050368E-12,
     4 3.38719415E-02, 3.38724916E-02, 3.38729041E-02, 3.38736604E-02,
     5 3.38750357E-02, 3.38774427E-02, 3.38815700E-02, 3.38891395E-02,
     6 3.39029120E-02, 3.39270440E-02, 3.39685030E-02, 3.40448073E-02,
     7 3.41845344E-02, 3.44321947E-02, 3.48663543E-02, 3.56957363E-02,
     8 3.69034406E-02, 3.89082216E-02, 4.34786937E-02, 5.48837934E-02,
     9 7.92311401E-02, 5.11201902E-02, 3.29130965E-02, 2.41709942E-02/
      DATA CJ  30/
     1 1.75449024E-02, 1.27168996E-02, 9.51480609E-03, 7.04353074E-03,
     2 5.15471899E-03, 3.66546818E-03, 2.65931636E-03, 1.81718603E-03,
     3 1.26276077E-03, 8.29549046E-04, 5.52603530E-04, 3.72158022E-04,
     4 2.22659715E-04, 1.19153630E-04, 5.73421433E-05, 2.34905250E-05,
     5 7.34723417E-06, 2.35189262E-06, 7.65991588E-07, 2.52849277E-07,
     6 8.43647141E-08, 1.65217439E-08, 3.28511655E-09, 6.61088474E-10,
     7 1.34336273E-10, 1.62470060E-11, 1.98752421E-12, 3.78705822E-02,
     8 3.78710789E-02, 3.78714514E-02, 3.78721343E-02, 3.78733761E-02,
     9 3.78755493E-02, 3.78792755E-02, 3.78861088E-02, 3.78985392E-02/
      DATA CJ  31/
     1 3.79203122E-02, 3.79576958E-02, 3.80264251E-02, 3.81520308E-02,
     2 3.83738644E-02, 3.87602803E-02, 3.94896661E-02, 4.05309718E-02,
     3 4.22050142E-02, 4.58079989E-02, 5.18680175E-02, 6.69949177E-02,
     4 9.99650283E-02, 6.22151021E-02, 3.79264661E-02, 2.68360813E-02,
     5 1.90636001E-02, 1.40947336E-02, 1.03444628E-02, 7.52188726E-03,
     6 5.32118372E-03, 3.84637814E-03, 2.61953759E-03, 1.81578530E-03,
     7 1.19014956E-03, 7.91436695E-04, 5.32265138E-04, 3.17985329E-04,
     8 1.69927045E-04, 8.16723406E-05, 3.34177509E-05, 1.04402136E-05,
     9 3.33917358E-06, 1.08684559E-06, 3.58580423E-07, 1.19593740E-07/
      DATA CJ  32/
     1 2.34095416E-08, 4.65290141E-09, 9.36054907E-10, 1.90163622E-10,
     2 2.29927543E-11, 2.81213504E-12, 4.07045732E-02, 4.07050138E-02,
     3 4.07053442E-02, 4.07059501E-02, 4.07070517E-02, 4.07089796E-02,
     4 4.07122849E-02, 4.07183460E-02, 4.07293704E-02, 4.07486759E-02,
     5 4.07818096E-02, 4.08426810E-02, 4.09537773E-02, 4.11495151E-02,
     6 4.14890357E-02, 4.21248963E-02, 4.30212543E-02, 4.44338295E-02,
     7 4.73542676E-02, 5.19486346E-02, 5.96595030E-02, 8.00440021E-02,
     8 1.23805652E-01, 7.36099127E-02, 4.22094370E-02, 2.93020252E-02,
     9 2.12632345E-02, 1.53999160E-02, 1.10899988E-02, 7.78581980E-03/
      DATA CJ  33/
     1 5.59792888E-03, 3.79408528E-03, 2.62063726E-03, 1.71219569E-03,
     2 1.13580719E-03, 7.62385553E-04, 4.54536615E-04, 2.42425104E-04,
     3 1.16311835E-04, 4.75131868E-05, 1.48204245E-05, 4.73468735E-06,
     4 1.53971465E-06, 5.07644565E-07, 1.69215319E-07, 3.31006873E-08,
     5 6.57573986E-09, 1.32234067E-09, 2.68548744E-10, 3.24584914E-11,
     6 3.96867843E-12, 4.32342833E-02, 4.32346787E-02, 4.32349753E-02,
     7 4.32355189E-02, 4.32365074E-02, 4.32382374E-02, 4.32412033E-02,
     8 4.32466417E-02, 4.32565325E-02, 4.32738504E-02, 4.33035646E-02,
     9 4.33581273E-02, 4.34576211E-02, 4.36326376E-02, 4.39353696E-02/
      DATA CJ  34/
     1 4.44994366E-02, 4.52881489E-02, 4.65156962E-02, 4.89934064E-02,
     2 5.27270383E-02, 5.86246340E-02, 6.89792766E-02, 9.55178919E-02,
     3 1.53805931E-01, 8.72665990E-02, 4.81287151E-02, 3.42518696E-02,
     4 2.42867642E-02, 1.72256496E-02, 1.19534085E-02, 8.52602534E-03,
     5 5.73789848E-03, 3.94296355E-03, 2.56435298E-03, 1.69519482E-03,
     6 1.13475697E-03, 6.74616532E-04, 3.58827677E-04, 1.71739540E-04,
     7 6.99968308E-05, 2.17862780E-05, 6.94913635E-06, 2.25715388E-06,
     8 7.43486392E-07, 2.47641764E-07, 4.83984298E-08, 9.60806708E-09,
     9 1.93104607E-09, 3.91989428E-10, 4.73549560E-11, 5.78776151E-12/
      DATA CJ  35/
     1 4.32087632E-02, 4.32091029E-02, 4.32093576E-02, 4.32098246E-02,
     2 4.32106738E-02, 4.32121598E-02, 4.32147075E-02, 4.32193789E-02,
     3 4.32278743E-02, 4.32427472E-02, 4.32682614E-02, 4.33150958E-02,
     4 4.34004438E-02, 4.35504092E-02, 4.38093044E-02, 4.42899816E-02,
     5 4.49583505E-02, 4.59898809E-02, 4.80394281E-02, 5.10451508E-02,
     6 5.55906118E-02, 6.30744680E-02, 7.57836932E-02, 1.10123496E-01,
     7 1.85653774E-01, 1.03646665E-01, 5.94714146E-02, 4.05637117E-02,
     8 2.79429568E-02, 1.89929637E-02, 1.33657202E-02, 8.89196126E-03,
     9 6.06091784E-03, 3.91386910E-03, 2.57362900E-03, 1.71569689E-03/
      DATA CJ  36/
     1 1.01565207E-03, 5.38061069E-04, 2.56602824E-04, 1.04242060E-04,
     2 3.23436807E-05, 1.02933846E-05, 3.33770653E-06, 1.09794325E-06,
     3 3.65311742E-07, 7.13048076E-08, 1.41415068E-08, 2.83995095E-09,
     4 5.76120933E-10, 6.95510376E-11, 8.49584676E-12, 3.61991027E-02,
     5 3.61993546E-02, 3.61995435E-02, 3.61998898E-02, 3.62005195E-02,
     6 3.62016216E-02, 3.62035109E-02, 3.62069750E-02, 3.62132746E-02,
     7 3.62243025E-02, 3.62432184E-02, 3.62779330E-02, 3.63411687E-02,
     8 3.64521995E-02, 3.66436361E-02, 3.69982490E-02, 3.74895600E-02,
     9 3.82437785E-02, 3.97276968E-02, 4.18684883E-02, 4.50254746E-02/
      DATA CJ  37/
     1 5.00133841E-02, 5.80103385E-02, 7.21340556E-02, 1.13025502E-01,
     2 1.99418938E-01, 1.09586908E-01, 5.94793914E-02, 3.95984015E-02,
     3 2.61425920E-02, 1.80656790E-02, 1.18401639E-02, 7.98800065E-03,
     4 5.11311185E-03, 3.34058255E-03, 2.21597730E-03, 1.30517128E-03,
     5 6.88176910E-04, 3.26823531E-04, 1.32263645E-04, 4.08905223E-05,
     6 1.29798657E-05, 4.20064215E-06, 1.37970996E-06, 4.58502450E-07,
     7 8.93659154E-08, 1.77037640E-08, 3.55218722E-09, 7.20086542E-10,
     8 8.68632550E-11, 1.06039398E-11, 2.93072216E-02, 2.93074062E-02,
     9 2.93075447E-02, 2.93077986E-02, 2.93082602E-02, 2.93090679E-02/
      DATA CJ  38/
     1 2.93104528E-02, 2.93129919E-02, 2.93176092E-02, 2.93256917E-02,
     2 2.93395542E-02, 2.93649910E-02, 2.94113137E-02, 2.94926082E-02,
     3 2.96326546E-02, 2.98916735E-02, 3.02496816E-02, 3.07973230E-02,
     4 3.18679302E-02, 3.33963795E-02, 3.56156824E-02, 3.90380654E-02,
     5 4.43148129E-02, 5.31920594E-02, 6.91640591E-02, 1.16575775E-01,
     6 2.09934433E-01, 1.12013093E-01, 5.82642687E-02, 3.70523334E-02,
     7 2.49076025E-02, 1.59750451E-02, 1.06254412E-02, 6.72152469E-03,
     8 4.35445309E-03, 2.87016476E-03, 1.67963537E-03, 8.80394242E-04,
     9 4.15953076E-04, 1.67551113E-04, 5.15743081E-05, 1.63204537E-05/
      DATA CJ  39/
     1 5.26947577E-06, 1.72764130E-06, 5.73294937E-07, 1.11549698E-07,
     2 2.20694579E-08, 4.42352504E-09, 8.95959064E-10, 1.07979712E-10,
     3 1.31720886E-11, 2.56383409E-02, 2.56384908E-02, 2.56386032E-02,
     4 2.56388093E-02, 2.56391840E-02, 2.56398398E-02, 2.56409641E-02,
     5 2.56430254E-02, 2.56467737E-02, 2.56533350E-02, 2.56645878E-02,
     6 2.56852340E-02, 2.57228259E-02, 2.57887774E-02, 2.59023307E-02,
     7 2.61121441E-02, 2.64017019E-02, 2.68436483E-02, 2.77041846E-02,
     8 2.89248481E-02, 3.06808077E-02, 3.33507344E-02, 3.73782881E-02,
     9 4.39205671E-02, 5.52858594E-02, 7.56826005E-02, 1.25832006E-01/
      DATA CJ  40/
     1 2.30642137E-01, 1.18332498E-01, 5.71643469E-02, 3.76047112E-02,
     2 2.34557191E-02, 1.53226318E-02, 9.55330997E-03, 6.12663729E-03,
     3 4.00811123E-03, 2.32818065E-03, 1.21213576E-03, 5.69369511E-04,
     4 2.28164697E-04, 6.98955884E-05, 2.20433677E-05, 7.09934098E-06,
     5 2.32303675E-06, 7.69668743E-07, 1.49486186E-07, 2.95334964E-08,
     6 5.91300771E-09, 1.19656261E-09, 1.44067978E-10, 1.75607129E-11,
     7 2.22761665E-02, 2.22762878E-02, 2.22763789E-02, 2.22765457E-02,
     8 2.22768492E-02, 2.22773802E-02, 2.22782905E-02, 2.22799595E-02,
     9 2.22829944E-02, 2.22883068E-02, 2.22974173E-02, 2.23141315E-02/
      DATA CJ  41/
     1 2.23445596E-02, 2.23979289E-02, 2.24897765E-02, 2.26593445E-02,
     2 2.28930634E-02, 2.32491203E-02, 2.39401206E-02, 2.49151104E-02,
     3 2.63070342E-02, 2.83995587E-02, 3.15019911E-02, 3.64043040E-02,
     4 4.45264732E-02, 5.81378958E-02, 7.88629990E-02, 1.36137259E-01,
     5 2.57211631E-01, 1.30192772E-01, 6.63608831E-02, 3.93311909E-02,
     6 2.48502333E-02, 1.51148435E-02, 9.53662310E-03, 6.16693160E-03,
     7 3.54233209E-03, 1.82616568E-03, 8.50690362E-04, 3.38428996E-04,
     8 1.02988259E-04, 3.23302532E-05, 1.03769100E-05, 3.38662021E-06,
     9 1.11972018E-06, 2.16945941E-07, 4.27817069E-08, 8.55290917E-09/
      DATA CJ  42/
     1 1.72871725E-09, 2.07874878E-10, 2.53124541E-11, 1.72345593E-02,
     2 1.72346481E-02, 1.72347146E-02, 1.72348367E-02, 1.72350586E-02,
     3 1.72354470E-02, 1.72361127E-02, 1.72373334E-02, 1.72395531E-02,
     4 1.72434383E-02, 1.72501011E-02, 1.72623239E-02, 1.72845732E-02,
     5 1.73235899E-02, 1.73907151E-02, 1.75145682E-02, 1.76851231E-02,
     6 1.79446101E-02, 1.84470178E-02, 1.91532719E-02, 2.01562308E-02,
     7 2.16523609E-02, 2.38450945E-02, 2.72488293E-02, 3.27267114E-02,
     8 4.14736368E-02, 5.40800824E-02, 7.55433816E-02, 1.36071502E-01,
     9 2.66937747E-01, 1.30878244E-01, 5.70704857E-02, 3.54810703E-02/
      DATA CJ  43/
     1 2.10071223E-02, 1.30176391E-02, 8.31203265E-03, 4.71755468E-03,
     2 2.40684877E-03, 1.11154500E-03, 4.38918146E-04, 1.32672849E-04,
     3 4.14559690E-05, 1.32607288E-05, 4.31651874E-06, 1.42423313E-06,
     4 2.75284873E-07, 5.41870348E-08, 1.08174709E-08, 2.18388654E-09,
     5 2.62281135E-10, 3.19056755E-11, 1.37799601E-02, 1.37800274E-02,
     6 1.37800778E-02, 1.37801704E-02, 1.37803386E-02, 1.37806330E-02,
     7 1.37811376E-02, 1.37820629E-02, 1.37837454E-02, 1.37866904E-02,
     8 1.37917405E-02, 1.38010045E-02, 1.38178664E-02, 1.38474308E-02,
     9 1.38982799E-02, 1.39920548E-02, 1.41210902E-02, 1.43171872E-02/
      DATA CJ  44/
     1 1.46961074E-02, 1.52270987E-02, 1.59778404E-02, 1.70905750E-02,
     2 1.87061758E-02, 2.11789725E-02, 2.50716330E-02, 3.10732443E-02,
     3 3.92866830E-02, 5.24646620E-02, 7.45948113E-02, 1.44921051E-01,
     4 2.88593785E-01, 1.37313825E-01, 6.35764233E-02, 3.58313861E-02,
     5 2.14391887E-02, 1.33813743E-02, 7.44208358E-03, 3.73383866E-03,
     6 1.70148693E-03, 6.64396181E-04, 1.98863645E-04, 6.17263113E-05,
     7 1.96498532E-05, 6.37293608E-06, 2.09672615E-06, 4.03929604E-07,
     8 7.93103504E-08, 1.58017896E-08, 3.18509708E-09, 3.81879489E-10,
     9 4.63921497E-11, 1.10836014E-02, 1.10836534E-02, 1.10836924E-02/
      DATA CJ  45/
     1 1.10837639E-02, 1.10838939E-02, 1.10841214E-02, 1.10845115E-02,
     2 1.10852267E-02, 1.10865271E-02, 1.10888033E-02, 1.10927065E-02,
     3 1.10998664E-02, 1.11128976E-02, 1.11357432E-02, 1.11750288E-02,
     4 1.12474539E-02, 1.13470595E-02, 1.14983165E-02, 1.17902001E-02,
     5 1.21983629E-02, 1.27737467E-02, 1.36229698E-02, 1.48484789E-02,
     6 1.67074935E-02, 1.95944437E-02, 2.39552086E-02, 2.97559740E-02,
     7 3.86981296E-02, 5.32679383E-02, 8.05305435E-02, 1.50256705E-01,
     8 3.10028330E-01, 1.43359269E-01, 5.79514507E-02, 3.41359790E-02,
     9 2.07888262E-02, 1.13072749E-02, 5.57200234E-03, 2.50380051E-03/
      DATA CJ  46/
     1 9.66527996E-04, 2.86446076E-04, 8.83262559E-05, 2.79849270E-05,
     2 9.04393983E-06, 2.96723592E-06, 5.69809173E-07, 1.11611337E-07,
     3 2.21956566E-08, 4.46712809E-09, 5.34730172E-10, 6.48783939E-11,
     4 8.05345169E-03, 8.05348793E-03, 8.05351512E-03, 8.05356495E-03,
     5 8.05365555E-03, 8.05381410E-03, 8.05408592E-03, 8.05458428E-03,
     6 8.05549048E-03, 8.05707659E-03, 8.05979643E-03, 8.06478541E-03,
     7 8.07386492E-03, 8.08978091E-03, 8.11714522E-03, 8.16757597E-03,
     8 8.23689741E-03, 8.34208772E-03, 8.54480995E-03, 8.82771009E-03,
     9 9.22537505E-03, 9.80990903E-03, 1.06485399E-02, 1.19099547E-02/
      DATA CJ  47/
     1 1.38442261E-02, 1.67118796E-02, 2.04310483E-02, 2.59634497E-02,
     2 3.44927631E-02, 4.92459652E-02, 7.17143792E-02, 1.53427244E-01,
     3 3.26514616E-01, 1.45742764E-01, 6.13074379E-02, 3.60649980E-02,
     4 1.88174151E-02, 8.98850140E-03, 3.94809638E-03, 1.49719844E-03,
     5 4.37206538E-04, 1.33525468E-04, 4.20207143E-05, 1.35118440E-05,
     6 4.41591581E-06, 8.44260219E-07, 1.64822984E-07, 3.26934692E-08,
     7 6.56642250E-09, 7.84314417E-10, 9.49969176E-11, 6.23899214E-03,
     8 6.23901934E-03, 6.23903975E-03, 6.23907716E-03, 6.23914519E-03,
     9 6.23926423E-03, 6.23946831E-03, 6.23984247E-03, 6.24052283E-03/
      DATA CJ  48/
     1 6.24171365E-03, 6.24375562E-03, 6.24750111E-03, 6.25431728E-03,
     2 6.26626487E-03, 6.28680368E-03, 6.32464677E-03, 6.37664705E-03,
     3 6.45551338E-03, 6.60736780E-03, 6.81898452E-03, 7.11587158E-03,
     4 7.55107120E-03, 8.17302480E-03, 9.10333057E-03, 1.05183121E-02,
     5 1.25918504E-02, 1.52408962E-02, 1.91039365E-02, 2.48947623E-02,
     6 3.45085256E-02, 4.88880645E-02, 7.83625393E-02, 1.60081234E-01,
     7 3.50633150E-01, 1.58268933E-01, 6.90948156E-02, 3.39747806E-02,
     8 1.55020551E-02, 6.60454805E-03, 2.44930269E-03, 7.02699419E-04,
     9 2.12238793E-04, 6.62828734E-05, 2.11942671E-05, 6.89702873E-06/
      DATA CJ  49/
     1 1.31225577E-06, 2.55272620E-07, 5.04948874E-08, 1.01195427E-08,
     2 1.20591545E-09, 1.45796071E-10, 3.86282087E-03, 3.86283723E-03,
     3 3.86284949E-03, 3.86287197E-03, 3.86291285E-03, 3.86298440E-03,
     4 3.86310704E-03, 3.86333191E-03, 3.86374079E-03, 3.86445644E-03,
     5 3.86568359E-03, 3.86793446E-03, 3.87203051E-03, 3.87920970E-03,
     6 3.89154986E-03, 3.91428208E-03, 3.94550854E-03, 3.99284634E-03,
     7 4.08391991E-03, 4.21067527E-03, 4.38819654E-03, 4.64778015E-03,
     8 5.01747072E-03, 5.56772337E-03, 6.39868712E-03, 7.60416847E-03,
     9 9.12449772E-03, 1.13047814E-02, 1.44977905E-02, 1.96168808E-02/
      DATA CJ  50/
     1 2.68935185E-02, 4.08571483E-02, 6.32813848E-02, 1.50625472E-01,
     2 3.39572661E-01, 1.48214255E-01, 4.93249265E-02, 2.20913623E-02,
     3 9.10755191E-03, 3.29653797E-03, 9.28076731E-04, 2.77064012E-04,
     4 8.58448019E-05, 2.72917711E-05, 8.84251505E-06, 1.67419032E-06,
     5 3.24506159E-07, 6.40121059E-08, 1.28003362E-08, 1.52186166E-09,
     6 1.83661677E-10, 2.98227701E-03, 2.98228934E-03, 2.98229858E-03,
     7 2.98231552E-03, 2.98234633E-03, 2.98240025E-03, 2.98249267E-03,
     8 2.98266213E-03, 2.98297027E-03, 2.98350958E-03, 2.98443436E-03,
     9 2.98613057E-03, 2.98921719E-03, 2.99462686E-03, 3.00392462E-03/
      DATA CJ  51/
     1 3.02104965E-03, 3.04456802E-03, 3.08020825E-03, 3.14873479E-03,
     2 3.24401847E-03, 3.37728863E-03, 3.57180598E-03, 3.84811665E-03,
     3 4.25788866E-03, 4.87350005E-03, 5.76017191E-03, 6.86845602E-03,
     4 8.44008711E-03, 1.07075673E-02, 1.42674113E-02, 1.91878660E-02,
     5 2.82561307E-02, 4.26527329E-02, 7.23734657E-02, 1.66053959E-01,
     6 3.70990169E-01, 1.46316337E-01, 4.02698622E-02, 1.66654154E-02,
     7 5.85171602E-03, 1.60804097E-03, 4.73088651E-04, 1.45155849E-04,
     8 4.58264260E-05, 1.47698909E-05, 2.78019464E-06, 5.36593606E-07,
     9 1.05505562E-07, 2.10437806E-08, 2.49526484E-09, 3.00506659E-10/
      DATA CJ  52/
     1 2.45811060E-03, 2.45812052E-03, 2.45812796E-03, 2.45814160E-03,
     2 2.45816641E-03, 2.45820983E-03, 2.45828425E-03, 2.45842070E-03,
     3 2.45866882E-03, 2.45910309E-03, 2.45984773E-03, 2.46121352E-03,
     4 2.46369880E-03, 2.46805437E-03, 2.47553979E-03, 2.48932478E-03,
     5 2.50825196E-03, 2.53692541E-03, 2.59202576E-03, 2.66857395E-03,
     6 2.77551117E-03, 2.93133156E-03, 3.15215542E-03, 3.47856747E-03,
     7 3.96667106E-03, 4.66523184E-03, 5.53158490E-03, 6.74834637E-03,
     8 8.48186839E-03, 1.11569348E-02, 1.47721717E-02, 2.12195479E-02,
     9 3.09773686E-02, 5.02403557E-02, 8.47913144E-02, 1.81191796E-01/
      DATA CJ  53/
     1 4.35742447E-01, 1.57375913E-01, 3.77857605E-02, 1.33290042E-02,
     2 3.53494257E-03, 1.01785399E-03, 3.07954790E-04, 9.62707958E-05,
     3 3.08028604E-05, 5.75212773E-06, 1.10383599E-06, 2.16097638E-07,
     4 4.29560091E-08, 5.07558302E-09, 6.09587246E-10, 1.59316061E-03,
     5 1.59316688E-03, 1.59317159E-03, 1.59318020E-03, 1.59319588E-03,
     6 1.59322330E-03, 1.59327032E-03, 1.59335653E-03, 1.59351327E-03,
     7 1.59378762E-03, 1.59425804E-03, 1.59512085E-03, 1.59669084E-03,
     8 1.59944218E-03, 1.60417019E-03, 1.61287589E-03, 1.62482628E-03,
     9 1.64292426E-03, 1.67768186E-03, 1.72592489E-03, 1.79323589E-03/
      DATA CJ  54/
     1 1.89114489E-03, 2.02956203E-03, 2.23347321E-03, 2.53694524E-03,
     2 2.96846806E-03, 3.49945234E-03, 4.23810820E-03, 5.27764154E-03,
     3 6.85566320E-03, 8.94419422E-03, 1.25605380E-02, 1.78083775E-02,
     4 2.75074712E-02, 4.34318231E-02, 6.94569400E-02, 1.80213811E-01,
     5 4.82085871E-01, 1.59332134E-01, 2.91552500E-02, 7.98884103E-03,
     6 2.23838591E-03, 6.64530586E-04, 2.04998005E-04, 6.49535002E-05,
     7 1.20017500E-05, 2.28581804E-06, 4.44969147E-07, 8.80630041E-08,
     8 1.03581918E-08, 1.23968941E-09, 9.19353157E-04, 9.19356689E-04,
     9 9.19359338E-04, 9.19364194E-04, 9.19373024E-04, 9.19388477E-04/
      DATA CJ  55/
     1 9.19414967E-04, 9.19463536E-04, 9.19551848E-04, 9.19706417E-04,
     2 9.19971453E-04, 9.20457558E-04, 9.21342061E-04, 9.22892046E-04,
     3 9.25555409E-04, 9.30458801E-04, 9.37188357E-04, 9.47376741E-04,
     4 9.66933632E-04, 9.94056491E-04, 1.03185805E-03, 1.08675904E-03,
     5 1.16420985E-03, 1.27797277E-03, 1.44658757E-03, 1.68503220E-03,
     6 1.97650300E-03, 2.37877954E-03, 2.93932288E-03, 3.77931108E-03,
     7 4.87354280E-03, 6.72829417E-03, 9.34450658E-03, 1.39897358E-02,
     8 2.12049787E-02, 3.26161983E-02, 5.81647722E-02, 1.80163994E-01,
     9 5.28527592E-01, 1.49377768E-01, 1.15278749E-02, 4.59015236E-03/
      DATA CJ  56/
     1 1.38941231E-03, 4.28560071E-04, 1.35327423E-04, 2.48657102E-05,
     2 4.71313230E-06, 9.13883767E-07, 1.80285390E-07, 2.11329971E-08,
     3 2.52237838E-09, 4.97079819E-04, 4.97081685E-04, 4.97083085E-04,
     4 4.97085651E-04, 4.97090317E-04, 4.97098482E-04, 4.97112480E-04,
     5 4.97138144E-04, 4.97184809E-04, 4.97266483E-04, 4.97406528E-04,
     6 4.97663382E-04, 4.98130737E-04, 4.98949688E-04, 5.00356809E-04,
     7 5.02947077E-04, 5.06501374E-04, 5.11881044E-04, 5.22202627E-04,
     8 5.36506913E-04, 5.56423251E-04, 5.85308796E-04, 6.25981209E-04,
     9 6.85566078E-04, 7.73559903E-04, 8.97395372E-04, 1.04790530E-03/
      DATA CJ  57/
     1 1.25423681E-03, 1.53936087E-03, 1.96212602E-03, 2.50592714E-03,
     2 3.41272196E-03, 4.66542054E-03, 6.82886520E-03, 1.00691970E-02,
     3 1.49757493E-02, 2.58195605E-02, 5.09895938E-02, 1.82142093E-01,
     4 6.01661913E-01, 1.50263934E-01, 1.58288354E-02, 5.51672004E-03,
     5 1.65384948E-03, 5.09052680E-04, 9.09755702E-05, 1.69166221E-05,
     6 3.23492020E-06, 6.31498526E-07, 7.32461577E-08, 8.67314425E-09,
     7 1.99897580E-04, 1.99898314E-04, 1.99898865E-04, 1.99899876E-04,
     8 1.99901713E-04, 1.99904927E-04, 1.99910438E-04, 1.99920541E-04,
     9 1.99938912E-04, 1.99971066E-04, 2.00026199E-04, 2.00127316E-04/
      DATA CJ  58/
     1 2.00311299E-04, 2.00633683E-04, 2.01187569E-04, 2.02207070E-04,
     2 2.03605772E-04, 2.05722301E-04, 2.09781451E-04, 2.15403274E-04,
     3 2.23223904E-04, 2.34552788E-04, 2.50477950E-04, 2.73755006E-04,
     4 3.08022036E-04, 3.56046650E-04, 4.14131503E-04, 4.93307223E-04,
     5 6.01961696E-04, 7.61675253E-04, 9.65031926E-04, 1.29979774E-03,
     6 1.75495195E-03, 2.52510301E-03, 3.64908014E-03, 5.29931482E-03,
     7 8.79054164E-03, 1.67919264E-02, 3.55701775E-02, 1.66679011E-01,
     8 6.41873216E-01, 1.58308363E-01, 1.77085013E-02, 6.03634025E-03,
     9 1.80763238E-03, 3.11806787E-04, 5.65880157E-05, 1.06367396E-05/
      DATA CJ  59/
     1 2.05017106E-06, 2.34827287E-07, 2.75486735E-08, 5.28818603E-05,
     2 5.28820503E-05, 5.28821928E-05, 5.28824541E-05, 5.28829291E-05,
     3 5.28837603E-05, 5.28851853E-05, 5.28877980E-05, 5.28925486E-05,
     4 5.29008632E-05, 5.29151200E-05, 5.29412674E-05, 5.29888416E-05,
     5 5.30722006E-05, 5.32154105E-05, 5.34789783E-05, 5.38405186E-05,
     6 5.43874713E-05, 5.54359909E-05, 5.68872122E-05, 5.89042335E-05,
     7 6.18224554E-05, 6.59176796E-05, 7.18895835E-05, 8.06530367E-05,
     8 9.28834987E-05, 1.07603823E-04, 1.27556001E-04, 1.54750330E-04,
     9 1.94387175E-04, 2.44363059E-04, 3.25638255E-04, 4.34517962E-04/
      DATA CJ  60/
     1 6.15363065E-04, 8.73306817E-04, 1.24206340E-03, 1.99323939E-03,
     2 3.61586646E-03, 7.36911421E-03, 1.44074720E-02, 1.54062035E-01,
     3 6.33582634E-01, 1.56936612E-01, 1.73635032E-02, 5.93902443E-03,
     4 9.83219604E-04, 1.72819923E-04, 3.17727814E-05, 6.02693095E-06,
     5 6.79784799E-07, 7.88643246E-08, 1.82807098E-05, 1.82807748E-05,
     6 1.82808235E-05, 1.82809129E-05, 1.82810753E-05, 1.82813597E-05,
     7 1.82818471E-05, 1.82827408E-05, 1.82843657E-05, 1.82872098E-05,
     8 1.82920863E-05, 1.83010300E-05, 1.83173026E-05, 1.83458148E-05,
     9 1.83947973E-05, 1.84849417E-05, 1.86085855E-05, 1.87956191E-05/
      DATA CJ  61/
     1 1.91541013E-05, 1.96501256E-05, 2.03392769E-05, 2.13358157E-05,
     2 2.27332848E-05, 2.47691753E-05, 2.77527835E-05, 3.19096345E-05,
     3 3.69028889E-05, 4.36557463E-05, 5.28355375E-05, 6.61732519E-05,
     4 8.29308083E-05, 1.10069853E-04, 1.46252852E-04, 2.06020283E-04,
     5 2.90747496E-04, 4.11136869E-04, 6.54752904E-04, 1.17836636E-03,
     6 2.40810384E-03, 5.96195264E-03, 1.74408453E-02, 1.57214854E-01,
     7 6.34718148E-01, 1.61430142E-01, 2.17755787E-02, 3.57256008E-03,
     8 5.94303637E-04, 1.05566722E-04, 1.95664621E-05, 2.16074217E-06,
     9 2.47019226E-07, 5.90993561E-06, 5.90995641E-06, 5.90997201E-06/
      DATA CJ  62/
     1 5.91000062E-06, 5.91005263E-06, 5.91014365E-06, 5.91029968E-06,
     2 5.91058575E-06, 5.91110593E-06, 5.91201634E-06, 5.91357737E-06,
     3 5.91644034E-06, 5.92164933E-06, 5.93077618E-06, 5.94645523E-06,
     4 5.97530877E-06, 6.01488215E-06, 6.07473829E-06, 6.18944359E-06,
     5 6.34811763E-06, 6.56849358E-06, 6.88701017E-06, 7.33337610E-06,
     6 7.98307221E-06, 8.93403352E-06, 1.02568260E-05, 1.18428606E-05,
     7 1.39833327E-05, 1.68858911E-05, 2.10905717E-05, 2.63556257E-05,
     8 3.48481793E-05, 4.61177632E-05, 6.46293202E-05, 9.07018097E-05,
     9 1.27489574E-04, 2.01259458E-04, 3.57792631E-04, 7.19204235E-04/
      DATA CJ  63/
     1 1.74517798E-03, 5.82749688E-03, 1.69669437E-02, 1.55348802E-01,
     2 6.23701145E-01, 1.43451922E-01,-3.48187206E-03, 6.67723197E-04,
     3 1.48321433E-04, 2.94977261E-05, 3.38985522E-06, 3.95018156E-07,
     4 2.25483171E-06, 2.25483958E-06, 2.25484548E-06, 2.25485630E-06,
     5 2.25487597E-06, 2.25491039E-06, 2.25496940E-06, 2.25507759E-06,
     6 2.25527431E-06, 2.25561862E-06, 2.25620898E-06, 2.25729171E-06,
     7 2.25926164E-06, 2.26271320E-06, 2.26864252E-06, 2.27955359E-06,
     8 2.29451754E-06, 2.31714912E-06, 2.36051277E-06, 2.42048496E-06,
     9 2.50375229E-06, 2.62405024E-06, 2.79253700E-06, 3.03758083E-06/
      DATA CJ  64/
     1 3.39586922E-06, 3.89356224E-06, 4.48935327E-06, 5.29197530E-06,
     2 6.37805708E-06, 7.94736586E-06, 9.90683609E-06, 1.30567384E-05,
     3 1.72201765E-05, 2.40272738E-05, 3.35631444E-05, 4.69403195E-05,
     4 7.35652864E-05, 1.29461927E-04, 2.56623835E-04, 6.10103049E-04,
     5 1.98016924E-03, 6.61162926E-03, 1.97409592E-02, 1.66436919E-01,
     6 6.81084221E-01, 1.26300556E-01,-4.66188632E-04, 8.88047485E-04,
     7 1.80476316E-04, 2.02474567E-05, 2.30519837E-06, 7.66178811E-07,
     8 7.66181465E-07, 7.66183455E-07, 7.66187103E-07, 7.66193736E-07,
     9 7.66205345E-07, 7.66225246E-07, 7.66261733E-07, 7.66328077E-07/
      DATA CJ  65/
     1 7.66444192E-07, 7.66643289E-07, 7.67008435E-07, 7.67672784E-07,
     2 7.68836788E-07, 7.70836355E-07, 7.74515824E-07, 7.79561768E-07,
     3 7.87192752E-07, 8.01812442E-07, 8.22027724E-07, 8.50088062E-07,
     4 8.90613005E-07, 9.47343962E-07, 1.02979830E-06, 1.15025096E-06,
     5 1.31737793E-06, 1.51718372E-06, 1.78595349E-06, 2.14900946E-06,
     6 2.67250263E-06, 3.32462241E-06, 4.37002472E-06, 5.74739251E-06,
     7 7.99091094E-06, 1.11202703E-05, 1.54900517E-05, 2.41361492E-05,
     8 4.21368915E-05, 8.26176837E-05, 1.93279196E-04, 6.10921593E-04,
     9 1.98181686E-03, 6.63905502E-03, 2.11121110E-02, 1.47647210E-01/
      DATA CJ  66/
     1 7.41809339E-01, 1.33790339E-01, 5.01487182E-04, 1.04568765E-03,
     2 1.20288596E-04, 1.34382316E-05, 8.57088619E-08, 8.57091533E-08,
     3 8.57093719E-08, 8.57097727E-08, 8.57105014E-08, 8.57117766E-08,
     4 8.57139628E-08, 8.57179708E-08, 8.57252587E-08, 8.57380140E-08,
     5 8.57598846E-08, 8.57999953E-08, 8.58729720E-08, 8.60008310E-08,
     6 8.62204624E-08, 8.66245821E-08, 8.71787179E-08, 8.80165955E-08,
     7 8.96213548E-08, 9.18393144E-08, 9.49161071E-08, 9.93558454E-08,
     8 1.05563824E-07, 1.14572453E-07, 1.27704487E-07, 1.45874719E-07,
     9 1.67529054E-07, 1.96553240E-07, 2.35594091E-07, 2.91602843E-07/
      DATA CJ  67/
     1 3.60979046E-07, 4.71448010E-07, 6.15864232E-07, 8.48941386E-07,
     2 1.17061211E-06, 1.61468936E-06, 2.48048153E-06, 4.24535627E-06,
     3 8.09776422E-06, 1.81670384E-05, 5.32821613E-05, 1.54559697E-04,
     4 4.28901135E-04, 9.55275430E-04,-3.76288900E-03, 1.28758626E-01,
     5 7.30925185E-01, 1.35950613E-01, 3.50239034E-03, 7.39490102E-04,
     6 7.93709107E-05, 2.06439653E-08, 2.06440354E-08, 2.06440880E-08,
     7 2.06441844E-08, 2.06443596E-08, 2.06446663E-08, 2.06451920E-08,
     8 2.06461559E-08, 2.06479084E-08, 2.06509758E-08, 2.06562352E-08,
     9 2.06658810E-08, 2.06834303E-08, 2.07141775E-08, 2.07669938E-08/
      DATA CJ  68/
     1 2.08641748E-08, 2.09974301E-08, 2.11989155E-08, 2.15848062E-08,
     2 2.21181348E-08, 2.28579477E-08, 2.39254208E-08, 2.54179319E-08,
     3 2.75835584E-08, 3.07400247E-08, 3.51068015E-08, 4.03100133E-08,
     4 4.72828475E-08, 5.66603189E-08, 7.01107091E-08, 8.67680891E-08,
     5 1.13287218E-07, 1.47950783E-07, 2.03890911E-07, 2.81096290E-07,
     6 3.87699179E-07, 5.95628575E-07, 1.01992811E-06, 1.94824133E-06,
     7 4.38748695E-06, 1.30179794E-05, 3.88485065E-05, 1.16417342E-04,
     8 3.47961738E-04, 1.00762108E-03, 2.73564972E-04, 1.32228865E-01,
     9 7.23792490E-01, 1.23663010E-01,-9.29885927E-03,-1.23193146E-04/
      DATA CJ  69/
     1 4.56812442E-09, 4.56813986E-09, 4.56815144E-09, 4.56817267E-09,
     2 4.56821126E-09, 4.56827881E-09, 4.56839460E-09, 4.56860689E-09,
     3 4.56899290E-09, 4.56966849E-09, 4.57082688E-09, 4.57295137E-09,
     4 4.57681661E-09, 4.58358866E-09, 4.59522127E-09, 4.61662468E-09,
     5 4.64597233E-09, 4.69034496E-09, 4.77532270E-09, 4.89275528E-09,
     6 5.05562923E-09, 5.29059184E-09, 5.61901966E-09, 6.09538996E-09,
     7 6.78936667E-09, 7.74882510E-09, 8.89123179E-09, 1.04209298E-08,
     8 1.24762158E-08, 1.54208935E-08, 1.90632192E-08, 2.48537007E-08,
     9 3.24104017E-08, 4.45831096E-08, 6.13489390E-08, 8.44499966E-08/
      DATA CJ  70/
     1 1.29392210E-07, 2.20783682E-07, 4.19850164E-07, 9.39902731E-07,
     2 2.76543520E-06, 8.18408673E-06, 2.43693695E-05, 7.29812344E-05,
     3 2.19196312E-04, 1.10653705E-03, 8.66793851E-04, 1.36464968E-01,
     4 7.60579030E-01, 1.08315064E-01,-7.14703041E-03, 9.32044857E-10,
     5 9.32047995E-10, 9.32050349E-10, 9.32054664E-10, 9.32062510E-10,
     6 9.32076240E-10, 9.32099779E-10, 9.32142934E-10, 9.32221403E-10,
     7 9.32358740E-10, 9.32594222E-10, 9.33026093E-10, 9.33811827E-10,
     8 9.35188459E-10, 9.37553133E-10, 9.41903948E-10, 9.47869514E-10,
     9 9.56888953E-10, 9.74161074E-10, 9.98027764E-10, 1.03112604E-09/
      DATA CJ  71/
     1 1.07886618E-09, 1.14558244E-09, 1.24232345E-09, 1.38320084E-09,
     2 1.57787370E-09, 1.80953521E-09, 2.11953699E-09, 2.53574655E-09,
     3 3.13154835E-09, 3.86780770E-09, 5.03700719E-09, 6.56094325E-09,
     4 9.01229904E-09, 1.23833002E-08, 1.70205327E-08, 2.60240567E-08,
     5 4.42839754E-08, 8.39202093E-08, 1.86998871E-07, 5.46516447E-07,
     6 1.60572524E-06, 4.74612620E-06, 1.41224686E-05, 4.23264569E-05,
     7 2.22304979E-04, 1.15531950E-03, 2.47181017E-03, 1.20822713E-01,
     8 8.05702466E-01, 1.42819359E-02, 3.98573562E-11, 3.98574863E-11,
     9 3.98575839E-11, 3.98577629E-11, 3.98580882E-11, 3.98586575E-11/
      DATA CJ  72/
     1 3.98596336E-11, 3.98614230E-11, 3.98646767E-11, 3.98703713E-11,
     2 3.98801355E-11, 3.98980426E-11, 3.99306215E-11, 3.99876986E-11,
     3 4.00857347E-11, 4.02660912E-11, 4.05133383E-11, 4.08870542E-11,
     4 4.16023791E-11, 4.25901010E-11, 4.39585256E-11, 4.59296366E-11,
     5 4.86791694E-11, 5.26561680E-11, 5.84281163E-11, 6.63696338E-11,
     6 7.57734928E-11, 8.82877885E-11, 1.04980903E-10, 1.28693399E-10,
     7 1.57746760E-10, 2.03423868E-10, 2.62280518E-10, 3.55705134E-10,
     8 4.82255574E-10, 6.53598367E-10, 9.79681374E-10, 1.62290687E-09,
     9 2.96780567E-09, 6.28523094E-09, 1.69238753E-08, 4.47834951E-08/
      DATA CJ  73/
     1 1.15119869E-07, 2.80762913E-07, 6.12865151E-07, 7.29517944E-07,
     2-1.85281351E-05,-3.70871197E-04,-9.85146118E-03, 9.43947195E-02,
     3 9.92892411E-01/
      DATA XTAU/0.,.0000032,.0000056,.00001,.000018,
     A.000032,.000056,.0001,.00018,.00032,
     1.00056,.001,.0018,.0032,.0056,.01,.016,.025,.042,.065,
     2.096,.139,.196,.273,.375,.5,.63,.78,.95,1.15,1.35,1.6,1.85,2.15,
     32.45,2.75,3.15,3.65,4.25,5.0,6.,7.,8.,9.,10.,11.5,13.,14.5,16.,
     4 18.,20./
      DATA NXTAU/51/
      END
      SUBROUTINE BLOCKH
      COMMON /MATX/CJ(2601),CH(2601),XTAU(51),NXTAU
      DIMENSION CH   1(36),CH   2(36),CH   3(36),CH   4(36),CH   5(36)
      DIMENSION CH   6(36),CH   7(36),CH   8(36),CH   9(36),CH  10(36)
      DIMENSION CH  11(36),CH  12(36),CH  13(36),CH  14(36),CH  15(36)
      DIMENSION CH  16(36),CH  17(36),CH  18(36),CH  19(36),CH  20(36)
      DIMENSION CH  21(36),CH  22(36),CH  23(36),CH  24(36),CH  25(36)
      DIMENSION CH  26(36),CH  27(36),CH  28(36),CH  29(36),CH  30(36)
      DIMENSION CH  31(36),CH  32(36),CH  33(36),CH  34(36),CH  35(36)
      DIMENSION CH  36(36),CH  37(36),CH  38(36),CH  39(36),CH  40(36)
      DIMENSION CH  41(36),CH  42(36),CH  43(36),CH  44(36),CH  45(36)
      DIMENSION CH  46(36),CH  47(36),CH  48(36),CH  49(36),CH  50(36)
      DIMENSION CH  51(36),CH  52(36),CH  53(36),CH  54(36),CH  55(36)
      DIMENSION CH  56(36),CH  57(36),CH  58(36),CH  59(36),CH  60(36)
      DIMENSION CH  61(36),CH  62(36),CH  63(36),CH  64(36),CH  65(36)
      DIMENSION CH  66(36),CH  67(36),CH  68(36),CH  69(36),CH  70(36)
      DIMENSION CH  71(36),CH  72(36),CH  73( 9)
      EQUIVALENCE (CH   1(1),CH (   1)),(CH   2(1),CH (  37))
      EQUIVALENCE (CH   3(1),CH (  73)),(CH   4(1),CH ( 109))
      EQUIVALENCE (CH   5(1),CH ( 145)),(CH   6(1),CH ( 181))
      EQUIVALENCE (CH   7(1),CH ( 217)),(CH   8(1),CH ( 253))
      EQUIVALENCE (CH   9(1),CH ( 289)),(CH  10(1),CH ( 325))
      EQUIVALENCE (CH  11(1),CH ( 361)),(CH  12(1),CH ( 397))
      EQUIVALENCE (CH  13(1),CH ( 433)),(CH  14(1),CH ( 469))
      EQUIVALENCE (CH  15(1),CH ( 505)),(CH  16(1),CH ( 541))
      EQUIVALENCE (CH  17(1),CH ( 577)),(CH  18(1),CH ( 613))
      EQUIVALENCE (CH  19(1),CH ( 649)),(CH  20(1),CH ( 685))
      EQUIVALENCE (CH  21(1),CH ( 721)),(CH  22(1),CH ( 757))
      EQUIVALENCE (CH  23(1),CH ( 793)),(CH  24(1),CH ( 829))
      EQUIVALENCE (CH  25(1),CH ( 865)),(CH  26(1),CH ( 901))
      EQUIVALENCE (CH  27(1),CH ( 937)),(CH  28(1),CH ( 973))
      EQUIVALENCE (CH  29(1),CH (1009)),(CH  30(1),CH (1045))
      EQUIVALENCE (CH  31(1),CH (1081)),(CH  32(1),CH (1117))
      EQUIVALENCE (CH  33(1),CH (1153)),(CH  34(1),CH (1189))
      EQUIVALENCE (CH  35(1),CH (1225)),(CH  36(1),CH (1261))
      EQUIVALENCE (CH  37(1),CH (1297)),(CH  38(1),CH (1333))
      EQUIVALENCE (CH  39(1),CH (1369)),(CH  40(1),CH (1405))
      EQUIVALENCE (CH  41(1),CH (1441)),(CH  42(1),CH (1477))
      EQUIVALENCE (CH  43(1),CH (1513)),(CH  44(1),CH (1549))
      EQUIVALENCE (CH  45(1),CH (1585)),(CH  46(1),CH (1621))
      EQUIVALENCE (CH  47(1),CH (1657)),(CH  48(1),CH (1693))
      EQUIVALENCE (CH  49(1),CH (1729)),(CH  50(1),CH (1765))
      EQUIVALENCE (CH  51(1),CH (1801)),(CH  52(1),CH (1837))
      EQUIVALENCE (CH  53(1),CH (1873)),(CH  54(1),CH (1909))
      EQUIVALENCE (CH  55(1),CH (1945)),(CH  56(1),CH (1981))
      EQUIVALENCE (CH  57(1),CH (2017)),(CH  58(1),CH (2053))
      EQUIVALENCE (CH  59(1),CH (2089)),(CH  60(1),CH (2125))
      EQUIVALENCE (CH  61(1),CH (2161)),(CH  62(1),CH (2197))
      EQUIVALENCE (CH  63(1),CH (2233)),(CH  64(1),CH (2269))
      EQUIVALENCE (CH  65(1),CH (2305)),(CH  66(1),CH (2341))
      EQUIVALENCE (CH  67(1),CH (2377)),(CH  68(1),CH (2413))
      EQUIVALENCE (CH  69(1),CH (2449)),(CH  70(1),CH (2485))
      EQUIVALENCE (CH  71(1),CH (2521)),(CH  72(1),CH (2557))
      EQUIVALENCE (CH  73(1),CH (2593))
      DATA CH   1/
     1 7.15528120E-07,-7.63679981E-07,-7.15500186E-07,-7.15459313E-07,
     2-7.15399161E-07,-7.15312983E-07,-7.15165254E-07,-7.14858701E-07,
     3-7.14382582E-07,-7.13607800E-07,-7.12377050E-07,-7.10300825E-07,
     4-7.06860448E-07,-7.01420388E-07,-6.93063611E-07,-6.79532139E-07,
     5-6.63270842E-07,-6.41769994E-07,-6.06941637E-07,-5.67254987E-07,
     6-5.22282879E-07,-4.70473751E-07,-4.14388755E-07,-3.53840218E-07,
     7-2.91560381E-07,-2.33727889E-07,-1.88154634E-07,-1.48244615E-07,
     8-1.14444272E-07,-8.53987435E-08,-6.43470333E-08,-4.56539380E-08,
     9-3.26942276E-08,-2.21150989E-08,-1.50875635E-08,-1.03652019E-08/
      DATA CH   2/
     1-6.33939388E-09,-3.46859459E-09,-1.70493170E-09,-7.13016572E-10,
     2-2.27726935E-10,-7.40657549E-11,-2.44269562E-11,-8.14546806E-12,
     3-2.74070206E-12,-5.42231753E-13,-1.08693370E-13,-2.20183137E-14,
     4-4.49889022E-15,-5.47402692E-16,-6.72957970E-17, 1.49142688E-06,
     5-3.90281313E-07,-1.61431531E-06,-1.49134752E-06,-1.49120973E-06,
     6-1.49097554E-06,-1.49063560E-06,-1.49006119E-06,-1.48907404E-06,
     7-1.48745761E-06,-1.48489081E-06,-1.48056166E-06,-1.47338907E-06,
     8-1.46204838E-06,-1.44462816E-06,-1.41642180E-06,-1.38252570E-06,
     9-1.33770838E-06,-1.26511114E-06,-1.18238754E-06,-1.08864711E-06/
      DATA CH   3/
     1-9.80655730E-07,-8.63751857E-07,-7.37544289E-07,-6.07728094E-07,
     2-4.87182021E-07,-3.92189148E-07,-3.09000744E-07,-2.38547359E-07,
     3-1.78004914E-07,-1.34124776E-07,-9.51609333E-08,-6.81477476E-08,
     4-4.60966417E-08,-3.14484678E-08,-2.16051921E-08,-1.32138108E-08,
     5-7.22992635E-09,-3.55375351E-09,-1.48620912E-09,-4.74673171E-10,
     6-1.54382378E-10,-5.09154535E-11,-1.69783820E-11,-5.71270866E-12,
     7-1.13022573E-12,-2.26560028E-13,-4.58948851E-14,-9.37746872E-15,
     8-1.14100396E-15,-1.40271087E-16, 1.52106578E-06, 1.68212841E-06,
     9 4.09944249E-07,-1.75645270E-06,-1.52097046E-06,-1.52073553E-06/
      DATA CH   4/
     1-1.52034786E-06,-1.51978995E-06,-1.51877481E-06,-1.51712012E-06,
     2-1.51449942E-06,-1.51008118E-06,-1.50276284E-06,-1.49119345E-06,
     3-1.47342353E-06,-1.44465254E-06,-1.41007905E-06,-1.36436695E-06,
     4-1.29032132E-06,-1.20594808E-06,-1.11033885E-06,-1.00019498E-06,
     5-8.80961299E-07,-7.52238763E-07,-6.19835885E-07,-4.96887979E-07,
     6-4.00002484E-07,-3.15156696E-07,-2.43299681E-07,-1.81551082E-07,
     7-1.36796756E-07,-9.70566781E-08,-6.95053428E-08,-4.70149442E-08,
     8-3.20749578E-08,-2.20355911E-08,-1.34770434E-08,-7.37395328E-09,
     9-3.62454737E-09,-1.51581560E-09,-4.84129008E-10,-1.57457780E-10/
      DATA CH   5/
     1-5.19297218E-11,-1.73166017E-11,-5.82650912E-12,-1.15274044E-12,
     2-2.31073221E-13,-4.68091342E-14,-9.56427242E-15,-1.16373329E-15,
     3-1.43065350E-16, 2.98150821E-06, 2.98161961E-06, 3.02985925E-06,
     4 5.50707149E-07,-3.40191479E-06,-2.98116452E-06,-2.98048320E-06,
     5-2.97927252E-06,-2.97725646E-06,-2.97401344E-06,-2.96886903E-06,
     6-2.96020082E-06,-2.94584763E-06,-2.92316158E-06,-2.88832120E-06,
     7-2.83191590E-06,-2.76413769E-06,-2.67452550E-06,-2.52937199E-06,
     8-2.36397499E-06,-2.17655345E-06,-1.96064093E-06,-1.72691069E-06,
     9-1.47458038E-06,-1.21503614E-06,-9.74026455E-07,-7.84106027E-07/
      DATA CH   6/
     1-6.17786634E-07,-4.76928629E-07,-3.55885746E-07,-2.68155970E-07,
     2-1.90255412E-07,-1.36247871E-07,-9.21610475E-08,-6.28749313E-08,
     3-4.31952603E-08,-2.64183673E-08,-1.44547867E-08,-7.10501576E-09,
     4-2.97137592E-09,-9.49013288E-10,-3.08656397E-10,-1.01795161E-10,
     5-3.39448415E-11,-1.14214051E-11,-2.25965748E-12,-4.52960874E-13,
     6-9.17575200E-14,-1.87483472E-14,-2.28120596E-15,-2.80443572E-16,
     7 5.33941059E-06, 5.33959050E-06, 5.33971838E-06, 5.46288397E-06,
     8 9.45594076E-07,-5.99346507E-06,-5.33838396E-06,-5.33622077E-06,
     9-5.33261638E-06,-5.32678301E-06,-5.31753886E-06,-5.30199406E-06/
      DATA CH   7/
     1-5.27626139E-06,-5.23560527E-06,-5.17318158E-06,-5.07213438E-06,
     2-4.95072325E-06,-4.79020869E-06,-4.53021687E-06,-4.23397287E-06,
     3-3.89828536E-06,-3.51157189E-06,-3.09294861E-06,-2.64101390E-06,
     4-2.17616046E-06,-1.74450433E-06,-1.40435137E-06,-1.10646897E-06,
     5-8.54188854E-07,-6.37398304E-07,-4.80272397E-07,-3.40750911E-07,
     6-2.44022354E-07,-1.65062027E-07,-1.12610064E-07,-7.73634273E-08,
     7-4.73157247E-08,-2.58887527E-08,-1.27251939E-08,-5.32177962E-09,
     8-1.69969699E-09,-5.52808151E-10,-1.82316613E-10,-6.07956998E-11,
     9-2.04558995E-11,-4.04707848E-12,-8.11259273E-13,-1.64338996E-13/
      DATA CH   8/
     1-3.35785494E-14,-4.08567126E-15,-5.02278278E-16, 9.13329675E-06,
     2 9.13358176E-06, 9.13380306E-06, 9.13420159E-06, 9.37031962E-06,
     3 1.47104366E-06,-1.03630349E-05,-9.13025211E-06,-9.12398505E-06,
     4-9.11390737E-06,-9.09802697E-06,-9.07135096E-06,-9.02725015E-06,
     5-8.95762338E-06,-8.85075952E-06,-8.67781716E-06,-8.47005078E-06,
     6-8.19539043E-06,-7.75053819E-06,-7.24367751E-06,-6.66934449E-06,
     7-6.00772113E-06,-5.29151194E-06,-4.51831779E-06,-3.72302663E-06,
     8-2.98453429E-06,-2.40259068E-06,-1.89296597E-06,-1.46135960E-06,
     9-1.09047012E-06,-8.21656389E-07,-5.82960842E-07,-4.17476248E-07/
      DATA CH   9/
     1-2.82389890E-07,-1.92654440E-07,-1.32354098E-07,-8.09481724E-08,
     2-4.42906997E-08,-2.17703641E-08,-9.10454075E-09,-2.90785360E-09,
     3-9.45747879E-10,-3.11908427E-10,-1.04009658E-10,-3.49960749E-11,
     4-6.92376506E-12,-1.38790687E-12,-2.81152041E-13,-5.74463594E-14,
     5-6.98978740E-15,-8.59300205E-16, 1.61715949E-05, 1.61720720E-05,
     6 1.61724330E-05, 1.61730963E-05, 1.61743243E-05, 1.65968833E-05,
     7 3.13002612E-06,-1.85271744E-05,-1.61620847E-05,-1.61440014E-05,
     8-1.61156455E-05,-1.60681414E-05,-1.59898028E-05,-1.58662617E-05,
     9-1.56767807E-05,-1.53702665E-05,-1.50021225E-05,-1.45155180E-05/
      DATA CH  10/
     1-1.37274731E-05,-1.28296443E-05,-1.18123413E-05,-1.06404566E-05,
     2-9.37191392E-06,-8.00246045E-06,-6.59388527E-06,-5.28591985E-06,
     3-4.25522842E-06,-3.35262610E-06,-2.58820551E-06,-1.93132270E-06,
     4-1.45522738E-06,-1.03247504E-06,-7.39386642E-07,-5.00136599E-07,
     5-3.41207244E-07,-2.34410137E-07,-1.43365879E-07,-7.84424320E-08,
     6-3.85570653E-08,-1.61248655E-08,-5.15003730E-09,-1.67499319E-09,
     7-5.52413963E-10,-1.84209108E-10,-6.19807297E-11,-1.22625154E-11,
     8-2.45808833E-12,-4.97941514E-13,-1.01741831E-13,-1.23794385E-14,
     9-1.52188503E-15, 2.97035986E-05, 2.97044194E-05, 2.97050368E-05/
      DATA CH  11/
     1 2.97061753E-05, 2.97082586E-05, 2.97119611E-05, 3.03723299E-05,
     2 5.59251004E-06,-3.39127760E-05,-2.96749188E-05,-2.96219260E-05,
     3-2.95338145E-05,-2.93890504E-05,-2.91612567E-05,-2.88123315E-05,
     4-2.82483380E-05,-2.75712512E-05,-2.66765293E-05,-2.52278235E-05,
     5-2.35775061E-05,-2.17077264E-05,-1.95539426E-05,-1.72226003E-05,
     6-1.47058714E-05,-1.21172992E-05,-9.71365644E-06,-7.81957905E-06,
     7-6.16090061E-06,-4.75616197E-06,-3.54904619E-06,-2.67415660E-06,
     8-1.89729441E-06,-1.35870797E-06,-9.19057204E-07,-6.27005937E-07,
     9-4.30754070E-07,-2.63450092E-07,-1.44146186E-07,-7.08525779E-08/
      DATA CH  12/
     1-2.96310732E-08,-9.46370616E-09,-3.07796454E-09,-1.01511437E-09,
     2-3.38501999E-10,-1.13895526E-10,-2.25335364E-11,-4.51696914E-12,
     3-9.15014236E-13,-1.86960114E-13,-2.27483682E-14,-2.79660454E-15,
     4 5.33166603E-05, 5.33180333E-05, 5.33190646E-05, 5.33209602E-05,
     5 5.33244220E-05, 5.33305318E-05, 5.33411700E-05, 5.45903715E-05,
     6 9.45344212E-06,-5.98750523E-05,-5.32379559E-05,-5.30766673E-05,
     7-5.28137644E-05,-5.24019279E-05,-5.17726607E-05,-5.07570460E-05,
     8-4.95388096E-05,-4.79297869E-05,-4.53254263E-05,-4.23593245E-05,
     9-3.89992680E-05,-3.51292236E-05,-3.09404208E-05,-2.64187551E-05/
      DATA CH  13/
     1-2.17681883E-05,-1.74499821E-05,-1.40472898E-05,-1.10675313E-05,
     2-8.54399479E-06,-6.37549656E-06,-4.80383043E-06,-3.40827054E-06,
     3-2.44075547E-06,-1.65097143E-06,-1.12633544E-06,-7.73792885E-07,
     4-4.73252449E-07,-2.58938632E-07,-1.27276602E-07,-5.32279265E-08,
     5-1.70001466E-08,-5.52910028E-09,-1.82349841E-09,-6.08066807E-10,
     6-2.04595667E-10,-4.04779745E-11,-8.11402352E-12,-1.64367808E-12,
     7-3.35844075E-13,-4.08638019E-14,-5.02365045E-15, 9.11154221E-05,
     8 9.11176038E-05, 9.11192420E-05, 9.11222497E-05, 9.11277327E-05,
     9 9.11373748E-05, 9.11540492E-05, 9.11851448E-05, 9.35975830E-05/
      DATA CH  14/
     1 1.47063950E-05,-1.03462574E-04,-9.08852267E-05,-9.04268484E-05,
     2-8.97143077E-05,-8.86303398E-05,-8.68853564E-05,-8.47952605E-05,
     3-8.20369956E-05,-7.75751291E-05,-7.24955321E-05,-6.67426582E-05,
     4-6.01176981E-05,-5.29478997E-05,-4.52090066E-05,-3.72500018E-05,
     5-2.98601473E-05,-2.40372258E-05,-1.89381774E-05,-1.46199094E-05,
     6-1.09092379E-05,-8.21988044E-06,-5.83189075E-06,-4.17635691E-06,
     7-2.82495145E-06,-1.92724820E-06,-1.32401640E-06,-8.09767079E-07,
     8-4.43060175E-07,-2.17777566E-07,-9.10757716E-08,-2.90880576E-08,
     9-9.46053242E-09,-3.12008024E-09,-1.04042571E-09,-3.50070669E-10/
      DATA CH  15/
     1-6.92592007E-11,-1.38833572E-11,-2.81238403E-12,-5.74639184E-13,
     2-6.99191232E-14,-8.59560278E-15, 1.61084635E-04, 1.61088204E-04,
     3 1.61090883E-04, 1.61095798E-04, 1.61104749E-04, 1.61120458E-04,
     4 1.61147526E-04, 1.61197628E-04, 1.61290476E-04, 1.65663482E-04,
     5 3.12833434E-05,-1.84767463E-04,-1.60383520E-04,-1.59095632E-04,
     6-1.57151752E-04,-1.54037373E-04,-1.50316849E-04,-1.45414273E-04,
     7-1.37492118E-04,-1.28479528E-04,-1.18276734E-04,-1.06530685E-04,
     8-9.38212441E-05,-8.01050512E-05,-6.60003185E-05,-5.29053047E-05,
     9-4.25875346E-05,-3.35527875E-05,-2.59017163E-05,-1.93273550E-05/
      DATA CH  16/
     1-1.45626021E-05,-1.03318579E-05,-7.39883160E-06,-5.00464369E-06,
     2-3.41426413E-06,-2.34558186E-06,-1.43454739E-06,-7.84901321E-07,
     3-3.85800856E-07,-1.61343209E-07,-5.15300229E-08,-1.67594408E-08,
     4-5.52724107E-09,-1.84311601E-09,-6.20149585E-10,-1.22692260E-10,
     5-2.45942378E-11,-4.98210441E-12,-1.01796509E-12,-1.23860554E-13,
     6-1.52269488E-14, 2.95118060E-04, 2.95124067E-04, 2.95128573E-04,
     7 2.95136840E-04, 2.95151884E-04, 2.95178258E-04, 2.95223609E-04,
     8 2.95307219E-04, 2.95460872E-04, 2.95735401E-04, 3.02765668E-04,
     9 5.58676964E-05,-3.37573852E-04,-2.93054973E-04,-2.89397464E-04/
      DATA CH  17/
     1-2.83590510E-04,-2.76688687E-04,-2.67619889E-04,-2.52994639E-04,
     2-2.36378122E-04,-2.17582125E-04,-1.95954621E-04,-1.72562085E-04,
     3-1.47323476E-04,-1.21375266E-04,-9.72882826E-05,-7.83117813E-05,
     4-6.16962878E-05,-4.76263106E-05,-3.55369461E-05,-2.67755473E-05,
     5-1.89963282E-05,-1.36034154E-05,-9.20135573E-06,-6.27727001E-06,
     6-4.31241145E-06,-2.63742438E-06,-1.44303115E-06,-7.09283125E-07,
     7-2.96621802E-07,-9.47346057E-08,-3.08109284E-08,-1.01613469E-08,
     8-3.38839182E-09,-1.14008132E-09,-2.25556130E-10,-4.52136250E-11,
     9-9.15898950E-12,-1.87139993E-12,-2.27701364E-13,-2.79926878E-14/
      DATA CH  18/
     1 5.27450267E-04, 5.27460048E-04, 5.27467385E-04, 5.27480841E-04,
     2 5.27505322E-04, 5.27548208E-04, 5.27621863E-04, 5.27757350E-04,
     3 5.28005233E-04, 5.28444089E-04, 5.29212981E-04, 5.42982886E-04,
     4 9.43257257E-05,-5.94289096E-04,-5.21949862E-04,-5.11218873E-04,
     5-4.98593747E-04,-4.82097985E-04,-4.55597512E-04,-4.25563821E-04,
     6-3.91641331E-04,-3.52647471E-04,-3.10500866E-04,-2.65051281E-04,
     7-2.18341644E-04,-1.74994619E-04,-1.40851146E-04,-1.10959921E-04,
     8-8.56508809E-05,-6.39065263E-05,-4.81490961E-05,-3.41589441E-05,
     9-2.44608124E-05,-1.65448705E-05,-1.12868617E-05,-7.75380763E-06/
      DATA CH  19/
     1-4.74205493E-06,-2.59450211E-06,-1.27523489E-06,-5.33293310E-07,
     2-1.70319442E-07,-5.53929789E-08,-1.82682443E-08,-6.09165942E-09,
     3-2.04962735E-09,-4.05499382E-10,-8.12834463E-11,-1.64656199E-11,
     4-3.36430424E-12,-4.09347595E-13,-5.03233504E-14, 8.67939526E-04,
     5 8.67954213E-04, 8.67965230E-04, 8.67985431E-04, 8.68022175E-04,
     6 8.68086519E-04, 8.68196952E-04, 8.68399838E-04, 8.68770152E-04,
     7 8.69422777E-04, 8.70555855E-04, 8.72685043E-04, 9.00316828E-04,
     8 1.18726820E-04,-1.05068040E-03,-8.51640282E-04,-8.30180005E-04,
     9-8.02328563E-04,-7.57838031E-04,-7.07603820E-04,-6.50991942E-04/
      DATA CH  20/
     1-5.86013815E-04,-5.15855799E-04,-4.40257134E-04,-3.62606802E-04,
     2-2.90576808E-04,-2.33857067E-04,-1.84211669E-04,-1.42183646E-04,
     3-1.06079989E-04,-7.99196360E-05,-5.66953416E-05,-4.05972023E-05,
     4-2.74581721E-05,-1.87312937E-05,-1.28676222E-05,-7.86932554E-06,
     5-4.30539149E-06,-2.11610499E-06,-8.84915842E-07,-2.82610874E-07,
     6-9.19117308E-08,-3.03114320E-08,-1.01074120E-08,-3.40075163E-09,
     7-6.72798403E-10,-1.34862967E-10,-2.73190325E-11,-5.58186980E-12,
     8-6.79162392E-13,-8.34926889E-14, 1.61498414E-03, 1.61500857E-03,
     9 1.61502689E-03, 1.61506049E-03, 1.61512159E-03, 1.61522856E-03/
      DATA CH  21/
     1 1.61541206E-03, 1.61574893E-03, 1.61636286E-03, 1.61744182E-03,
     2 1.61930543E-03, 1.62277036E-03, 1.62924770E-03, 1.68333458E-03,
     3 3.60899758E-04,-1.82730765E-03,-1.58410667E-03,-1.52899488E-03,
     4-1.44234855E-03,-1.34546950E-03,-1.23689296E-03,-1.11271628E-03,
     5-9.78971597E-04,-8.35109934E-04,-6.87538020E-04,-5.50779439E-04,
     6-4.43161682E-04,-3.49011624E-04,-2.69337615E-04,-2.00915634E-04,
     7-1.51349791E-04,-1.07355641E-04,-7.68658545E-05,-5.19840976E-05,
     8-3.54597507E-05,-2.43579442E-05,-1.48953901E-05,-8.14890300E-06,
     9-4.00495346E-06,-1.67469957E-06,-5.34808728E-07,-1.73924801E-07/
      DATA CH  22/
     1-5.73564345E-08,-1.91250993E-08,-6.43470743E-09,-1.27299579E-09,
     2-2.55167484E-10,-5.16880700E-11,-1.05608383E-11,-1.28494760E-12,
     3-1.57962724E-13, 2.50720905E-03, 2.50724320E-03, 2.50726881E-03,
     4 2.50731578E-03, 2.50740118E-03, 2.50755068E-03, 2.50780708E-03,
     5 2.50827754E-03, 2.50913426E-03, 2.51063770E-03, 2.51322757E-03,
     6 2.51801809E-03, 2.52687709E-03, 2.54289614E-03, 2.63774332E-03,
     7 1.76260415E-04,-2.78126196E-03,-2.45704320E-03,-2.31262955E-03,
     8-2.15394575E-03,-1.97774832E-03,-1.77739883E-03,-1.56245308E-03,
     9-1.33188374E-03,-1.09584644E-03,-8.77427902E-04,-7.05726344E-04/
      DATA CH  23/
     1-5.55621605E-04,-4.28668973E-04,-3.19696027E-04,-2.40783539E-04,
     2-1.70762699E-04,-1.22247776E-04,-8.26646695E-05,-5.63817215E-05,
     3-3.87261829E-05,-2.36795672E-05,-1.29532571E-05,-6.36557648E-06,
     4-2.66157673E-06,-8.49889370E-07,-2.76373703E-07,-9.11370404E-08,
     5-3.03877430E-08,-1.02237148E-08,-2.02250217E-09,-4.05390165E-10,
     6-8.21157965E-11,-1.67774240E-11,-2.04127682E-12,-2.50935807E-13,
     7 3.20994276E-03, 3.20998251E-03, 3.21001232E-03, 3.21006698E-03,
     8 3.21016637E-03, 3.21034034E-03, 3.21063867E-03, 3.21118592E-03,
     9 3.21218201E-03, 3.21392850E-03, 3.21693250E-03, 3.22247328E-03/
      DATA CH  24/
     1 3.23266196E-03, 3.25087011E-03, 3.28333413E-03, 3.52880121E-03,
     2 2.90599435E-04,-3.99201557E-03,-3.07880403E-03,-2.86239707E-03,
     3-2.62426711E-03,-2.35540482E-03,-2.06836350E-03,-1.76152461E-03,
     4-1.44821000E-03,-1.15882208E-03,-9.31623746E-04,-7.33184814E-04,
     5-5.65473991E-04,-4.21599458E-04,-3.17461291E-04,-2.25092147E-04,
     6-1.61113538E-04,-1.08927603E-04,-7.42843836E-05,-5.10170507E-05,
     7-3.11911486E-05,-1.70601847E-05,-8.38286988E-06,-3.50466057E-06,
     8-1.11897755E-06,-3.63847665E-07,-1.19974679E-07,-4.00009634E-08,
     9-1.34574290E-08,-2.66207243E-09,-5.33563710E-10,-1.08075026E-10/
      DATA CH  25/
     1-2.20806555E-11,-2.68642989E-12,-3.30236900E-13, 5.61912502E-03,
     2 5.61918736E-03, 5.61923412E-03, 5.61931984E-03, 5.61947572E-03,
     3 5.61974854E-03, 5.62021633E-03, 5.62107432E-03, 5.62263546E-03,
     4 5.62537113E-03, 5.63007179E-03, 5.63872596E-03, 5.65458361E-03,
     5 5.68273038E-03, 5.73223829E-03, 5.82772200E-03, 6.17039808E-03,
     6 1.43639190E-03,-6.68103918E-03,-5.37711410E-03,-4.91201049E-03,
     7-4.39582996E-03,-3.85110759E-03,-3.27335460E-03,-2.68668446E-03,
     8-2.14696473E-03,-1.72437761E-03,-1.35598680E-03,-1.04510471E-03,
     9-7.78728323E-04,-5.86104634E-04,-4.15382293E-04,-2.97210854E-04/
      DATA CH  26/
     1-2.00873337E-04,-1.36950183E-04,-9.40333957E-05,-5.74765590E-05,
     2-3.14294076E-05,-1.54399049E-05,-6.45358275E-06,-2.06005782E-06,
     3-6.69737788E-07,-2.20809596E-07,-7.36127593E-08,-2.47632234E-08,
     4-4.89800939E-09,-9.81635331E-10,-1.98820044E-10,-4.06183901E-11,
     5-4.94151282E-12,-6.07419294E-13, 8.60872637E-03, 8.60881218E-03,
     6 8.60887654E-03, 8.60899453E-03, 8.60920907E-03, 8.60958456E-03,
     7 8.61022836E-03, 8.61140900E-03, 8.61355681E-03, 8.61731911E-03,
     8 8.62377964E-03, 8.63565978E-03, 8.65738046E-03, 8.69577446E-03,
     9 8.76277550E-03, 8.88981793E-03, 9.07314195E-03, 9.60580772E-03/
      DATA CH  27/
     1 5.68967448E-04,-1.02680807E-02,-8.28490183E-03,-7.37632354E-03,
     2-6.43680808E-03,-5.45363991E-03,-4.46443150E-03,-3.56017279E-03,
     3-2.85517842E-03,-2.24242398E-03,-1.72651510E-03,-1.28528029E-03,
     4-9.66674652E-04,-6.84627687E-04,-4.89594200E-04,-3.30726916E-04,
     5-2.25387410E-04,-1.54703712E-04,-9.45251600E-05,-5.16691993E-05,
     6-2.53739882E-05,-1.06022757E-05,-3.38323341E-06,-1.09963342E-06,
     7-3.62473002E-07,-1.20820939E-07,-4.06387087E-08,-8.03682131E-09,
     8-1.61050138E-09,-3.26157577E-10,-6.66275604E-11,-8.10497456E-12,
     9-9.96203776E-13, 1.04706488E-02, 1.04707426E-02, 1.04708129E-02/
      DATA CH  28/
     1 1.04709419E-02, 1.04711764E-02, 1.04715868E-02, 1.04722905E-02,
     2 1.04735808E-02, 1.04759277E-02, 1.04800379E-02, 1.04870926E-02,
     3 1.05000549E-02, 1.05237187E-02, 1.05654328E-02, 1.06378618E-02,
     4 1.07738115E-02, 1.09663337E-02, 1.12726017E-02, 1.26399636E-02,
     5 1.00257118E-03,-1.32448573E-02,-1.02003884E-02,-8.84301595E-03,
     6-7.45329555E-03,-6.07603131E-03,-4.82977802E-03,-3.86459789E-03,
     7-3.02952045E-03,-2.32888278E-03,-1.73132600E-03,-1.30078168E-03,
     8-9.20311543E-04,-6.57610360E-04,-4.43884672E-04,-3.02318135E-04,
     9-2.07403662E-04,-1.26655650E-04,-6.91945397E-05,-3.39630183E-05/
      DATA CH  29/
     1-1.41841204E-05,-4.52398956E-06,-1.46986400E-06,-4.84372815E-07,
     2-1.61415718E-07,-5.42826409E-08,-1.07326218E-08,-2.15032417E-09,
     3-4.35418135E-10,-8.89365256E-11,-1.08173327E-11,-1.32944308E-12,
     4 1.33110352E-02, 1.33111436E-02, 1.33112249E-02, 1.33113740E-02,
     5 1.33116450E-02, 1.33121192E-02, 1.33129323E-02, 1.33144233E-02,
     6 1.33171350E-02, 1.33218831E-02, 1.33300305E-02, 1.33449935E-02,
     7 1.33722851E-02, 1.34203163E-02, 1.35034721E-02, 1.36586923E-02,
     8 1.38764431E-02, 1.42174069E-02, 1.49161828E-02, 1.68840513E-02,
     9 1.68049676E-03,-1.75585958E-02,-1.31968210E-02,-1.10288702E-02/
      DATA CH  30/
     1-8.93226417E-03,-7.06568073E-03,-5.63477235E-03,-4.40515439E-03,
     2-3.37877289E-03,-2.50692076E-03,-1.88069912E-03,-1.32869378E-03,
     3-9.48354161E-04,-6.39452497E-04,-4.35142460E-04,-2.98317864E-04,
     4-1.82035567E-04,-9.93745215E-05,-4.87418148E-05,-2.03423910E-05,
     5-6.48375458E-06,-2.10552910E-06,-6.93572266E-07,-2.31057278E-07,
     6-7.76821776E-08,-1.53542835E-08,-3.07552806E-09,-6.22636771E-10,
     7-1.27155755E-10,-1.54631131E-11,-1.90012484E-12, 1.62635669E-02,
     8 1.62636881E-02, 1.62637789E-02, 1.62639456E-02, 1.62642486E-02,
     9 1.62647788E-02, 1.62656879E-02, 1.62673547E-02, 1.62703861E-02/
      DATA CH  31/
     1 1.62756934E-02, 1.62847988E-02, 1.63015153E-02, 1.63319866E-02,
     2 1.63855544E-02, 1.64781138E-02, 1.66502535E-02, 1.68902874E-02,
     3 1.72624926E-02, 1.80097009E-02, 1.91301740E-02, 2.20507234E-02,
     4 1.60598467E-03,-2.29301685E-02,-1.64041170E-02,-1.31520191E-02,
     5-1.03269818E-02,-8.19508155E-03,-6.38158993E-03,-4.87910449E-03,
     6-3.61017455E-03,-2.70275023E-03,-1.90566618E-03,-1.35806528E-03,
     7-9.14371740E-04,-6.21497638E-04,-4.25669633E-04,-2.59477519E-04,
     8-1.41505510E-04,-6.93399826E-05,-2.89124421E-05,-9.20687979E-06,
     9-2.98779009E-06,-9.83669747E-07,-3.27560755E-07,-1.10088386E-07/
      DATA CH  32/
     1-2.17503608E-08,-4.35523904E-09,-8.81474870E-10,-1.79975890E-10,
     2-2.18811141E-11,-2.68824340E-12, 1.90288838E-02, 1.90290141E-02,
     3 1.90291117E-02, 1.90292909E-02, 1.90296165E-02, 1.90301864E-02,
     4 1.90311635E-02, 1.90329549E-02, 1.90362129E-02, 1.90419163E-02,
     5 1.90517000E-02, 1.90696574E-02, 1.91023759E-02, 1.91598480E-02,
     6 1.92590133E-02, 1.94429574E-02, 1.96983785E-02, 2.00918628E-02,
     7 2.08715613E-02, 2.20119512E-02, 2.37371486E-02, 2.83114149E-02,
     8 2.46456465E-03,-2.93002107E-02,-1.96758212E-02,-1.52741478E-02,
     9-1.20287271E-02,-9.31144019E-03,-7.08564280E-03,-5.22193919E-03/
      DATA CH  33/
     1-3.89775767E-03,-2.74046750E-03,-1.94871813E-03,-1.30935747E-03,
     2-8.88519151E-04,-6.07746487E-04,-3.69934554E-04,-2.01457063E-04,
     3-9.85867634E-05,-4.10554077E-05,-1.30573022E-05,-4.23335105E-06,
     4-1.39273145E-06,-4.63507528E-07,-1.55703706E-07,-3.07449815E-08,
     5-6.15350944E-09,-1.24497731E-09,-2.54117234E-10,-3.08848439E-11,
     6-3.79339169E-12, 2.18877223E-02, 2.18878607E-02, 2.18879644E-02,
     7 2.18881547E-02, 2.18885006E-02, 2.18891059E-02, 2.18901436E-02,
     8 2.18920464E-02, 2.18955065E-02, 2.19015636E-02, 2.19119529E-02,
     9 2.19310185E-02, 2.19657448E-02, 2.20267078E-02, 2.21317887E-02/
      DATA CH  34/
     1 2.23263409E-02, 2.25956922E-02, 2.30087684E-02, 2.38202866E-02,
     2 2.49891583E-02, 2.67122164E-02, 2.94459970E-02, 3.60952709E-02,
     3 2.92743075E-03,-3.73647840E-02,-2.38681375E-02,-1.85748279E-02,
     4-1.42447859E-02,-1.07616185E-02,-7.88376564E-03,-5.85888497E-03,
     5-4.10243568E-03,-2.90808105E-03,-1.94826632E-03,-1.31904346E-03,
     6-9.00545180E-04,-5.47062546E-04,-2.97330725E-04,-1.45238774E-04,
     7-6.03779764E-05,-1.91696902E-05,-6.20711878E-06,-2.04005630E-06,
     8-6.78401904E-07,-2.27744155E-07,-4.49348897E-08,-8.98804938E-09,
     9-1.81755780E-09,-3.70836723E-10,-4.50505020E-11,-5.53125955E-12/
      DATA CH  35/
     1 2.36015431E-02, 2.36016814E-02, 2.36017851E-02, 2.36019752E-02,
     2 2.36023209E-02, 2.36029258E-02, 2.36039630E-02, 2.36058645E-02,
     3 2.36093224E-02, 2.36153754E-02, 2.36257567E-02, 2.36448050E-02,
     4 2.36794912E-02, 2.37403567E-02, 2.38451879E-02, 2.40390035E-02,
     5 2.43067409E-02, 2.47159813E-02, 2.55150365E-02, 2.66539649E-02,
     6 2.83052241E-02, 3.08509749E-02, 3.47923899E-02, 4.46119530E-02,
     7 3.20503910E-03,-4.47187614E-02,-2.99247790E-02,-2.25420281E-02,
     8-1.68110438E-02,-1.21916112E-02,-8.99598614E-03,-6.25826949E-03,
     9-4.41481615E-03,-2.94457279E-03,-1.98669550E-03,-1.35260584E-03/
      DATA CH  36/
     1-8.19247514E-04,-4.43981117E-04,-2.16298007E-04,-8.96923905E-05,
     2-2.84065921E-05,-9.18119435E-06,-3.01326406E-06,-1.00090450E-06,
     3-3.35701359E-07,-6.61622460E-08,-1.32225530E-08,-2.67198497E-09,
     4-5.44850998E-10,-6.61487149E-11,-8.11753486E-12, 2.10819534E-02,
     5 2.10820692E-02, 2.10821561E-02, 2.10823154E-02, 2.10826050E-02,
     6 2.10831118E-02, 2.10839807E-02, 2.10855737E-02, 2.10884705E-02,
     7 2.10935411E-02, 2.11022372E-02, 2.11181919E-02, 2.11472395E-02,
     8 2.11981948E-02, 2.12859096E-02, 2.14479200E-02, 2.16713789E-02,
     9 2.20121631E-02, 2.26748079E-02, 2.36128573E-02, 2.49588564E-02/
      DATA CH  37/
     1 2.69994181E-02, 3.00695593E-02, 3.50546660E-02, 4.82036877E-02,
     2-7.97111783E-04,-4.87438566E-02,-3.09328678E-02,-2.26544845E-02,
     3-1.62047269E-02,-1.18463299E-02,-8.17351975E-03,-5.73132332E-03,
     4-3.80196984E-03,-2.55452966E-03,-1.73345966E-03,-1.04625341E-03,
     5-5.65090551E-04,-2.74450106E-04,-1.13476006E-04,-3.58373195E-05,
     6-1.15586552E-05,-3.78744381E-06,-1.25645208E-06,-4.20972316E-07,
     7-8.28645553E-08,-1.65443178E-08,-3.34060400E-09,-6.80748360E-10,
     8-8.25891906E-11,-1.01292468E-11, 1.80345087E-02, 1.80346025E-02,
     9 1.80346728E-02, 1.80348018E-02, 1.80350362E-02, 1.80354466E-02/
      DATA CH  38/
     1 1.80361500E-02, 1.80374397E-02, 1.80397849E-02, 1.80438900E-02,
     2 1.80509298E-02, 1.80638448E-02, 1.80873553E-02, 1.81285880E-02,
     3 1.81995382E-02, 1.83304906E-02, 1.85109119E-02, 1.87856137E-02,
     4 1.93181999E-02, 2.00685569E-02, 2.11377479E-02, 2.27412677E-02,
     5 2.51123942E-02, 2.88515368E-02, 3.50495187E-02, 5.16632021E-02,
     6 3.00500586E-03,-5.10502016E-02,-3.11834652E-02,-2.18472301E-02,
     7-1.57558003E-02,-1.07467788E-02,-7.47494351E-03,-4.92345064E-03,
     8-3.29037961E-03,-2.22343494E-03,-1.33610350E-03,-7.18622045E-04,
     9-3.47694325E-04,-1.43252461E-04,-4.50864884E-05,-1.45053799E-05/
      DATA CH  39/
     1-4.74387966E-06,-1.57134883E-06,-5.25827462E-07,-1.03351743E-07,
     2-2.06108848E-08,-4.15785767E-09,-8.46641867E-10,-1.02630428E-10,
     3-1.25787831E-11, 1.64786075E-02, 1.64786895E-02, 1.64787510E-02,
     4 1.64788638E-02, 1.64790690E-02, 1.64794279E-02, 1.64800433E-02,
     5 1.64811715E-02, 1.64832231E-02, 1.64868141E-02, 1.64929723E-02,
     6 1.65042692E-02, 1.65248325E-02, 1.65608906E-02, 1.66229198E-02,
     7 1.67373508E-02, 1.68948904E-02, 1.71344875E-02, 1.75980955E-02,
     8 1.82492013E-02, 1.91727468E-02, 2.05483911E-02, 2.25612944E-02,
     9 2.56821454E-02, 3.07104584E-02, 3.88090757E-02, 5.60828824E-02/
      DATA CH  40/
     1 1.38016993E-03,-5.70339351E-02,-3.20806211E-02,-2.27479574E-02,
     2-1.52901387E-02,-1.05291477E-02,-6.87599889E-03,-4.56641458E-03,
     3-3.07072472E-03,-1.83601908E-03,-9.82842417E-04,-4.73524685E-04,
     4-1.94334826E-04,-6.09350428E-05,-1.95508802E-05,-6.38070901E-06,
     5-2.11006760E-06,-7.05164855E-07,-1.38381964E-07,-2.75628064E-08,
     6-5.55478372E-09,-1.13017307E-09,-1.36879731E-10,-1.67645870E-11,
     7 1.49382707E-02, 1.49383419E-02, 1.49383954E-02, 1.49384934E-02,
     8 1.49386716E-02, 1.49389835E-02, 1.49395182E-02, 1.49404985E-02,
     9 1.49422810E-02, 1.49454010E-02, 1.49507513E-02, 1.49605658E-02/
      DATA CH  41/
     1 1.49784293E-02, 1.50097490E-02, 1.50636142E-02, 1.51629417E-02,
     2 1.52995974E-02, 1.55072323E-02, 1.59083061E-02, 1.64700506E-02,
     3 1.72637549E-02, 1.84392393E-02, 2.01445276E-02, 2.27531418E-02,
     4 2.68624659E-02, 3.32277631E-02, 4.20505558E-02, 6.32993021E-02,
     5 4.77638112E-03,-6.19856622E-02,-3.71436880E-02,-2.42903955E-02,
     6-1.64402688E-02,-1.05882308E-02,-6.96335960E-03,-4.64839913E-03,
     7-2.75889880E-03,-1.46685643E-03,-7.02504829E-04,-2.86746026E-04,
     8-8.94499336E-05,-2.85938507E-05,-9.30594132E-06,-3.07068166E-06,
     9-1.02437882E-06,-2.00603757E-07,-3.98910777E-08,-8.02885662E-09/
      DATA CH  42/
     1-1.63180516E-09,-1.97406377E-10,-2.41552084E-11, 1.19676523E-02,
     2 1.19677075E-02, 1.19677488E-02, 1.19678247E-02, 1.19679626E-02,
     3 1.19682039E-02, 1.19686175E-02, 1.19693759E-02, 1.19707550E-02,
     4 1.19731688E-02, 1.19773080E-02, 1.19849008E-02, 1.19987195E-02,
     5 1.20229452E-02, 1.20646023E-02, 1.21413936E-02, 1.22469917E-02,
     6 1.24073222E-02, 1.27166280E-02, 1.31489715E-02, 1.37581127E-02,
     7 1.46565416E-02, 1.59520156E-02, 1.79155963E-02, 2.09638003E-02,
     8 2.55738576E-02, 3.17370854E-02, 4.13539855E-02, 6.47330583E-02,
     9-3.13002439E-03,-6.64300268E-02,-3.38972397E-02,-2.25383908E-02/
      DATA CH  43/
     1-1.42927434E-02,-9.29930308E-03,-6.15889710E-03,-3.62688409E-03,
     2-1.91468013E-03,-9.11336795E-04,-3.69930636E-04,-1.14801546E-04,
     3-3.65621381E-05,-1.18661438E-05,-3.90696388E-06,-1.30108568E-06,
     4-2.54265702E-07,-5.04812466E-08,-1.01473767E-08,-2.06022904E-09,
     5-2.48953995E-10,-3.04351150E-11, 9.90213654E-03, 9.90218064E-03,
     6 9.90221371E-03, 9.90227434E-03, 9.90238459E-03, 9.90257751E-03,
     7 9.90290825E-03, 9.90351464E-03, 9.90461728E-03, 9.90654721E-03,
     8 9.90985662E-03, 9.91592702E-03, 9.92697457E-03, 9.94634027E-03,
     9 9.97963508E-03, 1.00409936E-02, 1.01253323E-02, 1.02533023E-02/
      DATA CH  44/
     1 1.04998993E-02, 1.08439750E-02, 1.13275447E-02, 1.20382071E-02,
     2 1.30576130E-02, 1.45908932E-02, 1.69430759E-02, 2.04359677E-02,
     3 2.49835860E-02, 3.18044908E-02, 4.24883980E-02, 7.17810122E-02,
     4 8.67332704E-03,-6.89895852E-02,-3.75877207E-02,-2.31267135E-02,
     5-1.47569239E-02,-9.64269831E-03,-5.60654549E-03,-2.92702753E-03,
     6-1.38022587E-03,-5.55694562E-04,-1.71160116E-04,-5.42248495E-05,
     7-1.75297441E-05,-5.75424343E-06,-1.91162598E-06,-3.72520712E-07,
     8-7.37975875E-08,-1.48084838E-08,-3.00232238E-09,-3.62241875E-10,
     9-4.42306309E-11, 8.17766125E-03, 8.17769672E-03, 8.17772332E-03/
      DATA CH  45/
     1 8.17777209E-03, 8.17786076E-03, 8.17801593E-03, 8.17828196E-03,
     2 8.17876969E-03, 8.17965656E-03, 8.18120883E-03, 8.18387062E-03,
     3 8.18875298E-03, 8.19763809E-03, 8.21321213E-03, 8.23998502E-03,
     4 8.28931430E-03, 8.35709735E-03, 8.45989986E-03, 8.65784069E-03,
     5 8.93367940E-03, 9.32067034E-03, 9.88797957E-03, 1.06988496E-02,
     6 1.19121548E-02, 1.37590627E-02, 1.64702835E-02, 1.99453256E-02,
     7 2.50435890E-02, 3.27774721E-02, 4.59347375E-02, 7.42013248E-02,
     8-3.84440691E-03,-7.61316789E-02,-3.61005009E-02,-2.25876634E-02,
     9-1.45415779E-02,-8.33864216E-03,-4.30235527E-03,-2.00920297E-03/
      DATA CH  46/
     1-8.02224334E-04,-2.45245798E-04,-7.72927354E-05,-2.48915407E-05,
     2-8.14674445E-06,-2.70011013E-06,-5.24735849E-07,-1.03734098E-07,
     3-2.07811051E-08,-4.20755327E-09,-5.06922737E-10,-6.18247845E-11,
     4 6.11252521E-03, 6.11255098E-03, 6.11257031E-03, 6.11260575E-03,
     5 6.11267017E-03, 6.11278293E-03, 6.11297622E-03, 6.11333061E-03,
     6 6.11397502E-03, 6.11510290E-03, 6.11703692E-03, 6.12058433E-03,
     7 6.12703979E-03, 6.13835434E-03, 6.15780263E-03, 6.19362889E-03,
     8 6.24284199E-03, 6.31744633E-03, 6.46097742E-03, 6.66074206E-03,
     9 6.94051524E-03, 7.34963242E-03, 7.93233789E-03, 8.79983611E-03/
      DATA CH  47/
     1 1.01105399E-02, 1.20139653E-02, 1.44190263E-02, 1.78794221E-02,
     2 2.29776191E-02, 3.12457639E-02, 4.32092822E-02, 8.03682628E-02,
     3 7.96504037E-03,-7.77435659E-02,-3.82082769E-02,-2.39372959E-02,
     4-1.33928966E-02,-6.77602270E-03,-3.11640595E-03,-1.22867876E-03,
     5-3.71486061E-04,-1.16205869E-04,-3.72204288E-05,-1.21315871E-05,
     6-4.00773967E-06,-7.75921754E-07,-1.52950062E-07,-3.05712348E-08,
     7-6.17843471E-09,-7.42915499E-10,-9.04651545E-11, 4.84035718E-03,
     8 4.84037714E-03, 4.84039212E-03, 4.84041957E-03, 4.84046948E-03,
     9 4.84055683E-03, 4.84070657E-03, 4.84098112E-03, 4.84148033E-03/
      DATA CH  48/
     1 4.84235409E-03, 4.84385235E-03, 4.84660042E-03, 4.85160115E-03,
     2 4.86036555E-03, 4.87542922E-03, 4.90317432E-03, 4.94127798E-03,
     3 4.99902191E-03, 5.11005101E-03, 5.26444026E-03, 5.48039520E-03,
     4 5.79563422E-03, 6.24351713E-03, 6.90795579E-03, 7.90675700E-03,
     5 9.34685632E-03, 1.11498855E-02, 1.37134602E-02, 1.74284831E-02,
     6 2.33075143E-02, 3.15464164E-02, 4.71303961E-02, 8.31860584E-02,
     7-1.39809080E-03,-8.27387920E-02,-4.26914313E-02,-2.30114305E-02,
     8-1.13291684E-02,-5.10872289E-03,-1.98326793E-03,-5.91887189E-04,
     9-1.83572375E-04,-5.84402378E-05,-1.89608675E-05,-6.24146835E-06/
      DATA CH  49/
     1-1.20342928E-06,-2.36485698E-07,-4.71534551E-08,-9.51109020E-09,
     2-1.14126675E-09,-1.38742936E-10, 3.06078216E-03, 3.06079452E-03,
     3 3.06080379E-03, 3.06082079E-03, 3.06085169E-03, 3.06090577E-03,
     4 3.06099849E-03, 3.06116847E-03, 3.06147755E-03, 3.06201853E-03,
     5 3.06294614E-03, 3.06464754E-03, 3.06774352E-03, 3.07316939E-03,
     6 3.08249429E-03, 3.09966707E-03, 3.12324631E-03, 3.15896846E-03,
     7 3.22761787E-03, 3.32299780E-03, 3.45626012E-03, 3.65047653E-03,
     8 3.92579238E-03, 4.33292826E-03, 4.94215751E-03, 5.81499105E-03,
     9 6.89908541E-03, 8.42487188E-03, 1.06056083E-02, 1.39880458E-02/
      DATA CH  50/
     1 1.85952310E-02, 2.69222098E-02, 3.97570231E-02, 8.17551485E-02,
     2-2.09131453E-03,-8.11066235E-02,-3.25775813E-02,-1.56223141E-02,
     3-6.89366661E-03,-2.63175306E-03,-7.74659828E-04,-2.38122772E-04,
     4-7.53309275E-05,-2.43267140E-05,-7.97870666E-06,-1.53201107E-06,
     5-3.00117305E-07,-5.96957156E-08,-1.20174531E-08,-1.43902739E-09,
     6-1.74654400E-10, 2.40512571E-03, 2.40513525E-03, 2.40514241E-03,
     7 2.40515553E-03, 2.40517939E-03, 2.40522114E-03, 2.40529272E-03,
     8 2.40542396E-03, 2.40566258E-03, 2.40608023E-03, 2.40679639E-03,
     9 2.40810991E-03, 2.41050005E-03, 2.41468874E-03, 2.42188700E-03/
      DATA CH  51/
     1 2.43514190E-03, 2.45333866E-03, 2.48089982E-03, 2.53384359E-03,
     2 2.60735450E-03, 2.70997012E-03, 2.85933438E-03, 3.07069863E-03,
     3 3.38249757E-03, 3.84744668E-03, 4.51040248E-03, 5.32899596E-03,
     4 6.47276667E-03, 8.09200038E-03, 1.05707708E-02, 1.38891885E-02,
     5 1.97365176E-02, 2.84560234E-02, 4.53047976E-02, 8.93548007E-02,
     6 1.14633644E-02,-8.50321604E-02,-2.84309792E-02,-1.22811274E-02,
     7-4.58861788E-03,-1.32715400E-03,-4.03446003E-04,-1.26653331E-04,
     8-4.06694747E-05,-1.32809492E-05,-2.53758515E-06,-4.95287716E-07,
     9-9.82372640E-08,-1.97315428E-08,-2.35709284E-09,-2.85539273E-10/
      DATA CH  52/
     1 2.01712685E-03, 2.01713472E-03, 2.01714062E-03, 2.01715144E-03,
     2 2.01717110E-03, 2.01720552E-03, 2.01726451E-03, 2.01737268E-03,
     3 2.01756936E-03, 2.01791361E-03, 2.01850388E-03, 2.01958652E-03,
     4 2.02155648E-03, 2.02500871E-03, 2.03094102E-03, 2.04186369E-03,
     5 2.05685634E-03, 2.07955939E-03, 2.12315372E-03, 2.18364614E-03,
     6 2.26801810E-03, 2.39068326E-03, 2.56398272E-03, 2.81904874E-03,
     7 3.19818241E-03, 3.73643021E-03, 4.39752935E-03, 5.31530603E-03,
     8 6.60386497E-03, 8.55456517E-03, 1.11290500E-02, 1.55742879E-02,
     9 2.20122110E-02, 3.39250844E-02, 5.36878777E-02, 9.95979074E-02/
      DATA CH  53/
     1 7.38783044E-03,-9.50072179E-02,-2.79356771E-02,-1.01851683E-02,
     2-2.87000689E-03,-8.58470434E-04,-2.66568783E-04,-8.49241131E-05,
     3-2.75671564E-05,-5.23211420E-06,-1.01618882E-06,-2.00793527E-07,
     4-4.02097603E-08,-4.78825897E-09,-5.78618369E-10, 1.33288084E-03,
     5 1.33288594E-03, 1.33288976E-03, 1.33289677E-03, 1.33290952E-03,
     6 1.33293182E-03, 1.33297006E-03, 1.33304017E-03, 1.33316764E-03,
     7 1.33339075E-03, 1.33377332E-03, 1.33447498E-03, 1.33575171E-03,
     8 1.33798900E-03, 1.34183333E-03, 1.34891082E-03, 1.35862388E-03,
     9 1.37332860E-03, 1.40155268E-03, 1.44069144E-03, 1.49523153E-03/
      DATA CH  54/
     1 1.57442635E-03, 1.68611825E-03, 1.85011482E-03, 2.09306390E-03,
     2 2.43641543E-03, 2.85584007E-03, 3.43430215E-03, 4.23973960E-03,
     3 5.44579212E-03, 7.01592436E-03, 9.67657467E-03, 1.34312915E-02,
     4 2.01127759E-02, 3.05514315E-02, 4.72151598E-02, 1.06374254E-01,
     5 6.17009581E-03,-9.96689690E-02,-2.29826081E-02,-6.35395069E-03,
     6-1.86016685E-03,-5.69117121E-04,-1.79391630E-04,-5.77685069E-05,
     7-1.08675594E-05,-2.09713305E-06,-4.12348604E-07,-8.22550044E-08,
     8-9.75547377E-09,-1.17513816E-09, 7.83530263E-04, 7.83533205E-04,
     9 7.83535411E-04, 7.83539456E-04, 7.83546811E-04, 7.83559683E-04/
      DATA CH  55/
     1 7.83581748E-04, 7.83622204E-04, 7.83695764E-04, 7.83824512E-04,
     2 7.84045274E-04, 7.84450168E-04, 7.85186888E-04, 7.86477851E-04,
     3 7.88695987E-04, 7.92779208E-04, 7.98382125E-04, 8.06862583E-04,
     4 8.23133638E-04, 8.45683544E-04, 8.77081467E-04, 9.22621229E-04,
     5 9.86747741E-04, 1.08070159E-03, 1.21947081E-03, 1.41480537E-03,
     6 1.65228363E-03, 1.97796366E-03, 2.42825567E-03, 3.09645031E-03,
     7 3.95688231E-03, 5.39401252E-03, 7.38417265E-03, 1.08343660E-02,
     8 1.60328684E-02, 2.39734579E-02, 4.17194172E-02, 1.11167234E-01,
     9 8.12147389E-03,-1.03787203E-01,-1.21664585E-02,-3.86675215E-03/
      DATA CH  56/
     1-1.18915115E-03,-3.73896986E-04,-1.19964593E-04,-2.24513332E-05,
     2-4.31383088E-06,-8.45232000E-07,-1.68121328E-07,-1.98775513E-08,
     3-2.38852128E-09, 4.31428330E-04, 4.31429921E-04, 4.31431114E-04,
     4 4.31433301E-04, 4.31437277E-04, 4.31444237E-04, 4.31456167E-04,
     5 4.31478041E-04, 4.31517814E-04, 4.31587425E-04, 4.31706786E-04,
     6 4.31925702E-04, 4.32324019E-04, 4.33021975E-04, 4.34221142E-04,
     7 4.36428406E-04, 4.39456738E-04, 4.44039416E-04, 4.52828828E-04,
     8 4.65003230E-04, 4.81941729E-04, 5.06483608E-04, 5.40992089E-04,
     9 5.91451062E-04, 6.65773945E-04, 7.70012232E-04, 8.96197259E-04/
      DATA CH  57/
     1 1.06838152E-03, 1.30498580E-03, 1.65337178E-03, 2.09788586E-03,
     2 2.83167264E-03, 3.83295521E-03, 5.53558430E-03, 8.03725864E-03,
     3 1.17425654E-02, 1.96937155E-02, 3.83110605E-02, 1.16965943E-01,
     4 1.70596981E-02,-1.04676812E-01,-1.49791483E-02,-4.61490244E-03,
     5-1.41336984E-03,-4.44019379E-04,-8.12146998E-05,-1.53549240E-05,
     6-2.97292628E-06,-5.85942629E-07,-6.86335825E-08,-8.18846903E-09,
     7 1.76504596E-04, 1.76505236E-04, 1.76505716E-04, 1.76506595E-04,
     8 1.76508194E-04, 1.76510993E-04, 1.76515791E-04, 1.76524587E-04,
     9 1.76540581E-04, 1.76568575E-04, 1.76616575E-04, 1.76704609E-04/
      DATA CH  58/
     1 1.76864784E-04, 1.77145446E-04, 1.77627631E-04, 1.78515097E-04,
     2 1.79732531E-04, 1.81574490E-04, 1.85106158E-04, 1.89995492E-04,
     3 1.96793481E-04, 2.06633635E-04, 2.20451953E-04, 2.40621411E-04,
     4 2.70257059E-04, 3.11687506E-04, 3.61652140E-04, 4.29533409E-04,
     5 5.22318426E-04, 6.58041955E-04, 8.29891879E-04, 1.11086753E-03,
     6 1.48978818E-03, 2.12459025E-03, 3.04004297E-03, 4.36637098E-03,
     7 7.12331778E-03, 1.32969150E-02, 2.85096991E-02, 1.11666537E-01,
     8-4.21396883E-03,-1.10284816E-01,-1.64598789E-02,-5.04576505E-03,
     9-1.54500498E-03,-2.74412953E-04,-5.08407627E-05,-9.70061455E-06/
      DATA CH  59/
     1-1.89099014E-06,-2.19067018E-07,-2.59202504E-08, 4.75737999E-05,
     2 4.75739692E-05, 4.75740961E-05, 4.75743288E-05, 4.75747518E-05,
     3 4.75754922E-05, 4.75767614E-05, 4.75790884E-05, 4.75833196E-05,
     4 4.75907252E-05, 4.76034231E-05, 4.76267115E-05, 4.76690835E-05,
     5 4.77433262E-05, 4.78708713E-05, 4.81055985E-05, 4.84275557E-05,
     6 4.89145775E-05, 4.98480482E-05, 5.11396923E-05, 5.29342760E-05,
     7 5.55293882E-05, 5.91687194E-05, 6.44709356E-05, 7.22419364E-05,
     8 8.30697594E-05, 9.60776780E-05, 1.13671693E-04, 1.37592294E-04,
     9 1.72353366E-04, 2.16035135E-04, 2.86792225E-04, 3.81147735E-04/
      DATA CH  60/
     1 5.37033212E-04, 7.58041404E-04, 1.07204934E-03, 1.70711650E-03,
     2 3.06896932E-03, 6.23597647E-03, 1.46455423E-02, 1.10928995E-01,
     3 3.32637354E-04,-1.09275276E-01,-1.61840066E-02,-4.96436691E-03,
     4-8.49428119E-04,-1.53251063E-04,-2.87008566E-05,-5.51873468E-06,
     5-6.30811811E-07,-7.39041184E-08, 1.65963707E-05, 1.65964292E-05,
     6 1.65964730E-05, 1.65965535E-05, 1.65966997E-05, 1.65969557E-05,
     7 1.65973944E-05, 1.65981988E-05, 1.65996615E-05, 1.66022215E-05,
     8 1.66066110E-05, 1.66146615E-05, 1.66293089E-05, 1.66549730E-05,
     9 1.66990618E-05, 1.67801970E-05, 1.68914772E-05, 1.70597947E-05/
      DATA CH  61/
     1 1.73823576E-05, 1.78285817E-05, 1.84483554E-05, 1.93441974E-05,
     2 2.05997413E-05, 2.24274540E-05, 2.51031596E-05, 2.88259537E-05,
     3 3.32908189E-05, 3.93183762E-05, 4.74950377E-05, 5.93453073E-05,
     4 7.41919140E-05, 9.81549891E-05, 1.29978323E-04, 1.82300609E-04,
     5 2.56075790E-04, 3.60299807E-04, 5.69642755E-04, 1.01491888E-03,
     6 2.04637231E-03, 4.98400307E-03, 1.62482170E-02, 1.09495330E-01,
     7 4.87780468E-04,-1.07070311E-01,-1.85042259E-02,-2.99110492E-03,
     8-5.16537201E-04,-9.40606513E-05,-1.77389579E-05,-1.99116462E-06,
     9-2.30294703E-07, 5.41117987E-06, 5.41119878E-06, 5.41121296E-06/
      DATA CH  62/
     1 5.41123897E-06, 5.41128625E-06, 5.41136899E-06, 5.41151083E-06,
     2 5.41177089E-06, 5.41224376E-06, 5.41307138E-06, 5.41449045E-06,
     3 5.41709305E-06, 5.42182829E-06, 5.43012499E-06, 5.44437766E-06,
     4 5.47060549E-06, 5.50657593E-06, 5.56097877E-06, 5.66522125E-06,
     5 5.80939544E-06, 6.00958333E-06, 6.29882216E-06, 6.70396889E-06,
     6 7.29329526E-06, 8.15515016E-06, 9.35265992E-06, 1.07866473E-05,
     7 1.27191268E-05, 1.53351846E-05, 1.91171055E-05, 2.38419814E-05,
     8 3.14425618E-05, 4.14968487E-05, 5.79511291E-05, 8.10274507E-05,
     9 1.13439313E-04, 1.78053573E-04, 3.14022833E-04, 6.24374131E-04/
      DATA CH  63/
     1 1.49124696E-03, 4.87119183E-03, 1.58675957E-02, 1.08112412E-01,
     2-5.64721193E-03,-1.07343941E-01,-1.38176932E-03,-6.67356397E-04,
     3-1.37885383E-04,-2.72730427E-05,-3.15302305E-06,-3.70214196E-07,
     4 2.08043565E-06, 2.08044287E-06, 2.08044828E-06, 2.08045820E-06,
     5 2.08047624E-06, 2.08050781E-06, 2.08056193E-06, 2.08066115E-06,
     6 2.08084156E-06, 2.08115733E-06, 2.08169875E-06, 2.08269172E-06,
     7 2.08449834E-06, 2.08766372E-06, 2.09310134E-06, 2.10310735E-06,
     8 2.11682952E-06, 2.13758185E-06, 2.17734083E-06, 2.23231940E-06,
     9 2.30863775E-06, 2.41886513E-06, 2.57318772E-06, 2.79751407E-06/
      DATA CH  64/
     1 3.12527806E-06, 3.58015346E-06, 4.12411732E-06, 4.85605468E-06,
     2 5.84511401E-06, 7.27185995E-06, 9.05002713E-06, 1.19022183E-05,
     3 1.56626318E-05, 2.17926082E-05, 3.03508050E-05, 4.23131053E-05,
     4 6.60120571E-05, 1.15442162E-04, 2.26886841E-04, 5.32684722E-04,
     5 1.69371530E-03, 5.52770775E-03, 1.80892239E-02, 1.16234750E-01,
     6 2.76168404E-02,-9.53568850E-02,-2.93943754E-03,-8.38438697E-04,
     7-1.65138689E-04,-1.86290604E-05,-2.14192535E-06, 7.11612643E-07,
     8 7.11615095E-07, 7.11616934E-07, 7.11620305E-07, 7.11626435E-07,
     9 7.11637161E-07, 7.11655550E-07, 7.11689265E-07, 7.11750569E-07/
      DATA CH  65/
     1 7.11857863E-07, 7.12041833E-07, 7.12379237E-07, 7.12993109E-07,
     2 7.14068666E-07, 7.15916272E-07, 7.19316041E-07, 7.23978257E-07,
     3 7.31028596E-07, 7.44534757E-07, 7.63207949E-07, 7.89123296E-07,
     4 8.26541566E-07, 8.78906601E-07, 9.54982163E-07, 1.06605075E-06,
     5 1.22003998E-06, 1.40397899E-06, 1.65116303E-06, 1.98467729E-06,
     6 2.46491486E-06, 3.06223933E-06, 4.01807902E-06, 5.27484361E-06,
     7 7.31698881E-06, 1.01576386E-05, 1.41127191E-05, 2.19093204E-05,
     8 3.80573906E-05, 7.41150532E-05, 1.71687225E-04, 5.33923293E-04,
     9 1.69603350E-03, 5.53819650E-03, 1.83971155E-02, 1.02940053E-01/
      DATA CH  66/
     1-6.16317670E-03,-1.00741788E-01,-3.73960779E-03,-9.74975681E-04,
     2-1.09756316E-04,-1.23812238E-05, 8.08788948E-08, 8.08791690E-08,
     3 8.08793747E-08, 8.08797519E-08, 8.08804375E-08, 8.08816375E-08,
     4 8.08836946E-08, 8.08874661E-08, 8.08943238E-08, 8.09063263E-08,
     5 8.09269060E-08, 8.09646492E-08, 8.10333184E-08, 8.11536300E-08,
     6 8.13602954E-08, 8.17405538E-08, 8.22619620E-08, 8.30503349E-08,
     7 8.45602162E-08, 8.66469097E-08, 8.95413560E-08, 9.37174735E-08,
     8 9.95558916E-08, 1.08026390E-07, 1.20370367E-07, 1.37443819E-07,
     9 1.57782504E-07, 1.85030552E-07, 2.21662610E-07, 2.74182728E-07/
      DATA CH  67/
     1 3.39193538E-07, 4.42631225E-07, 5.77739664E-07, 7.95587506E-07,
     2 1.09593305E-06, 1.51015281E-06, 2.31679844E-06, 3.95882473E-06,
     3 7.53797472E-06, 1.68839094E-05, 4.95306923E-05, 1.44789965E-04,
     4 4.15382842E-04, 1.09942732E-03, 1.31208811E-03, 1.02365061E-01,
     5 4.70799162E-04,-9.82089711E-02,-5.38213464E-03,-6.63214122E-04,
     6-7.19592889E-05, 1.95130503E-08, 1.95131164E-08, 1.95131659E-08,
     7 1.95132568E-08, 1.95134219E-08, 1.95137110E-08, 1.95142064E-08,
     8 1.95151148E-08, 1.95167666E-08, 1.95196575E-08, 1.95246144E-08,
     9 1.95337053E-08, 1.95502450E-08, 1.95792233E-08, 1.96290007E-08/
      DATA CH  68/
     1 1.97205891E-08, 1.98461735E-08, 2.00360556E-08, 2.03997073E-08,
     2 2.09022661E-08, 2.15993323E-08, 2.26049996E-08, 2.40108548E-08,
     3 2.60502724E-08, 2.90218592E-08, 3.31312256E-08, 3.80255045E-08,
     4 4.45810213E-08, 5.33920847E-08, 6.60213059E-08, 8.16498384E-08,
     5 1.06509044E-07, 1.38970511E-07, 1.91297283E-07, 2.63424155E-07,
     6 3.62884506E-07, 5.56570399E-07, 9.50953805E-07, 1.81143275E-06,
     7 4.06430324E-06, 1.19959897E-05, 3.56109619E-05, 1.06274847E-04,
     8 3.17923256E-04, 9.41771985E-04, 3.54841289E-03, 9.95277362E-02,
     9-4.11990696E-03,-9.78057270E-02, 3.72452157E-03, 5.71822715E-05/
      DATA CH  69/
     1 4.33638262E-09, 4.33639724E-09, 4.33640820E-09, 4.33642830E-09,
     2 4.33646485E-09, 4.33652880E-09, 4.33663844E-09, 4.33683946E-09,
     3 4.33720496E-09, 4.33784467E-09, 4.33894153E-09, 4.34095316E-09,
     4 4.34461307E-09, 4.35102535E-09, 4.36203991E-09, 4.38230594E-09,
     5 4.41009364E-09, 4.45210675E-09, 4.53256276E-09, 4.64374017E-09,
     6 4.79792631E-09, 5.02033171E-09, 5.33116143E-09, 5.78191679E-09,
     7 6.43840166E-09, 7.34571416E-09, 8.42561144E-09, 9.87098040E-09,
     8 1.18119837E-08, 1.45912712E-08, 1.80267803E-08, 2.34843331E-08,
     9 3.06004650E-08, 4.20522909E-08, 5.78080613E-08, 7.94929896E-08/
      DATA CH  70/
     1 1.21621788E-07, 2.07132769E-07, 3.92943235E-07, 8.76821801E-07,
     2 2.56764760E-06, 7.55935688E-06, 2.23853323E-05, 6.66856982E-05,
     3 1.99641258E-04, 1.02807083E-03, 4.04552113E-03, 1.02726581E-01,
     4 1.79886089E-02,-8.60501553E-02, 2.60616271E-03, 8.87765567E-10,
     5 8.87768549E-10, 8.87770786E-10, 8.87774887E-10, 8.87782344E-10,
     6 8.87795393E-10, 8.87817763E-10, 8.87858776E-10, 8.87933351E-10,
     7 8.88063871E-10, 8.88287666E-10, 8.88698102E-10, 8.89444837E-10,
     8 8.90753137E-10, 8.93000426E-10, 8.97135224E-10, 9.02804526E-10,
     9 9.11375875E-10, 9.27789361E-10, 9.50468423E-10, 9.81917510E-10/
      DATA CH  71/
     1 1.02727458E-09, 1.09065231E-09, 1.18253624E-09, 1.31630906E-09,
     2 1.50110859E-09, 1.72094560E-09, 2.01501193E-09, 2.40965166E-09,
     3 2.97428145E-09, 3.67162075E-09, 4.77827845E-09, 6.21961604E-09,
     4 8.53612265E-09, 1.17186469E-08, 1.60922937E-08, 2.45737478E-08,
     5 4.17468094E-08, 7.89451660E-08, 1.75412258E-07, 5.10501814E-07,
     6 1.49282957E-06, 4.38903313E-06, 1.29827929E-05, 3.86624380E-05,
     7 2.01282979E-04, 1.05423514E-03, 4.64098366E-03, 9.04415425E-02,
     8-1.89214643E-03,-1.71716873E-01, 3.90236429E-11, 3.90237704E-11,
     9 3.90238661E-11, 3.90240415E-11, 3.90243603E-11, 3.90249183E-11/
      DATA CH  72/
     1 3.90258750E-11, 3.90276288E-11, 3.90308179E-11, 3.90363993E-11,
     2 3.90459694E-11, 3.90635206E-11, 3.90954520E-11, 3.91513949E-11,
     3 3.92474829E-11, 3.94242567E-11, 3.96665942E-11, 4.00328934E-11,
     4 4.07340360E-11, 4.17022052E-11, 4.30435973E-11, 4.49758834E-11,
     5 4.76714763E-11, 5.15708862E-11, 5.72310912E-11, 6.50204295E-11,
     6 7.42462624E-11, 8.65270039E-11, 1.02913995E-10, 1.26201174E-10,
     7 1.54746928E-10, 1.99652158E-10, 2.57554840E-10, 3.49544435E-10,
     8 4.74280527E-10, 6.43363594E-10, 9.65652637E-10, 1.60290389E-09,
     9 2.94005367E-09, 6.25723494E-09, 1.70097397E-08, 4.56909069E-08/
      DATA CH  73/
     1 1.20421289E-07, 3.07324137E-07, 7.38632443E-07, 2.00511821E-06,
     2-4.66809104E-06,-1.85535655E-04,-4.04881136E-03, 8.50154847E-02,
     3 1.69140724E-01/
      END
      SUBROUTINE ABORT
      PARAMETER (SS$_ABORT='002C'X)
      CALL LIB$STOP(%VAL(SS$_ABORT))
      END
