local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- vim.o.background = "light"
-- Neovide shit
if vim.g.neovide then
  vim.g.neovide_input_macos_option_key_is_meta = "both"
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h18"
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_animation_length = 0.08

  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y')    -- Copy
  vim.keymap.set('n', '<D-v>', '"+P')    -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')    -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<C-R>+') -- Paste insert mode
end
-- vim.opt.hX = 2

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- easy to reach leader key
vim.cmd("set clipboard=unnamed")
vim.cmd("set signcolumn=yes:1")

vim.opt.timeoutlen = 2000
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.confirm = true -- Confirm changes on quit
vim.opt.showmatch = true -- Highlight matching brace

vim.opt.laststatus = 0

-- vim.opt.fillchars = { eob = " " }
vim.opt.listchars = "tab:▸ ,multispace:·,lead: ,trail:·,nbsp:␣,extends:›,precedes:‹"
vim.opt.list = true
vim.opt.showbreak = "↪"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = "a"

vim.diagnostic.config({
  virtual_text = true,
  float = {
    source = "always",
  },
})
vim.o.termguicolors = true

require("mappings")

vim.cmd("au BufNewFile,BufRead Podfile,*.podspec setlocal filetype=ruby")

-- Highlight on yank
vim.cmd([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]])

-- Set number in insert and hybrid in normal
vim.cmd([[
augroup numbertoggle
autocmd!
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]])

local isNotVscode = function()
  return not vim.g.vscode
end

require("lazy").setup({
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        options = {
          cursorline = false, -- Use cursorline highlighting?
          transparency = true, -- Use a transparent background?
          terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
          lualine_transparency = false, -- Center bar transparency?
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        },
      })
      vim.cmd("colorscheme onedark")
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    cond = isNotVscode,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "nvim-lua/plenary.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "j-hui/fidget.nvim",
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(_client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "lua_ls",
          "tsserver",
          "tailwindcss",
          "cssls",
          "cssmodules_ls",
          "graphql",
          "marksman",
          "rust_analyzer",
          "jsonls",
          "sqlls",
          "yamlls",
          "pyright",
          "svelte",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })

      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      local format_options = {
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ["null-ls"] = {
            "javascript",
            "typescriptreact",
            "javascriptreact",
            "html",
            "jade",
            "markdown",
            "typescript",
            "css",
            "less",
            "scss",
            "json",
            "lua",
            "pug",
            "handlebars",
          },
        },
      }

      -- lsp_zero.format_on_save(format_options)
      -- lsp_zero.format_mapping("<F5>", format_options)

      cmp.setup({
        preselect = "item",
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),

          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(),
          -- Navigate between snippet placeholder
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
      })

      lsp_zero.setup({})

      local null_ls = require("null-ls")
      local null_opts = lsp_zero.build_options("null-ls", {})

      null_ls.setup({
        on_attach = function(client, bufnr)
          null_opts.on_attach(client, bufnr)
          ---
          -- you can add other stuff here....
          ---
        end,
        sources = {
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.diagnostics.eslint,
          -- Replace these with the tools you have installed
          null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.formatting.stylua,
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
        automatic_setup = true,
      })

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end

      require("lspconfig").tsserver.setup({
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
          },
        },
      })
      require("lspconfig").sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })
    end,
    event = "VeryLazy",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        indent = { enabled = true },
        auto_install = true,
        highlight = {
          additional_vim_regex_highlighting = false,
          disable = function(lang, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 10000
          end,
        },
      })
    end,
    event = "VeryLazy",
    cond = isNotVscode,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event='VeryLazy',
    cond = isNotVscode,
  },
  --
  -- --  FILES & GREP
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        "max-perf",
        winopts = {
          border = "none",
          fullscreen = true,
          preview = {
            default = "builtin",
            border = "noborder",
            flip_columns = 200,
            layout = "vertical",
            vertical = "up:80%",
          },
        },
        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
          },
        },
      })
    end,
    keys = {
      { "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>" },
      { "<leader>fg", "<cmd>lua require('fzf-lua').live_grep_native()<CR>" },
      { "<leader>fj", "<cmd>lua require('fzf-lua').jumps()<CR>" },
      { "<leader>fr", "<cmd>lua require('fzf-lua').resume()<CR>" },
      { "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>" },
      { "<leader>lsc", "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>" },
      { "<leader>lsr", "<cmd>lua require('fzf-lua').lsp_references()<CR>" },
      { "<leader>lsd", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>" },
      { "<leader>ldd", "<cmd>lua require('fzf-lua').diagnostics_document()<CR>" },
      { "<leader>ldw", "<cmd>lua require('fzf-lua').diagnostics_workspace()<CR>" },
    },
    cond = isNotVscode,
    event = "VeryLazy",
  },

  -- UTILS
  {
    "mg979/vim-visual-multi",
    config = function() end,
    keys = {
      { "<C-n>", mode = { "n", "v" } },
    },
    event = "VeryLazy",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_root = {
            enable = false,
            ignore_list = {},
          },
        },
      })

      vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
        nested = false,
        callback = function(e)
          local tree = require("nvim-tree.api").tree

          -- Nothing to do if tree is not opened
          if not tree.is_visible() then
            return
          end

          -- How many focusable windows do we have? (excluding e.g. incline status window)
          local winCount = 0
          for _, winId in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(winId).focusable then
              winCount = winCount + 1
            end
          end

          -- We want to quit and only one window besides tree is left
          if e.event == "QuitPre" and winCount == 2 then
            vim.api.nvim_cmd({ cmd = "qall" }, {})
          end

          -- :bd was probably issued an only tree window is left
          -- Behave as if tree was closed (see `:h :bd`)
          if e.event == "BufEnter" and winCount == 1 then
            -- Required to avoid "Vim:E444: Cannot close last window"
            vim.defer_fn(function()
              -- close nvim-tree: will go to the last buffer used before closing
              tree.toggle({ find_file = true, focus = true })
              -- re-open nivm-tree
              tree.toggle({ find_file = true, focus = false })
            end, 10)
          end
        end,
      })
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ee", "<cmd>NvimTreeToggle<CR>" },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    cond = isNotVscode,
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    cond = isNotVscode,
    event = "VeryLazy",
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      enabled_close_on_slash = true,
      autotag = {
        enable = true,
      },
    },
    cond = isNotVscode,
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    cond = isNotVscode,
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },
  -- {
    --  "kylechui/nvim-surround",
    --  version = "*", -- Use for stability; omit to use `main` branch for the latest features
    --  event = "VeryLazy",
    --  config = function()
      --    require("nvim-surround").setup({
        --      -- Configuration here, or leave empty to use defaults
        --    })
        --  end,
        --  cond = isNotVscode,
        -- },
        {
          "echasnovski/mini.surround",
          version = "*",
          event = "VeryLazy",
          opts = {
            mappings = {
              add = "<leader>sa", -- Add surrounding in Normal and Visual modes
              delete = "<leader>sd", -- Delete surrounding
              find = "<leader>sf", -- Find surrounding (to the right)
              find_left = "<leader>sF", -- Find surrounding (to the left)
              highlight = "<leader>sh", -- Highlight surrounding
              replace = "<leader>sr", -- Replace surrounding
              update_n_lines = "<leader>sn", -- Update `n_lines`

              suffix_last = "l", -- Suffix to search with "prev" method
              suffix_next = "n", -- Suffix to search with "next" method
            },
          },
          keys = { "<leader>s" },
        },
        {
          "ggandor/leap.nvim",
          event = "VeryLazy",
          config = function()
            require("leap").create_default_mappings()
          end,
        },
        -- Terminal shit
        {
          "akinsho/toggleterm.nvim",
          version = "*",
          config = function()
            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "tab" })

            function Lazygit_toggle()
              lazygit:toggle()
            end

            require("toggleterm").setup({
              shade_terminals = false,
              auto_scroll = false,
              float_opts = {
                -- row = vim.o.rows,
                -- col = vim.o.columns,
              },
            })
            -- vim.api.nvim_set_keymap("n", "<A-S-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
          end,
          keys = {
            { "<A-t>", "<CMD>:ToggleTerm direction=float<CR>", mode = { "n", "t", "i" } },
            { "<A-\\>", "<CMD>:ToggleTerm direction=tab<CR>", mode = { "n", "t", "i" } },
            { "<A-S-g>", "<cmd>lua Lazygit_toggle()<CR>", mode = { "n", "t", "i" } },
          },

          cond = isNotVscode,
        },
        {
          "lukas-reineke/indent-blankline.nvim",
          main = "ibl",
          ---@module "ibl"
          ---@type ibl.config
          opts = {},
          -- lazy = false,
          event = "VeryLazy",
          cond = isNotVscode,
        },
        {
          "lewis6991/gitsigns.nvim",
          opts = {
            current_line_blame = true,
          },
          event = "VeryLazy",
          keys = {
            { "<leader>gsn", "<CMD>:Gitsigns next_hunk<CR>" },
            { "<leader>gsp", "<CMD>:Gitsigns next_hunk<CR>" },
            { "<leader>gsh", "<CMD>:Gitsigns preview_hunk<CR>" },
            { "<leader>gsd", "<CMD>:Gitsigns toggle_deleted<CR>" },
          },
        },
        {
          "folke/trouble.nvim",
          keys = {
            {
              "<leader>xD",
              "<cmd>Trouble diagnostics toggle<cr>",
              desc = "Diagnostics (Trouble)",
            },
            {
              "<leader>xd",
              "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
              desc = "Buffer Diagnostics (Trouble)",
            },
            {
              "<leader>cs",
              "<cmd>Trouble symbols toggle focus=false<cr>",
              desc = "Symbols (Trouble)",
            },
            {
              "<leader>cl",
              "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
              desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
              "<leader>xL",
              "<cmd>Trouble loclist toggle<cr>",
              desc = "Location List (Trouble)",
            },
            {
              "<leader>xQ",
              "<cmd>Trouble qflist toggle<cr>",
              desc = "Quickfix List (Trouble)",
            },
          },
          opts = {}, -- for default options, refer to the configuration section for custom setup.
        },
        -- cond = isNotVscode,
        {
          "krisajenkins/Cocoa-Strings", -- .strings
          event = "BufEnter *.strings",
        },
        {
          "martinda/Jenkinsfile-vim-syntax", -- Jenkinsfile
          event = "BufEnter Jenkinsfile*",
        },
        {
          "FooSoft/vim-argwrap",
          -- event = 'VeryLazy',
          keys = {
            { "<leader>a", "<cmd>ArgWrap<cr>", desc = "Toggle multiline arguments" },
          },
        },
      }, { defaults = { lazy = true } })
