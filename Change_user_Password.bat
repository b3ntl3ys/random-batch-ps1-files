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
echo 1 - Set new password
echo 2 - Clear password
echo 3 - Exit

REM Ask the user for choice
set /p choice=Enter your choice:

REM Process user choice
if "%choice%"=="1" goto SetPassword
if "%choice%"=="2" goto ClearPassword
if "%choice%"=="3" goto ExitScript

REM Invalid choice
echo Invalid choice
timeout /t 1
goto run

:SetPassword
REM Ask the user for a new password
set /p newPassword=Enter new password:

REM Change the password for the current user
net user "%USERNAME%" %newPassword%

echo Password has been changed
timeout /t 1
call Library.bat

:ClearPassword
REM Clear the password for the current user
net user "%USERNAME%" ""

echo Password has been cleared
timeout /t 1
call Library.bat

:ExitScript
REM Go back to the main menu
call Library.bat
exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B
