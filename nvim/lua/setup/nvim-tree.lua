local nvim_tree = require("nvim-tree")
nvim_tree.setup({
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
})
