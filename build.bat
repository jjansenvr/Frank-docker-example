@echo off
setlocal enabledelayedexpansion

REM Get the current date and time
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%
set HH=%dt:~8,2%
set Min=%dt:~10,2%
set Sec=%dt:~12,2%

REM Create a timestamp
set stamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%


REM Get the parent folder name
for %%I in (.) do set "parentName=%%~nxI"

REM Zip the directory using WinRAR
"C:\Program Files\WinRAR\WinRAR.exe" a -afzip "%~dp0builds/!parentName!_%stamp%.jar" "%~dp0configurations/*"


REM Display a message 
echo created a jar file to deploy in build folder: "!parentName!_%stamp%.jar"
pause


