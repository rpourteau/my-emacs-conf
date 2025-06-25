;;**********************************************************************
;; core.el -- Basic configuration and defaults
;;**********************************************************************

;;**********************************************************************
;; Clean-up Emacs start
;;**********************************************************************
(setq inhibit-startup-screen t
      backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory)))
      auto-save-default nil
      make-backup-files nil
      ring-bell-function 'ignore)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;;**********************************************************************
;; Emacs configuration
;;**********************************************************************

(add-hook 'ibuffer-mode-hook 'my-ibuffer-mode-hook) (defun my-ibuffer-mode-hook () (text-scale-set -2))

(menu-bar-mode 1)                    ;; Menu bar
(tool-bar-mode -1)                   ;; Tool bar
(scroll-bar-mode -1)                 ;; Scroll bar
(column-number-mode)                 ;; Show column number as well
(global-display-line-numbers-mode t) ;; Enable line number
(delete-selection-mode t)            ;; Erase by copy over text enabled
(setq ring-bell-function 'ignore)    ;; Turn-off bell sound
(setq confirm-kill-emacs #'y-or-n-p) ;; Ask confirmation before closing emacs
(global-set-key (kbd "C-z") 'undo)   ;; Bind C-Z to undo
(setq use-short-answers t)


;; UTF-8 everywhere
(set-language-environment "UTF-8")

(setq tab-width 3)
(setq-default indent-tabs-mode nil)

;; Delete trailing whitespace at save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Enable downcase-region and upcase-region function
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Custom tabs and indent for different languages
;;


;;(setq sh-basic-offset 3)
;;(setq sh-indentation 3)
;;(setq-default c-basic-offset 4)
;;(setq-default python-basic-offset 3)

;;**********************************************************************
;; Auto complete
;;**********************************************************************
;;(use-package yasnippet
;;  :ensure t
;;  :config
;;    (yas-global-mode 1)
;;  :pin gnu
;;)
;;
;;(use-package auto-complete
;;  :ensure t
;;  :config
;;  (progn
;;    (require 'auto-complete-config)
;;    (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;    (ac-config-default)
;;    (ac-set-trigger-key "TAB")
;;    (ac-set-trigger-key "<tab>"))
;;  :pin melpa
;;)
;;
;;(setq ac-auto-start nil)
;;
