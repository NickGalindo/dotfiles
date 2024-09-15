return { 
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  main = "nvim-treesitter.configs",
  dependencies = {
    {'nvim-treesitter/nvim-treesitter-textobjects'}
  },
  lazy = false,
  version = false,
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
