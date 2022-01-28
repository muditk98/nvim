local map = vim.api.nvim_set_keymap
-- vim.g.mapleader = "\\"
-- map("", "<Space>", "<Leader>", {noremap = true})
vim.cmd("map <Space> <Leader>")

map("v", "<", "<gv", {noremap = true})
map("v", ">", ">gv", {noremap = true})

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", {noremap = true})
map("n", "<S-TAB>", ":bprevious<CR>", {noremap = true})

-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true})
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap = true})
