local plugins = {
  "dstein64/vim-startuptime",
  -- THEMES
  "sainnhe/gruvbox-material",
  -- Loading early

  {
    "ggandor/leap.nvim",
    config = function ()
      require('leap').add_default_mappings()
    end,
    dependencies = { 'tpope/vim-repeat' }
  },

  -- TELESCOPE
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  "nvim-treesitter/nvim-treesitter",

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  },
  {
    "romgrk/barbar.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "tiagovla/scope.nvim",
  },
  {
    "kdheepak/lazygit.nvim",
    init = function() end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = {},
  },
  {
    "sidebar-nvim/sidebar.nvim",
    config = function()
      require("sidebar-nvim").setup({
        open = false,
        side = "right",
        hide_statusline = false,
        sections = {
          "symbols",
          "diagnostics",
          "buffers",
          "git",
        },
      })
    end,
  },
  "tpope/vim-fugitive",
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },
  "wellle/targets.vim",
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- File type syntax
  'krisajenkins/Cocoa-Strings', -- .strings
  'martinda/Jenkinsfile-vim-syntax', -- Jenkinsfile
  'FooSoft/vim-argwrap'
}

require("lazy").setup(plugins)
