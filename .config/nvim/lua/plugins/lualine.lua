return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local colors = {
            blue1   = '#010b19',
            blue2   = '#021631',
            blue3   = '#03214a',
            blue4   = '#042c62',
            blue5   = '#05377b',
            normal  = '#cee3f1',
            insert  = '#00ff00',
            visual  = '#ff00ff',
            replace = '#ff0000',
        }

        local bubbles_theme = {
            normal = {
                a = { fg = colors.normal, bg = colors.blue2 },
                b = { fg = colors.text, bg = colors.blue3 },
                c = { fg = colors.text },
            },
            insert = { a = { fg = colors.insert, bg = colors.blue2 } },
            visual = { a = { fg = colors.visual, bg = colors.blue2 } },
            replace = { a = { fg = colors.replace, bg = colors.blue2 } },

            inactive = {
                a = { fg = colors.text, bg = colors.blue2 },
                b = { fg = colors.text, bg = colors.blac3 },
                c = { fg = colors.text },
            },
        }

        require('lualine').setup {
            options = {
                theme = bubbles_theme,
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '░▒▓' }, right_padding = 2 } },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = { 'fileformat', 'filetype', 'progress' },
                lualine_z = { { 'location', separator = { right = '▓▒░' }, left_padding = 2 } },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        }
        require('lualine').setup {}
    end
}
