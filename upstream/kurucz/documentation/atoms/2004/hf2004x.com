$set def 2004
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200407.dat for007
$assign poolg:hf200401.dat for001
$assign poolg:hf200402.dat for002
$assign poolg:hf200404.dat for004
$assign hf2004x.pun for011
$assign hf2004x.rrr for012
$assign hf2004x.dat for013
$assign hf2004xe.dat for014
$assign poolg:hf200431.dat for031
$assign poolg:hf200432.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    5ca v  s2p4             3s2  3p4
   20    5ca v  s2p3 4p          3s2  3p3  4p
   20    5ca v  s2p3 5p          3s2  3p3  5p
   20    5ca v  s2p3 6p          3s2  3p3  6p
   20    5ca v  s2p3 7p          3s2  3p3  7p
   20    5ca v  s2p3 8p          3s2  3p3  8p
   20    5ca v  s2p3 9p          3s2  3p3  9p
   20    5ca v  s2p3 10p         3s2  3p3 10p
   20    5ca v  s2p3 11p         3s2  3p3 11p
   20    5ca v  p6               3s0  3p6 
   20    5ca v  p5 4p            3s0  3p5  4p
   20    5ca v  p5 5p            3s0  3p5  5p
   20    5ca v  p5 6p            3s0  3p5  6p
   20    5ca v  p5 7p            3s0  3p5  7p
   20    5ca v  p5 8p            3s0  3p5  8p
   20    5ca v  p5 9p            3s0  3p5  9p
   20    5ca v  p5 10p           3s0  3p5 10p
   20    5ca v  p5 11p           3s0  3p5 11p
   20    5ca v  s2p3 4f          3s2  3p3  4f
   20    5ca v  s2p3 5f          3s2  3p3  5f
   20    5ca v  s2p3 6f          3s2  3p3  6f
   20    5ca v  s2p3 7f          3s2  3p3  7f
   20    5ca v  s2p3 8f          3s2  3p3  8f
   20    5ca v  s2p3 9f          3s2  3p3  9f
   20    5ca v  s2p3 10f         3s2  3p3 10f
   20    5ca v  s2p3 11f         3s2  3p3 11f
   20    5ca v  p5 4f            3s0  3p5  4f
   20    5ca v  p5 5f            3s0  3p5  5f
   20    5ca v  p5 6f            3s0  3p5  6f
   20    5ca v  p5 7f            3s0  3p5  7f
   20    5ca v  p5 8f            3s0  3p5  8f
   20    5ca v  p5 9f            3s0  3p5  9f
   20    5ca v  p5 10f           3s0  3p5 10f
   20    5ca v  p5 11f           3s0  3p5 11f
   20    5ca v  s2p3 6h          3s2  3p3  6h
   20    5ca v  s2p3 7h          3s2  3p3  7h
   20    5ca v  s2p3 8h          3s2  3p3  8h
   20    5ca v  s2p3 9h          3s2  3p3  9h
   20    5ca v  s2p3 8k          3s2  3p3  8k
   20    5ca v  s2p3 9k          3s2  3p3  9k
   20    5ca v  sp4 4s           3s   3p4  4s
   20    5ca v  sp4 5s           3s   3p4  5s
   20    5ca v  sp4 6s           3s   3p4  6s
   20    5ca v  sp4 7s           3s   3p4  7s
   20    5ca v  sp4 8s           3s   3p4  8s
   20    5ca v  sp4 9s           3s   3p4  9s
   20    5ca v  sp4 3d           3s   3p4  3d
   20    5ca v  sp4 4d           3s   3p4  4d
   20    5ca v  sp4 5d           3s   3p4  5d
   20    5ca v  sp4 6d           3s   3p4  6d
   20    5ca v  sp4 7d           3s   3p4  7d
   20    5ca v  sp4 8d           3s   3p4  8d
   20    5ca v  sp4 9d           3s   3p4  9d
   20    5ca v  s2p3 4s          3s2  3p3  4s
   20    5ca v  s2p3 5s          3s2  3p3  5s
   20    5ca v  s2p3 6s          3s2  3p3  6s
   20    5ca v  s2p3 7s          3s2  3p3  7s
   20    5ca v  s2p3 8s          3s2  3p3  8s
   20    5ca v  s2p3 9s          3s2  3p3  9s
   20    5ca v  s2p3 10s         3s2  3p3 10s
   20    5ca v  s2p3 11s         3s2  3p3 11s
   20    5ca v  p5 4s            3s0  3p5  4s
   20    5ca v  p5 5s            3s0  3p5  5s
   20    5ca v  p5 6s            3s0  3p5  6s
   20    5ca v  p5 7s            3s0  3p5  7s
   20    5ca v  p5 8s            3s0  3p5  8s
   20    5ca v  p5 9s            3s0  3p5  9s
   20    5ca v  p5 10s           3s0  3p5 10s
   20    5ca v  p5 11s           3s0  3p5 11s
   20    5ca v  s2p3 3d          3s2  3p3  3d
   20    5ca v  s2p3 4d          3s2  3p3  4d
   20    5ca v  s2p3 5d          3s2  3p3  5d
   20    5ca v  s2p3 6d          3s2  3p3  6d
   20    5ca v  s2p3 7d          3s2  3p3  7d
   20    5ca v  s2p3 8d          3s2  3p3  8d
   20    5ca v  s2p3 9d          3s2  3p3  9d
   20    5ca v  s2p3 10d         3s2  3p3 10d
   20    5ca v  s2p3 11d         3s2  3p3 11d
   20    5ca v  p5 3d            3s0  3p5  3d
   20    5ca v  p5 4d            3s0  3p5  4d
   20    5ca v  p5 5d            3s0  3p5  5d
   20    5ca v  p5 6d            3s0  3p5  6d
   20    5ca v  p5 7d            3s0  3p5  7d
   20    5ca v  p5 8d            3s0  3p5  8d
   20    5ca v  p5 9d            3s0  3p5  9d
   20    5ca v  p5 10d           3s0  3p5 10d
   20    5ca v  p5 11d           3s0  3p5 11d
   20    5ca v  s2p3 5g          3s2  3p3  5g
   20    5ca v  s2p3 6g          3s2  3p3  6g
   20    5ca v  s2p3 7g          3s2  3p3  7g
   20    5ca v  s2p3 8g          3s2  3p3  8g
   20    5ca v  s2p3 9g          3s2  3p3  9g
   20    5ca v  s2p3 7i          3s2  3p3  7i
   20    5ca v  s2p3 8i          3s2  3p3  8i
   20    5ca v  s2p3 9i          3s2  3p3  9i
   20    5ca v  sp5              3s   3p5  
   20    5ca v  sp4 5p           3s   3p4  5p
   20    5ca v  sp4 6p           3s   3p4  6p
   20    5ca v  sp4 7p           3s   3p4  7p
   20    5ca v  sp4 8p           3s   3p4  8p
   20    5ca v  sp4 9p           3s   3p4  9p
   20    5ca v  sp4 4f           3s   3p4  4f
   20    5ca v  sp4 5f           3s   3p4  5f
   20    5ca v  sp4 6f           3s   3p4  6f
   20    5ca v  sp4 7f           3s   3p4  7f
   20    5ca v  sp4 8f           3s   3p4  8f
   20    5ca v  sp4 9f           3s   3p4  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF200401.DAT;*
$DELETE POOLG:HF200402.DAT;*
$DELETE POOLG:HF200404.DAT;*
$DELETE POOLG:HF200431.DAT;*
$DELETE POOLG:HF200432.DAT;*
