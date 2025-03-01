return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            's1n7ax/nvim-window-picker',
        },
        config = function()
            require 'window-picker'.setup({
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    -- filter using buffer options
                    bo = {
                        -- if the file type is one of following, the window will be ignored
                        filetype = { 'neo-tree', "neo-tree-popup", "notify", "noice" },
                        -- if the buffer type is one of following, the window will be ignored
                        buftype = { 'terminal', "quickfix" },
                    },
                },
                selection_chars = 'ABCDEFGHI',
                highlights = {
                    statusline = {
                        unfocused = {
                            fg = '#ededed',
                            bg = '#7aa2f7',
                            bold = true,
                        },
                    },
                }
            })
            require("neo-tree").setup({
                sources = {
                    'filesystem',
                    'document_symbols',
                },
                source_selector = {
                    winbar = true,
                    sources = {
                        { source = "filesystem" },
                        { source = "document_symbols" },
                    },
                },
                auto_clean_after_session_restore = true,
                close_if_last_window = true,
                default_component_configs = {
                    indent = {
                        padding = 0,
                    },
                    file_size = {
                        enabled = false,
                    },
                    type = {
                        enabled = false,
                    },
                    last_modified = {
                        enabled = false,
                    },
                },
                window = {
                    width = 25,
                    auto_expand_width = false,
                    mappings = {
                        ["t"] = "toggle_node",
                        ["<tab>"] = "next_source",
                        ["<esc>"] = "cancel",
                        ["r"] = "rename",
                        ["q"] = "close_window",
                    }
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    },
                    hijack_netrw_behavior = "open_default",
                    window = {
                        mappings = {
                            ["<2-LeftMouse>"] = "open_with_window_picker",
                            ["<cr>"] = "open_with_window_picker",
                            ["<bs>"] = "navigate_up",
                            ["a"] = "add",
                            ["y"] = "copy_to_clipboard",
                            ["s"] = "split_with_window_picker",
                            ["v"] = "vsplit_with_window_picker",
                            ["."] = "set_root",
                            ["x"] = "cut_to_clipboard",
                            ["p"] = "paste_from_clipboard",
                            ["d"] = "delete",
                        },
                    },
                },
                document_symbols = {
                    follow_cursor = true,
                    renderers = {
                        root = {
                            { "icon", default = "C" },
                            { "name", zindex = 10 },
                        },
                        symbol = {
                            { "indent",    with_expanders = true },
                            { "kind_icon", default = "?" },
                            {
                                "container",
                                content = {
                                    { "name", zindex = 10 },
                                }
                            }
                        },
                    },
                    window = {
                        mappings = {
                            ["<cr>"] = "jump_to_symbol",
                            ["<2-LeftMouse>"] = "jump_to_symbol",
                        }
                    }
                }
            })
        end,
        cmd = { "Neotree" },
    },

}
