@echo off
setlocal
title VPS Start
set "NAME=gnome-vps-vp6x5vgxj4r7fp46g"

echo [1/2] Waking the VPS codespace...
gh api -X POST "user/codespaces/%NAME%/start" >nul 2>&1
echo     (starting - can take a minute)
ping -n 11 127.0.0.1 >nul

echo [2/2] Starting desktop + cloudflare tunnel, then printing your link...
:retry
gh codespace ssh -c %NAME% -- vps-start
if errorlevel 1 (
  echo   (still booting, retrying in 8s...)
  ping -n 9 127.0.0.1 >nul
  goto retry
)

echo.
echo Done. Open the URL printed above in your browser.
echo.
pause
