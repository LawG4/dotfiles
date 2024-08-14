-- Handles how text is layout within a buffer with the following plugins
-- auto pairs
-- indent blank line

-- Enable Auto pairs
local plugin_found, auto_pairs = pcall(require, "nvim-autopairs")
if plugin_found then 
    auto_pairs.setup()
end

-- Configure how the tab lines look 
local plugin_found, indent_blankline = pcall(require, "ibl")
if plugin_found then 
    indent_blankline.setup({
        indent = {
            -- Make the line character in indent comment colour
            char = '|',
            tab_char = ' ',
            highlight = { "Whitespace" },

        },
        whitespace = {
            -- Make the white space in indent the background colour
            remove_blankline_trail = false,
            highlight = { "Normal" },
        },
    })
end

