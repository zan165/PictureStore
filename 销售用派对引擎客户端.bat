chcp 936
@echo off & setlocal
::echo �������evche���� �������������ϵ��WX��qian_cn_Sc


:coustum
setlocal enabledelayedexpansion


::����ʱ��
set d =
::����ʱ��
set s =
::�ջ���
set r =
::�Ƿ�Ϊ����ģʽ
set isDebug=true



:setRunDir


set debugPath=%CD%\..\public
set PARTY_HOME=\\Desktop-127asaa\�ɶ�����
set releasePath=\\Fuwuqi\������3-�Ѽ�ͼƬ����\���ϰ�\���ϰ��ز�\ÿ����Ʋ��ϰ�
set MOUDLES_DIR=%PARTY_HOME%\assets\Moudles
set MOUDLEFILE_DIR=%PARTY_HOME%\assets\ModelFile


set ASSETS_DIR=%PARTY_HOME%\assets
set MODELBG=%PARTY_HOME%\assets\BackGround
set PHOTOGUIDE=%PARTY_HOME%\assets\PhotoGuid

set month=%date:~5,2%
set day=%date:~8,2%
set d=%month%.%day%

set pName=��ǧ\�����\%d%
REM set /p chooseServer=��˭�Ķ���,����0�˳�������1�ֱ�������2 �� ����3��־�� ����4 ��ǧ
REM if /i '!chooseServer!'=='0' goto toEnd
REM if /i '!chooseServer!'=='1' set pName=�ֱ�\�����
REM if /i '!chooseServer!'=='2' set pName=��\�����
REM if /i '!chooseServer!'=='3' set pName=��־��\�����
REM if /i '!chooseServer!'=='4' set pName=��ǧ\�����

REM set pName=�ֱ�\�����
REM set pName=��\�����
REM set pName=��־��\�����

::�����������Ŀ¼������ ���ǲ���Ŀ¼
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

echo ��ǰ������ %d% 

set totalPrice=0

set /p address=��ַ��

call :addr %address% 

set /p psInfo=˵������:

call :STR_PS %psInfo%
echo !str1!  !str2!

set  s= !str1!��!str2!
echo ����ʱ��,����ʱ�䣺 !s!



REM set /p custum=�������ջ���������
set fname="!s!���ջ��ˣ�%addr0%"

echo %fname%

echo !PUBLIC_DIR!\%fname%




if not exist !PUBLIC_DIR!\%fname% (mkdir !PUBLIC_DIR!\%fname%)


::if not exist !PUBLIC_DIR!\%fname%\˵��.txt  (copy %MOUDLEFILE_DIR%\_.txt !PUBLIC_DIR!\%fname%\˵��.txt )
::�����ж� ����Ч��
copy %MOUDLEFILE_DIR%\_.txt !PUBLIC_DIR!\%fname%\˵��.txt

echo ˵����%psInfo%>!PUBLIC_DIR!\%fname%\˵��.txt
echo.>>!PUBLIC_DIR!\%fname%\˵��.txt
echo.>>!PUBLIC_DIR!\%fname%\˵��.txt
echo ����������ȫ��>>!PUBLIC_DIR!\%fname%\˵��.txt
echo.>>!PUBLIC_DIR!\%fname%\˵��.txt
echo.>>!PUBLIC_DIR!\%fname%\˵��.txt
echo ��ַ��%address% >>!PUBLIC_DIR!\%fname%\˵��.txt

set dialogStr=%pName%��������%d%_%fname%


::Э���ļ����Ŀ¼
set OUTPUT_DIR= !PUBLIC_DIR!\%fname%
if not exist %OUTPUT_DIR% (goto end)


:insert_bg_picLoop
set /p isInsertBg=�����뱳������,����0�˳�������1��Ƭ�ƣ�����2 ���ƿ�
if /i '!isInsertBg!'=='0' goto toEnd
if /i '!isInsertBg!'=='1' goto pictureLoop
if /i '!isInsertBg!'=='2' goto uniqueBg
	echo ׼������ "%isInsertBg%"
	
if exist %MOUDLES_DIR%\"%isInsertBg%" (
	echo ��ʼ����
	::
	REM start publish.bat %pName% %fname% true false %MOUDLES_DIR%\"%isInsertBg%"\*
	copy %MOUDLES_DIR%\"%isInsertBg%"\%isInsertBg%.jpg %OUTPUT_DIR%
	echo �������,��������˳�

	set dialogStr=!dialogStr!%isInsertBg%
)
goto insert_bg_picLoop

:uniqueBg

	set /p uniqueBgName=���ƿ�ʽ������ 
	mkdir %MOUDLES_DIR%\"%uniqueBgName%" 

	set dialogStr=!dialogStr!-���Ʊ���-%uniqueBgName%-
	
	echo dialogStr����  !dialogStr!
	goto toEnd

:pictureLoop

set /p isInsertPic=��������Ƭ�Ʊ���,����0�Ƴ�
if /i '!isInsertPic!'=='0' goto toEnd

	echo %PHOTOGUIDE%\%isInsertPic%.jpg
if exist %PHOTOGUIDE%\%isInsertPic%.jpg (
	echo ��ʼ����
	::
	copy %PHOTOGUIDE%\%isInsertPic%.jpg %OUTPUT_DIR%
	echo �������,��������˳�
	set dialogStr=!dialogStr!-%isInsertPic%-
)


goto pictureLoop

:toEnd

set dialogStr=!dialogStr!XXX%totalPrice%
start explorer !PUBLIC_DIR!\%fname%

::��־д�������
::goto :WriteDialog !dialogStr!  


::��־д�������
start WriteDialog.bat !dialogStr! 

echo "��־д������� "!dialogStr! 



goto :end


:WriteDialog
set SERVICE_PARTY_HOME=\\Fuwuqi\������3-�Ѽ�ͼƬ����\���ϰ�\��Ѿ�ɶ�
set DIALOG_DIR=%SERVICE_PARTY_HOME%\dialog
if not exist %DIALOG_DIR% (mkdir  %DIALOG_DIR%)
if errorlevel == 1 goto end


:orderLog
if not exist %DIALOG_DIR%\log.txt echo ������־��>%DIALOG_DIR%\log.txt
echo %~1 >>%DIALOG_DIR%\log.txt

goto :end


:changeNameLog
if not exist %DIALOG_DIR%\changeLog.txt echo �ļ��޸���־��>%DIALOG_DIR%\changeLog.txt
echo %1 >>%DIALOG_DIR%\changeLog.txt

goto :end


goto :eof


rem ��ֱ�ע��Ϣ
:STR_PS

REM ����ÿ��ѭ�����ֵ���������
set str0=%~1
set str1=%~2
set str2=%~3
set str3=%~4
set str4=%~5
set str5=%~6

goto :eof


rem ��ֵ�ַ��Ϣ
:addr
::rem ע�������s���壬��ֵ����ʹ��˫������������
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



��������

����,18418945144-4808,�Ĵ�ʡ �ɶ��� �¶��� ��������ˮ����16��,000000
q 3.14 δ �ջ������� �������֣��¿�Խ 100��
LHZTBB12


