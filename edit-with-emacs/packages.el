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
      ;; For it to work with teminals
      (setq edit-server-new-frame nil)
      (edit-server-start)
      (setq edit-server-url-major-mode-alist
            '(("github\\.com" . markdown-mode)))

;;       "Use `edit-server-url-major-mode-alist' to choose a major mode
;; initialization function based on `edit-server-url', or fall back
;; to `edit-server-default-major-mode'"
      )
    )
  )

(defun edit-with-emacs/init-gmail-message-mode()
  (use-package gmail-message-mode
    :init
    ()
    ))
