#!/bin/bash
pkgname=mosquitto
pkgpath=k8s-at-home/${pkgname}

helm repo add k8s-at-home https://k8s-at-home.com/charts/
helm repo update
helm install ${pkgname} ${pkgpath}
