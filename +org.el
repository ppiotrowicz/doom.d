(setq org-agenda-files '("~/org/todo.org"
                         "~/org/firma.org"
                         "~/org/emacs.org"
                         "~/org/praca.org"))

(after! org (setq org-refile-targets '((nil :maxlevel . 3)
                                       ("~/org/todo.org" :maxlevel . 1)
                                       ("~/org/firma.org" :maxlevel . 1)
                                       ("~/org/praca.org" :maxlevel . 1)
                                       ("~/org/emacs.org" :maxlevel . 2))))


(after! org (setq org-capture-templates '(("t" "Personal todo" entry
                                           (file+headline "~/org/inbox.org" "INBOX")
                                           "* TODO %?\n%i" :prepend t)
                                          ("T" "Personal todo with link" entry
                                           (file+headline "~/org/inbox.org" "INBOX")
                                           "* TODO %?\n%i\n%a" :prepend t)
                                          ("n" "Personal notes" entry
                                           (file+headline +org-capture-notes-file "INBOX")
                                           "* %u %?\n%i\n%a" :prepend t)
                                          ("p" "Project-local todo" entry
                                           (file+headline +org-capture-project-todo-file "Inbox")
                                           "* TODO %?\n%i\n%a" :prepend t))))


(after! org (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")
                                      (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)"))))

(setq org-log-done 'time)
(setq org-log-redeadline 'time)
(setq org-log-reschedule 'time)

(defun pp/agenda-overview ()
  "Shows agenda view with all kinds of tasks"
  (interactive)
  (let ((org-super-agenda-groups '((:name "Today"
                                          :time-grid t
                                          :scheduled today)
                                   (:name "Due today"
                                          :deadline today)
                                   (:name "Important"
                                          :priority "A")
                                   (:name "Overdue"
                                          :deadline past)
                                   (:name "Due soon"
                                          :deadline future)
                                   (:name "Waiting"
                                          :todo "WAIT"))))
    (org-agenda nil "a")))

(defun pp/agenda-work ()
  "Shows agenda for work stuff"
  (interactive)
  (let ((org-super-agenda-groups '(
                                   (:discard (:not (:file-path "praca.org")))
                                   (:name "Today"
                                          :time-grid t
                                          :scheduled today)
                                   (:name "Due today"
                                          :deadline today)
                                   (:name "Important"
                                          :priority "A")
                                   (:name "Overdue"
                                          :deadline past)
                                   (:name "Due soon"
                                          :deadline future)
                                   (:name "Waiting"
                                          :todo "WAIT"))))
    (org-agenda nil "a")
    (org-agenda-day-view)))

(defun pp/agenda-reading ()
  "Shows agenda for reading stuff"
  (interactive)
  (let* ((org-agenda-files '("~/org/reading.org"))
         (org-super-agenda-groups '((:discard (:not (:file-path "reading.org")))
                                   (:name "Important"
                                          :priority "A")
                                   (:name "Other"
                                          :todo "TODO"))))
    (org-todo-list)))


(def-package! org-super-agenda
  :after org
  :init
  :config
  (org-super-agenda-mode))
