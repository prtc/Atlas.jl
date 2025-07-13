$set def 2606
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf260607.dat for007
$assign poolg:hf260601.dat for001
$assign poolg:hf260602.dat for002
$assign poolg:hf260604.dat for004
$assign hf2606y.pun for011
$assign hf2606y.rrr for012
$assign hf2606y.dat for013
$assign hf2606ye.dat for014
$assign poolg:hf260631.dat for031
$assign poolg:hf260632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   26    7fevii 3d2              3p6  3d2
   26    7fevii 3d4d             3p6  3d   4d
   26    7fevii 3d5d             3p6  3d   5d
   26    7fevii 3d6d             3p6  3d   6d
   26    7fevii 3d7d             3p6  3d   7d
   26    7fevii 3d8d             3p6  3d   8d
   26    7fevii 3d9d             3p6  3d   9d
   26    7fevii 3d4s             3p6  3d   4s
   26    7fevii 3d5s             3p6  3d   5s
   26    7fevii 3d6s             3p6  3d   6s
   26    7fevii 3d7s             3p6  3d   7s
   26    7fevii 3d8s             3p6  3d   8s
   26    7fevii 3d9s             3p6  3d   9s
   26    7fevii p5d2 4p          3p5  3d2  4p
   26    7fevii p5d2 5p          3p5  3d2  5p
   26    7fevii p5d2 6p          3p5  3d2  6p
   26    7fevii p5d2 7p          3p5  3d2  7p
   26    7fevii p5d2 8p          3p5  3d2  8p
   26    7fevii p5d2 9p          3p5  3d2  9p
   26    7fevii p5d 4s4p         3p5  3d   4s   4p
   26    7fevii p5d 4s5p         3p5  3d   4s   5p
   26    7fevii p5d 4s6p         3p5  3d   4s   6p
   26    7fevii p5d 4s7p         3p5  3d   4s   7p
   26    7fevii p5d 4s8p         3p5  3d   4s   8p
   26    7fevii p5d 4s9p         3p5  3d   4s   9p
   26    7fevii p5d2 4f          3p5  3d2  4f
   26    7fevii p5d2 5f          3p5  3d2  5f
   26    7fevii p5d2 6f          3p5  3d2  6f
   26    7fevii p5d2 7f          3p5  3d2  7f
   26    7fevii p5d2 8f          3p5  3d2  8f
   26    7fevii p5d2 9f          3p5  3d2  9f
   26    7fevii p5d 4s4f         3p5  3d   4s   4f
   26    7fevii p5d 4s5f         3p5  3d   4s   5f
   26    7fevii p5d 4s6f         3p5  3d   4s   6f
   26    7fevii p5d 4s7f         3p5  3d   4s   7f
   26    7fevii p5d 4s8f         3p5  3d   4s   8f
   26    7fevii p5d 4s9f         3p5  3d   4s   9f
   26    7fevii 3d4p             3p6  3d   4p
   26    7fevii 3d5p             3p6  3d   5p
   26    7fevii 3d6p             3p6  3d   6p
   26    7fevii 3d7p             3p6  3d   7p
   26    7fevii 3d8p             3p6  3d   8p
   26    7fevii 3d9p             3p6  3d   9p
   26    7fevii p5d 4p2          3p5  3d   4p2
   26    7fevii p5d 4p5p         3p5  3d   4p   5p
   26    7fevii p5d 4p6p         3p5  3d   4p   6p
   26    7fevii p5d 4p7p         3p5  3d   4p   7p
   26    7fevii p5d 4p8p         3p5  3d   4p   8p
   26    7fevii p5d 4p9p         3p5  3d   4p   9p
   26    7fevii 3d4f             3p6  3d   4f
   26    7fevii 3d5f             3p6  3d   5f
   26    7fevii 3d6f             3p6  3d   6f
   26    7fevii 3d7f             3p6  3d   7f
   26    7fevii 3d8f             3p6  3d   8f
   26    7fevii 3d9f             3p6  3d   9f
   26    7fevii p5d3             3p5  3d3
   26    7fevii p5d2 4d          3p5  3d2  4d
   26    7fevii p5d2 5d          3p5  3d2  5d
   26    7fevii p5d2 6d          3p5  3d2  6d
   26    7fevii p5d2 7d          3p5  3d2  7d
   26    7fevii p5d2 8d          3p5  3d2  8d
   26    7fevii p5d2 9d          3p5  3d2  9d
   26    7fevii p5d 4s4d         3p5  3d   4s   4d
   26    7fevii p5d 4s5d         3p5  3d   4s   5d
   26    7fevii p5d 4s6d         3p5  3d   4s   6d
   26    7fevii p5d 4s7d         3p5  3d   4s   7d
   26    7fevii p5d 4s8d         3p5  3d   4s   8d
   26    7fevii p5d 4s9d         3p5  3d   4s   9d
   26    7fevii p5d2 4s          3p5  3d2  4s
   26    7fevii p5d2 5s          3p5  3d2  5s
   26    7fevii p5d2 6s          3p5  3d2  6s
   26    7fevii p5d2 7s          3p5  3d2  7s
   26    7fevii p5d2 8s          3p5  3d2  8s
   26    7fevii p5d2 9s          3p5  3d2  9s
   26    7fevii p5d 4s2          3p5  3d   4s2
   26    7fevii p5d 4s5s         3p5  3d   4s   5s
   26    7fevii p5d 4s6s         3p5  3d   4s   6s
   26    7fevii p5d 4s7s         3p5  3d   4s   7s
   26    7fevii p5d 4s8s         3p5  3d   4s   8s
   26    7fevii p5d 4s9s         3p5  3d   4s   9s
   -1
$run cray:rcn2c
$DELETE POOLG:HF260601.DAT;*
$DELETE POOLG:HF260602.DAT;*
$DELETE POOLG:HF260604.DAT;*
$DELETE POOLG:HF260631.DAT;*
$DELETE POOLG:HF260632.DAT;*
