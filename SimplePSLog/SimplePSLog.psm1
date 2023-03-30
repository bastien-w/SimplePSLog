function Start-Log {
    [CmdletBinding()]
    param (
        [string]$LogPath = "$env:ProgramData\Logs",
        [string]$LogName = "SimplePSLog.txt"
    )
    $script:LogFullPath = Join-Path $LogPath $LogName

    Write-Verbose "Log file is located at : $script:LogFullPath"

    if (!(Test-Path $script:LogFullPath)) {
        try {
            New-Item -Path $script:LogFullPath -Force
        } catch {
            Write-Error "Failed to create log file: $_"
        }
    }
}

function Set-Timestamp {
    [CmdletBinding()]
    param()
    return Get-Date -Format "dd/MM/yyyy ; HH:mm:ss ; "
}

function New-log
{
    [CmdletBinding()]
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
    Write-Verbose $Message
    try {
        Add-Content -Value $Message -Path $script:LogFullPath
    } catch {
        Write-Error "Failed to write to log file: $_"
    }
}