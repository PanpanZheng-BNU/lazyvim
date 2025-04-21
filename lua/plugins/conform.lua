return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black", "isort" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  require("conform").setup({
    formatters = {
      runic = {
        command = "julia",
        args = { "--project=@runic", "-e", "using Runic; exit(Runic.main(ARGS))" },
      },
    },
    formatters_by_ft = {
      julia = { "runic" },
    },
    default_format_opts = {
      -- Increase the timeout in case Runic needs to precompile
      -- (e.g. after upgrading Julia and/or Runic).
      timeout_ms = 10000,
    },
  }),
}
