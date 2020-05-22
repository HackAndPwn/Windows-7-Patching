cd /D "%~dp0"
for /F "tokens=*" %%i in ('dir /B *.cr*') do (
  %SystemRoot%\System32\certutil.exe -f -addstore Root "%%i"
)
pause