(require 'package)
(setq package-archives
      '(("GNU ELPA" . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA" . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("MELPA" . 5)
        ("GNU ELPA" . 0)))
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)

(setq inhibit-splash-screen t)
(load-theme 'wombat)
(ido-mode)
(global-linum-mode)
(setq backup-inhibited t)
(setq make-backup-files nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq-default buffer-file-coding-system 'utf-8-unix)

(set-face-attribute 'default nil
                    :family "Inconsolata" :height 120)

; Highlight trailing whitespace
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 119)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; To make escaped characters work
(require 'iso-transl)

; VHDL
(setq vhdl-electric-mode 'nil);

; Rust
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(setq-default racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(defun my-verilog-hook ()
    (setq indent-tabs-mode nil)
    (setq tab-width 3))
(add-hook 'verilog-mode-hook 'my-verilog-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet gnu-elpa-keyring-update yaml-mode eglot lsp-mode lsp-rust json-mode magit company racer))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq standard-indent 2)

;; (require 'eglot)
;; (add-to-list 'eglot-server-programs
;;              '(vhdl-mode . ("/home/kraigher/repo/rust_hdl/target/debug/vhdl_ls")))

(require 'lsp-mode)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection "/home/kraigher/repo/rust_hdl/target/release/vhdl_ls")
                  :major-modes '(vhdl-mode)
                  :server-id 'vhdl-lsp))
(add-to-list 'lsp-language-id-configuration '(vhdl-mode . "vhdl-mode"))
(add-hook 'vhdl-mode-hook #'lsp)

(setq compilation-scroll-output 'first-error)
