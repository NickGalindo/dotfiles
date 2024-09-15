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
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", default_opts)
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", default_opts)
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble symbols toggle<cr>", default_opts)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", default_opts)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", default_opts)
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp toggle<cr>", default_opts)

-- Keymap the lspsaga
keymap("n", "<leader>rd", ":Lspsaga peek_definition<CR>", default_opts)
keymap("n", "<leader>rtd", ":Lspsaga peek_type_definition<CR>", default_opts)
keymap("n", "<leader>rgd", ":Lspsaga goto_definition<CR>", default_opts)
keymap("n", "<leader>rgtd", ":Lspsaga goto_type_definition<CR>", default_opts)
keymap("n", "<leader>rf", ":Lspsaga finder<CR>", default_opts)
keymap("n", "<leader>rr", ":Lspsakga rename<CR>", default_opts)

-- Telescope mappings
keymap("n", "<leader>ff", ":Telescope find_files<CR>", default_opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {desc="Live Grep"})
keymap("n", "<leader>fb", ":Telescope buffers<CR>", default_opts)
keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", default_opts)
keymap("n", "<leader>fu", ":Telescope undo<CR>", default_opts)
keymap("n", "<leader>fc", ":Telescope neoclip<CR>", default_opts)
