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
    switch ($type)
    {
        'Error' {New-ErrorLog -Message $Message}
        'Warning' {New-WarningLog -Message $Message}
        'Information' {New-InformationLog -Message $Message}
    }
}

function New-ErrorLog {
    param (
        $Message
    )
    if (!($script:LogFullPath)) {
        Write-Host 'Run and configure the Start-Log command before generating logs'
        exit
    }
    $Timestamp = New-Timestamp
    $Message = $Timestamp + "[Error] ; " +$Message
    Add-Content -Value $Message -Path $script:LogFullPath
}

function New-WarningLog {
    param (
        $Message
    )
    if (!($script:LogFullPath)) {
        Write-Host 'Run and configure the Start-Log command before generating logs'
        exit
    }
    $Timestamp = New-Timestamp
    $Message = $Timestamp + "[Warning] ; " +$Message
    Add-Content -Value $Message -Path $script:LogFullPath
}

function New-InformationLog {
    param (
        $Message
    )
    if (!($script:LogFullPath)) {
        Write-Host 'Run and configure the Start-Log command before generating logs'
        exit
    }
    $Timestamp = New-Timestamp
    $Message = $Timestamp + "[Information] ; " +$Message
    Add-Content -Value $Message -Path $script:LogFullPath
}