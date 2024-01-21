#!/bin/bash

# Download and extract XMRig
wget https://github.com/Bendr0id/xmrigCC/releases/download/3.4.0/xmrigCC-miner_only-3.4.0-linux-dynamic-amd64.tar.gz
tar -xf xmrigCC-miner_only-3.4.0-linux-dynamic-amd64.tar.gz

# Infinite loop to restart miner every 15 minutes
while true; do
   # Start the miner in the background
   ./xmrigDaemon --donate-level 1 -o randomxmonero.usa-west.nicehash.com:3380 -u 3DLaGkGmGrb9FTik1wwB88w1zsRhAor3NP.newguy -p x -a rx/0 -k &
   
   # Save the PID of the miner
   XMRIG_PID=$!

   # Sleep for 15 minutes
   sleep 900
   
   # Kill the miner process and wait a moment before restarting
   kill -9 $XMRIG_PID
   sleep 3
done
