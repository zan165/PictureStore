@echo off
setlocal enabledelayedexpansion


set debugPath=%CD%\..\public
set PARTY_HOME=%CD%
set releasePath=\\Fuwuqi\������3-�Ѽ�ͼƬ����\���ϰ�\���ϰ��ز�\ÿ����Ʋ��ϰ�
set MOUDLES_DIR=%PARTY_HOME%\assets\Moudles
set MOUDLEFILE_DIR=%PARTY_HOME%\assets\ModelFile


set ASSETS_DIR=%PARTY_HOME%\assets
set MODELBG=%PARTY_HOME%\assets\BackGround
set PHOTOGUIDE=%PARTY_HOME%\assets\PhotoGuid



:insert_bg_picLoop
set /p isInsertBg=�����뱳���ײͱ��,�˳�������0:
if /i '!isInsertBg!'=='0' goto toEnd
	echo ��������ײͱ���� "%isInsertBg%"
	
if exist %MOUDLES_DIR%\"%isInsertBg%" (
	
	echo �����ɹ������Ѵ��زĿ� ��0�˳�

	start explorer !MOUDLES_DIR!\%isInsertBg%
)else ( 
	echo  δ�����ɹ������������룬�˳�������0 
)
goto insert_bg_picLoop



:toEnd

