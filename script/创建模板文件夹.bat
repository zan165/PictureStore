@echo off
REM ��������UTF-8����
SetLocal ENABLEDELAYEDEXPANSION

echo '����BackGroundĿ¼�ڵ�.jpg�ļ���MoudlesĿ¼'

set PAIDUI_HOME=\\����ز�\e\�ɶ�����
::Э���ļ�����Ŀ¼
set RUN_DIR=%PAIDUI_HOME%\..\assets\BackGround

REM ::Э���ļ����Ŀ¼
REM set OUTPUT_DIR=%PAIDUI_HOME%\..\assets\Moudles
REM if not exist %OUTPUT_DIR% (mkdir %OUTPUT_DIR%)

REM for /r %%a in\\����ز�\e\�ɶ�����\assets\BackGround do echo %%a





REM CD %RUN_DIR%
 REM FOR %%a in (*.jpg) do ( 
	REM echo ����forѭ��
	REM set "name=%%a" 
	REM set "name=!name:.jpg=!" 
	REM echo name !name!
	REM mkdir %OUTPUT_DIR%\!name!
	REM copy !name!.jpg %OUTPUT_DIR%\!name!\
	
 REM )
 
@pause
exit


