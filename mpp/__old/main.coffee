url = require 'url'
fs = require 'fs-plus'
path = require 'path'
{CompositeDisposable} = require 'atom'

MarkdownPreviewView = null
renderer = null
mathjaxHelper = null

isMarkdownPreviewView = (object) ->
  MarkdownPreviewView ?= require './markdown-preview-view'
  object instanceof MarkdownPreviewView

module.exports =
  config:
    mainFontFamily:
      type: 'string'
      default: "'Times New Roman', 'STIX Two Text', 'Segoe UI Symbol', 'Noto Sans Symbols', 'Noto Sans Symbols2', 'Noto Serif CJK TC ExtraLight', serif"
      title: 'Main font family'
      order: 0
    mainFontSize:
      type: 'string'
      default: '17px'
      title: 'Main font size'
      order: 1
    monoFontFamilyExample:
      type: 'string'
      default: "Consolas, 'TeX Gyre Schola Math monospacified for Consolas', 'Symbola monospacified for Consolas', 'STIX Two Text', 'Segoe UI Symbol', 'Noto Sans Symbols', 'Noto Sans Symbols2', 'Microsoft JhengHei', 'Noto Sans CJK TC Thin', monospace"
      title: 'Monospace font family Example'
      description: 'It is an example only. See other style settings in `styles/markdown-preview-default.less` (press *View Code* button above).'
      order: 180
    monoFontFamily:
      type: 'string'
      default: ''
      title: 'Monospace font family'
      description: 'Default is Atom editor font family'
      order: 181
    monoFontSize:
      type: 'string'
      default: ''
      title: 'Monospace font size'
      description: 'Default is Atom Editor font size'
      order: 182
    mjxUndefinedFamily:
      type: 'string'
      default: "'Times New Roman', 'STIX Two Text', 'Segoe UI Symbol', 'Noto Sans Symbols', 'Noto Sans Symbols2', 'Noto Serif CJK TC ExtraLight', serif"
      title: 'MathJax undefinedFamily:'
      order: 183
    mjxNumbersFamily:
      type: 'string'
      default: "'STIX Two Text', MathJax_Main, serif"
      title: 'MathJax numbers font family:'
      order: 184
    mjxExtensions:
      type: 'array'
      default: [
        "AMSmath.js",
        "AMSsymbols.js",
        "noErrors.js",
        "noUndefined.js",
        "HTML.js"
      ]
      title: 'MathJax extensions:'
      order: 185
    breakOnSingleNewline:
      type: 'boolean'
      default: false
      order: 5
    liveUpdate:
      type: 'boolean'
      default: true
      order: 10
    openPreviewInSplitPane:
      type: 'boolean'
      default: true
      order: 20
    previewSplitPaneDir:
      title: 'Direction to load the preview in split pane'
      type: 'string'
      default: 'right'
      enum: ['down', 'right']
      order: 25
    grammars:
      type: 'array'
      default: [
        'source.gfm'
        'source.litcoffee'
        'text.html.basic'
        'text.md'
        'text.plain'
        'text.plain.null-grammar'
      ]
      order: 30
    enableLatexRenderingByDefault:
      title: 'Enable Math Rendering By Default'
      type: 'boolean'
      default: true
      order: 40
    useLazyHeaders:
      title: 'Use Lazy Headers'
      description: 'Require no space after headings #'
      type: 'boolean'
      default: true
      order: 45
    useGitHubStyle:
      title: 'Use GitHub.com style'
      type: 'boolean'
      default: false
      order: 50
    enablePandoc:
      type: 'boolean'
      default: true
      title: 'Enable Pandoc Parser'
      order: 100
    useNativePandocCodeStyles:
      type: 'boolean'
      default: false
      description: '''
        Don't convert fenced code blocks to Atom editors when using
        Pandoc parser'''
      order: 105
    pandocPath:
      type: 'string'
      default: 'pandoc'
      title: 'Pandoc Options: Path'
      description: 'Please specify the correct path to your pandoc executable'
      dependencies: ['enablePandoc']
      order: 110
    pandocFilters:
      type: 'array'
      default: ['pandoc-crossref', 'pandoc-citeproc']
      title: 'Pandoc Options: Filters'
      description: 'Comma separated pandoc filters, in order of application. Will be passed via command-line arguments'
      dependencies: ['enablePandoc']
      order: 115
    pandocArguments:
      type: 'array'
      default: []
      title: 'Pandoc Options: Commandline Arguments'
      description: 'Comma separated pandoc arguments e.g. `--smart, --filter=/bin/exe`. Please use long argument names.'
      dependencies: ['enablePandoc']
      order: 120
    pandocMarkdownFlavor:
      type: 'string'
      default: 'markdown-raw_tex'
      title: 'Pandoc Options: Markdown Flavor'
      description: 'Enter the pandoc markdown flavor you want'
      dependencies: ['enablePandoc']
      order: 130
    pandocBibliography:
      type: 'boolean'
      default: false
      title: 'Pandoc Options: Citations'
      description: '''
        Enable this for bibliography parsing.
        Note: pandoc-citeproc is applied after other filters specified in
        Filters, but before other commandline arguments
        '''
      dependencies: ['enablePandoc']
      order: 140
    pandocRemoveReferences:
      type: 'boolean'
      default: true
      title: 'Pandoc Options: Remove References'
      description: 'Removes references at the end of the HTML preview'
      dependencies: ['pandocBibliography']
      order: 150
    pandocBIBFile:
      type: 'string'
      default: 'bibliography.bib'
      title: 'Pandoc Options: Bibliography (bibfile)'
      description: 'Name of bibfile to search for recursively'
      dependencies: ['pandocBibliography']
      order: 160
    pandocBIBFileFallback:
      type: 'string'
      default: ''
      title: 'Pandoc Options: Fallback Bibliography (bibfile)'
      description: 'Full path to fallback bibfile'
      dependencies: ['pandocBibliography']
      order: 165
    pandocCSLFile:
      type: 'string'
      default: 'custom.csl'
      title: 'Pandoc Options: Bibliography Style (cslfile)'
      description: 'Name of cslfile to search for recursively'
      dependencies: ['pandocBibliography']
      order: 170
    pandocCSLFileFallback:
      type: 'string'
      default: ''
      title: 'Pandoc Options: Fallback Bibliography Style (cslfile)'
      description: 'Full path to fallback cslfile'
      dependencies: ['pandocBibliography']
      order: 175

  generateConfig: ->
    conf = atom.config.get(@packageName)
    edit = atom.config.get('editor')
    lessConf = """
      @main-font-size: #{conf.mainFontSize};
      @mono-font-size: #{if conf.monoFontSize == '' then edit.fontSize + 'px' else conf.monoFontSize};
      @main-font-family: #{conf.mainFontFamily};
      @mono-font-family: #{if conf.monoFontFamily == '' then edit.fontFamily else conf.monoFontFamily};
      @mjx-undef-family: #{conf.mjxUndefinedFamily};
      @mjx-numbers-font-family : #{conf.mjxNumbersFamily};
    """
    return lessConf

  writeConfig: (path) ->
    fs.writeFileSync path, @generateConfig()

  deactivate: ->
    @disposables?.dispose()

  activate: ->
    # adapted from https://github.com/coopermaruyama/apathy-theme/blob/master/lib/apathy.coffee
    @disposables = new CompositeDisposable
    @packageName = require('../package.json').name
    customStylePath = "#{__dirname}/../styles/custom.less"
    @writeConfig(customStylePath)
    # watch for changes
    cbLessVarChanged = => @writeConfig(customStylePath)
    @disposables.add atom.config.onDidChange("editor.fontSize", cbLessVarChanged)
    @disposables.add atom.config.onDidChange("editor.fontFamily", cbLessVarChanged)
    lessVariables = ["mainFontSize", "monoFontSize", "mainFontFamily", "monoFontFamily", "mjxUndefinedFamily", "mjxNumbersFamily"]
    for variable in lessVariables
      @disposables.add atom.config.onDidChange("#{@packageName}.#{variable}", cbLessVarChanged)

    if parseFloat(atom.getVersion()) < 1.7
      atom.deserializers.add
        name: 'MarkdownPreviewView'
        deserialize: module.exports.createMarkdownPreviewView.bind(module.exports)

    atom.commands.add 'atom-workspace',
      'markdown-preview-plus:toggle': =>
        @toggle()
      'markdown-preview-plus:copy-html': =>
        @copyHtml()
      'markdown-preview-plus:toggle-break-on-single-newline': ->
        keyPath = 'markdown-preview-plus.breakOnSingleNewline'
        atom.config.set(keyPath, not atom.config.get(keyPath))

    previewFile = @previewFile.bind(this)
    atom.commands.add '.tree-view .file .name[data-name$=\\.markdown]', 'markdown-preview-plus:preview-file', previewFile
    atom.commands.add '.tree-view .file .name[data-name$=\\.md]', 'markdown-preview-plus:preview-file', previewFile
    atom.commands.add '.tree-view .file .name[data-name$=\\.mdown]', 'markdown-preview-plus:preview-file', previewFile
    atom.commands.add '.tree-view .file .name[data-name$=\\.mkd]', 'markdown-preview-plus:preview-file', previewFile
    atom.commands.add '.tree-view .file .name[data-name$=\\.mkdown]', 'markdown-preview-plus:preview-file', previewFile
    atom.commands.add '.tree-view .file .name[data-name$=\\.ron]', 'markdown-preview-plus:preview-file', previewFile
    atom.commands.add '.tree-view .file .name[data-name$=\\.txt]', 'markdown-preview-plus:preview-file', previewFile

    atom.workspace.addOpener (uriToOpen) =>
      try
        {protocol, host, pathname} = url.parse(uriToOpen)
      catch error
        return

      return unless protocol is 'markdown-preview-plus:'

      try
        pathname = decodeURI(pathname) if pathname
      catch error
        return

      if host is 'editor'
        @createMarkdownPreviewView(editorId: pathname.substring(1))
      else
        @createMarkdownPreviewView(filePath: pathname)

  createMarkdownPreviewView: (state) ->
    if state.editorId or fs.isFileSync(state.filePath)
      MarkdownPreviewView ?= require './markdown-preview-view'
      new MarkdownPreviewView(state)

  toggle: ->
    if isMarkdownPreviewView(atom.workspace.getActivePaneItem())
      atom.workspace.destroyActivePaneItem()
      return

    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    grammars = atom.config.get('markdown-preview-plus.grammars') ? []
    return unless editor.getGrammar().scopeName in grammars

    @addPreviewForEditor(editor) unless @removePreviewForEditor(editor)

  uriForEditor: (editor) ->
    "markdown-preview-plus://editor/#{editor.id}"

  removePreviewForEditor: (editor) ->
    uri = @uriForEditor(editor)
    previewPane = atom.workspace.paneForURI(uri)
    if previewPane?
      preview = previewPane.itemForURI(uri)
      if preview isnt previewPane.getActiveItem()
        previewPane.activateItem(preview)
        return false
      previewPane.destroyItem(preview)
      true
    else
      false

  addPreviewForEditor: (editor) ->
    uri = @uriForEditor(editor)
    previousActivePane = atom.workspace.getActivePane()
    options =
      searchAllPanes: true
    if atom.config.get('markdown-preview-plus.openPreviewInSplitPane')
      options.split = atom.config.get('markdown-preview-plus.previewSplitPaneDir')
    atom.workspace.open(uri, options).then (markdownPreviewView) ->
      if isMarkdownPreviewView(markdownPreviewView)
        previousActivePane.activate()

  previewFile: ({target}) ->
    filePath = target.dataset.path
    return unless filePath

    for editor in atom.workspace.getTextEditors() when editor.getPath() is filePath
      @addPreviewForEditor(editor)
      return

    atom.workspace.open "markdown-preview-plus://#{encodeURI(filePath)}", searchAllPanes: true

  copyHtml: (callback = atom.clipboard.write.bind(atom.clipboard), scaleMath = 100) ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?

    renderer ?= require './renderer'
    text = editor.getSelectedText() or editor.getText()
    renderLaTeX = atom.config.get 'markdown-preview-plus.enableLatexRenderingByDefault'
    renderer.toHTML text, editor.getPath(), editor.getGrammar(), renderLaTeX, true, (error, html) ->
      if error
        console.warn('Copying Markdown as HTML failed', error)
      else if renderLaTeX
        mathjaxHelper ?= require './mathjax-helper'
        mathjaxHelper.processHTMLString html, (proHTML) ->
          proHTML = proHTML.replace /MathJax\_SVG.*?font\-size\: 100%/g, (match) ->
            match.replace /font\-size\: 100%/, "font-size: #{scaleMath}%"
          callback(proHTML)
      else
        callback(html)
