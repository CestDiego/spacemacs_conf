;;; packages.el --- soundcloud Layer packages File for Spacemacs
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
(setq soundcloud-packages
    '(
      emms
      soundcloud
      ))

;; List of packages to exclude.
(setq soundcloud-excluded-packages '())

(defun soundcloud/init-emms ()
  (use-package emms
    :config
    (emms-standard)
    (emms-default-players)
    ))

(defun soundcloud/init-soundcloud ()
  (use-package soundcloud
    ))
