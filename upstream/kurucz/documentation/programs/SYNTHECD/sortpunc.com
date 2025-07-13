$SETPOOL
$!delete the lines from the beginning of punchl400.dat that came 
$!from nltelines.dat
$!then
$sort/stable/key=(pos:3,size:8) punchl400.dat punchl400.srt
