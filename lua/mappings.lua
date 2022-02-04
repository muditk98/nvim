local map = vim.api.nvim_set_keymap
-- vim.g.mapleader = "\\"
-- map("", "<Space>", "<Leader>", {noremap = true})
vim.cmd("map <Space> <Leader>")

-- map("v", "<", "<gv", {noremap = true})
-- map("v", ">", ">gv", {noremap = true})

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", {noremap = true})
map("n", "<S-TAB>", ":bprevious<CR>", {noremap = true})

-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
map("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", {noremap = true})
map("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", {noremap = true})
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap = true})
map("n", "z=", "<cmd>Telescope spell_suggest<cr>", {noremap = true})

-- Resizing panes
-- map("n", "<Left>", ":vertical resize +1<CR>", {noremap = true})
-- map("n", "<Right>", ":vertical resize -1<CR>", {noremap = true})
-- map("n", "<Up>", ":resize -1<CR>", {noremap = true})
-- map("n", "<Down>", ":resize +1<CR>", {noremap = true})
