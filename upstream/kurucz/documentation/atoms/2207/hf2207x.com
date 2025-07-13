$set def 2207
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220707.dat for007
$assign poolg:hf220701.dat for001
$assign poolg:hf220702.dat for002
$assign poolg:hf220704.dat for004
$assign hf2207x.pun for011
$assign hf2207x.rrr for012
$assign hf2207x.dat for013
$assign hf2207xe.dat for014
$assign poolg:hf220731.dat for031
$assign poolg:hf220732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    8tiviiis2p3             3s2  3p3
   22    8tiviiis2p2 4p          3s2  3p2  4p
   22    8tiviiis2p2 5p          3s2  3p2  5p
   22    8tiviiis2p2 6p          3s2  3p2  6p
   22    8tiviiis2p2 7p          3s2  3p2  7p
   22    8tiviiis2p2 8p          3s2  3p2  8p
   22    8tiviiis2p2 9p          3s2  3p2  9p
   22    8tiviiis2p2 4f          3s2  3p2  4f
   22    8tiviiis2p2 5f          3s2  3p2  5f
   22    8tiviiis2p2 6f          3s2  3p2  6f
   22    8tiviiis2p2 7f          3s2  3p2  7f
   22    8tiviiis2p2 8f          3s2  3p2  8f
   22    8tiviiis2p2 9f          3s2  3p2  9f
   22    8tiviiis2p2 6h          3s2  3p2  6h
   22    8tiviiis2p2 7h          3s2  3p2  7h
   22    8tiviiis2p2 8h          3s2  3p2  8h
   22    8tiviiis2p2 9h          3s2  3p2  9h
   22    8tiviiis2p2 8k          3s2  3p2  8k
   22    8tiviiis2p2 9k          3s2  3p2  9k
   22    8tiviiisp3 4s           3s   3p3  4s
   22    8tiviiisp3 5s           3s   3p3  5s
   22    8tiviiisp3 6s           3s   3p3  6s
   22    8tiviiisp3 7s           3s   3p3  7s
   22    8tiviiisp3 8s           3s   3p3  8s
   22    8tiviiisp3 9s           3s   3p3  9s
   22    8tiviiisp3 3d           3s   3p3  3d
   22    8tiviiisp3 4d           3s   3p3  4d
   22    8tiviiisp3 5d           3s   3p3  5d
   22    8tiviiisp3 6d           3s   3p3  6d
   22    8tiviiisp3 7d           3s   3p3  7d
   22    8tiviiisp3 8d           3s   3p3  8d
   22    8tiviiisp3 9d           3s   3p3  9d
   22    8tiviiip5               3s0  3p5
   22    8tiviiis2p2 4s          3s2  3p2  4s
   22    8tiviiis2p2 5s          3s2  3p2  5s
   22    8tiviiis2p2 6s          3s2  3p2  6s
   22    8tiviiis2p2 7s          3s2  3p2  7s
   22    8tiviiis2p2 8s          3s2  3p2  8s
   22    8tiviiis2p2 9s          3s2  3p2  9s
   22    8tiviiis2p2 3d          3s2  3p2  3d
   22    8tiviiis2p2 4d          3s2  3p2  4d
   22    8tiviiis2p2 5d          3s2  3p2  5d
   22    8tiviiis2p2 6d          3s2  3p2  6d
   22    8tiviiis2p2 7d          3s2  3p2  7d
   22    8tiviiis2p2 8d          3s2  3p2  8d
   22    8tiviiis2p2 9d          3s2  3p2  9d
   22    8tiviiis2p2 5g          3s2  3p2  5g
   22    8tiviiis2p2 6g          3s2  3p2  6g
   22    8tiviiis2p2 7g          3s2  3p2  7g
   22    8tiviiis2p2 8g          3s2  3p2  8g
   22    8tiviiis2p2 9g          3s2  3p2  9g
   22    8tiviiis2p2 7i          3s2  3p2  7i
   22    8tiviiis2p2 8i          3s2  3p2  8i
   22    8tiviiis2p2 9i          3s2  3p2  9i
   22    8tiviiisp4              3s   3p4
   22    8tiviiisp3 4p           3s   3p3  4p
   22    8tiviiisp3 5p           3s   3p3  5p
   22    8tiviiisp3 6p           3s   3p3  6p
   22    8tiviiisp3 7p           3s   3p3  7p
   22    8tiviiisp3 8p           3s   3p3  8p
   22    8tiviiisp3 9p           3s   3p3  9p
   22    8tiviiisp3 4f           3s   3p3  4f
   22    8tiviiisp3 5f           3s   3p3  5f
   22    8tiviiisp3 6f           3s   3p3  6f
   22    8tiviiisp3 7f           3s   3p3  7f
   22    8tiviiisp3 8f           3s   3p3  8f
   22    8tiviiisp3 9f           3s   3p3  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF220701.DAT;*
$DELETE POOLG:HF220702.DAT;*
$DELETE POOLG:HF220704.DAT;*
$DELETE POOLG:HF220731.DAT;*
$DELETE POOLG:HF220732.DAT;*
