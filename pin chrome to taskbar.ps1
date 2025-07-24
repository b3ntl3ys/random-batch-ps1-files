# Pin Microsoft Word to taskbar
$WordPath = "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
$WordShortcut = "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Word.lnk"
$Shell = New-Object -ComObject WScript.Shell
$Shortcut = $Shell.CreateShortcut($WordShortcut)
$Shortcut.TargetPath = $WordPath
$Shortcut.Save()

# Pin Microsoft Excel to taskbar
$ExcelPath = "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
$ExcelShortcut = "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Excel.lnk"
$Shortcut = $Shell.CreateShortcut($ExcelShortcut)
$Shortcut.TargetPath = $ExcelPath
$Shortcut.Save()

# Pin Google Chrome to taskbar
$ChromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$ChromeShortcut = "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Google Chrome.lnk"
$Shortcut = $Shell.CreateShortcut($ChromeShortcut)
$Shortcut.TargetPath = $ChromePath
$Shortcut.Save()
