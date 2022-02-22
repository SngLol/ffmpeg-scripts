@echo off
:start
set /p "input=Input Video: "
Setlocal EnableDelayedExpansion
:check_exist
set /a nmbr=%nmbr%+1
set output=!input:.mp4=_%nmbr%.mkv!
if exist %output% goto check_exist
ffmpeg\bin\ffmpeg.exe -i %input% -c:v copy -c:a copy %output%
goto end
:end
echo Video has successfully been created!
pause >nul