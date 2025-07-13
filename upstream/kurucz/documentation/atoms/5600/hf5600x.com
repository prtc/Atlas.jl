$set def 5600
$assign sys$input for010
$assign sys$output for009
$assign 5600:hf560007.dat for007
$assign 5600:hf560001.dat for001
$assign 5600:hf560002.dat for002
$assign 5600:hf560004.dat for004
$assign hf5600x.pun for011
$assign hf5600x.rrr for012
$assign hf5600x.dat for013
$assign hf5600xe.dat for014
$assign pool:hf560031.dat for031
$assign pool:hf560032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   56    1ba i  6s2              6s2
   56    1ba i  6s7s             6s1  7s
   56    1ba i  6s8s             6s1  8s
   56    1ba i  6s9s             6s1  9s
   56    1ba i  6s10s            6s1 10s
   56    1ba i  6s11s            6s1 11s
   56    1ba i  6s12s            6s1 12s
   56    1ba i  6s13s            6s1 13s
   56    1ba i  6s14s            6s1 14s
   56    1ba i  6s15s            6s1 15s
   56    1ba i  5d6s             5d1  6s
   56    1ba i  5d7s             5d1  7s
   56    1ba i  5d8s             5d1  8s
   56    1ba i  5d9s             5d1  9s
   56    1ba i  5d10s            5d1 10s
   56    1ba i  5d11s            5d1 11s
   56    1ba i  5d12s            5d1 12s
   56    1ba i  5d13s            5d1 13s
   56    1ba i  5d14s            5d1 14s
   56    1ba i  5d15s            5d1 15s
   56    1ba i  6s6d             6s1  6d
   56    1ba i  6s7d             6s1  7d
   56    1ba i  6s8d             6s1  8d
   56    1ba i  6s9d             6s1  9d
   56    1ba i  6s10d            6s1 10d
   56    1ba i  6s11d            6s1 11d
   56    1ba i  6s12d            6s1 12d
   56    1ba i  6s13d            6s1 13d
   56    1ba i  6s14d            6s1 14d
   56    1ba i  6s15d            6s1 15d
   56    1ba i  5d2              5d2
   56    1ba i  5d6d             5d1  6d
   56    1ba i  5d7d             5d1  7d
   56    1ba i  5d8d             5d1  8d
   56    1ba i  5d9d             5d1  9d
   56    1ba i  5d10d            5d1 10d
   56    1ba i  5d11d            5d1 11d
   56    1ba i  5d12d            5d1 12d
   56    1ba i  5d13d            5d1 13d
   56    1ba i  5d14d            5d1 14d
   56    1ba i  5d15d            5d1 15d
   56    1ba i  6s5g             6s1  5g
   56    1ba i  6s6g             6s1  6g
   56    1ba i  6s7g             6s1  7g
   56    1ba i  6s8g             6s1  8g
   56    1ba i  6s9g             6s1  9g
   56    1ba i  6s10g            6s1 10g
   56    1ba i  5d5g             5d1  5g
   56    1ba i  5d6g             5d1  6g
   56    1ba i  5d7g             5d1  7g
   56    1ba i  5d8g             5d1  8g
   56    1ba i  5d9g             5d1  9g
   56    1ba i  5d10g            5d1 10g
   56    1ba i  6s7i             6s1  7i
   56    1ba i  6s8i             6s1  8i
   56    1ba i  6s9i             6s1  9i
   56    1ba i  5d7i             5d1  7i
   56    1ba i  5d8i             5d1  8i
   56    1ba i  5d9i             5d1  9i
   56    1ba i  6p2              6p2
   56    1ba i  6p7p             6p   7p
   56    1ba i  6s6p             6s1  6p
   56    1ba i  6s7p             6s1  7p
   56    1ba i  6s8p             6s1  8p
   56    1ba i  6s9p             6s1  9p
   56    1ba i  6s10p            6s1 10p
   56    1ba i  6s11p            6s1 11p
   56    1ba i  6s12p            6s1 12p
   56    1ba i  6s13p            6s1 13p
   56    1ba i  6s14p            6s1 14p
   56    1ba i  6s15p            6s1 15p
   56    1ba i  5d6p             5d1  6p
   56    1ba i  5d7p             5d1  7p
   56    1ba i  5d8p             5d1  8p
   56    1ba i  5d9p             5d1  9p
   56    1ba i  5d10p            5d1 10p
   56    1ba i  5d11p            5d1 11p
   56    1ba i  5d12p            5d1 12p
   56    1ba i  5d13p            5d1 13p
   56    1ba i  5d14p            5d1 14p
   56    1ba i  5d15p            5d1 15p
   56    1ba i  6s4f             6s1  4f
   56    1ba i  6s5f             6s1  5f
   56    1ba i  6s6f             6s1  6f
   56    1ba i  6s7f             6s1  7f
   56    1ba i  6s8f             6s1  8f
   56    1ba i  6s9f             6s1  9f
   56    1ba i  6s10f            6s1 10f
   56    1ba i  6s11f            6s1 11f
   56    1ba i  6s12f            6s1 12f
   56    1ba i  6s13f            6s1 13f
   56    1ba i  6s14f            6s1 14f
   56    1ba i  5d4f             5d1  4f
   56    1ba i  5d5f             5d1  5f
   56    1ba i  5d6f             5d1  6f
   56    1ba i  5d7f             5d1  7f
   56    1ba i  5d8f             5d1  8f
   56    1ba i  5d9f             5d1  9f
   56    1ba i  5d10f            5d1 10f
   56    1ba i  5d11f            5d1 11f
   56    1ba i  5d12f            5d1 12f
   56    1ba i  5d13f            5d1 13f
   56    1ba i  5d14f            5d1 14f
   56    1ba i  6s6h             6s1  6h
   56    1ba i  6s7h             6s1  7h
   56    1ba i  6s8h             6s1  8h
   56    1ba i  6s9h             6s1  9h
   56    1ba i  6s10h            6s1 10h
   56    1ba i  5d6h             5d1  6h
   56    1ba i  5d7h             5d1  7h
   56    1ba i  5d8h             5d1  8h
   56    1ba i  5d9h             5d1  9h
   56    1ba i  5d10h            5d1 10h
   56    1ba i  6s8k             6s1  8k
   56    1ba i  6s9k             6s1  9k
   56    1ba i  6s10k            6s1 10k
   56    1ba i  5d8k             5d1  8k
   56    1ba i  5d9k             5d1  9k
   56    1ba i  5d10k            5d1 10k
   56    1ba i  6p7s             6p   7s
   56    1ba i  6p8s             6p   8s
   56    1ba i  6p9s             6p   9s
   -1
   56    1ba i  5d9l             5d1 10l
   56    1ba i  6s9l             6s1 10l
   -1
$run cray:rcn2c
$DELETE POOL:HF560001.DAT;*
$DELETE POOL:HF560002.DAT;*
$DELETE POOL:HF560004.DAT;*
$DELETE POOL:HF560031.DAT;*
$DELETE POOL:HF560032.DAT;*
