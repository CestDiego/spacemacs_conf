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
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   `(
     ;; MY Own layers
     ;; no-dots
     appearance
     ;; (blog :variables
     ;;       org-page-use-melpa-version nil
     ;;       org-page-built-directory "~/Projects/le_blog_built/")
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
     (elfeed :variables
             elfeed-enable-web-interface t
             rmh-elfeed-org-files (list "~/Dropbox/Org-Notes/elfeed.org"))
     ,(unless (eq system-type 'darwin) nixos)
     dash
     ;; Version Control
     version-control
     (git :variables
          git-magit-status-fullscreen t)
     github
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
     (rcirc :variables
            rcirc-default-nick "cestdiego"
            rcirc-default-user-name "cestdiego"
            rcirc-default-full-name "Diego Berrocal"
            rcirc-enable-znc-support t)
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
     ,(when (eq system-type 'darwin) 'osx)
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
     ;; Layouts
     eyebrowse
     ;; Lang
     ;;; LIISSSSSPPPPPSSSS
     clojure
     emacs-lisp
     scheme
     ;;; Other
     ansible
     markdown
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
     selectric
     search-engine
     xkcd
     games
     spotify
     Monfoku
     vagrant)
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dostspacemacs/config'.
   dotspacemacs-additional-packages '(visual-fill-column
                                      company-flx
                                      encourage-mode
                                      key-chord
                                      lice
                                      editorconfig
                                      nvm
                                      focus
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
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; Possible values are: `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         spacemacs-dark
                         tao-yin
                         tao-yang
                         aurora
                         zenburn ;; This works without erc
                         spacemacs-light
                         ;; leuven  ;; This works without erc
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Meslo LG M DZ for Powerline"
                               :size 19
                               :weight normal
                               :width normal
                               :powerline-scale 1)
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
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   dotspacemacs-enable-paste-transient-state t
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
   dotspacemacs-fullscreen-at-startup nil
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
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
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
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

  ;; (spacemacs/set-leader-keys "sm" 'evil-mc-state/evil-mc-mode)
  ;; (define-key evil-mc-state-map
  ;;   (kbd dotspacemacs-leader-key) spacemacs-default-map)

  (with-eval-after-load 'company
    (company-flx-mode +1))

  (setq user-full-name    "Diego Berrocal"
        user-mail-address "cestdiego@gmail.com")

  (setq eclim-eclipse-dirs '("/Users/dberrocal/Downloads/sts-bundle/STS.app/Contents/Eclipse/")
        eclim-executable "/Users/dberrocal/Downloads/sts-bundle/STS.app/Contents/Eclipse/eclim"
        eclimd-default-workspace "/Users/dberrocal/Documents/.workspace/")
  (defhydra hydra-eclim (:color teal
                                :hint nil)
    "
Eclim:
 ╭─────────────────────────────────────────────────────┐
 │ Java                                                │       Problems
╭┴─────────────────────────────────────────────────────┴────────────────────────────────────╯
  _d_: Show Doc             _i_: Implement (Override)          _p_: Show Problems
  _g_: Make getter/setter  _fd_: Find Declarations             _c_: Show Corrections
  _o_: Organize Imports    _fr_: Find References               _r_: Buffer Refresh
  _h_: Hierarchy            _R_: Refactor

Project                            Android
─────────────────────────────────────────────────────────
_j_: Jump to proj           _a_: Start Activity
_b_: Create                 _m_: Clear/Build/Install
_k_: Import Proj            _e_: Start Emulator
                          ^_l_: Logcat
"
    ("d"   eclim-java-show-documentation-for-current-element)
    ("g"   eclim-java-generate-getter-and-setter)
    ("o"   eclim-java-import-organize)
    ("h"   eclim-java-call-hierarchy)
    ("i"   eclim-java-implement)
    ("fd"  eclim-java-find-declaration)
    ("fr"  eclim-java-find-references)
    ("R"   eclim-java-refactor-rename-symbol-at-point)
    ("p"   eclim-problems)
    ("c"   eclim-problems-correct)
    ("r"   eclim-problems-buffer-refresh)
    ("j"   eclim-project-goto)
    ("b"   eclim-project-create)
    ("k"   eclim-project-import)
    ("a"   android-start-app)
    ("m"   my-clean-debug-install)
    ("e"   android-start-emulator)
    ("l"   android-logcat)
    ("q"   nil "cancel" :color blue))

  (define-key eclim-mode-map (kbd "C-c e") 'hydra-eclim/body)
  (require 'eclimd)

  (require 'editorconfig)
  (editorconfig-mode 1)
  (require 'nvm)
  (nvm-use "0.10.40")

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
  (setq org-todo-keywords '((sequence "TODO" "DONE"))
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
  (global-evil-mc-mode)
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

  (beacon-mode 1)

  (setq helm-echo-input-in-header-line nil)

  ;; (dolist (b sp-smartparens-bindings)
  ;;   (define-key emacs-lisp-mode-map (kbd (car b)) (cdr b)))

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

  (unless (eq system-type 'darwin)
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
  (setq zone-programs [zone-pgm-rotate-LR-lockstep])

  (when (configuration-layer/package-usedp 'nyan-mode)
    (spacemacs|do-after-display-system-init
     (nyan-mode -1)
     (nyan-mode))
    (nyan-mode -1))

  (setq tab-width 2)

  (when (configuration-layer/layer-usedp 'prodigy)
    (prodigy-define-service
      :name "StartFE"
      :command "browser-refresh"
      :args '("index.js")
      :cwd "~/Documents/ebay/StartFE/"
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

    (define-key term-raw-map (kbd "C-S-k") 'term-send-up)
    (define-key term-raw-map (kbd "C-S-j") 'term-send-down)
    (define-key term-raw-map (kbd "C-y")   'term-paste)
    (define-key term-raw-map (kbd "<C-backspace>") 'term-send-raw-meta)
    (define-key term-raw-map (kbd "<M-backspace>") 'term-send-raw-meta)


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
    (add-to-list 'auto-mode-alist '("\\.marko\\'" . web-mode))
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
  (define-key evil-insert-state-map (kbd "S-<return>") 'evil-open-below)
  ;;; END:   Custom Hybrid Bindings

  ;;; BEGIN: Multiple Cursors
  (define-key evil-insert-state-map (kbd "C-;") 'mc/edit-lines)
  (define-key evil-insert-state-map (kbd "C-:") 'mc/mark-all-like-this-dwim)
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
  ;; https://github.com/ocodo/.emacs.d/blob/master/custom/handy-functions.el
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
    ((firestarter async-shell-command
                  (concat "PORT=1337 mocha "
                          (expand-file-name "test"
                                            (projectile-project-root)))
                  "* Mocha Test Output *" "* Mocha Test Error Output *")
     (firestarter async-shell-command
                  (concat "PORT=1337 mocha "
                          (expand-file-name "test"
                                            (projectile-project-root))))
     (set-input-method "latin-1-prefix" t)
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
