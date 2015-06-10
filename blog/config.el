(defvar org-page-use-package t
  "If non-nil org-page will install package from MELPA, otherwise
  it will use the extension bundled in the layer")

(defvar org-page-built-directory (expand-file-name "org-page-built"
                                                   spacemacs-cache-directory)
  "Default directory to output the built files when exporting")

(defvar theme-faces-for-generation
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
    org-block-end-line)
  "Faces that are gonna be used by `kek-html-htmlize-generate-css' function")
