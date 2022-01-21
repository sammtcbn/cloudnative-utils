#!/bin/bash
kubectl apply -f load-balancer-example.yaml
kubectl expose deployment hello-world --type=LoadBalancer --name=hello-world
