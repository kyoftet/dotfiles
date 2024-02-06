local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- colorscheme
    {
        'folke/tokyonight.nvim',
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = true
            })
            vim.cmd([[ colorscheme tokyonight-night ]])
        end
    },
    -- icons
    'nvim-tree/nvim-web-devicons',
    -- resizer
    'simeji/winresizer',
    -- directory
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require('neo-tree').setup({
                filesystem = {
                    filtered_items = {
                        follow_current_file = true,
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                            'node_modules',
                        },
                        never_show = {
                            '.git',
                            '.DS_Store',
                        }
                    }
                },
                window = {
                    position = "float",
                    popup = {
                        size = { height = "55%", width = "55%" },
                        position = "50%",
                    },
                    mappings = {
                        ["o"] = "open",
                        ["h"] = "open_split",
                        ["v"] = "open_vsplit",
                    }
                },
                vim.keymap.set('n', '<leader>e', ':Neotree<cr>'),
            })
        end
    },
    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("lualine").setup {
                tabline = {
                    lualine_a = {
                        {
                            'buffers',
                            mode = 4,
                            icons_enabled = true,
                            show_filename_only = true,
                            hide_filename_extensions = false
                        }
                    },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'branch' },
                },
            }
        end
    },
    -- lsp --
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/nvim-cmp" },
        },
        config = function()
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
                ["vtsls"] = function()
                    lspconfig["vtsls"].setup({})
                end,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(_)
                    vim.keymap.set('n', 'gk', '<cmd>lua vim.lsp.buf.hover()<CR>')
                    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                    vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
                    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
                    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
                    vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
                    vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
                end
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
            )
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-emoji" },
            { "hrsh7th/cmp-vsnip" },
            { "onsails/lspkind.nvim" },
        },
        config = function()
            local cmp = require("cmp")
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end
    },
    -- search file
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            vim.keymap.set('n', '<leader>tf', ':Telescope find_files hidden=true<cr>')
            vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<cr>')
            vim.keymap.set('n', '<leader>tgs', ':Telescope git_status<cr>')
            vim.keymap.set('n', '<leader>tgl', ':Telescope git_commits<cr>')
            vim.keymap.set('n', '<leader>tk', ':Telescope keymaps<cr>')
            vim.keymap.set('n', '<leader>tb', ':Telescope buffers<cr>')
        end
    },
    -- git
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add          = { hl = 'GitSignsAdd', text = ' ▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                    change       = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
                    delete       = { hl = 'GitSignsDelete', text = ' ', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                    topdelete    = { hl = 'GitSignsDelete', text = ' ', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                    changedelete = { hl = 'GitSignsChange', text = '▎ ', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
                },
                signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked          = true,
                current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority                = 6,
                update_debounce              = 100,
                status_formatter             = nil,   -- Use default
                max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm                         = {
                    enable = false
                },
            }
        end
    },
    -- terminal
    {
        'akinsho/toggleterm.nvim',
        tag = "*",
        config = function()
            require('toggleterm').setup {
                vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=float<cr>'),
            }
        end
    },
    -- markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
})
