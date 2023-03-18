# SimplePSLog
 
This module is made to create a simple log system that is portable, easy to use and read.
You can find example on how to use it in the TestSimplePSLog.ps1 script.
To install the module use :
```Powershell
Install-Module SimplePSLog
Import-Module SimplePSLog
```
## Start-log
The Start-log command is used to configure the location of the log and the filename. 

| Parameters   | Description  | Type              | Default Value            |
|:-------------|:-------------|:------------------|:-------------------------|
| LogPath      | Log location | String            | "$env:ProgramData\Logs"  |
| LogName      | Log filename | String            | "SimplePSLog.txt"        |

## New-log
The New-log command is used to write log in the file configured by Start-log. 

| Parameters   | Description                  | Type              | Default Value            | 
|:-------------|:-----------------------------|:------------------|:-------------------------|
| Type         | Type of the log              | ValidateSet       | None                     |
| Message      | Message that will be written | String            | None                     |

## New-Timestamp
The New-Timestamp command is an utility function used by New-log to generate date in the format "dd/MM/yyyy ; HH:mm:ss ; "