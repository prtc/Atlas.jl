      PROGRAM RGFIRON
c     revised 6apr93
C     READS GFIRON LINES ON UNIT 11
C     READ DELETIONS ON UNIT 26 AS CARD IMAGES
      PARAMETER (kw=99)
      COMMON /LINDAT/WL,E,EP,LABEL(2),LABELP(2),OTHER1(2),OTHER2(2),
     1        WLVAC,CENTER,CONCEN, NELION,GAMMAR,GAMMAS,GAMMAW,REF,
     2      NBLO,NBUP,ISO1,X1,ISO2,X2,GFLOG,XJ,XJP,CODE,ELO,GF,GS,GR,GW,
     3        DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,EXTRA1,EXTRA2,EXTRA3
      REAL*8 LINDAT8(14)
      REAL*4 LINDAT(28)
      EQUIVALENCE (LINDAT8(1),WL),(LINDAT(1),NELION)
      REAL*8 RESOLU,RATIO,RATIOLG,SIGMA2,WLBEG,WLEND
      REAL*8 WL,E,EP,WLVAC,CENTER,CONCEN
      REAL*8 LABEL,LABELP,OTHER1,OTHER2
      DIMENSION NDELET(50000),NELDLT(594),DECKJ(7,kw)
      COMMON /POTION/POTION(594)
      DIMENSION IN9(9),IN16(16),IN14(14)
      DIMENSION WL10(39)
      DIMENSION NTENS(10)
      DATA NTENS/1,10,100,1000,10000,100000,1000000,10000000,
     1 100000000,1000000000/
      DATA WL10/ 
     1  30.,  44.,  60.,  76.,  90., 101., 112., 122., 131., 140.,
     2 149., 160., 171., 184., 199., 216., 233., 249., 267., 287.,
     3 310., 334., 360., 390., 422., 455., 497., 546., 607., 679.,
     4 765., 871.,1001.,1213.,1499.,1852.,2444.,3562.,6367./
      OPEN(UNIT=11,STATUS='OLD',READONLY,SHARED,FORM='UNFORMATTED',
     1RECORDTYPE='FIXED',BLOCKSIZE=8000,RECORDSIZE=20)
      OPEN(UNIT=12,TYPE='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
      OPEN(UNIT=13,TYPE='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
      OPEN(UNIT=26,TYPE='OLD',READONLY,SHARED)
      CALL BEGTIME
      READ(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,
     1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT,NDELET,NELDLT
      IXWLBEG=DLOG(WLBEG)/RATIOLG
      IF(DEXP(IXWLBEG*RATIOLG).LT.WLBEG)IXWLBEG=IXWLBEG+1
C
      WRITE(6,2049)
 2049 FORMAT(' BEGINNING TO READ DELETEGFIRON ON 26')
C     DELETE LINES BY NUMBER
 2101 READ(26,2102)IN9,A,B
 2102 FORMAT(12X,9I7,A4,A1)
      WRITE(6,2132)IN9,A,B
 2132 FORMAT(1X,12HDELETE LINES,9I7,1X,A4,A1)
      DO 2103 I=1,9
      IF(IN9(I).LT.0)GO TO 2104
      IF(IN9(I).EQ.0)GO TO 2103
      NDLT=IN9(I)
      NDELET(NDLT/10+1)=NDELET(NDLT/10+1)+NTENS(MOD(NDLT,10)+1)
 2103 CONTINUE
      GO TO 2101

C     DELETE ELEMENTS BY NELION NUMBER
 2104 READ(26,2105)IN16
 2105 FORMAT(13X,16I4)
      WRITE(6,2125)IN16
 2125 FORMAT(1X,13HDELETE NELION,16I4)
      DO 2106 I=1,16
      IF(IN16(I).LT.0)GO TO 2107
      IF(IN16(I).EQ.0)GO TO 2106
      NELION=IN16(I)
      NELDLT(NELION)=0
 2106 CONTINUE
      GO TO 2104

C     DELETE ALL BUT ELEMENTS WITH NELION NUMBERS
 2107 READ(26,2108)IN14
 2108 FORMAT(22X,14I4)
      WRITE(6,2128)IN14
 2128 FORMAT(1X,22HDELETE ALL NELIONS BUT,14I4)
      IF(IN14(1).EQ.0)GO TO 2111
      DO 2109 NELION=1,594
 2109 NELDLT(NELION)=0
      DO 2110 I=1,14
      IF(IN14(I).EQ.0)GO TO 2110
      NELION=IN14(I)
      NELDLT(NELION)=1
 2110 CONTINUE
 2111 CONTINUE
C
      WRITE(6,1)
    1 FORMAT(' BEGINNING TO READ GFIRON LINES ON 11')
C     version 8Sept88
      LENTAP=403107
      REF=2HK 
      NBLO=0
      NBUP=0
      ISO1=0
      X1=0.
      ISO2=0
      X2=0.
      OTHER1(1)=(8H        )
      OTHER1(2)=(2H  )
C      GR=0.
C      GS=0.
C      GW=0.
      NSKIP=0
      IFANY=0
      START=WLBEG-1.
      STOP=WLEND+1.
      DO 2 I10000=1,39
      IF(START.LT.WL10(I10000))GO TO 3
    2 NSKIP=NSKIP+10000
    3 IF(NSKIP.EQ.0)GO TO 5
      DO 4 I=1,NSKIP
    4 READ(11)
    5 NSKIP1=NSKIP+1
      DO 20 N=NSKIP1,LENTAP
      READ(11)WL,GFLOG,E,EP,CODE,LABEL,LABELP,JJJJ,GR,GS,GW
      WLVAC=WL
      IF(IFVAC.EQ.1)WLVAC=1.D7/DABS(EP-E)
      IF(WLVAC.LT.START)GO TO 20
      IF(IFANY.EQ.0)WRITE(6,6)N
    6 FORMAT(I10,14H IS FIRST LINE)
      IFANY=1
C
C      PRINT 7,N,WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,GR,GS,GW
C    7 FORMAT(I10,F10.4,F7.3,F4.1,F13.3,F4.1,F13.3,F9.2,1X,A8,A2,
C     1 1X,A8,A2,3F8.3)
C
      IF(WLVAC.GT.STOP)GO TO 21
      ND=NDELET(N/10+1)
      IF(ND.GT.0)THEN
      IF(MOD(ND/NTENS(MOD(N,10)+1),10).GT.0)GO TO 20
      ENDIF
      NELEM=CODE
      IZEFF=(CODE-FLOAT(NELEM))*100.+.5
C************      
      IF(IZEFF.GT.4)GO TO 20
C************
      NELION=NELEM*6-6+IZEFF+1
      IF(NELDLT(NELION).EQ.0)GO TO 20
      ION=IZEFF+1
      J=JJJJ/1000
      JP=JJJJ-J*1000
      XJ=FLOAT(J)*.5
      XJP=FLOAT(JP)*.5
      GF=EXP(GFLOG*2.30258509299405E0)
      ELO=DMIN1(DABS(E),DABS(EP))
      EUP=DMAX1(DABS(E),DABS(EP))
C      ZEFF=ION
C      EFFNSQ=25.
C      DELEUP=POTION(NELION)-EUP
C      IF(DELEUP.GT.0.)EFFNSQ=109737.31*ZEFF**2/DELEUP
C      EFFNSQ=AMIN1(EFFNSQ,100.)
CC     GAMMAS=1.0E-8*EFFN**5
C      GAMMAS=1.0E-8*EFFNSQ**2*SQRT(EFFNSQ)
C      RSQ=2.5*(EFFNSQ/ZEFF)**2
C     ASSUMING RESONANCE LINES ARE TO 4P
C      NSEQ=NELEM-ION+1
C      IF(NSEQ.GT.20.AND.NSEQ.LT.29)RSQ=(45.-FLOAT(NSEQ))/ZEFF
C      GAMMAW=4.5E-9*RSQ**.4
C      GAMMAR=2.223E13/WLVAC**2
      IXWL=DLOG(WLVAC)/RATIOLG+.5D0
      NBUFF=IXWL-IXWLBEG+1
      FREQ=2.99792458E17/WLVAC
      CONGF=.01502*GF/FREQ
      FRQ4PI=FREQ*12.5664
      GAMMAR=EXP(GR*2.30258509299405E0)
      GAMMAS=EXP(GS*2.30258509299405E0)
      GAMMAW=EXP(GW*2.30258509299405E0)
      GAMRF=GAMMAR/FRQ4PI
      GAMSF=GAMMAS/FRQ4PI
      GAMWF=GAMMAW/FRQ4PI
C      GR=ALOG10(GAMMAR)
C      GS=ALOG10(GAMMAS)
C      GW=ALOG10(GAMMAW)
C      WRITE(6,8888)NLINES,NBUFF,GF,FREQ,CONGF,NELION,ELO,GAMRF,GAMSF,
C     1GAMWF,WL
C 8888 FORMAT(2I10,1P3E12.3,I10,4E12.3,0PF10.4)
      WRITE(12)NBUFF,CONGF,NELION,ELO,GAMRF,GAMSF,GAMWF
      ENCODE(10,17,OTHER2)N
   17 FORMAT(I10)
      IF(LINOUT.GE.0)WRITE(13)LINDAT8,LINDAT
      NLINES=NLINES+1
   20 CONTINUE
   21 WRITE(6,22)N
   22 FORMAT(I10,13H IS LAST LINE)
   25 WRITE(6,26)NLINES
   26 FORMAT(I10,25H LINES WRITTEN ON TAPE 12)
      REWIND 93
      WRITE(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,
     1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT,NDELET,NELDLT
      CALL ENDTIME
      CALL EXIT
      END
      SUBROUTINE IONPOTS
C
C     Moore, C.E., NSRDS-NBS 34,1970,22pp.
C     AEL, rare-earth elements, 1978,NSRDS-NBS 60,411pp.
C     Kelley,R.L. and Harrison, D.E, Atomic Data 3,177-193,1971.  Ga V,VI,Ge VI
C     Martin,W.C. et al. ,JPCRDa,3,771-780,1974.  Ac I-Es I
C     Guess 55.02 56.02 73.01 73.02 74.01 74.02 75.01 75.02 76.01 76.01 
C     Guess 77.01 77.02 78.02 79.02 84.01 84.02 85.00 85.01 85.02 86.01 86.02
C     Guess 87.00 87.01 87.02 88.02 89.02 91.01 91.02 92.01 92.02 93.01 93.02 
C     Guess 94.01 94.02 95.01 95.02 96.01 96.02 97.01 97.02 98.01 98.02 
C     Guess 99.01 99.02
C
      COMMON /POTION/POTION(594)
      DIMENSION POTA(114),POTB(114),POTC(114),POTD(114),POTE(114)
      DIMENSION POTF(24)
      EQUIVALENCE (POTION(1),POTA(1)),(POTION(115),POTB(1))
      EQUIVALENCE (POTION(229),POTC(1)),(POTION(343),POTD(1))
      EQUIVALENCE (POTION(457),POTE(1)),(POTION(571),POTF(1))
      DATA POTA/
     1  109678.764,      0.   ,      0.  ,      0. ,      0. ,      0. ,       1
     2  198310.76 , 438908.85 ,      0.  ,      0. ,      0. ,      0. ,       2
     3   43487.150, 610079.0  , 987660.1 ,      0. ,      0. ,      0. ,       3
     4   75192.07 , 146882.86 ,1241259.4 ,1756018.7,      0. ,      0. ,       4
     5   66928.10 , 202887.4  , 305931.1 ,2092001.4,2744105.1,      0. ,       5
     6   90820.42 , 196664.7  , 386241.0 , 520178.4,3162395. ,3952061.4,       6
     7  117225.4  , 238750.5  , 382704.  , 624866. , 789537.2,4452758. ,       7
     8  109837.02 , 283240.   , 443086.  , 624383.8, 918657. ,1114008. ,       8
     9  140524.5  , 282058.6  , 505777.  , 702830. , 921430. ,1267622. ,       9
     T  173929.70 , 330391.0  , 511800.  , 783300. ,1018000. ,1273800. ,      10
     1   41449.44 , 381395.   , 577800.  , 797800. ,1116200. ,1388500. ,      11
     2   61671.02 , 121267.61 , 646410.  , 881100. ,1139400. ,1504300. ,      12
     3   48278.37 , 151860.4  , 229445.71, 967800. ,1239800. ,1536300. ,      13
     4   65747.5  , 131838.4  , 270139.3 , 364093.1,1345100. ,1653900. ,      14
     5   84580.   , 159100.   , 243400.  , 414312.4, 524460. ,1777900. ,      15
     6   83558.0  , 188200.   , 280900.  , 381541.4, 586200. , 710184. ,      16
     7  104591.0  , 192070.   , 319500.  , 431226. , 547000. , 782600. ,      17
     8  127109.9  , 222848.2  , 328600.  , 482400. , 605100. , 734040. ,      18
     9   35009.77 , 255076.   , 368800.  , 491300. , 666700. , 806600. /      19
      DATA POTB/
     1   49305.72 ,  95751.87 , 410614.1 , 541200. , 680800. , 877400. ,      20
     2   52750.   , 103240.   , 199700.  , 592600. , 739300. , 896000. ,      21
     3   55010.   , 109506.   , 221735.  , 348973. , 800300. , 962700. ,      22
     4   54400.   , 118200.   , 236400.  , 376730. , 526100. ,1033400. ,      23
     5   54570.   , 133060.   , 249700.  , 396000. , 559000. , 730400. ,      24
     6   59970.   , 126145.   , 271550.  , 413000. , 584000. , 766000. ,      25
     7   63480.   , 130524.   , 247221.  , 442000. , 604900. , 798500. ,      26
     8   63430.   , 137572.   , 270200.  , 413800. , 641200. , 823000. ,      27
     9   61579.   , 146541.56 , 283700.  , 442800. , 609000. , 871000. ,      28
     T   62317.2  , 163669.2  , 297100.  , 445124. , 644500. , 831000. ,      29
     1   75768.10 , 144892.6  , 320390.  , 479100. , 666000. , 871000. ,      30
     2   48387.63 , 165458.   , 247700.  , 517600. , 726000. , 944000. ,      31
     3   63715.   , 128521.3  , 276036.  , 368701. , 753800. , 968000. ,      32
     4   79165.   , 150290.   , 228670.  , 404369. , 505136. ,1028800. ,      33
     5   78658.22 , 170900.   , 248583.  , 346375. , 551000. , 658994. ,      34
     6   95284.8  , 175870.   , 289529.  , 381600. , 481600. , 714800. ,      35
     7  112914.5  , 196474.8  , 298020.  , 423600. , 522000. , 633300. ,      36
     8   33690.81 , 220048.   , 320000.  , 424400. , 572800. , 680900. ,      37
     9   45932.0  ,  88964.0  , 351800.  , 460000. , 577700. , 732600. /      38
      DATA POTC/
     1   51447.   ,  98690.   , 165500.  , 498600. , 621200. , 750300. ,      39
     2   55145.   , 105900.   , 185400.  , 276970. , 657600. ,      0. ,      40
     3   55511.   , 115500.   , 202000.  , 308600. , 407700. , 827300. ,      41
     4   57260.   , 130300.   , 219100.  , 374180. , 493360. , 549000. ,      42
     5   58700.   , 123100.   , 238300.  ,      0. ,      0. ,      0. ,      43
     6   59410.   , 135200.   , 229600.  ,      0. ,      0. ,      0. ,      44
     7   60197.   , 145800.   , 250500.  ,      0. ,      0. ,      0. ,      45
     8   67236.   , 156700.   , 265600.  ,      0. ,      0. ,      0. ,      46
     9   61106.50 , 173300.   , 280900.  ,      0. ,      0. ,      0. ,      47
     T   72538.8  , 136374.74 , 302300.  ,      0. ,      0. ,      0. ,      48
     1   46670.11 , 152195.   , 226100.  , 439000. ,      0. ,      0. ,      49
     2   59231.8  , 118017.0  , 246020.0 , 328550. , 583000. ,      0. ,      50
     3   69700.   , 133327.5  , 204248.  , 356156. , 449300. , 868000. ,      51
     4   72667.   , 150000.   , 225500.  , 301776. , 473900. , 570000. ,      52
     5   84295.1  , 154304.   , 266000.  ,      0. ,      0. ,      0. ,      53
     6   97834.0  , 171068.4  , 259089.  ,      0. ,      0. ,      0. ,      54
     7   31406.432, 202263.   , 280000.  ,      0. ,      0. ,      0. ,      55
     8   42035.14 ,  80686.87 , 300000.  ,      0. ,      0. ,      0. ,      56
     9   44981.   ,  89200.   , 154675.  , 402900. , 497000. ,      0. /      57
      DATA POTD/
     1   44672.   ,  87500.   , 162903.  , 296470. , 528700. , 626000. ,      58
     2   44070.   ,  85100.   , 174407.  , 314400. , 464000. ,      0. ,      59
     3   44562.   ,  86500.   , 178600.  , 326000. ,      0. ,      0. ,      60
     4   44800.   ,  87900.   , 180000.  , 331000. ,      0. ,      0. ,      61
     5   45519.   ,  89300.   , 189000.  , 334000. ,      0. ,      0. ,      62
     6   45734.9  ,  90665.   , 201000.  , 344000. ,      0. ,      0. ,      63
     7   49603.   ,  97500.   , 166400.  , 355000. ,      0. ,      0. ,      64
     8   47295.   ,  92900.   , 176700.  , 317500. ,      0. ,      0. ,      65
     9   47900.   ,  94100.   , 183800.  , 334000. ,      0. ,      0. ,      66
     T   48567.   ,  95200.   , 184200.  , 343000. ,      0. ,      0. ,      67
     1   49262.   ,  96200.   , 183400.  , 344000. ,      0. ,      0. ,      68
     2   49879.8  ,  97200.   , 191000.  , 344000. ,      0. ,      0. ,      69
     3   50441.0  ,  98269.   , 202070.  , 351300. ,      0. ,      0. ,      70
     4   43762.39 , 112000.   , 169049.  , 364960. , 538700. ,      0. ,      71
     5   56600.   , 120000.   , 187800.  , 268500. ,      0. ,      0. ,      72
     6   63600.   , 131000.   , 194000.  ,      0. ,      0. ,      0. ,      73
     7   64400.   , 143000.   , 202000.  ,      0. ,      0. ,      0. ,      74
     8   63530.   , 134000.   , 210000.  ,      0. ,      0. ,      0. ,      75
     9   70450.   , 137000.   , 218000.  ,      0. ,      0. ,      0. /      76
      DATA POTE/
     1   73000.   , 161000.   , 226000.  ,      0. ,      0. ,      0. ,      77
     2   72300.   , 149723.   , 234000.  ,      0. ,      0. ,      0. ,      78
     3   74410.   , 165000.   , 242000.  ,      0. ,      0. ,      0. ,      79
     4   84184.1  , 151280.   , 276000.  ,      0. ,      0. ,      0. ,      80
     5   49266.7  , 164765.   , 240600.  ,      0. ,      0. ,      0. ,      81
     6   59819.4  , 121243.   , 257592.  , 341350. , 555000. ,      0. ,      82
     7   58790.   , 134600.   , 206180.  , 365500. , 451700. , 712000. ,      83
     8   67885.3  , 153000.   , 218000.  ,      0. ,      0. ,      0. ,      84
     9   75000.   , 161000.   , 242000.  ,      0. ,      0. ,      0. ,      85
     T   86692.5  , 161000.   , 242000.  ,      0. ,      0. ,      0. ,      86
     1   32000.   , 177000.   , 266000.  ,      0. ,      0. ,      0. ,      87
     2   42577.35 , 81842.31  , 274000.  ,      0. ,      0. ,      0. ,      88
     3   41700.   , 97300.    , 161000.  ,      0. ,      0. ,      0. ,      89
     4   49000.   , 93000.    , 161000.  , 231900. ,      0. ,      0. ,      90
     5   47500.   , 95000.    , 161000.  ,      0. ,      0. ,      0. ,      91
     6   48800.   , 95000.    , 161000.  ,      0. ,      0. ,      0. ,      92
     7   49900.   , 95000.    , 161000.  ,      0. ,      0. ,      0. ,      93
     8   48900.   , 95000.    , 161000.  ,      0. ,      0. ,      0. ,      94
     9   48300.   , 95000.    , 161000.  ,      0. ,      0. ,      0. /      95
      DATA POTF/
     1   48600.   , 95000.    , 161000.  ,      0. ,      0. ,      0. ,      96
     2   50200.   , 95000.    , 161000.  ,      0. ,      0. ,      0. ,      97
     3   50800.   , 95000.    , 161000.  ,      0. ,      0. ,      0. ,      98
     4   51800.   , 95000.    , 161000.  ,      0. ,      0. ,      0. /      99
      RETURN
      END
