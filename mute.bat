@echo off
:start
set /p "input=Input Video: "
call :setfile %input%
goto eosf
:setfile
rem None of the following are surrounded by quotes
set file=%~f1
set filepath=%~dp1
set filename=%~nx1
:eosf
Setlocal EnableDelayedExpansion
set output=!input:.mp4=_1.mp4!
ffmpeg\bin\ffmpeg.exe -i %input% -c:v copy -filter:a "volume=0" %output%
del %input%
ren %output% "%filename%"
goto end
:end