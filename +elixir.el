(use-package! exunit
  :after elixir-mode
  :hook (elixir-mode . exunit-mode)
  :commands (exunit-verify-all
             exunit-rerun
             exunit-verify
             exunit-verify-single
             exunit-toggle-file-and-test
             exunit-toggle-file-and-test-other-window))
