$set def 1903
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf190307.dat for007
$assign poolg:hf190301.dat for001
$assign poolg:hf190302.dat for002
$assign poolg:hf190304.dat for004
$assign hf1903x.pun for011
$assign hf1903x.rrr for012
$assign hf1903x.dat for013
$assign hf1903xe.dat for014
$assign poolg:hf190331.dat for031
$assign poolg:hf190332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   19    4k iv  s2p4             3s2  3p4
   19    4k iv  s2p3 4p          3s2  3p3  4p
   19    4k iv  s2p3 5p          3s2  3p3  5p
   19    4k iv  s2p3 6p          3s2  3p3  6p
   19    4k iv  s2p3 7p          3s2  3p3  7p
   19    4k iv  s2p3 8p          3s2  3p3  8p
   19    4k iv  s2p3 9p          3s2  3p3  9p
   19    4k iv  s2p3 10p         3s2  3p3 10p
   19    4k iv  s2p3 11p         3s2  3p3 11p
   19    4k iv  p6               3s0  3p6 
   19    4k iv  p5 4p            3s0  3p5  4p
   19    4k iv  p5 5p            3s0  3p5  5p
   19    4k iv  p5 6p            3s0  3p5  6p
   19    4k iv  p5 7p            3s0  3p5  7p
   19    4k iv  p5 8p            3s0  3p5  8p
   19    4k iv  p5 9p            3s0  3p5  9p
   19    4k iv  p5 10p           3s0  3p5 10p
   19    4k iv  p5 11p           3s0  3p5 11p
   19    4k iv  s2p3 4f          3s2  3p3  4f
   19    4k iv  s2p3 5f          3s2  3p3  5f
   19    4k iv  s2p3 6f          3s2  3p3  6f
   19    4k iv  s2p3 7f          3s2  3p3  7f
   19    4k iv  s2p3 8f          3s2  3p3  8f
   19    4k iv  s2p3 9f          3s2  3p3  9f
   19    4k iv  s2p3 10f         3s2  3p3 10f
   19    4k iv  s2p3 11f         3s2  3p3 11f
   19    4k iv  p5 4f            3s0  3p5  4f
   19    4k iv  p5 5f            3s0  3p5  5f
   19    4k iv  p5 6f            3s0  3p5  6f
   19    4k iv  p5 7f            3s0  3p5  7f
   19    4k iv  p5 8f            3s0  3p5  8f
   19    4k iv  p5 9f            3s0  3p5  9f
   19    4k iv  p5 10f           3s0  3p5 10f
   19    4k iv  p5 11f           3s0  3p5 11f
   19    4k iv  s2p3 6h          3s2  3p3  6h
   19    4k iv  s2p3 7h          3s2  3p3  7h
   19    4k iv  s2p3 8h          3s2  3p3  8h
   19    4k iv  s2p3 9h          3s2  3p3  9h
   19    4k iv  s2p3 8k          3s2  3p3  8k
   19    4k iv  s2p3 9k          3s2  3p3  9k
   19    4k iv  sp4 4s           3s   3p4  4s
   19    4k iv  sp4 5s           3s   3p4  5s
   19    4k iv  sp4 6s           3s   3p4  6s
   19    4k iv  sp4 7s           3s   3p4  7s
   19    4k iv  sp4 8s           3s   3p4  8s
   19    4k iv  sp4 9s           3s   3p4  9s
   19    4k iv  sp4 3d           3s   3p4  3d
   19    4k iv  sp4 4d           3s   3p4  4d
   19    4k iv  sp4 5d           3s   3p4  5d
   19    4k iv  sp4 6d           3s   3p4  6d
   19    4k iv  sp4 7d           3s   3p4  7d
   19    4k iv  sp4 8d           3s   3p4  8d
   19    4k iv  sp4 9d           3s   3p4  9d
   19    4k iv  s2p3 4s          3s2  3p3  4s
   19    4k iv  s2p3 5s          3s2  3p3  5s
   19    4k iv  s2p3 6s          3s2  3p3  6s
   19    4k iv  s2p3 7s          3s2  3p3  7s
   19    4k iv  s2p3 8s          3s2  3p3  8s
   19    4k iv  s2p3 9s          3s2  3p3  9s
   19    4k iv  s2p3 10s         3s2  3p3 10s
   19    4k iv  s2p3 11s         3s2  3p3 11s
   19    4k iv  p5 4s            3s0  3p5  4s
   19    4k iv  p5 5s            3s0  3p5  5s
   19    4k iv  p5 6s            3s0  3p5  6s
   19    4k iv  p5 7s            3s0  3p5  7s
   19    4k iv  p5 8s            3s0  3p5  8s
   19    4k iv  p5 9s            3s0  3p5  9s
   19    4k iv  p5 10s           3s0  3p5 10s
   19    4k iv  p5 11s           3s0  3p5 11s
   19    4k iv  s2p3 3d          3s2  3p3  3d
   19    4k iv  s2p3 4d          3s2  3p3  4d
   19    4k iv  s2p3 5d          3s2  3p3  5d
   19    4k iv  s2p3 6d          3s2  3p3  6d
   19    4k iv  s2p3 7d          3s2  3p3  7d
   19    4k iv  s2p3 8d          3s2  3p3  8d
   19    4k iv  s2p3 9d          3s2  3p3  9d
   19    4k iv  s2p3 10d         3s2  3p3 10d
   19    4k iv  s2p3 11d         3s2  3p3 11d
   19    4k iv  p5 3d            3s0  3p5  3d
   19    4k iv  p5 4d            3s0  3p5  4d
   19    4k iv  p5 5d            3s0  3p5  5d
   19    4k iv  p5 6d            3s0  3p5  6d
   19    4k iv  p5 7d            3s0  3p5  7d
   19    4k iv  p5 8d            3s0  3p5  8d
   19    4k iv  p5 9d            3s0  3p5  9d
   19    4k iv  p5 10d           3s0  3p5 10d
   19    4k iv  p5 11d           3s0  3p5 11d
   19    4k iv  s2p3 5g          3s2  3p3  5g
   19    4k iv  s2p3 6g          3s2  3p3  6g
   19    4k iv  s2p3 7g          3s2  3p3  7g
   19    4k iv  s2p3 8g          3s2  3p3  8g
   19    4k iv  s2p3 9g          3s2  3p3  9g
   19    4k iv  s2p3 7i          3s2  3p3  7i
   19    4k iv  s2p3 8i          3s2  3p3  8i
   19    4k iv  s2p3 9i          3s2  3p3  9i
   19    4k iv  sp5              3s   3p5  
   19    4k iv  sp4 5p           3s   3p4  5p
   19    4k iv  sp4 6p           3s   3p4  6p
   19    4k iv  sp4 7p           3s   3p4  7p
   19    4k iv  sp4 8p           3s   3p4  8p
   19    4k iv  sp4 9p           3s   3p4  9p
   19    4k iv  sp4 4f           3s   3p4  4f
   19    4k iv  sp4 5f           3s   3p4  5f
   19    4k iv  sp4 6f           3s   3p4  6f
   19    4k iv  sp4 7f           3s   3p4  7f
   19    4k iv  sp4 8f           3s   3p4  8f
   19    4k iv  sp4 9f           3s   3p4  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF190301.DAT;*
$DELETE POOLG:HF190302.DAT;*
$DELETE POOLG:HF190304.DAT;*
$DELETE POOLG:HF190331.DAT;*
$DELETE POOLG:HF190332.DAT;*
