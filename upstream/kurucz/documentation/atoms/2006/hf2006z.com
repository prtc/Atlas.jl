$set def 2006
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200607.dat for007
$assign poolg:hf200601.dat for001
$assign poolg:hf200602.dat for002
$assign poolg:hf200604.dat for004
$assign hf2006z.pun for011
$assign hf2006z.rrr for012
$assign hf2006z.dat for013
$assign hf2006ze.dat for014
$assign poolg:hf200631.dat for031
$assign poolg:hf200632.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    7ca vii s2p2            3s2  3p2
   20    7ca vii s2p 4f          3s2  3p   4f
   20    7ca vii s2p 5f          3s2  3p   5f
   20    7ca vii s2p 6f          3s2  3p   6f
   20    7ca vii s2p 7f          3s2  3p   7f
   20    7ca vii s2p 8f          3s2  3p   8f
   20    7ca vii s2p 9f          3s2  3p   9f
   20    7ca vii s2p 10f         3s2  3p  10f
   20    7ca vii p3 4f           3s0  3p3  4f
   20    7ca vii p3 5f           3s0  3p3  5f
   20    7ca vii p3 6f           3s0  3p3  6f
   20    7ca vii p3 7f           3s0  3p3  7f
   20    7ca vii p3 8f           3s0  3p3  8f
   20    7ca vii p3 9f           3s0  3p3  9f
   20    7ca vii p3 10f          3s0  3p3 10f
   20    7ca vii s2p 6h          3s2  3p   6h
   20    7ca vii s2p 7h          3s2  3p   7h
   20    7ca vii s2p 8h          3s2  3p   8h
   20    7ca vii s2p 9h          3s2  3p   9h
   20    7ca vii s2p 10h         3s2  3p  10h
   20    7ca vii p3 6h           3s0  3p3  6h
   20    7ca vii p3 7h           3s0  3p3  7h
   20    7ca vii p3 8h           3s0  3p3  8h
   20    7ca vii p3 9h           3s0  3p3  9h
   20    7ca vii p3 10h          3s0  3p3 10h
   20    7ca vii s2p 8k          3s2  3p   8k
   20    7ca vii s2p 9k          3s2  3p   9k
   20    7ca vii s2p 10k         3s2  3p  10k
   20    7ca vii p3 8k           3s0  3p3  8k
   20    7ca vii p3 9k           3s0  3p3  9k
   20    7ca vii p3 10k          3s0  3p3 10k
   20    7ca vii s2p 5g          3s2  3p   5g
   20    7ca vii s2p 6g          3s2  3p   6g
   20    7ca vii s2p 7g          3s2  3p   7g
   20    7ca vii s2p 8g          3s2  3p   8g
   20    7ca vii s2p 9g          3s2  3p   9g
   20    7ca vii s2p 10g         3s2  3p  10g
   20    7ca vii p3 5g           3s0  3p3  5g
   20    7ca vii p3 6g           3s0  3p3  6g
   20    7ca vii p3 7g           3s0  3p3  7g
   20    7ca vii p3 8g           3s0  3p3  8g
   20    7ca vii p3 9g           3s0  3p3  9g
   20    7ca vii p3 10g          3s0  3p3 10g
   20    7ca vii s2p 7i          3s2  3p   7i
   20    7ca vii s2p 8i          3s2  3p   8i
   20    7ca vii s2p 9i          3s2  3p   9i
   20    7ca vii s2p 10i         3s2  3p  10i
   20    7ca vii p3 7i           3s0  3p3  7i
   20    7ca vii p3 8i           3s0  3p3  8i
   20    7ca vii p3 9i           3s0  3p3  9i
   20    7ca vii p3 10i          3s0  3p3 10i
   -1
$run cray:rcn2c
$DELETE POOLG:HF200601.DAT;*
$DELETE POOLG:HF200602.DAT;*
$DELETE POOLG:HF200604.DAT;*
$DELETE POOLG:HF200631.DAT;*
$DELETE POOLG:HF200632.DAT;*
