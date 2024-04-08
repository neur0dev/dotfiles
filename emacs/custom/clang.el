;; Garantir que o use-package esteja disponível
(require 'use-package)

;; Configuração do lsp-mode
(use-package lsp-mode
  :ensure t
  :hook (c-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-prefer-flymake nil) ; Prefira lsp-ui (flycheck) sobre flymake a menos que seja especificado
  (setq lsp-clients-clangd-args '("--header-insertion=never")))

;; Opcional: Configuração do lsp-ui para uma melhor experiência de UI com o lsp-mode
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-code-actions t))

;; Opcional: Configuração do company para auto-completação
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)) ;; Mostra sugestões imediatamente

;; Opcional: Integração do lsp-mode com o treemacs para uma visualização de árvore do projeto
(use-package lsp-treemacs
  :ensure t
  :after lsp)

;; Configuração adicional para melhorar a experiência com C/C++
(add-hook 'c-mode-hook (lambda ()
                         (setq c-basic-offset 4) ;; Define indentação para 4 espaços
                         (setq-default tab-width 4) ;; Define a largura do tab para 4 espaços
                         (setq-default c-default-style "linux") ;; Estilo de codificação
                         (electric-pair-mode 1))) ;; Auto-fechamento de parênteses e aspas

;; Garante que o lsp-mode seja iniciado automaticamente para C
(add-hook 'c-mode-hook #'lsp-deferred)
