@echo off
setlocal

:: Ask for the account name
set /p UserName=Enter the name of the user account to modify: 

:: Ask whether to hide or unhide
:choice
set /p hideChoice=Type 0 to HIDE the account or 1 to UNHIDE it: 
if not "%hideChoice%"=="0" if not "%hideChoice%"=="1" (
    echo Invalid input. Please enter 0 or 1.
    goto :choice
)

:: Registry key
set "regKey=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts"

:: Create SpecialAccounts key
reg add "%regKey%" /f >nul 2>&1
if %errorlevel% neq 0 (
    echo Failed to create or access SpecialAccounts key.
    goto :EOF
)

:: Create UserList subkey
reg add "%regKey%\UserList" /f >nul 2>&1
if %errorlevel% neq 0 (
    echo Failed to create or access UserList subkey.
    goto :EOF
)

:: Add or update the DWORD value
reg add "%regKey%\UserList" /v "%UserName%" /t REG_DWORD /d %hideChoice% /f >nul 2>&1
if %errorlevel% equ 0 (
    if "%hideChoice%"=="0" (
        echo User "%UserName%" has been HIDDEN from the login screen.
    ) else (
        echo User "%UserName%" has been UNHIDDEN on the login screen.
    )
) else (
    echo Failed to update visibility for user "%UserName%".
)

pause
