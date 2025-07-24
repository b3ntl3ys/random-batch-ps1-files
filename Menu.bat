echo off
CLS
:MENU
ECHO Welcome, %USERNAME%!
echo 1 - Reset user account
echo 2 - Password_never
echo 3 - Set ipv4_dns
echo 4 - Set ipv6_dns
echo 5 - 
echo 9 - Main Menu

SET /P Menu=Type 1, 2, 3, or 4 then press ENTER:
IF %Menu%==1 GOTO Reset user account
IF %Menu%==2 GOTO Password_never
IF %Menu%==3 GOTO Set ipv4_dns
IF %Menu%==4 GOTO Set ipv6_dns
IF %Menu%==5 GOTO 
IF %Menu%==9 GOTO Menu

:Reset user account
reset_library_user_account.bat
cls
:Password_never
password_never.bat
cls
:Set ipv4_dns
ipv4_dns.bat
cls
:Set ipv6_dns
ipv4_dns.bat
cls
GOTO MENU
:Menu
Menu.bat
cls
GOTO MENU