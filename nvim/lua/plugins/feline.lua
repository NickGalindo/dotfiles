return {
  'freddiehaddad/feline.nvim',
  opts = {},
  config = function(_, opts)
    require('feline').setup()
    -- require('feline').winbar.setup()       -- to use winbar (OVERRIDE BY BUFFERS)
    -- require('feline').statuscolumn.setup() -- to use statuscolumn (DOESN"T WORK")
    
    -- require('feline').use_theme()          -- to use a custom theme (IDK WTF IS WRONG HERE)
  end
}
