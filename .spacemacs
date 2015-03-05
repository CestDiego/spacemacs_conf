;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Variables

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '("~/spacemacs_conf/")
 ;; List of contribution to load.
 dotspacemacs-configuration-layers '(
                                     appearance
                                     git
                                     aggressive
                                     prodigy
                                     perspectives
                                     org-repo-todo
                                     rcirc
                                     html
                                     restclient
                                     paradox
                                     ;; org-projectile
                                     ;; LaTeX 
                                     auctex
                                     ;; Lang
                                     html
                                     python
                                     haskell
                                     javascript
                                     )
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only)
 dotspacemacs-fullscreen-at-startup nil
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non nil pressing 'jk' in insert state, ido or helm will activate the
 ;; evil leader.
 dotspacemacs-feature-toggle-leader-on-jk nil
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '(fancy-narrow
                                  )
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
 ;; Default theme applied at startup
 dotspacemacs-default-theme 'zenburn
 )

;; Functions

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."

  ;;;; Lines should be 80 characters wide, not 72
  (setq fill-column 80)

  (setq git-enable-github-support t)

  (set-face-background 'region "#0f0f0f")
  (when (window-system)
    (custom-set-faces
     '(default ((t (:family "Source Code Pro" :height 110))))
     )
    (set-frame-font "-adobe-Source Code Pro for Powerline-semibold-normal-normal-*-*-*-*-*-m-0-iso10646-1"))

  ;; (fringe-mode -1)
  (set-fringe-mode '(0 . 0))
  (set-face-attribute 'fringe nil :background "#1a1a1a")
  (set-face-attribute 'mode-line nil  :inverse-video nil :box nil)
  (set-face-attribute 'mode-line-inactive nil :box nil)
  (set-face-attribute 'vertical-border nil :foreground "#1a1a19")

  (setq evil-escape-key-sequence "nj")
  
  (setq delete-by-moving-to-trash t)
  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

  ;;; SANE DEFAULTS!!
  ;; decent navigation like a good citizen
  (global-set-key (kbd "<C-tab>") 'persp-cycle-next)
  (global-set-key (kbd "<C-S-iso-lefttab>") 'persp-cycle-prev)
  ;; Don't break lines for me, please
  (setq-default powerline-height 24)

  ;; UTF-8 please
  (setq locale-coding-system 'utf-8) ; pretty
  (set-terminal-coding-system 'utf-8) ; pretty
  (set-keyboard-coding-system 'utf-8) ; pretty
  (set-selection-coding-system 'utf-8) ; please
  (prefer-coding-system 'utf-8) ; with sugar on top
  (set-language-environment 'utf-8)
  ;; Sentences do not need double spaces to end. Period.
  (set-default 'sentence-end-double-space nil)

  (eval-after-load 'rcirc 
    '(progn
       (setq rcirc-default-nick "cestdiego")
       (setq rcirc-default-user-name "cestdiego")
       (setq rcirc-default-full-name "Diego Berrocal")
       ))

  ;; (setq guide-key-tip/enabled 
  ;;       (if window-system t))
  ;; (require 'git-gutter)
  ;; (setq git-gutter:modified-sign " ")
  ;; (setq git-gutter:added-sign " ")
  ;; (setq git-gutter:deleted-sign " ")
  ;; ---------------------------------------------------

  ;; (setq company-idle-delay 0.0
  ;;       company-minimum-prefix-length 1
  ;;       company-require-match nil
  ;;       company-transformers '(company-sort-by-occurrence)
  ;;       company-show-numbers t
  ;;       company-tooltip-limit 20
  ;;       company-dabbrev-ignore-case t
  ;;       company-dabbrev-downcase nil
  ;;       company-tooltip-flip-when-above t
  ;;       company-frontends '(company-pseudo-tooltip-frontend)
  ;;       company-clang-prefix-guesser 'company-mode/more-than-prefix-guesser)

  (setq browse-url-generic-program
        (substring (shell-command-to-string "gconftool-2 -g /desktop/gnome/applications/browser/exec") 0 -1)
        browse-url-browser-function 'browse-url-generic)


  ;; Python Specific stuff
  (setq python-shell-virtualenv-path "~/.virtualenvs")
  
  )
;; Custom variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-inhibit-face-list nil)
 '(expand-region-contract-fast-key "V")
 '(expand-region-reset-fast-key "r")
 '(magit-use-overlays nil)
 '(paradox-automatically-star t)
 '(org-agenda-files (quote ("~/holi.org")))
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :height 110))))
 '(auto-dim-other-buffers-face ((t (:background "#1f1f1f")))))
