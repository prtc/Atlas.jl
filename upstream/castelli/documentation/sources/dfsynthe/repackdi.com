ln -s /home/castelli/diskal/molecules/diatomicsiwl.bin fort.11
/home/castelli/diskal/dflines/repackdi.exe>ndiatomics.out
mv fort.12 diatomicsdf.bin
rm fort.*

