#!/bin/bash

kind create cluster --name lab

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/

helm repo update

helm upgrade --install metrics-server metrics-server/metrics-server

# work-around for: x509: cannot validate certificate

kubectl patch deployment metrics-server --type=json \
  -p '[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
