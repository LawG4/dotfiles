return {

    -- which key, used for displaying the keybindings 
    -- This seems to have recently updated to a new config spec, and I should move with it
    -- However that's more effort than I have time for right now
    -- TODO: Fix this eventually
    { "folke/which-key.nvim", commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7" },
    
    -- Language server fetching and configuring tools 
    -- Mason, a plugin to install and manage lsp servers, debuggers and linters
    -- Mason compliment has goodies
    -- lsp config is used to automatically fetch configurations for those lsps
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Completion frameworks along with places where the completions can come from
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua"},
    { "hrsh7th/cmp-nvim-lsp-signature-help"},
    { "hrsh7th/cmp-vsnip"},
    { "hrsh7th/cmp-path"},
    { "hrsh7th/cmp-buffer"},
    { "hrsh7th/vim-vsnip"},

    -- Vimspector for integration with the debugger
    -- TODO: Need to check if the pynvim python3 package is installed with pip3 or else things will expload 
    -- Maybe more on the install script 
    { "puremourning/vimspector" },

    -- Tellescope
    -- So that's file path stuff  and searchers 
    { "nvim-telescope/telescope.nvim", tag = '0.1.8',
        dependencies = {
            { "nvim-lua/plenary.nvim" }, -- Required dep
            { "BurntSushi/ripgrep" },    -- For live grep
            {                            -- Native Fuzzer for faster sorting 
                'nvim-telescope/telescope-fzf-native.nvim', 
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install . --prefix . --config Release' 
            },

        }, 
    }, 
    

    -- toggleterm, a built in terminal 
    { "akinsho/toggleterm.nvim" }, 

    -- Floating terminal which I think might be better than the above one
    { "voldikss/vim-floaterm" }, 

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

    -- Rust tools for using rust things 
    { "simrat39/rust-tools.nvim" },

}
