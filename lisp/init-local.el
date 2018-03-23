(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))

;;Wipe the entire line instead of just the line contents
(setq kill-whole-line t)

(require-package 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
;;; Print out the ascii-table in a new buffer
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder &lt;asc@bsiag.com&gt;"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d 0x%02x - %c\n" i i i))))
  (beginning-of-buffer))


(global-set-key [C-next] 'scroll-other-window)
(global-set-key [C-prior] 'scroll-other-window-down)

(defun scroll-both-down ()
  "Scroll both windows down"
  (interactive)
  (scroll-down)
  (scroll-other-window-down))
(defun scroll-both ()
  "Scroll both windows up"
  (interactive)
  (scroll-up)
  (scroll-other-window))

(global-set-key [C-S-next] `scroll-both)
(global-set-key [C-S-prior] `scroll-both-down)

;;I want top/bottom of the file not the line
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

;;Sometimes this key is not setup but I am not sure why not
(global-set-key [C-M-s] 'isearch-forward-regexp)

;;I have hit this key too many times
(global-unset-key "\C-x\C-c")
(global-unset-key "\C-z")
(global-unset-key "\C-c\C-c")
;;(global-set-key "\C-c\C-c" 'compile)

(global-set-key "\C-cg" 'goto-line)

(global-set-key [f1] 'woman)
(global-set-key [f3] 'rgrep)

(global-set-key [f9] 'recompile)

(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(setq scroll-margin 3)

;;
(require-package 'irfc)

(setq irfc-directory "~/Documents/rfc")
(setq irfc-assoc-mode t)

;; auto revert mode
(global-auto-revert-mode 1)
;; auto refresh dired when file changes
(add-hook 'dired-mode-hook 'auto-revert-mode)

(setq mouse-yank-at-point t)

(provide 'init-local)
;;; init-local ends here
