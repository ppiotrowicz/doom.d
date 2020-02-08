(remove-hook 'enh-ruby-mode-hook #'+ruby|init-robe)

(use-package! slim-mode
  :defer t)

(defun pp/rspec-stop-spec ()
  "Kills rspec or compilation buffers"
  (interactive)
  (kill-buffer "*rspec-compilation*"))
