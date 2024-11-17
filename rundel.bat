start powershell.exe -noexit -file C:\IT\IGM\joinscript.ps1
timeout /t 5
powershell Clear-RecycleBin -Force
start /b "" cmd /c del "%~f0"
cd c:\IT\
start /b "" cmd /c rmdir IGM &exit
exit /b