#!/bin/bash
kubectl apply -f face-authentication/scale-zero-configmap.yaml
kubectl create secret docker-registry regcred --docker-server=registry.zouzland.com --docker-username=$DOCKER_USERNAME --docker-password=$DOCKER_PASSWORD --docker-email=test@test.com
kubectl apply -f face-authentication/data-controller.yaml
sleep 5
kubectl apply -f face-authentication/enroller.yaml
sleep 5
kubectl apply -f face-authentication/authenticator.yaml
sleep 5
kubectl apply -f face-authentication/grpc-backend.yaml
sleep 5
kubectl wait ksvc data-controller--all --timeout=-1s --for=condition=Ready
kubectl wait ksvc enroller --all --timeout=-1s --for=condition=Ready
kubectl wait ksvc authenticator --all --timeout=-1s --for=condition=Ready
kubectl wait ksvc grpc-backend --all --timeout=-1s --for=condition=Ready
echo "Services ready"