(defvar webkit-post-extensions
  '(
    webkit
    )
  "List of all extensions to load after the packages.")

(defun webkit/init-webkit()
  (use-package webkit
    :init
    (require 'helm-webkit)
    (spacemacs/set-leader-keys
      "aw" 'webkit-open-url)))
