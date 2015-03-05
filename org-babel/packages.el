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

(defvar org-babel-packages
  '(
    ;; package org-babels go here
    org
    ob-browser
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar org-babel-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function org-babel/init-<package-org-babel>
;;
(defun org-babel/init-org ()
  "Initialize my package"
  (use-package org
    :init
    (progn
      (setq org-confirm-babel-evaluate nil)
      (setq org-src-fontify-natively t)
      (setq org-src-tab-acts-natively t)

      (defface org-block-begin-line
        '((t (:underline "#5f5f5f" :box "#5f5f5f" :overline "#5f5f5f" :foreground "#7f9f7f" :background "#010101")))
        "Face used for the line delimiting the begin of source blocks.")
      (defface org-block-end-line
        '((t (:overline "#5f5f5f" :box "#5f5f5f" :underline "#5f5f5f" :foreground "#7f9f7f" :background "#010101")))
        "Face used for the line delimiting the end of source blocks.")

      (defface org-block
        '((t (:background "#dadada")))
        "Face used for the source block background.")
      (defface org-block-background
        '((t (:background "#dadada")))
        "Face used for the source block background.")
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

(defun org-babel/init-ob-browser()
  (use-package ob-browser
    :init
    (progn
      (add-to-list 'exec-path "/home/io/.installed/phantomjs/bin")
      (setenv "PATH" (mapconcat 'identity exec-path ":"))
      )))
