$set def 0804
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf080407.dat for007
$assign poolg:hf080401.dat for001
$assign poolg:hf080402.dat for002
$assign poolg:hf080404.dat for004
$assign hf0804x.pun for011
$assign hf0804x.rrr for012
$assign hf0804x.dat for013
$assign hf0804eX.dat for014
$assign poolg:hf080431.dat for031
$assign poolg:hf080432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    8    5o v   2s2              1s2  2s2
    8    5o v   2s3s             1s2  2s   3s
    8    5o v   2s4s             1s2  2s   4s
    8    5o v   2s5s             1s2  2s   5s
    8    5o v   2s6s             1s2  2s   6s
    8    5o v   2s7s             1s2  2s   7s
    8    5o v   2s8s             1s2  2s   8s
    8    5o v   2s9s             1s2  2s   9s
    8    5o v   2s10s            1s2  2s  10s
    8    5o v   2s11s            1s2  2s  11s
    8    5o v   2s12s            1s2  2s  12s
    8    5o v   2s13s            1s2  2s  13s
    8    5o v   2s3d             1s2  2s   3d
    8    5o v   2s4d             1s2  2s   4d
    8    5o v   2s5d             1s2  2s   5d
    8    5o v   2s6d             1s2  2s   6d
    8    5o v   2s7d             1s2  2s   7d
    8    5o v   2s8d             1s2  2s   8d
    8    5o v   2s9d             1s2  2s   9d
    8    5o v   2s10d            1s2  2s  10d
    8    5o v   2s11d            1s2  2s  11d
    8    5o v   2s12d            1s2  2s  12d
    8    5o v   2s13d            1s2  2s  13d
    8    5o v   2s5g             1s2  2s   5g
    8    5o v   2s6g             1s2  2s   6g
    8    5o v   2s7g             1s2  2s   7g
    8    5o v   2s8g             1s2  2s   8g
    8    5o v   2s9g             1s2  2s   9g
    8    5o v   2s10g            1s2  2s  10g
    8    5o v   2s11g            1s2  2s  11g
    8    5o v   2s12g            1s2  2s  12g
    8    5o v   2s13g            1s2  2s  13g
    8    5o v   2s7i             1s2  2s   7i
    8    5o v   2s8i             1s2  2s   8i
    8    5o v   2s9i             1s2  2s   9i
    8    5o v   2s10i            1s2  2s  10i
    8    5o v   2s11i            1s2  2s  11i
    8    5o v   2s12i            1s2  2s  12i
    8    5o v   2s13i            1s2  2s  13i
    8    5o v   2p2              1s2  2s0  2p2
    8    5o v   2p3p             1s2  2s0  2p   3p
    8    5o v   2p4p             1s2  2s0  2p   4p
    8    5o v   2p5p             1s2  2s0  2p   5p
    8    5o v   2p6p             1s2  2s0  2p   6p
    8    5o v   2p7p             1s2  2s0  2p   7p
    8    5o v   2p8p             1s2  2s0  2p   8p
    8    5o v   2p9p             1s2  2s0  2p   9p
    8    5o v   2p10p            1s2  2s0  2p  10p
    8    5o v   2p11p            1s2  2s0  2p  11p
    8    5o v   2p12p            1s2  2s0  2p  12p
    8    5o v   2p13p            1s2  2s0  2p  13p
    8    5o v   2p4f             1s2  2s0  2p   4f
    8    5o v   2p5f             1s2  2s0  2p   5f
    8    5o v   2p6f             1s2  2s0  2p   6f
    8    5o v   2p7f             1s2  2s0  2p   7f
    8    5o v   2p8f             1s2  2s0  2p   8f
    8    5o v   2p9f             1s2  2s0  2p   9f
    8    5o v   2p10f            1s2  2s0  2p  10f
    8    5o v   2p11f            1s2  2s0  2p  11f
    8    5o v   2p12f            1s2  2s0  2p  12f
    8    5o v   2p13f            1s2  2s0  2p  13f
    8    5o v   2s2p             1s2  2s   2p
    8    5o v   2s3p             1s2  2s   3p
    8    5o v   2s4p             1s2  2s   4p
    8    5o v   2s5p             1s2  2s   5p
    8    5o v   2s6p             1s2  2s   6p
    8    5o v   2s7p             1s2  2s   7p
    8    5o v   2s8p             1s2  2s   8p
    8    5o v   2s9p             1s2  2s   9p
    8    5o v   2s10p            1s2  2s  10p
    8    5o v   2s11p            1s2  2s  11p
    8    5o v   2s12p            1s2  2s  12p
    8    5o v   2s13p            1s2  2s  13p
    8    5o v   2s4f             1s2  2s   4f
    8    5o v   2s5f             1s2  2s   5f
    8    5o v   2s6f             1s2  2s   6f
    8    5o v   2s7f             1s2  2s   7f
    8    5o v   2s8f             1s2  2s   8f
    8    5o v   2s9f             1s2  2s   9f
    8    5o v   2s10f            1s2  2s  10f
    8    5o v   2s11f            1s2  2s  11f
    8    5o v   2s12f            1s2  2s  12f
    8    5o v   2s13f            1s2  2s  13f
    8    5o v   2s6h             1s2  2s   6h
    8    5o v   2s7h             1s2  2s   7h
    8    5o v   2s8h             1s2  2s   8h
    8    5o v   2s9h             1s2  2s   9h
    8    5o v   2s10h            1s2  2s  10h
    8    5o v   2s11h            1s2  2s  11h
    8    5o v   2s12h            1s2  2s  12h
    8    5o v   2s13h            1s2  2s  13h
    8    5o v   2s8k             1s2  2s   8k
    8    5o v   2s9k             1s2  2s   9k
    8    5o v   2s10k            1s2  2s  10k
    8    5o v   2s11k            1s2  2s  11k
    8    5o v   2s12k            1s2  2s  12k
    8    5o v   2s13k            1s2  2s  13k
    8    5o v   2p3s             1s2  2s0  2p   3s
    8    5o v   2p4s             1s2  2s0  2p   4s
    8    5o v   2p5s             1s2  2s0  2p   5s
    8    5o v   2p6s             1s2  2s0  2p   6s
    8    5o v   2p7s             1s2  2s0  2p   7s
    8    5o v   2p8s             1s2  2s0  2p   8s
    8    5o v   2p9s             1s2  2s0  2p   9s
    8    5o v   2p10s            1s2  2s0  2p  10s
    8    5o v   2p11s            1s2  2s0  2p  11s
    8    5o v   2p12s            1s2  2s0  2p  12s
    8    5o v   2p13s            1s2  2s0  2p  13s
    8    5o v   2p3d             1s2  2s0  2p   3d
    8    5o v   2p4d             1s2  2s0  2p   4d
    8    5o v   2p5d             1s2  2s0  2p   5d
    8    5o v   2p6d             1s2  2s0  2p   6d
    8    5o v   2p7d             1s2  2s0  2p   7d
    8    5o v   2p8d             1s2  2s0  2p   8d
    8    5o v   2p9d             1s2  2s0  2p   9d
    8    5o v   2p10d            1s2  2s0  2p  10d
    8    5o v   2p11d            1s2  2s0  2p  11d
    8    5o v   2p12d            1s2  2s0  2p  12d
    8    5o v   2p13d            1s2  2s0  2p  13d
   -1
    8    5o v   2p6h             1s2  2s0  2p   6h
    8    5o v   2p7h             1s2  2s0  2p   7h
    8    5o v   2p8h             1s2  2s0  2p   8h
    8    5o v   2p9h             1s2  2s0  2p   9h
    8    5o v   2p10h            1s2  2s0  2p  10h
    8    5o v   2p11h            1s2  2s0  2p  11h
    8    5o v   2s7i             1s2  2s   7i
    8    5o v   2s8i             1s2  2s   8i
    8    5o v   2s9i             1s2  2s   9i
    8    5o v   2s9l             1s2  2s  10l
    8    5o v   2p8k             1s2  2s0  2p   8k
    8    5o v   2p9k             1s2  2s0  2p   9k
    8    5o v   2p10k            1s2  2s0  2p  10k
    8    5o v   2p7i             1s2  2s0  2p   7i
    8    5o v   2p8i             1s2  2s0  2p   8i
    8    5o v   2p9i             1s2  2s0  2p   9i
    8    5o v   2p8k             1s2  2s   8k
    8    5o v   2p9k             1s2  2s   9k
    8    5o v   2p9l             1s2  2s0  2p  10l
   -1
$run cray:rcn2c
$DELETE POOLG:HF080401.DAT;*
$DELETE POOLG:HF080402.DAT;*
$DELETE POOLG:HF080404.DAT;*
$DELETE POOLG:HF080431.DAT;*
$DELETE POOLG:HF080432.DAT;*
