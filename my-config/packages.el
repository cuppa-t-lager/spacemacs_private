;;; packages.el --- my-config layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: John Nicola <john.nicola@CNC0052>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-config-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-config/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-config/pre-init-PACKAGE' and/or
;;   `my-config/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq my-config-packages
      '(
        back-button
        ace-jump-mode
        ripgrep
        crux
        helm-rg
        ;; rjsx
        flycheck-color-mode-line
        ;; git-gutter+
        ;;atom-one-dark-theme
        ;;material-theme
        ;;vscode-dark-plus-theme
        ;;jest-test-mode
        coverage
        shell-here
        ;;diff-hl
        ;;treemacs
        beacon
        grip-mode
        auto-dim-other-buffers
        eshell-git-prompt
        vterm
        multi-vterm
        ;;tide
        highlight-symbol
        ;;highlight-sexp
        ;;smooth-scrolling
        java-snippets
        xterm-color
        yarn-test
        ;;yasnippets-snippets
        ;;magit-pop
        flycheck-posframe
        indent-tools
        ;;change-caseminimap
        goto-last-change
        company-tabnine
        )
      )
"The list of Lisp packages required by the my-config layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACbKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  company-tabnine                                                       ;;
;;  https://github.com/TommyX12/company-tabnine                           ;;
;; Run M-x company-tabnine-install-binary to install the TabNine binary for your system.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-company-tabnine ()
  (use-package company-tabnine
		:ensure t
		)
  )


;;(use-package company
;;  :config
;;    (global-company-mode)
;;  :custom
;;  (company-dabbrev-downcase nil)
;;  (company-idle-delay 0)
;;  (company-minimum-prefix-length 1)
;;  (company-tooltip-align-annotations t)
;;  (company-dabbrev-other-buffers t) ; search buffers with the same major mode
  ;;(company-selection-wrap-around t)
  ;;  :bind (:map company-active-map
  ;;              ("C-n" . company-select-next)
  ;;              ("C-p" . company-select-previous)
  ;;              ("C-s" . company-filter-candidates)
  ;;              ("&lt;tab&gt;" . company-complete-selection))
  ;;  :bind (:map company-search-map
  ;;              ("C-n" . company-select-next)
  ;;              ("C-p" . company-select-previous))
 ;;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  minimap-mode                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-goto-last-change ()
  (use-package goto-last-change
    :ensure t
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  minimap-mode                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-minimap ()
  (use-package minimap
    :ensure t
  :bind
    (
   ("M-s-m"       . minimap-mode)

     )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  flycheck-posframe                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (defun my-config/init-flycheck-posframe ()
   (use-package flycheck-posframe
     :ensure t
     :after flycheck
     :config (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)
     )
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  indent-tools                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-indent-tools ()
  (use-package indent-tools
    :ensure t
    :after flycheck
    :config (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)
    :bind
    (
     ("C-c >"       . indent-tools-hydra/body)
      )
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  magit-pop                                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defun my-config/init-magit-pop ()
;; (defun my-config/init-magit-popup ()
;;   (use-package magit-popup
;;     :ensure t ;; make sure it is installed
;;     ;;:demand t ;; make sure it is loaded
;;     :toggle t
;;     )
;;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  yasnippets-snippets                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defun my-config/init-yasnippets-snippets ()
;;  (use-package yasnippets-snippets
;;    :ensure t
;;    )
;;  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  yarn-test                                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-yarn-test ()
  (use-package yarn-test
    :load-path "~/.emacs.d/private/my-config/"
    :defer t
    :after (rjsx-mode)
    :hook (rjsx-mode . jest-minor-mode)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  change-case                                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defun my-config/init-change-case ()
;;  (use-package change-case
;;    :load-path "~/.emacs.d/private/my-config/"
;;    :ensure t
;;    )
;;  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  string-inflection                                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defun my-config/init-string-inflection ()
;;  (use-package string-inflection
;;    :ensure t
;;    :demand
;;    :bind (:map prog-mode-map)
;;    )
;;  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  xterm-color                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-xterm-color ()
  (use-package xterm-color
    :defer t
    :init
    (setenv "TERM" "xterm-256color")
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  java-snippets                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-java-snippets ()
  (use-package java-snippets
    :defer t
    :init
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  back-button                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-back-button ()
  (use-package back-button
    :defer t
    :init
    :config
    (back-button-mode 1)
    :bind
    (
     ("C-x C-<SPC>"       . back-button-global)
     ("C-x C-<left>"      . back-button-global-backward)
     ("C-x C-<right>"     . back-button-global-forward)
     ("C-x <SPC>"         . back-button-local)
     ("C-x <left>"        . back-button-local-backward)
     ("C-x <right>"       . back-button-local-forward)
     ( "M-s-]"            . back-button-local-forward)
     ( "M-s-["            . back-button-local-backward)
     )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ace-jump-mode                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-ace-jump-mode ()
  (use-package ace-jump-mode
    :defer t
    :bind
    (
     ("M-s-a" . ace-jump-mode)
     )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ripgrep                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-ripgrep ()
  (use-package ripgrep
    :defer t
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; crux                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-crux ()
  (use-package crux
    :ensure t
    :defer t
    :init
    :bind (("C-c o"                        . crux-open-with)
           ("M-o"                          . crux-smart-open-line)
           ("C-c n"                        . crux-cleanup-buffer-or-region)
           ("C-c f"                        . crux-recentf-find-file)
           ("C-M-z"                        . crux-indent-defun)
           ("C-c u"                        . crux-view-url)
           ("C-c e"                        . crux-eval-and-replace)
           ("C-c w"                        . crux-swap-windows)
           ("C-c D"                        . crux-delete-file-and-buffer)
           ("C-c r"                        . crux-rename-buffer-and-file)
           ("C-c t"                        . crux-visit-term-buffer)
           ("C-c k"                        . crux-kill-other-buffers)
           ("C-c TAB"                      . crux-indent-rigidly-and-copy-to-clipboard)
           ("C-c I"                        . crux-find-user-init-file)
           ("C-c S"                        . crux-find-shell-init-file)
           ("s-r"                          . crux-recentf-find-file)
           ("s-j"                          . crux-top-join-line)
           ("C-^"                          . crux-top-join-line)
           ;; ("s-k" . crux-kill-whole-line)
           ("M-s-<backspace>"              . crux-kill-whole-line)
           ("C-<backspace>"                . crux-kill-line-backwards)
           ("s-o"                          . crux-smart-open-line-above)
           ([remap move-beginning-of-line] . crux-move-beginning-of-line)
           ([(shift return)]               . crux-smart-open-line)
           ([(control shift return)]       . crux-smart-open-line-above)
           ([remap kill-whole-line]        . crux-kill-whole-line)
           ("C-c s"                        . crux-ispell-word-then-abbrev)
           ("C-a"                          . crux-move-beginning-of-line)
           ("C-c d"                        . crux-duplicate-current-line-or-region)
           )
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-rg                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-helm-rg ()
  (use-package helm-rg
    :defer t
    :init
    :config
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rjsx                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defun my-config/init-rjsx ()
;;  (use-package rjsx
;;    :defer t
;;    )
;;  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flycheck color mode                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-flycheck-color-mode-line ()
  (use-package flycheck-color-mode-line
    :defer t
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git gutter                                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-config/init-git-gutter+ ()
;;   (use-package git-gutter+
;;   :ensure t
;;   :init (global-git-gutter+-mode)
;; ;;  :config (progn
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
;;             ;;(define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer))
;;   :diminish (git-gutter+-mode . "gg")
;;   )
;;   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; diff hl                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(defun my-config/init-diff-hl ()
;;  (use-package diff-hl
;;      :defer t
;;      :init
;;      :config
;;      (global-diff-hl-mode)
;;      )
;;  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; themes                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-config/init-atom-one-dark-theme ()
;;   (use-package atom-one-dark-theme
;;     :ensure t
;;     :init
;;     :config
;;     ;;(load-theme 'atom-one-dark t)
;;     )
;;   )

;; (defun my-config/init-vscode-dark-plus-theme ()
;;   (use-package vscode-dark-plus-theme
;;     :config
;;     ;;(load-theme 'vscode-dark-plus t)
;;     )
;;   )

;; (defun my-config/init-material-theme ()
;;   (use-package material-theme
;;     :config
;;     (load-theme 'material-theme t)
;;     )
;;   )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jest                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-config/init-jest-test-mode ()
;;  (use-package jest-test-mode
;;    :ensure t
;;    :defer t
;;    :commands jest-test-mode
;;    :hook (rjsx-mode)
;;    )
;;  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; diff-hl                                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-config/init-diff-hl ()
;;   (use-package diff-hl
;;     :defer t
;;     :init
;;     (add-hook 'after-init-hook 'global-diff-hl-mode)
;;     (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
;;     (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
;;     :config
;;     (diff-hl-flydiff-mode t)
;;     (unless (display-graphic-p)
;;       (diff-hl-margin-mode t))
;;     )
;;   )

(defun my-config/init-coverage ()
  (use-package coverage
    :ensure t
    :init
    :config
    )
  )


(defun my-config/init-shell-here ()
  (use-package shell-here
    :ensure t
    :init
    :config
    )
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smooth scroll                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-config/smooth-scrolling ()
;;    (use-package smooth-scrolling
;;      :config
;;      (smooth-scrolling-mode 1)
;;      )
;;    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; treemacs                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-config/init-treemacs ()
;;   (use-package treemacs
;;     :ensure t
;;     :defer t
;;     :init
;;     :config
;;     )
;;   )
;;; packages.el ends here


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; beacon-mode; flashes the cursor's line when you scroll                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-beacon ()
  (use-package beacon
    :ensure t
    :config
    (beacon-mode 1)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; grip-mode                                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-grip-mode ()
  (use-package grip-mode
    :ensure t
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-dim-other-buffers                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :ensure t
    :config
    (set-face-attribute 'auto-dim-other-buffers-face nil :background "#333344")
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eshell-git-prompt                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-eshell-git-prompt ()
  (use-package eshell-git-prompt
    :ensure t
    :config
    (eshell-git-prompt-use-theme 'powerline)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;vterm and multi vterm                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-vterm ()
  (use-package vterm
    :ensure t
    :config
    )
  )

(defun my-config/init-multi-vterm ()
  (use-package multi-vterm
    :ensure t)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;highlight symbol                                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-config/init-highlight-symbol ()
  (use-package highlight-symbol
    :ensure t
    :config
    (set-face-attribute 'highlight-symbol-face nil
                        :background "dim gray" ;;default
                        :foreground "OliveDrab1")
    (setq highlight-symbol-idle-delay 0)
    (setq highlight-symbol-on-navigation-p t)
    (add-hook 'prog-mode-hook #'highlight-symbol-mode)
    (add-hook 'prog-mode-hook #'highlight-symbol-nav-mode)
    :bind
    (
     ("C-s-h"         . highlight-symbol)
     ("<H-s-right>"   . highlight-symbol-next)
     ("<H-s-left>"    . highlight-symbol-prev)
     )
    :init
    (highlight-symbol-mode t)
    )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  highlight-sexp                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-config/init-highlight-sexp ()
;;   (use-package highlight-sexp
;;     :defer t
;;     :init
;;     )
;;   )



;;;; Smart Parentheses
;;(defun module/misc/smartparens ()
;;  (use-package smartparens
;;    :defer t
;;    :diminish ""
;;    :bind (("C-)" . sp-forward-slurp-sexp)
;;           ("C-}" . sp-forward-barf-sexp)
;;           ("C-(" . sp-splice-sexp))
;;    :config
;;    (progn
;;      (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
;;      (push 'yas-installed-snippets-dir yas-snippet-dirs))
;;    ))
