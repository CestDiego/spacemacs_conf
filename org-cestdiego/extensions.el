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
    :commands (op/do-publication op/new-post op/new-repository)
    :init
    (setq org-html-html5-fancy t)
    (setq org-html-htmlize-output-type 'css)
    (setq theme-faces-for-generation
          '(font-lock-comment-delimiter-face
            font-lock-comment-face
            rainbow-delimiters-depth-1-face
            highlight-numbers-number
            font-lock-constant-face
            font-lock-string-face
            font-lock-keyword-face
            font-lock-variable-name-face
            rainbow-delimiters-depth-2-face
            font-lock-function-name-face
            rainbow-delimiters-depth-3-face
            font-lock-type-face
            font-lock-preprocessor-face
            font-lock-negation-char-face
            rainbow-delimiters-depth-4-face
            clojure-keyword-face
            clojure-interop-method-face
            css-selector css-property
            rainbow-delimiters-depth-5-face
            haskell-operator-face
            haskell-constructor-face
            haskell-definition-face
            haskell-keyword-face
            font-lock-doc-face
            c-annotation-face julia-macro-face
            org-default underline
            tuareg-font-lock-operator-face
            tuareg-font-lock-governing-face
            tuareg-font-lock-module-face
            tuareg-font-lock-constructor-face
            rainbow-delimiters-unmatched-face
            font-lock-builtin-face
            ;; Org
            org-level-1
            org-level-2
            org-level-3
            org-level-4
            org-special-keyword
            org-meta-line
            org-document-info
            org-document-info-keyword
            org-document-title
            org-tag
            org-table
            org-level-5 org-level-6 org-level-7 org-level-8
            org-list-dt bold italic underline org-verbatim org-code org-footnote
            org-done  org-date org-todo org-link
            org-checkbox org-block-begin-line
            org-block-end-line))

    (defface strike-through
      (org-compatible-face nil
        '((t :strike-through t)))
      "Face for strike-through textn."
      :group 'basic-faces)
    (push '("+" strike-through verbatim) org-emphasis-alist)

    (defun kek-html-htmlize-generate-css ()
      (interactive)
      (require 'htmlize)
      (and (get-buffer "*html*") (kill-buffer "*html*"))
      (with-temp-buffer
        (let ((fl theme-faces-for-generation)
              (htmlize-css-name-prefix "org-")
              (htmlize-output-type 'css)
              f i)
          (while (setq f (pop fl)
                       i (and f (face-attribute f :inherit)))
            (when (and (symbolp f) (or (not i) (not (listp i))))
              (insert (org-add-props (copy-sequence "1") nil 'face f))))
          (htmlize-region (point-min) (point-max))))
      (org-pop-to-buffer-same-window "*html*")
      (goto-char (point-min))
      (if (re-search-forward "<style" nil t)
          (delete-region (point-min) (match-beginning 0)))
      (if (re-search-forward "</style>" nil t)
          (delete-region (1+ (match-end 0)) (point-max)))
      (beginning-of-line 1)
      (if (looking-at " +") (replace-match ""))
      (goto-char (point-min)))
    ))

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
