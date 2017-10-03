;;; package --- custom configuration for Markdown Mode
;;;
;;; Commentary:
;;; Filename   : markdown-config.el
;;; description: elisp code for customizing markdown mode for Emacs
;;;
;;;===========================================================================
(require 'markdown-mode)
;;;
;;; Code:
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; editing files in markdown mode                                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-mode-alist
    (append
        (list '("\\.text"     . markdown-mode)
              '("\\.md"       . markdown-mode)
              '("\\.mdml$"    . markdown-mode)
              '("\\.markdown" . markdown-mode))
        auto-mode-alist))

(defun markdown-imenu-index ()
  "Provide an imenu handler for Markdown mode."
  (let* ((patterns '((nil "^#\\([# ]*[^#\n\r]+\\)" 1))))
    (save-excursion
      (imenu--generic-function patterns))))

(defcustom markdown-imenu-generic-expression nil
  "Generic declarations for markdown titles."
  :group 'markdown-config
  :type 'string
  :safe 'stringp)

(setq markdown-imenu-generic-expression
      '(("title"  "^\\(.*\\)[\n]=+$" 1)
       ("h2-"    "^\\(.*\\)[\n]-+$" 1)
       ("h1"   "^# \\(.*\\)$" 1)
       ("h2"   "^## \\(.*\\)$" 1)
       ("h3"   "^### \\(.*\\)$" 1)
       ("h4"   "^#### \\(.*\\)$" 1)
       ("h5"   "^##### \\(.*\\)$" 1)
       ("h6"   "^###### \\(.*\\)$" 1)
       ("fn"   "^\\[\\^\\(.*\\)\\]" 1)))
 (add-hook 'markdown-mode-hook
           (lambda ()
             (setq imenu-generic-expression markdown-imenu-generic-expression)))

(defun markdown-mode-hook-setup ()
  "Add the markdown mode hook."
  (setq imenu-create-index-function 'markdown-imenu-index))
(add-hook 'markdown-mode-hook 'markdown-mode-hook-setup)


;;----------------------------------------------------------------------------
;; Export Markdown to a LaTeX project
;;----------------------------------------------------------------------------
(defun markdown-region-to-latex (start end)
  "START END export the markdown region to latex."
  (interactive "r")
  (goto-char start)
  (save-restriction
    (let (in-list skip-to)
      (narrow-to-region start end)
      (while (re-search-forward "\\*\\|\n\\|\\`" nil t)
	(goto-char (match-beginning 0))
	(if (= (point) (match-end 0))
	    (setq skip-to (1+ (point)))
	  (setq skip-to (match-end 0)))
	(cond ((looking-at "\\*\\*\\b\\([^*]*?\\)\\b\\*\\*")
	       (replace-match "\\\\textbf{\\1}"))
	      ((looking-at "\\*\\b\\([^*]*?\\)\\b\\*")
	       (replace-match "\\\\textit{\\1}"))
	      ((looking-at "^# \\(.*\\)")
	       (replace-match "\\\\section{\\1}"))
	      ((looking-at "^## \\(.*\\)")
	       (replace-match "\\\\subsection{\\1}"))
	      ((looking-at "^### \\(.*\\)")
	       (replace-match "\\\\subsubsection{\\1}"))
	      ((looking-at "^\\* ")
	       (replace-match (if in-list "\\\\item " "\\\\begin{itemize}\n\\\\item "))
	       (setq in-list "itemize"))
	      ((looking-at "^[0-9]+\\. ")
	       (replace-match (if in-list "\\\\item " "\\\\begin{enumerate}\n\\\\item "))
	       (setq in-list "enumerate"))
	      ((and in-list (looking-at "^"))
	       (replace-match (format "\\\\end{%s}\n" in-list))
	       (setq in-list nil))
	      (t (goto-char skip-to)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'markdown-config)

;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; markdown-config.el ends here
