return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    { "kkharji/sqlite.lua", module = "sqlite" },
  },
  config = function()
    require("telescope").setup()
    require("telescope").load_extension("neoclip")
    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = true,
      length_limit = 10048576,
      continuous_sync = true,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    })
  end,
}
