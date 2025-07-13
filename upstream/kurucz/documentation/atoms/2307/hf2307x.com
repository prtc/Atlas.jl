$set def 2307
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf230707.dat for007
$assign poolg:hf230701.dat for001
$assign poolg:hf230702.dat for002
$assign poolg:hf230704.dat for004
$assign hf2307x.pun for011
$assign hf2307x.rrr for012
$assign hf2307x.dat for013
$assign hf2307xe.dat for014
$assign poolg:hf230731.dat for031
$assign poolg:hf230732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   23    8v viiis2p4             3s2  3p4
   23    8v viiis2p3 4p          3s2  3p3  4p
   23    8v viiis2p3 5p          3s2  3p3  5p
   23    8v viiis2p3 6p          3s2  3p3  6p
   23    8v viiis2p3 7p          3s2  3p3  7p
   23    8v viiis2p3 8p          3s2  3p3  8p
   23    8v viiis2p3 9p          3s2  3p3  9p
   23    8v viiis2p3 10p         3s2  3p3 10p
   23    8v viiis2p3 11p         3s2  3p3 11p
   23    8v viiip6               3s0  3p6 
   23    8v viiip5 4p            3s0  3p5  4p
   23    8v viiip5 5p            3s0  3p5  5p
   23    8v viiip5 6p            3s0  3p5  6p
   23    8v viiip5 7p            3s0  3p5  7p
   23    8v viiip5 8p            3s0  3p5  8p
   23    8v viiip5 9p            3s0  3p5  9p
   23    8v viiip5 10p           3s0  3p5 10p
   23    8v viiip5 11p           3s0  3p5 11p
   23    8v viiis2p3 4f          3s2  3p3  4f
   23    8v viiis2p3 5f          3s2  3p3  5f
   23    8v viiis2p3 6f          3s2  3p3  6f
   23    8v viiis2p3 7f          3s2  3p3  7f
   23    8v viiis2p3 8f          3s2  3p3  8f
   23    8v viiis2p3 9f          3s2  3p3  9f
   23    8v viiis2p3 10f         3s2  3p3 10f
   23    8v viiis2p3 11f         3s2  3p3 11f
   23    8v viiip5 4f            3s0  3p5  4f
   23    8v viiip5 5f            3s0  3p5  5f
   23    8v viiip5 6f            3s0  3p5  6f
   23    8v viiip5 7f            3s0  3p5  7f
   23    8v viiip5 8f            3s0  3p5  8f
   23    8v viiip5 9f            3s0  3p5  9f
   23    8v viiip5 10f           3s0  3p5 10f
   23    8v viiip5 11f           3s0  3p5 11f
   23    8v viiis2p3 6h          3s2  3p3  6h
   23    8v viiis2p3 7h          3s2  3p3  7h
   23    8v viiis2p3 8h          3s2  3p3  8h
   23    8v viiis2p3 9h          3s2  3p3  9h
   23    8v viiis2p3 8k          3s2  3p3  8k
   23    8v viiis2p3 9k          3s2  3p3  9k
   23    8v viiisp4 4s           3s   3p4  4s
   23    8v viiisp4 5s           3s   3p4  5s
   23    8v viiisp4 6s           3s   3p4  6s
   23    8v viiisp4 7s           3s   3p4  7s
   23    8v viiisp4 8s           3s   3p4  8s
   23    8v viiisp4 9s           3s   3p4  9s
   23    8v viiisp4 3d           3s   3p4  3d
   23    8v viiisp4 4d           3s   3p4  4d
   23    8v viiisp4 5d           3s   3p4  5d
   23    8v viiisp4 6d           3s   3p4  6d
   23    8v viiisp4 7d           3s   3p4  7d
   23    8v viiisp4 8d           3s   3p4  8d
   23    8v viiisp4 9d           3s   3p4  9d
   23    8v viiis2p3 4s          3s2  3p3  4s
   23    8v viiis2p3 5s          3s2  3p3  5s
   23    8v viiis2p3 6s          3s2  3p3  6s
   23    8v viiis2p3 7s          3s2  3p3  7s
   23    8v viiis2p3 8s          3s2  3p3  8s
   23    8v viiis2p3 9s          3s2  3p3  9s
   23    8v viiis2p3 10s         3s2  3p3 10s
   23    8v viiis2p3 11s         3s2  3p3 11s
   23    8v viiip5 4s            3s0  3p5  4s
   23    8v viiip5 5s            3s0  3p5  5s
   23    8v viiip5 6s            3s0  3p5  6s
   23    8v viiip5 7s            3s0  3p5  7s
   23    8v viiip5 8s            3s0  3p5  8s
   23    8v viiip5 9s            3s0  3p5  9s
   23    8v viiip5 10s           3s0  3p5 10s
   23    8v viiip5 11s           3s0  3p5 11s
   23    8v viiis2p3 3d          3s2  3p3  3d
   23    8v viiis2p3 4d          3s2  3p3  4d
   23    8v viiis2p3 5d          3s2  3p3  5d
   23    8v viiis2p3 6d          3s2  3p3  6d
   23    8v viiis2p3 7d          3s2  3p3  7d
   23    8v viiis2p3 8d          3s2  3p3  8d
   23    8v viiis2p3 9d          3s2  3p3  9d
   23    8v viiis2p3 10d         3s2  3p3 10d
   23    8v viiis2p3 11d         3s2  3p3 11d
   23    8v viiip5 3d            3s0  3p5  3d
   23    8v viiip5 4d            3s0  3p5  4d
   23    8v viiip5 5d            3s0  3p5  5d
   23    8v viiip5 6d            3s0  3p5  6d
   23    8v viiip5 7d            3s0  3p5  7d
   23    8v viiip5 8d            3s0  3p5  8d
   23    8v viiip5 9d            3s0  3p5  9d
   23    8v viiip5 10d           3s0  3p5 10d
   23    8v viiip5 11d           3s0  3p5 11d
   23    8v viiis2p3 5g          3s2  3p3  5g
   23    8v viiis2p3 6g          3s2  3p3  6g
   23    8v viiis2p3 7g          3s2  3p3  7g
   23    8v viiis2p3 8g          3s2  3p3  8g
   23    8v viiis2p3 9g          3s2  3p3  9g
   23    8v viiis2p3 7i          3s2  3p3  7i
   23    8v viiis2p3 8i          3s2  3p3  8i
   23    8v viiis2p3 9i          3s2  3p3  9i
   23    8v viiisp5              3s   3p5  
   23    8v viiisp4 5p           3s   3p4  5p
   23    8v viiisp4 6p           3s   3p4  6p
   23    8v viiisp4 7p           3s   3p4  7p
   23    8v viiisp4 8p           3s   3p4  8p
   23    8v viiisp4 9p           3s   3p4  9p
   23    8v viiisp4 4f           3s   3p4  4f
   23    8v viiisp4 5f           3s   3p4  5f
   23    8v viiisp4 6f           3s   3p4  6f
   23    8v viiisp4 7f           3s   3p4  7f
   23    8v viiisp4 8f           3s   3p4  8f
   23    8v viiisp4 9f           3s   3p4  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF230701.DAT;*
$DELETE POOLG:HF230702.DAT;*
$DELETE POOLG:HF230704.DAT;*
$DELETE POOLG:HF230731.DAT;*
$DELETE POOLG:HF230732.DAT;*
