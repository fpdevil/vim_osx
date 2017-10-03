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
;;;===========================================================================
(require 'auto-complete)
(require 'pos-tip)
(require 'ac-slime)

;;;
;;; Code:
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-completion (where company is not available)                         ;;
;; setting up auto-complete after yasnippet to avoid duplicate tab bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories
               (concat user-emacs-directory "/cache/auto-complete/ac-dict"))
  (setq ac-comphist-file (concat cache-dir "auto-complete/ac-comphist.dat"))
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


; to enable auto-complete globally
; (global-auto-complete-mode t)
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
(global-set-key (kbd "C-M-Z") 'ac-fuzzy-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; show the menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ac-show-menu-immediately-on-auto-complete t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippet integration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load 'yasnippet
  '(progn
	 (add-hook 'yas-before-expand-snippet-hook '(lambda() (setq ac-auto-start 2)))
	 (add-hook 'yas-after-exit-snippet-hook '(lambda() (setq ac-auto-start nil)))
	 ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; set the default sources for auto completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq-default ac-sources '(ac-source-dictionary
;;                            ac-source-words-in-buffer
;;                            ac-source-words-in-all-buffer
;;                            ac-source-functions
;;                            ac-source-yasnippet
;;                            ac-source-abbrev
;;                            ac-source-words-in-same-mode-buffers))

;; define the same using function
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; add on for individual modes if any
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun aqua/add-sources-for-prog ()
  "Add ac-sources for each programming-mode."
  (let ((add-source
                 (lambda (s)
                   (setq ac-sources (append `(,s) aqua/ac-sources-default)))))
    (cl-case major-mode
      (go-mode      (funcall add-source 'ac-source-go))
      (haskell-mode (add-to-list 'ac-sources
                                 'ac-source-ghc-mod)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; add to programming hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

(dolist (mode '(text-mode
                haskell-mode
                html-mode
                nxml-mode
                sh-mode
                vimrc-mode
                clojure-mode
                markdown-mode
                js3-mode
                css-mode
                inferior-emacs-lisp-mode))
  (add-to-list 'ac-modes mode))

;;
;; for disabling auto-complete mode for a specific mode
; (defadvice auto-complete-mode (around disable-auto-complete-for-progname)
;   (unless (eq major-mode 'progname-mode) ad-do-it))
; (ad-activate 'auto-complete-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add lisp auto complete support
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; working with linum enabled
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'linum
  (ac-linum-workaround))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for yasnippet integration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'yasnippet
  (add-hook 'yas-before-expand-snippet-hook (lambda () (auto-complete-mode -1)))
  (add-hook 'yas-after-exit-snippet-hook (lambda () (auto-complete-mode t)))
  (defadvice ac-expand (before dotemacs activate)
    (when (yas-expand)
      (ac-stop))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eshell auto completion using auto-complete mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ac-eshell-pcomplete ()
  ;; eshell uses `insert-and-inherit' to insert a \t if no completion
  ;; can be found, but this must not happen as auto-complete source
  (flet ((insert-and-inherit (&rest args)))
    ;; this code is stolen from `pcomplete' in pcomplete.el
    (let* (tramp-mode ;; do not automatically complete remote stuff
           (pcomplete-stub)
           (pcomplete-show-list t) ;; inhibit patterns like * being deleted
           pcomplete-seen pcomplete-norm-func
           pcomplete-args pcomplete-last pcomplete-index
           (pcomplete-autolist pcomplete-autolist)
           (pcomplete-suffix-list pcomplete-suffix-list)
           (candidates (pcomplete-completions))
           (beg (pcomplete-begin))
           ;; note, buffer text and completion argument may be
           ;; different because the buffer text may bet transformed
           ;; before being completed (e.g. variables like $HOME may be
           ;; expanded)
           (buftext (buffer-substring beg (point)))
           (arg (nth pcomplete-index pcomplete-args)))
      ;; we auto-complete only if the stub is non-empty and matches
      ;; the end of the buffer text
      (when (and (not (zerop (length pcomplete-stub)))
                 (or (string= pcomplete-stub ; Emacs 23
                              (substring buftext
                                         (max 0
                                              (- (length buftext)
                                                 (length pcomplete-stub)))))
                     (string= pcomplete-stub ; Emacs 24
                              (substring arg
                                         (max 0
                                              (- (length arg)
                                                 (length pcomplete-stub)))))))
        ;; Collect all possible completions for the stub. Note that
        ;; `candidates` may be a function, that's why we use
        ;; `all-completions`.
        (let* ((cnds (all-completions pcomplete-stub candidates))
               (bnds (completion-boundaries pcomplete-stub
                                            candidates
                                            nil
                                            ""))
               (skip (- (length pcomplete-stub) (car bnds))))
          ;; We replace the stub at the beginning of each candidate by
          ;; the real buffer content.
          (mapcar #'(lambda (cand) (concat buftext (substring cand skip)))
                  cnds))))))

(defvar ac-source-eshell-pcomplete
  '((candidates . ac-eshell-pcomplete)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ac-complete-config)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; ac-complete-config.el ends here
