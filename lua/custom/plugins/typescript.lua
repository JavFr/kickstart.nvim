return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    config = function()
      require('typescript-tools').setup {
        on_attach = function(client, bufnr)
          -- Deshabilitar el formateo del LSP si usas otro formateador (como prettier)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        settings = {
          -- Servidor de diagnósticos separado para mejor rendimiento
          separate_diagnostic_server = true,
          -- Publicar diagnósticos al salir del modo insertar
          publish_diagnostic_on = 'insert_leave',
          -- Memoria máxima para tsserver (auto, o un número en MB)
          tsserver_max_memory = 'auto',
          -- Locale del servidor
          tsserver_locale = 'en',
          -- Completar llamadas a funciones con parámetros
          complete_function_calls = true,
          -- Incluir declaraciones de completado
          include_completions_with_insert_text = true,
          -- Code lens (off, implementations, references, all)
          code_lens = 'off',
          -- Preferencias del servidor TypeScript
          tsserver_file_preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
          -- Opciones de formato (si decides usarlo)
          tsserver_format_options = {
            allowIncompleteCompletions = false,
            allowRenameOfImportPath = false,
          },
        },
      }
    end,
  },
}
