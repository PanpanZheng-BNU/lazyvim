return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        -- "markdown",
        -- "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "julia",
      },
    },
  },
  require("nvim-treesitter.configs").setup({
    -- ensure_installed = { "markdown" },
    highlight = {
      enable = true,
      disable = { "latex" },
      additional_vim_regex_highlighting = { "latex", "markdown" },
    },
    --other treesitter settings
  }),
}
