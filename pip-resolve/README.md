# Install

Simply copy to `Scripts` folder of the env. Then activate env and:

```
call conda remove --force setuptools
call conda install --force --copy setuptools
pip install --ignore-installed setuptools
```

For some reason conda's `setuptools` give more errors during check.


# Usage

```
pip-resolve "module1 module2"
```

Suppose pip-resolve found `module3` and `module4` version missmatch. Then:

```
call conda remove --force module3 module4
call conda install --force --copy module3 module4
pip install module1 module2
```

**Important**: if there were errors during pip-resolve work - check all modules separately. But still this is bad - with errors we cannot predict what pip would install!
