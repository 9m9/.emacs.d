;;; package -- Summary
;;; Commentary:

;; Date:   2018/12/20
;; Author: 9m9


;;; Code:

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
    (xkcd writeroom-mode go-playground ac-c-headers expand-region ggtags delight flycheck-popup-tip flycheck-irony irony-eldoc irony irony-mode sr-speedbar counsel tabbar-ruler powerline delight-powerline tabbar yasnippet-snippets yasnippet exec-path-from-shell flycheck go-eldoc fuzzy auto-complete hl-sexp cnfonts rainbow-blocks rainbow-delimiters rainbow-delimiters-mode magit go-mode lispy use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default use-package-verbose t)
(add-to-list 'load-path "~/.emacs.d/packages")
;; (require 'xub-mode)

;; (add-to-list 'load-path "~/.emacs.d/packages/mode-icons/")
;; (require 'mode-icons)
;; (mode-icons-mode)

(use-package
  powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package
  delight
  :ensure t
  :config
  (require 'delight-powerline))

(delight '((emacs-lisp-mode "el" :major)
	   (fundamental-mode "F" :major)
	   (abbrev-mode " abrev" abbrev)))

(use-package
  exec-path-from-shell
  :ensure t
  :config (when (memq
		 window-system
		 '(mac ns x))
	    (exec-path-from-shell-initialize)))

(use-package
  magit
  :ensure t
  ;; :delight (magit-status-mode "MA")
  :bind (("C-x g" . magit-status)))

(use-package
  lispy
  ;; dependency package: swiper, ivy, hydra, ace-window
  :ensure t
  :delight
  :hook ((emacs-lisp-mode lisp-mode) . lispy-mode)
  :config
  (ivy-mode 233)
  ;; (ace-window-display-mode)
  :bind
  (("C-s" . swiper)
   ;; ("M-]" . ace-window)
   )
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (aw-dispatch-alist
   '((?x aw-delete-window "Delete Window")
     (?m aw-swap-window "Swap Windows")
     (?M aw-move-window "Move Window")
     (?j aw-switch-buffer-in-window "Select Buffer")
     (?n aw-flip-window)
     (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
     (?c aw-split-window-fair "Split Fair Window")
     (?v aw-split-window-vert "Split Vert Window")
     (?b aw-split-window-horz "Split Horz Window")
     (?o delete-other-windows "Delete Other Windows")
     (?? aw-show-dispatch-help))))

(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("<f2> f" . counsel-describe-function)
   ("<f2> v" . counsel-describe-variable)
   ("C-c k" . counsel-ag)))

(use-package
  rainbow-delimiters
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . rainbow-delimiters-mode))

(use-package
  rainbow-blocks
  :ensure t
  :delight
  :hook ((emacs-lisp-mode lisp-mode) . rainbow-blocks-mode))

(use-package
  hl-sexp
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . hl-sexp-mode))

(add-to-list 'load-path "~/.emacs.d/packages/gocode/")
(require 'go-autocomplete)

(use-package
  go-mode
  :ensure t
  :mode "\\.go\\'"
  :config
  (setq godoc-at-point-function 'godoc-gogetdoc)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports")
  :bind (:map go-mode-map
	      ("<f2> f" . godoc-at-point)
	      ("<f2> d" . godoc)))

(setq exec-path (append exec-path '("~/go/bin")))

(use-package
  go-eldoc
  :ensure t
  :hook (go-mode . go-eldoc-setup))

(use-package go-playground
  :ensure t)

;; https://www.flycheck.org/en/latest/languages.html#flycheck-languages

(use-package
  flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (use-package
    flycheck-popup-tip
    :ensure t
    :hook ((flycheck-mode) . flycheck-popup-tip-mode)))

(use-package
  yasnippet
  :ensure t
  :init (yas-global-mode 1)
  ;; :delight (yas-minor-mode " yas")
  :config
  (use-package
    yasnippet-snippets
    :ensure t))

;; (use-package
;;   tabbar
;;   :ensure t
;;   :init (tabbar-mode t)
;;   :config
;;   (use-package
;;     tabbar-ruler
;;     :ensure t
;;     :bind (("C-c t" . tabbar-ruler-move))
;;     :init
;;     (setq tabbar-ruler-global-tabbar t
;; 	  tabbar-ruler-global-ruler t)))

(use-package
  cnfonts
  :ensure t
  :config (cnfonts-enable))

(use-package
  auto-complete
  :ensure t
  :init (global-auto-complete-mode)
  :config (ac-config-default)
  (use-package fuzzy :ensure t)
  (use-package ac-c-headers :ensure t)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-header-symbols t)
  :bind (:map ac-mode-map
  	      ("C-<tab>" . auto-complete))
  :custom (ac-use-fuzzy t)
  (ac-use-menu-map t))

(use-package
  ggtags
  :ensure t
  :hook ((prog-mode c++-mode c-mode) . ggtags-mode)
  :bind
  (("C-c g c" . ggtags-create-tags)
   ("C-c g s" . ggtags-find-other-symbol)
   ("C-c g h" . ggtags-view-tag-history)
   ("C-c g r" . ggtags-find-reference)
   ("C-c g f" . ggtags-find-file)
   ("C-c g u" . ggtags-update-tags)))

(use-package
  sr-speedbar
  :ensure t
  :bind
  (("<f5>" . sr-speedbar-toggle)))

(use-package
  irony
  :ensure t
  :hook ((c-mode c++-mode) . irony-mode)
  ((irony-mode) . irony-cdb-autosetup-compile-options)
  :config
  (use-package
    irony-eldoc
    :ensure t
    :hook ((irony-mode) . irony-eldoc))
  (use-package
    flycheck-irony
    :ensure t))

(use-package
  expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(defun 9m9/run-python ()
  "Run python script using shortcut."
  (Interactive)
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
  "Open init.el file."
  (interactive)
  (find-file
   "~/.emacs.d/init.el"))

(global-set-key
 (kbd "<f12>")
 '9m9/open-init)

(defun 9m9/switch-to-scratch ()
  "Switch to *scratch* buffer."
  (interactive)
  (switch-to-buffer "*scratch*"))

(global-set-key
 (kbd "C-c s")
 '9m9/switch-to-scratch)

(tool-bar-mode -233)
(menu-bar-mode -233)
;; (toggle-debug-on-error)
(column-number-mode 233)
;; (global-set-key (kbd "<f5>") (lambda () (interactive) (other-frame 1)))
;; (global-set-key (kbd "<f6>") (lambda () (interactive) (other-frame -1)))

(message (emacs-init-time))

;;; init.el ends here
