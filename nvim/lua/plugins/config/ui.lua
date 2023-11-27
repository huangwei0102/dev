M = function()
    require("tokyonight").setup({
        style = "storm",
        transparent = true,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            sidebars = "transparent",
            floats = "dark",
        },

        on_colors = function(colors)
            colors.border = "#565f89"
        end,
    })

    require('lualine').setup {
        options = {
            theme = 'tokyonight',
            globalstatus = true,
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {
                {
                    'fileformat',
                    symbols = {
                        unix = '', -- e712
                        -- unix = '', -- e712
                        dos = '', -- e70f
                        mac = '', -- e711
                    }
                },
            },
            lualine_b = {
                -- this prevent the shrink from <C-o>:stopinsert when exit insert mode
                { 'mode', icons_enabled = true, fmt = function(str) return str:sub(1, 3) end },
                'branch',
                'diagnostics'
            },
            lualine_c = { 'filename', 'diff' },
            lualine_x = {
                {
                    require("noice").api.statusline.mode.get,
                    cond = require("noice").api.statusline.mode.has,
                    color = { fg = "#ff9e64" },
                },
                'encoding',
                'filetype'
            },
            lualine_y = { 'progress', 'location' },
            lualine_z = {}
        },
    }

    require('bufferline').setup {
        options = {
            close_command = "Bdelete %d",
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            indicator = {
                icon = '>',
                style = 'underline',
            },
            name_formatter = function(buf)
                if buf.name:match('%.*') then
                    return vim.fn.fnamemodify(buf.name, ':t:r')
                end
            end,
            diagnostics = "nvim_lsp",
            offsets = { { filetype = "neo-tree", text = "Neotree", text_align = "center" } },
            enforce_regular_tabs = true,
            tab_size = 14,
        }
    }
    vim.cmd("colorscheme tokyonight")
end

return M
