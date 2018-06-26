;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   `(yaml
     typescript
     ruby
     ;;;;;;;;;;;;;;; MY Own layers ;;;;;;;;;;;;;;;
     ;; no-dots
     misc
     mc-column
     appearance
     ;;(blog :variables
     ;;     org-page-use-melpa-version nil
     ;;     org-page-built-directory "~/Documents/Projects/le_blog_built/")
     org-cestdiego
     presentations
     utils
     ;; (exwm :variables
     ;;       exwm-app-launcher--prompt " "
     ;;       exwm--hide-tiling-modeline t
     ;;       exwm--terminal-command "termite")
     ;; nand2tetris

     ;;;;;;;;;;;;; Spacemacs ;;;;;;;;;;;;;
     ;; Not ready yet because doesn't support multiple arguments
     ;; (ivy :variables
     ;;      ivy-extra-directories nil)
     ;; (elfeed :variables
     ;;         elfeed-enable-web-interface t
     ;;         rmh-elfeed-org-files (list "~/Google Drive/Org-Notes/elfeed.org"))
     ;; ,(unless (eq system-type 'darwin) nixos)
     dash
     ;; Version Control
     version-control
     (git :variables
          git-magit-status-fullscreen t)
     github
     ;; Other stuff
     prodigy
     colors
     ;; (perspectives :variables
     ;;               spacemacs-persp-show-home-at-startup t
     ;;               perspectives-display-help t)
     chrome
     (erc :variables
          erc-enable-sasl-auth t)
     ;; Org
     (org :variables
          org-enable-reveal-js-support t
          org-mapping-style 'worf)
     pandoc
     ;; Miscellaneous
     emoji
     ;; (wakatime :variables
     ;;           wakatime-api-key    "813b0d78-1f17-43eb-bede-a5c008651d4a"
     ;;           wakatime-cli-path   "/run/current-system/sw/bin/wakatime"
     ;;           wakatime-python-bin "/run/current-system/sw/bin/python")
     ,(when (eq system-type 'darwin) 'osx)
     ;; Completings Stuff
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
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
     ;; clojure
     emacs-lisp
     ;; scheme
     (markdown :variables markdown-live-preview-engine 'vmd)
     html
     latex
     lua
     c-c++
     python
     (javascript :variables javascript-backend 'lsp)
     react
     lsp
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      visual-fill-column
                                      darkroom
                                      company-flx
                                      kite-mini
                                      encourage-mode
                                      key-chord
                                      lice
                                      nvm
                                      focus
                                      w3m
                                      mocha-snippets
                                      systemd
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(hybrid :variables
                                       hybrid-mode-enable-evilified-state t
                                       hybrid-mode-enable-hjkl-bindings nil
                                       hybrid-mode-use-evil-search-module nil
                                       hybrid-mode-default-state 'normal)
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; If non-nil then Spacemacs will import your PATH and environment variables
   ;; from your default shell on startup. This is enabled by default for macOS
   ;; users and X11 users.
   dotspacemacs-import-env-vars-from-shell (and (display-graphic-p)
                                                (or (eq system-type 'darwin)
                                                    (eq system-type 'gnu/linux)
                                                    (eq window-system 'x)))

   ;; If nil then use the default shell is used to fetch the environment
   ;; variables. Set this variable to a different shell executable path to
   ;; import the environment variables from this shell. Note that
   ;; `file-shell-name' is preserved and always points to the default shell. For
   ;; instance to use your fish shell environment variables set this variable to
   ;; `/usr/local/bin/fish'.
   ;; (default nil)
   dotspacemacs-import-env-vars-shell-file-name "/bin/zsh"

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         material
                         spacemacs-dark
                         monokai
                         zenburn
                         spacemacs-light
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Meslo LG L DZ for Powerline"
                               :size 16
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; https://emacs-doctor.com/emacs-hide-mode-line.html

  ;; TODO: Figure out how to make childrames float in Emacs with chunkwm
  (setq lsp-ui-doc-use-childframe nil)
  (setq lsp-highlight-symbol-at-point nil)
  (setq lsp-ui-sideline-enable nil)

  (setq custom-file "~/.spacemacs.d/custom.el")

  (defvar-local hidden-mode-line-mode nil)
  (define-minor-mode hidden-mode-line-mode
    "Minor mode to hide the mode-line in the current buffer."
    :init-value nil
    :global t
    :variable hidden-mode-line-mode
    :group 'editing-basics
    (if hidden-mode-line-mode
        (setq hide-mode-line mode-line-format
              mode-line-format nil)
      (setq mode-line-format hide-mode-line
            hide-mode-line nil))
    (force-mode-line-update)
    ;; Apparently force-mode-line-update is not always enough to
    ;; redisplay the mode-line
    (redraw-display)
    (when (and (called-interactively-p 'interactive)
               hidden-mode-line-mode)
      (run-with-idle-timer
       0 nil 'message
       (concat "Hidden Mode Line Mode enabled.  "
               "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

  ;; If you want to hide the mode-line in every buffer by default
  (add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)

  (global-set-key (kbd "H-?") 'hidden-mode-line-mode)


  (defun cestdiego/cursor-pos ()
    (interactive)
    (let ((line (cadr (s-split " " (what-line))))
          (file-or-buffer-name (if buffer-file-name
                                   buffer-file-name
                                 (buffer-name)
                                 ))
          (column (car (last (s-split "=" (what-cursor-position))))))
      (message
       (s-join "  "
               `("Current Buffer:" ,file-or-buffer-name
                 "Line:" ,line
                 "Column:" ,column)))))

  (add-hook 'focus-in-hook 'cestdiego/cursor-pos)

  ;; Undecorated frame in OSX (doesn't work https://github.com/koekeishiya/chunkwm/issues/265)
  ;; (add-to-list 'default-frame-alist '(undecorated . t))

  ;; This makes the titlebar bearable by making it transparent
  ;; (add-to-list 'default-frame-alist '(ns-appearance . 'dark))
  ;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

  ;; IMPORTANT: This makes the emacs window not take unnecessary space because of chunkwm
  ;; https://github.com/d12frosted/homebrew-emacs-plus/issues/13#issuecomment-299072152
  (setq frame-resize-pixelwise t)

  ;; Set the Emacs customization file path. Must be done here in user-init.
  ;; From: https://github.com/krismolendyke/.emacs.d/blob/0765f0029be19cb33b50b518e46e004777fe248c/init.el#L49-L52
  (defvar cestdiego/brew-cache-directory
    (string-trim (shell-command-to-string
                  (string-join `(,(executable-find "brew") "--cache") " ")))
    "Homebrew cache.")

  (defun cestdiego/brew-get-prefix-dir-for-program (program)
    (string-trim (shell-command-to-string
                  (string-join `(,(executable-find "brew") "--prefix" ,program) " "))))


  (setq-default evil-escape-key-sequence "jk")

  (setq httpd-port 1337
        source-directory (if (eq system-type 'darwin)
                             (string-join `(,cestdiego/brew-cache-directory "emacs-plus--git") "/")
                           "~/Documents/Projects/emacs")
        dotspacemacs-verbose-loading t
        helm-ag-base-command "rg --vimgrep --no-heading"
        helm-ag-always-set-extra-option nil
        delete-by-moving-to-trash t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

  (defun spacemacs/user-full-name ()
    "Guess the user's full name. Returns nil if no likely name could be found."
    (or (replace-regexp-in-string
         "\n$" "" (shell-command-to-string "git config --get user.name"))
        (user-full-name)
        (getenv "USER")))

  (defun spacemacs/user-email ()
    "Guess the user's email address. Returns nil if none could be found."
    (or (replace-regexp-in-string
         "\n$" "" (shell-command-to-string "git config --get user.email"))
        user-mail-address
        (getenv "EMAIL")))

  (setq user-full-name    (spacemacs/user-full-name)
        user-mail-address (spacemacs/user-email))

  (setq ispell-program-name "/usr/local/bin/aspell")


  ;; org things
  (with-eval-after-load 'org
    (require 'htmlize)
    (setq org-html-htmlize-output-type 'css)
    (setq org-html-htmlize-font-prefix "org-")
    (setq org-html-doctype "html5")
    (setq org-html-html5-fancy t))

  (require 'mocha-snippets)
  (setq mocha-snippets-use-fat-arrows t)
  (setq mocha-snippets-add-space-after-function-keyword t)

  ;; Source
  ;; https://www.reddit.com/r/emacs/comments/5a4n39/ligatures_question_i_cant_find_more_informative/d9dx2oi/
  (defun cestdiego/prettify-list (l &optional merge)
    "Takes two lists and interleaves the (optional) second between each element of the first.  Used to
create multi-character sequences for use with prettify-symbols mode.  If not supplied, MERGE defaults
to '(Br . Bl)"
    (let ((merge (or merge '(Br . Bl)))
          (head (car l))
          (tail (cdr l)))
      (cond
       ((not (consp l))    '())
       ((not (consp tail))  (list head))
       (t (cons head
                (cons merge
                      (prettify-list tail merge)))))))

  (defun cestdiego/prettify-string (s &optional merge)
    "Takes a string and an optional list, and returns a list of the string's characters with MERGE
interleaved between each character, for use with prettify-symbols mode.  If no MERGE is supplied,
uses the prettify-list default."
    (prettify-list (append s nil) merge))

  (remove-hook 'emacs-lisp-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)

  ;; Archive
  ;; (handoff-global-mode nil)

  (global-set-key (kbd "C-?") 'help-command)
  (global-set-key (kbd "M-?") 'mark-paragraph)
  ;; (global-set-key (kbd "C-h") 'delete-backward-char)
  (keyboard-translate ?\C-h ?\C-?)
  (global-set-key (kbd "M-h") 'backward-kill-word)

  (setq tab-always-indent t)

  ;; TODO there is lots to do for recognizing each file with it's proper nvm version
  (require 'nvm)
  (setq nvm-dir "~/.nvm")
  (nvm-use "8.11.2")

  ;; Hide ugly dired details
  (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

  (defun cestdiego/frame-finish ()
    (interactive)
    (let ((C-c-C-c-key (kbd "C-c C-c")))
      (if (key-binding C-c-C-c-key)
          ;; We add the C-c C-c sequence to the unread events so that the frame can defer to whatever function is bound to C-c C-c
          (setq unread-command-events (listify-key-sequence C-c-C-c-key))
        (message "Nothing is bound to `C-c C-c'"))))

  (defun cestdiego/setup-frame-finish ()
    (interactive)
    (key-chord-define-global "xx" 'cestdiego/frame-finish))

  (add-hook 'prog-mode-hook 'cestdiego/setup-frame-finish)
  (key-chord-define-global "qq" 'spacemacs/frame-killer)

  (setq key-chord-one-key-delay 0.15)

  (key-chord-mode 1)


  (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")
                            (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)"))
        org-ellipsis " ↴"
        ;; don't let me accidentally delete text without realizing it in org.  ie: point is buried in a subtree, but you only
        ;; see the heading and you accidentally kill a line without knowing it.
        ;; this might not be supported for evil-mode
        org-catch-invisible-edits 'show-and-error
        ;; whenever I change state from TODO to DONE org will log that timestamp. Let's put that in a drawer
        org-log-into-drawer t
        ;; make org-mode record the date when you finish a task
        org-log-done 'time
        ;; when you press S-down, org changes the timestamp under point
        org-edit-timestamp-down-means-later t
        ;; make the agenda start on today not wednesday
        org-agenda-start-on-weekday nil
        ;; don't make the agenda only show saturday and Sunday if today is saturday. Make it show 7 days
        org-agenda-span 7
        ;; using the diary slows down the agenda view
        ;; but it also shows you upcoming calendar events
        org-agenda-include-diary t
        ;; this tells the agenda to take up the whole window and hide all other buffers
        org-agenda-window-setup 'current-window
        ;; this tells org-mode to only quit selecting tags for things when you tell it that you are done with it
        org-fast-tag-selection-single-key nil
        org-html-validation-link nil
        org-export-kill-product-buffer-when-displayed t
      )

  (encourage-mode)

  ;; Imagine the following scenario.  One wants to paste some previously copied
  ;; (from application other than Emacs) text to the system's clipboard in place
  ;; of some contiguous block of text in a buffer.  Hence, one switches to
  ;; `evil-visual-state' and selects the corresponding block of text to be
  ;; replaced.  However, one either pastes some (previously killed) text from
  ;; `kill-ring' or (if `kill-ring' is empty) receives the error: "Kill ring is
  ;; empty"; see `evil-visual-paste' and `current-kill' respectively.  The
  ;; reason why `current-kill' does not return the desired text from the
  ;; system's clipboard is because `evil-visual-update-x-selection' is being run
  ;; by `evil-visual-pre-command' before `evil-visual-paste'.  That is
  ;; `x-select-text' is being run (by `evil-visual-update-x-selection') before
  ;; `evil-visual-paste'.  As a result, `x-select-text' copies the selected
  ;; block of text to the system's clipboard as long as
  ;; `x-select-enable-clipboard' is non-nil (and in this scenario we assume that
  ;; it is).  According to the documentation of `interprogram-paste-function',
  ;; it should not return the text from the system's clipboard if it was last
  ;; provided by Emacs (e.g. with `x-select-text').  Thus, one ends up with the
  ;; problem described above.  To solve it, simply make
  ;; `evil-visual-update-x-selection' do nothing:
  (fset 'evil-visual-update-x-selection 'ignore)

  (volatile-highlights-mode t)

  (push '("* Mocha Test Output *"
          :dedicated t
          :position bottom
          :stick tc-state
          :noselect nil
          :height 0.4)
        popwin:special-display-config)

  (setq ispell-extra-args '("--sug-mode=ultra" "--run-together" "--run-together-limit=5" "--run-together-min=2"))

  ;; Having Helm in a floating window :)
  ;; (setq helm-echo-input-in-header-line t)
  ;; (setq helm-display-function 'helm-display-buffer-in-own-frame
  ;;       helm-display-buffer-reuse-frame t
  ;;       helm-use-undecorated-frame-option t)

  (defun cestiego/pretty-symbols (new-pretty-symbols)
    (mapcar (lambda (item)
              (push item prettify-symbols-alist))
            new-pretty-symbols))

  (defun maybe-you-mean-editor-finish? (orig-fun &rest args)
    (let ((current-C-c-C-c (key-binding (kbd "C-c C-c") t))
          )
      (if (eq current-C-c-C-c 'with-editor-finish)
          (with-editor-finish nil)
        (apply orig-fun args))))

  (defun CestDiego/confirm-before-closing-frame-wq (&rest r)
    (if (and (display-graphic-p)
             (not (daemonp))
             (eq (count-windows) 1))
        (y-or-n-p "You are about to close Emacs")
      ;; Always return true otherwise
      t)
    )
  (advice-add 'evil-save-and-close :before-while #'CestDiego/confirm-before-closing-frame-wq)
  ;; (advice-add 'evil-write :around #'maybe-you-mean-editor-finish?)

  (add-hook 'with-editor-mode-hook 'evil-normalize-keymaps)
  (evil-define-key 'normal with-editor-mode-map ",c" 'with-editor-finish)
  (evil-define-key 'normal with-editor-mode-map ",a" 'with-editor-cancel)

  (spacemacs/add-to-hooks
   (lambda ()
     (cestiego/pretty-symbols
      '(("add-hook" . ?⚓)
        ("defun" . ?ƒ)
        ("=>" .  ?⤇)
        )))
   '(emacs-lisp-mode-hook))

  ;;; SANE DEFAULTS!!
  (spacemacs|add-toggle visual-line-navigation
    :status visual-line-mode
    :on
    (progn
      (visual-line-mode)
      (visual-fill-column-mode)
      (evil-define-minor-mode-key 'motion 'visual-line-mode "j" 'evil-next-visual-line)
      (evil-define-minor-mode-key 'motion 'visual-line-mode "k" 'evil-previous-visual-line)
      (when (bound-and-true-p evil-escape-mode)
        (evil-escape-mode -1)
        (setq evil-escape-motion-state-shadowed-func nil)
        (evil-define-minor-mode-key 'motion 'visual-line-mode "j" 'evil-next-visual-line)
        (evil-define-minor-mode-key 'motion 'visual-line-mode "k" 'evil-previous-visual-line)
        (evil-escape-mode))
      (evil-normalize-keymaps))
    :off
    (progn
      (visual-line-mode -1)
      (visual-fill-column-mode -1)
      (evil-normalize-keymaps)))
  (add-hook 'text-mode #'spacemacs/toggle-visual-line-navigation-on)

  (evil-define-key 'normal markdown-mode-map
    "j" 'evil-next-visual-line
    "k" 'evil-previous-visual-line)

  ;; Are these better ways to jump between windows?
  (spacemacs/set-leader-keys
    "w <tab>" 'other-window
    "ww" 'ace-window)

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

  (when (configuration-layer/layer-usedp 'spacemacs-layouts)

    (spacemacs|define-custom-layout "NixOS Configuration"
      :binding "N"
      :body
      (dired "~/Projects/nixpkgs/pkgs/")
      (split-window-right)
      (find-file "~/nixos-config/common/desktop.nix"))

    (spacemacs|define-custom-layout "Blog"
      :binding "b"
      :body
      (when (y-or-n-p "Hi, do you want to create a new post?")
        (call-interactively 'op/new-post)))

    (spacemacs|define-custom-layout "@bspwm"
      :binding "B"
      :body
      (find-file "~/dotbspwm/.config/sxhkd/sxhkdrc")
      (split-window-right-and-focus)
      (find-file "~/dotbspwm/.config/bspwm/bspwmrc")
      (split-window-below-and-focus)
      (find-file "~/dotbspwm/.config/bspwm/autostart"))
    )

  (if (eq system-type 'darwin)
      ;; Taken from https://www.emacswiki.org/emacs/BrowseUrl#toc26
      (setq browse-url-browser-function (quote browse-url-generic)
            browse-url-generic-program "open")
    (setq browse-url-browser-function 'browse-url-generic
          engine/browser-function 'browse-url-generic
          browse-url-generic-program "google-chrome-stable"))

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
  ;; (setq python-shell-interpreter "ipython")
  ;; (setq python-shell-interpreter-args "-i --gui=wx")


  (setq vc-follow-symlinks t)

  (setq zone-timer (run-with-idle-timer 6000 t 'zone))
  (setq zone-programs [zone-pgm-jitter
                        zone-pgm-putz-with-case
                        zone-pgm-dissolve
                        zone-pgm-whack-chars
                        zone-pgm-rotate
                        zone-pgm-rotate-LR-lockstep
                        zone-pgm-rotate-RL-lockstep
                        zone-pgm-rotate-LR-variable
                        zone-pgm-rotate-RL-variable
                        zone-pgm-rat-race
                        zone-pgm-paragraph-spaz
                        zone-pgm-random-life])

  ;; No need to have the Nyan cat anymore :(
  ;; (when (configuration-layer/package-usedp 'nyan-mode)
  ;;   (spacemacs|do-after-display-system-init
  ;;    (nyan-mode -1)
  ;;    (nyan-mode))
  ;;   (nyan-mode -1))

  (setq tab-width 2)

  (require 'seq)

  (defun cestdiego/extract-package-name (package-sexp)
    "very hacky way of doing this"
    (if (symbolp package-sexp)
        `(,(symbol-name package-sexp) . package-sexp)
      `(,(symbol-name (car package-sexp)) . package-sexp))
    )

  (defun cestdiego/sort-sexps (packages-sexps)
    "docstring"
    (print (seq-map #'cestdiego/extract-package-name packages-sexps))

    ;; Get a list of s-exps and order them
    ;; they are all of the form
    ;; SYMBOL
    ;; or
    ;; (SYMBOL :location value)
    )

  (setq test-stringy '((bb :location local) c alt  (diego :location built-in)))

  (cestdiego/sort-sexps test-stringy)

  (when (configuration-layer/layer-usedp 'syntax-checking)
    (setq flycheck-emacs-lisp-load-path 'inherit)
    )

  (with-eval-after-load 'python-mode
    (define-key inferior-python-mode-map (kbd "C-S-k") 'comint-previous-prompt)
    (define-key inferior-python-mode-map (kbd "C-S-j") 'comint-next-prompt)
  )

  (with-eval-after-load 'org-mode
    (define-key org-mode-map (kbd "<C-M-return>") 'org-insert-subheading)
    (define-key org-mode-map (kbd "<C-M-S-return>") 'org-insert-todo-subheading)
  )
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

  ;; (when (configuration-layer/layer-usedp 'spacemacs-layouts)
  ;;   (define-key custom-keys-mode-map (kbd "<C-tab>") 'spacemacs//layouts-persp-next-n)
  ;;   (define-key custom-keys-mode-map (kbd "<C-backtab>") 'spacemacs//layouts-persp-prev-p))

  ;; (define-key helm-map (kbd "C-w") '(lambda () (interactive) (symbol-at-point)))
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;; FINISH LE GLOBAL OVERRIDE ;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (when (configuration-layer/layer-usedp 'shell)
    (setq eshell-rc-script (expand-file-name
                            ".eshellrc"
                            (car dotspacemacs-configuration-layer-path))
          eshell-path-env exec-path)

    ;; (evil-define-key 'normal term-raw-map
    ;;   "p" 'term-paste) ;; why paste-microstate doesn't work?

    ;; (define-key term-raw-map (kbd "C-S-k") 'term-send-up)
    ;; (define-key term-raw-map (kbd "C-S-j") 'term-send-down)
    ;; (define-key term-raw-map (kbd "C-y")   'term-paste)
    ;; (define-key term-raw-map (kbd "<C-backspace>") 'term-send-raw-meta)
    ;; (define-key term-raw-map (kbd "<M-backspace>") 'term-send-raw-meta)


    ;; (define-key eshell-mode-map (kbd "C-k") 'eshell-previous-input)
    ;; (define-key eshell-mode-map (kbd "C-y") 'evil-paste-after)
    ;; (define-key eshell-mode-map (kbd "C-j") 'eshell-next-input)

    ;; (define-key cider-repl-mode-map (kbd "C-k") 'cider-repl-backward-input)
    ;; (define-key cider-repl-mode-map (kbd "C-j") 'cider-repl-forward-input)
    ;; (define-key cider-repl-mode-map (kbd "C-r") 'cider-repl-previous-matching-input)
    ;; (define-key cider-repl-mode-map (kbd "C-s") 'cider-repl-next-matching-input)
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

  (when (configuration-layer/layer-usedp 'react)
    (defun spacemacs/toggle-web-js2-mode ()
      (interactive)
      (if (eq major-mode 'js2-mode)
          (progn
            (web-mode)
            (setq web-mode-content-type "html"))
        (js2-mode)))
    (spacemacs/set-leader-keys-for-major-mode 'web-mode
      "m," 'spacemacs/toggle-web-js2-mode)
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode
      "m," 'spacemacs/toggle-web-js2-mode))

  (when (configuration-layer/layer-usedp 'javascript)
    ;; This will allow the shebang #!/bin/node :)
    (setq js2-skip-preprocessor-directives t)
    (defun cestdiego/js-setup-pretty-symbols ()
      (cestiego/pretty-symbols
       '(("function" . ?ƒ)
         ("React"    . ?)
         ("=>"       . ?⤇)
         ("->"       . ?)
         ("@"        . ?)
         ("() =>"    . ?λ)
         ("() ->"    . ?ƒ))))
    (spacemacs/add-to-hooks
     #'cestdiego/js-setup-pretty-symbols
     '(js2-mode-hook react-mode coffee-mode-hook web-mode-hook))
    )

  (when (configuration-layer/layer-usedp 'html)
    (require 'web-mode)
    ;; Font in gdrive
    (set-face-attribute 'web-mode-html-attr-name-face nil :family "Operator SSm" :slant 'italic)

    (add-hook 'react-mode-hook (lambda () (setq-local emmet-expand-jsx-className? t)))
    (define-key web-mode-map (kbd "C-j") 'emmet-expand-line)
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))

    (add-hook 'html-mode-hook 'web-mode)
    (add-to-list 'auto-mode-alist '("\\.touchegg.conf\\'" . web-mode))


    (when (configuration-layer/layer-usedp 'lsp)
      (setq lsp-ui-sideline-delay 1)
      (require 'lsp-mode)
      (define-derived-mode marko-mode web-mode "marko")

      (add-to-list 'auto-mode-alist '("\\.marko\\'" . marko-mode))

      (defun spacemacs//set-lsp-key-bindings (mode)
        "Set the key bindings for lsp in the given MODE."
        (add-to-list (intern (format "spacemacs-jump-handlers-%S" mode))
                     '(lsp-ui-peek-find-definitions)))

      (defconst lsp-marko--root-dir
        (lsp-make-traverser #'(lambda (dir)
                                (directory-files
                                 dir
                                 nil
                                 "package.json"))))

      (lsp-define-stdio-client lsp-marko "marko"
                               lsp-marko--root-dir '("marko-language-server"))

      (spacemacs|define-jump-handlers marko-mode)
      ;; (spacemacs//set-lsp-key-bindings 'marko-mode)
      ;; (spacemacs/lsp-bind-keys-for-mode 'marko-mode)

      (add-hook 'marko-mode-hook '(lambda () (interactive)
                                    (setq-local spacemacs-jump-handlers '((lsp-ui-peek-find-definitions)))
                                    (lsp-marko-enable)))
      )
    )

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
  ;; (global-set-key (kbd "<C-s-mouse-4>") (lambda () (interactive)
  ;;                                         (spacemacs/zoom-frm-in)
  ;;                                         (spacemacs//zoom-frm-powerline-reset)))
  ;; (global-set-key (kbd "<C-s-mouse-5>") (lambda () (interactive)
  ;;                                         (spacemacs/zoom-frm-out)
  ;;                                         (spacemacs//zoom-frm-powerline-reset)))
  ;; (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
  ;; (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
  ;;; END: Mouse Support

  ;; Make Mouse Wheeel not go too damn fast
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-scroll-amount
        '(             2
          ((shift)   . 1)))

  ;;; BEGIN: Extra Hybrid Modes
  (push 'git-commit-major-mode evil-insert-state-modes)
  (push 'image-mode evil-insert-state-modes)
  ;;; END:   Extra Hybrid Modes

  ;;; BEGIN: Custom Hybrid Bindings
  (define-key evil-insert-state-map (kbd "S-<return>") 'evil-open-below)
  ;;; END:   Custom Hybrid Bindings

  ;;; BEGIN: EVIL Multiple Cursors
  (global-evil-mc-mode 1)

  ;; Fix for bug: https://github.com/gabesoft/evil-mc/issues/70
  ;; https://github.com/emacs-evil/evil/issues/864
  (add-hook 'evil-mc-after-cursors-deleted
            (lambda ()
              (setq evil-was-yanked-without-register t)))
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

  ;; (set-face-attribute 'mode-line-inactive nil
  ;;                     :underline "#202020"
  ;;                     :box nil
  ;;                     :height 1
  ;;                     :background (face-background 'default))
  (setq projectile-enable-caching t)

  ;; (add-to-list 'default-frame-alist '(minibuffer))
  ;; ;; (add-to-list 'default-frame-alist '(unsplittable . t))
  ;; (add-to-list 'minibuffer-frame-alist '(minibuffer . only))
  ;; (add-to-list 'minibuffer-frame-alist '(left . 525))
  ;; (add-to-list 'minibuffer-frame-alist '(top . -1))
  ;; (add-to-list 'minibuffer-frame-alist '(width . 100))
  ;; (add-to-list 'minibuffer-frame-alist '(name . "minibuf"))

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
  ;; https://github.com/ocodo/.emacs.d/blob/master/custom/handy-functions.el

  ;; Figure out how to set the pyenv environment depending on the project one is at
  (pyenv-mode-set "2.7.8")

  ;; Appearance
  (spacemacs/enable-transparency)
  (global-vi-tilde-fringe-mode -1)
  ;; Lastly, load custom-file (but only if the file exists).
  (when (file-exists-p custom-file)
    (load-file custom-file))
  )
