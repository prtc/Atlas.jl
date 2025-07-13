$set def 2605
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf260507.dat for007
$assign poolg:hf260501.dat for001
$assign poolg:hf260502.dat for002
$assign poolg:hf260504.dat for004
$assign hf2605Y.pun for011
$assign hf2605Y.rrr for012
$assign hf2605Y.dat for013
$assign hf2605Ye.dat for014
$assign poolg:hf260531.dat for031
$assign poolg:hf260532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   26    6fe vi d3               3p6  3d3
   26    6fe vi d2 4d            3p6  3d2  4d
   26    6fe vi d2 5d            3p6  3d2  5d
   26    6fe vi d2 6d            3p6  3d2  6d
   26    6fe vi d2 7d            3p6  3d2  7d
   26    6fe vi d2 8d            3p6  3d2  8d
   26    6fe vi d2 9d            3p6  3d2  9d
   26    6fe vi d2 10d           3p6  3d2 10d
   26    6fe vi d2 11d           3p6  3d2 11d
   26    6fe vi d2 4s            3p6  3d2  4s
   26    6fe vi d2 5s            3p6  3d2  5s
   26    6fe vi d2 6s            3p6  3d2  6s
   26    6fe vi d2 7s            3p6  3d2  7s
   26    6fe vi d2 8s            3p6  3d2  8s
   26    6fe vi d2 9s            3p6  3d2  9s
   26    6fe vi d2 10s           3p6  3d2 10s
   26    6fe vi p5d3 4p          3p5  3d3  4p
   26    6fe vi p5d3 5p          3p5  3d3  5p
   26    6fe vi p5d3 6p          3p5  3d3  6p
   26    6fe vi p5d3 7p          3p5  3d3  7p
   26    6fe vi p5d3 8p          3p5  3d3  8p
   26    6fe vi p5d3 9p          3p5  3d3  9p
   26    6fe vi p5d3 4f          3p5  3d3  4f
   26    6fe vi p5d3 5f          3p5  3d3  5f
   26    6fe vi p5d3 6f          3p5  3d3  6f
   26    6fe vi p5d3 7f          3p5  3d3  7f
   26    6fe vi p5d3 8f          3p5  3d3  8f
   26    6fe vi p5d3 9f          3p5  3d3  9f
   26    6fe vi d2 4p            3p6  3d2  4p
   26    6fe vi d2 5p            3p6  3d2  5p
   26    6fe vi d2 6p            3p6  3d2  6p
   26    6fe vi d2 7p            3p6  3d2  7p
   26    6fe vi d2 8p            3p6  3d2  8p
   26    6fe vi d2 9p            3p6  3d2  9p
   26    6fe vi d2 10p           3p6  3d2 10p
   26    6fe vi d2 11p           3p6  3d2 11p
   26    6fe vi d2 4f            3p6  3d2  4f
   26    6fe vi d2 5f            3p6  3d2  5f
   26    6fe vi d2 6f            3p6  3d2  6f
   26    6fe vi d2 7f            3p6  3d2  7f
   26    6fe vi d2 8f            3p6  3d2  8f
   26    6fe vi d2 9f            3p6  3d2  9f
   26    6fe vi d2 10f           3p6  3d2 10f
   26    6fe vi d2 11f           3p6  3d2 11f
   26    6fe vi p5d4             3p5  3d4  
   26    6fe vi p5d3 4s          3p5  3d3  4s
   26    6fe vi p5d3 5s          3p5  3d3  5s
   26    6fe vi p5d3 6s          3p5  3d3  6s
   26    6fe vi p5d3 7s          3p5  3d3  7s
   26    6fe vi p5d3 8s          3p5  3d3  8s
   26    6fe vi p5d3 9s          3p5  3d3  9s
   26    6fe vi p5d3 4d          3p5  3d3  4d
   26    6fe vi p5d3 5d          3p5  3d3  5d
   26    6fe vi p5d3 6d          3p5  3d3  6d
   26    6fe vi p5d3 7d          3p5  3d3  7d
   26    6fe vi p5d3 8d          3p5  3d3  8d
   26    6fe vi p5d3 9d          3p5  3d3  9d
   -1
$run cray:rcn2c
$DELETE POOLG:HF260501.DAT;*
$DELETE POOLG:HF260502.DAT;*
$DELETE POOLG:HF260504.DAT;*
$DELETE POOLG:HF260531.DAT;*
$DELETE POOLG:HF260532.DAT;*
