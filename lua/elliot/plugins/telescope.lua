-- Fuzzy finder 

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = { -- In Insert mode
            ["<C-k>"] = actions.move_selection_previous, 
            ["<C-j>"] = actions.move_selection_next, 
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, 
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- Set telescope keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", ":Telescope find_files<CR>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find todos" })
    -- Close telescope using CTRL+c

  end, 
}
