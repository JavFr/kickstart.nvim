-- For now, the idea is to not override the default kickstart configuration.
-- Hence, I should not call requier('telescope').setup

local utils = require 'custom.utils'

local telescope = require 'telescope'

local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>sf', function()
  builtin.find_files {
    cwd = utils.find_app_root(),
  }
end, { desc = '[s]earch [f]iles in proyect' })

vim.keymap.set('n', '<leader>sF', builtin.find_files, { desc = '[s]earch [F]iles in root' })

vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch selec[t] Telescope' })

vim.keymap.set('n', '<leader>ss', function()
  builtin.git_status {
    cwd = utils.find_app_root(),
  }
end, { desc = '[s]earch files by git [s]tatus in proyect' })

vim.keymap.set('n', '<leader>sS', builtin.git_status, { desc = '[s]earch files by git [S]tatus in root' })

return {}
