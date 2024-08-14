-- Here we the configuration that turns my nvim into a ide like scenario
-- Using the following plugins 
-- toggleterm

-- Check that we have terminal installed
local plugin_found, toggle_term = pcall(require, "toggleterm")
if plugin_found then
    toggle_term.setup()
end
