;;; packages.el --- org2blog Layer packages File for Spacemacs
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

(defvar org2blog-packages
  '(
    ;; package org2blogs go here
    org2blog
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar org2blog-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function org2blog/init-<package-org2blog>
;;
(defun org2blog/init-org2blog ()
  "Initialize my package"
  (use-package org2blog
    :init
    (progn

      ))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
