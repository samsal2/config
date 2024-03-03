;;; early-init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; no garbage collection at startup
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

(defconst IS-MAC      (eq system-type 'darwin))
(defconst IS-LINUX    (eq system-type 'gnu/linux))
(defconst IS-WINDOWS  (memq system-type '(cygwin windows-nt ms-dos)))
(defconst IS-BSD      (or IS-MAC (eq system-type 'berkeley-unix)))

;; no blinking
(blink-cursor-mode -1)

;; no scrollbar
(scroll-bar-mode -1)

;; no toolbar
(tool-bar-mode -1)

;; no tooltip
(tooltip-mode -1)

;; utf-8
(set-language-environment "UTF-8")

;; remove startup message
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

;; don't create backup files
(setq create-lockfiles nil
      make-backup-files nil
      auto-save-default nil)

;; no tabs, 2 spaces
(setq-default indent-tabs-mode nil
              tab-width 2)

;; remove the anoying bell
(setq ring-bell-function 'ignore)

;; initial state
;; (add-to-list 'initial-frame-alist `(width . 79))
;; (add-to-list 'initial-frame-alist `(height . 49))
;; (add-to-list 'initial-frame-alist `(internal-border-width . 3))

;; font
(add-to-list 'initial-frame-alist `(font . "JetBrains Mono NL-14"))

;; only display file
(setq frame-title-format "%b")

;; sane 79 limit
(setq-default fill-column 79)

;; escape should escape
(define-key query-replace-map [escape] 'quit)

;; type y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; required for bootstrap straight.el
(setq package-enable-at-startup nil)
