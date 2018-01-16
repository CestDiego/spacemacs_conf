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

(defun appearance/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :init
    ;; Getting config from: https://github.com/mina86/auto-dim-other-buffers.el/issues/9#issuecomment-241503056
    (defun cestdiego/reset-auto-dim-face (&rest args)
      "Adjust `auto-dim-other-buffers-face' to the current background color.
ARGs is unused and are only for when this function is used as advice."
      (interactive)
      (let* ((percent-to-darken 3.5)
             (current-background-color (face-background 'default))
             (new-auto-dim-background-color
              (color-darken-name current-background-color percent-to-darken)))
        (set-face-background 'auto-dim-other-buffers-face
                             new-auto-dim-background-color)))
    (add-hook 'after-init-hook (lambda ()
                           (when (fboundp 'auto-dim-other-buffers-mode)
                             (auto-dim-other-buffers-mode t)
                             (cestdiego/reset-auto-dim-face)
                             )))
    (add-hook 'spacemacs-post-theme-change-hook #'cestdiego/reset-auto-dim-face)
    (advice-add 'load-theme :after 'cestdiego/reset-auto-dim-face)
    )
  )
