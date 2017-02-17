(setq debug-on-error t)


;; enable recent files mode.
(recentf-mode t)
(setq recentf-max-saved-items 50)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))


(global-evil-search-highlight-persist nil)

(evil-set-initial-state 'elfeed-show-mode 'insert)
(evil-set-initial-state 'elfeed-search-mode 'insert)

(setq helm-M-x-fuzzy-match t)
(helm-autoresize-mode t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(helm-autoresize-mode t)
(menu-bar-mode -1)

(projectile-global-mode)
(setq projectile-enable-caching t)

(setq inferior-shen-program "java -jar /Users/matt/hacking/shen/shen.clj/shen.clj-0.1.8-SNAPSHOT/shen.clj-0.1.8-SNAPSHOT-standalone.jar")

;; snippet from https://github.com/syl20bnr/spacemacs/issues/1155
(evil-define-key 'normal term-raw-map
  "p" 'term-paste)



(load-file "/Users/matt/emacs-files/bindings.el")
(provide 'emacs-config)
;;; emacs-config.el ends here

;; 888 lines is the length
