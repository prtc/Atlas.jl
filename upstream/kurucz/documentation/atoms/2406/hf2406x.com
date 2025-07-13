$set DEF 2406
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240607.dat for007
$assign poolg:hf240601.dat for001
$assign poolg:hf240602.dat for002
$assign poolg:hf240604.dat for004
$assign hf2406x.pun for011
$assign hf2406x.rrr for012
$assign hf2406x.dat for013
$assign hf2406xe.dat for014
$assign poolg:hf240631.dat for031
$assign poolg:hf240632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   24    7cr viis2p6             3s2  3p6
   24    7cr viis2p5 4p          3s2  3p5  4p
   24    7cr viis2p5 5p          3s2  3p5  5p
   24    7cr viis2p5 6p          3s2  3p5  6p
   24    7cr viis2p5 7p          3s2  3p5  7p
   24    7cr viis2p5 8p          3s2  3p5  8p
   24    7cr viis2p5 9p          3s2  3p5  9p
   24    7cr viis2p5 4f          3s2  3p5  4f
   24    7cr viis2p5 5f          3s2  3p5  5f
   24    7cr viis2p5 6f          3s2  3p5  6f
   24    7cr viis2p5 7f          3s2  3p5  7f
   24    7cr viis2p5 8f          3s2  3p5  8f
   24    7cr viis2p5 9f          3s2  3p5  9f
   24    7cr viis2p5 6h          3s2  3p5  6h
   24    7cr viis2p5 7h          3s2  3p5  7h
   24    7cr viis2p5 8h          3s2  3p5  8h
   24    7cr viis2p5 9h          3s2  3p5  9h
   24    7cr viis2p5 8k          3s2  3p5  8k
   24    7cr viis2p5 9k          3s2  3p5  9k
   24    7cr viisp6 4s           3s   3p6  4s
   24    7cr viisp6 5s           3s   3p6  5s
   24    7cr viisp6 6s           3s   3p6  6s
   24    7cr viisp6 7s           3s   3p6  7s
   24    7cr viisp6 8s           3s   3p6  8s
   24    7cr viisp6 9s           3s   3p6  9s
   24    7cr viisp6 3d           3s   3p6  3d
   24    7cr viisp6 4d           3s   3p6  4d
   24    7cr viisp6 5d           3s   3p6  5d
   24    7cr viisp6 6d           3s   3p6  6d
   24    7cr viisp6 7d           3s   3p6  7d
   24    7cr viisp6 8d           3s   3p6  8d
   24    7cr viisp6 9d           3s   3p6  9d
   24    7cr viis2p5 4s          3s2  3p5  4s
   24    7cr viis2p5 5s          3s2  3p5  5s
   24    7cr viis2p5 6s          3s2  3p5  6s
   24    7cr viis2p5 7s          3s2  3p5  7s
   24    7cr viis2p5 8s          3s2  3p5  8s
   24    7cr viis2p5 9s          3s2  3p5  9s
   24    7cr viis2p5 3d          3s2  3p5  3d
   24    7cr viis2p5 4d          3s2  3p5  4d
   24    7cr viis2p5 5d          3s2  3p5  5d
   24    7cr viis2p5 6d          3s2  3p5  6d
   24    7cr viis2p5 7d          3s2  3p5  7d
   24    7cr viis2p5 8d          3s2  3p5  8d
   24    7cr viis2p5 9d          3s2  3p5  9d
   24    7cr viis2p5 5g          3s2  3p5  5g
   24    7cr viis2p5 6g          3s2  3p5  6g
   24    7cr viis2p5 7g          3s2  3p5  7g
   24    7cr viis2p5 8g          3s2  3p5  8g
   24    7cr viis2p5 9g          3s2  3p5  9g
   24    7cr viis2p5 7i          3s2  3p5  7i
   24    7cr viis2p5 8i          3s2  3p5  8i
   24    7cr viis2p5 9i          3s2  3p5  9i
   24    7cr viisp6 4p           3s   3p6  4p
   24    7cr viisp6 5p           3s   3p6  5p
   24    7cr viisp6 6p           3s   3p6  6p
   24    7cr viisp6 7p           3s   3p6  7p
   24    7cr viisp6 8p           3s   3p6  8p
   24    7cr viisp6 9p           3s   3p6  9p
   24    7cr viisp6 4f           3s   3p6  4f
   24    7cr viisp6 5f           3s   3p6  5f
   24    7cr viisp6 6f           3s   3p6  6f
   24    7cr viisp6 7f           3s   3p6  7f
   24    7cr viisp6 8f           3s   3p6  8f
   24    7cr viisp6 9f           3s   3p6  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF240601.DAT;*
$DELETE POOLG:HF240602.DAT;*
$DELETE POOLG:HF240604.DAT;*
$DELETE POOLG:HF240631.DAT;*
$DELETE POOLG:HF240632.DAT;*
