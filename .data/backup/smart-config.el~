;;; package  --- smart-config.el
;;;
;;; Commentary:
;;;
;;; Filename   : smart-config.el
;;; Description: Smartparens is a minor mode for dealing with pairs in Emacs.
;;;
;;; elisp code for customizing the smartparens settings
;;;===========================================================================
(require 'smartparens-config)
;(require 'smartparens)
;;;
;;; Code:
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smart parenthesis matching a minor mode for Emacs that deals with parens ;;
;; pairs and tries to be smart about it.                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(smartparens-global-mode t)

(sp-local-pair '(emacs-lisp-mode) "'" "'" :actions nil)
(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(setq blink-matching-paren t)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)

(custom-set-faces
 '(sp-pair-overlay-face ((t (:background "grey20")))))

;; angle brackets aren’t treated as delimiters by default in js2-mode
;; below is the fix through sp
(eval-after-load 'js2-mode
  '(sp-local-pair 'js2-mode "<" ">"))

(provide 'smart-config)
;;; smart-config.el ends here
