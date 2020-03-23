(remove-hook 'ruby-mode-hook #'+ruby|init-robe)
(remove-hook 'ruby-mode-hook #'+ruby-init-robe-mode-maybe-h)

(use-package! slim-mode
  :defer t)

(defun pp/rspec-stop-spec ()
  "Kills rspec or compilation buffers"
  (interactive)
  (kill-buffer "*rspec-compilation*"))

(setq rspec-use-spring-when-possible t)
