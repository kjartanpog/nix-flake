(use-package dashboard
  :ensure t
  :init
  (setq dashboard-banner-logo-title nil)
  (setq dashboard-center-content t)
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  :config
  (dashboard-setup-startup-hook))

(set-face-attribute 'default nil
  :font "Hasklug Nerd Font Mono"
  :height 140
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "Hasklug Nerd Font Mono"
  :height 140
  ;; :weight 'medium
  )
(set-face-attribute 'variable-pitch nil
  :font "Inter Display"
  :height 230
  :weight 'medium)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(use-package vertico
  :ensure t
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll 1)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-keybinding nil)
  (setq select-enable-clipboard nil) ; Vim-style clipboard
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC")))

(recentf-mode 1)
(savehist-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-rose-pine t)
  (set-background-color "black"))

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package eglot
  :config
  ;; Ensure `nil` is in your PATH.
  (add-to-list 'eglot-server-programs '(nix-mode . ("nil")))
  :hook
  (nix-mode . eglot-ensure))
