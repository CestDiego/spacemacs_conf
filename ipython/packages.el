;;; packages.el --- ipython Layer packages File for Spacemacs
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
(setq ipython-packages
    '(
      ein
      ))

(defun ipython/init-ein ()
  (use-package ein
    :commands ein:notebooklist-open
    :init
    (evil-leader/set-key
      "ain" 'ein:notebooklist-open)
    :config
    (defun spacemacs/ein:worksheet-merge-cell-next ()
      (interactive)
      (ein:worksheet-merge-cell (ein:worksheet--get-ws-or-error) (ein:worksheet-get-current-cell) t t))

    (spacemacs|define-micro-state ipython-notebook
      :use-minibuffer t
      :evil-leader "ein"
      :bindings
      ("q" nil :exit t)
      ("h" ein:notebook-worksheet-open-prev-or-last)
      ("j" ein:worksheet-goto-next-input)
      ("k" ein:worksheet-goto-prev-input)
      ("l" ein:notebook-worksheet-open-next-or-first)
      ("H" ein:notebook-worksheet-move-prev)
      ("J" ein:worksheet-move-cell-down)
      ("K" ein:worksheet-move-cell-up)
      ("L" ein:notebook-worksheet-move-next)
      ("t" ein:worksheet-toggle-output)
      ("d" ein:worksheet-kill-cell)
      ("R" ein:worksheet-rename-sheet)
      ("y" ein:worksheet-copy-cell)
      ("p" ein:worksheet-yank-cell)
      ("o" ein:worksheet-insert-cell-below)
      ("O" ein:worksheet-insert-cell-above)
      ("RET" ein:worksheet-execute-cell-and-goto-next)
      ;; Output
      ("C-l" ein:worksheet-clear-output)
      ("C-S-l" ein:worksheet-clear-all-output)
      ;;Console
      ("C-o" ein:console-open)
      ;; Merge cells
      ("C-k" ein:worksheet-merge-cell)
      ("C-j" spacemacs/ein:worksheet-merge-cell-next)
      ;; Notebook
      ("C-s" ein:notebook-save-notebook-command)
      ("C-r" ein:notebook-rename-command)
      ("1" ein:notebook-worksheet-open-1th)
      ("2" ein:notebook-worksheet-open-2th)
      ("3" ein:notebook-worksheet-open-3th)
      ("4" ein:notebook-worksheet-open-4th)
      ("5" ein:notebook-worksheet-open-5th)
      ("6" ein:notebook-worksheet-open-6th)
      ("7" ein:notebook-worksheet-open-7th)
      ("8" ein:notebook-worksheet-open-8th)
      ("9" ein:notebook-worksheet-open-last)
      ("+" ein:notebook-worksheet-insert-next)
      ("-" ein:notebook-worksheet-delete)
      ("x" ein:notebook-close)
      )
    ))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
