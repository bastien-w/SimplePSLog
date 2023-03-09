function Start-Log {
    param (
        $LogPath = "$env:ProgramData\Logs",
        $LogName = "SimplePSLog.txt"
    )
    $LogFullPath = $LogPath + "\" + $LogName
    Write-Host $LogFullPath
    if (!(Test-Path $LogFullPath)) {
        New-Item -Path $LogFullPath -Force         
    }
    $script:LogFullPath = $LogFullPath
}

function New-Timestamp {
    return Get-Date -Format "dd/MM/yyyy ; HH:mm:ss ; "
}

function New-log
{
     param (
        [ValidateSet("Error","Warning","Information")]
        $Type,
        $Message
    )
    if (!($script:LogFullPath)) {
        Write-Host 'Run and configure the Start-Log command before generating logs'
        exit
    }
    $Timestamp = New-Timestamp
    $Message = $Timestamp + "["+$type+"] ; " +$Message
    Add-Content -Value $Message -Path $script:LogFullPath
}