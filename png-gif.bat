@echo off
set /p "loc=PNG Location: "
set /p "fps=Framerate (1-50): "
set /p "q=Quality (1-100): "
gifski\gifski.exe -o gifski\clip.gif %loc%\*.png --fps %fps% --quality %q%