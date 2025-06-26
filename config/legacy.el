;;**********************************************************************
;; legacy.el -- Load old packages that are in lisp folder
;;**********************************************************************
;; Highlight-symbol
(use-package highlight-symbol
  :load-path "lisp/"
  :bind (("C-<f3>" . highlight-symbol)
         ("<f3>"   . highlight-symbol-next)
         ("S-<f3>" . highlight-symbol-prev)
         ("M-<f3>" . highlight-symbol-query-replace)))

;; yaml-mode
(use-package yaml-mode
  :load-path "lisp/"
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :hook (yaml-mode . (lambda ()
                       (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))))
