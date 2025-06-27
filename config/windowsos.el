;;**********************************************************************
;; Specific Windows OS
;;**********************************************************************

;; ag to search in folders
(use-package ag
  :straight t
  :config
  (setq ag-executable "C:/ag/ag.exe"))

;; Dired+
(use-package dired+
  :load-path "lisp/"
  :config
  (diredp-toggle-find-file-reuse-dir 1))
