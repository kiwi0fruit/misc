There is a interesting question in the Python community about standartizing API that exports and accepts fast functions so that computation utilizing multiple packages can happen outside of the Python interpreter. Unfortunately it's not that popular question. Sometimes it turns into [Cython/Numba/C/C++ battles](https://github.com/pydata/sparse/issues/126).

There is a discussion of this issue: [Why Julia? Will Python/Numba and Python/Cython lose to Julia?](https://github.com/numba/numba/issues/3814). And I cannot foresee any solution to this disarray except maybe [interop at the C level](https://numba.pydata.org/numba-doc/dev/user/cfunc.html#example). If there would be a PEP specification for such API then it would be even better.


### Python to Julia transpiler

In contrast to Python Julia language doesn't suffer from lack of unified API and it constantly enriches packages ecosystem that can be easily combined. Now it even has a stable release. This actually brings another possibility to fix the problem mentioned.

It would be nice to have Transpiler from subset of Python with special module named like "Juthon" to feature-complete subset of Julia (sometimes there are more than one way to do something in Julia).

And a idea looks like it should both be:

1. Standalone transpiler so that the user can write "Juthon" package and contribute it to the Julia ecosystem by transpiling.
2. Runtime decorator style transpiler (with interface like Numba has) that calls Julia (or compiled python library in the future) from Python. So that a small piece of code can be added right in the Python app written in Python.

I wonder if 2. possible though... If not then something like [enaml import](https://github.com/nucleic/enaml) can be tried that wraps transpiling and wrapping of Julia call. This can even be preferable approach.

A good example of a transipiler from Python is [Transcrypt](https://github.com/QQuick/Transcrypt/issues/619) that is a valid Python prior transpiling. But to achieve 1. this should be more like Julia in Python syntax (via IDE friendly mapping and juthon module with well-documented stubs) than attempt to implement Python's standard library.

[a bit of previous discussion](https://github.com/JuliaLang/Juleps/issues/55).