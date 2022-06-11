@echo off
md imgs
:mp4
set /p "input=Input Video: "
set /p "fps=Framerate: "
ffmpeg\bin\ffmpeg.exe -i %input% -r %fps% imgs\%%04d.png
pause
cls
:end
