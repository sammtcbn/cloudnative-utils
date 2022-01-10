#!/bin/bash
# refer to https://www.server-world.info/en/note?os=Ubuntu_20.04&p=microk8s&f=2

COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';
COLOR_YELLOW='\e[1;33m';
COLOR_CYAN='\e[0;36m';

function print_yellow()
{
    echo -e "${COLOR_YELLOW}$@${COLOR_REST}"
}

function print_green()
{
    echo -e "${COLOR_GREEN}$@${COLOR_REST}"
}

function print_cyan()
{
    echo -e "${COLOR_CYAN}$@${COLOR_REST}"
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
  print_green kubectl get pods -A
  kubectl get pods -A
  echo
}

function deployment_list()
{
  print_green kubectl get deployment -A
  kubectl get deployment -A
  echo
}

function service_list()
{
  print_green kubectl get services -A
  kubectl get services -A
  echo
}

# create deployment
prompt "Press any key to create deployment"
print_green kubectl create deployment test-nginx --image=nginx
kubectl create deployment test-nginx --image=nginx
echo

deployment_list

sleep 5

pod_list

# get pod name
podname=$(kubectl get pod -A | grep test-nginx | awk '{print $2}')
print_cyan pod name is ${podname}
echo

# show environment variable for [test-nginx] pod
prompt "Press any key to run env command in pod to show environment variable"
kubectl exec ${podname} -- env
echo

# scale out pods
prompt "Press any key to scale out pods"
print_green kubectl scale deployment test-nginx --replicas=3
kubectl scale deployment test-nginx --replicas=3

sleep 7

pod_list

# set service
prompt "Press any key to expose service"
print_green kubectl expose deployment test-nginx --type="NodePort" --port 80
kubectl expose deployment test-nginx --type="NodePort" --port 80

sleep 3

service_list

# get ip
ipaddr=$(kubectl get services test-nginx | awk 'NR>1 {print $3}')
print_cyan ip address is ${ipaddr}
echo

# curl web
prompt "Press any key to curl web"
curl ${ipaddr}
echo

# delete service
prompt "Press any key to delete service"
print_green kubectl delete services test-nginx
kubectl delete services test-nginx
echo

sleep 2

service_list

# delete deployment
prompt "Press any key to delete deployment"
print_green kubectl delete deployment test-nginx
kubectl delete deployment test-nginx
echo

sleep 5

pod_list

sleep 1

deployment_list
