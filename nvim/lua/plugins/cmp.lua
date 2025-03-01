return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
        },
        event = "InsertEnter",
        config = function()
            local vim = vim
            local cmp = require('cmp')
            local compare = require('cmp.config.compare')
            local lspkind = require('lspkind')
            local luasnip = require 'luasnip'
            local border = {
                { "┌", "FloatBorder" },
                { "─", "FloatBorder" },
                { "┐", "FloatBorder" },
                { "│", "FloatBorder" },
                { "┘", "FloatBorder" },
                { "─", "FloatBorder" },
                { "└", "FloatBorder" },
                { "│", "FloatBorder" },
            }

            -- -- https://github.com/L3MON4D3/LuaSnip/issues/780
            luasnip.setup({
                update_events = { "TextChanged", "TextChangedI" },
                region_check_events = { "CursorMoved", "CursorHold", "InsertEnter", "CursorMovedI" },
                history = true,
            })
            require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
            require('neogen').setup({ snippet_engine = "luasnip" })

            cmp.setup({
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                window = {
                    completion = {
                        border = border,
                        scrollbar = '║',
                    },
                    documentation = {
                        border = 'rounded'
                    }
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                    }),
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),
                    ['<C-j>'] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<C-k>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<Left>'] = cmp.mapping.close(),
                    ['<Down>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<Up>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                matching = {
                    disallow_fuzzy_matching = true,
                    disallow_fullfuzzy_matching = true,
                    disallow_partial_fuzzy_matching = false,
                    disallow_partial_matching = false,
                    disallow_prefix_unmatching = true,
                },
                preselect = cmp.PreselectMode.None,
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }),
                sorting = {
                    priority_weight = 1.0,
                    comparators = {
                        compare.locality,
                        compare.sort_text,
                        -- compare.scopes,
                        compare.score,
                        compare.exact,
                        compare.recently_used,
                        compare.offset,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                }
            })

            -- auto insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
    },
    {
        'zbirenbaum/copilot.lua',
        event = "InsertEnter",
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = false,
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = false,
                    },
                },
                filetypes = {
                    yaml = true,
                    markdown = true,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    ["."] = false,
                    ["Dockerfile"] = true,
                },
                copilot_node_command = 'node', -- Node.js version must be > 16.x
                server_opts_overrides = {},
            })
        end
    },
}
