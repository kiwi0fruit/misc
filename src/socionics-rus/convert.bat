set "script_dir=%~dp0"
cd /d "%script_dir%"

pandoc socionics_framework.odt --to gfm socionics_framework2.md
