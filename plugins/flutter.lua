return {
  {
    "akinsho/flutter-tools.nvim",
    opts = function(opts)
      opts.debugger = {
        enabled = true,
        run_via_dap = true,
      }
      return opts
    end
  }
}
