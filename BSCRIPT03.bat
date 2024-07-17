@echo off



:menu
echo =============================================================================
echo Select one of the Fundamental Windows Utility:
echo =============================================================================
echo 1. IpConfig
echo 2. TaskList
echo 3. TaskKill
echo 4. CheckDisk
echo 5. Format
echo 6. Defrag
echo 7. Find
echo 8. Atrribute
echo 9. Exit
echo =============================================================================
choice /c 123456789 /m "Choose an Option:"

if errorlevel 9 goto exit
if errorlevel 8 goto attrib
if errorlevel 7 goto find
if errorlevel 6 goto defrag
if errorlevel 5 goto format
if errorlevel 4 goto chkdsk
if errorlevel 3 goto taskKill
if errorlevel 2 goto tasklist
if errorlevel 1 goto ipconfig

:ipconfig
echo =============================================================================
echo Opening IpConfig...
echo =============================================================================
ipconfig
echo =============================================================================
echo                               [Successful] 
goto menu


:tasklist
echo =============================================================================
echo Viewing Running Tasks...
echo =============================================================================
tasklist
echo =============================================================================
echo                               [Successful] 
goto menu


:taskkill
tasklist
echo =============================================================================
echo Viewing Running Tasks First...
echo =============================================================================
set /p TaskToKill="Enter the PID of the task to kill: "
echo =============================================================================
taskkill /PID %TaskToKill%
goto menu


:chkdsk
echo =============================================================================
set /p drive="Enter the Drive to check (Example: "C:"/"D:": )"
echo =============================================================================
if not exist %drive%\ (
    echo Drive %drive% does not exist.
    goto chkdsk
)
echo Running Checkdisk on %drive%...
chkdsk %drive%
goto menu


:format
echo =============================================================================
echo WARNING THIS INSTANT DELETES THE FILE PROCEED AT YOUR OWN RISK
echo =============================================================================
set /p drive="Enter the Drive to format (Example: "C:"/"D:": )"
if not exist %drive%\ (
    echo Drive %drive% does not exist.
    goto format
)
echo Deleting all files in Drive %drive%...
format %drive%
goto menu


:defrag
echo ============================================================================= 
set /p drive="Enter the Drive to defrag (Example: "C:"/"D:": )"
echo =============================================================================
if not exist %drive%\ (
    echo Drive %drive% does not exist.
    goto defrag
)
echo Running Defragmentation on %drive%
defrag %drive%
goto menu


:find
echo =============================================================================
set /p filename=Enter file name to search: 
find "%filename%" .
if %errorlevel% neq 0 (
echo File not found
) else (
echo File found
)
goto menu


:attrib
echo =============================================================================
set /p filename=Enter file name to change attributes:
set /p attributes=Enter new attributes (+R, +H, +S, -R, -H, -S):
attrib %attributes% %filename%
if %errorlevel% neq 0 (
echo Error: Failed to change attributes
) else (
echo .
)
goto menu


:exit
echo GoodBye!




