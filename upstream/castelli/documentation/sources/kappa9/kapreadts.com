ln -s kapm40k0.dat fort.11
ln -s kapm40k1.dat fort.12
ln -s kapm40k2.dat fort.13
ln -s kapm40k4.dat fort.14
ln -s kapm40k8.dat fort.15
/home/castelli/diskal/kappa9/kapreadts.exe
mv fort.2 kapm40.ros
rm fort.*

