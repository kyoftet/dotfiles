return {
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('treesj').setup({
                use_default_keymaps = false,
            })
            vim.keymap.set('n', '<leader>tj', require('treesj').toggle)
        end,
    },
    {
        "tkmpypy/chowcho.nvim",
        config = function()
            require("chowcho").setup({
                labels = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j" },
            })
            vim.keymap.set('n', '<C-w><C-w>', ':Chowcho<CR>')
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen"
        },
        opts = {
            default_args = {
                DiffviewOpen = { "--imply-local" },
            }
        },
    },
    {
        "vinnymeller/swagger-preview.nvim",
        config = function()
            require("swagger-preview").setup({
                port = 8003,
                host = "localhost",
            })
        end
    },
    {
        "cshuaimin/ssr.nvim",
        config = function()
            require("ssr").setup({
                border = "rounded",
                min_width = 50,
                min_height = 5,
                max_width = 120,
                max_height = 25,
                adjust_window = true,
                keymaps = {
                    close = "q",
                    next_match = "n",
                    prev_match = "N",
                    replace_confirm = "<cr>",
                    replace_all = "<leader><cr>",
                },
            })
            vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            vim.keymap.set('n', '<Leader>p', ':HopWord<CR>')
        end
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        'mrjones2014/smart-splits.nvim',
        config = function()
            require('smart-splits').setup({
            })
            vim.keymap.set('n', '<Leader>h', require('smart-splits').resize_left)
            vim.keymap.set('n', '<Leader>j', require('smart-splits').resize_down)
            vim.keymap.set('n', '<Leader>k', require('smart-splits').resize_up)
            vim.keymap.set('n', '<Leader>l', require('smart-splits').resize_right)
        end,
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("nvim-navbuddy").setup({
                window = {
                    size = { height = "40%", width = "100%" },
                    position = { row = "100%", col = "50%" },
                },
                lsp = { auto_attach = true },
            })
            vim.keymap.set('n', '<leader>nb', ':Navbuddy<CR>')
        end,
    }
}
