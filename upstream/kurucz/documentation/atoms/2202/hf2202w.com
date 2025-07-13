$set def 2202
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf220207.dat for007
$assign poolg:hf220201.dat for001
$assign poolg:hf220202.dat for002
$assign poolg:hf220204.dat for004
$assign hf2202w.pun for011
$assign hf2202w.rrr for012
$assign hf2202w.dat for013
$assign hf2202we.dat for014
$assign poolg:hf220231.dat for031
$assign poolg:hf220232.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   22    3ti iii3d2              3d2
   22    3ti iii3d4d             3d   4d
   22    3ti iii3d5d             3d   5d
   22    3ti iii3d6d             3d   6d
   22    3ti iii3d7d             3d   7d
   22    3ti iii3d8d             3d   8d
   22    3ti iii3d9d             3d   9d
   22    3ti iii3d10d            3d  10d
   22    3ti iii3d11d            3d  11d
   22    3ti iii4s4d             4s   4d
   22    3ti iii4s5d             4s   5d
   22    3ti iii4s6d             4s   6d
   22    3ti iii4s7d             4s   7d
   22    3ti iii4s8d             4s   8d
   22    3ti iii4s9d             4s   9d
   22    3ti iii4s10d            4s  10d
   22    3ti iii4s11d            4s  11d
   22    3ti iii3d4s             3d   4s
   22    3ti iii3d5s             3d   5s
   22    3ti iii3d6s             3d   6s
   22    3ti iii3d7s             3d   7s
   22    3ti iii3d8s             3d   8s
   22    3ti iii3d9s             3d   9s
   22    3ti iii3d10s            3d  10s
   22    3ti iii3d11s            3d  11s
   22    3ti iii4s2              4s2
   22    3ti iii4s5s             4s   5s
   22    3ti iii4s6s             4s   6s
   22    3ti iii4s7s             4s   7s
   22    3ti iii4s8s             4s   8s
   22    3ti iii4s9s             4s   9s
   22    3ti iii4s10s            4s  10s
   22    3ti iii4s11s            4s  11s
   22    3ti iii4p2              4p2
   22    3ti iii4p5p             4p   5p
   22    3ti iii4p6p             4p   6p
   22    3ti iii4p7p             4p   7p
   22    3ti iii4p8p             4p   8p
   22    3ti iii4p9p             4p   9p
   22    3ti iii4p4f             4p   4f
   22    3ti iii4p5f             4p   5f
   22    3ti iii4p6f             4p   6f
   22    3ti iii4p7f             4p   7f
   22    3ti iii4p8f             4p   8f
   22    3ti iii4p9f             4p   9f
   22    3ti iii3d4p             3d   4p
   22    3ti iii3d5p             3d   5p
   22    3ti iii3d6p             3d   6p
   22    3ti iii3d7p             3d   7p
   22    3ti iii3d8p             3d   8p
   22    3ti iii3d9p             3d   9p
   22    3ti iii3d10p            3d  10p
   22    3ti iii3d11p            3d  11p
   22    3ti iii4s4p             4s   4p
   22    3ti iii4s5p             4s   5p
   22    3ti iii4s6p             4s   6p
   22    3ti iii4s7p             4s   7p
   22    3ti iii4s8p             4s   8p
   22    3ti iii4s9p             4s   9p
   22    3ti iii4s10p            4s  10p
   22    3ti iii4s11p            4s  11p
   22    3ti iii3d4f             3d   4f
   22    3ti iii3d5f             3d   5f
   22    3ti iii3d6f             3d   6f
   22    3ti iii3d7f             3d   7f
   22    3ti iii3d8f             3d   8f
   22    3ti iii3d9f             3d   9f
   22    3ti iii3d10f            3d  10f
   22    3ti iii3d11f            3d  11f
   22    3ti iii4s4f             4s   4f
   22    3ti iii4s5f             4s   5f
   22    3ti iii4s6f             4s   6f
   22    3ti iii4s7f             4s   7f
   22    3ti iii4s8f             4s   8f
   22    3ti iii4s9f             4s   9f
   22    3ti iii4s10f            4s  10f
   22    3ti iii4s11f            4s  11f
   22    3ti iii4p4d             4p   4d
   22    3ti iii4p5d             4p   5d
   22    3ti iii4p6d             4p   6d
   22    3ti iii4p7d             4p   7d
   22    3ti iii4p8d             4p   8d
   22    3ti iii4p9d             4p   9d
   22    3ti iii4p5s             4p   5s
   22    3ti iii4p6s             4p   6s
   22    3ti iii4p7s             4p   7s
   22    3ti iii4p8s             4p   8s
   22    3ti iii4p9s             4p   9s
   -1
   -1
$run cray:rcn2c
$DELETE POOLG:HF220201.DAT;*
$DELETE POOLG:HF220202.DAT;*
$DELETE POOLG:HF220204.DAT;*
$DELETE POOLG:HF220231.DAT;*
$DELETE POOLG:HF220232.DAT;*
