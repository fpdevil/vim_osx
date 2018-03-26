{'package', 'aqua-methods.el', 'Commentary:', 'Filename', 'Description:', 'custom', 'methods', 'defined', 'here.', 'Code:', 'Updated', 'load', 'lazily', 'initialize', 'defmacro', 'lazy-init', '&rest', 'body', 'Initializae', 'BODY', 'after', 'being', 'idle', 'predetermined', 'amount', 'time.', 'run-with-idle-timer', 'lambda', '@body', 'identify', 'unnecessary', 'whitespace', 'programming', 'modes', 'whitespace-cleanup', 'command', 'clearing', 'trailing', 'white', 'spaces', 'require', 'this', 'internal', 'setq-default', 'show-trailing-whitespace', 'set-default', 'indent-tabs-mode', 'setq', 'my-command-buffer-hooks', 'make-hash-table', 'defun', 'my-command-on-save-buffer', 'every', 'time', 'buffer', 'saved.', 'interactive', 'sShell', 'command:', 'puthash', 'buffer-file-name', 'my-command-buffer-kill-hook', 'Remove', 'from', '<command-buffer-hooks>', 'exists.', 'remhash', 'my-command-buffer-run-hook', 'exists', 'hook.', 'hook', 'gethash', 'when', 'shell-command', 'function', 'inserting', 'current', 'date', 'my-insert-date', 'prefix', 'Insert', 'with', 'PREFIX', 'format.', 'With', 'arguments', 'write', 'month', 'name.', 'format', 'cond', '%Y-%m-%d', '%H:%M', 'equal', 'insert', 'format-time-string', 'system', 'name', 'defining', 'types', 'insert-system-name', 'system-name', 'is-mac', 'System', 'type', 'MAC.', 'string-equal', 'system-type', 'darwin', 'is-linux', 'Linux.', 'gnu/linux', 'insert-system-type', 'face', 'information', 'position', 'get-faces', 'font', 'faces', 'POS.', 'remq', 'list', 'get-char-property', 'read-face-name', 'plist-get', 'text-properties-at', 'check', 'available', 'font-existsp', 'Check', 'specified', 'FONT', 'available.', 'null', 'x-list-fonts', 'print', 'found', 'point', 'what-face', 'Print', 'message', 'Face:', 'reduce', 'cruft', 'modeline', 'rename', 'major', 'mode', 'rename-modeline', 'package-name', 'new-name', 'eval-after-load', 'defadvice', 'activate', 'mode-name', 'js2-mode', 'clojure-mode', 'reloading', 'emacs', 'configuration', 'file', 'reload-dot-emacs', 'Save', 'required', 'reload', 'emacs.', 'dot-emacs', 'concat', 'getenv', 'HOME', '/.emacs', 'get-file-buffer', 'save-buffer', 'load-file', 'Emacs', 're-initialized.', 'version', 'Aquamacs', 'none', 'defconst', 'aq-major-version', 'progn', 'string-match', 'emacs-version', 'string-to-number', 'match-string', 'Major', 'number', 'Emacs.', 'This', 'variable', 'first', 'existed', 'functions', 'un-setting', 'maps', 'checking', 'get-key-combo', 'Just', 'return', 'combo', 'entered', 'user.', 'kKey', 'combo:', 'keymap-unset-key', 'keymap', 'binding', 'KEYMAP', 'where', 'string', 'vector', 'representing', 'sequence', 'keystrokes.', 'call-interactively', 'completing-read', 'Which', 'map:', 'minor-mode-map-alist', 'rest', 'assoc', 'intern', 'define-key', 'unbound', 'Then', 'interativly', 'like', 'this:', 'C-M-left', 'paredit-mode', 'setting', 'default', 'fonts', 'aqua/default-fonts', 'that', 'work.', 'set-face-font', 'menu', '-unknown-Monaco', 'Powerline-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1', 'exit', 'evils', 'state', 'also', 'close', 'company', 'popup', 'aqua-company-abort', 'Pressing', 'should', 'POPUP.', 'company-abort', 'bound-and-true-p', 'evil-mode', 'evil-state', 'evil-force-normal-state', 'utility', 'brokenly', 'handle', 'versioned', 'dirs', 'aqua/wild', 'stem', 'Return', 'last', 'alphabetically', 'match', 'DIR/STEM*.', 'reverse', 'sort', 'value', 'dolist', 'element', 'file-name-all-completions', 'cons', 'string-lessp', 'kill', 'other', 'buffers', 'kill-other-buffers', 'Kill', 'doesn', 'mess', 'special', 'buffers.', 'buffer-list', 'unless', 'current-buffer', 'kill-buffer', 'defvar', 'aqua--diminished-minor-modes', 'List', 'diminished', 'unicode', 'ascii', 'values.', 'aqua', 'diminish', '&optional', 'Diminish', 'MODE', 'line', 'UNICODE', 'ASCII', 'depending', 'dotspacemacs-mode-line-unicode-symbols', 'provided', 'then', 'used', 'instead.', 'neither', 'will', 'show', 'line.', 'cell', 'assq', 'setcdr', 'push', 'hide-lighter', 'LIGHTER.', 'active', 'list-active-modes', 'buffer.', 'active-modes', 'mapc', 'condition-case', 'symbolp', 'symbol-value', 'add-to-list', 'error', 'minor-mode-list', 'Current', 'https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-util.el', 'add-to-hooks', 'hooks', 'add-hook', 'kill-buffer-hook', 'after-save-hook', 'http://endlessparentheses.com/fill-and-unfill-paragraphs-with-a-single-key.html', 'endless/fill-or-unfill', 'Like', 'fill-paragraph', 'unfill', 'twice.', 'fill-column', 'last-command', 'this-command', 'point-max', 'bind-key', 'remap', 'provide', 'aqua-methods', 'Local', 'Variables:', 'coding:', 'utf-8', 'mode:', 'emacs-lisp', 'End:', 'ends', 'here'}