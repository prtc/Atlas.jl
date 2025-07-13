      PROGRAM H2OPARTFN
      IMPLICIT REAL*8 (A-H,O-Z)
      REAL*8 E(273201)
C             E(CM-1)   P S  J KP KO V1 V2 V3
C161      1  3755.95509 1 1  0  0  0  0  0  1
      INTEGER*4 QUANTUMS(8,273201)
      REAL*4 PF(4),WT(273201)
C     READ(1)E,QUANTUM
      READ(1,1)
      READ(1,1)
      READ(1,1)
      READ(1,1)
      DO 2 I=1,273201
      READ(1,1)E(I),(QUANTUMS(K,I),K=1,8)
    1 FORMAT(10X,F12.5,2I2,6I3)
      WT(I)=2.*QUANTUMS(3,I)+1.
      IF(QUANTUMS(2,I).EQ.1)WT(I)=WT(I)*3
    2 CONTINUE
      PRINT 3
      WRITE(7,3)
    3 FORMAT('  T      1H1H16O      1H1H17O      1H1H18O      1H2H16O'/
     1'          170625       30215        30445        42016 levels')
      DO 9 IT=10,6000,10
      T=IT
      PF(1)=0.
      DO 4 I=1,170625
    4 PF(1)=PF(1)+WT(I)*EXP(-1.43877*E(I)/T)
      PF(2)=0.
      DO 5 I=170626,200840
    5 PF(2)=PF(2)+WT(I)*EXP(-1.43877*E(I)/T)
      PF(3)=0.
      DO 6 I=200841,231285
    6 PF(3)=PF(3)+WT(I)*EXP(-1.43877*E(I)/T)
      PF(4)=0.
      DO 7 I=231286,273201
    7 PF(4)=PF(4)+WT(I)*EXP(-1.43877*E(I)/T)
      PRINT 8,IT,PF
      WRITE(7,8)IT,PF
    8 FORMAT(I5,4F12.3)
    9 CONTINUE
      CALL EXIT
      END
