return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'nvimdev/lspsaga.nvim',
  },
  cmd = {"LspInfo", "LspInstall", "LspUnInstall"},
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local lsp = require("lspconfig")
    local lsp_defaults = lsp.util.default_config

    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    local util = require("lspconfig/util")
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
      capabilities = capabilities,
    }
    lsp.pyright.setup{
      capabilities = capabilities,
    }
    lsp.clangd.setup{
      capabilities = capabilities,
    }
    lsp.cmake.setup{
      capabilities = capabilities,
    }
    lsp.ts_ls.setup{
      capabilities = capabilities,
      on_attach = on_attach
    }
    lsp.gopls.setup({
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })
    
    -- Turn off virtual text for diagnostics
    vim.diagnostic.config({
      virtual_text = false,
    })
  end
}
