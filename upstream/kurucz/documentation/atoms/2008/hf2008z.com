$set def 2008
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200807.dat for007
$assign poolg:hf200801.dat for001
$assign poolg:hf200802.dat for002
$assign poolg:hf200804.dat for004
$assign hf2008z.pun for011
$assign hf2008z.rrr for012
$assign hf2008z.dat for013
$assign hf2008ze.dat for014
$assign poolg:hf200831.dat for031
$assign poolg:hf200832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    9ca ix  3s2             3s2
   20    9ca ix  3s5g            3s   5g
   20    9ca ix  3s6g            3s   6g
   20    9ca ix  3s7g            3s   7g
   20    9ca ix  3s8g            3s   8g
   20    9ca ix  3s9g            3s   9g
   20    9ca ix  3d5g            3d   5g
   20    9ca ix  3d6g            3d   6g
   20    9ca ix  3d7g            3d   7g
   20    9ca ix  3d8g            3d   8g
   20    9ca ix  3d9g            3d   9g
   20    9ca ix  3s7i            3s   7i
   20    9ca ix  3s8i            3s   8i
   20    9ca ix  3s9i            3s   9i
   20    9ca ix  3d7i            3d   7i
   20    9ca ix  3d8i            3d   8i
   20    9ca ix  3d9i            3d   9i
   20    9ca ix  3s4f            3s   4f
   20    9ca ix  3s5f            3s   5f
   20    9ca ix  3s6f            3s   6f
   20    9ca ix  3s7f            3s   7f
   20    9ca ix  3s8f            3s   8f
   20    9ca ix  3s9f            3s   9f
   20    9ca ix  3s10f           3s  10f
   20    9ca ix  3s11f           3s  11f
   20    9ca ix  3s12f           3s  12f
   20    9ca ix  3d4f            3d   4f
   20    9ca ix  3d5f            3d   5f
   20    9ca ix  3d6f            3d   6f
   20    9ca ix  3d7f            3d   7f
   20    9ca ix  3d8f            3d   8f
   20    9ca ix  3d9f            3d   9f
   20    9ca ix  3d10f           3d  10f
   20    9ca ix  3d11f           3d  11f
   20    9ca ix  3d12f           3d  12f
   20    9ca ix  3s6h            3s   6h
   20    9ca ix  3s7h            3s   7h
   20    9ca ix  3s8h            3s   8h
   20    9ca ix  3s9h            3s   9h
   20    9ca ix  3d6h            3d   6h
   20    9ca ix  3d7h            3d   7h
   20    9ca ix  3d8h            3d   8h
   20    9ca ix  3d9h            3d   9h
   20    9ca ix  3s8k            3s   8k
   20    9ca ix  3s9k            3s   9k
   20    9ca ix  3d8k            3d   8k
   20    9ca ix  3d9k            3d   9k
   -1
$run cray:rcn2c
$DELETE POOLG:HF200801.DAT;*
$DELETE POOLG:HF200802.DAT;*
$DELETE POOLG:HF200804.DAT;*
$DELETE POOLG:HF200831.DAT;*
$DELETE POOLG:HF200832.DAT;*
