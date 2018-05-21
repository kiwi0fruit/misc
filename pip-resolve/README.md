# Install

Simply copy to `Scripts` folder of the env. Then activate env and:

```
call conda remove --force setuptools
call conda install --force --copy setuptools
pip install --ignore-installed setuptools
```

# Usage

`pip-resolve "module1 module2"`
