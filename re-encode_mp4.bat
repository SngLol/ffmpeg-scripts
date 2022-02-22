@echo off

:start
cls
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
set /a nmbr=0
set /a nmbr2=%nmbr%+1
set output=!input:.mp4=_%nmbr2%.mp4!
if exist %output% goto check_exist_2
goto end

:check_exist_2
set /a nmbr=%nmbr2%
set /a nmbr2=%nmbr%+1
set output=!output:%nmbr%.mp4=%nmbr2%.mp4!
if exist %output% goto check_exist_2

:end
ffmpeg\bin\ffprobe.exe -v error -select_streams v:0 -show_entries stream=duration -of default=noprint_wrappers=1:nokey=1 %input% > ffmpeg\bin\tmpFile.txt
set /p end= < ffmpeg\bin\tmpFile.txt
del ffmpeg\bin\tmpFile.txt

"ffmpeg\bin\ffmpeg.exe" -i %input% -y -vcodec h264 -acodec aac -crf %crf% -strict -2 -f mp4 %output%
pause
goto start