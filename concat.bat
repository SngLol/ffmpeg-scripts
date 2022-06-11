@echo off
md temp
set /p "clips=How many clips? "
set /a clips=%clips%

echo @echo off > temp/result.bat
<nul set /p ".=set /p 'out=Output Name: '" >> temp/result.bat
echo. >> temp/result.bat
FOR /L %%i IN (1, 1, %clips%) DO (
<nul set /p ".=set /p 'file%%i=Input Video %%i: '" >> temp/result.bat
echo. >> temp/result.bat
<nul set /p ".=ffmpeg\bin\ffmpeg.exe -i %%file%%i%% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/%%i.ts" >> temp/result.bat
echo. >> temp/result.bat
)
<nul set /p ".=ffmpeg\bin\ffmpeg.exe " >> temp/result.bat
FOR /L %%i IN (1, 1, %clips%) DO (
	<nul set /p ".=-i temp/%%i.ts " >> temp/result.bat
)
<nul set /p ".=-filter_complex '" >> temp/result.bat
set /a c1=%clips%-1
FOR /L %%i IN (0, 1, %c1%) DO (
	<nul set /p ".=[%%i:v] [%%i:a] " >> temp/result.bat
)
<nul set /p ".=concat=n=%clips%:v=1:a=1 [v] [a]' -map '[v]' -map '[a]' '%%out%%.mkv'" >> temp/result.bat
echo. >> temp/result.bat
<nul set /p ".=ffmpeg\bin\ffmpeg.exe -i '%%out%%.mkv' -c:v copy '%%out%%.mp4'" >> temp/result.bat
echo. >> temp/result.bat
<nul set /p ".=del '%%out%%.mkv' /q" >> temp/result.bat
echo. >> temp/result.bat
<nul set /p ".=RD /S /Q temp" >> temp/result.bat

echo. > temp/result2.bat
Setlocal EnableDelayedExpansion
FOR /F "usebackqdelims=" %%a IN (temp/result.bat) DO (
SET "line=%%a"
SET "line=!line:'="!"
echo !line! >> temp/result2.bat
)
temp/result2.bat