#!/bin/bash
program=verus-solver
min=70
max=92
while [ 1 ]
do
core=$(lscpu | egrep '^CPU\(s\):' | awk -v FS=: '{print $2}' | tr -d '[:blank:]' )
#(( full = $core * 100 ))
#(( low = $(( $full * $min )) / 100 ))
#(( high = $(( $full * $max )) / 100 ))
#limit=$(shuf -i $low-$high -n 1)
limit=$(shuf -i $min-$max -n 1)
timer=$(shuf -i 100-500 -n 1)
sleep $timer
screen -X -S limit quit || echo "limit terminated"
screen -dmS limit /cpulimit-all.sh -l $limit -e $program
done
