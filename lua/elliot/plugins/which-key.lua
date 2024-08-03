-- Remember keymaps defined for configuration

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500 -- ms
  end,
  -- Options passed to the setup function
  opts = {
    -- Leave this empty to use default settings
  },
}
