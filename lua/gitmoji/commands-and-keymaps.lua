local start_gitmoji = require("gitmoji").open_floating

local M = {}

function M.set_commands()
  vim.api.nvim_create_user_command("Gitmoji", function() start_gitmoji() end, {})
end

function M.set_keymaps()
  -- Add your keymaps here
end

return M
