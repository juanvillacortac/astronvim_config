return {
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    dependencies = { "lewis6991/gitsigns.nvim", "kevinhwang91/nvim-hlslens" },
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
      })
    end
  },
}
