-- Map the leader from the '\' to the ','
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set additional keymappings
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Keymappings to change buffer focus with bufferline
keymap("n", "<leader>j", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "<leader>k", ":BufferLineCycleNext<CR>", default_opts)
-- Keymappings to change buffer order with bufferline
keymap("n", "<leader>h", ":BufferLineMovePrev<CR>", default_opts)
keymap("n", "<leader>l", ":BufferLineMoveNext<CR>", default_opts)

-- Keymapping to toggle nvim-tree explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", default_opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", default_opts)
keymap("n", "<leader>f", ":NvimTreeFindFile<CR>", default_opts)

-- Keymap kj to escape to leave insert mode quickly
keymap("i", "kj", "<ESC>", default_opts)
keymap("t", "kj", "<C-\\><C-n>", default_opts)

-- Keymap zz to save on normal mode
keymap("n", "zz", ":update<CR>", default_opts)

