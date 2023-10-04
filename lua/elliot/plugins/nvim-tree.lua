local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- Recommended by documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- Configure nvim-tree
nvimtree.setup({
   renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },   
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
