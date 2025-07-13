ln -s /home/castelli/diskbl/sun/synspect/f7000-7210vr2br325br523000.bin fort.7
/home/castelli/diskal/synthe/plotsynimcol.exe<<EOF
       1       0       0       0       0       0       0       0       0
  IFLABL  IFABSO  IFCONT  IFGRID  IFDLIN   IFLOG   JUST1  NOWAVE  NOCALC
       0       0       2       0       0       0       0       0       0
  IFNOAX    IFMU  NOPRNT  IFKPNO   IFKPK  IFSACP  IFHAWA   IFNRL  IFPROC
       0       0       0       0       0       0       0       0       0
   IFSIR   IFARC  IFSUNF  IFSOIR  IFHALL  IFENGV  IFOPAC   IFFTS  IFDUM5
1.26      1.5732     .01       90.       0.       1.        0.8       0.
YSCALE    XSCALE    WEAK      PANEL     CYCLES    OFFSET    RMIN      RMAX
 0.       711.0     711.6     0.        0.        0.        0.        0.
TOP       WNEW1     WNEW2     TICKTOP   TICKBOT   SMOOTH    DOPOBS    DOPCALC
0.        0.000     0.000     0.        0.        0.5       0.        RED      
DOPTERR   SCALOBS   ZEROOBS   RMIN2     RMAX2     XOFFSET   SCALOB2   COLORCALC
01010101010101010101010101010101010101010101010101010101010101010101010101
12345678901234567890123456789012345678901234567890123456789012345678901234
1
2
3
4  
5  
6
7 
8
9
EOF
mv plot.vec plot1.vec
ln -s /home/castelli/diskbl/sun/atlaskur/sn7000-7210.bin fort.55
/home/castelli/diskal/synthe/plotobsimcol.exe<<EOF
       0       0       0       0       1       0       0       0       1
  IFLABL  IFABSO  IFCONT  IFGRID  IFDLIN   IFLOG   JUST1  NOWAVE  NOCALC
       1       0       2       0       0       0       0       0       0
  IFNOAX    IFMU  NOPRNT  IFKPNO   IFKPK  IFSACP  IFHAWA   IFNRL  IFPROC
       0       0       0       0       0       0       0       0       0
   IFSIR   IFARC  IFSUNF  IFSOIR  IFHALL  IFENGV  IFOPAC   IFFTS  IFDUM5
1.26      1.5732    .9        90.       0.        1.        0.8       0.
YSCALE    XSCALE    WEAK      PANEL     CYCLES    OFFSET    RMIN      RMAX
 0.       711.0     711.6     0.        0.        0.        0.        0.
TOP       WNEW1     WNEW2     TICKTOP   TICKBOT   SMOOTH    DOPOBS    DOPCALC
0.        0.000     0.000     0.        0.        0.5       0.        BLACK      
DOPTERR   SCALOBS   ZEROOBS   RMIN2     RMAX2     XOFFSET   SCALOB2   COLORCALC
01010101010101010101010101010101010101010101010101010101010101010101010101
12345678901234567890123456789012345678901234567890123456789012345678901234
1
2
3
4  
5  
6
7 
8
9
EOF
mv plot.vec plot2.vec
ln -s /home/castelli/diskbl/sun/synspect/plot1.vec fort.1
ln -s /home/castelli/diskbl/sun/synspect/plot2.vec fort.2
/home/castelli/diskal/synthe/mergeplotcol.exe
mv PLOT plot.vec
rm fort.*
ln -s plot.vec fort.1
/home/castelli/diskal/synthe/psplotcol.exe
mv fort.2 plot.ps
rm *.vec
#lpr plot.ps
ggv plot.ps
rm plot.ps
rm fort.*
