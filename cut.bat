@echo off
:start
cls
set /p "input=Input Video: "
set /p "start=Start Time: "
set /p "end=End Time: "
choice /c:lmh /m "Quality "
if ERRORLEVEL ==1 set crf=30
if ERRORLEVEL ==2 set crf=20
if ERRORLEVEL ==3 set crf=10
if [%start%]==[] set start=0
if [%end%]==[] goto end_blank
goto end_not_blank
:end_blank
ffmpeg\bin\ffprobe.exe -v error -select_streams v:0 -show_entries stream=duration -of default=noprint_wrappers=1:nokey=1 %input% > ffmpeg\bin\tmpFile.txt
set /p end= < ffmpeg\bin\tmpFile.txt
del ffmpeg\bin\tmpFile.txt
:end_not_blank
Setlocal EnableDelayedExpansion
set start1=!start:*:=!
if [%start%]==[%start1%] goto calc-start1
set start0=!start::%start1%=!
set start2=!start0:*:=!
if [%start0%]==[%start2%] goto calc-start2
set start0=!start::%start2%:%start1%=!
set start3=!start0:*:=!
if [%start0%]==[%start3%] goto calc-start3
:calc-start1
set /a start_sec=%start%
goto end-calc1
:calc-start2
set /a start_sec=%start1%+(%start2%*60)
goto end-calc1
:calc-start3
set /a start_sec=%start1%+(%start2%*60)+(%start3%*3600)
:end-calc1
set end1=!end:*:=!
if [%end%]==[%end1%] goto calc-end1
set end0=!end::%end1%=!
set end2=!end0:*:=!
if [%end0%]==[%end2%] goto calc-end2
set end0=!end::%end2%:%end1%=!
set end3=!end0:*:=!
if [%end0%]==[%end3%] goto calc-end3
:calc-end1
set /a end-=%start_sec%
goto end-calc2
:calc-end2
set /a tmp=%end2%*60
set /a end_sec=%end1%+(%end2%*60)
set /a end=%end_sec%-%start_sec%
goto end-calc2
:calc-end3
set /a end_sec=%end1%+(%end2%*60)+(%end3%*3600)
set /a end=%end_sec%-%start_sec%
:end-calc2
echo %start_sec%
echo %end%
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
"ffmpeg\bin\ffmpeg.exe" -ss %start% -i %input% -y -vcodec h264 -acodec aac -crf %crf% -strict -2 -to %end% -f mp4 %output%
echo Video has been successfully generated!
pause
goto start