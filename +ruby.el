(remove-hook 'ruby-mode-hook #'+ruby|init-robe)
(remove-hook 'ruby-mode-hook #'+ruby-init-robe-mode-maybe-h)

(use-package! slim-mode
  :defer t)

(defun pp/rspec-stop-spec ()
  "Kills rspec or compilation buffers"
  (interactive)
  (kill-buffer "*rspec-compilation*"))

(setq flycheck-command-wrapper-function
      (lambda (command)
        (if (string-suffix-p "rubocop" (car command))
            (append '("bundle" "exec") command)
          command)))

(after! flycheck
  (setq-default flycheck-disabled-checkers '(ruby-reek))
)

;; Leadsimple settings
(setq rspec-use-docker-when-possible t)
(setq rspec-docker-command "docker-compose run --rm")
(setq rspec-docker-cwd "/www/components/core/")
(setq rspec-docker-file-name "../../docker-compose.yml")
(setq rspec-docker-container "web")



(add-hook! rspec-mode :append (defun pp/override-rspec-functions ()
                            "Overrides rspec docker functions"
                            (defun rspec--docker-default-wrapper (rspec-docker-command rspec-docker-container rspec-docker-cwd command)
                              "Function for wrapping a command for execution inside a dockerized environment. "
                              (format "%s %s sh -c \"cd %s &&  %s\"" rspec-docker-command rspec-docker-container rspec-docker-cwd command))

                            (defun rspec--docker-wrapper (command)
                              (if (rspec-docker-p)
                                  (funcall rspec-docker-wrapper-fn
                                           rspec-docker-command
                                           rspec-docker-container
                                           rspec-docker-cwd
                                           command)
                                command))))
