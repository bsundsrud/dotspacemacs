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
    lsp-mode
    lsp-rust
    )
  )

(defun bs-rust/init-lsp-rust ()
  (progn
    (with-eval-after-load 'lsp-mode
      (progn
        (add-hook 'rust-mode-hook #'lsp-rust-enable)
        (add-hook 'rust-mode-hook #'flycheck-mode)
        (use-package lsp-rust)))

    (setq lsp-rust-rls-command '("rustup" "run" "stable" "rls"))))

;;; packages.el ends here

