(defvar appearance-packages
  '(
    auto-dim-other-buffers
    hexrgb
    (nerd-fonts :location local)
    (spacemacs-theme :location
                     (recipe :fetcher github
                             :repo "CestDiego/spacemacs-theme"))
    exwm
    ))

(defun appearance/pre-init-exwm ()
  (spacemacs|use-package-add-hook exwm
    :post-config
    (defun exwm-bind-command (key command &rest bindings)
      (while key
        (exwm-input-set-key (kbd key)
                            `(lambda ()
                              (interactive)
                              (start-process-shell-command ,command nil ,command)))
        (setq key     (pop bindings)
              command (pop bindings))))

    (exwm-input-set-key (kbd "s-p")
                        (lambda (command)
                          (interactive (list (read-shell-command " ")))
                          (start-process-shell-command command nil command)))
    (exwm-input-set-key (kbd "s-q")
                        (lambda ()
                          (interactive)
                          (exwm-manage--close-window exwm--id)))
    (exwm-input-set-key (kbd "S-s-SPC") #'exwm-floating-toggle-floating)
    (exwm-input-set-key (kbd "s-m")   #'exwm-floating-hide-mode-line)
    (exwm-input-set-key (kbd "s-h") #'evil-window-left)
    (exwm-input-set-key (kbd "s-j") #'evil-window-down)
    (exwm-input-set-key (kbd "s-k") #'evil-window-up)
    (exwm-input-set-key (kbd "s-l") #'evil-window-right)
    (exwm-input-set-key (kbd "s-H") #'evil-window-move-far-left)
    (exwm-input-set-key (kbd "s-J") #'evil-window-move-very-bottom)
    (exwm-input-set-key (kbd "s-K") #'evil-window-move-very-top)
    (exwm-input-set-key (kbd "s-L") #'evil-window-move-far-right)
    (exwm-input-set-key (kbd "s-]") #'exwm-workspace-next)
    (exwm-input-set-key (kbd "s-[") #'exwm-workspace-prev)
    (exwm-bind-command
     "S-s-S"                     "setxkbmap -layout es"
     "S-s-D"                     "setxkbmap -layout us"
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

;; (defun appearance/init-auto-dim-other-buffers ()
;;   (use-package auto-dim-other-buffers
;;     :ensure hexrgb
;;     :init
;;     (defadvice load-theme (after activate)
;;       (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb
;;                                           (face-background 'default) 2 -2))
;;       (custom-set-faces
;;        '(auto-dim-other-buffers-face ((t :background dim-other-buffers-face-color))))

;;     :config
;;     (add-hook 'after-init-hook (lambda ()
;;                                  (when (fboundp 'auto-dim-other-buffers-mode)
;;                                    (auto-dim-other-buffers-mode t))))

;; )))

;; (defun appearance/init-hexrgb ()
;;   (use-package hexrgb
;;     :config
;;     (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb (face-background 'default) 2 -10))
;;     (set-face-attribute 'auto-dim-other-buffers-face nil
;;                         :background  dim-other-buffers-face-color)))
