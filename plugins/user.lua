return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  -- We also support a key value style plugin definition similar to NvChad:
  -- ["ray-x/lsp_signature.nvim"] = {
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  { "rebelot/kanagawa.nvim" },
  { "shortcuts/no-neck-pain.nvim" },
  { "mattn/flappyvird-vim" },
  { "nvim-rogue/rogue.nvim" },
  { "alec-gibson/nvim-tetris" },
  { "mfussenegger/nvim-jdtls" },
  -- { "lewis6991/gitsigns.nvim" },
}
