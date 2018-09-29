set "script_dir=%~dp0"
cd /d "%script_dir%"

pandoc __socionics_framework.docx --to json | python filter.py markdown | pandoc --from json -o __socionics_framework.md
