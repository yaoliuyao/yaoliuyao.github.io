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

(add-hook-fun note-publish-post-hook (_)
  (let ((default-directory note-directory))
    (im/git-commit-and-push "best_try_and_best_chance")))

(>>init>>
 (global-set-key [f5] 'im/note-publish)

 (add-hook-fun org-mode-hook/roam-it ()
   ;;   (org-roam-mode 1)
   )
 )

(setq go-translate-token-current (cons 430675 2721866130))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(udev-mode pyim rainbow-mode ssh-agency pdf-tools keypression which-key ztree youdao-dictionary yaml-mode xterm-color websocket web-mode web-beautify vterm vlf uuidgen use-package tide syntax-subword smart-mode-line session selectrum-prescient scala-mode sbt-mode sass-mode robe rg rcirc-styles rainbow-delimiters projectile powershell plantuml-mode page-break-lines ox-pandoc org-superstar org-roam-server org-present org-plus-contrib ob-restclient oauth memory-usage markdown-toc magit lua-mode lsp-ui lsp-java kotlin-mode key-chord json-mode jdecomp htmlize hindent hide-mode-line groovy-mode graphviz-dot-mode google-translate gnuplot git-timemachine folding fold-this expand-region erlang engine-mode emms emmet-mode elpy elfeed-org dired-dups delight dante ctrlf csharp-mode cquery company-web company-restclient company-posframe company-php company-org-roam company-math company-lsp company-go company-ghc company-auctex clojure-mode c-eldoc attrap amx all-the-icons alchemist)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
