      PROGRAM TEST
      IMPLICIT REAL*8 (A-H,O-Z)
      character*1 lsym(9)
      data lsym/'s','p','d','f','g','h','i','k','l'/
      RYD=109732.298
      EION=386241.0
c1s2.2p  | 2P*   |    1/2    |   64484.0
c        |       |    3/2    |   64591.7
      Z=3.
C     Quinet, P. 1998, A & A Supp 129, 603-608. 
      ALPHAD=3.46
      ALPHAQ=0.
      DO 5 L=3,8
      DO 5 N=L+1,20      
      EAV=EPOLAR(N,L,RYD,Z,EION,ALPHAD,ALPHAQ)
      PRINT 3,N,lsym(L+1),EAV
c   3 format(' 2s',i1,a1,f12.3)
    3 format(' 2s',i2,a1,f12.3)
    5 CONTINUE
      EION=386241.0+(64484.0*2.+64591.7*4.)/6.
      DO 15 L=3,8
      DO 15 N=L+1,20      
      EAV=EPOLAR(N,L,RYD,Z,EION,ALPHAD,ALPHAQ)
      PRINT 13,N,lsym(L+1),EAV
   13 format(' 2p',i2,a1,f12.3)
   15 CONTINUE
      CALL EXIT
      END      
      FUNCTION EPOLAR(N,L,RYD,Z,EION,ALPHAD,ALPHAQ)
      IMPLICIT REAL*8 (A-H,O-Z)
      EHYD=RYD*Z**2/N**2
      ALPHA=7.29735308E-03
      X=N
      EREL=ALPHA**2*RYD*Z**4/N**4*(N/(L+.5)-3./4.)
      PNL=RYD*(3*N**2-L*(L+1))/(2*N**5*(L-.5)*L*(L+.5)*(L+1)*(L+1.5))
      QNL=RYD/PNL*(35*N**2-5*N**2*(6*L*(L+1)-5)+3*(L-1)*L*(L+1)*(L+2))/
     1(8*X**7*(L-1.5)*(L-1)*(L-.5)*L*(L+.5)*(L+1)*(L+1.5)*(L+2)*(L+2.5))
      EPOL=ALPHAD*Z**4*PNL*(1.+ALPHAQ/ALPHAD*Z**2*QNL)
      EPOLAR=EION-EHYD-EREL-EPOL
      RETURN
      END
