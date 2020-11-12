(setq user-full-name "Ivan Trajkov"
      user-mail-address "itrajkov999@gmail.com")



(setq doom-font (font-spec :family "Hack" :size 15))
(setq doom-unicode-font (font-spec :family "FontAwesome" :size 15))

(setq doom-line-numbers-style 'relative)

(setq display-line-numbers-type t)

(add-to-list 'custom-theme-load-path "~/.doom.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(when (display-graphic-p)
  (setq doom-theme 'doom-solarized-dark))
;; (setq doom-theme 'doom-gruvbox)

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-grous '((:name "Today"
                                  :time-grid t
                                  :scheduled today)
                                 (:name "Due Today"
                                  :deadline today)
                                 (:name "Important"
                                  :priority "A")
                                 (:name "Overdue"
                                  :deadline past)
                                 (:name "Due soon"
                                  :deadline future)
                                 (:name "Big Outcome"
                                  :tag "bo")))
  :config
  (org-super-agenda-mode))

(setq org-directory "~/org")

(setq org-roam-directory "~/org/'Ivche System'/roam")

(setq org-agenda-files '("~/org/ivches_system/"))

(after! org (setq org-todo-keywords
                  '((sequence "TODO" "DOING" "WAITING" "LATER" "DONE" "DELEGATED" "CANCELED"))))

 (after! org (setq +org-capture-notes-file (concat org-directory "/ivches_system/general/quick_notes.org")))
 (after! org (setq +org-capture-todo-file (concat org-directory "/ivches_system/mygtd.org")))

(after! org (setq org-capture-templates
                  '(("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox")
                     "* TODO %? %i %a\n+ Added: %U"))))

(after! org (setq org-archive-location (concat org-directory "/ivches_system/archive/task_archive.org::")))
