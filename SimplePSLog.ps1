function Start-Log {
    param (
        $LogPath = "$env:ProgramData\Logs",
        $LogName = "SimplePSLog.txt"
    )
    if ($LogPath[-1] -ne  "\") {
        $LogPath = $LogPath + "\"
    }
    $script:LogFullPath = $LogPath + $LogName

    Write-Host $script:LogFullPath
    
    if (!(Test-Path $script:LogFullPath)) {
        New-Item -Path $script:LogFullPath -Force         
    }
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