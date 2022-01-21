#!/bin/bash
function change_value()
{
  RABBITMQ_VALUEFILE=values.yaml

  echo username is
  yq e '.auth.username' ${RABBITMQ_VALUEFILE}

  echo password is
  yq e '.auth.password' ${RABBITMQ_VALUEFILE}

  yq e '.extraPlugins = "rabbitmq_auth_backend_ldap rabbitmq_mqtt"' -i ${RABBITMQ_VALUEFILE}
  echo extraPlugins change to
  yq e '.extraPlugins' ${RABBITMQ_VALUEFILE}
}

pkgname=rabbitmq
pkgpath=bitnami/${pkgname}
foldername=rabbitmq

helm repo add bitnami https://charts.bitnami.com/bitnami

rm -rf ${foldername} || exit 1
helm pull ${pkgpath} --untar || exit 1

cd ${foldername} || exit 1
#change_value
helm install ${pkgname} -f values.yaml ${pkgpath} || exit 1
