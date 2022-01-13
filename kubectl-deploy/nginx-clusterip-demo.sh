#!/bin/bash

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
print_green kubectl create deployment nginx --image=nginx
kubectl create deployment nginx --image=nginx
echo

deployment_list

sleep 5

pod_list

# set service
print_green kubectl expose deployment nginx --port 80 --target-port 80 --selector app=nginx --type="ClusterIP" --name nginx
kubectl expose deployment nginx --port 80 --target-port 80 --selector app=nginx --type="ClusterIP" --name nginx
echo

sleep 5

service_list

# get ip
ipaddr=$(kubectl get services nginx | awk 'NR>1 {print $3}')
print_cyan ip address is ${ipaddr}
echo

# curl web
curl ${ipaddr}
echo

sleep 5

# delete service
print_green kubectl delete services nginx
kubectl delete services nginx
echo

sleep 2

service_list

# delete deployment
print_green kubectl delete deployment nginx
kubectl delete deployment nginx
echo

sleep 5

pod_list

sleep 1

deployment_list
