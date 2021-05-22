echo off
set LOCALHOST=%COMPUTERNAME%
set KILL_CMD="E:\Software\ANSYSI~1\ANSYSS~1\v211\fluent/ntbin/win64/winkill.exe"

"E:\Software\ANSYSI~1\ANSYSS~1\v211\fluent\ntbin\win64\tell.exe" klkgng 59359 CLEANUP_EXITING
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 19944) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 16632) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 21428) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 9532) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 13912) 
if /i "%LOCALHOST%"=="klkgng" (%KILL_CMD% 3232)
del "C:\Users\diego\Documents\MEng Space Systems (Local)\2. AAV\Trabajos_AAV\cleanup-fluent-klkgng-13912.bat"
