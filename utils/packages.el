;;; packages.el --- utils Layer packages File for Spacemacs
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

(defvar utils-packages
  '(
    string-inflection
    evil-annoying-arrows
    pdf-tools
    aggressive-fill-paragraph
    python-environment
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar utils-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function utils/init-<package-utils>
;;
(defun utils/init-string-inflection ()
  "Initialize my package"
  (use-package string-inflection
    :init
    (progn
      (evil-leader/set-key
        "msi" 'string-inflection-cycle)
      ))
  )

(defun utils/init-evil-annoying-arrows ()
  "Initialize my package"
  (use-package evil-annoying-arrows-mode
    :init
    (global-evil-annoying-arrows-mode)
    )
  )

(defun utils/init-pdf-tools ()
  "Initialize my package"
  (use-package pdf-tools
    :init
    (progn
      (pdf-tools-install)
      (evil-leader/set-key-for-mode 'pdf-view-mode
        "h" 'image-backward-hscroll
        "l" 'image-forward-hscroll
        ))))

(defun utils/init-aggressive-fill-paragraph()
  (use-package aggressive-fill-paragraph
    :init
    (afp-setup-recommended-hooks)))

(defun utils/init-python-environment()
  (use-package python-environment
    :init
    (progn
      (require 'python-environment)
      (defun YOUR-PLUGIN-install-python-dependencies ()
        (interactive)
        (python-environment-run "pip" "install" "grip"))
      )))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
