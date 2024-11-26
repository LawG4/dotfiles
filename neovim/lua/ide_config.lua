-- Here we the configuration that turns my nvim into a ide like scenario
-- Using the following plugins 
-- toggleterm

-- Check that we have terminal installed
local plugin_found, toggle_term = pcall(require, "toggleterm")
if plugin_found then
    toggle_term.setup()
end

-- FloaTerm configuration
-- Makes a floating terminal that we can bringup and hide at any time
vim.api.nvim_set_keymap('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 nu <CR>", { noremap = true, silent = true} )
vim.api.nvim_set_keymap('n', "t", ":FloatermToggle myfloat<CR>", { noremap = true, silent = true} )
vim.api.nvim_set_keymap('t', "<Esc>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true} )

-- Telescope
-- The thing that shows the files 
local telescope = require("telescope") 
telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

telescope.load_extension('fzf')