;;**********************************************************************
;; ui.el -- ;; Doom Theme and modeline
;;**********************************************************************

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :custom ((doom-modeline-height 15)))


(use-package all-the-icons
  :ensure t)

(setq doom-modeline-icon t) ;; enable icons in doom-modeline


;; Silence doom-modeline free variable warnings
(defvar toggle-window-dedicated-flag nil)
(defvar mode-line-window-dedicated-keymap nil)
(defun toggle-window-dedicated () (interactive))
