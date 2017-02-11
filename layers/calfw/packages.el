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
      )
    (spacemacs/set-leader-keys
      "aC" 'holi)
    )
  )
