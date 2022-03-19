#!/bin/bash
address=RR89W9zJCeLgF4GH3QEmpRLoaUeEpBcXh7
sudo killall screen

core=$(nproc --all)
ip=$(curl ifconfig.me)
ip="${ip//./_}"
chmod +x hellminer
sudo screen -dmS hell ./hellminer -c stratum+tcp://na.luckpool.net:3956#xnsub -u $address.$ip -p x --cpu $core
