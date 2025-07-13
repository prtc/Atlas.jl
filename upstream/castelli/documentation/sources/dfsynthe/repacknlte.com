ln -s /home/castelli/diskal/lines/nltelines.dat fort.11
/home/castelli/diskal/dflines/repacknlte.exe>repacknlte.out
mv fort.19 nltelinesdf.bin
rm fort.*
