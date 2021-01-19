;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(setq user-full-name "Pawel Piotrowicz"
      user-mail-address "ppiotrowicz@gmail.com")

(setq auth-sources '("~/.authinfo.gpg"))

(setq doom-font (font-spec :family "Cascadia Code PL" :size 14)
      doom-variable-pitch-font (font-spec :family "Cascadia Code PL"))

;; (setq doom-font (font-spec :family "JetBrains Mono" :size 14)
;;       doom-variable-pitch-font (font-spec :family "JetBrains Mono"))

(setq doom-scratch-buffer-major-mode 'emacs-lisp-mode)

(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(setq display-line-numbers-type nil)
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq projectile-project-search-path '("~/code"))

;; evil
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; magit
(setq magit-inhibit-save-previous-winconf t)

;; deft
(setq deft-directory "~/Dropbox/Notes")
(setq deft-recursive t)

;; dashboard logo
(setq fancy-splash-image "~/.doom.d/logo.png")

(setq js-indent-level 2)

(load! "+defuns")
(load! "+bindings")
(load! "+org")
(load! "+ruby")
(load! "+elixir")
(load! "+ledger")
