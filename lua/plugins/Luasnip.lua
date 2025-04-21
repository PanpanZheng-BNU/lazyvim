return {
  { "benfowler/telescope-luasnip.nvim" },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })
      require("telescope").setup()
      local ls = require("luasnip")
      ls.setup({
        update_events = { "TextChanged", "TextChangedI" },
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      })
      vim.keymap.set({ "i" }, "<C-k>", function()
        ls.expand()
      end, { silent = true, desc = "expand autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        ls.jump(1)
      end, { silent = true, desc = "next autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        ls.jump(-1)
      end, { silent = true, desc = "previous autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true, desc = "select autocomplete" })

      require("telescope").load_extension("luasnip")
    end,
  },

  -- { "evesdropper/luasnip-latex-snippets.nvim" },
}
