vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options ---------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Keymaps ---------------------------------
-- Alias for conciseness
local map = vim.keymap.set

-- Disable arrow keys 
-- (Empty string "" matches normal, visual, select, and operator-pending modes, just like 'noremap')
map("", "<Up>", "<Nop>")
map("", "<Down>", "<Nop>")
map("", "<Left>", "<Nop>")
map("", "<Right>", "<Nop>")

-- navigate between buffers
map("", "<C-J>", "<C-W><C-J>")
map("", "<C-K>", "<C-W><C-K>")
map("", "<C-L>", "<C-W><C-L>")
map("", "<C-H>", "<C-W><C-H>")

-- Custom word motions
map("", "é", "w")
map("", "É", "W")

-- Operator-pending mappings ('o' mode equivalents for onoremap)
map("o", "aé", "aw")
map("o", "aÉ", "aW")
map("o", "ié", "iw")
map("o", "iÉ", "iW")

-- Custom directional motions
map("", "ê", "h")
map("", "w", "l")

-- Center screen on next/prev search
-- Note: In Neovim Lua, mappings are non-recursive (noremap) by default. 
-- Even though you used `nmap` (recursive) in Vimscript, making them non-recursive 
-- is best practice here unless you have other custom mappings for 'n' or 'z'.
map("n", "n", "nzz")
map("n", "N", "Nzz")

map("n", "<leader>es", vim.cmd.Ex)

map("n", "<leader>r", vim.lsp.buf.rename)
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation' })
