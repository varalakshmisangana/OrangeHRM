@echo off
setlocal

echo Finding Git repository...

for /f "delims=" %%G in ('git -C "%~dp0" rev-parse --show-toplevel 2^>nul') do set "GIT_ROOT=%%G"

if not defined GIT_ROOT (
    echo ERROR: Git repository not found.
    exit /b 1
)

echo Git repository: "%GIT_ROOT%"

set "SCRIPT_PATH=%GIT_ROOT%\OrngeHRM.suite\Scripts\customFile.script"

echo Script path: "%SCRIPT_PATH%"

if not exist "%SCRIPT_PATH%" (
    echo ERROR: Eggplant script not found.
    exit /b 1
)

echo Running Eggplant script...

"C:\Program Files\Eggplant\runscript.bat" "%SCRIPT_PATH%"

set "EXIT_CODE=%ERRORLEVEL%"

echo Eggplant execution completed with exit code %EXIT_CODE%

exit /b %EXIT_CODE%