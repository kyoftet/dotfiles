return    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup({
                highlights = {
                    buffer_selected = { fg = '#00cccc', bold = true },
                    buffer_visible = { fg = '#4169e1', bold = true },
                    diagnostic_selected = { bold = true },
                    info_selected = { bold = true },
                    info_diagnostic_selected = { bold = true },
                    warning_selected = { bold = true },
                    warning_diagnostic_selected = { bold = true },
                    error_selected = { bold = true },
                    error_diagnostic_selected = { bold = true },
                },
                options = {
                    buffer_close_icon = 'x',
                    diagnostics = 'nvim_lsp',
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end
                }
            })
            vim.keymap.set('n', '<leader>bc', '<CMD>BufferLinePickClose<CR>')
            vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
            vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
        end
    }
