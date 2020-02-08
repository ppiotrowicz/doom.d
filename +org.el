(setq org-agenda-files '("~/org/todo.org"
                         "~/org/firma.org"
                         "~/org/emacs.org"
                         "~/org/praca.org"))

(after! org (setq org-refile-targets '((nil :maxlevel . 3)
                                       ("~/org/todo.org" :maxlevel . 1)
                                       ("~/org/firma.org" :maxlevel . 1)
                                       ("~/org/praca.org" :maxlevel . 1)
                                       ("~/org/emacs.org" :maxlevel . 2)
                                       ("~/org/reading.org" :maxlevel . 1))))


(after! org (setq org-capture-templates '(("t" "Personal todo" entry
                                           (file+headline "~/org/inbox.org" "INBOX")
                                           "* TODO %?\n%i" :prepend t)
                                          ("T" "Personal todo with link" entry
                                           (file+headline "~/org/inbox.org" "INBOX")
                                           "* TODO %?\n%i\n%a" :prepend t)
                                          ("l" "Today I learned" entry
                                           (file+headline "~/org/til.org" "Today I learned")
                                           "* %u %?\n%i" :prepend t)
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
(setq org-ellipsis " ▾ ")
(setq ;;org-bullets-bullet-list '("●"))
      org-bullets-bullet-list '("☰"))
(setq org-log-into-drawer t)

(setq org-super-agenda-header-map (make-sparse-keymap))

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
    (org-agenda nil "a")
    (org-agenda-day-view)))

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

(defun pp/agenda-emacs ()
  "Shows agenda for emacs stuff"
  (interactive)
  (let* ((org-agenda-files '("~/org/emacs.org"))
         (org-super-agenda-groups '((:discard (:not (:file-path "emacs.org")))
                                   (:name "Important"
                                          :priority "A")
                                   (:name "Other"
                                          :todo "TODO"))))
    (org-todo-list)))

(defun pp/org-agenda-next-header ()
  "Jump to the next header in an agenda series."
  (interactive)
  (pp/org-agenda-goto-header))

(defun pp/org-agenda-previous-header ()
  "Jump to the previous header in an agenda series."
  (interactive)
  (pp/org-agenda-goto-header t))

(defun pp/org-agenda-goto-header (&optional backwards)
  "Find the next agenda series header forwards or BACKWARDS."
  (let ((pos (save-excursion
               (goto-char (if backwards
                              (line-beginning-position)
                            (line-end-position)))
               (let* ((find-func (if backwards
                                     'previous-single-property-change
                                   'next-single-property-change))
                      (end-func (if backwards
                                    'max
                                  'min))
                      (all-pos-raw (list (funcall find-func (point) 'org-agenda-structural-header)
                                         (funcall find-func (point) 'org-agenda-date-header)))
                      (all-pos (cl-remove-if-not 'numberp all-pos-raw))
                      (prop-pos (if all-pos (apply end-func all-pos) nil)))
                 prop-pos))))
    (if pos (goto-char pos))
    (if backwards (goto-char (line-beginning-position)))))

(after! org
  (add-to-list 'org-modules 'org-habit t))

(after! org-habit
  (setq
    org-habit-today-glyph ?‖
    org-habit-completed-glyph ?✓
    org-habit-show-habits-only-for-today nil))

(def-package! org-super-agenda
  :after org
  :init
  :config
  (org-super-agenda-mode))
