-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set('n', ',<Left>', '<C-W>l', { desc = 'Jump to left window' })

vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

return {
  {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  config = function ()
    require('neo-tree').setup {}
  end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "L", "<Cmd>BufferLineCycleNext<CR>", desc = "Go to next buffer" },
      { "H", "<Cmd>BufferLineCyclePrev<CR>", desc = "Go to prev buffer" },
      { "<leader>bf", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer like hop" },
      { "<leader>bF", "<Cmd>BufferLinePickClose<CR>", desc = "Pick buffer to close" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bmn", "<Cmd>BufferLineMoveNext<CR>", desc = "Mover buffer to next position" },
      { "<leader>bmp", "<Cmd>BufferLineMovePrev<CR>", desc = "Mover buffer to prev position" },
      { "<leader>bsd", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Sort buffers by directory" },
      { "<leader>bse", "<Cmd>BufferLineSortByExtension<CR>", desc = "Sort buffers by extension" },
      { "<leader>bsr", "<Cmd>BufferLineSortByRelativeDirectory<CR>", desc = "Sort buffers by relative directory" },
      { "<leader>bst", "<Cmd>BufferLineSortByTabs<CR>", desc = "Sort buffers by tabs" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        -- diagnostics_indicator = function(_, _, diag)
        --   local icons = require("lazyvim.config").icons.diagnostics
        --   local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        --     .. (diag.warning and icons.Warn .. diag.warning or "")
        --   return vim.trim(ret)
        -- end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
