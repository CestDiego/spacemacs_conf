;;; packages.el --- Monfoku Layer packages File for Spacemacs
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
(setq Monfoku-packages
    '(
      nodejs-repl
      babel-repl
      skewer-mode
      livid-mode
      (mocha-snippets :location (recipe :fetcher github
                                        :repo "cestdiego/mocha-snippets.el"))
      ))


(defun Monfoku/init-mocha-snippets ()
  (use-package mocha-snippets))


(defun Monfoku/init-nodejs-repl ()
  (use-package nodejs-repl
    :init
    (spacemacs/declare-prefix-for-mode 'js2-mode "msn" "nodejs-repl")
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode
      "sni" 'nodejs-repl
      "snb" 'nodejs-repl-send-buffer
      "snr" 'nodejs-repl-send-region
      "nee" 'nodejs-repl-send-last-sexp)
    ))


(defun Monfoku/init-babel-repl ()
  (use-package babel-repl
    :defer t
    :init
    (setq babel-repl-cli-arguments '())
    (spacemacs/declare-prefix-for-mode 'js2-mode "msB" "babel-repl")
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode
      "sBr" 'spacemacs/babel-repl-send-dwi
      "sBb" 'spacemacs/babel-repl-send-buffer
      "sBB" 'spacemacs/babel-repl-send-buffer-and-switch)

    (defun spacemacs/babel-repl-send-dwim ()
      (interactive)
      (unless (comint-check-proc "*babel-shell*")
        (with-selected-window (selected-window)
          (babel-repl)))
      (babel-repl-send-dwim))

    (defun spacemacs/babel-repl-send-dwim-and-switch ()
      (interactive)
      (unless (comint-check-proc "*babel-shell*")
        (with-selected-window (selected-window)
          (babel-repl)))
      (let ((babel-repl-pop-to-buffer t))
        (babel-repl-send-dwim)))

    (defun spacemacs/babel-repl-send-buffer ()
      (interactive)
      (unless (comint-check-proc "*babel-shell*")
        (with-selected-window (selected-window)
          (babel-repl)))
      (babel-repl-send-buffer))

    (defun spacemacs/babel-repl-send-buffer-and-switch ()
      (interactive)
      (unless (comint-check-proc "*babel-shell*")
        (with-selected-window (selected-window)
          (babel-repl)))
      (let ((babel-repl-pop-to-buffer t))
        (babel-repl-send-buffer)))
    ))


(defun Monfoku/init-skewer-mode ()
  (use-package skewer-mode
    :defer t
    :init
    (add-hook 'js2-mode-hook 'skewer-mode)
    ;; This starts the server process
    ;; Otherwise we need to call httpd-start or run-skewer manually
    (defun spacemacs/run-skewer ()
      (interactive)
      (let ((httpd-port 1337))
        (run-skewer)))
    :config
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode
      "ss" 'spacemacs/run-skewer
      "si" 'skewer-repl
      "sb" 'skewer-load-buffer
      "ee" 'skewer-eval-last-expression
      "ep" 'skewer-eval-print-last-expression
      "sf" 'skewer-eval-defun)))

(defun Monfoku/init-livid-mode ()
  (use-package livid-mode
    :defer t
    :init
    (progn
      (defalias 'js-live-eval 'livid-mode
        "Minor mode for automatic evaluation of a JavaScript buffer on every change")
      (evil-leader/set-key-for-mode 'js2-mode "st" 'js-live-eval))))
