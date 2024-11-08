(use-package diminish
  :ensure t)

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-banner-logo-title nil)
  (setq dashboard-center-content t)
  (setq dashboard-display-icons-p t) (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
  :config
  (dashboard-setup-startup-hook))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(use-package vertico
  :ensure t
  ;; :bind (:map vertico-map
  ;;        ("C-j" . vertico-next)
  ;;        ("C-k" . vertico-previous))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)))

(setq completion-in-region-function
      (lambda (&rest args)
        (apply (if vertico-mode
                   #'consult-completion-in-region
                 #'completion--in-region)
               args)))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package magit
  :ensure t)

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

  (define-key help-mode-map (kbd " ") nil)
  (define-key help-mode-map (kbd "SPC") nil)
  ;; set leader key in all states
  (evil-set-leader nil (kbd "C-SPC"))

  ;; set leader key in normal state
  ;; (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader '(normal motion) (kbd "SPC"))

  (evil-define-key '(normal motion) 'global (kbd "<leader>bb") 'switch-to-buffer)
  (evil-define-key '(normal motion) 'global (kbd "<leader>bn") 'next-buffer)
  (evil-define-key '(normal motion) 'global (kbd "<leader>bm") '(view-echo-area-messages))
  (evil-define-key '(normal motion) 'global (kbd "<leader>bp") 'previous-buffer)
  (evil-define-key '(normal motion) 'global (kbd "<leader>bi") 'ibuffer)
  (evil-define-key '(normal motion) 'global (kbd "<leader>bs") 'scratch-buffer)
  (evil-define-key '(normal motion) 'global (kbd "<leader>dd") 'dired)
  (evil-define-key '(normal motion) 'global (kbd "<leader>dj") 'dired-jump)
  (evil-define-key '(normal motion) 'global (kbd "<leader>ee") 'eval-last-sexp)
  (evil-define-key '(normal motion) 'global (kbd "<leader>fb") 'switch-to-buffer)
  (evil-define-key '(normal motion) 'global (kbd "<leader>ff") 'find-file)
  (evil-define-key '(normal motion) 'global (kbd "<leader>fr") 'recentf)
  (evil-define-key '(normal motion) 'global (kbd "<leader>gs") 'magit-status)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hf") 'describe-function)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hk") 'describe-key)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hv") 'describe-variable)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hm") 'describe-mode)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hc") 'describe-command)
  (evil-define-key '(normal motion) 'global (kbd "<leader>ho") 'describe-symbol)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hs") 'describe-symbol)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hP") 'describe-package)
  (evil-define-key '(normal motion) 'global (kbd "<leader>hb") 'describe-bindings)
  (evil-define-key '(normal motion) 'global (kbd "<leader>nf") 'org-roam-node-find)
  (evil-define-key '(normal motion) 'global (kbd "<leader>ng") 'org-roam-graph)
  (evil-define-key '(normal motion) 'global (kbd "<leader>ni") 'org-roam-node-insert)
  (evil-define-key '(normal motion) 'global (kbd "<leader>nc") 'org-roam-capture)
  (evil-define-key '(normal motion) 'global (kbd "<leader>nj") 'org-roam-dailies-capture-today)
  (evil-define-key '(normal motion) 'global (kbd "<leader>od") 'dashboard-open)
  (evil-define-key '(normal motion) 'global (kbd "<leader>oe") 'eshell)
  (evil-define-key '(normal motion) 'global (kbd "<leader>os") 'shell)
  (evil-define-key '(normal motion) 'global (kbd "<leader>rm") 'bookmark-set)
  (evil-define-key '(normal motion) 'global (kbd "<leader>rj") 'bookmark-jump)
  (evil-define-key '(normal motion) 'global (kbd "<leader>rl") 'list-bookmarks)
  (evil-define-key '(normal motion) 'global (kbd "<leader>tl") 'display-line-numbers-mode)
  (evil-define-key '(normal motion) 'global (kbd "<leader>tt") 'modus-themes-toggle)
  (evil-define-key '(normal motion) 'global (kbd "<leader>tr") 'rainbow-mode)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wn") 'evil-window-new)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wq") 'evil-window-delete)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wc") 'evil-window-delete)
  (evil-define-key '(normal motion) 'global (kbd "<leader>ww") 'evil-window-next)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wh") 'evil-window-left)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wj") 'evil-window-down)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wk") 'evil-window-up)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wl") 'evil-window-right)
  (evil-define-key '(normal motion) 'global (kbd "<leader>ws") 'evil-window-split)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wv") 'evil-window-vsplit)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wr") 'evil-window-rotate-downwards)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wgt") 'tab-next)
  (evil-define-key '(normal motion) 'global (kbd "<leader>wgT") 'tab-previous)
  (evil-define-key '(normal motion) 'global (kbd "<leader>.") 'embark-act)

  (evil-define-key 'normal dired-mode-map
    (kbd "h") 'dired-up-directory
    (kbd "l") 'dired-find-file))

(use-package evil-collection
  :after evil
  :diminish evil-collection-unimpaired-mode
  :ensure t
  ;; :bind (("<escape>" . keyboard-escape-quit))
  :custom
  (evil-collection-outline-bind-tab-p t)
  (evil-collection-setup-minibuffer t)
  (evil-collection-which-key-setup t)
  (evil-collection-help-setup nil)
  :config
  (evil-collection-init (remove 'help evil-collection-mode-list))
  )

(recentf-mode 1)
(savehist-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1) ;; emacs
(context-menu-mode 1)
;; (add-to-list 'default-frame-alist
;;              '((vertical-scroll-bars . nil)
;; 	       (background-color . "black"))) ;; emacs-client
(setq ring-bell-function 'ignore)
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t))
      backup-directory-alist
      '(("." "~/.emacs.d/backups/" t)))

(use-package doom-themes
  :ensure t
;;   :config
;;   (load-theme 'doom-rose-pine t)
;;   (set-background-color "black") ;; emacs GUI
;;   ;; (setq default-frame-alist
;;   ;; 	'((background-color . "black")
;;   ;; 	  ))
  ) ;; emacs-client

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package eglot
  :config
  ;; Ensure `nil` is in your PATH.
  (add-to-list 'eglot-server-programs '(nix-mode . ("nixd")))
  :hook
  (python-ts-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (nix-mode . eglot-ensure)
  (org-mode . eglot-ensure))

;; Indent text in =.org= documents according to outline structure.
(add-hook 'org-mode-hook 'org-indent-mode)
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
  '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
  '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))

;; (defalias 'ff 'find-file)
;; (defalias 'clear 'clear 1)
(setq my/eshell-aliases
      '((g  . magit)
	(gl . magit-log)
	(d  . dired)
	(o  . find-file)	
	(oo . find-file-other-window)
	(l  . (lambda () (eshell/ls '-la)))
	(cl . (lambda () (eshell/clear '1)))
	(c  . (lambda () (eshell/clear '1)))))
     
(mapc (lambda (alias)
	(defalias (car alias) (cdr alias)))
      my/eshell-aliases)

(use-package consult
  :ensure t
  ;; Replace bindings. Lazily loaded by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)
)

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
(setq completion-ignore-case t)

(use-package evil-commentary
  :after evil
  :ensure t
  :config
  (evil-commentary-mode 1))

(use-package evil-surround
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))

(setq display-line-numbers-type 'relative)
(dolist (mode '(org-mode-hook
		shell-mode-hook
		term-mode-hook
		vterm-mode-hook
		eshell-mode-hook
		help-mode-hook
		helpful-mode-hook
		dashboard-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
(global-display-line-numbers-mode 1)

(use-package vterm
    :ensure t)

(use-package org-modern
  :ensure t)

(setq org-ellipsis "…")
(setq org-modern-star 'replace)
(setq org-modern-block-fringe 0)
(setq org-modern-block-table 0)
;; (add-hook 'org-mode-hook #'org-modern-mode)

(load-theme 'modus-operandi t)

;;;; Run commands in a popup frame

(defun prot-window-delete-popup-frame (&rest _)
  "Kill selected selected frame if it has parameter `prot-window-popup-frame'.
Use this function via a hook."
  (when (frame-parameter nil 'prot-window-popup-frame)
    (delete-frame)))

(defmacro prot-window-define-with-popup-frame (command)
  "Define interactive function which calls COMMAND in a new frame.
Make the new frame have the `prot-window-popup-frame' parameter."
  `(defun ,(intern (format "prot-window-popup-%s" command)) ()
     ,(format "Run `%s' in a popup frame with `prot-window-popup-frame' parameter.
Also see `prot-window-delete-popup-frame'." command)
     (interactive)
     (let ((frame (make-frame '((prot-window-popup-frame . t)))))
       (select-frame frame)
       (switch-to-buffer " prot-window-hidden-buffer-for-popup-frame")
       (condition-case nil
           (call-interactively ',command)
         ((quit error user-error)
          (delete-frame frame))))))

(declare-function org-capture "org-capture" (&optional goto keys))
(defvar org-capture-after-finalize-hook)

;;;###autoload (autoload 'prot-window-popup-org-capture "prot-window")
(prot-window-define-with-popup-frame org-capture)

(add-hook 'org-capture-after-finalize-hook #'prot-window-delete-popup-frame)

(declare-function tmr "tmr" (time &optional description acknowledgep))
(defvar tmr-timer-created-functions)

;;;###autoload (autoload 'prot-window-popup-tmr "prot-window")
(prot-window-define-with-popup-frame tmr)

(add-hook 'tmr-timer-created-functions #'prot-window-delete-popup-frame)

(declare-function vterm "vterm" (&optional ARG))
(defvar vterm-created-functions)
;;;###autoload (autoload 'prot-window-popup-vterm "prot-window")
(prot-window-define-with-popup-frame vterm)
(add-hook 'vterm-created-functions #'prot-window-delete-popup-frame)
(add-hook 'vterm-exit-functions #'prot-window-delete-popup-frame)

;;;; The emacsclient calls that need ot be bound to system-wide keys

;; emacsclient -e '(prot-window-popup-org-capture)
'
;; emacsclient -e '(prot-window-popup-tmr)'

;; emacsclient -e '(prot-window-popup-vterm)'

;; (modify-all-frames-parameters
;;  '((right-divider-width . 10)
;;    (internal-border-width . 10)))
;; (dolist (face '(window-divider
;;                 window-divider-first-pixel
;;                 window-divider-last-pixel))
;;   (face-spec-reset-face face)
;;   (set-face-foreground face (face-attribute 'default :background)))
;; (set-face-background 'fringe (face-attribute 'default :background))

;; (set-face-attribute 'mode-line nil :foreground "#000000" :background "#c8c8c8" :box "#5a5a5a")
;; (set-face-attribute 'mode-line nil :foreground "black" :background "white" :box "#5a5a5a")
;; (set-face-attribute 'mode-line-inactive nil :foreground "#585858" :background "#e6e6e6" :box "#a3a3a3")


(use-package atomic-chrome
  :ensure t
  :config
  (atomic-chrome-start-server))

(use-package rainbow-mode
  :ensure t)

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         :map minibuffer-local-map
         ("C-c C-c" . embark-collect)
         ("C-c C-e" . embark-export)))

;; The `embark-consult' package is glue code to tie together `embark'
;; and `consult'.
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package orb-babel
  :no-require
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python     . t)
     (shell      . t)
     (ein        . t)))
  (setq org-confirm-babel-evaluate nil))

;; (advice-add 'org-babel-eval :around #'envrc-propagate-environment)


(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org-roam")
  (org-roam-completion-everywhere t)
  :bind (("C-c n [[id:c26e4dbf-7493-4818-bf8f-aedd954f0cc2][emacs Completions]]l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n g" . org-roam-graph)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ;; Dailies
	 ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(setq org-hide-emphasis-markers t)

(use-package pandoc-mode
  :ensure t
  :mode "\\.epub\\'"
  :config
  (add-hook 'pandoc-mode-hook 'pandoc-load-default-settings))

(setq dired-auto-revert-buffer t)

;; Must be loaded last or near the end (I think that the hook takes care of it)
(use-package ein
  :ensure t)

;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      ;; python-shell-prompt-detect-failure-warning nil
      )

;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")

;; (use-package helpful
;;   :ensure t
;;   :config
;;   (defalias 'describe-key 'helpful-key)
;;   (defalias 'describe-function 'helpful-callable)
;;   (defalias 'describe-variable 'helpful-variable)
;;   (defalias 'describe-symbol 'helpful-symbol))

(use-package python-black
  :ensure t
  :after python
  :hook (python-ts-mode . python-black-on-save-mode-enable-dwim))

(use-package toc-org
  :ensure t
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(defun d/org-babel-edit ()
  "Edit any src block with lsp support by tangling the block and
then setting the org-edit-special buffer-file-name to the
absolute path. Finally load eglot."
  (interactive)

  ;; org-babel-get-src-block-info returns lang, code_src, and header
  ;; params; Use nth 2 to get the params and then retrieve the :tangle
  ;; to get the filename
  (setq d/tangled-file-name (expand-file-name (assoc-default :tangle (nth 2 (org-babel-get-src-block-info)))))

  ;; tangle the src block at point
  (org-babel-tangle '(4))
  (org-edit-special)

  ;; Now we should be in the special edit buffer with python-mode. Set
  ;; the buffer-file-name to the tangled file so that pylsp and
  ;; plugins can see an actual file.
  (setq-local buffer-file-name d/tangled-file-name)
  (eglot-ensure)
  )


;; (setq org-edit-src-content-indentation 2)

(setq eldoc-echo-area-use-multiline-p 1)
(setq echo-keystrokes 0.01)
(setq show-paren-delay 0.01)
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Fontaine (font configurations)
;; Read the manual: <https://protesilaos.com/emacs/fontaine>
(use-package fontaine
  :ensure t
  ;; :if (display-graphic-p)
  :hook
  ;; Persist the latest font preset when closing/starting Emacs and
  ;; while switching between themes.
  ((after-init . fontaine-mode)
   (after-init . (lambda ()
                   ;; Set last preset or fall back to desired style from `fontaine-presets'.
                   (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))))
   (server-after-make-frame-hook . fontaine-mode)
   (server-after-make-frame-hook . (lambda ()
		   ;; Same for Emacs (Client)
                   (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular)))))
  :bind (("C-c f" . fontaine-set-preset)
         ("C-c F" . fontaine-toggle-preset))
  :config
  ;; This is defined in Emacs C code: it belongs to font settings.
  (setq x-underline-at-descent-line nil)

  ;; And this is for Emacs28.
  (setq-default text-scale-remap-header-line t)

  ;; This is the default value.  Just including it here for
  ;; completeness.
  (setq fontaine-latest-state-file (locate-user-emacs-file "fontaine-latest-state.eld"))

  (setq fontaine-presets
        '((small
           :default-height 80)
          (regular) ; like this it uses all the fallback values and is named `regular'
          (medium
           :default-weight semilight
           :default-height 115
           :bold-weight extrabold)
          (large
           :inherit medium
           :default-height 150)
          (live-stream
           :default-family "Iosevka Comfy Wide Motion"
           :default-height 150
           :default-weight medium
           :fixed-pitch-family "Iosevka Comfy Wide Motion"
           :variable-pitch-family "Iosevka Comfy Wide Duo"
           :bold-weight extrabold)
          (presentation
           :default-height 180)
          (jumbo
           :default-height 260)
          (t
           ;; I keep all properties for didactic purposes, but most can be
           ;; omitted.  See the fontaine manual for the technicalities:
           ;; <https://protesilaos.com/emacs/fontaine>.
           :default-family "Iosevka Comfy"
           :default-weight regular
           :default-slant normal
           :default-width normal
           :default-height 100

           :fixed-pitch-family "Iosevka Comfy"
           :fixed-pitch-weight nil
           :fixed-pitch-slant nil
           :fixed-pitch-width nil
           :fixed-pitch-height 1.0

           :fixed-pitch-serif-family nil
           :fixed-pitch-serif-weight nil
           :fixed-pitch-serif-slant nil
           :fixed-pitch-serif-width nil
           :fixed-pitch-serif-height 1.0

           :variable-pitch-family "Iosevka Comfy Motion Duo"
           :variable-pitch-weight nil
           :variable-pitch-slant nil
           :variable-pitch-width nil
           :variable-pitch-height 1.0

           :mode-line-active-family nil
           :mode-line-active-weight nil
           :mode-line-active-slant nil
           :mode-line-active-width nil
           :mode-line-active-height 1.0

           :mode-line-inactive-family nil
           :mode-line-inactive-weight nil
           :mode-line-inactive-slant nil
           :mode-line-inactive-width nil
           :mode-line-inactive-height 1.0

           :header-line-family nil
           :header-line-weight nil
           :header-line-slant nil
           :header-line-width nil
           :header-line-height 1.0

           :line-number-family nil
           :line-number-weight nil
           :line-number-slant nil
           :line-number-width nil
           :line-number-height 1.0

           :tab-bar-family nil
           :tab-bar-weight nil
           :tab-bar-slant nil
           :tab-bar-width nil
           :tab-bar-height 1.0

           :tab-line-family nil
           :tab-line-weight nil
           :tab-line-slant nil
           :tab-line-width nil
           :tab-line-height 1.0

           :bold-family nil
           :bold-slant nil
           :bold-weight bold
           :bold-width nil
           :bold-height 1.0

           :italic-family nil
           :italic-weight nil
           :italic-slant italic
           :italic-width nil
           :italic-height 1.0

           :line-spacing nil)))

  ;; (with-eval-after-load 'pulsar
  ;;   (add-hook 'fontaine-set-preset-hook #'pulsar-pulse-line))
  )

;; https://gist.github.com/ram535/a2153fb86f33ecec587d593c1c5e1623
;; (use-package vterm
;;   :ensure t
;;   :config
;;   (defun get-full-list ()
;;     (let ((program-list (split-string (shell-command-to-string "compgen -c") "\n" t ))
;;           (file-directory-list (split-string (shell-command-to-string "compgen -f") "\n" t ))
;;           (history-list (with-temp-buffer
;;                           (insert-file-contents "~/.bash_history")
;;                           (split-string (buffer-string) "\n" t))))

;;       (delete-dups (append program-list file-directory-list history-list))))

;;   (defun vterm-completion-choose-item ()
;;     (completing-read "Choose: " (get-full-list) nil nil (thing-at-point 'word 'no-properties)))

;;   (defun vterm-completion ()
;;     (interactive)
;;     (vterm-directory-sync)
;;     (let ((vterm-chosen-item (vterm-completion-choose-item)))
;;       (when (thing-at-point 'word)
;;         (vterm-send-meta-backspace))
;;       (vterm-send-string vterm-chosen-item)))
             
;;   (defun vterm-directory-sync ()
;;   "Synchronize current working directory."
;;   (interactive)
;;   (when vterm--process
;;     (let* ((pid (process-id vterm--process))
;;            (dir (file-truename (format "/proc/%d/cwd/" pid))))
;;       (setq default-directory dir))))
;;   :bind (:map vterm-mode-map ("<tab>" . 'vterm-completion)))

(use-package reformatter
  ;; :hook
  ;; (python-ts-mode . pyblack-format-on-save-mode)
  ;; (nix-mode . alejandra-format-on-save-mode)
  ;; (nix-ts-mode . nixfmt-rfc-format-on-save-mode)
  :config
  (reformatter-define pyblack-format :program "python"
    :args (list "-m" "black" "-"))
  (reformatter-define alejandra-format :program "alejandra" :group 'nix-mode)
  ;; (reformatter-define nixfmt-rfc :program "nixfmt")
  )

(setq org-agenda-files
      '("~/org/agenda/emacs.org"))

(use-package adwaita-dark-theme
  :ensure t)

(use-package borland-blue-theme
  :ensure t)

;; Emoji
;; https://www.masteringemacs.org/article/inserting-emoji-input-methods

(use-package spacious-padding
  :ensure t
  :config
  (spacious-padding-mode t))

(use-package eat
  :ensure t)

(use-package rainbow-delimiters
  :ensure t)

(use-package envrc
  :ensure t
  :hook (after-init . envrc-global-mode)
  :config
  (advice-add 'org-babel-eval :around #'envrc-propagate-environment))
