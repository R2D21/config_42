(defgroup eruby-mode nil
  "Mode for eRuby template files"
  :group 'languages)

(defgroup eruby-mode-faces nil
  "Faces for highlighting eRuby template files"
  :prefix "eruby-mode-"
  :group 'eruby-mode-
  :group 'faces)

(defface eruby-standard-face
  '((t (:background "gray")))
  "Face used to highlight eRuby template snippets"
  :group 'eruby-mode-faces)

(defface eruby-comment-face
  '((t (:inherit font-lock-comment-face :background "gray")))
  "Face used to highlight eRuby template snippets"
  :group 'eruby-mode-faces)

(defvar eruby-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "%" 'eruby-mode-electric-percent)
    map)
    "Keymap for eRuby mode.")

(defun eruby-mode-electric-percent ()
  "Called when % is pressed."
  (interactive)
  (if (and electric-pair-mode
           (equal (char-before) ?<))
      (progn
        (insert "% %>")
        (backward-char 3))
    (insert "%")))

(defvar eruby-mode-font-lock-keywords
  '(("<%.*?%>" . '(0 'eruby-standard-face t))
    ("<%#.*?%>" . '(0 'eruby-comment-face t))))

;;; ###autoload
(define-minor-mode eruby-mode
  "Minor mode for eRuby templates"
  :lighter "ERB"
  :keymap eruby-mode-map
  (if eruby-mode
      (font-lock-add-keywords nil eruby-mode-font-lock-keywords)
    (font-lock-remove-keywords nil eruby-mode-font-lock-keywords)))

;;; ###autoload
(defconst eruby-mode-file-regexp "\\.erb\\'")

;;; ###autoload
(add-to-list 'auto-mode-alist `(,eruby-mode-file-regexp ignore t))

;; https://stackoverflow.com/questions/13945782/emacs-auto-minor-mode-based-on-extension
;;; ###autoload
(defun eruby-mode-auto-mode ()
  "Turn on eRuby mode for appropriate file extensions."
  (when buffer-file-name
    (when (string-match eruby-mode-file-regexp buffer-file-name)
      (eruby-mode 1))))

;;;###autoload
(add-hook 'find-file-hook #'eruby-mode-auto-mode)
