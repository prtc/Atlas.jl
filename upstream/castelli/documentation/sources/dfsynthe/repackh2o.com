ln -s /home/castelli/diskal/molecules/h2ofastfix.bin fort.11
/home/castelli/diskal/dflines/repackh2o.exe>repackh2o.out
mv fort.12 h2olinesdf.bin
rm fort.*
