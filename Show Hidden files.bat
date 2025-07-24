REG QUERY "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden | Find "0x0"

IF %ERRORLEVEL% == 1 goto ShowFiles
IF %ERRORLEVEL% == 0 goto HideFiles

goto end

:ShowFiles
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 0 /f
timeout /t 1
taskkill /f /im explorer.exe
start explorer.exe
goto end

:HideFiles
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
timeout /t 1
taskkill /f /im explorer.exe
start explorer.exe
goto end
:end