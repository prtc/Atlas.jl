C     ==================================================================
C     VOIGT PROFILE REFERENCE DATA GENERATOR
C     ==================================================================
C     Purpose: Generate reference Voigt profile values for Julia validation
C     Output: voigt_fortran.csv
C
C     This program calls the Fortran VOIGT function from atlas12.for
C     and generates a CSV file with test cases covering the parameter space.
C
C     Usage:
C       1. Compile with atlas12.for:
C          gfortran -o test_voigt test_voigt.f atlas12.for
C       2. Run:
C          ./test_voigt
C       3. Output: voigt_fortran.csv
C
C     Author: Claude (AI Assistant)
C     Date: 2025-11-15
C     ==================================================================

      PROGRAM TEST_VOIGT
      IMPLICIT REAL*4 (A-H,O-Z)

C     Include Voigt profile tables
      COMMON /H1TAB/H0TAB(2001),H1TAB(2001),H2TAB(2001)

C     Initialize Voigt tables
      CALL TABVOIGT(200, 2001)

C     Open output CSV file
      OPEN(10, FILE='voigt_fortran.csv', STATUS='REPLACE')
      WRITE(10,*) 'v,a,voigt_value'

C     ==================================================================
C     Test Grid Coverage
C     ==================================================================
C     v (velocity in Doppler widths): 0.0 to 10.0
C     a (damping parameter): 0.0, 0.001, 0.01, 0.1, 1.0, 10.0
C
C     This covers all Fortran regimes:
C     - Regime 1 (core): a < 0.2, |v| + a < 1.5
C     - Regime 2 (wing): a > 1.4 or a + |v| > 3.2
C     - Regime 3 (transition): everything else
C     ==================================================================

C     Test points for v (101 points from 0 to 10)
      DO IV = 0, 100
        V = FLOAT(IV) * 0.1

C       Test points for a (7 values covering all regimes)
        DO IA = 1, 7
          IF(IA.EQ.1) A = 0.0
          IF(IA.EQ.2) A = 0.001
          IF(IA.EQ.3) A = 0.01
          IF(IA.EQ.4) A = 0.1
          IF(IA.EQ.5) A = 1.0
          IF(IA.EQ.6) A = 10.0
          IF(IA.EQ.7) A = 100.0

C         Call Fortran VOIGT function
          H = VOIGT(V, A)

C         Write to CSV
          WRITE(10,100) V, A, H
        ENDDO
      ENDDO

  100 FORMAT(F8.4,',',F12.6,',',E20.12)

      CLOSE(10)

      WRITE(*,*) 'Generated voigt_fortran.csv with 707 test cases'
      WRITE(*,*) 'v range: 0.0 to 10.0 (101 points)'
      WRITE(*,*) 'a values: 0.0, 0.001, 0.01, 0.1, 1.0, 10.0, 100.0'

      END PROGRAM TEST_VOIGT
