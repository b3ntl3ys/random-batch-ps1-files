@echo off
setlocal

:: Check if Python is installed
where python >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [ERROR] Python is not installed or not in PATH.
    pause
    exit /b
)

:: Check if auto-py-to-exe is installed
python -m auto_py_to_exe --help >nul 2>&1
if %errorlevel% NEQ 0 (
    echo auto-py-to-exe not found. Installing...
    pip install auto-py-to-exe
) else (
    echo auto-py-to-exe is already installed. Checking for updates...
    pip install --upgrade auto-py-to-exe
)

:: Launch auto-py-to-exe
echo Launching auto-py-to-exe...
python -m auto_py_to_exe

echo Process complete.
pause
