ln -s /home/castelli/diskal/lines/gf0100new.100  fort.10
ln -s /home/castelli/diskal/lines/gf0150new.100  fort.11
ln -s /home/castelli/diskal/lines/gf0200new.100  fort.12
ln -s /home/castelli/diskal/lines/gf0300new.100  fort.13
ln -s /home/castelli/diskal/lines/gf0400new.100  fort.14
ln -s /home/castelli/diskal/lines/gf0500new.100  fort.15
ln -s /home/castelli/diskal/lines/gf0600new.100  fort.16
ln -s /home/castelli/diskal/lines/gf0800new.100  fort.17
ln -s /home/castelli/diskal/lines/gf1200new.100  fort.18
/home/castelli/diskal/width/inpwidth.exe
mv fort.1 inpwidth.dat
rm fort.*
