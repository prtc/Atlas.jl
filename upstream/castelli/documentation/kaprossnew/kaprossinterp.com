ln -s kapm05.ros fort.1
ln -s kapm10.ros fort.2
./kaprossinterp.exe<<EOF>kaprossinterp.out
0.6 0.4
EOF
mv fort.3 kapm07interp.ros
rm fort.*

