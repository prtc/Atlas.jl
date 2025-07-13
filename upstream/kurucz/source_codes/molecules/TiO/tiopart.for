      PROGRAM TIOPARTFN
      IMPLICIT REAL*8 (A-H,O-Z)
      REAL*4 XJ(269300),PF(5)
      REAL*8 E(269300,5)
      READ(1)E,XJ
      PRINT 2
      WRITE(7,2)
    2 FORMAT('  T  '
     1'      46TiO       47TiO       48TiO       49TiO       50TiO')
      DO 9 IT=10,6000,10
      T=IT
      DO 7 ISO=1,5
      PF(ISO)=0.
      DO 7 I=1,269300
    7 PF(ISO)=PF(ISO)+(XJ(I)+XJ(I)+1.)*EXP(-1.43877*E(I,ISO)/T)
      PRINT 8,IT,PF
      WRITE(7,8)IT,PF
    8 FORMAT(I5,5F12.3)
    9 CONTINUE
      CALL EXIT
      END
