(defvar edit-with-emacs-packages
  '(
    edit-server
    gmail-message-mode
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar edit-server-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function cestdiego/init-<package-cestdiego>
;;
(defun edit-with-emacs/init-edit-server ()
  (use-package edit-server
    :config
    (progn
      (setq edit-server-new-frame t)
      (edit-server-start)
      (setq edit-server-url-major-mode-alist
            '(("github\\.com" . markdown-mode)))
      )
    )
  )

(defun edit-with-emacs/init-gmail-message-mode()
  (use-package gmail-message-mode
    :init
    ()
    ))
