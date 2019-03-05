# PEP for Python-free interop at C level vs. Python to Julia transpiler

There is a interesting question in the Python community about standartizing API that exports and accepts fast functions so that computation utilizing multiple packages can happen outside of the Python interpreter. Unfortunately it's not that popular question. Sometimes it turns into [Cython/Numba/C/C++ battles](https://github.com/pydata/sparse/issues/126).

There is a discussion of this issue: [Why Julia? Will Python/Numba and Python/Cython lose to Julia?](https://github.com/numba/numba/issues/3814). And I cannot foresee any solution to this disarray except maybe [interop at the C level](https://numba.pydata.org/numba-doc/dev/user/cfunc.html#example). If there would be a PEP specification for such API then it would be even better. But I guess the solution to this should be as pythonic as possible (mentioned Numba tools to create C functions in a pythonic way are really good).

But I'm not sure how scalable is interop at the C level approach (it's merely my lack of knowledge). Can there be compositions of compositions?


### Python to Julia transpiler

In contrast to Python Julia language doesn't suffer from lack of unified API and it constantly enriches packages ecosystem that can be easily combined. Now it even has a stable release. This actually brings another possibility to fix the problem mentioned.

It would be nice to have Transpiler from subset of Python with special module named like "Juthon" to feature-complete subset of Julia (sometimes there are more than one way to do something in Julia).

And a idea looks like it should both be:

1. Standalone transpiler so that the user can write "Juthon" package and contribute it to the Julia ecosystem by transpiling.
2. Runtime decorator style transpiler (with interface like Numba has) that calls Julia (or compiled python library in the future) from Python. So that a small piece of code can be added right in the Python app written in Python.

I wonder if 2. possible though... If not then something like [enaml import](https://github.com/nucleic/enaml) can be tried that wraps transpiling and wrapping of Julia call. This can even be preferable approach.

A good example of a transipiler from Python is [Transcrypt](https://github.com/QQuick/Transcrypt/issues/619) that is a valid Python prior transpiling. But to achieve 1. this should be more like Julia in Python syntax than attempt to implement Python's standard library.

I guess it should be done via IDE friendly mapping and juthon module with source to source mapping for Julia autocompletion and lynting passthrough as it seems that automatic creating of typed and documented python stubs would require more work than source mapping; for example Julia to python transpiling for other modules inspection. That would mean lack of type inspection inside IDE - errors should be displayed by jit transpiler and later julia compiler.

[a bit of previous discussion](https://github.com/JuliaLang/Juleps/issues/55).

UPD: Discussions:

* [reddit.com/r/Python](https://www.reddit.com/r/Python/comments/axj0wz/pep_for_pythonfree_interop_at_c_level_vs_python)
* [discourse.julialang.org](https://discourse.julialang.org/t/python-to-julia-transpiler/21473/8)

The most probable outcome is that there won't be neither need for py2ju transpiler nor the transpiler itself. But compiling Julia to Python modules would appear some day (nothing like that now). As well as easy installing Julia for Python (there are still some problems there).

There is an example of using low level C interfaces in Python: https://stackoverflow.com/a/51157909/9071377 It's pain to see it. But hopefully with Numba development dealing with such interfases can become more elegant.
