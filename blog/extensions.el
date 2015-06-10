;;; extensions.el --- blog Layer extensions File for Spacemacs
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

(setq blog-post-extensions '())

(unless org-page-use-melpa-version
  (push 'org-page blog-post-extensions))

(defun blog/init-org-page ()
  (use-package org-page
    :commands (op/do-publication op/new-post op/new-repository)
    :init
    (evil-leader/set-key
      "opo" '(lambda () (interactive)
               (magit-status op/repository-directory))
      "opp" '(lambda() (interactive)
               (op/do-publication t nil t nil)
               (find-file op/repository-directory))
      "opP" '(lambda() (interactive)
               (op/do-publication t t org-page-built-directory)))
    (setq org-html-doctype "html5")
    (setq org-html-html5-fancy t)
    (setq org-html-htmlize-output-type 'css)
    (defface strike-through
      '((t :strike-through t))
      "Basic strike-through face."
      :group 'basic-faces)
    (push '("+" ,(if (featurep 'xemacs) 'org-table strike-through)) org-emphasis-alist)

    :config
    (unless (file-exists-p org-page-built-directory)
      (make-directory org-page-built-directory))))
