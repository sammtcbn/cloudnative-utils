#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green "kubectl delete svc echoserver"
kubectl delete svc echoserver
echo

print_green "kubectl delete deployment echoserver"
kubectl delete deployment echoserver
echo
