REM Check for administrator privileges and self-elevate if needed

fsutil dirty query %systemdrive% >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    mshta "javascript:var shell=new ActiveXObject('Shell.Application');shell.ShellExecute('%~s0','','','runas',1);close();"
    exit /b
)

cd /D "%~dp0"
for /F "tokens=*" %%i in ('dir /B *.cr*') do (
  %SystemRoot%\System32\certutil.exe -f -addstore Root "%%i"
)
pause