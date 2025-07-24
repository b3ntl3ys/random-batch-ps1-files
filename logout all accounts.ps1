Get-Process | Where-Object {$_.ProcessName -eq "explorer"} | ForEach-Object { $_.CloseMainWindow() }
