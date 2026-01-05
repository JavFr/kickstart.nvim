local M = {}

function M.find_app_root()
  local current_file = vim.fn.expand '%:p:h'
  local root = vim.fs.dirname(
    -- Here I should add any other monorepo structure.
    -- toml, git, etc
    vim.fs.find({ 'package.json', 'project.json' }, {
      upward = true,
      path = current_file,
    })[1]
  )
  return root or vim.fn.getcwd()
end

function M.find_by_git_status() end

return M
