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
   '(csv
     typescript
     ansible
     idris
     ;; ansible
     xclipboard ; needed for terminal emacs. uses pbcopy and pbpaste
     sql
     react
     python
     yaml
     latex
     ;; pdf
     markdown
     ; csv ;; for emacs 28!
     html
     clojure ;; :variables clojure-enable-fancify-symbols t ;; put in a () if you want this. dunno if it's buggy
     ; common-lisp emacs 28! cl is deprecated!

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :disabled-for spacemacs-org org)
     spacemacs-layouts
     chrome
     emacs-lisp
     javascript
     scheme
     ;; spacemacs-org
     org
     version-control
     git
     ; osx for emacs 28!
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      company
                                      company-tabnine
                                      ; gnu-apl-mode ; emacs 28! cl is deprecated!
                                      shen-mode
                                      ; org-projectile  ; emacs 28! cl is deprecated!
                                      ; org-projectile-helm  ; emacs 28! cl is deprecated!
                                      org-beautify-theme
                                      (j-mode    :location (recipe :fetcher github :repo "zlrth/j-mode"))
                                      (shen-mode :location (recipe :fetcher gitlab :repo "zlrth/shen-mode")))

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
  (setq byte-compile-warnings '(cl-functions)) ; trying cl is deprecated what the fuck i hate it

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
   desktop-dirname "/Users/matt/emacs.d/cache/"

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state nil ; changed because it's now slow?
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
   ;; tests broke so i added this. other options are 'spacemacs, custom, vim-powerline, vanilla
   dotspacemacs-mode-line-theme 'vanilla
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
  ;; TODO buffer-read-only unset in *eww* so that you can edit the expressions _inside_ the *eww* buffer.

  (with-eval-after-load 'eww-mode
    (evil-define-key 'normal eww-mode-map
      (kbd ", l") 'j-console-execute-line
      (kbd ", h") 'j-help-lookup-symbol-at-point
      (kbd ", H") 'j-help-lookup-symbol))

  ; (setq debug-on-error t) ; don't know emacs 28!

  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (let ((gls (executable-find "gls")))
    (when gls
      (setq insert-directory-program gls)))

  (setq frame-title-format nil) ; display nothing in the _frame_ title bar. emacs is faster when it doesn't have to calculate anything here.
  ;; (require 'pdf-tools)

  ; (require 'ob-clojure) ; trying removing cl is deprecated!
  ; (require 'cider) ; 2020-11-30 is this breaking org-capture? apparently it is.
  (require 'helm-bookmark) ; 2021-03-31 is this breaking org-capture? apparentlyi it is NOT?
  ; (setq debug-on-error t)
  ; (require 'org-projectile) ; trying removing cl is deprecated!

  ;; this is bugging out
  ;; (evil-set-initial-state 'org-agenda-mode 'emacs)

  ;; (org-babel-do-load-languages
  ;;  'org-babel-load-languages
  ;;  '((clojure . t)))

  (with-eval-after-load 'evil-org
    (evil-define-key 'normal evil-org-mode-map "o" 'evil-open-below))

  (when (version<= "9.2" (org-version))
    (require 'org-tempo))

  ;; berry-choose-window-for-popups was a popup thing i thought about once

  (setq system-uses-terminfo nil)
  ; (spacemacs/toggle-mode-line-org-clock-on) ; error

  (add-hook 'eww-mode-hook (lambda ()
                             (setq buffer-read-only nil)))
  ;; (add-hook 'clojure-mode-hook (lambda ()
  ;;                                (paredit-mode t)
  ;;                                (rainbow-delimiters-mode-disable))) ;; emacs 28!
  (add-hook 'lisp-mode-hook (lambda ()
                              (paredit-mode t)
                              (rainbow-delimiters-mode-disable)))
  (add-hook 'cider-repl-mode-hook (lambda () (paredit-mode t)
                                    (define-key cider-repl-mode-map (kbd "C-j") 'newline-and-indent)))
  ;; this may work
  (setq-default word-wrap t)

  ;; https://www.emacswiki.org/emacs/ShellDirtrackByPrompt#toc2
  ;; doesn't work. wtf. shell-dirtrack-mode nil doesn't work.
  ;; july 4 2017. maybe i fixed a bug in my regex. but it still doesn't work. don't know why.
  (add-hook 'shell-mode-hook
            (lambda ()
              (setq dirtrack-list '("|mfm| \\([^|]*\\)|" 1 nil))
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

(define-key evil-normal-state-map (kbd "SPC :")  'helm-M-x) ;; this was diabled for some reason?
(define-key evil-normal-state-map (kbd "C-x C-o")  'other-window)
(define-key evil-normal-state-map (kbd "C-x C-k")  'kill-this-buffer)
(define-key evil-normal-state-map (kbd "C-x k")  'kill-this-buffer)



(defun m/open-terminal ()
  (interactive)
  (shell (generate-new-buffer-name "shell")))

(defun m/open-in-google-chrome (command &optional arg file-list)
  (interactive
   (let ((files (dired-get-marked-files t current-prefix-arg)))
     (list
      "open -a \"Google Chrome\""
      current-prefix-arg
      files)))
  (unless (string-match-p "&[ \t]*\\'" command)
    (setq command (concat command " &")))
  (dired-do-shell-command command arg file-list)
  (let ((kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))) ;; https://emacs.stackexchange.com/a/14511
    (kill-buffer "*Async Shell Command*")))

(evil-define-key 'normal dired-mode-map
  (kbd "e") 'm/open-in-google-chrome)


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
(define-key evil-normal-state-map (kbd "SPC d R")  'rename-buffer)
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

(define-key shell-mode-map        (kbd ", s c") 'comint-clear-buffer)

(global-set-key (kbd "C-x C-c") 'nil) ;; default C-x C-c is too easy to hit accidentally
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(define-key evil-normal-state-map (kbd ", t e") 'm/eval-sexp-and-clojure-test)

;; do not confirm killing process buffers. just kill them.
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))


(fset 'refile-to-time-spent
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item
         (quote ([44 82 116 105 109 101 32 115 112 101 110 116 return] 0 "%d")) arg)))


(fset 'search-matts-org-project
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([32 112 112 111 114 103 return 13 32 115 97 112] 0 "%d")) arg)))

(defun m/copy-apollo-tracker-to-clipboard ()
  "so i don't have to keep finding this string in my org project.
FIXME when i put this on github, put the string in private.el"
  (interactive)
  (ns-store-selection-internal 'CLIPBOARD "http://apollo.rip:2095/d986b2c39a9d02a31eefbb4c989835aa/announce"))

(defun m/org-goto-selection ()
  (interactive)
  (org-clock-goto 'SELECT)
  (org-clock-in))

(defun m/edit-dot-spacemacs ()
  (interactive)
  (find-file "~/.spacemacs"))

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
;; (global-evil-search-highlight-persist nil)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)

; global-map uses undo-tree, require it first. doesn't work: https://www.reddit.com/r/emacs/comments/bwleyk/set_debugonerror_to_t_then_startup_with_undotree/

(require 'undo-tree)
(remove-hook 'menu-bar-update-hook 'undo-tree-update-menu-bar) ; from the reddit post. some (perspectives) still don't work.
(define-key persp-mode-map      [menu-bar] nil)
(define-key undo-tree-map [menu-bar] nil)
(define-key global-map [menu-bar] nil)


(define-key emacs-lisp-mode-map [menu-bar] nil)
(define-key projectile-mode-map [menu-bar] nil)
(define-key yas-minor-mode-map  [menu-bar] nil)
(define-key cider-mode-map      [menu-bar] nil)
; (byte-recompile-directory "~/.emacs.d/" nil 'force)
(define-key sesman-map [menu-bar] nil)

(setq org-hide-emphasis-markers t) ;; i no longer think this is buffer-local.

(setq inferior-shen-program " /Users/matt/hacking/shen/shen-json/shen") ;; TODO could i put all of these setq's up in setq-default?

(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

; (frame-monitor-attributes) ; should have metal
;; this is set in layers/+distributions/spacemacs-base/config.el. in dired, it moves the cursor around after renaming a file, which is driving me crazy. disabled.
;; Auto refresh
(global-auto-revert-mode t)

; (setq icon-title-format nil)
; (setq frame-title-format nil)

;; i set this to nil but now i want it to be `t'. isn't life funny.

;; july 7 2018. this is enabled. what.
;; Also auto refresh dired, but be quiet about it
(setq revert-non-file-buffers nil
      auto-revert-verbose nil)

(fmakunbound 'blackbox) ; clobbers my muscle memory for (git) blame
(fmakunbound 'blackbox-mode)
(fmakunbound 'blacken-mode)

;; either i had changed noctilux's default black, or they changed it over time. regardless, off-black is bad.
;; 2020-05-05-- probably didn't work because i was using defvar, not setq. defvar doesn't override already defined variables.
'(defvar noctilux-colors           ; ANSI(Noctilux terminal)
               ;; name     sRGB      Gen RGB   256       16              8
               '((base03  "#000000" "#000000" "#000000" "black"   "black") ;; this is the one i changed
                 (base02  "#292929" "#292929" "#292929" "black"         "black")
                 (base01  "#5f5f5f" "#5f5f5f" "#5f5f5f" "brightgreen"   "green")
                 (base00  "#999999" "#999999" "#999999" "brightyellow"  "yellow")
                 (base0   "#cccccc" "#cccccc" "#cccccc" "brightblue"    "blue")
                 (base1   "#aaaaaa" "#aaaaaa" "#aaaaaa" "brightcyan"    "cyan")
                 (base2   "#e9e2cb" "#e9e2cb" "#e9e2cb" "white"         "white")
                 (base3   "#fcf4dc" "#fcf4dc" "#fcf4dc" "brightwhite"   "white")
                 (yellow  "#aaeecc" "#aaeecc" "#aaeecc" "yellow"        "yellow")
                 (orange  "#ff8888" "#ff8888" "#ff8888" "brightred"     "red")
                 (red     "#ff3333" "#ff3333" "#ff3333" "red"           "red")
                 (magenta "#FF1F69" "#FF1F69" "#FF1F69" "magenta"       "magenta")
                 (violet  "#ccaaff" "#ccaaff" "#ccaaff" "brightmagenta" "magenta")
                 (blue    "#aaccff" "#aaccff" "#aaccff" "blue"          "blue")
                 (cyan    "#aadddd" "#aadddd" "#aadddd" "cyan"          "cyan")
                 (white   "#ffffff" "#ffffff" "#ffffff" "white"          "white")
                 (green   "#aaffaa" "#aaffaa" "#aaffaa" "green"         "green")))

(setenv "PATH" (concat (getenv "PATH") ":/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home/bin:")) ;; second attempt as flies to wanton boys are we to th' gods
; (load-theme 'noctilux t) ; needed because now noctilux-colors is fucking loaded after the initial load of the theme. need the second arg because emacs doesn't fucking treat the fucking theme as safe. ; emacs 28 this doesn't fucking work. fucking god damnit.
(desktop-read) ; don't know why emacs doesn't load the desktop on startup
)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#292929" "#ff3333" "#aaffaa" "#aaeecc" "#aaccff" "#FF1F69" "#aadddd" "#999999"])
 '(background-color "#202020")
 '(background-mode dark)
 '(browse-url-secondary-browser-function 'eww-browse-url)
 '(buffer-stack-untracked
   '("KILL" "*Compile-Log*" "*Compile-Log-Show*" "*Group*" "*Completions*"))
 '(cider-lein-command "lein")
 '(cider-lein-global-options "with-profile +matt")
 '(cider-print-fn 'fipp)
 '(cider-print-options nil)
 '(cider-print-quota 1000000000)
 '(cider-repl-history-file "~/emacs-files/cider-history")
 '(cider-repl-history-show-preview nil)
 '(cider-repl-history-size 500000)
 '(cider-repl-print-length 1000000)
 '(cider-repl-prompt-function 'cider-repl-prompt-abbreviated)
 '(cider-repl-require-ns-on-set t)
 '(cider-repl-use-clojure-font-lock nil t)
 '(cider-session-name-template "%J:%r")
 '(column-number-mode t)
 '(company-files-exclusions ".org")
 '(company-tabnine-wait 0.0)
 '(compilation-message-face 'default)
 '(completion-ignored-extensions
   '(".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo"))
 '(csv-separators '("," "	"))
 '(cursor-color "#cccccc")
 '(custom-enabled-themes '(noctilux))
 '(custom-safe-themes
   '("755e5aa14fa530fdadb7d1082c4b3fddbf52b84f02cd414497b7324c85331dd7" "a6fc75241bcc7ce6f68dcfd0de2d4c4bd804d0f8cd3a9f08c3a07654160e9abe" "b4c86bae65473e89293653058dabdb2a9895b2d08b5df49479017a91bc8240a0" "a7c40bb695b82331b68aa40750ee81ef6f8924f591cd78ea3260314b8bfdf6c2" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "e297f54d0dc0575a9271bb0b64dad2c05cff50b510a518f5144925f627bb5832" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dired-listing-switches
   "-lahBF --ignore=#* --ignore=.svn --ignore=.git --group-directories-first")
 '(dired-recursive-deletes 'always)
 '(dired-use-ls-dired 'unspecified)
 '(dirtrack-list '("|mfm|  \\([^|]*\\)" 1))
 '(evil-default-cursor '(hbar))
 '(evil-ex-search-highlight-all t)
 '(evil-move-beyond-eol t)
 '(evil-move-cursor-back nil)
 '(evil-want-Y-yank-to-eol t)
 '(foreground-color "#cccccc")
 '(fringe-mode nil nil (fringe))
 '(global-evil-search-highlight-persist nil)
 '(global-so-long-mode t)
 '(global-undo-tree-mode t)
 '(helm-ag-use-agignore t)
 '(helm-grep-ignored-directories
   '("SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "resources/csv/" "target/" "tmp/"))
 '(inferior-lisp-program "sbcl" t)
 '(isearch-allow-scroll t)
 '(j-console-cmd "/Applications/j64-804/bin/jconsole")
 '(js-indent-level 2)
 '(js2-strict-missing-semi-warning nil)
 '(kill-ring-max 6000)
 '(magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 14))
 '(magit-save-repository-buffers 'dontask)
 '(nrepl-log-messages t)
 '(nrepl-sync-request-timeout 30)
 '(nrepl-use-ssh-fallback-for-remote-hosts t)
 '(ns-antialias-text t)
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("x" agenda "doesn't have data like :food:interruptions:reading:"
      ((org-agenda-ndays 7)
       (org-agenda-filter-preset
        '("-reading" "-food" "-interrupt"))))))
 '(org-agenda-files
   '("~/org/agenda.org"))
 '(org-capture-templates
   '(("e" "emacs annoyances TEST" entry
      (file+headline "~/org/home.org" "emacs annoyances")
      "**  %?
%U
")
     ("q" "quote" plain
      (file+headline "~/org/notes.org" "quotes")
      "** %?
%a
%U
%i
" :clock-in t :clock-resume t)
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
%?
" :clock-in t :clock-resume t)
     ("i" "interruption" entry
      (file+headline "schedule.org" "interruptions")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("w" "work note" entry
      (file+headline "~/org/newwork.org" "work refile")
      "**  %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("j" "jokes" entry
      (file+headline "~/org/home.org" "jokes")
      "** %?")
     ("o" "word definition" entry
      (file+headline "schedule.org" "definitions")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)))
 '(org-clock-mode-line-total 'current)
 '(org-confirm-babel-evaluate nil)
 '(org-habit-graph-column 80)
 '(org-refile-targets
   '((org-agenda-files :regexp . "time spent")
     (org-agenda-files :regexp . "someday to read")
     (org-agenda-files :regexp . "catapult")
     (org-agenda-files :regexp . "UR")
     (org-agenda-files :regexp . "paypal")
     (org-agenda-files :regexp . "jokes")
     (org-agenda-files :regexp . "ephemeral")))
 '(org-src-block-faces '(("clojure" default)))
 '(org-startup-truncated nil)
 '(org-stuck-projects
   '("LEVEL>1/TODO"
     ("NEXT" "SOMEDAY" "READ" "DONE" "INFOED" "CANCELLED" "DEFERRED")
     nil ""))
 '(package-selected-packages nil)
 '(paradox-github-token t)
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   '("node_modules" ".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".repl" "target" "*compiled*" "*goog*" ".metadata" "*.metadata*" "class" "classes"))
 '(projectile-globally-ignored-file-suffixes '(".class" "class"))
 '(projectile-globally-ignored-files '("TAGS" ".gitignore" ".emacs.desktop" ".class" "*#*#"))
 '(projectile-indexing-method 'native)
 '(read-buffer-completion-ignore-case t)
 '(safe-local-variable-values
   '((cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (javascript-backend . tern)
     (javascript-backend . lsp)))
 '(same-window-buffer-names '("*inferior-shen*" "*cider-error*"))
 '(shr-external-browser 'eww-browse-url)
 '(tramp-default-method "ssh")
 '(trash-directory "~/.Trash")
 '(vc-follow-symlinks t)
 '(web-mode-code-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
;) ; i don't understand how this is here




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
 '(ansi-color-names-vector
   ["#292929" "#ff3333" "#aaffaa" "#aaeecc" "#aaccff" "#FF1F69" "#aadddd" "#999999"])
 '(background-color "#000000")
 '(background-mode dark)
 '(browse-url-secondary-browser-function 'eww-browse-url)
 '(buffer-stack-untracked
   '("KILL" "*Compile-Log*" "*Compile-Log-Show*" "*Group*" "*Completions*"))
 '(cider-lein-command "lein")
 '(cider-lein-global-options "with-profile +matt")
 '(cider-print-fn 'fipp)
 '(cider-print-options nil)
 '(cider-print-quota 1000000000)
 '(cider-repl-history-file "~/emacs-files/cider-history")
 '(cider-repl-history-show-preview nil)
 '(cider-repl-history-size 500000)
 '(cider-repl-print-length 1000000)
 '(cider-repl-prompt-function 'cider-repl-prompt-abbreviated)
 '(cider-repl-require-ns-on-set t)
 '(cider-repl-use-clojure-font-lock nil)
 '(cider-session-name-template "%J:%r")
 '(column-number-mode t)
 '(company-files-exclusions ".org")
 '(company-tabnine-wait 0.0)
 '(compilation-message-face 'default)
 '(completion-ignored-extensions
   '(".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo"))
 '(csv-separators '("," "	"))
 '(cursor-color "#cccccc")
 '(custom-enabled-themes '(noctilux))
 '(custom-safe-themes
   '("755e5aa14fa530fdadb7d1082c4b3fddbf52b84f02cd414497b7324c85331dd7" "a6fc75241bcc7ce6f68dcfd0de2d4c4bd804d0f8cd3a9f08c3a07654160e9abe" "b4c86bae65473e89293653058dabdb2a9895b2d08b5df49479017a91bc8240a0" "a7c40bb695b82331b68aa40750ee81ef6f8924f591cd78ea3260314b8bfdf6c2" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8885761700542f5d0ea63436874bf3f9e279211707d4b1ca9ed6f53522f21934" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "e297f54d0dc0575a9271bb0b64dad2c05cff50b510a518f5144925f627bb5832" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(dired-listing-switches
   "-lahBF --ignore=#* --ignore=.svn --ignore=.git --group-directories-first")
 '(dired-recursive-deletes 'always)
 '(dired-use-ls-dired 'unspecified)
 '(dirtrack-list '("|mfm|  \\([^|]*\\)" 1))
 '(evil-default-cursor '(hbar))
 '(evil-ex-search-highlight-all t)
 '(evil-move-beyond-eol t)
 '(evil-move-cursor-back nil)
 '(evil-want-Y-yank-to-eol t)
 '(foreground-color "#cccccc")
 '(fringe-mode nil nil (fringe))
 '(global-evil-search-highlight-persist nil)
 '(global-so-long-mode t)
 '(global-undo-tree-mode t)
 '(helm-ag-use-agignore t)
 '(helm-completion-style 'emacs)
 '(helm-grep-ignored-directories
   '("SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "resources/csv/" "target/" "tmp/"))
 '(inferior-lisp-program "sbcl" t)
 '(isearch-allow-scroll t)
 '(j-console-cmd "/Applications/j64-804/bin/jconsole")
 '(js-indent-level 2)
 '(js2-strict-missing-semi-warning nil)
 '(kill-ring-max 6000)
 '(magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 14))
 '(magit-save-repository-buffers 'dontask)
 '(nrepl-log-messages t)
 '(nrepl-sync-request-timeout 30)
 '(nrepl-use-ssh-fallback-for-remote-hosts t)
 '(ns-antialias-text t)
 '(org-adapt-indentation nil)
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("x" agenda "doesn't have data like :food:interruptions:reading:"
      ((org-agenda-ndays 7)
       (org-agenda-filter-preset
        '("-reading" "-food" "-interrupt"))))))
 '(org-agenda-files
   '("~/org/agenda.org"))
 '(org-capture-templates
   '(("e" "emacs annoyances TEST" entry
      (file+headline "~/org/home.org" "emacs annoyances")
      "**  %?
%U
")
     ("q" "quote" plain
      (file+headline "~/org/notes.org" "quotes")
      "** %?
%a
%U
%i
" :clock-in t :clock-resume t)
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
%?
" :clock-in t :clock-resume t)
     ("i" "interruption" entry
      (file+headline "schedule.org" "interruptions")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("w" "work note" entry
      (file+headline "~/org/newwork.org" "work refile")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("a" "agenda note" entry
      (file+headline "~/org/agenda.org" "start")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)
     ("j" "jokes" entry
      (file+headline "~/org/home.org" "jokes")
      "** %?")
     ("o" "word definition" entry
      (file+headline "schedule.org" "definitions")
      "** %?
%a
%U
%i" :clock-in t :clock-resume t)))
 '(org-clock-mode-line-total 'current)
 '(org-confirm-babel-evaluate nil)
 '(org-habit-graph-column 80)
 '(org-refile-targets
   '((org-agenda-files :regexp . "time spent")
     (org-agenda-files :regexp . "someday to read")
     (org-agenda-files :regexp . "catapult")
     (org-agenda-files :regexp . "UR")
     (org-agenda-files :regexp . "paypal")
     (org-agenda-files :regexp . "jokes")
     (org-agenda-files :regexp . "ephemeral")))
 '(org-src-block-faces '(("clojure" default)))
 '(org-startup-truncated nil)
 '(org-stuck-projects
   '("LEVEL>1/TODO"
     ("NEXT" "SOMEDAY" "READ" "DONE" "INFOED" "CANCELLED" "DEFERRED")
     nil ""))
 '(package-selected-packages
   '(csv-mode yasnippet-snippets yapfify yaml-mode ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org tide tagedit symon symbol-overlay string-inflection sql-indent spaceline-all-the-icons smeargle slim-mode shen-mode scss-mode sass-mode rjsx-mode restart-emacs rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements pcre2el password-generator paradox overseer orgit org-superstar org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-brain org-beautify-theme open-junk-file nodejs-repl noctilux-theme nameless move-text mmm-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode link-hint json-navigator json-mode js2-refactor js-doc jinja2-mode j-mode indent-guide importmagic impatient-mode idris-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-cider helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gmail-message-mode gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ gh-md geiser fuzzy font-lock+ flymd flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu emr emmet-mode elisp-slime-nav editorconfig edit-server dumb-jump dotenv-mode diminish devdocs define-word cython-mode company-web company-tabnine company-reftex company-auctex company-ansible company-anaconda column-enforce-mode clojure-snippets clean-aindent-mode cider-eval-sexp-fu centered-cursor-mode browse-at-remote blacken auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk ansible-doc ansible aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(paradox-github-token t)
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-globally-ignored-directories
   '("node_modules" ".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" ".repl" "target" "*compiled*" "*goog*" ".metadata" "*.metadata*" "class" "classes"))
 '(projectile-globally-ignored-file-suffixes '(".class" "class"))
 '(projectile-globally-ignored-files '("TAGS" ".gitignore" ".emacs.desktop" ".class" "*#*#"))
 '(projectile-indexing-method 'native)
 '(read-buffer-completion-ignore-case t)
 '(safe-local-variable-values
   '((cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (javascript-backend . tern)
     (javascript-backend . lsp)))
 '(same-window-buffer-names '("*inferior-shen*" "*cider-error*"))
 '(shr-external-browser 'eww-browse-url)
 '(tramp-default-method "ssh")
 '(trash-directory "~/.Trash")
 '(vc-follow-symlinks t)
 '(web-mode-code-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
