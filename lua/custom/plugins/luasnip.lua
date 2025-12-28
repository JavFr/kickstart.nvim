-- LuaSnip configuration for custom snippets
return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip'

    -- Load custom snippets from ~/.config/nvim/snippets/
    require('luasnip.loaders.from_lua').lazy_load { paths = vim.fn.stdpath 'config' .. '/snippets' }

    -- Keymaps for snippet navigation
    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true, desc = 'Expand snippet or jump to next placeholder' })

    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true, desc = 'Jump to previous placeholder' })
  end,
}
