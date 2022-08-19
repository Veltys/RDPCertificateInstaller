#!/usr/bin/env pwsh
# Title         : RDPCertificateInstaller.ps1
# Description   : Script to automatically install as RDP certificate a given one by its domain name
# Author        : Veltys
# Date          : 2022-08-19
# Version       : 0.0.1
# Usage         : powershell RDPCertificateInstaller.ps1
# Notes         : Must be run as superuser

Get-ChildItem "Cert:\LocalMachine\My"