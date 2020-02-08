(after! mu4e
  (setq! mu4e-maildir (expand-file-name "~/.email/personal")
         mu4e-use-fancy-chars t
         mu4e-view-show-addresses t
         mu4e-view-show-images t
         mu4e-headers-fields
         '((:account . 15)
           (:human-date . 12)
           (:flags . 6)
           (:from . 25)
           (:subject))
         mu4e-maildir-shortcuts
         '( ("/Inbox" . ?i)
            ("/Drafts" . ?d)
            ("/Trash" . ?t)
            ("/Sent" . ?s))
         ))

(set-email-account! "ppiotrowicz@gmail.com"
                    '((user-mail-address      . "ppiotrowicz@gmail.com")
                      (user-full-name         . "Pawel Piotrowicz")
                      (smtpmail-smtp-server   . "smtp.gmail.com")
                      (smtpmail-smtp-service  . 587)
                      (smtpmail-stream-type   . starttls)
                      (smtpmail-debug-info    . t)
                      (mu4e-drafts-folder     . "/Drafts")
                      (mu4e-refile-folder     . "/Archive")
                      (mu4e-sent-folder       . "/Sent")
                      (mu4e-trash-folder      . "/Trash")
                      (mu4e-update-interval   . 1800)
                      ;(mu4e-sent-messages-behavior . 'delete)
                      )
                    nil)
