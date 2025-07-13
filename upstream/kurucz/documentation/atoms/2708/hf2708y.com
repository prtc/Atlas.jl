$set def 2708
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf270807.dat for007
$assign poolg:hf270801.dat for001
$assign poolg:hf270802.dat for002
$assign poolg:hf270804.dat for004
$assign hf2708Y.pun for011
$assign hf2708Y.rrr for012
$assign hf2708Y.dat for013
$assign hf2708Ye.dat for014
$assign poolg:hf270831.dat for031
$assign poolg:hf270832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   27    8co ix  3p6 3d          3p6  3d
   27    9co ix  3p6 4d          3p6  4d
   27    9co ix  3p6 5d          3p6  5d
   27    9co ix  3p6 6d          3p6  6d
   27    9co ix  3p6 7d          3p6  7d
   27    9co ix  3p6 8d          3p6  8d
   27    9co ix  3p6 9d          3p6  9d
   27    9co ix  3p6 10d         3p6 10d
   27    9co ix  3p6 11d         3p6 11d
   27    9co ix  3p6 12d         3p6 12d
   27    9co ix  3p6 4s          3p6  4s
   27    9co ix  3p6 5s          3p6  5s
   27    9co ix  3p6 6s          3p6  6s
   27    9co ix  3p6 7s          3p6  7s
   27    9co ix  3p6 8s          3p6  8s
   27    9co ix  3p6 9s          3p6  9s
   27    9co ix  3p6 10s         3p6 10s
   27    9co ix  3p6 11s         3p6 11s
   27    9co ix  3p6 12s         3p6 12s
   27    9co ix  3p5 3d4p        3p5  3d   4p
   27    9co ix  3p5 3d5p        3p5  3d   5p
   27    9co ix  3p5 3d6p        3p5  3d   6p
   27    9co ix  3p5 3d7p        3p5  3d   7p
   27    9co ix  3p5 3d8p        3p5  3d   8p
   27    9co ix  3p5 3d9p        3p5  3d   9p
   27    9co ix  3p5 4s4p        3p5  4s   4p
   27    9co ix  3p5 4s5p        3p5  4s   5p
   27    9co ix  3p5 4s6p        3p5  4s   6p
   27    9co ix  3p5 4s7p        3p5  4s   7p
   27    9co ix  3p5 4s8p        3p5  4s   8p
   27    9co ix  3p5 4s9p        3p5  4s   9p
   27    9co ix  3p5 3d4f        3p5  3d   4f
   27    9co ix  3p5 3d5f        3p5  3d   5f
   27    9co ix  3p5 3d6f        3p5  3d   6f
   27    9co ix  3p5 3d7f        3p5  3d   7f
   27    9co ix  3p5 3d8f        3p5  3d   8f
   27    9co ix  3p5 3d9f        3p5  3d   9f
   27    9co ix  3p5 4s4f        3p5  4s   4f
   27    9co ix  3p5 4s5f        3p5  4s   5f
   27    9co ix  3p5 4s6f        3p5  4s   6f
   27    9co ix  3p5 4s7f        3p5  4s   7f
   27    9co ix  3p5 4s8f        3p5  4s   8f
   27    9co ix  3p5 4s9f        3p5  4s   9f
   27    9co ix  3p6 4p          3p6  4p
   27    9co ix  3p6 5p          3p6  5p
   27    9co ix  3p6 6p          3p6  6p
   27    9co ix  3p6 7p          3p6  7p
   27    9co ix  3p6 8p          3p6  8p
   27    9co ix  3p6 9p          3p6  9p
   27    9co ix  3p6 10p         3p6 10p
   27    9co ix  3p6 11p         3p6 11p
   27    9co ix  3p6 12p         3p6 12p
   27    9co ix  3p5 4p2         3p5  4p2
   27    9co ix  3p5 4p5p        3p5  4p   5p
   27    9co ix  3p5 4p6p        3p5  4p   6p
   27    9co ix  3p5 4p7p        3p5  4p   7p
   27    9co ix  3p5 4p8p        3p5  4p   8p
   27    9co ix  3p5 4p9p        3p5  4p   9p
   27    9co ix  3p6 4f          3p6  4f
   27    9co ix  3p6 5f          3p6  5f
   27    9co ix  3p6 6f          3p6  6f
   27    9co ix  3p6 7f          3p6  7f
   27    9co ix  3p6 8f          3p6  8f
   27    9co ix  3p6 9f          3p6  9f
   27    9co ix  3p6 10f         3p6 10f
   27    9co ix  3p6 11f         3p6 11f
   27    9co ix  3p6 12f         3p6 12f
   27    9co ix  3p5 3d2         3p5  3d2
   27    9co ix  3p5 3d4d        3p5  3d   4d
   27    9co ix  3p5 3d5d        3p5  3d   5d
   27    9co ix  3p5 3d6d        3p5  3d   6d
   27    9co ix  3p5 3d7d        3p5  3d   7d
   27    9co ix  3p5 3d8d        3p5  3d   8d
   27    9co ix  3p5 3d9d        3p5  3d   9d
   27    9co ix  3p5 4s4d        3p5  4s   4d
   27    9co ix  3p5 4s5d        3p5  4s   5d
   27    9co ix  3p5 4s6d        3p5  4s   6d
   27    9co ix  3p5 4s7d        3p5  4s   7d
   27    9co ix  3p5 4s8d        3p5  4s   8d
   27    9co ix  3p5 4s9d        3p5  4s   9d
   27    9co ix  3p5 3d4s        3p5  3d   4s
   27    9co ix  3p5 3d5s        3p5  3d   5s
   27    9co ix  3p5 3d6s        3p5  3d   6s
   27    9co ix  3p5 3d7s        3p5  3d   7s
   27    9co ix  3p5 3d8s        3p5  3d   8s
   27    9co ix  3p5 3d9s        3p5  3d   9s
   27    9co ix  3p5 4s2         3p5  4s2
   27    9co ix  3p5 4s5s        3p5  4s   5s
   27    9co ix  3p5 4s6s        3p5  4s   6s
   27    9co ix  3p5 4s7s        3p5  4s   7s
   27    9co ix  3p5 4s8s        3p5  4s   8s
   27    9co ix  3p5 4s9s        3p5  4s   9s
   -1
$run cray:rcn2c
$DELETE POOLG:HF270801.DAT;*
$DELETE POOLG:HF270802.DAT;*
$DELETE POOLG:HF270804.DAT;*
$DELETE POOLG:HF270831.DAT;*
$DELETE POOLG:HF270832.DAT;*
