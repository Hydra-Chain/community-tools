#!/bin/bash

TESTNET=${TESTNET:-false}
STAKING=${STAKING:-1}
# the flag does NOT accept true/false it is 1/0
if [[ $STAKING = "true" ]]; then
    STAKING=1
fi

echo ""
echo "starting node in daemon mode..."
echo ""
if $TESTNET; then
    ./hydrad -daemon -testnet -staking=${STAKING}
    # not sure why this was in the installer/setup script, by the time someone gets a shell into the container similar time should pass
    # and if running in Kubernetes, there's probes and delays
    # sleep 20
    echo "running on testnet, call the daemon with: ~/Hydra/bin/./hydra-cli -testnet getinfo"
else
    ./hydrad -daemon -staking=${STAKING}
    # sleep 20
    echo "running on mainnet, call the daemon with: ~/Hydra/bin/./hydra-cli getinfo"
fi

while true; do sleep 30; done;