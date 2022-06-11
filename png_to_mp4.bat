@echo off
:mp4
set /p "fps=Framerate: "
set /p "imgs=Images Location: "
ffmpeg\bin\ffmpeg.exe -r %fps% -f image2 -i %imgs%\%%04d.png -vcodec libx264 -crf 10  -pix_fmt yuv420p test.mp4

:mp3
set /p "mp3=audio: "
ffmpeg\bin\ffmpeg.exe -i test.mp4 -i %mp3% -c:v copy -c:a copy test2.mp4
goto end
:end
