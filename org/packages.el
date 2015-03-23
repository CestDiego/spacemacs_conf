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

(defvar org-packages
  '(
    ;; package org-babels go here
    org
    ob-browser
    org-projectile
    org-gcal
    ox-ioslide
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar org-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function org/init-<package-org-babel>
;;
(defun org/init-org ()
  "Initialize my package"
  (use-package org
    :init
    (progn
      (setq org-confirm-babel-evaluate nil)
      (setq org-src-fontify-natively t)
      (setq org-src-tab-acts-natively t)

      (org-babel-do-load-languages
       'org-babel-load-languages
       '((R . t)
         (emacs-lisp . t)
         (python . t)
         (sh . t)
         (haskell . t)
         (js . t)
         (latex . t)
         (gnuplot . t)
         (C . t)
         (sql . t)
         (ditaa . t)
         ))
      (setq org-ditaa-jar-path "/usr/bin/ditaa")
      )))

(defun org/init-ob-browser()
  (use-package ob-browser
    :init
    (progn
      (add-to-list 'exec-path "/home/io/.installed/phantomjs/bin")
      (setenv "PATH" (mapconcat 'identity exec-path ":"))
      )))

(defun org/init-org-projectile ()
  (use-package org-projectile
    :ensure t
    :config
    (progn
      (org-projectile:per-repo)
      (setq org-projectile:per-repo-filename "TODO.org"
            org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
      (add-to-list 'org-capture-templates (org-projectile:project-todo-entry "p"))
      (add-to-list 'org-capture-templates (org-projectile:project-todo-entry "l" "* TODO %? %a\n" "Linked Project TODO"))
      (evil-leader/set-key
        "oc" 'org-capture
        "opc" 'org-projectile:project-todo-completing-read)
      )))

(defun org/init-org-gcal ()
  (use-package org-gcal
    :init
    (setq org-gcal-client-id "245586477436-efhjaq0vfr8i07t4inqkmi417hvd3gak.apps.googleusercontent.com"
          org-gcal-client-secret "QmOmh-flucrRo1a_mtNQaQb-"
          org-gcal-file-alist '(("cestdiego@gmail.com" .  "~/Dropbox/Org-Notes/personal.org")
                                ("ao267thudhi3o29famivcckt9c@group.calendar.google.com" .  "~/Dropbox/Org-Notes/ayers.org")))
    (evil-leader/set-key
      "mgf" 'org-gcal-fetch
      "mgp" 'org-gcal-post-at-point
      "mgr" 'org-gcal-refresh-token)
    ))

(defun org/init-ox-ioslide ()
  (use-package ox-ioslide
    :config
    (require 'ox-ioslide-helper)))
