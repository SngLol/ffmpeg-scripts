@echo off
set /p "input=Input Video: "
choice /c:lmhtx /m "Quality "
if ERRORLEVEL ==1 set crf=30
if ERRORLEVEL ==2 set crf=20
if ERRORLEVEL ==3 set crf=10
if ERRORLEVEL ==4 set crf=40
if ERRORLEVEL ==5 goto manual
goto auto
:manual
set /p "crf=CRF: "
:auto
Setlocal EnableDelayedExpansion

:check_exist
set /a nmbr=%nmbr%+1
if %nmbr%==1 goto 1
set output=!input:.mp4=_%nmbr%.mp4!
if exist %output% goto check_exist
goto run

:1
set output=!input:.mp4=.mp4!
if exist %output% goto check_exist

:run
ffmpeg\bin\ffmpeg.exe -i %input% -vf "crop=in_h*9/16:in_h" -crf %crf% %output%