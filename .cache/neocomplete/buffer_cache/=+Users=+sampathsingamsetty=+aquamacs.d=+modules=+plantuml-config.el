{'package', 'plantuml', 'configuration', 'Commentary:', 'Filename', 'plantuml-config.el', 'Description:', 'major', 'mode', 'editing', 'PlantUML', 'sources', 'Ditaa', 'Emacs', 'https://github.com/skuro/plantuml-mode', 'http://archive.3zso.com/archives/plantuml-quickstart.html', 'ditaa', 'http://ditaa.sourceforge.net/', 'usage', 'https://github.com/stathissideris/ditaa', 'http', 'https://github.com/zweifisch/ob-http', 'Real', 'worl', 'examples', '@https://real-world-plantuml.com/', 'elisp', 'code', 'support', 'handling', '@href', 'http://plantuml.com/', 'Code:', '============================================================================', 'file', 'enable', 'add-to-list', 'auto-mode-alist', 'plantuml-mode', 'disable', 'electric', 'indent', 'add-hook', 'electric-indent-mode-hook', 'lambda', 'electric-indent-local-mode', 'restore', 'local-set-key', 'newline-and-indent', '-----------------------------------------------------------------------------', 'tell', 'org-mode', 'where', 'find', 'setq', 'org-plantuml-jar-path', 'concat', 'user-emacs-directory', '/vendor/java/plantuml.jar', 'plantuml-jar-path', '/usr/local/opt/plantuml/libexec/plantuml.jar', 'message', 'loading', 'from', 'activate', 'Babel', 'language', 'org-babel', 'when', 'boundp', 'org-babel-do-load-languages', 'org-babel-load-languages', 'latex', 'haskell', 'elixir', 'emacs-lisp', 'scala', 'java', 'shell', 'python', 'ipython', 'org-babel-after-execute-hook', 'org-redisplay-inline-images', 'line', 'truncation', 'defun', 'my-org-mode-hook', 'toggle-truncate-lines', 'org-mode-hook', 'integration', 'with', 'edit', 'source', 'snippets', 'within', 'docs', '+BEGIN_SRC', '<hit', 'here', 'open', 'buffer>', '+END_SRC', 'org-src-lang-modes', 'auxiliary', 'function', 'my-org-confirm-babel-evaluate', 'lang', 'body', 'LANG', 'BODY', 'confirmation', 'evaluate', 'specified', 'languages.', 'member', 'trust', 'certain', 'being', 'safe', 'org-confirm-babel-evaluate', 'displaying', 'inline', 'images', 'aqua-display-inline-images', 'inline.', 'condition-case', 'org-display-inline-images', 'error', 'append', 'flycheck', 'after', 'require', 'flycheck-plantuml', 'flycheck-plantuml-setup', '------------------------------------------------------------------------------', 'Save', 'image', 'want', 'save', 'while', 'saving', 'comment', 'plantuml-mode-hook', 'after-save-hook', 'plantuml-save-png', 'image.', 'interactive', 'buffer-modified-p', 'map-y-or-n-p', 'this', 'buffer', 'before', 'executing', 'PlantUML?', 'save-buffer', 'list', 'current-buffer', 'buffer-string', 'out-file', 'string-match', 's-*@startuml', 'match-string', '-Djava.awt.headless=true', '-jar', 'plantuml-java-options', 'shell-quote-argument', 'file-name-extension', 'plantuml-options', 'buffer-file-name', 'call-process-shell-command', 'DIagrams', 'Through', 'Ascii', 'brew', 'install', 'Location', 'homebrew', 'installed', 'org-ditaa-jar-path', '/usr/local/opt/ditaa/libexec/ditaa-0.11.0-standalone.jar', 'ditaa-cmd', 'djcb-ditaa-generate', 'shell-command', 'make', 'work', 'graphviz-dot', 'provide', 'plantuml-config', 'Local', 'Variables:', 'coding:', 'utf-8', 'mode:', 'byte-compile-warnings:', 'cl-functions', 'End:', 'ends'}