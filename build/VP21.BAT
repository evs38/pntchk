@echo off
rem ---------------------------------------------------------------------------
rem  PNTCHK -- Professional pointsegment checker
rem  Build script for Virtual Pascal 2.1
rem
rem  Usage:
rem      VP21 W32 [BW]     Win32 programs into ..\bin\vpw32
rem      VP21 OS2 [BW]     OS/2  programs into ..\bin\vpos2
rem      VP21 LNX [BW]     Linux programs into ..\bin\vplnx
rem
rem  W32 and OS2 are the targets that work.  VP's Linux target is marked
rem  experimental by VP itself and its RTL does not carry what PNTCHK needs:
rem  there is no Crt unit at all, and its linux unit has no utimebuf.  The
rem  branch is kept so the compiler says so itself rather than this file.
rem
rem  OS2 needs the OS/2 RTL built first -- the distribution ships only four
rem  precompiled units in Units.os2.  Bldrtl.bat in Source\Rtl builds it, but
rem  on Windows it detects the host by running the OS/2 vpc.exe and guesses
rem  wrong; force the Win32 branch and it works.  Crt has to be built by hand
rem  afterwards, Bldrtl leaves it out.
rem
rem  BW builds the CrtFake variant instead: the plain one writes through crt,
rem  straight to the console, and its output does not survive a pipe.
rem
rem  Run it from this directory.  Set VPBase in the environment, or edit the
rem  line below, if Virtual Pascal does not live in C:\VP21.  The Win32
rem  compiler is used for every target -- VP cross-compiles.
rem
rem  Virtual Pascal ships no make of its own; its own RTL is built by scripts
rem  like this one.  See ..\Makefile for the Free Pascal road and BP7.MAK for
rem  Borland Pascal.
rem ---------------------------------------------------------------------------

if not "%VPBase%"=="" goto havebase
set VPBase=C:\VP21
:havebase
if not exist %VPBase%\Bin.w32\Vpc.exe goto nobase

if "%1"=="W32" goto w32
if "%1"=="w32" goto w32
if "%1"=="OS2" goto os2
if "%1"=="os2" goto os2
if "%1"=="LNX" goto lnx
if "%1"=="lnx" goto lnx
goto usage

:w32
set VPTGT=-CW
set VPSFX=w32
goto target

:os2
set VPTGT=-CO
set VPSFX=os2
goto target

:lnx
set VPTGT=-CL
set VPSFX=lnx
goto target

:target
set VPDEF=
set VPBIN=..\bin\vp%VPSFX%
set VPUNI=..\units\vp%VPSFX%
if "%2"=="BW" goto bw
if "%2"=="bw" goto bw
goto build

:bw
set VPDEF=-DBW
set VPBIN=..\bin\vp%VPSFX%bw
set VPUNI=..\units\vp%VPSFX%bw

:build
if not exist ..\bin md ..\bin
if not exist ..\units md ..\units
if not exist %VPBIN% md %VPBIN%
if not exist %VPUNI% md %VPUNI%
set VPOPT=-B %VPDEF% %VPTGT% -U..\src;%VPBase%\Units.%VPSFX%
set VPOPT=%VPOPT% -L%VPBase%\Lib.%VPSFX% -E%VPBIN% -O%VPUNI%

%VPBase%\Bin.w32\Vpc.exe ..\src\pntchk.pas   %VPOPT%
if errorlevel 1 goto failed
%VPBase%\Bin.w32\Vpc.exe ..\src\execbad.pas  %VPOPT%
if errorlevel 1 goto failed
%VPBase%\Bin.w32\Vpc.exe ..\src\execgood.pas %VPOPT%
if errorlevel 1 goto failed
%VPBase%\Bin.w32\Vpc.exe ..\src\pnt_reg.pas  %VPOPT%
if errorlevel 1 goto failed
echo.
echo   Done: %VPBIN%
goto end

:failed
echo.
echo ! Compilation failed.
goto end

:nobase
echo.
echo ! Vpc.exe not found under %VPBase%.
echo   Set VPBase to the Virtual Pascal directory and run this again.
goto end

:usage
echo.
echo   PNTCHK build script for Virtual Pascal 2.1
echo.
echo     VP21 W32 ^| OS2 ^| LNX  [BW]
echo.
echo   BW builds the CrtFake variant, whose output survives a pipe.

:end
set VPTGT=
set VPSFX=
set VPDEF=
set VPBIN=
set VPUNI=
set VPOPT=
