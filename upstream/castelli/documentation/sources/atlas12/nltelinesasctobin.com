ln -s /home/castelli/diskal/linesold/nltelines.asc fort.11
./nltelinesasctobin.exe>nltelinesasctobin.out
mv fort.19 nltelines.bin
rm fort.*

