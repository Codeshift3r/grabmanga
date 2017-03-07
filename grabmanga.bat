:: Grabmanga - Bulk manga downloader::
:: Last Updated 13/3/2014 ::
:: seriousubs@gmail.com/amsharsolaiman@gmail.com ::
@echo off
title Grabmanga v1.0b
Setlocal EnableDelayedExpansion
:inmark
:: structure for parameters handling ::
if %1==--help goto :helptag
if exist %1.bat call %1.bat && goto :launch
:support
echo.
echo Oops.. Could not load the host file %1.bat.
echo It is possible that the host is not supported by Grabmanga.
echo Type "grabmanga --help" to invoke the help menu.
echo.
goto :Eof
:helptag
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Grabmanga v1.0b ³ 2013 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo [] Usage:
echo grabmanga [host] [manga] [from chapter] [to chapter] [limit]
echo eg : grabmanga mangable one_Piece 100 110 20
echo.
echo [?] Explaination
echo [host] the host you wish to download from
echo [manga] the manga you wish to download
echo [from chapter] the starting chapter you wish to download
echo [to chapter] the last chapter you want to download
echo [limit] the page limit of each chapter
echo.
goto :Eof
:filerror
echo %missing% is missing
echo You can obtain a copy of Wget for windows at
echo http://users.ugent.be/~bpuype/wget/
echo.
goto :Eof
:launch
:: Check required files ::
:: Structure for error handling ::
if not exist wget.exe set missing=wget.exe && goto :filerror
:: declare vars ::
set server=%server%
set subdomain=%subdomain%
set filepath=%filepath%
set extension=%extension%
set manga=%2
set fromchapter=%3
set tochapter=%4
set pagelimit=%5
set useragent=Mozilla/5.0
set dmode=normal
set count=1
set seperator=/
set dwstat=Y
:: Folders checking ::
if not exist %manga% md %manga%
cd %manga%
if not exist %fromchapter% md %fromchapter%
cd..
:filecheck
:: Filename checking ::
title Grabmanga [ %server% ] %manga% Chapter %fromchapter%
echo [%language%] Space substitution is %space%
echo [Y] Checking for zero type Filename...
if exist %temp%\0%count%.%extension% del %temp%\0%count%.%extension%
wget -q -c -nc --user-agent=%useragent% --directory-prefix=%temp% %subdomain%%server%%filepath%%manga%/%fromchapter%/0%count%.%extension%
if exist %temp%\0%count%.%extension% set dmode=zero && move %temp%\0%count%.%extension% %manga%\%fromchapter%>nul
if %dmode%==zero set seperator=/0
echo [%dwstat%] %manga% chapter %fromchapter% (%count%.%extension%)
:start
if %count% EQU %pagelimit% set /a fromchapter+=1 && goto :newchapter
if %fromchapter% GTR %tochapter% goto :complete
wget -q -c -nc --user-agent=%useragent% --directory-prefix=%manga%/%fromchapter% %subdomain%%server%%filepath%%manga%/%fromchapter%%seperator%%count%.%extension%
if not exist %manga%/%fromchapter%%seperator%%count%.%extension% set dwstat=X
set /a count+=1
if %count% GEQ 10 if %dmode%==zero set seperator=/
echo [%dwstat%] %manga% chapter %fromchapter% (%count%.%extension%)
goto :start
:newchapter
:: create folders for new chapters ::
if %fromchapter% GTR %tochapter% goto :complete
set /a count=1
cd %manga%
if not exist %fromchapter% md %fromchapter%
cd..
:resetvars
if %dmode%==zero set dmode=normal
set /a count=1
set seperator=/
goto :filecheck
:combined
:: Checks for combined filenames ::
:: This feature will be added in future releases ::
:complete
:: Show some stats and create task logs ::
if not exist grabmanga.log echo ------------------------------------------------------------->grabmanga.log
echo.
echo [] From %server% %manga% Chapter %3 until %4
echo [] Completed at %time% on %date% by %username%
echo From %server% %manga% Chapter %3 until %4>>grabmanga.log
echo Completed at %time% on %date% by %username%>>grabmanga.log
echo ------------------------------------------------------------->>grabmanga.log
echo Grabmanga v1.0b - amshar@sec.hol.es>>grabmanga.log
echo ------------------------------------------------------------->>grabmanga.log
echo.