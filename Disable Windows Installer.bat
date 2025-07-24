@echo off
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer" /v "DisableMSI" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer" /v "DisableMSI" /t REG_DWORD /d 1 /f
