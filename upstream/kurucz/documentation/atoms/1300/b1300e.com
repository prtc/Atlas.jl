$SETpool
$SET VERIFY=NOIMAGE
$ASSIGN 1300:B1300E.PUN FOR007
$ASSIGN 1300:H1300E.HAM FOR001
$ASSIGN B1300E.EIG FOR003
$ASSIGN 1300:EAV1300E.DAT FOR066
$ASSIGN POOL:B1300E15 FOR015
$ASSIGN POOL:B1300E16 FOR016
$RUN cray:LEASTE
1Dyubko, S.F., Efremov, V.A., Gerasimov, V.G., and MacAdam, K.B. 2004.  J.Phys.B 37, 1967-1978. Rydberg
2Chang, E.S. 1990.  J.Phys.Chem.Ref.Data 19, 119-125.                *** 3s3p4p G1(sp) from Wilson, M. 1983.
3Biemont, E. and Brault, J.W. 1987.  Physica Scripta 35, 286-295.    *** Physica 122C, 282-288.
4Martin, W.C. and Zalubas, R. 1979.  J. Phys. Chem. Ref. Data 8, 817-864.  compilation
5Roig, R.A. 1975.  J. Phys. B 8, 2939-2947.
6Erickson, K.B.S. 1969.  Ark. Fys. (Stockholm) 39, 421-424. sp2 2D 48654
7Erickson, K.B.S. and Isberg, H.B.S. 1963.  Ark. Fys. (Stockholm) 23, 527-542.
8Erickson, K.B.S. and Isberg, H.B.S. 1967.  Ark. Fys. (Stockholm) 33, 593-595.
9 8s-13s Dyubko et al. Ritz   8g,9g,7i,8i,9i Chang polarization
    0   0   0   0     0.300     1.100
    2       0.7   50   70   70   50   30   10   10   10   10   10   10   10   10   10   10
    13.00
s2 4s     s2 5s     s2 6s     s2 7s     s2 8s     s2 9s     s2 10s    s2 11s
s2 12s    s2 13s    p2 4s     p2 5s     p2 6s     p2 7s     p2 8s     p2 9s
p2 10s    p2 11s    p2 12s    p2 13s    s2 3d     s2 4d     s2 5d     s2 6d
s2 7d     s2 8d     s2 9d     s2 10d    s2 11d    s2 12d    s2 13d    p2 3d
p2 4d     p2 5d     p2 6d     p2 7d     p2 8d     p2 9d     p2 10d    p2 11d
p2 12d    p2 13d    s2 5g     s2 6g     s2 7g     s2 8g     s2 9g     p2 5g
p2 6g     p2 7g     p2 8g     p2 9g     s2 7i     s2 8i     s2 9i     p2 7i
p2 8i     p2 9i     sp2       sp 4p     sp 5p     sp 6p     sp 7p     sp 8p
sp 9p     sp 4f     sp 5f     sp 6f     sp 7f     sp 8f     sp 9f
   -1.
    .5     25347.756             3s2 4s 2S                3s2 4s 2S
    .5     29020.41              3s3p2 4P                 3s3p2 4P
    .5     37689.413             3s2 5s 2S                3s2 5s 2S
    .5     42144.402             3s2 6s 2S                3s2 6s 2S
    .5     44273.122             3s2 7s 2S                3s2 7s 2S
    .5     45457.233             3s2 8s 2S                3s2 8s 2S
    .5     46183.896             3s2 9s 2S                3s2 9s 2S
    .5     46661.88 R            3s2 10s 2S               3s2 10s 2S
    .5     46993.05 R            3s2 11s 2S               3s2 11s 2S
    .5     47231.93 R            3s2 12s 2S               3s2 12s 2S
    .5     47409.89 R            3s2 13s 2S               3s2 13s 2S
    .5     51752.7               3s3p2 2S                 3s3p2 2S
    .5     56636.93              3s3p2 2P                 3s3p2 2P
1   .5     69839.27              3s3p(3P)4p 4D            3s3p4p 4D
1   .5                           3s3p(3P)4p 4P            3s3p4p 4P
    .5     70709.45              3s3p(3P)4p 2P            3s3p4p 2P
    .5     73050.96              3s3p(3P)4p 2S            3s3p4p 2S
    .5     77626.98              3s3p(3P)5p 4D            3s3p5p 4D
    .5     77667.95              3s3p(3P)5p 2P            3s3p5p 2P
1   .5                           3s3p(3P)5p 4P            3s3p5p 4P
    .5     78742.91              3s3p(3P)5p 2S            3s3p5p 2S
1   .5                           3s3p(3P)4f 4D            3s3p4f 4D
    .5     80776.36              3s3p(3P)6p 2P            3s3p6p 2P
    .5     80722.67              3s3p(3P)6p 4D            3s3p6p 4D
1   .5                           3s3p(3P)6p 4P            3s3p6p 4P
    .5     81315.03              3s3p(3P)6p 2S            3s3p6p 2S
1   .5                           3s3p(3P)5f 4D            3s3p5f 4D
    .5     82375.44              3s3p(3P)7p 2P            3s3p7p 2P
1   .5                           3s3p(3P)7p 4D            3s3p7p 4D
1   .5                           3s3p(3P)7p 4P            3s3p7p 4P
    .5     82701.79              3s3p(3P)7p 2S            3s3p7p 2S
1   .5                           3s3p(3P)6f 4D            3s3p6f 4D
1   .5                           3s3p(3P)8p 2P            3s3p8p 2P
1   .5                           3s3p(3P)8p 4D            3s3p8p 4D
1   .5                           3s3p(3P)8p 4P            3s3p8p 4P
    .5     83536.74              3s3p(3P)8p 2S            3s3p8p 2S
1   .5                           3s3p(3P)7f 4D            3s3p7f 4D
1   .5                           3s3p(3P)9p 2P            3s3p9p 2P
1   .5                           3s3p(3P)9p 4D            3s3p9p 4D
1   .5                           3s3p(3P)9p 4P            3s3p9p 4P
    .5     84079.4               3s3p(3P)9p 2S            3s3p9p 2S
1   .5                           3s3p(3P)8f 4D            3s3p8f 4D
1   .5     83797.22              3s3p(1P)4p 2P            sp1P4p 2P
1   .5                           3s3p(3P)9f 4D            3s3p9f 4D
1   .5
1   .5
   -1.
   1.5     29066.96              3s3p2 4P                 3s3p2 4P
   1.5     32435.435             3s2 3d 2D                3s2 3d 2D
   1.5     38929.405             3s2 4d 2D                3s2 4d 2D
   1.5     42233.722             3s2 5d 2D                3s2 5d 2D
   1.5     44166.417             3s2 6d 2D                3s2 6d 2D
   1.5     45344.164             3s2 7d 2D                3s2 7d 2D
   1.5     46093.424             3s2 8d 2D                3s2 8d 2D
   1.5     46593.32              3s2 9d 2D                3s2 9d 2D
   1.5     46940.97              3s2 10d 2D               3s2 10d 2D
   1.5     47192.3               3s2 11d 2D               3s2 11d 2D
   1.5     47378.7               3s2 12d 2D               3s2 12d 2D
   1.5     47521.1               3s2 13d 2D               3s2 13d 2D
   1.5     48654.                3s3p2 2D                 3s3p2 2D
   1.5     56724.98              3s3p2 2P                 3s3p2 2P
1  1.5     69880.33              3s3p(3P)4p 4D            3s3p4p 4D
   1.5     70285.68              3s3p(3P)4p 4S            3s3p4p 4S
   1.5     70560.51              3s3p(3P)4p 4P            3s3p4p 4P
   1.5     70763.51              3s3p(3P)4p 2P            3s3p4p 2P
   1.5     71653.                3s3p(3P)4p 2D            3s3p4p 2D
   1.5     77642.87              3s3p(3P)5p 4D            3s3p5p 4D
   1.5     77712.73              3s3p(3P)5p 2P            3s3p5p 2P
1  1.5                           3s3p(3P)5p 4P            3s3p5p 4P
   1.5     77853.50              3s3p(3P)5p 4S            3s3p5p 4S
   1.5     78271.                3s3p(3P)5p 2D            3s3p5p 2D
1  1.5                           3s3p(3P)4f 4F            3s3p4f 4F
1  1.5                           3s3p(3P)4f 4D            3s3p4f 4D
1  1.5                           3s3p(3P)4f 2D            3s3p4f 2D
   1.5     80811.81              3s3p(3P)6p 2P            3s3p6p 2P
   1.5     80734.41              3s3p(3P)6p 4D            3s3p6p 4D
1  1.5                           3s3p(3P)6p 4P            3s3p6p 4P
   1.5     80933.26              3s3p(3P)6p 4S            3s3p6p 4S
   1.5     81094.                3s3p(3P)6p 2D            3s3p6p 2D
1  1.5                           3s3p(3P)5f 4F            3s3p5f 4F
1  1.5                           3s3p(3P)5f 4D            3s3p5f 4D
1  1.5                           3s3p(3P)5f 2D            3s3p5f 2D
1  1.5                           3s3p(3P)7p 2P            3s3p7p 2P
   1.5     82334.69              3s3p(3P)7p 4D            3s3p7p 4D
   1.5     82411.13              3s3p(3P)7p 4S            3s3p7p 4S
   1.5     82598.                3s3p(3P)7p 2D            3s3p7p 2D
1  1.5                           3s3p(3P)7p 4P            3s3p7p 4P
1  1.5                           3s3p(3P)6f 4F            3s3p6f 4F
1  1.5                           3s3p(3P)6f 4D            3s3p6f 4D
1  1.5                           3s3p(3P)6f 2D            3s3p6f 2D
1  1.5     83491.                3s3p(1P)4p 2D            sp1P4p 2D
   1.5     83301.8               3s3p(3P)8p 2P            3s3p8p 2P
   1.5     83274.42              3s3p(3P)8p 4D            3s3p8p 4D
1  1.5                           3s3p(3P)8p 4P            3s3p8p 4P
1  1.5                           3s3p(3P)8p 4S            3s3p8p 4S
1  1.5                           3s3p(3P)7f 4F            3s3p7f 4F
1  1.5     83438.8               3s3p(3P)8p 2D            3s3p8p 2D
1  1.5                           3s3p(3P)7f 4D            3s3p7f 4D
1  1.5                           3s3p(3P)7f 2D            3s3p7f 2D
   1.5     83870.01              3s3p(3P)9p 2P            3s3p9p 2P
1  1.5                           3s3p(3P)9p 4D            3s3p9p 4D
1  1.5                           3s3p(3P)9p 4P            3s3p9p 4P
1  1.5                           3s3p(3P)8f 4F            3s3p8f 4F
1  1.5                           3s3p(3P)9p 4S            3s3p9p 4S
1  1.5                           3s3p(3P)8f 2D            3s3p8f 2D
1  1.5                           3s3p(3P)8f 4D            3s3p8f 4D
1  1.5                           3s3p(3P)9p 2D            3s3p9p 2D
1  1.5     83877.73              3s3p(1P)4p 2P            sp1P4p 2P
1  1.5                           3s3p(3P)9f 4F            3s3p9f 4F
1  1.5                           3s3p(3P)9f 4D            3s3p9f 4D
1  1.5                           3s3p(3P)9f 2D            3s3p9f 2D
1  1.5
1  1.5
   -1.
   2.5     29142.78              3s3p2 4P                 3s3p2 4P
   2.5     32436.778             3s2 3d 2D                3s2 3d 2D
   2.5     38933.961             3s2 4d 2D                3s2 4d 2D
   2.5     42237.781             3s2 5d 2D                3s2 5d 2D
   2.5     44168.863             3s2 6d 2D                3s2 6d 2D
   2.5     45345.598             3s2 7d 2D                3s2 7d 2D
   2.5     46094.316             3s2 8d 2D                3s2 8d 2D
   2.5     46593.95              3s2 9d 2D                3s2 9d 2D
   2.5     46941.55              3s2 10d 2D               3s2 10d 2D
   2.5     47192.30              3s2 11d 2D               3s2 11d 2D
   2.5     47378.7               3s2 12d 2D               3s2 12d 2D
   2.5     47521.1               3s2 13d 2D               3s2 13d 2D
   2.5     48654.                3s3p2 2D                 3s3p2 2D
1  2.5                           3s3p(3P)4p 4D            3s3p4p 4D
1  2.5                           3s3p(3P)4p 4P            3s3p4p 4P
   2.5     71653.                3s3p(3P)4p 2D            3s3p4p 2D
1  2.5                           3s3p(3P)5p 4D            3s3p5p 4D
1  2.5                           3s3p(3P)5p 4P            3s3p5p 4P
   2.5     78271.                3s3p(3P)5p 2D            3s3p5p 2D
1  2.5                           3s3p(3P)4f 2F            3s3p4f 2F
1  2.5                           3s3p(3P)4f 4F            3s3p4f 4F
1  2.5                           3s3p(3P)4f 4G            3s3p4f 4G
1  2.5                           3s3p(3P)4f 2D            3s3p4f 2D
1  2.5                           3s3p(3P)4f 4D            3s3p4f 4D
1  2.5                           3s3p(3P)6p 4D            3s3p6p 4D
1  2.5                           3s3p(3P)6p 4P            3s3p6p 4P
   2.5     81094.                3s3p(3P)6p 2D            3s3p6p 2D
1  2.5                           3s3p(3P)5f 4F            3s3p5f 4F
1  2.5                           3s3p(3P)5f 2F            3s3p5f 2F
1  2.5                           3s3p(3P)5f 4G            3s3p5f 4G
1  2.5                           3s3p(3P)5f 2D            3s3p5f 2D
1  2.5                           3s3p(3P)5f 4D            3s3p5f 4D
1  2.5                           3s3p(3P)7p 4D            3s3p7p 4D
1  2.5                           3s3p(3P)7p 4P            3s3p7p 4P
   2.5     82598.                3s3p(3P)7p 2D            3s3p7p 2D
1  2.5                           3s3p(3P)6f 4F            3s3p6f 4F
1  2.5                           3s3p(3P)6f 2F            3s3p6f 2F
1  2.5                           3s3p(3P)6f 4G            3s3p6f 4G
1  2.5                           3s3p(3P)6f 2D            3s3p6f 2D
1  2.5                           3s3p(3P)6f 4D            3s3p6f 4D
1  2.5     83491.                3s3p(1P)4p 2D            sp1P4p 2D
1  2.5                           3s3p(3P)8p 4D            3s3p8p 4D
1  2.5                           3s3p(3P)8p 4P            3s3p8p 4P
1  2.5                           3s3p(3P)7f 4F            3s3p7f 4F
1  2.5                           3s3p(3P)7f 2F            3s3p7f 2F
1  2.5                           3s3p(3P)7f 4G            3s3p7f 4G
1  2.5                           3s3p(3P)7f 2D            3s3p7f 2D
1  2.5                           3s3p(3P)7f 4D            3s3p7f 4D
1  2.5     83448.                3s3p(3P)8p 2D            3s3p8p 2D
1  2.5                           3s3p(3P)9p 4D            3s3p9p 4D
1  2.5                           3s3p(3P)8f 4F            3s3p8f 4F
1  2.5                           3s3p(3P)8f 2F            3s3p8f 2F
1  2.5                           3s3p(3P)8f 4G            3s3p8f 4G
1  2.5                           3s3p(3P)9p 4P            3s3p9p 4P
1  2.5                           3s3p(3P)8f 2D            3s3p8f 2D
1  2.5                           3s3p(3P)8f 4D            3s3p8f 4D
1  2.5                           3s3p(3P)9f 4F            3s3p9f 4F
1  2.5     84051.                3s3p(3P)9p 2D            3s3p9p 2D
1  2.5                           3s3p(3P)9f 2F            3s3p9f 2F
1  2.5                           3s3p(3P)9f 4G            3s3p9f 4G
1  2.5                           3s3p(3P)9f 2D            3s3p9f 2D
1  2.5                           3s3p(3P)9f 4D            3s3p9f 4D
  -1.0
   3.5     43875.752             3s2 5g 2G                3s2 5g 2G
   3.5     45221.721             3s2 6g 2G                3s2 6g 2G
   3.5     46033.274             3s2 7g 2G                3s2 7g 2G
   3.5     46559.899P            3s2 8g 2G                3s2 8g 2G
   3.5     46920.870P            3s2 9g 2G                3s2 9g 2G
1  3.5                           3s3p(3P)4p 4D            3s3p4p 4D
1  3.5                           3s3p(3P)5p 4D            3s3p5p 4D
1  3.5                           3s3p(3P)4f 4F            3s3p4f 4F
1  3.5                           3s3p(3P)4f 2F            3s3p4f 2F
1  3.5                           3s3p(3P)4f 4G            3s3p4f 4G
1  3.5                           3s3p(3P)4f 2G            3s3p4f 2G
1  3.5                           3s3p(3P)4f 4D            3s3p4f 4D
1  3.5                           3s3p(3P)6p 4D            3s3p6p 4D
1  3.5                           3s3p(3P)5f 4F            3s3p5f 4F
1  3.5                           3s3p(3P)5f 2F            3s3p5f 2F
1  3.5                           3s3p(3P)5f 2G            3s3p5f 2G
1  3.5                           3s3p(3P)5f 4G            3s3p5f 4G
1  3.5                           3s3p(3P)5f 4D            3s3p5f 4D
1  3.5                           3s3p(3P)7p 4D            3s3p7p 4D
1  3.5                           3s3p(3P)6f 4F            3s3p6f 4F
1  3.5                           3s3p(3P)6f 2F            3s3p6f 2F
1  3.5                           3s3p(3P)6f 2G            3s3p6f 2G
1  3.5                           3s3p(3P)8p 4D            3s3p8p 4D
1  3.5                           3s3p(3P)6f 4G            3s3p6f 4G
1  3.5                           3s3p(3P)6f 4D            3s3p6f 4D
1  3.5                           3s3p(3P)7f 4F            3s3p7f 4F
1  3.5                           3s3p(3P)7f 2F            3s3p7f 2F
1  3.5                           3s3p(3P)7f 2G            3s3p7f 2G
1  3.5                           3s3p(3P)7f 4G            3s3p7f 4G
1  3.5                           3s3p(3P)7f 4D            3s3p7f 4D
1  3.5                           3s3p(3P)8f 4F            3s3p8f 4F
1  3.5                           3s3p(3P)8f 2F            3s3p8f 2F
1  3.5                           3s3p(3P)8f 2G            3s3p8f 2G
1  3.5                           3s3p(3P)9p 4D            3s3p9p 4D
1  3.5                           3s3p(3P)8f 4G            3s3p8f 4G
1  3.5                           3s3p(3P)8f 4D            3s3p8f 4D
1  3.5                           3s3p(3P)9f 4F            3s3p9f 4F
1  3.5                           3s3p(3P)9f 2F            3s3p9f 2F
1  3.5                           3s3p(3P)9f 2G            3s3p9f 2G
1  3.5                           3s3p(3P)9f 4G            3s3p9f 4G
1  3.5                           3s3p(3P)9f 4D            3s3p9f 4D
  -1.0
   4.5     43875.752             3s2 5g 2G                3s2 5g 2G
   4.5     45221.721             3s2 6g 2G                3s2 6g 2G
   4.5     46033.274             3s2 7g 2G                3s2 7g 2G
   4.5     46559.899P            3s2 8g 2G                3s2 8g 2G
   4.5     46920.870P            3s2 9g 2G                3s2 9g 2G
1  4.5                           3s3p(3P)4f 4F            3s3p4f 4F
1  4.5                           3s3p(3P)4f 4G            3s3p4f 4G
1  4.5                           3s3p(3P)4f 2G            3s3p4f 2G
1  4.5                           3s3p(3P)5f 4F            3s3p5f 4F
1  4.5                           3s3p(3P)5f 4G            3s3p5f 4G
1  4.5                           3s3p(3P)5f 2G            3s3p5f 2G
1  4.5                           3s3p(3P)6f 4F            3s3p6f 4F
1  4.5                           3s3p(3P)6f 4G            3s3p6f 4G
1  4.5                           3s3p(3P)6f 2G            3s3p6f 2G
1  4.5                           3s3p(3P)7f 4F            3s3p7f 4F
1  4.5                           3s3p(3P)7f 4G            3s3p7f 4G
1  4.5                           3s3p(3P)7f 2G            3s3p7f 2G
1  4.5                           3s3p(3P)8f 4F            3s3p8f 4F
1  4.5                           3s3p(3P)8f 4G            3s3p8f 4G
1  4.5                           3s3p(3P)8f 2G            3s3p8f 2G
1  4.5                           3s3p(3P)9f 4F            3s3p9f 4F
1  4.5                           3s3p(3P)9f 4G            3s3p9f 4G
1  4.5                           3s3p(3P)9f 2G            3s3p9f 2G
  -1.0
   5.5     46038.259P            3s2 7i 2I                3s2 7i 2I
   5.5     46563.336P            3s2 8i 2I                3s2 8i 2I
   5.5     46923.329P            3s2 9i 2I                3s2 9i 2I
1  5.5                           3s3p(3P)4f 4G            3s3p4f 4G
1  5.5                           3s3p(3P)5f 4G            3s3p5f 4G
1  5.5                           3s3p(3P)6f 4G            3s3p6f 4G
1  5.5                           3s3p(3P)7f 4G            3s3p7f 4G
1  5.5                           3s3p(3P)8f 4G            3s3p8f 4G
1  5.5                           3s3p(3P)9f 4G            3s3p9f 4G
  -1.0
   6.5     46038.259P            3s2 7i 2I                3s2 7i 2I
   6.5     46563.336P            3s2 8i 2I                3s2 8i 2I
   6.5     46923.329P            3s2 9i 2I                3s2 9i 2I
  -1.0
  -1.0
  -1.0
 2561      49.7   44      LEAST SQUARES
   1    1  EAV        30481.8    52.   27006.6             1.000  0    2300.0  0             s2 4s
   2    2  EAV        42380.4    52.   39776.4             1.000  0    2300.0  0             s2 5s
   3    3  EAV        46778.1    52.   44284.9             1.000  0    2300.0  0             s2 6s
   4    4  EAV        48892.5    52.   46431.2             1.000  0    2300.0  0             s2 7s
   5    5  EAV        50071.9    52.   47622.5             1.000  0    2300.0  0             s2 8s
   6    6  EAV        50796.6    52.   48352.9             1.000  0    2300.0  0             s2 9s
   7    7  EAV        51273.7    52.   48832.7             1.000  0    2300.0  0             s2 10s
   8    8  EAV        51604.4    52.   49164.9             1.000  0    2300.0  0             s2 11s
   9    9  EAV        51843.1    52.   49404.6             1.000  0    2300.0  0             s2 12s
  10    A  EAV        52020.8    52.   49583.1             1.000  0    2300.0  0             s2 13s
  11    B  EAV       117840.4     0.  117840.4 FIXEDHF     1.000  0       0.0  0             p2 4s
  12    B  F2(22)     26971.8     0.   33714.8 FIXEDHF     0.800  0       0.0  0
  13    B  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  14    B  ZETA 2       124.2     0.     124.2 FIXEDHF     1.000  0       0.0  0
  15    B  G1(23)      2505.4     0.    3131.8 FIXEDHF     0.800  0       0.0  0
  16    C  EAV       131192.0     0.  131192.0 FIXEDHF     1.000  0       0.0  0             p2 5s
  17    C  F2(22)     27533.2     0.   34416.5 FIXEDHF     0.800  0       0.0  0
  18    C  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  19    C  ZETA 2       127.9     0.     127.9 FIXEDHF     1.000  0       0.0  0
  20    C  G1(23)       621.6     0.     777.0 FIXEDHF     0.800  0       0.0  0
  21    D  EAV       135744.6     0.  135744.6 FIXEDHF     1.000  0       0.0  0             p2 6s
  22    D  F2(22)     27630.9     0.   34538.6 FIXEDHF     0.800  0       0.0  0
  23    D  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  24    D  ZETA 2       128.6     0.     128.6 FIXEDHF     1.000  0       0.0  0
  25    D  G1(23)       253.3     0.     316.6 FIXEDHF     0.800  0       0.0  0
  26    E  EAV       137902.6     0.  137902.6 FIXEDHF     1.000  0       0.0  0             p2 7s
  27    E  F2(22)     27661.6     0.   34577.0 FIXEDHF     0.800  0       0.0  0
  28    E  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  29    E  ZETA 2       128.9     0.     128.9 FIXEDHF     1.000  0       0.0  0
  30    E  G1(23)       128.3     0.     160.4 FIXEDHF     0.800  0       0.0  0
  31    F  EAV       139099.0     0.  139099.0 FIXEDHF     1.000  0       0.0  0             p2 8s
  32    F  F2(22)     27674.6     0.   34593.3 FIXEDHF     0.800  0       0.0  0
  33    F  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  34    F  ZETA 2       129.0     0.     129.0 FIXEDHF     1.000  0       0.0  0
  35    F  G1(23)        74.0     0.      92.5 FIXEDHF     0.800  0       0.0  0
  36    G  EAV       139832.0     0.  139832.0 FIXEDHF     1.000  0       0.0  0             p2 9s
  37    G  F2(22)     27681.1     0.   34601.4 FIXEDHF     0.800  0       0.0  0
  38    G  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  39    G  ZETA 2       129.0     0.     129.0 FIXEDHF     1.000  0       0.0  0
  40    G  G1(23)        46.6     0.      58.2 FIXEDHF     0.800  0       0.0  0
  41    H  EAV       140313.3     0.  140313.3 FIXEDHF     1.000  0       0.0  0             p2 10s
  42    H  F2(22)     27684.8     0.   34606.0 FIXEDHF     0.800  0       0.0  0
  43    H  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  44    H  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
  45    H  G1(23)        31.2     0.      39.0 FIXEDHF     0.800  0       0.0  0
  46    I  EAV       140646.7     0.  140646.7 FIXEDHF     1.000  0       0.0  0             p2 11s
  47    I  F2(22)     27687.0     0.   34608.8 FIXEDHF     0.800  0       0.0  0
  48    I  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  49    I  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
  50    I  G1(23)        21.9     0.      27.4 FIXEDHF     0.800  0       0.0  0
  51    J  EAV       140887.0     0.  140887.0 FIXEDHF     1.000  0       0.0  0             p2 12s
  52    J  F2(22)     27688.4     0.   34610.5 FIXEDHF     0.800  0       0.0  0
  53    J  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  54    J  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
  55    J  G1(23)        15.9     0.      19.9 FIXEDHF     0.800  0       0.0  0
  56    K  EAV       141066.0     0.  141066.0 FIXEDHF     1.000  0       0.0  0             p2 13s
  57    K  F2(22)     27689.4     0.   34611.7 FIXEDHF     0.800  0       0.0  0
  58    K  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  59    K  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
  60    K  G1(23)        12.0     0.      15.0 FIXEDHF     0.800  0       0.0  0
  61    L  EAV        38584.0    43.   36431.3             1.000  0    2300.0  0             s2 3d
  62    L  ZETA 4         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0
  63    M  EAV        44971.3    53.   42846.7             1.000  0    2300.0  0             s2 4d
  64    M  ZETA 4         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0
  65    N  EAV        47650.1    61.   45704.0             1.000  0    2300.0  0             s2 5d
  66    N  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  67    O  EAV        49317.0    65.   47205.2             1.000  0    2300.0  0             s2 6d
  68    O  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  69    P  EAV        50288.9    69.   48090.5             1.000  0    2300.0  0             s2 7d
  70    P  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  71    Q  EAV        50925.2    68.   48657.0             1.000  0    2300.0  0             s2 8d
  72    Q  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  73    R  EAV        51350.5    65.   49041.4             1.000  0    2300.0  0             s2 9d
  74    R  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  75    S  EAV        51652.2    61.   49314.2             1.000  0    2300.0  0             s2 10d
  76    S  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  77    T  EAV        51872.6    55.   49514.9             1.000  0    2300.0  0             s2 11d
  78    T  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  79    U  EAV        52037.5    50.   49666.9             1.000  0    2300.0  0             s2 12d
  80    U  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  81    V  EAV        52163.4    43.   49784.7             1.000  0    2300.0  0             s2 13d
  82    V  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
  83    W  EAV       125844.1     0.  125844.1 FIXEDHF     1.000  0       0.0  0             p2 3d
  84    W  F2(22)     26990.7     0.   33738.4 FIXEDHF     0.800  0       0.0  0
  85    W  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  86    W  ZETA 2       124.3     0.     124.3 FIXEDHF     1.000  0       0.0  0
  87    W  ZETA 4         0.2     0.       0.2 FIXEDHF     1.000  0       0.0  0
  88    W  F2(24)      7973.7     0.    9967.1 FIXEDHF     0.800  0       0.0  0
  89    W  G1(24)      7639.8     0.    9549.8 FIXEDHF     0.800  0       0.0  0
  90    W  G3(24)      4413.4     0.    5516.7 FIXEDHF     0.800  0       0.0  0
  91    X  EAV       133753.1     0.  133753.1 FIXEDHF     1.000  0       0.0  0             p2 4d
  92    X  F2(22)     27432.5     0.   34290.6 FIXEDHF     0.800  0       0.0  0
  93    X  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
  94    X  ZETA 2       127.2     0.     127.2 FIXEDHF     1.000  0       0.0  0
  95    X  ZETA 4         0.1     0.       0.1 FIXEDHF     1.000  0       0.0  0
  96    X  F2(24)      3031.5     0.    3789.4 FIXEDHF     0.800  0       0.0  0
  97    X  G1(24)      3221.3     0.    4026.6 FIXEDHF     0.800  0       0.0  0
  98    X  G3(24)      1917.5     0.    2396.9 FIXEDHF     0.800  0       0.0  0
  99    Y  EAV       136913.7     0.  136913.7 FIXEDHF     1.000  0       0.0  0             p2 5d
 100    Y  F2(22)     27582.2     0.   34477.7 FIXEDHF     0.800  0       0.0  0
 101    Y  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 102    Y  ZETA 2       128.3     0.     128.3 FIXEDHF     1.000  0       0.0  0
 103    Y  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 104    Y  F2(24)      1289.1     0.    1611.4 FIXEDHF     0.800  0       0.0  0
 105    Y  G1(24)      1363.8     0.    1704.7 FIXEDHF     0.800  0       0.0  0
 106    Y  G3(24)       825.0     0.    1031.3 FIXEDHF     0.800  0       0.0  0
 107    Z  EAV       138529.1     0.  138529.1 FIXEDHF     1.000  0       0.0  0             p2 6d
 108    Z  F2(22)     27635.5     0.   34544.4 FIXEDHF     0.800  0       0.0  0
 109    Z  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 110    Z  ZETA 2       128.7     0.     128.7 FIXEDHF     1.000  0       0.0  0
 111    Z  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 112    Z  F2(24)       658.0     0.     822.5 FIXEDHF     0.800  0       0.0  0
 113    Z  G1(24)       687.3     0.     859.1 FIXEDHF     0.800  0       0.0  0
 114    Z  G3(24)       419.8     0.     524.7 FIXEDHF     0.800  0       0.0  0
 115    a  EAV       139472.5     0.  139472.5 FIXEDHF     1.000  0       0.0  0             p2 7d
 116    a  F2(22)     27659.1     0.   34573.9 FIXEDHF     0.800  0       0.0  0
 117    a  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 118    a  ZETA 2       128.9     0.     128.9 FIXEDHF     1.000  0       0.0  0
 119    a  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 120    a  F2(24)       381.1     0.     476.4 FIXEDHF     0.800  0       0.0  0
 121    a  G1(24)       393.7     0.     492.1 FIXEDHF     0.800  0       0.0  0
 122    a  G3(24)       241.9     0.     302.4 FIXEDHF     0.800  0       0.0  0
 123    b  EAV       140072.4     0.  140072.4 FIXEDHF     1.000  0       0.0  0             p2 8d
 124    b  F2(22)     27671.2     0.   34589.0 FIXEDHF     0.800  0       0.0  0
 125    b  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 126    b  ZETA 2       128.9     0.     128.9 FIXEDHF     1.000  0       0.0  0
 127    b  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 128    b  F2(24)       240.7     0.     300.9 FIXEDHF     0.800  0       0.0  0
 129    b  G1(24)       246.6     0.     308.3 FIXEDHF     0.800  0       0.0  0
 130    b  G3(24)       152.2     0.     190.2 FIXEDHF     0.800  0       0.0  0
 131    c  EAV       140477.1     0.  140477.1 FIXEDHF     1.000  0       0.0  0             p2 9d
 132    c  F2(22)     27678.0     0.   34597.5 FIXEDHF     0.800  0       0.0  0
 133    c  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 134    c  ZETA 2       129.0     0.     129.0 FIXEDHF     1.000  0       0.0  0
 135    c  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 136    c  F2(24)       161.9     0.     202.4 FIXEDHF     0.800  0       0.0  0
 137    c  G1(24)       164.8     0.     206.0 FIXEDHF     0.800  0       0.0  0
 138    c  G3(24)       102.0     0.     127.5 FIXEDHF     0.800  0       0.0  0
 139    d  EAV       140763.1     0.  140763.1 FIXEDHF     1.000  0       0.0  0             p2 10d
 140    d  F2(22)     27682.2     0.   34602.7 FIXEDHF     0.800  0       0.0  0
 141    d  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 142    d  ZETA 2       129.0     0.     129.0 FIXEDHF     1.000  0       0.0  0
 143    d  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 144    d  F2(24)       114.2     0.     142.8 FIXEDHF     0.800  0       0.0  0
 145    d  G1(24)       115.7     0.     144.6 FIXEDHF     0.800  0       0.0  0
 146    d  G3(24)        71.8     0.      89.7 FIXEDHF     0.800  0       0.0  0
 147    e  EAV       140972.7     0.  140972.7 FIXEDHF     1.000  0       0.0  0             p2 11d
 148    e  F2(22)     27684.9     0.   34606.1 FIXEDHF     0.800  0       0.0  0
 149    e  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 150    e  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 151    e  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 152    e  F2(24)        83.6     0.     104.5 FIXEDHF     0.800  0       0.0  0
 153    e  G1(24)        84.3     0.     105.4 FIXEDHF     0.800  0       0.0  0
 154    e  G3(24)        52.4     0.      65.5 FIXEDHF     0.800  0       0.0  0
 155    f  EAV       141130.8     0.  141130.8 FIXEDHF     1.000  0       0.0  0             p2 12d
 156    f  F2(22)     27686.6     0.   34608.3 FIXEDHF     0.800  0       0.0  0
 157    f  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 158    f  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 159    f  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 160    f  F2(24)        63.1     0.      78.9 FIXEDHF     0.800  0       0.0  0
 161    f  G1(24)        63.4     0.      79.2 FIXEDHF     0.800  0       0.0  0
 162    f  G3(24)        39.4     0.      49.3 FIXEDHF     0.800  0       0.0  0
 163    g  EAV       141253.1     0.  141253.1 FIXEDHF     1.000  0       0.0  0             p2 13d
 164    g  F2(22)     27687.9     0.   34609.9 FIXEDHF     0.800  0       0.0  0
 165    g  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 166    g  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 167    g  ZETA 4         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 168    g  F2(24)        48.8     0.      61.0 FIXEDHF     0.800  0       0.0  0
 169    g  G1(24)        48.9     0.      61.1 FIXEDHF     0.800  0       0.0  0
 170    g  G3(24)        30.4     0.      38.0 FIXEDHF     0.800  0       0.0  0
 171    h  EAV        48490.1    37.   46059.1             1.000  0    2300.0  0             s2 5g
 172    h  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 173    i  EAV        49834.8    37.   47400.7             1.000  0    2300.0  0             s2 6g
 174    i  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 175    j  EAV        50645.6    37.   48210.2             1.000  0    2300.0  0             s2 7g
 176    j  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 177    k  EAV        51171.6    37.   48736.0             1.000  0    2300.0  0             s2 8g
 178    k  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 179    l  EAV        51532.3    37.   49096.4             1.000  0    2300.0  0             s2 9g
 180    l  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 181    m  EAV       137535.1     0.  137535.1 FIXEDHF     1.000  0       0.0  0             p2 5g
 182    m  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 183    m  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 184    m  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 185    m  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 186    m  F2(25)       153.2     0.     191.5 FIXEDHF     0.800  0       0.0  0
 187    m  G3(25)         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0
 188    m  G5(25)         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
 189    n  EAV       138877.9     0.  138877.9 FIXEDHF     1.000  0       0.0  0             p2 6g
 190    n  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 191    n  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 192    n  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 193    n  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 194    n  F2(25)        88.8     0.     111.0 FIXEDHF     0.800  0       0.0  0
 195    n  G3(25)         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0
 196    n  G5(25)         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
 197    o  EAV       139689.3     0.  139689.3 FIXEDHF     1.000  0       0.0  0             p2 7g
 198    o  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 199    o  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 200    o  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 201    o  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 202    o  F2(25)        56.0     0.      70.0 FIXEDHF     0.800  0       0.0  0
 203    o  G3(25)         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0
 204    o  G5(25)         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
 205    p  EAV       140216.5     0.  140216.5 FIXEDHF     1.000  0       0.0  0             p2 8g
 206    p  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 207    p  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 208    p  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 209    p  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 210    p  F2(25)        37.6     0.      47.0 FIXEDHF     0.800  0       0.0  0
 211    p  G3(25)         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
 212    p  G5(25)         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
 213    q  EAV       140577.9     0.  140577.9 FIXEDHF     1.000  0       0.0  0             p2 9g
 214    q  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 215    q  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 216    q  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 217    q  ZETA 5         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 218    q  F2(25)        26.4     0.      33.0 FIXEDHF     0.800  0       0.0  0
 219    q  G3(25)         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
 220    q  G5(25)         0.2     0.       0.2 FIXEDHF     0.800  0       0.0  0
 221    r  EAV        50648.7    37.   48213.4             1.000  0    2300.0  0             s2 7i
 222    r  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 223    s  EAV        51173.8    37.   48738.3             1.000  0    2300.0  0             s2 8i
 224    s  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 225    t  EAV        51533.8    37.   49098.1             1.000  0    2300.0  0             s2 9i
 226    t  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 227    u  EAV       139697.8     0.  139697.8 FIXEDHF     1.000  0       0.0  0             p2 7i
 228    u  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 229    u  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 230    u  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 231    u  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 232    u  F2(26)        18.4     0.      23.0 FIXEDHF     0.800  0       0.0  0
 233    u  G5(26)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 234    u  G7(26)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 235    v  EAV       140222.6     0.  140222.6 FIXEDHF     1.000  0       0.0  0             p2 8i
 236    v  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 237    v  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 238    v  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 239    v  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 240    v  F2(26)        12.3     0.      15.4 FIXEDHF     0.800  0       0.0  0
 241    v  G5(26)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 242    v  G7(26)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 243    w  EAV       140582.5     0.  140582.5 FIXEDHF     1.000  0       0.0  0             p2 9i
 244    w  F2(22)     27692.2     0.   34615.2 FIXEDHF     0.800  0       0.0  0
 245    w  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 246    w  ZETA 2       129.1     0.     129.1 FIXEDHF     1.000  0       0.0  0
 247    w  ZETA 6         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 248    w  F2(26)         8.6     0.      10.8 FIXEDHF     0.800  0       0.0  0
 249    w  G5(26)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 250    w  G7(26)         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
 251    x  EAV        43250.1    21.   37734.3             1.000  0    4500.0  0             sp2
 252    x  F2(22)     20840.4    95.   28505.6             0.800  0       0.0  0
 253    x  ALPHA          0.0     0.       0.0 FIXED       1.000  0       0.0  0
 254    x  ZETA 2        88.8     0.      88.8 FIXEDHF     1.000  0       0.0  0
 255    x  G1(12)     33538.5    51.   40039.9             0.800  0       0.0  0
 256    y  EAV        73687.3    20.   71702.3             1.000  0    4500.0  0             sp 4p
 257    y  ZETA 2       125.6     0.     125.6 FIXEDHF     1.000  0       0.0  0
 258    y  ZETA 7        11.7     0.      11.7 FIXEDHF     1.000  0       0.0  0
 259    y  F2(27)      3917.6    88.    4844.3             0.800  0       0.0  0
 260    y  G1(12)     19563.0     0.   47620.5 FIXED       0.800  0       0.0  0
 261    y  G1(17)      1465.2    90.    2898.9             0.800  0       0.0  0
 262    y  G0(27)      1194.4    31.    2366.2             0.800  0       0.0  0
 263    y  G2(27)       956.0     0.    1911.9 FIXEDHF     0.500  0       0.0  0
 264    z  EAV        84263.8    19.   79598.4             1.000  0    4500.0  0             sp 5p
 265    z  ZETA 2       127.3     0.     127.3 FIXEDHF     1.000  0       0.0  0
 266    z  ZETA 7         4.5     0.       4.5 FIXEDHF     1.000  0       0.0  0
 267    z  F2(27)       819.6   134.    1687.1             0.800  0       0.0  0
 268    z  G1(12)     38338.4     0.   47923.0 FIXEDHF     0.800  0       0.0  0
 269    z  G1(17)       508.6    90.    1000.7             0.800  0       0.0  0
 270    z  G0(27)       230.0     0.     766.8 FIXED       0.800  0       0.0  0
 271    z  G2(27)       331.1     0.     662.3 FIXEDHF     0.500  0       0.0  0
 272    !  EAV        87303.9    20.   82774.0             1.000  0    4500.0  0             sp 6p
 273    !  ZETA 2       127.9     0.     127.9 FIXEDHF     1.000  0       0.0  0
 274    !  ZETA 7         2.2     0.       2.2 FIXEDHF     1.000  0       0.0  0
 275    !  F2(27)       395.1     0.     790.3 FIXEDHF     0.500  0       0.0  0
 276    !  G1(12)     38409.1     0.   48011.4 FIXEDHF     0.800  0       0.0  0
 277    !  G1(17)       344.5    93.     470.5             0.800  0       0.0  0
 278    !  G0(27)       105.2     0.     350.7 FIXED       0.300  0       0.0  0
 279    !  G2(27)       156.3     0.     312.5 FIXEDHF     0.500  0       0.0  0
 280    "  EAV        88906.3    24.   84398.6             1.000  0    4500.0  0             sp 7p
 281    "  ZETA 2       128.1     0.     128.1 FIXEDHF     1.000  0       0.0  0
 282    "  ZETA 7         1.3     0.       1.3 FIXEDHF     1.000  0       0.0  0
 283    "  F2(27)       217.4     0.     434.8 FIXEDHF     0.500  0       0.0  0
 284    "  G1(12)     38437.3     0.   48046.6 FIXEDHF     0.800  0       0.0  0
 285    "  G1(17)       207.8     0.     259.8 FIXEDHF     0.800  0       0.0  0
 286    "  G0(27)        57.2     0.     190.7 FIXEDHF     0.300  0       0.0  0
 287    "  G2(27)        86.5     0.     172.9 FIXEDHF     0.500  0       0.0  0
 288    #  EAV        89804.5    36.   85343.9             1.000  0    4500.0  0             sp 8p
 289    #  ZETA 2       128.2     0.     128.2 FIXEDHF     1.000  0       0.0  0
 290    #  ZETA 7         0.8     0.       0.8 FIXEDHF     1.000  0       0.0  0
 291    #  F2(27)       132.6     0.     265.1 FIXEDHF     0.500  0       0.0  0
 292    #  G1(12)     38450.9     0.   48063.6 FIXEDHF     0.800  0       0.0  0
 293    #  G1(17)       127.1     0.     158.9 FIXEDHF     0.800  0       0.0  0
 294    #  G0(27)        34.6     0.     115.5 FIXEDHF     0.300  0       0.0  0
 295    #  G2(27)        53.0     0.     105.9 FIXEDHF     0.500  0       0.0  0
 296    $  EAV        90462.7    52.   85943.0             1.000  0    4500.0  0             sp 9p
 297    $  ZETA 2       128.3     0.     128.3 FIXEDHF     1.000  0       0.0  0
 298    $  ZETA 7         0.5     0.       0.5 FIXEDHF     1.000  0       0.0  0
 299    $  F2(27)        86.8     0.     173.7 FIXEDHF     0.500  0       0.0  0
 300    $  G1(12)     38458.2     0.   48072.7 FIXEDHF     0.800  0       0.0  0
 301    $  G1(17)        83.4     0.     104.3 FIXEDHF     0.800  0       0.0  0
 302    $  G0(27)        22.6     0.      75.4 FIXEDHF     0.300  0       0.0  0
 303    $  G2(27)        34.8     0.      69.6 FIXEDHF     0.500  0       0.0  0
 304    %  EAV        85285.5     0.   80785.5 FIXEDHF     1.000  0    4500.0  0             sp 4f
 305    %  ZETA 2       128.3     0.     128.3 FIXEDHF     1.000  0       0.0  0
 306    %  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 307    %  F2(28)       643.9     0.     804.9 FIXEDHF     0.800  0       0.0  0
 308    %  G1(12)     38464.6     0.   48080.7 FIXEDHF     0.800  0       0.0  0
 309    %  G3(18)        10.6     0.      13.2 FIXEDHF     0.800  0       0.0  0
 310    %  G2(28)        43.2     0.      54.0 FIXEDHF     0.800  0       0.0  0
 311    %  G4(28)        28.1     0.      35.1 FIXEDHF     0.800  0       0.0  0
 312    &  EAV        87813.2     0.   83313.2 FIXEDHF     1.000  0    4500.0  0             sp 5f
 313    &  ZETA 2       128.3     0.     128.3 FIXEDHF     1.000  0       0.0  0
 314    &  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 315    &  F2(28)       336.3     0.     420.4 FIXEDHF     0.800  0       0.0  0
 316    &  G1(12)     38466.1     0.   48082.6 FIXEDHF     0.800  0       0.0  0
 317    &  G3(18)         9.5     0.      11.9 FIXEDHF     0.800  0       0.0  0
 318    &  G2(28)        36.4     0.      45.5 FIXEDHF     0.800  0       0.0  0
 319    &  G4(28)        23.7     0.      29.6 FIXEDHF     0.800  0       0.0  0
 320    '  EAV        89191.1     0.   84691.1 FIXEDHF     1.000  0    4500.0  0             sp 6f
 321    '  ZETA 2       128.3     0.     128.3 FIXEDHF     1.000  0       0.0  0
 322    '  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 323    '  F2(28)       198.2     0.     247.8 FIXEDHF     0.800  0       0.0  0
 324    '  G1(12)     38468.0     0.   48085.0 FIXEDHF     0.800  0       0.0  0
 325    '  G3(18)         7.2     0.       9.0 FIXEDHF     0.800  0       0.0  0
 326    '  G2(28)        26.6     0.      33.2 FIXEDHF     0.800  0       0.0  0
 327    '  G4(28)        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0
 328    (  EAV        90020.7     0.   85520.7 FIXEDHF     1.000  0    4500.0  0             sp 7f
 329    (  ZETA 2       128.4     0.     128.4 FIXEDHF     1.000  0       0.0  0
 330    (  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 331    (  F2(28)       126.8     0.     158.5 FIXEDHF     0.800  0       0.0  0
 332    (  G1(12)     38469.2     0.   48086.5 FIXEDHF     0.800  0       0.0  0
 333    (  G3(18)         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0
 334    (  G2(28)        19.2     0.      24.0 FIXEDHF     0.800  0       0.0  0
 335    (  G4(28)        12.5     0.      15.6 FIXEDHF     0.800  0       0.0  0
 336    )  EAV        90558.3     0.   86058.3 FIXEDHF     1.000  0    4500.0  0             sp 8f
 337    )  ZETA 2       128.4     0.     128.4 FIXEDHF     1.000  0       0.0  0
 338    )  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 339    )  F2(28)        86.1     0.     107.6 FIXEDHF     0.800  0       0.0  0
 340    )  G1(12)     38470.1     0.   48087.6 FIXEDHF     0.800  0       0.0  0
 341    )  G3(18)         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0
 342    )  G2(28)        14.1     0.      17.6 FIXEDHF     0.800  0       0.0  0
 343    )  G4(28)         9.2     0.      11.5 FIXEDHF     0.800  0       0.0  0
 344    *  EAV        90926.2     0.   86426.2 FIXEDHF     1.000  0    4500.0  0             sp 9f
 345    *  ZETA 2       128.4     0.     128.4 FIXEDHF     1.000  0       0.0  0
 346    *  ZETA 8         0.0     0.       0.0 FIXEDHF     1.000  0       0.0  0
 347    *  F2(28)        61.1     0.      76.4 FIXEDHF     0.800  0       0.0  0
 348    *  G1(12)     38470.6     0.   48088.2 FIXEDHF     0.800  0       0.0  0
 349    *  G3(18)         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0
 350    *  G2(28)        10.6     0.      13.2 FIXEDHF     0.800  0       0.0  0
 351    *  G4(28)         6.9     0.       8.6 FIXEDHF     0.800  0       0.0  0
 352    1B 1D1122     37667.1     0.   47083.9 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 4s
 353    1C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 5s
 354    1D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 6s
 355    1E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 7s
 356    1F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 8s
 357    1G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 9s
 358    1H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 10s
 359    1I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 11s
 360    1J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 12s
 361    1K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4s     -p2 13s
 362    1x 1D1322      -271.8     0.    -339.7 FIXEDHF     0.800  0       0.0  0  s2 4s     -sp2
 363    1y 1D1327      7482.2     0.    9352.8 FIXEDHF     0.800  0       0.0  0  s2 4s     -sp 4p
 364    1y 1E1327      1179.8     0.    1474.8 FIXEDHF     0.800  0       0.0  0
 365    1z 1D1327      3775.5     0.    4719.4 FIXEDHF     0.800  0       0.0  0  s2 4s     -sp 5p
 366    1z 1E1327       762.6     0.     953.2 FIXEDHF     0.800  0       0.0  0
 367    1! 1D1327      2471.7     0.    3089.6 FIXEDHF     0.800  0       0.0  0  s2 4s     -sp 6p
 368    1! 1E1327       541.4     0.     676.7 FIXEDHF     0.800  0       0.0  0
 369    1" 1D1327      1795.4     0.    2244.3 FIXEDHF     0.800  0       0.0  0  s2 4s     -sp 7p
 370    1" 1E1327       409.3     0.     511.6 FIXEDHF     0.800  0       0.0  0
 371    1# 1D1327      1385.0     0.    1731.2 FIXEDHF     0.800  0       0.0  0  s2 4s     -sp 8p
 372    1# 1E1327       323.3     0.     404.1 FIXEDHF     0.800  0       0.0  0
 373    1$ 1D1327      1112.1     0.    1390.1 FIXEDHF     0.800  0       0.0  0  s2 4s     -sp 9p
 374    1$ 1E1327       263.7     0.     329.6 FIXEDHF     0.800  0       0.0  0
 375    2B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 4s
 376    2C 1D1122     38278.7     0.   47848.4 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 5s
 377    2D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 6s
 378    2E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 7s
 379    2F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 8s
 380    2G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 9s
 381    2H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 10s
 382    2I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 11s
 383    2J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 12s
 384    2K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -p2 13s
 385    2x 1D1322      -160.8     0.    -201.0 FIXEDHF     0.800  0       0.0  0  s2 5s     -sp2
 386    2y 1D1327      1340.6     0.    1675.8 FIXEDHF     0.800  0       0.0  0  s2 5s     -sp 4p
 387    2y 1E1327       584.5     0.     730.6 FIXEDHF     0.800  0       0.0  0
 388    2z 1D1327      2574.9     0.    3218.6 FIXEDHF     0.800  0       0.0  0  s2 5s     -sp 5p
 389    2z 1E1327       384.2     0.     480.2 FIXEDHF     0.800  0       0.0  0
 390    2! 1D1327      1628.6     0.    2035.8 FIXEDHF     0.800  0       0.0  0  s2 5s     -sp 6p
 391    2! 1E1327       274.6     0.     343.2 FIXEDHF     0.800  0       0.0  0
 392    2" 1D1327      1177.0     0.    1471.2 FIXEDHF     0.800  0       0.0  0  s2 5s     -sp 7p
 393    2" 1E1327       208.3     0.     260.4 FIXEDHF     0.800  0       0.0  0
 394    2# 1D1327       907.0     0.    1133.7 FIXEDHF     0.800  0       0.0  0  s2 5s     -sp 8p
 395    2# 1E1327       165.0     0.     206.2 FIXEDHF     0.800  0       0.0  0
 396    2$ 1D1327       728.3     0.     910.4 FIXEDHF     0.800  0       0.0  0  s2 5s     -sp 9p
 397    2$ 1E1327       134.7     0.     168.4 FIXEDHF     0.800  0       0.0  0
 398    3B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 4s
 399    3C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 5s
 400    3D 1D1122     38390.3     0.   47987.9 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 6s
 401    3E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 7s
 402    3F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 8s
 403    3G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 9s
 404    3H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 10s
 405    3I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 11s
 406    3J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 12s
 407    3K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -p2 13s
 408    3x 1D1322      -117.4     0.    -146.8 FIXEDHF     0.800  0       0.0  0  s2 6s     -sp2
 409    3y 1D1327       750.6     0.     938.2 FIXEDHF     0.800  0       0.0  0  s2 6s     -sp 4p
 410    3y 1E1327       369.3     0.     461.6 FIXEDHF     0.800  0       0.0  0
 411    3z 1D1327       763.4     0.     954.3 FIXEDHF     0.800  0       0.0  0  s2 6s     -sp 5p
 412    3z 1E1327       244.4     0.     305.5 FIXEDHF     0.800  0       0.0  0
 413    3! 1D1327      1166.9     0.    1458.6 FIXEDHF     0.800  0       0.0  0  s2 6s     -sp 6p
 414    3! 1E1327       175.1     0.     218.9 FIXEDHF     0.800  0       0.0  0
 415    3" 1D1327       826.4     0.    1033.0 FIXEDHF     0.800  0       0.0  0  s2 6s     -sp 7p
 416    3" 1E1327       133.0     0.     166.3 FIXEDHF     0.800  0       0.0  0
 417    3# 1D1327       635.4     0.     794.2 FIXEDHF     0.800  0       0.0  0  s2 6s     -sp 8p
 418    3# 1E1327       105.4     0.     131.8 FIXEDHF     0.800  0       0.0  0
 419    3$ 1D1327       510.2     0.     637.7 FIXEDHF     0.800  0       0.0  0  s2 6s     -sp 9p
 420    3$ 1E1327        86.2     0.     107.7 FIXEDHF     0.800  0       0.0  0
 421    4B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 4s
 422    4C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 5s
 423    4D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 6s
 424    4E 1D1122     38425.9     0.   48032.4 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 7s
 425    4F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 8s
 426    4G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 9s
 427    4H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 10s
 428    4I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 11s
 429    4J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 12s
 430    4K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -p2 13s
 431    4x 1D1322       -89.9     0.    -112.4 FIXEDHF     0.800  0       0.0  0  s2 7s     -sp2
 432    4y 1D1327       499.1     0.     623.9 FIXEDHF     0.800  0       0.0  0  s2 7s     -sp 4p
 433    4y 1E1327       261.4     0.     326.8 FIXEDHF     0.800  0       0.0  0
 434    4z 1D1327       489.7     0.     612.1 FIXEDHF     0.800  0       0.0  0  s2 7s     -sp 5p
 435    4z 1E1327       173.6     0.     217.0 FIXEDHF     0.800  0       0.0  0
 436    4! 1D1327       452.5     0.     565.6 FIXEDHF     0.800  0       0.0  0  s2 7s     -sp 6p
 437    4! 1E1327       124.6     0.     155.7 FIXEDHF     0.800  0       0.0  0
 438    4" 1D1327       622.2     0.     777.8 FIXEDHF     0.800  0       0.0  0  s2 7s     -sp 7p
 439    4" 1E1327        94.7     0.     118.4 FIXEDHF     0.800  0       0.0  0
 440    4# 1D1327       471.8     0.     589.7 FIXEDHF     0.800  0       0.0  0  s2 7s     -sp 8p
 441    4# 1E1327        75.1     0.      93.9 FIXEDHF     0.800  0       0.0  0
 442    4$ 1D1327       378.4     0.     473.0 FIXEDHF     0.800  0       0.0  0  s2 7s     -sp 9p
 443    4$ 1E1327        61.4     0.      76.7 FIXEDHF     0.800  0       0.0  0
 444    5B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 4s
 445    5C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 5s
 446    5D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 6s
 447    5E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 7s
 448    5F 1D1122     38441.0     0.   48051.3 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 8s
 449    5G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 9s
 450    5H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 10s
 451    5I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 11s
 452    5J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 12s
 453    5K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8s     -p2 13s
 454    5x 1D1322       -71.3     0.     -89.1 FIXEDHF     0.800  0       0.0  0  s2 8s     -sp2
 455    5y 1D1327       363.7     0.     454.6 FIXEDHF     0.800  0       0.0  0  s2 8s     -sp 4p
 456    5y 1E1327       198.0     0.     247.5 FIXEDHF     0.800  0       0.0  0
 457    5z 1D1327       351.4     0.     439.3 FIXEDHF     0.800  0       0.0  0  s2 8s     -sp 5p
 458    5z 1E1327       131.8     0.     164.7 FIXEDHF     0.800  0       0.0  0
 459    5! 1D1327       315.4     0.     394.3 FIXEDHF     0.800  0       0.0  0  s2 8s     -sp 6p
 460    5! 1E1327        94.6     0.     118.3 FIXEDHF     0.800  0       0.0  0
 461    5" 1D1327       286.1     0.     357.6 FIXEDHF     0.800  0       0.0  0  s2 8s     -sp 7p
 462    5" 1E1327        72.0     0.      90.0 FIXEDHF     0.800  0       0.0  0
 463    5# 1D1327       369.5     0.     461.9 FIXEDHF     0.800  0       0.0  0  s2 8s     -sp 8p
 464    5# 1E1327        57.0     0.      71.3 FIXEDHF     0.800  0       0.0  0
 465    5$ 1D1327       293.2     0.     366.5 FIXEDHF     0.800  0       0.0  0  s2 8s     -sp 9p
 466    5$ 1E1327        46.6     0.      58.3 FIXEDHF     0.800  0       0.0  0
 467    6B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 4s
 468    6C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 5s
 469    6D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 6s
 470    6E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 7s
 471    6F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 8s
 472    6G 1D1122     38448.6     0.   48060.7 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 9s
 473    6H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 10s
 474    6I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 11s
 475    6J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 12s
 476    6K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -p2 13s
 477    6x 1D1322       -58.1     0.     -72.6 FIXEDHF     0.800  0       0.0  0  s2 9s     -sp2
 478    6y 1D1327       280.6     0.     350.7 FIXEDHF     0.800  0       0.0  0  s2 9s     -sp 4p
 479    6y 1E1327       156.8     0.     196.0 FIXEDHF     0.800  0       0.0  0
 480    6z 1D1327       269.1     0.     336.4 FIXEDHF     0.800  0       0.0  0  s2 9s     -sp 5p
 481    6z 1E1327       104.5     0.     130.6 FIXEDHF     0.800  0       0.0  0
 482    6! 1D1327       238.3     0.     297.9 FIXEDHF     0.800  0       0.0  0  s2 9s     -sp 6p
 483    6! 1E1327        75.0     0.      93.8 FIXEDHF     0.800  0       0.0  0
 484    6" 1D1327       211.0     0.     263.8 FIXEDHF     0.800  0       0.0  0  s2 9s     -sp 7p
 485    6" 1E1327        57.1     0.      71.4 FIXEDHF     0.800  0       0.0  0
 486    6# 1D1327       191.2     0.     239.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -sp 8p
 487    6# 1E1327        45.3     0.      56.6 FIXEDHF     0.800  0       0.0  0
 488    6$ 1D1327       236.8     0.     296.0 FIXEDHF     0.800  0       0.0  0  s2 9s     -sp 9p
 489    6$ 1E1327        37.0     0.      46.3 FIXEDHF     0.800  0       0.0  0
 490    7B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 4s
 491    7C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 5s
 492    7D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 6s
 493    7E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 7s
 494    7F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 8s
 495    7G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 9s
 496    7H 1D1122     38452.8     0.   48066.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 10s
 497    7I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 11s
 498    7J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 12s
 499    7K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10s    -p2 13s
 500    7x 1D1322       -48.3     0.     -60.4 FIXEDHF     0.800  0       0.0  0  s2 10s    -sp2
 501    7y 1D1327       225.0     0.     281.2 FIXEDHF     0.800  0       0.0  0  s2 10s    -sp 4p
 502    7y 1E1327       128.2     0.     160.3 FIXEDHF     0.800  0       0.0  0
 503    7z 1D1327       215.0     0.     268.8 FIXEDHF     0.800  0       0.0  0  s2 10s    -sp 5p
 504    7z 1E1327        85.5     0.     106.9 FIXEDHF     0.800  0       0.0  0
 505    7! 1D1327       189.1     0.     236.4 FIXEDHF     0.800  0       0.0  0  s2 10s    -sp 6p
 506    7! 1E1327        61.4     0.      76.8 FIXEDHF     0.800  0       0.0  0
 507    7" 1D1327       165.5     0.     206.9 FIXEDHF     0.800  0       0.0  0  s2 10s    -sp 7p
 508    7" 1E1327        46.8     0.      58.5 FIXEDHF     0.800  0       0.0  0
 509    7# 1D1327       147.0     0.     183.7 FIXEDHF     0.800  0       0.0  0  s2 10s    -sp 8p
 510    7# 1E1327        37.1     0.      46.4 FIXEDHF     0.800  0       0.0  0
 511    7$ 1D1327       133.7     0.     167.1 FIXEDHF     0.800  0       0.0  0  s2 10s    -sp 9p
 512    7$ 1E1327        30.3     0.      37.9 FIXEDHF     0.800  0       0.0  0
 513    8B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 4s
 514    8C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 5s
 515    8D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 6s
 516    8E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 7s
 517    8F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 8s
 518    8G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 9s
 519    8H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 10s
 520    8I 1D1122     38455.4     0.   48069.2 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 11s
 521    8J 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 12s
 522    8K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11s    -p2 13s
 523    8x 1D1322       -41.0     0.     -51.2 FIXEDHF     0.800  0       0.0  0  s2 11s    -sp2
 524    8y 1D1327       185.7     0.     232.1 FIXEDHF     0.800  0       0.0  0  s2 11s    -sp 4p
 525    8y 1E1327       107.4     0.     134.3 FIXEDHF     0.800  0       0.0  0
 526    8z 1D1327       177.0     0.     221.3 FIXEDHF     0.800  0       0.0  0  s2 11s    -sp 5p
 527    8z 1E1327        71.7     0.      89.6 FIXEDHF     0.800  0       0.0  0
 528    8! 1D1327       155.0     0.     193.8 FIXEDHF     0.800  0       0.0  0  s2 11s    -sp 6p
 529    8! 1E1327        51.6     0.      64.5 FIXEDHF     0.800  0       0.0  0
 530    8" 1D1327       134.9     0.     168.6 FIXEDHF     0.800  0       0.0  0  s2 11s    -sp 7p
 531    8" 1E1327        39.3     0.      49.1 FIXEDHF     0.800  0       0.0  0
 532    8# 1D1327       118.6     0.     148.3 FIXEDHF     0.800  0       0.0  0  s2 11s    -sp 8p
 533    8# 1E1327        31.1     0.      38.9 FIXEDHF     0.800  0       0.0  0
 534    8$ 1D1327       106.1     0.     132.6 FIXEDHF     0.800  0       0.0  0  s2 11s    -sp 9p
 535    8$ 1E1327        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0
 536    9B 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 4s
 537    9C 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 5s
 538    9D 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 6s
 539    9E 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 7s
 540    9F 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 8s
 541    9G 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 9s
 542    9H 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 10s
 543    9I 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 11s
 544    9J 1D1122     38457.0     0.   48071.2 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 12s
 545    9K 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12s    -p2 13s
 546    9x 1D1322       -35.3     0.     -44.1 FIXEDHF     0.800  0       0.0  0  s2 12s    -sp2
 547    9y 1D1327       156.6     0.     195.7 FIXEDHF     0.800  0       0.0  0  s2 12s    -sp 4p
 548    9y 1E1327        91.8     0.     114.7 FIXEDHF     0.800  0       0.0  0
 549    9z 1D1327       149.1     0.     186.4 FIXEDHF     0.800  0       0.0  0  s2 12s    -sp 5p
 550    9z 1E1327        61.3     0.      76.6 FIXEDHF     0.800  0       0.0  0
 551    9! 1D1327       130.2     0.     162.8 FIXEDHF     0.800  0       0.0  0  s2 12s    -sp 6p
 552    9! 1E1327        44.1     0.      55.1 FIXEDHF     0.800  0       0.0  0
 553    9" 1D1327       112.9     0.     141.1 FIXEDHF     0.800  0       0.0  0  s2 12s    -sp 7p
 554    9" 1E1327        33.5     0.      41.9 FIXEDHF     0.800  0       0.0  0
 555    9# 1D1327        98.7     0.     123.4 FIXEDHF     0.800  0       0.0  0  s2 12s    -sp 8p
 556    9# 1E1327        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0
 557    9$ 1D1327        87.5     0.     109.4 FIXEDHF     0.800  0       0.0  0  s2 12s    -sp 9p
 558    9$ 1E1327        21.8     0.      27.2 FIXEDHF     0.800  0       0.0  0
 559    AB 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 4s
 560    AC 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 5s
 561    AD 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 6s
 562    AE 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 7s
 563    AF 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 8s
 564    AG 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 9s
 565    AH 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 10s
 566    AI 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 11s
 567    AJ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 12s
 568    AK 1D1122     38458.1     0.   48072.6 FIXEDHF     0.800  0       0.0  0  s2 13s    -p2 13s
 569    Ax 1D1322       -30.7     0.     -38.4 FIXEDHF     0.800  0       0.0  0  s2 13s    -sp2
 570    Ay 1D1327       134.3     0.     167.9 FIXEDHF     0.800  0       0.0  0  s2 13s    -sp 4p
 571    Ay 1E1327        79.5     0.      99.4 FIXEDHF     0.800  0       0.0  0
 572    Az 1D1327       127.8     0.     159.8 FIXEDHF     0.800  0       0.0  0  s2 13s    -sp 5p
 573    Az 1E1327        53.1     0.      66.4 FIXEDHF     0.800  0       0.0  0
 574    A! 1D1327       111.5     0.     139.4 FIXEDHF     0.800  0       0.0  0  s2 13s    -sp 6p
 575    A! 1E1327        38.2     0.      47.8 FIXEDHF     0.800  0       0.0  0
 576    A" 1D1327        96.4     0.     120.5 FIXEDHF     0.800  0       0.0  0  s2 13s    -sp 7p
 577    A" 1E1327        29.1     0.      36.4 FIXEDHF     0.800  0       0.0  0
 578    A# 1D1327        84.0     0.     105.0 FIXEDHF     0.800  0       0.0  0  s2 13s    -sp 8p
 579    A# 1E1327        23.1     0.      28.9 FIXEDHF     0.800  0       0.0  0
 580    A$ 1D1327        74.1     0.      92.6 FIXEDHF     0.800  0       0.0  0  s2 13s    -sp 9p
 581    A$ 1E1327        18.9     0.      23.6 FIXEDHF     0.800  0       0.0  0
 582    BC 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 5s
 583    BC 1E2323      1218.2     0.    1522.8 FIXEDHF     0.800  0       0.0  0
 584    BD 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 6s
 585    BD 1E2323       765.8     0.     957.3 FIXEDHF     0.800  0       0.0  0
 586    BE 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 7s
 587    BE 1E2323       540.6     0.     675.7 FIXEDHF     0.800  0       0.0  0
 588    BF 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 8s
 589    BF 1E2323       408.4     0.     510.5 FIXEDHF     0.800  0       0.0  0
 590    BG 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 9s
 591    BG 1E2323       322.8     0.     403.5 FIXEDHF     0.800  0       0.0  0
 592    BH 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 10s
 593    BH 1E2323       263.4     0.     329.3 FIXEDHF     0.800  0       0.0  0
 594    BI 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 11s
 595    BI 1E2323       220.4     0.     275.5 FIXEDHF     0.800  0       0.0  0
 596    BJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 12s
 597    BJ 1E2323       187.8     0.     234.8 FIXEDHF     0.800  0       0.0  0
 598    BK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 13s
 599    BK 1E2323       162.6     0.     203.3 FIXEDHF     0.800  0       0.0  0
 600    BW 2D2324     -4380.0     0.   -5475.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 3d
 601    BW 1E2324     -1349.0     0.   -1686.3 FIXEDHF     0.800  0       0.0  0
 602    BX 2D2324     -1271.1     0.   -1588.9 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 4d
 603    BX 1E2324      -500.2     0.    -625.3 FIXEDHF     0.800  0       0.0  0
 604    BY 2D2324      -373.6     0.    -467.0 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 5d
 605    BY 1E2324      -205.1     0.    -256.4 FIXEDHF     0.800  0       0.0  0
 606    BZ 2D2324       -97.3     0.    -121.6 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 6d
 607    BZ 1E2324       -99.8     0.    -124.8 FIXEDHF     0.800  0       0.0  0
 608    Ba 2D2324         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 7d
 609    Ba 1E2324       -54.6     0.     -68.3 FIXEDHF     0.800  0       0.0  0
 610    Bb 2D2324        40.6     0.      50.8 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 8d
 611    Bb 1E2324       -32.3     0.     -40.4 FIXEDHF     0.800  0       0.0  0
 612    Bc 2D2324        55.4     0.      69.3 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 9d
 613    Bc 1E2324       -20.2     0.     -25.3 FIXEDHF     0.800  0       0.0  0
 614    Bd 2D2324        60.2     0.      75.2 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 10d
 615    Bd 1E2324       -13.1     0.     -16.4 FIXEDHF     0.800  0       0.0  0
 616    Be 2D2324        60.2     0.      75.3 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 11d
 617    Be 1E2324        -8.6     0.     -10.8 FIXEDHF     0.800  0       0.0  0
 618    Bf 2D2324        58.2     0.      72.8 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 12d
 619    Bf 1E2324        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0
 620    Bg 2D2324        55.4     0.      69.3 FIXEDHF     0.800  0       0.0  0  p2 4s     -p2 13d
 621    Bg 1E2324        -3.9     0.      -4.9 FIXEDHF     0.800  0       0.0  0
 622    Bx 1D2312     -1246.5     0.   -1558.1 FIXEDHF     0.800  0       0.0  0  p2 4s     -sp2
 623    Bx 0E2312       -35.3     0.     -44.1 FIXEDHF     0.800  0       0.0  0
 624    By 1D2317      7164.9     0.    8956.1 FIXEDHF     0.800  0       0.0  0  p2 4s     -sp 4p
 625    By 0E2317      1655.4     0.    2069.3 FIXEDHF     0.800  0       0.0  0
 626    Bz 1D2317      3802.5     0.    4753.1 FIXEDHF     0.800  0       0.0  0  p2 4s     -sp 5p
 627    Bz 0E2317       968.7     0.    1210.9 FIXEDHF     0.800  0       0.0  0
 628    B! 1D2317      2529.0     0.    3161.2 FIXEDHF     0.800  0       0.0  0  p2 4s     -sp 6p
 629    B! 0E2317       662.2     0.     827.7 FIXEDHF     0.800  0       0.0  0
 630    B" 1D2317      1851.5     0.    2314.4 FIXEDHF     0.800  0       0.0  0  p2 4s     -sp 7p
 631    B" 0E2317       491.0     0.     613.8 FIXEDHF     0.800  0       0.0  0
 632    B# 1D2317      1435.0     0.    1793.7 FIXEDHF     0.800  0       0.0  0  p2 4s     -sp 8p
 633    B# 0E2317       383.4     0.     479.3 FIXEDHF     0.800  0       0.0  0
 634    B$ 1D2317      1155.8     0.    1444.7 FIXEDHF     0.800  0       0.0  0  p2 4s     -sp 9p
 635    B$ 0E2317       310.4     0.     388.0 FIXEDHF     0.800  0       0.0  0
 636    CD 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 6s
 637    CD 1E2323       396.0     0.     495.0 FIXEDHF     0.800  0       0.0  0
 638    CE 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 7s
 639    CE 1E2323       281.3     0.     351.6 FIXEDHF     0.800  0       0.0  0
 640    CF 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 8s
 641    CF 1E2323       213.2     0.     266.5 FIXEDHF     0.800  0       0.0  0
 642    CG 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 9s
 643    CG 1E2323       168.9     0.     211.1 FIXEDHF     0.800  0       0.0  0
 644    CH 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 10s
 645    CH 1E2323       138.1     0.     172.6 FIXEDHF     0.800  0       0.0  0
 646    CI 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 11s
 647    CI 1E2323       115.6     0.     144.5 FIXEDHF     0.800  0       0.0  0
 648    CJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 12s
 649    CJ 1E2323        98.6     0.     123.3 FIXEDHF     0.800  0       0.0  0
 650    CK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 13s
 651    CK 1E2323        85.4     0.     106.8 FIXEDHF     0.800  0       0.0  0
 652    CW 2D2324     -1414.3     0.   -1767.9 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 3d
 653    CW 1E2324      -688.4     0.    -860.5 FIXEDHF     0.800  0       0.0  0
 654    CX 2D2324     -1141.8     0.   -1427.3 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 4d
 655    CX 1E2324      -295.4     0.    -369.3 FIXEDHF     0.800  0       0.0  0
 656    CY 2D2324      -549.8     0.    -687.3 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 5d
 657    CY 1E2324      -139.8     0.    -174.7 FIXEDHF     0.800  0       0.0  0
 658    CZ 2D2324      -308.6     0.    -385.7 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 6d
 659    CZ 1E2324       -78.7     0.     -98.4 FIXEDHF     0.800  0       0.0  0
 660    Ca 2D2324      -195.0     0.    -243.8 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 7d
 661    Ca 1E2324       -50.1     0.     -62.6 FIXEDHF     0.800  0       0.0  0
 662    Cb 2D2324      -134.2     0.    -167.7 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 8d
 663    Cb 1E2324       -34.6     0.     -43.3 FIXEDHF     0.800  0       0.0  0
 664    Cc 2D2324       -98.1     0.    -122.6 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 9d
 665    Cc 1E2324       -25.4     0.     -31.8 FIXEDHF     0.800  0       0.0  0
 666    Cd 2D2324       -75.0     0.     -93.8 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 10d
 667    Cd 1E2324       -19.6     0.     -24.5 FIXEDHF     0.800  0       0.0  0
 668    Ce 2D2324       -59.4     0.     -74.3 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 11d
 669    Ce 1E2324       -15.5     0.     -19.4 FIXEDHF     0.800  0       0.0  0
 670    Cf 2D2324       -48.4     0.     -60.5 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 12d
 671    Cf 1E2324       -12.7     0.     -15.9 FIXEDHF     0.800  0       0.0  0
 672    Cg 2D2324       -40.2     0.     -50.3 FIXEDHF     0.800  0       0.0  0  p2 5s     -p2 13d
 673    Cg 1E2324       -10.6     0.     -13.3 FIXEDHF     0.800  0       0.0  0
 674    Cx 1D2312      -516.6     0.    -645.8 FIXEDHF     0.800  0       0.0  0  p2 5s     -sp2
 675    Cx 0E2312        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0
 676    Cy 1D2317       739.3     0.     924.1 FIXEDHF     0.800  0       0.0  0  p2 5s     -sp 4p
 677    Cy 0E2317       853.9     0.    1067.4 FIXEDHF     0.800  0       0.0  0
 678    Cz 1D2317      2268.6     0.    2835.7 FIXEDHF     0.800  0       0.0  0  p2 5s     -sp 5p
 679    Cz 0E2317       502.8     0.     628.5 FIXEDHF     0.800  0       0.0  0
 680    C! 1D2317      1503.0     0.    1878.7 FIXEDHF     0.800  0       0.0  0  p2 5s     -sp 6p
 681    C! 0E2317       344.6     0.     430.7 FIXEDHF     0.800  0       0.0  0
 682    C" 1D2317      1104.9     0.    1381.1 FIXEDHF     0.800  0       0.0  0  p2 5s     -sp 7p
 683    C" 0E2317       255.9     0.     319.9 FIXEDHF     0.800  0       0.0  0
 684    C# 1D2317       859.3     0.    1074.1 FIXEDHF     0.800  0       0.0  0  p2 5s     -sp 8p
 685    C# 0E2317       200.0     0.     250.0 FIXEDHF     0.800  0       0.0  0
 686    C$ 1D2317       694.0     0.     867.5 FIXEDHF     0.800  0       0.0  0  p2 5s     -sp 9p
 687    C$ 0E2317       162.0     0.     202.5 FIXEDHF     0.800  0       0.0  0
 688    DE 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 7s
 689    DE 1E2323       180.2     0.     225.3 FIXEDHF     0.800  0       0.0  0
 690    DF 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 8s
 691    DF 1E2323       136.8     0.     171.0 FIXEDHF     0.800  0       0.0  0
 692    DG 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 9s
 693    DG 1E2323       108.4     0.     135.5 FIXEDHF     0.800  0       0.0  0
 694    DH 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 10s
 695    DH 1E2323        88.6     0.     110.8 FIXEDHF     0.800  0       0.0  0
 696    DI 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 11s
 697    DI 1E2323        74.2     0.      92.8 FIXEDHF     0.800  0       0.0  0
 698    DJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 12s
 699    DJ 1E2323        63.4     0.      79.2 FIXEDHF     0.800  0       0.0  0
 700    DK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 13s
 701    DK 1E2323        55.0     0.      68.7 FIXEDHF     0.800  0       0.0  0
 702    DW 2D2324      -830.0     0.   -1037.5 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 3d
 703    DW 1E2324      -446.6     0.    -558.2 FIXEDHF     0.800  0       0.0  0
 704    DX 2D2324      -592.4     0.    -740.5 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 4d
 705    DX 1E2324      -200.7     0.    -250.9 FIXEDHF     0.800  0       0.0  0
 706    DY 2D2324      -428.6     0.    -535.7 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 5d
 707    DY 1E2324       -98.8     0.    -123.5 FIXEDHF     0.800  0       0.0  0
 708    DZ 2D2324      -262.3     0.    -327.9 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 6d
 709    DZ 1E2324       -57.6     0.     -72.0 FIXEDHF     0.800  0       0.0  0
 710    Da 2D2324      -177.0     0.    -221.3 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 7d
 711    Da 1E2324       -37.8     0.     -47.3 FIXEDHF     0.800  0       0.0  0
 712    Db 2D2324      -128.5     0.    -160.6 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 8d
 713    Db 1E2324       -26.9     0.     -33.6 FIXEDHF     0.800  0       0.0  0
 714    Dc 2D2324       -98.2     0.    -122.8 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 9d
 715    Dc 1E2324       -20.2     0.     -25.2 FIXEDHF     0.800  0       0.0  0
 716    Dd 2D2324       -78.1     0.     -97.6 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 10d
 717    Dd 1E2324       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0
 718    De 2D2324       -63.9     0.     -79.9 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 11d
 719    De 1E2324       -12.8     0.     -16.0 FIXEDHF     0.800  0       0.0  0
 720    Df 2D2324       -53.5     0.     -66.9 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 12d
 721    Df 1E2324       -10.6     0.     -13.3 FIXEDHF     0.800  0       0.0  0
 722    Dg 2D2324       -45.7     0.     -57.1 FIXEDHF     0.800  0       0.0  0  p2 6s     -p2 13d
 723    Dg 1E2324        -9.0     0.     -11.2 FIXEDHF     0.800  0       0.0  0
 724    Dx 1D2312      -321.9     0.    -402.4 FIXEDHF     0.800  0       0.0  0  p2 6s     -sp2
 725    Dx 0E2312        -6.3     0.      -7.9 FIXEDHF     0.800  0       0.0  0
 726    Dy 1D2317       396.7     0.     495.9 FIXEDHF     0.800  0       0.0  0  p2 6s     -sp 4p
 727    Dy 0E2317       541.8     0.     677.3 FIXEDHF     0.800  0       0.0  0
 728    Dz 1D2317       460.1     0.     575.1 FIXEDHF     0.800  0       0.0  0  p2 6s     -sp 5p
 729    Dz 0E2317       319.8     0.     399.8 FIXEDHF     0.800  0       0.0  0
 730    D! 1D2317       973.6     0.    1217.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -sp 6p
 731    D! 0E2317       219.4     0.     274.3 FIXEDHF     0.800  0       0.0  0
 732    D" 1D2317       719.8     0.     899.8 FIXEDHF     0.800  0       0.0  0  p2 6s     -sp 7p
 733    D" 0E2317       163.0     0.     203.8 FIXEDHF     0.800  0       0.0  0
 734    D# 1D2317       563.2     0.     704.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -sp 8p
 735    D# 0E2317       127.4     0.     159.3 FIXEDHF     0.800  0       0.0  0
 736    D$ 1D2317       456.8     0.     571.0 FIXEDHF     0.800  0       0.0  0  p2 6s     -sp 9p
 737    D$ 0E2317       103.3     0.     129.1 FIXEDHF     0.800  0       0.0  0
 738    EF 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 8s
 739    EF 1E2323        97.4     0.     121.8 FIXEDHF     0.800  0       0.0  0
 740    EG 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 9s
 741    EG 1E2323        77.3     0.      96.6 FIXEDHF     0.800  0       0.0  0
 742    EH 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 10s
 743    EH 1E2323        63.2     0.      79.0 FIXEDHF     0.800  0       0.0  0
 744    EI 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 11s
 745    EI 1E2323        53.0     0.      66.2 FIXEDHF     0.800  0       0.0  0
 746    EJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 12s
 747    EJ 1E2323        45.2     0.      56.5 FIXEDHF     0.800  0       0.0  0
 748    EK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 13s
 749    EK 1E2323        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0
 750    EW 2D2324      -568.3     0.    -710.4 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 3d
 751    EW 1E2324      -320.9     0.    -401.1 FIXEDHF     0.800  0       0.0  0
 752    EX 2D2324      -403.4     0.    -504.3 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 4d
 753    EX 1E2324      -147.4     0.    -184.3 FIXEDHF     0.800  0       0.0  0
 754    EY 2D2324      -270.1     0.    -337.6 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 5d
 755    EY 1E2324       -73.9     0.     -92.4 FIXEDHF     0.800  0       0.0  0
 756    EZ 2D2324      -204.0     0.    -255.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 6d
 757    EZ 1E2324       -43.8     0.     -54.7 FIXEDHF     0.800  0       0.0  0
 758    Ea 2D2324      -142.2     0.    -177.7 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 7d
 759    Ea 1E2324       -29.0     0.     -36.3 FIXEDHF     0.800  0       0.0  0
 760    Eb 2D2324      -105.4     0.    -131.7 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 8d
 761    Eb 1E2324       -20.9     0.     -26.1 FIXEDHF     0.800  0       0.0  0
 762    Ec 2D2324       -81.8     0.    -102.3 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 9d
 763    Ec 1E2324       -15.8     0.     -19.8 FIXEDHF     0.800  0       0.0  0
 764    Ed 2D2324       -65.8     0.     -82.3 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 10d
 765    Ed 1E2324       -12.5     0.     -15.6 FIXEDHF     0.800  0       0.0  0
 766    Ee 2D2324       -54.4     0.     -68.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 11d
 767    Ee 1E2324       -10.2     0.     -12.7 FIXEDHF     0.800  0       0.0  0
 768    Ef 2D2324       -46.0     0.     -57.5 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 12d
 769    Ef 1E2324        -8.5     0.     -10.6 FIXEDHF     0.800  0       0.0  0
 770    Eg 2D2324       -39.5     0.     -49.4 FIXEDHF     0.800  0       0.0  0  p2 7s     -p2 13d
 771    Eg 1E2324        -7.2     0.      -9.0 FIXEDHF     0.800  0       0.0  0
 772    Ex 1D2312      -228.6     0.    -285.7 FIXEDHF     0.800  0       0.0  0  p2 7s     -sp2
 773    Ex 0E2312        -5.6     0.      -7.0 FIXEDHF     0.800  0       0.0  0
 774    Ey 1D2317       252.6     0.     315.8 FIXEDHF     0.800  0       0.0  0  p2 7s     -sp 4p
 775    Ey 0E2317       383.5     0.     479.4 FIXEDHF     0.800  0       0.0  0
 776    Ez 1D2317       291.4     0.     364.2 FIXEDHF     0.800  0       0.0  0  p2 7s     -sp 5p
 777    Ez 0E2317       226.6     0.     283.3 FIXEDHF     0.800  0       0.0  0
 778    E! 1D2317       282.3     0.     352.9 FIXEDHF     0.800  0       0.0  0  p2 7s     -sp 6p
 779    E! 0E2317       155.6     0.     194.5 FIXEDHF     0.800  0       0.0  0
 780    E" 1D2317       500.8     0.     626.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -sp 7p
 781    E" 0E2317       115.6     0.     144.5 FIXEDHF     0.800  0       0.0  0
 782    E# 1D2317       395.0     0.     493.8 FIXEDHF     0.800  0       0.0  0  p2 7s     -sp 8p
 783    E# 0E2317        90.4     0.     113.0 FIXEDHF     0.800  0       0.0  0
 784    E$ 1D2317       322.4     0.     403.0 FIXEDHF     0.800  0       0.0  0  p2 7s     -sp 9p
 785    E$ 0E2317        73.3     0.      91.6 FIXEDHF     0.800  0       0.0  0
 786    FG 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 9s
 787    FG 1E2323        58.6     0.      73.3 FIXEDHF     0.800  0       0.0  0
 788    FH 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 10s
 789    FH 1E2323        48.0     0.      60.0 FIXEDHF     0.800  0       0.0  0
 790    FI 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 11s
 791    FI 1E2323        40.2     0.      50.3 FIXEDHF     0.800  0       0.0  0
 792    FJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 12s
 793    FJ 1E2323        34.3     0.      42.9 FIXEDHF     0.800  0       0.0  0
 794    FK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 13s
 795    FK 1E2323        29.8     0.      37.2 FIXEDHF     0.800  0       0.0  0
 796    FW 2D2324      -422.2     0.    -527.7 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 3d
 797    FW 1E2324      -245.1     0.    -306.4 FIXEDHF     0.800  0       0.0  0
 798    FX 2D2324      -300.0     0.    -375.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 4d
 799    FX 1E2324      -114.0     0.    -142.5 FIXEDHF     0.800  0       0.0  0
 800    FY 2D2324      -199.5     0.    -249.4 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 5d
 801    FY 1E2324       -57.7     0.     -72.1 FIXEDHF     0.800  0       0.0  0
 802    FZ 2D2324      -143.2     0.    -179.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 6d
 803    FZ 1E2324       -34.4     0.     -43.0 FIXEDHF     0.800  0       0.0  0
 804    Fa 2D2324      -112.9     0.    -141.1 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 7d
 805    Fa 1E2324       -23.0     0.     -28.8 FIXEDHF     0.800  0       0.0  0
 806    Fb 2D2324       -85.0     0.    -106.2 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 8d
 807    Fb 1E2324       -16.6     0.     -20.8 FIXEDHF     0.800  0       0.0  0
 808    Fc 2D2324       -66.6     0.     -83.3 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 9d
 809    Fc 1E2324       -12.6     0.     -15.8 FIXEDHF     0.800  0       0.0  0
 810    Fd 2D2324       -54.0     0.     -67.5 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 10d
 811    Fd 1E2324       -10.0     0.     -12.5 FIXEDHF     0.800  0       0.0  0
 812    Fe 2D2324       -44.9     0.     -56.1 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 11d
 813    Fe 1E2324        -8.2     0.     -10.2 FIXEDHF     0.800  0       0.0  0
 814    Ff 2D2324       -38.1     0.     -47.6 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 12d
 815    Ff 1E2324        -6.9     0.      -8.6 FIXEDHF     0.800  0       0.0  0
 816    Fg 2D2324       -32.8     0.     -41.0 FIXEDHF     0.800  0       0.0  0  p2 8s     -p2 13d
 817    Fg 1E2324        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0
 818    Fx 1D2312      -173.8     0.    -217.2 FIXEDHF     0.800  0       0.0  0  p2 8s     -sp2
 819    Fx 0E2312        -4.8     0.      -6.0 FIXEDHF     0.800  0       0.0  0
 820    Fy 1D2317       178.1     0.     222.6 FIXEDHF     0.800  0       0.0  0  p2 8s     -sp 4p
 821    Fy 0E2317       290.1     0.     362.6 FIXEDHF     0.800  0       0.0  0
 822    Fz 1D2317       204.7     0.     255.9 FIXEDHF     0.800  0       0.0  0  p2 8s     -sp 5p
 823    Fz 0E2317       171.5     0.     214.4 FIXEDHF     0.800  0       0.0  0
 824    F! 1D2317       196.1     0.     245.1 FIXEDHF     0.800  0       0.0  0  p2 8s     -sp 6p
 825    F! 0E2317       117.8     0.     147.2 FIXEDHF     0.800  0       0.0  0
 826    F" 1D2317       181.8     0.     227.3 FIXEDHF     0.800  0       0.0  0  p2 8s     -sp 7p
 827    F" 0E2317        87.5     0.     109.4 FIXEDHF     0.800  0       0.0  0
 828    F# 1D2317       289.9     0.     362.4 FIXEDHF     0.800  0       0.0  0  p2 8s     -sp 8p
 829    F# 0E2317        68.5     0.      85.6 FIXEDHF     0.800  0       0.0  0
 830    F$ 1D2317       238.6     0.     298.3 FIXEDHF     0.800  0       0.0  0  p2 8s     -sp 9p
 831    F$ 0E2317        55.4     0.      69.3 FIXEDHF     0.800  0       0.0  0
 832    GH 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 10s
 833    GH 1E2323        38.1     0.      47.6 FIXEDHF     0.800  0       0.0  0
 834    GI 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 11s
 835    GI 1E2323        31.9     0.      39.9 FIXEDHF     0.800  0       0.0  0
 836    GJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 12s
 837    GJ 1E2323        27.2     0.      34.0 FIXEDHF     0.800  0       0.0  0
 838    GK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 13s
 839    GK 1E2323        23.6     0.      29.5 FIXEDHF     0.800  0       0.0  0
 840    GW 2D2324      -330.0     0.    -412.5 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 3d
 841    GW 1E2324      -195.1     0.    -243.9 FIXEDHF     0.800  0       0.0  0
 842    GX 2D2324      -235.0     0.    -293.8 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 4d
 843    GX 1E2324       -91.4     0.    -114.3 FIXEDHF     0.800  0       0.0  0
 844    GY 2D2324      -156.2     0.    -195.2 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 5d
 845    GY 1E2324       -46.6     0.     -58.2 FIXEDHF     0.800  0       0.0  0
 846    GZ 2D2324      -111.4     0.    -139.3 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 6d
 847    GZ 1E2324       -27.9     0.     -34.9 FIXEDHF     0.800  0       0.0  0
 848    Ga 2D2324       -84.8     0.    -106.0 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 7d
 849    Ga 1E2324       -18.7     0.     -23.4 FIXEDHF     0.800  0       0.0  0
 850    Gb 2D2324       -69.0     0.     -86.3 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 8d
 851    Gb 1E2324       -13.6     0.     -17.0 FIXEDHF     0.800  0       0.0  0
 852    Gc 2D2324       -54.6     0.     -68.3 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 9d
 853    Gc 1E2324       -10.4     0.     -13.0 FIXEDHF     0.800  0       0.0  0
 854    Gd 2D2324       -44.6     0.     -55.7 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 10d
 855    Gd 1E2324        -8.2     0.     -10.3 FIXEDHF     0.800  0       0.0  0
 856    Ge 2D2324       -37.2     0.     -46.5 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 11d
 857    Ge 1E2324        -6.7     0.      -8.4 FIXEDHF     0.800  0       0.0  0
 858    Gf 2D2324       -31.6     0.     -39.5 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 12d
 859    Gf 1E2324        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0
 860    Gg 2D2324       -27.4     0.     -34.2 FIXEDHF     0.800  0       0.0  0  p2 9s     -p2 13d
 861    Gg 1E2324        -4.8     0.      -6.0 FIXEDHF     0.800  0       0.0  0
 862    Gx 1D2312      -138.0     0.    -172.5 FIXEDHF     0.800  0       0.0  0  p2 9s     -sp2
 863    Gx 0E2312        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0
 864    Gy 1D2317       133.8     0.     167.3 FIXEDHF     0.800  0       0.0  0  p2 9s     -sp 4p
 865    Gy 0E2317       229.4     0.     286.8 FIXEDHF     0.800  0       0.0  0
 866    Gz 1D2317       154.0     0.     192.5 FIXEDHF     0.800  0       0.0  0  p2 9s     -sp 5p
 867    Gz 0E2317       135.8     0.     169.7 FIXEDHF     0.800  0       0.0  0
 868    G! 1D2317       146.2     0.     182.7 FIXEDHF     0.800  0       0.0  0  p2 9s     -sp 6p
 869    G! 0E2317        93.2     0.     116.5 FIXEDHF     0.800  0       0.0  0
 870    G" 1D2317       134.2     0.     167.7 FIXEDHF     0.800  0       0.0  0  p2 9s     -sp 7p
 871    G" 0E2317        69.3     0.      86.6 FIXEDHF     0.800  0       0.0  0
 872    G# 1D2317       123.0     0.     153.7 FIXEDHF     0.800  0       0.0  0  p2 9s     -sp 8p
 873    G# 0E2317        54.2     0.      67.8 FIXEDHF     0.800  0       0.0  0
 874    G$ 1D2317       182.3     0.     227.9 FIXEDHF     0.800  0       0.0  0  p2 9s     -sp 9p
 875    G$ 0E2317        43.9     0.      54.9 FIXEDHF     0.800  0       0.0  0
 876    HI 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 11s
 877    HI 1E2323        26.1     0.      32.6 FIXEDHF     0.800  0       0.0  0
 878    HJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 12s
 879    HJ 1E2323        22.3     0.      27.9 FIXEDHF     0.800  0       0.0  0
 880    HK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 13s
 881    HK 1E2323        19.3     0.      24.1 FIXEDHF     0.800  0       0.0  0
 882    HW 2D2324      -267.3     0.    -334.1 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 3d
 883    HW 1E2324      -160.2     0.    -200.2 FIXEDHF     0.800  0       0.0  0
 884    HX 2D2324      -190.8     0.    -238.5 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 4d
 885    HX 1E2324       -75.4     0.     -94.3 FIXEDHF     0.800  0       0.0  0
 886    HY 2D2324      -126.8     0.    -158.5 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 5d
 887    HY 1E2324       -38.6     0.     -48.3 FIXEDHF     0.800  0       0.0  0
 888    HZ 2D2324       -90.3     0.    -112.9 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 6d
 889    HZ 1E2324       -23.2     0.     -29.0 FIXEDHF     0.800  0       0.0  0
 890    Ha 2D2324       -68.4     0.     -85.5 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 7d
 891    Ha 1E2324       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0
 892    Hb 2D2324       -54.3     0.     -67.9 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 8d
 893    Hb 1E2324       -11.4     0.     -14.2 FIXEDHF     0.800  0       0.0  0
 894    Hc 2D2324       -45.4     0.     -56.7 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 9d
 895    Hc 1E2324        -8.6     0.     -10.8 FIXEDHF     0.800  0       0.0  0
 896    Hd 2D2324       -37.2     0.     -46.5 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 10d
 897    Hd 1E2324        -6.9     0.      -8.6 FIXEDHF     0.800  0       0.0  0
 898    He 2D2324       -31.2     0.     -39.0 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 11d
 899    He 1E2324        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0
 900    Hf 2D2324       -26.6     0.     -33.2 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 12d
 901    Hf 1E2324        -4.7     0.      -5.9 FIXEDHF     0.800  0       0.0  0
 902    Hg 2D2324       -23.0     0.     -28.8 FIXEDHF     0.800  0       0.0  0  p2 10s    -p2 13d
 903    Hg 1E2324        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0
 904    Hx 1D2312      -113.0     0.    -141.3 FIXEDHF     0.800  0       0.0  0  p2 10s    -sp2
 905    Hx 0E2312        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0
 906    Hy 1D2317       105.0     0.     131.3 FIXEDHF     0.800  0       0.0  0  p2 10s    -sp 4p
 907    Hy 0E2317       187.4     0.     234.2 FIXEDHF     0.800  0       0.0  0
 908    Hz 1D2317       121.3     0.     151.6 FIXEDHF     0.800  0       0.0  0  p2 10s    -sp 5p
 909    Hz 0E2317       110.9     0.     138.6 FIXEDHF     0.800  0       0.0  0
 910    H! 1D2317       114.6     0.     143.2 FIXEDHF     0.800  0       0.0  0  p2 10s    -sp 6p
 911    H! 0E2317        76.2     0.      95.2 FIXEDHF     0.800  0       0.0  0
 912    H" 1D2317       104.2     0.     130.3 FIXEDHF     0.800  0       0.0  0  p2 10s    -sp 7p
 913    H" 0E2317        56.6     0.      70.8 FIXEDHF     0.800  0       0.0  0
 914    H# 1D2317        94.7     0.     118.4 FIXEDHF     0.800  0       0.0  0  p2 10s    -sp 8p
 915    H# 0E2317        44.2     0.      55.3 FIXEDHF     0.800  0       0.0  0
 916    H$ 1D2317        86.6     0.     108.3 FIXEDHF     0.800  0       0.0  0  p2 10s    -sp 9p
 917    H$ 0E2317        35.9     0.      44.9 FIXEDHF     0.800  0       0.0  0
 918    IJ 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 12s
 919    IJ 1E2323        18.7     0.      23.4 FIXEDHF     0.800  0       0.0  0
 920    IK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 13s
 921    IK 1E2323        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0
 922    IW 2D2324      -222.2     0.    -277.8 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 3d
 923    IW 1E2324      -134.5     0.    -168.1 FIXEDHF     0.800  0       0.0  0
 924    IX 2D2324      -159.0     0.    -198.8 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 4d
 925    IX 1E2324       -63.6     0.     -79.5 FIXEDHF     0.800  0       0.0  0
 926    IY 2D2324      -105.8     0.    -132.2 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 5d
 927    IY 1E2324       -32.6     0.     -40.8 FIXEDHF     0.800  0       0.0  0
 928    IZ 2D2324       -75.3     0.     -94.1 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 6d
 929    IZ 1E2324       -19.7     0.     -24.6 FIXEDHF     0.800  0       0.0  0
 930    Ia 2D2324       -57.0     0.     -71.2 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 7d
 931    Ia 1E2324       -13.3     0.     -16.6 FIXEDHF     0.800  0       0.0  0
 932    Ib 2D2324       -45.0     0.     -56.3 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 8d
 933    Ib 1E2324        -9.7     0.     -12.1 FIXEDHF     0.800  0       0.0  0
 934    Ic 2D2324       -37.0     0.     -46.2 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 9d
 935    Ic 1E2324        -7.4     0.      -9.2 FIXEDHF     0.800  0       0.0  0
 936    Id 2D2324       -31.4     0.     -39.3 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 10d
 937    Id 1E2324        -5.8     0.      -7.3 FIXEDHF     0.800  0       0.0  0
 938    Ie 2D2324       -26.5     0.     -33.1 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 11d
 939    Ie 1E2324        -4.8     0.      -6.0 FIXEDHF     0.800  0       0.0  0
 940    If 2D2324       -22.6     0.     -28.3 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 12d
 941    If 1E2324        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0
 942    Ig 2D2324       -19.6     0.     -24.5 FIXEDHF     0.800  0       0.0  0  p2 11s    -p2 13d
 943    Ig 1E2324        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0
 944    Ix 1D2312       -94.8     0.    -118.5 FIXEDHF     0.800  0       0.0  0  p2 11s    -sp2
 945    Ix 0E2312        -3.1     0.      -3.9 FIXEDHF     0.800  0       0.0  0
 946    Iy 1D2317        85.1     0.     106.4 FIXEDHF     0.800  0       0.0  0  p2 11s    -sp 4p
 947    Iy 0E2317       156.8     0.     196.0 FIXEDHF     0.800  0       0.0  0
 948    Iz 1D2317        98.6     0.     123.3 FIXEDHF     0.800  0       0.0  0  p2 11s    -sp 5p
 949    Iz 0E2317        92.8     0.     116.0 FIXEDHF     0.800  0       0.0  0
 950    I! 1D2317        93.0     0.     116.2 FIXEDHF     0.800  0       0.0  0  p2 11s    -sp 6p
 951    I! 0E2317        63.8     0.      79.7 FIXEDHF     0.800  0       0.0  0
 952    I" 1D2317        84.2     0.     105.3 FIXEDHF     0.800  0       0.0  0  p2 11s    -sp 7p
 953    I" 0E2317        47.4     0.      59.2 FIXEDHF     0.800  0       0.0  0
 954    I# 1D2317        75.9     0.      94.9 FIXEDHF     0.800  0       0.0  0  p2 11s    -sp 8p
 955    I# 0E2317        37.0     0.      46.3 FIXEDHF     0.800  0       0.0  0
 956    I$ 1D2317        69.0     0.      86.2 FIXEDHF     0.800  0       0.0  0  p2 11s    -sp 9p
 957    I$ 0E2317        30.0     0.      37.5 FIXEDHF     0.800  0       0.0  0
 958    JK 0D2323         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 13s
 959    JK 1E2323        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0
 960    JW 2D2324      -188.6     0.    -235.8 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 3d
 961    JW 1E2324      -115.0     0.    -143.7 FIXEDHF     0.800  0       0.0  0
 962    JX 2D2324      -135.2     0.    -169.0 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 4d
 963    JX 1E2324       -54.5     0.     -68.1 FIXEDHF     0.800  0       0.0  0
 964    JY 2D2324       -90.0     0.    -112.5 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 5d
 965    JY 1E2324       -28.0     0.     -35.0 FIXEDHF     0.800  0       0.0  0
 966    JZ 2D2324       -64.1     0.     -80.1 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 6d
 967    JZ 1E2324       -17.0     0.     -21.2 FIXEDHF     0.800  0       0.0  0
 968    Ja 2D2324       -48.4     0.     -60.5 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 7d
 969    Ja 1E2324       -11.4     0.     -14.3 FIXEDHF     0.800  0       0.0  0
 970    Jb 2D2324       -38.3     0.     -47.9 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 8d
 971    Jb 1E2324        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0
 972    Jc 2D2324       -31.3     0.     -39.1 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 9d
 973    Jc 1E2324        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0
 974    Jd 2D2324       -26.2     0.     -32.8 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 10d
 975    Jd 1E2324        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0
 976    Je 2D2324       -22.7     0.     -28.4 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 11d
 977    Je 1E2324        -4.2     0.      -5.2 FIXEDHF     0.800  0       0.0  0
 978    Jf 2D2324       -19.5     0.     -24.4 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 12d
 979    Jf 1E2324        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0
 980    Jg 2D2324       -17.0     0.     -21.2 FIXEDHF     0.800  0       0.0  0  p2 12s    -p2 13d
 981    Jg 1E2324        -3.0     0.      -3.7 FIXEDHF     0.800  0       0.0  0
 982    Jx 1D2312       -81.0     0.    -101.2 FIXEDHF     0.800  0       0.0  0  p2 12s    -sp2
 983    Jx 0E2312        -2.7     0.      -3.4 FIXEDHF     0.800  0       0.0  0
 984    Jy 1D2317        70.6     0.      88.3 FIXEDHF     0.800  0       0.0  0  p2 12s    -sp 4p
 985    Jy 0E2317       133.7     0.     167.1 FIXEDHF     0.800  0       0.0  0
 986    Jz 1D2317        82.2     0.     102.8 FIXEDHF     0.800  0       0.0  0  p2 12s    -sp 5p
 987    Jz 0E2317        79.1     0.      98.9 FIXEDHF     0.800  0       0.0  0
 988    J! 1D2317        77.4     0.      96.8 FIXEDHF     0.800  0       0.0  0  p2 12s    -sp 6p
 989    J! 0E2317        54.4     0.      68.0 FIXEDHF     0.800  0       0.0  0
 990    J" 1D2317        69.9     0.      87.4 FIXEDHF     0.800  0       0.0  0  p2 12s    -sp 7p
 991    J" 0E2317        40.4     0.      50.5 FIXEDHF     0.800  0       0.0  0
 992    J# 1D2317        62.7     0.      78.4 FIXEDHF     0.800  0       0.0  0  p2 12s    -sp 8p
 993    J# 0E2317        31.6     0.      39.5 FIXEDHF     0.800  0       0.0  0
 994    J$ 1D2317        56.6     0.      70.7 FIXEDHF     0.800  0       0.0  0  p2 12s    -sp 9p
 995    J$ 0E2317        25.6     0.      32.0 FIXEDHF     0.800  0       0.0  0
 996    KW 2D2324      -162.6     0.    -203.3 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 3d
 997    KW 1E2324       -99.8     0.    -124.7 FIXEDHF     0.800  0       0.0  0
 998    KX 2D2324      -116.8     0.    -146.0 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 4d
 999    KX 1E2324       -47.4     0.     -59.3 FIXEDHF     0.800  0       0.0  0
1000    KY 2D2324       -77.8     0.     -97.2 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 5d
1001    KY 1E2324       -24.4     0.     -30.5 FIXEDHF     0.800  0       0.0  0
1002    KZ 2D2324       -55.4     0.     -69.3 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 6d
1003    KZ 1E2324       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0
1004    Ka 2D2324       -41.9     0.     -52.4 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 7d
1005    Ka 1E2324       -10.0     0.     -12.5 FIXEDHF     0.800  0       0.0  0
1006    Kb 2D2324       -33.1     0.     -41.4 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 8d
1007    Kb 1E2324        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0
1008    Kc 2D2324       -27.0     0.     -33.8 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 9d
1009    Kc 1E2324        -5.6     0.      -7.0 FIXEDHF     0.800  0       0.0  0
1010    Kd 2D2324       -22.6     0.     -28.3 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 10d
1011    Kd 1E2324        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0
1012    Ke 2D2324       -19.4     0.     -24.2 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 11d
1013    Ke 1E2324        -3.7     0.      -4.6 FIXEDHF     0.800  0       0.0  0
1014    Kf 2D2324       -17.0     0.     -21.2 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 12d
1015    Kf 1E2324        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0
1016    Kg 2D2324       -14.8     0.     -18.5 FIXEDHF     0.800  0       0.0  0  p2 13s    -p2 13d
1017    Kg 1E2324        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0
1018    Kx 1D2312       -70.2     0.     -87.7 FIXEDHF     0.800  0       0.0  0  p2 13s    -sp2
1019    Kx 0E2312        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0
1020    Ky 1D2317        59.8     0.      74.7 FIXEDHF     0.800  0       0.0  0  p2 13s    -sp 4p
1021    Ky 0E2317       115.8     0.     144.7 FIXEDHF     0.800  0       0.0  0
1022    Kz 1D2317        69.8     0.      87.3 FIXEDHF     0.800  0       0.0  0  p2 13s    -sp 5p
1023    Kz 0E2317        68.6     0.      85.7 FIXEDHF     0.800  0       0.0  0
1024    K! 1D2317        65.8     0.      82.2 FIXEDHF     0.800  0       0.0  0  p2 13s    -sp 6p
1025    K! 0E2317        47.0     0.      58.8 FIXEDHF     0.800  0       0.0  0
1026    K" 1D2317        59.3     0.      74.1 FIXEDHF     0.800  0       0.0  0  p2 13s    -sp 7p
1027    K" 0E2317        35.0     0.      43.8 FIXEDHF     0.800  0       0.0  0
1028    K# 1D2317        53.0     0.      66.3 FIXEDHF     0.800  0       0.0  0  p2 13s    -sp 8p
1029    K# 0E2317        27.4     0.      34.2 FIXEDHF     0.800  0       0.0  0
1030    K$ 1D2317        47.6     0.      59.5 FIXEDHF     0.800  0       0.0  0  p2 13s    -sp 9p
1031    K$ 0E2317        22.2     0.      27.7 FIXEDHF     0.800  0       0.0  0
1032    LW 1D1122     37693.9     0.   47117.4 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 3d
1033    LX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 4d
1034    LY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 5d
1035    LZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 6d
1036    La 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 7d
1037    Lb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 8d
1038    Lc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 9d
1039    Ld 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 10d
1040    Le 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 11d
1041    Lf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 12d
1042    Lg 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -p2 13d
1043    Lx 1D1422     11107.7     0.   13884.6 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp2
1044    Ly 1D1427     -3374.4     0.   -4218.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 4p
1045    Ly 1E1427      2127.5     0.    2659.4 FIXEDHF     0.800  0       0.0  0
1046    Lz 1D1427      -967.5     0.   -1209.4 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 5p
1047    Lz 1E1427      1159.5     0.    1449.4 FIXEDHF     0.800  0       0.0  0
1048    L! 1D1427      -564.7     0.    -705.9 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 6p
1049    L! 1E1427       768.0     0.     960.0 FIXEDHF     0.800  0       0.0  0
1050    L" 1D1427      -389.0     0.    -486.3 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 7p
1051    L" 1E1427       559.7     0.     699.6 FIXEDHF     0.800  0       0.0  0
1052    L# 1D1427      -291.0     0.    -363.7 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 8p
1053    L# 1E1427       432.3     0.     540.4 FIXEDHF     0.800  0       0.0  0
1054    L$ 1D1427      -228.9     0.    -286.1 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 9p
1055    L$ 1E1427       347.4     0.     434.3 FIXEDHF     0.800  0       0.0  0
1056    L% 1D1428     -2785.5     0.   -3481.9 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 4f
1057    L% 3E1428      -174.7     0.    -218.4 FIXEDHF     0.800  0       0.0  0
1058    L& 1D1428     -2046.0     0.   -2557.5 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 5f
1059    L& 3E1428      -165.4     0.    -206.8 FIXEDHF     0.800  0       0.0  0
1060    L' 1D1428     -1569.8     0.   -1962.3 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 6f
1061    L' 3E1428      -143.8     0.    -179.7 FIXEDHF     0.800  0       0.0  0
1062    L( 1D1428     -1253.0     0.   -1566.2 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 7f
1063    L( 3E1428      -123.4     0.    -154.3 FIXEDHF     0.800  0       0.0  0
1064    L) 1D1428     -1030.4     0.   -1288.0 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 8f
1065    L) 3E1428      -106.5     0.    -133.1 FIXEDHF     0.800  0       0.0  0
1066    L* 1D1428      -867.1     0.   -1083.9 FIXEDHF     0.800  0       0.0  0  s2 3d     -sp 9f
1067    L* 3E1428       -92.6     0.    -115.8 FIXEDHF     0.800  0       0.0  0
1068    MW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 3d
1069    MX 1D1122     38166.9     0.   47708.6 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 4d
1070    MY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 5d
1071    MZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 6d
1072    Ma 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 7d
1073    Mb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 8d
1074    Mc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 9d
1075    Md 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 10d
1076    Me 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 11d
1077    Mf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 12d
1078    Mg 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -p2 13d
1079    Mx 1D1422      8312.5     0.   10390.6 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp2
1080    My 1D1427       505.0     0.     631.2 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 4p
1081    My 1E1427      1750.3     0.    2187.9 FIXEDHF     0.800  0       0.0  0
1082    Mz 1D1427     -1160.0     0.   -1450.0 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 5p
1083    Mz 1E1427       964.6     0.    1205.7 FIXEDHF     0.800  0       0.0  0
1084    M! 1D1427      -455.4     0.    -569.3 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 6p
1085    M! 1E1427       641.8     0.     802.3 FIXEDHF     0.800  0       0.0  0
1086    M" 1D1427      -293.8     0.    -367.3 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 7p
1087    M" 1E1427       469.0     0.     586.2 FIXEDHF     0.800  0       0.0  0
1088    M# 1D1427      -214.6     0.    -268.2 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 8p
1089    M# 1E1427       362.8     0.     453.5 FIXEDHF     0.800  0       0.0  0
1090    M$ 1D1427      -166.9     0.    -208.6 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 9p
1091    M$ 1E1427       291.8     0.     364.8 FIXEDHF     0.800  0       0.0  0
1092    M% 1D1428       343.5     0.     429.4 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 4f
1093    M% 3E1428      -128.6     0.    -160.8 FIXEDHF     0.800  0       0.0  0
1094    M& 1D1428      -571.4     0.    -714.3 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 5f
1095    M& 3E1428      -122.4     0.    -153.0 FIXEDHF     0.800  0       0.0  0
1096    M' 1D1428      -591.0     0.    -738.7 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 6f
1097    M' 3E1428      -106.6     0.    -133.3 FIXEDHF     0.800  0       0.0  0
1098    M( 1D1428      -527.3     0.    -659.1 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 7f
1099    M( 3E1428       -91.8     0.    -114.7 FIXEDHF     0.800  0       0.0  0
1100    M) 1D1428      -459.8     0.    -574.7 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 8f
1101    M) 3E1428       -79.3     0.     -99.1 FIXEDHF     0.800  0       0.0  0
1102    M* 1D1428      -401.0     0.    -501.3 FIXEDHF     0.800  0       0.0  0  s2 4d     -sp 9f
1103    M* 3E1428       -69.0     0.     -86.3 FIXEDHF     0.800  0       0.0  0
1104    NW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 3d
1105    NX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 4d
1106    NY 1D1122     38335.8     0.   47919.7 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 5d
1107    NZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 6d
1108    Na 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 7d
1109    Nb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 8d
1110    Nc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 9d
1111    Nd 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 10d
1112    Ne 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 11d
1113    Nf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 12d
1114    Ng 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5d     -p2 13d
1115    Nx 1D1422      6042.5     0.    7553.1 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp2
1116    Ny 1D1427       954.5     0.    1193.1 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 4p
1117    Ny 1E1427      1329.5     0.    1661.9 FIXEDHF     0.800  0       0.0  0
1118    Nz 1D1427         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 5p
1119    Nz 1E1427       736.5     0.     920.6 FIXEDHF     0.800  0       0.0  0
1120    N! 1D1427      -503.4     0.    -629.3 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 6p
1121    N! 1E1427       491.2     0.     614.0 FIXEDHF     0.800  0       0.0  0
1122    N" 1D1427      -230.8     0.    -288.5 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 7p
1123    N" 1E1427       359.4     0.     449.2 FIXEDHF     0.800  0       0.0  0
1124    N# 1D1427      -158.2     0.    -197.8 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 8p
1125    N# 1E1427       278.2     0.     347.8 FIXEDHF     0.800  0       0.0  0
1126    N$ 1D1427      -120.1     0.    -150.1 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 9p
1127    N$ 1E1427       223.9     0.     279.9 FIXEDHF     0.800  0       0.0  0
1128    N% 1D1428        67.8     0.      84.7 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 4f
1129    N% 3E1428       -92.4     0.    -115.5 FIXEDHF     0.800  0       0.0  0
1130    N& 1D1428       257.2     0.     321.5 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 5f
1131    N& 3E1428       -88.2     0.    -110.2 FIXEDHF     0.800  0       0.0  0
1132    N' 1D1428       -92.4     0.    -115.5 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 6f
1133    N' 3E1428       -77.0     0.     -96.2 FIXEDHF     0.800  0       0.0  0
1134    N( 1D1428      -154.7     0.    -193.4 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 7f
1135    N( 3E1428       -66.2     0.     -82.8 FIXEDHF     0.800  0       0.0  0
1136    N) 1D1428      -162.8     0.    -203.5 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 8f
1137    N) 3E1428       -57.3     0.     -71.6 FIXEDHF     0.800  0       0.0  0
1138    N* 1D1428      -155.8     0.    -194.7 FIXEDHF     0.800  0       0.0  0  s2 5d     -sp 9f
1139    N* 3E1428       -49.9     0.     -62.4 FIXEDHF     0.800  0       0.0  0
1140    OW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 3d
1141    OX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 4d
1142    OY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 5d
1143    OZ 1D1122     38396.5     0.   47995.6 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 6d
1144    Oa 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 7d
1145    Ob 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 8d
1146    Oc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 9d
1147    Od 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 10d
1148    Oe 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 11d
1149    Of 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 12d
1150    Og 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6d     -p2 13d
1151    Ox 1D1422      4537.2     0.    5671.5 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp2
1152    Oy 1D1427       923.0     0.    1153.7 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 4p
1153    Oy 1E1427      1022.8     0.    1278.5 FIXEDHF     0.800  0       0.0  0
1154    Oz 1D1427       222.0     0.     277.5 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 5p
1155    Oz 1E1427       568.2     0.     710.3 FIXEDHF     0.800  0       0.0  0
1156    O! 1D1427       -50.3     0.     -62.9 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 6p
1157    O! 1E1427       379.4     0.     474.3 FIXEDHF     0.800  0       0.0  0
1158    O" 1D1427      -257.7     0.    -322.1 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 7p
1159    O" 1E1427       277.8     0.     347.2 FIXEDHF     0.800  0       0.0  0
1160    O# 1D1427      -130.3     0.    -162.9 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 8p
1161    O# 1E1427       215.1     0.     268.9 FIXEDHF     0.800  0       0.0  0
1162    O$ 1D1427       -93.2     0.    -116.5 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 9p
1163    O$ 1E1427       173.2     0.     216.5 FIXEDHF     0.800  0       0.0  0
1164    O% 1D1428        46.6     0.      58.3 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 4f
1165    O% 3E1428       -68.9     0.     -86.1 FIXEDHF     0.800  0       0.0  0
1166    O& 1D1428        68.9     0.      86.1 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 5f
1167    O& 3E1428       -65.8     0.     -82.3 FIXEDHF     0.800  0       0.0  0
1168    O' 1D1428       173.9     0.     217.4 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 6f
1169    O' 3E1428       -57.5     0.     -71.9 FIXEDHF     0.800  0       0.0  0
1170    O( 1D1428        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 7f
1171    O( 3E1428       -49.5     0.     -61.9 FIXEDHF     0.800  0       0.0  0
1172    O) 1D1428       -26.8     0.     -33.5 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 8f
1173    O) 3E1428       -42.8     0.     -53.5 FIXEDHF     0.800  0       0.0  0
1174    O* 1D1428       -42.6     0.     -53.3 FIXEDHF     0.800  0       0.0  0  s2 6d     -sp 9f
1175    O* 3E1428       -37.4     0.     -46.7 FIXEDHF     0.800  0       0.0  0
1176    PW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 3d
1177    PX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 4d
1178    PY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 5d
1179    PZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 6d
1180    Pa 1D1122     38423.4     0.   48029.3 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 7d
1181    Pb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 8d
1182    Pc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 9d
1183    Pd 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 10d
1184    Pe 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 11d
1185    Pf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 12d
1186    Pg 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -p2 13d
1187    Px 1D1422      3536.5     0.    4420.6 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp2
1188    Py 1D1427       811.8     0.    1014.8 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 4p
1189    Py 1E1427       809.2     0.    1011.5 FIXEDHF     0.800  0       0.0  0
1190    Pz 1D1427       263.2     0.     329.0 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 5p
1191    Pz 1E1427       450.4     0.     563.0 FIXEDHF     0.800  0       0.0  0
1192    P! 1D1427        54.3     0.      67.9 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 6p
1193    P! 1E1427       301.0     0.     376.2 FIXEDHF     0.800  0       0.0  0
1194    P" 1D1427       -48.6     0.     -60.8 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 7p
1195    P" 1E1427       220.4     0.     275.5 FIXEDHF     0.800  0       0.0  0
1196    P# 1D1427      -148.2     0.    -185.3 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 8p
1197    P# 1E1427       170.7     0.     213.4 FIXEDHF     0.800  0       0.0  0
1198    P$ 1D1427       -80.6     0.    -100.8 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 9p
1199    P$ 1E1427       137.5     0.     171.9 FIXEDHF     0.800  0       0.0  0
1200    P% 1D1428        38.2     0.      47.8 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 4f
1201    P% 3E1428       -53.4     0.     -66.8 FIXEDHF     0.800  0       0.0  0
1202    P& 1D1428        45.9     0.      57.4 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 5f
1203    P& 3E1428       -51.1     0.     -63.9 FIXEDHF     0.800  0       0.0  0
1204    P' 1D1428        57.4     0.      71.7 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 6f
1205    P' 3E1428       -44.6     0.     -55.8 FIXEDHF     0.800  0       0.0  0
1206    P( 1D1428       118.1     0.     147.6 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 7f
1207    P( 3E1428       -38.5     0.     -48.1 FIXEDHF     0.800  0       0.0  0
1208    P) 1D1428        38.7     0.      48.4 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 8f
1209    P) 3E1428       -33.3     0.     -41.6 FIXEDHF     0.800  0       0.0  0
1210    P* 1D1428        10.8     0.      13.5 FIXEDHF     0.800  0       0.0  0  s2 7d     -sp 9f
1211    P* 3E1428       -29.0     0.     -36.3 FIXEDHF     0.800  0       0.0  0
1212    QW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 3d
1213    QX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 4d
1214    QY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 5d
1215    QZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 6d
1216    Qa 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 7d
1217    Qb 1D1122     38437.3     0.   48046.6 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 8d
1218    Qc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 9d
1219    Qd 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 10d
1220    Qe 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 11d
1221    Qf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 12d
1222    Qg 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -p2 13d
1223    Qx 1D1422      2845.8     0.    3557.2 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp2
1224    Qy 1D1427       701.4     0.     876.8 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 4p
1225    Qy 1E1427       657.7     0.     822.1 FIXEDHF     0.800  0       0.0  0
1226    Qz 1D1427       256.9     0.     321.1 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 5p
1227    Qz 1E1427       366.5     0.     458.1 FIXEDHF     0.800  0       0.0  0
1228    Q! 1D1427        86.6     0.     108.2 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 6p
1229    Q! 1E1427       245.0     0.     306.3 FIXEDHF     0.800  0       0.0  0
1230    Q" 1D1427         6.7     0.       8.4 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 7p
1231    Q" 1E1427       179.5     0.     224.4 FIXEDHF     0.800  0       0.0  0
1232    Q# 1D1427       -39.4     0.     -49.2 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 8p
1233    Q# 1E1427       139.1     0.     173.9 FIXEDHF     0.800  0       0.0  0
1234    Q$ 1D1427       -92.9     0.    -116.1 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 9p
1235    Q$ 1E1427       112.0     0.     140.0 FIXEDHF     0.800  0       0.0  0
1236    Q% 1D1428        32.7     0.      40.9 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 4f
1237    Q% 3E1428       -42.9     0.     -53.6 FIXEDHF     0.800  0       0.0  0
1238    Q& 1D1428        36.2     0.      45.2 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 5f
1239    Q& 3E1428       -41.0     0.     -51.3 FIXEDHF     0.800  0       0.0  0
1240    Q' 1D1428        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 6f
1241    Q' 3E1428       -35.8     0.     -44.8 FIXEDHF     0.800  0       0.0  0
1242    Q( 1D1428        45.3     0.      56.6 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 7f
1243    Q( 3E1428       -30.9     0.     -38.6 FIXEDHF     0.800  0       0.0  0
1244    Q) 1D1428        82.3     0.     102.9 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 8f
1245    Q) 3E1428       -26.7     0.     -33.4 FIXEDHF     0.800  0       0.0  0
1246    Q* 1D1428        38.2     0.      47.8 FIXEDHF     0.800  0       0.0  0  s2 8d     -sp 9f
1247    Q* 3E1428       -23.3     0.     -29.1 FIXEDHF     0.800  0       0.0  0
1248    RW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 3d
1249    RX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 4d
1250    RY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 5d
1251    RZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 6d
1252    Ra 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 7d
1253    Rb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 8d
1254    Rc 1D1122     38445.0     0.   48056.3 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 9d
1255    Rd 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 10d
1256    Re 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 11d
1257    Rf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 12d
1258    Rg 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9d     -p2 13d
1259    Rx 1D1422      2349.7     0.    2937.1 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp2
1260    Ry 1D1427       607.0     0.     758.7 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 4p
1261    Ry 1E1427       546.9     0.     683.6 FIXEDHF     0.800  0       0.0  0
1262    Rz 1D1427       237.4     0.     296.8 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 5p
1263    Rz 1E1427       305.0     0.     381.2 FIXEDHF     0.800  0       0.0  0
1264    R! 1D1427        94.6     0.     118.2 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 6p
1265    R! 1E1427       204.0     0.     255.0 FIXEDHF     0.800  0       0.0  0
1266    R" 1D1427        28.1     0.      35.1 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 7p
1267    R" 1E1427       149.4     0.     186.8 FIXEDHF     0.800  0       0.0  0
1268    R# 1D1427        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 8p
1269    R# 1E1427       115.8     0.     144.8 FIXEDHF     0.800  0       0.0  0
1270    R$ 1D1427       -30.8     0.     -38.5 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 9p
1271    R$ 1E1427        93.3     0.     116.6 FIXEDHF     0.800  0       0.0  0
1272    R% 1D1428        28.5     0.      35.6 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 4f
1273    R% 3E1428       -35.4     0.     -44.2 FIXEDHF     0.800  0       0.0  0
1274    R& 1D1428        30.2     0.      37.8 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 5f
1275    R& 3E1428       -33.8     0.     -42.3 FIXEDHF     0.800  0       0.0  0
1276    R' 1D1428        30.8     0.      38.5 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 6f
1277    R' 3E1428       -29.6     0.     -37.0 FIXEDHF     0.800  0       0.0  0
1278    R( 1D1428        32.1     0.      40.1 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 7f
1279    R( 3E1428       -25.5     0.     -31.9 FIXEDHF     0.800  0       0.0  0
1280    R) 1D1428        35.4     0.      44.3 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 8f
1281    R) 3E1428       -22.0     0.     -27.5 FIXEDHF     0.800  0       0.0  0
1282    R* 1D1428        59.1     0.      73.9 FIXEDHF     0.800  0       0.0  0  s2 9d     -sp 9f
1283    R* 3E1428       -19.2     0.     -24.0 FIXEDHF     0.800  0       0.0  0
1284    SW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 3d
1285    SX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 4d
1286    SY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 5d
1287    SZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 6d
1288    Sa 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 7d
1289    Sb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 8d
1290    Sc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 9d
1291    Sd 1D1122     38449.8     0.   48062.3 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 10d
1292    Se 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 11d
1293    Sf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 12d
1294    Sg 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 10d    -p2 13d
1295    Sx 1D1422      1980.7     0.    2475.9 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp2
1296    Sy 1D1427       529.0     0.     661.2 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 4p
1297    Sy 1E1427       463.4     0.     579.3 FIXEDHF     0.800  0       0.0  0
1298    Sz 1D1427       215.6     0.     269.5 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 5p
1299    Sz 1E1427       258.6     0.     323.3 FIXEDHF     0.800  0       0.0  0
1300    S! 1D1427        93.4     0.     116.8 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 6p
1301    S! 1E1427       173.0     0.     216.3 FIXEDHF     0.800  0       0.0  0
1302    S" 1D1427        36.5     0.      45.6 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 7p
1303    S" 1E1427       126.8     0.     158.5 FIXEDHF     0.800  0       0.0  0
1304    S# 1D1427         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 8p
1305    S# 1E1427        98.2     0.     122.8 FIXEDHF     0.800  0       0.0  0
1306    S$ 1D1427       -11.3     0.     -14.1 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 9p
1307    S$ 1E1427        79.1     0.      98.9 FIXEDHF     0.800  0       0.0  0
1308    S% 1D1428        25.1     0.      31.4 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 4f
1309    S% 3E1428       -29.8     0.     -37.2 FIXEDHF     0.800  0       0.0  0
1310    S& 1D1428        26.0     0.      32.5 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 5f
1311    S& 3E1428       -28.5     0.     -35.6 FIXEDHF     0.800  0       0.0  0
1312    S' 1D1428        25.7     0.      32.1 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 6f
1313    S' 3E1428       -24.9     0.     -31.1 FIXEDHF     0.800  0       0.0  0
1314    S( 1D1428        25.4     0.      31.8 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 7f
1315    S( 3E1428       -21.4     0.     -26.8 FIXEDHF     0.800  0       0.0  0
1316    S) 1D1428        25.9     0.      32.4 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 8f
1317    S) 3E1428       -18.6     0.     -23.2 FIXEDHF     0.800  0       0.0  0
1318    S* 1D1428        27.9     0.      34.9 FIXEDHF     0.800  0       0.0  0  s2 10d    -sp 9f
1319    S* 3E1428       -16.2     0.     -20.2 FIXEDHF     0.800  0       0.0  0
1320    TW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 3d
1321    TX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 4d
1322    TY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 5d
1323    TZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 6d
1324    Ta 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 7d
1325    Tb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 8d
1326    Tc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 9d
1327    Td 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 10d
1328    Te 1D1122     38452.9     0.   48066.1 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 11d
1329    Tf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 12d
1330    Tg 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -p2 13d
1331    Tx 1D1422      1698.0     0.    2122.5 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp2
1332    Ty 1D1427       465.0     0.     581.2 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 4p
1333    Ty 1E1427       398.9     0.     498.6 FIXEDHF     0.800  0       0.0  0
1334    Tz 1D1427       195.0     0.     243.7 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 5p
1335    Tz 1E1427       222.7     0.     278.4 FIXEDHF     0.800  0       0.0  0
1336    T! 1D1427        88.9     0.     111.1 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 6p
1337    T! 1E1427       149.0     0.     186.3 FIXEDHF     0.800  0       0.0  0
1338    T" 1D1427        39.2     0.      49.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 7p
1339    T" 1E1427       109.2     0.     136.5 FIXEDHF     0.800  0       0.0  0
1340    T# 1D1427        13.2     0.      16.5 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 8p
1341    T# 1E1427        84.6     0.     105.8 FIXEDHF     0.800  0       0.0  0
1342    T$ 1D1427        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 9p
1343    T$ 1E1427        68.2     0.      85.2 FIXEDHF     0.800  0       0.0  0
1344    T% 1D1428        22.4     0.      28.0 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 4f
1345    T% 3E1428       -25.4     0.     -31.8 FIXEDHF     0.800  0       0.0  0
1346    T& 1D1428        22.9     0.      28.6 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 5f
1347    T& 3E1428       -24.4     0.     -30.5 FIXEDHF     0.800  0       0.0  0
1348    T' 1D1428        22.1     0.      27.6 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 6f
1349    T' 3E1428       -21.3     0.     -26.6 FIXEDHF     0.800  0       0.0  0
1350    T( 1D1428        21.3     0.      26.6 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 7f
1351    T( 3E1428       -18.4     0.     -23.0 FIXEDHF     0.800  0       0.0  0
1352    T) 1D1428        20.9     0.      26.1 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 8f
1353    T) 3E1428       -15.9     0.     -19.9 FIXEDHF     0.800  0       0.0  0
1354    T* 1D1428        21.0     0.      26.2 FIXEDHF     0.800  0       0.0  0  s2 11d    -sp 9f
1355    T* 3E1428       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0
1356    UW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 3d
1357    UX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 4d
1358    UY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 5d
1359    UZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 6d
1360    Ua 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 7d
1361    Ub 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 8d
1362    Uc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 9d
1363    Ud 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 10d
1364    Ue 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 11d
1365    Uf 1D1122     38455.0     0.   48068.7 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 12d
1366    Ug 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -p2 13d
1367    Ux 1D1422      1476.2     0.    1845.2 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp2
1368    Uy 1D1427       412.2     0.     515.2 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 4p
1369    Uy 1E1427       347.9     0.     434.9 FIXEDHF     0.800  0       0.0  0
1370    Uz 1D1427       176.3     0.     220.4 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 5p
1371    Uz 1E1427       194.3     0.     242.9 FIXEDHF     0.800  0       0.0  0
1372    U! 1D1427        83.1     0.     103.9 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 6p
1373    U! 1E1427       130.1     0.     162.6 FIXEDHF     0.800  0       0.0  0
1374    U" 1D1427        39.4     0.      49.2 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 7p
1375    U" 1E1427        95.3     0.     119.1 FIXEDHF     0.800  0       0.0  0
1376    U# 1D1427        16.3     0.      20.4 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 8p
1377    U# 1E1427        73.8     0.      92.3 FIXEDHF     0.800  0       0.0  0
1378    U$ 1D1427         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 9p
1379    U$ 1E1427        59.5     0.      74.4 FIXEDHF     0.800  0       0.0  0
1380    U% 1D1428        20.2     0.      25.2 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 4f
1381    U% 3E1428       -22.1     0.     -27.6 FIXEDHF     0.800  0       0.0  0
1382    U& 1D1428        20.3     0.      25.4 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 5f
1383    U& 3E1428       -21.2     0.     -26.5 FIXEDHF     0.800  0       0.0  0
1384    U' 1D1428        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 6f
1385    U' 3E1428       -18.5     0.     -23.1 FIXEDHF     0.800  0       0.0  0
1386    U( 1D1428        18.4     0.      23.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 7f
1387    U( 3E1428       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0
1388    U) 1D1428        17.6     0.      22.0 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 8f
1389    U) 3E1428       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0
1390    U* 1D1428        17.1     0.      21.4 FIXEDHF     0.800  0       0.0  0  s2 12d    -sp 9f
1391    U* 3E1428       -12.1     0.     -15.1 FIXEDHF     0.800  0       0.0  0
1392    VW 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 3d
1393    VX 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 4d
1394    VY 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 5d
1395    VZ 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 6d
1396    Va 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 7d
1397    Vb 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 8d
1398    Vc 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 9d
1399    Vd 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 10d
1400    Ve 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 11d
1401    Vf 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 12d
1402    Vg 1D1122     38456.4     0.   48070.5 FIXEDHF     0.800  0       0.0  0  s2 13d    -p2 13d
1403    Vx 1D1422      1298.3     0.    1622.9 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp2
1404    Vy 1D1427       368.2     0.     460.3 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 4p
1405    Vy 1E1427       306.8     0.     383.5 FIXEDHF     0.800  0       0.0  0
1406    Vz 1D1427       160.0     0.     200.0 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 5p
1407    Vz 1E1427       171.4     0.     214.2 FIXEDHF     0.800  0       0.0  0
1408    V! 1D1427        77.3     0.      96.6 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 6p
1409    V! 1E1427       114.7     0.     143.4 FIXEDHF     0.800  0       0.0  0
1410    V" 1D1427        38.2     0.      47.8 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 7p
1411    V" 1E1427        84.1     0.     105.1 FIXEDHF     0.800  0       0.0  0
1412    V# 1D1427        17.7     0.      22.1 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 8p
1413    V# 1E1427        65.2     0.      81.5 FIXEDHF     0.800  0       0.0  0
1414    V$ 1D1427         6.0     0.       7.5 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 9p
1415    V$ 1E1427        52.5     0.      65.6 FIXEDHF     0.800  0       0.0  0
1416    V% 1D1428        18.2     0.      22.8 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 4f
1417    V% 3E1428       -19.4     0.     -24.3 FIXEDHF     0.800  0       0.0  0
1418    V& 1D1428        18.3     0.      22.9 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 5f
1419    V& 3E1428       -18.6     0.     -23.3 FIXEDHF     0.800  0       0.0  0
1420    V' 1D1428        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 6f
1421    V' 3E1428       -16.2     0.     -20.3 FIXEDHF     0.800  0       0.0  0
1422    V( 1D1428        16.2     0.      20.2 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 7f
1423    V( 3E1428       -14.0     0.     -17.5 FIXEDHF     0.800  0       0.0  0
1424    V) 1D1428        15.3     0.      19.1 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 8f
1425    V) 3E1428       -12.2     0.     -15.2 FIXEDHF     0.800  0       0.0  0
1426    V* 1D1428        14.6     0.      18.2 FIXEDHF     0.800  0       0.0  0  s2 13d    -sp 9f
1427    V* 3E1428       -10.6     0.     -13.2 FIXEDHF     0.800  0       0.0  0
1428    WX 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 4d
1429    WX 2D2424      4037.7     0.    5047.1 FIXEDHF     0.800  0       0.0  0
1430    WX 1E2424      4891.6     0.    6114.5 FIXEDHF     0.800  0       0.0  0
1431    WX 3E2424      2864.7     0.    3580.9 FIXEDHF     0.800  0       0.0  0
1432    WY 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 5d
1433    WY 2D2424      2347.8     0.    2934.8 FIXEDHF     0.800  0       0.0  0
1434    WY 1E2424      3135.8     0.    3919.7 FIXEDHF     0.800  0       0.0  0
1435    WY 3E2424      1846.9     0.    2308.6 FIXEDHF     0.800  0       0.0  0
1436    WZ 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 6d
1437    WZ 2D2424      1567.1     0.    1958.9 FIXEDHF     0.800  0       0.0  0
1438    WZ 1E2424      2204.3     0.    2755.4 FIXEDHF     0.800  0       0.0  0
1439    WZ 3E2424      1301.7     0.    1627.1 FIXEDHF     0.800  0       0.0  0
1440    Wa 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 7d
1441    Wa 2D2424      1141.9     0.    1427.4 FIXEDHF     0.800  0       0.0  0
1442    Wa 1E2424      1657.6     0.    2072.0 FIXEDHF     0.800  0       0.0  0
1443    Wa 3E2424       980.2     0.    1225.3 FIXEDHF     0.800  0       0.0  0
1444    Wb 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 8d
1445    Wb 2D2424       881.0     0.    1101.2 FIXEDHF     0.800  0       0.0  0
1446    Wb 1E2424      1305.9     0.    1632.4 FIXEDHF     0.800  0       0.0  0
1447    Wb 3E2424       773.0     0.     966.2 FIXEDHF     0.800  0       0.0  0
1448    Wc 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 9d
1449    Wc 2D2424       707.2     0.     884.0 FIXEDHF     0.800  0       0.0  0
1450    Wc 1E2424      1064.1     0.    1330.1 FIXEDHF     0.800  0       0.0  0
1451    Wc 3E2424       630.2     0.     787.7 FIXEDHF     0.800  0       0.0  0
1452    Wd 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 10d
1453    Wd 2D2424       584.5     0.     730.6 FIXEDHF     0.800  0       0.0  0
1454    Wd 1E2424       889.1     0.    1111.4 FIXEDHF     0.800  0       0.0  0
1455    Wd 3E2424       526.7     0.     658.4 FIXEDHF     0.800  0       0.0  0
1456    We 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 11d
1457    We 2D2424       493.9     0.     617.4 FIXEDHF     0.800  0       0.0  0
1458    We 1E2424       757.7     0.     947.1 FIXEDHF     0.800  0       0.0  0
1459    We 3E2424       449.0     0.     561.3 FIXEDHF     0.800  0       0.0  0
1460    Wf 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 12d
1461    Wf 2D2424       424.7     0.     530.9 FIXEDHF     0.800  0       0.0  0
1462    Wf 1E2424       656.0     0.     820.0 FIXEDHF     0.800  0       0.0  0
1463    Wf 3E2424       388.8     0.     486.0 FIXEDHF     0.800  0       0.0  0
1464    Wg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 13d
1465    Wg 2D2424       370.5     0.     463.1 FIXEDHF     0.800  0       0.0  0
1466    Wg 1E2424       575.3     0.     719.1 FIXEDHF     0.800  0       0.0  0
1467    Wg 3E2424       341.0     0.     426.3 FIXEDHF     0.800  0       0.0  0
1468    Wm 2D2425       248.5     0.     310.6 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 5g
1469    Wm 3E2425        32.4     0.      40.5 FIXEDHF     0.800  0       0.0  0
1470    Wn 2D2425       240.8     0.     301.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 6g
1471    Wn 3E2425        34.2     0.      42.8 FIXEDHF     0.800  0       0.0  0
1472    Wo 2D2425       213.2     0.     266.5 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 7g
1473    Wo 3E2425        31.8     0.      39.8 FIXEDHF     0.800  0       0.0  0
1474    Wp 2D2425       185.8     0.     232.2 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 8g
1475    Wp 3E2425        28.6     0.      35.8 FIXEDHF     0.800  0       0.0  0
1476    Wq 2D2425       162.0     0.     202.5 FIXEDHF     0.800  0       0.0  0  p2 3d     -p2 9g
1477    Wq 3E2425        25.6     0.      32.0 FIXEDHF     0.800  0       0.0  0
1478    Wx 1D2412     15948.6     0.   19935.7 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp2
1479    Wx 2E2412      9917.0     0.   12396.2 FIXEDHF     0.800  0       0.0  0
1480    Wy 1D2417     -2282.8     0.   -2853.5 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 4p
1481    Wy 2E2417      1813.8     0.    2267.2 FIXEDHF     0.800  0       0.0  0
1482    Wz 1D2417      -638.6     0.    -798.3 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 5p
1483    Wz 2E2417       965.4     0.    1206.8 FIXEDHF     0.800  0       0.0  0
1484    W! 1D2417      -364.8     0.    -456.0 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 6p
1485    W! 2E2417       631.8     0.     789.8 FIXEDHF     0.800  0       0.0  0
1486    W" 1D2417      -249.3     0.    -311.6 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 7p
1487    W" 2E2417       457.3     0.     571.6 FIXEDHF     0.800  0       0.0  0
1488    W# 1D2417      -185.7     0.    -232.1 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 8p
1489    W# 2E2417       351.7     0.     439.6 FIXEDHF     0.800  0       0.0  0
1490    W$ 1D2417      -145.7     0.    -182.1 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 9p
1491    W$ 2E2417       281.8     0.     352.2 FIXEDHF     0.800  0       0.0  0
1492    W% 1D2418     -2618.3     0.   -3272.9 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 4f
1493    W% 2E2418      -319.1     0.    -398.9 FIXEDHF     0.800  0       0.0  0
1494    W& 1D2418     -2013.2     0.   -2516.5 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 5f
1495    W& 2E2418      -299.5     0.    -374.4 FIXEDHF     0.800  0       0.0  0
1496    W' 1D2418     -1578.2     0.   -1972.7 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 6f
1497    W' 2E2418      -259.0     0.    -323.8 FIXEDHF     0.800  0       0.0  0
1498    W( 1D2418     -1275.1     0.   -1593.9 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 7f
1499    W( 2E2418      -221.8     0.    -277.3 FIXEDHF     0.800  0       0.0  0
1500    W) 1D2418     -1057.0     0.   -1321.3 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 8f
1501    W) 2E2418      -191.0     0.    -238.7 FIXEDHF     0.800  0       0.0  0
1502    W* 1D2418      -894.5     0.   -1118.1 FIXEDHF     0.800  0       0.0  0  p2 3d     -sp 9f
1503    W* 2E2418      -166.0     0.    -207.5 FIXEDHF     0.800  0       0.0  0
1504    XY 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 5d
1505    XY 2D2424      1842.1     0.    2302.6 FIXEDHF     0.800  0       0.0  0
1506    XY 1E2424      2090.4     0.    2613.0 FIXEDHF     0.800  0       0.0  0
1507    XY 3E2424      1253.7     0.    1567.1 FIXEDHF     0.800  0       0.0  0
1508    XZ 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 6d
1509    XZ 2D2424      1261.3     0.    1576.6 FIXEDHF     0.800  0       0.0  0
1510    XZ 1E2424      1478.8     0.    1848.5 FIXEDHF     0.800  0       0.0  0
1511    XZ 3E2424       890.3     0.    1112.9 FIXEDHF     0.800  0       0.0  0
1512    Xa 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 7d
1513    Xa 2D2424       933.5     0.    1166.9 FIXEDHF     0.800  0       0.0  0
1514    Xa 1E2424      1116.2     0.    1395.3 FIXEDHF     0.800  0       0.0  0
1515    Xa 3E2424       673.6     0.     842.0 FIXEDHF     0.800  0       0.0  0
1516    Xb 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 8d
1517    Xb 2D2424       727.8     0.     909.8 FIXEDHF     0.800  0       0.0  0
1518    Xb 1E2424       881.6     0.    1102.0 FIXEDHF     0.800  0       0.0  0
1519    Xb 3E2424       532.7     0.     665.9 FIXEDHF     0.800  0       0.0  0
1520    Xc 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 9d
1521    Xc 2D2424       588.7     0.     735.9 FIXEDHF     0.800  0       0.0  0
1522    Xc 1E2424       719.5     0.     899.4 FIXEDHF     0.800  0       0.0  0
1523    Xc 3E2424       435.3     0.     544.1 FIXEDHF     0.800  0       0.0  0
1524    Xd 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 10d
1525    Xd 2D2424       489.4     0.     611.7 FIXEDHF     0.800  0       0.0  0
1526    Xd 1E2424       602.0     0.     752.5 FIXEDHF     0.800  0       0.0  0
1527    Xd 3E2424       364.4     0.     455.5 FIXEDHF     0.800  0       0.0  0
1528    Xe 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 11d
1529    Xe 2D2424       415.4     0.     519.2 FIXEDHF     0.800  0       0.0  0
1530    Xe 1E2424       513.5     0.     641.9 FIXEDHF     0.800  0       0.0  0
1531    Xe 3E2424       311.0     0.     388.8 FIXEDHF     0.800  0       0.0  0
1532    Xf 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 12d
1533    Xf 2D2424       358.4     0.     448.0 FIXEDHF     0.800  0       0.0  0
1534    Xf 1E2424       444.9     0.     556.1 FIXEDHF     0.800  0       0.0  0
1535    Xf 3E2424       269.6     0.     337.0 FIXEDHF     0.800  0       0.0  0
1536    Xg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 13d
1537    Xg 2D2424       313.5     0.     391.9 FIXEDHF     0.800  0       0.0  0
1538    Xg 1E2424       390.4     0.     488.0 FIXEDHF     0.800  0       0.0  0
1539    Xg 3E2424       236.6     0.     295.8 FIXEDHF     0.800  0       0.0  0
1540    Xm 2D2425      -157.4     0.    -196.8 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 5g
1541    Xm 3E2425        17.4     0.      21.7 FIXEDHF     0.800  0       0.0  0
1542    Xn 2D2425      -106.2     0.    -132.8 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 6g
1543    Xn 3E2425        18.5     0.      23.1 FIXEDHF     0.800  0       0.0  0
1544    Xo 2D2425       -74.6     0.     -93.3 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 7g
1545    Xo 3E2425        17.3     0.      21.6 FIXEDHF     0.800  0       0.0  0
1546    Xp 2D2425       -55.4     0.     -69.2 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 8g
1547    Xp 3E2425        15.6     0.      19.5 FIXEDHF     0.800  0       0.0  0
1548    Xq 2D2425       -43.0     0.     -53.7 FIXEDHF     0.800  0       0.0  0  p2 4d     -p2 9g
1549    Xq 3E2425        13.9     0.      17.4 FIXEDHF     0.800  0       0.0  0
1550    Xx 1D2412     10358.2     0.   12947.8 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp2
1551    Xx 2E2412      7005.0     0.    8756.2 FIXEDHF     0.800  0       0.0  0
1552    Xy 1D2417      2051.5     0.    2564.4 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 4p
1553    Xy 2E2417      1398.7     0.    1748.4 FIXEDHF     0.800  0       0.0  0
1554    Xz 1D2417      -479.6     0.    -599.5 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 5p
1555    Xz 2E2417       757.4     0.     946.8 FIXEDHF     0.800  0       0.0  0
1556    X! 1D2417      -144.0     0.    -180.0 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 6p
1557    X! 2E2417       499.7     0.     624.6 FIXEDHF     0.800  0       0.0  0
1558    X" 1D2417       -84.2     0.    -105.2 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 7p
1559    X" 2E2417       363.3     0.     454.1 FIXEDHF     0.800  0       0.0  0
1560    X# 1D2417       -59.1     0.     -73.9 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 8p
1561    X# 2E2417       280.2     0.     350.2 FIXEDHF     0.800  0       0.0  0
1562    X$ 1D2417       -45.2     0.     -56.5 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 9p
1563    X$ 2E2417       224.9     0.     281.1 FIXEDHF     0.800  0       0.0  0
1564    X% 1D2418       814.7     0.    1018.4 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 4f
1565    X% 2E2418      -205.8     0.    -257.2 FIXEDHF     0.800  0       0.0  0
1566    X& 1D2418      -136.5     0.    -170.6 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 5f
1567    X& 2E2418      -194.3     0.    -242.9 FIXEDHF     0.800  0       0.0  0
1568    X' 1D2418      -277.5     0.    -346.9 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 6f
1569    X' 2E2418      -168.6     0.    -210.8 FIXEDHF     0.800  0       0.0  0
1570    X( 1D2418      -289.8     0.    -362.3 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 7f
1571    X( 2E2418      -144.7     0.    -180.9 FIXEDHF     0.800  0       0.0  0
1572    X) 1D2418      -271.8     0.    -339.8 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 8f
1573    X) 2E2418      -124.7     0.    -155.9 FIXEDHF     0.800  0       0.0  0
1574    X* 1D2418      -247.4     0.    -309.2 FIXEDHF     0.800  0       0.0  0  p2 4d     -sp 9f
1575    X* 2E2418      -108.5     0.    -135.6 FIXEDHF     0.800  0       0.0  0
1576    YZ 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 6d
1577    YZ 2D2424       890.7     0.    1113.4 FIXEDHF     0.800  0       0.0  0
1578    YZ 1E2424       967.4     0.    1209.3 FIXEDHF     0.800  0       0.0  0
1579    YZ 3E2424       587.9     0.     734.9 FIXEDHF     0.800  0       0.0  0
1580    Ya 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 7d
1581    Ya 2D2424       664.4     0.     830.5 FIXEDHF     0.800  0       0.0  0
1582    Ya 1E2424       731.4     0.     914.3 FIXEDHF     0.800  0       0.0  0
1583    Ya 3E2424       445.7     0.     557.1 FIXEDHF     0.800  0       0.0  0
1584    Yb 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 8d
1585    Yb 2D2424       520.7     0.     650.9 FIXEDHF     0.800  0       0.0  0
1586    Yb 1E2424       578.3     0.     722.9 FIXEDHF     0.800  0       0.0  0
1587    Yb 3E2424       353.0     0.     441.3 FIXEDHF     0.800  0       0.0  0
1588    Yc 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 9d
1589    Yc 2D2424       422.8     0.     528.5 FIXEDHF     0.800  0       0.0  0
1590    Yc 1E2424       472.3     0.     590.4 FIXEDHF     0.800  0       0.0  0
1591    Yc 3E2424       288.7     0.     360.9 FIXEDHF     0.800  0       0.0  0
1592    Yd 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 10d
1593    Yd 2D2424       352.3     0.     440.4 FIXEDHF     0.800  0       0.0  0
1594    Yd 1E2424       395.4     0.     494.3 FIXEDHF     0.800  0       0.0  0
1595    Yd 3E2424       241.9     0.     302.4 FIXEDHF     0.800  0       0.0  0
1596    Ye 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 11d
1597    Ye 2D2424       299.7     0.     374.6 FIXEDHF     0.800  0       0.0  0
1598    Ye 1E2424       337.4     0.     421.8 FIXEDHF     0.800  0       0.0  0
1599    Ye 3E2424       206.6     0.     258.2 FIXEDHF     0.800  0       0.0  0
1600    Yf 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 12d
1601    Yf 2D2424       259.1     0.     323.9 FIXEDHF     0.800  0       0.0  0
1602    Yf 1E2424       292.4     0.     365.5 FIXEDHF     0.800  0       0.0  0
1603    Yf 3E2424       179.1     0.     223.9 FIXEDHF     0.800  0       0.0  0
1604    Yg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 13d
1605    Yg 2D2424       227.0     0.     283.7 FIXEDHF     0.800  0       0.0  0
1606    Yg 1E2424       256.7     0.     320.9 FIXEDHF     0.800  0       0.0  0
1607    Yg 3E2424       157.3     0.     196.6 FIXEDHF     0.800  0       0.0  0
1608    Ym 2D2425       -11.4     0.     -14.3 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 5g
1609    Ym 3E2425        10.2     0.      12.7 FIXEDHF     0.800  0       0.0  0
1610    Yn 2D2425       -53.5     0.     -66.9 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 6g
1611    Yn 3E2425        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0
1612    Yo 2D2425       -51.8     0.     -64.7 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 7g
1613    Yo 3E2425        10.2     0.      12.7 FIXEDHF     0.800  0       0.0  0
1614    Yp 2D2425       -45.0     0.     -56.3 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 8g
1615    Yp 3E2425         9.2     0.      11.5 FIXEDHF     0.800  0       0.0  0
1616    Yq 2D2425       -38.6     0.     -48.3 FIXEDHF     0.800  0       0.0  0  p2 5d     -p2 9g
1617    Yq 3E2425         8.2     0.      10.3 FIXEDHF     0.800  0       0.0  0
1618    Yx 1D2412      6687.5     0.    8359.4 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp2
1619    Yx 2E2412      4707.3     0.    5884.1 FIXEDHF     0.800  0       0.0  0
1620    Yy 1D2417      1877.8     0.    2347.2 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 4p
1621    Yy 2E2417       976.0     0.    1220.0 FIXEDHF     0.800  0       0.0  0
1622    Yz 1D2417       690.5     0.     863.1 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 5p
1623    Yz 2E2417       532.6     0.     665.7 FIXEDHF     0.800  0       0.0  0
1624    Y! 1D2417      -127.3     0.    -159.1 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 6p
1625    Y! 2E2417       352.6     0.     440.7 FIXEDHF     0.800  0       0.0  0
1626    Y" 1D2417       -22.8     0.     -28.5 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 7p
1627    Y" 2E2417       256.8     0.     321.0 FIXEDHF     0.800  0       0.0  0
1628    Y# 1D2417        -8.3     0.     -10.4 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 8p
1629    Y# 2E2417       198.3     0.     247.9 FIXEDHF     0.800  0       0.0  0
1630    Y$ 1D2417        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 9p
1631    Y$ 2E2417       159.3     0.     199.1 FIXEDHF     0.800  0       0.0  0
1632    Y% 1D2418       214.2     0.     267.7 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 4f
1633    Y% 2E2418      -132.6     0.    -165.8 FIXEDHF     0.800  0       0.0  0
1634    Y& 1D2418       511.3     0.     639.1 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 5f
1635    Y& 2E2418      -125.6     0.    -157.0 FIXEDHF     0.800  0       0.0  0
1636    Y' 1D2418       172.0     0.     215.0 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 6f
1637    Y' 2E2418      -109.1     0.    -136.4 FIXEDHF     0.800  0       0.0  0
1638    Y( 1D2418        62.6     0.      78.3 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 7f
1639    Y( 2E2418       -93.8     0.    -117.2 FIXEDHF     0.800  0       0.0  0
1640    Y) 1D2418        16.4     0.      20.5 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 8f
1641    Y) 2E2418       -80.9     0.    -101.1 FIXEDHF     0.800  0       0.0  0
1642    Y* 1D2418        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0  p2 5d     -sp 9f
1643    Y* 2E2418       -70.4     0.     -88.0 FIXEDHF     0.800  0       0.0  0
1644    Za 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 7d
1645    Za 2D2424       491.5     0.     614.4 FIXEDHF     0.800  0       0.0  0
1646    Za 1E2424       520.1     0.     650.1 FIXEDHF     0.800  0       0.0  0
1647    Za 3E2424       318.6     0.     398.2 FIXEDHF     0.800  0       0.0  0
1648    Zb 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 8d
1649    Zb 2D2424       386.3     0.     482.9 FIXEDHF     0.800  0       0.0  0
1650    Zb 1E2424       411.4     0.     514.3 FIXEDHF     0.800  0       0.0  0
1651    Zb 3E2424       252.5     0.     315.6 FIXEDHF     0.800  0       0.0  0
1652    Zc 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 9d
1653    Zc 2D2424       314.3     0.     392.9 FIXEDHF     0.800  0       0.0  0
1654    Zc 1E2424       336.2     0.     420.2 FIXEDHF     0.800  0       0.0  0
1655    Zc 3E2424       206.6     0.     258.2 FIXEDHF     0.800  0       0.0  0
1656    Zd 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 10d
1657    Zd 2D2424       262.4     0.     328.0 FIXEDHF     0.800  0       0.0  0
1658    Zd 1E2424       281.5     0.     351.9 FIXEDHF     0.800  0       0.0  0
1659    Zd 3E2424       173.2     0.     216.5 FIXEDHF     0.800  0       0.0  0
1660    Ze 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 11d
1661    Ze 2D2424       223.4     0.     279.3 FIXEDHF     0.800  0       0.0  0
1662    Ze 1E2424       240.2     0.     300.3 FIXEDHF     0.800  0       0.0  0
1663    Ze 3E2424       147.9     0.     184.9 FIXEDHF     0.800  0       0.0  0
1664    Zf 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 12d
1665    Zf 2D2424       193.4     0.     241.7 FIXEDHF     0.800  0       0.0  0
1666    Zf 1E2424       208.2     0.     260.3 FIXEDHF     0.800  0       0.0  0
1667    Zf 3E2424       128.3     0.     160.4 FIXEDHF     0.800  0       0.0  0
1668    Zg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 13d
1669    Zg 2D2424       169.5     0.     211.9 FIXEDHF     0.800  0       0.0  0
1670    Zg 1E2424       182.8     0.     228.5 FIXEDHF     0.800  0       0.0  0
1671    Zg 3E2424       112.6     0.     140.8 FIXEDHF     0.800  0       0.0  0
1672    Zm 2D2425       -12.1     0.     -15.1 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 5g
1673    Zm 3E2425         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0
1674    Zn 2D2425        -9.8     0.     -12.2 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 6g
1675    Zn 3E2425         7.3     0.       9.1 FIXEDHF     0.800  0       0.0  0
1676    Zo 2D2425       -22.4     0.     -28.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 7g
1677    Zo 3E2425         6.8     0.       8.5 FIXEDHF     0.800  0       0.0  0
1678    Zp 2D2425       -23.8     0.     -29.7 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 8g
1679    Zp 3E2425         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0
1680    Zq 2D2425       -22.3     0.     -27.9 FIXEDHF     0.800  0       0.0  0  p2 6d     -p2 9g
1681    Zq 3E2425         5.5     0.       6.9 FIXEDHF     0.800  0       0.0  0
1682    Zx 1D2412      4718.9     0.    5898.6 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp2
1683    Zx 2E2412      3394.6     0.    4243.3 FIXEDHF     0.800  0       0.0  0
1684    Zy 1D2417      1494.5     0.    1868.1 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 4p
1685    Zy 2E2417       717.6     0.     897.0 FIXEDHF     0.800  0       0.0  0
1686    Zz 1D2417       681.7     0.     852.1 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 5p
1687    Zz 2E2417       393.0     0.     491.3 FIXEDHF     0.800  0       0.0  0
1688    Z! 1D2417       298.6     0.     373.2 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 6p
1689    Z! 2E2417       260.6     0.     325.8 FIXEDHF     0.800  0       0.0  0
1690    Z" 1D2417       -40.4     0.     -50.5 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 7p
1691    Z" 2E2417       190.1     0.     237.6 FIXEDHF     0.800  0       0.0  0
1692    Z# 1D2417         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 8p
1693    Z# 2E2417       146.9     0.     183.6 FIXEDHF     0.800  0       0.0  0
1694    Z$ 1D2417         8.2     0.      10.2 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 9p
1695    Z$ 2E2417       118.0     0.     147.5 FIXEDHF     0.800  0       0.0  0
1696    Z% 1D2418       136.8     0.     171.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 4f
1697    Z% 2E2418       -93.6     0.    -117.0 FIXEDHF     0.800  0       0.0  0
1698    Z& 1D2418       164.3     0.     205.4 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 5f
1699    Z& 2E2418       -88.7     0.    -110.9 FIXEDHF     0.800  0       0.0  0
1700    Z' 1D2418       307.7     0.     384.6 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 6f
1701    Z' 2E2418       -77.2     0.     -96.5 FIXEDHF     0.800  0       0.0  0
1702    Z( 1D2418       163.2     0.     204.0 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 7f
1703    Z( 2E2418       -66.3     0.     -82.9 FIXEDHF     0.800  0       0.0  0
1704    Z) 1D2418       101.2     0.     126.5 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 8f
1705    Z) 2E2418       -57.2     0.     -71.5 FIXEDHF     0.800  0       0.0  0
1706    Z* 1D2418        67.8     0.      84.8 FIXEDHF     0.800  0       0.0  0  p2 6d     -sp 9f
1707    Z* 2E2418       -49.8     0.     -62.3 FIXEDHF     0.800  0       0.0  0
1708    ab 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 8d
1709    ab 2D2424       299.4     0.     374.3 FIXEDHF     0.800  0       0.0  0
1710    ab 1E2424       311.6     0.     389.5 FIXEDHF     0.800  0       0.0  0
1711    ab 3E2424       191.8     0.     239.8 FIXEDHF     0.800  0       0.0  0
1712    ac 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 9d
1713    ac 2D2424       243.9     0.     304.9 FIXEDHF     0.800  0       0.0  0
1714    ac 1E2424       254.6     0.     318.3 FIXEDHF     0.800  0       0.0  0
1715    ac 3E2424       157.0     0.     196.3 FIXEDHF     0.800  0       0.0  0
1716    ad 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 10d
1717    ad 2D2424       203.8     0.     254.7 FIXEDHF     0.800  0       0.0  0
1718    ad 1E2424       213.3     0.     266.6 FIXEDHF     0.800  0       0.0  0
1719    ad 3E2424       131.7     0.     164.6 FIXEDHF     0.800  0       0.0  0
1720    ae 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 11d
1721    ae 2D2424       173.7     0.     217.1 FIXEDHF     0.800  0       0.0  0
1722    ae 1E2424       182.1     0.     227.6 FIXEDHF     0.800  0       0.0  0
1723    ae 3E2424       112.5     0.     140.6 FIXEDHF     0.800  0       0.0  0
1724    af 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 12d
1725    af 2D2424       150.4     0.     188.0 FIXEDHF     0.800  0       0.0  0
1726    af 1E2424       157.8     0.     197.3 FIXEDHF     0.800  0       0.0  0
1727    af 3E2424        97.5     0.     121.9 FIXEDHF     0.800  0       0.0  0
1728    ag 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 13d
1729    ag 2D2424       131.9     0.     164.9 FIXEDHF     0.800  0       0.0  0
1730    ag 1E2424       138.6     0.     173.2 FIXEDHF     0.800  0       0.0  0
1731    ag 3E2424        85.7     0.     107.1 FIXEDHF     0.800  0       0.0  0
1732    am 2D2425        -9.2     0.     -11.5 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 5g
1733    am 3E2425         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0
1734    an 2D2425        -9.8     0.     -12.3 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 6g
1735    an 3E2425         5.3     0.       6.6 FIXEDHF     0.800  0       0.0  0
1736    ao 2D2425        -7.5     0.      -9.4 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 7g
1737    ao 3E2425         5.0     0.       6.2 FIXEDHF     0.800  0       0.0  0
1738    ap 2D2425       -11.7     0.     -14.6 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 8g
1739    ap 3E2425         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0
1740    aq 2D2425       -12.4     0.     -15.5 FIXEDHF     0.800  0       0.0  0  p2 7d     -p2 9g
1741    aq 3E2425         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0
1742    ax 1D2412      3556.7     0.    4445.9 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp2
1743    ax 2E2412      2592.6     0.    3240.7 FIXEDHF     0.800  0       0.0  0
1744    ay 1D2417      1196.6     0.    1495.8 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 4p
1745    ay 2E2417       554.3     0.     692.9 FIXEDHF     0.800  0       0.0  0
1746    az 1D2417       587.3     0.     734.1 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 5p
1747    az 2E2417       304.3     0.     380.4 FIXEDHF     0.800  0       0.0  0
1748    a! 1D2417       308.3     0.     385.4 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 6p
1749    a! 2E2417       202.0     0.     252.5 FIXEDHF     0.800  0       0.0  0
1750    a" 1D2417       150.5     0.     188.1 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 7p
1751    a" 2E2417       147.4     0.     184.3 FIXEDHF     0.800  0       0.0  0
1752    a# 1D2417       -13.8     0.     -17.3 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 8p
1753    a# 2E2417       113.9     0.     142.4 FIXEDHF     0.800  0       0.0  0
1754    a$ 1D2417         8.8     0.      11.0 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 9p
1755    a$ 2E2417        91.6     0.     114.5 FIXEDHF     0.800  0       0.0  0
1756    a% 1D2418       100.2     0.     125.3 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 4f
1757    a% 2E2418       -70.6     0.     -88.2 FIXEDHF     0.800  0       0.0  0
1758    a& 1D2418       110.9     0.     138.6 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 5f
1759    a& 2E2418       -67.0     0.     -83.7 FIXEDHF     0.800  0       0.0  0
1760    a' 1D2418       117.4     0.     146.7 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 6f
1761    a' 2E2418       -58.2     0.     -72.8 FIXEDHF     0.800  0       0.0  0
1762    a( 1D2418       194.0     0.     242.5 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 7f
1763    a( 2E2418       -50.1     0.     -62.6 FIXEDHF     0.800  0       0.0  0
1764    a) 1D2418       123.3     0.     154.1 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 8f
1765    a) 2E2418       -43.2     0.     -54.0 FIXEDHF     0.800  0       0.0  0
1766    a* 1D2418        87.8     0.     109.8 FIXEDHF     0.800  0       0.0  0  p2 7d     -sp 9f
1767    a* 2E2418       -37.6     0.     -47.0 FIXEDHF     0.800  0       0.0  0
1768    bc 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 9d
1769    bc 2D2424       195.9     0.     244.9 FIXEDHF     0.800  0       0.0  0
1770    bc 1E2424       201.6     0.     252.0 FIXEDHF     0.800  0       0.0  0
1771    bc 3E2424       124.6     0.     155.7 FIXEDHF     0.800  0       0.0  0
1772    bd 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 10d
1773    bd 2D2424       163.8     0.     204.8 FIXEDHF     0.800  0       0.0  0
1774    bd 1E2424       168.9     0.     211.1 FIXEDHF     0.800  0       0.0  0
1775    bd 3E2424       104.5     0.     130.6 FIXEDHF     0.800  0       0.0  0
1776    be 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 11d
1777    be 2D2424       139.7     0.     174.6 FIXEDHF     0.800  0       0.0  0
1778    be 1E2424       144.2     0.     180.2 FIXEDHF     0.800  0       0.0  0
1779    be 3E2424        89.3     0.     111.6 FIXEDHF     0.800  0       0.0  0
1780    bf 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 12d
1781    bf 2D2424       121.0     0.     151.2 FIXEDHF     0.800  0       0.0  0
1782    bf 1E2424       125.0     0.     156.2 FIXEDHF     0.800  0       0.0  0
1783    bf 3E2424        77.4     0.      96.8 FIXEDHF     0.800  0       0.0  0
1784    bg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 13d
1785    bg 2D2424       106.2     0.     132.7 FIXEDHF     0.800  0       0.0  0
1786    bg 1E2424       109.7     0.     137.1 FIXEDHF     0.800  0       0.0  0
1787    bg 3E2424        68.0     0.      85.0 FIXEDHF     0.800  0       0.0  0
1788    bm 2D2425        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 5g
1789    bm 3E2425         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0
1790    bn 2D2425        -7.8     0.      -9.8 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 6g
1791    bn 3E2425         4.1     0.       5.1 FIXEDHF     0.800  0       0.0  0
1792    bo 2D2425        -7.3     0.      -9.1 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 7g
1793    bo 3E2425         3.8     0.       4.8 FIXEDHF     0.800  0       0.0  0
1794    bp 2D2425        -5.7     0.      -7.1 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 8g
1795    bp 3E2425         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0
1796    bq 2D2425        -7.0     0.      -8.8 FIXEDHF     0.800  0       0.0  0  p2 8d     -p2 9g
1797    bq 3E2425         3.1     0.       3.9 FIXEDHF     0.800  0       0.0  0
1798    bx 1D2412      2806.5     0.    3508.1 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp2
1799    bx 2E2412      2063.7     0.    2579.6 FIXEDHF     0.800  0       0.0  0
1800    by 1D2417       979.1     0.    1223.9 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 4p
1801    by 2E2417       444.5     0.     555.6 FIXEDHF     0.800  0       0.0  0
1802    bz 1D2417       498.3     0.     622.9 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 5p
1803    bz 2E2417       244.4     0.     305.5 FIXEDHF     0.800  0       0.0  0
1804    b! 1D2417       278.8     0.     348.5 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 6p
1805    b! 2E2417       162.3     0.     202.9 FIXEDHF     0.800  0       0.0  0
1806    b" 1D2417       160.1     0.     200.1 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 7p
1807    b" 2E2417       118.5     0.     148.1 FIXEDHF     0.800  0       0.0  0
1808    b# 1D2417        84.3     0.     105.4 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 8p
1809    b# 2E2417        91.6     0.     114.5 FIXEDHF     0.800  0       0.0  0
1810    b$ 1D2417        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 9p
1811    b$ 2E2417        73.7     0.      92.1 FIXEDHF     0.800  0       0.0  0
1812    b% 1D2418        78.4     0.      98.0 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 4f
1813    b% 2E2418       -55.7     0.     -69.6 FIXEDHF     0.800  0       0.0  0
1814    b& 1D2418        83.8     0.     104.8 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 5f
1815    b& 2E2418       -52.9     0.     -66.1 FIXEDHF     0.800  0       0.0  0
1816    b' 1D2418        83.3     0.     104.1 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 6f
1817    b' 2E2418       -46.0     0.     -57.5 FIXEDHF     0.800  0       0.0  0
1818    b( 1D2418        84.3     0.     105.4 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 7f
1819    b( 2E2418       -39.5     0.     -49.4 FIXEDHF     0.800  0       0.0  0
1820    b) 1D2418       128.7     0.     160.9 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 8f
1821    b) 2E2418       -34.2     0.     -42.7 FIXEDHF     0.800  0       0.0  0
1822    b* 1D2418        90.4     0.     113.0 FIXEDHF     0.800  0       0.0  0  p2 8d     -sp 9f
1823    b* 2E2418       -29.8     0.     -37.2 FIXEDHF     0.800  0       0.0  0
1824    cd 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 10d
1825    cd 2D2424       135.3     0.     169.1 FIXEDHF     0.800  0       0.0  0
1826    cd 1E2424       138.1     0.     172.6 FIXEDHF     0.800  0       0.0  0
1827    cd 3E2424        85.5     0.     106.9 FIXEDHF     0.800  0       0.0  0
1828    ce 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 11d
1829    ce 2D2424       115.4     0.     144.2 FIXEDHF     0.800  0       0.0  0
1830    ce 1E2424       117.8     0.     147.3 FIXEDHF     0.800  0       0.0  0
1831    ce 3E2424        73.1     0.      91.4 FIXEDHF     0.800  0       0.0  0
1832    cf 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 12d
1833    cf 2D2424       100.0     0.     125.0 FIXEDHF     0.800  0       0.0  0
1834    cf 1E2424       102.2     0.     127.7 FIXEDHF     0.800  0       0.0  0
1835    cf 3E2424        63.4     0.      79.3 FIXEDHF     0.800  0       0.0  0
1836    cg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 13d
1837    cg 2D2424        87.8     0.     109.7 FIXEDHF     0.800  0       0.0  0
1838    cg 1E2424        89.8     0.     112.2 FIXEDHF     0.800  0       0.0  0
1839    cg 3E2424        55.7     0.      69.6 FIXEDHF     0.800  0       0.0  0
1840    cm 2D2425        -5.9     0.      -7.4 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 5g
1841    cm 3E2425         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0
1842    cn 2D2425        -6.4     0.      -8.0 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 6g
1843    cn 3E2425         3.3     0.       4.1 FIXEDHF     0.800  0       0.0  0
1844    co 2D2425        -6.1     0.      -7.6 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 7g
1845    co 3E2425         3.0     0.       3.8 FIXEDHF     0.800  0       0.0  0
1846    cp 2D2425        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 8g
1847    cp 3E2425         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0
1848    cq 2D2425        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0  p2 9d     -p2 9g
1849    cq 3E2425         2.5     0.       3.1 FIXEDHF     0.800  0       0.0  0
1850    cx 1D2412      2289.1     0.    2861.4 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp2
1851    cx 2E2412      1693.5     0.    2116.9 FIXEDHF     0.800  0       0.0  0
1852    cy 1D2417       818.1     0.    1022.6 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 4p
1853    cy 2E2417       366.6     0.     458.3 FIXEDHF     0.800  0       0.0  0
1854    cz 1D2417       425.4     0.     531.8 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 5p
1855    cz 2E2417       201.8     0.     252.2 FIXEDHF     0.800  0       0.0  0
1856    c! 1D2417       245.8     0.     307.2 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 6p
1857    c! 2E2417       134.2     0.     167.7 FIXEDHF     0.800  0       0.0  0
1858    c" 1D2417       149.7     0.     187.1 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 7p
1859    c" 2E2417        97.9     0.     122.4 FIXEDHF     0.800  0       0.0  0
1860    c# 1D2417        91.6     0.     114.5 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 8p
1861    c# 2E2417        75.7     0.      94.6 FIXEDHF     0.800  0       0.0  0
1862    c$ 1D2417        51.1     0.      63.9 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 9p
1863    c$ 2E2417        60.9     0.      76.1 FIXEDHF     0.800  0       0.0  0
1864    c% 1D2418        63.8     0.      79.8 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 4f
1865    c% 2E2418       -45.4     0.     -56.8 FIXEDHF     0.800  0       0.0  0
1866    c& 1D2418        67.0     0.      83.8 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 5f
1867    c& 2E2418       -43.1     0.     -53.9 FIXEDHF     0.800  0       0.0  0
1868    c' 1D2418        64.8     0.      81.0 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 6f
1869    c' 2E2418       -37.5     0.     -46.9 FIXEDHF     0.800  0       0.0  0
1870    c( 1D2418        62.4     0.      78.0 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 7f
1871    c( 2E2418       -32.2     0.     -40.3 FIXEDHF     0.800  0       0.0  0
1872    c) 1D2418        61.9     0.      77.4 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 8f
1873    c) 2E2418       -27.8     0.     -34.8 FIXEDHF     0.800  0       0.0  0
1874    c* 1D2418        89.3     0.     111.6 FIXEDHF     0.800  0       0.0  0  p2 9d     -sp 9f
1875    c* 2E2418       -24.2     0.     -30.3 FIXEDHF     0.800  0       0.0  0
1876    de 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 11d
1877    de 2D2424        97.4     0.     121.7 FIXEDHF     0.800  0       0.0  0
1878    de 1E2424        98.7     0.     123.4 FIXEDHF     0.800  0       0.0  0
1879    de 3E2424        61.3     0.      76.6 FIXEDHF     0.800  0       0.0  0
1880    df 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 12d
1881    df 2D2424        84.4     0.     105.5 FIXEDHF     0.800  0       0.0  0
1882    df 1E2424        85.6     0.     107.0 FIXEDHF     0.800  0       0.0  0
1883    df 3E2424        53.2     0.      66.5 FIXEDHF     0.800  0       0.0  0
1884    dg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 13d
1885    dg 2D2424        74.1     0.      92.6 FIXEDHF     0.800  0       0.0  0
1886    dg 1E2424        75.2     0.      94.0 FIXEDHF     0.800  0       0.0  0
1887    dg 3E2424        46.7     0.      58.4 FIXEDHF     0.800  0       0.0  0
1888    dm 2D2425        -5.0     0.      -6.2 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 5g
1889    dm 3E2425         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0
1890    dn 2D2425        -5.4     0.      -6.7 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 6g
1891    dn 3E2425         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0
1892    do 2D2425        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 7g
1893    do 3E2425         2.6     0.       3.2 FIXEDHF     0.800  0       0.0  0
1894    dp 2D2425        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 8g
1895    dp 3E2425         2.3     0.       2.9 FIXEDHF     0.800  0       0.0  0
1896    dq 2D2425        -4.1     0.      -5.1 FIXEDHF     0.800  0       0.0  0  p2 10d    -p2 9g
1897    dq 3E2425         2.1     0.       2.6 FIXEDHF     0.800  0       0.0  0
1898    dx 1D2412      1914.3     0.    2392.9 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp2
1899    dx 2E2412      1422.6     0.    1778.3 FIXEDHF     0.800  0       0.0  0
1900    dy 1D2417       696.0     0.     870.0 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 4p
1901    dy 2E2417       309.2     0.     386.5 FIXEDHF     0.800  0       0.0  0
1902    dz 1D2417       367.1     0.     458.9 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 5p
1903    dz 2E2417       170.3     0.     212.9 FIXEDHF     0.800  0       0.0  0
1904    d! 1D2417       216.2     0.     270.2 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 6p
1905    d! 2E2417       113.2     0.     141.5 FIXEDHF     0.800  0       0.0  0
1906    d" 1D2417       135.7     0.     169.6 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 7p
1907    d" 2E2417        82.6     0.     103.3 FIXEDHF     0.800  0       0.0  0
1908    d# 1D2417        87.8     0.     109.7 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 8p
1909    d# 2E2417        63.9     0.      79.9 FIXEDHF     0.800  0       0.0  0
1910    d$ 1D2417        56.3     0.      70.4 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 9p
1911    d$ 2E2417        51.4     0.      64.3 FIXEDHF     0.800  0       0.0  0
1912    d% 1D2418        53.4     0.      66.8 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 4f
1913    d% 2E2418       -38.0     0.     -47.5 FIXEDHF     0.800  0       0.0  0
1914    d& 1D2418        55.5     0.      69.4 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 5f
1915    d& 2E2418       -36.1     0.     -45.1 FIXEDHF     0.800  0       0.0  0
1916    d' 1D2418        52.9     0.      66.1 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 6f
1917    d' 2E2418       -31.4     0.     -39.3 FIXEDHF     0.800  0       0.0  0
1918    d( 1D2418        49.8     0.      62.2 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 7f
1919    d( 2E2418       -27.0     0.     -33.8 FIXEDHF     0.800  0       0.0  0
1920    d) 1D2418        47.4     0.      59.2 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 8f
1921    d) 2E2418       -23.3     0.     -29.1 FIXEDHF     0.800  0       0.0  0
1922    d* 1D2418        46.5     0.      58.1 FIXEDHF     0.800  0       0.0  0  p2 10d    -sp 9f
1923    d* 2E2418       -20.3     0.     -25.4 FIXEDHF     0.800  0       0.0  0
1924    ef 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 11d    -p2 12d
1925    ef 2D2424        72.4     0.      90.5 FIXEDHF     0.800  0       0.0  0
1926    ef 1E2424        73.1     0.      91.4 FIXEDHF     0.800  0       0.0  0
1927    ef 3E2424        45.4     0.      56.8 FIXEDHF     0.800  0       0.0  0
1928    eg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 11d    -p2 13d
1929    eg 2D2424        63.6     0.      79.5 FIXEDHF     0.800  0       0.0  0
1930    eg 1E2424        64.2     0.      80.2 FIXEDHF     0.800  0       0.0  0
1931    eg 3E2424        39.9     0.      49.9 FIXEDHF     0.800  0       0.0  0
1932    em 2D2425        -4.2     0.      -5.3 FIXEDHF     0.800  0       0.0  0  p2 11d    -p2 5g
1933    em 3E2425         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0
1934    en 2D2425        -4.6     0.      -5.7 FIXEDHF     0.800  0       0.0  0  p2 11d    -p2 6g
1935    en 3E2425         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0
1936    eo 2D2425        -4.3     0.      -5.4 FIXEDHF     0.800  0       0.0  0  p2 11d    -p2 7g
1937    eo 3E2425         2.2     0.       2.7 FIXEDHF     0.800  0       0.0  0
1938    ep 2D2425        -3.9     0.      -4.9 FIXEDHF     0.800  0       0.0  0  p2 11d    -p2 8g
1939    ep 3E2425         1.9     0.       2.4 FIXEDHF     0.800  0       0.0  0
1940    eq 2D2425        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0  p2 11d    -p2 9g
1941    eq 3E2425         1.8     0.       2.2 FIXEDHF     0.800  0       0.0  0
1942    ex 1D2412      1632.4     0.    2040.5 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp2
1943    ex 2E2412      1217.4     0.    1521.7 FIXEDHF     0.800  0       0.0  0
1944    ey 1D2417       601.2     0.     751.5 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 4p
1945    ey 2E2417       265.3     0.     331.6 FIXEDHF     0.800  0       0.0  0
1946    ez 1D2417       320.2     0.     400.3 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 5p
1947    ez 2E2417       146.2     0.     182.8 FIXEDHF     0.800  0       0.0  0
1948    e! 1D2417       191.0     0.     238.7 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 6p
1949    e! 2E2417        97.2     0.     121.5 FIXEDHF     0.800  0       0.0  0
1950    e" 1D2417       122.0     0.     152.5 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 7p
1951    e" 2E2417        71.0     0.      88.8 FIXEDHF     0.800  0       0.0  0
1952    e# 1D2417        81.2     0.     101.5 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 8p
1953    e# 2E2417        55.0     0.      68.7 FIXEDHF     0.800  0       0.0  0
1954    e$ 1D2417        55.0     0.      68.7 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 9p
1955    e$ 2E2417        44.2     0.      55.2 FIXEDHF     0.800  0       0.0  0
1956    e% 1D2418        45.7     0.      57.1 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 4f
1957    e% 2E2418       -32.4     0.     -40.5 FIXEDHF     0.800  0       0.0  0
1958    e& 1D2418        47.1     0.      58.9 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 5f
1959    e& 2E2418       -30.8     0.     -38.5 FIXEDHF     0.800  0       0.0  0
1960    e' 1D2418        44.4     0.      55.5 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 6f
1961    e' 2E2418       -26.8     0.     -33.5 FIXEDHF     0.800  0       0.0  0
1962    e( 1D2418        41.3     0.      51.6 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 7f
1963    e( 2E2418       -23.0     0.     -28.8 FIXEDHF     0.800  0       0.0  0
1964    e) 1D2418        38.6     0.      48.2 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 8f
1965    e) 2E2418       -19.9     0.     -24.9 FIXEDHF     0.800  0       0.0  0
1966    e* 1D2418        36.6     0.      45.7 FIXEDHF     0.800  0       0.0  0  p2 11d    -sp 9f
1967    e* 2E2418       -17.4     0.     -21.7 FIXEDHF     0.800  0       0.0  0
1968    fg 0D2424         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 12d    -p2 13d
1969    fg 2D2424        55.4     0.      69.2 FIXEDHF     0.800  0       0.0  0
1970    fg 1E2424        55.7     0.      69.6 FIXEDHF     0.800  0       0.0  0
1971    fg 3E2424        34.6     0.      43.3 FIXEDHF     0.800  0       0.0  0
1972    fm 2D2425        -3.7     0.      -4.6 FIXEDHF     0.800  0       0.0  0  p2 12d    -p2 5g
1973    fm 3E2425         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0
1974    fn 2D2425        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0  p2 12d    -p2 6g
1975    fn 3E2425         2.0     0.       2.5 FIXEDHF     0.800  0       0.0  0
1976    fo 2D2425        -3.8     0.      -4.7 FIXEDHF     0.800  0       0.0  0  p2 12d    -p2 7g
1977    fo 3E2425         1.8     0.       2.3 FIXEDHF     0.800  0       0.0  0
1978    fp 2D2425        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0  p2 12d    -p2 8g
1979    fp 3E2425         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0
1980    fq 2D2425        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0  p2 12d    -p2 9g
1981    fq 3E2425         1.5     0.       1.9 FIXEDHF     0.800  0       0.0  0
1982    fx 1D2412      1413.9     0.    1767.4 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp2
1983    fx 2E2412      1057.2     0.    1321.5 FIXEDHF     0.800  0       0.0  0
1984    fy 1D2417       525.9     0.     657.4 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 4p
1985    fy 2E2417       230.9     0.     288.6 FIXEDHF     0.800  0       0.0  0
1986    fz 1D2417       282.2     0.     352.8 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 5p
1987    fz 2E2417       127.3     0.     159.1 FIXEDHF     0.800  0       0.0  0
1988    f! 1D2417       169.8     0.     212.3 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 6p
1989    f! 2E2417        84.7     0.     105.9 FIXEDHF     0.800  0       0.0  0
1990    f" 1D2417       109.8     0.     137.2 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 7p
1991    f" 2E2417        61.8     0.      77.3 FIXEDHF     0.800  0       0.0  0
1992    f# 1D2417        74.3     0.      92.9 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 8p
1993    f# 2E2417        47.8     0.      59.8 FIXEDHF     0.800  0       0.0  0
1994    f$ 1D2417        51.7     0.      64.6 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 9p
1995    f$ 2E2417        38.5     0.      48.1 FIXEDHF     0.800  0       0.0  0
1996    f% 1D2418        39.7     0.      49.6 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 4f
1997    f% 2E2418       -28.1     0.     -35.1 FIXEDHF     0.800  0       0.0  0
1998    f& 1D2418        40.7     0.      50.9 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 5f
1999    f& 2E2418       -26.6     0.     -33.3 FIXEDHF     0.800  0       0.0  0
2000    f' 1D2418        38.2     0.      47.7 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 6f
2001    f' 2E2418       -23.2     0.     -29.0 FIXEDHF     0.800  0       0.0  0
2002    f( 1D2418        35.2     0.      44.0 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 7f
2003    f( 2E2418       -20.0     0.     -25.0 FIXEDHF     0.800  0       0.0  0
2004    f) 1D2418        32.5     0.      40.6 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 8f
2005    f) 2E2418       -17.2     0.     -21.5 FIXEDHF     0.800  0       0.0  0
2006    f* 1D2418        30.3     0.      37.9 FIXEDHF     0.800  0       0.0  0  p2 12d    -sp 9f
2007    f* 2E2418       -15.0     0.     -18.8 FIXEDHF     0.800  0       0.0  0
2008    gm 2D2425        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0  p2 13d    -p2 5g
2009    gm 3E2425         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0
2010    gn 2D2425        -3.5     0.      -4.4 FIXEDHF     0.800  0       0.0  0  p2 13d    -p2 6g
2011    gn 3E2425         1.7     0.       2.1 FIXEDHF     0.800  0       0.0  0
2012    go 2D2425        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0  p2 13d    -p2 7g
2013    go 3E2425         1.6     0.       2.0 FIXEDHF     0.800  0       0.0  0
2014    gp 2D2425        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0  p2 13d    -p2 8g
2015    gp 3E2425         1.4     0.       1.8 FIXEDHF     0.800  0       0.0  0
2016    gq 2D2425        -2.6     0.      -3.3 FIXEDHF     0.800  0       0.0  0  p2 13d    -p2 9g
2017    gq 3E2425         1.3     0.       1.6 FIXEDHF     0.800  0       0.0  0
2018    gx 1D2412      1240.5     0.    1550.6 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp2
2019    gx 2E2412       929.5     0.    1161.9 FIXEDHF     0.800  0       0.0  0
2020    gy 1D2417       465.0     0.     581.3 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 4p
2021    gy 2E2417       203.4     0.     254.2 FIXEDHF     0.800  0       0.0  0
2022    gz 1D2417       251.0     0.     313.7 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 5p
2023    gz 2E2417       112.2     0.     140.2 FIXEDHF     0.800  0       0.0  0
2024    g! 1D2417       152.0     0.     190.0 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 6p
2025    g! 2E2417        74.6     0.      93.3 FIXEDHF     0.800  0       0.0  0
2026    g" 1D2417        99.1     0.     123.9 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 7p
2027    g" 2E2417        54.5     0.      68.1 FIXEDHF     0.800  0       0.0  0
2028    g# 1D2417        67.9     0.      84.9 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 8p
2029    g# 2E2417        42.2     0.      52.7 FIXEDHF     0.800  0       0.0  0
2030    g$ 1D2417        48.0     0.      60.0 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 9p
2031    g$ 2E2417        33.9     0.      42.4 FIXEDHF     0.800  0       0.0  0
2032    g% 1D2418        34.9     0.      43.6 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 4f
2033    g% 2E2418       -24.6     0.     -30.8 FIXEDHF     0.800  0       0.0  0
2034    g& 1D2418        35.7     0.      44.6 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 5f
2035    g& 2E2418       -23.4     0.     -29.3 FIXEDHF     0.800  0       0.0  0
2036    g' 1D2418        33.3     0.      41.6 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 6f
2037    g' 2E2418       -20.4     0.     -25.5 FIXEDHF     0.800  0       0.0  0
2038    g( 1D2418        30.6     0.      38.2 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 7f
2039    g( 2E2418       -17.5     0.     -21.9 FIXEDHF     0.800  0       0.0  0
2040    g) 1D2418        28.0     0.      35.0 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 8f
2041    g) 2E2418       -15.1     0.     -18.9 FIXEDHF     0.800  0       0.0  0
2042    g* 1D2418        25.8     0.      32.3 FIXEDHF     0.800  0       0.0  0  p2 13d    -sp 9f
2043    g* 2E2418       -13.2     0.     -16.5 FIXEDHF     0.800  0       0.0  0
2044    hm 1D1122     38461.3     0.   48076.6 FIXEDHF     0.800  0       0.0  0  s2 5g     -p2 5g
2045    hn 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5g     -p2 6g
2046    ho 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5g     -p2 7g
2047    hp 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5g     -p2 8g
2048    hq 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 5g     -p2 9g
2049    h% 1D1528     -1013.3     0.   -1266.6 FIXEDHF     0.800  0       0.0  0  s2 5g     -sp 4f
2050    h% 3E1528        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0
2051    h& 1D1528         4.2     0.       5.2 FIXEDHF     0.800  0       0.0  0  s2 5g     -sp 5f
2052    h& 3E1528        -1.8     0.      -2.3 FIXEDHF     0.800  0       0.0  0
2053    h' 1D1528       -31.8     0.     -39.7 FIXEDHF     0.800  0       0.0  0  s2 5g     -sp 6f
2054    h' 3E1528        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0
2055    h( 1D1528       -25.6     0.     -32.0 FIXEDHF     0.800  0       0.0  0  s2 5g     -sp 7f
2056    h( 3E1528        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0
2057    h) 1D1528       -20.3     0.     -25.4 FIXEDHF     0.800  0       0.0  0  s2 5g     -sp 8f
2058    h) 3E1528        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0
2059    h* 1D1528       -16.5     0.     -20.6 FIXEDHF     0.800  0       0.0  0  s2 5g     -sp 9f
2060    h* 3E1528        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
2061    im 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6g     -p2 5g
2062    in 1D1122     38461.3     0.   48076.6 FIXEDHF     0.800  0       0.0  0  s2 6g     -p2 6g
2063    io 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6g     -p2 7g
2064    ip 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6g     -p2 8g
2065    iq 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 6g     -p2 9g
2066    i% 1D1528      -716.6     0.    -895.8 FIXEDHF     0.800  0       0.0  0  s2 6g     -sp 4f
2067    i% 3E1528        -2.1     0.      -2.6 FIXEDHF     0.800  0       0.0  0
2068    i& 1D1528      -377.8     0.    -472.3 FIXEDHF     0.800  0       0.0  0  s2 6g     -sp 5f
2069    i& 3E1528        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0
2070    i' 1D1528         4.5     0.       5.6 FIXEDHF     0.800  0       0.0  0  s2 6g     -sp 6f
2071    i' 3E1528        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0
2072    i( 1D1528       -23.6     0.     -29.5 FIXEDHF     0.800  0       0.0  0  s2 6g     -sp 7f
2073    i( 3E1528        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0
2074    i) 1D1528       -20.9     0.     -26.1 FIXEDHF     0.800  0       0.0  0  s2 6g     -sp 8f
2075    i) 3E1528        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0
2076    i* 1D1528       -17.5     0.     -21.9 FIXEDHF     0.800  0       0.0  0  s2 6g     -sp 9f
2077    i* 3E1528        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0
2078    jm 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7g     -p2 5g
2079    jn 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7g     -p2 6g
2080    jo 1D1122     38461.4     0.   48076.7 FIXEDHF     0.800  0       0.0  0  s2 7g     -p2 7g
2081    jp 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7g     -p2 8g
2082    jq 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7g     -p2 9g
2083    j% 1D1528      -541.9     0.    -677.4 FIXEDHF     0.800  0       0.0  0  s2 7g     -sp 4f
2084    j% 3E1528        -1.9     0.      -2.4 FIXEDHF     0.800  0       0.0  0
2085    j& 1D1528      -338.6     0.    -423.3 FIXEDHF     0.800  0       0.0  0  s2 7g     -sp 5f
2086    j& 3E1528        -1.8     0.      -2.2 FIXEDHF     0.800  0       0.0  0
2087    j' 1D1528      -168.6     0.    -210.7 FIXEDHF     0.800  0       0.0  0  s2 7g     -sp 6f
2088    j' 3E1528        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0
2089    j( 1D1528         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0  s2 7g     -sp 7f
2090    j( 3E1528        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0
2091    j) 1D1528       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0  s2 7g     -sp 8f
2092    j) 3E1528        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0
2093    j* 1D1528       -15.2     0.     -19.0 FIXEDHF     0.800  0       0.0  0  s2 7g     -sp 9f
2094    j* 3E1528        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
2095    km 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8g     -p2 5g
2096    kn 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8g     -p2 6g
2097    ko 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8g     -p2 7g
2098    kp 1D1122     38461.4     0.   48076.7 FIXEDHF     0.800  0       0.0  0  s2 8g     -p2 8g
2099    kq 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8g     -p2 9g
2100    k% 1D1528      -429.8     0.    -537.3 FIXEDHF     0.800  0       0.0  0  s2 8g     -sp 4f
2101    k% 3E1528        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0
2102    k& 1D1528      -286.4     0.    -358.0 FIXEDHF     0.800  0       0.0  0  s2 8g     -sp 5f
2103    k& 3E1528        -1.6     0.      -2.0 FIXEDHF     0.800  0       0.0  0
2104    k' 1D1528      -169.5     0.    -211.9 FIXEDHF     0.800  0       0.0  0  s2 8g     -sp 6f
2105    k' 3E1528        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0
2106    k( 1D1528       -85.0     0.    -106.2 FIXEDHF     0.800  0       0.0  0  s2 8g     -sp 7f
2107    k( 3E1528        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0
2108    k) 1D1528         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0  s2 8g     -sp 8f
2109    k) 3E1528        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
2110    k* 1D1528       -10.7     0.     -13.4 FIXEDHF     0.800  0       0.0  0  s2 8g     -sp 9f
2111    k* 3E1528        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0
2112    lm 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9g     -p2 5g
2113    ln 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9g     -p2 6g
2114    lo 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9g     -p2 7g
2115    lp 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9g     -p2 8g
2116    lq 1D1122     38461.4     0.   48076.7 FIXEDHF     0.800  0       0.0  0  s2 9g     -p2 9g
2117    l% 1D1528      -352.6     0.    -440.8 FIXEDHF     0.800  0       0.0  0  s2 9g     -sp 4f
2118    l% 3E1528        -1.5     0.      -1.9 FIXEDHF     0.800  0       0.0  0
2119    l& 1D1528      -242.9     0.    -303.6 FIXEDHF     0.800  0       0.0  0  s2 9g     -sp 5f
2120    l& 3E1528        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0
2121    l' 1D1528      -153.4     0.    -191.8 FIXEDHF     0.800  0       0.0  0  s2 9g     -sp 6f
2122    l' 3E1528        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0
2123    l( 1D1528       -91.8     0.    -114.7 FIXEDHF     0.800  0       0.0  0  s2 9g     -sp 7f
2124    l( 3E1528        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0
2125    l) 1D1528       -46.8     0.     -58.5 FIXEDHF     0.800  0       0.0  0  s2 9g     -sp 8f
2126    l) 3E1528        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0
2127    l* 1D1528         2.8     0.       3.5 FIXEDHF     0.800  0       0.0  0  s2 9g     -sp 9f
2128    l* 3E1528        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0
2129    mn 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5g     -p2 6g
2130    mn 2D2525        88.8     0.     111.0 FIXEDHF     0.800  0       0.0  0
2131    mn 3E2525         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0
2132    mn 5E2525         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
2133    mo 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5g     -p2 7g
2134    mo 2D2525        62.9     0.      78.6 FIXEDHF     0.800  0       0.0  0
2135    mo 3E2525         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0
2136    mo 5E2525         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
2137    mp 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5g     -p2 8g
2138    mp 2D2525        48.2     0.      60.3 FIXEDHF     0.800  0       0.0  0
2139    mp 3E2525         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0
2140    mp 5E2525         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
2141    mq 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 5g     -p2 9g
2142    mq 2D2525        38.8     0.      48.5 FIXEDHF     0.800  0       0.0  0
2143    mq 3E2525         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
2144    mq 5E2525         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
2145    mu 2D2526        26.6     0.      33.3 FIXEDHF     0.800  0       0.0  0  p2 5g     -p2 7i
2146    mu 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2147    mv 2D2526        26.3     0.      32.9 FIXEDHF     0.800  0       0.0  0  p2 5g     -p2 8i
2148    mv 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2149    mw 2D2526        23.8     0.      29.8 FIXEDHF     0.800  0       0.0  0  p2 5g     -p2 9i
2150    mw 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2151    m% 1D2518      -981.4     0.   -1226.7 FIXEDHF     0.800  0       0.0  0  p2 5g     -sp 4f
2152    m% 4E2518        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0
2153    m& 1D2518         3.5     0.       4.4 FIXEDHF     0.800  0       0.0  0  p2 5g     -sp 5f
2154    m& 4E2518        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0
2155    m' 1D2518       -31.1     0.     -38.9 FIXEDHF     0.800  0       0.0  0  p2 5g     -sp 6f
2156    m' 4E2518        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0
2157    m( 1D2518       -25.1     0.     -31.4 FIXEDHF     0.800  0       0.0  0  p2 5g     -sp 7f
2158    m( 4E2518        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0
2159    m) 1D2518       -19.9     0.     -24.9 FIXEDHF     0.800  0       0.0  0  p2 5g     -sp 8f
2160    m) 4E2518        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0
2161    m* 1D2518       -16.2     0.     -20.2 FIXEDHF     0.800  0       0.0  0  p2 5g     -sp 9f
2162    m* 4E2518        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0
2163    no 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6g     -p2 7g
2164    no 2D2525        62.4     0.      78.0 FIXEDHF     0.800  0       0.0  0
2165    no 3E2525         0.5     0.       0.6 FIXEDHF     0.800  0       0.0  0
2166    no 5E2525         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
2167    np 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6g     -p2 8g
2168    np 2D2525        48.1     0.      60.1 FIXEDHF     0.800  0       0.0  0
2169    np 3E2525         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0
2170    np 5E2525         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
2171    nq 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 6g     -p2 9g
2172    nq 2D2525        38.8     0.      48.5 FIXEDHF     0.800  0       0.0  0
2173    nq 3E2525         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
2174    nq 5E2525         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
2175    nu 2D2526        -6.1     0.      -7.6 FIXEDHF     0.800  0       0.0  0  p2 6g     -p2 7i
2176    nu 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2177    nv 2D2526         2.6     0.       3.3 FIXEDHF     0.800  0       0.0  0  p2 6g     -p2 8i
2178    nv 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2179    nw 2D2526         5.8     0.       7.2 FIXEDHF     0.800  0       0.0  0  p2 6g     -p2 9i
2180    nw 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2181    n% 1D2518      -694.6     0.    -868.2 FIXEDHF     0.800  0       0.0  0  p2 6g     -sp 4f
2182    n% 4E2518        -1.4     0.      -1.8 FIXEDHF     0.800  0       0.0  0
2183    n& 1D2518      -366.6     0.    -458.2 FIXEDHF     0.800  0       0.0  0  p2 6g     -sp 5f
2184    n& 4E2518        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0
2185    n' 1D2518         3.7     0.       4.6 FIXEDHF     0.800  0       0.0  0  p2 6g     -sp 6f
2186    n' 4E2518        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0
2187    n( 1D2518       -23.3     0.     -29.1 FIXEDHF     0.800  0       0.0  0  p2 6g     -sp 7f
2188    n( 4E2518        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
2189    n) 1D2518       -20.6     0.     -25.8 FIXEDHF     0.800  0       0.0  0  p2 6g     -sp 8f
2190    n) 4E2518        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0
2191    n* 1D2518       -17.3     0.     -21.6 FIXEDHF     0.800  0       0.0  0  p2 6g     -sp 9f
2192    n* 4E2518        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0
2193    op 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -p2 8g
2194    op 2D2525        42.9     0.      53.6 FIXEDHF     0.800  0       0.0  0
2195    op 3E2525         0.4     0.       0.5 FIXEDHF     0.800  0       0.0  0
2196    op 5E2525         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
2197    oq 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -p2 9g
2198    oq 2D2525        34.6     0.      43.3 FIXEDHF     0.800  0       0.0  0
2199    oq 3E2525         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
2200    oq 5E2525         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
2201    ou 2D2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -p2 7i
2202    ou 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2203    ov 2D2526        -3.2     0.      -4.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -p2 8i
2204    ov 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2205    ow 2D2526        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0  p2 7g     -p2 9i
2206    ow 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2207    o% 1D2518      -525.5     0.    -656.9 FIXEDHF     0.800  0       0.0  0  p2 7g     -sp 4f
2208    o% 4E2518        -1.3     0.      -1.6 FIXEDHF     0.800  0       0.0  0
2209    o& 1D2518      -328.8     0.    -411.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -sp 5f
2210    o& 4E2518        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0
2211    o' 1D2518      -164.1     0.    -205.1 FIXEDHF     0.800  0       0.0  0  p2 7g     -sp 6f
2212    o' 4E2518        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0
2213    o( 1D2518         3.2     0.       4.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -sp 7f
2214    o( 4E2518        -0.9     0.      -1.1 FIXEDHF     0.800  0       0.0  0
2215    o) 1D2518       -16.0     0.     -20.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -sp 8f
2216    o) 4E2518        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0
2217    o* 1D2518       -15.2     0.     -19.0 FIXEDHF     0.800  0       0.0  0  p2 7g     -sp 9f
2218    o* 4E2518        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0
2219    pq 0D2525         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8g     -p2 9g
2220    pq 2D2525        30.2     0.      37.8 FIXEDHF     0.800  0       0.0  0
2221    pq 3E2525         0.3     0.       0.4 FIXEDHF     0.800  0       0.0  0
2222    pq 5E2525         0.2     0.       0.3 FIXEDHF     0.800  0       0.0  0
2223    pu 2D2526         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  p2 8g     -p2 7i
2224    pu 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2225    pv 2D2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8g     -p2 8i
2226    pv 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2227    pw 2D2526        -1.7     0.      -2.1 FIXEDHF     0.800  0       0.0  0  p2 8g     -p2 9i
2228    pw 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2229    p% 1D2518      -417.1     0.    -521.4 FIXEDHF     0.800  0       0.0  0  p2 8g     -sp 4f
2230    p% 4E2518        -1.2     0.      -1.5 FIXEDHF     0.800  0       0.0  0
2231    p& 1D2518      -278.2     0.    -347.8 FIXEDHF     0.800  0       0.0  0  p2 8g     -sp 5f
2232    p& 4E2518        -1.1     0.      -1.4 FIXEDHF     0.800  0       0.0  0
2233    p' 1D2518      -165.0     0.    -206.2 FIXEDHF     0.800  0       0.0  0  p2 8g     -sp 6f
2234    p' 4E2518        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
2235    p( 1D2518       -83.0     0.    -103.8 FIXEDHF     0.800  0       0.0  0  p2 8g     -sp 7f
2236    p( 4E2518        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0
2237    p) 1D2518         2.7     0.       3.4 FIXEDHF     0.800  0       0.0  0  p2 8g     -sp 8f
2238    p) 4E2518        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0
2239    p* 1D2518       -10.9     0.     -13.6 FIXEDHF     0.800  0       0.0  0  p2 8g     -sp 9f
2240    p* 4E2518        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0
2241    qu 2D2526         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  p2 9g     -p2 7i
2242    qu 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2243    qv 2D2526         0.1     0.       0.1 FIXEDHF     0.800  0       0.0  0  p2 9g     -p2 8i
2244    qv 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2245    qw 2D2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 9g     -p2 9i
2246    qw 5E2526         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2247    q% 1D2518      -342.4     0.    -428.0 FIXEDHF     0.800  0       0.0  0  p2 9g     -sp 4f
2248    q% 4E2518        -1.0     0.      -1.3 FIXEDHF     0.800  0       0.0  0
2249    q& 1D2518      -236.1     0.    -295.1 FIXEDHF     0.800  0       0.0  0  p2 9g     -sp 5f
2250    q& 4E2518        -1.0     0.      -1.2 FIXEDHF     0.800  0       0.0  0
2251    q' 1D2518      -149.4     0.    -186.8 FIXEDHF     0.800  0       0.0  0  p2 9g     -sp 6f
2252    q' 4E2518        -0.8     0.      -1.0 FIXEDHF     0.800  0       0.0  0
2253    q( 1D2518       -89.5     0.    -111.9 FIXEDHF     0.800  0       0.0  0  p2 9g     -sp 7f
2254    q( 4E2518        -0.7     0.      -0.9 FIXEDHF     0.800  0       0.0  0
2255    q) 1D2518       -45.9     0.     -57.4 FIXEDHF     0.800  0       0.0  0  p2 9g     -sp 8f
2256    q) 4E2518        -0.6     0.      -0.8 FIXEDHF     0.800  0       0.0  0
2257    q* 1D2518         2.2     0.       2.8 FIXEDHF     0.800  0       0.0  0  p2 9g     -sp 9f
2258    q* 4E2518        -0.6     0.      -0.7 FIXEDHF     0.800  0       0.0  0
2259    ru 1D1122     38461.4     0.   48076.7 FIXEDHF     0.800  0       0.0  0  s2 7i     -p2 7i
2260    rv 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7i     -p2 8i
2261    rw 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 7i     -p2 9i
2262    su 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8i     -p2 7i
2263    sv 1D1122     38461.4     0.   48076.7 FIXEDHF     0.800  0       0.0  0  s2 8i     -p2 8i
2264    sw 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 8i     -p2 9i
2265    tu 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9i     -p2 7i
2266    tv 1D1122         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  s2 9i     -p2 8i
2267    tw 1D1122     38461.4     0.   48076.7 FIXEDHF     0.800  0       0.0  0  s2 9i     -p2 9i
2268    uv 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7i     -p2 8i
2269    uv 2D2626        10.2     0.      12.8 FIXEDHF     0.800  0       0.0  0
2270    uv 5E2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2271    uv 7E2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2272    uw 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 7i     -p2 9i
2273    uw 2D2626         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0
2274    uw 5E2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2275    uw 7E2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2276    vw 0D2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  p2 8i     -p2 9i
2277    vw 2D2626         8.5     0.      10.6 FIXEDHF     0.800  0       0.0  0
2278    vw 5E2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2279    vw 7E2626         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2280    xy 0D1217      1346.7     0.    1683.4 FIXEDHF     0.800  0       0.0  0  sp2       -sp 4p
2281    xy 1E1217      7952.4     0.    9940.5 FIXEDHF     0.800  0       0.0  0
2282    xy 0D2227      1018.3     0.    1272.9 FIXEDHF     0.800  0       0.0  0
2283    xy 2D2227      3812.1     0.    4765.1 FIXEDHF     0.800  0       0.0  0
2284    xz 0D1217       771.9     0.     964.9 FIXEDHF     0.800  0       0.0  0  sp2       -sp 5p
2285    xz 1E1217      4540.4     0.    5675.5 FIXEDHF     0.800  0       0.0  0
2286    xz 0D2227       554.0     0.     692.5 FIXEDHF     0.800  0       0.0  0
2287    xz 2D2227      1990.6     0.    2488.2 FIXEDHF     0.800  0       0.0  0
2288    x! 0D1217       523.0     0.     653.7 FIXEDHF     0.800  0       0.0  0  sp2       -sp 6p
2289    x! 1E1217      3071.1     0.    3838.9 FIXEDHF     0.800  0       0.0  0
2290    x! 0D2227       366.2     0.     457.7 FIXEDHF     0.800  0       0.0  0
2291    x! 2D2227      1290.8     0.    1613.5 FIXEDHF     0.800  0       0.0  0
2292    x" 0D1217       385.9     0.     482.4 FIXEDHF     0.800  0       0.0  0  sp2       -sp 7p
2293    x" 1E1217      2264.5     0.    2830.6 FIXEDHF     0.800  0       0.0  0
2294    x" 0D2227       266.4     0.     333.0 FIXEDHF     0.800  0       0.0  0
2295    x" 2D2227       929.2     0.    1161.5 FIXEDHF     0.800  0       0.0  0
2296    x# 0D1217       300.5     0.     375.6 FIXEDHF     0.800  0       0.0  0  sp2       -sp 8p
2297    x# 1E1217      1762.1     0.    2202.6 FIXEDHF     0.800  0       0.0  0
2298    x# 0D2227       205.6     0.     257.0 FIXEDHF     0.800  0       0.0  0
2299    x# 2D2227       712.2     0.     890.2 FIXEDHF     0.800  0       0.0  0
2300    x$ 0D1217       242.7     0.     303.4 FIXEDHF     0.800  0       0.0  0  sp2       -sp 9p
2301    x$ 1E1217      1423.0     0.    1778.8 FIXEDHF     0.800  0       0.0  0
2302    x$ 0D2227       165.0     0.     206.3 FIXEDHF     0.800  0       0.0  0
2303    x$ 2D2227       569.3     0.     711.6 FIXEDHF     0.800  0       0.0  0
2304    x% 2D2228      -952.4     0.   -1190.5 FIXEDHF     0.800  0       0.0  0  sp2       -sp 4f
2305    x& 2D2228      -880.0     0.   -1100.0 FIXEDHF     0.800  0       0.0  0  sp2       -sp 5f
2306    x' 2D2228      -754.6     0.    -943.3 FIXEDHF     0.800  0       0.0  0  sp2       -sp 6f
2307    x( 2D2228      -642.8     0.    -803.5 FIXEDHF     0.800  0       0.0  0  sp2       -sp 7f
2308    x) 2D2228      -551.4     0.    -689.3 FIXEDHF     0.800  0       0.0  0  sp2       -sp 8f
2309    x* 2D2228      -478.0     0.    -597.5 FIXEDHF     0.800  0       0.0  0  sp2       -sp 9f
2310    yz 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 5p
2311    yz 1E1717      1359.5     0.    1699.4 FIXEDHF     0.800  0       0.0  0
2312    yz 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2313    yz 2D2727      1890.2     0.    2362.7 FIXEDHF     0.800  0       0.0  0
2314    yz 0E2727      1072.7     0.    1340.9 FIXEDHF     0.800  0       0.0  0
2315    yz 2E2727       893.7     0.    1117.1 FIXEDHF     0.800  0       0.0  0
2316    y! 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 6p
2317    y! 1E1717       930.1     0.    1162.6 FIXEDHF     0.800  0       0.0  0
2318    y! 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2319    y! 2D2727      1222.7     0.    1528.4 FIXEDHF     0.800  0       0.0  0
2320    y! 0E2727       722.2     0.     902.7 FIXEDHF     0.800  0       0.0  0
2321    y! 2E2727       609.3     0.     761.6 FIXEDHF     0.800  0       0.0  0
2322    y" 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 7p
2323    y" 1E1717       690.1     0.     862.6 FIXEDHF     0.800  0       0.0  0
2324    y" 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2325    y" 2D2727       882.1     0.    1102.6 FIXEDHF     0.800  0       0.0  0
2326    y" 0E2727       531.0     0.     663.7 FIXEDHF     0.800  0       0.0  0
2327    y" 2E2727       451.0     0.     563.7 FIXEDHF     0.800  0       0.0  0
2328    y# 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 8p
2329    y# 1E1717       539.0     0.     673.7 FIXEDHF     0.800  0       0.0  0
2330    y# 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2331    y# 2D2727       677.5     0.     846.9 FIXEDHF     0.800  0       0.0  0
2332    y# 0E2727       412.4     0.     515.5 FIXEDHF     0.800  0       0.0  0
2333    y# 2E2727       351.7     0.     439.6 FIXEDHF     0.800  0       0.0  0
2334    y$ 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 9p
2335    y$ 1E1717       436.4     0.     545.5 FIXEDHF     0.800  0       0.0  0
2336    y$ 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2337    y$ 2D2727       542.4     0.     678.0 FIXEDHF     0.800  0       0.0  0
2338    y$ 0E2727       332.6     0.     415.8 FIXEDHF     0.800  0       0.0  0
2339    y$ 2E2727       284.4     0.     355.5 FIXEDHF     0.800  0       0.0  0
2340    y% 2D2728       936.2     0.    1170.2 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 4f
2341    y% 2E2728       -50.0     0.     -62.5 FIXEDHF     0.800  0       0.0  0
2342    y& 2D2728       687.1     0.     858.9 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 5f
2343    y& 2E2728       -52.5     0.     -65.6 FIXEDHF     0.800  0       0.0  0
2344    y' 2D2728       519.4     0.     649.2 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 6f
2345    y' 2E2728       -48.0     0.     -60.0 FIXEDHF     0.800  0       0.0  0
2346    y( 2D2728       408.6     0.     510.8 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 7f
2347    y( 2E2728       -42.6     0.     -53.2 FIXEDHF     0.800  0       0.0  0
2348    y) 2D2728       332.1     0.     415.1 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 8f
2349    y) 2E2728       -37.4     0.     -46.8 FIXEDHF     0.800  0       0.0  0
2350    y* 2D2728       276.8     0.     346.0 FIXEDHF     0.800  0       0.0  0  sp 4p     -sp 9f
2351    y* 2E2728       -33.1     0.     -41.4 FIXEDHF     0.800  0       0.0  0
2352    z! 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 6p
2353    z! 1E1717       548.7     0.     685.9 FIXEDHF     0.800  0       0.0  0
2354    z! 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2355    z! 2D2727       852.4     0.    1065.5 FIXEDHF     0.800  0       0.0  0
2356    z! 0E2727       414.5     0.     518.1 FIXEDHF     0.800  0       0.0  0
2357    z! 2E2727       363.5     0.     454.4 FIXEDHF     0.800  0       0.0  0
2358    z" 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 7p
2359    z" 1E1717       407.5     0.     509.4 FIXEDHF     0.800  0       0.0  0
2360    z" 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2361    z" 2D2727       613.6     0.     767.0 FIXEDHF     0.800  0       0.0  0
2362    z" 0E2727       305.4     0.     381.7 FIXEDHF     0.800  0       0.0  0
2363    z" 2E2727       269.9     0.     337.4 FIXEDHF     0.800  0       0.0  0
2364    z# 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 8p
2365    z# 1E1717       318.5     0.     398.1 FIXEDHF     0.800  0       0.0  0
2366    z# 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2367    z# 2D2727       471.3     0.     589.1 FIXEDHF     0.800  0       0.0  0
2368    z# 0E2727       237.4     0.     296.8 FIXEDHF     0.800  0       0.0  0
2369    z# 2E2727       210.9     0.     263.6 FIXEDHF     0.800  0       0.0  0
2370    z$ 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 9p
2371    z$ 1E1717       258.0     0.     322.5 FIXEDHF     0.800  0       0.0  0
2372    z$ 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2373    z$ 2D2727       377.4     0.     471.8 FIXEDHF     0.800  0       0.0  0
2374    z$ 0E2727       191.7     0.     239.6 FIXEDHF     0.800  0       0.0  0
2375    z$ 2E2727       170.8     0.     213.5 FIXEDHF     0.800  0       0.0  0
2376    z% 2D2728       131.8     0.     164.7 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 4f
2377    z% 2E2728       -15.8     0.     -19.7 FIXEDHF     0.800  0       0.0  0
2378    z& 2D2728       256.2     0.     320.3 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 5f
2379    z& 2E2728       -18.0     0.     -22.5 FIXEDHF     0.800  0       0.0  0
2380    z' 2D2728       231.5     0.     289.4 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 6f
2381    z' 2E2728       -17.2     0.     -21.5 FIXEDHF     0.800  0       0.0  0
2382    z( 2D2728       196.8     0.     246.0 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 7f
2383    z( 2E2728       -15.6     0.     -19.5 FIXEDHF     0.800  0       0.0  0
2384    z) 2D2728       167.0     0.     208.8 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 8f
2385    z) 2E2728       -13.9     0.     -17.4 FIXEDHF     0.800  0       0.0  0
2386    z* 2D2728       143.2     0.     179.0 FIXEDHF     0.800  0       0.0  0  sp 5p     -sp 9f
2387    z* 2E2728       -12.4     0.     -15.5 FIXEDHF     0.800  0       0.0  0
2388    !" 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 7p
2389    !" 1E1717       279.7     0.     349.6 FIXEDHF     0.800  0       0.0  0
2390    !" 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2391    !" 2D2727       449.8     0.     562.3 FIXEDHF     0.800  0       0.0  0
2392    !" 0E2727       206.9     0.     258.6 FIXEDHF     0.800  0       0.0  0
2393    !" 2E2727       185.9     0.     232.4 FIXEDHF     0.800  0       0.0  0
2394    !# 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 8p
2395    !# 1E1717       218.6     0.     273.3 FIXEDHF     0.800  0       0.0  0
2396    !# 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2397    !# 2D2727       345.1     0.     431.4 FIXEDHF     0.800  0       0.0  0
2398    !# 0E2727       161.0     0.     201.2 FIXEDHF     0.800  0       0.0  0
2399    !# 2E2727       145.4     0.     181.7 FIXEDHF     0.800  0       0.0  0
2400    !$ 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 9p
2401    !$ 1E1717       177.1     0.     221.4 FIXEDHF     0.800  0       0.0  0
2402    !$ 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2403    !$ 2D2727       276.4     0.     345.5 FIXEDHF     0.800  0       0.0  0
2404    !$ 0E2727       129.9     0.     162.4 FIXEDHF     0.800  0       0.0  0
2405    !$ 2E2727       117.8     0.     147.3 FIXEDHF     0.800  0       0.0  0
2406    !% 2D2728        95.0     0.     118.8 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 4f
2407    !% 2E2728        -7.0     0.      -8.7 FIXEDHF     0.800  0       0.0  0
2408    !& 2D2728        86.6     0.     108.2 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 5f
2409    !& 2E2728        -8.7     0.     -10.9 FIXEDHF     0.800  0       0.0  0
2410    !' 2D2728       110.0     0.     137.5 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 6f
2411    !' 2E2728        -8.6     0.     -10.8 FIXEDHF     0.800  0       0.0  0
2412    !( 2D2728       103.0     0.     128.8 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 7f
2413    !( 2E2728        -8.0     0.     -10.0 FIXEDHF     0.800  0       0.0  0
2414    !) 2D2728        91.5     0.     114.4 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 8f
2415    !) 2E2728        -7.2     0.      -9.0 FIXEDHF     0.800  0       0.0  0
2416    !* 2D2728        80.6     0.     100.8 FIXEDHF     0.800  0       0.0  0  sp 6p     -sp 9f
2417    !* 2E2728        -6.5     0.      -8.1 FIXEDHF     0.800  0       0.0  0
2418    "# 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 8p
2419    "# 1E1717       162.6     0.     203.2 FIXEDHF     0.800  0       0.0  0
2420    "# 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2421    "# 2D2727       265.0     0.     331.3 FIXEDHF     0.800  0       0.0  0
2422    "# 0E2727       118.7     0.     148.4 FIXEDHF     0.800  0       0.0  0
2423    "# 2E2727       108.2     0.     135.3 FIXEDHF     0.800  0       0.0  0
2424    "$ 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 9p
2425    "$ 1E1717       131.7     0.     164.6 FIXEDHF     0.800  0       0.0  0
2426    "$ 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2427    "$ 2D2727       212.2     0.     265.2 FIXEDHF     0.800  0       0.0  0
2428    "$ 0E2727        95.9     0.     119.9 FIXEDHF     0.800  0       0.0  0
2429    "$ 2E2727        87.8     0.     109.7 FIXEDHF     0.800  0       0.0  0
2430    "% 2D2728        67.7     0.      84.6 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 4f
2431    "% 2E2728        -3.7     0.      -4.6 FIXEDHF     0.800  0       0.0  0
2432    "& 2D2728        66.2     0.      82.8 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 5f
2433    "& 2E2728        -5.0     0.      -6.3 FIXEDHF     0.800  0       0.0  0
2434    "' 2D2728        56.0     0.      70.0 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 6f
2435    "' 2E2728        -5.2     0.      -6.5 FIXEDHF     0.800  0       0.0  0
2436    "( 2D2728        59.8     0.      74.7 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 7f
2437    "( 2E2728        -4.9     0.      -6.1 FIXEDHF     0.800  0       0.0  0
2438    ") 2D2728        55.8     0.      69.7 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 8f
2439    ") 2E2728        -4.5     0.      -5.6 FIXEDHF     0.800  0       0.0  0
2440    "* 2D2728        50.3     0.      62.9 FIXEDHF     0.800  0       0.0  0  sp 7p     -sp 9f
2441    "* 2E2728        -4.0     0.      -5.0 FIXEDHF     0.800  0       0.0  0
2442    #$ 0D1717         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 8p     -sp 9p
2443    #$ 1E1717       103.0     0.     128.7 FIXEDHF     0.800  0       0.0  0
2444    #$ 0D2727         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2445    #$ 2D2727       169.0     0.     211.3 FIXEDHF     0.800  0       0.0  0
2446    #$ 0E2727        74.6     0.      93.3 FIXEDHF     0.800  0       0.0  0
2447    #$ 2E2727        68.6     0.      85.8 FIXEDHF     0.800  0       0.0  0
2448    #% 2D2728        51.3     0.      64.1 FIXEDHF     0.800  0       0.0  0  sp 8p     -sp 4f
2449    #% 2E2728        -2.2     0.      -2.7 FIXEDHF     0.800  0       0.0  0
2450    #& 2D2728        50.4     0.      63.0 FIXEDHF     0.800  0       0.0  0  sp 8p     -sp 5f
2451    #& 2E2728        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0
2452    #' 2D2728        44.6     0.      55.8 FIXEDHF     0.800  0       0.0  0  sp 8p     -sp 6f
2453    #' 2E2728        -3.4     0.      -4.3 FIXEDHF     0.800  0       0.0  0
2454    #( 2D2728        37.6     0.      47.0 FIXEDHF     0.800  0       0.0  0  sp 8p     -sp 7f
2455    #( 2E2728        -3.3     0.      -4.1 FIXEDHF     0.800  0       0.0  0
2456    #) 2D2728        37.0     0.      46.2 FIXEDHF     0.800  0       0.0  0  sp 8p     -sp 8f
2457    #) 2E2728        -3.0     0.      -3.8 FIXEDHF     0.800  0       0.0  0
2458    #* 2D2728        34.2     0.      42.8 FIXEDHF     0.800  0       0.0  0  sp 8p     -sp 9f
2459    #* 2E2728        -2.8     0.      -3.5 FIXEDHF     0.800  0       0.0  0
2460    $% 2D2728        40.6     0.      50.7 FIXEDHF     0.800  0       0.0  0  sp 9p     -sp 4f
2461    $% 2E2728        -1.4     0.      -1.7 FIXEDHF     0.800  0       0.0  0
2462    $& 2D2728        39.9     0.      49.9 FIXEDHF     0.800  0       0.0  0  sp 9p     -sp 5f
2463    $& 2E2728        -2.3     0.      -2.9 FIXEDHF     0.800  0       0.0  0
2464    $' 2D2728        35.5     0.      44.4 FIXEDHF     0.800  0       0.0  0  sp 9p     -sp 6f
2465    $' 2E2728        -2.5     0.      -3.1 FIXEDHF     0.800  0       0.0  0
2466    $( 2D2728        30.8     0.      38.5 FIXEDHF     0.800  0       0.0  0  sp 9p     -sp 7f
2467    $( 2E2728        -2.4     0.      -3.0 FIXEDHF     0.800  0       0.0  0
2468    $) 2D2728        26.2     0.      32.7 FIXEDHF     0.800  0       0.0  0  sp 9p     -sp 8f
2469    $) 2E2728        -2.2     0.      -2.8 FIXEDHF     0.800  0       0.0  0
2470    $* 2D2728        24.8     0.      31.0 FIXEDHF     0.800  0       0.0  0  sp 9p     -sp 9f
2471    $* 2E2728        -2.0     0.      -2.5 FIXEDHF     0.800  0       0.0  0
2472    %& 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4f     -sp 5f
2473    %& 3E1818        10.0     0.      12.5 FIXEDHF     0.800  0       0.0  0
2474    %& 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2475    %& 2D2828       377.8     0.     472.2 FIXEDHF     0.800  0       0.0  0
2476    %& 2E2828        39.6     0.      49.5 FIXEDHF     0.800  0       0.0  0
2477    %& 4E2828        25.8     0.      32.2 FIXEDHF     0.800  0       0.0  0
2478    %' 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4f     -sp 6f
2479    %' 3E1818         8.7     0.      10.9 FIXEDHF     0.800  0       0.0  0
2480    %' 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2481    %' 2D2828       267.4     0.     334.2 FIXEDHF     0.800  0       0.0  0
2482    %' 2E2828        33.8     0.      42.3 FIXEDHF     0.800  0       0.0  0
2483    %' 4E2828        22.0     0.      27.5 FIXEDHF     0.800  0       0.0  0
2484    %( 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4f     -sp 7f
2485    %( 3E1818         7.5     0.       9.4 FIXEDHF     0.800  0       0.0  0
2486    %( 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2487    %( 2D2828       204.5     0.     255.6 FIXEDHF     0.800  0       0.0  0
2488    %( 2E2828        28.7     0.      35.9 FIXEDHF     0.800  0       0.0  0
2489    %( 4E2828        18.6     0.      23.3 FIXEDHF     0.800  0       0.0  0
2490    %) 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4f     -sp 8f
2491    %) 3E1818         6.5     0.       8.1 FIXEDHF     0.800  0       0.0  0
2492    %) 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2493    %) 2D2828       163.8     0.     204.8 FIXEDHF     0.800  0       0.0  0
2494    %) 2E2828        24.6     0.      30.7 FIXEDHF     0.800  0       0.0  0
2495    %) 4E2828        16.0     0.      20.0 FIXEDHF     0.800  0       0.0  0
2496    %* 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 4f     -sp 9f
2497    %* 3E1818         5.6     0.       7.0 FIXEDHF     0.800  0       0.0  0
2498    %* 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2499    %* 2D2828       135.4     0.     169.3 FIXEDHF     0.800  0       0.0  0
2500    %* 2E2828        21.3     0.      26.6 FIXEDHF     0.800  0       0.0  0
2501    %* 4E2828        13.8     0.      17.3 FIXEDHF     0.800  0       0.0  0
2502    &' 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5f     -sp 6f
2503    &' 3E1818         8.3     0.      10.4 FIXEDHF     0.800  0       0.0  0
2504    &' 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2505    &' 2D2828       237.4     0.     296.8 FIXEDHF     0.800  0       0.0  0
2506    &' 2E2828        31.1     0.      38.9 FIXEDHF     0.800  0       0.0  0
2507    &' 4E2828        20.2     0.      25.3 FIXEDHF     0.800  0       0.0  0
2508    &( 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5f     -sp 7f
2509    &( 3E1818         7.1     0.       8.9 FIXEDHF     0.800  0       0.0  0
2510    &( 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2511    &( 2D2828       182.5     0.     228.1 FIXEDHF     0.800  0       0.0  0
2512    &( 2E2828        26.4     0.      33.0 FIXEDHF     0.800  0       0.0  0
2513    &( 4E2828        17.2     0.      21.5 FIXEDHF     0.800  0       0.0  0
2514    &) 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5f     -sp 8f
2515    &) 3E1818         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0
2516    &) 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2517    &) 2D2828       146.6     0.     183.3 FIXEDHF     0.800  0       0.0  0
2518    &) 2E2828        22.6     0.      28.3 FIXEDHF     0.800  0       0.0  0
2519    &) 4E2828        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0
2520    &* 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 5f     -sp 9f
2521    &* 3E1818         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0
2522    &* 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2523    &* 2D2828       121.5     0.     151.9 FIXEDHF     0.800  0       0.0  0
2524    &* 2E2828        19.6     0.      24.5 FIXEDHF     0.800  0       0.0  0
2525    &* 4E2828        12.7     0.      15.9 FIXEDHF     0.800  0       0.0  0
2526    '( 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 6f     -sp 7f
2527    '( 3E1818         6.2     0.       7.7 FIXEDHF     0.800  0       0.0  0
2528    '( 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2529    '( 2D2828       151.8     0.     189.8 FIXEDHF     0.800  0       0.0  0
2530    '( 2E2828        22.6     0.      28.2 FIXEDHF     0.800  0       0.0  0
2531    '( 4E2828        14.7     0.      18.4 FIXEDHF     0.800  0       0.0  0
2532    ') 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 6f     -sp 8f
2533    ') 3E1818         5.4     0.       6.7 FIXEDHF     0.800  0       0.0  0
2534    ') 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2535    ') 2D2828       122.3     0.     152.9 FIXEDHF     0.800  0       0.0  0
2536    ') 2E2828        19.4     0.      24.2 FIXEDHF     0.800  0       0.0  0
2537    ') 4E2828        12.6     0.      15.7 FIXEDHF     0.800  0       0.0  0
2538    '* 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 6f     -sp 9f
2539    '* 3E1818         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0
2540    '* 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2541    '* 2D2828       101.5     0.     126.9 FIXEDHF     0.800  0       0.0  0
2542    '* 2E2828        16.7     0.      20.9 FIXEDHF     0.800  0       0.0  0
2543    '* 4E2828        10.9     0.      13.6 FIXEDHF     0.800  0       0.0  0
2544    () 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 7f     -sp 8f
2545    () 3E1818         4.6     0.       5.8 FIXEDHF     0.800  0       0.0  0
2546    () 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2547    () 2D2828       101.8     0.     127.3 FIXEDHF     0.800  0       0.0  0
2548    () 2E2828        16.5     0.      20.6 FIXEDHF     0.800  0       0.0  0
2549    () 4E2828        10.7     0.      13.4 FIXEDHF     0.800  0       0.0  0
2550    (* 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 7f     -sp 9f
2551    (* 3E1818         4.0     0.       5.0 FIXEDHF     0.800  0       0.0  0
2552    (* 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2553    (* 2D2828        84.6     0.     105.8 FIXEDHF     0.800  0       0.0  0
2554    (* 2E2828        14.2     0.      17.8 FIXEDHF     0.800  0       0.0  0
2555    (* 4E2828         9.3     0.      11.6 FIXEDHF     0.800  0       0.0  0
2556    )* 0D1818         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0  sp 8f     -sp 9f
2557    )* 3E1818         3.4     0.       4.3 FIXEDHF     0.800  0       0.0  0
2558    )* 0D2828         0.0     0.       0.0 FIXEDHF     0.800  0       0.0  0
2559    )* 2D2828        71.4     0.      89.2 FIXEDHF     0.800  0       0.0  0
2560    )* 2E2828        12.2     0.      15.3 FIXEDHF     0.800  0       0.0  0
2561    )* 4E2828         7.9     0.       9.9 FIXEDHF     0.800  0       0.0  0
