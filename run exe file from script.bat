@ECHO OFF
:B
SET MyProcess=Notepad.exe
ECHO "%MyProcess%"
TASKLIST | FINDSTR /I "%MyProcess%"
timeout /t 600
IF ERRORLEVEL 0 (GOTO :StartScripts)
timeout /t 600
GOTO :B 

:StartScripts 
::: //-- Put in the full path to the batch scripts to call
::: //-- Be sure the security context this process runs as has access to execute the below called batch scripts
start "" "Plex Media Server.exe"
GOTO :B 