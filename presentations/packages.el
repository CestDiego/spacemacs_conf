(defvar presentations-packages
  '(
    org-tree-slide
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

;; For each package, define a function cestdiego/init-<package-cestdiego>
(defun presentations/init-org-tree-slide()
  (use-package org-tree-slide
    :init
    (progn
      (define-key org-mode-map (kbd "<f8>") 'org-tree-slide-mode)
      (define-key org-mode-map (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
      )
    ))
