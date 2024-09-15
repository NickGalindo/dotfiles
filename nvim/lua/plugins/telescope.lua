return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-live-grep-args.nvim', version = "^1.0.0",},
    {'debugloop/telescope-undo.nvim'},
    {'AckslD/nvim-neoclip.lua'}
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({})
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("undo")
    require("telescope").load_extension("neoclip")
  end
}
