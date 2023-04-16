local lsp = require("lspconfig")
util = require("lspconfig/util")
lsp.gopls.setup{
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "god.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
lsp.pyright.setup{
  
}
lsp.clangd.setup{

}
lsp.cmake.setup{

}
lsp.tsserver.setup{
  on_attach = on_attach
}

-- Turn off virtual text for diagnostics
vim.diagnostic.config({
  virtual_text = false,
})
