@echo off
:start
set /p "input=Input Video: "
Setlocal EnableDelayedExpansion

:check_exist
set /a nmbr=%nmbr%+1
if %nmbr%==1 goto 1
set output=!input:.mkv=_%nmbr%.mp4!
if exist %output% goto check_exist
goto run

:1
set output=!input:.mkv=.mp4!
if exist %output% goto check_exist

:run
ffmpeg\bin\ffmpeg.exe -i %input% -c:v copy %output%
goto end

:end
echo Video has successfully been created!
pause >nul