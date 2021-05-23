;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(setq user-full-name "Pawel Piotrowicz"
      user-mail-address "ppiotrowicz@gmail.com")

(setq auth-sources '("~/.authinfo.gpg"))

(setq doom-font (font-spec :family "M+ 2m" :size 14)
      doom-variable-pitch-font (font-spec :family "M+ 2m"))

(setq doom-scratch-buffer-major-mode 'emacs-lisp-mode)

;; Global settings (defaults)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-themes-neotree-file-icons t)

(doom-themes-visual-bell-config)
(doom-themes-neotree-config)

(setq doom-nord-brighter-modeline t
      doom-nord-region-highlight 'frost)

(setq doom-theme 'doom-nord)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)
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
