ln -s /home/castelli/wwwuser/odfnew/p00lit2.bdf fort.9
ln -s /home/castelli/diskcl/atlas9/molecules.dat fort.2
ln -s /home/castelli/diskcl/atlas9/ap00t10000g40k2odfnew.dat fort.3
/home/castelli/diskcl/atlas9/atlas9v.exe<<EOF>ip00t10000g40k2odfnew.out
MOLECULES ON
READ MOLECULES
SURFACE INTENSITY  1 1.
SURFACE INTENSI 17 1.,.9,.8,.7,.6,.5,.4,.3,.25,.2,.15,.125,.1,.075,.05,.025,.01 
FREQUENCIES 1221 1 1221 LITTLE
ITERATIONS 1 PRINT 2 PUNCH 2
READ PUNCH
VTURB 2.0E+5
BEGIN                    ITERATION  10 COMPLETED
END
EOF
mv fort.7 ip00t10000g40k2odfnew.dat
rm fort.*
