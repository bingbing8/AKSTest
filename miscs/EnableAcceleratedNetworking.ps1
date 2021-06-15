[CmdletBinding()]
Param (
    [Parameter(Mandatory = $true)]    
    [string] $resourcegroupName
    )

Write-Output "Stopping VM $($_.Name)..."
$vms = Get-AzVM -ResourceGroupName $resourcegroupName
$vms | Stop-azvm -force

$nics = Get-AzNetworkInterface -ResourceGroupName $resourcegroupName
$nics | Where-Object {$_.Name -notlike "*master*" } | ForEach-Object {
    Write-Output "enabling Accelerated Networking on $($_.Name)"
    $_.EnableAcceleratedNetworking = $true
    $_ | Set-AzNetworkInterface
}

Write-Output "Starting VM $($_.Name)..."
$vms | Start-azvm