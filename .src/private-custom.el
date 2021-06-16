;; YAOLIUSAN -> YAOLIUYAO

(setq ic/up "imxx.top")

(setq ic/faces (list :frame 'max
                     :theme nil
                     :font (cons "Consolas" 120)))

(setq ic/package-load-alist '(("vterm" . nil)))

(setq ic/favorites '(("tasks.org"               "e:/home/notes/.src/000/tasks.org")
                     ("host: Github"            "https://github.com/yaoliuyao")
                     ("host/note: YaoliuYao"    "https://yaoliuyao.github.io")))

(setq org-directory "e:/home/notes/.src/"
      note-publish-directory "e:/home/notes/html/"
      org-agenda-notes (append
                        (file-expand-wildcards (expand-file-name "*/*.org" org-directory))
                        (file-expand-wildcards (expand-file-name "*/*/*.org" org-directory))))
(setq org-roam-directory "e:/home/notes/.src")

(setq org-babel-default-header-args:sql
      '((:engine . "mssql")
        (:dbuser . "sa")
        (:dbpassword . "sa")
        (:dbhost . "localhost")
        (:database . "oa")))

(defun-hook note-publish-post-hook (_)
  (let ((default-directory note-directory))
    (im/git-commit-and-push "best_try_and_best_chance")))

(>>init>>
 (global-set-key [f5] 'im/note-publish)
 (global-set-key [f9] 'im/shout-at-you)
 (global-set-key [f10] (lambda () (interactive) (im/shout-at-you 1)))

 (defun-hook org-mode-hook/roam-it ()
   ;;   (org-roam-mode 1)
   )
 )

(setq go-translate-token-current (cons 430675 2721866130))
(setq go-translate-base-url "https://translate.google.cn")


(defun im/shout-at-you (&optional arg)
  (interactive "P")
  (let* ((ss (list "有问题就问"
                   "请大家多敲多练"
                   "无他，唯手熟尔"
                   "有问题的举手提问"
                   "睡觉的醒醒了"))
         (st (cond ((use-region-p)
                    (buffer-substring-no-properties (region-beginning) (region-end)))
                   ((and arg (> arg 1))
                    (string-repeat "睡觉的醒醒了，" arg))
                   (arg (with-temp-buffer
                          (insert-file-contents "~/.token")
                          (buffer-substring-no-properties (point-min) (point-max))))
                   (t (nth (random (length ss)) ss))))
         (cmd (format "$w = New-Object -ComObject SAPI.SpVoice; $w.speak(\\\"%s\\\")" st)))
    (shell-command (format "powershell -Command \"& {%s}\""
                           (encode-coding-string
                            (replace-regexp-in-string "\n" " " cmd)
                            (keyboard-coding-system))))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(bbdb magit erc-hl-nicks org-noter-pdftools org-noter which-key ztree nnreddit nnhackernews omnisharp eglot embark-consult embark marginalia consult csproj-mode clojure-mode all-the-icons mpv udev-mode pyim rainbow-mode ssh-agency pdf-tools youdao-dictionary yaml-mode xterm-color websocket web-mode web-beautify vlf uuidgen use-package tide syntax-subword session selectrum-prescient scala-mode sbt-mode sass-mode robe rg rcirc-styles rainbow-delimiters powershell plantuml-mode page-break-lines ox-pandoc org-roam-server org-present org-plus-contrib ob-restclient oauth memory-usage markdown-toc lua-mode lsp-ui lsp-java kotlin-mode json-mode jdecomp htmlize hindent hide-mode-line groovy-mode graphviz-dot-mode gnuplot git-timemachine folding fold-this expand-region erlang engine-mode emms emmet-mode elpy elfeed-org dired-dups delight dante csharp-mode cquery company-web company-restclient company-posframe company-php company-math company-go company-ghc company-auctex c-eldoc attrap alchemist)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-meta-line ((t (:inherit nil :foreground "gainsboro")))))
