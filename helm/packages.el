;;; packages.el --- helm Layer packages File for Spacemacs
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

(defvar helm-packages
  '(
    helm-dash
    helm-mt
    helm-open-github
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar helm-excluded-packages '()
  "List of packages to exclude.")

(defun helm/init-helm-dash ()
  (use-package helm-dash
    :init
    (setq helm-dash-docsets-path (concat spacemacs-cache-directory "helm-dash-docset/"))
    :config
    (setq helm-dash-common-docsets '("JavaScript")) 
    (evil-leader/set-key
      "mah" 'helm-dash
      "maa" 'helm-dash-at-point)
    )
  )

(defun helm/init-helm-mt ()
  "Initialize my package"
  (use-package helm-mt
    :init
    (progn
      (evil-leader/set-key
        "ash" 'helm-mt)
      ))
  )

(defun helm/init-helm-open-github ()
  "Initialize my package"
  (use-package helm-open-github
    :init
    (progn
      (evil-leader/set-key
        "hoc" 'helm-open-github-from-commit
        "hoi" 'helm-open-github-from-issues
        "hof" 'helm-open-github-from-file
        "hop" 'helm-open-github-from-pull-requests
        )
      ))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
