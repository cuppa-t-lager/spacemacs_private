(setq evil-want-keybinding nil)


;;(package-initialize)
;;(require 'package)
;;(add-to-list 'package-archives
;;    '("spacelpa" . "hhttps://github.com/syl20bnr/spacelpa") t)

;;(dolist (package '(use-package))
;;   (unless (package-installed-p package)
;;       (package-install package)))
;;(require 'use-package)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-function-modifier 'hyper)
(setq mac-pass-command-to-system nil)
;;(setq persp-auto-save-persps-to-their-file nil)
;;(dotspacemacs-scroll-bar-while-scrolling nil)
(blink-cursor-mode)
(set-cursor-color "OliveDrab1")
(setq mac-mouse-wheel-smooth-scroll nil)
(setq my-hilightRegionColor "dark cyan")  ;;#eee8aa
(setq my-hilightRegionForegroundColor "beige")
(setq my-flycheckErrorColor "dark orange")
(setq my-posTipForegroundColor "black")
(setq my-posTipBackgroundColor "beige")
(setq my-backgroundColor "#111")
;;(setq x-gtk-use-system-tooltips t)
(setq git-messenger:show-detail t )
(setq git-messenger:use-magit-popup t)
(setq highlight-indentation-mode t)
(setq find-file-run-dired nil)

;; Setup Markdown previews
(setq grip-binary-path "/usr/local/bin/grip")
;; update the preview after file saves only, instead of after every text change.
(setq grip-update-after-change nil)
;; GitHub username for API authentication
(setq grip-github-user nil)
;; GitHub password or auth token for API auth
(setq grip-github-password nil)
;; set a browser for preview;
(setq grip-url-browser nil)
;; update the preview after file saves only, instead of after every text change.
(setq grip-update-after-change nil)
(setq grip-preview-use-webkit t)


;; my variables
(defun setup-my-variables ()
  (message "Setting up my variables")
  (set-background-color my-backgroundColor)

  ;; set my custom faces
  (custom-set-faces
   '(magit-section-highlight ((t (:background "#666666" :extend t))))
   '(ace-jump-face-foreground ((t (:foreground "yellow" :weight bold))))
   '(ace-jump-face-background ((t (:foreground "gray50"))))
   '(font-lock-comment-face ((t (:foreground "SlateGray3"))))
   '(helm-selection ((t (:extend t :background "dark cyan" :foreground "beige" :weight bold))))
   '(diff-added ((t (:foreground "#2e8b57" :background nil :inherit nil))))
   '(diff-removed ((t (:foreground "#cd0000" :background nil :inherit nil))))
   '(linum ((t (:foreground "turquoise" :slant italic))))
   '(company-tooltip-selection ((t (:background "dim gray" :foreground "black"))))
   '(flycheck-error ((t (:background "tomato"))))
   '(line-number ((t (:foreground "LightBlue3"))))
   '(sp-show-pair-match-face ((t (:background "DeepSkyBlue4")))) ;;Pair tags highlight
   `(region ((t (:background "bisque" :foreground "dim gray"))))
   '(lsp-face-highlight-read ((t (:foreground "OliveDrab1" :background "DeepSkyBlue4"))))
	 '(highlight-symbol-face ((t (:foreground "OliveDrab1" :background "dark cyan"))))


	 ;;'(helm-selection ((t (:extend t :background "#eee8aa" :foreground "black" :weight bold))))
	 '(js2-external-variable ((t nil)))
	 '(lsp-ui-doc-background ((t (:background "bisque"))))
	 '(magit-section-highlight ((t (:background "#666666" :extend t))))
	 ;;'(region ((t (:background "#eee8aa"))))
	 ;;'(sp-show-pair-match-face ((t (:background "dark cyan")))))

   )
  )
(setup-my-variables)

;; use rjsx-mode for .js* files except json and use tide with rjsx
(add-to-list 'auto-mode-alist '("\\.js.*$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; Associate files to modes
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.cfm\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.cfc\\'" . nxml-mode))


;; web-mode extra config
(add-hook 'web-mode-hook
          (lambda () (pcase (file-name-extension buffer-file-name))
            )
          )

;;(flycheck-add-mode 'typescript-tslint 'web-mode)
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'web-mode-hook #'turn-on-smartparens-mode t)


(add-to-list 'load-path "~/.emacs.d/private/my-config/")

(defun setup-flycheck-vars ()
	"Configures Flycheck vars."
	(eval-after-load "flycheck"
		'(progn
			 (message "Setting up flycheck vars")
			 (setq flycheck-display-errors-delay 0.4)
			 (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled))
			 (setq flycheck-highlighting-mode 'lines))))
(setup-flycheck-vars)


(setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
(setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))

;;(set-face-attribute 'region nil :background "#614A4A")
(set-face-attribute 'default nil :font "Fira Code" :height 130)
(setq global-hl-line-mode nil)
(setq auto-revert-mode t)

;;(setq helm-ag-base-command 'rg --vimgrep --no-heading --smart-case)

;;(setq -line-color 'DeepSkyBlue4)

;;(set-face-attribute 'region nil :foreground my-hilightRegionForegroundColor)
(set-face-background 'hl-line "DeepSkyBlue4")
(setq linum-format "%d")
(setq dotspacemacs-line-numbers t)
(setq dotspacemacs-maximised-at-startup t)




;; Set the file path in the title
(setq frame-title-format
			'((:eval (if (buffer-file-name)
									 (abbreviate-file-name (buffer-file-name))
								 "%b"))))



(setq company-global-modes t)

(delete-selection-mode 1)


(setq my-tab-stop-list-2s (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100 102 104 106 108 110 112 114 116 118 120)))
(setq my-tab-stop-list-4s (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 6 68 72 76 80 84 88 92 96 100 104 108 112 16 120 124 128 132 136 140 144 148 152 )))
(setq tab-stop-list my-tab-stop-list-2s)
(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)
(setq js2-mode-show-parse-errors nil)
(setq js2-strict-missing-semi-warning nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq standard-indent 2)
(setq default-tab-width 2)
;;(setq rainbow-mode t)
(setq indent-for-tab-command nil)
(setq-default tab-always-indent t)
(setq indent-line-function 'insert-tab)



(setq flycheck-javascript-eslint-executable "eslint_d")
;;(global-flycheck-mode)
(setq flycheck-pos-tip-mode nil)
(setq pos-tip-foreground-color my-posTipForegroundColor)
(setq pos-tip-background-color my-posTipBackgroundColor)
(setq pos-tip-border-width 10)
;;(pos-tip-show "ALERT")

(setq js2-strict-missing-semi-warning nil)

(setq helm-rg-thing-at-point nil)


(setq x-gtk-use-system-tooltips nil)

(setq spacemacs/toggle-whitspace-globally-on t)

(setq auto-completion-enable-snippets-in-popup t)
(setq auto-completion-enable-sort-by-usage t)





;; Keyboard smooth scrolling: Prevent the awkward "snap to re-center" when
;; the text cursor moves off-screen. Instead, only scroll the minimum amount
;; necessary to show the new line. (A number of 101+ disables re-centering.)
(setq scroll-conservatively 101)

;; Optimize mouse wheel scrolling for smooth-scrolling trackpad use.
;; Trackpads send a lot more scroll events than regular mouse wheels,
;; so the scroll amount and acceleration must be tuned to smooth it out.
;;;;;;(setq
;; If the frame contains multiple windows, scroll the one under the cursor
;; instead of the one that currently has keyboard focus.
 ;;;;;;mouse-wheel-follow-mouse t
;; Completely disable mouse wheel acceleration to avoid speeding away.
 ;;;;;;mouse-wheel-progressive-speed nil
;; The most important setting of all! Make each scroll-event move 2 lines at
;; a time (instead of 5 at default). Simply hold down shift to move twice as
;; fast, or hold down control to move 3x as fast. Perfect for trackpads.
 ;;;;;;mouse-wheel-scroll-amount '(3 ((shift) . 6) ((control) . nil)))

;;(set-face-attribute 'helm-selection nil
;;                    :background "DeepSkyBlue4"
;;                    :foreground "white")

(setq git-timemachine-show-minibuffer-details t)



(setq frame-title-format
			'(""
				(:eval
				 (let ((project-name (projectile-project-name)))
					 (unless (string= "-" project-name)
						 (format "[%s]" project-name))))
				" - %f")
			)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove helm-M-x duplicate entries                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq history-delete-duplicates t)
(setq history-length 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippets                                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(yas-global-mode 1)
(setq eolp nil)
(setq js-react-redux-yasnippets-want-semicolon nil)
(setq js-yasnippets-semicolon nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs garbage collectiuon                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq gc-cons-threshold 20000000) ;; ~20MB



;;(add-to-list 'dumb-jump-language-file-exts '(:language "coldfusion" :ext "cfc" :agtype "coldfusion" :rgtype "coldfusion"))
;;(add-to-list 'dumb-jump-language-file-exts '(:language "coldfusion" :ext "cfm" :agtype "coldfusion" :rgtype "coldfusion"))

;;(setq dumb-jump-force-searcher 'rg)


(setq whitespace-style '( face spaces newline space-mark tab-mark newline-mark))
(setq whitespace-display-mappings
			;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
			'(
				(space-mark 32 [183] [46]) ;; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
				;;(newline-mark 10 [182 10]) ;; LINE FEED,
				(tab-mark 9 [124 9] [92 9]) ;; tab  9 [9655 9] [92 9]
				))


(setq dotspacemacs-colorize-cursor-according-to-state nil)

(setq-default evil-escape-key-sequence ".,")

(load "~/.emacs.d/private/my-config/mymenu")


(setq grip-github-user 'john@gridside.co.uk)



(setq helm-source-projectile-recentf
			'((name . "Recent files in Project")
				(candidates . helm-projectile-recentf)
				(action . (lambda (candidate)
										(message-box "%s" candidate)))))

(setq helm-mini-default-sources '(helm-source-buffers-list
																	;;helm-source-projectile-recentf
																	helm-source-recentf
																	helm-source-buffer-not-found
																	))


;;(global-evil-mc-mode  1) ;; enable

;;(setq powerline-arrow-shape 'arrow)   ;; the default
;;(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
;;(setq powerline-arrow-shape 'arrow14) ;; best for small fonts
;;(custom-set-faces
;; '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
;;(setq powerline-color1 "grey22")
;;(setq powerline-color2 "grey40")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hooks                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook (lambda ()
														 (when (fboundp 'auto-dim-other-buffers-mode)
															 (auto-dim-other-buffers-mode t))))

;; formats the buffer before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)


(add-hook 'flycheck-mode-hook
					(lambda ()
						(set-face-attribute 'flycheck-error nil :background my-flycheckErrorColor  :foreground "white")
						(setq flycheck-highlighting-modeycheck-highlighting-mode 'lines)
						;;(setq flycheck-pos-tip-mode t)
						;;(setq flycheck-posframe-mode t)
						(set-face-attribute 'flycheck-posframe-error-face nil :background "dim gray" :foreground "white")
						)
					)

(add-hook 'helm-mode-hook
					(lambda ()
						(define-key helm-map (kbd "<right>") 'helm-next-source)
						(define-key helm-map (kbd "<left>")  'helm-previous-source)
						)
					)

(add-hook 'web-mode-hook
					(lambda ()
						(setq tab-stop-list my-tab-stop-list-2s)
						(setq-default tab-width 2)
						(highlight-symbol-mode)
						)
					)

(add-hook 'nxml-mode-hook
					(lambda ()
						(whitespace-mode -1)
						(rainbow-delimiters-mode -1)
						;;(customset-faces)
						(setq dash-at-point-docset "coldfusion")
						;;(set-background-color "gray5")
						;;(imenu-add-menubar-index)
						;;(my-coldfusion-imenu-configure)
						;;(set-face-attribute 'region nil :background "windowBackgroundColor")
						(setq sgml-basic-offset 4)
      			;;(setq indent-line-function 'indent-relative)
						(setq rainbow-mode t)
						;;(set-background-color "gray5")
						;;(prettier-js-mode  -1)
						;;(set-face-attribute 'region nil :background "#FF781F")
						;;(set-face-attribute 'region nil :foreground "white")
						(setq flycheck-mode -1)
						(setq-default indent-tabs-mode t)
						(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
						(define-key nxml-mode-map (kbd "C-M-b") 'sgml-skip-tag-backward)
						(define-key nxml-mode-map (kbd "C-M-f") 'sgml-skip-tag-forward)
						(setq nxml-child-indent 4 nxml-attribute-indent 4)

						(setq tab-stop-list my-tab-stop-list-2s)
						(setq-default tab-width 2)
						(highlight-symbol-mode)

						(message "Nxml mode started")
						)
					)

(add-hook 'js-mode-hook
					(lambda ()
						(setq tab-stop-list my-tab-stop-list-2s)
						(setq-default tab-width 2)
						)
					)

(add-hook 'lisp-mode-hook
					(lambda ()
						(setq tab-stop-list my-tab-stop-list-2s)
						(setq-default tab-width 2)
						(setq-default indent-tabs-mode t)
						)
					)

(add-hook 'rjsx-mode-hook
					(lambda ()
						(setq tab-stop-list my-tab-stop-list-2s)
						(setq-default tab-width 2)
						;;(setq lsp-ui-sideline-enable nil)
						(lsp)
						)
					)

(remove-hook 'sql-mode-hook
						 'spacemacs//sql-setup-backend
						 )

(add-hook 'lsp-mode-hook
					(lambda ()
						(setq lsp-ui-sideline-enable nil)
						(setq lsp-ui-sideline-enable nil)

						(setq lsp-lens-enable t)

						(setq lsp-ui-doc-mode t)
						(setq lsp-ui-doc-enable t)
						(setq lsp-ui-doc-show-with-cursor nil)
						(setq lsp-ui-doc-show-with-mouse t)
						(setq lsp-ui-doc-background "red")

						;;(custom-set-faces
						;; '(lsp-ui-doc-background ((t (:background "#464752"))))
						;; '(lsp-ui-doc-dorground ((t (:background "beige"))))
						;;)

						(setq lsp-enable-symbol-highlighting t)

						(setq lsp-modeline-code-actions-enable t)
						(setq lsp-modeline-code-actions-segments '(count icon name))
						(setq lsp-modeline-diagnostics-enable t)
						(setq lsp-completion-enable t)

						(setq lsp-completion-provider :capf)
						(setq lsp-completion-show-detail t)
						(setq lsp-completion-show-kind t)

						(setq lsp-eldoc-enable-hover t)
						(setq lsp-java-java-path "/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home/bin/java")
						(setq lsp-java-configuration-runtimes '[(:name "JavaSE-12"
																													 :path "/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home"
																													 :default t)])
						)
					)

(with-eval-after-load 'magit-mode
  ;;(my-magit-configuration)
	)


(add-hook 'after-init-hook
					(lambda ()
						(setup-my-variables)
						)
					)


(defun my/disable-scroll-bars (frame)
	(modify-frame-parameters frame
													 '((vertical-scroll-bars . nil)
														 (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)


;; Start grip when opening a markdown/org buffer
(add-hook 'markdown-mode-hook #'grip-mode)
(add-hook 'org-mode-hook #'grip-mode)


;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;;(add-to-list 'company-backends 'company-tabnine)

;;(setq company-backends '(company-tabnine company-bbdb company-semantic company-cmake company-capf company-clang company-files  (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-dabbrev))
