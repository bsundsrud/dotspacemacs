;;; funcs.el - functions used by bs-org

(defun bs-org/join-url-path (base issue)
  (if (string-suffix-p "/" base)
      (concat base issue)
    (concat base "/" issue)))

(defun bs-org/jira-link (issue)
  (format "[[%s][%s]]" (bs-org/join-url-path bs-org/jira-base-url issue) issue))

(defun bs-org/jira-link-command (begin end)
  "Insert an org-mode jira issue link at the current cursor or region"
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (point) (point))))
  (let ((issue (read-string "Issue Key: ")))
    (save-excursion
      (if (not (eq begin end))
          (delete-region begin end))
      (goto-char begin)
      (insert (bs-org/jira-link issue)))))
;;; funcs.el end
