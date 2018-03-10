(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4c7a1f0559674bf6d5dd06ec52c8badc5ba6e091f954ea364a020ed702665aa1" default)))
 '(initial-scratch-message ";; Happy Hacking!

"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Disable menubar toolbar scrollbar
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(menu-bar-mode -1) 

(setq inhibit-startup-screen t) ;; remove startup screen
(global-linum-mode t) ;;numbered lines
(add-to-list 'custom-theme-load-path "/home/ivche/.emacs.d/.themes")
(load-theme 'leuven t) 
