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
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- Suggested by the Packer docs
    if packer_bootstrap then
        require("packer").sync()
    end
end)
