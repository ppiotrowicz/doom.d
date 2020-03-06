(defun pp/toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullscreen)))

(defun narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or defun,
whichever applies first. Narrowing to org-src-block actually
calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning)
                           (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing
         ;; command. Remove this first conditional if
         ;; you don't want it.
         (cond ((ignore-errors (org-edit-src-code) t)
                (delete-other-windows))
               ((ignore-errors (org-narrow-to-block) t))
               (t (org-narrow-to-subtree))))
        ((derived-mode-p 'latex-mode)
         (LaTeX-narrow-to-environment))
        (t (narrow-to-defun))))

(defun now ()
  "Insert string for the current time formatted like '2:34 PM'."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%d/%m/%Y %H:%M")))


;;;###autoload
(defun +pp/vterm/here ()
  "Open a terminal buffer in the current window at project root.

If prefix ARG is non-nil, cd into `default-directory' instead of project root."
  (interactive)
  (unless (fboundp 'module-load)
    (user-error "Your build of Emacs lacks dynamic modules support and cannot load vterm"))
  (require 'vterm)
  ;; This hack forces vterm to redraw, fixing strange artefacting in the tty.
  (save-window-excursion
    (pop-to-buffer "*scratch*"))
  (let ((default-directory
          (or (doom-project-root) default-directory)))
    (vterm)))


;;;###autoload
(defun pp/vterm-toggle ()
  "Toggles a terminal popup window at project root.

If prefix ARG is non-nil, recreate vterm buffer in the current project's root."
  (interactive)
  (unless (fboundp 'module-load)
    (user-error "Your build of Emacs lacks dynamic modules support and cannot load vterm"))
  (let ((buffer-name
         (format "*doom:vterm-popup:%s*"
                 (if (bound-and-true-p persp-mode)
                     (safe-persp-name (get-current-persp))
                   "main")))
        confirm-kill-processes
        current-prefix-arg)
    (if-let (win (get-buffer-window buffer-name))
        (if (eq (selected-window) win)
            (delete-window win)
          (select-window win)
          (when (bound-and-true-p evil-local-mode)
            (evil-change-to-initial-state))
          (goto-char (point-max)))
      (require 'vterm)
      (let* ((default-directory (or (doom-project-root) default-directory))
             (buffer (get-buffer-create buffer-name)))
        (with-current-buffer buffer
          (doom-mark-buffer-as-real-h)
          (unless (eq major-mode 'vterm-mode)
            (vterm-mode)))
        (pop-to-buffer buffer)))))

(defun pp/neotree/find-this-file ()
  "Wraps +neotree/find-this-file and toggles neotree"
  (interactive)
  (require 'neotree)
  (if (neo-global--window-exists-p)
      (neotree-hide)
    (+neotree/find-this-file)))
