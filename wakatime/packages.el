(defvar wakatime-packages
  '(
    wakatime-mode
    ))

(defun wakatime/init-wakatime-mode ()
  (use-package wakatime-mode
    :config
    (add-hook 'prog-mode-hook 'global-wakatime-mode)))
