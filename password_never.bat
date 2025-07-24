WMIC USERACCOUNT WHERE Name='Patron' SET PasswordExpires=FALSE
pause
WMIC USERACCOUNT WHERE Name='Staff' SET PasswordExpires=FALSE
pause
Menu.bat