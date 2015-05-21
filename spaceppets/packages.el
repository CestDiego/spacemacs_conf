;;; packages.el --- spaceppets Layer packages File for Spacemacs
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
(defvar spaceppets-packages
  '(
    yasnippet
    ))

(defun spaceppets/post-init-yasnippet ()
  ;; (setq spaceppets::dir (file-name-directory
  ;;                        (or load-file-name buffer-file-name)))
  (setq spaceppets::dir
        (concat (ht-get configuration-layer-paths 'spaceppets)
                "spaceppets"))
  (eval-after-load 'yasnippet
    '(progn
       (defun spaceppets-initialize ()
         (let ((snip-dir (expand-file-name
                          "snippets"
                          spaceppets::dir)))
           (add-to-list 'yas-snippet-dirs snip-dir t)
           (yas-load-directory snip-dir)))
       (spaceppets-initialize)))
  )
