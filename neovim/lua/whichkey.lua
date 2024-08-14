-- Check that we have which-key is installed 
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return 
end

local mappings = {
    ["p"] = { "<cmd>Lazy<CR>", "Lazy plugin manager"},
    
    -- Basic file operations followed by an expanded list  
    ["W"] = { "<cmd>wq<CR>", "Write and Quit" },
    ["w"] = { "<cmd>w<CR>", "Write" },
    ["q"] = { "<cmd>q<CR>", "Quit" },
    ["f"] = { 
        name = "File Operations",
        f = {
            name = "Forced",
            w = {"<cmd>w!<CR>", "Force Save"},
            q = {"<cmd>q!<CR>", "Force Quit"},
        },
    },

    -- Actions which happen on a buffer 
    -- Like moving them, selecting a new one etc 
    ["b"] = {
        name = "Buffer Operationgs",

        h = { "<cmd>BufferPrevious<CR>", "Swhich active buffer to previous"},
        l = { "<cmd>BufferNext<CR>", "Switch active buffer to next"}, 
        V = { "<cmd>vs<CR>", "Split Buffer Vertical" },
        H = { "<cmd>hs<CR>", "Split Buffer Horizontal" },

    }, 
    
    -- Tmux keybinds reminders 
    -- For navigating the multi terminal windows
    ["t"] = {
        name = "Tmux terminal windows",

        ["0"] = { "", "Ctrl - b : Leader key" },
        ["1"] = { "", "Ctrl <-> : Resize Panes (Ctrl Arrows)" },
        ["2"] = { "", "<->      : Navigate Active Panes (Arrows)" },
        ["3"] = { "", "% : Vertical Split" },
        ["4"] = { "", "\" : Horizontal Split"},
        ["5"] = { "", "c : New Window"},
        ["6"] = { "", "p : Next Window"},
        ["7"] = { "", "n : Prev Window"},
        ["8"] = { "", "? : Help Commands"},
        ["d"] = {"", "Detach current session"},
    },

    -- Regular neovim built-ins
    -- These aren't commands in their own rights, more just reminders
    ["n"] = {
        name = "Neovim Builtins",

        n = {
            name = "Navigations",
            h = { "", "Move Cursor Left" },
            j = { "", "Move Cursor Up" },
            k = { "", "Move Cursor Down" },
            l = { "", "Move Cursor Right"},
        },
    },
}

local setup = {
    plugins = {
    },

    key_labeks = {
    },

    icons = {
    },

    popup_mappings = {
        scroll_down = "<Down>",
        scroll_up = "<Up>",
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
}

which_key.setup(setup)
which_key.register(mappings, opts)
