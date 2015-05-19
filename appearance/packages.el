(defvar appearance-packages
  '(
    auto-dim-other-buffers
    hexrgb
    ))

(defun appearance/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :ensure hexrgb
    :init
    (defadvice load-theme (after activate)
      (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb
                                          (face-background 'default) 2 -2))
      (custom-set-faces
       '(auto-dim-other-buffers-face ((t :background dim-other-buffers-face-color))))

    :config
    (add-hook 'after-init-hook (lambda ()
                                 (when (fboundp 'auto-dim-other-buffers-mode)
                                   (auto-dim-other-buffers-mode t))))

)))

(defun appearance/init-hexrgb ()
  (use-package hexrgb
    :config
    (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb (face-background 'default) 2 -10))
    (set-face-attribute 'auto-dim-other-buffers-face nil
                        :background  dim-other-buffers-face-color)
    )
  )
