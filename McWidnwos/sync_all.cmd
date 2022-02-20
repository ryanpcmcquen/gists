curl https://gist.githubusercontent.com/ryanpcmcquen/1ccef39e0bb4c75be0d7d834b25bd6bb/raw/sync_all.cmd -o "%UserProfile%\bin\sync_all.cmd"

for /d %%d in (%UserProfile%\code\*) do "C:\Program Files\Sublime Merge\Git\cmd\git.exe" -C %%~fd pull --all

where fl_sync.cmd && call fl_sync.cmd

where reaper_sync.cmd && call reaper_sync.cmd

curl https://gist.githubusercontent.com/ryanpcmcquen/1ccef39e0bb4c75be0d7d834b25bd6bb/raw/win_config.bat -o "%UserProfile%\win_config.bat" && "%UserProfile%\win_config.bat"
