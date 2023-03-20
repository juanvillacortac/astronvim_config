-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    -- ["<leader>N"] = { "<cmd>NoNeckPain<cr>", desc = "No Neck Pain" },
    ["<leader>rr"] = { "<Plug>RestNvim", desc = "Run the request under the cursor" },
    ["<leader>rp"] = { "<Plug>RestNvimPreview", desc = "Preview the cURL command" },
    ["<leader>rl"] = { "<Plug>RestNvimLast", desc = "Re-run the last request" },

    ["<leader>r"] = { name = "REST client" },
    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },

    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
          require("alpha").start(true)
        end
      end,
      desc = "Close buffer" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
