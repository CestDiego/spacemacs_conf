(defvar rcirc-packages
  '(
    rcirc
    rcirc-notify
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar rcirc-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function cestdiego/init-<package-cestdiego>
;;
(defun rcirc/init-rcirc ()
  (use-package rcirc-notify
    :commands rcirc-notify-add-hooks
    :init
    (progn
      (eval-after-load 'rcirc
        '(progn
           (rcirc-notify-add-hooks)
           (setq rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY" "MODE"))
           ;; Include date in time stamp.
           (setq rcirc-time-format "%Y-%m-%d %H:%M ")
           (add-hook 'rcirc-notify-page-me-hooks
                     (lambda (msg)
                       (start-process "beep-process" nil "mplayer" "~/.emacs.d/site-misc/startup.ogg" )))
           ;;###autoload
           (add-hook 'rcirc-mode-hook '(lambda ()
                                         ;; Turn on spell checking.
                                         (flyspell-mode 1)
                                         (rcirc-omit-mode)
                                         ;; (set-input-method "latin-1-prefix")
                                         (set (make-local-variable 'scroll-conservatively)
                                              8192)
                                         ))
           )
        )
      (require 'epa-file)
      (defun irc-config()
        (load-library "~/spacemacs_conf/secret.el.gpg")
        (irc-cestdiego))
      (defun custom-persp/irc ()
        (interactive)
        ;; (custom-persp "@IRC" (irc-cestdiego)))
        (custom-persp "@IRC" (irc-config)))
      (eval-after-load 'evil-leader
        '(progn
          (evil-leader/set-key
            "aI" 'custom-persp/irc)
          ))

      ;; Minimal logging to `~/.rcirc-logs/channel'
      ;; by courtesy of Trent Buck.
      (add-hook 'rcirc-print-hooks 'rcirc-write-log)
      (defcustom rcirc-log-directory "~/.emacs.d/.rcirc-logs"
        "Where logs should be kept.  If nil, logs aren't kept.")
      (defun rcirc-write-log (process sender response target text)
        (when rcirc-log-directory
          (with-temp-buffer
            ;; Sometimes TARGET is a buffer :-(
            (when (bufferp target)
              (setq target (with-current-buffer buffer rcirc-target)))
            ;; Sometimes buffer is not anything at all!
            (unless (or (null target) (string= target ""))
              ;; Print the line into the temp buffer.
              (insert (format-time-string "%Y-%m-%d %H:%M "))
              (insert (format "%-16s " (rcirc-user-nick sender)))
              (unless (string= response "PRIVMSG")
                (insert "/" (downcase response) " "))
              (insert text "\n")
              ;; Append the line to the appropriate logfile.
              (let ((coding-system-for-write 'no-conversion))
                (write-region (point-min) (point-max)
                              (concat rcirc-log-directory "/" (downcase target))
                              t 'quietly))))))
      )
    ))
