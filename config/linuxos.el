
; magit
(use-package magit
  :straight t
  :commands (magit-status magit-blame)
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))
