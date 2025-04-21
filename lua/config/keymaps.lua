-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

local luasnip = require("luasnip")
-- vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
-- })
-- vim.g.copilot_no_tab_map = true

-- nmap
map("n", "<space>e", ":NvimTreeToggle<CR>", { desc = "open file tree" })
map("n", ";q", ":q<CR>", { desc = "quick quit" })
map("n", ";wq", ":wq<CR>:", { desc = "quick write and quit" })
map({ "n", "v" }, "Y", '"+y', { desc = "quick Yank to systems clipboard" })
map("n", "<space>p", ":Telescope neoclip<CR>", { desc = "quick find clipboard", silent = true })
map("n", "<space>ls", ":Telescope luasnip<CR>", { desc = "quick open luasnip", silent = true })
map("n", "<space>nh", ":nohl<CR>", { desc = "Cancel the highlight" })
map("n", ",f", "<Esc>/<++><CR>:nohlsearch<CR>v3l<c-g>", { desc = "find next label position" })
map("n", ",F", "<Esc>?<++><CR>n:nohlsearch<CR>v3l<c-g>", { desc = "find next label position" })
map("n", "<space>s", "<C-w>s", { desc = "split windows horizontally" })
map("n", "<space>v", "<C-w>v", { desc = "split windows vertically" })
map("n", "<space>as", ":Autosave toggle<CR>", { desc = "Autosave toggle" })
map({ "n", "v" }, "<localleader>r", ":SnipRun<CR>", { desc = "run" })

map("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "move to down" })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "move to up" })
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "move to left" })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "move to right" })

-- vmap
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- imap
map("i", "jk", "<Esc>", { desc = "quick exit insert mode" })

local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  group = augroup,
  desc = "Create label",
  command = "inoremap <buffer> <silent> ,, <++>",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  group = augroup,
  desc = "Find next label",
  command = "inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>v3l<c-g>",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  group = augroup,
  desc = "Find last label",
  command = "inoremap <buffer> <silent> ,F <Esc>?<++><CR>:nohlsearch<CR>v3l<c-g>",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  group = augroup,
  desc = "Create a block math demo",
  command = "inoremap <buffer> <silent> ,m $$<++>$$<++><Esc>9hv3l<c-g>",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  group = augroup,
  desc = "Paste Image",
  command = "nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i",
})
