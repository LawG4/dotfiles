-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({})

-- rust tools
local rt = require("rust-tools")
rt.setup( {

    server = {

        on_attach = function(_, bufnr)
            -- Hover axtions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })

            -- Code Action Groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

        end,
    },

})

-- vimspector 
-- Integrates my setup with code lldb for debugging and launching 
vim.cmd([[
    nmap <F5> <cmd> call vimspector#Launch()<cr>
]])

-- - All the integration with popups and helpers that are suggested by the lsp
-- This is where I configure my auto completion 
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'} -- Popup even when there's only one match
vim.opt.shortmess = vim.opt.shortmess + { c = true}
-- vim.api.nvim_set_option('updatetime', 300)

local cmp = require("cmp")
cmp.setup({

    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    -- Mappings for using the lsp highlights etc
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),

        -- Carry return means we select  
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
    },

    -- Installed sources 
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3}
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    
})