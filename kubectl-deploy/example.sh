#!/bin/bash
# refer to https://www.server-world.info/en/note?os=Ubuntu_20.04&p=microk8s&f=2

COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';
COLOR_YELLOW='\e[1;33m';

function print_yellow()
{
    echo -e "${COLOR_YELLOW}$@${COLOR_REST}"
}

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

function prompt()
{
    if [ ! -z "${@}" ]; then
        print_yellow ${@}
    fi
    read -rsn1  
}

function pod_list()
{
  print_green microk8s kubectl get pods -A
  microk8s kubectl get pods -A
  echo
}

function deployment_list()
{
  print_green kubectl get deployment -A
  kubectl get deployment -A
  echo
}

# create deployment
prompt "Press any key to create deployment"
print_green microk8s kubectl create deployment test-nginx --image=nginx
microk8s kubectl create deployment test-nginx --image=nginx
echo

deployment_list

sleep 5

pod_list

# scale out pods
prompt "Press any key to scale out pods"
print_green kubectl scale deployment test-nginx --replicas=3
microk8s kubectl scale deployment test-nginx --replicas=3

sleep 7

pod_list

# delete deployment
prompt "Press any key to delete deployment"
print_green kubectl delete deployment test-nginx
kubectl delete deployment test-nginx
echo

sleep 5

pod_list

sleep 1

deployment_list
