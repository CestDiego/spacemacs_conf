(defvar presentations-post-extensions
  '(
    demo-it
    )
  "List of all extensions to load after the packages.")

(defun presentations/init-demo-it()
  (use-package demo-it
    :init
    (progn
      (global-set-key (kbd "<f6>") 'demo-it-step)
      (global-set-key (kbd "<f5>") '(lambda () (interactive) (demo-it-presentation-return-noadvance) ))
      (global-set-key (kbd "S-<f6>") 'demo-it-end)
      )))
