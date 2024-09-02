-- buffers
local set = vim.keymap.set

-- set("n", "<leader>y", '<cmd>let @*=@"<cr>')

set("v", "<", "<gv")
set("v", ">", ">gv")
-- set('n', '<leader>a', '<cmd>ArgWrap<cr>')

set("n", "<S-TAB>", "<Cmd>bprev<CR>")
set("n", "<TAB>", "<Cmd>bnext<CR>")