Import-Module .\SimplePSLog

Start-Log -LogName $($MyInvocation.MyCommand.Name.Split(".")[0] + ".txt")
#Start-Log -LogName $($MyInvocation.MyCommand.Name.Split(".")[0] + ".csv")

New-log -Type Information -Message "Script is run by user : $env:USERNAME"
New-log -Type Information -Message "The script running is : $($MyInvocation.MyCommand.Name)"
New-log -Type Information -Message "You can open the text file with excel and use the delimiter to get access to easier filtering"


New-log -Type Information -Message "This is an informationnal log"
New-log -Type Warning -Message "This is a warning log"
New-log -Type Error -Message "This is an error log"