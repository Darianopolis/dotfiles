@echo off

where /q cl
goto env_missing_%errorlevel%
:env_missing_1
echo Configuring Visual Studio environment
if "%~1" == "" goto without_args
@call "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvarsall.bat" %*
goto finished
:without_args
@call "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvarsall.bat" x64
goto finished
:env_missing_0
echo Already in Visual Studio environment
:finished
