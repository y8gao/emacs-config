;; open init file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun modify-syntax-table-for-underscore()
  (modify-syntax-entry ?_ "w"))

(provide 'setup-helper)
