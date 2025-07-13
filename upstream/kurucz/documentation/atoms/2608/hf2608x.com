$set DEF 2608
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf260807.dat for007
$assign poolg:hf260801.dat for001
$assign poolg:hf260802.dat for002
$assign poolg:hf260804.dat for004
$assign hf2608x.pun for011
$assign hf2608x.rrr for012
$assign hf2608x.dat for013
$assign hf2608xe.dat for014
$assign poolg:hf260831.dat for031
$assign poolg:hf260832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   26    9fe xi s2p6             3s2  3p6
   26    9fe xi s2p5 4p          3s2  3p5  4p
   26    9fe xi s2p5 5p          3s2  3p5  5p
   26    9fe xi s2p5 6p          3s2  3p5  6p
   26    9fe xi s2p5 7p          3s2  3p5  7p
   26    9fe xi s2p5 8p          3s2  3p5  8p
   26    9fe xi s2p5 9p          3s2  3p5  9p
   26    9fe xi s2p5 4f          3s2  3p5  4f
   26    9fe xi s2p5 5f          3s2  3p5  5f
   26    9fe xi s2p5 6f          3s2  3p5  6f
   26    9fe xi s2p5 7f          3s2  3p5  7f
   26    9fe xi s2p5 8f          3s2  3p5  8f
   26    9fe xi s2p5 9f          3s2  3p5  9f
   26    9fe xi s2p5 6h          3s2  3p5  6h
   26    9fe xi s2p5 7h          3s2  3p5  7h
   26    9fe xi s2p5 8h          3s2  3p5  8h
   26    9fe xi s2p5 9h          3s2  3p5  9h
   26    9fe xi s2p5 8k          3s2  3p5  8k
   26    9fe xi s2p5 9k          3s2  3p5  9k
   26    9fe xi sp6 4s           3s   3p6  4s
   26    9fe xi sp6 5s           3s   3p6  5s
   26    9fe xi sp6 6s           3s   3p6  6s
   26    9fe xi sp6 7s           3s   3p6  7s
   26    9fe xi sp6 8s           3s   3p6  8s
   26    9fe xi sp6 9s           3s   3p6  9s
   26    9fe xi sp6 3d           3s   3p6  3d
   26    9fe xi sp6 4d           3s   3p6  4d
   26    9fe xi sp6 5d           3s   3p6  5d
   26    9fe xi sp6 6d           3s   3p6  6d
   26    9fe xi sp6 7d           3s   3p6  7d
   26    9fe xi sp6 8d           3s   3p6  8d
   26    9fe xi sp6 9d           3s   3p6  9d
   26    9fe xi s2p5 4s          3s2  3p5  4s
   26    9fe xi s2p5 5s          3s2  3p5  5s
   26    9fe xi s2p5 6s          3s2  3p5  6s
   26    9fe xi s2p5 7s          3s2  3p5  7s
   26    9fe xi s2p5 8s          3s2  3p5  8s
   26    9fe xi s2p5 9s          3s2  3p5  9s
   26    9fe xi s2p5 3d          3s2  3p5  3d
   26    9fe xi s2p5 4d          3s2  3p5  4d
   26    9fe xi s2p5 5d          3s2  3p5  5d
   26    9fe xi s2p5 6d          3s2  3p5  6d
   26    9fe xi s2p5 7d          3s2  3p5  7d
   26    9fe xi s2p5 8d          3s2  3p5  8d
   26    9fe xi s2p5 9d          3s2  3p5  9d
   26    9fe xi s2p5 5g          3s2  3p5  5g
   26    9fe xi s2p5 6g          3s2  3p5  6g
   26    9fe xi s2p5 7g          3s2  3p5  7g
   26    9fe xi s2p5 8g          3s2  3p5  8g
   26    9fe xi s2p5 9g          3s2  3p5  9g
   26    9fe xi s2p5 7i          3s2  3p5  7i
   26    9fe xi s2p5 8i          3s2  3p5  8i
   26    9fe xi s2p5 9i          3s2  3p5  9i
   26    9fe xi sp6 4p           3s   3p6  4p
   26    9fe xi sp6 5p           3s   3p6  5p
   26    9fe xi sp6 6p           3s   3p6  6p
   26    9fe xi sp6 7p           3s   3p6  7p
   26    9fe xi sp6 8p           3s   3p6  8p
   26    9fe xi sp6 9p           3s   3p6  9p
   26    9fe xi sp6 4f           3s   3p6  4f
   26    9fe xi sp6 5f           3s   3p6  5f
   26    9fe xi sp6 6f           3s   3p6  6f
   26    9fe xi sp6 7f           3s   3p6  7f
   26    9fe xi sp6 8f           3s   3p6  8f
   26    9fe xi sp6 9f           3s   3p6  9f
   -1
$run cray:rcn2c
$DELETE POOLG:HF260801.DAT;*
$DELETE POOLG:HF260802.DAT;*
$DELETE POOLG:HF260804.DAT;*
$DELETE POOLG:HF260831.DAT;*
$DELETE POOLG:HF260832.DAT;*
