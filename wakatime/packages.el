(defvar wakatime-packages
  '(
    wakatime-mode
    ))

(defun wakatime/init-wakatime ()
  (use-package wakatime-mode
    :defer t
    :init
    (global-wakatime-mode)
    :config
    (setq wakatime-api-key "813b0d78-1f17-43eb-bede-a5c008651d4a")))
