;;; packages.el --- nand2tetris Layer packages File for Spacemacs
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
(setq nand2tetris-packages
    '(
      eldoc
      (nand2tetris :location local)
      company
      ))


(when (configuration-layer/layer-usedp 'auto-completion)
  (defun nand2tetris/post-init-company ()
    (spacemacs|add-company-hook nand2tetris-mode)
    (push 'company-capf company-backends-nand2tetris-mode)))

(defun nand2tetris/post-init-eldoc ()
  (add-hook 'nand2tetris-mode-hook 'eldoc-mode))

(defun nand2tetris/init-nand2tetris ()
  (use-package nand2tetris
    :init
    (setq nand2tetris-core-base-dir "~/Google Drive/nand2tetris")
    :config
    (when (configuration-layer/package-usedp 'company)
      (push 'company-nand2tetris company-backends-nand2tetris-mode))))
