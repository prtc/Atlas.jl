$set def 2806
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf280607.dat for007
$assign poolg:hf280601.dat for001
$assign poolg:hf280602.dat for002
$assign poolg:hf280604.dat for004
$assign hf2806y.pun for011
$assign hf2806y.rrr for012
$assign hf2806y.dat for013
$assign hf2806yE.dat for014
$assign poolg:hf280631.dat for031
$assign poolg:hf280632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   28    7ni viid4               3p6  3d4
   28    7ni viid3 4d            3p6  3d3  4d
   28    7ni viid3 5d            3p6  3d3  5d
   28    7ni viid3 6d            3p6  3d3  6d
   28    7ni viid3 7d            3p6  3d3  7d
   28    7ni viid3 8d            3p6  3d3  8d
   28    7ni viid3 9d            3p6  3d3  9d
   28    7ni viid3 4s            3p6  3d3  4s
   28    7ni viid3 5s            3p6  3d3  5s
   28    7ni viid3 6s            3p6  3d3  6s
   28    7ni viid3 7s            3p6  3d3  7s
   28    7ni viid3 8s            3p6  3d3  8s
   28    7ni viid3 9s            3p6  3d3  9s
   28    7ni viip5d4 4p          3p5  3d4  4p 
   28    7ni viip5d4 5p          3p5  3d4  5p 
   28    7ni viip5d4 6p          3p5  3d4  6p 
   28    7ni viip5d4 7p          3p5  3d4  7p 
   28    7ni viip5d4 8p          3p5  3d4  8p 
   28    7ni viip5d4 9p          3p5  3d4  9p 
   28    7ni viip5d4 4f          3p5  3d4  4f 
   28    7ni viip5d4 5f          3p5  3d4  5f
   28    7ni viip5d4 6f          3p5  3d4  6f 
   28    7ni viip5d4 7f          3p5  3d4  7f 
   28    7ni viip5d4 8f          3p5  3d4  8f 
   28    7ni viip5d4 9f          3p5  3d4  9f 
   28    7ni viid3 4p            3p6  3d3  4p
   28    7ni viid3 5p            3p6  3d3  5p
   28    7ni viid3 6p            3p6  3d3  6p
   28    7ni viid3 7p            3p6  3d3  7p
   28    7ni viid3 8p            3p6  3d3  8p
   28    7ni viid3 9p            3p6  3d3  9p
   28    7ni viid3 4f            3p6  3d3  4f
   28    7ni viid3 5f            3p6  3d3  5f
   28    7ni viid3 6f            3p6  3d3  6f
   28    7ni viid3 7f            3p6  3d3  7f
   28    7ni viid3 8f            3p6  3d3  8f
   28    7ni viid3 9f            3p6  3d3  9f
   28    7ni viip5d5             3p5  3d5
   28    7ni viip5d4 4s          3p5  3d4  4s 
   28    7ni viip5d4 5s          3p5  3d4  5s 
   28    7ni viip5d4 6s          3p5  3d4  6s 
   28    7ni viip5d4 7s          3p5  3d4  7s 
   28    7ni viip5d4 8s          3p5  3d4  8s 
   28    7ni viip5d4 9s          3p5  3d4  9s 
   28    7ni viip5d4 4d          3p5  3d4  4d 
   28    7ni viip5d4 5d          3p5  3d4  5d 
   28    7ni viip5d4 6d          3p5  3d4  6d 
   28    7ni viip5d4 7d          3p5  3d4  7d 
   28    7ni viip5d4 8d          3p5  3d4  8d 
   28    7ni viip5d4 9d          3p5  3d4  9d 
   -1
$run cray:rcn2c
$DELETE POOLG:HF280601.DAT;*
$DELETE POOLG:HF280602.DAT;*
$DELETE POOLG:HF280604.DAT;*
$DELETE POOLG:HF280631.DAT;*
$DELETE POOLG:HF280632.DAT;*
