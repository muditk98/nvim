require("indent_blankline").setup {
  -- char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  show_current_context = true,
  -- char_list = {"|", "¦", "┆", "┊"},
  context_patterns = {
    "class", "function", "method", "block", "list_literal", "selector",
    "^if", "^table", "if_statement", "while", "for"
  },
  filetype_exclude = {
    "log", "fugitive", "gitcommit",
    "packer", "vimwiki", "txt", "help",
    "git", "TelescopePrompt", "undotree",
    -- "" -- for all buffers without a file type
  },
}
