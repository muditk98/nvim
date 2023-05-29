vim.g.mapleader = " "
-- buffers
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>y", '<cmd>let @*=@"<cr>')
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>sb", "<cmd>SidebarNvimToggle<cr>", {})

-- telescope shit
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
	telescope_builtin.find_files({ find_command = { "fd", fname } })
end, {})
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>gs", telescope_builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>fr", telescope_builtin.resume, {})
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
vim.keymap.set("n", "<leader>lr", telescope_builtin.lsp_references, {})
vim.keymap.set("n", "<leader>ld", telescope_builtin.diagnostics, {})
vim.keymap.set("n", "<leader>li", telescope_builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>ldf", telescope_builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>ltd", telescope_builtin.lsp_type_definitions, {})

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeFocus<cr>", { silent = true, noremap = true })

-- lsp shit

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, opts)
	end,
})

-- Move to previous/next

map("n", "<S-TAB>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<TAB>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>w", "<Cmd>w<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- map("n", "<C-h>", "<Cmd>wincmd h<CR>", opts)
-- map("n", "<C-j>", "<Cmd>wincmd j<CR>", opts)
-- map("n", "<C-k>", "<Cmd>wincmd k<CR>", opts)
-- map("n", "<C-l>", "<Cmd>wincmd l<CR>", opts)

local modes = {
	"n",
	"t",
}

for key, value in pairs(modes) do
	map(value, "<C-\\>", "<Cmd>ToggleTerm direction=float<CR>", opts)
	map(value, "<C-j>", "<Cmd>ToggleTerm direction=horizontal<CR>", opts)
	map(value, "<C-`>", "<Cmd>ToggleTerm direction=vertical<CR>", opts)
end

map("n", "<leader>p", '"_dP', opts)
map("n", "<leader>qa", "<Cmd>qa<CR>", opts)
