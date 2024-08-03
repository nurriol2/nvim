-- Syntax highlighting, indentation, etc.

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- Configure treesitter
    treesitter.setup({ -- Enable syntax highlighting
      highlight = {
        enable = true,
      },

      indent = { enable = true }, -- Enable indentation 

      autotag = { -- Enable autotagging with nvim-ts-autotag plugin
        enable = true,
      },

      ensure_installed = { -- Ensure these language parsers are installed
        "bash",
        "gitignore",
        "go",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "ruby",
        "rust",
        "vim",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
