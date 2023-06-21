-- Access Vim options as local var
local opt = vim.opt

-- Configure line numbers
opt.relativenumber = true
opt.number = true

-- Configure tabs and indentation
opt.tabstop = 4 -- Use 4 spaces 
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- No line wrapping
opt.wrap = false

-- Configure case insensitive search settings
opt.ignorecase = true
opt.smartcase = true
-- Consider "-" as part of a search term
opt.iskeyword:append("-")
-- Show cursor line
opt.cursorline = true

-- Configure Vim appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Configure backspace key to work as expected
opt.backspace = "indent,eol,start"

-- Configure clipboard to use system clipboard
opt.clipboard:append("unnamedplus")

-- Configure split window options
opt.splitright = true
opt.splitbelow = true
