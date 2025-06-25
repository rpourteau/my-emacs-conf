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

;; Dired+
(use-package dired+
  :load-path "lisp/"
  :config
  (diredp-toggle-find-file-reuse-dir 1))

;; yaml-mode
(use-package yaml-mode
  :load-path "lisp/"
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :hook (yaml-mode . (lambda ()
                       (define-key yaml-mode-map (kbd "RET") 'newline-and-indent))))

;;;; SystemRDL mode
;;(use-package systemrdl-mode
;;  :load-path "lisp/"
;;  :mode ("\\.rdl\\'" . systemrdl-mode))
;;
;; IEC 61131-3 Structured Text mode
;;(use-package iec61131-mode
;;  :load-path "lisp/")
