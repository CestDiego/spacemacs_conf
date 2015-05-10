(defvar calfw-packages
  '(
    calfw
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defun calfw/init-calfw()
  (use-package calfw
    :init
    (push 'calfw-mode evil-emacs-state-modes)
    :config
    (require 'calfw-ical)
    (defun holi ()
      (interactive)
      (cfw:open-ical-calendar "https://www.google.com/calendar/ical/cestdiego%40gmail.com/private-6fc2c53f60c0053ad716dbaec2be1acf/basic.ics")
      )
    (evil-leader/set-key
      "aC" 'holi)
    )
  )
