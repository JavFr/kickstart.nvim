return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tsserver = {
          enabled = false,
        },
        ts_ls = {
          enabled = false,
        },
        vtsls = {
          filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.jsx',
          },
          settings = {
            complete_functions_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLenght = 30,
                completion = {
                  enableServiceSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = 'always' },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = 'literals' },
                parameterTypes = { enabled = true },
                proportyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
          -- keys = {}
          setup = {
            --- @deprecated -- tsserver renamed to ts_ls but not yet released, so keep this for now
            --- the proper approach is to check the nvim-lspconfig release version when it's released to determine the server name dynamically
            tsserver = function()
              -- disable tsserver
              return true
            end,
            ts_ls = function()
              -- disable tsserver
              return true
            end,
            vtsls = function(_, opts)
              if vim.lsp.config.denols and vim.lsp.config.vtsls then
                ---@param server string
                local resolve = function(server)
                  local markers, root_dir = vim.lsp.config[server].root_markers, vim.lsp.config[server].root_dir
                  vim.lsp.config(server, {
                    root_dir = function(bufnr, on_dir)
                      local is_deno = vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc' }) ~= nil
                      if is_deno == (server == 'denols') then
                        if root_dir then
                          return root_dir(bufnr, on_dir)
                        elseif type(markers) == 'table' then
                          local root = vim.fs.root(bufnr, markers)
                          return root and on_dir(root)
                        end
                      end
                    end,
                  })
                end
                resolve 'denols'
                resolve 'vtsls'
              end
            end,
          },
        },
      },
    },
  },
}
