(setq org-agenda-files '("~/org/todo.org"))

(after! org (setq org-refile-targets '((nil :maxlevel . 3)
                                       ("~/org/todo.org" :maxlevel . 4))))

(after! org (setq org-capture-templates '(("t" "Personal todo" entry
                                           (file+headline "~/org/todo.org" "INBOX")
                                           "* [ ] %?\n%i" :prepend t)
                                          ("T" "Personal todo with link" entry
                                           (file+headline "~/org/todo.org" "INBOX")
                                           "* [ ] %?\n%i%a" :prepend t)
                                          ("l" "Today I learned" entry
                                           (file+headline "~/org/til.org" "Today I learned")
                                           "* %u %?\n%i" :prepend t)
                                          ("n" "Personal notes" entry
                                           (file+headline +org-capture-notes-file "INBOX")
                                           "* %u %?\n%i\n%a" :prepend t)
                                          ("p" "Project-local todo" entry
                                           (file+headline +org-capture-project-todo-file "Inbox")
                                           "* [ ]  %?\n%i\n%a" :prepend t))))


(after! org (setq org-todo-keywords '((sequence "[ ](t)" "[-](s)" "[?](w)" "|" "[X](d)")
                                      (sequence "TODO(T)" "NEXT(N)" "WAIT(W)" "|" "DONE(D)" "CANCELLED(C)"))))

(setq org-log-done 'time)
(setq org-log-redeadline 'time)
(setq org-log-reschedule 'time)
(setq org-ellipsis " ▾ ")
(setq org-bullets-bullet-list '("☰"))
(setq org-log-into-drawer t)
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-tags-column 80)

(after! org
  (setq org-agenda-prefix-format
        '((agenda . " %i %-15:c%?-12t% s")
          (todo . " %i %-15:c")
          (tags . " %i %-15:c")
          (search . " %i %-15:c"))))

(setq org-super-agenda-header-map (make-sparse-keymap))

(defun pp/agenda-overview ()
  "Shows agenda view with all kinds of tasks"
  (interactive)
  (let ((org-super-agenda-groups `((:discard (:tag "work"))
                                   (:discard (:todo "[X]"))
                                   (:name "Due today"
                                          :scheduled today
                                          :scheduled past
                                          :deadline today)
                                   (:name "Important"
                                          :priority "A")
                                   (:name "Overdue"
                                          :deadline past)
                                   (:name "This week"
                                          :deadline (before ,(org-read-date nil nil "+7")))
                                   (:discard (:anything t)))))
    (org-agenda nil "a")
    (org-agenda-day-view)))

(defun pp/agenda-work ()
  "Shows agenda view with work tasks for this week"
  (interactive)
  (let ((org-agenda-skip-scheduled-if-done t)
        (org-agenda-skip-deadline-if-done t)
        (org-super-agenda-groups `((:discard (:not (:tag "work")))
                                   (:name "Done today"
                                          :order 1
                                          :log t)
                                   (:name "Today"
                                          :scheduled past
                                          :scheduled today)
                                   (:name "This week"
                                          :deadline (before ,(org-read-date nil nil "+sun")))
                                   (:discard (:anything t)))))
    (org-agenda nil "a")
    (org-agenda-day-view)))

(defun pp/todo-today ()
  "Shows all tasks scheduled for today"
  (interactive)
  (let ((org-super-agenda-groups `((:name "Done"
                                          :order 1
                                          :and (:date today :todo "[X]"))
                                   (:name "Today"
                                          :scheduled past
                                          :scheduled today)
                                   (:name "Overdue"
                                          :deadline past)
                                   (:discard (:anything t)))))
    (org-agenda nil "a")
    (org-agenda-day-view)))

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

(defun org-get-local-archive-location ()
  "Get the archive location applicable at point."
  (let ((re "^[ \t]*#\\+ARCHIVE:[ \t]+\\(\\S-.*\\S-\\)[ \t]*$")
    prop)
    (save-excursion
      (save-restriction
    (widen)
    (setq prop (org-entry-get nil "ARCHIVE" 'inherit))
    (cond
     ((and prop (string-match "\\S-" prop))
      prop)
     ((or (re-search-backward re nil t)
          (re-search-forward re nil t))
      (match-string 1))
     (t org-archive-location))))))

(defun org-extract-archive-file (&optional location)
  "Extract and expand the file name from archive LOCATION.
if LOCATION is not given, the value of `org-archive-location' is used."
  (setq location (or location org-archive-location))
  (if (string-match "\\(.*\\)::\\(.*\\)" location)
      (if (= (match-beginning 1) (match-end 1))
      (buffer-file-name (buffer-base-buffer))
    (expand-file-name
     (format (match-string 1 location)
         (file-name-nondirectory
          (buffer-file-name (buffer-base-buffer))))))))

(defun org-extract-archive-heading (&optional location)
  "Extract the heading from archive LOCATION.
if LOCATION is not given, the value of `org-archive-location' is used."
  (setq location (or location org-archive-location))
  (if (string-match "\\(.*\\)::\\(.*\\)" location)
      (format (match-string 2 location)
          (file-name-nondirectory
           (buffer-file-name (buffer-base-buffer))))))

(defadvice org-archive-subtree (around fix-hierarchy activate)
  (let* ((fix-archive-p (and (not current-prefix-arg)
                             (not (use-region-p))))
         (afile (org-extract-archive-file (org-get-local-archive-location)))
         (buffer (or (find-buffer-visiting afile) (find-file-noselect afile))))
    ad-do-it
    (when fix-archive-p
      (with-current-buffer buffer
        (goto-char (point-max))
        (while (org-up-heading-safe))
        (let* ((olpath (org-entry-get (point) "ARCHIVE_OLPATH"))
               (path (and olpath (split-string olpath "/")))
               (level 1)
               tree-text)
          (when olpath
            (org-mark-subtree)
            (setq tree-text (buffer-substring (region-beginning) (region-end)))
            (let (this-command) (org-cut-subtree))
            (goto-char (point-min))
            (save-restriction
              (widen)
              (-each path
                (lambda (heading)
                  (if (re-search-forward
                       (rx-to-string
                        `(: bol (repeat ,level "*") (1+ " ") ,heading)) nil t)
                      (org-narrow-to-subtree)
                    (goto-char (point-max))
                    (unless (looking-at "^")
                      (insert "\n"))
                    (insert (make-string level ?*)
                            " "
                            heading
                            "\n"))
                  (cl-incf level)))
              (widen)
              (org-end-of-subtree t t)
              (org-paste-subtree level tree-text))))))))

(after! org
  (add-to-list 'org-modules 'org-habit t))

(after! org-habit
  (setq
    org-habit-today-glyph ?‖
    org-habit-completed-glyph ?✓
    org-habit-show-habits-only-for-today nil))

(use-package! org-super-agenda
  :after org
  :init
  :config
  (org-super-agenda-mode))

;; customize org-colors
(after! org
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces!
      `(org-column-title :background ,bg)
      `(org-column :background ,bg))))
