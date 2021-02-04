#!/bin/sh

trap "rm -rf file*; exit" 0 2 3 15
ulimit -c 0
rm -f test.log
rm -rf file*

for i in *-*.sh
do
	printf "Test: %s\n\n" $i >> test.log
	./$i >> test.log 2>&1 && printf '[PASS]\t' || printf '[FAIL]\t'
	echo "$i"
done
