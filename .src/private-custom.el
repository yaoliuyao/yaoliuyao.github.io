;; YAOLIUSAN -> YAOLIUYAO

(setq ic/gnus-mails-reciever
      '((nnimap "tmail"
                (nnimap-address "imap.qq.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnir-search-engine imap)
                (nnmail-expiry-target "nnimap+tmail:Deleted Messages")
                (nnmail-expiry-wait 'immediate)))

      ic/gnus-mails-sender
      `((".*"
         (name "yaoliuyao")
         (address "2132579340@qq.com"))))

(setq ic/up "imxx.top")

(setq ic/faces (list :frame 'max
                     :theme nil
                     :font (cons "Consolas" 120)
                     :font-unicode (cons "思源宋体 CN" 120)))

(setq lsp-headerline-arrow
      #(">" 0 1
        (face #1=(:family "Material Icons" :height 1.2 :inherit lsp-headerline-breadcrumb-separator-face)
              font-lock-face #1# display
              (raise 0)
              rear-nonsticky t)))

;;(setq-default left-fringe-width 20)

(setq ic/favorites '(("tasks.org"               "e:/home/notes/.src/000/tasks.org")
                     ("host: Github"            "https://github.com/yaoliuyao")
                     ("host/note: YaoliuYao"    "https://yaoliuyao.github.io")))

(setq org-directory "e:/home/notes/.src/"
      note-publish-directory "e:/home/notes/html/"
      org-roam-directory "e:/home/notes/.src"
      org-agenda-notes (append
                        (file-expand-wildcards (expand-file-name "*/*.org" org-directory))
                        (file-expand-wildcards (expand-file-name "*/*/*.org" org-directory))))

(setq org-babel-default-header-args:sql
      '((:engine . "mssql")
        (:dbuser . "sa")
        (:dbpassword . "sa")
        (:dbhost . "localhost")
        (:database . "oa")))

(with-over
 (require 'go-translate)
 (global-set-key [f5] 'gts-do-translate)
 (global-set-key [f8] 'im/note-publish)
 (global-set-key [f9] 'im/shout-at-you)
 (global-set-key [f10] (lambda () (interactive) (im/shout-at-you 1)))

 (setq gts-translate-list '(("en" "zh")))
 (setq gts-default-translator
       (gts-translator

        :picker
        ;;(gts-noprompt-picker)
        ;;(gts-noprompt-picker :texter (gts-whole-buffer-texter))

        (gts-prompt-picker)
        ;;(gts-prompt-picker :single t)
        ;;(gts-prompt-picker :texter (gts-current-or-selection-texter) :single t)

        :engines
        (list
         (gts-bing-engine)
         ;;(gts-google-engine)
         (gts-google-engine :parser (gts-google-summary-parser))
         (gts-google-rpc-engine)
         ;;(gts-deepl-engine :auth-key "2e20bade-88e9-02f3-169f-ab3c445d7984:fx" :pro nil)

         ;;(gts-google-engine :parser (gts-google-parser))
         ;;(gts-google-rpc-engine :parser (gts-google-rpc-summary-parser))
         )

        :render
        (gts-buffer-render)

        ;;(gts-posframe-pop-render)
        ;;(gts-posframe-pop-render :backcolor "#333333" :forecolor "#ffffff")

        ;;(gts-posframe-pin-render)
        ;;(gts-posframe-pin-render :position (cons 1200 20) :width 50 :height 18)
        ;;(gts-posframe-pin-render :width 80 :height 25 :position (cons 1000 20) :forecolor "#ffffff" :backcolor "#111111")

        ;;(gts-kill-ring-render)
        ))

 (define-key gts-prompt-for-translate-keymap [f5]
   (lambda () (interactive) (exit-minibuffer))))

(with-over
  (defun:hook note-publish-post-hook (_)
    (let ((default-directory note-directory))
      (im/git-commit-and-push "best_try_and_best_chance"))))

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
 '(custom-safe-themes
   '("1ca05bdae217adeb636e9bc5e84c8f1d045be2c8004fafd5337d141d9b67a96f" default))
 '(package-selected-packages
   '(kubernetes color-moccur hide-lines gruvbox-theme sis rime nano-theme pyim-basedict systemd modus-themes dockerfile-mode docker go-mode php-mode know-your-http-well auctex citre cape corfu keycast rainbow-mode blackout leaf-keywords leaf editorconfig org-roam-ui sql-indent android-mode sharper fsharp-mode eshell-outline cowsay poly-markdown poly-org polymode edit-indirect evil macrostep license-templates gitignore-templates org-contrib git-modes sx cmake-mode httprepl company-tabnine consult-eglot orderless vertico lsp-java tide lsp-ui lsp-treemacs dap-mode ace-window magit marginalia multi-line go-translate bbdb erc-hl-nicks org-noter-pdftools org-noter which-key ztree nnreddit omnisharp eglot embark-consult csproj-mode clojure-mode all-the-icons mpv udev-mode pyim ssh-agency yaml-mode xterm-color websocket web-mode web-beautify vlf uuidgen use-package syntax-subword session scala-mode sbt-mode sass-mode robe rg rcirc-styles rainbow-delimiters powershell plantuml-mode page-break-lines ox-pandoc org-roam-server org-present org-plus-contrib ob-restclient oauth memory-usage markdown-toc lua-mode kotlin-mode json-mode jdecomp htmlize hindent hide-mode-line groovy-mode graphviz-dot-mode gnuplot git-timemachine folding fold-this expand-region erlang engine-mode emms emmet-mode elpy elfeed-org dired-dups delight dante csharp-mode cquery company-web company-restclient company-posframe company-php company-math company-go company-ghc company-auctex c-eldoc attrap alchemist)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Courier New"))))
 '(markdown-pre-face ((t (:inherit markdown-code-face :extend t :background "light yellow" :foreground "midnight blue"))))
 '(org-meta-line ((t (:inherit nil :foreground "gainsboro")))))
