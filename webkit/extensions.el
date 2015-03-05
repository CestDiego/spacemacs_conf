(defvar webkit-post-extensions
  '(
    webkit
    )
  "List of all extensions to load after the packages.")

(defun webkit/init-webkit()
  (use-package webkit
    :init
    (require 'helm-webkit)
    (evil-leader/set-key
      "aw" 'webkit-open-url)))
