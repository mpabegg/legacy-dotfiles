(windmove-default-keybindings)

(defun frame-bck()
  (interactive)
  (other-window -1)
)
(define-key (current-global-map) (kbd "M-o") 'other-window)
(define-key (current-global-map) (kbd "M-O") 'frame-bck)

; Add a final newline on save if there isn't already one there
(setq require-final-newline t)


; End matlab function with the end keyword
(setq matlab-functions-have-end t)


;; Set the user directory - hardcoded because otherwise Aquamacs sets
;; it to ~/Library/Prefereces/Aquamacs Emacs/ and thus breaking package
;; loading from this script.
(setq user-emacs-directory "~/.emacs.d/")

;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another 
;; package (Gnus, auth-source, ...).
(load-file "~/.emacs.d/vendor/cedet/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
(semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(matlab-functions-have-end t)
 '(matlab-indent-function-body t)
 '(matlab-highlight-cross-function-variables t)
 '(matlab-shell-command "matlab")
 '(matlab-shell-command-switches (quote ("-nodesktop -nosplash -nojvm")))
 '(matlab-show-mlint-warnings t)
)

;; Prepend common directories to PATH - possibly adding duplicates but no
;; way around that.
(setenv "PATH" (concat (getenv "HOME") "/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:" (getenv "PATH")))

;; Add marmalade package archive
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Show menu bar - after package-initialize because starter-kit disables it
(menu-bar-mode 1)

;; Set return to a better behavior
(global-set-key (kbd "RET") 'newline-and-indent)

;; Start the server for emacsclient
(load "server")
(unless (server-running-p) (server-start))

;; Initialize matlab-emacs mode
(add-to-list 'load-path "~/.emacs.d/vendor/matlab-emacs")
(load-library "matlab-load")

;; Enable CEDET feature support for MATLAB code
(matlab-cedet-setup)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
