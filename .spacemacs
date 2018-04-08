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
   '(graphviz
     floobits
     sql
     react
     python
     yaml
     latex
     pdf-tools
     markdown
     csv
     html
     clojure ;; :variables clojure-enable-fancify-symbols t ;; put in a () if you want this. dunno if it's buggy
     common-lisp
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :disabled-for spacemacs-org org)
     erc
     spacemacs-layouts
     chrome
     emacs-lisp
     javascript
     scheme
     spacemacs-org
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
                                      gnu-apl-mode
                                      shen-mode
                                      org-projectile
                                      org-projectile-helm
                                      org-beautify-theme
                                      (j-mode :location (recipe :fetcher github :repo "zlrth/j-mode"))
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
   dotspacemacs-default-font '("Monaco"
                               :size 12
                               :weight bold ;; bold is normal and normal is bold. wtf.
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
   dotspacemacs-which-key-delay 1.0
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
   ;; global-visual-line-mode t ;; disabling? not sure if i want this. i get line-escapes at the edge of a window.
   evil-escape-key-sequence "kj"))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (with-eval-after-load 'j-mode
    (evil-define-key 'normal j-mode-map
      (kbd ", b") 'j-console-execute-line
      (kbd ", s") 'j-console
      (kbd ", h") 'j-help-lookup-symbol-at-point
      (kbd ", H") 'j-help-lookup-symbol))
  ;; TODO j-jump-to-inf-buffer
  ;; TODO open eww in fixed opposing buffer

  (with-eval-after-load 'eww-mode
    (evil-define-key 'normal eww-mode-map
      (kbd ", l") 'j-console-execute-line
      (kbd ", h") 'j-help-lookup-symbol-at-point
      (kbd ", H") 'j-help-lookup-symbol))
  (with-eval-after-load 'clojure-mode
    (evil-define-key 'normal clojure-mode-map (kbd ", b") 'start-cider-project))
  (with-eval-after-load 'evil-org
    (evil-define-key 'normal evil-org-mode-map "o" 'evil-open-below))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (require 'helm-bookmark)
  (require 'org-projectile)
  (if (file-exists-p "~/.private/emacs-feeds-and-private.el")
      (load-file "~/.private/emacs-feeds-and-private.el"))

  (setq system-uses-terminfo nil)
  (setq github-paradox-token "56c88d91b8464deae4ad605efc8cbaf766f42de2")
  (spacemacs/toggle-mode-line-org-clock-on)

  (add-hook 'org-mode-hook 'toggle-word-wrap)
  (add-hook 'clojure-mode-hook (lambda ()
                                 (paredit-mode t)
                                 (rainbow-delimiters-mode-disable)))
  (add-hook 'lisp-mode-hook (lambda ()
                              (paredit-mode t)
                              (rainbow-delimiters-mode-disable)))
  (add-hook 'cider-repl-mode-hook (lambda () (paredit-mode t)))
  (add-hook 'org-mode-hook (lambda () (toggle-word-wrap t)))
  ;; this may work
  (setq-default word-wrap t)

  ;; https://www.emacswiki.org/emacs/ShellDirtrackByPrompt#toc2
  ;; doesn't work. wtf. shell-dirtrack-mode nil doesn't work.
  ;; july 4 2017. maybe i fixed a bug in my regex. but it still doesn't work. don't know why.
  (add-hook 'shell-mode-hook
            (lambda ()
              (setq dirtrack-list '("|mfm|\\([^|]*\\)|" 1 nil))
              (shell-dirtrack-mode nil)
              (setq dirtrackp nil)
              (dirtrack-mode)))

(setq comint-input-ring-size 100000)
;; https://emacs.stackexchange.com/a/22295
(defun my-command-history-hook ()
  (setq comint-input-ring-file-name "~/.zsh_history")
  (setq comint-input-ring-separator "\n: \\([0-9]+\\):\\([0-9]+\\);")
  (comint-read-input-ring t))

(add-hook 'shell-mode-hook 'my-command-history-hook)

(defun really-kill-emacs ()
  (interactive)
  (let (kill-emacs-hook) (kill-emacs)))

(define-key evil-normal-state-map (kbd "SPC q Q")  'really-kill-emacs)

(defun m/open-terminal ()
  (interactive)
  (shell (generate-new-buffer-name "shell")))




(defun org-refile-to-time-spent ()
  (interactive)
  (org-refile))

(define-key evil-normal-state-map (kbd "#") 'refile-to-time-spent)

(rainbow-delimiters-mode-disable)
(indent-guide-mode)

(define-key evil-normal-state-map (kbd "C-u") 'prefix-arg)

(define-key evil-normal-state-map (kbd "q") nil) ;; this is a way to make 'q' a prefix key
(define-key evil-normal-state-map (kbd "qq") 'quit-window)
(define-key evil-normal-state-map (kbd "qm")  'evil-record-macro)
(define-key evil-normal-state-map (kbd "SPC d u")  'clojure-fill-paragraph)
(define-key evil-normal-state-map (kbd "SPC d l")  'toggle-truncate-lines)
(define-key evil-normal-state-map (kbd "SPC d t")  'm/open-terminal)
(define-key evil-normal-state-map (kbd "SPC d a")  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "SPC d m")  'magit-status)
(define-key evil-normal-state-map (kbd "SPC d r")  'rename-buffer)
(define-key evil-normal-state-map (kbd "SPC a o j")  'org-clock-jump-to-current-clock)
(define-key evil-normal-state-map (kbd "SPC d c")  'm/org-goto-selection)
(define-key evil-normal-state-map (kbd "SPC d s") 'm/edit-dot-spacemacs)
(define-key evil-normal-state-map (kbd "SPC d f") 'm/edit-schedule)
(define-key evil-normal-state-map (kbd "SPC d i") 'm/insert-interruption)
(define-key evil-normal-state-map (kbd "SPC d r") 'window-configuration-to-register)
(define-key evil-normal-state-map (kbd "SPC d j") 'jump-to-register)
(define-key evil-normal-state-map (kbd "SPC w /") 'm/split-window-and-ask-for-buffer)
(define-key evil-normal-state-map (kbd "SPC p s F")  'ag-project-files-current-current-file-extension)
(define-key evil-normal-state-map (kbd "SPC p t")  'projectile-toggle-between-implementation-and-test)
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "SPC SPC") 'org-capture)

(global-set-key (kbd "C-x C-c") 'nil) ;; default C-x C-c is too easy to hit accidentally
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(define-key evil-normal-state-map (kbd ", t e") 'm/eval-sexp-and-clojure-test)


(fset 'refile-to-time-spent
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item
         (quote ([44 82 116 105 109 101 32 115 112 101 110 116 return] 0 "%d")) arg)))


(fset 'search-matts-org-project
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([32 112 112 111 114 103 return 13 32 115 97 112] 0 "%d")) arg)))

(defun search-matts-org-project ()
  (interactive)
  (switch-to-buffer "work.org")
  (spacemacs/helm-project-do-ag) ;; so how would i do, "if you C-g, go back to the previous buffer" TODO ask emacs subreddit
  )


(defun spacemacs/cider-test-run-focused-test ()
  "Run test around point."
  (interactive)
  (save-buffer)
  (cider-load-buffer)
  (cider-test-run-test))


(defun cider-jack-in-with-start-figwheel (&optional prompt-project cljs-too)
  "Start an nREPL server for the current project and connect to it.
If PROMPT-PROJECT is t, then prompt for the project for which to
start the server.
If CLJS-TOO is non-nil, also start a ClojureScript REPL session with its
own buffer."
  (interactive "P")
  (setq cider-current-clojure-buffer (current-buffer))
  (let* ((project-type (cider-project-type))
         (command (cider-jack-in-command project-type))
         (command-resolved (cider-jack-in-resolve-command project-type))
         (command-global-opts (cider-jack-in-global-options project-type))
         (command-params (cider-jack-in-params project-type)))
    (if command-resolved
        (let* ((project (when prompt-project
                          (read-directory-name "Project: ")))
               (project-dir (clojure-project-dir
                             (or project (cider-current-dir))))
               (params (if prompt-project
                           (read-string (format "nREPL server command: %s "
                                                command-params)
                                        command-params)
                         command-params))
               (params (if cider-inject-dependencies-at-jack-in
                           (cider-inject-jack-in-dependencies command-global-opts params project-type)
                         params))

               (cmd (format "%s %s" command-resolved params)))
          (if (or project-dir cider-allow-jack-in-without-project)
              (progn
                (when (or project-dir
                          (eq cider-allow-jack-in-without-project t)
                          (and (null project-dir)
                               (eq cider-allow-jack-in-without-project 'warn)
                               (y-or-n-p "Are you sure you want to run `cider-jack-in' without a Clojure project? ")))
                  (when-let ((repl-buff (cider-find-reusable-repl-buffer nil project-dir)))
                    (let ((nrepl-create-client-buffer-function  #'cider-repl-create)
                          (nrepl-use-this-as-repl-buffer repl-buff))
                      (nrepl-start-server-process
                       project-dir cmd
                       (lambda (client-buffer)
                         (switch-to-buffer client-buffer)
                         (sleep-for 1)
                         (insert "(start-figwheel \"ios\")")
                         (cider-repl-return)))))))
            (user-error "`cider-jack-in' is not allowed without a Clojure project")))
      (user-error "The %s executable isn't on your `exec-path'" command))))

(defun start-cider-project ()
  (interactive)
  (cider-jack-in-with-start-figwheel)
  (projectile-with-default-dir (projectile-project-root)
    (async-shell-command "react-native run-ios > /dev/null" nil nil))) ;; want stdout and stderr for debugging? s!/> /dev/null!!


(defun m/copy-apollo-tracker-to-clipboard ()
  "so i don't have to keep finding this string in my org project.
FIXME when i put this on github, put the string in private.el"
  (interactive)
  (ns-store-selection-internal 'CLIPBOARD "http://apollo.rip:2095/d986b2c39a9d02a31eefbb4c989835aa/announce"))

(defun m/eval-sexp-and-clojure-test ()
  (interactive)
  (cider-eval-last-sexp)
  (cider-test-run-test))

(defun m/org-goto-selection ()
  (interactive)
  (org-clock-goto 'SELECT)
  (org-clock-in))

(defun m/edit-dot-spacemacs ()
  (interactive)
  (find-file "~/.spacemacs"))

(defun m/edit-schedule ()
  (interactive)
  (find-file "~/org/schedule.org"))

(defun m/insert-interruption ()
  (interactive)
  (org-capture nil "i"))

(defun m/split-window-and-ask-for-buffer ()
  (interactive)
  (split-window-right-and-focus)
  (helm-buffers-list))

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

(define-key global-map [menu-bar options] nil)
(define-key global-map [menu-bar YASnippet] nil) ;; doesn't work
(define-key global-map [menu-bar edit] nil)
(define-key global-map [menu-bar buffer] nil)
(define-key global-map [menu-bar tools] nil)
(define-key global-map [menu-bar help-menu] nil)
(define-key global-map [menu-bar file] nil)


(setq debug-on-error t)
(setq org-hide-emphasis-markers t) ;; i no longer think this is buffer-local.

(setq inferior-shen-program " /Users/matt/hacking/shen/shen-json/shen") ;; TODO could i put all of these setq's up in setq-default?

(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))


(defface default '((t (:inherit nil :stipple nil :background "black" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight extralight :height 120 :width normal :foundry "unknown" :family "Operator MOno"))) "default face" :group 'default)) ;; TODO do i need this?



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
 '(debug-on-error nil)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dired-listing-switches
   "-lahBF --ignore=#* --ignore=.svn --ignore=.git --group-directories-first")
 '(dired-recursive-deletes (quote always))
 '(dired-use-ls-dired (quote unspecified))
 '(dirtrack-list (quote ("|mfm|  \\([^|]*\\)" 1)))
 '(evil-default-cursor (quote (hbar)))
 '(evil-move-beyond-eol t)
 '(evil-move-cursor-back nil)
 '(evil-want-Y-yank-to-eol t)
 '(fringe-mode 0 nil (fringe))
 '(global-evil-search-highlight-persist nil)
 '(global-undo-tree-mode t)
 '(helm-ag-use-agignore t)
 '(inferior-lisp-program "sbcl" t)
 '(nrepl-log-messages t)
 '(ns-antialias-text t)
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
    (("e" "emacs annoyances" entry
      (file+headline "~/org/home.org" "emacs annoyances")
      "**  %?
%U
")
     ("q" "quote" plain
      (file+headline "~/org/notes.org" "quotes")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("n" "note" plain
      (file+headline "~/org/notes.org" "Notes")
      "**  %?
%U

%a")
     ("s" "someday to read" entry
      (file+headline "~/org/home.org" "someday to read")
      "** %?
%U

%a
%i

")
     ("f" "food" entry
      (file+headline "~/org/schedule.org" "food")
      "**  %?
%U
")
     ("d" "diary entry" entry
      (file+headline "notes.org" "diary")
      "** 
%U

%a
%i
%?" :clock-in t :clock-resume t)
     ("i" "interruption" entry
      (file+headline "schedule.org" "interruptions")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("w" "work note" entry
      (file+headline "~/org/work.org" "spendgap refile")
      "**  %?
%a
%U
%i" :clock-in t :clock-resume t))))
 '(org-clock-mode-line-total (quote current))
 '(org-habit-graph-column 80)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-refile-targets
   (quote
    ((org-agenda-files :regexp . "time spent")
     (org-agenda-files :regexp . "someday to read")
     (org-agenda-files :regexp . "catapult")
     (org-agenda-files :regexp . "UR")
     (org-agenda-files :regexp . "paypal")
     (org-agenda-files :regexp . "jokes")
     (org-agenda-files :regexp . "ephemeral"))))
 '(org-startup-truncated nil)
 '(org-stuck-projects
   (quote
    ("LEVEL>1/TODO"
     ("NEXT" "SOMEDAY" "READ" "DONE" "INFOED" "CANCELLED" "DEFERRED")
     nil "")))
 '(package-selected-packages
   (quote
    (org-projectile-helm auctex yapfify yaml-mode winum tide typescript-mode flycheck sql-indent slime-company slime pyvenv pytest pyenv-mode py-isort pip-requirements phpunit phpcbf php-extras org-category-capture live-py-mode hy-mode helm-pydoc fuzzy flymd php-mode cython-mode company-auctex company-anaconda common-lisp-snippets anaconda-mode pythonic php-auto-yasnippets drupal-mode auctex-latexmk tablist skewer-mode json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode ham-mode markdown-mode html-to-markdown gitignore-mode git-gutter-fringe+ git-gutter-fringe git-gutter+ git-gutter flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree simple-httpd org ace-jump-mode noflet powerline popwin elfeed f diminish diff-hl web-completion-data dash-functional tern company hydra inflections edn multiple-cursors paredit s peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key yasnippet packed dash helm avy helm-core async auto-complete popup package-build alert log4e gntp fringe-helper ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package typo toc-org tagedit spacemacs-theme spaceline smeargle slim-mode shen-mode scss-mode sass-mode restart-emacs rainbow-delimiters quelpa pug-mode persp-mode pdf-tools pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets org-beautify-theme open-junk-file noctilux-theme neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gnu-apl-mode gmail-message-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emmet-mode elm-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies edit-server dumb-jump define-word csv-mode company-web company-tern company-statistics column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   (quote
    ("node_modules" ".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".repl" "target" "*compiled*" "*goog*" ".metadata" "*.metadata*" "class" "classes")))
 '(projectile-globally-ignored-file-suffixes (quote (".class" "class")))
 '(projectile-globally-ignored-files
   (quote
    ("TAGS" ".gitignore" ".emacs.desktop" ".class" "*#*#")))
 '(projectile-indexing-method (quote native))
 '(read-buffer-completion-ignore-case t)
 '(shr-external-browser (quote eww-browse-url))
 '(tramp-default-method "ssh")
 '(trash-directory "~/.Trash"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 120 :width normal :foundry "nil" :family "Monaco"))))
 '(font-lock-builtin-face ((t (:foreground "#aaffaa" :inverse-video nil :underline nil :slant normal :weight light))))
 '(font-lock-comment-delimiter-face ((t (:foreground "gray70" :inverse-video nil :underline nil :slant italic :weight normal :height 0.8))))
 '(font-lock-comment-face ((t (:foreground "gray60" :inverse-video nil :underline nil :slant italic :weight light :height 0.9 :family "Verdana"))))
 '(font-lock-constant-face ((t (:foreground "#ccaaff" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-doc-face ((t (:foreground "gray70" :inverse-video nil :underline nil :slant normal :weight extra-light :height 0.9 :family "Verdana"))))
 '(font-lock-function-name-face ((t (:foreground "#aaccff" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#aaffaa" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "#ff8888" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-string-face ((t (:foreground "#aadddd" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-type-face ((t (:foreground "#aaeecc" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#aaccff" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(org-todo ((t (:background "#020202" :foreground "#ff3333" :inverse-video nil :underline nil :slant normal :weight bold)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
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
 '(debug-on-error nil)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dired-listing-switches
   "-lahBF --ignore=#* --ignore=.svn --ignore=.git --group-directories-first")
 '(dired-recursive-deletes (quote always))
 '(dired-use-ls-dired (quote unspecified))
 '(dirtrack-list (quote ("|mfm|  \\([^|]*\\)" 1)))
 '(evil-default-cursor (quote (hbar)))
 '(evil-move-beyond-eol t)
 '(evil-move-cursor-back nil)
 '(evil-want-Y-yank-to-eol t)
 '(fringe-mode 0 nil (fringe))
 '(global-evil-search-highlight-persist nil)
 '(global-undo-tree-mode t)
 '(helm-ag-use-agignore t)
 '(inferior-lisp-program "sbcl" t)
 '(j-console-cmd "/Applications/j64-804/bin/jconsole")
 '(nrepl-log-messages t)
 '(ns-antialias-text t)
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
    (("e" "emacs annoyances" entry
      (file+headline "~/org/home.org" "emacs annoyances")
      "**  %?
%U
")
     ("q" "quote" plain
      (file+headline "~/org/notes.org" "quotes")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("n" "note" plain
      (file+headline "~/org/notes.org" "Notes")
      "**  %?
%U

%a")
     ("s" "someday to read" entry
      (file+headline "~/org/home.org" "someday to read")
      "** %?
%U

%a
%i

")
     ("f" "food" entry
      (file+headline "~/org/schedule.org" "food")
      "**  %?
%U
")
     ("d" "diary entry" entry
      (file+headline "notes.org" "diary")
      "** 
%U

%a
%i
%?" :clock-in t :clock-resume t)
     ("i" "interruption" entry
      (file+headline "schedule.org" "interruptions")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("w" "work note" entry
      (file+headline "~/org/work.org" "spendgap refile")
      "**  %?
%a
%T
%i" :clock-in t :clock-resume t))))
 '(org-clock-mode-line-total (quote current))
 '(org-habit-graph-column 80)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-refile-targets
   (quote
    ((org-agenda-files :regexp . "time spent")
     (org-agenda-files :regexp . "someday to read")
     (org-agenda-files :regexp . "catapult")
     (org-agenda-files :regexp . "UR")
     (org-agenda-files :regexp . "paypal")
     (org-agenda-files :regexp . "jokes")
     (org-agenda-files :regexp . "ephemeral"))))
 '(org-startup-truncated nil)
 '(org-stuck-projects
   (quote
    ("LEVEL>1/TODO"
     ("NEXT" "SOMEDAY" "READ" "DONE" "INFOED" "CANCELLED" "DEFERRED")
     nil "")))
 '(package-selected-packages
   (quote
    (j-mode org-projectile-helm auctex yapfify yaml-mode winum tide typescript-mode flycheck sql-indent slime-company slime pyvenv pytest pyenv-mode py-isort pip-requirements phpunit phpcbf php-extras org-category-capture live-py-mode hy-mode helm-pydoc fuzzy flymd php-mode cython-mode company-auctex company-anaconda common-lisp-snippets anaconda-mode pythonic php-auto-yasnippets drupal-mode auctex-latexmk tablist skewer-mode json-snatcher json-reformat js2-mode parent-mode projectile request haml-mode ham-mode markdown-mode html-to-markdown gitignore-mode git-gutter-fringe+ git-gutter-fringe git-gutter+ git-gutter flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree simple-httpd org ace-jump-mode noflet powerline popwin elfeed f diminish diff-hl web-completion-data dash-functional tern company hydra inflections edn multiple-cursors paredit s peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key yasnippet packed dash helm avy helm-core async auto-complete popup package-build alert log4e gntp fringe-helper ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package typo toc-org tagedit spacemacs-theme spaceline smeargle slim-mode shen-mode scss-mode sass-mode restart-emacs rainbow-delimiters quelpa pug-mode persp-mode pdf-tools pcre2el paradox orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets org-beautify-theme open-junk-file noctilux-theme neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gnu-apl-mode gmail-message-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emmet-mode elm-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies edit-server dumb-jump define-word csv-mode company-web company-tern company-statistics column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   (quote
    ("node_modules" ".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".repl" "target" "*compiled*" "*goog*" ".metadata" "*.metadata*" "class" "classes")))
 '(projectile-globally-ignored-file-suffixes (quote (".class" "class")))
 '(projectile-globally-ignored-files
   (quote
    ("TAGS" ".gitignore" ".emacs.desktop" ".class" "*#*#")))
 '(projectile-indexing-method (quote native))
 '(read-buffer-completion-ignore-case t)
 '(shr-external-browser (quote eww-browse-url))
 '(tramp-default-method "ssh")
 '(trash-directory "~/.Trash"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 120 :width normal :foundry "nil" :family "Monaco"))))
 '(font-lock-builtin-face ((t (:foreground "#aaffaa" :inverse-video nil :underline nil :slant normal :weight light))))
 '(font-lock-comment-delimiter-face ((t (:foreground "gray70" :inverse-video nil :underline nil :slant italic :weight normal :height 0.8))))
 '(font-lock-comment-face ((t (:foreground "gray60" :inverse-video nil :underline nil :slant italic :weight light :height 0.9 :family "Verdana"))))
 '(font-lock-constant-face ((t (:foreground "#ccaaff" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-doc-face ((t (:foreground "gray70" :inverse-video nil :underline nil :slant normal :weight extra-light :height 0.9 :family "Verdana"))))
 '(font-lock-function-name-face ((t (:foreground "#aaccff" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#aaffaa" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "#ff8888" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-string-face ((t (:foreground "#aadddd" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-type-face ((t (:foreground "#aaeecc" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#aaccff" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(j-conjunction-face ((t (:foreground "IndianRed1"))))
 '(j-other-face ((t (:foreground "plum1"))))
 '(org-todo ((t (:background "#020202" :foreground "#ff3333" :inverse-video nil :underline nil :slant normal :weight bold)))))
)
