(defvar wakatime-packages
  '(
    wakatime-mode
    ))

(defun wakatime/init-wakatime-mode ()
  (use-package wakatime-mode
    :config
    (setq wakatime-cli-path "/home/io/.local/bin/wakatime")
    (setq wakatime-api-key "813b0d78-1f17-43eb-bede-a5c008651d4a")
    (global-wakatime-mode)))
