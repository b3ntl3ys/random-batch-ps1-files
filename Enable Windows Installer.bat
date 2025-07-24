@echo off
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Installer" /v "DisableMSI" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer" /v "DisableMSI" /f