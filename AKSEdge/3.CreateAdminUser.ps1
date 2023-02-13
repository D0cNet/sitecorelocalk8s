Clear-Host
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl apply -f .\dashboard-adminuser.yaml
kubectl apply -f .\dashboard-clusterRoleBinding.yaml