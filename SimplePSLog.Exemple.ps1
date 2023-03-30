Install-Module SimplePSLog
Import-Module SimplePSLog

Start-Log -LogName $($MyInvocation.MyCommand.Name.Split(".")[0] + ".txt") -Verbose
#Start-Log -LogName $($MyInvocation.MyCommand.Name.Split(".")[0] + ".csv") -Verbose

New-log -Type Information -Message "Script is run by user : $env:USERNAME" -Verbose
New-log -Type Information -Message "The script running is : $($MyInvocation.MyCommand.Name)" -Verbose
New-log -Type Information -Message "You can open the text file with excel and use the delimiter to get access to easier filtering" -Verbose


New-log -Type Information -Message "This is an informationnal log" -Verbose
New-log -Type Warning -Message "This is a warning log" -Verbose
New-log -Type Error -Message "This is an error log" -Verbose