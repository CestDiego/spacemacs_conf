;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.

   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; MY Own layers
     appearance
     (blog :variables
           org-page-use-melpa-version nil
           org-page-built-directory "~/Projects/le_blog_built/")
     eshell
     org-cestdiego
     presentations
     soundcloud
     twitter
     utils
     ;; (exwm :variables
     ;;       exwm-app-launcher--prompt " "
     ;;       exwm--hide-tiling-modeline t
     ;;       exwm--terminal-command "termite")
     ;; nand2tetris

     ;; Spacemacs
     gnus
     nixos
     dash
     ;; Version Control
     version-control
     (git :variables
          git-magit-status-fullscreen t)
     github
     ;; Other stuff
     prodigy
     (colors :variables
             colors-enable-nyan-cat-progress-bar `,(display-graphic-p)
             colors-enable-rainbow-identifiers nil)

     ;; (perspectives :variables
     ;;               spacemacs-persp-show-home-at-startup t
     ;;               perspectives-display-help t)
     ;; eyebrowse
     chrome
     (erc :variables
          erc-enable-sasl-auth t)
     (rcirc :variables
            rcirc-default-nick "cestdiego"
            rcirc-default-user-name "cestdiego"
            rcirc-default-full-name "Diego Berrocal"
            rcirc-enable-znc-support t)
     html
     restclient
     ;; Org
     (org :variables
          org-mapping-style 'worf)
     ;; Miscellaneous
     emoji
     (wakatime :variables
               wakatime-api-key    "813b0d78-1f17-43eb-bede-a5c008651d4a"
               wakatime-cli-path   "/run/current-system/sw/bin/wakatime"
               wakatime-python-bin "/run/current-system/sw/bin/python")
     ;; Completings Stuff
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets"
                      auto-completion-return-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-complete-with-key-sequence "jk")
     ;; (ycmd :variables
     ;;       ycmd-server-command "~/build/ycmd/")
     ;; Syntax Checking Stuff
     spell-checking
     syntax-checking
     ;; Shells
     (shell :variables
            shell-protect-eshell-prompt t
            shell-default-shell 'ansi-term
            shell-pop-autocd-to-working-dir nil
            shell-default-term-shell "zsh")
     ;; Lang
     ;;; LIISSSSSPPPPPSSSS
     clojure
     emacs-lisp
     scheme
     ;;; Other
     ansible
     markdown
     cp2k
     html
     latex
     c-c++
     python
     ipython-notebook
     sql
     haskell
     javascript
     react
     ruby
     extra-langs
     ranger
     ;; Utils
     search-engine
     xkcd
     games
     spotify
     vagrant)
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dostspacemacs/config'.
   dotspacemacs-additional-packages '(visual-fill-column
                                      babel-repl
                                      key-chord
                                      w3m
                                      sicp
                                      beacon
                                      systemd)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(erc-yank
                                    erc-gitter)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         tao-yin
                         tao-yang
                         spacemacs-dark
                         aurora
                         zenburn ;; This works without erc
                         ;; spacemacs-light
                         ;; leuven  ;; This works without erc
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Knack PNFT Plus Font Awesome Plu"
                               :size 19
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-global-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all',
   ;; `trailing', `changed' or `nil'. Default is `changed' (cleanup whitespace
   ;; on changed lines) (default 'changed)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq-default evil-escape-key-sequence "jk")
  (setq source-directory "~/Projects/emacs"
        dotspacemacs-verbose-loading t
        helm-ag-command-option " --search-zip "
        delete-by-moving-to-trash t
        ;; Only Useful with `SPC t ~'
        vi-tilde-fringe-bitmap-array [#b00000000
                                      #b00000000
                                      #b00010000
                                      #b00111000
                                      #b01111100
                                      #b00111000
                                      #b00010000
                                      #b00000000])
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ;; enable smartparens in hybrid insert state
  ;; (key-chord-define override-global-map (kbd "d;") 'evil-delete)
  (global-evil-mc-mode)
  (fset 'evil-visual-update-x-selection 'ignore)
  (defun cestiego/pretty-symbols (new-pretty-symbols)
    (mapcar (lambda (item)
              (push item prettify-symbols-alist))
            new-pretty-symbols))

  (beacon-mode 1)

  (setq helm-echo-input-in-header-line nil)

  (dolist (b sp-smartparens-bindings)
    (evil-define-key 'hybrid emacs-lisp-mode-map (kbd (car b)) (cdr b)))

  (add-hook 'org-mode-hook (lambda ()
                      (push
                       '(?! . ( "#+begin_src" . "#+end_src"))
                       evil-surround-pairs-alist)))

  (defun maybe-you-mean-editor-finish? (orig-fun &rest args)
    (let ((current-C-c-C-c (key-binding (kbd "C-c C-c") t))
          )
      (if (eq current-C-c-C-c 'with-editor-finish)
          (with-editor-finish nil)
        (apply orig-fun args))))

  (advice-add 'evil-write :around #'maybe-you-mean-editor-finish?)

  (add-hook 'with-editor-mode-hook 'evil-normalize-keymaps)
  (evil-define-key 'normal with-editor-mode-map ",c" 'with-editor-finish)
  (evil-define-key 'normal with-editor-mode-map ",a" 'with-editor-cancel)

  (global-set-key (kbd "C-s") 'helm-swoop)

  (global-vi-tilde-fringe-mode -1)
  (spacemacs/toggle-mode-line-minor-modes-off)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (spacemacs/toggle-mode-line-battery-on)

  (setq magit-push-always-verify nil)


  (spacemacs/add-to-hooks
   (lambda ()
     (cestiego/pretty-symbols
      '(("add-hook" . ?)
        ("defun" . ?𝆑)
        ("?" . ?)
        ("=>" .  ?)
        )))
   '(emacs-lisp-mode-hook))

  ;;; SANE DEFAULTS!!
  (add-hook 'visual-line-mode-hook 'visual-fill-column-mode)

  ;; UTF-8 please
  (setq locale-coding-system    'utf-8) ; pretty
  (set-terminal-coding-system   'utf-8) ; pretty
  (set-keyboard-coding-system   'utf-8) ; pretty
  (set-selection-coding-system  'utf-8) ; pretty
  (prefer-coding-system         'utf-8) ; please
  (set-language-environment     'utf-8) ; with sugar on top

  (when (configuration-layer/layer-usedp 'rcirc)
    (setq rcirc-server-alist
          '(("freenode"
             :host "freenode.berrocal.me"
             :port "1984"
             :auth "cestdiego/freenode"
             :channels ("#emacs"))
            ("geekshed"
             :host "geekshed.berrocal.me"
             :port "1984"
             :auth "cestdiego/geekshed"
             :channels ("#jupiterbroadcasting")))))

  (eval-after-load 'org2blog
    (progn
      (setq org2blog/wp-blog-alist
            '(("astro-fc"
               :url "http://astronomia.uni.edu.pe/xmlrpc.php"
               :username "cestdiego"
               :default-title "Hello World"
               :default-categories ("org2blog" "emacs")
               :tags-as-categories nil)))
      (setq org2blog/wp-confirm-post t)))

  ;; (setq web-mode-enable-current-column-highlight t)

  (when (configuration-layer/package-usedp 'persp-mode)

    ;; (spacemacs|define-custom-persp "NixOS Configuration"
    ;;   :binding "N"
    ;;   :body
    ;;   (dired "~/Projects/nixpkgs/pkgs/")
    ;;   (split-window-right)
    ;;   (find-file "~/nixos-config/common/desktop.nix"))

    ;; (spacemacs|define-custom-persp "Blog"
    ;;   :binding "b"
    ;;   :body
    ;;   (when (y-or-n-p "Hi, do you want to create a new post?")
    ;;     (call-interactively 'op/new-post)))

    ;; (spacemacs|define-custom-persp "@bspwm"
    ;;   :binding "B"
    ;;   :body
    ;;   (find-file "~/dotbspwm/.config/sxhkd/sxhkdrc")
    ;;   (split-window-right-and-focus)
    ;;   (find-file "~/dotbspwm/.config/bspwm/bspwmrc")
    ;;   (split-window-below-and-focus)
    ;;   (find-file "~/dotbspwm/.config/bspwm/autostart"))
    )

  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "chromium")

  (defadvice evil-inner-word (around underscore-as-word activate)
    (let ((table (copy-syntax-table (syntax-table))))
      (modify-syntax-entry ?_ "w" table)
      (with-syntax-table table
        ad-do-it)))

  ;; (setq python-shell-virtualenv-path "~/Enthought/Canopy_64bit/User/")
  ;; (setq python-shell-interpreter "~/Enthought/Canopy_64bit/User/bin/python")

  ;; (setenv "PYTHONPATH" "/home/io/build/horton-dev")
  ;; (setenv "HORTONDATA" "/home/io/build/horton-dev/data")

  ;; (setq python-shell-virtualenv-path "/usr/")

  (setq python-shell-interpreter "ipython")
  ;; (setq python-shell-interpreter-args "-i --gui=wx")


  (setq powerline-default-separator 'alternate)
  (setq vc-follow-symlinks t)

  (setq zone-timer (run-with-idle-timer 6000 t 'zone))
  (setq zone-programs [zone-pgm-rotate-LR-lockstep])

  (when (configuration-layer/package-usedp 'nyan-mode)
    (nyan-mode -1))

  (setq tab-width 2)

  (when (configuration-layer/layer-usedp 'prodigy)
    (prodigy-define-service
      :name "HackSpace"
      :command "nodemon"
      :args '("dev" )
      :cwd "~/Projects/flat"
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)

    (prodigy-define-service
      :name "Chulip Server"
      :command "npm"
      :args '("run" "dev" )
      :cwd "~/Projects/chulip"
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)

    (prodigy-define-service
      :name "Le Blog"
      :command "takeapeek"
      :cwd "~/Projects/le-blog-built"
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)
    )

  (when (configuration-layer/layer-usedp 'syntax-checking)
    (setq flycheck-emacs-lisp-load-path 'inherit)
    )

  (when (configuration-layer/layer-usedp 'shell)
    (setq eshell-rc-script (expand-file-name
                            ".eshellrc"
                            (car dotspacemacs-configuration-layer-path))
          eshell-path-env exec-path)

    (evil-define-key 'normal term-raw-map
      "p" 'term-paste) ;; why paste-microstate doesn't work?

    (evil-define-key 'hybrid term-raw-map
      (kbd "C-S-k") 'term-send-up
      (kbd "C-S-j") 'term-send-down
      (kbd "C-y")   'term-paste
      (kbd "<C-backspace>") 'term-send-raw-meta)

    (evil-define-key 'hybrid comint-mode-map
      (kbd "C-S-k") 'comint-previous-matching-input-from-input
      (kbd "C-S-j") 'comint-next-matching-input-from-input
      (kbd "C-p") 'comint-previous-input
      (kbd "C-n") 'comint-next-input
      (kbd "<C-backspace>") 'backward-kill-word)

    (evil-define-key 'hybrid eshell-mode-map
      (kbd "C-k") 'eshell-previous-input
      (kbd "C-y") 'evil-paste-after
      (kbd "C-j") 'eshell-next-input)

    (evil-define-key 'hybrid cider-repl-mode-map
      (kbd "C-k") 'cider-repl-backward-input
      (kbd "C-j") 'cider-repl-forward-input
      (kbd "C-r") 'cider-repl-previous-matching-input
      (kbd "C-s") 'cider-repl-next-matching-input)

    (add-to-list 'helm-completing-read-handlers-alist '(pony-manage . ido))

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;; OVERRIDING GLOBALLY STUFF ;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (defvar custom-keys-mode-map (make-keymap) "custom-keys-mode keymap.")
    (define-minor-mode custom-keys-mode
      "A minor mode so that my key settings override annoying major modes."
      t " my-keys" 'custom-keys-mode-map)
    (custom-keys-mode 1)

    (defun my-minibuffer-setup-hook ()
      (custom-keys-mode 0))
    (add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

    (defadvice load (after give-my-keybindings-priority)
      "Try to ensure that my keybindings always have priority."
      (if (not (eq (car (car minor-mode-map-alist)) 'custom-keys-mode))
          (let ((mykeys (assq 'custom-keys-mode minor-mode-map-alist)))
            (assq-delete-all 'custom-keys-mode minor-mode-map-alist)
            (add-to-list 'minor-mode-map-alist mykeys))))

    (ad-activate 'load)

    (define-key custom-keys-mode-map (kbd "C-\"") 'org-cycle-agenda-files)
    (define-key custom-keys-mode-map (kbd "C-'") 'spacemacs/default-pop-shell)

    (when (configuration-layer/package-usedp 'eyebrowse)
      (define-key custom-keys-mode-map (kbd "<C-s-tab>") 'eyebrowse-next-window-config)
      (define-key custom-keys-mode-map (kbd "<C-s-iso-lefttab>") 'eyebrowse-prev-window-config))

    (when (configuration-layer/package-usedp 'persp-mode)
      (define-key custom-keys-mode-map (kbd "<C-tab>") 'spacemacs//perspectives-persp-next-n)
      (define-key custom-keys-mode-map (kbd "<C-iso-lefttab>") 'spacemacs//perspectives-persp-prev-p))

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;; FINISH LE GLOBAL OVERRIDE ;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    )

  (when (configuration-layer/layer-usedp 'erc)
    ;; IRC
    (erc-track-mode -1)
    (add-hook 'erc-insert-pre-hook
       (defun bb/erc-foolish-filter (msg)
         "Ignores messages matching `erc-foolish-content'."
         (when (erc-list-match erc-foolish-content msg)
           (setq erc-insert-this nil))))
    (add-hook 'erc-insert-modify-hook
       (defun bb/erc-github-filter ()
         "Shortens messages from gitter."
         (interactive)
         (when (and (< 18 (- (point-max) (point-min)))
                    (string= (buffer-substring (point-min)
                                               (+ (point-min) 18))
                             "<gitter> [Github] "))
           (dolist (regexp '(" \\[Github\\]"
                             " \\(?:in\\|to\\) [^ /]+/[^ /:]+"
                             "https?://github\\.com/[^/]+/[^/]+/[^/]+/"
                             "#issuecomment-[[:digit:]]+"))
             (goto-char (point-min))
             (when (re-search-forward regexp (point-max) t)
               (replace-match "")))
           (goto-char (point-min))
           (when (re-search-forward "[[:digit:]]+$" (point-max) t)
             (replace-match (format "(#%s)" (match-string 0)))))))
    (setq-default erc-nick "cestdiego"
                  erc-user-full-name "Diego Berrocal"
                  erc-fill-function 'erc-fill-static
                  erc-fill-static-center 19
                  erc-prompt-for-nickserv-password nil
                  erc-image-inline-rescale 300
                  erc-hide-list '("JOIN" "PART" "QUIT" "NICK")
                  erc-foolish-content '("\\[Github\\].* starred"
                                        "\\[Github\\].* forked"
                                        "\\[Github\\].* synchronize a Pull Request"
                                        "\\[Github\\].* labeled an issue in"
                                        "\\[Github\\].* unlabeled an issue in")))

  ;; Insert thing at point for Helm-aG!!
  ;; (setq helm-ag-insert-at-point 'symbol)
  ;; (setq helm-ag-fuzzy-match t)

  (when (configuration-layer/layer-usedp 'react)
    (defun spacemacs/toggle-web-js2-mode ()
      (interactive)
      (if (eq major-mode 'js2-mode)
          (progn
            (web-mode)
            (setq web-mode-content-type "html"))
        (js2-mode)))
    (evil-leader/set-key-for-mode 'web-mode
      "m," 'spacemacs/toggle-web-js2-mode)
    (evil-leader/set-key-for-mode 'js2-mode
      "m," 'spacemacs/toggle-web-js2-mode))

  (when (configuration-layer/layer-usedp 'javascript)
    (setq js2-global-externs '("require" "module" "jest" "jasmine"
                               "it" "expect" "describe" "beforeEach"))
    (defun js2-imenu-make-index ()
      (save-excursion
        ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
        (imenu--generic-function '(("describe" "\\s-*describe\(\"\\(.+\\)\",.*" 1)
                                   ("it" "\\s-*it\(\"\\(.+\\)\",.*" 1)
                                   ("before" "\\s-*before\(\"\\(.+\\)\",.*" 1)
                                   ("after" "\\s-*after\(\"\\(.+\\)\",.*" 1)
                                   ;;add more keyword for mocha here
                                   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                   ))))

    (add-hook 'js2-mode-hook
       (lambda ()
         (setq imenu-create-index-function 'js2-imenu-make-index)))

    (spacemacs/add-to-hooks
     (lambda ()
       (cestiego/pretty-symbols
        '(("function" . ?𝆑)
          ("React" . ?)
          ("?" . ?)
          ("=>" .  ?)
          ("() =>" . ?λ))))
     '(js2-mode-hook web-mode-hook))
    ;; Fix Identation in JS
    (setq-default javascript-indent-lever         2
                  js-indent-level                 2
                  js-switch-indent-offset         2
                  js2-basic-offset                2
                  js2-indent-switch-body          2
                  js2-strict-missing-semi-warning nil
                  ;; coffeescript
                  coffee-tab-width                2
                  ;; web-mode
                  css-indent-offset               2
                  web-mode-markup-indent-offset   2
                  web-mode-css-indent-offset      2
                  web-mode-code-indent-offset     2
                  web-mode-attr-indent-offset     2)

    (with-eval-after-load 'web-mode
      (setq emmet-expand-jsx-className? t)
      (define-key web-mode-map (kbd "C-j") 'emmet-expand-line)
      (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

    (defun json-format ()
      (interactive)
      (save-excursion
        (shell-command-on-region (mark) (point)
                                 "python -m json.tool" (buffer-name) t)))
    (add-to-list 'auto-mode-alist '("\\.tern-config\\'" . json-mode))
    (add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))
    (add-to-list 'auto-mode-alist '("dmenuExtended_preferences.txt\\'" . json-mode)))

  (when (configuration-layer/layer-usedp 'html)
    (add-to-list 'auto-mode-alist '("\\.touchegg.conf\\'" . web-mode)))

  (when (configuration-layer/layer-usedp 'blog)
    (setq op/personal-github-link "https://github.com/CestDiego/")
    (setq op/repository-directory "~/Projects/le_blog/")
    (setq op/site-domain "http://cestdiego.github.io/")
    ;; This two are optional , only if you want have a custom theme
    (setq op/theme-root-directory "~/.spacemacs.d/blog/themes/")
    (setq op/theme 'just_right)
    (setq op/site-main-title "Diego Berrocal")
    (setq op/site-sub-title "it's personal")

    (setq op/personal-disqus-shortname "cestdiego")
    (setq op/personal-google-analytics-id "UA-40864129-3"))

  (when (configuration-layer/layer-usedp 'exwm)
    ;; Helm should show only in its current window
    (exwm-input-set-key (kbd "s-p") #'spacemacs/exwm-application-launcher)
    (setq helm-display-function
          (lambda (buf)
            (pop-to-buffer buf
                           '(display-buffer-below-selected . ((window-height . 0.4)
                                                              (side . 'bottom)))))))

  ;;; BEGIN: Mouse Support
  (global-set-key (kbd "<C-s-mouse-4>") (lambda () (interactive)
                                          (spacemacs/zoom-frm-in)
                                          (spacemacs//zoom-frm-powerline-reset)))
  (global-set-key (kbd "<C-s-mouse-5>") (lambda () (interactive)
                                          (spacemacs/zoom-frm-out)
                                          (spacemacs//zoom-frm-powerline-reset)))
  (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
  (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
  ;;; END: Mouse Support

  ;;; BEGIN: Extra Hybrid Modes
  (push 'git-commit-major-mode evil-insert-state-modes)
  (push 'image-mode evil-insert-state-modes)
  ;;; END:   Extra Hybrid Modes

  ;;; BEGIN: Custom Hybrid Bindings
  (define-key evil-hybrid-state-map (kbd "S-<return>") 'evil-open-below)
  ;;; END:   Custom Hybrid Bindings

  ;;; BEGIN: Multiple Cursors
  (define-key evil-hybrid-state-map (kbd "C-;") 'mc/edit-lines)
  (define-key evil-hybrid-state-map (kbd "C-:") 'mc/mark-all-like-this-dwim)
  ;;; END:   Multiple Cursors

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;; THERE BE DRAGONS AFTER THIS POINT   ;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun create-empty-modeline-frame ()
    (interactive)
    (with-current-buffer (generate-new-buffer "*empty*")
      (make-frame '((minibuffer . nil)
                    (unsplittable . t)
                    (buffer-predicate . (lambda (x) nil))
                    (height . 2)
                    (left-fringe . 0)
                    (right-fringe . 0)
                    (tool-bar-lines . 0)
                    (menu-bar-lines . 0)))
      (set-window-dedicated-p
       (get-buffer-window (current-buffer) t) t)))

  (set-face-attribute 'helm-selection nil
                      :inherit t)

  (set-face-attribute 'helm-selection-line nil
                      :inherit t)

  ;; (set-face-attribute 'mode-line-inactive nil
  ;;                     :underline "#202020"
  ;;                     :box nil
  ;;                     :height 1
  ;;                     :background (face-background 'default))

  ;; (add-to-list 'default-frame-alist '(minibuffer))
  ;; ;; (add-to-list 'default-frame-alist '(unsplittable . t))
  ;; (add-to-list 'minibuffer-frame-alist '(minibuffer . only))
  ;; (add-to-list 'minibuffer-frame-alist '(left . 525))
  ;; (add-to-list 'minibuffer-frame-alist '(top . -1))
  ;; (add-to-list 'minibuffer-frame-alist '(width . 100))
  ;; (add-to-list 'minibuffer-frame-alist '(name . "Minibuf"))

  ;; (setq magit-repository-directories "~")

  (defun my-expand-lines ()
    (interactive)
    (let ((hippie-expand-try-functions-list
           '(try-expand-line)))
      (call-interactively 'hippie-expand)))

  (define-key evil-insert-state-map (kbd "C-x C-l") 'my-expand-lines)

  ;; (defadvice he-substitute-string (after he-paredit-fix)
  ;;   "remove extra paren when expanding line in paredit"
  ;;   (if (and paredit-mode (equal (substring str -1) ")"))
  ;;       (progn (backward-delete-char 1) (forward-char))))

  ;;   (evil-define-command evil-edit (file &optional bang)
  ;;     "Open FILE.
  ;; If no FILE is specified, reload the current buffer from disk."
  ;;     :repeat nil
  ;;     (interactive "<f><!>")
  ;;     (let* ((projectile-require-project-root nil)
  ;;            (default-directory (projectile-project-root)))
  ;;       (if file
  ;;           (find-file file)
  ;;         (revert-buffer bang (or bang (not (buffer-modified-p))) t))))

  (global-prettify-symbols-mode)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(compilation-message-face (quote default))
 '(org-agenda-files
   (quote
    ("~/Dropbox/Org-Notes/main.org" "~/Dropbox/Org-Notes/links.org")))
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values
   (quote
    ((set-input-method "latin-1-prefix" t)
     (firestarter let
                  ((org-html-htmlize-output-type
                    (quote css)))
                  (op/do-publication t t org-page-built-directory))
     (firestarter op/do-publication t t "~/Projects/le_blog_built")
     (eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (emacs-lisp-mode)
           (when
               (fboundp
                (quote flycheck-mode))
             (flycheck-mode -1))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons ".." load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
