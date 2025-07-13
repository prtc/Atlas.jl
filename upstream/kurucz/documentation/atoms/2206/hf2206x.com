$set def 2206
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220607.dat for007
$assign poolg:hf220601.dat for001
$assign poolg:hf220602.dat for002
$assign poolg:hf220604.dat for004
$assign hf2206x.pun for011
$assign hf2206x.rrr for012
$assign hf2206x.dat for013
$assign hf2206xe.dat for014
$assign poolg:hf220631.dat for031
$assign poolg:hf220632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    4ti viis2p4             3s2  3p4
   22    4ti viis2p3 4p          3s2  3p3  4p
   22    4ti viis2p3 5p          3s2  3p3  5p
   22    4ti viis2p3 6p          3s2  3p3  6p
   22    4ti viis2p3 7p          3s2  3p3  7p
   22    4ti viis2p3 8p          3s2  3p3  8p
   22    4ti viis2p3 9p          3s2  3p3  9p
   22    4ti viis2p3 10p         3s2  3p3 10p
   22    4ti viis2p3 11p         3s2  3p3 11p
   22    4ti viip6               3s0  3p6 
   22    4ti viip5 4p            3s0  3p5  4p
   22    4ti viip5 5p            3s0  3p5  5p
   22    4ti viip5 6p            3s0  3p5  6p
   22    4ti viip5 7p            3s0  3p5  7p
   22    4ti viip5 8p            3s0  3p5  8p
   22    4ti viip5 9p            3s0  3p5  9p
   22    4ti viip5 10p           3s0  3p5 10p
   22    4ti viip5 11p           3s0  3p5 11p
   22    4ti viis2p3 4f          3s2  3p3  4f
   22    4ti viis2p3 5f          3s2  3p3  5f
   22    4ti viis2p3 6f          3s2  3p3  6f
   22    4ti viis2p3 7f          3s2  3p3  7f
   22    4ti viis2p3 8f          3s2  3p3  8f
   22    4ti viis2p3 9f          3s2  3p3  9f
   22    4ti viis2p3 10f         3s2  3p3 10f
   22    4ti viis2p3 11f         3s2  3p3 11f
   22    4ti viip5 4f            3s0  3p5  4f
   22    4ti viip5 5f            3s0  3p5  5f
   22    4ti viip5 6f            3s0  3p5  6f
   22    4ti viip5 7f            3s0  3p5  7f
   22    4ti viip5 8f            3s0  3p5  8f
   22    4ti viip5 9f            3s0  3p5  9f
   22    4ti viip5 10f           3s0  3p5 10f
   22    4ti viip5 11f           3s0  3p5 11f
   22    4ti viis2p3 6h          3s2  3p3  6h
   22    4ti viis2p3 7h          3s2  3p3  7h
   22    4ti viis2p3 8h          3s2  3p3  8h
   22    4ti viis2p3 9h          3s2  3p3  9h
   22    4ti viis2p3 8k          3s2  3p3  8k
   22    4ti viis2p3 9k          3s2  3p3  9k
   22    4ti viisp4 4s           3s   3p4  4s
   22    4ti viisp4 5s           3s   3p4  5s
   22    4ti viisp4 6s           3s   3p4  6s
   22    4ti viisp4 7s           3s   3p4  7s
   22    4ti viisp4 8s           3s   3p4  8s
   22    4ti viisp4 9s           3s   3p4  9s
   22    4ti viisp4 3d           3s   3p4  3d
   22    4ti viisp4 4d           3s   3p4  4d
   22    4ti viisp4 5d           3s   3p4  5d
   22    4ti viisp4 6d           3s   3p4  6d
   22    4ti viisp4 7d           3s   3p4  7d
   22    4ti viisp4 8d           3s   3p4  8d
   22    4ti viisp4 9d           3s   3p4  9d
   22    4ti viis2p3 4s          3s2  3p3  4s
   22    4ti viis2p3 5s          3s2  3p3  5s
   22    4ti viis2p3 6s          3s2  3p3  6s
   22    4ti viis2p3 7s          3s2  3p3  7s
   22    4ti viis2p3 8s          3s2  3p3  8s
   22    4ti viis2p3 9s          3s2  3p3  9s
   22    4ti viis2p3 10s         3s2  3p3 10s
   22    4ti viis2p3 11s         3s2  3p3 11s
   22    4ti viip5 4s            3s0  3p5  4s
   22    4ti viip5 5s            3s0  3p5  5s
   22    4ti viip5 6s            3s0  3p5  6s
   22    4ti viip5 7s            3s0  3p5  7s
   22    4ti viip5 8s            3s0  3p5  8s
   22    4ti viip5 9s            3s0  3p5  9s
   22    4ti viip5 10s           3s0  3p5 10s
   22    4ti viip5 11s           3s0  3p5 11s
   22    4ti viis2p3 3d          3s2  3p3  3d
   22    4ti viis2p3 4d          3s2  3p3  4d
   22    4ti viis2p3 5d          3s2  3p3  5d
   22    4ti viis2p3 6d          3s2  3p3  6d
   22    4ti viis2p3 7d          3s2  3p3  7d
   22    4ti viis2p3 8d          3s2  3p3  8d
   22    4ti viis2p3 9d          3s2  3p3  9d
   22    4ti viis2p3 10d         3s2  3p3 10d
   22    4ti viis2p3 11d         3s2  3p3 11d
   22    4ti viip5 3d            3s0  3p5  3d
   22    4ti viip5 4d            3s0  3p5  4d
   22    4ti viip5 5d            3s0  3p5  5d
   22    4ti viip5 6d            3s0  3p5  6d
   22    4ti viip5 7d            3s0  3p5  7d
   22    4ti viip5 8d            3s0  3p5  8d
   22    4ti viip5 9d            3s0  3p5  9d
   22    4ti viip5 10d           3s0  3p5 10d
   22    4ti viip5 11d           3s0  3p5 11d
   22    4ti viis2p3 5g          3s2  3p3  5g
   22    4ti viis2p3 6g          3s2  3p3  6g
   22    4ti viis2p3 7g          3s2  3p3  7g
   22    4ti viis2p3 8g          3s2  3p3  8g
   22    4ti viis2p3 9g          3s2  3p3  9g
   22    4ti viis2p3 7i          3s2  3p3  7i
   22    4ti viis2p3 8i          3s2  3p3  8i
   22    4ti viis2p3 9i          3s2  3p3  9i
   22    4ti viisp5              3s   3p5  
   22    4ti viisp4 5p           3s   3p4  5p
   22    4ti viisp4 6p           3s   3p4  6p
   22    4ti viisp4 7p           3s   3p4  7p
   22    4ti viisp4 8p           3s   3p4  8p
   22    4ti viisp4 9p           3s   3p4  9p
   22    4ti viisp4 4f           3s   3p4  4f
   22    4ti viisp4 5f           3s   3p4  5f
   22    4ti viisp4 6f           3s   3p4  6f
   22    4ti viisp4 7f           3s   3p4  7f
   22    4ti viisp4 8f           3s   3p4  8f
   22    4ti viisp4 9f           3s   3p4  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF220601.DAT;*
$DELETE POOLG:HF220602.DAT;*
$DELETE POOLG:HF220604.DAT;*
$DELETE POOLG:HF220631.DAT;*
$DELETE POOLG:HF220632.DAT;*
