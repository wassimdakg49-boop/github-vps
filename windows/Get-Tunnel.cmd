@echo off
setlocal
title VPS Tunnel Link
set "NAME=gnome-vps-vp6x5vgxj4r7fp46g"

echo Getting current VPS link...
:retry
gh codespace ssh -c %NAME% -- vps-tunnel
if errorlevel 1 (
  echo   (codespace not ready, retrying in 8s...)
  ping -n 9 127.0.0.1 >nul
  goto retry
)
echo.
pause
