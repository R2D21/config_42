;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; Colorise en Rouge les espace
(setq show-trailing-whitespace t)
(setq-default show-trailing-whitespace t)

(require 'auto-complete-config)
(ac-config-default)

(load-file "~/.emacs.d/std.el")
(load-file "~/.emacs.d/std_comment.el")
(load-file "~/.emacs.d/eruby-mode.el")

;; Les skeleton
(load-file "~/.emacs.d/skeleton.el")
(load-file "~/.emacs.d/raccourcis.el")
;; Les truc utiles
(load-file "~/.emacs.d/utils.el")

;;dictionnaire francais par defaut
(setq ispell-dictionary "francais")

;; Remplacer le texte selectionne si on tape
(delete-selection-mode t)

;; affiche les espaces inutile
(setq-default show-trailing-whitespace t)

;; Affiche le numéro de ligne et de colonne
(column-number-mode t)
(line-number-mode t)
(global-linum-mode 1)

;; Afficher la 'parenthèse correspondante'
(require 'paren)
(show-paren-mode)

;; Activer la coloration syntaxique
(global-font-lock-mode t)
;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(setq make-backup-files nil)
(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t)
(setq blink-matching-paren-on-screen t)
(setq show-paren-style 'expression)
(setq blink-matching-paren-dont-ignore-comments t)
(setq-default indent-tabs-mode nil)
(set-face-background 'show-paren-match "yellow")

;; Supprimer tous les espaces en fin de ligne
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

;; Mettre un titre aux fenêtres
(setq frame-title-format '(buffer-file-name "%b"))
(add-hook 'before-save-hook 'whitespace-cleanup)
