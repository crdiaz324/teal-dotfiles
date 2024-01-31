-- prevents  copying overwritten text into the default register
-- vim.opt.clipboard = ""

-- runs in the main init.lua, its meant to have vim options, globals, autocmds, commands, etc.
vim.opt.colorcolumn = "90"

-- Alwasy have 8 lines of text before the end of the screen
vim.o.scrolloff = 8 

-- Make realative line numbers default 
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Case insesitive searching UNLESS /C or capital in search
vim.o.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See ':help vim.highlight.on_yank()'
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function ()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

