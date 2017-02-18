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
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     markdown
     csv
     html
     clojure
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :disabled-for org)
     erc
     elm
     spacemacs-layouts
     chrome
     emacs-lisp
     elfeed
     javascript
     scheme
     org
     version-control
     git
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      pdf-tools
                                      fringe-helper
                                      gnu-apl-mode
                                      shen-mode
                                       ;; clojure/lisps
                                       ;; clj-refactor clojure-mode rainbow-delimiters
                                       ;; cider cider-decompile cider-eval-sexp-fu cider-profile cider-spy
                                       ;; eval-in-repl
                                       ;; key-chord
                                       ;; gitconfig-mode
                                       ;; docker dockerfile-mode

                                       ;; misc modes

                                       ;; display stuff
                                       org-bullets org-beautify-theme
                                       )

    ;; A list of packages and/or extensions that will not be install and loaded.
    ;; dotspacemacs-excluded-packages '(persp-mode
    ;;                                  perspective
    ;;                                  persp-projectile)

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
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Mevil-projessages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(;; monokai
                         noctilux
                         )

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Verdana"
                               :size 12
                               :weight thin
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader ke
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
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.0
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
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
   global-visual-line-mode t
   evil-escape-key-sequence "kj"
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (load-file "~/.private/emacs-feeds-and-private.el")

  (setq system-uses-terminfo nil)
  (spacemacs/toggle-mode-line-org-clock-on)

  ;; this might work
  ;; (add-hook 'shell-mode-hook #'(lambda () (smartparens-mode 0)))

  (defun really-kill-emacs ()
    (interactive)
    (let (kill-emacs-hook) (kill-emacs)))
  (define-key evil-normal-state-map (kbd "SPC q Q")  'really-kill-emacs)
  (defun m/open-terminal ()
    (interactive)
    (shell (generate-new-buffer-name "shell")))

  (define-key evil-normal-state-map (kbd "q") nil) ;; this is a way to make 'q' a prefix key
  (define-key evil-normal-state-map (kbd "qq") 'quit-window)
  (define-key evil-normal-state-map (kbd "qm")  'evil-record-macro)

  (global-set-key (kbd "M-x")     'helm-M-x)
  (define-key evil-normal-state-map (kbd "SPC :")  'helm-M-x)
  (define-key evil-normal-state-map (kbd "SPC d t")  'm/open-terminal)
  (define-key evil-normal-state-map (kbd "SPC d a")  'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "SPC d m")  'magit-status)

  (define-key evil-normal-state-map (kbd "SPC w /") 'm/split-window-and-ask-for-buffer)
  (define-key evil-normal-state-map (kbd "SPC p s F")  'ag-project-files-current-current-file-extension)

  (define-key evil-normal-state-map (kbd "SPC p t")  'projectile-toggle-between-implementation-and-test)
  (define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "SPC SPC") nil)
  (global-set-key [C-tab]         'dabbrev-expand)
  (global-set-key (kbd "C-x C-c") 'nil) ;; default \C-x\C-c is too easy to hit accidentally
  ;; OSX annoyances
  (global-unset-key (kbd "s-t"))
  (setq projectile-enable-caching t)
  (global-evil-search-highlight-persist nil)
  (evil-set-initial-state 'elfeed-show-mode 'insert)
  (evil-set-initial-state 'elfeed-search-mode 'insert)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-imenu-fuzzy-match t)

  (setq debug-on-error t)

  (defun m/split-window-and-ask-for-buffer ()
    (interactive)
    (split-window-right-and-focus)
    (helm-buffers-list))

  (setq inferior-shen-program "java -jar /Users/matt/hacking/shen/shen.clj/shen.clj-0.1.8-SNAPSHOT/shen.clj-0.1.8-SNAPSHOT-standalone.jar")

  (defface default '((t (:inherit nil :stipple nil :background "black" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight thin :height 140 :width normal :foundry "unknown" :family "Operator Mono"))) "default face" :group 'default)

  )



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffer-stack-untracked
   (quote
    ("KILL" "*Compile-Log*" "*Compile-Log-Show*" "*Group*" "*Completions*")))
 '(cider-repl-history-file "~/emacs-files/cider-history")
 '(column-number-mode t)
 '(company-files-exclusions ".org")
 '(compilation-message-face (quote default))
 '(completion-ignored-extensions
   (quote
    (".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo")))
 '(custom-enabled-themes (quote (noctilux)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dired-listing-switches
   "-lahBF --ignore=#* --ignore=.svn --ignore=.git --group-directories-first")
 '(dired-use-ls-dired (quote unspecified))
 '(evil-default-cursor (quote (hbar)))
 '(evil-want-Y-yank-to-eol t)
 '(fringe-mode 0 nil (fringe))
 '(global-evil-search-highlight-persist nil)
 '(global-undo-tree-mode t)
 '(helm-ag-use-agignore t)
 '(nrepl-log-messages t)
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("x" agenda "doesn't have data like :food:interruptions:reading:"
      ((org-agenda-ndays 7)
       (org-agenda-filter-preset
        (quote
         ("-reading" "-food" "-interrupt"))))))))
 '(org-agenda-files
   (quote
    ("~/org/home.org" "~/org/work.org" "~/org/schedule.org" "~/org/refile.org")))
 '(org-capture-templates
   (quote
    (("b" "copy of interruption" entry
      (file+headline "~/org/schedule.org" "* interruptions")
      "** %?
%a
%T
%i" :clock-in t :clock-resume t)
     ("k" "outlaw" entry
      (file "~/org/notes.org")
      "* fuck %?")
     ("e" "emacs annoyances" entry
      (file+headline "~/org/home.org" "emacs annoyances")
      "** %?
%T
")
     ("q" "quote" plain
      (file+headline "~/org/notes.org" "quotes")
      "** %?
%T
")
     ("n" "note" plain
      (file+headline "~/org/notes.org" "Notes")
      "** %?
%T

%a")
     ("s" "someday to read" entry
      (file+headline "~/org/home.org" "someday to read")
      "** %?
%T

%a
%i

")
     ("f" "food" entry
      (file+headline "~/org/schedule.org" "food")
      "** %?
%T
")
     ("d" "diary entry" entry
      (file+headline "notes.org" "diary")
      "** 
%T

%a
%i
%?" :clock-in t :clock-resume t)
     ("i" "interruption" entry
      (file+headline "schedule.org" "interruptions")
      "** %?
%a
%T
%i" :clock-in t :clock-resume t))))
 '(org-clock-mode-line-total (quote current))
 '(org-startup-truncated nil)
 '(org-stuck-projects
   (quote
    ("LEVEL>1/TODO"
     ("NEXT" "SOMEDAY" "READ" "DONE" "INFOED" "CANCELLED" "DEFERRED")
     nil "")))
 '(package-selected-packages
   (quote
    (fringe-helper ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package typo toc-org tagedit spacemacs-theme spaceline smeargle slim-mode shen-mode scss-mode sass-mode restart-emacs rainbow-delimiters quelpa pug-mode persp-mode pdf-tools pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets org-beautify-theme open-junk-file noctilux-theme neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gnu-apl-mode gmail-message-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emmet-mode elm-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies edit-server dumb-jump define-word csv-mode company-web company-tern company-statistics column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".repl" "target" "*compiled*" "*goog*" ".metadata" "*.metadata*" "class" "classes")))
 '(projectile-globally-ignored-file-suffixes (quote (".class" "class")))
 '(projectile-globally-ignored-files
   (quote
    ("TAGS" ".gitignore" ".emacs.desktop" ".class" "*#*#")))
 '(projectile-indexing-method (quote native))
 '(read-buffer-completion-ignore-case t)
 '(shr-external-browser (quote eww-browse-url))
 '(trash-directory "~/.Trash"))

;; .spacemacs is 479 lines long
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight thin :height 120 :width normal :foundry "nil" :family "Verdana")))))
