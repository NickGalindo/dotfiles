return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimdev/lspsaga.nvim",
  },
  cmd = { "LspInfo", "LspInstall", "LspUnInstall" },
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    -- 1) Capabilities (replacement for lsp.util.default_config.capabilities edits)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    -- 2) Optional: a modern on_attach using LspAttach (recommended pattern in 0.11)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        -- Example mappings (customize as you like)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
      end,
    })

    -- 3) If you use mason for installation, keep it; but LSP enabling is now vim.lsp.enable()
    require("mason").setup()

    -- Keep using mason-lspconfig for ensuring servers are installed
    require("mason-lspconfig").setup({
      ensure_installed = { "gopls", "pyright", "clangd", "cmake", "ts_ls" },
      automatic_installation = true,
    })

    -- 4) Configure servers via vim.lsp.config()
    -- NOTE: nvim-lspconfig still provides the base configs; vim.lsp.config merges your overrides. :contentReference[oaicite:2]{index=2}

    vim.lsp.config("gopls", {
      cmd = { "gopls", "serve" },
      filetypes = { "go", "gomod" },
      root_markers = { "go.work", "go.mod", ".git" }, -- (fix: go.mod)
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
          gofumpt = true,
        },
      },
      capabilities = capabilities,
    })

    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })

    vim.lsp.config("clangd", {
      capabilities = capabilities,
    })

    vim.lsp.config("cmake", {
      capabilities = capabilities,
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      -- Optional but often helpful:
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    })

    -- 5) Enable (this replaces every .setup{} call)
    vim.lsp.enable({ "gopls", "pyright", "clangd", "cmake", "ts_ls" }) -- :contentReference[oaicite:3]{index=3}

    -- 6) Diagnostics UI (unchanged)
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
