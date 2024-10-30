-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'toppair/peek.nvim',
  --   event = { 'VeryLazy' },
  --   build = 'deno task --quiet build:fast',
  --   config = function()
  --     require('peek').setup()
  --     vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
  --     vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  --   end,
  -- },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      -- where is iamcco?
      -- https://github.com/iamcco/markdown-preview.nvim/pull/691/commits/89e76bbf77b8994877098e0aeabbcb6a66f9ea74
      require('lazy').load { plugins = { 'markdown-preview.nvim' } }
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'shatur/neovim-ayu',
    priority = 1000,
    enabled = true,
    init = function()
      require('ayu').setup {
        mirage = true,
        overrides = {
          NormalFloat = { bg = '#374056' },
        },
      }
      vim.cmd.colorscheme 'ayu'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup()
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = { user_default_options = { names = false, css = true }, filetypes = { '*', cmp_docs = { always_update = true } } },
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    main = 'render-markdown',
    opts = {},
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
}
