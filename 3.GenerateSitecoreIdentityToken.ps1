$certificatePassword = "Test123!"
$newCert = New-SelfSignedCertificate -DnsName "localhost" -FriendlyName "Sitecore Identity Token Signing" -NotAfter (Get-Date).AddYears(5)

Export-PfxCertificate -Cert $newCert -FilePath .\SitecoreIdentityTokenSigning.pfx -Password (ConvertTo-SecureString -String $certificatePassword -Force -AsPlainText) 

[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes((Get-Item .\SitecoreIdentityTokenSigning.pfx))) | Out-File -Encoding ascii -NoNewline -Confirm -FilePath .\secrets\sitecore-identitycertificate.txt