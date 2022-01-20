#!/bin/bash
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

print_green "kubectl create deployment hello-app --image=gcr.io/google_samples/hello-app:2.0"
kubectl create deployment hello-app --image=gcr.io/google_samples/hello-app:2.0

print_green "kubectl wait deploy/hello-app --for condition=available --timeout=600s"
kubectl wait deploy/hello-app --for condition=available --timeout=600s

print_green "kubectl expose deployment hello-app --type=NodePort --port=8080"
kubectl expose deployment hello-app --type=NodePort --port=8080
