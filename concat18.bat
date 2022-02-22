@echo off
md temp
set /p "out=Output Name: "
set /p "clips=How many clips? 1-18 "
set /a clips=%clips%



set /p "file1=Input Video 1: "
ffmpeg\bin\ffmpeg.exe -i %file1% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/1.ts
set /p "file2=Input Video 2: "
ffmpeg\bin\ffmpeg.exe -i %file2% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/2.ts
if %clips% ==2 goto 2
set /p "file3=Input Video 3: "
ffmpeg\bin\ffmpeg.exe -i %file3% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/3.ts
if %clips% ==3 goto 3
set /p "file4=Input Video 4: "
ffmpeg\bin\ffmpeg.exe -i %file4% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/4.ts
if %clips% ==4 goto 4
set /p "file5=Input Video 5: "
ffmpeg\bin\ffmpeg.exe -i %file5% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/5.ts
if %clips% ==5 goto 5
set /p "file6=Input Video 6: "
ffmpeg\bin\ffmpeg.exe -i %file6% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/6.ts
if %clips% ==6 goto 6
set /p "file7=Input Video 7: "
ffmpeg\bin\ffmpeg.exe -i %file7% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/7.ts
if %clips% ==7 goto 7
set /p "file8=Input Video 8: "
ffmpeg\bin\ffmpeg.exe -i %file8% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/8.ts
if %clips% ==8 goto 8
set /p "file9=Input Video 9: "
ffmpeg\bin\ffmpeg.exe -i %file9% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/9.ts
if %clips% ==9 goto 9
set /p "file10=Input Video 10: "
ffmpeg\bin\ffmpeg.exe -i %file10% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/10.ts
if %clips% ==10 goto 10
set /p "file11=Input Video 11: "
ffmpeg\bin\ffmpeg.exe -i %file11% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/11.ts
if %clips% ==11 goto 11
set /p "file12=Input Video 12: "
ffmpeg\bin\ffmpeg.exe -i %file12% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/12.ts
if %clips% ==12 goto 12
set /p "file13=Input Video 13: "
ffmpeg\bin\ffmpeg.exe -i %file13% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/13.ts
if %clips% ==13 goto 13
set /p "file14=Input Video 14: "
ffmpeg\bin\ffmpeg.exe -i %file14% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/14.ts
if %clips% ==14 goto 14
set /p "file15=Input Video 15: "
ffmpeg\bin\ffmpeg.exe -i %file15% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/15.ts
if %clips% ==15 goto 15
set /p "file16=Input Video 16: "
ffmpeg\bin\ffmpeg.exe -i %file16% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/16.ts
if %clips% ==16 goto 16
set /p "file17=Input Video 17: "
ffmpeg\bin\ffmpeg.exe -i %file17% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/17.ts
if %clips% ==17 goto 17
set /p "file18=Input Video 18: "
ffmpeg\bin\ffmpeg.exe -i %file18% -c copy -bsf:v h264_mp4toannexb -f mpegts temp/18.ts
if %clips% ==18 goto 18



:2
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] concat=n=2:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:3
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] concat=n=3:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:4
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] concat=n=4:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:5
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] concat=n=5:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:6
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] concat=n=6:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:7
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] concat=n=7:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:8
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] concat=n=8:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:9
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] concat=n=9:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:10
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] concat=n=10:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:11
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] concat=n=11:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:12
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -i temp/12.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] [11:v] [11:a] concat=n=12:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:13
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -i temp/12.ts -i temp/13.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] [11:v] [11:a] [12:v] [12:a] concat=n=13:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:14
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -i temp/12.ts -i temp/13.ts -i temp/14.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] [11:v] [11:a] [12:v] [12:a] [13:v] [13:a] concat=n=14:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:15
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -i temp/12.ts -i temp/13.ts -i temp/14.ts -i temp/15.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] [11:v] [11:a] [12:v] [12:a] [13:v] [13:a] [14:v] [14:a] concat=n=15:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:16
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -i temp/12.ts -i temp/13.ts -i temp/14.ts -i temp/15.ts -i temp/16.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] [11:v] [11:a] [12:v] [12:a] [13:v] [13:a] [14:v] [14:a] [15:v] [15:a] concat=n=16:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:17
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -i temp/12.ts -i temp/13.ts -i temp/14.ts -i temp/15.ts -i temp/16.ts -i temp/17.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] [11:v] [11:a] [12:v] [12:a] [13:v] [13:a] [14:v] [14:a] [15:v] [15:a] [16:v] [16:a] concat=n=17:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:18
ffmpeg\bin\ffmpeg.exe -i temp/1.ts -i temp/2.ts -i temp/3.ts -i temp/4.ts -i temp/5.ts -i temp/6.ts -i temp/7.ts -i temp/8.ts -i temp/9.ts -i temp/10.ts -i temp/11.ts -i temp/12.ts -i temp/13.ts -i temp/14.ts -i temp/15.ts -i temp/16.ts -i temp/17.ts -i temp/18.ts -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] [6:v] [6:a] [7:v] [7:a] [8:v] [8:a] [9:v] [9:a] [10:v] [10:a] [11:v] [11:a] [12:v] [12:a] [13:v] [13:a] [14:v] [14:a] [15:v] [15:a] [16:v] [16:a] [17:v] [17:a] concat=n=18:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "%out%.mkv"
goto end

:end
ffmpeg\bin\ffmpeg.exe -i "%out%.mkv" -c:v copy "%out%.mp4"
del "%out%.mkv" /q
RD /S /Q temp