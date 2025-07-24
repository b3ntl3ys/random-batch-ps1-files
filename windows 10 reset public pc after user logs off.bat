@echo off

REM Set time limit for disconnected sessions to 1 minute
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v MaxDisconnectionTime /t REG_DWORD /d 60 /f

REM Enable deletion of temporary folders upon exit
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v DeleteTempDirsOnExit /t REG_DWORD /d 1 /f

REM Delete user profiles older than 0 days on system restart
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ProfileList" /v MaxProfileAge /t REG_DWORD /d 0 /f

REM Force Group Policy update
gpupdate /force

echo Public PC reset settings applied.

pause
Menu.bat