vim.o.termguicolors = true
vim.o.confirm = true   -- Confirm changes on quit
vim.o.showmatch	= true -- Highlight matching brace
vim.o.visualbell = true	-- Use visual bell (no beeping)

vim.o.hlsearch = true	-- Highlight all search results
vim.o.smartcase = true	-- Enable smart-case search
vim.o.ignorecase = true	-- Always case-insensitive
vim.o.incsearch = true	-- Searches for strings incrementally

vim.o.autoindent = true -- Auto-indent new lines
vim.o.expandtab = true	-- Use spaces instead of tabs
vim.o.shiftwidth = 2	-- Number of auto-indent spaces
vim.o.smartindent = true	-- Enable smart-indent
vim.o.smarttab = true -- Enable smart-tabs
vim.o.softtabstop = 2	-- Number of spaces per Tab


-- vim.o.tildeop     " ~ Tilde is an operator and must be followed by motions
vim.o.showcmd = true     -- Show commands as they are being typed
vim.o.scrolloff = 3   -- Minimum lines above/below cursor

vim.o.hidden = true -- Buffers are active in background. Be careful of :q!

-- Natural splits
vim.o.splitright = true
vim.o.splitbelow = true
-- vim.o.number = true  -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
