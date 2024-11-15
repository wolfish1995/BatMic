@echo off
title RTSP Audio Streamer

REM Define VLC path (modify this according to your VLC installation path)
set VLC_PATH="C:\Program Files\VideoLAN\VLC\vlc.exe"

REM Check if VLC exists at the specified path
if not exist %VLC_PATH% (
    echo VLC Media Player is not found at %VLC_PATH%.
    echo Please install VLC or modify VLC_PATH variable in the script.
    pause
    exit /b
)

REM Open necessary ports for RTSP streaming (adjust if necessary)
echo Opening port 8554 for RTSP...
netsh advfirewall firewall add rule name="Open Port 8554 for RTSP" protocol=TCP dir=in localport=8554 action=allow

REM Get local IP address of the host
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr IPv4') do set IP_ADDR=%%i

REM Define RTSP stream URL
set RTSP_PORT=8554
set RTSP_PATH=/stream
set RTSP_URL=rtsp://%IP_ADDR%:%RTSP_PORT%%RTSP_PATH%

REM Start VLC to stream from default audio input (PCM format)
start "RTSP Stream" %VLC_PATH% -I dummy dshow:// --sout=#transcode{acodec=s16l}:rtp{sdp=rtsp://:%RTSP_PORT%%RTSP_PATH%} --no-sout-all --sout-keep

REM Output the RTSP URL
echo.
echo RTSP Audio Stream is now running.
echo Connect to:
echo %RTSP_URL%
echo.

REM Prompt user to choose action (using 'choice' command)
:choose_action
choice /C YN /M "Do you want to keep streaming and close VLC (Y) or stop streaming and close VLC (N)?"

REM Handle user choice
if errorlevel 2 (
    echo Stopping stream and closing VLC window...
    taskkill /im vlc.exe /f >nul 2>&1
) else (
    echo Keeping stream and closing VLC window...
)

REM Close opened port 8554
echo Closing port 8554...
netsh advfirewall firewall delete rule name="Open Port 8554 for RTSP"

REM Done
echo Stream stopped.
