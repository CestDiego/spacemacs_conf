;;; nix-mode.el --- Major mode for editing Nix expressions

;; Author: Eelco Dolstra
;; URL: https://github.com/NixOS/nix/tree/master/misc/emacs
;; Version: 1.0

;;; Commentary:

;;; Code:

(defconst nix-font-lock-keywords
  '("\\<if\\>" "\\<then\\>" "\\<else\\>" "\\<assert\\>" "\\<with\\>"
    "\\<let\\>" "\\<in\\>" "\\<rec\\>" "\\<inherit\\>" "\\<or\\>"
    ("\\<true\\>" . font-lock-builtin-face)
    ("\\<false\\>" . font-lock-builtin-face)
    ("\\<null\\>" . font-lock-builtin-face)
    ("\\<import\\>" . font-lock-builtin-face)
    ("\\<derivation\\>" . font-lock-builtin-face)
    ("\\<baseNameOf\\>" . font-lock-builtin-face)
    ("\\<toString\\>" . font-lock-builtin-face)
    ("\\<isNull\\>" . font-lock-builtin-face)
    ("[a-zA-Z][a-zA-Z0-9\\+-\\.]*:[a-zA-Z0-9%/\\?:@&=\\+\\$,_\\.!~\\*'-]+"
     . font-lock-constant-face)
    ("\\<\\([a-zA-Z_][a-zA-Z0-9_'\-\.]*\\)[ \t]*="
     (1 font-lock-variable-name-face nil nil))
    ("<[a-zA-Z0-9._\\+-]+\\(/[a-zA-Z0-9._\\+-]+\\)*>"
     . font-lock-constant-face)
    ("[a-zA-Z0-9._\\+-]*\\(/[a-zA-Z0-9._\\+-]+\\)+"
     . font-lock-constant-face))
  "Font lock keywords for nix.")

(defvar nix-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?/ ". 14" table)
    (modify-syntax-entry ?* ". 23" table)
    (modify-syntax-entry ?# "< b" table)
    (modify-syntax-entry ?\n "> b" table)
    (modify-syntax-entry ?' "\"" table)
    table)
  "Syntax table for Nix mode.")

;; Borrowed from python.el
(defsubst nix-syntax-count-quotes (quote-char &optional point limit)
  "Count number of quotes around point (max is 2).
QUOTE-CHAR is the quote char to count.  Optional argument POINT is
the point where scan starts (defaults to current point), and LIMIT
is used to limit the scan."
  (let ((i 0))
    (while (and (< i 3)
                (or (not limit) (< (+ point i) limit))
                (eq (char-after (+ point i)) quote-char))
      (setq i (1+ i)))
    i))

(setq nix-string-delimiter
  (rx (and
       ;; Match even number of backslashes.
       (or (not (any ?\\ ?\' ?\")) point
           ;; Quotes might be preceded by a escaped quote.
           (and (or (not (any ?\\)) point) ?\\
                (* ?\\ ?\\) (any ?\' ?\")))
       (* ?\\ ?\\)
       ;; Match single or double quotes of any kind.
       (group (or  "\"" "'" "''" "'''"))))
  )

(defconst nix-syntax-propertize-function
  (syntax-propertize-rules
   ((rx-to-string nix-string-delimiter t)
    (0 (ignore (nix-syntax-stringify))))))

(defun nix-syntax-stringify ()
  "Put `syntax-table' property correctly on double single quotes."
  (let* ((num-quotes (length (match-string-no-properties 1)))
         (ppss (prog2
                   (backward-char num-quotes)
                   (syntax-ppss)
                 (forward-char num-quotes)))
         ;; (string-start (and (not (nth 4 ppss)) (nth 8 ppss)))
         (string-start t)
         (quote-starting-pos (- (point) num-quotes))
         (quote-ending-pos (point))
         (num-closing-quotes
          (and string-start
               (nix-syntax-count-quotes
                (char-before) string-start quote-starting-pos))))
    (cond ((and string-start (= num-closing-quotes 0))
           ;; This set of quotes doesn't match the string starting
           ;; kind. Do nothing.
           nil)
          ((not string-start)
           ;; This set of quotes delimit the start of a string.
           (put-text-property quote-starting-pos (1+ quote-starting-pos)
                              'syntax-table (string-to-syntax "|")))
          ((= num-quotes num-closing-quotes)
           ;; This set of quotes delimit the end of a string.
           (put-text-property (1- quote-ending-pos) quote-ending-pos
                              'syntax-table (string-to-syntax "|")))
          ((> num-quotes num-closing-quotes)
           ;; This may only happen whenever a triple quote is closing
           ;; a single quoted string. Add string delimiter syntax to
           ;; all three quotes.
           (put-text-property quote-starting-pos quote-ending-pos
                              'syntax-table (string-to-syntax "|"))))))

(defun nix-indent-line ()
  "Indent current line for Nix Language."
  (interactive)
  (beginning-of-line)
  (if (bobp)
      (indent-line-to 0)		   ; First line is always non-indented
    (let ((not-indented t) cur-indent)
      (if (looking-at (rx (* blank) (or "]" "}" "let" "in"))) ; If the line we are looking at is the end of a block, then decrease the indentation
          (progn
            (save-excursion
              (forward-line -1)
              ;; Avoid empty lines
              (while (looking-at "^[ \t]*$")
                (forward-line -1))
              (setq cur-indent (- (current-indentation) tab-width)))
            (if (< cur-indent 0) ; We can't indent past the left margin
                (setq cur-indent 0)))
        (save-excursion
          (while not-indented ; Iterate backwards until we find an indentation hint
            (forward-line -1)
            (cond
             ;; Indent at the level of the latest block
             ((looking-at "^[ \t]*[]}]")
              (setq cur-indent (current-indentation))
              (setq not-indented nil)
              )
             ((and (not (looking-at "^[ \t]*#"))
                   (search-forward-regexp "}:" (line-end-position) t))
              (setq cur-indent (current-indentation))
              (setq not-indented nil)
              )
             ;; Indent an extra level new block begins
             ((looking-at "^[ \t]*[[{]")
              (setq cur-indent
                    (+ (current-indentation) tab-width))
              (setq not-indented nil)
              )
             ((search-forward-regexp "let\\|in" (line-end-position) t)
              (setq cur-indent
                    (+ (current-indentation) tab-width))
              (setq not-indented nil)
              )
             ;; If previous line ends with `['
             ((and (not (looking-at "^[ \t]*#"))
                   (search-forward-regexp "\\[" (line-end-position) t))
              (unless (search-forward-regexp "]" (line-end-position) t)
                (setq cur-indent
                      (+ (current-indentation) tab-width))
                (setq not-indented nil))
              )
             ((and (not (looking-at "^[ \t]*#"))
                   (search-forward-regexp "{" (line-end-position) t))
              (unless (search-forward-regexp "}" (line-end-position) t)
                (setq cur-indent
                      (+ (current-indentation) tab-width))
                (setq not-indented nil))
              )
             ((bobp) (setq not-indented nil))
             )
            ))
        )
      (if cur-indent
          (indent-line-to cur-indent)
        ;; If we didn't see an indentation hint, then allow no indentation
        (indent-line-to 0)))))

;;;###autoload
(define-derived-mode nix-mode prog-mode "Nix"
  "Major mode for editing Nix expressions.

The following commands may be useful:

  '\\[newline-and-indent]'
    Insert a newline and move the cursor to align with the previous
    non-empty line.

  '\\[fill-paragraph]'
    Refill a paragraph so that all lines are at most `fill-column'
    lines long.  This should do the right thing for comments beginning
    with `#'.  However, this command doesn't work properly yet if the
    comment is adjacent to code (i.e., no intervening empty lines).
    In that case, select the text to be refilled and use
    `\\[fill-region]' instead.

The hook `nix-mode-hook' is run when Nix mode is started.

\\{nix-mode-map}
"
  (set-syntax-table nix-mode-syntax-table)

  ;; Font lock support.
  (setq font-lock-defaults '(nix-font-lock-keywords nil nil nil nil))
  ;; (set (make-local-variable 'syntax-propertize-function)
  ;;      nix-syntax-propertize-function)

  ;; Automatic indentation [C-j].
  (set (make-local-variable 'indent-line-function) 'nix-indent-line)

  ;; Indenting of comments.
  (set (make-local-variable 'comment-start) "# ")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-start-skip) "\\(^\\|\\s-\\);?#+ *")

  ;; Filling of comments.
  (set (make-local-variable 'adaptive-fill-mode) t)
  (set (make-local-variable 'paragraph-start) "[ \t]*\\(#+[ \t]*\\)?$")
  (set (make-local-variable 'paragraph-separate) paragraph-start))


;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
  (add-to-list 'auto-mode-alist '("\\.nix.in\\'" . nix-mode)))

(provide 'nix-mode)

;;; nix-mode.el ends here
