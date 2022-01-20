#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green "kubectl delete svc hello-app"
kubectl delete svc hello-app

print_green "kubectl delete deployment hello-app"
kubectl delete deployment hello-app
