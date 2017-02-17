;;; package --- Summary

;; OSX annoyances
(global-unset-key (kbd "s-t"))

;;; Code:
(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key [C-tab]         'dabbrev-expand)

(global-set-key (kbd "C-x C-c") 'nil) ;; default \C-x\C-c is too easy to hit accidentally

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)


(define-key evil-normal-state-map (kbd "q") nil) ;; this is a way to make 'q' a prefix key

(define-key evil-normal-state-map (kbd "qq") 'quit-window)
(define-key evil-normal-state-map (kbd "qm")  'evil-record-macro)

(define-key evil-normal-state-map (kbd "SPC p t")  'projectile-toggle-between-implementation-and-test)
(define-key evil-normal-state-map (kbd "SPC :")  'helm-M-x)
(define-key evil-normal-state-map (kbd "SPC p s f")  'ag-project-files)
(define-key evil-normal-state-map (kbd "SPC p s r")  'projectile-ag-regex)
(define-key evil-normal-state-map (kbd "SPC p s s")  'projectile-ag)


(define-key evil-normal-state-map (kbd "SPC p s F")  'ag-project-files-current-current-file-extension)
(define-key evil-normal-state-map (kbd "C-c p s F")  'ag-project-files-current-current-file-extension)

(define-key evil-normal-state-map (kbd "SPC q Q")  'really-kill-emacs)
(defun really-kill-emacs ()
  (interactive)
  (let (kill-emacs-hook) (kill-emacs)))
(define-key evil-normal-state-map (kbd "SPC d t")  'm/open-terminal)
(defun m/open-terminal ()
  (interactive)
  (shell (generate-new-buffer-name "shell")))
(define-key evil-normal-state-map (kbd "SPC d a")  'evil-numbers/inc-at-pt)


(define-key evil-normal-state-map (kbd "SPC SPC") nil)

;; disable mouse clicks
;; (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
;;              [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;              [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]))
;;   (global-unset-key k))
;; (global-set-key (kbd "<down-mouse-1>") 'mouse-select-window)


(provide 'bindings)
;;; bindings.el ends here
