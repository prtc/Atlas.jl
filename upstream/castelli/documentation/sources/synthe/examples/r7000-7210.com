ln -s /home/castelli/diskcl/atlas9/molecules.dat fort.2
ln -s /home/castelli/diskal/synthe/continua.dat fort.17
/home/castelli/diskal/synthe/xnfpelsyn.exe<ap04t4970g46k1at12.mod>xnfpelsyn.out
mv fort.10 xnft4950g46k1at12.dat
rm fort.*
/home/castelli/diskal/synthe/synbeg.exe<<EOF>synbeg.out
AIR       700.0     721.0     500000.   0.     0          10 .001         0   00
AIRorVAC  WLBEG     WLEND     RESOLU    TURBV  IFNLTE LINOUT CUTOFF        NREAD
EOF
ln -s /home/castelli/diskal/lines/gf0800.100 fort.11
/home/castelli/diskal/synthe/rgfalllinesnew.exe>gf0500.out
rm fort.11
ln -s /home/castelli/diskal/lines/gf1200.100 fort.11
/home/castelli/diskal/synthe/rgfalllinesnew.exe>gf0600.out
rm fort.11
ln -s <a HREF="http://kurucz.harvard.edu/molecules/ch/chjorg.asc">chjorg.asc</a> fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>chax.out
rm fort.11
ln -s /home/castelli/diskal/lines/chbx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>chbx.out
rm fort.11
ln -s /home/castelli/diskal/lines/chcx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>chcx.out
rm fort.11
ln -s /home/castelli/diskal/lines/mghax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>mghax.out
rm fort.11
ln -s /home/castelli/diskal/lines/mghbx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>mghbx.out
rm fort.11
ln -s /home/castelli/diskal/lines/nhax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>nhax.out
rm fort.11
ln -s /home/castelli/diskal/lines/nhca.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>nhca.out
rm fort.11
ln -s /home/castelli/diskal/lines/ohax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>ohax.out
rm fort.11
ln -s /home/castelli/diskal/lines/ohxx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>ohxx.out
rm fort.11
ln -s /home/castelli/diskal/lines/sihax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>sihax.out
rm fort.11
ln -s /home/castelli/diskal/lines/h2bx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>h2bx.out
rm fort.11
ln -s /home/castelli/diskal/lines/h2cx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>h2cx.out
rm fort.11
ln -s /home/castelli/diskal/lines/c2ax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>c2ax.out
rm fort.11
ln -s /home/castelli/diskal/lines/c2ba.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>c2ba.out
rm fort.11
ln -s /home/castelli/diskal/lines/c2da.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>c2da.out
rm fort.11
ln -s /home/castelli/diskal/lines/c2ea.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>c2ea.out
rm fort.11
ln -s /home/castelli/diskal/lines/cnax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>cnax.out
rm fort.11
ln -s /home/castelli/diskal/lines/cnbx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>cnbx.out
rm fort.11
ln -s /home/castelli/diskal/lines/coax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>coax.out
rm fort.11
ln -s /home/castelli/diskal/lines/coxx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>coxx.out
rm fort.11
ln -s /home/castelli/diskal/lines/sioax.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>sioax.out
rm fort.11
ln -s /home/castelli/diskal/lines/sioex.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>sioex.out
rm fort.11
ln -s /home/castelli/diskal/lines/sioxx.asc fort.11
/home/castelli/diskal/synthe/rmolecasc.exe>sioxx.out
rm fort.11
ln -s /home/castelli/diskal/lines/schwenke.bin fort.11
ln -s /home/castelli/diskal/lines/eschwenke.bin fort.48
/home/castelli/diskal/synthe/rschwenk.exe>rschwenk.out
rm fort.11
rm fort.48
ln -s /home/castelli/diskal/lines/h2ofast.bin fort.11
/home/castelli/diskal/synthe/rh2ofast.bin>h2ofast.out
rm fort.11
ln -s /home/castelli/diskbl/hd125072/xnft4950g46k1at12.dat fort.10
ln -s /home/castelli/diskal/synthe/he1tables.dat fort.18
/home/castelli/diskal/synthe/synthe.exe>synthe.out
ln -s /home/castelli/diskcl/atlas9/molecules.dat fort.2
cat <<EOF >fort.25
0.0       0.        1.        0.        0.        0.        0.        0.
0.
RHOXJ     R1        R101      PH1       PC1       PSI1      PRDDOP    PRDPOW
EOF
/home/castelli/diskal/synthe/spectrv.exe<ap04t4970g46k1at12.mod>spectrv.out
mv fort.7 i7000-7210.dat
ln -s /home/castelli/diskbl/hd125072/i7000-7210.dat fort.1
/home/castelli/diskal/synthe/rotate.exe<<EOF>rotate.out
    1
2.
EOF
mv ROT1 f7000-7210vr2.dat
ln -s /home/castelli/diskbl/hd125072/f7000-7210vr2.dat fort.21
/home/castelli/diskal/synthe/broaden.exe<<EOF>broaden.out
GAUSSIAN  48000.    RESOLUTION
EOF
mv fort.22 f7000-7210vr2br48000ap04t4970g46k1at12.bin
rm fort.*

