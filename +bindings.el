(when (eq system-type 'darwin)
  (mac-auto-operator-composition-mode +1)
  (setq mac-command-modifier 'meta))

(map!
 ;; global bindings
 (:map general-override-mode-map
   :n "C-h"    #'evil-window-left
   :n "C-j"    #'evil-window-down
   :n "C-k"    #'evil-window-up
   :n "C-l"    #'evil-window-right)

 (:leader
   :desc "vterm here"   :n "!" #'+vterm/toggle
   :desc "neotree find" :n "t" #'+neotree/find-this-file
   :desc "neotree open" :n "T" #'+neotree/open
   :desc "search"       :n "/" #'+default/search-project

   (:desc "buffers" :prefix "b"
     :desc "switch"          :n "b" #'+ivy/switch-buffer
     :desc "kill buffer"     :n "d" #'kill-this-buffer
     :desc "new buffer"      :n "n" #'evil-buffer-new)

   (:desc "project" :prefix "p"
     :desc "switch project" :n "p" #'counsel-projectile-switch-project
     :desc "find file"      :n "f" #'+ivy/projectile-find-file
     :desc "find buffer"    :n "b" #'counsel-projectile-switch-to-buffer
     :desc "tasks"          :n "t" #'magit-todos-list
     :desc "kill"           :n "k" #'projectile-kill-buffers
     :desc "search"         :n "/" #'+default/search-project
     )

   (:desc "windows" :prefix "w"
     :desc "split -"    :n "s" #'evil-window-split
     :desc "split |"    :n "v" #'evil-window-vsplit
     :desc "close"      :n "c" #'+workspace/close-window-or-workspace
     :desc "balance"    :n "=" #'balance-windows
     :desc "ace window" :n "w" #'ace-window
     :desc "fullscreen" :n "f" #'pp/toggle-fullscreen))
 )
