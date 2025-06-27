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

;;**********************************************************************
;; ansi-term
;;**********************************************************************
(defun eshell-load-bash-aliases ()
  "Read Bash aliases and add them to the list of eshell aliases."
  ;; Bash needs to be run - temporarily - interactively
  ;; in order to get the list of aliases.
    (with-temp-buffer
      (call-process "bash" nil '(t nil) nil "-ci" "alias")
      (goto-char (point-min))
      (while (re-search-forward "alias \\(.+\\)='\\(.+\\)'$" nil t)
        (eshell/alias (match-string 1) (match-string 2)))))

;; We only want Bash aliases to be loaded when Eshell loads its own aliases,
;; rather than every time `eshell-mode' is enabled.
(add-hook 'eshell-alias-load-hook 'eshell-load-bash-aliases)
