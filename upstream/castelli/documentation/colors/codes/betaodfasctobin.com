ln -s odfp00beta.asc fort.1
/home/castelli/diskal/colors/hbeta/hbetaodf/betaodfasctobin.exe>odfp00beta.out
mv fort.2 odfp00beta.bin
rm fort.*
