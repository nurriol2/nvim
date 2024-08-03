-- Autocompletion

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- Only load when entering insert mode 
  dependencies = {
   "hrsh7th/cmp-buffer",  -- Source for text in buffer     
   "hrsh7th/cmp-path",  -- Source for file system paths     
    {
      "L3MON4D3/LuaSnip",
      -- Follow latest release
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", 
    "rafamadriz/friendly-snippets", -- Useful snippets
    "onsails/lspkind.nvim", -- VS Code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        -- Order matters
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- Snippets
        { name = "buffer" }, -- Text within current buffer
        { name = "path" }, -- File system paths 
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          elipsis_char = "...",
        }),
      },
    })
  end,
}
