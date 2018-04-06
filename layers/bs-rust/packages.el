;;; packages.el --- bs-rust layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Benn Sundsrud <benn.sundsrud@gmail.com>
;; URL: https://github.com/bsundsrud/dotspacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst bs-rust-packages
  '(flycheck-rust
    lsp-rust
    )
  )

(defun bs-rust/init-lsp-rust ()
  (with-eval-after-load 'lsp-mode
    (setq lsp-rust-rls-command '("rustup" "run" "stable" "rls"))
    (require 'lsp-rust)
    (add-hook 'rust-mode-hook #'lsp-rust-enable)))

(defun bs-rust/post-init-flycheck-rust ()
  (add-hook 'rust-mode-hook #'flycheck-mode))

(defun bs-rust/init-lsp-ui ()
  (use-package lsp-ui
    :defer t))
;;; packages.el ends here
