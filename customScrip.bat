@echo off
setlocal

set "EGGPLANT_HOME=C:\Program Files\Eggplant"
set "SCRIPT_NAME=customFile"
set "SCRIPT_PATH=%~dp0OrngeHRM.suite\Scripts\%SCRIPT_NAME%.script"

echo Running Eggplant script: %SCRIPT_PATH%

call "%EGGPLANT_HOME%\runscript.bat" "%SCRIPT_PATH%"

set "EXIT_CODE=%ERRORLEVEL%"

if %EXIT_CODE% NEQ 0 (
    echo Eggplant script FAILED with exit code %EXIT_CODE%
) else (
    echo Eggplant script PASSED
)

endlocal & exit /b %EXIT_CODE%