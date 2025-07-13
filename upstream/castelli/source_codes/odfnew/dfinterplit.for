      PROGRAM DFINTERPlit
      integer*2 kap1(25,57,12),kap2(25,57,12),kap3(25,57,12)
      DIMENSION STEPS(12),ISTEPS(12)
      read *,WT1,WT2
c      PRINT *,WT1,WT2
      DO 25 NU=1,1212
      do 55 itt=1,57
      READ(1)((KAP1(ipp,itt,istep),istep=1,12),ipp=1,25)
 55   continue
      do 56 itt=1,57
      READ(2)((KAP2(ipp,itt,istep),istep=1,12),ipp=1,25)
 56   continue
      DO 10 IP=1,25
      DO 10 IT=1,57
      DO 10 ISTEP=1,12
   10 KAP3(IP,IT,ISTEP)=WT1*KAP1(IP,IT,ISTEP)+WT2*KAP2(IP,IT,ISTEP) 
      do 57 itt=1,57
      WRITE(3)((KAP3(ipp,itt,istep),istep=1,12),ipp=1,25)
 57   continue
   25 CONTINUE
 550  CALL EXIT
      END
