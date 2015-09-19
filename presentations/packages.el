(defvar presentations-packages
  '(
    org-tree-slide
    (demo-it :location local)
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

;; For each package, define a function cestdiego/init-<package-cestdiego>
(defun presentations/init-org-tree-slide()
  (use-package org-tree-slide
    :config
    (progn
      (define-key org-mode-map (kbd "<f8>") 'org-tree-slide-mode)
      (define-key org-mode-map (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
      )
    ))

(defun presentations/init-demo-it()
  (use-package demo-it
    :init
    (progn
      (global-set-key (kbd "<f6>") 'demo-it-step)
      (global-set-key (kbd "<f5>") '(lambda () (interactive) (demo-it-presentation-return-noadvance) ))
      (global-set-key (kbd "S-<f6>") 'demo-it-end)
      )))
