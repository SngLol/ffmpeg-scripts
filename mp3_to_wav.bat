@echo off
:start
set /p "input=Input Audio: "
Setlocal EnableDelayedExpansion
set output=!input:.mp3=.wav!
if exist %output% goto rename
goto run
:rename
set output=!output:.wav=_0.wav!
:check_exist
set /a nmbr=%nmbr%+1
set /a nmbr0=%nmbr%-1
set output=!output:_%nmbr0%.wav=_%nmbr%.wav!
if exist %output% goto check_exist
:run
ffmpeg\bin\ffmpeg.exe -i %input% -acodec pcm_u8 %output%
goto end
:end