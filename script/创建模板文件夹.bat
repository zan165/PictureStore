@echo off
REM 声明采用UTF-8编码
SetLocal ENABLEDELAYEDEXPANSION

echo '拷贝BackGround目录内的.jpg文件到Moudles目录'

set PAIDUI_HOME=\\设计素材\e\派对引擎
::协议文件输入目录
set RUN_DIR=%PAIDUI_HOME%\..\assets\BackGround

REM ::协议文件输出目录
REM set OUTPUT_DIR=%PAIDUI_HOME%\..\assets\Moudles
REM if not exist %OUTPUT_DIR% (mkdir %OUTPUT_DIR%)

REM for /r %%a in\\设计素材\e\派对引擎\assets\BackGround do echo %%a





REM CD %RUN_DIR%
 REM FOR %%a in (*.jpg) do ( 
	REM echo 进入for循环
	REM set "name=%%a" 
	REM set "name=!name:.jpg=!" 
	REM echo name !name!
	REM mkdir %OUTPUT_DIR%\!name!
	REM copy !name!.jpg %OUTPUT_DIR%\!name!\
	
 REM )
 
@pause
exit


