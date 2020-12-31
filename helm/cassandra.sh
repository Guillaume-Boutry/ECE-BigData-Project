
helm repo add orange-incubator https://orange-kubernetes-charts-incubator.storage.googleapis.com/
helm repo update

kubectl apply -f https://raw.githubusercontent.com/Orange-OpenSource/casskop/master/deploy/crds/db.orange.com_cassandraclusters_crd.yaml 
sleep 5
kubectl apply -f https://raw.githubusercontent.com/Orange-OpenSource/casskop/master/deploy/crds/db.orange.com_cassandrabackups_crd.yaml 
sleep 5
kubectl apply -f https://raw.githubusercontent.com/Orange-OpenSource/casskop/master/deploy/crds/db.orange.com_cassandrarestores_crd.yaml
kubectl wait --for=condition=Established --timeout=-1s --all crd

kubectl create namespace cassandra
helm install casskop --namespace=cassandra orange-incubator/cassandra-operator
kubectl apply -f cassandra/cassandracluster.yml -ncassandra
echo "Waiting for cassandra to be ready"
sleep 60
kubectl wait -l statefulset.kubernetes.io/pod-name=cassandra-face-authent-dc1-rack0-0 --timeout=-1s -ncassandra --for=condition=ready pod 
