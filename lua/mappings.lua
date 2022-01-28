local map = vim.api.nvim_set_keymap
map("n", "<Space>", "<Leader>", {noremap = true})
vim.g.mapleader = "\\"

map("v", "<", "<gv", {noremap = true})
map("v", ">", ">gv", {noremap = true})

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", {noremap = true})
map("n", "<S-TAB>", ":bprevious<CR>", {noremap = true})
