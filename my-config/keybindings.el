;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my keybindings                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key (kbd "M-s-|")             'highlight-indentation-mode)
(global-set-key (kbd "<C-M-tab>")         'origami-toggle-node)
(global-set-key (kbd "M-s-*")             'highlight-symbol-mode)


(global-set-key (kbd "C->")               'hungry-delete-forward)
(global-set-key (kbd "C-<")               'hungry-delete-backward)

(global-set-key (kbd "M-s-k")             'string-inflection-kebab-case)
(global-set-key (kbd "H-SPC")             'set-rectangular-region-anchor)
(global-set-key (kbd "M-s-§")             'my-configuration)

(global-set-key (kbd "<H-right>")         'forward-sexp)
(global-set-key (kbd "<H-left>")          'backward-sexp)

(global-set-key (kbd "<C-H-right>")       'my-persp-next)
(global-set-key (kbd "<C-H-left>")        'my-persp-prev)


(global-set-key (kbd "s-.")               'xref-find-definitions)
(global-set-key (kbd "<s-mouse-1>")       'xref-find-definitions)
(global-set-key (kbd "M-.")               'spacemacs/jump-to-definition-other-window) ;;xref-find-definitions-other-window
(global-set-key (kbd "<M-s-mouse-1>")     'spacemacs/jump-to-definition-other-window) ;;xref-find-definitions-other-window
(global-set-key (kbd "M-s-o")           	'spacemacs/jump-to-definition-other-window)
(global-set-key (kbd "M-s-s")           	'xref-find-definitions)

(global-set-key (kbd "M-?")               'xref-find-references)
(global-set-key (kbd "<M-s-mouse-3>")     'xref-find-references)
(global-set-key (kbd "M-s-?")             'lsp-ui-peek-find-references)
(global-set-key (kbd "<s-mouse-3>")       'lsp-ui-peek-find-references)
(global-set-key (kbd "M-s-/")             'lsp-ui-peek-find-definitions)
(global-set-key (kbd "H-s-/")             'lsp-ui-peek--goto-xref-other-window)

(global-set-key (kbd "<C-H-right>")       'spacemacs/layouts-transient-state/persp-next)
(global-set-key (kbd "<C-H-left>")        'spacemacs/layouts-transient-state/persp-prev)

(global-unset-key (kbd "M-1"))  					;;magit-section-show-level-1-all
(global-unset-key (kbd "M-2"))  					;;magit-section-show-level-2-all

(global-set-key (kbd "C-=")               'er/expand-region)
(global-set-key (kbd "C--")               'er/contract-region)

(global-set-key (kbd "M-[")               'indent-relative)
(global-set-key (kbd "M-]")               'indent-relative-below)

(global-set-key (kbd "M-s-;")             'helm-projectile-rg)
(global-set-key (kbd "M-s-z")             'helm-projectile-find-file-dwim)

(global-set-key (kbd "M-s-*")             'my-helm-imenu)

;;(define-key helm-map (kbd "<right>")    'helm-next-source)
;;(define-key helm-map (kbd "<left>")     'helm-previous-source)

(global-set-key (kbd "M-a")               'end-of-line)

(global-set-key (kbd "M-a")               'backward-sentence)
(global-set-key (kbd "M-e")               'forward-sentence)
(global-set-key (kbd "C-l")               'recenter-top-bottom)

(global-set-key (kbd "<M-s-right>")       'windmove-right)
(global-set-key (kbd "<M-s-left>")        'windmove-left)
(global-set-key (kbd "<M-s-up>")          'windmove-up)
(global-set-key (kbd "<M-s-down>")        'windmove-down)

(global-set-key (kbd "s-&")               'kill-this-buffer)
(global-set-key (kbd "M-s-w")             'web-mode)
(global-set-key (kbd "H-s-w")             'whitespace-mode)
(global-set-key (kbd "<H-s-up>")          'move-text-line-up)
(global-set-key (kbd "<H-s-down>")        'move-text-line-down)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; modes                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-s-h")             'web-mode)
(global-set-key (kbd "M-s-j")             'rjsx-mode)   ;;rjsx-mode or js-jsx-mode
(global-set-key (kbd "M-s-t")             'text-mode)
(global-set-key (kbd "M-s-n")             'nxml-mode)
(global-set-key (kbd "M-s-2")             'js2-mode)
(global-set-key (kbd "M-s-l")             'lsp-mode)
(global-set-key (kbd "M-s-u")             'lsp-ui-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flycheck                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-s-f")             'flycheck-mode)
(global-set-key (kbd "M-s-e")             'flycheck-list-errors)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; strings                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-s-:")             'projectile-ripgrep)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffers/frames                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<s-return>")        'spacemacs/toggle-maximize-buffer)
(global-set-key (kbd "H-n")               'mc/mark-next-like-this)
(global-set-key (kbd "H-a")               'mc/edit-beginnings-of-lines)

;;(global-unset-key (kbd "C-a"))
;;(global-set-key (kbd "C-a")             'crux-move-beginning-of-line)

;; back-button-global
;; back-button-global-backward
;; back-button-global-forward
;; back-button-local
;; back-button-local-backward
;; back-button-local-forward



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dumb jump                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(global-set-key (kbd "M-s-o") 'dumb-jump-go-other-window)
;;(global-set-key (kbd "M-s-g") 'dumb-jump-go)
;;(global-set-key (kbd "M-s-p") 'dumb-jump-go-prompt)
;;(global-set-key (kbd "M-s-b") 'dumb-jump-back)
;;(global-set-key (kbd "M-s-q") 'dumb-jump-quick-look)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x b")             'helm-mini)
(global-set-key (kbd "M-y")               'helm-show-kill-ring)

(global-set-key (kbd "M-s-1")             'my-get-translation-ns)



;;(global-unset-key (kbd "<tab>"))
(global-set-key (kbd "M-s-y")           'yas-expand)
(global-set-key (kbd "<s-tab>")         'my-insert-leading-tabs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; More standard Emacs Key bindings                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-insert-state-map (kbd "C-a")    'move-beginning-of-line)             ;; was 'evil-paste-last-insertion
(define-key evil-insert-state-map (kbd "C-e")    'end-of-line)                        ;; was 'evil-copy-from-below
(define-key evil-insert-state-map (kbd "C-n")    'next-line)                          ;; was 'evil-complete-next
(define-key evil-insert-state-map (kbd "C-p")    'previous-line)                      ;; was 'evil-complete-previous
(define-key evil-insert-state-map (kbd "C-a")    'crux-move-beginning-of-line)        ;; replaces evil-paste-last-insertion
(define-key evil-insert-state-map (kbd "C-e")    'move-end-of-line)                   ;; replaces evil-copy-from-below
(define-key evil-insert-state-map (kbd "C-d")    'delete-forward-char)                ;;
(define-key evil-insert-state-map (kbd "C-y")    'yank)                               ;; replaces evil-copy-from-above
(define-key evil-insert-state-map (kbd "C-w")    'kill-region)
(define-key evil-insert-state-map (kbd "M-s-w")  'whitespace-mode)
(define-key evil-insert-state-map (kbd "s-&")    'kill-this-buffer)
(define-key evil-insert-state-map (kbd "M-e")    'forward-sentence)


;;(global-unset-key (kbd "M-3"))
(define-key  winum-keymap (kbd "M-s-3") '(lambda() (interactive) (my-insert-hash)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git                                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-s-r")               'ediff-revision)


(global-set-key (kbd "<s-right>")           'forward-list)
(global-set-key (kbd "<s-left>")            'backward-list)
(global-set-key (kbd "<s-up>")              'backward-up-list)
(global-set-key (kbd "<s-down>")            'down-list)


(global-set-key (kbd "M-s !")               'shell-here)

(global-set-key (kbd "C-x e")               'eval-region)

(global-set-key (kbd "M-s-`")               'beacon-blink)

(global-set-key (kbd "C-c C-f")             'sgml-skip-tag-forward)
(global-set-key (kbd "C-c C-b")             'sgml-skip-tag-backward)

(global-set-key (kbd "M-s-i")               'helm-imenu)
