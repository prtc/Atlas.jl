      PROGRAM BROADEN
c     revised 7aug93
C     TAPE5=INPUT
C     TAPE6=OUTPUT
C     TAPE21=SPECTRUM INPUT
C     TAPE22=SPECTRUM OUTPUT
C     THE MINIMUM DIMENSION OF H IS (NWL+19999+19999)*NMU
C     FOR FLUX SPECTRA NMU IS 1
      DIMENSION H(3000000)
      DIMENSION RED(20000),BLUE(20000)
      DIMENSION COMMENT(13),A(3),B(3)
      REAL*8 LINDAT8(14)
      REAL*4 LINDAT(28)
      DIMENSION XMU(20),QMU(40),WLEDGE(200),TITLE(74)
      REAL*8 TEFF,GLOG,TITLE,WBEGIN,RESOLU,XMU,WLEDGE,RATIO
      REAL*8 QMU
      DIMENSION APLOT(101)
      DATA APLOT/101*1H  /
      LINOUT=300
      REWIND 21
      READ(21)TEFF,GLOG,TITLE,WBEGIN,RESOLU,NWL,IFSURF,NMU,XMU,NEDGE,
     1WLEDGE
      WRITE(6,1010)TEFF,GLOG,TITLE
 1010 FORMAT(  5H TEFF,F7.0,7H   GRAV,F7.3/7H TITLE ,74A1)
      WRITE(6,1007)NMU,(XMU(IMU),IMU=1,NMU)
 1007 FORMAT(I4,20F6.3)
C     IFSURF=3 FOR ROTATED SPECTRUM
      IF(IFSURF.EQ.3) NMU=1
      RATIO=1.+1./RESOLU
      WEND=WBEGIN*RATIO**(NWL-1)
      WCEN=(WBEGIN+WEND)*.5
      VSTEP=2.997925E5/RESOLU
      WRITE(6,1005)WBEGIN,WEND,RESOLU,VSTEP
 1005 FORMAT(2F12.5,F12.1,F12.5)
      NMU1=NMU+1
      NMU2=NMU+NMU
C
C     SAMPLE CARDS RIGHT SHIFTED BY 1
C          AT WLBEG  AT WLEND
CGAUSSIAN  3.5       4.5       KM        COMMENT FIELD
CGAUSSIAN  100000.   120000.   RESOLUTIONCOMMENT FIELD
CGAUSSIAN  7.        9.        PM        COMMENT FIELD
C
C     POINTS ARE TABULATED AT THE SPACING OF THE COMPUTED SPECTRUM
C     THE CENTER IS THE FIRST POINT FOR EACH WING
C     TAKING THE CENTER ONLY ONCE, THE PROFILE SUMS TO 1.
C
      READ(5,1)A,X1,X2,B,COMMENT
    1 FORMAT(A4,A4,A2,2F10.2,A4,A4,A2,12A4,A2)
      WRITE(6,2)A,X1,X2,B,COMMENT
    2 FORMAT(1X,A4,A4,A2,2F10.2,A4,A4,A2,12A4,A2)
      IF(A(1).EQ.4HGAUS)GO TO 20
      WRITE(6,3)
    3 FORMAT(10H0BAD INPUT)
      CALL EXIT
C
C
C     GAUSSIAN INSTRUMENTAL PROFILE HALF WIDTH IN KM  FWHM
   20 FWHM=0.
      IF(B(1).EQ.4HPM  )FWHM1=X1/WBEGIN/1000.*299792.5
      IF(B(1).EQ.4HKM  )FWHM1=X1
      IF(B(1).EQ.4HRESO)FWHM1=299792.5/X1
      IF(B(1).EQ.4HPM  )FWHM2=X2/WEND/1000.*299792.5
      IF(B(1).EQ.4HKM  )FWHM2=X2
      IF(B(1).EQ.4HRESO)FWHM2=299792.5/X2
C
C
   51 FORMAT(I5,2F10.6)
      WRITE(22)TEFF,GLOG,TITLE,WBEGIN,RESOLU,NWL,IFSURF,NMU,XMU,NEDGE,
     1WLEDGE
      NH=(NWL+19999+19999)*NMU
      DO 52 I=1,NH
   52 H(I)=0.
      WRITE(6,1117)
 1117 FORMAT(1H1)
      IF(NMU.EQ.1)GO TO 150
C
      DO 57 IWL=1,NWL                                                 
      FWHM=(FWHM1*(NWL-IWL)+FWHM2*(IWL-1))/FLOAT(NWL-1) 
      C=VSTEP/FWHM*.8325546*2.
      DO 21 I=2,20000
      RED(I)=EXP(-((I-1)*C)**2)
      IF(RED(I).LT.1.E-5)GO TO 22
   21 CONTINUE
   22 NPROF=I
      RED(1)=0.5
      SUM=RED(1)
      DO 23 I=2,NPROF
   23 SUM=SUM+RED(I)
      SUM=SUM*2.
      DO 24 I=1,NPROF
   24 RED(I)=RED(I)/SUM
C   24 BLUE(I)=RED(I)
      READ(21)(QMU(I),I=1,NMU)
      DO 56 IMU=1,NMU
      Q=QMU(IMU)
      IWL1000=(IWL+20000)*NMU+IMU
      DO 53 I=1,NPROF                                                           
   53 H(IWL1000-I*NMU)=H(IWL1000-I*NMU)+RED(I)*Q                                            
C   53 H(IWL1000-I*NMU)=H(IWL1000-I*NMU)+BLUE(I)*Q                                            
      IWL998=(IWL+19998)*NMU+IMU
      DO 54 I=1,NPROF                                                           
   54 H(IWL998+I*NMU)=H(IWL998+I*NMU)+RED(I)*Q                                             
   56 CONTINUE
   57 CONTINUE                                                                  
      GO TO 160
C
  150 DO 157 IWL=1,NWL                                                 
      FWHM=(FWHM1*(NWL-IWL)+FWHM2*(IWL-1))/FLOAT(NWL-1) 
      C=VSTEP/FWHM*.8325546*2.
      DO 121 I=2,20000
      RED(I)=EXP(-((I-1)*C)**2)
      IF(RED(I).LT.1.E-5)GO TO 122
  121 CONTINUE
  122 NPROF=I
      RED(1)=0.5
      SUM=RED(1)
      DO 123 I=2,NPROF
  123 SUM=SUM+RED(I)
      SUM=SUM*2.
      DO 124 I=1,NPROF
  124 RED(I)=RED(I)/SUM
C  124 BLUE(I)=RED(I)
      READ(21)QMU(1)
      Q=QMU(1)
      IWL1001=IWL+20001
      DO 153 I=1,NPROF                                                           
  153 H(IWL1001-I)=H(IWL1001-I)+RED(I)*Q                                            
C  153 H(IWL1001-I)=H(IWL1001-I)+BLUE(I)*Q                                            
      IWL999=IWL+19999
      DO 154 I=1,NPROF                                                           
  154 H(IWL999+I)=H(IWL999+I)+RED(I)*Q                                             
  157 CONTINUE                                                                  
  160 REWIND 21
      READ(21)
      DO 70 IWL=1,NWL
      READ(21)(QMU(IMU),IMU=1,NMU2)
      IWLNMU=(IWL+19999)*NMU
      DO 58 IMU=1,NMU
   58 QMU(IMU)=H(IWLNMU+IMU)
      WRITE(22)(QMU(I),I=1,NMU2)
      IF(IWL.GT.LINOUT)GO TO 63                                                 
      WAVE=WBEGIN*RATIO**(IWL-1)                                             
      RESID=QMU(1)/QMU(NMU1)                                                    
      IRESID=RESID*1000.+.5                                                     
      IPLOT=RESID*100.+1.5                                                      
      IPLOT=MAX0(1,MIN0(101,IPLOT))                                             
      APLOT(IPLOT)=1HX
      WRITE(6,2300)IWL,WAVE,IRESID,APLOT                                             
 2300 FORMAT(1H ,I5,F11.4,I7,101A1)
      APLOT(IPLOT)=(1H )
   63 CONTINUE                                                                  
   68 CONTINUE                                                                  
   70 CONTINUE                                                                  
      READ(21)NLINES
      WRITE(22)NLINES
      DO 200 I=1,NLINES
      READ(21)LINDAT8,LINDAT
      WRITE(22)LINDAT8,LINDAT
  200 CONTINUE
      CALL EXIT
      END
