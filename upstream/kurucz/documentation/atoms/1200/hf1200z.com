$set def 1200
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf120007.dat for007
$assign poolg:hf120001.dat for001
$assign poolg:hf120002.dat for002
$assign poolg:hf120004.dat for004
$assign hf1200z.pun for011
$assign hf1200z.dat for013
$assign hf1200ze.dat for014
$assign poolg:hf120031.dat for031
$assign poolg:hf120032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   12    1mg i  3s2              3s2
   12    1mg i  3s4s             3s1  4s
   12    1mg i  3s5s             3s1  5s
   12    1mg i  3s6s             3s1  6s
   12    1mg i  3s7s             3s1  7s
   12    1mg i  3s8s             3s1  8s
   12    1mg i  3s9s             3s1  9s
   12    1mg i  3s10s            3s1 10s
   12    1mg i  3s11s            3s1 11s
   12    1mg i  3s12s            3s1 12s
   12    1mg i  3s13s            3s1 13s
   12    1mg i  3s14s            3s1 14s
   12    1mg i  3s15s            3s1 15s
   12    1mg i  3s3d             3s1  3d
   12    1mg i  3s4d             3s1  4d
   12    1mg i  3s5d             3s1  5d
   12    1mg i  3s6d             3s1  6d
   12    1mg i  3s7d             3s1  7d
   12    1mg i  3s8d             3s1  8d
   12    1mg i  3s9d             3s1  9d
   12    1mg i  3s10d            3s1 10d
   12    1mg i  3s11d            3s1 11d
   12    1mg i  3s12d            3s1 12d
   12    1mg i  3s13d            3s1 13d
   12    1mg i  3s14d            3s1 14d
   12    1mg i  3s15d            3s1 15d
   12    1mg i  3s5g             3s1  5g
   12    1mg i  3s6g             3s1  6g
   12    1mg i  3s7g             3s1  7g
   12    1mg i  3s8g             3s1  8g
   12    1mg i  3s9g             3s1  9g
   12    1mg i  3s10g            3s1 10g
   12    1mg i  3s11g            3s1 11g
   12    1mg i  3s12g            3s1 12g
   12    1mg i  3s13g            3s1 13g
   12    1mg i  3s14g            3s1 14g
   12    1mg i  3s15g            3s1 15g
   12    1mg i  3s7i             3s1  7i
   12    1mg i  3s8i             3s1  8i
   12    1mg i  3s9i             3s1  9i
   12    1mg i  3s10i            3s1 10i
   12    1mg i  3s11i            3s1 11i
   12    1mg i  3s12i            3s1 12i
   12    1mg i  3s13i            3s1 13i
   12    1mg i  3s14i            3s1 14i
   12    1mg i  3s9l             3s1  9l
   12    1mg i  3s10l            3s1 10l
   12    1mg i  3s11l            3s1 11l
   12    1mg i  3s12l            3s1 12l
   12    1mg i  3s13l            3s1 13l
   12    1mg i  3s14l            3s1 14l
   12    1mg i  3p2              3p2
   12    1mg i  3p4p             3p1  4p
   12    1mg i  3p5p             3p1  5p
   12    1mg i  3p6p             3p1  6p
   12    1mg i  3p7p             3p1  7p
   12    1mg i  3p8p             3p1  8p
   12    1mg i  3p9p             3p1  9p
   12    1mg i  3p10p            3p1 10p
   12    1mg i  3p11p            3p1 11p
   12    1mg i  3p12p            3p1 12p
   12    1mg i  3s3p             3s1  3p
   12    1mg i  3s4p             3s1  4p
   12    1mg i  3s5p             3s1  5p
   12    1mg i  3s6p             3s1  6p
   12    1mg i  3s7p             3s1  7p
   12    1mg i  3s8p             3s1  8p
   12    1mg i  3s9p             3s1  9p
   12    1mg i  3s10p            3s1 10p
   12    1mg i  3s11p            3s1 11p
   12    1mg i  3s12p            3s1 12p
   12    1mg i  3s13p            3s1 13p
   12    1mg i  3s14p            3s1 14p
   12    1mg i  3s15p            3s1 15p
   12    1mg i  3s4f             3s1  4f
   12    1mg i  3s5f             3s1  5f
   12    1mg i  3s6f             3s1  6f
   12    1mg i  3s7f             3s1  7f
   12    1mg i  3s8f             3s1  8f
   12    1mg i  3s9f             3s1  9f
   12    1mg i  3s10f            3s1 10f
   12    1mg i  3s11f            3s1 11f
   12    1mg i  3s12f            3s1 12f
   12    1mg i  3s13f            3s1 13f
   12    1mg i  3s14f            3s1 14f
   12    1mg i  3s15f            3s1 15f
   12    1mg i  3s6h             3s1  6h
   12    1mg i  3s7h             3s1  7h
   12    1mg i  3s8h             3s1  8h
   12    1mg i  3s9h             3s1  9h
   12    1mg i  3s10h            3s1 10h
   12    1mg i  3s11h            3s1 11h
   12    1mg i  3s12h            3s1 12h
   12    1mg i  3s13h            3s1 13h
   12    1mg i  3s14h            3s1 14h
   12    1mg i  3s15h            3s1 15h
   12    1mg i  3s8k             3s1  8k
   12    1mg i  3s9k             3s1  9k
   12    1mg i  3s10k            3s1 10k
   12    1mg i  3s11k            3s1 11k
   12    1mg i  3s12k            3s1 12k
   12    1mg i  3s13k            3s1 13k
   12    1mg i  3s14k            3s1 14k
   12    1mg i  3s15k            3s1 15k
   12    1mg i  3p4s             3p1  4s
   12    1mg i  3p5s             3p1  5s
   12    1mg i  3p6s             3p1  6s
   12    1mg i  3p7s             3p1  7s
   12    1mg i  3p8s             3p1  8s
   12    1mg i  3p9s             3p1  9s
   12    1mg i  3p10s            3p1 10s
   12    1mg i  3p11s            3p1 11s
   12    1mg i  3p12s            3p1 12s
   12    1mg i  3p3d             3p1  3d
   12    1mg i  3p4d             3p1  4d
   12    1mg i  3p5d             3p1  5d
   12    1mg i  3p6d             3p1  6d
   12    1mg i  3p7d             3p1  7d
   12    1mg i  3p8d             3p1  8d
   12    1mg i  3p9d             3p1  9d
   12    1mg i  3p10d            3p1 10d
   12    1mg i  3p11d            3p1 11d
   -1
$run cray:rcn2c
$DELETE POOLG:HF120001.DAT;*
$DELETE POOLG:HF120002.DAT;*
$DELETE POOLG:HF120004.DAT;*
$DELETE POOLG:HF120031.DAT;*
$DELETE POOLG:HF120032.DAT;*
