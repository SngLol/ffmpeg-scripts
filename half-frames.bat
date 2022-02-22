@echo off
set /p "input=Input Video: "
set /p "fps=Input Video Framerate: "
set /a OutFPS=%fps%/2
choice /c:123 /m "1: Odd | 2: Even | 3: Both "
if ERRORLEVEL ==1 set first=1
if ERRORLEVEL ==2 set first=2
if ERRORLEVEL ==3 set first=3
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
set nmbr=0
set /a nmbr2=%nmbr%+1
set output=!input:.mp4=_%nmbr2%.mp4!
if exist %output% goto check_exist
goto nocheck
:check_exist
set /a nmbr=%nmbr2%
set /a nmbr2=%nmbr%+1
set output=!output:%nmbr%.mp4=%nmbr2%.mp4!
if exist %output% goto check_exist
:nocheck

md halving
md halving\frames
ffmpeg\bin\ffmpeg.exe -i %input% -b:a 192K -vn halving/audio.mp3

if %first% == 2 goto even
:odd
ffmpeg\bin\ffmpeg.exe -i %input% -vf select="mod(n-1\,2)" -vsync vfr -f image2 halving/frames/img_%%06d.tif
ffmpeg\bin\ffmpeg.exe -r %OutFPS% -f image2 -i halving/frames/img_%%06d.tif -crf %crf% -vf format=yuv420p halving/half1.mp4
ffmpeg\bin\ffmpeg.exe -i halving/half1.mp4 -i halving/audio.mp3 -c:v copy -c:a copy %output%

RD /S /Q halving\frames
md halving\frames

if %first% == 1 goto end
set /a nmbr=%nmbr2%
set /a nmbr2=%nmbr%+1
set output=!output:%nmbr%.mp4=%nmbr2%.mp4!
:even
ffmpeg\bin\ffmpeg.exe -i %input% -vf select="not(mod(n-1\,2))" -vsync vfr -f image2 halving/frames/img_%%06d.tif
ffmpeg\bin\ffmpeg.exe -r %OutFPS% -f image2 -i halving/frames/img_%%06d.tif -crf %crf% -vf format=yuv420p halving/half2.mp4
ffmpeg\bin\ffmpeg.exe -i halving/half2.mp4 -i halving/audio.mp3 -c:v copy -c:a copy %output%

:end
RD /S /Q halving