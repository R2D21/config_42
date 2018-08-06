;; Lancer le man
(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointe par le curseur"
  (interactive)
  (manual-entry (current-word)))
 
;; Suppression des espaces en fin de ligne a l'enregistrement
(add-hook 'c++-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook   'c-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
 
;; Laisser le curseur en place lors d'un defilement par pages.
;; Par defaut, Emacs place le curseur en debut ou fin d'ecran
;; selon le sens du defilement.
(setq scroll-preserve-screen-position t)
 
;; Complette automatiquement ce que vous tapez dans le mini-buffer
(icomplete-mode 1)
 
;; Pouvoir utiliser la completition sous emacs en ignorant la casse
(setq completion-ignore-case t)
 
;; Supprime les fichier ~
(setq make-backup-files nil)
 
;; parenthese em couleur
(custom-set-variables
 '(show-paren-mode t))
(custom-set-faces)
 
;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)
 
;; Affiche le numero de ligne et de colonne
(column-number-mode t)
(line-number-mode t)
 
;; Enlever le message au demarrage
(setq inhibit-startup-message t)
 
;; Remplacer le texte selectionne si on tape
(delete-selection-mode t)
 
;; Affiche l'heure au format 24h
(setq display-time-24hr-format t)
(setq displat-time-day-and-date t)
 
;; Sauvegarder la session
(desktop-load-default)
(desktop-read)
 
;; ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)


; Affiche la parenthese & Accolade parrente
(require 'paren)
(show-paren-mode)

; Affiche l'heure au format 24h
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

; surlignage d'une région sélectionnée
(transient-mark-mode t)

; Activer la coloration syntaxique
(global-font-lock-mode t)

; Supprime tous les espaces en fin de ligne
; http://www.splode.com/users/friedman...re/emacs-lisp/
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

; Mettre un titre aux fenêtres
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b")) 

;; (require 'mwheel)
;; (mouse-wheel-mode 1)


;; Molette seule <=> d�placement de cinq lignes
;; (defun up-slightly () (interactive) (scroll-up 5))
;; (defun down-slightly () (interactive) (scroll-down 5))
;; (global-set-key [mouse-4] 'down-slightly)
;; (global-set-key [mouse-5] 'up-slightly)

;; ;; Molette + Shift <=> d�placement d'une ligne
;; (defun up-one () (interactive) (scroll-up 1))
;; (defun down-one () (interactive) (scroll-down 1))
;; (global-set-key [S-mouse-4] 'down-one)
;; (global-set-key [S-mouse-5] 'up-one)

;; ;; Molette + Control <=> d�placement d'une page
;; (defun up-a-lot () (interactive) (scroll-up))
;; (defun down-a-lot () (interactive) (scroll-down))
;; (global-set-key [C-mouse-4] 'down-a-lot)
;; (global-set-key [C-mouse-5] 'up-a-lot)


;; Sauvegarde des historiques d'une session � l'autre.
;; Ce module n'est pas packag� dans la distribution Debian.
;; (require 'save-history)

(require 'paren)
(show-paren-mode t)
(setq blink-matching-paren t)
(setq blink-matching-paren-on-screen t)
(setq show-paren-style 'expression)
(setq blink-matching-paren-dont-ignore-comments t)
 (defun delete-trailing-spaces ()
  "Effacer les espaces et tabulations en fin de chaque ligne du tampon"
  (interactive)
  (progn
    (save-excursion
      (goto-line 1)
      ;; ATTENTION, dans la liste ci-dessous, il y a 3 espaces de
      ;; nature diff�rente : normal, ins�cable, tabulation.
      (replace-regexp "[  \t]+$" "")
    )
  )
)
