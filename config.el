;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; load exwm
;(load "~/.doom.d/exwm")

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Nathan Touroux"
      user-mail-address "touroux.nathan@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)
(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 32)
      doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 32)
      doom-big-font (font-spec :family "Mononoki Nerd Font" :size 48))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/org/"
        org-image-actual-width '(500)
        org-hide-emphasis-markers t
        org-startup-with-inline-images t
        org-startup-with-latex-preview t
        org-export-with-toc t
        org-export-with-date nil
        org-babel-default-header-args
          (cons '(:noweb . "yes") (assq-delete-all :noweb org-babel-default-header-args))
        org-babel-default-header-args
          (cons '(:exports . "both") (assq-delete-all :exports org-babel-default-header-args))
        org-babel-default-header-args
          (cons '(:results . "output verbatim replace") (assq-delete-all :results org-babel-default-header-args))
        )
  )
(map! :leader
      :desc "Open ~/org/notes.org"
      "o n" #'(lambda () (interactive) (find-file "~/org/notes.org")))
(defun org-fold-all-done-entries ()
  "Close/fold all entries marked DONE."
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (while (outline-previous-heading)
      (when (org-entry-is-done-p)
        (hide-subtree)))))
(defun org-unfold-all-done-entries ()
  "Close/fold all entries marked DONE."
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (while (outline-previous-heading)
      (when (org-entry-is-done-p)
        (show-subtree)))))
(add-hook 'org-mode-hook #'org-fold-all-done-entries)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq confirm-kill-emacs nil)

;; haskell
(setq haskell-process-type 'stack-ghci)

;; rust
(after! rustic
  (setq rustic-lsp-server 'rls))

;; elisp
(map! :leader
      :desc "Evaluate elisp in buffer"
      "e b" #'eval-buffer
      :leader
      :desc "Evaluate defun"
      "e d" #'eval-defun
      :leader
      :desc "Evaluate elisp expression"
      "e e" #'eval-expression
      :leader
      :desc "Evaluate last sexpression"
      "e l" #'eval-last-sexp
      :leader
      :desc "Evaluate elisp in region"
      "e r" #'eval-region)

;; Line wrap
;(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)
(add-hook 'find-file-hook #'toggle-truncate-lines)

(use-package! ron-mode)
;(use-package! ox-twbs)


;; gnuplot
(autoload 'gnuplot-mode "gnuplot" "Gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)
(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))
