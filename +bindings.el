(when (eq system-type 'darwin)
  (mac-auto-operator-composition-mode +1)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

(setq doom-localleader-key ",")

(map!
 ;; global bindings
 (:map general-override-mode-map
   :n "C-h"    #'evil-window-left
   :n "C-j"    #'evil-window-down
   :n "C-k"    #'evil-window-up
   :n "C-l"    #'evil-window-right
   :n "C-s"    #'swiper)

 (:leader
   :desc "vterm here"          :n "!" #'+vterm/toggle
   :desc "neotree find"        :n "t" #'+neotree/find-this-file
   :desc "neotree open"        :n "T" #'+neotree/open
   :desc "search"              :n "/" #'+default/search-project
   :desc "org capture"         :n "x" #'org-capture
   :desc "open scratch buffer" :n "X" #'doom/open-scratch-buffer

   (:desc "agenda" :prefix "a"
     :desc "overview" :n "a" #'pp/agenda-overview
     :desc "reading"  :n "r" #'pp/agenda-reading
     :desc "work"     :n "w" #'pp/agenda-work)

   (:desc "buffers" :prefix "b"
     :desc "switch"         :n "b" #'+ivy/switch-buffer
     :desc "kill buffer"    :n "d" #'kill-this-buffer
     :desc "new buffer"     :n "n" #'evil-buffer-new)

   (:desc "errors" :prefix "e"
     :desc "disable checker" :n "d" #'flycheck-disable-checker
     :desc "list errors"     :n "e" #'flycheck-list-errors
     :desc "toggle mode"     :n "m" #'flycheck-mode
     :desc "next error"      :n "n" #'flycheck-next-error
     :desc "prev error"      :n "p" #'flycheck-previous-error
     :desc "check buffer"    :n "b" #'flycheck-buffer)

   (:desc "git" :prefix "g"
     :desc "status" :n "s" #'magit-status)

   (:desc "project" :prefix "p"
     :desc "switch project" :n "p" #'counsel-projectile-switch-project
     :desc "find file"      :n "f" #'+ivy/projectile-find-file
     :desc "find buffer"    :n "b" #'counsel-projectile-switch-to-buffer
     :desc "tasks"          :n "t" #'magit-todos-list
     :desc "kill"           :n "k" #'projectile-kill-buffers
     :desc "search"         :n "/" #'+default/search-project)

   (:desc "windows" :prefix "w"
     :desc "split -"        :n "s" #'evil-window-split
     :desc "split |"        :n "v" #'evil-window-vsplit
     :desc "close"          :n "c" #'+workspace/close-window-or-workspace
     :desc "balance"        :n "=" #'balance-windows
     :desc "ace window"     :n "w" #'ace-window
     :desc "fullscreen"     :n "f" #'pp/toggle-fullscreen)))

(map! :localleader
      :after rspec-mode
      :prefix "t"
      :map (rspec-verifiable-mode-map rspec-dired-mode-map rspec-mode-map)
      "a" #'rspec-verify-all
      "r" #'rspec-rerun
      :map (rspec-verifiable-mode-map rspec-mode-map)
      "b" #'rspec-verify
      "l" #'rspec-run-last-failed
      "t" #'rspec-verify-single
      "k" #'pp/rspec-stop-spec
      "f" #'rspec-toggle-spec-and-target
      "F" #'rspec-toggle-spec-and-target-find-example)

(map! :after evil-org-agenda
      :map evil-org-agenda-mode-map
      :nm "J" #'pp/org-agenda-next-header
      :nm "K" #'pp/org-agenda-previous-header)

(defun pp/rspec-stop-spec ()
  "Kills rspec or compilation buffers"
  (interactive)
  (kill-buffer "*rspec-compilation*"))
