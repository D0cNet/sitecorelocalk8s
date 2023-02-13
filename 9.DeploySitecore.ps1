Clear-Host

kubectl apply -f ./volumes/hostpath
kubectl apply -k ./
kubectl get pods -o wide
kubectl wait --for=condition=Available deployments --all --timeout=1800s