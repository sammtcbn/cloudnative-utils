#!/bin/bash
pkgname=kubeapps
pkgpath=bitnami/${pkgname}
foldername=kubeapps

function helm_repo_add()
{
    helm repo add bitnami https://charts.bitnami.com/bitnami
}

function pkg_install_by_chart_reference()
{
    helm install ${pkgname} ${pkgpath}
}

function pkg_install_by_download_chart()
{
    rm -rf ${foldername} || exit 1
    helm pull ${pkgpath} --untar || exit 1

    cd ${foldername} || exit 1
    helm install ${pkgname} -f values.yaml ${pkgpath} || exit 1
    #helm install . --generate-name
}

helm_repo_add
#pkg_install_by_chart_reference
pkg_install_by_download_chart
