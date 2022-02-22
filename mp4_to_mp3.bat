@echo off
:start
set /p "input=Input Video: "
Setlocal EnableDelayedExpansion
set output=!input:.mp4=.mp3!
ffmpeg\bin\ffmpeg.exe -i %input% -b:a 192K -vn %output%
goto end
:end