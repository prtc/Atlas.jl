      PROGRAM REPACKDI
      IMPLICIT REAL*8 (A-H,O-Z)
      INTEGER*2 IELION,IELO,IGFLOG,IGR,IGS,IGW
      COMMON /IIIIIII/IWL,IELION,IELO,IGFLOG,IGR,IGS,IGW
      INTEGER*4 IIIIIII(4),PACK8000
      EQUIVALENCE (IIIIIII(1),IWL)
      COMMON /PACK8000/PACK8000(4,2000)
      DIMENSION MOLCODES(31),ISOX(31)
      DIMENSION NELIONOLD(1005)
      DIMENSION NELIONOLDA(209),NELIONOLDB(286),NELIONOLDC(95)
      DIMENSION NELIONOLDD( 95),NELIONOLDE( 95),NELIONOLDF(60)
      DIMENSION NELIONOLDG(165)
      EQUIVALENCE (NELIONOLD(  1),NELIONOLDA(1))
      EQUIVALENCE (NELIONOLD(210),NELIONOLDB(1))
      EQUIVALENCE (NELIONOLD(496),NELIONOLDC(1))
      EQUIVALENCE (NELIONOLD(591),NELIONOLDD(1))
      EQUIVALENCE (NELIONOLD(686),NELIONOLDE(1))
      EQUIVALENCE (NELIONOLD(781),NELIONOLDF(1))
      EQUIVALENCE (NELIONOLD(841),NELIONOLDG(1))
      DATA NELIONOLDA/
     1   1,  2,
     2   7,  8,  9,
     3  13, 14, 15, 16,
     4  19, 20, 21, 22, 23,
     5  25, 26, 27, 28, 29, 30,
     6  31, 32, 33, 34, 35, 36,0,
     7  37, 38, 39, 40, 41, 42,0,0,
     8  43, 44, 45, 46, 47, 48,0,0,0,
     9  49, 50, 51, 52, 53, 54,0,0,0,0,
     A  55, 56, 57, 58, 59, 60,0,0,0,0,0,
     1  61, 62, 63, 64, 65, 66,0,0,0,0,0,0,
     2  67, 68, 69, 70, 71, 72,0,0,0,0,0,0,0,
     3  73, 74, 75, 76, 77, 78,0,0,0,0,0,0,0,0,
     4  79, 80, 81, 82, 83, 84,0,0,0,0,0,0,0,0,0,
     5  85, 86, 87, 88, 89, 90,0,0,0,0,0,0,0,0,0,0,
     6  91, 92, 93, 94, 95, 96,0,0,0,0,0,0,0,0,0,0,0,
     7  97, 98, 99,100,101,  0,0,0,0,0,0,0,0,0,0,0,0,0,
     8 103,104,105,106,107,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,
     9 109,110,111,112,113,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0/
      DATA NELIONOLDB/
     A 115,116,117,118,119,120,299,359,419,479, 11*0,
     1 121,122,123,124,125,126,305,365,425,485, 12*0,
     2 127,128,129,130,131,132,311,371,431,491, 13*0,
     3 133,134,135,136,137,138,317,377,437,497, 14*0,
     4 139,140,141,142,143,144,323,383,443,503, 15*0,
     5 145,146,147,148,149,150,329,389,449,509, 16*0,
     6 151,152,153,154,155,156,335,395,455,515, 17*0,
     7 157,158,159,160,161,162,341,401,461,521, 18*0,
     8 163,164,165,166,167,168,347,407,467,527, 19*0,
     9 169,170,171,             27*0,
     A 175,176,177,             28*0/
      DATA NELIONOLDC/
     1 181,182,183,  0,  0,
     2 187,188,189,  0,  0,
     3 193,194,195,  0,  0,
     4 199,200,201,  0,  0,
     5 205,206,207,  0,  0,
     6 211,212,213,  0,  0,
     7 217,218,219,  0,  0,
     8 223,224,225,  0,  0,
     9 229,230,231,  0,  0,
     A 235,236,237,  0,  0,
     1 241,242,243,  0,  0,
     2 247,248,249,  0,  0,
     3 253,254,255,  0,  0,
     4 259,260,261,  0,  0,
     5 265,266,267,  0,  0,
     6 271,272,273,  0,  0,
     7 277,278,279,  0,  0,
     8 283,284,285,  0,  0,
     9 289,290,291,  0,  0/
      DATA NELIONOLDD/
     A 295,296,297,  0,  0,
     1 301,302,303,  0,  0,
     2 307,308,309,  0,  0,
     3 313,314,315,  0,  0,
     4 319,320,321,  0,  0,
     5 325,326,327,  0,  0,
     6 331,332,333,  0,  0,
     7 337,338,339,  0,  0,
     8 343,344,345,  0,  0,
     9 349,350,351,  0,  0,
     A 355,356,357,  0,  0,
     1 361,362,363,  0,  0,
     2 367,368,369,  0,  0,
     3 373,374,375,  0,  0,
     4 379,380,381,  0,  0,
     5 385,386,387,  0,  0,
     6 391,392,393,  0,  0,
     7 397,398,399,  0,  0,
     8 403,404,405,  0,  0/
      DATA NELIONOLDE/
     9 409,410,411,  0,  0,
     A 415,416,417,  0,  0,
     1 421,422,423,  0,  0,
     2 427,428,429,  0,  0,
     3 433,434,435,  0,  0,
     4 439,440,441,  0,  0,
     5 445,446,447,  0,  0,
     6 451,452,453,  0,  0,
     7 457,458,459,  0,  0,
     8 463,464,465,  0,  0,
     9 469,470,471,  0,  0,
     A 475,476,477,  0,  0,
     1 481,482,483,  0,  0,
     2 487,488,489,  0,  0,
     3 493,494,495,  0,  0,
     4 499,500,501,  0,  0,
     5 505,506,507,  0,  0,
     6 511,512,513,  0,  0,
     7 517,518,519,  0,  0/
      DATA NELIONOLDF/
     8 523,524,525,  0,  0,
     9 529,530,531,  0,  0,
     A 535,536,537,  0,  0,
     1 541,542,543,  0,  0,
     2 547,548,549,  0,  0,
     3 553,554,555,  0,  0,
     4 559,560,561,  0,  0,
     5 565,566,567,  0,  0,
     6 571,572,573,  0,  0,
     7 577,578,579,  0,  0,
     8 583,584,585,  0,  0,
     9 589,590,591,  0,  0/
c     H2     841   240
c     HeH    842
c     LiH    843   378
c     BeH    844   384
c     BH     845   390
c     CH     846   246
c     NH     847   252
c     OH     848   258
c     HF     849   396
c     NaH    850
c     MgH    851   300
c     AlH    852   306
c     SiH    853   312
c     PH     854   402
c     HS     855   336
c     HCl    856   408
c     KH     857
c     CaH    858   342
c     ScH    859   414
c     TiH    860   420
c     VH     861   426
c     CrH    862   432
c     MnH    863   438
c     FeH    864   444
c     CoH    865   558
c     NiH    866   564
c     CuH    867   570
c     C2     868   264
c     CN     869   270
c     CO     870   276
c     CF     871
c     SiC    872
c     CP     873
c     CS     874
c     N2     875   282
c     NO     876   288
c     NF     877
c     SiN    878
c     PN     879
c     NS     880
c     LiO    881
c     BeO    882   492
c     BO     883   498
c     O2     884   294
c     FO     885
c     NaO    886
c     MgO    887   318
c     AlO    888   324
c     SiO    889   330
c     PO     890   504
c     SO     891   348
c     ClO    892   510
c     CaO    893   354
c     ScO    894   360
c     TiO    895   366
c     VO     896   372
c     CrO    897   516
c     MnO    898   522
c     FeO    899   528
c     CoO    900   576
c     NiO    901   582
c     CuO    902   588
c     GeO    903
c     SrO    904
c     YO     905
c     ZrO    906
c     NbO    907
c     Si2    908
c     SiS    909
c     S2     910
c     TiS    911
c     ZrS    912
c     H2+    913
c     HeH+   914
c     LiH+   915
c     CH+    916   450
c     NH+    917   456
c     OH+    918   462
c     HF+    919
c     NeH+   920
c     MgH+   921   468
c     AlH+   922   474
c     SiH+   923   480
c     PH+    924
c     SH+    925
c     HCl+   926
c     CaH+   927   486
c     He2+   928
c     C2+    929
c     CN+    930
c     CO+    931   594
c     N2+    932
c     NO+    933
c     NS+    934
c     O2+    935
c     SiO+   936
c     PO+    937
c     SO+    938
c     S2+    939
c     H2O    940   534
c     CO2    941   540
c     CH2    942   546
c     C2H    943
c     C2N    944
c     C3     945   552
c     O3     946
c     NO2    947
c     N2O    948
c     NH2    949
c     HCO    950
c     HCN    951
c     HNO    952
c     SiC2   953
c     NaOH   954
c     MgOH   955
c     AlOH   956
c     KOH    957
c     CaOH   958
c     AlOF   959
c     AlOCl  960
c     Al2O   961
c     SH2    962
c     CaF2   963
c     CaCl2  964
c     COS    965
c     SiO2   966
c     SO2    967
c     TiO2   968
c     VO2    969
c     NH3    970
c     CH3    971
c     C2H2   972
c     C3H    973
c     C2N2   974
c     CH4    975
c     H-     976
c     Li-    977
c     C-     978
c     O-     979
c     F-     980
c     Na-    981
c     Al-    982
c     Si-    983
c     P-     984
c     S-     985
c     Cl-    986
c     K-     987
c     Sc-    988
c     Ti-    989
c     V-     990
c     Cr-    991
c     Fe-    992
c     Co-    993
c     Ni-    994
c     Cu-    995
c     C2-    996
c     CH-    997
c     CN-    998
c     CO-    999
c     N2-   1000
c     NO-   1001
c     OH-   1002
c     O2-   1003
c     S2-   1004
c     SH-   1005
C
      DATA NELIONOLDG/
     1 240,  0,378,384,390,246,252,258,396,  0,
     2 300,306,312,402,336,408,  0,342,414,420,
     3 426,432,438,444,558,564,570,264,270,276,
     4   0,  0,  0,  0,282,288,  0,  0,  0,  0,
     5   0,492,498,294,  0,  0,318,324,330,504,
     6 348,510,354,360,366,372,516,522,528,576,
     7 582,588,  0,  0,  0,  0,  0,  0,  0,  0,
     8   0,  0,  0,  0,  0,450,456,462,  0,  0,
     9 468,474,480,  0,  0,  0,486,  0,  0,  0,
     A 594,  0,  0,  0,  0,  0,  0,  0,  0,534,
     1 540,546,  0,  0,552,  0,  0,  0,  0,  0,
     2   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     3   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     4   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     5   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     6   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
     7   0,  0,  0,  0,  0/
      DATA MOLCODES/
     1 8410, 8460, 8461, 8470, 8471, 8480, 8481, 8482, 8510, 8511,
     2 8512, 8530, 8531, 8532, 8680, 8681, 8682, 8690, 8691, 8692,
     3 8693, 8700, 8701, 8702, 8703, 8704, 8705, 8890, 8891, 8892, 8896/
C
C     DIATOMICS
C     H2
      ISOX(01)=-0
C     12CH
      ISOX(02)=-005
C     13CH
      ISOX(03)=-1955
C     14NH
      ISOX(04)=-002
C     15NH
      ISOX(05)=-2444
C     16OH
      ISOX(06)=-001
C     17OH
      ISOX(07)=-3398
C     18OH
      ISOX(08)=-2690
C     24MgH
      ISOX(09)=-105
C     25MgH
      ISOX(10)=-996
C     26MgH
      ISOX(11)=-947
C     28SiH
      ISOX(12)=-035
C     29SiH
      ISOX(13)=-1331
C     30SiH
      ISOX(14)=-1516
C     12C12C
      ISOX(15)=-005-005
C     12C13C
      ISOX(16)=-005-1955
C     13C13C
      ISOX(17)=-1955-1955
C     12C14N
      ISOX(18)=-005-002
C     13C14N
      ISOX(19)=-1955-002
C     12C15N
      ISOX(20)=-005-2444
C     13C15N
      ISOX(21)=-1955-2444
C     12C16O
      ISOX(22)=-005-001
C     13C16O
      ISOX(23)=-1955-001
C     12C17O
      ISOX(24)=-005-3398
C     13C17O
      ISOX(25)=-1955-3398
C     12C18O
      ISOX(26)=-005-2690
C     13C18O
      ISOX(27)=-1955-2690
C     28Si16O
      ISOX(28)=-001-035
C     29SI16O
      ISOX(29)=-001-1331
C     30SI16O
      ISOX(30)=-001-1516
C     28Si18O
      ISOX(31)=-2690-035
      RATIOLOG=LOG(1.D0+1.D0/2000000.D0)
      RATIOLG=LOG(1.D0+1.D0/500000.D0)
      WLBEG=8.97666
      WLEND=10000.
      IXWLBEG=DLOG(WLBEG)/RATIOLG
      IF(DEXP(IXWLBEG*RATIOLG).LT.WLBEG)IXWLBEG=IXWLBEG+1
      IWLSTART=DLOG(WLBEG)/RATIOLOG+.5
      IWLSTOP=DLOG(WLEND)/RATIOLOG+.5
      NLINES=0
      OPEN(UNIT=11,TYPE='OLD',FORM='UNFORMATTED',
     1RECORDTYPE='FIXED',BLOCKSIZE=8000,RECL=4)
      OPEN(UNIT=12,TYPE='NEW',FORM='UNFORMATTED',
     1RECORDTYPE='FIXED',BLOCKSIZE=32000,RECL=8000)
      MOLCODEOLD=0
      DO 5 LINE=1,50000000
      READ(11,END=11)IIIIIII
      IF(IWL.LT.IWLSTART)GO TO 5
      IF(IWL.GT.IWLSTOP)GO TO 5
      MOLCODE=ABS(IELION)
      KGFLOG=IGFLOG
      IGS=1
      IF(MOLCODE.EQ.MOLCODEOLD)GO TO 8
      MOLCODEOLD=MOLCODE
      DO 7 IMOL=1,31
      IF(MOLCODE.EQ.MOLCODES(IMOL))GO TO 8
    7 CONTINUE
      PRINT 9,N,IIIIIII
    9 FORMAT(9I12)
      CALL ABORT
    8 IGFLOG=MAX(KGFLOG+ISOX(IMOL),1)
      NELION=ABS(IELION/10)
      NELIONNEW=ABS(IELION)/10
      IELION=NELIONOLD(NELIONNEW)
      WLVAC=EXP(IWL*RATIOLOG)
      IXWL=DLOG(WLVAC)/RATIOLG+.5D0
      IWL=IXWL-IXWLBEG+1
      CALL PACK(IIIIIII)
      NLINES=NLINES+1
    5 CONTINUE
   11 PRINT 1,NLINES
    1 FORMAT(I10,' LINES FROM DIATOMICS')
      CALL PACK(0)
      CALL EXIT
      END
      SUBROUTINE PACK(IIIIIII)
      INTEGER*4 PACK8000,IIIIIII(4)
      COMMON /PACK8000/PACK8000(4,2000)
      DATA IREC/0/
      IF(IIIIIII(1).EQ.0)GO TO 11
      IREC=IREC+1
      PACK8000(1,IREC)=IIIIIII(1)
      PACK8000(2,IREC)=IIIIIII(2)
      PACK8000(3,IREC)=IIIIIII(3)
      PACK8000(4,IREC)=IIIIIII(4)
      IF(IREC.EQ.2000)THEN
      WRITE(12)PACK8000
      IREC=0
      ENDIF
      RETURN
   11 WRITE(12)PACK8000
      IREC=0
      RETURN
      END
