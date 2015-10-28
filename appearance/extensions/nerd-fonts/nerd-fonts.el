;;; nerd-fonts.el --- nerd-fonts utility

;; Copyright (C) 2015 by Diego Berrocal

;; Author: Diego Berrocal <cestdiego@gmail.com>
;; URL: https://github.com/CestDiego/emacs-nerd-fonts
;; Version: 0.02
;; Package-Requires: ((helm "1.7.2") (cl-lib "0.5"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'nerd-fonts-data)
(require 'helm)

;;;###autoload
(defun nerd-fonts (font-name)
  "Return nerd-fonts code point"
  (interactive
   (list (nerd-fonts--completing-read)))
  (assoc-default font-name nerd-fonts-alist))

(defun nerd-fonts--propertize (glyph)
  (propertize glyph 'face '(:family "Knack PNFT Plus Font Awesome Plu" :height 2.0)))

(defun nerd-fonts-get-candidates-from-alists (le-font)
  (mapcar (lambda (font)
            (cons (concat (car font)
                          " -> "
                          (nerd-fonts--propertize
                           (cdr font)))
                  (cdr font)))
          le-font))

(defun nerd-fonts--seti-ui-candidates ()
  (nerd-fonts-get-candidates-from-alists seti-ui-alist))
(defun nerd-fonts--fontawesome-candidates ()
  (nerd-fonts-get-candidates-from-alists fontawesome-alist))
(defun nerd-fonts--devicons-candidates ()
  (nerd-fonts-get-candidates-from-alists devicons-alist))
(defun nerd-fonts--pomicons-candidates ()
  (nerd-fonts-get-candidates-from-alists pomicons-alist))

(defun nerd-fonts-insert-propertized-candidate (candidate)
  (insert (nerd-fonts--propertize candidate)))

(setq nerd-fonts--pomicons-source
      (helm-build-sync-source "Pomicons"
        :candidates #'nerd-fonts--pomicons-candidates
        :action '(("Insert" . nerd-fonts-insert-propertized-candidate))))

(setq nerd-fonts--fontawesome-source
      (helm-build-sync-source "Font Awesome"
        :candidates #'nerd-fonts--fontawesome-candidates
        :action '(("Insert" . nerd-fonts-insert-propertized-candidate))))

(setq nerd-fonts--devicons-source
      (helm-build-sync-source "Devicons"
        :candidates #'nerd-fonts--devicons-candidates
        :action '(("Insert" . nerd-fonts-insert-propertized-candidate))))

(setq nerd-fonts--seti-ui-source
      (helm-build-sync-source "Seti UI"
        :candidates #'nerd-fonts--seti-ui-candidates
        :action '(("Insert" . nerd-fonts-insert-propertized-candidate))))

(defvar helm-nerd-fonts-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map helm-map)
    (define-key map (kbd "<C-return>")    'helm-nerd-fonts-persistent-insert)
    map)
  "Keymap for `helm-nerd-fonts'.")

;;;###autoload
(defun helm-nerd-fonts ()
  (interactive)
  (helm
   :prompt "Select icon: "
   :buffer "*Nerd Fonts*"
   :sources '(nerd-fonts--fontawesome-source
                   nerd-fonts--seti-ui-source
                   nerd-fonts--devicons-source
                   nerd-fonts--pomicons-source)))

(provide 'nerd-fonts)

;;; nerd-fonts.el ends here
