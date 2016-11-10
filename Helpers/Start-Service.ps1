param (
    $ServicesList,
    $Timestamp
)

new-item -Path "HKLM:\Software\C3 Inventory" -ErrorAction SilentlyContinue

foreach ($Service in $ServicesList.Split(';')) {
    start-service $Service

    new-item -Path "HKLM:\Software\C3 Inventory\Service Monitoring" -ErrorAction SilentlyContinue
    
    new-item -Path "HKLM:\Software\C3 Inventory\Service Monitoring\$Service" -ErrorAction SilentlyContinue
 
    $Count = (Get-ItemProperty -Path "HKLM:\Software\C3 Inventory\Service Monitoring\$Service" -Name "Count" -ErrorAction SilentlyContinue).Count

    if (!$Count) {$Count = 0}

    set-ItemProperty -Path "HKLM:\Software\C3 Inventory\Service Monitoring\$Service" -Name "Count" -Value ($Count + 1) -ErrorAction SilentlyContinue

    Set-ItemProperty -Path "HKLM:\Software\C3 Inventory\Service Monitoring\$Service" -Name "Last" -Value $Timestamp -ErrorAction SilentlyContinue
    
}