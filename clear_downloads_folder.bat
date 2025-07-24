@echo off

REM Check for administrative privileges
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
)

REM Your script code starts here
:run
REM Display menu
echo 1 - Clear Downloads folder for Current User
echo 2 - Exit

REM Ask the user for choice
set /p choice=Enter your choice:

REM Process user choice

if "%choice%"=="1" goto ClearCurrentUserDownloads
if "%choice%"=="2" goto ExitScript

REM Invalid choice
echo Invalid choice
timeout /t 1
goto run

:ClearCurrentUserDownloads
REM Clear Downloads folder for Current User
rd /s /q "%USERPROFILE%\Downloads"
md "%USERPROFILE%\Downloads"
echo Downloads folder for Current User has been cleared
timeout /t 1
goto run

:ExitScript
REM Exit the script
exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B
