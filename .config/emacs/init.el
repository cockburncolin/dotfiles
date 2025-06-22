(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-modes
   '(tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode))
 '(package-selected-packages
   '(aggressive-indent auctex avy clojure-ts-mode company-c-headers
		       dashboard dirvish doom-modeline dracula-theme
		       evil-collection evil-numbers evil-tutor general
		       golden-ratio jinx magit neotree nix-ts-mode
		       orderless popper projectile racket-mode
		       rainbow-delimiters rainbow-mode toc-org
		       tree-sitter-langs treesit-auto use-package
		       vertico vertico-posframe vterm which-key
		       yasnippet yuck-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
