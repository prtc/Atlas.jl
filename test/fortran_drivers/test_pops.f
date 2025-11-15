C     ==================================================================
C     POPULATION SOLVER REFERENCE DATA GENERATOR
C     ==================================================================
C     Purpose: Generate reference population/ionization data for Julia validation
C     Output: populations_fortran.csv
C
C     This program tests the PFSAHA subroutine from atlas7v.for
C     to generate electron densities and ionization fractions.
C
C     Usage:
C       1. Compile with atlas7v.for:
C          gfortran -o test_pops test_pops.f atlas7v.for
C       2. Run:
C          ./test_pops
C       3. Output: populations_fortran.csv
C
C     Note: This is a simplified driver. Full POPS iteration
C           requires atmosphere structure. This tests PFSAHA only.
C
C     Author: Claude (AI Assistant)
C     Date: 2025-11-15
C     ==================================================================

      PROGRAM TEST_POPS
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)

C     Common blocks from atlas7v.for
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw),PTOTAL(kw)
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),
     1             ITEMP

C     Open output CSV file
      OPEN(10, FILE='populations_fortran.csv', STATUS='REPLACE')
      WRITE(10,*) 'temperature,gas_pressure,n_e,',
     1            'partition_H_I,partition_H_II,',
     2            'partition_He_I,partition_He_II,partition_He_III'

C     ==================================================================
C     Test Grid Coverage
C     ==================================================================
C     Temperature: 3000 to 20000 K (10 points)
C     Gas pressure: 1e3 to 1e7 dyne/cm² (5 points)
C     ==================================================================

C     Temperature grid (K)
      NTEMP = 10
      DIMENSION TEMPS(10)
      DATA TEMPS/3000.0, 4000.0, 5000.0, 6000.0, 7000.0,
     1           8000.0, 10000.0, 12000.0, 15000.0, 20000.0/

C     Gas pressure grid (dyne/cm²)
      NPRES = 5
      DIMENSION PGAS(5)
      DATA PGAS/1.0D3, 1.0D4, 1.0D5, 1.0D6, 1.0D7/

C     Electron density guess (will be computed iteratively in real POPS)
      DIMENSION XNE_VALS(5)
      DATA XNE_VALS/1.0D12, 1.0D13, 1.0D14, 1.0D15, 1.0D16/

C     Loop over test grid
      DO IT = 1, NTEMP
        TMP = TEMPS(IT)
        T(1) = TMP
        TKEV(1) = TMP / 11605.0D0
        TK(1) = 5040.0D0 / TMP
        HKT(1) = 1.43883D0 * TK(1)

        DO IP = 1, NPRES
          PGAS_VAL = PGAS(IP)
          P(1) = PGAS_VAL

C         Electron density (simplified - real POPS iterates)
          XNE(1) = XNE_VALS(IP)

C         ============================================================
C         Call PFSAHA for Hydrogen
C         ============================================================
C         MODE 3: Return partition function only
C         IZ=1 (Hydrogen), NION=0 (neutral), NION=1 (ionized)

          J = 1
          IZ = 1
          NION = 0
          MODE = 3
          CALL PFSAHA(J, IZ, NION, MODE, ANSWER)
          PART_H_I = ANSWER(J, 1)

          NION = 1
          CALL PFSAHA(J, IZ, NION, MODE, ANSWER)
          PART_H_II = ANSWER(J, 1)

C         ============================================================
C         Call PFSAHA for Helium
C         ============================================================
C         IZ=2 (Helium), NION=0,1,2

          IZ = 2
          NION = 0
          CALL PFSAHA(J, IZ, NION, MODE, ANSWER)
          PART_HE_I = ANSWER(J, 1)

          NION = 1
          CALL PFSAHA(J, IZ, NION, MODE, ANSWER)
          PART_HE_II = ANSWER(J, 1)

          NION = 2
          CALL PFSAHA(J, IZ, NION, MODE, ANSWER)
          PART_HE_III = ANSWER(J, 1)

C         Write to CSV
          WRITE(10,100) TMP, PGAS_VAL, XNE(1),
     1                  PART_H_I, PART_H_II,
     2                  PART_HE_I, PART_HE_II, PART_HE_III

        ENDDO
      ENDDO

  100 FORMAT(F8.1,',',E12.4,',',E12.4,',',
     1       E12.4,',',E12.4,',',E12.4,',',E12.4,',',E12.4)

      CLOSE(10)

      NTOTAL = NTEMP * NPRES
      WRITE(*,*) 'Generated populations_fortran.csv with', NTOTAL,
     1           ' test cases'
      WRITE(*,*) 'Temperatures: ', NTEMP, ' points (3000-20000 K)'
      WRITE(*,*) 'Pressures: ', NPRES, ' points (1e3-1e7 dyne/cm²)'

      END PROGRAM TEST_POPS
