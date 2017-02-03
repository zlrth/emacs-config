;;; package --- Summary

;;; Commentary:


;; OSX annoyances
(global-unset-key (kbd "s-t"))

;;; Code:
;; Hyper & control duplicates while i get used to swapping Ctrl + Hyper
(global-set-key (kbd "H-z")     'repeat)
(global-set-key (kbd "C-M-8")   'buffer-menu)
;; (global-set-key (kbd "H-*")     'ido-switch-buffer)
(global-set-key (kbd "C-8")     'helm-mini)
(global-set-key (kbd "H-8")     'ido-switch-buffer)
(global-set-key (kbd "H-y")     'helm--kill-ring)
(global-set-key (kbd "H-r")     'rgrep)
(global-set-key (kbd "H-M-\\")  'indent-buffer)
(global-set-key (kbd "H-d")     'ediff-buffers)
(global-set-key (kbd "H-w")     'kill-ring-save-keep-highlight)
(global-set-key (kbd "H-o j")   'evil-next-line-first-non-blank)
(global-set-key (kbd "H-o k")   'evil-previous-line-first-non-blank)
(global-set-key (kbd "H-<f6>")  'load-file)
(global-set-key (kbd "C-;")     'evil-normal-state-and-save-buffer)
(global-set-key (kbd "<f5>")	  'evil-normal-state-and-save-buffer)

;; workspaces n stuff
(global-set-key (kbd "H-9")     'wg-switch-to-workgroup-left)
(global-set-key (kbd "H-0")     'wg-switch-to-workgroup-right)
(global-set-key (kbd "H-'")     'wg-switch-to-workgroup)

;; (global-set-key (kbd "H-9")     'persp-prev)
;; (global-set-key (kbd "H-0")     'persp-next)
;; (global-set-key (kbd "H-'")     'persp-switch)

(global-set-key (kbd "H-e")     'eval-last-sexp)

(global-set-key (kbd "H-4 f")   'ido-find-file-other-window)

(global-set-key (kbd "H-M--")   'bury-buffer)
(global-set-key (kbd "H-M-h")   'buffer-stack-down)
(global-set-key (kbd "H-M-l")   'buffer-stack-up)
(global-set-key (kbd "H-p")     'mode-line-other-buffer)
(global-set-key (kbd "H-M-p")   'other-frame)
(global-set-key (kbd "H-k")     'kill-buffer)
(global-set-key (kbd "H-q")     'kill-this-buffer) ;; doesn't seem to work for some reason?

;; (global-set-key (kbd "<f11>") 	'toggle-fullscreen)
(global-set-key (kbd "C-h")     'delete-backward-char)
(global-set-key (kbd "M-G r")   'open-resource)
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; (global-set-key (kbd "M-k")     'keyboard-quit)
(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key [C-tab]         'dabbrev-expand)

(global-set-key (kbd "C-x C-c") 'nil) ;; default \C-x\C-c is too easy to hit accidentally
(global-set-key (kbd "M-G g")   'goto-line-with-feedback)
(global-set-key (kbd "M-;")     'comment-dwim-line)
(global-set-key (kbd "C-c M-;")	'comment-box)
(global-set-key (kbd "C-c r")   'revert-buffer-no-confirm)
(global-set-key (kbd "C-r")     'isearch-backward)
;; (global-set-key (kbd "M-5")     'query-replace)
;; (global-set-key (kbd "M-%")     'digit-argument)
(global-set-key (kbd "<f8>") 'xah-open-file-fast)

(global-set-key (kbd "<H-f7>") 'desktop-change-dir)

(global-set-key (kbd "M-G d d") (lambda()
                                  (interactive)
                                  (message (get-dir-of-file))))
(global-set-key (kbd "M-G d w") 'copy-buffer-file-name-as-kill)
(global-set-key (kbd "M-G M-w M-s") 'copy-region-to-scratch)

;; Override this paredit keybindings
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-J") nil)
     (define-key paredit-mode-map (kbd "M-;") nil)
     (define-key paredit-mode-map (kbd "M-r") nil)
     (define-key paredit-mode-map (kbd "M--") nil)
     (define-key paredit-mode-map (kbd "H-M-j") 'paredit-join-sexps)
     (define-key paredit-mode-map (kbd "H-M-s") 'paredit-split-sexp)
     (define-key paredit-mode-map (kbd "M-S") nil)))

(defun zencoding-hooks ()
  (define-key zencoding-mode-map (kdb "C-j" nil))
  (define-key zencoding-mode-map (kdb "M-C k" 'zencoding-expand-line)))

;; Override these cuz really all I want is the symbols to be highlighted
(eval-after-load 'auto-highlight-symbol
  '(progn
     (define-key auto-highlight-symbol-mode-map (kbd "M--") nil)))

(eval-after-load 'undo-tree
  '(progn
     (define-key undo-tree-map (kbd "C-r") nil)))

(add-hook 'org-mode-hook
          (lambda ()
            (interactive)
            ;; (setq flyspell-mode t)
            (setq auto-highlight-symbol-mode nil)
            (define-key org-mode-map (kbd "M-S-<return>") 'org-insert-subheading)
            (define-key org-mode-map (kbd "C-<return>")   'org-insert-heading-after-current)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "C-u") nil)
(define-key evil-normal-state-map (kbd "C-u") nil)


(define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-normal-state-map (kbd "gw") nil)
(define-key evil-normal-state-map (kbd "gwh") 'split-window-right)
(define-key evil-normal-state-map (kbd "gwl") 'split-window-right-and-make-active)
(define-key evil-normal-state-map (kbd "gwk") 'split-window-below)
(define-key evil-normal-state-map (kbd "gwj") 'split-window-below-and-make-active)
(define-key evil-normal-state-map (kbd "gwu") 'winner-undo)
(define-key evil-normal-state-map (kbd "gwr") 'winner-redo)
(define-key evil-normal-state-map (kbd "gr") 'repeat)
(define-key evil-normal-state-map (kbd "C-a") nil)

(define-key evil-normal-state-map (kbd "qq") 'quit-window)
(define-key evil-normal-state-map (kbd "g-") 'hs-hide-block)
(define-key evil-normal-state-map (kbd "g+") 'hs-show-block)
(define-key evil-normal-state-map (kbd "gf")  'ido-find-file)

;; "C-c p t" == "SPC p a" for some reason, while "SPC p t" is neotree but "SPC p n" is undefined.  wha??
(define-key evil-normal-state-map (kbd "SPC p t")  'projectile-toggle-between-implementation-and-test)
(define-key evil-normal-state-map (kbd "SPC :")  'helm-M-x)
(define-key evil-normal-state-map (kbd "C-c p s f")  'ag-project-files)
(define-key evil-normal-state-map (kbd "SPC p s f")  'ag-project-files)
(define-key evil-normal-state-map (kbd "SPC p s r")  'projectile-ag-regex)
(define-key evil-normal-state-map (kbd "SPC p s s")  'projectile-ag)


(define-key evil-normal-state-map (kbd "SPC p s F")  'ag-project-files-current-current-file-extension)
(define-key evil-normal-state-map (kbd "C-c p s F")  'ag-project-files-current-current-file-extension)

(define-key evil-normal-state-map (kbd "SPC p a")  nil)
(define-key evil-normal-state-map (kbd "SPC p n")  'neotree-find-project-root)
(define-key evil-normal-state-map (kbd "C-c p n")  'neotree-find-project-root)
(define-key evil-normal-state-map (kbd "SPC q Q")  'really-kill-emacs)
(define-key evil-normal-state-map (kbd "SPC d t")  'm/open-terminal)
(define-key evil-normal-state-map (kbd "SPC d c")  'mfm/cider-connect)
(define-key evil-normal-state-map (kbd "SPC d c")  'mfm/cider-connect)
(define-key evil-normal-state-map (kbd "SPC d a")  'evil-numbers/inc-at-pt)

(defun mfm/cider-connect ()
  (interactive)
  (cider-connect "localhost" "7888" "~/legalsifter/bnym-clj")
  (persp-add-buffer "*cider-repl bnym-clj*")
  (switch-to-buffer "*cider-repl bnym-clj*")
  (rename-buffer "clojure-repl")
  ;(helm-projectile-switch-project)
  (cider-insert-in-repl "(reset)" 't)
  (cider-insert-in-repl "(start-cljs-dev!)" 't)
  (cider-connect "localhost" "7888" "~/legalsifter/bnym-clj")
  (persp-add-buffer "*cider-repl bnym-clj*")
  (switch-to-buffer "*cider-repl bnym-clj*")
  (rename-buffer "clojurescript-repl")
   )


(defun really-kill-emacs ()
  (interactive)
  (let (kill-emacs-hook) (kill-emacs)))



;; SPC-w-c
;; (define-key evil-normal-state-map (kbd "qw0") 'delete-window)

;; SPC-w-m
;; (define-key evil-normal-state-map (kbd "qw1") 'delete-other-windows)

;; (define-key evil-normal-state-map (kbd "SPC 8")  'helm-mini)
(define-key evil-insert-state-map (kbd "M-j") 'newline-and-indent)
(define-key evil-normal-state-map (kbd "qm")  'evil-record-macro)
(define-key evil-insert-state-map (kbd "C-;") 'evil-normal-state-and-save-buffer)

;; (define-key evil-normal-state-map (kbd "SPC SPC") nil)
(define-key evil-insert-state-map (kbd "C-a") nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; do with H-j, M-j what you could do with <return> but less pink moving
(let ((map minibuffer-local-map))
  (define-key map (kbd "M-j") 'exit-minibuffer)
  (define-key map (kbd "M-k") 'abort-recursive-edit))

;;
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.1) 
;; (key-chord-define evil-insert-state-map "jk" 'evil-normal-state-and-save-buffer)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

;; (evil-define-key 'insert term-mode-map " kj" 'evil-normal-state-and-term-line-mode)

(package-initialize)

(defun evil-normal-state-and-term-line-mode ()
    (interactive)
      (term-line-mode))

(defun evil-insert-state-and-term-char-mode ()
  (interactive)
  (evil-insert-state)
  (term-char-mode))


(add-hook 'term-mode-hook 'my-term-keys)

;; works!!!! but it doesn't do what i want
;; (defun my-term-keys ()
;;   (interactive)
;;   (define-key term-raw-map (kbd "C-c M-z") 'evil-normal-state-and-term-line-mode))


(defun my-term-keys ()
  (interactive)
  (key-chord-define term-raw-map "kj" 'evil-normal-state-and-term-line-mode)
  (evil-define-key 'normal term-raw-map "i" 'evil-insert-state-and-term-char-mode))
;; (evil-define-key 'normal "i" 'evil-insert-state-and-term-char-mode)



(defun my-poop-keys ()
  (interactive)
  (local-set-key "C-c C-c" nil))


;; (define-key term-mode-map (kbd "C-c C-]") 'evil-normal-state-and-term-line-mode)

;; (add-hook 'term-mode-hook
;;           (lambda () (evil-define-key 'normal )))

;; TODO U should be redo

(setq-default evil-escape-key-sequence "kj")

;; Magit rules!
(global-set-key (kbd "C-x g") 'magit-status)

;; c1,c2 -> will put these each on own line
(fset 'sql-one-select-column-per-line
      [?/ ?, ?. return ?l ?i return escape])

;; will replace 'alias = table.column' with 'table.column AS alias'.  'alias' needs to be only one word.  'table.column' needs to be followed by a comma
(fset 'ingres-equals-to-oracle-as
      [?f ?= ?x ?d ?B ?A ?\C-b ?  ?A ?S ?\S-  ?\C-y escape])

(global-set-key (kbd "C-c H-r") 'transpose-windows)

;; disable mouse clicks
;; (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
;;              [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;              [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]))
;;   (global-unset-key k))
;; (global-set-key (kbd "<down-mouse-1>") 'mouse-select-window)


;;;;;;;;;;;;;;;;;
;; hydra stuff ;;
;;;;;;;;;;;;;;;;;

;;
;; https://www.reddit.com/r/emacs/comments/3ba645/does_anybody_have_any_real_cool_hydras_to_share/cskdhte
;; Split: _|_:vert  _-_:horz


(global-set-key (kbd "C-c p s r") 'projectile-ag-regex)

(provide 'bindings)
;;; bindings.el ends here
