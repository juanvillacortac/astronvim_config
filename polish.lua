-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }
  local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    pattern = "BDeletePost*",
    group = alpha_on_empty,
    callback = function(_)
      if not require("user.utils").exists_buffers() then
        require("neo-tree").close_all()
        require("alpha").start(true)
      end
    end,
  })
end
