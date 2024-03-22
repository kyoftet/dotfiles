return {
  -- colorscheme
  'folke/tokyonight.nvim',
  config = function()
  require("tokyonight").setup({
    style = "night",
    transparent = true
  })
  vim.cmd([[ colorscheme tokyonight-night ]])
  end
}
