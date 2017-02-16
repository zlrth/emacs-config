(setq debug-on-error t)


(load-file (concat (file-name-as-directory version-controlled-stuff-dir) "package-init.el"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq path-to-ctags "~/.emacs.d/TAGS") ;; <- your ctags path here
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq open-resource-ignore-patterns (quote ("/target/" "~$" ".old$" ".svn")))

;; enable recent files mode.
(recentf-mode t)
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; elisp-slime-nav
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'elisp-slime-nav-mode))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; winner mode. allows returning to previous window configuration with 'C-c left' and 'C-c right'
(winner-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;; (add-to-list 'ido-work-directory-list-ignore-regexps tramp-file-name-regexp)
(setq desktop-files-not-to-save "^$")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lisp stuff

(defun clojure-mode-hooks ()
  (interactive)
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "H-m")
  ;; (linum-mode 't)

  ;; (define-key clojure-mode-map (kbd "H-,") 'cider-test-run-tests)
  (define-key clojure-mode-map (kbd "H-,") 'cider-projectile-run-clojure-test)
  (define-key cider-mode-map (kbd "H-,") 'cider-projectile-run-clojure-test))

(add-hook 'prog-mode-hook 'linum-mode)

(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'cider-mode)

(dolist (hook '(clojure-mode-hook
                cider-repl-mode
                cider-repl-mode-hook))
  (add-hook hook 'clojure-mode-hooks))

;; clojure/lispy stuff
(defun lisp-hooks ()
  (interactive)
  (enable-paredit-mode)
  ;; (paredit-mode t)
  (rainbow-delimiters-mode t)
  (define-key evil-insert-state-map "{" 'paredit-open-curly))

(eval-after-load 'clojure-mode '(require 'clojure-mode-extra-font-locking))
(eval-after-load 'clojurescript-mode '(require 'clojure-mode-extra-font-locking))

(setq clojure-defun-style-default-indent nil)

(setq cider-repl-history-file "~/.emacs.d/cider-history")

(dolist (hook '(clojure-mode-hook
                emacs-lisp-mode-hook
                ielm-mode-hook
                cider-repl-mode
                cider-repl-mode-hook))

  (add-hook hook 'lisp-hooks)
  (add-hook hook 'clojure-mode-hooks)
  )


(setq cider-test-show-report-on-success nil)
(add-hook 'cider-mode-hook #'eldoc-mode)
;; (setq nrepl-hide-special-buffers nil)
(setq cider-repl-display-in-current-window t)
(setq cider-repl-result-prefix ";;=> ")
(setq cider-prompt-save-file-on-load nil)
(setq cider-repl-use-pretty-printing t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EVIL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-evil-search-highlight-persist nil)

;;;;;;;;;;;;;;;;;;;;;;;
;; overriding annoying stuff when in insert or normal mode
;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-visual-line)
(define-key evil-normal-state-map (kbd "C-f") 'forward-char)
(define-key evil-normal-state-map (kbd "C-b") 'backward-char)
(define-key evil-normal-state-map (kbd "C-m") 'newline)
(define-key evil-normal-state-map (kbd "C-d") 'delete-char)
(define-key evil-normal-state-map (kbd "C-t") 'transpose-chars)
(define-key evil-normal-state-map (kbd "q")    nil)
(define-key evil-normal-state-map (kbd "C-w")  nil)
(define-key evil-normal-state-map (kbd "gf")  'helm-find-files)
(define-key evil-normal-state-map (kbd "C-r")  nil)

(define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-visual-line)
(define-key evil-insert-state-map (kbd "C-n") nil)
(define-key evil-insert-state-map (kbd "C-p") nil)
(define-key evil-insert-state-map (kbd "C-d") nil)
(define-key evil-insert-state-map (kbd "C-y") nil)
(define-key evil-insert-state-map (kbd "C-t") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-insert-state-map (kbd "C-w") nil)
(define-key evil-insert-state-map (kbd "C-r") nil)

(evil-set-initial-state 'elfeed-show-mode 'insert)
(evil-set-initial-state 'elfeed-search-mode 'insert)

;; when exiting insert mode, the cursor doesn't move back a column
(setq evil-move-cursor-back nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;
;; helm
;; http://tuhdo.github.io/helm-intro.html
;;;;;;;;;;;;;
(setq helm-M-x-fuzzy-match t)
(helm-autoresize-mode t)
;; ;; (setq helm-mini)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(helm-autoresize-mode t)

;; http://stackoverflow.com/questions/13794433/how-to-disable-autosave-for-tramp-buffers-in-emacs
(setq tramp-auto-save-directory "~/emacs/tramp-autosave")

;; modeline customization
(menu-bar-mode -1)


(projectile-global-mode)
(setq projectile-enable-caching t)

(server-start)

(setq inferior-shen-program "java -jar /Users/matt/hacking/shen/shen.clj/shen.clj-0.1.8-SNAPSHOT/shen.clj-0.1.8-SNAPSHOT-standalone.jar")

;; snippet from https://github.com/syl20bnr/spacemacs/issues/1155
(evil-define-key 'normal term-raw-map
  "p" 'term-paste)

(defun m/open-terminal ()
  (interactive)
  (shell (generate-new-buffer-name "shell")))


(load-file (concat (file-name-as-directory version-controlled-stuff-dir) "bindings.el"))
;; thought I wanted emacs mode, but I use SPC too much
;; (evil-set-initial-state 'term-mode 'emacs)


(provide 'emacs-config)
;;; emacs-config.el ends here

;; 888 lines is the length
