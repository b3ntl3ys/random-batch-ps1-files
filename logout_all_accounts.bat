@echo off

REM Check for administrative privileges
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
)

REM Your script code starts here
REM Get a list of all active sessions
for /f "tokens=1,2,3 delims= " %%a in ('query session') do (
    REM Skip the first line (header)
    if not "%%b" == "" (
        REM Log off the session (ID is in %%b)
        logoff %%b
    )
)

echo All accounts have been logged out
pause
exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B
