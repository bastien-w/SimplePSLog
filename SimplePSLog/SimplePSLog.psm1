# This function creates a log file with the specified path and name
function Start-Log {
    [CmdletBinding()]
    param (
        [string]$LogPath = "$env:ProgramData\Logs",
        [string]$LogName = "SimplePSLog.txt"
    )
    $script:LogFullPath = Join-Path $LogPath $LogName

    Write-Verbose "Log file is located at : $script:LogFullPath"

    # If the log file does not exist, create it
    if (!(Test-Path $script:LogFullPath)) {
        try {
            New-Item -Path $script:LogFullPath -Force
        } catch {
            Write-Error "Failed to create log file: $_"
        }
    }
}

# This function returns a timestamp in the format "dd/MM/yyyy ; HH:mm:ss ; "
function Set-Timestamp {
    [CmdletBinding()]
    param()
    return Get-Date -Format "dd/MM/yyyy ; HH:mm:ss ; "
}

# This function writes messages to the log file with a timestamp and message type (Error, Warning, or Information)
function New-log
{
    [CmdletBinding()]
     param (
        [ValidateSet("Error","Warning","Information")]
        $Type,
        [string]$Message
    )
    # Check if the log file has been created
    if (!($script:LogFullPath)) {
        Write-Error 'Run the Start-Log command before generating logs'
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