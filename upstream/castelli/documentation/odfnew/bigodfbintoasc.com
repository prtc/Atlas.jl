ln -s ~/diskcl/odfp00/p00big2.bdf fort.9
./bigodfbintoasc.exe>p00big2.out 
mv fort.12 p00big2.asc
rm fort.*
