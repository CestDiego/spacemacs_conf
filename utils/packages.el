;;; packages.el --- utils Layer packages File for Spacemacs
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

(defvar utils-packages
  '(
    define-word
    string-inflection
    ;; pdf-tools
    ;; aggressive-fill-paragraph
    helm
    python-environment
    firestarter
    flycheck-package
    general-close
    fontawesome
    wakatime-mode
    nameless
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defun utils/pre-init-wakatime-mode ()
  (spacemacs|use-package-add-hook wakatime-mode
    :post-config
    (defun wakatime-client-command (savep)
      "Return client command executable and arguments.
   Set SAVEP to non-nil for write action."
      (format "%s --file \"%s\" %s --plugin %s/%s --key %s --time %.2f"
              wakatime-cli-path
              (buffer-file-name (current-buffer))
              (if savep "--write" "")
              wakatime-user-agent
              wakatime-version
              wakatime-api-key
              (float-time)))
    )
  )

(defun utils/init-nameless ()
  (use-package nameless
    :defer t
    :init
    ;; :vars nameless-prefix `:'
    ;; :face nameless-face
    ;; C-c C-- inserts the prefix
    (add-hook 'emacs-lisp-mode-hook #'nameless-mode-from-hook)
    (setq nameless-private-prefix t)
    ))


(defun utils/post-init-helm ()
  ;; Helm command to display HTTP status codes.
  (defvar helm-httpstatus-source
    '((name . "HTTP STATUS")
      (candidates . (("100 Continue") ("101 Switching Protocols")
                     ("102 Processing") ("200 OK")
                     ("201 Created") ("202 Accepted")
                     ("203 Non-Authoritative Information") ("204 No Content")
                     ("205 Reset Content") ("206 Partial Content")
                     ("207 Multi-Status") ("208 Already Reported")
                     ("300 Multiple Choices") ("301 Moved Permanently")
                     ("302 Found") ("303 See Other")
                     ("304 Not Modified") ("305 Use Proxy")
                     ("307 Temporary Redirect") ("400 Bad Request")
                     ("401 Unauthorized") ("402 Payment Required")
                     ("403 Forbidden") ("404 Not Found")
                     ("405 Method Not Allowed") ("406 Not Acceptable")
                     ("407 Proxy Authentication Required") ("408 Request Timeout")
                     ("409 Conflict") ("410 Gone")
                     ("411 Length Required") ("412 Precondition Failed")
                     ("413 Request Entity Too Large")
                     ("414 Request-URI Too Large")
                     ("415 Unsupported Media Type")
                     ("416 Request Range Not Satisfiable")
                     ("417 Expectation Failed") ("418 I'm a teapot")
                     ("422 Unprocessable Entity") ("423 Locked")
                     ("424 Failed Dependency") ("425 No code")
                     ("426 Upgrade Required") ("428 Precondition Required")
                     ("429 Too Many Requests")
                     ("431 Request Header Fields Too Large")
                     ("449 Retry with") ("500 Internal Server Error")
                     ("501 Not Implemented") ("502 Bad Gateway")
                     ("503 Service Unavailable") ("504 Gateway Timeout")
                     ("505 HTTP Version Not Supported")
                     ("506 Variant Also Negotiates")
                     ("507 Insufficient Storage") ("509 Bandwidth Limit Exceeded")
                     ("510 Not Extended")
                     ("511 Network Authentication Required")))
      (action . message)))

  (defun helm-httpstatus ()
    (interactive)
    (helm-other-buffer '(helm-httpstatus-source) "*helm httpstatus*"))
  (evil-leader/set-key
    "hh" 'helm-httpstatus)
      )

(defun utils/init-fontawesome ()
  (use-package fontawesome
    :init
    (evil-leader/set-key
      "fa" 'helm-fontawesome)
    ))


(defun utils/init-general-close ()
  (use-package general-close
    :config
    (global-set-key (kbd "M-`") 'general-close)
    ))


(defun utils/init-flycheck-package ()
  (use-package flycheck-package
    :defer t
    :config
    (flycheck-package-setup)
    ))

(defun utils/init-define-word ()
  (use-package define-word
    :init
    (evil-leader/set-key
      "gd" 'define-word
      "gD" 'define-word-at-point)
    ))

(defun utils/init-string-inflection ()
  "Initialize my package"
  (use-package string-inflection
    :init
    (progn
      (evil-leader/set-key
        "msi" 'string-inflection-cycle)
      ))
  )

;;(defun utils/init-pdf-tools ()
;;  "Initialize my package"
;;  (use-package pdf-tools
;;    :init
;;    (progn
;;      (pdf-tools-install)
;;      (evil-leader/set-key-for-mode 'pdf-view-mode
;;        "h" 'image-backward-hscroll
;;        "l" 'image-forward-hscroll
;;        ))))

;; (defun utils/init-aggressive-fill-paragraph()
;;   (use-package aggressive-fill-paragraph
;;     :init
;;     (afp-setup-recommended-hooks)))

(defun utils/init-python-environment()
  (use-package python-environment
    :init
    (setq python-environment-directory "~/.emacs.d/.cache/python-environment")
    :config
    (defun install-python-dependencies ()
      (interactive)
      (python-environment-run '("pip" "install" "grip"))
      )
    ))

(defun utils/init-firestarter ()
  (use-package firestarter
    :init
    (firestarter-mode)
    ))
