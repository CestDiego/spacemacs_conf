(defvar prodigy-packages
  '(
    prodigy
    ))

(defun prodigy/init-prodigy ()
  (use-package prodigy
    :commands prodigy
    :init
    (progn
      (eval-after-load 'evil-leader
        '(evil-leader/set-key
           "ar" 'prodigy
           ))

      (require 'prodigy)
      (add-to-list 'evil-emacs-state-modes 'prodigy-mode)
      (evil-add-hjkl-bindings prodigy-mode-map 'emacs
        "/" 'evil-search-forward
        )

      (eval-after-load "evil-leader"
        (evil-leader/set-key
          "aP" 'spacemacs/paradox-list-packages))

      ;; (defface prodigy-dull-face
      ;;   '((((class color)) :foreground "#999999"))
      ;;   "Gray color indicating waiting."
      ;;   :group 'prodigy)

      (prodigy-define-status :id 'running :face 'prodigy-dull-face)
      (prodigy-define-status :id 'exception :face 'prodigy-red-face)
      (prodigy-define-service
        :name "GMAT Dudes Django server"
        :cwd "~/Projects/ansible-test/"
        :command "python"
        :args '("manage.py" "runserver" )
        :init (lambda ()
                (pyvenv-workon "gmat"))
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t
        )
      (prodigy-define-service
        :name "Rocola Hackspace Client"
        :cwd "~/Projects/Rocola-Hackspace/Client/"
        :command "node"
        :args '("app.js" )
        :init (lambda()
                ())
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t
        )
      (prodigy-define-service
        :name "Rocola Hackspace Server"
        :cwd "~/Projects/Rocola-Hackspace/Server/"
        :command "node"
        :args '("app.js" )
        :init (lambda()
                ())
        :kill-signal 'sigkill
        :kill-process-buffer-on-stop t
        )
      )
    ))
