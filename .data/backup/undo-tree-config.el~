;;; package --- undo-tree-config.el configuration settings for undo visualisation
;;;
;;; Commentary:
;;;
;;; Filename   : unto-tree-config.el
;;; Description: Emacs Undo Tree Visualisation
;;;
;;; elisp code for customizing the undo-tree
;;; undo-tree: undo (C-/) behaves just like normal editor.  To redo, C-_
;;; To open the undo tree, C-x u
;;===========================================================================
(require 'undo-tree)
;;;
;;; Code:
;;;
;;----------------------------------------------------------------------------
;; auto save the undo-tree history
;;----------------------------------------------------------------------------
(with-eval-after-load "undo-tree-autoloads"
  (global-undo-tree-mode t)                         ;; enable undo-tree globally
  (setq undo-tree-history-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-visualizer-relative-timestamps t)
  (setq undo-tree-visualizer-timestamps t))

(provide 'undo-tree-config)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; undo-tree-config.el ends here
