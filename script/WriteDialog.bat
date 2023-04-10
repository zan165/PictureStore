chcp 936
@echo off & setlocal
echo %1 %2 %3

set DIALOG_DIR=%CD%\..\dialog
if not exist %DIALOG_DIR% (mkdir  %DIALOG_DIR%)
if errorlevel == 1 goto end


if not exist %DIALOG_DIR%\log.txt echo 订单日志：>%DIALOG_DIR%\log.txt
echo %1 >>%DIALOG_DIR%\log.txt

exit