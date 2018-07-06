# Markdown+HTML as PDF, MS Word and others killer

There's an idee fixe that pops up at me once in a while: I clearly see how Markdown+HTML combo can replace almost any other text centered media containers.


## The main idea is to:

* write any Markdown flavour you like,
* export to .md or .html least common denominator (like plain html) with required plugins specified,
* render that exported file on a server that sanitizes html and loads required plugins.


## Details

Server rendering is used just like nbviewer.jupyter.org can [render notebooks](https://nbviewer.jupyter.org/github/kiwi0fruit/pandoctools/blob/master/examples/doc.ipynb) on demand. There should be created a FOSS server app that can be installed on any server and serve rendering exported documents. So that the user can upload the exported document anywhere he likes and simply share the link to the server (just like to nbviewer.jupyter.org with appendix).

Using sanitizing and plugins would allow trustworthy document sharing. Plugins can be anything you are able to write as a JavaScript and othe server app (so security issues are handled by plugins).

Export to export format can be added to Markdown editors like Atom and VS Code - together with server app set up for consistent preview experience.

Server renderer _can even show small ads_ from trusted providers.

The server renders files to something like Gitbook. Actually Gitbook is a very close to this idea: it supports plugins and it's legacy version is FOSS. Actually this not very sane idea of PDF and MS Word killer yet again visited me after I set up one unfairly abandoned article of mine as [Gitbook static site](https://kiwi0fruit.github.io/ultimate-question/). Looks nice and neat, can even adjust font size (manually) that is useful as mobile browsers are very inconsistent in this regard - I'm still to find/implement a way to set font size properly without manual adjusting (together with (1) expanding page size x2 with empty space to allow zoom out and quick scroll on mobile and (2) fixing scroll bugs: address bar no auto hide on mobile and broken PDF print).

In addition to least common denominator format there can be specified some Markdown dialects that can also be rendered on the server - this would allow even better text/representation separation.


## Afterword

I guess some very similar propriate (and even FOSS) tools exist that do something similar (to some extent) to the idea proposed above.

It would be nice to know about them.

![Pinky and the Brain](http://cdn.playbuzz.com/cdn//814660cb-6b6b-4a7c-834b-eec0abfde9a2/1b62a687-a561-4fc9-b45d-0739f88f9b80.jpg)


## UPD

It's not actually about writing Markdown. It's about how to share it's html output securely (without worrying about malicious JavaScript) and conveniently. (And view html is better than PDF on both Mobile and desktop - for different reasons). And the proposed solution seems better to me than modern ebook formats with js.

Sharing documents directly is more convenient than hosting them. So the Jupyter on demand rendering on server (by link or upload) is a good thing. But design lacks and you should write a notebook instead of normal Markdown. But on Gitbook you have a nice design, plugins, maybe even security and normal Markdown but need to host a whole repo. Moreover: it's better to write Markdown in offline editor like Atom/VS Code ([Pandoctools](https://github.com/kiwi0fruit/pandoctools) can already export to ipynb). So it would be nice to have best of all: style, plugins, security and design from Gitbook, render single file on demand online like Jupyter, edit in Atom offline.

If to implement it all together as a ready to use solution - that would be a killer.

* nbviewer is almost ideal at server side actually: https://github.com/jupyter/nbviewer/issues/778
* pandoctools are almost ideal for writing in Atom and exporting to ipynb: https://github.com/kiwi0fruit/pandoctools/issues/14

But still lot of work to do.

* https://help.plot.ly/json-chart-schema/ can be used for interactive graphics with plot.ly plugin.


## [Discuss on GitHub](https://github.com/kiwi0fruit/misc/issues/1)
