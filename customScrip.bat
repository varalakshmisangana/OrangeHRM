@echo off
setlocal EnableDelayedExpansion
 
set "SUITE_NAME=OrngeHRM.suite"
set "SCRIPT_NAME=customFile.script"
 
echo Searching for %SUITE_NAME%...
 
for /f "delims=" %%A in ('where /r C:\ %SUITE_NAME% 2^>nul') do (
    set "SUITE_PATH=%%A"
    goto :FOUND
)
 
echo ERROR: %SUITE_NAME% was not found.
exit /b 1
 
:FOUND
 
echo Suite found:
echo !SUITE_PATH!
 
set "SCRIPT_PATH=!SUITE_PATH!\Scripts\%SCRIPT_NAME%"
 
echo Running:
echo !SCRIPT_PATH!
 
"C:\Program Files\Eggplant\runscript.bat" "!SCRIPT_PATH!"
 
set EXIT_CODE=%ERRORLEVEL%
 
echo Eggplant execution completed with exit code %EXIT_CODE%
 
exit /b %EXIT_CODE%