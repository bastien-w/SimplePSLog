<#
.SYNOPSIS
    This function creates a log file with the specified path and name.

.DESCRIPTION
    The Start-Log function takes two optional parameters: $LogPath and $LogName. If the log file does not exist, it is created.

.PARAMETER LogPath
    The path to the directory where the log file will be created.

.PARAMETER LogName
    The name of the log file.

.EXAMPLE
    Start-Log -LogPath "C:\Logs" -LogName "MyLog.txt"

    This example creates a log file named "MyLog.txt" in the "C:\Logs" directory.
#>
function Start-Log {
    [CmdletBinding()]
    param (
        [ValidateNotNullOrEmpty()][string]$LogPath = "$env:ProgramData\Logs",
        [ValidateNotNullOrEmpty()][string]$LogName = "SimplePSLog.txt"
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

<#
.SYNOPSIS
    This function returns a timestamp in the format "dd/MM/yyyy ; HH:mm:ss ; ".

.DESCRIPTION
    The Set-Timestamp function takes no parameters and returns a timestamp in the format "dd/MM/yyyy ; HH:mm:ss ; ".

.EXAMPLE
    $timestamp = Set-Timestamp

    This example sets the variable $timestamp to the current timestamp in the format "dd/MM/yyyy ; HH:mm:ss ; ".
#>
function Set-Timestamp {
    [CmdletBinding()]
    param()
    return Get-Date -Format "dd/MM/yyyy ; HH:mm:ss ; "
}

<#
.SYNOPSIS
    This function writes messages to the log file with a timestamp and message type (Error, Warning, or Information).

.DESCRIPTION
    The New-Log function takes two parameters: $Type and $Message. It writes messages to the log file with a timestamp and message type (Error, Warning, or Information).

.PARAMETER Type
    The type of message to write to the log file (Error, Warning, or Information).

.PARAMETER Message
    The message to write to the log file.

.EXAMPLE
    New-Log -Type "Error" -Message "An error has occurred"

    This example writes an error message to the log file with a timestamp.
#>
function New-log
{
    [CmdletBinding()]
     param (
        [ValidateSet("Error","Warning","Information")]
        $Type,
        [string]$Message = 'Information'
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