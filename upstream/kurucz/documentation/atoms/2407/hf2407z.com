$set def 2407
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf240707.dat for007
$assign poolg:hf240701.dat for001
$assign poolg:hf240702.dat for002
$assign poolg:hf240704.dat for004
$assign hf2407z.pun for011
$assign hf2407z.rrr for012
$assign hf2407z.dat for013
$assign hf2407ze.dat for014
$assign poolg:hf240731.dat for031
$assign poolg:hf240732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   24    8crviiis2p5             3s2  3p5
   24    8crviiis2p4 4f          3s2  3p4  4f
   24    8crviiis2p4 5f          3s2  3p4  5f
   24    8crviiis2p4 6f          3s2  3p4  6f
   24    8crviiis2p4 7f          3s2  3p4  7f
   24    8crviiis2p4 8f          3s2  3p4  8f
   24    8crviiis2p4 9f          3s2  3p4  9f
   24    8crviiis2p4 10f         3s2  3p4 10f
   24    8crviiis2p4 11f         3s2  3p4 11f
   24    8crviiis2p4 12f         3s2  3p4 12f
   24    8crviiis2p4 6h          3s2  3p4  6h
   24    8crviiis2p4 7h          3s2  3p4  7h
   24    8crviiis2p4 8h          3s2  3p4  8h
   24    8crviiis2p4 9h          3s2  3p4  9h
   24    8crviiis2p4 8k          3s2  3p4  8k
   24    8crviiis2p4 9k          3s2  3p4  9k
   24    8crviiis2p4 5g          3s2  3p4  5g
   24    8crviiis2p4 6g          3s2  3p4  6g
   24    8crviiis2p4 7g          3s2  3p4  7g
   24    8crviiis2p4 8g          3s2  3p4  8g
   24    8crviiis2p4 9g          3s2  3p4  9g
   24    8crviiis2p4 7i          3s2  3p4  7i
   24    8crviiis2p4 8i          3s2  3p4  8i
   24    8crviiis2p4 9i          3s2  3p4  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF240701.DAT;*
$DELETE POOLG:HF240702.DAT;*
$DELETE POOLG:HF240704.DAT;*
$DELETE POOLG:HF240731.DAT;*
$DELETE POOLG:HF240732.DAT;*
