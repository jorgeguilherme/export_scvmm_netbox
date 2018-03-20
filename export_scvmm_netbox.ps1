$vms = Get-SCVirtualMachine

$defaultStatus = "Active"
$defaultCluster = "hv-cluster-01"
$defaultRole = "Server"
$fileName = "netbox.csv"

Foreach ($vm in $vms) {
    $name = $vm.Name
    $mem = $vm.Memory
    $os = $vm.OperatingSystem.OSType
    $owner = $vm.CustomProperty.Responsáveis
    $cpu = $vm.CPUCount
    $disksize = 0
    $disks = Get-SCVirtualDiskDrive -VM $vm
    Foreach ($disk in $disks) {
        $disksize = $disksize + $disk.VirtualHardDisk.MaximumSize/1GB
    }


    if (!$owner) {$owner = ""} # if null
    if ($owner -eq "TI") {$owner = "TI"} else {$owner = ""}  # if TI

    $out = New-Object PSObject
    $out | Add-Member name $name
    $out | Add-Member status $defaultStatus
    $out | Add-Member cluster $defaultCluster
    $out | Add-Member role $defaultRole
    $out | Add-Member tenant $owner
    $out | Add-Member platform $os
    $out | Add-Member vcpus $cpu
    $out | Add-Member memory $mem
    $out | Add-Member disk $disksize
    $out | Add-Member comments ""
    
    Export-Csv -InputObject $out -Path $fileName -Append
}