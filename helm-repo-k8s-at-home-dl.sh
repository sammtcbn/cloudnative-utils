#!/bin/bash

foldername=charts-k8s-at-home

if [ -d "${foldername}" ]; then
    echo ${foldername} exist
    echo git pull
    git pull
    exit 1
fi

echo git clone https://github.com/k8s-at-home/charts.git ${foldername}
git clone https://github.com/k8s-at-home/charts.git ${foldername}

echo done
