ln -s /home/castelli/diskal/lines/lowlines.bin fort.11
/home/castelli/diskal/dflines/repacklow.exe>repacklow.out
mv fort.12 lowlinesdf.bin
rm fort.*
