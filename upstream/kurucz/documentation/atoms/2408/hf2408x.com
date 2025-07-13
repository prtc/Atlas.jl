$set def 2408
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240807.dat for007
$assign poolg:hf240801.dat for001
$assign poolg:hf240802.dat for002
$assign poolg:hf240804.dat for004
$assign hf2408x.pun for011
$assign hf2408x.rrr for012
$assign hf2408x.dat for013
$assign hf2408xe.dat for014
$assign poolg:hf240831.dat for031
$assign poolg:hf240832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   24    9cr ix s2p4             3s2  3p4
   24    9cr ix s2p3 4p          3s2  3p3  4p
   24    9cr ix s2p3 5p          3s2  3p3  5p
   24    9cr ix s2p3 6p          3s2  3p3  6p
   24    9cr ix s2p3 7p          3s2  3p3  7p
   24    9cr ix s2p3 8p          3s2  3p3  8p
   24    9cr ix s2p3 9p          3s2  3p3  9p
   24    9cr ix s2p3 10p         3s2  3p3 10p
   24    9cr ix s2p3 11p         3s2  3p3 11p
   24    9cr ix p6               3s0  3p6 
   24    9cr ix p5 4p            3s0  3p5  4p
   24    9cr ix p5 5p            3s0  3p5  5p
   24    9cr ix p5 6p            3s0  3p5  6p
   24    9cr ix p5 7p            3s0  3p5  7p
   24    9cr ix p5 8p            3s0  3p5  8p
   24    9cr ix p5 9p            3s0  3p5  9p
   24    9cr ix p5 10p           3s0  3p5 10p
   24    9cr ix p5 11p           3s0  3p5 11p
   24    9cr ix s2p3 4f          3s2  3p3  4f
   24    9cr ix s2p3 5f          3s2  3p3  5f
   24    9cr ix s2p3 6f          3s2  3p3  6f
   24    9cr ix s2p3 7f          3s2  3p3  7f
   24    9cr ix s2p3 8f          3s2  3p3  8f
   24    9cr ix s2p3 9f          3s2  3p3  9f
   24    9cr ix s2p3 10f         3s2  3p3 10f
   24    9cr ix s2p3 11f         3s2  3p3 11f
   24    9cr ix p5 4f            3s0  3p5  4f
   24    9cr ix p5 5f            3s0  3p5  5f
   24    9cr ix p5 6f            3s0  3p5  6f
   24    9cr ix p5 7f            3s0  3p5  7f
   24    9cr ix p5 8f            3s0  3p5  8f
   24    9cr ix p5 9f            3s0  3p5  9f
   24    9cr ix p5 10f           3s0  3p5 10f
   24    9cr ix p5 11f           3s0  3p5 11f
   24    9cr ix s2p3 6h          3s2  3p3  6h
   24    9cr ix s2p3 7h          3s2  3p3  7h
   24    9cr ix s2p3 8h          3s2  3p3  8h
   24    9cr ix s2p3 9h          3s2  3p3  9h
   24    9cr ix s2p3 8k          3s2  3p3  8k
   24    9cr ix s2p3 9k          3s2  3p3  9k
   24    9cr ix sp4 4s           3s   3p4  4s
   24    9cr ix sp4 5s           3s   3p4  5s
   24    9cr ix sp4 6s           3s   3p4  6s
   24    9cr ix sp4 7s           3s   3p4  7s
   24    9cr ix sp4 8s           3s   3p4  8s
   24    9cr ix sp4 9s           3s   3p4  9s
   24    9cr ix sp4 3d           3s   3p4  3d
   24    9cr ix sp4 4d           3s   3p4  4d
   24    9cr ix sp4 5d           3s   3p4  5d
   24    9cr ix sp4 6d           3s   3p4  6d
   24    9cr ix sp4 7d           3s   3p4  7d
   24    9cr ix sp4 8d           3s   3p4  8d
   24    9cr ix sp4 9d           3s   3p4  9d
   24    9cr ix s2p3 4s          3s2  3p3  4s
   24    9cr ix s2p3 5s          3s2  3p3  5s
   24    9cr ix s2p3 6s          3s2  3p3  6s
   24    9cr ix s2p3 7s          3s2  3p3  7s
   24    9cr ix s2p3 8s          3s2  3p3  8s
   24    9cr ix s2p3 9s          3s2  3p3  9s
   24    9cr ix s2p3 10s         3s2  3p3 10s
   24    9cr ix s2p3 11s         3s2  3p3 11s
   24    9cr ix p5 4s            3s0  3p5  4s
   24    9cr ix p5 5s            3s0  3p5  5s
   24    9cr ix p5 6s            3s0  3p5  6s
   24    9cr ix p5 7s            3s0  3p5  7s
   24    9cr ix p5 8s            3s0  3p5  8s
   24    9cr ix p5 9s            3s0  3p5  9s
   24    9cr ix p5 10s           3s0  3p5 10s
   24    9cr ix p5 11s           3s0  3p5 11s
   24    9cr ix s2p3 3d          3s2  3p3  3d
   24    9cr ix s2p3 4d          3s2  3p3  4d
   24    9cr ix s2p3 5d          3s2  3p3  5d
   24    9cr ix s2p3 6d          3s2  3p3  6d
   24    9cr ix s2p3 7d          3s2  3p3  7d
   24    9cr ix s2p3 8d          3s2  3p3  8d
   24    9cr ix s2p3 9d          3s2  3p3  9d
   24    9cr ix s2p3 10d         3s2  3p3 10d
   24    9cr ix s2p3 11d         3s2  3p3 11d
   24    9cr ix p5 3d            3s0  3p5  3d
   24    9cr ix p5 4d            3s0  3p5  4d
   24    9cr ix p5 5d            3s0  3p5  5d
   24    9cr ix p5 6d            3s0  3p5  6d
   24    9cr ix p5 7d            3s0  3p5  7d
   24    9cr ix p5 8d            3s0  3p5  8d
   24    9cr ix p5 9d            3s0  3p5  9d
   24    9cr ix p5 10d           3s0  3p5 10d
   24    9cr ix p5 11d           3s0  3p5 11d
   24    9cr ix s2p3 5g          3s2  3p3  5g
   24    9cr ix s2p3 6g          3s2  3p3  6g
   24    9cr ix s2p3 7g          3s2  3p3  7g
   24    9cr ix s2p3 8g          3s2  3p3  8g
   24    9cr ix s2p3 9g          3s2  3p3  9g
   24    9cr ix s2p3 7i          3s2  3p3  7i
   24    9cr ix s2p3 8i          3s2  3p3  8i
   24    9cr ix s2p3 9i          3s2  3p3  9i
   24    9cr ix sp5              3s   3p5  
   24    9cr ix sp4 5p           3s   3p4  5p
   24    9cr ix sp4 6p           3s   3p4  6p
   24    9cr ix sp4 7p           3s   3p4  7p
   24    9cr ix sp4 8p           3s   3p4  8p
   24    9cr ix sp4 9p           3s   3p4  9p
   24    9cr ix sp4 4f           3s   3p4  4f
   24    9cr ix sp4 5f           3s   3p4  5f
   24    9cr ix sp4 6f           3s   3p4  6f
   24    9cr ix sp4 7f           3s   3p4  7f
   24    9cr ix sp4 8f           3s   3p4  8f
   24    9cr ix sp4 9f           3s   3p4  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF240801.DAT;*
$DELETE POOLG:HF240802.DAT;*
$DELETE POOLG:HF240804.DAT;*
$DELETE POOLG:HF240831.DAT;*
$DELETE POOLG:HF240832.DAT;*
