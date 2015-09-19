;;; Theme Switch Stuff
(defun spacemacs/set-color-env-vars ()
  (interactive)
  (setenv "BACKGROUND"     (cdr (aref ansi-color-map 40)))
  (setenv "FOREGROUND"     (cdr (aref ansi-color-map 37)))
  (setenv "LIGHT_GREY"     (cdr (aref ansi-color-map 30)))
  (setenv "LIGHT_RED"      (cdr (aref ansi-color-map 32)))
  (setenv "LIGHT_GREEN"    (cdr (aref ansi-color-map 33)))
  (setenv "LIGHT_BLUE"     (cdr (aref ansi-color-map 34)))
  (setenv "LIGHT_MAGENTA"  (cdr (aref ansi-color-map 35)))
  (setenv "LIGHT_CYAN"     (cdr (aref ansi-color-map 36)))
  (setenv "LIGHT_GREY"     (cdr (aref ansi-color-map 37)))
  (setenv "DARK_RED"       (cdr (aref ansi-color-map 41)))
  (setenv "DARK_GREEN"     (cdr (aref ansi-color-map 42)))
  (setenv "DARK_YELLOW"    (cdr (aref ansi-color-map 43)))
  (setenv "DARK_BLUE"      (cdr (aref ansi-color-map 44)))
  (setenv "DARK_MAGENTA"   (cdr (aref ansi-color-map 45)))
  (setenv "DARK_CYAN"      (cdr (aref ansi-color-map 46)))
  (setenv "DARK_GREY"      (cdr (aref ansi-color-map 47))))

(defadvice spacemacs/post-theme-init (after set-colors-as-env-variables activate)
  "Change Window Manager Theme as well! :O"
  (spacemacs/set-color-env-vars)
  (when (not (string= (getenv "BACKGROUND") "black"))
    (message (shell-command-to-string "change-theme"))))

;; Responsive Modeline
(defun spacemacs//responsive-modeline ()
  (let ((current-window (selected-window))
        (live-windows (reverse (window-list-1 (selected-window)
                                              'not-minibuffers 'visible))))
    (dolist (window live-windows)
      (select-window window)
      (let* ((width (window-total-width))
             (enough-space (> width 87)))
        (setq-local spacemacs-mode-line-right
                    `((battery :when active)
                      selection-info
                      ((,(when enough-space
                           'buffer-encoding-abbrev)
                        point-position
                        line-column)
                       :separator " | ")
                      ((global-mode new-version)
                       :when active)
                      buffer-position
                      ,(when enough-space 'hud)))))))

;; (add-hook 'window-configuration-change-hook 'spacemacs//responsive-modeline)
