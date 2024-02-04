local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  ensure_installed = {"c", "cpp", "python", "lua", "rust", "yaml", "json", "go", "gomod", "gosum", "gowork", "typescript", "javascript", "tsx"},
  sync_install = true,
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true
  }
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
