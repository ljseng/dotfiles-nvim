local v = vim

require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        "emmet_ls",
        "hls@1.8.0",
        "lua_ls",
        "intelephense",
        "tsserver",
        "rust_analyzer",
    },
    automatic_installation = true,
}

-- lsp specific keymaps and settings
-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    v.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    v.keymap.set('n', '<leader>ld', v.lsp.buf.definition, bufopts)
    v.keymap.set('n', '<leader>lD', v.lsp.buf.declaration, bufopts)
    v.keymap.set('n', '<leader>lk', v.lsp.buf.hover, bufopts)
    v.keymap.set('n', '<leader>lK', function() v.lsp.buf.signature_help() end, bufopts)
    v.keymap.set('n', '<leader>ln', v.lsp.buf.rename, bufopts)
    v.keymap.set('n', '<leader>lc', v.lsp.buf.code_action, bufopts)

    require "lsp_signature".on_attach({
        hint_prefix = "*",
    }, bufnr)
end

-- autocomplete specific settings
local luasnip = require('luasnip')
local cmp = require('cmp');
cmp.setup {
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- use tab and shift tab to cycle through suggestion list
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()            -- snippet engine jump arguments
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)                    -- snippet engine jump arguments
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- use luasnip as snippet engine
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help'},
        { name = 'vim-dadbod-completion' },
        { name = 'natdat' },
        { name = 'calc' },
        {
            name = 'spell',
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
            },
        },
        { name = 'luasnip' },
    }
}

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').intelephense.setup {
    root_dir = function() return vim.loop.cwd() end,
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').emmet_ls.setup {
    root_dir = function() return vim.loop.cwd() end,
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').lua_ls.setup {
    root_dir = function() return vim.loop.cwd() end,
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').tsserver.setup {
    root_dir = function() return vim.loop.cwd() end,
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').hls.setup {
    root_dir = function() return vim.loop.cwd() end,
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').clangd.setup {
    root_dir = function() return vim.loop.cwd() end,
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').awk_ls.setup {
    root_dir = function() return vim.loop.cwd() end,
    on_attach = on_attach,
    capabilities = capabilities,
}
