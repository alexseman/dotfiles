(require 'use-package)

(custom-set-variables
 '(custom-safe-themes
 '("4c7a1f0559674bf6d5dd06ec52c8badc5ba6e091f954ea364a020ed702665aa1" default))
 '(initial-scratch-message ";; Happy Hacking!")
 '(package-selected-packages
   '(company-irony-c-headers company-irony company flycheck jedi dracula-theme)))
 (custom-set-faces)

;;Disable menubar toolbar scrollbar
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1) 

;;Some more cleaning up
(setq inhibit-startup-screen t) ;; remove startup screen
(global-linum-mode t) ;;numbered lines
(add-to-list 'custom-theme-load-path "/home/ivche/.emacs.d/.themes")

;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;My theme
(load-theme 'dracula t)

;;SETUP JEDI
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;;SETUP COMPANY FOR C and C++
(use-package company
	     :ensure t
	     :config
	     (setq company-idle-delay 0)
	     (setq company-minimum-prefix-length 3))

(with-eval-after-load 'company
  (define-key company-active-map(kbd "M-n") nil)
  (define-key company-active-map(kbd "M-p") nil)
  (define-key company-active-map(kbd "M-n") 'company-select-next)
  (define-key company-active-map(kbd "M-p") 'company-select-previous)
)

(use-package company-irony
  :ensure t
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony))

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode)
)

(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

;;Setup flycheck
(use-package flycheck-irony
    :config
    (progn
      (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))



;;Electric pairs
(defun electric-pair ()
   "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
   (interactive)
   (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))

(add-hook 'c++-mode-hook
          (lambda ()
            (define-key c++-mode-map "\"" 'electric-pair)
            (define-key c++-mode-map "\'" 'electric-pair)
            (define-key c++-mode-map "(" 'electric-pair)
            (define-key c++-mode-map "[" 'electric-pair)
            (define-key c++-mode-map "{" 'electric-pair)
	    (define-key c++-mode-map "<" 'electric-pair)))
