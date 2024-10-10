@echo off
setlocal enabledelayedexpansion
for %%i in (%1) do (
    start powershell -NoExit -Command "wsl.exe ~/open_nvim.sh \"%%~nxi\""
)
endlocal


