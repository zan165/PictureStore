chcp 936
@echo off & setlocal
echo %1 %2 %3



set DIALOG_DIR=\\Fuwuqi\服务器3-搜集图片案例\材料包\豆丫派对\dialog

if not exist %DIALOG_DIR% (mkdir  %DIALOG_DIR%)


if errorlevel == 1 goto end

if '%2'=='2' goto :changeNameLog


:orderLog
if not exist %DIALOG_DIR%\log.txt echo 订单日志：>%DIALOG_DIR%\log.txt

echo %1


echo %1 >>%DIALOG_DIR%\log.txt

goto :end


:changeNameLog
if not exist %DIALOG_DIR%\changeLog.txt echo 文件修改日志：>%DIALOG_DIR%\changeLog.txt
echo %1 >>%DIALOG_DIR%\changeLog.txt

goto :end


:end
exit