(defun notify-send-popup (title msg &optional icon sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title
of the message, MSG is the context. Optionally, you can provide an ICON and
a sound to be played"

  (interactive)
  (when sound (shell-command
               (concat "mplayer -really-quiet " sound " 2> /dev/null")))
  (if (eq window-system 'x)
      (shell-command (concat "notify-send "

                             (if icon (concat "-i " icon) "")
                             " '" title "' '" msg "'"))
    ;; text only version

    (message (concat title ": " msg))))

(defun rcirc-notify-send-popup (process sender response target text)
  (let ((nick (rcirc-nick process)))
    (when (and (string-match (regexp-quote nick) text)
               (not (string= nick sender))
               (not (string= (rcirc-server-name process) sender)))
      (notify-send-popup sender text))))
(add-hook 'rcirc-print-functions 'rcirc-notify-send-popup)





(format "%X" 221)
(setq holi "#FF3F2D")
(require 'dash)
(require 's)
(-partition 2 (cdr (delete "" (split-string (face-attribute 'default :background) ""))))

(cdr (list holi))
(string-to-number holi 16)

(color-values)
(format "%X"  ( / (* 98 (string-to-number 
                         (substring
                          (face-attribute 'default :background) 1 6) 16))
                  100))

( (substring
   (face-attribute 'default :background) 1 6))
(mapc '(lambda(arg) (mapconcat 'identity arg "") ) '(-partition 2 (cdr (delete "" (split-string (face-attribute 'default :background) "")))))

(setq holi '("hs" "sd"))

(mapc '(lambda (holi) (let ( vars (* 3 holi))
                        (message vars)
                        ) ) '(2 3 1))
(list holi)
(progn

  (defun holi2 (holi) 
    (progn

      (mapconcat 'identity holi ""))
    )
  (holi2 holi)
  )




(let ((auth-result (car (auth-source-search 
                         :port "paradox" 
                         :require '(:secret)))))
  (let ((paradox-token (plist-get auth-result :secret))) 
    (list "holi" (if (functionp paradox-token)
                     (funcall paradox-token)
                   paradox-token)))
  )

(plist-get (car  (auth-source-search :port "paradox" :require '(:secret) :max 1)) :port)

------------------------------------------------------
(require 'key-chord)
(key-chord-mode 1)

(defun popi ()
  (interactive)
  (setq unread-command-events (append unread-command-events (listify-key-sequence (kbd "u"))))
  )
(key-chord-define evil-insert-state-map "as" 'popi)

uauuuuuuu as asetnip assssasasasasuuuuasuuuuasasausaaussdfa;;ffflfffkusssssssssssssssssssssss
ussssssssssssssssssssssssuuuuuuuauussssssssssssssssssssssssssssssssssssauaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
uaaaassssssssssssasuuuuusslfffffff


