@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "PY="
for /d %%i in ("%USERPROFILE%\.astrbot_launcher\instances\*") do if exist "%%i\venv\Scripts\python.exe" set "PY=%%i\venv\Scripts\python.exe"
if not defined PY for %%p in (python.exe) do if not "%%~$PATH:p"=="" set "PY=%%~$PATH:p"
if not defined PY (
  echo Python not found. Install AstrBot Launcher first.
  pause
  exit /b 1
)
"%PY%" -X utf8 tools\import_dafeiyu.py %*
pause
