;;; packages.el --- misc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Diego Berrocal <cestdiego@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `misc-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `misc/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `misc/pre-init-PACKAGE' and/or
;;   `misc/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst misc-packages
  '(
    handoff
    )
  )

(defun misc/init-handoff ()
  (use-package handoff
    :defer t
    :init
    (spacemacs|add-toggle handoff
      :mode handoff-mode
      :documentation "Get your hands off the mouse!"
      :evil-leader "t!")
    ))


;;; packages.el ends here
