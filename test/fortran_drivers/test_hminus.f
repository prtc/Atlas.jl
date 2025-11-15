C     ==================================================================
C     H⁻ OPACITY REFERENCE DATA GENERATOR
C     ==================================================================
C     Purpose: Generate reference H⁻ opacity values for Julia validation
C     Output: hminus_fortran.csv
C
C     This program calls the Fortran HMINBF and HMINFF functions
C     from atlas7v.for and generates CSV with test cases.
C
C     Usage:
C       1. Compile with atlas7v.for:
C          gfortran -o test_hminus test_hminus.f atlas7v.for
C       2. Run:
C          ./test_hminus
C       3. Output: hminus_fortran.csv
C
C     Author: Claude (AI Assistant)
C     Date: 2025-11-15
C     ==================================================================

      PROGRAM TEST_HMINUS
      IMPLICIT REAL*8 (A-H,O-Z)

C     Open output CSV file
      OPEN(10, FILE='hminus_fortran.csv', STATUS='REPLACE')
      WRITE(10,*) 'opacity_type,wavelength,temperature,',
     1            'electron_pressure,cross_section'

C     ==================================================================
C     Test Grid Coverage
C     ==================================================================
C     Wavelength: 4000-7000 Å (optical range)
C     Temperature: 4000, 5000, 6000, 7000, 8000 K
C     Electron pressure: 1e2, 1e3, 1e4, 1e5 dyne/cm²
C     ==================================================================

C     Wavelength grid (Angstroms)
      NWAVE = 7
      DIMENSION WAVE(7)
      DATA WAVE/4000.0, 4500.0, 5000.0, 5500.0, 6000.0, 6500.0, 7000.0/

C     Temperature grid (K)
      NTEMP = 5
      DIMENSION TEMP(5)
      DATA TEMP/4000.0, 5000.0, 6000.0, 7000.0, 8000.0/

C     Electron pressure grid (dyne/cm²)
      NPRES = 4
      DIMENSION PE(4)
      DATA PE/1.0D2, 1.0D3, 1.0D4, 1.0D5/

C     Loop over test grid
      DO IW = 1, NWAVE
        WL = WAVE(IW)

        DO IT = 1, NTEMP
          T = TEMP(IT)
          THETA = 5040.0D0 / T

          DO IP = 1, NPRES
            PEL = PE(IP)

C           ===========================================================
C           Bound-Free Opacity
C           ===========================================================
C           Call HMINBF from atlas7v.for
C           Input: wavelength (Å), theta (5040/T), electron pressure
C           Output: cross-section (cm²)

            SIGMA_BF = HMINBF(WL, THETA, PEL)

            WRITE(10,100) 'bf', WL, T, PEL, SIGMA_BF

C           ===========================================================
C           Free-Free Opacity
C           ===========================================================
C           Call HMINFF from atlas7v.for
C           Input: wavelength (Å), theta (5040/T), electron pressure
C           Output: cross-section (cm²)

            SIGMA_FF = HMINFF(WL, THETA, PEL)

            WRITE(10,100) 'ff', WL, T, PEL, SIGMA_FF

          ENDDO
        ENDDO
      ENDDO

  100 FORMAT(A2,',',F8.2,',',F8.2,',',E12.4,',',E20.12)

      CLOSE(10)

C     Calculate total test cases
      NTOTAL = NWAVE * NTEMP * NPRES * 2
      WRITE(*,*) 'Generated hminus_fortran.csv with', NTOTAL,
     1           ' test cases'
      WRITE(*,*) 'Wavelengths: ', NWAVE, ' points (4000-7000 Å)'
      WRITE(*,*) 'Temperatures: ', NTEMP, ' points (4000-8000 K)'
      WRITE(*,*) 'Pressures: ', NPRES, ' points (1e2-1e5 dyne/cm²)'
      WRITE(*,*) 'Both bf and ff for each combination'

      END PROGRAM TEST_HMINUS
