	PROGRAM BETAODFASCTOBIN
	INTEGER*2 KAP(21,56,12,5)
	REAL*8 WLBEG(50), WLEND(50)
	OPEN(UNIT=1,STATUS='OLD')
	OPEN(UNIT=2,STATUS='NEW',FORM='UNFORMATTED')
	DO 7 IWL=1,50
	READ(1,*)WLBEG(IWL),WLEND(IWL)
	type*,wlbeg(iwl),wlend(iwl)
	DO 5 IV=1,5
	DO 5 IT=1,56
	DO 5 IP=1,21
	READ(1,*)(KAP(IP,IT,ISTEP,IV),ISTEP=1,12)
5	CONTINUE
	WRITE(2)wlbeg(iwl),wlend(iwl),((((kap(ip,it,istep,iv),
	1 ip=1,21), it=1,56), istep=1,12), iv=1,5)
7	continue
	stop
	end

