;;; extensions.el --- utils Layer extensions File for Spacemacs
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


(setq utils-post-extensions
  '(
    ;; frames-only-mode
    ;; i3-emacs
    ;; mode-line-frame
    ))

(defun utils/init-i3-emacs ()
  (use-package i3-integration
    :config
    (i3-one-window-per-frame-mode-on)
    (i3-advise-visible-frame-list-on)))

(defun utils/init-mode-line-frame ()
  (use-package mode-line-frame
    :init
    (evil-leader/set-key
      "tmC" 'mode-line-frame-create)
    ))

;; (defun utils/init-frames-only-mode ()
;;   (use-package frames-only-mode))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
