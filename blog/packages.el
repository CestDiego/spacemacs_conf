;;; packages.el --- blog Layer packages File for Spacemacs
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
(setq blog-packages '(
                      (org-page :location local)
                      ht
                      mustache
                      ))

;; (if org-page-use-melpa-version
;;       (push 'org-page blog-packages)
;;   ;; If we are using the extension, install dependencies
;;   (push '(org-page :location local) blog-packages)
;;   (push 'mustache blog-packages)
;;   (push 'ht blog-packages))

(defun blog/init-org-page ()
  (use-package org-page
    :commands (op/do-publication op/new-post op/new-repository)
    :init
    (spacemacs/set-leader-keys
      "opo" '(lambda () (interactive)
               (magit-status op/repository-directory))
      "opp" '(lambda() (interactive)
               (let ((org-html-htmlize-output-type 'css))
                 (op/do-publication t nil t nil))
               (find-file op/repository-directory))
      "opP" '(lambda() (interactive)
               (let ((org-html-htmlize-output-type 'css))
                 (op/do-publication t t org-page-built-directory))))
    (setq org-html-doctype "html5")
    (setq org-html-html5-fancy t)
    (defface strike-through
      '((t :strike-through t))
      "Basic strike-through face."
      :group 'basic-faces)
    (unless (file-exists-p org-page-built-directory)
      (make-directory org-page-built-directory))
    :config
    (push '("+" ,(if (featurep 'xemacs) 'org-table strike-through)) org-emphasis-alist)))

(defun blog/init-mustache ()
  (use-package mustache))

(defun blog/init-ht ()
  (use-package ht))
