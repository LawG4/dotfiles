@echo off
echo Installing dot files pogg

:: Check if the nushell is installed 
where /q nu 
if ERRORLEVEL 1 (
    echo Nushell is not yet installed
    goto nushell-install 
) else (
    echo Nushell is already installed
    goto post-nushell-install 
)


:: Nushell installation label 
:nushell-install 
winget install nushell
where /q nu 
if ERRORLEVEL 1 (
    echo Failed to install nushell
    pause
    exit -1
) else (
    echo Nushell installed successfully
)

:: After nushell is installed, run the nuinstall script 
:post-nushell-install

:: Finally just pause to make sure 
pause