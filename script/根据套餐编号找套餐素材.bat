@echo off
setlocal enabledelayedexpansion


set debugPath=%CD%\..\public
set PARTY_HOME=%CD%
set releasePath=\\Fuwuqi\服务器3-搜集图片案例\材料包\材料包素材\每日设计材料包
set MOUDLES_DIR=%PARTY_HOME%\assets\Moudles
set MOUDLEFILE_DIR=%PARTY_HOME%\assets\ModelFile


set ASSETS_DIR=%PARTY_HOME%\assets
set MODELBG=%PARTY_HOME%\assets\BackGround
set PHOTOGUIDE=%PARTY_HOME%\assets\PhotoGuid



:insert_bg_picLoop
set /p isInsertBg=请输入背景套餐编号,退出清输入0:
if /i '!isInsertBg!'=='0' goto toEnd
	echo 您输入的套餐编号是 "%isInsertBg%"
	
if exist %MOUDLES_DIR%\"%isInsertBg%" (
	
	echo 搜索成功，现已打开素材库 按0退出

	start explorer !MOUDLES_DIR!\%isInsertBg%
)else ( 
	echo  未搜索成功，请重新输入，退出请输入0 
)
goto insert_bg_picLoop



:toEnd

