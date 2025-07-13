$set def 2107
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf210707.dat for007
$assign poolg:hf210701.dat for001
$assign poolg:hf210702.dat for002
$assign poolg:hf210704.dat for004
$assign hf2107z.pun for011
$assign hf2107z.rrr for012
$assign hf2107z.dat for013
$assign hf2107ze.dat for014
$assign poolg:hf210731.dat for031
$assign poolg:hf210732.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   21    8scviii s2p2            3s2  3p2
   21    8scviii s2p 4f          3s2  3p   4f
   21    8scviii s2p 5f          3s2  3p   5f
   21    8scviii s2p 6f          3s2  3p   6f
   21    8scviii s2p 7f          3s2  3p   7f
   21    8scviii s2p 8f          3s2  3p   8f
   21    8scviii s2p 9f          3s2  3p   9f
   21    8scviii s2p 10f         3s2  3p  10f
   21    8scviii p3 4f           3s0  3p3  4f
   21    8scviii p3 5f           3s0  3p3  5f
   21    8scviii p3 6f           3s0  3p3  6f
   21    8scviii p3 7f           3s0  3p3  7f
   21    8scviii p3 8f           3s0  3p3  8f
   21    8scviii p3 9f           3s0  3p3  9f
   21    8scviii p3 10f          3s0  3p3 10f
   21    8scviii s2p 6h          3s2  3p   6h
   21    8scviii s2p 7h          3s2  3p   7h
   21    8scviii s2p 8h          3s2  3p   8h
   21    8scviii s2p 9h          3s2  3p   9h
   21    8scviii s2p 10h         3s2  3p  10h
   21    8scviii p3 6h           3s0  3p3  6h
   21    8scviii p3 7h           3s0  3p3  7h
   21    8scviii p3 8h           3s0  3p3  8h
   21    8scviii p3 9h           3s0  3p3  9h
   21    8scviii p3 10h          3s0  3p3 10h
   21    8scviii s2p 8k          3s2  3p   8k
   21    8scviii s2p 9k          3s2  3p   9k
   21    8scviii s2p 10k         3s2  3p  10k
   21    8scviii p3 8k           3s0  3p3  8k
   21    8scviii p3 9k           3s0  3p3  9k
   21    8scviii p3 10k          3s0  3p3 10k
   21    8scviii s2p 5g          3s2  3p   5g
   21    8scviii s2p 6g          3s2  3p   6g
   21    8scviii s2p 7g          3s2  3p   7g
   21    8scviii s2p 8g          3s2  3p   8g
   21    8scviii s2p 9g          3s2  3p   9g
   21    8scviii s2p 10g         3s2  3p  10g
   21    8scviii p3 5g           3s0  3p3  5g
   21    8scviii p3 6g           3s0  3p3  6g
   21    8scviii p3 7g           3s0  3p3  7g
   21    8scviii p3 8g           3s0  3p3  8g
   21    8scviii p3 9g           3s0  3p3  9g
   21    8scviii p3 10g          3s0  3p3 10g
   21    8scviii s2p 7i          3s2  3p   7i
   21    8scviii s2p 8i          3s2  3p   8i
   21    8scviii s2p 9i          3s2  3p   9i
   21    8scviii s2p 10i         3s2  3p  10i
   21    8scviii p3 7i           3s0  3p3  7i
   21    8scviii p3 8i           3s0  3p3  8i
   21    8scviii p3 9i           3s0  3p3  9i
   21    8scviii p3 10i          3s0  3p3 10i
   -1
$run cray:rcn2c
$DELETE POOLG:HF210701.DAT;*
$DELETE POOLG:HF210702.DAT;*
$DELETE POOLG:HF210704.DAT;*
$DELETE POOLG:HF210731.DAT;*
$DELETE POOLG:HF210732.DAT;*
