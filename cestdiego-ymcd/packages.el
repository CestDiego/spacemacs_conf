(defvar ycmd-packages
  '(
    ycmd
    flycheck-ycmd
    ))

(defun ycmd/init-ycmd ()
  (use-package ycmd
    :init
    (progn
      (ycmd-setup)
      (add-hook 'c++-mode-hook 'ycmd-mode)
      )))

(defun ycmd/init-flycheck-ycmd ()
  (use-package flycheck-ycmd
    :config
    (flycheck-ycmd-setup)))
