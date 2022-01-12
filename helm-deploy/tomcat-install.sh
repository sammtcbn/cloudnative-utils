#!/bin/bash
pkgname=tomcat
pkgpath=bitnami/${pkgname}
foldername=tomcat

helm repo add bitnami https://charts.bitnami.com/bitnami

#helm install ${pkgname} ${pkgpath}

rm -rf ${foldername} || exit 1
helm pull ${pkgpath} --untar || exit 1

cd ${foldername} || exit 1
#helm install ${pkgname} -f values.yaml ${pkgpath} || exit 1
helm install . --generate-name
