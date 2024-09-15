local function startup()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({"VimEnter"}, {callback = startup})
vim.cmd("colorscheme onedark_vivid")
