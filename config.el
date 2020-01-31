;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(setq user-full-name "Pawel Piotrowicz"
      user-mail-address "ppiotrowicz@gmail.com")

(setq doom-font (font-spec :family "iosevka" :size 14)
      doom-variable-pitch-font (font-spec :family "iosevka"))

(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(global-hl-line-mode -1)
(setq display-line-numbers-type t)

;; deft
(setq deft-directory "~/Dropbox/Notes")
(setq deft-recursive t)

;; dashboard logo
(setq fancy-splash-image "~/.doom.d/logo.png")

;; Ruby - additional packages
(use-package! slim-mode
  :defer t)

(load! "+defuns")
(load! "+bindings")
(load! "+org")
