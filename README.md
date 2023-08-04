# SimplePSLog

SimplePSLog is a PowerShell module for creating and writing to log files.

[Available on the PSGallery](https://www.powershellgallery.com/packages/SimplePSLog/)

## Usage

First, install and import the module:

```powershell
Install-Module SimplePSLog
Import-Module SimplePSLog
```

Then, create a log file by calling the `Start-Log` function:

```powershell
Start-Log -LogPath "C:\Logs" -LogName "MyLog.txt"
```

This will create a log file at `C:\Logs\MyLog.txt`.

To write messages to the log file, use the `New-Log` function:

```powershell
New-Log -Type Information -Message "This is an informational message"
New-Log -Type Warning -Message "This is a warning message"
New-Log -Type Error -Message "This is an error message"
```

This will write messages to the log file with a timestamp and message type.

## Functions

### Start-Log

The `Start-Log` function creates a log file with the specified path and name.

```powershell
Start-Log [-LogPath <string>] [-LogName <string>]
```

#### Parameters

- `-LogPath`: The path where the log file will be created. Defaults to `$env:ProgramData\Logs`.
- `-LogName`: The name of the log file. Defaults to `SimplePSLog.txt`.

### New-Log

The `New-Log` function writes messages to the log file with a timestamp and message type.

```powershell
New-Log [-Type <string>] [-Message <string>]
```

#### Parameters

- `-Type`: The type of the message. Must be one of `Error`, `Warning`, or `Information`. Defaults to `Information`
- `-Message`: The message to write to the log file.
