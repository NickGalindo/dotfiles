return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sort_by = "case_sensitive",
    view = {
      width = 25,
    },
    git = {
      ignore = false,
    },
    log = {
      types = {
        copy_paste = true
      },
    },
    renderer = {
      group_empty = true,
    },
  }
}
