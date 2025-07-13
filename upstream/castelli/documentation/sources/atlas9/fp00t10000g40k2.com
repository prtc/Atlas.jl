ln -s /home/castelli/wwwuser/odfnew/p00lit2.bdf fort.9
ln -s /home/castelli/diskcl/atlas9/molecules.dat fort.2
ln -s /home/castelli/diskcl/atlas9/ap00t10000g40k2odfnew.new fort.3
/home/castelli/diskcl/atlas9/atlas9v.exe<<EOF>fp00t10000g40k2odfnew.out
MOLECULES ON
READ MOLECULES
SURFACE FLUX
FREQUENCIES 1221 1 1221 LITTLE
ITERATIONS 1 PRINT 2 PUNCH 2
READ PUNCH
VTURB 2.0E+5
BEGIN                    ITERATION  10 COMPLETED
END
EOF
mv fort.7 fp00t10000g40k2odfnew.dat
rm fort.*
