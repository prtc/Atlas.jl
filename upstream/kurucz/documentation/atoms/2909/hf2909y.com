$set def 2909
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf290907.dat for007
$assign poolg:hf290901.dat for001
$assign poolg:hf290902.dat for002
$assign poolg:hf290904.dat for004
$assign hf2909y.pun for011
$assign hf2909y.rrr for012
$assign hf2909y.dat for013
$assign hf2909ye.dat for014
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
   29   10cu x  3d4s             3p6  3d   4s
   29   10cu x  3d5s             3p6  3d   5s
   29   10cu x  3d6s             3p6  3d   6s
   29   10cu x  3d7s             3p6  3d   7s
   29   10cu x  3d8s             3p6  3d   8s
   29   10cu x  3d9s             3p6  3d   9s
   29   10cu x  p5d2 4p          3p5  3d2  4p
   29   10cu x  p5d2 5p          3p5  3d2  5p
   29   10cu x  p5d2 6p          3p5  3d2  6p
   29   10cu x  p5d2 7p          3p5  3d2  7p
   29   10cu x  p5d2 8p          3p5  3d2  8p
   29   10cu x  p5d2 9p          3p5  3d2  9p
   29   10cu x  p5d2 4f          3p5  3d2  4f
   29   10cu x  p5d2 5f          3p5  3d2  5f
   29   10cu x  p5d2 6f          3p5  3d2  6f
   29   10cu x  p5d2 7f          3p5  3d2  7f
   29   10cu x  p5d2 8f          3p5  3d2  8f
   29   10cu x  p5d2 9f          3p5  3d2  9f
   29   10cu x  p5d 4s4p         3p5  3d   4s   4p
   29   10cu x  3d4p             3p6  3d   4p
   29   10cu x  3d5p             3p6  3d   5p
   29   10cu x  3d6p             3p6  3d   6p
   29   10cu x  3d7p             3p6  3d   7p
   29   10cu x  3d8p             3p6  3d   8p
   29   10cu x  3d9p             3p6  3d   9p
   29   10cu x  3d4f             3p6  3d   4f
   29   10cu x  3d5f             3p6  3d   5f
   29   10cu x  3d6f             3p6  3d   6f
   29   10cu x  3d7f             3p6  3d   7f
   29   10cu x  3d8f             3p6  3d   8f
   29   10cu x  3d9f             3p6  3d   9f
   29   10cu x  p5d3             3p5  3d3
   29   10cu x  p5d2 4s          3p5  3d2  4s
   29   10cu x  p5d2 5s          3p5  3d2  5s
   29   10cu x  p5d2 6s          3p5  3d2  6s
   29   10cu x  p5d2 7s          3p5  3d2  7s
   29   10cu x  p5d2 8s          3p5  3d2  8s
   29   10cu x  p5d2 9s          3p5  3d2  9s
   29   10cu x  p5d2 4d          3p5  3d2  4d
   29   10cu x  p5d2 5d          3p5  3d2  5d
   29   10cu x  p5d2 6d          3p5  3d2  6d
   29   10cu x  p5d2 7d          3p5  3d2  7d
   29   10cu x  p5d2 8d          3p5  3d2  8d
   29   10cu x  p5d2 9d          3p5  3d2  9d
   29   10cu x  p5d 4s2          3p5  3d   4s2
   29   10cu x  p5d 4p2          3p5  3d   4p2
   -1
$run cray:rcn2c
$DELETE POOLG:HF290901.DAT;*
$DELETE POOLG:HF290902.DAT;*
$DELETE POOLG:HF290904.DAT;*
$DELETE POOLG:HF290931.DAT;*
$DELETE POOLG:HF290932.DAT;*
