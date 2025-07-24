@echo off
setlocal

:: Prompt for username
set /p NewUserName=Enter the username to create: 

call :isAdmin
if %errorlevel% == 0 (
    goto :run
) else (
    echo Requesting administrative privileges...
    goto :UACPrompt
)

exit /b

:isAdmin
    fsutil dirty query %systemdrive% >nul 2>&1
exit /b

:run
:: Create the user (without password)
net user "%NewUserName%" /add
if %errorlevel% == 0 (
    echo User "%NewUserName%" has been added successfully.
) else (
    echo Failed to create the user. It may already exist or there was a permission error.
)

timeout /t 5

:: Optional: simulate a sendkeys action
call sendkeys.bat "certificate" "{enter}"
exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c set NewUserName=%NewUserName%^& %~s0", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
timeout /t 5
exit /b
