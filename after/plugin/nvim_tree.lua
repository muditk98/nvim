local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5

require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	view = {},
})
