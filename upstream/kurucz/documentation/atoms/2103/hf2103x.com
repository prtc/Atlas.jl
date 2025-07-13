$set def 2103
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf210307.dat for007
$assign poolg:hf210301.dat for001
$assign poolg:hf210302.dat for002
$assign poolg:hf210304.dat for004
$assign hf2103x.pun for011
$assign hf2103x.rrr for012
$assign hf2103x.dat for013
$assign hf2103xe.dat for014
$assign poolg:hf210331.dat for031
$assign poolg:hf210332.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   21    4sc iv s2p6             3s2  3p6
   21    4sc iv s2p5 4p          3s2  3p5  4p
   21    4sc iv s2p5 5p          3s2  3p5  5p
   21    4sc iv s2p5 6p          3s2  3p5  6p
   21    4sc iv s2p5 7p          3s2  3p5  7p
   21    4sc iv s2p5 8p          3s2  3p5  8p
   21    4sc iv s2p5 9p          3s2  3p5  9p
   21    4sc iv s2p5 4f          3s2  3p5  4f
   21    4sc iv s2p5 5f          3s2  3p5  5f
   21    4sc iv s2p5 6f          3s2  3p5  6f
   21    4sc iv s2p5 7f          3s2  3p5  7f
   21    4sc iv s2p5 8f          3s2  3p5  8f
   21    4sc iv s2p5 9f          3s2  3p5  9f
   21    4sc iv s2p5 6h          3s2  3p5  6h
   21    4sc iv s2p5 7h          3s2  3p5  7h
   21    4sc iv s2p5 8h          3s2  3p5  8h
   21    4sc iv s2p5 9h          3s2  3p5  9h
   21    4sc iv s2p5 8k          3s2  3p5  8k
   21    4sc iv s2p5 9k          3s2  3p5  9k
   21    4sc iv sp6 4s           3s   3p6  4s
   21    4sc iv sp6 5s           3s   3p6  5s
   21    4sc iv sp6 6s           3s   3p6  6s
   21    4sc iv sp6 7s           3s   3p6  7s
   21    4sc iv sp6 8s           3s   3p6  8s
   21    4sc iv sp6 9s           3s   3p6  9s
   21    4sc iv sp6 3d           3s   3p6  3d
   21    4sc iv sp6 4d           3s   3p6  4d
   21    4sc iv sp6 5d           3s   3p6  5d
   21    4sc iv sp6 6d           3s   3p6  6d
   21    4sc iv sp6 7d           3s   3p6  7d
   21    4sc iv sp6 8d           3s   3p6  8d
   21    4sc iv sp6 9d           3s   3p6  9d
   21    4sc iv s2p5 4s          3s2  3p5  4s
   21    4sc iv s2p5 5s          3s2  3p5  5s
   21    4sc iv s2p5 6s          3s2  3p5  6s
   21    4sc iv s2p5 7s          3s2  3p5  7s
   21    4sc iv s2p5 8s          3s2  3p5  8s
   21    4sc iv s2p5 9s          3s2  3p5  9s
   21    4sc iv s2p5 3d          3s2  3p5  3d
   21    4sc iv s2p5 4d          3s2  3p5  4d
   21    4sc iv s2p5 5d          3s2  3p5  5d
   21    4sc iv s2p5 6d          3s2  3p5  6d
   21    4sc iv s2p5 7d          3s2  3p5  7d
   21    4sc iv s2p5 8d          3s2  3p5  8d
   21    4sc iv s2p5 9d          3s2  3p5  9d
   21    4sc iv s2p5 5g          3s2  3p5  5g
   21    4sc iv s2p5 6g          3s2  3p5  6g
   21    4sc iv s2p5 7g          3s2  3p5  7g
   21    4sc iv s2p5 8g          3s2  3p5  8g
   21    4sc iv s2p5 9g          3s2  3p5  9g
   21    4sc iv s2p5 7i          3s2  3p5  7i
   21    4sc iv s2p5 8i          3s2  3p5  8i
   21    4sc iv s2p5 9i          3s2  3p5  9i
   21    4sc iv sp6 4p           3s   3p6  4p
   21    4sc iv sp6 5p           3s   3p6  5p
   21    4sc iv sp6 6p           3s   3p6  6p
   21    4sc iv sp6 7p           3s   3p6  7p
   21    4sc iv sp6 8p           3s   3p6  8p
   21    4sc iv sp6 9p           3s   3p6  9p
   21    4sc iv sp6 4f           3s   3p6  4f
   21    4sc iv sp6 5f           3s   3p6  5f
   21    4sc iv sp6 6f           3s   3p6  6f
   21    4sc iv sp6 7f           3s   3p6  7f
   21    4sc iv sp6 8f           3s   3p6  8f
   21    4sc iv sp6 9f           3s   3p6  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF210301.DAT;*
$DELETE POOLG:HF210302.DAT;*
$DELETE POOLG:HF210304.DAT;*
$DELETE POOLG:HF210331.DAT;*
$DELETE POOLG:HF210332.DAT;*
