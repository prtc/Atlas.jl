$set def 0400
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf040007.dat for007
$assign poolg:hf040001.dat for001
$assign poolg:hf040002.dat for002
$assign poolg:hf040004.dat for004
$assign hf0400x.pun for011
$assign hf0400x.rrr for012
$assign hf0400x.dat for013
$assign hf0400eX.dat for014
$assign poolg:hf040031.dat for031
$assign poolg:hf040032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    4    1be i  2s2              1s2  2s2
    4    1be i  2s3s             1s2  2s   3s
    4    1be i  2s4s             1s2  2s   4s
    4    1be i  2s5s             1s2  2s   5s
    4    1be i  2s6s             1s2  2s   6s
    4    1be i  2s7s             1s2  2s   7s
    4    1be i  2s8s             1s2  2s   8s
    4    1be i  2s9s             1s2  2s   9s
    4    1be i  2s10s            1s2  2s  10s
    4    1be i  2s11s            1s2  2s  11s
    4    1be i  2s12s            1s2  2s  12s
    4    1be i  2s13s            1s2  2s  13s
    4    1be i  2s3d             1s2  2s   3d
    4    1be i  2s4d             1s2  2s   4d
    4    1be i  2s5d             1s2  2s   5d
    4    1be i  2s6d             1s2  2s   6d
    4    1be i  2s7d             1s2  2s   7d
    4    1be i  2s8d             1s2  2s   8d
    4    1be i  2s9d             1s2  2s   9d
    4    1be i  2s10d            1s2  2s  10d
    4    1be i  2s11d            1s2  2s  11d
    4    1be i  2s12d            1s2  2s  12d
    4    1be i  2s13d            1s2  2s  13d
    4    1be i  2s5g             1s2  2s   5g
    4    1be i  2s6g             1s2  2s   6g
    4    1be i  2s7g             1s2  2s   7g
    4    1be i  2s8g             1s2  2s   8g
    4    1be i  2s9g             1s2  2s   9g
    4    1be i  2s10g            1s2  2s  10g
    4    1be i  2s11g            1s2  2s  11g
    4    1be i  2s12g            1s2  2s  12g
    4    1be i  2s13g            1s2  2s  13g
    4    1be i  2s7i             1s2  2s   7i
    4    1be i  2s8i             1s2  2s   8i
    4    1be i  2s9i             1s2  2s   9i
    4    1be i  2s10i            1s2  2s  10i
    4    1be i  2s11i            1s2  2s  11i
    4    1be i  2s12i            1s2  2s  12i
    4    1be i  2s13i            1s2  2s  13i
    4    1be i  2p2              1s2  2s0  2p2
    4    1be i  2p3p             1s2  2s0  2p   3p
    4    1be i  2p4p             1s2  2s0  2p   4p
    4    1be i  2p5p             1s2  2s0  2p   5p
    4    1be i  2p6p             1s2  2s0  2p   6p
    4    1be i  2p7p             1s2  2s0  2p   7p
    4    1be i  2p8p             1s2  2s0  2p   8p
    4    1be i  2p9p             1s2  2s0  2p   9p
    4    1be i  2p10p            1s2  2s0  2p  10p
    4    1be i  2p11p            1s2  2s0  2p  11p
    4    1be i  2p12p            1s2  2s0  2p  12p
    4    1be i  2p13p            1s2  2s0  2p  13p
    4    1be i  2p4f             1s2  2s0  2p   4f
    4    1be i  2p5f             1s2  2s0  2p   5f
    4    1be i  2p6f             1s2  2s0  2p   6f
    4    1be i  2p7f             1s2  2s0  2p   7f
    4    1be i  2p8f             1s2  2s0  2p   8f
    4    1be i  2p9f             1s2  2s0  2p   9f
    4    1be i  2p10f            1s2  2s0  2p  10f
    4    1be i  2p11f            1s2  2s0  2p  11f
    4    1be i  2p12f            1s2  2s0  2p  12f
    4    1be i  2p13f            1s2  2s0  2p  13f
    4    1be i  2s2p             1s2  2s   2p
    4    1be i  2s3p             1s2  2s   3p
    4    1be i  2s4p             1s2  2s   4p
    4    1be i  2s5p             1s2  2s   5p
    4    1be i  2s6p             1s2  2s   6p
    4    1be i  2s7p             1s2  2s   7p
    4    1be i  2s8p             1s2  2s   8p
    4    1be i  2s9p             1s2  2s   9p
    4    1be i  2s10p            1s2  2s  10p
    4    1be i  2s11p            1s2  2s  11p
    4    1be i  2s12p            1s2  2s  12p
    4    1be i  2s13p            1s2  2s  13p
    4    1be i  2s4f             1s2  2s   4f
    4    1be i  2s5f             1s2  2s   5f
    4    1be i  2s6f             1s2  2s   6f
    4    1be i  2s7f             1s2  2s   7f
    4    1be i  2s8f             1s2  2s   8f
    4    1be i  2s9f             1s2  2s   9f
    4    1be i  2s10f            1s2  2s  10f
    4    1be i  2s11f            1s2  2s  11f
    4    1be i  2s12f            1s2  2s  12f
    4    1be i  2s13f            1s2  2s  13f
    4    1be i  2s6h             1s2  2s   6h
    4    1be i  2s7h             1s2  2s   7h
    4    1be i  2s8h             1s2  2s   8h
    4    1be i  2s9h             1s2  2s   9h
    4    1be i  2s10h            1s2  2s  10h
    4    1be i  2s11h            1s2  2s  11h
    4    1be i  2s12h            1s2  2s  12h
    4    1be i  2s13h            1s2  2s  13h
    4    1be i  2s8k             1s2  2s   8k
    4    1be i  2s9k             1s2  2s   9k
    4    1be i  2s10k            1s2  2s  10k
    4    1be i  2s11k            1s2  2s  11k
    4    1be i  2s12k            1s2  2s  12k
    4    1be i  2s13k            1s2  2s  13k
    4    1be i  2p3s             1s2  2s0  2p   3s
    4    1be i  2p4s             1s2  2s0  2p   4s
    4    1be i  2p5s             1s2  2s0  2p   5s
    4    1be i  2p6s             1s2  2s0  2p   6s
    4    1be i  2p7s             1s2  2s0  2p   7s
    4    1be i  2p8s             1s2  2s0  2p   8s
    4    1be i  2p9s             1s2  2s0  2p   9s
    4    1be i  2p10s            1s2  2s0  2p  10s
    4    1be i  2p11s            1s2  2s0  2p  11s
    4    1be i  2p12s            1s2  2s0  2p  12s
    4    1be i  2p13s            1s2  2s0  2p  13s
    4    1be i  2p3d             1s2  2s0  2p   3d
    4    1be i  2p4d             1s2  2s0  2p   4d
    4    1be i  2p5d             1s2  2s0  2p   5d
    4    1be i  2p6d             1s2  2s0  2p   6d
    4    1be i  2p7d             1s2  2s0  2p   7d
    4    1be i  2p8d             1s2  2s0  2p   8d
    4    1be i  2p9d             1s2  2s0  2p   9d
    4    1be i  2p10d            1s2  2s0  2p  10d
    4    1be i  2p11d            1s2  2s0  2p  11d
    4    1be i  2p12d            1s2  2s0  2p  12d
    4    1be i  2p13d            1s2  2s0  2p  13d
   -1
    4    1be i  2p5g             1s2  2s0  2p   5g
    4    1be i  2p6g             1s2  2s0  2p   6g
    4    1be i  2p7g             1s2  2s0  2p   7g
    4    1be i  2p8g             1s2  2s0  2p   8g
    4    1be i  2p9g             1s2  2s0  2p   9g
    4    1be i  2p10g            1s2  2s0  2p  10g
    4    1be i  2p11g            1s2  2s0  2p  11g
    4    1be i  2p12g            1s2  2s0  2p  12g
    4    1be i  2p13g            1s2  2s0  2p  13g
   -1
    4    1be i  2p6h             1s2  2s0  2p   6h
    4    1be i  2p7h             1s2  2s0  2p   7h
    4    1be i  2p8h             1s2  2s0  2p   8h
    4    1be i  2p9h             1s2  2s0  2p   9h
    4    1be i  2p10h            1s2  2s0  2p  10h
    4    1be i  2p11h            1s2  2s0  2p  11h
    4    1be i  2s7i             1s2  2s   7i
    4    1be i  2s8i             1s2  2s   8i
    4    1be i  2s9i             1s2  2s   9i
    4    1be i  2s9l             1s2  2s  10l
    4    1be i  2p8k             1s2  2s0  2p   8k
    4    1be i  2p9k             1s2  2s0  2p   9k
    4    1be i  2p10k            1s2  2s0  2p  10k
    4    1be i  2p7i             1s2  2s0  2p   7i
    4    1be i  2p8i             1s2  2s0  2p   8i
    4    1be i  2p9i             1s2  2s0  2p   9i
    4    1be i  2p8k             1s2  2s   8k
    4    1be i  2p9k             1s2  2s   9k
    4    1be i  2p9l             1s2  2s0  2p  10l
   -1
$run cray:rcn2c
$DELETE POOLG:HF040001.DAT;*
$DELETE POOLG:HF040002.DAT;*
$DELETE POOLG:HF040004.DAT;*
$DELETE POOLG:HF040031.DAT;*
$DELETE POOLG:HF040032.DAT;*
