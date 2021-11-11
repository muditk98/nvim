local o = vim.opt
local g = vim.g

o.termguicolors = true
o.confirm = true   -- Confirm changes on quit
o.showmatch = true -- Highlight matching brace
o.visualbell = true	-- Use visual bell (no beeping)

o.hlsearch = true	-- Highlight all search results
o.smartcase = true	-- Enable smart-case search
o.ignorecase = true	-- Always case-insensitive
o.incsearch = true	-- Searches for strings incrementally

o.autoindent = true -- Auto-indent new lines
o.expandtab = true	-- Use spaces instead of tabs
o.shiftwidth = 2	-- Number of auto-indent spaces
o.smartindent = true	-- Enable smart-indent
o.smarttab = true -- Enable smart-tabs
o.softtabstop = 2	-- Number of spaces per Tab
o.cursorline = true -- Highlight current line


-- o.tildeop     " ~ Tilde is an operator and must be followed by motions
o.showcmd = true     -- Show commands as they are being typed
o.scrolloff = 3   -- Minimum lines above/below cursor
o.sidescrolloff = 5 -- Minimum number of columns to scroll horizontally

o.hidden = true -- Buffers are active in background. Be careful of :q!

-- Natural splits
o.splitright = true
o.splitbelow = true
o.number = true  -- Show line numbers
o.relativenumber = true -- Show relative line numbers

g.indentLine_enabled = 0
