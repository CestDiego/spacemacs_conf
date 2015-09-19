(defvar appearance-packages
  '(
    auto-dim-other-buffers
    hexrgb
    (nerd-fonts :location local)
    (spacemacs-theme :location
                     (recipe :fetcher github
                             :repo "CestDiego/spacemacs-theme"))
    ))

(defun appearance/init-nerd-fonts ()
  (use-package nerd-fonts
    :init
    (evil-leader/set-key
      "hn" 'helm-nerd-fonts)))

(defun appearance/init-spacemacs-theme ()
  (use-package spacemacs-theme
    :defer t
    :init
    (progn
      (setq spacemacs-theme-comment-bg t)
      (setq spacemacs-theme-org-height t))))

;; (defun appearance/init-auto-dim-other-buffers ()
;;   (use-package auto-dim-other-buffers
;;     :ensure hexrgb
;;     :init
;;     (defadvice load-theme (after activate)
;;       (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb
;;                                           (face-background 'default) 2 -2))
;;       (custom-set-faces
;;        '(auto-dim-other-buffers-face ((t :background dim-other-buffers-face-color))))

;;     :config
;;     (add-hook 'after-init-hook (lambda ()
;;                                  (when (fboundp 'auto-dim-other-buffers-mode)
;;                                    (auto-dim-other-buffers-mode t))))

;; )))

;; (defun appearance/init-hexrgb ()
;;   (use-package hexrgb
;;     :config
;;     (setq dim-other-buffers-face-color (hexrgb-increment-equal-rgb (face-background 'default) 2 -10))
;;     (set-face-attribute 'auto-dim-other-buffers-face nil
;;                         :background  dim-other-buffers-face-color)))
