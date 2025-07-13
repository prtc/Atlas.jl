$set def 2008
$assign sys$input for010
$assign sys$output for009
$assign poolg:hf200807.dat for007
$assign poolg:hf200801.dat for001
$assign poolg:hf200802.dat for002
$assign poolg:hf200804.dat for004
$assign hf2008y.pun for011
$assign hf2008y.rrr for012
$assign hf2008y.dat for013
$assign hf2008ye.dat for014
$assign poolg:hf200831.dat for031
$assign poolg:hf200832.dat for032
$run cray:rcn32c
2  -5    0   10  1.0    5.e-08    1.e-11-2   150   1.0  0.65  0.1 0.50 0.0  0.70
   20    9ca ix  3s2             3s2
   20    9ca ix  3s4s            3s   4s
   20    9ca ix  3s5s            3s   5s
   20    9ca ix  3s6s            3s   6s
   20    9ca ix  3s7s            3s   7s
   20    9ca ix  3s8s            3s   8s
   20    9ca ix  3s9s            3s   9s
   20    9ca ix  3s10s           3s  10s
   20    9ca ix  3s11s           3s  11s
   20    9ca ix  3s12s           3s  12s
   20    9ca ix  3d4s            3d   4s
   20    9ca ix  3d5s            3d   5s
   20    9ca ix  3d6s            3d   6s
   20    9ca ix  3d7s            3d   7s
   20    9ca ix  3d8s            3d   8s
   20    9ca ix  3d9s            3d   9s
   20    9ca ix  3d10s           3d  10s
   20    9ca ix  3d11s           3d  11s
   20    9ca ix  3d12s           3d  12s
   20    9ca ix  3s3d            3s   3d
   20    9ca ix  3s4d            3s   4d
   20    9ca ix  3s5d            3s   5d
   20    9ca ix  3s6d            3s   6d
   20    9ca ix  3s7d            3s   7d
   20    9ca ix  3s8d            3s   8d
   20    9ca ix  3s9d            3s   9d
   20    9ca ix  3s10d           3s  10d
   20    9ca ix  3s11d           3s  11d
   20    9ca ix  3s12d           3s  12d
   20    9ca ix  3d2             3d2   
   20    9ca ix  3d4d            3d   4d
   20    9ca ix  3d5d            3d   5d
   20    9ca ix  3d6d            3d   6d
   20    9ca ix  3d7d            3d   7d
   20    9ca ix  3d8d            3d   8d
   20    9ca ix  3d9d            3d   9d
   20    9ca ix  3d10d           3d  10d
   20    9ca ix  3d11d           3d  11d
   20    9ca ix  3d12d           3d  12d
   20    9ca ix  3p2             3p2   
   20    9ca ix  3p4p            3p   4p   
   20    9ca ix  3p5p            3p   5p   
   20    9ca ix  3p6p            3p   6p   
   20    9ca ix  3p7p            3p   7p   
   20    9ca ix  3p8p            3p   8p   
   20    9ca ix  3p9p            3p   9p   
   20    9ca ix  3p4f            3p   4f   
   20    9ca ix  3p5f            3p   5f   
   20    9ca ix  3p6f            3p   6f   
   20    9ca ix  3p7f            3p   7f   
   20    9ca ix  3p8f            3p   8f   
   20    9ca ix  3p9f            3p   9f
   20    9ca ix  3s3p            3s   3p
   20    9ca ix  3s4p            3s   4p
   20    9ca ix  3s5p            3s   5p
   20    9ca ix  3s6p            3s   6p
   20    9ca ix  3s7p            3s   7p
   20    9ca ix  3s8p            3s   8p
   20    9ca ix  3s9p            3s   9p
   20    9ca ix  3s10p           3s  10p
   20    9ca ix  3s11p           3s  11p
   20    9ca ix  3s12p           3s  12p
   20    9ca ix  3d3p            3d   3p
   20    9ca ix  3d4p            3d   4p
   20    9ca ix  3d5p            3d   5p
   20    9ca ix  3d6p            3d   6p
   20    9ca ix  3d7p            3d   7p
   20    9ca ix  3d8p            3d   8p
   20    9ca ix  3d9p            3d   9p
   20    9ca ix  3d10p           3d  10p
   20    9ca ix  3d11p           3d  11p
   20    9ca ix  3d12p           3d  12p
   20    9ca ix  3s4f            3s   4f
   20    9ca ix  3s5f            3s   5f
   20    9ca ix  3s6f            3s   6f
   20    9ca ix  3s7f            3s   7f
   20    9ca ix  3s8f            3s   8f
   20    9ca ix  3s9f            3s   9f
   20    9ca ix  3s10f           3s  10f
   20    9ca ix  3s11f           3s  11f
   20    9ca ix  3s12f           3s  12f
   20    9ca ix  3d4f            3d   4f
   20    9ca ix  3d5f            3d   5f
   20    9ca ix  3d6f            3d   6f
   20    9ca ix  3d7f            3d   7f
   20    9ca ix  3d8f            3d   8f
   20    9ca ix  3d9f            3d   9f
   20    9ca ix  3d10f           3d  10f
   20    9ca ix  3d11f           3d  11f
   20    9ca ix  3d12f           3d  12f
   20    9ca ix  3p4s            3p   4s
   20    9ca ix  3p5s            3p   5s
   20    9ca ix  3p6s            3p   6s
   20    9ca ix  3p7s            3p   7s
   20    9ca ix  3p8s            3p   8s
   20    9ca ix  3p9s            3p   9s
   20    9ca ix  3p4d            3p   4d
   20    9ca ix  3p5d            3p   5d
   20    9ca ix  3p6d            3p   6d
   20    9ca ix  3p7d            3p   7d
   20    9ca ix  3p8d            3p   8d
   20    9ca ix  3p9d            3p   9d
   -1
$run cray:rcn2c
$DELETE POOLG:HF200801.DAT;*
$DELETE POOLG:HF200802.DAT;*
$DELETE POOLG:HF200804.DAT;*
$DELETE POOLG:HF200831.DAT;*
$DELETE POOLG:HF200832.DAT;*
