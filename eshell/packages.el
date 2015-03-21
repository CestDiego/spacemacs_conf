(defvar eshell-packages
  '(
    eshell-prompt-extras
    esh-help
    virtualenvwrapper
    eshell
    ))

(defun eshell/init-virtualenvwrapper()
  (use-package virtualenvwrapper
    :config
    (venv-initialize-eshell)
    ))

(defun eshell/init-eshell-prompt-extras()
  (use-package eshell-prompt-extras
    :init
    (eval-after-load 'virtualenvwrapper
      '(setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda))
    ))

(defun eshell/init-eshell ()
  (use-package eshell
    :config
    (progn
      ;; Aliases
      (defalias 'emacs 'find-file)
      (defalias 'ec 'find-file)
      ;; Scrolling
      (setq eshell-scroll-to-bottom-on-output t
            eshell-scroll-show-maximum-output t)

      (use-package esh-mode
        :defer t
        :config
        (progn
          (defun eshell/cds ()
            (eshell/cd (or (locate-dominating-file default-directory "src")
                           (locate-dominating-file default-directory ".git"))))

          (defun eshell/clear ()
            (interactive)
            (let ((inhibit-read-only t))
              (delete-region (point-min) (point-max)))
            (eshell-send-input))

          (add-hook 'eshell-mode-hook
                    #'(lambda ()
                        (bind-key "C-l" 'eshell/clear eshell-mode-map)))))

      (use-package em-term
        :defer t
        :config
        (setq eshell-visual-commands
              (append '("tmux" "screen" "ssh") eshell-visual-commands)))

      (use-package em-hist
        :defer t
        :config
        (setq eshell-hist-ignoredups t))))
  )

(defun eshell/init-helm-eshell()
  (use-package helm-eshell
    :init
    (after eshell
           (add-hook 'eshell-hook
                     #'(lambda ()
                         (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history))))))

(defun eshell/init-esh-help ()
  (use-package esh-help
    :init
    (progn
      (add-hook 'eshell-mode-hook 'eldoc-mode)
      (setup-esh-help-eldoc))))
