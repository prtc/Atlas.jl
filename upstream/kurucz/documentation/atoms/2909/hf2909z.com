$set def 2909
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290907.dat for007
$assign poolg:hf290901.dat for001
$assign poolg:hf290902.dat for002
$assign poolg:hf290904.dat for004
$assign hf2909z.pun for011
$assign hf2909z.rrr for012
$assign hf2909z.dat for013
$assign hf2909ze.dat for014
$assign poolg:hf290931.dat for031
$assign poolg:hf290932.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   29   10cu x  3d2              3p6  3d2
   29   10cu x  3d4d             3p6  3d   4d
   29   10cu x  3d5d             3p6  3d   5d
   29   10cu x  3d6d             3p6  3d   6d
   29   10cu x  3d7d             3p6  3d   7d
   29   10cu x  3d8d             3p6  3d   8d
   29   10cu x  3d9d             3p6  3d   9d
   29   10cu x  3d10d            3p6  3d  10d
   29   10cu x  3d11d            3p6  3d  11d
   29   10cu x  3d12d            3p6  3d  12d
   29   10cu x  3d13d            3p6  3d  13d
   29   10cu x  3d14d            3p6  3d  14d
   29   10cu x  3d4s             3p6  3d   4s
   29   10cu x  3d5s             3p6  3d   5s
   29   10cu x  3d6s             3p6  3d   6s
   29   10cu x  3d7s             3p6  3d   7s
   29   10cu x  3d8s             3p6  3d   8s
   29   10cu x  3d9s             3p6  3d   9s
   29   10cu x  3d10s            3p6  3d  10s
   29   10cu x  3d11s            3p6  3d  11s
   29   10cu x  3d12s            3p6  3d  12s
   29   10cu x  3d13s            3p6  3d  13s
   29   10cu x  3d14s            3p6  3d  14s
   29   10cu x  4s2              3p6  4s2
   29   10cu x  4s5s             3p6  4s   5s
   29   10cu x  4s6s             3p6  4s   6s
   29   10cu x  4s7s             3p6  4s   7s
   29   10cu x  4s8s             3p6  4s   8s
   29   10cu x  4s9s             3p6  4s   9s
   29   10cu x  4s10s            3p6  4s  10s
   29   10cu x  4s11s            3p6  4s  11s
   29   10cu x  4s12s            3p6  4s  12s
   29   10cu x  4s13s            3p6  4s  13s
   29   10cu x  4s14s            3p6  4s  14s
   29   10cu x  4s4d             3p6  4s   4d
   29   10cu x  4s5d             3p6  4s   5d
   29   10cu x  4s6d             3p6  4s   6d
   29   10cu x  4s7d             3p6  4s   7d
   29   10cu x  4s8d             3p6  4s   8d
   29   10cu x  4s9d             3p6  4s   9d
   29   10cu x  4s10d            3p6  4s  10d
   29   10cu x  4s11d            3p6  4s  11d
   29   10cu x  4s12d            3p6  4s  12d
   29   10cu x  4s13d            3p6  4s  13d
   29   10cu x  4s14d            3p6  4s  14d
   29   10cu x  4s5g             3p6  4s   5g
   29   10cu x  4s6g             3p6  4s   6g
   29   10cu x  4s7g             3p6  4s   7g
   29   10cu x  4s8g             3p6  4s   8g
   29   10cu x  4s9g             3p6  4s   9g
   29   10cu x  3d5g             3p6  3d   5g
   29   10cu x  3d6g             3p6  3d   6g
   29   10cu x  3d7g             3p6  3d   7g
   29   10cu x  3d8g             3p6  3d   8g
   29   10cu x  3d9g             3p6  3d   9g
   29   10cu x  3d7i             3p6  3d   7i
   29   10cu x  3d8i             3p6  3d   8i
   29   10cu x  3d9i             3p6  3d   9i
   29   10cu x  4s7i             3p6  4s   7i
   29   10cu x  4s8i             3p6  4s   8i
   29   10cu x  4s9i             3p6  4s   9i
   29   10cu x  p5d3             3p5  3d3
   29   10cu x  p5d2 4d          3p5  3d2  4d
   29   10cu x  p5d2 5d          3p5  3d2  5d
   29   10cu x  p5d2 6d          3p5  3d2  6d
   29   10cu x  p5d2 7d          3p5  3d2  7d
   29   10cu x  p5d2 8d          3p5  3d2  8d
   29   10cu x  p5d2 9d          3p5  3d2  9d
   29   10cu x  3d4p             3p6  3d   4p
   29   10cu x  3d5p             3p6  3d   5p
   29   10cu x  3d6p             3p6  3d   6p
   29   10cu x  3d7p             3p6  3d   7p
   29   10cu x  3d8p             3p6  3d   8p
   29   10cu x  3d9p             3p6  3d   9p
   29   10cu x  3d10p            3p6  3d  10p
   29   10cu x  3d11p            3p6  3d  11p
   29   10cu x  3d12p            3p6  3d  12p
   29   10cu x  3d13p            3p6  3d  13p
   29   10cu x  3d14p            3p6  3d  14p
   29   10cu x  4s4p             3p6  4s   4p
   29   10cu x  4s5p             3p6  4s   5p
   29   10cu x  4s6p             3p6  4s   6p
   29   10cu x  4s7p             3p6  4s   7p
   29   10cu x  4s8p             3p6  4s   8p
   29   10cu x  4s9p             3p6  4s   9p
   29   10cu x  4s10p            3p6  4s  10p
   29   10cu x  4s11p            3p6  4s  11p
   29   10cu x  4s12p            3p6  4s  12p
   29   10cu x  4s13p            3p6  4s  13p
   29   10cu x  3d4f             3p6  3d   4f
   29   10cu x  3d5f             3p6  3d   5f
   29   10cu x  3d6f             3p6  3d   6f
   29   10cu x  3d7f             3p6  3d   7f
   29   10cu x  3d8f             3p6  3d   8f
   29   10cu x  3d9f             3p6  3d   9f
   29   10cu x  3d10f            3p6  3d  10f
   29   10cu x  3d11f            3p6  3d  11f
   29   10cu x  3d12f            3p6  3d  12f
   29   10cu x  3d13f            3p6  3d  13f
   29   10cu x  3d14f            3p6  3d  14f
   29   10cu x  4s4f             3p6  4s   4f
   29   10cu x  4s5f             3p6  4s   5f
   29   10cu x  4s6f             3p6  4s   6f
   29   10cu x  4s7f             3p6  4s   7f
   29   10cu x  4s8f             3p6  4s   8f
   29   10cu x  4s9f             3p6  4s   9f
   29   10cu x  4s10f            3p6  4s  10f
   29   10cu x  4s11f            3p6  4s  11f
   29   10cu x  4s12f            3p6  4s  12f
   29   10cu x  4s13f            3p6  4s  13f
   29   10cu x  3d6h             3p6  3d   6h
   29   10cu x  3d7h             3p6  3d   7h
   29   10cu x  3d8h             3p6  3d   8h
   29   10cu x  3d9h             3p6  3d   9h
   29   10cu x  4s6h             3p6  4s   6h
   29   10cu x  4s7h             3p6  4s   7h
   29   10cu x  4s8h             3p6  4s   8h
   29   10cu x  4s9h             3p6  4s   9h
   29   10cu x  4s8k             3p6  4s   8k
   29   10cu x  4s9k             3p6  4s   9k
   29   10cu x  3d8k             3p6  3d   8k
   29   10cu x  3d9k             3p6  3d   9k
   -1
   29   10cu x  4s15d            3p6  4s  15d
   29   10cu x  3d9l             3p6  3d  10l
   29   10cu x  4s9l             3p6  4s  10l
   29   10cu x  4p4s             3p6  4p   4s
   29   10cu x  4p5s             3p6  4p   5s
   29   10cu x  4p6s             3p6  4p   6s
   -1
$run cray:rcn2c
$DELETE POOLG:HF290901.DAT;*
$DELETE POOLG:HF290902.DAT;*
$DELETE POOLG:HF290904.DAT;*
$DELETE POOLG:HF290931.DAT;*
$DELETE POOLG:HF290932.DAT;*
