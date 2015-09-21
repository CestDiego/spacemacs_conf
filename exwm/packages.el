;;; packages.el --- exwm Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq exwm-packages
    '((xelb :location (recipe :fetcher github
                              :repo "ch11ng/xelb")
            :step pre)
      (exwm :location (recipe :fetcher github
                              :repo "ch11ng/exwm")
            :step post)))

(defun exwm/init-xelb ()
  (use-package xelb))

(defun exwm/init-exwm ()
  (use-package exwm
    :init
    ;; Disable dialog boxes since they are unusable in EXWM
    (setq use-dialog-box nil)
    ;; 10 Worskpaces please
    (setq exwm-workspace-number 10)
    ;; You may want Emacs to show you the time
    (display-time-mode t)
    (push ?\M-m exwm-input-prefix-keys)
    :config
    (when dotspacemacs-use-ido
      (exwm-enable-ido-workaround))
    (defun spacemacs/exwm-bind-command (key command &rest bindings)
      (while key
        (exwm-input-set-key (kbd key)
                            `(lambda ()
                               (interactive)
                               (start-process-shell-command ,command nil ,command)))
        (setq key     (pop bindings)
              command (pop bindings))))

    (spacemacs/exwm-bind-command
     "<s-return>"  exwm--terminal-command)

    ;; All buffers created in EXWM mode are named "*EXWM*". You may want to change
    ;; it in `exwm-update-class-hook' and `exwm-update-title-hook', which are run
    ;; when a new window class name or title is available. Here's some advice on
    ;; this subject:
    ;; + Always use `exwm-workspace-rename-buffer` to avoid naming conflict.
    ;; + Only renaming buffer in one hook and avoid it in the other. There's no
    ;;   guarantee on the order in which they are run.
    ;; + For applications with multiple windows (e.g. GIMP), the class names of all
    ;;   windows are probably the same. Using window titles for them makes more
    ;;   sense.
    ;; + Some application change its title frequently (e.g. browser, terminal).
    ;;   Its class name may be more suitable for such case.
    ;; In the following example, we use class names for all windows expect for
    ;; Java applications and GIMP.
    (add-hook 'exwm-update-class-hook
       (lambda ()
         (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                     (string= "gimp" exwm-instance-name))
           (exwm-workspace-rename-buffer exwm-class-name))))
    (add-hook 'exwm-update-title-hook
       (lambda ()
         (when (or (not exwm-instance-name)
                   (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                   (string= "gimp" exwm-instance-name))
           (exwm-workspace-rename-buffer exwm-title))))

    ;; `exwm-input-set-key' allows you to set a global key binding (available in
    ;; any case). Following are a few examples.
    ;; + We always need a way to go back to line-mode from char-mode
    (exwm-input-set-key (kbd "s-r") 'exwm-reset)
    ;; + Bind a key to switch workspace interactively
    (exwm-input-set-key (kbd "s-w") 'exwm-workspace-switch)

    (defvar exwm-workspace-switch-wrap t
      "Whether `exwm-workspace-next' and `exwm-workspace-prev' should wrap.")

    (defun exwm-workspace-next ()
      "Switch to next exwm-workspaceective (to the right)."
      (interactive)
      (let* ((only-workspace? (equal exwm-workspace-number 1))
             (overflow? (= exwm-workspace-current-index
                           (1- exwm-workspace-number))))
        (cond
         (only-workspace? nil)
         (overflow?
          (when exwm-workspace-switch-wrap
              (exwm-workspace-switch 0)))
         (t (exwm-workspace-switch  (1+ exwm-workspace-current-index))))))
    (defun exwm-workspace-prev ()
      "Switch to next exwm-workspaceective (to the right)."
      (interactive)
      (let* ((only-workspace? (equal exwm-workspace-number 1))
             (overflow? (= exwm-workspace-current-index 0)))
        (cond
         (only-workspace? nil)
         (overflow?
          (when exwm-workspace-switch-wrap
            (exwm-workspace-switch (1- exwm-workspace-number))))
         (t (exwm-workspace-switch  (1- exwm-workspace-current-index))))))
    (defun exwm-layout-toggle-fullscreen ()
      "Hopefully Togggles full screen for X Apps"
      (interactive)
      (if exwm--fullscreen
          (exwm-layout-unset-fullscreen)
        (exwm-layout-set-fullscreen)))
    (exwm-input-set-key (kbd "s-f") #'exwm-layout-toggle-fullscreen)
    ;; + Set shortcuts to switch to a certain workspace.
    (exwm-input-set-key (kbd "s-1")
                        (lambda () (interactive) (exwm-workspace-switch 0)))
    (exwm-input-set-key (kbd "s-2")
                        (lambda () (interactive) (exwm-workspace-switch 1)))
    (exwm-input-set-key (kbd "s-3")
                        (lambda () (interactive) (exwm-workspace-switch 2)))
    (exwm-input-set-key (kbd "s-4")
                        (lambda () (interactive) (exwm-workspace-switch 3)))
    (exwm-input-set-key (kbd "s-5")
                        (lambda () (interactive) (exwm-workspace-switch 4)))
    (exwm-input-set-key (kbd "s-6")
                        (lambda () (interactive) (exwm-workspace-switch 5)))
    (exwm-input-set-key (kbd "s-7")
                        (lambda () (interactive) (exwm-workspace-switch 6)))
    (exwm-input-set-key (kbd "s-8")
                        (lambda () (interactive) (exwm-workspace-switch 7)))
    (exwm-input-set-key (kbd "s-9")
                        (lambda () (interactive) (exwm-workspace-switch 8)))
    (exwm-input-set-key (kbd "s-0")
                        (lambda () (interactive) (exwm-workspace-switch 9)))
    ;; + Application launcher ('M-&' also works if the output buffer does not
    ;;   bother you). Note that there is no need for processes to be created by
    ;;   Emacs.
    (exwm-input-set-key (kbd "s-&")
                        (lambda (command)
                          (interactive (list (read-shell-command "$ ")))
                          (start-process-shell-command command nil command)))
    ;; + 'slock' is a simple X display locker provided by suckless tools. 'i3lock'
    ;;   is a more feature-rich alternative.
    (exwm-input-set-key (kbd "s-<f2>")
                        (lambda () (interactive) (start-process "" nil "i3lock")))

    ;; The following example demonstrates how to set a key binding only available
    ;; in line mode. It's simply done by first push the prefix key to
    ;; `exwm-input-prefix-keys' and then add the key sequence to `exwm-mode-map'.
    ;; The example shorten 'C-c q' to 'C-q'.
    (push ?\C-q exwm-input-prefix-keys)
    (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

    ;; Spacemacs Compatibility
    (exwm-input-set-key (kbd "s-:") 'evil-ex)

    ;; The following example demonstrates how to use simulation keys to mimic the
    ;; behavior of Emacs. The argument to `exwm-input-set-simulation-keys' is a
    ;; list of cons cells (SRC . DEST), where SRC is the key sequence you press and
    ;; DEST is what EXWM actually sends to application. Note that SRC must be a key
    ;; sequence (of type vector or string), while DEST can also be a single key.
    (exwm-input-set-simulation-keys
     '(([?\C-b] . left)
       ([?\C-f] . right)
       ([?\C-p] . up)
       ([?\C-n] . down)
       ([?\M-v] . prior)
       ))

    ;; Do not forget to enable EXWM. It will start by itself when things are ready.
    (exwm-enable)
    ))


