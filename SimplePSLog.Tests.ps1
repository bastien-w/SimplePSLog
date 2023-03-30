Describe "SimplePSLog" {
    BeforeAll {
        Import-Module .\SimplePSLog
    }

    Context "Start-Log" {
        It "Creates a log file with the specified path and name" {
            $logPath = Join-Path $TestDrive "Logs"
            $logName = "TestLog.txt"
            $logFullPath = Join-Path $logPath $logName

            Start-Log -LogPath $logPath -LogName $logName

            Test-Path $logFullPath | Should -BeTrue
        }
    }

    Context "New-Log" {
        It "Writes messages to the log file with a timestamp and message type" {
            $logPath = Join-Path $TestDrive "Logs"
            $logName = "TestLog.txt"
            $logFullPath = Join-Path $logPath $logName

            Start-Log -LogPath $logPath -LogName $logName

            New-Log -Type Information -Message "This is an informational message"
            New-Log -Type Warning -Message "This is a warning message"
            New-Log -Type Error -Message "This is an error message"

            $logContent = Get-Content $logFullPath

            $logContent[0] | Should -Match "\[Information\] ; This is an informational message"
            $logContent[1] | Should -Match "\[Warning\] ; This is a warning message"
            $logContent[2] | Should -Match "\[Error\] ; This is an error message"
        }
    }
}