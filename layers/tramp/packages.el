(defvar tramp-packages
  '(
    tramp
    vagrant-tramp
    ))

(defun tramp/init-tramp ()
  (use-package tramp
    :init
    (setq tramp-default-method "ssh")
    (setq tramp-debug-buffer t)
    (setq tramp-verbose 10)
    )
  )
(defun tramp/init-vagrant-tramp ()
  (use-package vagrant-tramp
    :init
    (progn
      (vagrant-tramp-enable)
      (eval-after-load "evil-leader"
        (spacemacs/set-leader-keys
          "avt" 'vagrant-tramp-term
          ))
      )))
