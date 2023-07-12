-- Lua initialization file --

-- Override cursorcolumn highlight
-- Moonfly docs recommend putting this before setting the color scheme
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ae81ff" })
  end,
  group = custom_highlight,
})

-- Set the colorscheme
local status, _ = pcall(vim.cmd, "colorscheme moonfly")
if not status then
    print("Colorscheme not found!")
    return
end
