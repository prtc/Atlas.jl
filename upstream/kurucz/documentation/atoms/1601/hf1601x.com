$set def 1601
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf160107.dat for007
$assign poolg:hf160101.dat for001
$assign poolg:hf160102.dat for002
$assign poolg:hf160104.dat for004
$assign hf1601x.pun for011
$assign hf1601x.rrr for012
$assign hf1601x.dat for013
$assign hf1601xe.dat for014
$assign poolg:hf160131.dat for031
$assign poolg:hf160132.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   16    2s ii  s2p3             3s2  3p3
   16    2s ii  s2p2 4p          3s2  3p2  4p
   16    2s ii  s2p2 5p          3s2  3p2  5p
   16    2s ii  s2p2 6p          3s2  3p2  6p
   16    2s ii  s2p2 7p          3s2  3p2  7p
   16    2s ii  s2p2 8p          3s2  3p2  8p
   16    2s ii  s2p2 9p          3s2  3p2  9p
   16    2s ii  s2p2 4f          3s2  3p2  4f
   16    2s ii  s2p2 5f          3s2  3p2  5f
   16    2s ii  s2p2 6f          3s2  3p2  6f
   16    2s ii  s2p2 7f          3s2  3p2  7f
   16    2s ii  s2p2 8f          3s2  3p2  8f
   16    2s ii  s2p2 9f          3s2  3p2  9f
   16    2s ii  s2p2 6h          3s2  3p2  6h
   16    2s ii  s2p2 7h          3s2  3p2  7h
   16    2s ii  s2p2 8h          3s2  3p2  8h
   16    2s ii  s2p2 9h          3s2  3p2  9h
   16    2s ii  s2p2 8k          3s2  3p2  8k
   16    2s ii  s2p2 9k          3s2  3p2  9k
   16    2s ii  sp3 4s           3s   3p3  4s
   16    2s ii  sp3 5s           3s   3p3  5s
   16    2s ii  sp3 6s           3s   3p3  6s
   16    2s ii  sp3 7s           3s   3p3  7s
   16    2s ii  sp3 8s           3s   3p3  8s
   16    2s ii  sp3 9s           3s   3p3  9s
   16    2s ii  sp3 3d           3s   3p3  3d
   16    2s ii  sp3 4d           3s   3p3  4d
   16    2s ii  sp3 5d           3s   3p3  5d
   16    2s ii  sp3 6d           3s   3p3  6d
   16    2s ii  sp3 7d           3s   3p3  7d
   16    2s ii  sp3 8d           3s   3p3  8d
   16    2s ii  sp3 9d           3s   3p3  9d
   16    2s ii  s2p2 4s          3s2  3p2  4s
   16    2s ii  s2p2 5s          3s2  3p2  5s
   16    2s ii  s2p2 6s          3s2  3p2  6s
   16    2s ii  s2p2 7s          3s2  3p2  7s
   16    2s ii  s2p2 8s          3s2  3p2  8s
   16    2s ii  s2p2 9s          3s2  3p2  9s
   16    2s ii  s2p2 3d          3s2  3p2  3d
   16    2s ii  s2p2 4d          3s2  3p2  4d
   16    2s ii  s2p2 5d          3s2  3p2  5d
   16    2s ii  s2p2 6d          3s2  3p2  6d
   16    2s ii  s2p2 7d          3s2  3p2  7d
   16    2s ii  s2p2 8d          3s2  3p2  8d
   16    2s ii  s2p2 9d          3s2  3p2  9d
   16    2s ii  s2p2 5g          3s2  3p2  5g
   16    2s ii  s2p2 6g          3s2  3p2  6g
   16    2s ii  s2p2 7g          3s2  3p2  7g
   16    2s ii  s2p2 8g          3s2  3p2  8g
   16    2s ii  s2p2 9g          3s2  3p2  9g
   16    2s ii  s2p2 7i          3s2  3p2  7i
   16    2s ii  s2p2 8i          3s2  3p2  8i
   16    2s ii  s2p2 9i          3s2  3p2  9i
   16    2s ii  sp4              3s   3p4  
   16    2s ii  sp3 4p           3s   3p3  4p
   16    2s ii  sp3 5p           3s   3p3  5p
   16    2s ii  sp3 6p           3s   3p3  6p
   16    2s ii  sp3 7p           3s   3p3  7p
   16    2s ii  sp3 8p           3s   3p3  8p
   16    2s ii  sp3 9p           3s   3p3  9p
   16    2s ii  sp3 4f           3s   3p3  4f
   16    2s ii  sp3 5f           3s   3p3  5f
   16    2s ii  sp3 6f           3s   3p3  6f
   16    2s ii  sp3 7f           3s   3p3  7f
   16    2s ii  sp3 8f           3s   3p3  8f
   16    2s ii  sp3 9f           3s   3p3  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF160101.DAT;*
$DELETE POOLG:HF160102.DAT;*
$DELETE POOLG:HF160104.DAT;*
$DELETE POOLG:HF160131.DAT;*
$DELETE POOLG:HF160132.DAT;*
