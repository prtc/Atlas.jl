$set def 2807
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf280707.dat for007
$assign poolg:hf280701.dat for001
$assign poolg:hf280702.dat for002
$assign poolg:hf280704.dat for004
$assign hf2807Y.pun for011
$assign hf2807Y.rrr for012
$assign hf2807Y.dat for013
$assign hf2807Ye.dat for014
$assign poolg:hf280731.dat for031
$assign poolg:hf280732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   28    8niviiid3               3p6  3d3
   28    8niviiid2 4d            3p6  3d2  4d
   28    8niviiid2 5d            3p6  3d2  5d
   28    8niviiid2 6d            3p6  3d2  6d
   28    8niviiid2 7d            3p6  3d2  7d
   28    8niviiid2 8d            3p6  3d2  8d
   28    8niviiid2 9d            3p6  3d2  9d
   28    8niviiid2 10d           3p6  3d2 10d
   28    8niviiid2 11d           3p6  3d2 11d
   28    8niviiid2 4s            3p6  3d2  4s
   28    8niviiid2 5s            3p6  3d2  5s
   28    8niviiid2 6s            3p6  3d2  6s
   28    8niviiid2 7s            3p6  3d2  7s
   28    8niviiid2 8s            3p6  3d2  8s
   28    8niviiid2 9s            3p6  3d2  9s
   28    8niviiid2 10s           3p6  3d2 10s
   28    8niviiip5d3 4p          3p5  3d3  4p
   28    8niviiip5d3 5p          3p5  3d3  5p
   28    8niviiip5d3 6p          3p5  3d3  6p
   28    8niviiip5d3 7p          3p5  3d3  7p
   28    8niviiip5d3 8p          3p5  3d3  8p
   28    8niviiip5d3 9p          3p5  3d3  9p
   28    8niviiip5d3 4f          3p5  3d3  4f
   28    8niviiip5d3 5f          3p5  3d3  5f
   28    8niviiip5d3 6f          3p5  3d3  6f
   28    8niviiip5d3 7f          3p5  3d3  7f
   28    8niviiip5d3 8f          3p5  3d3  8f
   28    8niviiip5d3 9f          3p5  3d3  9f
   28    8niviiid2 4p            3p6  3d2  4p
   28    8niviiid2 5p            3p6  3d2  5p
   28    8niviiid2 6p            3p6  3d2  6p
   28    8niviiid2 7p            3p6  3d2  7p
   28    8niviiid2 8p            3p6  3d2  8p
   28    8niviiid2 9p            3p6  3d2  9p
   28    8niviiid2 10p           3p6  3d2 10p
   28    8niviiid2 11p           3p6  3d2 11p
   28    8niviiid2 4f            3p6  3d2  4f
   28    8niviiid2 5f            3p6  3d2  5f
   28    8niviiid2 6f            3p6  3d2  6f
   28    8niviiid2 7f            3p6  3d2  7f
   28    8niviiid2 8f            3p6  3d2  8f
   28    8niviiid2 9f            3p6  3d2  9f
   28    8niviiid2 10f           3p6  3d2 10f
   28    8niviiid2 11f           3p6  3d2 11f
   28    8niviiip5d4             3p5  3d4  
   28    8niviiip5d3 4s          3p5  3d3  4s
   28    8niviiip5d3 5s          3p5  3d3  5s
   28    8niviiip5d3 6s          3p5  3d3  6s
   28    8niviiip5d3 7s          3p5  3d3  7s
   28    8niviiip5d3 8s          3p5  3d3  8s
   28    8niviiip5d3 9s          3p5  3d3  9s
   28    8niviiip5d3 4d          3p5  3d3  4d
   28    8niviiip5d3 5d          3p5  3d3  5d
   28    8niviiip5d3 6d          3p5  3d3  6d
   28    8niviiip5d3 7d          3p5  3d3  7d
   28    8niviiip5d3 8d          3p5  3d3  8d
   28    8niviiip5d3 9d          3p5  3d3  9d
   -1
$run cray:rcn2c
$DELETE POOLG:HF280701.DAT;*
$DELETE POOLG:HF280702.DAT;*
$DELETE POOLG:HF280704.DAT;*
$DELETE POOLG:HF280731.DAT;*
$DELETE POOLG:HF280732.DAT;*
