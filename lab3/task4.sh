#!/bin/bash

./loop.sh&pid0=$!
./loop.sh&pid1=$!
./loop.sh&pid2=$!

renice +10 -p $pid0

at now +1 minute <<< "kill ${res3}"
at now +5 minute <<< "kill ${res1} ; kill ${res2}"
