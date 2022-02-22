@echo off
set /p "input=Input Video: "
echo 1: 640x360
echo 2: 854x480
echo 3: 1280x720
echo 4: 1920x1080
echo 5: 2560x1440
choice /c:12345 /m ""
set E=%ERRORLEVEL%
echo %E%
if %E% ==1 (
set W=640
set H=360
)
if %E% ==2 (
set W=854
set H=480
)
if %E% ==3 (
set W=1280
set H=720
)
if %E% ==4 (
set W=1920
set H=1080
)
if %E% ==5 (
set W=2560
set H=1440
)
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
set /a nmbr=%nmbr%+1
if %nmbr%==1 goto 1
set output=!input:.mp4=_%nmbr%.mp4!
if exist %output% goto check_exist
goto run

:1
set output=!input:.mp4=.mp4!
if exist %output% goto check_exist

:run
ffmpeg\bin\ffmpeg.exe -i %input% -vf "scale=(iw*sar)*min(%W%/(iw*sar)\,%H%/ih):ih*min(%W%/(iw*sar)\,%H%/ih), pad=%W%:%H%:(%W%-iw*min(%W%/iw\,%H%/ih))/2:(%H%-ih*min(%W%/iw\,%H%/ih))/2" -c:v libx265 -x265-params crf=%crf% %output%