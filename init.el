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
   `(typescript
     ruby
     ;; MY Own layers
     ;; no-dots
     misc
     mc-column
     appearance
     my-javascript
     ;;(blog :variables
     ;;     org-page-use-melpa-version nil
     ;;     org-page-built-directory "~/Documents/Projects/le_blog_built/")
     ;; org-cestdiego
     presentations
     utils
     ;; (exwm :variables
     ;;       exwm-app-launcher--prompt " "
     ;;       exwm--hide-tiling-modeline t
     ;;       exwm--terminal-command "termite")
     ;; nand2tetris

     ;; Spacemacs
     ;; (elfeed :variables
     ;;         elfeed-enable-web-interface t
     ;;         rmh-elfeed-org-files (list "~/Google Drive/Org-Notes/elfeed.org"))
     ;; ,(unless (eq system-type 'darwin) nixos)
     dash
     ;; Version Control
     version-control
     (git :variables
          git-magit-status-fullscreen t)
     ;; Other stuff
     prodigy
     (colors :variables
             colors-enable-nyan-cat-progress-bar t
             colors-enable-rainbow-identifiers nil)
     ;; (perspectives :variables
     ;;               spacemacs-persp-show-home-at-startup t
     ;;               perspectives-display-help t)
     chrome
     (erc :variables
          erc-enable-sasl-auth t)
     ;; Org
     (org :variables
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
     javascript
     react
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      darkroom
                                      yarn-mode
                                      atomic-chrome
                                      suggest
                                      visual-fill-column
                                      helm-hunks
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
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default nil)
   dotspacemacs-elpa-subdirectory nil
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
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Meslo LG L DZ for Powerline"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   dotspacemacs-distinguish-gui-tab t
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
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
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
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
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
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
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
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
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; https://emacs-doctor.com/emacs-hide-mode-line.html

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

  ;; Undecorated frame in OSX (doesn't work https://github.com/koekeishiya/chunkwm/issues/265)
  (add-to-list 'default-frame-alist '(undecorated . nil))
  ;; This makes the titlebar bearable by making it transparent
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . 'nil))

  ;; IMPORTANT: This makes the emacs window not take unnecessary space because of chunkwm
  ;; https://github.com/d12frosted/homebrew-emacs-plus/issues/13#issuecomment-299072152
  (setq frame-resize-pixelwise t)

  ;; Set the Emacs customization file path. Must be done here in user-init.
  (setq custom-file "~/.spacemacs.d/custom.el")
  ;; From: https://github.com/krismolendyke/.emacs.d/blob/0765f0029be19cb33b50b518e46e004777fe248c/init.el#L49-L52

  (defvar cestdiego/brew-cache-directory
    (string-trim (shell-command-to-string
                  (string-join `(,(executable-find "brew") "--cache") " ")))
    "Homebrew cache.")

  (setq-default evil-escape-key-sequence "jk")
  (setq httpd-port 1337)
  (setq source-directory (if (eq system-type 'darwin)
                             (string-join `(,cestdiego/brew-cache-directory "emacs-plus--git") "/")
                           "~/Documents/Projects/emacs-24.5")
        dotspacemacs-verbose-loading t
        helm-ag-command-option " --search-zip "
        delete-by-moving-to-trash t
        ;; Only Useful with `SPC T ~'
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
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; org things
  (with-eval-after-load 'org
    (require 'htmlize)
    (setq org-html-htmlize-output-type 'css)
    (setq org-html-htmlize-font-prefix "org-")
    (setq org-html-doctype "html5")
    (setq org-html-html5-fancy t))

  (require 'atomic-chrome)
  (atomic-chrome-start-server)

  (require 'mocha-snippets)
  (setq mocha-snippets-use-fat-arrows t)

  ;; org-pomodoro mode hooks
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notify-osx "Pomodoro completed!" "Time for a break.")))

  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))

  (add-hook 'org-pomodoro-long-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))

  (add-hook 'org-pomodoro-killed-hook
            (lambda ()
              (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))

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
  ;; (handoff-global-mode nil)
  (keyboard-translate ?\C-h ?\C-?)

  (setq tab-always-indent t)
  (spacemacs|do-after-display-system-init
   (setq neo-theme (if window-system 'icons 'arrow)))

  ;; (defun cestdiego/transpile (ast)
  ;;   (cond ((numberp ast) ast)
  ;;         ((equal ast nil) nil)
  ;;         ((stringp ast) ast)
  ;;         ((symbolp ast)  ast)
  ;;         ((listp ast)  (let ((traspiled-cdr (-map 'cestdiego/transpile (cdr ast))))
  ;;                         (if (not (symbolp (car ast))) (error "nope need first item in list to be symbol"))
  ;;                         (if (equal (symbol-name (car ast)) ":hurtrealbad:")
  ;;                             (cons 'lambda traspiled-cdr)
  ;;                           (cons (car ast) traspiled-cdr))
  ;;                         )))
  ;;   )

  ;; (defun cestdiego/run (ast)
  ;;   (eval (car (read-from-string (concat "(" (pp (cestdiego/transpile ast)) ")"  ) )  )   )
  ;;   )

  ;; (cestdiego/run '(:hurtrealbad: () (interactive) (message "lolz")))

  (defun cestdiego/brew-get-prefix-dir-for-program (program)
    (string-trim (shell-command-to-string
                  (string-join `(,(executable-find "brew") "--prefix" ,program) " "))))

  ;; TODO there is lots to do for recognizing each file with it's proper nvm version
  (require 'nvm)
  (setq nvm-dir "/usr/local/opt/nvm")
  (nvm-use "8.9.1")

  (use-package helm-hunks
    :commands helm-hunks)

  ;; Taken from http://endlessparentheses.com/create-github-prs-from-emacs-with-magit.html
  (defun cestdiego/visit-pull-request-url ()
    "Visit the current branch's PR on Github."
    (interactive)
    (browse-url
     (format "https://github.com/%s/pull/new/%s"
             (replace-regexp-in-string
              "\\`.+github\\.com:\\(.+\\)\\.git\\'" "\\1"
              (magit-get "remote"
                         (magit-get-remote)
                         "url"))
             ;; TODO Implement a helm backend to list agains which branch to make the PR
             (cdr (or (magit-remote-branch-at-point)
                      (user-error "No remote branch"))))))
  (eval-after-load 'magit
    '(define-key magit-mode-map "."
       #'cestdiego/visit-pull-request-url))

  (require 'suggest)
  (spacemacs/set-leader-keys "aa" 'suggest)

  (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))

  (with-eval-after-load 'company
    (company-flx-mode +1))

  (setq user-full-name    "Diego Berrocal"
        user-mail-address "cestdiego@gmail.com")

  (add-hook 'text-mode-hook 'auto-fill-mode)

  (setq ispell-program-name "/usr/local/bin/aspell")

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

  (defun cestdiego/frame-finish ()
    (interactive)
    (let ((C-c-C-c-key (kbd "C-c C-c")))
      (if (key-binding C-c-C-c-key)
          (setq unread-command-events (listify-key-sequence C-c-C-c-key))
        (message "Nothing is bound to `C-c C-c'"))))

  (defun cestdiego/setup-frame-finish ()
    (interactive)
    (key-chord-define-global "xx" 'cestdiego/frame-finish))

  (add-hook 'prog-mode-hook 'cestdiego/setup-frame-finish)

  (key-chord-mode 1)
  (setq key-chord-one-key-delay 0.15)

  (key-chord-define-global "qq" 'spacemacs/frame-killer)
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
        ;; are there more backends that I can use?
        org-export-backends '(ascii beamer html texinfo latex)
        ;;most of these modules let you store links to various stuff in org
        org-bullets-bullet-list '("◉" "◎" "♠" "○" "►" "◇"))

  (defun cestdiego/inbox-email-draft-configuration ()
    ;; When editing mail, set the goal-column to 72.
    (auto-fill-mode 1)
    (set-fill-column 72)
    (save-excursion
      ;; Don't know if this is necessary, but it seems to help.
      (set-buffer (buffer-name))
      (goto-char (point-min))
      ;; Replace non-breaking strange space characters
      (while (search-forward (char-to-string 160) nil t)
        (replace-match " "))))

  (defun cestdiego/configure-edit-server ()
    (cond ((string-match "github.com" (buffer-name))
           (markdown-mode))
          ((string-match "inbox.google.com" (buffer-name))
           (cestdiego/inbox-email-draft-configuration))))

  (add-hook 'edit-server-start-hook 'cestdiego/configure-edit-server)

  (encourage-mode)
  (fset 'evil-visual-update-x-selection 'ignore)
  (volatile-highlights-mode t)

  (defun cestiego/pretty-symbols (new-pretty-symbols)
    (mapcar (lambda (item)
              (push item prettify-symbols-alist))
            new-pretty-symbols))

  (push '("* Mocha Test Output *"
          :dedicated t
          :position bottom
          :stick tc-state
          :noselect nil
          :height 0.4)
        popwin:special-display-config)

  (setq ispell-extra-args '("--sug-mode=ultra" "--run-together" "--run-together-limit=5" "--run-together-min=2"))

  (setq helm-echo-input-in-header-line t)

  (defun cestdiego/org-setup-pretty-symbols ()
    (cestiego/pretty-symbols
     '((">=" . ?≥)
       ("<=" . ?≤)
       ("\\geq" . ?≥)
       ("\\leq" . ?≤)
       ("\\neg" . ?¬)
       ("\\rightarrow" . ?→)
       ("\\leftarrow" . ?←)
       ("\\infty" . ?∞)
       ("-->" . ?→)
       ("<--" . ?←)
       ("\\exists" . ?∃)
       ("\\nexists" . ?∄)
       ("\\forall" . ?∀)
       ("\\or" . ?∨)
       ("\\and" . ?∧)
       (":)" . ?☺)
       ("):" . ?☹)
       (":D" . ?☺)
       ("\\checkmark" . ?✓)
       ("\\check" . ?✓)
       ("1/4" . ?¼)
       ("1/2" . ?½)
       ("3/4" . ?¾)
       ("1/7" . ?⅐)
       ("1/5" . ?⅕)
       ("2/5" . ?⅖)
       ("3/5" . ?⅗)
       ("4/5" . ?⅘)
       ("1/6" . ?⅙)
       ("1/6" . ?⅚)
       ("1/6" . ?⅛)
       ("1/6" . ?⅜)
       ("1/6" . ?⅝)
       ("1/6" . ?⅞)
       ("ae" . ?æ)
       ("^_^" . ?☻))))

  (add-hook 'org-mode-hook (lambda ()
                      (push
                       '(?! . ( "#+begin_src" . "#+end_src"))
                       evil-surround-pairs-alist)))

  (add-hook 'org-mode-hook 'cestdiego/org-setup-pretty-symbols)

  (defun maybe-you-mean-editor-finish? (orig-fun &rest args)
    (let ((current-C-c-C-c (key-binding (kbd "C-c C-c") t))
          )
      (if (eq current-C-c-C-c 'with-editor-finish)
          (with-editor-finish nil)
        (apply orig-fun args))))

  ;; (advice-add 'evil-write :around #'maybe-you-mean-editor-finish?)

  (add-hook 'with-editor-mode-hook 'evil-normalize-keymaps)
  (evil-define-key 'normal with-editor-mode-map ",c" 'with-editor-finish)
  (evil-define-key 'normal with-editor-mode-map ",a" 'with-editor-cancel)

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
  (global-set-key (kbd "H-?") 'cestdiego/cursor-pos)
  (global-set-key (kbd "C-s") 'helm-swoop)

  (global-vi-tilde-fringe-mode -1)
  (spacemacs/toggle-mode-line-minor-modes-off)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (spacemacs/toggle-transparency)

  (auto-dim-other-buffers-mode)
  (setq magit-push-always-verify nil)


  (spacemacs/add-to-hooks
   (lambda ()
     (cestiego/pretty-symbols
      '(("add-hook" . ?)
        ("defun" . ?ƒ)
        ("?" . ?)
        ("=>" .  ?)
        )))
   '(emacs-lisp-mode-hook))

  ;;; SANE DEFAULTS!!
  (add-hook 'visual-line-mode-hook 'visual-fill-column-mode)
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

  (setq python-shell-interpreter "ipython")
  ;; (setq python-shell-interpreter-args "-i --gui=wx")


  (setq powerline-default-separator 'alternate)
  (spaceline-compile)

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

  (when (configuration-layer/package-usedp 'nyan-mode)
    (spacemacs|do-after-display-system-init
     (nyan-mode -1)
     (nyan-mode))
    (nyan-mode -1))

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

  (defun cestdiego/space-no-entropy ()
    "Sorts packages in your layer"
    (interactive)
    (let ((layer-name (spacemacs/get-parent-dir)))
      ;; TODO: Make sure one can access this layer
      ()
      ;; Get the contents of the buffer
      ;; Get the start and the end lines of the packages
      ;; Get the s-exps
      ;; call space-no-entropy and then return a map of line numbers and sexps
      ;; Replace the packagelist with the new ordered s-exps
      )
    )

  (when (configuration-layer/layer-usedp 'syntax-checking)
    (setq flycheck-emacs-lisp-load-path 'inherit)
    )

  (with-eval-after-load 'python-mode
    (define-key inferior-python-mode-map (kbd "C-S-k") 'comint-previous-prompt)
    (define-key inferior-python-mode-map (kbd "C-S-j") 'comint-next-prompt)
  )

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

    (with-eval-after-load 'org-mode
      (define-key org-mode-map (kbd "<C-M-return>") 'org-insert-subheading)
      (define-key org-mode-map (kbd "<C-M-S-return>") 'org-insert-todo-subheading)
      )

    ;; (when (configuration-layer/layer-usedp 'spacemacs-layouts)
    ;;   (define-key custom-keys-mode-map (kbd "<C-tab>") 'spacemacs//layouts-persp-next-n)
    ;;   (define-key custom-keys-mode-map (kbd "<C-backtab>") 'spacemacs//layouts-persp-prev-p))


    ;; (define-key helm-map (kbd "C-w") '(lambda () (interactive) (symbol-at-point)))
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

  ;; This will allow the shebang #!/bin/node :)
  (setq js2-skip-preprocessor-directives t)

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

    (defun cestdiego/js-setup-pretty-symbols ()
      (cestiego/pretty-symbols
       '(("function" . ?ƒ)
         ("React"    . ?)
         ("?"        . ?)
         ("=>"       . ?)
         ("->"       . ?)
         ("@"        . ?)
         ("() =>"    . ?λ)
         ("() ->"    . ?ƒ))))
    (spacemacs/add-to-hooks
     #'cestdiego/js-setup-pretty-symbols
     '(js2-mode-hook react-mode coffee-mode-hook web-mode-hook))

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
      ;; Font in gdrive
      (set-face-attribute 'web-mode-html-attr-name-face nil :family "Operator SSm" :slant 'italic)

      (add-hook 'react-mode-hook (lambda () (setq-local emmet-expand-jsx-className? t)))
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
    (add-to-list 'auto-mode-alist '("\\.marko\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))
    (add-to-list 'auto-mode-alist '("dmenuExtended_preferences.txt\\'" . json-mode)))

  (when (configuration-layer/layer-usedp 'html)
    (add-hook 'html-mode-hook 'web-mode)
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

  ;; osx sets this by itself
  (global-set-key (kbd "s-t") nil)
  (global-set-key (kbd "s-C") nil)

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


  (setq ns-auto-hide-menu-bar t)
  ;; Lastly, load custom-file (but only if the file exists).
  (when (file-exists-p custom-file)
    (load-file custom-file)
    )
  )
