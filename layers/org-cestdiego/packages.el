;;; packages.el --- org-babel Layer packages File for Spacemacs
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

(defvar org-cestdiego-packages
  '(
    org-plus-contrib
    ;; org-mac-link
    org-alert
    ;; (ob                        :location built-in)
    ;; (org-notify                :location built-in)
    (org-protocol :location built-in)
    (org-capture :location built-in)
    (org-agenda :location built-in)
    (org-protocol-github-lines :location local)
    org-projectile
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

;; We use org-plus-contrib instead of org D:
(defun org-cestdiego/post-init-org-plus-contrib ()
  (require 'org-git-link))

(defun org-cestdiego/init-org-notify()
  (use-package org-notify
    :config
    (org-notify-start)
    (org-notify-add 'appt
                    '(:time "-1s" :period "20s" :duration 10
                            :actions (-message -ding))
                    '(:time "15m" :period "2m" :duration 100
                            :actions -notify)
                    '(:time "2h" :period "5m" :actions -message)
                    '(:time "3d" :actions -email))))

(defun org-cestdiego/init-org-jira ()
  (use-package org-jira
    :config
    (spacemacs/declare-prefix-for-mode 'org-mode "mj" "jira")
    (spacemacs/declare-prefix-for-mode 'org-mode "mjp" "projects")
    (spacemacs/declare-prefix-for-mode 'org-mode "mji" "issues")
    (spacemacs/declare-prefix-for-mode 'org-mode "mjs" "subtasks")
    (spacemacs/declare-prefix-for-mode 'org-mode "mjc" "comments")
    (spacemacs/declare-prefix-for-mode 'org-mode "mjt" "todos")
    (spacemacs/set-leader-keys-for-major-mode 'org-mode
      "jpg" 'org-jira-get-projects
      "jib" 'org-jira-browse-issue
      "jig" 'org-jira-get-issues
      "jih" 'org-jira-get-issues-headonly
      "jif" 'org-jira-get-issues-from-filter-headonly
      "jiF" 'org-jira-get-issues-from-filter
      "jiu" 'org-jira-update-issue
      "jiw" 'org-jira-progress-issue
      "jir" 'org-jira-refresh-issue
      "jic" 'org-jira-create-issue
      "jik" 'org-jira-copy-current-issue-key
      "jsc" 'org-jira-create-subtask
      "jsg" 'org-jira-get-subtasks
      "jcu" 'org-jira-update-comment
      "jtj" 'org-jira-todo-to-jira)
    ))


;; Apparently this fails with current version of org-mode. Double check later
;; (defun org-cestdiego/init-org-mac-link ()
;;   (use-package org-mac-link
;;     :commands 'org-mac-grab-link
;;     :defer t
;;     :config
;;     (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)
;;     ))

(defun org-cestdiego/init-org-alert ()
  (use-package org-alert
    :init
    (setq alert-default-style 'osx-notifier)
    :config
    (defun org-alert-check ()
      "Check for active, due deadlines and initiate notifications."
      (interactive)
      (org-alert--preserve-agenda-buffer)
      (let ((active (org-alert--filter-active (org-alert--get-headlines))))
        (dolist (dl (org-alert--strip-states active))
          (notify-osx dl org-alert-notification-title)))
      (org-alert--restore-agenda-buffer))
    ))

(defun org-cestdiego/init-org-protocol ()
  (use-package org-protocol :defer t))

(defun org-cestdiego/init-org-capture ()
  (use-package org-capture
    :defer t
    :init
    (with-eval-after-load 'org
      (progn
        (add-hook 'org-capture-mode-hook 'evil-insert-state)
        (defadvice org-switch-to-buffer-other-window
            (after make-full-capture-window-frame activate)
          "Agenda to be the sole window when it is in a popup frame"
          (when (equal "emacs-capture" (frame-parameter nil 'name))
            (delete-other-windows)
            (hidden-mode-line-mode)))

        ;; Thank you random guy from StackOverflow
        ;; http://goo.gl/OOWIVp
        (defadvice org-capture
            (after make-full-window-frame activate)
          "Advise capture to be the sole window when in a popup frame"
          (when (equal "emacs-capture" (frame-parameter nil 'name))
            (delete-other-windows)))

        ;; alfred-org-capture
        (defun make-orgcapture-frame ()
          "Create a new frame and run org-capture."
          (interactive)
          (make-frame '((name . "emacs-capture") (width . 80) (height . 16)
                        (top . 400) (left . 300)
                        ))
          (select-frame-by-name "emacs-capture")
          (org-capture))

        (defadvice org-capture-finalize
            (after delete-capture-frame activate)
          "Advise capture-finalize to close the frame"
          (if (equal "emacs-capture" (frame-parameter nil 'name))
              (delete-frame)))

        (setq org-directory "~/Google Drive/Org-Notes")
        (setq work-org-dir (expand-file-name "work/work.org" org-directory))
        (setq work-current-sprint "44")
        ;;; Capture Templates
        ;;;; Add idea, mind-onanism, contacts, movies to download das
        (setq org-capture-templates
              `(("t" "Todo" entry
                 (file+olp ,work-org-dir ,(concat "Sprint " work-current-sprint) "Tasks")
                 "* TODO %? %^g \n %i\n %a\n")
                ("i" "For jotting quick ideas" entry
                 (file+headline "gtd.org" "Ideas")
                 "* %?\n %i\n%t\n%A")
                ;; ("c" "Contacts" entry (file "contacts.org")
                ;;  "* %(org-contacts-template-name)\n
                ;;  :PROPERTIES:\n
                ;;  :EMAIL:
                ;;  %(org-contacts-template-email)\n  :END:")
                ("b" "Bookmark links" entry
                 (file+headline "links.org" "Bookmarks")
                 "* %?%^g")
                ("m" "Movies to see" entry
                 (file "movies.org")
                 "* ToDownload %? \n  :PROPERTIES:\n  :DATE: %t\n  :URL: %c\n  :END:")
                ("l" "Temp Links from the interwebs" entry
                 (file+headline "links.org" "Links")
                 "* TO-READ %c %^g\n Entered on: %U\n %?\n%i\n"
                 :empy-lines 1)
                ("c" "Clock In" table-line (file+headline "clokin.org" "Bitácora de Asistencia") " | %? | %T |"))
          )
        )
      )
    )
  )


(defun org-cestdiego/pre-init-org-agenda ()
  (spacemacs|use-package-add-hook org-agenda
    :post-config
    (progn
      (defadvice org-switch-to-buffer-other-window (after make-full-agenda-window-frame activate)
        "Advice this function inside the agenda to be the sole window when in a popup frame"
        (when (equal "emacs-agenda" (frame-parameter nil 'name))
          (delete-other-windows)
          (hidden-mode-line-mode)))

      (defadvice org-agenda-quit (after make-full-window-frame activate)
        "Advise org-agenda to be the sole window when in a popup frame"
        (if (equal "emacs-agenda" (frame-parameter nil 'name))
            (delete-frame)))

      (setq org-agenda-custom-commands
            (append '(("v" tags "Movies")
                      ("c" todo "IN_CODE_REVIEW"
                       ((org-agenda-overriding-header "Items that are in Code Review")))
                      ("Q" tags "questions")
                      ("l" tags "Links"
                       ((org-agenda-overriding-header "Links that I have to Read: ")
                        (org-agenda-skip-function
                         '(org-agenda-skip-entry-if 'todo '("READING" "READ")))))
                      ("e" tags-todo "Events")

                      ;; Sprint stuff
                      ("S" . "Current Sprint Agenda")
                      ("Ss" tags "+current+sprint+notes")
                      ("St" tags-todo "+current+sprint+tasks"))
                    org-agenda-custom-commands))
      )))


(defun org-cestdiego/pre-init-org()
  "Initialize my package"
  (spacemacs|use-package-add-hook org
    :post-config
    (setq org-startup-folded nil)
    (setq org-src-fontify-natively t)
    (setq org-src-tab-acts-natively t)
    (setq org-confirm-babel-evaluate nil)

    (setq org-latex-packages-alist '(("" "color" t)
                                     ("" "minted" t)
                                     ("" "parskip" t))
          org-latex-pdf-process
          '("pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
            "bibtex $(basename %b)"
            "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
            "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"))

    (setq org-latex-custom-lang-environments
          '((python "pythoncode")))

    (setq org-ditaa-jar-path "/usr/bin/ditaa")

    (set-face-attribute 'org-block-begin-line nil :family "Operator SSm" :slant 'normal)
    (set-face-attribute 'org-block-end-line nil :family "Operator SSm" :slant 'normal)

    (defun org-generate-link-description (url description)
      (cond
       ((string-match "jirap" url)
        (replace-regexp-in-string "https://jira.+/browse/" "" url))
       ((string-match "github" url)
        (replace-regexp-in-string "https://github.+\com/" "" url))
       (t description)
       ))

    (setq org-make-link-description-function 'org-generate-link-description)

    ;; Org-babel
    (setq org-babel-load-languages
          (append org-babel-load-languages
                  '((R . t)
                    (emacs-lisp . t)
                    (python . t)
                    (sh . t)
                    (haskell . t)
                    (js . t)
                    (latex . t)
                    (scheme . t)
                    (gnuplot . t)
                    (C . t)
                    (sql . t)
                    (ditaa . t))))

    (defun org-check-misformatted-subtree ()
      "Check misformatted entries in the current buffer."
      (interactive)
      (show-all)
      (org-map-entries
       (lambda ()
         (when (and (move-beginning-of-line 2)
                    (not (looking-at org-heading-regexp)))
           (if (or (and (org-get-scheduled-time (point))
                        (not (looking-at (concat "^.*" org-scheduled-regexp))))
                   (and (org-get-deadline-time (point))
                        (not (looking-at (concat "^.*" org-deadline-regexp)))))
               (when (y-or-n-p "Fix this subtree? ")
                 (message "Call the function again when you're done fixing this subtree.")
                 (recursive-edit))
             (message "All subtrees checked."))))))

    (defun org-mode/prettify-symbols ()
      (push '("href-link" . ?) prettify-symbols-alist)
      (prettify-symbols-mode))

    (add-hook 'org-mode-hook 'org-mode/prettify-symbols)

    ;; (setq org-hide-emphasis-markers t)
    ;; (regexp-opt (list " @@html:</kbd>@@[a-zA-Z0-9k ]"))
    ;; Got the org-link from
    ;; http://emacs.stackexchange.com/questions/7323/how-to-add-new-markup-to-org-mode-html-export
    ;; (org-add-link-type "kbd" #'ignore #'spacemacs/export-kbd-tag)
    ;; (defun spacemacs/export-kbd-tag (path desc format)
    ;;   "Export org audio links to hmtl."
    ;;   (cl-case format
    ;;     (html (format "<kbd>%s</kbd>" (or desc "")))
    ;;     (latex (format "(HOW DO I EXPORT AUDIO TO LATEX? \"%s\")" path))))
    ;; check out https://github.com/capitaomorte/yasnippet/issues/349

    )
  )

(defun org-cestdiego/init-org-protocol-github-lines ()
  (use-package org-protocol-github-lines
    :config
    (setq org-protocol-github-project-directories
          '("~/Projects/"))
    (setq org-protocol-github-projects
          '(("syl20bnr/spacemacs" . "~/.emacs.d")))
    ))

(defun org-cestdiego/post-init-org-projectile ()
  (setq org-projectile-capture-template "* TODO %?\n  %i\n  %a"))
