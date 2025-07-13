$set DEF 2305
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf230507.dat for007
$assign poolg:hf230501.dat for001
$assign poolg:hf230502.dat for002
$assign poolg:hf230504.dat for004
$assign hf2305y.pun for011
$assign hf2305y.rrr for012
$assign hf2305y.dat for013
$assign hf2305ye.dat for014
$assign poolg:hf230531.dat for031
$assign poolg:hf230532.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   23    6v vi  s2p6             3s2  3p6
   23    6v vi  s2p5 4p          3s2  3p5  4p
   23    6v vi  s2p5 5p          3s2  3p5  5p
   23    6v vi  s2p5 6p          3s2  3p5  6p
   23    6v vi  s2p5 7p          3s2  3p5  7p
   23    6v vi  s2p5 8p          3s2  3p5  8p
   23    6v vi  s2p5 9p          3s2  3p5  9p
   23    6v vi  s2p5 4f          3s2  3p5  4f
   23    6v vi  s2p5 5f          3s2  3p5  5f
   23    6v vi  s2p5 6f          3s2  3p5  6f
   23    6v vi  s2p5 7f          3s2  3p5  7f
   23    6v vi  s2p5 8f          3s2  3p5  8f
   23    6v vi  s2p5 9f          3s2  3p5  9f
   23    6v vi  sp6 4s           3s   3p6  4s
   23    6v vi  sp6 5s           3s   3p6  5s
   23    6v vi  sp6 6s           3s   3p6  6s
   23    6v vi  sp6 7s           3s   3p6  7s
   23    6v vi  sp6 8s           3s   3p6  8s
   23    6v vi  sp6 9s           3s   3p6  9s
   23    6v vi  sp6 3d           3s   3p6  3d
   23    6v vi  sp6 4d           3s   3p6  4d
   23    6v vi  sp6 5d           3s   3p6  5d
   23    6v vi  sp6 6d           3s   3p6  6d
   23    6v vi  sp6 7d           3s   3p6  7d
   23    6v vi  sp6 8d           3s   3p6  8d
   23    6v vi  sp6 9d           3s   3p6  9d
   23    6v vi  s2p4 3d2         3s2  3p4  3d2
   23    6v vi  s2p4 3d4s        3s2  3p4  3d   4s
   23    6v vi  s2p4 4s2         3s2  3p4  4s2
   23    6v vi  s2p5 4s          3s2  3p5  4s
   23    6v vi  s2p5 5s          3s2  3p5  5s
   23    6v vi  s2p5 6s          3s2  3p5  6s
   23    6v vi  s2p5 7s          3s2  3p5  7s
   23    6v vi  s2p5 8s          3s2  3p5  8s
   23    6v vi  s2p5 9s          3s2  3p5  9s
   23    6v vi  s2p5 3d          3s2  3p5  3d
   23    6v vi  s2p5 4d          3s2  3p5  4d
   23    6v vi  s2p5 5d          3s2  3p5  5d
   23    6v vi  s2p5 6d          3s2  3p5  6d
   23    6v vi  s2p5 7d          3s2  3p5  7d
   23    6v vi  s2p5 8d          3s2  3p5  8d
   23    6v vi  s2p5 9d          3s2  3p5  9d
   23    6v vi  sp6 4p           3s   3p6  4p
   23    6v vi  sp6 5p           3s   3p6  5p
   23    6v vi  sp6 6p           3s   3p6  6p
   23    6v vi  sp6 7p           3s   3p6  7p
   23    6v vi  sp6 8p           3s   3p6  8p
   23    6v vi  sp6 9p           3s   3p6  9p
   23    6v vi  sp6 4f           3s   3p6  4f
   23    6v vi  sp6 5f           3s   3p6  5f
   23    6v vi  sp6 6f           3s   3p6  6f
   23    6v vi  sp6 7f           3s   3p6  7f
   23    6v vi  sp6 8f           3s   3p6  8f
   23    6v vi  sp6 9f           3s   3p6  9f
   23    6v vi  s2p4 3d4p        3s2  3p4  3d   4p
   23    6v vi  s2p4 4s4p        3s2  3p4  4s   4p
   23    6v vi  s2p4 3d4f        3s2  3p4  3d   4f
   23    6v vi  s2p4 4s4f        3s2  3p4  4s   4f
   -1
$run cray:rcn2c
$DELETE POOLG:HF230501.DAT;*
$DELETE POOLG:HF230502.DAT;*
$DELETE POOLG:HF230504.DAT;*
$DELETE POOLG:HF230531.DAT;*
$DELETE POOLG:HF230532.DAT;*
