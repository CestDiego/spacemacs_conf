(defvar org-projectile-packages
  '(
    org-projectile
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar org-projectile-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function cestdiego/init-<package-cestdiego>
;;
(defun org-projectile/init-org-projectile ()
  (use-package org-projectile
    :bind (("C-c n p" . org-projectile:project-todo-completing-read)
           ("C-c c" . org-capture))
    :config
    (progn
      (setq org-projectile:projects-file 
            "~/Dropbox/Org-Notes/projectile.org")
      (add-to-list 'org-capture-templates (org-projectile:project-todo-entry "p")))
    :ensure t)
  )
