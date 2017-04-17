rundll32.exe inetcpl.cpl,ClearMyTracksByProcess 4351
del /F /S /Q "%USERPROFILE%\*.blf" 2>NUL
del /F /S /Q "%USERPROFILE%\*.regtrans-ms" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\LocalLow\Sun\Java\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\JumpListIconsOld\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\JumpListIcons\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Local Storage\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Internet Explorer\Recovery\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Terminal Server Client\Cache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Caches\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\History\low\*" /AH 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportArchive\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WER\ReportQueue\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Local\Temp\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Roaming\Adobe\Flash Player\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Roaming\Macromedia\Flash Player\*" 2>NUL
del /F /S /Q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent\*" 2>NUL
del /F /S /Q "%USERPROFILE%\Recent\*" 2>NUL
del /F /Q "%USERPROFILE%\Documents\*.tmp" 2>NUL
del /F /Q "%USERPROFILE%\Downloads\*.tmp" 2>NUL
del /F /Q "%USERPROFILE%\Pictures\*.tmp" 2>NUL
del /F /S /Q "%WINDIR%\TEMP\*" 2>NUL
:: JOB: Remove the Office installation cache. Usually around ~1.5 GB
if exist %SystemDrive%\MSOCache rmdir /S /Q %SystemDrive%\MSOCache

:: JOB: Remove the Windows installation cache. Can be up to 1.0 GB
if exist %SystemDrive%\i386 rmdir /S /Q %SystemDrive%\i386

:: JOB: Empty all recycle bins on Windows 5.1 (XP/2k3) and 6.x (Vista and up) systems
if exist %SystemDrive%\RECYCLER rmdir /s /q %SystemDrive%\RECYCLER
if exist %SystemDrive%\$Recycle.Bin rmdir /s /q %SystemDrive%\$Recycle.Bin

:: JOB: Clear MUI cache
reg delete "HKCU\SOFTWARE\Classes\Local Settings\Muicache" /f

:: JOB: Clear queued and archived Windows Error Reporting (WER) reports
echo. >> %LOGPATH%\%LOGFILE%
if exist "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportArchive" rmdir /s /q "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportArchive"
if exist "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportQueue" rmdir /s /q "%ALLUSERSPROFILE%\Microsoft\Windows\WER\ReportQueue"

:: JOB: Clear Windows Search Temp Data
if exist "%ALLUSERSPROFILE%\Microsoft\Search\Data\Temp" rmdir /s /q "%ALLUSERSPROFILE%\Microsoft\Search\Data\Temp"
