(defvar javascript-packages
  '(
    js2-mode
    js2-refactor
    requirejs-mode
    skewer-mode
    tern
    tern-auto-complete
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar javascript-excluded-packages '()
  "List of packages to exclude.")

(defun javascript/init-js2-mode ()
  (use-package js2-mode
    :mode "\\.js\\'"
    :init
    (progn
      ;; (add-hook 'js2-mode-hook 'ac-js2-mode)
      (message "javaScript mode enabled")
      )))

(defun javascript/init-requirejs-mode ()
  (use-package requirejs-mode
    :init
    (add-hook 'js2-mode-hook (lambda()(requirejs-mode)))))

(defun javascript/init-tern ()
  (use-package tern
    :init
    (progn
      (add-hook 'js2-mode-hook 'tern-mode)
      (eval-after-load 'tern-auto-complete
        '(tern-ac-setup))
      (defun delete-tern-process ()
        (interactive)
        (delete-process "Tern"))
      )
    ))


(defun javascript/init-skewer-mode ()
  (use-package skewer
    :init
    (add-hook 'js2-mode-hook 'skewer-mode)))
