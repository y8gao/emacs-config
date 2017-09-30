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
(use-package color-theme-solarized)

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

;; smartparens settings
(use-package smartparens
  :commands (smartparens-config)
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
  (setq sr-speedbar-max-width 40))

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

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(windmove-default-keybindings)

(provide 'setup-general)
