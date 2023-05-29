require("nvim-treesitter.configs").setup({
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"c",
		"cpp",
		"css",
		"dockerfile",
		"fish",
		"html",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"kotlin",
		"lua",
		"luadoc",
		"make",
		"markdown_inline",
		"python",
		"ruby",
		"swift",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
