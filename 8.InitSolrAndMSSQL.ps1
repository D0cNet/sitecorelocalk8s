Clear-Host

kubectl apply -k ./init/
kubectl get jobs -o wide
kubectl wait --for=condition=Complete job.batch/solr-init --timeout=900s
kubectl wait --for=condition=Complete job.batch/mssql-init --timeout=900s