@echo off
setlocal enabledelayedexpansion

REM Create the game_logs directory if it doesn't exist
if not exist "game_logs" mkdir "game_logs"

REM Start the game log processor in a new window
start "Game Log Processor 10 Player 5v5 Server" cmd /k python game_log_processor10player5v5.py "game_events_10player5v5.log" "game_logs"

:server_loop
set "game_start_time=%date:~10,4%-%date:~4,2%-%date:~7,2%T%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "game_start_time=!game_start_time: =0!"

echo Starting Dedcon server for 8 player server...
Dedcon10p.exe 5v5config.txt 

echo Server closed. Processing game logs...

echo Done processing. Restarting server in 60 seconds...
timeout /t 60

goto server_loop