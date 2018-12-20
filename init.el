;; Date:   2018/12/20
;; Author: 9m9

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives
      '(("gnu" . "http://elpa.emacs-china.org/gnu/")
	("melpa" . "http://elpa.emacs-china.org/melpa/")
	("marmalade" . "https://marmalade-repo.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (fuzzy auto-complete hl-sexp cnfonts rainbow-blocks rainbow-delimiters rainbow-delimiters-mode magit go-mode lispy use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package
  magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package
  lispy
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . lispy-mode))

(use-package
  rainbow-delimiters
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . rainbow-delimiters-mode))

(use-package
  rainbow-blocks
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . rainbow-blocks-mode))

(use-package
  hl-sexp
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . hl-sexp-mode))

(use-package
  go-mode
  :ensure t
  :mode "\\.go\\'")

(use-package
  cnfonts
  :ensure t
  :config (cnfonts-enable))

(use-package
  auto-complete
  :ensure t
  :hook ((prog-mode text-mode) . auto-complete-mode)
  :config (ac-config-default)
  (use-package fuzzy :ensure t)
  :bind (:map ac-mode-map
  	      ("C-<tab>" . auto-complete))
  :custom (ac-use-fuzzy t)
  (ac-use-menu-map t))

(defun 9m9/run-python ()
  (interactive)
  (save-buffer)
  (shell-command
   (format
    "python3 %s"
    (file-name-nondirectory
     buffer-file-name))))

(with-eval-after-load
    'python
  (define-key python-mode-map (kbd "<f5>")
    '9m9/run-python))

(define-key emacs-lisp-mode-map (kbd "C-c C-e")
  'eval-buffer)

(defun 9m9/open-init ()
  (interactive)
  (find-file
   "~/.emacs.d/init.el"))

(global-set-key
 (kbd "<f12>")
 '9m9/open-init)

(defun 9m9/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(global-set-key
 (kbd "C-c s")
 '9m9/switch-to-scratch)

(tool-bar-mode -233)
(menu-bar-mode -233)
(toggle-debug-on-error)
(column-number-mode 233)
;; (global-set-key (kbd "<f5>") (lambda () (interactive) (other-frame 1)))
;; (global-set-key (kbd "<f6>") (lambda () (interactive) (other-frame -1)))

(message (emacs-init-time))
