chcp 936
@echo off & setlocal
echo %1 %2 %3



set DIALOG_DIR=\\Fuwuqi\������3-�Ѽ�ͼƬ����\���ϰ�\��Ѿ�ɶ�\dialog

if not exist %DIALOG_DIR% (mkdir  %DIALOG_DIR%)


if errorlevel == 1 goto end

if '%2'=='2' goto :changeNameLog


:orderLog
if not exist %DIALOG_DIR%\log.txt echo ������־��>%DIALOG_DIR%\log.txt

echo %1


echo %1 >>%DIALOG_DIR%\log.txt

goto :end


:changeNameLog
if not exist %DIALOG_DIR%\changeLog.txt echo �ļ��޸���־��>%DIALOG_DIR%\changeLog.txt
echo %1 >>%DIALOG_DIR%\changeLog.txt

goto :end


:end
exit