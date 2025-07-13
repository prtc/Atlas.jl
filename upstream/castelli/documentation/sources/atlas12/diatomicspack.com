ln -s diatomics.asc fort.11
./diatomicspack.exe>diatomicspck.out
mv fort.12 diatomicspck.bin
rm fort.*
