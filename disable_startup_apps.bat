@echo off

REM Check for administrative privileges
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
)

REM Your script code starts here
REM Disable all startup apps by setting their registry keys

REM Disable for the current user
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run /v "*" /t REG_BINARY /d 00 /f >nul 2>&1

REM Disable for all users
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run /v "*" /t REG_BINARY /d 00 /f >nul 2>&1

echo All startup apps have been disabled
pause
exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B
