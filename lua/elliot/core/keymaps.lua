vim.g.mapleader = " "

local keymap = vim.keymap

-- Comfy keymap to escape INSERT mode 
keymap.set("i", "jk", "<ESC>")

-- (Burn After Reading) Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Delete but don't copy into a register
keymap.set("n", "x", '"_x')

-- (Comfy) inc/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-a")

-- Window splitting
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- Switch between tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- Plugin Keymaps --

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
