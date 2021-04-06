((nil
  (user-full-name . "yaoliuyao.net")
  (org-html-head-include-default-style . nil)
  (org-html-htmlize-output-type . inline-css)
  (org-publish-sitemap-custom-function . org-publish-sitemap-2)
  (org-html-head . "<link rel='stylesheet' href='/html/asset/common.css?3344' />
<link rel='stylesheet' href='/yaoliuyao/html/asset/common.css?3344' />
<script src='https://cdn.bootcss.com/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script src='/html/asset/common.js'></script>
<script src='/yaoliuyao/html/asset/common.js'></script>\n")
  (eval . (setq-local org-publish-project-alist
                      `(("_notes_yao63"
                         :base-directory "."
                         :base-extension "org"
                         :exclude "^\\(\\.\\|x\\.\\).*"
                         :publishing-directory "../html/"
                         :publishing-function org-html-publish-to-html
                         :recursive t
                         :headline-levels 5
                         :with-toc 5
                         :author "悟饭"
                         :html-metadata-timestamp-format "%Y-%m-%d"
                         :html-preamble t
                         :auto-sitemap t
                         :sitemap-filename ".sitemap.org")
                        ("_assets"
                         :base-directory "."
                         :base-extension "css\\|js\\|png\\|jpe?g\\|gif\\|svg\\|pdf\\|zip\\|html\\|txt\\|jar\\|mp4\\|rar\\|doc\\|pptx"
                         :exclude "^\\(\\.\\|x\\.\\).*"
                         :publishing-directory "../html/"
                         :publishing-function org-publish-attachment
                         :recursive t)
                        ("nnn" :components
                         ("_assets" "_notes_yao63")))))))
