$SETVALSUN
$ASSIGN pool:ptsGRID10.VEC PLOT
$RUN SYNTHE:PLOTGRIDIM
1.        .5        22.5      10.0      .1022     .2
X0        Y0        XEND      YEND      DX        DY        
         5         5        25      1000  
   NXSOLID   NYSOLID  NXDOUBLE  NYDOUBLE
$RASTERGRID pool:ptsgrid10
$EOJ
1.        .5        24.0      10.0      .08       .2
X0        Y0        XEND      YEND      DX        DY        
        10         5        50      1000  
   NXSOLID   NYSOLID  NXDOUBLE  NYDOUBLE
$RASTERPLOT pool:ptsgrid
$EOJ
1.0       .5        24.       10.9375   .08       .21875           
X0        Y0        XEND      YEND      DX        DY        
         5         5        25      1000  
   NXSOLID   NYSOLID  NXDOUBLE  NYDOUBLE
$RASTERPLOT GRID1300
$EOJ
2.0       .5        22.       10.9375   .08       .21875           
X0        Y0        XEND      YEND      DX        DY        
         5         5        25      1000  
   NXSOLID   NYSOLID  NXDOUBLE  NYDOUBLE
$RASTERPLOT GRID1300
$EOJ
2.0       .5        21.84     10.9375   .084      .21875           
X0        Y0        XEND      YEND      DX        DY        
        10         5        50      1000  
   NXSOLID   NYSOLID  NXDOUBLE  NYDOUBLE
$RASTERPLOT GRID2000
$EOJ
2.0       .5        22.44     10.9375   .11       .21875           
X0        Y0        XEND      YEND      DX        DY        
        10         5      1000      1000  
   NXSOLID   NYSOLID  NXDOUBLE  NYDOUBLE
$RASTERPLOT GRID4000
$EOJ
$ASSIGN GRID5000.VEC PLOT
$RUN SYNTHE:PLOTGRIDIM
2.0       .5        22.22     10.9375   .11       .21875           
X0        Y0        XEND      YEND      DX        DY        
        10         5      1000      1000  
   NXSOLID   NYSOLID  NXDOUBLE  NYDOUBLE
$RASTERPLOT GRID5000
