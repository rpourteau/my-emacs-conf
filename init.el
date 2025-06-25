;;**********************************************************************
;; init.el -- Bootstrap and load modular config
;;**********************************************************************

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Add 'config/' to load path
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;;**********************************************************************
;; Load modular config
;;**********************************************************************
(mapc (lambda (module)
        (load (expand-file-name (format "config/%s" module) user-emacs-directory)))
      '("core"
        "ui"
        "legacy"
        "windowsos"
        "langs/markdown"
        "langs/python"
        "langs/shell"
        "langs/tcl"
        "langs/verilog"
        "langs/vhdl"
        ))
