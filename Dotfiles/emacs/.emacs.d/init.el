;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defconst IS-TERMINAL (eq window-system nil))

;; (when (and IS-MAC (not IS-TERMINAL))
;;   (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;;   (add-to-list 'default-frame-alist '(ns-appearance . dark))
;;   (setq ns-use-proxy-icon nil)
;;   (setq frame-title-format nil))

;; used to remove anoying modes from the status bar
(use-package diminish
  :straight t)

;; too lazy to configure files
(use-package no-littering
  :straight t)

;; manage keybindings
(use-package general
  :straight t
  :config 
  (general-evil-setup)
  (general-auto-unbind-keys)
  (general-create-definer smsl/leader :prefix "`"))

;; for shell utilities
(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-initialize))

;; flymake config
(defvar smsl/flymake-map (make-sparse-keymap)
  "flymake map")

(smsl/leader :states 'normal :jump t
  "f" '(:keymap smsl/flymake-map :which-key "flymake"))

;; todo look into general again and why I need an sparse map
(use-package flymake
  :straight t
  :general
  (:keymaps 'smsl/flymake-map
     "m" '(flymake-show-buffer-diagnostics :whick-key "diagnostics")))

;; evil
(use-package evil
  :straight t
  :custom
  (evil-auto-indent nil)
  (evil-want-C-u-scroll t)
  (evil-want-integration t)
  (evil-want-keybinding nil)
  (evil-shift-width 2)
  (evil-emacs-state-modes nil)
  (evil-insert-state-modes nil)
  (evil-motion-state-modes nil)

  (evil-normal-state-cursor 'box)
  (evil-insert-state-cursor 'box)
  (evil-visual-state-cursor 'box)

  (evil-symbol-word-search t)
  (evil-mode-line-format 'nil)
  (evil-ex-search-vim-style-regexp t)

  :config 
  (evil-mode 1))

(use-package evil-collection
  :straight t
  :after evil
  :diminish evil-collection-unimpaired-mode
  :custom 
  (evil-collection-setup-minibuffer t)
  :config (evil-collection-init))

;; theme
(use-package doom-themes
  :straight t
  :if t
  :init (load-theme 'doom-gruvbox t)
  :config (doom-themes-org-config))

;; nice contrants between buffers
(use-package solaire-mode
  :straight t
  :config 
  (solaire-global-mode +1))


(use-package spaceline
  :straight t
  :config 
  (spaceline-spacemacs-theme)
  (spaceline-toggle-evil-state-off))

;; magit
(use-package magit
  :straight t
  :defer t
  :custom (magit-define-global-key-bindings nil)
  :general

  (:keymaps 'transient-base-map 
     "<escape>" 'transient-quit-one)

  (general-unbind :states 'normal :keymaps 'magit-status-mode-map 
    "<escape>")

  (smsl/leader :states 'normal 
    "g" '(magit-status :which-key "git")))

;; projectile setup
(use-package projectile
  :straight t
  :diminish projectile-mode
  :custom (projectile-project-search-path '("~/code/"))
  :init (projectile-mode +1)
  :general 
  (smsl/leader :states 'normal 
    "p" '(:keymap projectile-command-map 
          :package projectile 
          :which-key "projectile"))
 
  ([remap evil-jump-to-tag] #'projectile-find-tag
   [remap find-tag]         #'projectile-find-tag)

  (general-unbind :keymaps 'projectile-command-map 
    "ESC"))

;; treemacs setup
(use-package treemacs
  :straight t
)

(use-package vertico
  :straight t
  :diminish vertico-mode
  :general
  :init (vertico-mode))

(use-package marginalia
  :straight t
  :diminish marginalia-mode
  :init (marginalia-mode)
  :config
  (setq marginalia-command-categories
          (append '((projectile-find-file . project-file)
                    (projectile-find-dir . project-file)
                    (projectile-switch-project . file))
                  marginalia-command-categories)))

(use-package consult
  :straight t
  :diminish consult-mode
  :custom
  (completion-in-region-function #'consult-completion-in-region)
  (consult-project-root-function #'projectile-project-root)
  :general

  ([remap projectile-grep]               #'consult-git-grep
   [remap apropos]                       #'consult-apropos
   [remap bookmark-jump]                 #'consult-bookmark
   [remap evil-show-marks]               #'consult-mark
   [remap goto-line]                     #'consult-goto-line
   [remap imenu]                         #'consult-imenu
   [remap locate]                        #'consult-locate
   [remap load-theme]                    #'consult-theme
   [remap man]                           #'consult-man
   [remap recentf-open-files]            #'consult-recent-file
   [remap switch-to-buffer]              #'consult-buffer
   [remap switch-to-buffer-other-window] #'consult-buffer-other-window
   [remap switch-to-buffer-other-frame]  #'consult-buffer-other-frame
   [remap yank-pop]                      #'consult-yank-pop))

(use-package orderless
  :straight t
  :custom

  (orderless-matching-styles 
    '(orderless-literal
      orderless-flex
      orderless-regexp))

  (completion-styles '(orderless)))

;; corfu doesn't let me remap M-n and M-p to C-n and C-p
(use-package company
  :straight t
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :general
  (:keymaps 'company-active-map
   "C-w" 'nil
   "C-n" 'company-select-next
   "C-p" 'company-select-previous
   "C-u" 'company-previous-page
   "C-d" 'company-next-page)

  (:keymaps 'company-search-map
   "C-w" 'nil
   "C-n" 'company-select-next-or-abort
   "C-p" 'company-select-previous-or-abort
   "C-u" 'company-previous-page-or-abort
   "C-d" 'company-next-page-or-abort
   "ESC" 'company-search-abort))

(use-package which-key
  :straight t
  :diminish which-key-mode
  :custom (which-key-idle-delay 0.5)
  :config (which-key-mode))

;; lsp
(defvar smsl/lsp-map (make-sparse-keymap)
  "lsp map")

(smsl/leader :states 'normal :jump t
  "l" '(:keymap smsl/lsp-map :which-key "lsp"))

(use-package eglot
  :straight t
  :general
  (:keymaps 'smsl/lsp-map
    "r" '(eglot-rename :which-key "rename"))

  (:keymaps 'smsl/lsp-map :prefix "w"
    ""  '(nil :which-key "workspace")
    "r" '(eglot-reconnect :which-key "reconnect")
    "s" '(eglot-start :which-key "restart"))

  (:keymaps 'smsl/lsp-map :prefix "g"
    ""  '(nil :which-key "go")
    "d" '(eglot-find-declaration :which-key "definitions")
    "r" '(xref-find-references :which-key "references")
    "i" '(eglot-find-implementation :which-key "implementation"))

  (:keymaps 'smsl/lsp-map :prefix "="
    ""  '(nil :which-key "format")
    "b" '(eglot-format-buffer :which-key "buffer"))

  :config 
  (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
  (add-to-list 'eglot-server-programs '(python-mode . ("pyls"))))

(use-package org
  :straight t
  :config
  (org-babel-do-load-languages
    'org-babel-load-languages '((python . t) (C . t)))

  (if (eq system-type 'darwin)
    (setq org-babel-python-command "python3")))

;; disable accidental mouse interactions
(use-package disable-mouse
  :straight t
  :diminish disable-mouse-global-mode
  :config (global-disable-mouse-mode))

;; C, C++
(use-package cc-mode
  :straight nil
  :hook 
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  ;; behave like vim when jumping with w
  (c-mode . (lambda () (modify-syntax-entry ?_ "w"))) 
  (c++-mode . (lambda () (modify-syntax-entry ?_ "w"))))


;; Python
(defun smsl/python-mode-activate-hook ()
  "Handles python mode by loading the env dir and then lsp-deferred."
  (let* ((d (projectile-ensure-project (projectile-project-root)))
         (e (concat d "env")))
    (pyvenv-activate e)
    (eglot-ensure)))

(use-package python
  :straight nil
  :custom (python-shell-interpreter "python3")
  :hook 
  (python-mode . smsl/python-mode-activate-hook)
  (python-mode . (lambda () (modify-syntax-entry ?_ "w"))))
  
(use-package pyvenv
  :straight (pyvenv
              :type git
              :host github
              :repo "jorgenschaefer/pyvenv")
  :diminish pyvenv-mode)

(use-package glsl-mode
  :straight t)

(use-package cmake-mode
  :straight t)

;; https://emacs.stackexchange.com/questions/5939/how-to-disable-auto-indentation-of-new-lines
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))


;; reenable garbage collection
(add-hook 'emacs-startup-hook
  (lambda () (setq gc-cons-threshold  33554432 ; 32mb
              gc-cons-percentage 0.1)))
