ln -s /home/castelli/diskal/lines/highlines.bin fort.11
/home/castelli/diskal/dflines/repackhi.exe>repackhi.out
mv fort.12 highlinesdf.bin
rm fort.*
