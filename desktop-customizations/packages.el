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
      oneonone
      ))

(defun desktop-customizations/init-ov ()
  (use-package ov
    :config
    (defun insert-font-awesome ()
      (interactive)
      (ov-set (ov-insert (call-interactively 'fontawesome))
              'face '(:family "FontAwesome" :height 1.5)))))

(defun desktop-customizations/init-oneonone ()
  (use-package oneonone
    :init
    (evil-leader/set-key
      "oo" '1on1-emacs)
    :config
    ;; (add-to-list 'initial-frame-alist '(minibuffer))
    ;; (add-to-list 'minibuffer-frame-alist '(minibuffer . only)) ;
    ;; (setq 1on1-*Completions*-frame-flag nil)

    ;; (setq 1on1-special-frame-background "#272822"
    ;;       1on1-minibuffer-frame-background "#272822"
    ;;       1on1-default-frame-background "#272822"
    ;;       1on1-completions-frame-background "#272822"
    ;;       1on1-help-frame-background "#272822"
    ;;       1on1-inactive-minibuffer-frame-background "#272822"
    ;;       1on1-active-minibuffer-frame-background "#575852"
    ;;       1on1-isearch-minibuffer-frame-background "#272822"
    ;;       1on1-help-frame-background "#272822")


    ;; (setq 1on1-default-frame-alist '((minibuffer))
    ;;       1on1-special-display-frame-alist nil
    ;;       1on1-minibuffer-frame-left 5
    ;;       1on1-minibuffer-frame-top/bottom -1
    ;;       1on1-minibuffer-frame-height 2
    ;;       1on1-minibuffer-frame-width nil
    ;;       1on1-minibuffer-frame-width-percent 98
    ;;       1on1-minibuffer-frame-height 2
    ;;       )
    (1on1-emacs)
  ))
