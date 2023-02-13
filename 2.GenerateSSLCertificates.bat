IF NOT EXIST mkcert.exe powershell Invoke-WebRequest https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-windows-amd64.exe -UseBasicParsing -OutFile mkcert.exe
mkcert -install
del /Q /S *.crt
del /Q /S *.key
mkcert -cert-file secrets\tls\global-cm\tls.crt -key-file secrets\tls\global-cm\tls.key "cm.globalhost"
mkcert -cert-file secrets\tls\global-cd\tls.crt -key-file secrets\tls\global-cd\tls.key "cd.globalhost"
mkcert -cert-file secrets\tls\global-id\tls.crt -key-file secrets\tls\global-id\tls.key "id.globalhost"