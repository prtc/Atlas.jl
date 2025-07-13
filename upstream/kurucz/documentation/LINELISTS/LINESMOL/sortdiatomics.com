$setk4e
$!  first run molbin.com to create *.bin from *.asc
$COPY *.BIN DIATOMICS.DAT
$ASSIGN k4e: SORTWORK0
$ASSIGN k4f: SORTWORK1
$SORT/STAT/KEY=(POS:1,SIZE:8,G_FLOATING) diatomics.dat k4f:diatomics.srt
