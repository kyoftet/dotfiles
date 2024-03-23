return {
    "nvim-treesitter/nvim-treesitter",
    confing = require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } })
}
