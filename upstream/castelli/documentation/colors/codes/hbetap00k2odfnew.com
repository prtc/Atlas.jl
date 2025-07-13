ln -s /home/castelli/diskal/colors/hbeta/betaflux/betafluxp00k2odfnew.dat fort.1
/home/castelli/diskal/colors/hbeta/hbeta.exe<<EOF>hbetap00k2odfnew.out
0.0       2.0       1.25
EOF
mv fort.7 hbetap00k2odfnew.dat
rm fort.*
