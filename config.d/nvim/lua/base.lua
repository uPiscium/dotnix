vim.cmd("autocmd!")
local opt = vim.opt
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileformat = "unix"
opt.number = true
opt.relativenumber = false
opt.mouse = "a"
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 2
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = "zsh"
opt.shellquote = ""
opt.shellxquote = ""
opt.inccommand = "split"
opt.ignorecase = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false
opt.helplang = "en"
opt.updatetime = 300
opt.showtabline = 4
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.hidden = true
opt.swapfile = true
opt.wrap = true
opt.pumblend = 7
opt.list = true
opt.cursorline = true
opt.completeopt = "menu,menuone,noselect"

function Foldtext()
	local line = vim.fn.getline(vim.v.foldstart)
	local count = vim.v.foldend - vim.v.foldstart + 1
	return string.format("%s (%d lines folded)", line, count)
end

opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldtext = "v:lua.Foldtext()"
opt.fillchars = { fold = " " }
