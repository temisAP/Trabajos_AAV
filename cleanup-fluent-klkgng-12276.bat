echo off
set LOCALHOST=%COMPUTERNAME%
set KILL_CMD="E:\Software\ANSYSI~1\ANSYSS~1\v211\fluent/ntbin/win64/winkill.exe"

"E:\Software\ANSYSI~1\ANSYSS~1\v211\fluent\ntbin\win64\tell.exe" klkgng 52289 CLEANUP_EXITING
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 18052) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 16848) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 17496) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 11996) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 12276) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 17628)
del "C:\Users\diego\Documents\MEng Space Systems (Local)\2. AAV\Trabajos_AAV\cleanup-fluent-klkgng-12276.bat"
