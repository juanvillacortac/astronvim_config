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

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local curr_client = vim.lsp.get_client_by_id(args.data.client_id)
      -- if deno attached, stop all typescript servers
      if curr_client.name == "denols" then
        vim.lsp.for_each_buffer_client(bufnr, function(client, client_id)
          if client.name == "tsserver" then vim.lsp.stop_client(client_id, true) end
        end)
        -- if tsserver attached, stop it if there is a denols server attached
      elseif curr_client.name == "tsserver" then
        for _, client in ipairs(vim.lsp.get_active_clients { bufnr = bufnr }) do
          if client.name == "denols" then
            vim.lsp.stop_client(curr_client.id, true)
            break
          end
        end
      end
    end,
  })
end
