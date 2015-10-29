(defvar appearance-packages
  '(
    auto-dim-other-buffers
    hexrgb
    (nerd-fonts :location local)
    (spacemacs-theme :location
                     (recipe :fetcher github
                             :repo "CestDiego/spacemacs-theme"))
    (zone-nyan :location
                     (recipe :fetcher github
                             :repo "wasamasa/zone-nyan"))
    exwm
    ))

(defun appearance/init-zone-nyan ()
  (use-package zone-nyan
    :config
    (evil-leader/set-key
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
    (evil-leader/set-key
      "hn" 'helm-nerd-fonts)))

(defun appearance/init-spacemacs-theme ()
  (use-package spacemacs-theme
    :defer t
    :init
    (progn
      (setq spacemacs-theme-comment-bg t)
      (setq spacemacs-theme-org-height t))))

(defun appearance/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :if nil
    :ensure hexrgb
    :init
    (defadvice load-theme (after activate)
      (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb
                                          (face-background 'default) 2 -2))
      (custom-set-faces
       '(auto-dim-other-buffers-face ((t :background dim-other-buffers-face-color))))

    :config
    (add-hook 'after-init-hook (lambda ()
                                 (when (fboundp 'auto-dim-other-buffers-mode)
                                   (auto-dim-other-buffers-mode t))))

)))

(defun appearance/init-hexrgb ()
  (use-package hexrgb
    :if nil
    :config
    (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb (face-background 'default) 2 -10))
    (set-face-attribute 'auto-dim-other-buffers-face nil
                        :background  dim-other-buffers-face-color)))
