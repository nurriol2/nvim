-- Restore neovim sessions after closing

return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/projects", "~/Downloads", "~/Documents", "~/Desktop" }, -- Ignore these directories 
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>wr", ":SessionSave<CR>", { desc = "Save session for auto session root dir" })

  end,
}
