;;**********************************************************************
;; linuxos.el -- Set-up of tools that only work on Linux OS
;;**********************************************************************

;;**********************************************************************
;; magit
;;**********************************************************************
(use-package magit
  :straight t
  :commands (magit-status magit-blame)
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

;;**********************************************************************
;; ansi-term
;;**********************************************************************
;; Better use ansi-term rather than shell, key bind to C-c t
(defun my-term ()
  "Launch ansi-term with the user's shell."
  (interactive)
  (ansi-term (getenv "SHELL")))

(global-set-key (kbd "C-c t") #'my-term)
