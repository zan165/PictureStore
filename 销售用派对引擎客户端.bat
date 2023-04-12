chcp 936
@echo off & setlocal
::echo 本软件由evche编制 如果有问题请联系：WX：qian_cn_Sc


:coustum
setlocal enabledelayedexpansion


::订单时间
set d =
::布置时间
set s =
::收货人
set r =
::是否为调试模式
set isDebug=true



:setRunDir


set debugPath=%CD%\..\public
set PARTY_HOME=\\Desktop-127asaa\派对引擎
set releasePath=\\Fuwuqi\服务器3-搜集图片案例\材料包\材料包素材\每日设计材料包
set MOUDLES_DIR=%PARTY_HOME%\assets\Moudles
set MOUDLEFILE_DIR=%PARTY_HOME%\assets\ModelFile


set ASSETS_DIR=%PARTY_HOME%\assets
set MODELBG=%PARTY_HOME%\assets\BackGround
set PHOTOGUIDE=%PARTY_HOME%\assets\PhotoGuid

set month=%date:~5,2%
set day=%date:~8,2%
set d=%month%.%day%

set pName=阿千\待设计\%d%
REM set /p chooseServer=是谁的订单,输入0退出，输入1林宝，输入2 张 输入3曾志康 输入4 阿千
REM if /i '!chooseServer!'=='0' goto toEnd
REM if /i '!chooseServer!'=='1' set pName=林宝\待设计
REM if /i '!chooseServer!'=='2' set pName=张\待设计
REM if /i '!chooseServer!'=='3' set pName=曾志康\待设计
REM if /i '!chooseServer!'=='4' set pName=阿千\待设计

REM set pName=林宝\待设计
REM set pName=张\待设计
REM set pName=曾志康\待设计

::如果生产环境目录不存在 就是测试目录
::if not exist %releasePath%\!pName! (set isDebug=true )
set isDebug=false
echo !isDebug! !pName!
set


if "!isDebug!"=="true" (
 set PUBLIC_DIR=%debugPath%\%pName%
) else (
 set PUBLIC_DIR=%releasePath%\%pName%
)

if not exist !PUBLIC_DIR! (mkdir  !PUBLIC_DIR!)
if errorlevel == 1 goto end


:init

set month=%date:~5,2%
set day=%date:~8,2%
set d=%month%.%day%

echo 当前日期是 %d% 

set totalPrice=0

set /p address=地址：

call :addr %address% 

set /p psInfo=说明内容:

call :STR_PS %psInfo%
echo !str1!  !str2!

set  s= !str1!，!str2!
echo 发货时间,布置时间： !s!



REM set /p custum=请输入收货人姓名：
set fname="!s!，收货人：%addr0%"

echo %fname%

echo !PUBLIC_DIR!\%fname%




if not exist !PUBLIC_DIR!\%fname% (mkdir !PUBLIC_DIR!\%fname%)


::if not exist !PUBLIC_DIR!\%fname%\说明.txt  (copy %MOUDLEFILE_DIR%\_.txt !PUBLIC_DIR!\%fname%\说明.txt )
::减少判断 增加效率
copy %MOUDLEFILE_DIR%\_.txt !PUBLIC_DIR!\%fname%\说明.txt

echo 说明：%psInfo%>!PUBLIC_DIR!\%fname%\说明.txt
echo.>>!PUBLIC_DIR!\%fname%\说明.txt
echo.>>!PUBLIC_DIR!\%fname%\说明.txt
echo 发货：背景全套>>!PUBLIC_DIR!\%fname%\说明.txt
echo.>>!PUBLIC_DIR!\%fname%\说明.txt
echo.>>!PUBLIC_DIR!\%fname%\说明.txt
echo 地址：%address% >>!PUBLIC_DIR!\%fname%\说明.txt

set dialogStr=%pName%————%d%_%fname%


::协议文件输出目录
set OUTPUT_DIR= !PUBLIC_DIR!\%fname%
if not exist %OUTPUT_DIR% (goto end)


:insert_bg_picLoop
set /p isInsertBg=请输入背景编码,输入0退出，输入1照片牌，输入2 定制款
if /i '!isInsertBg!'=='0' goto toEnd
if /i '!isInsertBg!'=='1' goto pictureLoop
if /i '!isInsertBg!'=='2' goto uniqueBg
	echo 准备拷贝 "%isInsertBg%"
	
if exist %MOUDLES_DIR%\"%isInsertBg%" (
	echo 开始拷贝
	::
	REM start publish.bat %pName% %fname% true false %MOUDLES_DIR%\"%isInsertBg%"\*
	copy %MOUDLES_DIR%\"%isInsertBg%"\%isInsertBg%.jpg %OUTPUT_DIR%
	echo 拷贝完成,按任意键退出

	set dialogStr=!dialogStr!%isInsertBg%
)
goto insert_bg_picLoop

:uniqueBg

	set /p uniqueBgName=定制款式命名： 
	mkdir %MOUDLES_DIR%\"%uniqueBgName%" 

	set dialogStr=!dialogStr!-定制背景-%uniqueBgName%-
	
	echo dialogStr：：  !dialogStr!
	goto toEnd

:pictureLoop

set /p isInsertPic=请输入照片牌编码,输入0推出
if /i '!isInsertPic!'=='0' goto toEnd

	echo %PHOTOGUIDE%\%isInsertPic%.jpg
if exist %PHOTOGUIDE%\%isInsertPic%.jpg (
	echo 开始拷贝
	::
	copy %PHOTOGUIDE%\%isInsertPic%.jpg %OUTPUT_DIR%
	echo 拷贝完成,按任意键退出
	set dialogStr=!dialogStr!-%isInsertPic%-
)


goto pictureLoop

:toEnd

set dialogStr=!dialogStr!XXX%totalPrice%
start explorer !PUBLIC_DIR!\%fname%

::日志写入服务器
::goto :WriteDialog !dialogStr!  


::日志写入服务器
start WriteDialog.bat !dialogStr! 

echo "日志写入服务器 "!dialogStr! 



goto :end


:WriteDialog
set SERVICE_PARTY_HOME=\\Fuwuqi\服务器3-搜集图片案例\材料包\豆丫派对
set DIALOG_DIR=%SERVICE_PARTY_HOME%\dialog
if not exist %DIALOG_DIR% (mkdir  %DIALOG_DIR%)
if errorlevel == 1 goto end


:orderLog
if not exist %DIALOG_DIR%\log.txt echo 订单日志：>%DIALOG_DIR%\log.txt
echo %~1 >>%DIALOG_DIR%\log.txt

goto :end


:changeNameLog
if not exist %DIALOG_DIR%\changeLog.txt echo 文件修改日志：>%DIALOG_DIR%\changeLog.txt
echo %1 >>%DIALOG_DIR%\changeLog.txt

goto :end


goto :eof


rem 拆分备注信息
:STR_PS

REM 看看每次循环后的值，便于理解
set str0=%~1
set str1=%~2
set str2=%~3
set str3=%~4
set str4=%~5
set str5=%~6

goto :eof


rem 拆分地址信息
:addr
::rem 注意这里的s定义，其值不是使用双引号引起来的
::rem  also works for comma-separated lists, e.g. ABC,DEF,GHI,JKL
::set s=%~1
set /a count=0
for %%a in (%~1) do ( 
if !count! equ 0 set addr0=%%a
if !count! equ 1 set addr1=%%a
if !count! equ 2 set addr2=%%a
if !count! equ 3 set addr3=%%a
if !count! equ 4 set addr4=%%a
if !count! equ 5 set addr5=%%a
if !count! equ 6 set addr6=%%a
set /a count=!count!+1
)


goto :eof

 
:end
 
echo Good-bye!
 
  
endlocal & @echo on



测试数据

测试,18418945144-4808,四川省 成都市 新都区 军屯镇深水社区16社,000000
q 3.14 未 收货人蚊子 宝宝名字：温竣越 100天
LHZTBB12


