;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my-configurations                                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-projectile-recentf ()
  (projectile-dired)
  (projectile-recentf)
  )


(defun my-projectile-recentf ()
  (projectile-dired)
  (projectile-recentf)
  )


(defun my-persp-next ()
  (interactive)
  (spacemacs/layouts-transient-state/persp-next)
  (keyboard-quit)
  )

(defun my-persp-prev ()
  (interactive)
  (spacemacs/layouts-transient-state/persp-prev)
  (keyboard-quit)
  )

(defun buffer-exists (bufname) (not (eq nil (get-buffer bufname))))

(defun toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame

;; I don't use the default binding of 'C-x 5', so use toggle-frame-split instead

(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
(global-set-key (kbd "H-.")             'aj-toggle-fold)


;; add some shotcuts in popup menu mode
;;(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
;;(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
;;(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
;;(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
;;(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window-toggle-split-direction                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))



(global-set-key (kbd "M-s-=") 'window-toggle-split-direction)


(defun my-flycheck-posframe-config ()
  (interactive)
  (flycheck-posframe-configure-pretty-defaults)
  (setq flycheck-posframe-error-prefix "\u26a0")
  ;;(setq flycheck-posframe-border-width 1)
  ;;(set-face-attribute 'flycheck-posframe-error-face nil :inherit nil :foreground "dim gray")
  ;;(set-face-attribute 'flycheck-posframe-border-face nil  :foreground "gray" )
  ;;(set-face-attribute 'flycheck-posframe-error-face nil :foreground "black" :family "Hack" :height 130)
  ;;(set-face-attribute 'flycheck-posframe-warning-face nil :foreground "orange")
  ;;(set-face-attribute 'flycheck-posframe-info-face nil :foreground "blue")
  ;;(set-face-attribute 'flycheck-posframe-border-face nil :foreground "#dc752f")
  )
;;(my-flycheck-posframe-config)


(defun my-test:watch-here ()
  "Opens up a new shell in the directory associated with the
    current buffer's file. The eshell is renamed to match that
    directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t))))
         (filename (buffer-name))
         (buffername (concat "*eshell: " name "*"))
         )


    (if (not (eq nil (get-buffer buffername))) (pop-to-buffer buffername)
      (split-window-vertically (- height))
      (other-window 1)
      (eshell "new")
      (rename-buffer buffername)
      (eshell-kill-input)
      (end-of-buffer)
      ;;(insert "jest test")
      (insert "yarn test:watch")
      (end-of-buffer)
      (insert (concat " " filename))
      (insert " --colors")
      // (insert " --testNamePattern 'GroupPicker Selection when provided when CreateList is visible onListCreateClose'")
      (eshell-send-input)
      (eshell-send-input)
      (yank)
      )
    )
  )
(global-set-key (kbd "C-s-j") 'my-test:watch-here)


(defun eshell/x ()
  (interactive)
  (insert "exit")
  (eshell-send-input)
  (kill-this-buffer)
  (delete-window)
  )
(global-set-key (kbd "C-s-7") 'eshell/x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set the default fonts                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-default-font-style ()
  "Function that sets the font family and size"
  (interactive)
  (set-face-attribute 'default nil :family "Hack" :height 130)
  )

(defun my-configuration ()
  (interactive)
  (evil-leader/set-key "/" 'spacemacs/helm-project-do-ag)
  (setq evil-emacs-state-cursor '(box "yellow"))
  (set-face-attribute 'default nil :family "Hack" :height 130)
  ;;(set-face-attribute 'default nil :family "Inconsolata" :height 150)
  (setq projectile-switch-project-action #'projectile-recentf)

  ;;(setup-my-variables)
  )
(my-configuration)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  colorize eshell                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my-colorize-eshell  ()
;;   (add-hook 'eshell-before-prompt-hook
;;             (lambda ()
;;               (setq xterm-color-preserve-properties t)))
;;   (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)

;;   (setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
;;   (setenv "TERM" "xterm-256color")
;;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit configuration                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-magit-configuration ()
  (interactive)
  (my-magit-remove-rebase-section)
  (define-key magit-file-section-map (kbd "RET") 'magit-diff-visit-file-other-window)
  (define-key magit-hunk-section-map (kbd "RET") 'magit-diff-visit-file-other-window)
  (setq magit-bury-buffer-function 'magit-restore-window-configuration)
  (setq  magit-diff-hide-trailing-cr-characters t)
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t)
	(add-hook 'git-commit-mode-hook 'evil-insert-state)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remove rebasing hook from magit                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-magit-remove-rebase-section ()
  "Function that sets the font family and size"
  (interactive)
  (remove-hook 'magit-status-sections-hook 'magit-insert-rebase-sequence)
  (magit-refresh-all)
  )

(defun my-highlight-selected-window ()
  "Highlight selected window with a different background color."
  (walk-windows (lambda (w)
                  (unless (eq w (selected-window))
                    (with-current-buffer (window-buffer w)
                      (buffer-face-set '(:background "#0000"))))))
  (buffer-face-set 'default)
	)
;;(add-hook 'buffer-list-update-hook 'my-highlight-selected-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Allow hash to be entered                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-insert-hash ()
  "Allow hash to be entered"
  (interactive)
  (when (not(eq major-mode 'org-mode))
	  (if (region-active-p)
		    (insert-pair 1 ?# ?#)
	    (insert "#")
	    (backward-char))
	  )
  )


(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local coffee-tab-width n)              ; coffeescript
  (setq-local javascript-indent-level n)       ; javascript-mode
  (setq-local js-indent-level n)               ; js-mode
  (setq-local js2-basic-offset n)              ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n)    ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n)   ; web-mode, js code in html file
  (setq-local css-indent-offset n)             ; css-mode
  )

(defun my-office-code-style ()
  (interactive)
  (message "Office code style!")
  ;; use tab instead of space
  (setq-local indent-tabs-mode t)
  ;; indent 4 spaces width
  (my-setup-indent 4))

(defun my-personal-code-style ()
  (interactive)
  (message "My personal code style!")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (my-setup-indent 2))






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; deleting space                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun delete-horizontal-space-forward () ; adapted from `delete-horizontal-space'
  "*Delete all spaces and tabs after point."
  (interactive "*")
  (delete-region (point) (progn (skip-chars-forward " \t") (point))))

(defun backward-delete-char-hungry (arg &optional killp)
  "*Delete characters backward in \"hungry\" mode.
    See the documentation of `backward-delete-char-untabify' and
    `backward-delete-char-untabify-method' for details."
  (interactive "*p\nP")
  (let ((backward-delete-char-untabify-method 'hungry))
    (backward-delete-char-untabify arg killp)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pick up translation name spaces in buffer                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-get-translation-ns ()
  "Update the buffer with react translation code including namespaces"
  (interactive)
  (setq p (point))
  (goto-char (point-min))
  (setq namespaces '("announcement" "files" "forms" "general" "notifications" "tasks"))
  (setq list '())

  (dolist (n namespaces)
    ;;(print n)
	  (save-excursion
      (goto-char (point-min))
      ;; NOT BEING FOUND
	    (if (search-forward (concat n ":") nil t)
          (push n list)
	      )
	    )
    )
  (setq list (nreverse list))
  ;;(print-elements-of-list list)
  ;;(print-elements-of-list namespaces)

  ;; Find useTranslation on page
  (when (>= (length list) 1)
    (goto-char (point-min))
    (search-forward "import { useTranslation } from \'react-i18next\'" nil t)

    (goto-char p)
    (newline)
    (insert "const \{ t \} = useTranslation\(\[")

    (loop for x in list
          do (insert "\'") (insert x) (insert "\', "))

    (delete-backward-char 2)
    (insert "]\)")
    )

  (when (= (length list) 0)
    (message "No namespaces found in buffer")
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clean up the buffer                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-clean-up-buffer ()
  "Untabifies, indents and deletes trailing whitespace from buffer or region."
  (interactive)
  (save-excursion
	  (unless (region-active-p)
	    (mark-whole-buffer))
	  (my-untabify-buffer (region-beginning) (region-end))
	  (my-insert-leading-tabs  (region-beginning) (region-end))
	  (keyboard-quit)
	  )
  )
(global-set-key (kbd "H-s-SPC") 'my-clean-up-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; untabify buffer                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-untabify-buffer (begin end)
  "Untabify tabs in the middle of strings"
  (interactive "r")
  (save-excursion
	  (goto-char (point-min))
	  (while (search-forward-regexp "[^\n\r\t]\t" nil t)
	    (untabify (1- (point)) (line-end-position))
	    )
	  (message "All untabbed!")
	  )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; insert leading tabs                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-insert-leading-tabs (start end)
  "Call `tabify' with `tabify-regexp' set so that only leading
spaces are treated."
  (interactive "r")
  (setq tabify-regexp-old tabify-regexp)
  (unwind-protect
	    (progn
		    (setq tabify-regexp "^\t* [ \t]+")
		    (tabify start end))
	  (setq tabify-regexp tabify-regexp-old)
    )
  )


;;(defun print-elements-of-list (list)
;;  "Print each element of LIST on a line of its own."
;;  (while list
;;    (print (car list))
;;    (setq list (cdr list)))


(defun my-copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename)))
  )

(defun my-copy-file-name-from-src-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new (concatenate 'string "src/" (replace-regexp-in-string "^.*/src/" "" filename)))
      (message "Copied buffer file name '%s' to the clipboard." filename)))
  )

;; (defun my-copy-src-file-name-to-clipboard ()
;;   "Copy the current src buffer file name to the clipboard."
;;   (interactive)
;;   (let ((filename (if (equal major-mode 'dired-mode)
;;                       default-directory
;;                     (buffer-file-name))))

;;     (let ((ss (replace-regexp "^.*//(src//.*$" "\1" filename)))
;;         (message ss))

;;     (when filename
;;       (kill-new filename)
;;       //(message "Copied buffer file name '%s' to the clipboard." filename)
;;       )))




(defun my-helm-imenu ()
  "Switch to rjs-mode and invoke helm-imenu"
  (interactive)
  (rjsx-mode)
  (helm-imenu)
  )

(defun my-delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indent relative below                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
	  (save-excursion
	    (forward-line)
	    (transpose-lines 1))
	  (forward-line)
	  (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
	  (save-excursion
	    (forward-line)
	    (transpose-lines -1))
	  (move-to-column col)))
(defun indent-relative-below ()
  (interactive)
  (move-line-down)
  (indent-relative)
  (move-line-up)
  (previous-line)
  (previous-line))
(global-set-key  (kbd "M-]") 'indent-relative-below)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; capitalize first character                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-capitalize-first-char (&optional string)
  (interactive)
  "Capitalize only the first character of the input STRING."
  (when (and string (> (length string) 0))
    (let ((first-char (substring string nil 1))
          (rest-str   (substring string 1)))
      (concat (capitalize first-char) rest-str))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippets                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun js-react-redux-yasnippets-semicolon ()
  "Used in snippets. Return semicolon if js-react-redux-yasnippets-want-semicolon is t."
  (when js-react-redux-yasnippets-want-semicolon
    ";"))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; arrayify                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-arrayify (start end quote)
  "Turn strings on newlines into a QUOTEd, comma-separated one-liner."
  (interactive "r\nMQuote: ")
  (let ((insertion
         (mapconcat
          (lambda (x) (format "%s%s%s" quote x quote))
          (split-string (buffer-substring start end)) ", ")))
    (delete-region start end)
    (insert insertion)))


(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))

(defun projectile-test-suffix (project-type)
  "Find default test files suffix based on PROJECT-TYPE."
  (cond
   ((member project-type '(emacs-cask)) "-test")
   ((member project-type '(rails-rspec ruby-rspec)) "_spec")
   ((member project-type '(rails-test ruby-test lein-test boot-clj go)) "_test")
   ((member project-type '(scons)) "test")
   ((member project-type '(npm)) ".test")
   ((member project-type '(maven symfony)) "Test")
   ((member project-type '(gradle gradlew grails)) "Spec")))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clean up unclosed coldfusion tags like <cfset><cfargument>       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-close-tags (begin end)
  "Close tag off corrctly with />"
  (interactive "r")
  (setq tags '("cfset" "cfparam" "cfinclude" "cfargument" "br" "hr" "cflocation" "cfproperty" "input" "cfreturn" "cfbreak" "cfcontinue" "cfsetting" "input" "attributes" "cfdump" "cfftp"))

  (dolist (s tags)
		(goto-char begin)
		(save-excursion
			(goto-char begin)
			(while (re-search-forward (concat "\\(<" s "[^>]*?[^/]\\)>") nil t)

				(replace-match (match-string 1) t nil)
				;;(backward-char)
				(insert " />") (incf end))
			;; (indent-region begin end nil)
			;;(normal-mode)
			)
		)
  (message "All cleaned!")
  )
