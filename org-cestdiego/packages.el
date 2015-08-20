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
    ;; package org-babels go here
    org
    ob-http
    ob-mongo
    ob-browser
    org-gcal
    ox-ioslide
    ox-cv
    mustache
    ht
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar org-excluded-packages '()
  "List of packages to exclude.")


(defun org-cestdiego/init-ob-http()
  (use-package ob-http))

(defun org-cestdiego/init-ob-mongo()
  (use-package ob-mongo))

(defun org-cestdiego/post-init-org()
  "Initialize my package"
  (setq org-startup-folded nil)
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (setq org-confirm-babel-evaluate nil)
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

  (setq org-latex-packages-alist '(("" "color" t) ("" "minted" t) ("" "parskip" t))
        org-latex-pdf-process
        '("pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
          "bibtex $(basename %b)"
          "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"
          "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f"))

  (setq org-latex-custom-lang-environments
        '((python "pythoncode")))

  (setq org-ditaa-jar-path "/usr/bin/ditaa")

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
    (push '("href-link" . ?) prettify-symbols-alist))

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

  ;;; Org Agenda
  (setq org-agenda-custom-commands
        '(("v" tags "Movies")
          ("e" tags "Eventos")))

  ;;; Capture Templates
  ;;;; Add idea, mind-onanism, contacts, movies to download das
  (setq org-capture-templates
        '(("t" "Todo" entry
           (file+headline "gtd.org" "Tasks")
           "* TODO %?\n %i\n")
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
          ("L" "Temp Links from the interwebs" item
           (file+headline "links.org" "Temporary Links")
           "%?\nEntered on %U\n \%i\n %a")
          ("w" "Weight Log" table-line (file+headline "weight.org" "Diario de Peso") " | %? | %t |")
          ("c" "Lucuma Clock In" table-line (file+headline "lucuma.org" "Bitácora de Asistencia") " | %T |")))
  )

(defun org-cestdiego/init-ob-browser()
  (use-package ob-browser
    :init
    (progn
      ;; (add-to-list 'exec-path "/home/io/.installed/phantomjs/bin")
      (setenv "PATH" (mapconcat 'identity exec-path ":"))
      )))

(defun org-cestdiego/init-org-gcal ()
  (use-package org-gcal
    :init
    (setq org-gcal-client-id "245586477436-efhjaq0vfr8i07t4inqkmi417hvd3gak.apps.googleusercontent.com"
          org-gcal-client-secret "QmOmh-flucrRo1a_mtNQaQb-"
          org-gcal-file-alist '(("cestdiego@gmail.com" .  "~/Dropbox/Org-Notes/personal.org")
                                ("ao267thudhi3o29famivcckt9c@group.calendar.google.com" .  "~/Dropbox/Org-Notes/ayers.org")))
    (evil-leader/set-key
      "ogf" 'org-gcal-fetch
      "ogp" 'org-gcal-post-at-point
      "ogr" 'org-gcal-refresh-token)
    ))

(defun org-cestdiego/init-ox-ioslide ()
  (use-package ox-ioslide
    :config
    (require 'ox-ioslide-helper)))
