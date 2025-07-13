ln -s /home/castelli/diskal/tio/schwenke.bin fort.11
/home/castelli/diskal/dflines/repacktio.exe>repacktio.out
mv fort.12 tiolinesdf.bin
rm fort.*
