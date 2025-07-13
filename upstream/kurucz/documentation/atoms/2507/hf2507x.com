$set DEF 2507
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf250707.dat for007
$assign poolg:hf250701.dat for001
$assign poolg:hf250702.dat for002
$assign poolg:hf250704.dat for004
$assign hf2507x.pun for011
$assign hf2507x.rrr for012
$assign hf2507x.dat for013
$assign hf2507xe.dat for014
$assign poolg:hf250731.dat for031
$assign poolg:hf250732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   25    8mnviiis2p6             3s2  3p6
   25    8mnviiis2p5 4p          3s2  3p5  4p
   25    8mnviiis2p5 5p          3s2  3p5  5p
   25    8mnviiis2p5 6p          3s2  3p5  6p
   25    8mnviiis2p5 7p          3s2  3p5  7p
   25    8mnviiis2p5 8p          3s2  3p5  8p
   25    8mnviiis2p5 9p          3s2  3p5  9p
   25    8mnviiis2p5 4f          3s2  3p5  4f
   25    8mnviiis2p5 5f          3s2  3p5  5f
   25    8mnviiis2p5 6f          3s2  3p5  6f
   25    8mnviiis2p5 7f          3s2  3p5  7f
   25    8mnviiis2p5 8f          3s2  3p5  8f
   25    8mnviiis2p5 9f          3s2  3p5  9f
   25    8mnviiis2p5 6h          3s2  3p5  6h
   25    8mnviiis2p5 7h          3s2  3p5  7h
   25    8mnviiis2p5 8h          3s2  3p5  8h
   25    8mnviiis2p5 9h          3s2  3p5  9h
   25    8mnviiis2p5 8k          3s2  3p5  8k
   25    8mnviiis2p5 9k          3s2  3p5  9k
   25    8mnviiisp6 4s           3s   3p6  4s
   25    8mnviiisp6 5s           3s   3p6  5s
   25    8mnviiisp6 6s           3s   3p6  6s
   25    8mnviiisp6 7s           3s   3p6  7s
   25    8mnviiisp6 8s           3s   3p6  8s
   25    8mnviiisp6 9s           3s   3p6  9s
   25    8mnviiisp6 3d           3s   3p6  3d
   25    8mnviiisp6 4d           3s   3p6  4d
   25    8mnviiisp6 5d           3s   3p6  5d
   25    8mnviiisp6 6d           3s   3p6  6d
   25    8mnviiisp6 7d           3s   3p6  7d
   25    8mnviiisp6 8d           3s   3p6  8d
   25    8mnviiisp6 9d           3s   3p6  9d
   25    8mnviiis2p5 4s          3s2  3p5  4s
   25    8mnviiis2p5 5s          3s2  3p5  5s
   25    8mnviiis2p5 6s          3s2  3p5  6s
   25    8mnviiis2p5 7s          3s2  3p5  7s
   25    8mnviiis2p5 8s          3s2  3p5  8s
   25    8mnviiis2p5 9s          3s2  3p5  9s
   25    8mnviiis2p5 3d          3s2  3p5  3d
   25    8mnviiis2p5 4d          3s2  3p5  4d
   25    8mnviiis2p5 5d          3s2  3p5  5d
   25    8mnviiis2p5 6d          3s2  3p5  6d
   25    8mnviiis2p5 7d          3s2  3p5  7d
   25    8mnviiis2p5 8d          3s2  3p5  8d
   25    8mnviiis2p5 9d          3s2  3p5  9d
   25    8mnviiis2p5 5g          3s2  3p5  5g
   25    8mnviiis2p5 6g          3s2  3p5  6g
   25    8mnviiis2p5 7g          3s2  3p5  7g
   25    8mnviiis2p5 8g          3s2  3p5  8g
   25    8mnviiis2p5 9g          3s2  3p5  9g
   25    8mnviiis2p5 7i          3s2  3p5  7i
   25    8mnviiis2p5 8i          3s2  3p5  8i
   25    8mnviiis2p5 9i          3s2  3p5  9i
   25    8mnviiisp6 4p           3s   3p6  4p
   25    8mnviiisp6 5p           3s   3p6  5p
   25    8mnviiisp6 6p           3s   3p6  6p
   25    8mnviiisp6 7p           3s   3p6  7p
   25    8mnviiisp6 8p           3s   3p6  8p
   25    8mnviiisp6 9p           3s   3p6  9p
   25    8mnviiisp6 4f           3s   3p6  4f
   25    8mnviiisp6 5f           3s   3p6  5f
   25    8mnviiisp6 6f           3s   3p6  6f
   25    8mnviiisp6 7f           3s   3p6  7f
   25    8mnviiisp6 8f           3s   3p6  8f
   25    8mnviiisp6 9f           3s   3p6  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF250701.DAT;*
$DELETE POOLG:HF250702.DAT;*
$DELETE POOLG:HF250704.DAT;*
$DELETE POOLG:HF250731.DAT;*
$DELETE POOLG:HF250732.DAT;*
