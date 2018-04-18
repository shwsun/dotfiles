;;; package --- Summary
;; Packages are managed using Spacemacs' layers.

;;; Commentary:
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;;
;; NOTE(jethros):
;;
;; KEYBINDING:
;;  `C-M-.': find definition
;;  `C-M-*': go back
;;  `C-M-,': find reference
;; STATUS:
;;  * Python: working
;;  * Java: working
;;  * C++: ?

;;; Code:
;; -*- mode: emacs-lisp -*-
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
   ;; instal;; GNU globalslation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default ;; GNU globals'unused)
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
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; ----------------------------------------
     ;;     Programming lang layers
     ;; ----------------------------------------

     ;; Major
     (c-c++ :variables
            ;; clang
            c-c++-enable-clang-support t
            c-c++-enable-cmake-ide-support t
            ;; google c style
            c-c++-enable-google-style t
            c-c++-enable-google-newline t)
     ;; rtags
     ;;c-c++-enable-rtags-support t)

     (python :variables
             python-backend 'lsp
             python-fill-column 80
             python-test-runner 'pytest
             ;; yapf and auto indent are evil!!!
             ;;python-enable-yapf-format-on-save t
             ;;python-sort-imports-on-save t
             python-auto-set-local-pyvenv-virtualenv 'on-project-switch
             )

     (go :variables go-tab-width 4)

     (rust :variables rust-format-on-save t)

     (java :variables java-backend 'meghanada)

     (haskell :variables haskell-completion-backend 'intero)

     (latex :variables
            latex-enable-auto-fill t)


     ;; Minor
     sml
     yaml
     deft
     bibtex
     html
     markdown
     (org :variables org-projectile-file "TODOs.org")
     (clojure :variables clojure-enable-fancify-symbols t)
     erlang
     emacs-lisp
     graphviz
     markdown
     scala
     shell-scripts
     scheme
     racket

     ;; --------------------------
     ;;   Tool layers
     ;; --------------------------

     ;; Major
     semantic
     lsp
     ivy

     (better-defaults :variables
                      better-defaults-move-to-beginning-of-code-first t
                      better-defaults-move-to-end-of-code-first t)
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects)
     
     (languagetool :variables          ; I need my grammer checker!!
                   langtool-language-tool-jar "/home/jethros/repos/TOOLS/LanguageTool-4.1/languagetool-commandline.jar"
                   languagetool-show-error-on-jump t)

     ;; Tagging
     ;; ----------
     ;;cscope
     ;;gtags

     (shell :variables
            shell-default-height 30
            shell-default-term-shell "/usr/bin/zsh ~/.zshrc"
            shell-default-position 'bottom)

     ;; config auto completion
     (auto-completion :variables
                      ;; key setting
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      ;; feature
                      auto-completion-enable-sort-by-usage t
                      ;; backend config
                      spacemacs-default-company-backends '(company-files company-capf)
                      ;;auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory nil)
     ycmd
     git
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     enable-flyspell-auto-completion t
                     spell-checking-enable-auto-dictionary t)
     syntax-checking
     ;;version-control

     ;; Minor
     
     pdf-tools
     protobuf
     (colors :variables
             colors-colorize-identifiers 'variables
             colors-default-rainbow-identifiers-sat 42
             colors-enable-nyan-cat-progress-bar (display-graphic-p)
             colors-default-rainbow-identifiers-light 86)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      lispy meghanada groovy-mode gradle-mode
                                      stickyfunc-enhance dumb-jump
                                      cpputils-cmake function-args
                                      counsel-gtags company-childframe pyenv-mode
                                      hydra aggressive-indent academic-phrases
                                      pcap-mode
                                      ;; theme
                                      nord-theme ujelly-theme melancholy-theme
                                      ;; new batch
                                      base16-theme doom-themes kaolin-themes
                                      alect-themes
                                      ;; next a few
                                      ;; material-theme grayscale-theme
                                      ;; darktooth-theme cyberpunk-theme
                                      color-theme-sanityinc-tomorrow
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(ensime helm)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;;
   ;; light:
   ;;   material-light, spacemacs-light
   ;; dark:
   ;;   nord, grayscale, ujelly, cyberpunk, deeper-blue, misterioso srcery
   dotspacemacs-themes '(spacemacs-light
                         melancholy
                         misterioso ; geeko ;; error msg is so annoying
                         deeper-blue darktooth ;;ujelly
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(;;"Dejavu Sans Mono" ; size 15
                               "Noto Mono" ; size 16
                               ;;"Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
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
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
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
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
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
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; To fix the exec-path-from-shell problem.
  (setq explicit-shell-file-name "/bin/bash")
  (setq shell-file-name "bash")
  ;;(setq explicit-shell-file-name "/bin/zsh")
  ;;(setq shell-file-name "zsh")

  ;;(setq-default evil-escape-key-sequence "jk")

  ;; git magit
  (setq-default git-magit-status-fullscreen t)
  ;; deft mode always on
  ;;(require 'deft)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; -----------------------------------------------------
  ;;
  ;;   Enabling global definition and reference finding
  ;;
  ;; I always make sure the major programming languages have a consistent
  ;;keybinds:
  ;;
  ;; ``C-M-i'' -- completion at point
  ;; ``C-M-.'' -- find definitions
  ;; ``C-M-r'' -- find references
  ;; ``C-M-*'' -- go back
  ;; ``C-M-?'' -- show doc
  ;;
  ;; Additionaly, I want to use:
  ;;
  ;; ``C-x C-g'' -- dumb-jump
  ;;
  ;; -----------------------------------------------------

  ;; ------------------  Golang (guru) Starts --------------------------------

  ;; missing: describe and bunch of stuff
  (with-eval-after-load 'go-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-M-i")
                                        #'go-doc-at-point)))) ;; FIXME
  (with-eval-after-load 'go-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-M-.")
                                        #'go-guru-definition))))
  (with-eval-after-load 'go-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-M-,")
                                        #'go-guru-callers)))) ;; FIXME
  (with-eval-after-load 'go-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-M-r")
                                        #'go-guru-referrers))))
  (with-eval-after-load 'go-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-M-*")
                                        #'pop-tag-mark))))
  (with-eval-after-load 'go-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-M-?")
                                        #'godoc-at-point))))
  ;; -------------------------- Spare ones ---------------------------------
  (with-eval-after-load 'go-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-x C-.")
                                        #'go-guru-definition))))
  ;; ----------------------- Golang Ends Here -------------------------------

  ;; ------------------------ C++ (Gtags) Starts ------------------------------
  ;; function-args
  (fa-config-default)

  ;; Cpp utils
  (require 'cpputils-cmake)

  (add-hook 'c-mode-common-hook
            (lambda ()
              (if (derived-mode-p 'c-mode 'c++-mode)
                  (cppcm-reload-all)
                )))
  ;; OPTIONAL, somebody reported that they can use this package with Fortran
  (add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
  ;; OPTIONAL, avoid typing full path when starting gdb
  (global-set-key (kbd "C-c C-g")
                  '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
  ;; OPTIONAL, some users need specify extra flags forwarded to compiler
  (setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))

  ;; counsel-gtags-create-tags
  ;; counsel-gtags-update-tags
  (with-eval-after-load 'ggtags-mode
    (add-hook 'go-mode-hook (lambda() (define-key evil-normal-state-local-map
                                        (kbd "C-M-i")
                                        #'go-doc-at-point)))) ;; FIXME
  (with-eval-after-load 'ggtags-mode
    (add-hook 'ggtags-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-.")
                                            #'counsel-gtags-dwim))))
  (with-eval-after-load 'ggtags-mode
    (add-hook 'ggtags-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-,")
                                            #'go-guru-callers)))) ;; FIXME
  (with-eval-after-load 'ggtags-mode
    (add-hook 'ggtags-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-r")
                                            #'counsel-gtags-find-reference))))
  (with-eval-after-load 'ggtags-mode
    (add-hook 'ggtags-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-*")
                                            #'counsel-gtags-go-backward))))
  (with-eval-after-load 'ggtags-mode
    (add-hook 'ggtags-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-?")
                                            #'godoc-at-point))))
  ;; -------------------------- Spare ones ---------------------------------
  (with-eval-after-load 'ggtags-mode
    (add-hook 'ggtags-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-x C-.")
                                            #'counsel-gtags-dwim))))
  (with-eval-after-load 'ggtags-mode
    (add-hook 'ggtags-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-t")
                                            #'counsel-gtags-find-definition))))
  ;; ------------------------- C++ Ends Here -------------------------------


  ;; -------------------- Java (meghanada mode) ------------------------------
  (defun java-key-mode-hook ()
    (meghanada-mode)
    ;; jump to declare
    (define-key meghanada-mode-map (kbd "C-M-.") 'meghanada-jump-declaration)
    (define-key meghanada-mode-map (kbd "C-x C-i") 'meghanada-jump-declaration)
    (define-key meghanada-mode-map (kbd "C-x C-.") 'meghanada-jump-declaration)
    ;; jump back
    (define-key meghanada-mode-map (kbd "C-x C-*") 'meghanada-back-jump)
    (define-key meghanada-mode-map (kbd "C-M-*") 'meghanada-back-jump)
    ;; switch test case
    (define-key meghanada-mode-map (kbd "C-M-,") 'meghanada-switch-testcase)

    (define-key meghanada-mode-map (kbd "C-M-r") 'meghanada-local-variable)
    (define-key meghanada-mode-map (kbd "C-c C-r r") 'meghanada-local-variable)
    (define-key meghanada-mode-map (kbd "C-M-i") 'meghanada-import-all)
    (define-key meghanada-mode-map (kbd "C-M-t") 'meghanada-import-all)
    (define-key meghanada-mode-map (kbd "C-c C-r i") 'meghanada-import-all)

    (define-key meghanada-mode-map (kbd "C-c C-r o") 'meghanada-optimize-import)
    (define-key meghanada-mode-map (kbd "C-M-o") 'meghanada-optimize-import)

    (define-key meghanada-mode-map (kbd "C-c C-c c") 'meghanada-compile-project)
    )
  (add-hook 'java-mode-hook 'java-key-mode-hook)

  ;; noit workign
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-M-i")
                                          #'anaconda-mode-complete))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-M-.")
                                          #'meghanada-jump-declaration))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-M-,")
                                          #'meghanada-switch-testcase))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-M-r")
                                          #'meghanada-local-variable))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-M-*")
                                          #'meghanada-back-jump))))
  (with-eval-after-load 'java
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-M-?")
                                          #'anaconda-mode-show-doc))))
  ;; ---------------- Spare ones -----------------------
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-x C-.")
                                          #'meghanada-jump-declaration))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-c C-r i")
                                          #'meghanada-import-all))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-c C-r o")
                                          #'meghanada-optimize-import))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-c C-r r")
                                          #'meghanada-local-variable))))
  (with-eval-after-load 'java-mode
    (add-hook 'java-mode-hook (lambda() (define-key evil-normal-state-local-map
                                          (kbd "C-c C-c c")
                                          #'meghanada-project-compile))))
  ;; ----------------------- Java Ends Here ----------------------------------


  ;; -------------------- Python (Anaconda-mode) ------------------------------
  (with-eval-after-load 'python
    ;; https://github.com/proofit404/pyenv-mode
    (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-i")
                                            #'anaconda-mode-complete))))
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-.")
                                            #'anaconda-mode-find-definitions))))
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-,")
                                            #'anaconda-mode-find-assignments))))
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-r")
                                            #'anaconda-mode-find-references))))
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-*")
                                            #'anaconda-mode-go-back))))
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-M-?")
                                            #'anaconda-mode-show-doc))))
  ;; ---------------- Spare ones -----------------------
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
                                            (kbd "C-x C-.")
                                            #'anaconda-mode-find-definitions))))
  ;; -----------------------Python Ends Here ----------------------------------


  ;; ----------------------- Rust Starts Here ---------------------------------
  ;; (with-eval-after-load 'rust-mode
  ;;   (add-hook 'rust-mode-hook (lambda() (define-key evil-normal-state-local-map
  ;;                                         (kbd "C-M-i")
  ;;                                         #'anaconda-mode-complete))))
  ;; (with-eval-after-load 'rust-mode
  ;;   (add-hook 'rust-mode-hook (lambda() (define-key evil-normal-state-local-map
  ;;                                         (kbd "C-M-.")
  ;;                                         #'anaconda-mode-find-definitions))))
  ;; (with-eval-after-load 'rust-mode
  ;;   (add-hook 'rust-mode-hook (lambda() (define-key evil-normal-state-local-map
  ;;                                         (kbd "C-M-,")
  ;;                                         #'anaconda-mode-find-assignments))))
  ;; (with-eval-after-load 'python
  ;;   (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
  ;;                                           (kbd "C-M-r")
  ;;                                           #'anaconda-mode-find-references))))
  ;; (with-eval-after-load 'python
  ;;   (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
  ;;                                           (kbd "C-M-*")
  ;;                                           #'anaconda-mode-go-back))))
  ;; (with-eval-after-load 'python
  ;;   (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
  ;;                                           (kbd "C-M-?")
  ;;                                           #'anaconda-mode-show-doc))))
  ;; ;; ---------------- Spare ones -----------------------
  ;; (with-eval-after-load 'python
  ;;   (add-hook 'python-mode-hook (lambda() (define-key evil-normal-state-local-map
  ;;                                           (kbd "C-x C-.")
  ;;                                           #'anaconda-mode-find-definitions))))

  ;; SPC m =	reformat the buffer
  ;; SPC m c .	repeat the last Cargo command
  ;; SPC m c C	remove build artifacts with Cargo
  ;; SPC m c X	execute a project example with Cargo
  ;; SPC m c c	compile project with Cargo
  ;; SPC m c d	generate documentation with Cargo
  ;; SPC m c e	run benchmarks with Cargo
  ;; SPC m c f	format all project files with rustfmt
  ;; SPC m c i	create a new project with Cargo (init)
  ;; SPC m c l	run linter (cargo-clippy) with Cargo
  ;; SPC m c n	create a new project with Cargo (new)
  ;; SPC m c o	run all tests in current file with Cargo
  ;; SPC m c s	search for packages on crates.io with Cargo
  ;; SPC m c t	run the current test with Cargo
  ;; SPC m c u	update dependencies with Cargo
  ;; SPC m c x	execute a project with Cargo
  ;; SPC m c v	check (verify) a project with Cargo
  ;; SPC m g g	jump to definition
  ;; SPC m h h	describe symbol at point
  ;; SPC m t	run tests with Cargo
  ;; ----------------------- Rust Ends Here -----------------------------------

  ;;
  ;; semanticsemantic
  (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
  (semantic-mode 1)
  (require 'stickyfunc-enhance)

  ;; Dumb Jump
  (dumb-jump-mode)
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-aggressive nil)

  ;; globally enable company
  ;; -----------------------
  (global-company-mode)

  ;; Git and Magit
  (setq magit-repository-directories '("~/repos/","~/dev/","~/git/","~/workspace/"))


  ;; convienant keybinding for functions:
  ;; ------------------------------------

  ;; -------------------- Flycheck (Anaconda-mode) ------------------------------

  ;; Not working

  (defun flycheck-my-load ()
    (flycheck-mode t)
    
    ;; Utility key bindings for navigating errors reported by flycheck.
    (local-set-key (kbd "C-c C-d") 'flycheck-explain-error-at-point)
    (local-set-key (kbd "C-c C-n") 'flycheck-error-list-next-error)
    (local-set-key (kbd "C-c C-p") 'flycheck-error-list-previous-error)
    (local-set-key (kbd "C-c C-c") 'flycheck-list-errors)
    ;; Prevents flymake from throwing a configuration error
    ;; This must be done because atsopt returns a non-zero return value
    ;; when it finds an error, flymake expects a zero return value.
    ;;(defadvice flycheck-post-syntax-check (before flymake-force-check-was-interrupted)
    ;;(setq flymake-check-was-interrupted t))
    ;;(ad-activate 'flymake-post-syntax-check)
    ;; deal with color id mode
    )

  (add-hook 'prog-mode-hook 'flycheck-my-load)

  (with-eval-after-load 'flycheck-mode
    (add-hook 'flycheck-mode-hook (lambda() (define-key evil-normal-state-local-map
                                              (kbd "C-c C-d")
                                              #'flycheck-explain-error-at-point))))
  (with-eval-after-load 'flycheck-mode
    (add-hook 'flycheck-mode-hook (lambda() (define-key evil-normal-state-local-map
                                              (kbd "C-c C-c")
                                              #'flycheck-list-errors))))
  (with-eval-after-load 'flycheck-mode
    (add-hook 'flycheck-mode-hook (lambda() (define-key evil-normal-state-local-map
                                              (kbd "C-c C-n")
                                              #'flycheck-error-list-next-error))))
  (with-eval-after-load 'flycheck-mode
    (add-hook 'flycheck-mode-hook (lambda() (define-key evil-normal-state-local-map
                                              (kbd "C-c C-p")
                                              #'flycheck-error-list-previous-error))))
  ;; ----------------------- Flycheck Ends Here ----------------------------------

  ;; ------------------- Linux Kernel Coding Style ----------------------------
  (defun c-lineup-arglist-tabs-only (ignored)
    "Line up argument lists by tabs, not spaces"
    (let* ((anchor (c-langelem-pos c-syntactic-element))
           (column (c-langelem-2nd-pos c-syntactic-element))
           (offset (- (1+ column) anchor))
           (steps (floor offset c-basic-offset)))
      (* (max steps 1)
         c-basic-offset  8)))

  (add-hook 'c-mode-common-hook
            (lambda ()
              ;; Add kernel style
              (c-add-style
               "linux-tabs-only"
               '("linux" (c-offsets-alist
                          (arglist-cont-nonempty
                           c-lineup-gcc-asm-reg
                           c-lineup-arglist-tabs-only))))))

  (add-hook 'c-mode-hook
            (lambda ()
              (let ((filename (buffer-file-name)))
                ;; Enable kernel mode for the appropriate files
                (when (and filename
                           (string-match (expand-file-name "~/git/kernels")
                                         filename))
                  (setq indent-tabs-mode t)
                  (setq show-trailing-whitespace t)
                  (c-set-style "linux-tabs-only")))))
  ;; ----------------- Linux Kernel Style Ends Here --------------------------

  ;; Auto Yasnippet
  ;;(require 'auto-yasnippet-mode)
  ;;(global-set-key (kbd "H-w") #'aya-create)
  ;;(global-set-key (kbd "H-y") #'aya-expand)
  ;;(global-set-key (kbd "C-o") #'aya-open-line)

  ;; use company childframe
  (require 'company-childframe)
  (company-childframe-mode 1)

  ;; Deft/Org mode setting
  ;; -----------------------------
  ;;(setq deft-directory "~/Documents/org")
  (require 'deft)
  (setq deft-directory "~/Dropbox/GS/18spring")
  (global-set-key (kbd "C-c C-n") 'deft-new-file)
  (global-set-key (kbd "C-c C-m") 'deft-new-file-named)
  (global-set-key (kbd "C-c C-r") 'deft-rename-file)

  ;; Org capture setting
  ;; https://blog.aaronbieber.com/2016/01/30/dig-into-org-mode.html
  (setq org-directory "~/Documents/org/")
  (setq org-default-notes-file (concat org-directory "/notes.org"))

  ;;(setq org-todo-keywords         '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "SUBTREE(s)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELLED(c@/!)")
          (sequence "CRASH(c)" "BUG(b)" "REQUEST(r)" "TEST(e)" "|" "FIXED(f)")))

  (setq org-capture-templates
        '(("a" "My TODO task format." entry
           (file "todo.org")
           "* TODO %?
SCHEDULED: %t")))

  (defun air-org-task-capture ()
    "Capture a task with my default template."
    (interactive)
    (org-capture nil "a"))
  (define-key global-map (kbd "C-c c") 'air-org-task-capture)
  ;; end of org setting

  (setq org-todo-keyword-faces
        '(("WAIT" . "white")
          ("CRASH" . "red")
          ("BUG" . "red")
          ("SUBTREE" . "grey")
          ("TEST" . "turquoise1")
          ))
  (setq org-agenda-custom-commands
        '(
          ("p" . "筛选任务(目前无效果，需要修复)")
          ("pa" "Important but not Urgent" tags "+PRIORITY=\"A\"")
          ("pb" "Urgent" tags "+PRIORITY=\"B\"")
          ;;("pc" "一定要完成但是不着急的任务" tags "+PRIORITY=\"C\"")
          ;;("pd" "做完有好处的任务" tags "+PRIORITY=\"D\"")
          ;;("pe" "无所谓做不做的任务" tags "+PRIORITY=\"E\"")
          ))

  ;; aggressive indent mode
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)



  ;; forget what they are for
  ;; ------------------------
  (setq org-ref-default-bibliography '("~/git/reference/references.bib")
        org-ref-pdf-directory "~/Documents/files"
        org-ref-bibliography-notes "~/Documents/notes.org")
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (setq doc-view-resolution 144)
  (setq org-ref-open-pdf-function
        (lambda (fpath)
          (start-process "zathura" "*helm-bibtex-zathura*" "/usr/bin/zathura" fpath)))
  (add-hook 'text-mode-hook 'turn-on-auto-fill)  ; latex config not working

  ;; compile buffer auto-close if succeed
  ;; ---------------------------------------------
  (defun bury-compile-buffer-if-successful (buffer string)
    "Bury a compilation buffer if succeeded without warnings "
    (when (and
           (buffer-live-p buffer)
           (string-match "compilation" (buffer-name buffer))
           (string-match "finished" string)
           (not
            (with-current-buffer buffer
              (goto-char (point-min))
              (search-forward "warning" nil t))))
      (run-with-timer 1 nil
                      (lambda (buf)
                        (bury-buffer buf)
                        (delete-windows-on buf))
                      buffer)))
  (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

  ;; I want smartparen mode in LaTeX
  (add-hook 'text-mode-hook 'smartparens-mode)
  ;; experimental: auto-revert
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; FAV GLOBAL from SO
  ;; https://stackoverflow.com/questions/3124844/what-are-your-favorite-global-key-bindings-in-emacs
  ;; Magit rules!
  (global-set-key (kbd "C-x g") 'magit-status)

  ;; cycle through buffers
  (global-set-key (kbd "<C-tab>") 'bury-buffer)

  ;; use hippie-expand instead of dabbrev
  (global-set-key (kbd "M-/") 'hippie-expand)

  ;; eshell simple
  (global-set-key (kbd "C-x m") 'eshell)

  ;; turn on crosshairs mode by default
  ;; -----------------------------------
  ;;(add-hook 'prog-mode-hook 'crosshairs-mode)

  ;; Hack: anaconda mode is not enabled in python by default?
  ;; --------------------------------------------------------
  ;;(add-hook 'python-mode-hook 'anaconda-mode)

  (add-hook 'prog-mode-hook 
            (lambda ()
              ;; Enable fill column indicator
              (fci-mode t)
              ;; Turn off line numbering, it makes org so slow
              (linum-mode -1)
              ;; Set fill column to 79
              (setq fill-column 79)
              ;; Enable automatic line wrapping at fill column
              (auto-fill-mode t)))

  ;; Activate column indicator in prog-mode and text-mode
  (add-hook 'prog-mode-hook 'turn-on-fci-mode)
  (add-hook 'text-mode-hook 'turn-on-fci-mode)

  ;; ycmd config
  ;;
  ;; $ ./build.py --clang-completer --go-completer --rust-completer --system-libclang
  ;; ------------

  (setq ycmd-server-command '("python" "/home/jethros/git/ycmd/ycmd"))
  (set-variable 'ycmd-global-config "/home/jethros/.ycm_extra_conf.py")

  (setq ycmd-extra-conf-whitelist '("/home/jethros/workspace/*"))
  (setq ycmd-extra-conf-whitelist '("/home/jethros/git/*"))
  (setq ycmd-force-semantic-completion t)
  ;; if company-ycmd
  (global-set-key (kbd "<C-tab>") 'ycmd/manual-semantic-company-completer)

  (defun ycmd-setup-completion-at-point-function ()
    "Setup `completion-at-point-functions' for `ycmd-mode'."
    (add-hook 'completion-at-point-functions
              #'ycmd-complete-at-point nil :local))
  (add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)

  ;;(add-hook 'c++-mode-hook 'ycmd-mode) ; redundent?
  (add-hook 'c-mode-hook 'ycmd-mode)
  (add-hook 'rust-mode-hook 'ycmd-mode)

  ;; C++ reference look up : kinda broken
  ;; ==================================================================
  ;; (require 'anything)
  ;; (require 'anything-config)
  ;; (global-set-key (kbd "C-c I")  ;; i -> info
  ;;  (lambda () (interactive)
  ;;   (anything
  ;;    :prompt "Info about: "
  ;;    :candidate-number-limit 100
  ;;    :sources
  ;;       '(anything-c-source-man-pages
  ;;         anything-c-source-boost-html))))

  ;; boost documentation
  (require 'w3m)

  (defvar boost-documentation-directory
    "/usr/share/doc/libboost1.63-doc/"
    "defines boost directory location")


  (defun recursive-file-list (dir)
    (let ((files-list '())
          (current-entries (directory-files dir t)))
      (dolist (entry current-entries)
        (cond ((and (file-regular-p entry)
                    (string-match "html?$" entry))
               (setq files-list
                     (cons entry files-list)))
              ((and (file-directory-p entry)
                    (not (string-equal ".." (substring entry -2)))
                    (not (string-equal "." (substring entry -1))))
               (setq files-list (append files-list (recursive-file-list entry))))))
      files-list))

  (defvar anything-c-source-boost-html
    '((name . "boost html documentation")
      (requires-pattern . 3)
      (candidates . (lambda ()
                      (recursive-file-list boost-documentation-directory)))
      (delayed)
      (action . (lambda (entry)
                  (w3m-browse-url entry)))))
  ;; ---------------------------------------------------------------------------


  ;; ---------------------------------------------------------------
  ;;
  ;;       Here goes some boring definition of functions
  ;;
  ;; ---------------------------------------------------------------

  (defun ido-imenu ()
    "Update the imenu index and then use ido to select a symbol to navigate to.
Symbols matching the text at point are put first in the completion list."
    (interactive)
    (imenu--make-index-alist)
    (let ((name-and-pos '())
          (symbol-names '()))
      (flet ((addsymbols (symbol-list)
                         (when (listp symbol-list)
                           (dolist (symbol symbol-list)
                             (let ((name nil) (position nil))
                               (cond
                                ((and (listp symbol) (imenu--subalist-p symbol))
                                 (addsymbols symbol))

                                ((listp symbol)
                                 (setq name (car symbol))
                                 (setq position (cdr symbol)))

                                ((stringp symbol)
                                 (setq name symbol)
                                 (setq position (get-text-property 1 'org-imenu-marker symbol))))

                               (unless (or (null position) (null name))
                                 (add-to-list 'symbol-names name)
                                 (add-to-list 'name-and-pos (cons name position))))))))
        (addsymbols imenu--index-alist))
      ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
      (let ((symbol-at-point (thing-at-point 'symbol)))
        (when symbol-at-point
          (let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
                 (matching-symbols (delq nil (mapcar (lambda (symbol)
                                                       (if (string-match regexp symbol) symbol))
                                                     symbol-names))))
            (when matching-symbols
              (sort matching-symbols (lambda (a b) (> (length a) (length b))))
              (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
                    matching-symbols)))))
      (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
             (position (cdr (assoc selected-symbol name-and-pos))))
        (goto-char position))))
  ;; --------------------- FUNC ENDS HERE -----------------------
  )

(provide '.spacemacs)
;;; .spacemacs ends here


