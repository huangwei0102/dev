local vim = vim
local custom = require('keymap.custom')
local Movement = {
    -- move cursor in wrapline paragraph
    { 'n',          'j',          "v:count == 0 ? 'gj' : 'j'",                    { expr = true, silent = true } },
    { 'n',          'k',          "v:count == 0 ? 'gk' : 'k'",                    { expr = true, silent = true } },
    -- move cursor to the start and the end of paragraph
    { 'i',          '<C-j>',      '<ESC>o', },
    { 'i',          '<C-k>',      '<ESC>O', },
    { 'i',          '<C-h>',      '<ESC>I' },
    { 'i',          '<C-l>',      '<ESC>A' },
    { 'n',          '(',          '<ESC>^' },
    { 'n',          ')',          '<ESC>$' },
    { 'v',          '<C-l>',      '$' },
    { 'v',          '<C-h>',      '^' },

    -- move window
    { 'n',          '<C-S-h>',    '<C-w>H' },
    { 'n',          '<C-S-j>',    '<C-w>J' },
    { 'n',          '<C-S-k>',    '<C-w>K' },
    { 'n',          '<C-S-l>',    '<C-w>L' },

    -- tab switch
    { 'n',          '<Tab>',      '<CMD>bnext!<CR>' },
    { 'n',          '<S-Tab>',    '<CMD>bprevious!<CR>' },
    -- page scroll
    { { 'n', 'v' }, '<PageUp>',   math.floor(vim.fn.winheight(0) / 2) .. '<C-u>', { desc = 'scroll 1/3 size of page' } },
    { { 'n', 'v' }, '<PageDown>', math.floor(vim.fn.winheight(0) / 2) .. '<C-d>', { desc = 'scroll 1/3 size of page' } },
}

local Edit = {
    { 'i', '<C-BS>',      '<C-W>', { desc = 'delete word forward' } },
    { 'v', '<C-c>',       '"*ygvy' },
    { 'v', 'y',           '"*ygvy' },
    { 'i', '<C-v>',       '<C-R>+' },
    { 'v', '>',           '>gv',   { desc = 'keep virtual mode after indent' } },
    { 'v', '<',           '<gv',   { desc = 'keep virtual mode after indent' } },
    { 'n', '<Backspace>', 'ciw' },
    { 'v', '<Backspace>', 'c' },
}

local Cmd = {
    { 'n', ';',         ':',                 { nowait = true } },
    { 'v', ';',         ':',                 { nowait = true } },
    { 'n', '<leader>q', 'q1',                { desc = 'macro record' } },
    { 'n', '<C-q>',     ':q<CR>',            { desc = 'quit window' } },
    { 'n', 'Q',         custom.WriteQuitAll, { desc = 'quit all' } },
    { 'n', 'g=',        vim.lsp.buf.format },
    { 'c', 'w!',        custom.sudo_write,   { desc = 'save file as root' } },
}

local Fold = {
    { 'n', '<CR>',          'za', { desc = 'toggle fold' } },
    { 'n', '<2-LeftMouse>', 'za' },
}

local ModeSwitch = {
    { 'n', '<RightMouse>', 'a' },
    { 'i', '<ESC>', '<C-O>:stopinsert<CR>', {
        desc =
        'back to normal mode without moving cursor'
    } },
}

local Plugins = {
    bufdelete = {
        { 'n', 'q', custom.DeleteWinOrBuf },
    },
    telescope = {
        { 'n', 'fw', '<CMD>Telescope grep_string<CR>' },
        { 'n', 'ff', '<CMD>Telescope find_files<CR>' },
    },
    --- some keymaps are in filetree.lua
    nvim_tree = {
        { 'n', '<leader>t', '<CMD>NvimTreeToggle<CR>' },
        { 'n', '<leader>c', '<CMD>cd %:h<CR>' },
    },
    aerial = {
        { 'n', '<leader>s', '<CMD>AerialToggle<CR>' },
    },
    comment = {
        { 'v', '<C-_>', '<Plug>(comment_toggle_linewise_visual)' },
        { 'v', '<C-/>', '<Plug>(comment_toggle_linewise_visual)' },
        { 'n', '<C-_>', '<Plug>(comment_toggle_linewise_current)' },
        { 'n', '<C-/>', '<Plug>(comment_toggle_linewise_current)' },
    },
    flash = {
        { { "n", "x", "o" }, 's', require("flash").jump },
        { { "n", "x", "o" }, 'S', require("flash").treesitter }
    },
    lspsaga = {
        { 'n',          'ga',    '<CMD>Lspsaga code_action<CR>',          { silent = true } },
        { 'n',          'ge',    '<CMD>Lspsaga show_line_diagnostics<CR>' },
        { 'n',          'gh',    '<CMD>Lspsaga hover_doc<CR>' },
        { 'n',          'gn',    '<CMD>Lspsaga rename<CR>' },
        { 'n',          'gd',    '<CMD>Lspsaga peek_definition<CR>' },
        { 'n',          'gr',    '<CMD>Lspsaga finder<CR>', },
        { { 'n', 't' }, 'gs',    '<CMD>Lspsaga term_toggle<CR>' },
        { { 't' },      '<ESC>', '<CMD>Lspsaga term_toggle<CR>' },
    },
    neogen = {
        { 'n', 'go', require('neogen').generate },
    },
    dap = {
        { 'n', '<F1>', require "dap".toggle_breakpoint },
        { 'n', '<F2>', require "dap".continue },
        { 'n', '<F3>', require "dap".step_into },
        { 'n', '<F4>', require "dap".step_over },
        { 'n', '<F5>', require "dapui".toggle },
    },
    copilot = {
        { 'i', '<Right>', custom.accept_copilot_suggestion }
    },
    tmux = {
        { 'n', '<C-j>', '<CMD>TmuxNavigateDown<CR>' },
        { 'n', '<C-k>', '<CMD>TmuxNavigateUp<CR>' },
        { 'n', '<C-h>', '<CMD>TmuxNavigateLeft<CR>' },
        { 'n', '<C-l>', '<CMD>TmuxNavigateRight<CR>' },
    },
    --- keymaps of nvim-cmp are in cmp.lua
    cmp = {},
    --- keymaps of dashboard are in dashboard.lua
    dashboard = {},
    --- keymaps of vim-surround are in surround.lua
    surround = {},
    --- keymaps of tabout are in tabout.lua
    tabout = {},
}

local Nop = {
    { { 'n', 'x' }, 's', 'Nop', { noremap = true, silent = true } },
}

local key_mapper = function(mode, key, result, config)
    if nil == config then
        config = { noremap = true, silent = true }
    end
    vim.keymap.set(
        mode,
        key,
        result,
        config
    )
end

for _, keymap_class in ipairs({ Movement, Edit, Cmd, Fold, ModeSwitch, Nop }) do
    for _, keymap in ipairs(keymap_class) do
        key_mapper(keymap[1], keymap[2], keymap[3], keymap[4])
    end
end

for _, plugin_keymap in pairs(Plugins) do
    for _, keymap in ipairs(plugin_keymap) do
        key_mapper(keymap[1], keymap[2], keymap[3], keymap[4])
    end
end


vim.api.nvim_create_user_command(
    "ViewImage",
    custom.view_net_image,
    { desc = "view network image" }
)
