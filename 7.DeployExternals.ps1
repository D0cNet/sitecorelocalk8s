Clear-Host

kubectl apply -k ./external/
kubectl get pods -o wide
kubectl wait --for=condition=Available deployments --all --timeout=900s
kubectl wait --for=condition=Ready pods --all