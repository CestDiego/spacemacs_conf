(defvar appearance-packages
  '(
    auto-dim-other-buffers
    gotham-theme
    ))

(defun appearance/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :init
    (when (window-system)
      (add-hook 'after-init-hook
                (lambda ()
                  (auto-dim-other-buffers-mode t)
                  )
                )
      (custom-set-faces
       '(auto-dim-other-buffers-face ((t (:background "#181818"))))
       )
      )))

(defun appearance/init-gotham-theme ()
  (use-package gotham-theme
    :defer t
    ))
