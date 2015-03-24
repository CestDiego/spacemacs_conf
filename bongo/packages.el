;;; packages.el --- bongo Layer packages File for Spacemacs
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

(defvar bongo-packages
  '(
    ;; package bongos go here
    bongo
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar bongo-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function bongo/init-<package-bongo>
;;
(defun bongo/init-bongo ()
  "Initialize my package"
  (use-package bongo
    :init
    (progn
      ;; (add-to-list 'evil-emacs-state-modes 'bongo-library-mode)
      ;; (add-to-list 'evil-emacs-state-modes 'bongo-playlist-mode)
      (evil-leader/set-key
        "aB" 'bongo)
      ))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
