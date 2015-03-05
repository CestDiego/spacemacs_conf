;;; extensions.el --- cp2k Layer extensions File for Spacemacs
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

(defvar cp2k-post-extensions
  '(
    cp2k-mode
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function cp2k/init-<extension-cp2k>
;;
(defun cp2k/init-cp2k-mode ()
  "Initialize cp2k-mode"
  :init
  (progn
    (require 'cp2k-mode nil 'noerror)
    (add-to-list 'auto-mode-alist '("\\.in\\'" . cp2k-mode))
    ))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
