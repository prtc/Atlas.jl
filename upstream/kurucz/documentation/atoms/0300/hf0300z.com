$set def 0300
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf030007.dat for007
$assign poolg:hf030001.dat for001
$assign poolg:hf030002.dat for002
$assign poolg:hf030004.dat for004
$assign hf0300z.pun for011
$assign hf0300z.rrr for012
$assign hf0300z.dat for013
$assign hf0300zE.dat for014
$assign poolg:hf030031.dat for031
$assign poolg:hf030032.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
    3    1li i  1s2 2s           1s2  2s
    3    1li i  1s2 3s           1s2  3s
    3    1li i  1s2 4s           1s2  4s
    3    1li i  1s2 5s           1s2  5s
    3    1li i  1s2 6s           1s2  6s
    3    1li i  1s2 7s           1s2  7s
    3    1li i  1s2 8s           1s2  8s
    3    1li i  1s2 9s           1s2  9s
    3    1li i  1s2 10s          1s2 10s
    3    1li i  1s2 11s          1s2 11s
    3    1li i  1s2 12s          1s2 12s
    3    1li i  1s2 3d           1s2  3d
    3    1li i  1s2 4d           1s2  4d
    3    1li i  1s2 5d           1s2  5d
    3    1li i  1s2 6d           1s2  6d
    3    1li i  1s2 7d           1s2  7d
    3    1li i  1s2 8d           1s2  8d
    3    1li i  1s2 9d           1s2  9d
    3    1li i  1s2 10d          1s2 10d
    3    1li i  1s2 11d          1s2 11d
    3    1li i  1s2 12d          1s2 12d
    3    1li i  1s2 5g           1s2  5g
    3    1li i  1s2 6g           1s2  6g
    3    1li i  1s2 7g           1s2  7g
    3    1li i  1s2 8g           1s2  8g
    3    1li i  1s2 9g           1s2  9g
    3    1li i  1s2 10g          1s2 10g
    3    1li i  1s2 11g          1s2 11g
    3    1li i  1s2 12g          1s2 12g
    3    1li i  1s2 7i           1s2  7i
    3    1li i  1s2 8i           1s2  8i
    3    1li i  1s2 9i           1s2  9i
    3    1li i  1s2 10i          1s2 10i
    3    1li i  1s2 11i          1s2 11i
    3    1li i  1s2 12i          1s2 12i
    3    1li i  1s2 2p           1s2  2p
    3    1li i  1s2 3p           1s2  3p
    3    1li i  1s2 4p           1s2  4p
    3    1li i  1s2 5p           1s2  5p
    3    1li i  1s2 6p           1s2  6p
    3    1li i  1s2 7p           1s2  7p
    3    1li i  1s2 8p           1s2  8p
    3    1li i  1s2 9p           1s2  9p
    3    1li i  1s2 10p          1s2 10p
    3    1li i  1s2 11p          1s2 11p
    3    1li i  1s2 12p          1s2 12p
    3    1li i  1s2 4f           1s2  4f
    3    1li i  1s2 5f           1s2  5f
    3    1li i  1s2 6f           1s2  6f
    3    1li i  1s2 7f           1s2  7f
    3    1li i  1s2 8f           1s2  8f
    3    1li i  1s2 9f           1s2  9f
    3    1li i  1s2 10f          1s2 10f
    3    1li i  1s2 11f          1s2 11f
    3    1li i  1s2 12f          1s2 12f
    3    1li i  1s2 6h           1s2  6h
    3    1li i  1s2 7h           1s2  7h
    3    1li i  1s2 8h           1s2  8h
    3    1li i  1s2 9h           1s2  9h
    3    1li i  1s2 10h          1s2 10h
    3    1li i  1s2 11h          1s2 11h
    3    1li i  1s2 12h          1s2 12h
    3    1li i  1s2 8k           1s2  8k
    3    1li i  1s2 9k           1s2  9k
    3    1li i  1s2 10k          1s2 10k
    3    1li i  1s2 11k          1s2 11k
    3    1li i  1s2 12k          1s2 12k
   -1
$run cray:rcn2c
$DELETE POOLG:HF030001.DAT;*
$DELETE POOLG:HF030002.DAT;*
$DELETE POOLG:HF030004.DAT;*
$DELETE POOLG:HF030031.DAT;*
$DELETE POOLG:HF030032.DAT;*
