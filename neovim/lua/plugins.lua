return {
    -- Language server config plugin 
    -- fetches the automatic language server config fetcher
    { "neovim/nvim-lspconfig" },

    -- which key, used for displaying the keybindings 
    -- This seems to have recently updated to a new config spec, and I should move with it
    -- However that's more effort than I have time for right now
    -- TODO: Fix this eventually
    { "folke/which-key.nvim", commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7" },
    
    -- toggleterm, a built in terminal 
    { "akinsho/toggleterm.nvim" }, 

    -- lualine, status bar at the bottom of the terminal
    { "nvim-lualine/lualine.nvim" }, 
    
    -- telescope, fuzzy finder 
    { "nvim-telescope/telescope.nvim" }, 

    -- bar bar, which is for tabs 
    { "romgrk/barbar.nvim" },
    
    -- bar bar would like to have the web icons for enhanced displaying 
    { "nvim-tree/nvim-web-devicons"}, 

    -- indent-blanklines, gives me those little lines under for loops and curly braces etc
    -- and shows the user where the current indent is 
    { "lukas-reineke/indent-blankline.nvim" },
    
    -- Leap which is used for navigating the onscreen buffer easier 
    { "ggandor/leap.nvim" }, 

    -- gitsigns, git addition and commit highlighting
    { "lewis6991/gitsigns.nvim" },

    -- autopairs, automatically close braces and quotes etc
    { "windwp/nvim-autopairs" },


}
