return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
            highlights = {
                fill = {
                    fg = '',
                    bg = '',
                },
                background = {
                    fg = '',
                    bg = '',
                },
                tab = {
                    fg = '#13a6a8',
                    bg = '',
                },
                tab_selected = {
                    fg = '',
                    bg = '',
                },
                tab_separator = {
                    fg = '',
                    bg = '',
                },
                tab_separator_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                },
                tab_close = {
                    fg = '',
                    bg = '',
                },
                close_button = {
                    fg = '#5c6d74',
                    bg = '',
                },
                close_button_visible = {
                    fg = '#5c6d74',
                    bg = '',
                },
                close_button_selected = {
                    fg = '#13a6a8',
                    bg = '',
                },
                buffer = {
                    fg = '#5c6d74',
                    bg = '',
                },
                buffer_visible = {
                    fg = '#13a6a8',
                    bg = '',
                },
                buffer_selected = {
                    fg = '#13a6a8',
                    bg = '',
                    bold = true,
                    italic = true,
                },
                numbers = {
                    fg = '#5c6d74',
                    bg = '',
                },
                numbers_visible = {
                    fg = '#5c6d74',
                    bg = '',
                },
                numbers_selected = {
                    fg = '#13a6a8',
                    bg = '',
                    bold = true,
                },
                diagnostic = {
                    fg = '',
                    bg = '',
                },
                diagnostic_visible = {
                    fg = '',
                    bg = '',
                },
                diagnostic_selected = {
                    fg = '',
                    bg = '',
                    bold = true,
                },
                hint = {
                    fg = '',
                    sp = '',
                    bg = '',
                },
                hint_visible = {
                    fg = '',
                    bg = '',
                },
                hint_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                    italic = true,
                },
                hint_diagnostic = {
                    fg = '',
                    sp = '',
                    bg = '',
                },
                hint_diagnostic_visible = {
                    fg = '',
                    bg = '',
                },
                hint_diagnostic_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                },
                info = {
                    fg = '',
                    sp = '',
                    bg = '',
                },
                info_visible = {
                    fg = '',
                    bg = '',
                },
                info_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                    italic = true,
                },
                info_diagnostic = {
                    fg = '',
                    sp = '',
                    bg = '',
                },
                info_diagnostic_visible = {
                    fg = '',
                    bg = '',
                },
                info_diagnostic_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                    italic = true,
                },
                warning = {
                    fg = '',
                    sp = '',
                    bg = '',
                },
                warning_visible = {
                    fg = '',
                    bg = '',
                },
                warning_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                },
                warning_diagnostic = {
                    fg = '',
                    sp = '',
                    bg = '',
                },
                warning_diagnostic_visible = {
                    fg = '',
                    bg = '',
                },
                warning_diagnostic_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                    italic = true,
                },
                error = {
                    fg = '',
                    bg = '',
                    sp = '',
                },
                error_visible = {
                    fg = '',
                    bg = '',
                },
                error_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                    italic = true,
                },
                error_diagnostic = {
                    fg = '',
                    bg = '',
                    sp = '',
                },
                error_diagnostic_visible = {
                    fg = '',
                    bg = '',
                },
                error_diagnostic_selected = {
                    fg = '',
                    bg = '',
                    sp = '',
                    bold = true,
                },
                modified = {
                    fg = '',
                    bg = '',
                },
                modified_visible = {
                    fg = '',
                    bg = '',
                },
                modified_selected = {
                    fg = '',
                    bg = '',
                },
                duplicate_selected = {
                    fg = '',
                    bg = '',
                },
                duplicate_visible = {
                    fg = '',
                    bg = '',
                },
                duplicate = {
                    fg = '',
                    bg = '',
                },
                separator_selected = {
                    fg = '',
                    bg = '',
                },
                separator_visible = {
                    fg = '',
                    bg = '',
                },
                separator = {
                    fg = '',
                    bg = '',
                },
                indicator_visible = {
                    fg = '',
                    bg = '',
                },
                indicator_selected = {
                    fg = '',
                    bg = '',
                },
                pick_selected = {
                    fg = '',
                    bg = '',
                    bold = true,
                },
                pick_visible = {
                    fg = '',
                    bg = '',
                    bold = true,
                },
                pick = {
                    fg = '',
                    bg = '',
                    bold = true,
                },
                offset_separator = {
                    fg = '',
                    bg = '',
                },
                trunc_marker = {
                    fg = '',
                    bg = '',
                }
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
