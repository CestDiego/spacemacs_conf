(defvar tramp-packages
  '(
    tramp
    vagrant-tramp
    ))

(defun tramp/init-vagrant-tramp ()
  (use-package vagrant-tramp
    :init
    (progn
      (vagrant-tramp-enable)
      (eval-after-load "evil-leader"
        (evil-leader/set-key
          "avt" 'vagrant-tramp-term
          ))
      )))
