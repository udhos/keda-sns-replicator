#!/bin/bash

helm repo add kedacore https://kedacore.github.io/charts

helm repo update

kubectl create namespace keda

helm upgrade keda kedacore/keda --namespace keda --install

helm list -A

kubectl get po -n keda
