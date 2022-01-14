#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green "kubectl create deployment echoserver --image=gcr.io/google_containers/echoserver:1.8"
kubectl create deployment echoserver --image=gcr.io/google_containers/echoserver:1.8
echo

print_green "kubectl wait deploy/echoserver --for condition=available --timeout=600s"
kubectl wait deploy/echoserver --for condition=available --timeout=600s
echo

print_green "kubectl expose deployment echoserver --type=NodePort --port=8080"
kubectl expose deployment echoserver --type=NodePort --port=8080
echo
