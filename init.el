
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; (global-set-key (kbd "<f5>") (lambda () (interactive) (other-frame 1)))
;; (global-set-key (kbd "<f6>") (lambda () (interactive) (other-frame -1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit go-mode lispy use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)))

(use-package lispy
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . lispy-mode))

(use-package go-mode
  :ensure t
  :config
  ;; (autoload 'go-mode "go-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))

(defun 9m9/open-init ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f12>") '9m9/open-init)

(tool-bar-mode -1)
(menu-bar-mode -1)
