local lsp = require("lsp-zero").preset({
	name = "recommended",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = true,
})

local null_ls = require("null-ls")
-- vim.cmd([[autocmd BufWritePre * NullFormat]-])

lsp.ensure_installed({
	-- JS Crap
	"graphql",
	"html",
	"eslint",
	"cssls",
	"cssmodules_ls",
	-- Others
	"lua_ls",
	"pyright",
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

null_ls.setup({
	on_attach = function(client, bufnr)
		local format_cmd = function(input)
			vim.lsp.buf.format({
				id = client.id,
				timeout_ms = 5000,
				async = input.bang,
			})
		end

		local bufcmd = vim.api.nvim_buf_create_user_command
		bufcmd(bufnr, "NullFormat", format_cmd, {
			bang = true,
			range = true,
			desc = "Format using null-ls",
		})

		vim.keymap.set("n", "<leader>fs", "<cmd>NullFormat!<cr>", { buffer = bufnr })
	end,
	sources = {
		-- You can add tools not supported by mason.nvim

		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.prismaFmt,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.fish_indent,
	},
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = { "prettierd", "eslint" },
	automatic_installation = true, -- You can still set this to `true`
	automatic_setup = true,
})

-- Required when `automatic_setup` is true
-- require("mason-null-ls").setup_handlers()

local cmp = require("cmp")
cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
	},
})

lsp.setup()
