(remove-hook 'ruby-mode-hook #'+ruby|init-robe)
(remove-hook 'ruby-mode-hook #'+ruby-init-robe-mode-maybe-h)

(use-package! slim-mode
  :defer t)

(defun pp/rspec-stop-spec ()
  "Kills rspec or compilation buffers"
  (interactive)
  (kill-buffer "*rspec-compilation*"))

(setq rspec-use-spring-when-possible t)

(setq flycheck-command-wrapper-function
      (lambda (command)
        (if (string-suffix-p "rubocop" (car command))
            (append '("bundle" "exec") command)
          command)))

(after! flycheck
  (setq-default flycheck-disabled-checkers '(ruby-reek))
)
