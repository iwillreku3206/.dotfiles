;; straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)
(setq package-enable-at-startup nil)

;(add-to-list 'package-archives
;             '("melpa" . "https://melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;(package-refresh-contents t)

;; Download Evil
(straight-use-package 'evil)

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4dcf06273c9f5f0e01cea95e5f71c3b6ee506f192d75ffda639d737964e2e14e"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader> fm") 'ranger)

;; ranger
(straight-use-package 'hydra)
(straight-use-package 'ranger)

(use-package ranger
  :straight t
  :config
  ;; Set ranger as the default handler when opening directories
  (setq ranger-override-dired t)
  
  ;; Optional: Activate ranger mode globally or on demand
  ;; (ranger-override-dired-mode t) 
  )

(setq use-file-dialog 'ranger)

;; theme
(straight-use-package
 '(tokyo-night
   :type git
   :host github
   :repo "rawleyfowler/tokyo-theme.el"
   :branch "main"))
(load-theme 'tokyo)

(straight-use-package 'lsp-mode)

(package-initialize)

;; lsp

(add-to-list 'lsp-language-id-configuration '(".*\\.svelte$" . "svelte"))
