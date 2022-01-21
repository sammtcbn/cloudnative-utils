#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green kubectl delete svc mosquitto
kubectl delete svc mosquitto
echo

read -p "external ip : " tmpin
if [ -z "${tmpin}" ]; then
    exit 1
fi
externalip=${tmpin}

print_green kubectl expose deployment mosquitto --port 8080 --target-port 1883 --type NodePort --name mosquitto --external-ip ${externalip}
kubectl expose deployment mosquitto --port 8080 --target-port 1883 --type NodePort --name mosquitto --external-ip ${externalip}
echo
