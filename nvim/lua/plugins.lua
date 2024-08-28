-- Automatically installs and sets up packer on the system
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerCompile", group = packer_group, pattern = "plugins.lua" }
)

-- Installs Packer on the System
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")

-- Function that returns the config path parameter for packer's config use
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({
  function(use)
    -- Basic packer install
    use ({ "wbthomason/packer.nvim" })
    -- One Dark color theme based on cool
    use ({
      "navarasu/onedark.nvim",
      config = get_setup("onedark"),
    })
    use({
      "nvim-tree/nvim-web-devicons",
      config = get_setup("nvim-web-devicons")
    })
    -- Treesitter install for neovim
    use ({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        vim.cmd("TSUpdate")
      end,
      config = get_setup("nvim-treesitter")
    })
    -- Feline is a status bar for neovim
    use ({
      "feline-nvim/feline.nvim",
      config = get_setup("feline")
    })
    -- Nvim tree install for file explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
      --tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = get_setup("nvim-tree")
    }
    -- Bufferline to view all active buffers
    use ({
      'akinsho/bufferline.nvim',
      tag = "v2.*",
      requires = 'nvim-tree/nvim-web-devicons',
      config = get_setup("bufferline")
    })
    -- Git decorators for neovim
    use({
      'lewis6991/gitsigns.nvim',
      config = get_setup("gitsigns")
    })
    -- Nvim notify package for pretty packages
    use({
      'rcarriga/nvim-notify',
      config = get_setup("nvim-notify")
    })
    --Nvim cmp package for autocompletion
    use ({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
        'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
        'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
        'f3fora/cmp-spell', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ'
      },
      config = get_setup("nvim-cmp")
    })
    -- LSP for nvim setup
    use ({
      'neovim/nvim-lspconfig',
      config = get_setup("nvim-lspconfig")
    })
    -- LSP saga to extend nvim functionality
    use({
      "nvimdev/lspsaga.nvim",
      after = "nvim-lspconfig",
      config = get_setup("lspsaga")
    })
    -- Trouble to blame diagnostics in adititional widnow
    use ({
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = get_setup("trouble")
    })
    use ({
      'nvim-telescope/telescope.nvim', tag = '0.1.6',-- or , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim', 'debugloop/telescope-undo.nvim', 'AckslD/nvim-neoclip.lua'} },
      config = get_setup("telescope")
    })
    use ({
      "windwp/nvim-autopairs",
      config = get_setup("nvim-autopairs")
    })
    use ({
      "norcalli/nvim-colorizer.lua",
      config = get_setup("nvim-colorizer")
    })
    use({
      "williamboman/mason.nvim",
      config = get_setup("mason")
    })
    --use ({
    --  "folke/which-key.nvim",
    --  config = get
    --})

    -- Markdown Preview
    -- use({
    --   "iamcco/markdown-preview.nvim",
    --   run = function() vim.fn["mkdp#util#install"]() end,
    --   config = get_setup("markdown-preview")
    -- })
    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })



    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1,
    },
  },
})
