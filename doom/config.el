(setq user-full-name "Ivan Trajkov"
      user-mail-address "itrajkov999@gmail.com")

(setq default-tab-width 4)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0)

(setq +doom-dashboard-banner-file (expand-file-name "images/banner.png" doom-private-dir))

(setq doom-font (font-spec :family "Inconsolata" :size 25))
(setq doom-unicode-font (font-spec :family "FontAwesome" :size 15))

(setq doom-line-numbers-style 'relative)

(setq display-line-numbers-type t)

(setq doom-theme 'doom-nord)

(add-hook 'vue-mode-hook #'lsp!)

(add-hook `c++-mode-hook `irony-mode)
(add-hook `c-mode-hook `irony-mode)
(add-hook `irony-mode `irony-cdb-autosetup-compile-options)

(setq mu4e-change-filename-when-moving t)

(setq mu4e-update-interval (* 10 60))
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-maildir "~/Mail")

(after! mu4e (setq mu4e-contexts
                   (list
                    ;; Personal gmail account
                    (make-mu4e-context
                     :name "Main-Gmail"
                     :match-func
                     (lambda (msg)
                       (when msg
                         (string-prefix-p "/itrajkov999" (mu4e-message-field msg :maildir))))
                     :vars '((user-mail-address . "itrajkov999@gmail.com")
                             (user-full-name    . "Ivan Trajkov")
                             (mu4e-drafts-folder  . "/itrajkov999/[Gmail]/Drafts")
                             (mu4e-sent-folder  . "/itrajkov999/[Gmail]/Sent Mail")
                             (mu4e-refile-folder  . "/itrajkov999/[Gmail]/All Mail")
                             (mu4e-trash-folder  . "/itrajkov999/[Gmail]/Trash")))

                    ;;Ivchepro gmail
                    (make-mu4e-context
                     :name "All-Gmail"
                     :match-func
                     (lambda (msg)
                       (when msg
                         (string-prefix-p "/ivchepro" (mu4e-message-field msg :maildir))))
                     :vars '((user-mail-address . "ivchepro@gmail.com")
                             (user-full-name    . "Беден Буџи")
                             (mu4e-drafts-folder  . "/ivchepro/[Gmail]/Drafts")
                             (mu4e-sent-folder  . "/ivchepro/[Gmail]/Sent Mail")
                             (mu4e-refile-folder  . "/ivchepro/[Gmail]/All Mail")
                             (mu4e-trash-folder  . "/ivchepro/[Gmail]/Trash"))))))

(setq mu4e-maildir-shortcuts
      '(("/itrajkov999/Inbox"             . ?i)
        ("/itrajkov999/[Gmail]/Sent Mail" . ?s)
        ("/itrajkov999/[Gmail]/Trash"     . ?t)
        ("/itrajkov999/[Gmail]/Drafts"    . ?d)
        ("/itrajkov999/[Gmail]/All Mail"  . ?a)))

(after! mu4e (setq shr-use-colors nil))

(setq org-reveal-mathjax t)
;; (use-package ox-reveal
;;   :ensure ox-reveal)
;; (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
(setq org-reveal-root "file:///home/ivche/node_modules/reveal.js/")

(setq org-directory "~/org")

;; (setq org-agenda-files '("~/org/ivches_system/"))

;; (after! org (setq org-todo-keywords
                  ;; '((sequence "TODO" "DOING" "WAITING" "LATER" "DONE" "DELEGATED" "CANCELED"))))

;; (after! org (setq +org-capture-notes-file (concat org-directory "/ivches_system/general/quick_notes.org")))
;; (after! org (setq +org-capture-todo-file (concat org-directory "/ivches_system/mygtd.org")))

;; (after! org (setq org-capture-templates
                  ;; '(("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox")
                     ;; "* TODO %? %i %a\n+ Added: %U"))))

;; (after! org (setq org-archive-location (concat org-directory "/ivches_system/archive/task_archive.org::")))

;; (use-package! org-super-agenda
;;   :after org-agenda
;;   :init
;;   (setq org-super-agenda-grous '((:name "Today"
;;                                   :time-grid t
;;                                   :scheduled today)
;;                                  (:name "Due Today"
;;                                   :deadline today)
;;                                  (:name "Important"
;;                                   :priority "A")
;;                                  (:name "Overdue"
;;                                   :deadline past)
;;                                  (:name "Due soon"
;;                                   :deadline future)
;;                                  (:name "Big Outcome"
;;                                   :tag "bo")))
;;   :config
;;   (org-super-agenda-mode))
