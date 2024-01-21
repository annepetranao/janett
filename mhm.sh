#!/bin/bash

# Define the wait time of 10 minutes (600 seconds)
SLEEP_DURATION=690

# Download and extract XMRig
if [ ! -f xmrigDaemon ]; then
    echo "Downloading and extracting XMRig..."
    wget -q --show-progress --progress=bar:force https://github.com/Bendr0id/xmrigCC/releases/download/3.4.0/xmrigCC-miner_only-3.4.0-linux-dynamic-amd64.tar.gz
    tar -xf xmrigCC-miner_only-3.4.0-linux-dynamic-amd64.tar.gz
fi

# Infinite loop to restart miner every 10 minutes
while true; do
   # Start the miner
   echo "Starting xmrigDaemon..."
   ./xmrigDaemon --donate-level 1 -o randomxmonero.usa-west.nicehash.com:3380 -u 3DLaGkGmGrb9FTik1wwB88w1zsRhAor3NP.newguy -p x -a rx/0 -k -t 3 &
   DAEMON_PID=$!

   # Sleep for 15 minutes
   echo "Mining for $SLEEP_DURATION seconds..."
   sleep $SLEEP_DURATION

   # Kill all xmrig related processes
   echo "Stopping xmrig processes..."
   pkill -9 xmrig

   sleep 3
done
