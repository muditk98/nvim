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

vim.opt.rtp:prepend(lazypath)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "no"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd("set clipboard^=unnamed,unnamedplus")

if vim.fn.executable("nvr") == 1 then
	vim.env.GIT_EDITOR = "nvr --remote-tab-wait +'set bufhidden=delete'"
end
require("plugins")
require("mappings")
require("autocmds")
