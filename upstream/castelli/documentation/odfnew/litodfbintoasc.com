ln -s ~/diskcl/odfp00/p00lit2.bdf fort.9
./litodfbintoasc.exe>p00lit2.out 
mv fort.12 p00lit2.asc
rm fort.*
