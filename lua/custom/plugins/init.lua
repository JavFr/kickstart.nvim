-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      opts = {
        keys = 'thsneoaiwfrupdclm,x'
      },
      keys = {
        { "ss", "<Cmd>HopChar1<CR>", desc = "HopChar1" },
        { "sh", "<Cmd>HopChar2<CR>", desc = "HopChar2" },
        { "st", "<Cmd>HopWord<CR>", desc = "HopWord" },
        { "sl", "<Cmd>HopLineStart<CR>", desc = "HopLineStart" },
        { "sL", "<Cmd>HopLine<CR>", desc = "HopLine" },
        { "f", "<Cmd>HopChar1CurrentLineAC<CR>", desc = "HopChar1CurrentLineAC" },
        { "F", "<Cmd>HopChar1CurrentLineBC<CR>", desc = "HopChar1CurrentLineBC" },
      }
  }
}
