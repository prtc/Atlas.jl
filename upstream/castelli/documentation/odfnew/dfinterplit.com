ln -s  p02lit2.bdf fort.1
ln -s  p05lit2.bdf fort.2
./dfinterplit.exe<<EOF>dfinterplit.out
0.66667 0.33334
EOF
mv fort.3 p03lit2.bdf
rm fort.*
