ln -s  p02big2.bdf fort.1
ln -s  p05big2.bdf fort.2
./dfinterpbig.exe<<EOF>dfinterpbig.out
0.66667 0.33334
EOF
mv fort.3 p03big2.bdf
rm fort.*
