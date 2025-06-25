;;**********************************************************************
;; markdown.el -- Configuration for Markdown
;;**********************************************************************
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :custom
  (markdown-command "pandoc") ; You can adjust this if you use another converter
  (markdown-fontify-code-blocks-natively t)
  (markdown-enable-math t)
  (markdown-hide-urls t)
  :hook (markdown-mode . visual-line-mode))

(use-package grip-mode
  :ensure t
  :after markdown-mode
  :init
  ;; Set this if you want GitHub preview support
  ;; (setq grip-github-user "your-username")
  ;; (setq grip-github-password "your-token") ; or use auth-source
  :commands grip-mode
  :config
  (setq grip-update-after-change nil))

(use-package markdown-toc
  :ensure t
  :after markdown-mode)
