(defvar appearance-packages
  '(
    auto-dim-other-buffers
    gotham-theme
    hexrgb
    ))

(defun appearance/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :init
    (when (window-system)
      (add-hook 'after-init-hook (lambda ()
                                   (when (fboundp 'auto-dim-other-buffers-mode)
                                     (auto-dim-other-buffers-mode t))))
      )))

(defun appearance/init-hexrgb ()
  (use-package hexrgb
    (defadvice load-theme (around activate)
      (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb (face-background 'default) 2 -10))
      (set-face-attribute 'auto-dim-other-buffers-face nil
                          :background  dim-other-buffers-face-color)
      )
    )
    )

(defun appearance/init-gotham-theme ()
  (use-package gotham-theme
    :defer t
    ))

