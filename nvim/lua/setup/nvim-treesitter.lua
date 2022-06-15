local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  ensure_installed = {"c", "cpp", "python", "lua", "rust", "yaml", "json"},
  sync_install = true,
  highlight = {
    enable = true,
  }
})
