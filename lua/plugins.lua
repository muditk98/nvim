local plugins = {
  "dstein64/vim-startuptime",
  -- THEMES
  "sainnhe/gruvbox-material",
  -- Loading early

  {
    "ggandor/leap.nvim",
    config = function ()
      require('leap').create_default_mappings()
    end,
    dependencies = { 'tpope/vim-repeat' }
  },

  -- TELESCOPE
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_C_COMPILER=gcc -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { 
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim",
  },
  {
    "romgrk/barbar.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released,
    enabled = false,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  {
    "tiagovla/scope.nvim",
  },
  {
    "kdheepak/lazygit.nvim",
    enabled = false,

  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = 'VeryLazy',
    enabled = false,
  },
  {
    "sidebar-nvim/sidebar.nvim",
    opts = {
        open = false,
        side = "right",
        hide_statusline = false,
        sections = {
          "symbols",
          "diagnostics",
          "buffers",
          "git",
        },
      },
      enabled = false,
  },
  "tpope/vim-fugitive",
  {
    "nvim-lualine/lualine.nvim",
  },
  { 
    "wellle/targets.vim",
    event = 'InsertEnter',
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- File type syntax
  {
    'krisajenkins/Cocoa-Strings', -- .strings
    event = 'BufEnter *.strings',
  },
  { 
    'martinda/Jenkinsfile-vim-syntax', -- Jenkinsfile
    event = 'BufEnter Jenkinsfile*',
  },
  {
    'FooSoft/vim-argwrap',
    event = 'InsertEnter',
  },
}

require("lazy").setup(plugins)
