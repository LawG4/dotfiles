-- Check that we have the keyminder plugin installed 
local status_ok, key_minder = pcall(require, "keyminder")
if not status_ok then
    return 
end

-- Next we have to define the key binds dictionary which we want to be able to search
local dictionary = {
    ["sugma"] = "nuts",
}

local options = {
    dictionary = dictionary,
}

key_minder.setup(options)
