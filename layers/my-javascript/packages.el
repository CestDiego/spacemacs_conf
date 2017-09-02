;;; packages.el --- my-javascript layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
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
;; added to `my-javascript-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-javascript/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-javascript/pre-init-PACKAGE' and/or
;;   `my-javascript/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-javascript-packages
  '(
    ;; indium
    nodejs-repl
    )
  "The list of Lisp packages required by the my-javascript layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun spacemacs/nodejs-repl-start ()
  "Attach a browser to Emacs and start a indium REPL."
  (interactive)
  (split-window-below)
  (indium-run-node "node"))

(defun my-javascript/init-indium ()
  (use-package indium
    :defer t
    :init
    indium
    (progn
      (spacemacs/register-repl 'indium-repl-mode
                               'spacemacs/indium-repl-start "Indium NODE REPL")
      (add-hook 'js2-mode-hook 'indium-interaction-mode)
      )
    :config
    (progn

      ;; Funcs

(defun spacemacs/indium-repl-eval-buffer-and-focus ()
  "Execute whole buffer in browser and switch to REPL in insert state."
  (interactive)
  (indium-eval-buffer)
  (indium-switch-to-repl-buffer)
  (evil-insert-state))

(defun spacemacs/indium-eval-defun-and-focus ()
  "Execute whole buffer in browser and switch to REPL in insert state."
  (interactive)
  (indium-eval-defun)
  (indium-switch-to-repl-buffer)
  (evil-insert-state))

(defun spacemacs/indium-eval-region (beg end)
  "Execute the region as JavaScript code in the attached browser."
  (interactive "r")
  (indium-eval (buffer-substring beg end) #'indium-post-minibuffer))

(defun spacemacs/indium-eval-region-and-focus ()
  "Execute whole buffer in browser and switch to REPL in insert state."
  (interactive)
  (spacemacs/indium-eval-region)
  (indium-switch-to-repl-buffer)
  (evil-insert-state))

      (spacemacs/declare-prefix-for-mode 'js2-mode "ms" "repl-send")
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode
        "'" 'spacemacs/indium-repl-start
        "ee" 'indium-eval-last-node
        "sb" 'indium-eval-buffer
        "sB" 'spacemacs/indium-repl-eval-buffer-and-focus
        "si" 'spacemacs/indium-repl-start
        "sf" 'indium-eval-defun
        "sF" 'spacemacs/indium-eval-defun-and-focus
        "sr" 'spacemacs/indium-eval-region
        "sR" 'spacemacs/indium-eval-region-and-focus
        "ss" 'indium-repl)
      )
    ))

(defun spacemacs/nodejs-repl-start ()
  "Start a nodejs REPL"
  (interactive)
  (split-window-below-and-focus)
  (nodejs-repl)
  (evil-window-up))

(defun my-javascript/init-nodejs-repl ()
  (use-package nodejs-repl
    :defer t
    :init
    (progn
      (spacemacs/register-repl 'nodejs-repl-mode
                               'spacemacs/nodejs-repl-start "NODE REPL"))
    :config
    (progn

      ;; (defun spacemacs/nodejs-repl-eval-buffer ()
      ;;   "Execute whole buffer in repl "
      ;;   (interactive)
      ;;   ;; TODO: Figure out how to kill buffer without confirming
      ;;   (kill-buffer (process-buffer (nodejs-repl--get-or-create-process)))
      ;;   (nodejs-repl-send-buffer)
      ;;   )

      (defun spacemacs/nodejs-repl-eval-buffer-and-focus ()
        "Execute whole buffer in browser and switch to REPL in insert state."
        (interactive)
        (nodejs-repl-send-buffer)
        (nodejs-repl-switch-to-repl)
        (evil-insert-state))

      (defun spacemacs/indium-eval-region-and-focus ()
        "Execute whole buffer in browser and switch to REPL in insert state."
        (interactive)
        (nodejs-repl-send-region)
        (nodejs-repl-switch-to-repl)
        (evil-insert-state))

      (spacemacs/declare-prefix-for-mode 'js2-mode "ms" "repl-send")
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode
        "'" 'spacemacs/nodejs-repl-start
        "ee" 'nodejs-repl-send-last-expression
        "sb" 'nodejs-repl-send-buffer
        "sB" 'spacemacs/nodejs-repl-eval-buffer-and-focus
        "si" 'spacemacs/nodejs-repl-start
        "sr" 'nodejs-repl-send-region
        "sR" 'spacemacs/nodejs-repl-eval-region-and-focus
        "ss" 'nodejs-repl-switch-to-repl)
      )
    ))

;;; packages.el ends here
