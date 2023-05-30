local plugins = {
	-- THEMES
	{ "nyoom-engineering/oxocarbon.nvim", enable = false },
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		enabled = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"projekt0n/github-nvim-theme",
	},
	{
		"morhetz/gruvbox",
		config = function()
			vim.g.gruvbox_transparent_bg = 1
			vim.g.gruvbox_italic = 1
			vim.g.gruvbox_contrast_dark = "hard"
			vim.cmd("hi! link SignColumn  Normal")
		end,
	},
	{
		"sainnhe/gruvbox-material",
	},
	{
		"kvrohit/mellow.nvim",
	},
	{
		"olivercederborg/poimandres.nvim",
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
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
	{ "nvim-treesitter/nvim-treesitter" },

	-- LSP

	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
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
		"chriskempson/base16-vim",
		enabled = false,
		config = function() end,
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
	{
		"tpope/vim-fugitive",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},
	"ggandor/leap.nvim",
	"mg979/vim-visual-multi",
	"wellle/targets.vim",
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
}

require("lazy").setup(plugins)
