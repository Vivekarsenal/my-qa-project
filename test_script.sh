kubectl get pods#!/bin/bash

URL="http://127.0.0.1:61746" 
RESPONSE=$(curl -s $URL)

if [[ $RESPONSE == *"Hello from Backend!"* ]]; then
    echo "Test Passed: Received expected greeting."
else
    echo "Test Failed: Did not receive expected greeting."
fi

