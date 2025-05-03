@echo off
setlocal
set START_DIR=%cd%
set SCRIPT_DIR=%~dp0%

echo START_DIR: %START_DIR%
echo SCRIPT_DIR: %SCRIPT_DIR%

cd %START_DIR%
cd .\County-Trail-Enhancement\
docker-compose up -d --build
@echo.
@echo.
@echo Use one of the below IP addresses with port 5001.
@ipconfig/all | find "IPv4" 
@echo.
@echo.

cmd /k