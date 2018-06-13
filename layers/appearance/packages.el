(defvar appearance-packages
  '(
    auto-dim-other-buffers
    (nerd-fonts :location local)
    zone-nyan
    exwm
    all-the-icons
    ))

(defun appearance/init-all-the-icons ()
  (use-package all-the-icons))

(defun appearance/init-zone-nyan ()
  (use-package zone-nyan
    :config
    (spacemacs/set-leader-keys
      "an" 'zone-nyan-preview)))

(defun appearance/pre-init-exwm ()
  (spacemacs|use-package-add-hook exwm
    :post-config
    (exwm-input-set-key (kbd "s-SPC")
                        (lambda (command)
                          (interactive (list (read-shell-command " ")))
                          (start-process-shell-command command nil command)))
    (exwm-input-set-key (kbd "s-q")
                        (lambda ()
                          (interactive)
                          (if exwm--id
                              (exwm-manage--close-window exwm--id)
                            (kill-this-buffer))))
    (exwm-input-set-key (kbd "s-Q")
                        (lambda ()
                          (interactive)
                          (when exwm--id
                            (exwm-manage--close-window exwm--id))
                          (delete-window)))


    ;; Recent buffers?
    (exwm-input-set-key (kbd "<C-s-tab>") #'spacemacs/previous-useful-buffer)
    (exwm-input-set-key (kbd "<M-s-tab>") #'spacemacs/next-useful-buffer)
    ;; floating yo
    (exwm-input-set-key (kbd "S-s-SPC") #'exwm-floating-toggle-floating)
    (exwm-input-set-key (kbd "s-m")   #'exwm-floating-hide-mode-line)
    ;; Split Windows
    (exwm-input-set-key (kbd "C-s-j") #'split-window-below-and-focus)
    (exwm-input-set-key (kbd "C-s-l") #'split-window-right-and-focus)
    (spacemacs/exwm-bind-command
     "S-s-S"                   "setxkbmap -layout es"
     "S-s-D"                   "setxkbmap -layout us"
     "<s-return>"              "termite"
     "<print>"                 "imgur-screenshot && mplayer /usr/share/sounds/freedesktop/stereo/screen-capture.oga"
     "<XF86MonBrightnessDown>" "xbacklight -dec 10"
     "<XF86MonBrightnessUp>"   "xbacklight -inc 10"
     "<XF86AudioMute>"         "amixer -q set Master 100%- unmute"
     "<XF86AudioLowerVolume>"  "amixer -q set Master 10%- unmute"
     "<XF86AudioRaiseVolume>"  "amixer -q set Master 10%+ unmute"
     "<XF86AudioPlay>"         "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
     "<XF86AudioStop>"         "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop"
     "<XF86AudioNext>"         "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
     "<XF86AudioPrev>"         "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
     )
    ))


(defun appearance/init-nerd-fonts ()
  (use-package nerd-fonts
    :init
    (spacemacs/set-leader-keys
      "hN" 'helm-nerd-fonts)))

(defun cestdiego/reset-vertical-border-face (&rest args)
  "Adjust `auto-dim-other-buffers-face' to the current background color.
ARGs is unused and are only for when this function is used as advice."
  (interactive)
  (let* ((percent-to-darken 8)
         (current-background-color (face-background 'default))
         (new-vertical-border-color
          (color-darken-name current-background-color percent-to-darken)))

    (set-face-attribute 'vertical-border nil
                        :foreground new-vertical-border-color
                        :background new-vertical-border-color)

    ;; Minibuffer stuff
    (set-face-attribute 'minibuffer-prompt nil :background new-vertical-border-color)
    ;; Define a closure for each time the hook gets set
    (defun set-le-color (color) `(lambda () (set-background-color ,color)))
    ;; Optimize for the hook
    (add-hook 'minibuffer-setup-hook (set-le-color new-vertical-border-color))

    ;; Window Divider stuff
    (setq window-divider-default-bottom-width 5
          window-divider-default-right-width 4 ; The vertical-border above has 1 px width already
          window-divider-default-places t)
    (set-face-attribute 'window-divider nil :foreground new-vertical-border-color)
    (set-face-attribute 'window-divider-first-pixel nil :foreground new-vertical-border-color)
    (set-face-attribute 'window-divider-last-pixel nil :foreground new-vertical-border-color)
    (window-divider-mode 1)
    ))

(defun cestdiego/reset-auto-dim-face (&rest args)
  "Adjust `auto-dim-other-buffers-face' to the current background color.
ARGs is unused and are only for when this function is used as advice."
  (interactive)
  (let* ((percent-to-darken 3.5)
         (current-background-color (face-background 'default))
         (new-auto-dim-background-color
          (color-darken-name current-background-color percent-to-darken)))
    (set-face-background 'auto-dim-other-buffers-face
                         new-auto-dim-background-color)
    (set-face-background 'fringe
                         new-auto-dim-background-color)

    ;; the leading space character is correct
    (with-current-buffer (get-buffer " *Echo Area 0*")
      (make-local-variable 'face-remapping-alist)
      (add-to-list 'face-remapping-alist `(default (:background ,new-auto-dim-background-color))))
    ))

(defun appearance/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :init
    ;; Better setting to know what window is currently selected
    (setq-default cursor-in-non-selected-windows nil)
    ;; Getting config from: https://github.com/mina86/auto-dim-other-buffers.el/issues/9#issuecomment-241503056
    (add-hook 'spacemacs-post-user-config-hook (lambda ()
                                           (when (fboundp 'auto-dim-other-buffers-mode)
                                             (auto-dim-other-buffers-mode t)
                                             (cestdiego/reset-auto-dim-face)
                                             (cestdiego/reset-vertical-border-face)
                                             )))
    (add-hook 'spacemacs-post-theme-change-hook #'cestdiego/reset-auto-dim-face)
    (add-hook 'spacemacs-post-theme-change-hook #'cestdiego/reset-vertical-border-face)

    (fringe-mode 0)
    (auto-dim-other-buffers-mode)
    )
  )
