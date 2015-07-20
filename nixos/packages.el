(setq nix-packages '(nix-mode
                     company
                     nixos-options
                     helm-nixos-options
                     company-nixos-options))

(defun nix/init-nix-mode ()
  (use-package nix-mode))

(defun nix/init-nixos-options ()
  (use-package nixos-options))

(defun nix/init-helm-nixos-options ()
  (use-package helm-nixos-options
    :config
    (evil-leader/set-key
      "h>" 'helm-search-nixos-options)))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun nix/post-init-company ()
    (spacemacs|add-company-hook nix-mode)
    (push 'company-capf company-backends-nix-mode))

  (defun nix/init-company-nixos-options ()
    (use-package company-nixos-options
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :init
      (push 'company-nixos-options company-backends-nix-mode))))
