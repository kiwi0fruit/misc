@echo off
set pkgs=%~1
set thisdir=%~dp0
set thisdir=%thisdir:~0,-1%

cd /d %USERPROFILE%
rmdir pip_resolve /s /q
cmd "/c conda list > conda_list.txt"
pip download -d pip_resolve %pkgs%
cd pip_resolve
dir /b /a-d > ..\pip_list.txt
cd ..
@powershell write-host -foregroundcolor White "List of pip-conda differences:"
python "%thisdir%\pip_resolve.py"

pause
