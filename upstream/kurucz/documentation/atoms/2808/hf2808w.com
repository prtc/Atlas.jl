$set def 2808
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf280807.dat for007
$assign poolg:hf280801.dat for001
$assign poolg:hf280802.dat for002
$assign poolg:hf280804.dat for004
$assign hf2808w.pun for011
$assign hf2808w.rrr for012
$assign hf2808w.dat for013
$assign hf2808we.dat for014
$assign poolg:hf280831.dat for031
$assign poolg:hf280832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   28    9ni ix 3d2              3p6  3d2
   28    9ni ix 3d4d             3p6  3d   4d
   28    9ni ix 3d5d             3p6  3d   5d
   28    9ni ix 3d6d             3p6  3d   6d
   28    9ni ix 3d7d             3p6  3d   7d
   28    9ni ix 3d8d             3p6  3d   8d
   28    9ni ix 3d9d             3p6  3d   9d
   28    9ni ix 3d4s             3p6  3d   4s
   28    9ni ix 3d5s             3p6  3d   5s
   28    9ni ix 3d6s             3p6  3d   6s
   28    9ni ix 3d7s             3p6  3d   7s
   28    9ni ix 3d8s             3p6  3d   8s
   28    9ni ix 3d9s             3p6  3d   9s
   28    9ni ix 4p2              3p6  4p2
   28    9ni ix 4p5p             3p6  4p   5p
   28    9ni ix 4p6p             3p6  4p   6p
   28    9ni ix 4p7p             3p6  4p   7p
   28    9ni ix 4p8p             3p6  4p   8p
   28    9ni ix 4p9p             3p6  4p   9p
   28    9ni ix 4p4f             3p6  4p   4f
   28    9ni ix 4p5f             3p6  4p   5f
   28    9ni ix 4p6f             3p6  4p   6f
   28    9ni ix 4p7f             3p6  4p   7f
   28    9ni ix 4p8f             3p6  4p   8f
   28    9ni ix 4p9f             3p6  4p   9f
   28    9ni ix p5d3             3p5  3d3
   28    9ni ix 3d4p             3p6  3d   4p
   28    9ni ix 3d5p             3p6  3d   5p
   28    9ni ix 3d6p             3p6  3d   6p
   28    9ni ix 3d7p             3p6  3d   7p
   28    9ni ix 3d8p             3p6  3d   8p
   28    9ni ix 3d9p             3p6  3d   9p
   28    9ni ix 3d4f             3p6  3d   4f
   28    9ni ix 3d5f             3p6  3d   5f
   28    9ni ix 3d6f             3p6  3d   6f
   28    9ni ix 3d7f             3p6  3d   7f
   28    9ni ix 3d8f             3p6  3d   8f
   28    9ni ix 3d9f             3p6  3d   9f
   28    9ni ix 4p5s             3p6  4p   5s
   28    9ni ix 4p6s             3p6  4p   6s
   28    9ni ix 4p7s             3p6  4p   7s
   28    9ni ix 4p8s             3p6  4p   8s
   28    9ni ix 4p9s             3p6  4p   9s
   28    9ni ix 4p4d             3p6  4p   4d
   28    9ni ix 4p5d             3p6  4p   5d
   28    9ni ix 4p6d             3p6  4p   6d
   28    9ni ix 4p7d             3p6  4p   7d
   28    9ni ix 4p8d             3p6  4p   8d
   28    9ni ix 4p9d             3p6  4p   9d
   -1
$run cray:rcn2c
$DELETE POOLG:HF280801.DAT;*
$DELETE POOLG:HF280802.DAT;*
$DELETE POOLG:HF280804.DAT;*
$DELETE POOLG:HF280831.DAT;*
$DELETE POOLG:HF280832.DAT;*
