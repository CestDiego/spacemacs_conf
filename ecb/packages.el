(defvar ecb-packages
  '(
    ecb
    ))

(defun ecb/init-ecb()
  (use-package ecb
    :init
    (progn
      ;; (require 'epc)
      ;; (require 'epcs)

      ;; (let ((connect-function
      ;;        (lambda (mngr) 
      ;;          (epc:define-method mngr 'echo (lambda (&rest x) x) "args" "just echo back arguments.")
      ;;          (epc:define-method mngr 'add '+ "args" "add argument numbers.")
      ;;          )) server-process)

      ;;   (setq server-process (epcs:server-start connect-function))
      ;;   (sleep-for 10)
      ;;   (epcs:server-stop server-process))
      ;; (message "EPC has been loaded")
      ))) 
