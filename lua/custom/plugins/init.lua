-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local function bc_divide()
  local expression = vim.fn.expand '<cWORD>'

  local command = 'echo "scale=2; ' .. expression .. '" | bc'

  local result = vim.fn.system(command):gsub('\n', '')

  vim.api.nvim_put({ result }, 'c', true, true)
end
vim.keymap.set('n', '<leader>cd', bc_divide, { desc = 'B[c] [d]ivide' })

return {
  -- 'navicore/bc.nvim', no lo necesito
}
