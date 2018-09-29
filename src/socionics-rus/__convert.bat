set "script_dir=%~dp0"
cd /d "%script_dir%"

pandoc __socionics_framework.docx --to json | ^
python __filter.py markdown | ^
pandoc --from json --to markdown | ^
pandoc --from markdown --to gfm -o __socionics_framework.md
