require('mason').setup()

require('mason-lspconfig').setup {
    ensure_installed = {
        "emmet_ls",
        "hls@1.8.0",
        "lua_ls",
        "phpactor",
        "tsserver",
        "rust_analyzer",
    },
    automatic_installation = true,
}

-- lsp specific keymaps and settings
-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, bufopts)

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
        { name = 'luasnip' },
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
    }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').phpactor.setup {
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
