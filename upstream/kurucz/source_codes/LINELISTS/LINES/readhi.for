      PROGRAM READHI
C     SAMPLE PROGRAM FOR READING HILINES.DAT
C
C     These data were collected or computed by Kurucz and described at the
C     IAU General Assembly in Baltimore in 1988.  Up to now they have been
C     distributed on 30 magnetic tapes.  The data are resident in the mass
C     storage of the San Diego Supercomputer Center and have been used by
C     Kurucz to compute opacities.  From those files we have extracted the
C     absolute minimum data for each line that is needed for computing the
C     line opacity and we have packed it into 16 bytes.  The atomic data
C     can be fitted onto one CD-ROM.  For detailed spectrum synthesis it is
C     necessary to have much more information about each line, the classi-
C     fication, exact energy levels, etc.  All these data will be made
C     available on future CD-ROMs.  Much of these data can be improved using
C     newer laboratory data and the bigger, faster computers now available.
C     As significant progress is made, newer versions of this CD will be
C     published.
C                                          Robert Kurucz   8 February 1993
C
C1988 Semiempirical calculation of gf values for the iron group.  Presented
C     at the meeting of Commission 14 on Atomic and Molecular Spectroscopy
C     at the IAU General Assembly in Baltimore, August 1988.  in Transactions
C     of the International Astronomical Union, Volume XXB. M.McNally, ed.,
C     Dordrecht: Kluwer, 168-172.
C
C1991 New opacity calculations. Presented at the NATO Advanced Research Work-
C     shop, Stellar Atmospheres: Beyond Classical Models, Marina d'Aurisina
C     (Trieste) Italy, 3-7 September 1990.  pp.440-448 in Stellar Atmospheres:
C     Beyond Classical Models (ed. by L. Crivellari, I. Hubeny, and D.G. Hummer),
C     NATO ASI Series, Kluwer, Dordrecht.
C
C1992 Atomic and molecular data for opacity calculations.  Presented at the
C     Workshop on Astrophysical Opacities, Caracas, 15-19 July 1991.  Revista
C     Mexicana de Astronomia y Astrofisica, vol. 23, pp. 45-48.
C
C1992 "Finding" the "missing" solar ultraviolet opacity.  Presented at the
C     Workshop on Astrophysical Opacities, Caracas, 15-19 July 1991.  Revista
C     Mexicana de Astronomia y Astrofisica, vol. 23, pp. 181-186.
C
C1992 Remaining line opacity problems for the solar spectrum.  Presented at the
C     Workshop on Astrophysical Opacities, Caracas, 15-19 July 1991.  Revista
C     Mexicana de Astronomia y Astrofisica, vol. 23, pp. 187-194.
C
C1992 A new opacity-sampling model atmosphere program for arbitrary abundances.
C     Presented at IAU Colloquium 138, Peculiar versus Normal Phenomena
C     in A-type and Related Stars, Trieste, Italy, 6-10 July 1992.  To be
C     published in IAU Colloquium 138, Peculiar versus Normal Phenomena in
C     A-type and Related Stars (eds. M.M. Dworetsky, F. Castelli, and R.
C     Faraggiana), A.S.P. Conference Series, Astronomical Society of the
C     Pacific, San Francisco.
C
      REAL*8 RESOLU,RATIO,RATIOLG
      REAL*8 WLVAC,START,STOP
      REAL*4 TABLOG(32768)
      INTEGER*2 IELION,IELO,IGFLOG,IGR,IGS,IGW
      COMMON /IIIIIII/IWL,IELION,IELO,IGFLOG,IGR,IGS,IGW
      INTEGER*4 IIIIIII(4)
      EQUIVALENCE (IIIIIII(1),IWL)
      BYTE IIBYTE(16),ONEBYTE
      EQUIVALENCE (IIIIIII(1),IIBYTE(1))
      DIMENSION ELEM(840)
      DIMENSION ELEMA(119),ELEMB(156),ELEMC(159),ELEMD(61)
      DIMENSION ELEME(95),ELEMF(95),ELEMG(95),ELEMH(60)
      EQUIVALENCE (ELEM(  1),ELEMA(1)),(ELEM(120),ELEMB(1))
      EQUIVALENCE (ELEM(276),ELEMC(1)),(ELEM(435),ELEMD(1))
      EQUIVALENCE (ELEM(496),ELEME(1)),(ELEM(591),ELEMF(1))
      EQUIVALENCE (ELEM(686),ELEMG(1)),(ELEM(781),ELEMH(1))
      DIMENSION I100000(103)
      DATA I100000/
     1   2980376,   4322563,   4566648,   4757078,   4955691,   5095883,
     2   5208982,   5317592,   5423230,   5527179,   5624065,   5715892,
     3   5798894,   5875373,   5944817,   6010246,   6074210,   6139137,
     4   6203613,   6268550,   6334990,   6397942,   6461326,   6524572,
     5   6589779,   6656404,   6724023,   6790993,   6860903,   6929273,
     6   6996369,   7062269,   7125855,   7190038,   7253901,   7317902,
     7   7385639,   7452612,   7520492,   7595189,   7673224,   7751183,
     8   7824428,   7894797,   7966971,   8041208,   8114901,   8192842,
     9   8274940,   8354561,   8433890,   8506899,   8584318,   8666519,
     A   8751000,   8831909,   8918185,   8998443,   9075821,   9161977,
     1   9243257,   9313629,   9394369,   9482801,   9577358,   9665930,
     2   9755516,   9856915,   9962644,  10060934,  10157800,  10253016,
     3  10361979,  10469853,  10569515,  10652419,  10742989,  10856297,
     4  10970812,  11087437,  11232998,  11375134,  11479581,  11579932,
     5  11696464,  11820656,  11955360,  12112063,  12275117,  12433549,
     6  12571706,  12711097,  12902879,  13106374,  13295965,  13515923,
     7  13795041,  14115695,  14530111,  15060161,  15852661,  17009254,
     8  18962765/
C    9  23026377/=last line= 10268732th LINE
      DATA ELEMA/
     1  1.00, 1.01,
     2  2.00, 2.01, 2.02,
     3  3.00, 3.01, 3.02, 3.03,
     4  4.00, 4.01, 4.02, 4.03, 4.04,
     5  5.00, 5.01, 5.02, 5.03, 5.04, 5.05,
     6  6.00, 6.01, 6.02, 6.03, 6.04, 6.05, 6.06,
     7  7.00, 7.01, 7.02, 7.03, 7.04, 7.05, 7.06, 7.07,
     8  8.00, 8.01, 8.02, 8.03, 8.04, 8.05, 8.06, 8.07, 8.08,
     9  9.00, 9.01, 9.02, 9.03, 9.04, 9.05, 9.06, 9.07, 9.08, 9.09,
     A 10.00,10.01,10.02,10.03,10.04,10.05,10.06,10.07,10.08,10.09,
     1 10.10,
     2 11.00,11.01,11.02,11.03,11.04,11.05,11.06,11.07,11.08,11.09,
     3 11.10,11.11,
     4 12.00,12.01,12.02,12.03,12.04,12.05,12.06,12.07,12.08,12.09,
     5 12.10,12.11,12.12,
     6 13.00,13.01,13.02,13.03,13.04,13.05,13.06,13.07,13.08,13.09,
     7 13.10,13.11,13.12,13.13,
     8 14.00,14.01,14.02,14.03,14.04,14.05,14.06,14.07,14.08,14.09,
     9 14.10,14.11,14.12,14.13,14.14/
      DATA ELEMB/
     1 15.00,15.01,15.02,15.03,15.04,15.05,15.06,15.07,15.08,15.09,
     2 15.10,15.11,15.12,15.13,15.14,15.15,
     3 16.00,16.01,16.02,16.03,16.04,16.05,16.06,16.07,16.08,16.09,
     4 16.10,16.11,16.12,16.13,16.14,16.15,16.16,
     5 17.00,17.01,17.02,17.03,17.04,17.05,17.06,17.07,17.08,17.09,
     6 17.10,17.11,17.12,17.13,17.14,17.15,17.16,17.17,
     7 18.00,18.01,18.02,18.03,18.04,18.05,18.06,18.07,18.08,18.09,
     8 18.10,18.11,18.12,18.13,18.14,18.15,18.16,18.17,18.18,
     9 19.00,19.01,19.02,19.03,19.04,19.05,19.06,19.07,19.08,19.09,
     A 19.10,19.11,19.12,19.13,19.14,19.15,19.16,19.17,19.18,19.19,
     1 20.00,20.01,20.02,20.03,20.04,20.05,20.06,20.07,20.08,20.09,
     2 20.10,20.11,20.12,20.13,20.14,20.15,20.16,20.17,20.18,20.19,
     3 20.20,
     4 21.00,21.01,21.02,21.03,21.04,21.05,21.06,21.07,21.08,21.09,
     5 21.10,21.11,21.12,21.13,21.14,21.15,21.16,21.17,21.18,21.19,
     6 21.20,21.21,
     7 22.00,22.01,22.02,22.03,22.04,22.05,22.06,22.07,22.08,22.09,
     8 22.10,22.11,22.12,22.13,22.14,22.15,22.16,22.17,22.18,22.19,
     9 22.20,22.21,22.22/
      DATA ELEMC/
     1 23.00,23.01,23.02,23.03,23.04,23.05,23.06,23.07,23.08,23.09,
     2 23.10,23.11,23.12,23.13,23.14,23.15,23.16,23.17,23.18,23.19,
     3 23.20,23.21,23.22,23.23,
     4 24.00,24.01,24.02,24.03,24.04,24.05,24.06,24.07,24.08,24.09,
     5 24.10,24.11,24.12,24.13,24.14,24.15,24.16,24.17,24.18,24.19,
     6 24.20,24.21,24.22,24.23,24.24,
     7 25.00,25.01,25.02,25.03,25.04,25.05,25.06,25.07,25.08,25.09,
     8 25.10,25.11,25.12,25.13,25.14,25.15,25.16,25.17,25.18,25.19,
     9 25.20,25.21,25.22,25.23,25.24,25.25,
     A 26.00,26.01,26.02,26.03,26.04,26.05,26.06,26.07,26.08,26.09,
     1 26.10,26.11,26.12,26.13,26.14,26.15,26.16,26.17,26.18,26.19,
     2 26.20,26.21,26.22,26.23,26.24,26.25,26.26,
     3 27.00,27.01,27.02,27.03,27.04,27.05,27.06,27.07,27.08,27.09,
     4 27.10,27.11,27.12,27.13,27.14,27.15,27.16,27.17,27.18,27.19,
     5 27.20,27.21,27.22,27.23,27.24,27.25,27.26,27.27,
     6 28.00,28.01,28.02,28.03,28.04,28.05,28.06,28.07,28.08,28.09,
     7 28.10,28.11,28.12,28.13,28.14,28.15,28.16,28.17,28.18,28.19,
     8 28.20,28.21,28.22,28.23,28.24,28.25,28.26,28.27,28.28/
      DATA ELEMD/
     1 29.00,29.01,29.02,29.03,29.04,29.05,29.06,29.07,29.08,29.09,
     2 29.10,29.11,29.12,29.13,29.14,29.15,29.16,29.17,29.18,29.19,
     3 29.20,29.21,29.22,29.23,29.24,29.25,29.26,29.27,29.28,29.29,
     4 30.00,30.01,30.02,30.03,30.04,30.05,30.06,30.07,30.08,30.09,
     5 30.10,30.11,30.12,30.13,30.14,30.15,30.16,30.17,30.18,30.19,
     6 30.20,30.21,30.22,30.23,30.24,30.25,30.26,30.27,30.28,30.29,
     7 30.30/
      DATA ELEME/
     1 31.00,31.01,31.02,31.03,31.04,
     2 32.00,32.01,32.02,32.03,32.04,
     3 33.00,33.01,33.02,33.03,33.04,
     4 34.00,34.01,34.02,34.03,34.04,
     5 35.00,35.01,35.02,35.03,35.04,
     6 36.00,36.01,36.02,36.03,36.04,
     7 37.00,37.01,37.02,37.03,37.04,
     8 38.00,38.01,38.02,38.03,38.04,
     9 39.00,39.01,39.02,39.03,39.04,
     A 40.00,40.01,40.02,40.03,40.04,
     1 41.00,41.01,41.02,41.03,41.04,
     2 42.00,42.01,42.02,42.03,42.04,
     3 43.00,43.01,43.02,43.03,43.04,
     4 44.00,44.01,44.02,44.03,44.04,
     5 45.00,45.01,45.02,45.03,45.04,
     6 46.00,46.01,46.02,46.03,46.04,
     7 47.00,47.01,47.02,47.03,47.04,
     8 48.00,48.01,48.02,48.03,48.04,
     9 49.00,49.01,49.02,49.03,49.04/
      DATA ELEMF/
     1 50.00,50.01,50.02,50.03,50.04,
     2 51.00,51.01,51.02,51.03,51.04,
     3 52.00,52.01,52.02,52.03,52.04,
     4 53.00,53.01,53.02,53.03,53.04,
     5 54.00,54.01,54.02,54.03,54.04,
     6 55.00,55.01,55.02,55.03,55.04,
     7 56.00,56.01,56.02,56.03,56.04,
     8 57.00,57.01,57.02,57.03,57.04,
     9 58.00,58.01,58.02,58.03,58.04,
     A 59.00,59.01,59.02,59.03,59.04,
     1 60.00,60.01,60.02,60.03,60.04,
     2 61.00,61.01,61.02,61.03,61.04,
     3 62.00,62.01,62.02,62.03,62.04,
     4 63.00,63.01,63.02,63.03,63.04,
     5 64.00,64.01,64.02,64.03,64.04,
     6 65.00,65.01,65.02,65.03,65.04,
     7 66.00,66.01,66.02,66.03,66.04,
     8 67.00,67.01,67.02,67.03,67.04,
     9 68.00,68.01,68.02,68.03,68.04/
      DATA ELEMG/
     1 69.00,69.01,69.02,69.03,69.04,
     2 70.00,70.01,70.02,70.03,70.04,
     3 71.00,71.01,71.02,71.03,71.04,
     4 72.00,72.01,72.02,72.03,72.04,
     5 73.00,73.01,73.02,73.03,73.04,
     6 74.00,74.01,74.02,74.03,74.04,
     7 75.00,75.01,75.02,75.03,75.04,
     8 76.00,76.01,76.02,76.03,76.04,
     9 77.00,77.01,77.02,77.03,77.04,
     A 78.00,78.01,78.02,78.03,78.04,
     1 79.00,79.01,79.02,79.03,79.04,
     2 80.00,80.01,80.02,80.03,80.04,
     3 81.00,81.01,81.02,81.03,81.04,
     4 82.00,82.01,82.02,82.03,82.04,
     5 83.00,83.01,83.02,83.03,83.04,
     6 84.00,84.01,84.02,84.03,84.04,
     7 85.00,85.01,85.02,85.03,85.04,
     8 86.00,86.01,86.02,86.03,86.04,
     9 87.00,87.01,87.02,87.03,87.04/
      DATA ELEMH/
     1 88.00,88.01,88.02,88.03,88.04,
     2 89.00,89.01,89.02,89.03,89.04,
     3 90.00,90.01,90.02,90.03,90.04,
     4 91.00,91.01,91.02,91.03,91.04,
     5 92.00,92.01,92.02,92.03,92.04,
     6 93.00,93.01,93.02,93.03,93.04,
     7 94.00,94.01,94.02,94.03,94.04,
     8 95.00,95.01,95.02,95.03,95.04,
     9 96.00,96.01,96.02,96.03,96.04,
     A 97.00,97.01,97.02,97.03,97.04,
     1 98.00,98.01,98.02,98.03,98.04,
     2 99.00,99.01,99.02,99.03,99.04/
      DO 1 I=1,32768
    1 TABLOG(I)=10.**((I-16384)*.001)
      RATIOLOG=LOG(1.D0+1.D0/2000000.D0)
      OPEN(UNIT=11,STATUS='OLD',READONLY,SHARED,FORM='UNFORMATTED',
     1RECORDTYPE='FIXED',BLOCKSIZE=8000,RECORDSIZE=4,access='direct')
C
C     version 4JUN94
      LENTAP=10268732
      NSKIP=0
      START=50.
      STOP=50.01
      ISTART=DLOG(START)/RATIOLOG+.5
      ISTOP=DLOG(STOP)/RATIOLOG+.5
      DO 2 I100=2,103
      IF(ISTART.LT.I100000(I100))GO TO 5
    2 NSKIP=NSKIP+100000
    5 NSKIP1=NSKIP+1
      DO 20 N=NSKIP1,LENTAP
      READ(11,rec=n)IIIIIII
C       7824048 -4110 12896 22199 26979 11648  8950
C     IF COMPUTER REQUIRES BYTE ROTATION
C      DO 18 I=1,16,2
C      ONEBYTE=IIBYTE(I)
C      IIBYTE(I)=IIBYTE(I+1)
C   18 IIBYTE(I+1)=ONEBYTE
C      ONEBYTE=IIBYTE(1)
C      IIBYTE(1)=IIBYTE(3)
C      IIBYTE(3)=ONEBYTE
C      ONEBYTE=IIBYTE(2)
C      IIBYTE(2)=IIBYTE(4)
C      IIBYTE(4)=ONEBYTE
      IF(IWL.LT.ISTART)GO TO 20
      IF(IWL.GT.ISTOP)GO TO 21
C     IELION NEGATIVE = LINE HAS PREDICTED ENERGY LEVELS AND WAVELENGTH
C     IELION POSITIVE = LINE HAS MEASURED ENERGY LEVELS AND REAL WAVELENGTH
C     UNITS DIGIT IS FOR ISOTOPE, NOT USED AT PRESENT
      NELION=ABS(IELION)/10
      CODE=ELEM(NELION)
      WLVAC=EXP(IWL*RATIOLOG)
      IF(IELION.LT.0)WLVAC=-WLVAC
      GF=TABLOG(IGFLOG)
      ELO=TABLOG(IELO)
      GAMMAR=TABLOG(IGR)
      GAMMAS=TABLOG(IGS)
      GAMMAW=TABLOG(IGW)
      PRINT 19,N,WLVAC,CODE,GF,ELO,GAMMAR,GAMMAS,GAMMAW,
     1 IWL,IELION,IGFLOG,IELO,IGR,IGS,IGW
   19 FORMAT(I9,F10.4,F7.2,1PE11.3,0PF12.3,1P3E10.2,I12,6I6)
C 4188154  -50.0000  28.05  3.251E-04  653130.625  3.94E+10  1.84E-05  3.68E-08
C       7824048 -4110 12896 22199 26979 11648  8950
   20 CONTINUE
   21 CALL EXIT
      END
