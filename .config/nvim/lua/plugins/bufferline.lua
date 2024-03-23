return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            highlights = {
                close_button = { fg = '#00cccc' },
                close_button_visible = { fg = '#00cccc' },
                close_button_selected = { fg = '#00cccc' },
                buffer_selected = { fg = '#00cccc', bold = true },
                buffer_visible = { fg = '#4169e1' },
                diagnostic_selected = { bold = true },
                info_selected = { bold = true },
                info_diagnostic_selected = { bold = true },
                warning_selected = { bold = true },
                warning_diagnostic_selected = { bold = true },
                error_selected = { bold = true },
                error_diagnostic_selected = { bold = true },
                separator_selected = { fg = '#456789' },
                separator_visible = { fg = '#456789' },
                separator = { fg = '#456789' },
            },
            options = {
                indicator = { style = 'underline' },
                buffer_close_icon = 'x',
                diagnostics = 'coc',
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            }
        })
        vim.keymap.set('n', '<leader>bp', '<CMD>BufferLinePick<CR>')
        vim.keymap.set('n', '<leader>bc', '<CMD>BufferLinePickClose<CR>')
        vim.keymap.set('n', '<leader>bl', '<CMD>BufferLineCloseLeft<CR>')
        vim.keymap.set('n', '<leader>br', '<CMD>BufferLineCloseRight<CR>')
        vim.keymap.set('n', '<leader>bo', '<CMD>BufferLineCloseOthers<CR>')
        vim.keymap.set('n', 'bm', '<CMD>BufferLineCycleNext<CR>')
        vim.keymap.set('n', 'bn', '<CMD>BufferLineCyclePrev<CR>')
    end
}
