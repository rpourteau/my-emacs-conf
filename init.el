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

;; Disable native comp for straight packages
(with-eval-after-load 'straight
  (setq straight--native-comp-available-p nil))


;;**********************************************************************
;; Helper functions for OS specific features
;;**********************************************************************

(defmacro when-linux (&rest body)
  `(when (eq system-type 'gnu/linux)
     ,@body))

(defmacro when-windows (&rest body)
  `(when (eq system-type 'windows-nt)
     ,@body))

(defmacro when-mac (&rest body)
  `(when (eq system-type 'darwin)
     ,@body))


;; Add 'config/' to load path
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;;**********************************************************************
;; Load modular config
;;**********************************************************************
(mapc (lambda (module)
        (load (expand-file-name (format "config/%s" module) user-emacs-directory)))
      (append
       '("core"
         "ui"
         "completion"
         "legacy"
         "langs/markdown"
         "langs/python"
         "langs/shell"
         "langs/systemrdl"
         "langs/tcl"
         "langs/verilog"
         "langs/vhdl")))


;; OS-specific modules
(when-linux
  (mapc (lambda (module)
          (load (expand-file-name (format "config/%s" module) user-emacs-directory)))
        '("linuxos")))

(when-windows
  (mapc (lambda (module)
          (load (expand-file-name (format "config/%s" module) user-emacs-directory)))
        '("windowsos")))

(when-mac
  (mapc (lambda (module)
          (load (expand-file-name (format "config/%s" module) user-emacs-directory)))
        '("macos")))
