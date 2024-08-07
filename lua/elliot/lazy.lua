-- Bootstrap lazy (if it's not already installed)
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

require("lazy").setup({ { import = "elliot.plugins" }, { import = "elliot.plugins.lsp"} }, {
  checker = { -- Automatically check for plugin updates
    enabled = true,
    notify = false,
  },
  change_detection = { -- Disable message indicating change detected
    notify = false,
  },
})
