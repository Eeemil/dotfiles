;;;;;; Eeemils emacs-config.
                                        ; Emil Marklund <eeemil@acc.umu.se>
                                        ; Initialized oct 2013.
                                        ;
					; The configuration is written in
					; org-mode. :)


;; Initialize installed packages
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/myplugins/netlogo-mode")
  
(require 'package)
(require 'cl)
;; Add repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;; Stop adding package-initialize to .emacs...
(setq package--init-file-ensured t)
(package-initialize)
  
;; Load the rest of the configuration via org-mode
(require 'org)

(org-babel-load-file "~/.emacs.d/configuration.org")
