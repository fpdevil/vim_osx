;;; package  --- ac-complete-config.el
;;;
;;; Commentary:
;;;
;;; Filename   : ac-complete-config.el
;;; Description: Modular in-buffer completion framework for Emacs
;;;              Auto-Complete is a text completion framework for Emacs.
;;;
;;;
;;; elisp code for standard auto-completion configuration with auto-complete
;;;
;;; Code:
;;;===========================================================================
(require 'auto-complete)
(require 'pos-tip)
(require 'ac-slime)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-completion (where company is not available)                         ;;
;; setting up auto-complete after yasnippet to avoid duplicate tab bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories (concat cache-dir "/auto-complete/ac-dict"))
  (setq ac-comphist-file (concat cache-dir "/auto-complete/ac-comphist.dat"))
  ;; some default global values for ac completions
  (setq ac-auto-show-menu t)
  (setq ac-delay 0.5)
  (setq ac-quick-help-delay 0.3)
  (setq ac-auto-start t)
  (setq ac-use-menu-map t)
  (setq ac-menu-height 30)
  (setq ac-ignore-case nil)
  (setq ac-use-quick-help t)
  (setq ac-quick-help-prefer-pos-tip t)
  (setq ac-use-fuzzy t)
  (setq ac-fuzzy-enable t)
  (setq ac-dwim t)
  (setq ac-stop-words (quote ("/" "//" "/*" "//*" "///" "////")))
  ;; (setq ac-dictionary-files (concat  cache-dir "/auto-complete/.dict"))
  (ac-config-default))

;; show the menu
(setq ac-show-menu-immediately-on-auto-complete t)

;; Controls the operation of the TAB key.  If t, hitting TAB always just indents
;; the current line.  If nil, hitting TAB indents the current line if point is
;; at the left margin or in the line's indentation, otherwise it inserts a
;; "real" TAB character.  If `complete', TAB first tries to indent the current
;; line, and if the line was already indented, then try to complete the thing at
;; point.
(setq tab-always-indent 'complete)

;; c-tab-always-indent:
;; If t, hitting TAB always just indents the current line.  If nil, hitting TAB
;; indents the current line if point is at the left margin or in the line's
;; indentation, otherwise it calls `c-insert-tab-function' to insert a `real'
;; tab character.
;; indent-for-tab-command:
;; Indent the current line or region, or insert a tab, as appropriate.
(setq c-tab-always-indent nil
      c-insert-tab-function 'indent-for-tab-command)


;; to enable auto-complete globally
;; (global-auto-complete-mode t)
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
(global-set-key (kbd "C-M-Z") 'ac-fuzzy-complete)


;;; -- linum mode for displaying line numbers for current buffer
(after 'linum
  (ac-linum-workaround))

;;; -- yasnippet integration
(after 'yasnippet
  (add-hook 'yas-before-expand-snippet-hook (lambda () (auto-complete-mode -1)))
  (add-hook 'yas-after-exit-snippet-hook (lambda () (auto-complete-mode t)))
  (defadvice ac-expand (before dotemacs activate)
    (when (yas-expand)
      (ac-stop))))

;;; -- set the default sources for auto completion
;; (setq-default ac-sources '(ac-source-dictionary
;;                            ac-source-words-in-buffer
;;                            ac-source-words-in-all-buffer
;;                            ac-source-functions
;;                            ac-source-yasnippet
;;                            ac-source-abbrev
;;                            ac-source-words-in-same-mode-buffers))

;;; -- define the ac sources using function
(defvar aqua/ac-sources-default
  "Default ac completion sources."
  '(
    ac-source-filename
    ac-source-abbrev
    ac-source-dictionary
    ac-source-words-in-buffer
    ac-source-words-in-all-buffer
    ac-source-functions
    ac-source-yasnippet
    ac-source-words-in-same-mode-buffers))

(setq-default ac-sources aqua/ac-sources-default)

;;; -- add on for individual modes if any
(defun aqua/add-sources-for-prog ()
  "Add ac-sources for each programming-mode."
  (let ((add-source
                 (lambda (s)
                   (setq ac-sources (append `(,s) aqua/ac-sources-default)))))
    (cl-case major-mode
      (go-mode      (funcall add-source 'ac-source-go))
      (haskell-mode (add-to-list 'ac-sources
                                 'ac-source-ghc-mod)))))

;;; -- add to programming hooks
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

(dolist (mode '(text-mode
                python-mode
                haskell-mode
                html-mode
                xml-mode
                nxml-mode
                sh-mode
                vimrc-mode
                clojure-mode
                markdown-mode
                js2-mode
                js3-mode
                css-mode
                inferior-emacs-lisp-mode))
  (add-to-list 'ac-modes mode))

;;
;; for disabling auto-complete mode for a specific mode
; (defadvice auto-complete-mode (around disable-auto-complete-for-progname)
;   (unless (eq major-mode 'progname-mode) ad-do-it))
; (ad-activate 'auto-complete-mode)


;;; -- add lisp auto complete support
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;;; == flyspell mode breaks auto-complete mode without this.
(ac-flyspell-workaround)

;;; -- etags/ctags completion source for auto-complete
(require-package 'ac-etags)
(setq ac-etags-requires 1)
(after 'etags
  (ac-etags-setup))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ac-complete-config)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; ac-complete-config.el ends here
