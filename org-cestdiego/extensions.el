;;; extensions.el --- org-cestdiego Layer extensions File for Spacemacs
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

(defvar org-cestdiego-post-extensions
  '(
    ox-koma-letter
    org-page
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function org-cestdiego/init-<extension-org-cestdiego>
;;

(defun org-cestdiego/init-org-page ()
  (use-package org-page
    :commands (op/do-publication op/new-post op/new-repository)))

(defun org-cestdiego/init-ox-koma-letter ()
  "Initialize ox-koma-letter"
  (use-package ox-koma-letter
    :init
    (add-to-list 'org-latex-classes
                 '("my-letter"
                   "\\documentclass\[%
      DIV=14,
      fontsize=12pt,
      parskip=half,
      subject=titled,
      backaddress=false,
      fromalign=left,
      fromemail=true,
      fromphone=true\]\{scrlttr2\}
      \[DEFAULT-PACKAGES]
      \[PACKAGES]
      \[EXTRA]"))
    (setq org-koma-letter-default-class "my-letter")
    (add-to-list 'org-latex-packages-alist '("AUTO" "babel" t) t)
    )
  )
