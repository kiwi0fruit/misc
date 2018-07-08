# Jupyter notebooks as PDF, MS Word and others killer

More strictly speaking:

## Idea to enhance nbviewer to make ipynb killer of pdf, docx and other formats

There's an idee fixe that pops up at me once in a while: I clearly see how jupyter notebooks (based on Markdown + HTML) can replace almost any other text centered media containers.


## The main idea is to:

* write any Markdown flavour you like in any editor you like (or write .ipynb directly),
* export to .ipynb with required javascript plugins and css themes specified in json,
* render that exported file on a server that sanitizes notebook (html/js) and loads required js plugins and css themes (so the one who reads the notebook doesn't worry about malicious javascript).


## Details

nbviewer.jupyter.org can [render notebooks](https://nbviewer.jupyter.org/github/jrjohansson/qutip-lectures/blob/master/Lecture-1-Jaynes-Cumming-model.ipynb) to static html on demand on server side but at the same time the user himself hosts files anywhere he likes but simply shares the link to the rendered html on nbviewer.jupyter.org.

This scheme can give security and anti-malicious protection together with ease of documents sharing. 
nbviewer is a FOSS server that can be installed on any server - really nice! Server renderer can even show small ads from trusted providers (if needed).

I suggest add sanitizing, javascript plugins and css themes to the nbviewer. This would allow trustworthy document sharing (so the security issues are handled by plugins and white list of plugins allowed on the nbviewer server).

Export to the ipynb can be added to Markdown editors like Atom and VS Code - together with a nbviewer server as an Atom package - for consistent preview experience when writing documents ([pandoctools](https://github.com/kiwi0fruit/pandoctools) can already export to ipynb so it's attainable for any Markdown editor).

nbviewer is nice but lacks not only plugins for interactive js but also css customuization (or may be I don't know about them?). It would be good to have a html/css theme like in Gitbook that looks good both on mobile and desktop. Gitbook is a very close to proposed idea: it supports plugins and it's legacy version is FOSS. This not very sane idea of PDF and MS Word killer yet again visited me after I set up one unfairly abandoned article of mine as [Gitbook static site](https://kiwi0fruit.github.io/ultimate-question/). Looks nice and neat, can even adjust font size (manually) that is useful as mobile browsers are very inconsistent in this regard - I'm still to find/implement a way to set font size properly without manual adjusting. It also would be nice to have page expanded with empty space to allow zoom out like in [this blog](http://kiwi0fruit.tumblr.com/post/143531997330/special-test-post-this-is-a-special-post-that) for quick scroll on mobile. And to fix scroll bugs in Gitbook: address bar doesn't auto hide on mobile and PDF print is broken.

Viewing html in the browser can be a much better experience than any pdf or docx. PDF fonts are ugly on desktop, PDF documents do not adjust layout for small mobile screens (rewrap breaks layout...). And I think using browser directly is more convenient than epub. Using ipynb as a sharing format allows good content/representation separation. And it's a popular format.

It would be nice to have best of Jupyter/Atom/Gitbook: style, design and plugins from Gitbook, server side render like in nbviewer, edit in Atom offline (plus protection from malicious javascript).


### UPD

I chose ipynb as an a output format because it has decent python support, popular and can serve two purposes:

* be viewed by nbviewer online: here it can use only js plugins,
* be run in Jupyter: here it can also use python back end interactively.

As about sticking to some Markdown spec: I think it's useless as there are infinite number of Markdown flavours if we are to use Pandoc filters. And it's really nice to use them! So Jupyter notebook with it's Markdown flavour is no worse than any other if we treat it as output format for pandoc/pandoctools.


## Afterword

I guess some very similar propriate and even FOSS tools exist that do something similar to the idea proposed above (to some extent). It would be nice to know about them.

Some hooks to start with:

* [nbviewer](https://github.com/jupyter/nbviewer/issues/778) is almost ideal at server side actually,
* [markdown preview plus](https://github.com/atom-community/markdown-preview-plus) and [pandoctools](https://github.com/kiwi0fruit/pandoctools/issues/14) are good for writing in Atom and exporting to ipynb (but still not ideal).
* [plot.ly json chart schema](https://help.plot.ly/json-chart-schema/) can be used for interactive graphics with plot.ly js plugin.

But is's still a lot of work to do.

![Pinky and the Brain](http://cdn.playbuzz.com/cdn//814660cb-6b6b-4a7c-834b-eec0abfde9a2/1b62a687-a561-4fc9-b45d-0739f88f9b80.jpg)


## [Discuss on GitHub](https://github.com/kiwi0fruit/misc/issues/1)
