; Add your emacs packages to this list here, and have it auto installed on docker build
; (setq package-list '(magit gist markdown-mode))

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; start up with dracula theme
; (load-theme 'dracula t)
