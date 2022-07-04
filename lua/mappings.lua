local set = vim.keymap.set

-- vim.g.mapleader = '\\'
-- map('', '<Space>', '<Leader>', {noremap = true})
vim.cmd('map <Space> <Leader>')

set('v', '<', '<gv', {noremap = true})
set('v', '>', '>gv', {noremap = true})

-- Tab switch buffer
-- map('n', '<TAB>', ':bnext<CR>', {noremap = true})
-- map('n', '<S-TAB>', ':bprevious<CR>', {noremap = true})

-- Find files using Telescope command-line sugar.
set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set('n', '<leader>fl', '<cmd>Telescope live_grep<cr>')
set('n', '<leader>fg', '<cmd>Telescope grep_string<cr>')
set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
set('n', '<leader>fc', '<cmd>Telescope commands<cr>')
set('n', '<leader>fq', function() return require('telescope.builtin').quickfix{initial_mode='normal'} end)
set('n', 'z=', '<cmd>Telescope spell_suggest<cr>')
set('n', 's', '<Plug>Lightspeed_omni_s')
set('n', '<leader>c', '<cmd>let @*=@0<cr>') -- Copy "0 to system register

-- Argwrap
set('n', '<leader>a', '<cmd>ArgWrap<cr>')
