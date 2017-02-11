;;; packages.el --- ocodo-svg-modeline Layer packages File for Spacemacs
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
(defvar ocodo-svg-modeline-packages
  '(
    ocodo-svg-modelines
    ))

;; List of packages to exclude.
(defvar ocodo-svg-modeline-excluded-packages '())

;; For each package, define a function ocodo-svg-modeline/init-<package-ocodo-svg-modeline>

(defun ocodo-svg-modeline/init-ocodo-svg-modelines ()
  (use-package ocodo-svg-modelines
    :config
    (ocodo-svg-modelines-init)
    ))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
