#!/usr/bin/env pwsh

# Title         : RDPCertificateInstaller.ps1
# Description   : Script to automatically install as RDP certificate a given one by its domain name
# Author        : Veltys
# Date          : 2023-10-15
# Version       : 1.0.3
# Usage         : pwsh RDPCertificateInstaller.ps1
# Notes         : Must be run as superuser


$domain = ""																	# Certificate domain name

$certs = Get-ChildItem "Cert:\LocalMachine\My"

foreach($cert in $certs) {
    if($cert.Subject -eq "CN=$domain") {
        $thumbprint = $cert.Thumbprint

        break
    }
}

Set-CimInstance -CimInstance (Get-CimInstance -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices) -Property @{SSLCertificateSHA1Hash=$thumbprint}