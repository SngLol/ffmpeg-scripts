@echo off
:start
set /p "inputV=Input Video: "
set /p "inputA=Input Audio: "
Setlocal EnableDelayedExpansion
:check_exist
set /a nmbr=%nmbr%+1
set output=!inputV:.mp4=_%nmbr%.mp4!
if exist %output% goto check_exist_2
goto end
:check_exist_2
set /a nmbr2=%nmbr%+1
set output=!output:_%nmbr%.mp4=_%nmbr2%.mp4!
set /a nmbr=%nmbr%+1
if exist %output% goto check_exist_2
goto end
:end
ffmpeg\bin\ffmpeg.exe -i %inputV% -i %inputA% -c:v copy -c:a aac -strict experimental -map 0:v:0 -map 1:a:0 %output%