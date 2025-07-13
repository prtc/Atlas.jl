      program paircoupling
      IMPLICIT REAL*8 (A-H,O-Z)
      dimension e(12,9)
      CHARACTER*80 LINES(12,9)
      fn3=39.1*7**3
      zeta=42.2
      zeta=63.3951*2./3.
      RYD=109732.298
      EION=(90883.854*4.+90820.469*2.)/6.
      Z=1.
      ALPHAD=5.48
      ALPHAQ=0.475
      L=3
      n=7
      EAV=EPOLAR(N,L,RYD,Z,EION,ALPHAD,ALPHAQ)
      print *,eav
c     7f 1.5[1.5] 2
      enorm=88645.33
c     enorm=eav+zeta/2+12f
c     12f=enorm-eav-zeta/2      
c     f=(enorm-eav-zeta/2)/12
      fnorm=(enorm-eav-zeta/2.)/12.
      do 17 n=4,9
      EAV=EPOLAR(N,L,RYD,Z,EION,ALPHAD,ALPHAQ)
      print *,eav
      READ(1,1)(LINES(I,N),I=1,12)
    1 FORMAT(A80)
      f=fnorm*(7./n)**3
c      J1.5  K4.5  J5
      e(1,n)=EAV+zeta/2+5*f
c      J1.5  K4.5  J4
      e(2,n)=EAV+zeta/2+5*f
c      J1.5  K3.5  J4
      e(3,n)=EAV-zeta/4-5*f+sqrt((3./4.*zeta-5*f)**2+75*f**2)
c      J1.5  K3.5  J3
      e(4,n)=EAV-zeta/4-5*f+sqrt((3./4.*zeta-5*f)**2+75*f**2)
c      J0.5  K3.5  J4
      e(5,n)=EAV-zeta/4-5*f-sqrt((3./4.*zeta-5*f)**2+75*f**2)
c      J0.5  K3.5  J3
      e(6,n)=EAV-zeta/4-5*f-sqrt((3./4.*zeta-5*f)**2+75*f**2)
c      J1.5  K2.5  J3
      e(7,n)=EAV-zeta/4-1.5*f+sqrt((3./4.*zeta-1.5*f)**2+180*f**2)
c      J1.5  K2.5  J2
      e(8,n)=EAV-zeta/4-1.5*f+sqrt((3./4.*zeta-1.5*f)**2+180*f**2)
c      J0.5  K2.5  J3
      e(9,n)=EAV-zeta/4-1.5*f-sqrt((3./4.*zeta-1.5*f)**2+180*f**2)
c      J0.5  K2.5  J2
      e(10,n)=EAV-zeta/4-1.5*f-sqrt((3./4.*zeta-1.5*f)**2+180*f**2)
c      J1.5  K1.5  J2
      e(11,n)=EAV+zeta/2+12*f
c      J1.5  K1.5  J1
      e(12,n)=EAV+zeta/2+12*f
      DO 15 I=1,12
c      print *,lines(i,n)
      WRITE(LINES(I,N)(7:20),'(F14.3)')E(I,N)
      print *,lines(i,n)
   15 CONTINUE
   17 CONTINUE
c
      L=4
      n=6
      EAV=EPOLAR(N,L,RYD,Z,EION,ALPHAD,ALPHAQ)
      print *,eav
c     6g 1.5[2.5] 2
      enorm=87837.76
c     enorm=eav+zeta/2+55f
c     55f=enorm-eav-zeta/2      
c     f=(enorm-eav-zeta/2)/55
      fnorm=(enorm-eav-zeta/2.)/55.
      do 17 n=5,9
      EAV=EPOLAR(N,L,RYD,Z,EION,ALPHAD,ALPHAQ)
      print *,eav
      READ(1,1)(LINES(I,N),I=1,12)
    1 FORMAT(A80)
      f=fnorm*(6./n)**3
c      J1.5  K5.5  J6
      e(1,n)=EAV+zeta/2+28*f
c      J1.5  K5.5  J5
      e(2,n)=EAV+zeta/2+28*f
c      J1.5  K4.5  J5
      e(3,n)=EAV-zeta/4-49./2*f+sqrt((3./4.*zeta-49./2*f)**2+2156*f**2)
c      J1.5  K4.5  J4
      e(4,n)=EAV-zeta/4-49./2*f+sqrt((3./4.*zeta-49./2*f)**2+2156*f**2)
c      J0.5  K4.5  J5
      e(5,n)=EAV-zeta/4-49./2*f-sqrt((3./4.*zeta-49./2*f)**2+2156*f**2)
c      J0.5  K4.5  J4
      e(6,n)=EAV-zeta/4-49./2*f-sqrt((3./4.*zeta-49./2*f)**2+2156*f**2)
c      J1.5  K3.5  J4
      e(7,n)=EAV-zeta/4-11*f+sqrt((3./4.*zeta-11*f)**2+4235*f**2)
c      J1.5  K3.5  J3
      e(8,n)=EAV-zeta/4-1.5*f+sqrt((3./4.*zeta-1.5*f)**2+180*f**2)
c      J0.5  K3.5  J4
      e(9,n)=EAV-zeta/4-1.5*f-sqrt((3./4.*zeta-1.5*f)**2+180*f**2)
c      J0.5  K3.5  J3
      e(10,n)=EAV-zeta/4-1.5*f-sqrt((3./4.*zeta-1.5*f)**2+180*f**2)
c      J1.5  K2.5  J2
      e(11,n)=EAV+zeta/2+55*f
c      J1.5  K2.5  J1
      e(12,n)=EAV+zeta/2+55*f
      DO 15 I=1,12
c      print *,lines(i,n)
      WRITE(LINES(I,N)(7:20),'(F14.3)')E(I,N)
      print *,lines(i,n)
   15 CONTINUE
   17 CONTINUE
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
