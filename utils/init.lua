local M = {}

M.exists_buffers = function()
  local bufs = vim.fn.getbufinfo { buflisted = true }
  return not (require("astronvim.utils").is_available "alpha-nvim" and not bufs[2])
end

M.load_user_config_session = function()
  require("neo-tree").close_all()
  local cfg_path = vim.fn.stdpath "config" .. "/lua/user"
  if M.exists_buffers() then
    require("session_manager").save_current_session()
  end
  vim.cmd.cd(cfg_path)
  ---@diagnostic disable-next-line: param-type-mismatch
  local session_name = require("session_manager.utils").dir_to_session_filename(vim.loop.cwd())
  if session_name:exists() then
    require("session_manager.utils").load_session(session_name.filename, true)
  else
    vim.cmd.e(cfg_path .. "/polish.lua")
  end
  vim.cmd("Neotree")
end

return M
