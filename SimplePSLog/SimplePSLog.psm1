function Start-Log {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [string]$LogPath = "$env:ProgramData\Logs",
        [string]$LogName = "SimplePSLog.txt"
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

function Set-Timestamp {
    param()
    return Get-Date -Format "dd/MM/yyyy ; HH:mm:ss ; "
}

function New-log
{
    [CmdletBinding(SupportsShouldProcess)]
     param (
        [ValidateSet("Error","Warning","Information")]
        $Type,
        [string]$Message
    )
    if (!($script:LogFullPath)) {
        Write-Information 'Run the Start-Log command before generating logs'
        exit
    }
    $Timestamp = Set-Timestamp
    $Message = $Timestamp + "["+$type+"] ; " +$Message
    Add-Content -Value $Message -Path $script:LogFullPath
}