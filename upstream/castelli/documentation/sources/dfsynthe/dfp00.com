ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t1995.out 
100000000000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t1995vt0.bin
mv fort.16 dfp00t1995vt1.bin
mv fort.17 dfp00t1995vt2.bin
mv fort.18 dfp00t1995vt4.bin
mv fort.20 dfp00t1995vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2089.out 
010000000000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2089vt0.bin
mv fort.16 dfp00t2089vt1.bin
mv fort.17 dfp00t2089vt2.bin
mv fort.18 dfp00t2089vt4.bin
mv fort.20 dfp00t2089vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2188.out 
001000000000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2188vt0.bin
mv fort.16 dfp00t2188vt1.bin
mv fort.17 dfp00t2188vt2.bin
mv fort.18 dfp00t2188vt4.bin
mv fort.20 dfp00t2188vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2291.out 
000100000000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2291vt0.bin
mv fort.16 dfp00t2291vt1.bin
mv fort.17 dfp00t2291vt2.bin
mv fort.18 dfp00t2291vt4.bin
mv fort.20 dfp00t2291vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2399.out 
000010000000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2399vt0.bin
mv fort.16 dfp00t2399vt1.bin
mv fort.17 dfp00t2399vt2.bin
mv fort.18 dfp00t2399vt4.bin
mv fort.20 dfp00t2399vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2512.out 
000001000000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2512vt0.bin
mv fort.16 dfp00t2512vt1.bin
mv fort.17 dfp00t2512vt2.bin
mv fort.18 dfp00t2512vt4.bin
mv fort.20 dfp00t2512vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2630.out 
000000100000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2630vt0.bin
mv fort.16 dfp00t2630vt1.bin
mv fort.17 dfp00t2630vt2.bin
mv fort.18 dfp00t2630vt4.bin
mv fort.20 dfp00t2630vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2754.out 
000000010000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2754vt0.bin
mv fort.16 dfp00t2754vt1.bin
mv fort.17 dfp00t2754vt2.bin
mv fort.18 dfp00t2754vt4.bin
mv fort.20 dfp00t2754vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t2884.out 
000000001000000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t2884vt0.bin
mv fort.16 dfp00t2884vt1.bin
mv fort.17 dfp00t2884vt2.bin
mv fort.18 dfp00t2884vt4.bin
mv fort.20 dfp00t2884vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t3020.out 
000000000100000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t3020vt0.bin
mv fort.16 dfp00t3020vt1.bin
mv fort.17 dfp00t3020vt2.bin
mv fort.18 dfp00t3020vt4.bin
mv fort.20 dfp00t3020vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t3162.out 
000000000010000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t3162vt0.bin
mv fort.16 dfp00t3162vt1.bin
mv fort.17 dfp00t3162vt2.bin
mv fort.18 dfp00t3162vt4.bin
mv fort.20 dfp00t3162vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t3311.out 
000000000001000000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t3311vt0.bin
mv fort.16 dfp00t3311vt1.bin
mv fort.17 dfp00t3311vt2.bin
mv fort.18 dfp00t3311vt4.bin
mv fort.20 dfp00t3311vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t3467.out 
000000000000100000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t3467vt0.bin
mv fort.16 dfp00t3467vt1.bin
mv fort.17 dfp00t3467vt2.bin
mv fort.18 dfp00t3467vt4.bin
mv fort.20 dfp00t3467vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t3631.out 
000000000000010000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t3631vt0.bin
mv fort.16 dfp00t3631vt1.bin
mv fort.17 dfp00t3631vt2.bin
mv fort.18 dfp00t3631vt4.bin
mv fort.20 dfp00t3631vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t3802.out 
000000000000001000000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t3802vt0.bin
mv fort.16 dfp00t3802vt1.bin
mv fort.17 dfp00t3802vt2.bin
mv fort.18 dfp00t3802vt4.bin
mv fort.20 dfp00t3802vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t3981.out 
000000000000000100000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t3981vt0.bin
mv fort.16 dfp00t3981vt1.bin
mv fort.17 dfp00t3981vt2.bin
mv fort.18 dfp00t3981vt4.bin
mv fort.20 dfp00t3981vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t4169.out 
000000000000000010000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t4169vt0.bin
mv fort.16 dfp00t4169vt1.bin
mv fort.17 dfp00t4169vt2.bin
mv fort.18 dfp00t4169vt4.bin
mv fort.20 dfp00t4169vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t4365.out 
000000000000000001000000000000000000000000000000000000000
EOF
mv fort.15 dfp00t4365vt0.bin
mv fort.16 dfp00t4365vt1.bin
mv fort.17 dfp00t4365vt2.bin
mv fort.18 dfp00t4365vt4.bin
mv fort.20 dfp00t4365vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t4571.out 
000000000000000000100000000000000000000000000000000000000
EOF
mv fort.15 dfp00t4571vt0.bin
mv fort.16 dfp00t4571vt1.bin
mv fort.17 dfp00t4571vt2.bin
mv fort.18 dfp00t4571vt4.bin
mv fort.20 dfp00t4571vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t4786.out 
000000000000000000010000000000000000000000000000000000000
EOF
mv fort.15 dfp00t4786vt0.bin
mv fort.16 dfp00t4786vt1.bin
mv fort.17 dfp00t4786vt2.bin
mv fort.18 dfp00t4786vt4.bin
mv fort.20 dfp00t4786vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t5012.out 
000000000000000000001000000000000000000000000000000000000
EOF
mv fort.15 dfp00t5012vt0.bin
mv fort.16 dfp00t5012vt1.bin
mv fort.17 dfp00t5012vt2.bin
mv fort.18 dfp00t5012vt4.bin
mv fort.20 dfp00t5012vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t5370.out 
000000000000000000000100000000000000000000000000000000000
EOF
mv fort.15 dfp00t5370vt0.bin
mv fort.16 dfp00t5370vt1.bin
mv fort.17 dfp00t5370vt2.bin
mv fort.18 dfp00t5370vt4.bin
mv fort.20 dfp00t5370vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t5754.out 
000000000000000000000010000000000000000000000000000000000
EOF
mv fort.15 dfp00t5754vt0.bin
mv fort.16 dfp00t5754vt1.bin
mv fort.17 dfp00t5754vt2.bin
mv fort.18 dfp00t5754vt4.bin
mv fort.20 dfp00t5754vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t6166.out 
000000000000000000000001000000000000000000000000000000000
EOF
mv fort.15 dfp00t6166vt0.bin
mv fort.16 dfp00t6166vt1.bin
mv fort.17 dfp00t6166vt2.bin
mv fort.18 dfp00t6166vt4.bin
mv fort.20 dfp00t6166vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t6607.out 
000000000000000000000000100000000000000000000000000000000
EOF
mv fort.15 dfp00t6607vt0.bin
mv fort.16 dfp00t6607vt1.bin
mv fort.17 dfp00t6607vt2.bin
mv fort.18 dfp00t6607vt4.bin
mv fort.20 dfp00t6607vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t7079.out 
000000000000000000000000010000000000000000000000000000000
EOF
mv fort.15 dfp00t7079vt0.bin
mv fort.16 dfp00t7079vt1.bin
mv fort.17 dfp00t7079vt2.bin
mv fort.18 dfp00t7079vt4.bin
mv fort.20 dfp00t7079vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t7586.out 
000000000000000000000000001000000000000000000000000000000
EOF
mv fort.15 dfp00t7586vt0.bin
mv fort.16 dfp00t7586vt1.bin
mv fort.17 dfp00t7586vt2.bin
mv fort.18 dfp00t7586vt4.bin
mv fort.20 dfp00t7586vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t8128.out 
000000000000000000000000000100000000000000000000000000000
EOF
mv fort.15 dfp00t8128vt0.bin
mv fort.16 dfp00t8128vt1.bin
mv fort.17 dfp00t8128vt2.bin
mv fort.18 dfp00t8128vt4.bin
mv fort.20 dfp00t8128vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t8710.out 
000000000000000000000000000010000000000000000000000000000
EOF
mv fort.15 dfp00t8710vt0.bin
mv fort.16 dfp00t8710vt1.bin
mv fort.17 dfp00t8710vt2.bin
mv fort.18 dfp00t8710vt4.bin
mv fort.20 dfp00t8710vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t9333.out 
000000000000000000000000000001000000000000000000000000000
EOF
mv fort.15 dfp00t9333vt0.bin
mv fort.16 dfp00t9333vt1.bin
mv fort.17 dfp00t9333vt2.bin
mv fort.18 dfp00t9333vt4.bin
mv fort.20 dfp00t9333vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t10000.out 
000000000000000000000000000000100000000000000000000000000
EOF
mv fort.15 dfp00t10000vt0.bin
mv fort.16 dfp00t10000vt1.bin
mv fort.17 dfp00t10000vt2.bin
mv fort.18 dfp00t10000vt4.bin
mv fort.20 dfp00t10000vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t11220.out 
000000000000000000000000000000010000000000000000000000000
EOF
mv fort.15 dfp00t11220vt0.bin
mv fort.16 dfp00t11220vt1.bin
mv fort.17 dfp00t11220vt2.bin
mv fort.18 dfp00t11220vt4.bin
mv fort.20 dfp00t11220vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t12589.out 
000000000000000000000000000000001000000000000000000000000
EOF
mv fort.15 dfp00t12589vt0.bin
mv fort.16 dfp00t12589vt1.bin
mv fort.17 dfp00t12589vt2.bin
mv fort.18 dfp00t12589vt4.bin
mv fort.20 dfp00t12589vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t14125.out 
000000000000000000000000000000000100000000000000000000000
EOF
mv fort.15 dfp00t14125vt0.bin
mv fort.16 dfp00t14125vt1.bin
mv fort.17 dfp00t14125vt2.bin
mv fort.18 dfp00t14125vt4.bin
mv fort.20 dfp00t14125vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t15849.out 
000000000000000000000000000000000010000000000000000000000
EOF
mv fort.15 dfp00t15849vt0.bin
mv fort.16 dfp00t15849vt1.bin
mv fort.17 dfp00t15849vt2.bin
mv fort.18 dfp00t15849vt4.bin
mv fort.20 dfp00t15849vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t17783.out 
000000000000000000000000000000000001000000000000000000000
EOF
mv fort.15 dfp00t17783vt0.bin
mv fort.16 dfp00t17783vt1.bin
mv fort.17 dfp00t17783vt2.bin
mv fort.18 dfp00t17783vt4.bin
mv fort.20 dfp00t17783vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t19953.out 
000000000000000000000000000000000000100000000000000000000
EOF
mv fort.15 dfp00t19953vt0.bin
mv fort.16 dfp00t19953vt1.bin
mv fort.17 dfp00t19953vt2.bin
mv fort.18 dfp00t19953vt4.bin
mv fort.20 dfp00t19953vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t22387.out 
000000000000000000000000000000000000010000000000000000000
EOF
mv fort.15 dfp00t22387vt0.bin
mv fort.16 dfp00t22387vt1.bin
mv fort.17 dfp00t22387vt2.bin
mv fort.18 dfp00t22387vt4.bin
mv fort.20 dfp00t22387vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t25119.out 
000000000000000000000000000000000000001000000000000000000
EOF
mv fort.15 dfp00t25119vt0.bin
mv fort.16 dfp00t25119vt1.bin
mv fort.17 dfp00t25119vt2.bin
mv fort.18 dfp00t25119vt4.bin
mv fort.20 dfp00t25119vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t28184.out 
000000000000000000000000000000000000000100000000000000000
EOF
mv fort.15 dfp00t28184vt0.bin
mv fort.16 dfp00t28184vt1.bin
mv fort.17 dfp00t28184vt2.bin
mv fort.18 dfp00t28184vt4.bin
mv fort.20 dfp00t28184vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t31623.out 
000000000000000000000000000000000000000010000000000000000
EOF
mv fort.15 dfp00t31623vt0.bin
mv fort.16 dfp00t31623vt1.bin
mv fort.17 dfp00t31623vt2.bin
mv fort.18 dfp00t31623vt4.bin
mv fort.20 dfp00t31623vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t35481.out 
000000000000000000000000000000000000000001000000000000000
EOF
mv fort.15 dfp00t35481vt0.bin
mv fort.16 dfp00t35481vt1.bin
mv fort.17 dfp00t35481vt2.bin
mv fort.18 dfp00t35481vt4.bin
mv fort.20 dfp00t35481vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t39811.out 
000000000000000000000000000000000000000000100000000000000
EOF
mv fort.15 dfp00t39811vt0.bin
mv fort.16 dfp00t39811vt1.bin
mv fort.17 dfp00t39811vt2.bin
mv fort.18 dfp00t39811vt4.bin
mv fort.20 dfp00t39811vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t44668.out 
000000000000000000000000000000000000000000010000000000000
EOF
mv fort.15 dfp00t44668vt0.bin
mv fort.16 dfp00t44668vt1.bin
mv fort.17 dfp00t44668vt2.bin
mv fort.18 dfp00t44668vt4.bin
mv fort.20 dfp00t44668vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t50119.out 
000000000000000000000000000000000000000000001000000000000
EOF
mv fort.15 dfp00t50119vt0.bin
mv fort.16 dfp00t50119vt1.bin
mv fort.17 dfp00t50119vt2.bin
mv fort.18 dfp00t50119vt4.bin
mv fort.20 dfp00t50119vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t56234.out 
000000000000000000000000000000000000000000000100000000000
EOF
mv fort.15 dfp00t56234vt0.bin
mv fort.16 dfp00t56234vt1.bin
mv fort.17 dfp00t56234vt2.bin
mv fort.18 dfp00t56234vt4.bin
mv fort.20 dfp00t56234vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t63096.out 
000000000000000000000000000000000000000000000010000000000
EOF
mv fort.15 dfp00t63096vt0.bin
mv fort.16 dfp00t63096vt1.bin
mv fort.17 dfp00t63096vt2.bin
mv fort.18 dfp00t63096vt4.bin
mv fort.20 dfp00t63096vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t70795.out 
000000000000000000000000000000000000000000000001000000000
EOF
mv fort.15 dfp00t70795vt0.bin
mv fort.16 dfp00t70795vt1.bin
mv fort.17 dfp00t70795vt2.bin
mv fort.18 dfp00t70795vt4.bin
mv fort.20 dfp00t70795vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t79433.out 
000000000000000000000000000000000000000000000000100000000
EOF
mv fort.15 dfp00t79433vt0.bin
mv fort.16 dfp00t79433vt1.bin
mv fort.17 dfp00t79433vt2.bin
mv fort.18 dfp00t79433vt4.bin
mv fort.20 dfp00t79433vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t89125.out 
000000000000000000000000000000000000000000000000010000000
EOF
mv fort.15 dfp00t89125vt0.bin
mv fort.16 dfp00t89125vt1.bin
mv fort.17 dfp00t89125vt2.bin
mv fort.18 dfp00t89125vt4.bin
mv fort.20 dfp00t89125vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t100000.out 
000000000000000000000000000000000000000000000000001000000
EOF
mv fort.15 dfp00t100000vt0.bin
mv fort.16 dfp00t100000vt1.bin
mv fort.17 dfp00t100000vt2.bin
mv fort.18 dfp00t100000vt4.bin
mv fort.20 dfp00t100000vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t112202.out 
000000000000000000000000000000000000000000000000000100000
EOF
mv fort.15 dfp00t112202vt0.bin
mv fort.16 dfp00t112202vt1.bin
mv fort.17 dfp00t112202vt2.bin
mv fort.18 dfp00t112202vt4.bin
mv fort.20 dfp00t112202vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t125893.out 
000000000000000000000000000000000000000000000000000010000
EOF
mv fort.15 dfp00t125893vt0.bin
mv fort.16 dfp00t125893vt1.bin
mv fort.17 dfp00t125893vt2.bin
mv fort.18 dfp00t125893vt4.bin
mv fort.20 dfp00t125893vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t141254.out 
000000000000000000000000000000000000000000000000000001000
EOF
mv fort.15 dfp00t141254vt0.bin
mv fort.16 dfp00t141254vt1.bin
mv fort.17 dfp00t141254vt2.bin
mv fort.18 dfp00t141254vt4.bin
mv fort.20 dfp00t141254vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t158489.out 
000000000000000000000000000000000000000000000000000000100
EOF
mv fort.15 dfp00t158489vt0.bin
mv fort.16 dfp00t158489vt1.bin
mv fort.17 dfp00t158489vt2.bin
mv fort.18 dfp00t158489vt4.bin
mv fort.20 dfp00t158489vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t177828.out 
000000000000000000000000000000000000000000000000000000010
EOF
mv fort.15 dfp00t177828vt0.bin
mv fort.16 dfp00t177828vt1.bin
mv fort.17 dfp00t177828vt2.bin
mv fort.18 dfp00t177828vt4.bin
mv fort.20 dfp00t177828vt8.bin
rm fort.*
ln -s /home/castelli/diskal/dfsynthe/xnfpdf.dat fort.10
ln -s /home/castelli/diskal/dfsynthe/xnfpdfmax.dat fort.22
ln -s /home/castelli/diskal/dflines/lowlinesdf.bin fort.11
ln -s /home/castelli/diskal/dflines/highlinesdf.bin fort.21
ln -s /home/castelli/diskal/dflines/diatomicsdf.bin fort.31
ln -s /home/castelli/diskal/dflines/tiolinesdf.bin fort.41
ln -s /home/castelli/diskal/dflines/h2olinesdf.bin fort.43
ln -s /home/castelli/diskal/dflines/nltelinesdf.bin fort.51
/home/castelli/diskal/dfsynthe/dfsynthe.exe<<EOF>dfp00t199526.out 
000000000000000000000000000000000000000000000000000000001
EOF
mv fort.15 dfp00t199526vt0.bin
mv fort.16 dfp00t199526vt1.bin
mv fort.17 dfp00t199526vt2.bin
mv fort.18 dfp00t199526vt4.bin
mv fort.20 dfp00t199526vt8.bin
rm fort.*
