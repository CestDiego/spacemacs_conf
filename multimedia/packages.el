;;; packages.el ( --- multimedia Layer packages File for Spacemacs
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
(defvar multimedia-packages
  '(
    ;; package multimedias go here
    emms
    emms-player-simple-mpv
    ))

;; ;; List of packages to exclude.
;; (defvar multimedia-excluded-packages '())


;; (defun multimedia/init-emms ()
;;   (use-package emms
;;     :config
;;     (require 'emms-player-simple)
;;     (require 'emms-source-file)
;;     (require 'emms-source-playlist)
;;     ))

;; (defun multimedia/init-emms-player-simple-mpv ()
;;   (use-package emms-player-simple-mpv
;;     :init
;;     (add-to-list 'emms-player-list 'emms-player-mpv)
;;     (require 'emms)
;;     ;; An example of setting like emms-player-mplayer.el
;;     ;; `emms-player-mpv' is defined by `define-emms-simple-player-mpv'.
;;     (define-emms-simple-player-mpv mpv '(file url streamlist playlist)
;;       (concat "\\`\\(http[s]?\\|mms\\)://\\|"
;;               (apply #'emms-player-simple-regexp
;;                      "pls"
;;                      emms-player-base-format-list))
;;       "mpv" "--no-terminal" "--force-window=no" "--audio-display=no")

;;     (emms-player-simple-mpv-add-to-converters
;;      'emms-player-mpv "." '(playlist)
;;      (lambda (track-name) (format "--playlist=%s" track-name)))

;;     (spacemacs|define-micro-state emms-player-simple-mpv
;;       ;; :doc (spacemacs//workspaces-ms-documentation)
;;       ;; :use-minibuffer t
;;       :evil-leader "E"
;;       :bindings
;;       ("<left>"    (lambda () (interactive) (emms-seek (- 5))))
;;       ("S-<left>"  (lambda () (interactive) (emms-seek (- 1))))
;;       ("<down>"    (lambda () (interactive) (emms-seek (- 60))))
;;       ("S-<down>"  (lambda () (interactive) (emms-seek (- 5))))
;;       ("<right>"   (lambda () (interactive) (emms-seek 5)))
;;       ("S-<right>" (lambda () (interactive) (emms-seek 1)))
;;       ("<up>"      (lambda () (interactive) (emms-seek 60)))
;;       ("S-<up>"    (lambda () (interactive) (emms-seek 5)))
;;       ("["  emms-player-simple-mpv-speed-decrease)
;;       ("]"  emms-player-simple-mpv-speed-increase)
;;       ("{"  emms-player-simple-mpv-speed-halve)
;;       ("}"  emms-player-simple-mpv-speed-double)
;;       ("<backspace>" emms-player-simple-mpv-speed-normal)
;;       ("<" emms-player-simple-mpv-playlist-prev)
;;       (">" emms-player-simple-mpv-playlist-next)
;;       ("<return>" emms-player-simple-mpv-playlist-next)
;;       ("p" emms-pause)
;;       ("SPC" emms-pause)
;;       ("q" (lambda () (interactive)
;;              (when (y-or-n-p "Run emms-stop")
;;                (emms-stop))) :exit t)
;;       ("/" emms-volume-lower)
;;       ("*" emms-volume-raise)
;;       ("9" emms-volume-lower)
;;       ("0" emms-volume-raise)
;;       ("m" emms-player-simple-mpv-mute)
;;       ("f" emms-player-simple-mpv-fullscreen)
;;       ("T" emms-player-simple-mpv-ontop))
;;     ))
