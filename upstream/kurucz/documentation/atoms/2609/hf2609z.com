$set def 2609
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf260907.dat for007
$assign poolg:hf260901.dat for001
$assign poolg:hf260902.dat for002
$assign poolg:hf260904.dat for004
$assign hf2609z.pun for011
$assign hf2609z.rrr for012
$assign hf2609z.dat for013
$assign hf2609ze.dat for014
$assign poolg:hf260931.dat for031
$assign poolg:hf260932.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   26   10fe x  s2p5             3s2  3p5
   26   10fe x  s2p4 4f          3s2  3p4  4f
   26   10fe x  s2p4 5f          3s2  3p4  5f
   26   10fe x  s2p4 6f          3s2  3p4  6f
   26   10fe x  s2p4 7f          3s2  3p4  7f
   26   10fe x  s2p4 8f          3s2  3p4  8f
   26   10fe x  s2p4 9f          3s2  3p4  9f
   26   10fe x  s2p4 10f         3s2  3p4 10f
   26   10fe x  s2p4 11f         3s2  3p4 11f
   26   10fe x  s2p4 12f         3s2  3p4 12f
   26   10fe x  s2p4 6h          3s2  3p4  6h
   26   10fe x  s2p4 7h          3s2  3p4  7h
   26   10fe x  s2p4 8h          3s2  3p4  8h
   26   10fe x  s2p4 9h          3s2  3p4  9h
   26   10fe x  s2p4 8k          3s2  3p4  8k
   26   10fe x  s2p4 9k          3s2  3p4  9k
   26   10fe x  s2p4 5g          3s2  3p4  5g
   26   10fe x  s2p4 6g          3s2  3p4  6g
   26   10fe x  s2p4 7g          3s2  3p4  7g
   26   10fe x  s2p4 8g          3s2  3p4  8g
   26   10fe x  s2p4 9g          3s2  3p4  9g
   26   10fe x  s2p4 7i          3s2  3p4  7i
   26   10fe x  s2p4 8i          3s2  3p4  8i
   26   10fe x  s2p4 9i          3s2  3p4  9i
   -1
$run cray:rcn2c
$DELETE POOLG:HF260901.DAT;*
$DELETE POOLG:HF260902.DAT;*
$DELETE POOLG:HF260904.DAT;*
$DELETE POOLG:HF260931.DAT;*
$DELETE POOLG:HF260932.DAT;*
