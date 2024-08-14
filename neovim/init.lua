-- Lawrence's/Panyaamonium's personal nvim config :3 
-- Requires nvim >= 0.8.0 for lazy.nvim plugin loader

-- Gotta have line numbers right?
vim.wo.number = true

-- Tab settings, I like to ensure my tabs are spaces and have them be 4 wide
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

-- I prefer to have the text not wrapping so that virtically splitting buffers 
-- doesn't move everything down to the next layer and mess up formatting
vim.wo.wrap = false

-- Set my leader key to space with a shorter time out so that which key displays sooner  
vim.g.mapleader = " "
vim.o.timeoutlen = 200
vim.o.timeout = true

-- Set the colour theme that I like to the comfy autumn one 
vim.cmd [[colorscheme tempus_autumn]]

-- Plugin loader, I want to use lazy.nvim
local lazy_nvim_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_nvim_path) then
	print("No lazy.nvim plugin detected, downloading to", lazy_nvim_path)
    vim.fn.system({
        "git", 
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", 
        lazy_nvim_path,
    })
end
vim.opt.rtp:prepend(lazy_nvim_path)

-- Now that lazy loading is enabled, fetch our plugin spec from the 
-- plugins folder 
require("lazy").setup("plugins")

-- Get all of our language server configs 
require("language_server_config")

-- Get our which key config
require "whichkey"

-- Get the ide config for layoutout the terminal etc 
require "ide_config"

-- Get the text layout configuration 
require "text_layout"
