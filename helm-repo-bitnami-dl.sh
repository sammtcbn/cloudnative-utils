#!/bin/bash

foldername=charts-bitnami

if [ -d "${foldername}" ]; then
    echo ${foldername} exist
    echo git pull
    git pull
    exit 1
fi

echo git clone https://github.com/bitnami/charts.git ${foldername}
git clone https://github.com/bitnami/charts.git ${foldername}

echo done
