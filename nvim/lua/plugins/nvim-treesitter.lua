return { 
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {"c", "cpp", "python", "lua", "rust", "yaml", "json", "go", "gomod", "gosum", "gowork", "typescript", "javascript", "tsx", "java", "xml"},
    highlight = {
      enable = true,
    },
    autotag = {
      enable = true
    }
  }
}
