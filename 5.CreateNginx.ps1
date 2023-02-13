# create resource group
Write-Host "--- Creating nginx (Ingress) ---" -ForegroundColor Blue

# add nginx helm charts
.\helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# update the charts
.\helm repo update

.\helm install nginx-ingress ingress-nginx/ingress-nginx `
  --set controller.replicaCount=2 `
  --set controller.nodeSelector."kubernetes\.io/os"=linux `
  --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux `
  --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux `
  --set-string controller.config.proxy-body-size=10m `
  --set controller.service.externalTrafficPolicy=Local

kubectl apply -k ./ingress-nginx/

Write-Host "--- Complete: nginx (ingress) ---" -ForegroundColor Green

$ingressIpAddress = (kubectl get svc nginx-ingress-ingress-nginx-controller -o jsonpath="{.status.loadBalancer.ingress[*].ip}")

if (-not [string]::IsNullOrEmpty($ingressIpAddress)) {
  Write-Verbose "Ingress DNS record: $ingressIpAddress"
}

Write-Host "--- Complete: nginx (ingress) ---" -ForegroundColor Green