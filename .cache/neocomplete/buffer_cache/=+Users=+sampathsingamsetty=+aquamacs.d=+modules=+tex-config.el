{'package', 'tex-config.el', 'configuration', 'settings', 'LaTeX/AucTex', 'mode:', 'emacs-lisp', 'Commentary:', 'Filename', 'Description:', 'Emacs', 'Color', 'theme', 'Additional', 'Packages:', 'https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages', 'Help:', 'https://github.com/grettke/help', 'elisp', 'code', 'customizing', 'latex', 'Code:', '===========================================================================', 'require', 'latex-pretty-symbols', 'add-to-list', 'auto-mode-alist', 'TeX-latex-mode', 'PATH', 'texbin', 'setenv', 'concat', 'getenv', ':/Library/TeX/texbin', 'setq', 'exec-path', 'append', '/Library/TeX/texbin', 'TeX-auto-save', 'TeX-parse-self', 'setq-default', 'TeX-master', 'LaTeX', 'Engine', 'TeX-engine', 'quote', '/Library/TeX/texbin/xetex', 'synctex', 'LaTeX-command', 'pdflatex', '-synctex=1', 'Completion', 'with', 'Company', 'after', 'company', 'require-package', 'company-auctex', 'add-hook', 'LaTeX-mode-hook', 'company-auctex-init', 'Cmpletion', 'Auto-Complete', 'auto-complete', 'auto-complete-auctex', 'command', 'list', 'TeX-command-list', 'PDFout', 'mode', 'TeX-run-TeX', 'plain-tex-mode', 'texinfo-mode', 'ams-tex-mode', ':help', 'plain', 'latex-mode', 'doctex-mode', 'Make', 'latexmk', '-pdflatex=', '-pdf', 'TeX-run-command', 'Makeinfo', 'makeinfo', 'TeX-run-compile', 'Info', 'output', 'HTML', '--html', 'AmSTeX', 'amstex', 'AMSTeX', 'ConTeXt', 'texexec', '--once', '--texutil', 'execopts', 'context-mode', 'once', 'Full', 'until', 'completion', 'BibTeX', 'bibtex', 'TeX-run-BibTeX', 'Biber', 'biber', 'TeX-run-Biber', 'View', 'TeX-run-discard-or-function', 'Viewer', 'Print', 'file', 'Queue', 'TeX-run-background', 'printer', 'queue', ':visible', 'TeX-queue-command', 'File', 'dvips', 'Generate', 'PostScript', 'Index', 'makeindex', 'Create', 'index', 'Check', 'lacheck', 'correctness', 'Spell', 'TeX-ispell-document', 'TeX-run-function', 'Spell-check', 'document', 'Clean', 'TeX-clean', 'Delete', 'generated', 'intermediate', 'files', 'Other', 'arbitrary', 'XeLaTeX_SyncteX', 'xelatex', '--synctex=1%', 'visual-line-mode', 'flyspell-mode', 'LaTeX-math-mode', 'TeX-source-correlate-mode', 'turn-on-reftex', 'default', 'defun', 'TeX-PDF-mode-on', 'interactive', 'TeX-PDF-mode', 'tex-mode-hook', 'latex-mode-hook', 'reftex-plug-into-AUCTeX', 'auto-fill', 'auto-fill-mode-on', 'Turn', 'Autofill', 'mode.', 'auto-fill-mode', 'text-mode-hook', 'emacs-lisp-mode', 'citations', 'using', 'reftex', 'reftex-cite', 'org-mode-reftex-setup', 'buffer-file-name', 'file-exists-p', 'progn', 'Reftex', 'should', 'master', 'file.', 'infos.', 'enable', 'auto-revert-mode', 'update', 'when', 'changes', 'disk', 'global-auto-revert-mode', 'careful:', 'this', 'kill', 'undo', 'history', 'change', 'on-disk.', 'reftex-parse-all', 'custom', 'cite', 'format', 'insert', 'links', 'This', 'also', 'call', 'org-citation!', 'reftex-set-cite-format', 'citet', 'natbib', 'inline', 'text', 'citep', 'parens', 'define-key', 'org-mode-map', 'reftex-citation', 'org-mode-reftex-search', 'org-mode-hook', 'TeX-output-view-style', '^pdf$', 'evince', '^html?$', 'iceweasel', 'Skim', 'viewer', 'source', 'sync', 'make', 'available', 'Note:', 'SyncTeX', 'setup', '~/.latexmkrc', 'below', 'lambda', 'push', 'TeX-mode-hook', 'TeX-command-default', 'Settings', 'TeX-expand-list', 'skim-make-url', 'TeX-current-line', 'expand-file-name', 'funcall', 'TeX-output-extension', 'file-name-directory', 'TeX-master-file', 'displayline', 'used', 'forward', 'search', 'from', 'option', 'highlights', 'current', 'line', 'opens', 'background', 'TeX-view-program-selection', 'output-pdf', 'TeX-view-program-list', '/Applications/Skim.app/Contents/SharedSupport/displayline', 'hide', 'some', 'parts', 'turn-on-outline-minor-mode', 'Hide', 'show', 'outline-minor-mode', 'shortcuts', 'outline-minor-mode-prefix', 'export', 'interpret', 'braces', 'org-export-with-sub-superscripts', 'org-latex-default-packages-alist', 'AUTO', 'inputenc', 'lmodern', 'fontenc', 'fixltx2e', 'graphicx', 'longtable', 'float', 'wrapfig', 'rotating', 'normalem', 'ulem', 'amsmath', 'textcomp', 'marvosym', 'wasysym', 'amssymb', 'version=3', 'mhchem', 'numbers', 'super', 'sort&compress', 'natmove', 'minted', 'underscore', 'linktocpage', 'pdfstartview=FitH', 'colorlinks', 'linkcolor=blue', 'anchorcolor=blue', 'citecolor=blue', 'filecolor=blue', 'menucolor=blue', 'urlcolor=blue', 'hyperref', 'attachfile', 'hypersetup.', 'your', 'want', 'e.g.', 'hypersetup', 'pdfkeywords=', 'pdfsubject=', 'pdfcreator=', 'org-latex-with-hyperref', 'org-export-latex-listings', 'avoid', 'getting', 'maketitle', 'right', 'begin', 'where', 'org-latex-title-command', 'org-latex-prefer-user-labels', 'my-auto-tex-cmd', 'When', 'exporting', 'automatically', 'appropriate', 'latexmk.', 'texcmd', 'command:', 'oldstyle', '-dvi', '-pdfps', 'string-match', 'LATEX_CMD:', 'buffer-string', '-pdflatex=xelatex', 'compilation', 'org-latex-to-pdf-process', '-interaction', 'nonstopmode', 'multiple', 'passes', 'org-export-latex-after-initial-vars-hook', 'Default', 'packages', 'included', 'every', 'org-export-latex-packages-alist', 'my-auto-tex-parameters', 'Automatically', 'select', 'include.', 'ordinary', 'org-export-latex-default-packages-alist', 'soul', 'latexsym', 'Packages', 'include', 'https://github.com/kjhealy/latex-custom-kjh', 'non-standard', 'ones.', 'fontspec', 'xunicode', 'memoir-article-styles', 'american', 'babel', 'csquotes', 'listings', 'listings-sweave-xelatex', 'svgnames', 'xcolor', 'xetex', 'colorlinks=true', 'urlcolor=FireBrick', 'plainpages=false', 'pdfpagelabels', 'bookmarksnumbered', 'org-export-latex-classes', 'cons', 'article', 'documentclass', 'oneside', 'memoir', 'input', 'usepackage', 'style=authoryear-comp-ajs', 'abbreviate=true', 'biblatex', 'bibliography', 'socbib', 'section', 'section*', 'subsection', 'subsection*', 'subsubsection', 'subsubsection*', 'paragraph', 'paragraph*', 'subparagraph', 'subparagraph*', 'provide', 'tex-config', 'Local', 'Variables:', 'coding:', 'utf-8', 'byte-compile-warnings:', 'cl-functions', 'End:', 'ends', 'here'}
