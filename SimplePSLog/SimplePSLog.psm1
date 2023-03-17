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

    Write-Verbose $script:LogFullPath

    if (!(Test-Path $script:LogFullPath)) {
        New-Item -Path $script:LogFullPath -Force
    }
}

function Set-Timestamp {
    [CmdletBinding(SupportsShouldProcess)]
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
        Write-Verbose 'Run the Start-Log command before generating logs'
        exit
    }
    $Timestamp = Set-Timestamp
    $Message = $Timestamp + "["+$type+"] ; " +$Message
    Add-Content -Value $Message -Path $script:LogFullPath
}