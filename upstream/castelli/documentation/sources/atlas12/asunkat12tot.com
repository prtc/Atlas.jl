ln -s molecules.dat fort.2
ln -s ap00t5777g44377k1odfnew.dat fort.3
ln -s fclowlines.bin fort.11
ln -s fchilines.bin fort.21
ln -s diatomics.pck fort.31
ln -s tioschwenke.bin fort.41 
ln -s h2ofastfix.bin fort.51
./atlas12.exe<<EOF>asunkat12a.out
MOLECULES ON
READ MOLECULES
READ PUNCH
READ LINES
ITERATIONS 1 PRINT 1 PUNCH 0
BEGIN
END
EOF
mv fort.12 sellinsun.bin
rm fort.*
ln -s ap00t5777g44377k1odfnew.dat fort.3
ln -s molecules.dat fort.2
ln -s nltelines.bin  fort.19
ln -s sellinsun.bin fort.12
./atlas12.exe<<EOF>asunkat12b.out
MOLECULES ON
READ MOLECULES
READ PUNCH
TITLE ATLAS12 
OPACITY ON LINES
OPACITY ON XLINES
CONVECTION OVER 1.25 0 36
ITERATIONS 15
PRINT 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  
PUNCH 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1
SCALE MODEL 72 -6.875 0.125 5777. 4.4377
BEGIN
END 
EOF
mv fort.7  asunat12.dat 
rm fort.*

