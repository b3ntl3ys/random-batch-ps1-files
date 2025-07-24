@echo off
setlocal

:: Ask user for the account name to hide
set /p UserName=Enter the name of the user account you want to hide: 

:: Registry path for hiding user accounts
set "regKey=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts"

:: Create the SpecialAccounts key (if not already present)
reg add "%regKey%" /f >nul 2>&1
if %errorlevel% neq 0 (
    echo Failed to create or access SpecialAccounts key.
    goto :EOF
)

:: Create the UserList subkey
reg add "%regKey%\UserList" /f >nul 2>&1
if %errorlevel% neq 0 (
    echo Failed to create or access UserList subkey.
    goto :EOF
)

:: Add the entered username as a DWORD value with data 0 (hidden)
reg add "%regKey%\UserList" /v "%UserName%" /t REG_DWORD /d 0 /f >nul 2>&1
if %errorlevel% equ 0 (
    echo User account "%UserName%" has been hidden from the login screen.
) else (
    echo Failed to hide the account "%UserName%". Make sure you are running this as Administrator.
)

pause
