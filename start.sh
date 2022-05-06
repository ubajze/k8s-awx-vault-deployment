#!/bin/bash

minikube start --force-systemd=true --listen-address=0.0.0.0 --memory=max --cpus=max
minikube addons enable ingress
minikube addons enable ingress-dns

# For helm
flux install \
  --namespace=flux-system \
  --network-policy=false \
  --components=source-controller,helm-controller

# CSI driver
kubectl apply -k csi-driver

# kubectl apply -k postgres
