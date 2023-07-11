local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

-- Load friendly-snippets plugin
require("luasnip/loaders/from_vscode").lazy_load()

-- Recommended by nvim-cmp docs
vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({})
