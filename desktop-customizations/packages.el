;;; packages.el --- desktop-customizations Layer packages File for Spacemacs
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

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq desktop-customizations-packages
    '(
      ov
      ))

(defun desktop-customizations/init-ov ()
  (use-package ov
    :config
    (defun insert-font-awesome ()
      (interactive)
      (ov-set (ov-insert (call-interactively 'fontawesome)) 'face '(:family "FontAwesome" :height 1.5)))
    (evil-leader/set-key
      "if" 'insert-font-awesome)))
