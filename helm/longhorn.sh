#git clone https://github.com/longhorn/longhorn
helm repo add longhorn https://charts.longhorn.io
helm repo update
kubectl create namespace longhorn-system
helm install longhorn longhorn/longhorn --set persistence.defaultClassReplicaCount=2 --set defaultSettings.replicaSoftAntiAffinity=true --namespace longhorn-system
kubectl wait --for=condition=Available --timeout=300s -nlonghorn-system --all deployment
