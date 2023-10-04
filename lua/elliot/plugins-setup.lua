-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer") 
if not status then
    return
end

-- Configure plugins
return packer.startup(function(use)
    -- Install Packer
    use("wbthomason/packer.nvim")

    -- (Many other plugins rely on plenary)
    use("nvim-lua/plenary.nvim")

    -- Install colorscheme
    use { "bluz71/vim-moonfly-colors", as = "moonfly" }

    -- Split window navigation (CTRL is a modifier now)
    use("christoomey/vim-tmux-navigator")

    -- Min and restore current window (Modify keymaps now)
    use("szw/vim-maximizer")

    -- (Grab surrounding stuff, like parenthesis and quotes)
    use("tpope/vim-surround")

    -- (Comfy) Commenting
    use("numToStr/Comment.nvim")

    -- Adding file explorer
    use("nvim-tree/nvim-tree.lua")

    -- Fuzzy finding w/ telescope
    --use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope-fzy-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- nvim-treesitter is a required plugin for telescope
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })

    -- Autocompletion plugins
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths

    -- Snippets plugins
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- -- Manage 
    -- use("williamboman/mason.nvim")
    -- -- Configure LSP servers
    -- use("neovim/nvim-lspconfig")
    -- -- Bridge the gap b/n mason & lspconfig
    -- use("williamboman/mason-lspconfig.nvim")

    
    -- Suggested by the Packer docs
    if packer_bootstrap then
        require("packer").sync()
    end
end)
