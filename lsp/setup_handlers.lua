return {
  dartls = function(_, opts) require("flutter-tools").setup { lsp = opts } end,
  jdtls = function(_, opts)
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "java", -- autocmd to start jdtls
      callback = function()
        if opts.root_dir and opts.root_dir ~= "" then require("jdtls").start_or_attach(opts) end
      end,
    })
  end
}
