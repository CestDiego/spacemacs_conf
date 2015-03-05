(defvar org-notify-post-extensions
  '(
    org-notify
    )
  "List of all extensions to load after the packages.")

(defun org-notify/init-org-notify()
  (use-package org-notify
    :init
    (progn
      (org-notify-start)

      (org-notify-add 'appt
                      '(:time "-1s" :period "20s" :duration 10
                              :actions (-message -ding))
                      '(:time "15m" :period "2m" :duration 100
                              :actions -notify)
                      '(:time "2h" :period "5m" :actions -message)
                      '(:time "3d" :actions -email))
      )
    ))
