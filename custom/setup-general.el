;; (menu-bar-mode -1)
(tool-bar-mode -1)

;; show line number
(global-linum-mode 1)

;; highlight current line
(global-hl-line-mode t)

;; set cursor
(setq-default cursor-type 'bar)

;; Disable scroll bar
;; (scroll-bar-mode -1)

;; recentf-mode
(recentf-mode 1)
(setq recentf-max-menu-items 20)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; disable make-backups
(setq make-backup-files nil)

; modify syntax table to make underscore is in one word
(add-hook 'after-change-major-mode-hook 'modify-syntax-table-for-underscore)

;; <F2> open emacs init file
(global-set-key (kbd "<f2>") 'open-init-file)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; monokai
;; (use-package monokai-theme)

;; solarized-theme
(use-package color-theme-solarized
  :init
  (use-package color-theme)
  :config
  (defun set-solarized-light ()
    (interactive)
    (customize-set-variable 'frame-background-mode 'light)
    (load-theme 'solarized t))
  (defun set-solarized-dark ()
    (interactive)
    (customize-set-variable 'frame-background-mode 'dark)
    (load-theme 'solarized t))
  ;; color theme
  (global-set-key (kbd "C-c l") 'set-solarized-light)
  (global-set-key (kbd "C-c d") 'set-solarized-dark)
  (load-theme 'solarized t))


;; smartparens settings
(use-package smartparens
  ;; :commands (smartparens-config)
  :config
  (smartparens-global-mode t))

;; popwin settings
(use-package popwin
  :config
  (popwin-mode 1))

;; sr-speedbar
(use-package sr-speedbar
  :config
  (setq sr-speedbar-right-side nil)
  (setq sr-speedbar-max-width 40)
  (setq dframe-update-speed t)
  (global-set-key (kbd "<f3>") (lambda()
                                 (interactive)
                                 (sr-speedbar-toggle))))

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

;; Evil mode
(use-package evil
  :config
  (evil-mode 1))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

(windmove-default-keybindings)

(provide 'setup-general)
