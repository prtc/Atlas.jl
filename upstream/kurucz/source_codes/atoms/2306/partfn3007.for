      PROGRAM PARTFN3007
C     COMPUTES PARTITION FUNCTIONS FROM THE GFxxyy.GAM ENERGY LEVELS
      implicit real*8 (a-h,o-z)
      CHARACTER*10 ELABJE,ELABJO
      REAL*8 E(40000),G(40000)
      REAL*8 T(333),TLOG(333),PF(7,333),ELOW(7),PARTF(333,7)
      OPEN(UNIT=7,STATUS='NEW',CARRIAGECONTROL='LIST')
C 996 FORMAT(F5.2,I10,' lines saved',I10,' positive lines saved',I7,
C    1' even',I7,' odd levels',I10,' ion pot cm-1')
      READ(8,1)CODE,NLINES,NPOS,NE,NO,NION
    1 FORMAT(F5.2,I10,12X,I10,21X,I7,5X,I7,11X,I10)
      DO 987 ISKIP=1,27
  987 READ(8,1)
      DO 3 K=1,NE
      READ(8,2)EJE,XJE,ELABJE
      E(K)=ABS(EJE)
    3 G(K)=2.*XJE+1.
    2 FORMAT(5X,3X,4X,F12.3,F5.1,1X,A10,F7.3,1P3E9.2,0PF10.3)
      DO 4 K=1,NO
      READ(8,2)EJO,XJO,ELABJO
      E(K+NE)=ABS(EJO)
    4 G(K+NE)=2.*XJO+1.
      N=NE+NO
c
      do 44 k=N+1,N+420
      READ(9,2)EJO,XJO,ELABJO
      e(k)=abs(ejo)
   44 g(k)=2.*xjo+1.
      n=n+440
c
      ICODE=CODE
      ICHARGE=(CODE-ICODE)*100.+.5
      EION=NION
      ZEFF=ICHARGE+1
      ELOW(1)=EION-500.*ZEFF**2
      ELOW(2)=EION-1000.*ZEFF**2
      ELOW(3)=EION-2000.*ZEFF**2
      ELOW(4)=EION-4000.*ZEFF**2
      ELOW(5)=EION-8000.*ZEFF**2
      ELOW(6)=EION-16000.*ZEFF**2
      ELOW(7)=EION-32000.*ZEFF**2
      WRITE(7,75)CODE,NION
   75 FORMAT(F5.2,' partition function   ionization potential',
     1 I10,' cm-1')
      WRITE(7,76)(-250*2**I,I=1,7)
   76 FORMAT(37X,'potential lowering in cm-1/Zeff**2'/
     1 6X,'LOG10(T)     T',2X,7I10)
      DO 9 IT=1,333
C     LOG10(T)=2.00 by 0.01 to 5.32
      TLOG(IT)=2.+((IT-1)*.01)
      T(IT)=10.**TLOG(IT)
      HCKT=6.6256E-27*2.9979458E10/1.38054E-16/T(IT)
      PF(1,IT)=0.
      PF(2,IT)=0.
      PF(3,IT)=0.
      PF(4,IT)=0.
      PF(5,IT)=0.
      PF(6,IT)=0.
      PF(7,IT)=0.
      DO 8 I=1,N
      IF(E(I).GT.ELOW(1))GO TO 8
      BOLT=G(I)*EXP(-E(I)*HCKT)
      DO 5 ILOW=1,7
      IF(E(I).GT.ELOW(ILOW))GO TO 8
      PF(ILOW,IT)=PF(ILOW,IT)+BOLT
      PARTF(IT,ILOW)=PF(ILOW,IT)
    5 CONTINUE
    8 CONTINUE
      WRITE(7,77)CODE,TLOG(IT),T(IT),(PF(ILOW,IT),ILOW=1,7)
   77 FORMAT(F5.2,F7.2,F10.0,7F10.3)
    9 CONTINUE
      CALL EXIT
      END
