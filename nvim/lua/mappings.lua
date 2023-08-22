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

-- Keymap to copy and paste from os cliboard quickly
keymap("n", "<leader>y", "\"+y", default_opts)
keymap("n", "<leader>Y", "\"+Y", default_opts)
keymap("n", "<leader>p", "\"+p", default_opts)
keymap("v", "<leader>y", "\"+y", default_opts)
keymap("v", "<leader>Y", "\"+Y", default_opts)
keymap("v", "<leader>p", "\"+p", default_opts)


-- Keymap the trouble shortcuts for diagnostics
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", default_opts)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", default_opts)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", default_opts)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", default_opts)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", default_opts)
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", default_opts)

-- Keymap the lspsaga
keymap("n", "<leader>gpd", ":Lspsaga peek_definition<CR>", default_opts)
keymap("n", "<leader>gptd", ":Lspsaga peek_type_definition<CR>", default_opts)
keymap("n", "<leader>gd", ":Lspsaga goto_definition", default_opts)
keymap("n", "<leader>gtd", ":Lspsaga goto_type_definition", default_opts)
keymap("n", "<leader>lf", ":Lspsage finder", default_opts)
