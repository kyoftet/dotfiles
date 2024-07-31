return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            highlights = {
                close_button = { fg = '#00cccc', bg = '' },
                close_button_visible = { fg = '#00cccc', bg = '' },
                close_button_selected = { fg = '#00cccc', bg = '' },
                buffer_selected = { fg = '#00cccc', bg = '', bold = true },
                buffer_visible = { fg = '#4169e1', bg = '' },
                buffer = { fg = '#4169e1', bg = '' },
                diagnostic_selected = { bold = true, bg = '' },
                info_selected = { bold = true, bg = '' },
                info_diagnostic_selected = { bold = true, bg = '' },
                warning_selected = { bold = true, bg = '' },
                warning_diagnostic_selected = { bold = true, bg = '' },
                error_selected = { bold = true, bg = '' },
                error_diagnostic_selected = { bold = true, bg = '' },
                separator_selected = { fg = '#456789', bg = '' },
                separator_visible = { fg = '#456789', bg = '' },
                separator = { fg = '#456789', bg = '' },
                fill = { bg = '', fg = '' }
            },
            options = {
                buffer_close_icon = 'x',
                diagnostics = 'nvim-lsp',
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            }
        })
        vim.keymap.set('n', '<Leader>bp', ':BufferLinePick<CR>')
        vim.keymap.set('n', '<Leader>bc', ':BufferLinePickClose<CR>')
        vim.keymap.set('n', '<Leader>bo', ':BufferLineCloseOthers<CR>')
        vim.keymap.set('n', '<C-m>', ':BufferLineCycleNext<CR>')
        vim.keymap.set('n', '<C-n>', ':BufferLineCyclePrev<CR>')
    end
}
