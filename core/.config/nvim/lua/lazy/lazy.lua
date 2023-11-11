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
    'nvim-tree/nvim-tree.lua',
    config = function()
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { silent = true })
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function(_)
          require("nvim-tree.api").tree.open()
        end
      })
    end
  },
  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight"
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
      { "echasnovski/mini.completion", version = false },
    },
    config = function()
      local lspconfig = require("lspconfig")
      require('mini.completion').setup({})
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
  -- search file
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>p', ':Telescope find_files hidden=true<cr>')
      vim.keymap.set('n', '<leader>f', ':Telescope live_grep<cr>')
      vim.keymap.set('n', '<leader>gs', ':Telescope git_status<cr>')
      vim.keymap.set('n', '<leader>gl', ':Telescope git_commits<cr>')
    end
  },
  -- git
  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup {
        signs = {
          add          = { hl = 'GitSignsAdd'   , text = ' ▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
          change       = { hl = 'GitSignsChange', text = ' ▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = ' ', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = ' ', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '▎ ', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm = {
          enable = false
        },
      }
    end
  }
})

