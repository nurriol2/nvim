-- Built-in neovim file explorer uses tree list style
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbering
opt.relativenumber = true -- Line numbers relative to cursor position
opt.number = true -- Absolute line number of cursor position

-- Tabs and indents
opt.tabstop = 2 -- Use 2 spaces for tabs
opt.shiftwidth = 2 -- Use 2 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when writing new line

-- Disable line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Assume case-sensitive iff search includes mixed case

-- Neovim appearance
opt.cursorline = true -- Highlight current cursor line
opt.termguicolors = true
opt.background = "dark" -- Force dark theme on color schemes that can be light or dark
opt.signcolumn = "yes" -- Show sign column on LHS

-- Basic keyboard
opt.backspace = "indent,eol,start" -- Backspace works as expected

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use System clipboard as default register

-- Split windows
opt.splitright = true -- Vertical windows split RHS
opt.splitbelow = true -- Horizontal windows split to the bottom

-- Show colorcolumn at specified character limit
opt.colorcolumn = "79"
