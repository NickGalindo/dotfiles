local nvim_tree = require("nvim-tree")
nvim_tree.setup({
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
})
