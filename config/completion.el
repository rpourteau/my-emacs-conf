;;; completion.el --- Global completion except for VHDL -*- lexical-binding: t; -*-

(use-package company
  :straight t
  :hook ((prog-mode . company-mode)
         (text-mode . company-mode))
  :init
  ;; Disable company-mode in VHDL-mode to avoid conflicts
  (defun my/disable-company-in-vhdl ()
    (company-mode -1))
  (add-hook 'vhdl-mode-hook #'my/disable-company-in-vhdl)

  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t))
