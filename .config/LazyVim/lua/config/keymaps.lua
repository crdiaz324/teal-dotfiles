-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable LSP
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- Use blackhole register for cw or C type commands
vim.keymap.set("n", "cw", '"_cw', { desc = "cw to blackhole register" })
vim.keymap.set("n", "c", '"_c', { desc = "cw to blackhole register" })
vim.keymap.set("n", "C", '"_C', { desc = "cw to blackhole register" })

-- initialize global var to false -> nvim-cmp turned off per default
vim.g.cmptoggle = false

local cmp = require("cmp")
cmp.setup({
  enabled = function()
    return vim.g.cmptoggle
  end,
})
vim.keymap.set("n", "<leader>ua", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "toggle nvim-cmp" })
