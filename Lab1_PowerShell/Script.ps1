param(
    [string[]]$ComputerNames,
    [string]$OutputPath = (Join-Path $PSScriptRoot "SystemReport")
)

if (-not (Test-Path $OutputPath)) {
    New-Item -Path $OutputPath -ItemType Directory | Out-Null
}

if (-not $ComputerNames -or $ComputerNames.Count -eq 0) {
    $envName = $env:COMPUTERNAME
    $ComputerNames = @($envName)
} else {
    $tempList = @()
    foreach ($c in $ComputerNames) {
        if ($c -and $c.Trim().Length -gt 0) {
            $tempList += $c.Trim()
        }
    }
    $ComputerNames = $tempList
}

$allResults = @()
$globalStatus = @()

foreach ($computer in $ComputerNames) {
    $diskData = @()
    $serviceData = @()
    $eventData = @()
    $osData = $null
    $pingResult = $null

    try {
        $ping = Test-Connection -ComputerName $computer -Count 1 -Quiet -ErrorAction SilentlyContinue
        if ($ping) {
            $pingResult = "Online"
        } else {
            $pingResult = "Offline"
        }
    } catch {
        $pingResult = "Unknown"
    }

    $globalStatus += [PSCustomObject]@{
        ComputerName = $computer
        Timestamp    = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        Status       = $pingResult
    }

    if ($pingResult -ne "Online") {
        continue
    }

    try {
        $osQuery1 = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computer -ErrorAction SilentlyContinue
        $osQuery2 = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computer -ErrorAction SilentlyContinue

        if ($osQuery1) {
            $osData = $osQuery1
        } elseif ($osQuery2) {
            $osData = $osQuery2
        }

        $disks1 = Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $computer -Filter "DriveType=3" -ErrorAction SilentlyContinue
        $disks2 = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $computer -ErrorAction SilentlyContinue

        if ($disks1) {
            foreach ($d in $disks1) {
                $sizeGB = 0
                $freeGB = 0

                if ($d.Size -ne $null -and $d.Size -gt 0) {
                    $sizeGB = [math]::Round($d.Size / 1GB, 2)
                }

                if ($d.FreeSpace -ne $null -and $d.FreeSpace -gt 0) {
                    $freeGB = [math]::Round($d.FreeSpace / 1GB, 2)
                }

                $percentFree = 0
                if ($sizeGB -gt 0) {
                    $percentFree = [math]::Round(($freeGB / $sizeGB) * 100, 2)
                }

                $diskData += [PSCustomObject]@{
                    ComputerName = $computer
                    Drive        = $d.DeviceID
                    SizeGB       = $sizeGB
                    FreeGB       = $freeGB
                    PercentFree  = $percentFree
                }
            }
        }

        if ($disks2) {
            foreach ($d2 in $disks2) {
                $exists = $false
                foreach ($existing in $diskData) {
                    if ($existing.Drive -eq $d2.DeviceID) {
                        $exists = $true
                        break
                    }
                }

                if (-not $exists) {
                    $sizeGB2 = 0
                    $freeGB2 = 0

                    if ($d2.Size -ne $null -and $d2.Size -gt 0) {
                        $sizeGB2 = [math]::Round($d2.Size / 1GB, 2)
                    }

                    if ($d2.FreeSpace -ne $null -and $d2.FreeSpace -gt 0) {
                        $freeGB2 = [math]::Round($d2.FreeSpace / 1GB, 2)
                    }

                    $percentFree2 = 0
                    if ($sizeGB2 -gt 0) {
                        $percentFree2 = [math]::Round(($freeGB2 / $sizeGB2) * 100, 2)
                    }

                    $diskData += [PSCustomObject]@{
                        ComputerName = $computer
                        Drive        = $d2.DeviceID
                        SizeGB       = $sizeGB2
                        FreeGB       = $freeGB2
                        PercentFree  = $percentFree2
                    }
                }
            }
        }

        if ($computer -eq $env:COMPUTERNAME -or $computer -eq "localhost" -or $computer -eq ".") {
            $services1 = Get-Service -ErrorAction SilentlyContinue
        } else {
            $services1 = Invoke-Command -ComputerName $computer -ScriptBlock { Get-Service } -ErrorAction SilentlyContinue
        }
        $services2 = Get-WmiObject -Class Win32_Service -ComputerName $computer -ErrorAction SilentlyContinue

        foreach ($s in $services1) {
            $serviceData += [PSCustomObject]@{
                ComputerName = $computer
                Name         = $s.Name
                DisplayName  = $s.DisplayName
                Status       = $s.Status.ToString()
                StartType    = ""
                Source       = "Get-Service"
            }
        }

        if ($services2) {
            foreach ($s2 in $services2) {
                $found = $false
                foreach ($existingService in $serviceData) {
                    if ($existingService.Name -eq $s2.Name) {
                        $found = $true
                        if (-not $existingService.StartType -or $existingService.StartType -eq "") {
                            $existingService.StartType = $s2.StartMode
                        }
                        break
                    }
                }

                if (-not $found) {
                    $serviceData += [PSCustomObject]@{
                        ComputerName = $computer
                        Name         = $s2.Name
                        DisplayName  = $s2.DisplayName
                        Status       = $s2.State
                        StartType    = $s2.StartMode
                        Source       = "Win32_Service"
                    }
                }
            }
        }

        $cutoffDate = Get-Date
        $cutoffDate = $cutoffDate.AddDays(-1)
        if ($computer -eq $env:COMPUTERNAME -or $computer -eq "localhost" -or $computer -eq ".") {
            $eventsSystem = Get-EventLog -LogName System -EntryType Error,Warning -After $cutoffDate -ErrorAction SilentlyContinue
            $eventsApp = Get-EventLog -LogName Application -EntryType Error,Warning -After $cutoffDate -ErrorAction SilentlyContinue
        } else {
            $eventsSystem = Invoke-Command -ComputerName $computer -ScriptBlock { 
                param($cutoff)
                Get-EventLog -LogName System -EntryType Error,Warning -After $cutoff -ErrorAction SilentlyContinue
            } -ArgumentList $cutoffDate -ErrorAction SilentlyContinue
            
            $eventsApp = Invoke-Command -ComputerName $computer -ScriptBlock { 
                param($cutoff)
                Get-EventLog -LogName Application -EntryType Error,Warning -After $cutoff -ErrorAction SilentlyContinue
            } -ArgumentList $cutoffDate -ErrorAction SilentlyContinue
        }

        if ($eventsSystem) {
            foreach ($ev in $eventsSystem) {
                $eventData += [PSCustomObject]@{
                    ComputerName = $computer
                    Log          = "System"
                    TimeGenerated= $ev.TimeGenerated
                    EntryType    = $ev.EntryType.ToString()
                    Source       = $ev.Source
                    EventID      = $ev.EventID
                    Message      = $ev.Message
                }
            }
        }

        if ($eventsApp) {
            foreach ($ev2 in $eventsApp) {
                $eventData += [PSCustomObject]@{
                    ComputerName = $computer
                    Log          = "Application"
                    TimeGenerated= $ev2.TimeGenerated
                    EntryType    = $ev2.EntryType.ToString()
                    Source       = $ev2.Source
                    EventID      = $ev2.EventID
                    Message      = $ev2.Message
                }
            }
        }

        $criticalEvents = @()
        foreach ($e in $eventData) {
            if ($e.EntryType -eq "Error") {
                $criticalEvents += $e
            }
        }

        $criticalEvents2 = $eventData | Where-Object { $_.EntryType -eq "Error" }

        $joinedCriticalEvents = @()
        foreach ($item in $criticalEvents) {
            $already = $false
            foreach ($item2 in $criticalEvents2) {
                if ($item2.TimeGenerated -eq $item.TimeGenerated -and $item2.EventID -eq $item.EventID -and $item2.Source -eq $item.Source) {
                    if (-not $already) {
                        $joinedCriticalEvents += $item
                        $already = $true
                    }
                }
            }
        }

        $reportObject = [PSCustomObject]@{
            ComputerName          = $computer
            Timestamp             = Get-Date
            OSVersion             = if ($osData) { $osData.Version } else { "" }
            OSCaption             = if ($osData) { $osData.Caption } else { "" }
            DiskInfo              = $diskData
            ServiceInfo           = $serviceData
            EventInfo             = $eventData
            CriticalEventInfo     = $joinedCriticalEvents
            TotalDisks            = $diskData.Count
            TotalServices         = $serviceData.Count
            TotalEventsLast24h    = $eventData.Count
            TotalCriticalLast24h  = $joinedCriticalEvents.Count
        }

        $allResults += $reportObject

        $fileNameBase = $computer + "_" + (Get-Date -Format "yyyyMMdd_HHmmss")
        $diskFile = Join-Path $OutputPath ($fileNameBase + "_disks.csv")
        $serviceFile = Join-Path $OutputPath ($fileNameBase + "_services.csv")
        $eventFile = Join-Path $OutputPath ($fileNameBase + "_events.csv")
        $criticalFile = Join-Path $OutputPath ($fileNameBase + "_critical.csv")

        $diskData | Sort-Object Drive | Export-Csv -Path $diskFile -NoTypeInformation -Force
        $serviceData | Sort-Object Name | Export-Csv -Path $serviceFile -NoTypeInformation -Force
        $eventData | Sort-Object TimeGenerated | Export-Csv -Path $eventFile -NoTypeInformation -Force
        $joinedCriticalEvents | Sort-Object TimeGenerated | Export-Csv -Path $criticalFile -NoTypeInformation -Force

    } catch {
        $errorFile = Join-Path $OutputPath "errors.log"
        $line = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss") + " | " + $computer + " | " + $_.Exception.Message
        Add-Content -Path $errorFile -Value $line
    }
}

$summaryFile = Join-Path $OutputPath ("Summary_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".csv")
$flatList = @()

foreach ($item in $allResults) {
    $lowDiskCount = 0
    foreach ($disk in $item.DiskInfo) {
        if ($disk.PercentFree -lt 20) {
            $lowDiskCount++
        }
    }

    $stoppedServiceCount = 0
    foreach ($svc in $item.ServiceInfo) {
        if ($svc.Status -ne "Running") {
            $stoppedServiceCount++
        }
    }

    $flatList += [PSCustomObject]@{
        ComputerName         = $item.ComputerName
        Timestamp            = $item.Timestamp
        OSVersion            = $item.OSVersion
        OSCaption            = $item.OSCaption
        TotalDisks           = $item.TotalDisks
        TotalServices        = $item.TotalServices
        TotalEventsLast24h   = $item.TotalEventsLast24h
        TotalCriticalLast24h = $item.TotalCriticalLast24h
        LowDiskVolumes       = $lowDiskCount
        StoppedServices      = $stoppedServiceCount
    }
}

$flatList | Sort-Object ComputerName | Export-Csv -Path $summaryFile -NoTypeInformation -Force

$statusFile = Join-Path $OutputPath ("PingStatus_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".csv")
$globalStatus | Sort-Object ComputerName | Export-Csv -Path $statusFile -NoTypeInformation -Force
