;;; package -- init
;;; Commentary:
;; Losts of stuff copy from https://github.com/purcell/emacs.d project.
;;
;;; Code:

;; -*- lexical-binding: t -*-

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;; Check Emacs version
(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.5")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; Add dir lisp to load-path - it contains more configuration module.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold (* 20 1024 1024))))

;; Bootstrap confign
;; (setq inhibit-startup-message t)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(require 'init-utils)
(require 'init-elpa)
(require 'init-common)
(require 'init-git)
(require 'init-ivy-swiper)
(require 'init-helm)
(require 'init-org)
(require 'init-keyset)

;; load custom file.
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
