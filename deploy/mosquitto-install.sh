#!/bin/bash
# refer to https://github.com/k8s-at-home/charts/tree/master/charts/stable/mosquitto
pkgname=mosquitto
pkgpath=k8s-at-home/${pkgname}

helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install ${pkgname} ${pkgpath}
