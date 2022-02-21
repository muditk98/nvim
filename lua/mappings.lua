local map = vim.api.nvim_set_keymap

local opts = {noremap = true}
-- vim.g.mapleader = "\\"
-- map("", "<Space>", "<Leader>", {noremap = true})
vim.cmd("map <Space> <Leader>")

-- map("v", "<", "<gv", {noremap = true})
-- map("v", ">", ">gv", {noremap = true})

-- Tab switch buffer
-- map("n", "<TAB>", ":bnext<CR>", {noremap = true})
-- map("n", "<S-TAB>", ":bprevious<CR>", {noremap = true})

-- Find files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "z=", "<cmd>Telescope spell_suggest<cr>", opts)
vim.cmd [[
  nmap s <Plug>Lightspeed_omni_s
]]

-- Resizing panes
-- map("n", "<Left>", ":vertical resize +1<CR>", opts)
-- map("n", "<Right>", ":vertical resize -1<CR>", opts)
-- map("n", "<Up>", ":resize -1<CR>", opts)
-- map("n", "<Down>", ":resize +1<CR>", opts)

-- Argwrap
map("n", "<leader>a", "<cmd>ArgWrap<cr>", opts)
