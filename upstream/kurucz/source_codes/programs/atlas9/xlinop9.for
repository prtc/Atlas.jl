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
