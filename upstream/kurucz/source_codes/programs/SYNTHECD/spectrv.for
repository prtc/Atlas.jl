      PROGRAM SPECTR
c     revised 18oct93
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)                                      
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)                                         
      COMMON /BAL/BAL1(kw,9),AAL1(kw),SAL1(kw),XNFPAL(kw,2),BAL2(kw,1)          
      COMMON /BB/BB1(kw,7),XNFPB(kw,1)                                          
      COMMON /BC/BC1(kw,14),AC1(kw),SC1(kw),XNFPC(kw,2),BC2(kw,6)               
      COMMON /BCA/BCA1(kw,8),BCA2(kw,5),XNFPCA(kw,2)                            
      COMMON /BFE/BFE1(kw,15),AFE1(kw),SFE1(kw),XNFPFE(kw,1)                       
      COMMON /BHE/BHE1(kw,29),AHE1(kw),SHE1(kw),BHE2(kw,6),AHE2(kw),            
     1            SHE2(kw),AHEMIN(kw),SIGHE(kw),XNFPHE(kw,3),XNFHE(kw,2)        
      COMMON /BHYD/BHYD(kw,8),AHYD(kw),SHYD(kw),AH2P(kw),BMIN(kw),              
     1             AHMIN(kw),SHMIN(kw),SIGH(kw),SIGH2(kw),AHLINE(kw),           
     2             SHLINE(kw),XNFPH(kw,2),XNFH(kw)                              
      COMMON /BK/BK1(kw,8),XNFPK(kw,1)                                       
      COMMON /BMG/BMG1(kw,11),AMG1(kw),SMG1(kw),XNFPMG(kw,2),BMG2(kw,6)         
      COMMON /BNA/BNA1(kw,8),XNFPNA(kw,1)                                       
      COMMON /BO/BO1(kw,13),XNFPO(kw,1),BO2(kw,4)
      COMMON /BSI/BSI1(kw,11),ASI1(kw),SSI1(kw),XNFPSI(kw,2),BSI2(kw,10)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),                 
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,           
     2             IFCONV                                                       
      REAL*8 MIXLTH                                                             
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99),XABUND(99),WTMOLE              
      COMMON /FLUX/FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)                        
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw),WAVENO                
      COMMON /FRESET/FRESET(500),RCOSET(500),NULO,NUHI,NUMNU,IFWAVE,            
     1               WBEGIN,DELTAW                                              
      COMMON /HEIGHT/HEIGHT(kw)                                                 
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,IFMOL,NLTEON,IFOP(20)              
      COMMON /ITER/ITER,IFPRNT(15),IFPNCH(15),NUMITS                            
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE                              
      COMMON /MUS/ANGLE(20),SURFI(20),NMU                                       
      COMMON /OPS/ACOOL(kw),ALUKE(kw),AHOT(kw),SIGEL(kw),ALINES(kw),            
     1            SIGLIN(kw),AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),          
     2            SXLINE(kw),SXCONT(kw)                                         
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),         
     1              SIGMAL(kw)                                                  
      COMMON /PUT/PUT,IPUT                                                      
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),EDENS(kw)        
      REAL*8 KNU                                                                
      COMMON /RAD/ACCRAD(kw),PRAD(kw)                                           
      COMMON /RHOX/RHOX(kw),NRHOX                                               
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw),PTOTAL(kw)                 
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)                
      REAL*8 JNU,JMINS                                                          
      COMMON /TEFF/TEFF,GRAV,GLOG                                               
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),ITEMP,HCKT(kw)        
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,           
     1               IFTURB                                                     
C                                                                               
      COMMON /LINDAT/WL,E,EP,LABEL(2),LABELP(2),OTHER1(2),OTHER2(2),
     1        WLVAC,CENTER,CONCEN, NELION,GAMMAR,GAMMAS,GAMMAW,REF,
     2      NBLO,NBUP,ISO1,X1,ISO2,X2,GFLOG,XJ,XJP,CODE,ELO,GF,GS,GR,GW,
     3        DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,EXTRA1,EXTRA2,EXTRA3
     4,ALINEC(kw)                                                               
      REAL*8 LINDAT8(14)
      REAL*4 LINDAT(28)
      EQUIVALENCE (LINDAT8(1),WL),(LINDAT(1),NELION)
      REAL*8 RESOLU,RATIO,RATIOLG,SIGMA2,WLBEG,WLEND
      REAL*8 WL,E,EP,WLVAC,CENTER,CONCEN
      REAL*8 LABEL,LABELP,OTHER1,OTHER2
      REAL*4 GFLOG,XJ,XJP,CODE,GAMMAR,GAMMAS,GAMMAW
      REAL*4 REF,X1,X2,ELO,GF,GS,GR,GW
      REAL*4 DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,EXTRA1,EXTRA2,EXTRA3
      REAL*4 ALINEC
      COMMON /TRASH/NMU2,WLBEG,WLEND,VT,N10,IFVAC,AIR                           
      COMMON /CORONO/RHOXCO(42),TCO(42),XNECO(42),SCO(42),TCOLOG(42),           
     1               VCO(42),ACORON(42),SCORON(42),IFCORO,NCORO                 
      COMMON /BONE/BONE(kw)                                                     
      COMMON /EDGE/FRQEDG(200),WLEDGE(200),CMEDGE(200),NEDGE
      COMMON /PRD/PRDDOP,PRDPOW,ITPRD,NITPRD,SIGPRD(kw),NUPRD,LINPRD
      REAL*4 TURBV
C      DIMENSION FSCAT(kw),ASYNTH(kw)                                            
      DIMENSION FSCAT(kw)                                            
      REAL*4 ASYNTH(kw)                                            
      DIMENSION BFUDGE(kw)                                                      
C     41=2*20+1 SO NOT EQUAL 40                                                 
      DIMENSION Q(41)                                                           
      DIMENSION SURF(20)                                                        
      DIMENSION APLOT(101)
      DATA APLOT/101*1H /
C     RHOXJ IS THE DEPTH ABOVE WHICH THE LINE SOURCE FUNCTION IS J              
C     R1 IS THE RESIDUAL INTENSITY AT THE BOTTOM OF THE PLOT                    
C     R2 IS THE RESIDUAL INTENSITY AT THE TOP                                   
C     PRDPOW AND PRDDOP ARE PARTIAL REDISTRIBUTION PARAMETERS
      CALL BEGTIME
      READ(25,1)RHOXJ,R1,R101,PH1,PC1,PSI1,PRDDOP,PRDPOW
    1 FORMAT(8F10.5)                                                            
      WRITE(6,1)RHOXJ,R1,R101,PH1,PC1,PSI1,PRDDOP,PRDPOW
      SLOPE=100./(R101-R1)                                                      
      ORIGIN=1.5-R1*SLOPE                                                       
      OPEN(UNIT=5,SHARED,READONLY,TYPE='OLD')
      CALL READIN(20)                                                           
      IFPRES=0                                                                  
      ITEMP=1                                                                   
      CALL POPS(1.00D0,12,XNFH)                                             
      CALL POPS(2.01D0,12,XNFHE)                                            
      CALL POPS(1.01D0,11,XNFPH)                                            
      CALL POPS(2.02D0,11,XNFPHE)                                           
      CALL POPS(5.00D0,11,XNFPB)                                            
      CALL POPS(6.01D0,11,XNFPC)                                            
      CALL POPS(8.00D0,11,XNFPO)                                            
      CALL POPS(11.00D0,11,XNFPNA)                                          
      CALL POPS(12.01D0,11,XNFPMG)                                          
      CALL POPS(13.01D0,11,XNFPAL)                                          
      CALL POPS(14.01D0,11,XNFPSI)                                          
      CALL POPS(20.01D0,11,XNFPCA)                                          
      CALL POPS(26.00D0,11,XNFPFE)                                          
      CLOSE(UNIT=5)
      IF(IFMOL.EQ.0.)GO TO 445                                                  
C     PATCH TO GET NUMBER DENSITIES BY MULTIPLYING BY PARTITION FUNCTION        
      DO 444 J=1,NRHOX                                                          
      CALL PFSAHA(J,1,1,3,XNFH)                                                 
      XNFH(J)=XNFPH(J,1)*XNFH(J)
      CALL PFSAHA(J,2,2,13,XNFHE)                                               
      XNFHE(J,1)=XNFPHE(J,1)*XNFHE(J,1)                                         
      XNFHE(J,2)=XNFPHE(J,2)*XNFHE(J,2)                                         
  444 CONTINUE                                                                  
  445 CONTINUE                                                                  
C     CALL W(6HXNFPH ,XNFPH ,80)                                                
C     CALL W(6HXNFPHE,XNFPHE,120)                                               
C     CALL W(6HXNFPC ,XNFPC ,80)                                                
C     CALL W(6HXNFPMG,XNFPMG,80)                                                
C     CALL W(6HXNFPAL,XNFPAL,80)                                                
C     CALL W(6HXNFPSI,XNFPSI,80)                                                
      DO 4 J=1,NRHOX                                                            
      BONE(J)=1.                                                                
      BFUDGE(J)=BHYD(J,1)**PH1*(BC1(J,1)/BC2(J,1))**PC1*                        
     1(BSI1(J,1)/BSI2(J,1))**PSI1                                               
      IF(RHOXJ.EQ.0.)GO TO 4                                                    
      FSCAT(J)=0.                                                               
      IF(RHOX(J)/RHOXJ.LT.100.)FSCAT(J)=EXP(-RHOX(J)/RHOXJ)                     
    4 CONTINUE                                                                  
      CALL W(6HFSCAT ,FSCAT,NRHOX)                                              
      CALL W(6HBFUDGE,BFUDGE,NRHOX)                                             
    5 CONTINUE                                                                  
      IFPRES=0                                                                  
      ITEMP=1                                                                   
      REWIND 7                                                                  
C     READ(8)NLINES
C      CLOSE(UNIT=8,DISPOSE='DELETE')
      REWIND 9                                                                  
      READ(9)WLBEG,RESOLU,WLEND,LENGTH,N,LINOUT,TURBV,IFVAC                             
      READ (9)NEDGE,(FRQEDG(IEDGE),WLEDGE(IEDGE),CMEDGE(IEDGE),                 
     1IEDGE=1,NEDGE)                                                            
C     PATCH TO PASS IFVAC TO PLOTSY
      TITLE(74)=1HA
      IF(IFVAC.EQ.1)TITLE(74)=1HV
      N30=N+30                                                                  
      WRITE(6,11)WLBEG,RESOLU,WLEND,LENGTH,N                                      
   11 FORMAT(7H WLBEG=,F10.4,10H   RESOLU=,F10.1,9H   WLEND=,F10.4,                
     110H   LENGTH=,I6,9H   NRHOX=,I2)                                          
      N10=0                                                                     
      DO 6 J=1,NRHOX                                                            
    6 VTURB(J)=VTURB(J)+TURBV*1.E5                                              
      RATIO=1.+1./RESOLU
      RATIOLG=DLOG(RATIO)
      IXWL=DLOG(WLBEG)/RATIOLG
      WBEGIN=DEXP(IXWL*RATIOLG)
      IF(WBEGIN.LT.WLBEG)THEN
      IXWL=IXWL+1                                                              
      WBEGIN=DEXP(IXWL*RATIOLG)
      ENDIF
      DELTAW=RESOLU                                                               
      NULO=1                                                                    
      NUHI=LENGTH                                                               
      NUMNU=LENGTH                                                              
      WLBEG=WBEGIN                                                              
      WLEND=WBEGIN*RATIO**(NUHI-1)                                      
      WRITE(6,31)NUMNU,DELTAW,WLBEG,WLEND                                       
   31 FORMAT(I10,3F13.4)                                                        
      IF(IFSURF.EQ.1)WRITE(6,41)                                                
   41 FORMAT(13H SURFACE FLUX)                                                  
      IF(IFSURF.EQ.2)WRITE(6,42)NMU,(ANGLE(MU),MU=1,NMU)                        
   42 FORMAT(18H SURFACE INTENSITY,I3/20F6.3)                                   
      NMU2=NMU*2                                                                
      IF(PRDDOP.GT.0.)CALL PRDJNU(RHOXJ)
      DO 25 NU=NULO,NUHI                                                        
      NUPRD=NU
      WAVE=WBEGIN*RATIO**(NU-1)                                         
      CALL CONT3(WAVE,SURF,RHOXJ)                                               
      FREQ=2.997925E17/WAVE                                                     
      FREQ15=FREQ/1.E15
      FREQLG= LOG(FREQ)                                                         
      DO 20 J=1,NRHOX                                                           
      EHVKT(J)=EXP(-FREQ*HKT(J))                                                
      STIM(J)=1.-EHVKT(J)                                                       
   20 BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)
      IF(IFOP(14).EQ.1)CALL HLINOP                                              
      IF(IFOP(17).EQ.1)CALL XLINOP                                              
      IF(NU.EQ.1)WRITE(6,33)                                                    
   33 FORMAT(1H1)                                                               
      READ(9)ASYNTH
C     SSYNTH=BNU                                                                
C      IF(RHOXJ.GT.0.)GO TO 240                                                  
C      DO 23 J=1,NRHOX                                                           
C      ALINE(J)=AHLINE(J)+ASYNTH(J)+AXLINE(J)                                    
C      SLINE(J)=BNU(J)                                                           
CC     ASSUMES BUP=1                                                             
C      SSYNTH=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))                                
C      IF(ALINE(J).GT.0.)SLINE(J)=(AHLINE(J)*SHLINE(J)+ASYNTH(J)*SSYNTH+         
C     1AXLINE(J)*SXLINE(J))/ALINE(J)                                             
C      SIGMAL(J)=0.                                                              
C   23 CONTINUE                                                                  
C      CALL JOSH(0,IFSURF)                                                       
C      GO TO 24                                                                  
  240 DO 241 J=1,NRHOX                                                          
      ALINE(J)=AHLINE(J)+ASYNTH(J)*(1.-FSCAT(J))+AXLINE(J)                      
      SLINE(J)=BNU(J)                                                           
C     ASSUMES BUP=1                                                             
      SSYNTH=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))                                
      IF(ALINE(J).GT.0.)SLINE(J)=(AHLINE(J)*SHLINE(J)+ASYNTH(J)*SSYNTH*
     1(1.-FSCAT(J))+AXLINE(J)*SXLINE(J))/ALINE(J)                        
  241 SIGMAL(J)=ASYNTH(J)*FSCAT(J)                                              
      CALL JOSH(1,IFSURF)                                                       
   24 DO 250 MU=1,NMU                                                           
      IF(IFSURF.EQ.1)RESID=HNU(1)/SURF(MU)                                      
      IF(IFCORO.EQ.1)CALL CORINT                                                
      IF(IFSURF.EQ.2)RESID=SURFI(MU)/SURF(MU)                                   
      IRESID=RESID*1000.+.5                                                     
      IF(NU.GT.ABS(LINOUT))GO TO 230                                                 
      IF(MU.GT.1)GO TO 230                                                      
      IPLOT=RESID*SLOPE+ORIGIN                                                  
      IPLOT=MAX0(1,MIN0(101,IPLOT))                                             
      APLOT(IPLOT)=1HX
      WRITE(6,2300)NU,WAVE,IRESID,APLOT
 2300 FORMAT(1H ,I5,F11.4,I7,101A1)
      APLOT(IPLOT)=(1H )
  230 CONTINUE                                                                  
      Q(MU)=RESID*SURF(MU)                                                      
      Q(MU+NMU)=SURF(MU)                                                        
  250 CONTINUE                                                                  
      IF(NU.GT.1)GO TO 251                                                      
      REWIND 7                                                                  
      WRITE(7)TEFF,GLOG,TITLE,WBEGIN,DELTAW,NUMNU,IFSURF,NMU,ANGLE,             
     1NEDGE,WLEDGE                                                              
  251 CONTINUE                                                                  
      WRITE(7)(Q(I),I=1,NMU2)
   25 CONTINUE                                                                  
      CALL ENDTIME
      CALL BEGTIME
C                                                                               
      IF(NMU.GT.10)IFSURF=1                                                     
      NMU=1                                                                     
      MU=1                                                                      
      READ(9)NLINES
      N910=NLINES+N10                                                           
      WRITE(7)N910                                                              
      WRITE(6,80)NLINES,N10,N910                                                
   80 FORMAT(3I10)                                                              
      IF(NLINES.EQ.0)GO TO 100                                                  
      DO 90 ILINE=1,NLINES                                                      
      READ(9)LINDAT8,LINDAT,ALINEC
      WAVE=WLVAC                                                                
      CALL CONT3(WAVE,CONCEN,RHOXJ) 
      FREQ=2.997925E17/WAVE                                                     
      FREQ15=FREQ/1.E15
      FREQLG= LOG(FREQ)                                                         
      DO 81 J=1,NRHOX                                                           
      EHVKT(J)=EXP(-FREQ*HKT(J))                                                
      STIM(J)=1.-EHVKT(J)                                                       
      SIGPRD(J)=0.
   81 BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)
C      CALL KAPP(0,NSTEPS,STEPWT)
C      CALL JOSH(1,IFSURF)
C      IF(IFSURF.EQ.1)CONCEN=HNU(1)                                              
C      IF(IFSURF.EQ.2)CONCEN=SURFI(MU)                                           
      DO 82 J=1,NRHOX
      ALINE(J)=AHLINE(J)+ALINEC(J)*(1.-FSCAT(J))+AXLINE(J)                      
      SLINE(J)=BNU(J)                                                           
C     ASSUMES BUP=1                                                             
      SLINEC=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))                                
      IF(ALINE(J).GT.0.)SLINE(J)=(AHLINE(J)*SHLINE(J)+ALINEC(J)*SLINEC*
     1(1.-FSCAT(J))+AXLINE(J)*SXLINE(J))/ALINE(J)                        
   82 SIGMAL(J)=ALINEC(J)*FSCAT(J)                                              
      CALL JOSH(1,IFSURF)                                                       
      IF(IFSURF.EQ.1)CENTER=HNU(1)                                              
      IF(IFSURF.EQ.2)CENTER=SURFI(MU)                                           
      RESID=CENTER/CONCEN                                                       
C      WRITE(6,99)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,WLVAC,RESID,            
C     BCENTER,CONCEN,                                                            
C     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,            
C     2DWL,DGFLOG,GAMMAR,GAMMAS,GAMMAW
   99 FORMAT(1H0,F10.4,F7.3,F5.1,F12.3,F5.1,F12.3,F9.2,1X,A8,A2,A8,A2,
     1F12.4,F9.3,1P2E11.3/                                                      
     2 1X,0PF10.4,I4,F6.2,F6.2,F6.2,A4,I2,I2,I3,F7.3,I3,F7.3,1X,
     3A8,A2,A8,A2,F7.4,F7.3,3F6.2)
      IF(WL.GT.0.)WRITE(17,98)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,
     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,            
     2DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW
      IF(WL.LT.0.)WRITE(17,98)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,
     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,            
     2DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,WL
   98 FORMAT(F10.4,F7.3,F5.1,F12.3,F5.1,F12.3,F9.2,A8,A2,A8,A2/
     1 0PF10.4,I4,F6.2,F6.2,F6.2,A4,I2,I2,I3,F7.3,I3,F7.3,
     2A8,A2,A8,A2,F7.4,F7.3,3F6.2,F10.4)
      WRITE(7)LINDAT8,LINDAT
   90 CONTINUE                                                                  
  100 CONTINUE                                                                  
      CLOSE(UNIT=9,DISPOSE='DELETE')
      IF(N10.EQ.0)GO TO 111                                                     
C     N20=N10                                                                   
      REWIND 20                                                                 
      CALL CONT3(WBEGIN-1.,SURF,RHOXJ)                                          
      DO 110 ILINE=1,N10                                                        
      READ(20)LINDAT8,LINDAT
      WAVE=WLVAC                                                                
      CALL CONT3(WAVE,SURF,RHOXJ)                                               
      FREQ=2.997925E17/WAVE                                                     
      FREQ15=FREQ/1.E15
      FREQLG= LOG(FREQ)                                                         
      DO 101 J=1,NRHOX                                                          
      EHVKT(J)=EXP(-FREQ*HKT(J))                                                
      STIM(J)=1.-EHVKT(J)                                                       
      SIGMAL(J)=0.                                                              
  101 BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)
      CALL LINCEN                                                               
      IF(IFCORO.EQ.1)GO TO 102                                                  
      IF(RHOXJ.EQ.0.)CALL JOSH(0,IFSURF)                                        
      IF(RHOXJ.GT.0.)CALL JOSH(1,IFSURF)                                        
      IF(IFSURF.EQ.1)CENTER=HNU(1)                                              
      IF(IFSURF.EQ.2)CENTER=SURFI(MU)                                           
      GO TO 103                                                                 
  102 SURFI(MU)=SURF(MU)                                                        
      CALL CORINT                                                               
      CENTER=SURFI(MU)                                                          
  103 CONCEN=SURF(MU)                                                           
      RESID=CENTER/CONCEN                                                       
      WRITE(6,99)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,WLVAC,RESID,            
     BCENTER,CONCEN,                                                            
     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2            
     2DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW
      WRITE(7)LINDAT8,LINDAT
  110 CONTINUE                                                                  
      CLOSE(UNIT=20,DISPOSE='DELETE')
  111 CALL ENDTIME
      CALL EXIT                                                                 
      END                                                                       
      SUBROUTINE CONT3(WWWW,SURF,RHOXJ)                                         
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)                                         
      COMMON /BAL/BAL1(kw,9),AAL1(kw),SAL1(kw),XNFPAL(kw,2),BAL2(kw,1)
      COMMON /BB/BB1(kw,7),XNFPB(kw,1)
      COMMON /BC/BC1(kw,14),AC1(kw),SC1(kw),XNFPC(kw,2),BC2(kw,6)
      COMMON /BCA/BCA1(kw,8),BCA2(kw,5),XNFPCA(kw,2)
      COMMON /BFE/BFE1(kw,15),AFE1(kw),SFE1(kw),XNFPFE(kw,1)
      COMMON /BHE/BHE1(kw,29),AHE1(kw),SHE1(kw),BHE2(kw,6),AHE2(kw),
     1            SHE2(kw),AHEMIN(kw),SIGHE(kw),XNFPHE(kw,3),XNFHE(kw,2)
      COMMON /BHYD/BHYD(kw,8),AHYD(kw),SHYD(kw),AH2P(kw),BMIN(kw),
     1             AHMIN(kw),SHMIN(kw),SIGH(kw),SIGH2(kw),AHLINE(kw),
     2             SHLINE(kw),XNFPH(kw,2),XNFH(kw)
      COMMON /BK/BK1(kw,8),XNFPK(kw,1)
      COMMON /BMG/BMG1(kw,11),AMG1(kw),SMG1(kw),XNFPMG(kw,2),BMG2(kw,6)
      COMMON /BNA/BNA1(kw,8),XNFPNA(kw,1)
      COMMON /BO/BO1(kw,13),XNFPO(kw,1),BO2(kw,4)
      COMMON /BSI/BSI1(kw,11),ASI1(kw),SSI1(kw),XNFPSI(kw,2),BSI2(kw,10)
      COMMON /OPS/ACOOL(kw),ALUKE(kw),AHOT(kw),SIGEL(kw),ALINES(kw),
     1            SIGLIN(kw),AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),
     2            SXLINE(kw),SXCONT(kw)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),                 
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,           
     2             IFCONV                                                       
      REAL*8 MIXLTH                                                             
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw),WAVENO                
      COMMON /FRESET/FRESET(500),RCOSET(500),NULO,NUHI,NUMNU,IFWAVE,            
     1               WBEGIN,DELTAW                                              
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,IFMOL,NLTEON,IFOP(20)              
      COMMON /MUS/ANGLE(20),SURFI(20),NMU                                       
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),         
     1              SIGMAL(kw)                                                  
      COMMON /RHOX/RHOX(kw),NRHOX                                               
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)                
      REAL*8 JNU,JMINS                                                          
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),ITEMP,HCKT(kw)        
      COMMON /EDGE/FRQEDG(200),WLEDGE(200),CMEDGE(200),NEDGE
      COMMON /PRD/PRDDOP,PRDPOW,ITPRD,NITPRD,SIGPRD(kw),NUPRD,LINPRD
      DIMENSION AB1(kw),AB2(kw),AB3(kw),S1(kw),S2(kw),S3(kw)                    
      DIMENSION SURF1(20),SURF2(20),SURF3(20),SURF(20)                          
      DIMENSION SIG1(kw),SIG2(kw),SIG3(kw)                                      
      DATA WAVE1,WAVE3,WAVEOLD/0.,0.,0./                                                   
      WAVE=WWWW                                                                 
      IF(WAVE.LT.WAVEOLD)GO TO 29                                                 
      IF(WAVE.LT.WAVE1)GO TO 29                                                 
      IF(WAVE.LE.WAVE3)GO TO 190                                                
      IF(WAVE3.GT.0.)GO TO 60                                                   
   29 WLBEG=WBEGIN                                                              
      RESOLU=DELTAW
      RATIO=1.+1./RESOLU
      WLEND=WBEGIN*RATIO**(NUHI-1)                                      
      WAVE1=WLBEG                                                               
      WAVE3=WLEND                                                               
      WAVE2=(WAVE1+WAVE3)/2.                                                    
      DO 30 I=1,NEDGE                                                           
      IEDGE=NEDGE+1-I                                                           
      IF(ABS(WLEDGE(IEDGE)).GT.WLBEG)GO TO 31                                   
   30 CONTINUE                                                                  
      GO TO 70                                                                  
   31 IF(ABS(WLEDGE(IEDGE)).GT.WLEND)GO TO 70                                   
      WAVE3=ABS(WLEDGE(IEDGE))                                                  
      WAVE2=(WAVE1+WAVE3)/2.                                                    
      GO TO 70                                                                  
   60 IEDGE=IEDGE-1                                                             
      WAVE1=ABS(WLEDGE(IEDGE+1))                                                
      WAVE3=ABS(WLEDGE(IEDGE))                                                  
      WAVE3= MIN (WAVE3,WLEND)                                                  
      WAVE2=(WAVE1+WAVE3)/2.                                                    
   70 WAVE=WAVE1+.00001                                                         
      FREQ=2.997925E17/WAVE                                                     
      FREQ15=FREQ/1.E15
      FREQLG= LOG(FREQ)                                                         
      WAVENO=FREQ/2.997925E10                                                   
      DO 10 J=1,NRHOX                                                           
      EHVKT(J)=EXP(-FREQ*HKT(J))                                                
      STIM(J)=1.-EHVKT(J)                                                       
      SIGPRD(J)=0.
   10 BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)
      CALL KAPP(0,NSTEPS,STEPWT)                                                
      CALL JOSH(IFSCAT,0)                                                       
C      DO 11 J=1,NRHOX                                                           
C      SIG1(J)=0.                                                                
C      AB1(J)=ABTOT(J)                                                           
C   11 S1(J)=SNU(J)                                                              
C      IF(RHOXJ.EQ.0.)GO TO 310                                                  
      DO 305 J=1,NRHOX                                                          
      AB1(J)=ACONT(J)                                                           
      SIG1(J)=SIGMAC(J)                                                         
  305 S1(J)=SCONT(J)                                                            
C      CALL W(6HAAL1  ,AAL1,NRHOX)                                                
C      CALL W(6HAC1   ,AC1,NRHOX)                                                
C      CALL W(6HAFE1  ,AFE1,NRHOX)                                                
C      CALL W(6HAHE1  ,AHE1,NRHOX)                                                
C      CALL W(6HAHE2  ,AHE2,NRHOX)                                                
C      CALL W(6HAHEMIN,AHEMIN,NRHOX)                                                
C      CALL W(6HSIGHE ,SIGHE,NRHOX)                                                
C      CALL W(6HAHYD  ,AHYD,NRHOX)                                                
C      CALL W(6HAH2P  ,AH2P,NRHOX)                                                
C      CALL W(6HAHMIN ,AHMIN,NRHOX)                                                
C      CALL W(6HSIGH  ,SIGH,NRHOX)                                                
C      CALL W(6HSIGH2 ,SIGH2,NRHOX)                                                
C      CALL W(6HAMG1  ,AMG1,NRHOX)                                                
C      CALL W(6HASI1  ,ASI1,NRHOX)                                                
C      CALL W(6HACOOL ,ACOOL,NRHOX)                                                
C      CALL W(6HALUKE ,ALUKE,NRHOX)                                                
C      CALL W(6HAHOT  ,AHOT,NRHOX)                                                
C      CALL W(6HSIGEL ,SIGEL,NRHOX)                                                
  310 CONTINUE                                                                  
      CALL JOSH(IFSCAT,IFSURF)                                                  
C     CALL W(6HACONT ,ACONT,NRHOX)
C     CALL W(6HSIGMAC,SIGMAC,NRHOX)
C     CALL W(6HABTOT ,ABTOT,NRHOX)
C     CALL W(6HTAUNU ,TAUNU,NRHOX)
      DO 110 MU=1,NMU                                                           
      IF(IFSURF.EQ.1)SURF1(MU)=HNU(1)                                           
      IF(IFSURF.EQ.2)SURF1(MU)=SURFI(MU)                                        
  110 CONTINUE                                                                  
      WAVE=WAVE2                                                                
      FREQ=2.997925E17/WAVE                                                     
      FREQ15=FREQ/1.E15
      FREQLG= LOG(FREQ)                                                         
      WAVENO=FREQ/2.997925E10                                                   
      DO 12 J=1,NRHOX                                                           
      EHVKT(J)=EXP(-FREQ*HKT(J))                                                
      STIM(J)=1.-EHVKT(J)                                                       
      SIGPRD(J)=0.
   12 BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)
      CALL KAPP(0,NSTEPS,STEPWT)                                                
      CALL JOSH(IFSCAT,0)                                                       
C      DO 13 J=1,NRHOX                                                           
C      SIG2(J)=0.                                                                
C      AB2(J)=ABTOT(J)                                                           
C   13 S2(J)=SNU(J)                                                              
C      IF(RHOXJ.EQ.0.)GO TO 320                                                  
      DO 315 J=1,NRHOX                                                          
      AB2(J)=ACONT(J)                                                           
      SIG2(J)=SIGMAC(J)                                                         
  315 S2(J)=SCONT(J)                                                            
  320 CONTINUE                                                                  
      CALL JOSH(IFSCAT,IFSURF)                                                  
      DO 130 MU=1,NMU                                                           
      IF(IFSURF.EQ.1)SURF2(MU)=HNU(1)                                           
      IF(IFSURF.EQ.2)SURF2(MU)=SURFI(MU)                                        
  130 CONTINUE                                                                  
      WAVE=WAVE3-.00001                                                         
      FREQ=2.997925E17/WAVE                                                     
      FREQ15=FREQ/1.E15
      FREQLG= LOG(FREQ)                                                         
      WAVENO=FREQ/2.997925E10                                                   
      DO 14 J=1,NRHOX                                                           
      EHVKT(J)=EXP(-FREQ*HKT(J))                                                
      STIM(J)=1.-EHVKT(J)                                                       
      SIGPRD(J)=0.
   14 BNU(J)=1.47439E-02*FREQ15**3*EHVKT(J)/STIM(J)
      CALL KAPP(0,NSTEPS,STEPWT)                                                
      CALL JOSH(IFSCAT,0)                                                       
C      DO 15 J=1,NRHOX                                                           
C      SIG3(J)=0.                                                                
C      AB3(J)=ABTOT(J)                                                           
C   15 S3(J)=SNU(J)                                                              
C      IF(RHOXJ.EQ.0.)GO TO 330                                                  
      DO 325 J=1,NRHOX                                                          
      AB3(J)=ACONT(J)                                                           
      SIG3(J)=SIGMAC(J)                                                         
  325 S3(J)=SCONT(J)                                                            
  330 CONTINUE                                                                  
      CALL JOSH(IFSCAT,IFSURF)                                                  
      DO 150 MU=1,NMU                                                           
      IF(IFSURF.EQ.1)SURF3(MU)=HNU(1)                                           
      IF(IFSURF.EQ.2)SURF3(MU)=SURFI(MU)                                        
  150 CONTINUE                                                                  
      WRITE(6,39)WAVE1,WAVE2,WAVE3                                              
   39 FORMAT(3F15.4)                                                            
      CALL W(6HAB1   ,AB1,NRHOX)                                                
      CALL W(6HAB2   ,AB2,NRHOX)                                                
      CALL W(6HAB3   ,AB3,NRHOX)                                                
      CALL W(6HSIG1  ,SIG1,NRHOX)                                               
      CALL W(6HSIG2  ,SIG2,NRHOX)                                               
      CALL W(6HSIG3  ,SIG3,NRHOX)                                               
      CALL W(6HS1    ,S1,NRHOX)                                                 
      CALL W(6HS2    ,S2,NRHOX)                                                 
      CALL W(6HS3    ,S3,NRHOX)                                                 
      CALL W(6HSURF1 ,SURF1,NMU)                                                
      CALL W(6HSURF2 ,SURF2,NMU)                                                
      CALL W(6HSURF3 ,SURF3,NMU)                                                
      WAVE=WWWW                                                                 
  190 CONTINUE                                                                  
      C1=(WAVE-WAVE2)*(WAVE-WAVE3)/(WAVE1-WAVE2)/(WAVE1-WAVE3)                  
      C2=(WAVE-WAVE1)*(WAVE-WAVE3)/(WAVE2-WAVE1)/(WAVE2-WAVE3)                  
      C3=(WAVE-WAVE1)*(WAVE-WAVE2)/(WAVE3-WAVE1)/(WAVE3-WAVE2)                  
      DO 200 MU=1,NMU                                                           
  200 SURF(MU)=(C1*SURF1(MU)/WAVE1**2+C2*SURF2(MU)/WAVE2**2+                    
     1C3*SURF3(MU)/WAVE3**2)*WAVE**2                                            
C 200 SURF(MU)=C1*SURF1(MU)+C2*SURF2(MU)+C3*SURF3(MU)                           
      DO 210 J=1,NRHOX                                                          
      ACONT(J)=C1*AB1(J)+C2*AB2(J)+C3*AB3(J)                                    
      SCONT(J)=C1*S1(J)+C2*S2(J)+C3*S3(J)                                       
      SIGPRD(J)=0.
  210 SIGMAC(J)=C1*SIG1(J)+C2*SIG2(J)+C3*SIG3(J)                                
      WAVEOLD=WWWW
      RETURN                                                                    
      END                                                                       
      SUBROUTINE LINCEN                                                         
      RETURN                                                                    
      END                                                                       
      SUBROUTINE CORINT                                                         
      RETURN                                                                    
      END                                                                       
      SUBROUTINE ATLAS7
      END
      SUBROUTINE PRDJNU
      RETURN
      END
