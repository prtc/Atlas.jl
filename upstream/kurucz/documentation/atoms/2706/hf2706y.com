$!set def 2706
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf270607.dat for007
$assign poolg:hf270601.dat for001
$assign poolg:hf270602.dat for002
$assign poolg:hf270604.dat for004
$assign hf2706Y.pun for011
$assign hf2706Y.rrr for012
$assign hf2706Y.dat for013
$assign hf2706Ye.dat for014
$assign poolg:hf270631.dat for031
$assign poolg:hf270632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   27    7covii d3               3p6  3d3
   27    7covii d2 4d            3p6  3d2  4d
   27    7covii d2 5d            3p6  3d2  5d
   27    7covii d2 6d            3p6  3d2  6d
   27    7covii d2 7d            3p6  3d2  7d
   27    7covii d2 8d            3p6  3d2  8d
   27    7covii d2 9d            3p6  3d2  9d
   27    7covii d2 10d           3p6  3d2 10d
   27    7covii d2 11d           3p6  3d2 11d
   27    7covii d2 4s            3p6  3d2  4s
   27    7covii d2 5s            3p6  3d2  5s
   27    7covii d2 6s            3p6  3d2  6s
   27    7covii d2 7s            3p6  3d2  7s
   27    7covii d2 8s            3p6  3d2  8s
   27    7covii d2 9s            3p6  3d2  9s
   27    7covii d2 10s           3p6  3d2 10s
   27    7covii p5d3 4p          3p5  3d3  4p
   27    7covii p5d3 5p          3p5  3d3  5p
   27    7covii p5d3 6p          3p5  3d3  6p
   27    7covii p5d3 7p          3p5  3d3  7p
   27    7covii p5d3 8p          3p5  3d3  8p
   27    7covii p5d3 9p          3p5  3d3  9p
   27    7covii p5d3 4f          3p5  3d3  4f
   27    7covii p5d3 5f          3p5  3d3  5f
   27    7covii p5d3 6f          3p5  3d3  6f
   27    7covii p5d3 7f          3p5  3d3  7f
   27    7covii p5d3 8f          3p5  3d3  8f
   27    7covii p5d3 9f          3p5  3d3  9f
   27    7covii d2 4p            3p6  3d2  4p
   27    7covii d2 5p            3p6  3d2  5p
   27    7covii d2 6p            3p6  3d2  6p
   27    7covii d2 7p            3p6  3d2  7p
   27    7covii d2 8p            3p6  3d2  8p
   27    7covii d2 9p            3p6  3d2  9p
   27    7covii d2 10p           3p6  3d2 10p
   27    7covii d2 11p           3p6  3d2 11p
   27    7covii d2 4f            3p6  3d2  4f
   27    7covii d2 5f            3p6  3d2  5f
   27    7covii d2 6f            3p6  3d2  6f
   27    7covii d2 7f            3p6  3d2  7f
   27    7covii d2 8f            3p6  3d2  8f
   27    7covii d2 9f            3p6  3d2  9f
   27    7covii d2 10f           3p6  3d2 10f
   27    7covii d2 11f           3p6  3d2 11f
   27    7covii p5d4             3p5  3d4  
   27    7covii p5d3 4s          3p5  3d3  4s
   27    7covii p5d3 5s          3p5  3d3  5s
   27    7covii p5d3 6s          3p5  3d3  6s
   27    7covii p5d3 7s          3p5  3d3  7s
   27    7covii p5d3 8s          3p5  3d3  8s
   27    7covii p5d3 9s          3p5  3d3  9s
   27    7covii p5d3 4d          3p5  3d3  4d
   27    7covii p5d3 5d          3p5  3d3  5d
   27    7covii p5d3 6d          3p5  3d3  6d
   27    7covii p5d3 7d          3p5  3d3  7d
   27    7covii p5d3 8d          3p5  3d3  8d
   27    7covii p5d3 9d          3p5  3d3  9d
   27    7covii p5d2s2           3p5  3d2  4s2
   -1
$run cray:rcn2c
$DELETE POOLG:HF270601.DAT;*
$DELETE POOLG:HF270602.DAT;*
$DELETE POOLG:HF270604.DAT;*
$DELETE POOLG:HF270631.DAT;*
$DELETE POOLG:HF270632.DAT;*
