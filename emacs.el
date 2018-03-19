(setq inhibit-splash-screen t)
(load-theme 'wombat)
(ido-mode)
(global-linum-mode)
(setq backup-inhibited t)
(setq make-backup-files nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Highlight trailing whitespace
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 119)
(global-whitespace-mode t)

; To make escaped characters work
(require 'iso-transl)

(setq vhdl-electric-mode 'nil);


(setq-default buffer-file-coding-system 'utf-8-unix)

(set-face-attribute 'default nil
                    :family "Inconsolata" :height 120)
